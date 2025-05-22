// randtest_optimized.c – random‐test harness for cpt_inv()
// 編譯：  gcc -O2 randtest_optimized.c big30.c big30_mpz.c cpt_inv.S -lgmp -o randtest
// 使用：  ./randtest [NUM_TESTS] [SEED]
//   NUM_TESTS – 預設 10000 ；可自行調大作壓力測試
//   SEED      – 若給定則固定 PRNG，方便 CI 重現
//
// 特色：
//   • 使用 GMP 亂數 (mpz_urandomm) 均勻取樣 0 … P−1，確保可重現。
//   • 固定插入兩筆邊界：1 與 P−1（移除 0）。
//   • 每筆輸入最多嘗試 5 次 cpt_inv，統計「正確前需重呼幾次」。
//   • 成功後再以 `mpz_invert` 取得 canonical inverse；若二者同餘但 ≠ canonical ➜ 記為 *non‑canonical*。
//   • 測試結束輸出：
//       1) correct after 1/2/3/4 recall
//       2) non‑canonical return（不計失敗）
//       3) 如連呼 5 次仍錯則列為 HARD FAIL，程式以非 0 結束碼。
//
// ※ 需要 big30.h / big30_mpz.h / cpt_inv.h 與 GMP。

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"


#define MAX_RETRIES 5                       // 含第一次
#define MAX_RECALL_BUCKETS (MAX_RETRIES-1)  // 1~4 recall

/*-------------  單向鏈結串列: 收集測資  -------------*/
typedef struct VecNode {
    char *hex;
    struct VecNode *next;
} VecNode;

static void push_node(VecNode **head, const char *hex) {
    VecNode *n = (VecNode *)malloc(sizeof(VecNode));
    n->hex = strdup(hex);
    n->next = *head;
    *head = n;
}

static void dump_named_list(const char *title, VecNode *head) {
    if (!head) return;
    printf("\n==== %s ====\n", title);
    for (VecNode *p = head; p; p = p->next) {
        printf("x = 0x%s\n", p->hex);
    }
}

/*-------------  主程式  -------------*/
int main(int argc, char **argv) {
    long num_tests   = (argc > 1) ? strtol(argv[1], NULL, 10) : 1000000;
    unsigned long sd = (argc > 2) ? strtoul(argv[2], NULL, 10) : (unsigned long)time(NULL);

    printf("Running %ld tests – seed %lu\n", num_tests, sd);

    /*-- GMP PRNG --*/
    gmp_randstate_t rs;
    gmp_randinit_default(rs);
    gmp_randseed_ui(rs, sd);

    /*-- 常量 P --*/
    mpz_t mpP; mpz_init(mpP); mpz_from_big30(mpP, &P);

    /*-- 循環內重複使用 --*/
    mpz_t mpX, mpInv, mpInvRef, mpCheck;
    mpz_inits(mpX, mpInv, mpInvRef, mpCheck, NULL);
    uint256_t x, xInv;

    /*-- 收集 buckets --*/
    VecNode *buckets[MAX_RECALL_BUCKETS] = {NULL};
    VecNode *noncanon = NULL;

    long hard_fails = 0;

    for (long i = 0; i < num_tests; i++) {
        /* 生成測資 */
        if (i == 0) {
            mpz_set_ui(mpX, 1);
        } else if (i == 1) {
            mpz_sub_ui(mpX, mpP, 1);
        } else {
            do {
                mpz_urandomm(mpX, rs, mpP);
            } while (mpz_cmp_ui(mpX, 0) == 0); // 保證非零
        }

        uint256_from_mpz(&x, mpX);

        /* 嘗試 cpt_inv 最多 5 次 */
        int attempt; int success = 0;
        for (attempt = 1; attempt <= MAX_RETRIES; attempt++) {
            cpt_inv(&x, &xInv);
            mpz_from_uint256(mpInv, &xInv);

            mpz_mul(mpCheck, mpX, mpInv);
            mpz_mod(mpCheck, mpCheck, mpP);
            if (mpz_cmp_ui(mpCheck, 1) == 0) { success = 1; break; }
        }

        if (!success) {
            char *sX = mpz_get_str(NULL, 16, mpX);
            fprintf(stderr, "HARD FAIL at test %ld : x = 0x%s\n", i, sX);
            free(sX);
            hard_fails++; continue;
        }

        /* 成功後：分類 recall bucket */
        char *sX = mpz_get_str(NULL, 16, mpX);
        if (attempt > 1) {
            int idx = attempt - 2;          // 1 recall -> idx 0
            push_node(&buckets[idx], sX);
        }

        /* 與 mpz_invert 比對 canonical */
        mpz_invert(mpInvRef, mpX, mpP);
        if (mpz_cmp(mpInvRef, mpInv) != 0) {
            push_node(&noncanon, sX);       // 同餘不同代表
        }
        free(sX);
    }

    /*-- 報告 --*/
    const char *titles[] = {"correct after 1 recall (2nd try)",
                            "correct after 2 recalls (3rd)",
                            "correct after 3 recalls (4th)",
                            "correct after 4 recalls (5th)"};
    for (int k = 0; k < MAX_RECALL_BUCKETS; k++)
        dump_named_list(titles[k], buckets[k]);

    dump_named_list("non‑canonical return", noncanon);

    if (hard_fails) {
        printf("\n*** TOTAL HARD FAILS: %ld / %ld ***\n", hard_fails, num_tests);
        return 1;
    }

    puts("\nAll tests finished without hard fail.");
    return 0;
}
