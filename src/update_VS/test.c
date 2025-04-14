#include "big30.h"
#include <stdio.h>
#include <gmp.h>
#include <time.h>

#define NUM_RANDOM_TESTS  1000000
#define DEBUGPRINT

extern void gmp_linear_mont(
    big30_t *resultV, big30_t *resultS,
    const big30_t *V, const big30_t *S,
    const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
);

extern void linear_mont_neon_intrinsics(
    big30_t *resultV, big30_t *resultS,
    const big30_t *V, const big30_t *S,
    const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
);
static int test_one_case(
    const mpz_t mpV, const mpz_t mpS,
    const mpz_t mpu, const mpz_t mpv, const mpz_t mpr, const mpz_t mps
) {
    // 先把 mpz_t 轉成 big30_t / int64_t
    big30_t V, S;
    big30_from_mpz(&V, mpV);
    big30_from_mpz(&S, mpS);

    int64_t u, v, r, s;
    int64_from_mpz(&u, mpu);
    int64_from_mpz(&v, mpv);
    int64_from_mpz(&r, mpr);
    int64_from_mpz(&s, mps);

    // 分別存放兩個實作的結果
    big30_t asm_resultV, asm_resultS;
    big30_t gmp_resultV, gmp_resultS;

    // 初始化 result
    for (int i = 0; i < LIMBS+2; i++) {
        asm_resultV.limb[i] = 0;
        asm_resultS.limb[i] = 0;
        gmp_resultV.limb[i] = 0;
        gmp_resultS.limb[i] = 0;
    }

    // 呼叫 neon intrinsics
    linear_mont_neon_intrinsics(&asm_resultV, &asm_resultS, &V, &S, &u, &v, &r, &s);

    // 呼叫 gmp 參考實作
    gmp_linear_mont(&gmp_resultV, &gmp_resultS, &V, &S, &u, &v, &r, &s);

    // 轉回 mpz_t 做比較
    mpz_t mpASMV, mpASMS, mpGMPV, mpGMPS;
    mpz_inits(mpASMV, mpASMS, mpGMPV, mpGMPS, NULL);

    mpz_from_big30(mpASMV, &asm_resultV);
    mpz_from_big30(mpASMS, &asm_resultS);
    mpz_from_big30(mpGMPV, &gmp_resultV);
    mpz_from_big30(mpGMPS, &gmp_resultS);

    int pass = 1; // 假設通過

    // 比較 V
    if (mpz_cmp(mpASMV, mpGMPV) != 0) {
        pass = 0;
    }

    // 比較 S
    if (mpz_cmp(mpASMS, mpGMPS) != 0) {
        pass = 0;
    }

#ifdef DEBUGPRINT
    if (!pass) {
        printf("[TEST FAIL]\n");
        gmp_printf("  Input V=%Zd, S=%Zd\n", mpV, mpS);
        gmp_printf("  Input u=%Zd, v=%Zd, r=%Zd, s=%Zd\n", mpu, mpv, mpr, mps);
        gmp_printf("  asm V=%Zd, S=%Zd\n", mpASMV, mpASMS);
        gmp_printf("  gmp V=%Zd, S=%Zd\n\n", mpGMPV, mpGMPS);
    } else {
        // printf("[TEST PASS]\n");
    }
#endif

    mpz_clears(mpASMV, mpASMS, mpGMPV, mpGMPS, NULL);
    return pass;
}



static void test_corner_cases() {
    // 先建立一些 mpz_t 變數
    mpz_t mpV, mpS, mpu, mpv, mpr, mps;
    mpz_inits(mpV, mpS, mpu, mpv, mpr, mps, NULL);

    // 可先把 P 取出來，做例如 V=P-1, S=P-1
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P); // 假設全域裡面有 P

    printf("==== Corner Case Tests ====\n");

    // Case 1: V=0, S=0, u=0, v=0, r=0, s=0
    mpz_set_ui(mpV, 0); mpz_set_ui(mpS, 0);
    mpz_set_ui(mpu, 0); mpz_set_ui(mpv, 0);
    mpz_set_ui(mpr, 0); mpz_set_ui(mps, 0);
    test_one_case(mpV, mpS, mpu, mpv, mpr, mps);

    // Case 2: V=P-1, S=P-1, u=1, v=1, r=1, s=1
    mpz_sub_ui(mpV, mpP, 1);
    mpz_sub_ui(mpS, mpP, 1);
    mpz_set_ui(mpu, 1);
    mpz_set_ui(mpv, 1);
    mpz_set_ui(mpr, 1);
    mpz_set_ui(mps, 1);
    test_one_case(mpV, mpS, mpu, mpv, mpr, mps);

    // Case 3: V=1, S=0, u, v, r, s 為大值（或其他混合）
    mpz_set_ui(mpV, 1);
    mpz_set_ui(mpS, 0);
    mpz_set_str(mpu, "1234567890123456", 10);
    mpz_set_str(mpv, "9999999999999999", 10);
    mpz_set_str(mpr, "3141592653589793", 10);
    mpz_set_str(mps, "987654321987654", 10);
    test_one_case(mpV, mpS, mpu, mpv, mpr, mps);


    mpz_clears(mpV, mpS, mpu, mpv, mpr, mps, mpP, NULL);
}


static void test_random_cases(gmp_randstate_t rstate, int num_tests) {
    printf("==== Random Tests (count=%d) ====\n", num_tests);

    mpz_t mpP, mpV, mpS, mpu, mpv, mpr, mps;
    mpz_inits(mpP, mpV, mpS, mpu, mpv, mpr, mps, NULL);
    mpz_from_big30(mpP, &P); // P 來自 big30.h 全域

    for (int i = 0; i < num_tests; i++) {
        // 亂數產生 V, S 在 [0, P)
        random_gmp_in_range(mpV, rstate, 257);  // 你可以讓 range 更大
        random_gmp_in_range(mpS, rstate, 257);
        // 確保 V, S < P
        mpz_mod(mpV, mpV, mpP);
        mpz_mod(mpS, mpS, mpP);

        // 亂數產生 u, v, r, s 在某個範圍
        // 注意 int64_from_mpz() 時要避免 overflow
        // 這裡先給個 60 bits 的範圍作為示範
        random_gmp_in_range(mpu, rstate, 60);
        random_gmp_in_range(mpv, rstate, 60);
        random_gmp_in_range(mpr, rstate, 60);
        random_gmp_in_range(mps, rstate, 60);

        // 測試
        test_one_case(mpV, mpS, mpu, mpv, mpr, mps);
    }

    mpz_clears(mpP, mpV, mpS, mpu, mpv, mpr, mps, NULL);
}


int main() {
    // 初始化隨機狀態
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long)time(NULL));

    printf("===== 開始測試 linear_mont_neon_intrinsics() =====\n\n");

    // 1. Corner case 測試
    test_corner_cases();

    // 2. 多組隨機測試
    test_random_cases(rstate, NUM_RANDOM_TESTS);

    printf("If nothing are printed, then all tests are done\n");
    printf("\n===== 測試結束 =====\n");

    // 清除亂數狀態
    gmp_randclear(rstate);

    return 0;
}
