#include "big30.h"
#include <stdio.h>
#include <gmp.h>
#include <time.h>

/*
 * ---------------------------------------------------------
 * test.c
 *
 * 1) corner cases
 * 2) random tests
 *
 * 檢查方式：
 *   modPmul(&R, &u, &A);
 *   gmp_modPmul(&correctR, &u, &A);
 *   然後把 R -> mpz 之後要再乘以 2^60 mod P，
 *   與 correctR -> mpz 比對是否相同。
 * ---------------------------------------------------------
 */

// 比對函式
static int compareResults(int64_t u, big30_t *A)
{
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P);

    // 參考版
    big30_t R_ref;
    gmp_modPmul(&R_ref, &u, A);

    // 被測版（pure C）
    big30_t R_test;
    modPmul(&R_test, &u, A);

    // 轉回 mpz
    mpz_t mpR_ref, mpR_test, mpA;
    mpz_inits(mpR_ref, mpR_test, mpA, NULL);

    mpz_from_big30(mpR_ref, &R_ref);
    mpz_from_big30(mpR_test, &R_test);

    // Montgomery 最後要乘 2^60 mod P
    mpz_mul_2exp(mpR_test, mpR_test, 60);
    mpz_mod(mpR_test, mpR_test, mpP);

    // 比較
    int eq = (mpz_cmp(mpR_ref, mpR_test) == 0);

    mpz_clears(mpR_ref, mpR_test, mpA, mpP, NULL);

    return eq;
}

int main()
{
    printf("=== test.c: Corner Case 與 Random Test ===\n\n");
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));

    // -----------------------------------------------------
    // Corner Cases
    // -----------------------------------------------------
    printf("[Corner Cases]\n");

    mpz_t mpA;
    mpz_init(mpA);

    // 準備一些 u
    int64_t corner_u[] = {
        0, 1, -1, 
        ((int64_t)1<<60) - 1,  // 2^60 -1
        -(((int64_t)1<<60) - 1)
    };

    // 準備一些 A
    // 例如 A = 0, 1, P-1, P, P+1 等
    // P-1, P, P+1 需先取得 mpz 型別後再轉成 big30
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P);

    // A = 0
    mpz_set_ui(mpA, 0);
    big30_t bigA_0; big30_from_mpz(mpA, &bigA_0);

    // A = 1
    mpz_set_ui(mpA, 1);
    big30_t bigA_1; big30_from_mpz(mpA, &bigA_1);

    // A = P - 1
    mpz_sub_ui(mpA, mpP, 1);
    big30_t bigA_Psub1; big30_from_mpz(mpA, &bigA_Psub1);

    // A = P
    mpz_set(mpA, mpP);
    big30_t bigA_P; big30_from_mpz(mpA, &bigA_P);

    // A = P + 1
    mpz_add_ui(mpA, mpP, 1);
    big30_t bigA_Padd1; big30_from_mpz(mpA, &bigA_Padd1);

    // 收集這幾個 A
    big30_t corner_A[5] = {bigA_0, bigA_1, bigA_Psub1, bigA_P, bigA_Padd1};
    const char* A_desc[5] = {"0", "1", "P-1", "P", "P+1"};

    // 逐一測試
    for(int i = 0; i < (int)(sizeof(corner_u)/sizeof(corner_u[0])); i++){
        for(int j = 0; j < 5; j++){
            int64_t u_val = corner_u[i];
            big30_t *A_ptr = &corner_A[j];

            int pass = compareResults(u_val, A_ptr);
            printf("  [u=%lld, A=%s] => %s\n", 
                    (long long)u_val, A_desc[j], pass?"PASS":"FAIL");
        }
    }

    // -----------------------------------------------------
    // Random Tests
    // -----------------------------------------------------
    printf("\n[Random Tests]\n");

    int N = 20000000; // 例如做 20 組隨機測試
    for(int t = 0; t < N; t++){
        mpz_t mpu_rand, mpA_rand, mpP;
        mpz_inits(mpu_rand, mpA_rand, mpP, NULL);
        mpz_from_big30(mpP, &P);

        // 亂數 bits 可自行調整；例如 u 最多 60 bits，A 最多 257 bits
        random_gmp_in_range(mpu_rand, rstate, 60);
        random_gmp_in_range(mpA_rand, rstate, 257);
        // A 取絕對值(若您不想要負值也進行測試的話)
        mpz_abs(mpA_rand, mpA_rand);
        // 若 A >= P，先做一次 mod P，確保 A ∈ [0, P-1]
        if (mpz_cmp(mpA_rand, mpP) >= 0) {
            mpz_mod(mpA_rand, mpA_rand, mpP);
        }



        // 轉 big30 / int64
        int64_t u_rand;
        big30_t A_rand;
        int64_from_mpz(mpu_rand, &u_rand);
        big30_from_mpz(mpA_rand, &A_rand);

        // 比對
        int pass = compareResults(u_rand, &A_rand);
        if(!pass){
            printf("  Random Test %d: FAIL\n", t);
            gmp_printf(" mpA = %Zd\n", mpA_rand);
            gmp_printf(" mpu = %Zd\n", mpu_rand);
        } else {
            //printf("  Random Test %d: PASS\n", t);
        }


        mpz_clears(mpu_rand, mpA_rand, NULL);
    }

    printf("If nothing be printed, then all %d tests are passed!", N);
    mpz_clear(mpA);
    mpz_clear(mpP);

    printf("\n=== 測試完成 ===\n");
    return 0;
}

