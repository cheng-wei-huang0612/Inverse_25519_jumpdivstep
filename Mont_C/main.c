#include "big30.h"
#include <stdio.h>
#include <gmp.h>

int main() {
    printf("=== main.c: 特定測資測試 ===\n\n");

    // 例如手動給 u, A
    mpz_t mpA, mpu, mpP;
    mpz_inits(mpA, mpu, mpP, NULL);

    // P (全域變數) 轉為 mpz 後，可印出來看看
    mpz_from_big30(mpP, &P);
    gmp_printf("P = %Zd\n\n", mpP);

    // 給定測資 (您可自由修改)
    // mpA = 12345678901234567890
    mpz_set_str(mpA, "170162206873072628626682420096922658384061749486689668987821284322181549397953", 10);
    // u = -9876543210
    mpz_set_str(mpu, "-9876543210", 10);

    // 轉 big30 / int64
    big30_t A_big30, R_pureC, R_ref;
    int64_t u_64;
    big30_from_mpz(mpA, &A_big30);
    int64_from_mpz(mpu, &u_64);

    // 呼叫 modPmul (純 C 版本)
    modPmul(&R_pureC, &u_64, &A_big30);

    // 呼叫 gmp_modPmul (參考版本)
    gmp_modPmul(&R_ref, &u_64, &A_big30);

    // 轉回 mpz
    mpz_t mpR_pureC, mpR_ref;
    mpz_inits(mpR_pureC, mpR_ref, NULL);
    mpz_from_big30(mpR_pureC, &R_pureC);
    mpz_from_big30(mpR_ref, &R_ref);

    // 由於 modPmul（pureC）做的是 Montgomery 形態，
    // 最後需要乘以 2^60，再 mod P 來做對比
    mpz_mul_2exp(mpR_pureC, mpR_pureC, 60);
    mpz_mod(mpR_pureC, mpR_pureC, mpP);

    gmp_printf("u = %Zd\n", mpu);
    gmp_printf("A = %Zd\n", mpA);
    gmp_printf("pureC  結果 = %Zd\n", mpR_pureC);
    gmp_printf("refGMP 結果 = %Zd\n", mpR_ref);

    // 比較
    if(mpz_cmp(mpR_pureC, mpR_ref) == 0) {
        printf("結果一致！\n");
    } else {
        printf("結果不一致！\n");
    }

    mpz_clears(mpA, mpu, mpP, mpR_pureC, mpR_ref, NULL);

    return 0;
}

