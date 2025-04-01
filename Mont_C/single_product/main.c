#include "big30.h"
#include <stdio.h>
#include <gmp.h>

int main() {
    printf("=== main.c: 特定測資測試 ===\n\n");

    // 例如手動給 u, A
    mpz_t mpA, mpu, mpP, mp2P;
    mpz_inits(mpA, mpu, mpP, mp2P, NULL);

    // P (全域變數) 轉為 mpz 後，可印出來看看
    mpz_from_big30(mpP, &P);
    gmp_printf("P = %Zd\n\n", mpP);
    mpz_mul_2exp(mp2P, mpP, 1);

    // 給定測資 (您可自由修改)
    // mpA = 12345678901234567890
    mpz_set_str(mpA, "54079815756115873346177673560236072694286831632019743338128358147891493109679", 10);
    //mpz_set_str(mpA, "1073741810", 10);
    // u = -9876543210
    mpz_set_str(mpu, "-1152921504606846976", 10);

    // 轉 big30 / int64
    big30_t A_big30, R_pureC, R_ref;
    int64_t u_64;
    small30_t u_30;
    big30_from_mpz(mpA, &A_big30);
    gmp_printf("   mpA = %Zd\n", mpA);
    printf("    Given    A = [limb0 = %u, limb1 = %u, limb2 = %u, limb3 = %u \n"
       "                  limb4 = %u, limb5 = %u, limb6 = %u, limb7 = %u \n"
       "                  limb8 = %u ]\n", 
       A_big30.limb[0], A_big30.limb[1], A_big30.limb[2], A_big30.limb[3], A_big30.limb[4], A_big30.limb[5], A_big30.limb[6], A_big30.limb[7], A_big30.limb[8]);

    int64_from_mpz(mpu, &u_64);
    small30_from_mpz(mpu,&u_30);
    printf("    Given    u = [limb0 = %d, limb1 = %d]\n",u_30.limb[0],u_30.limb[1]);

    // 呼叫 modPmul (純 C 版本)
    modPmul(&R_pureC, &u_64, &A_big30);

    // 呼叫 gmp_modPmul (參考版本)
    gmp_modPmul(&R_ref, &u_64, &A_big30);

    // 轉回 mpz
    mpz_t mpR_pureC, mpR_ref;
    mpz_inits(mpR_pureC, mpR_ref, NULL);
    mpz_from_big30(mpR_pureC, &R_pureC);
    mpz_from_big30(mpR_ref, &R_ref);

    gmp_printf("u = %Zd\n", mpu);
    gmp_printf("A = %Zd\n", mpA);
    gmp_printf(" AR^-1 mod P = %Zd\n", mpR_pureC);
    if(mpz_cmp(mpR_pureC, mpP) >= 0){
        printf(" ---->  Non-canonical representative!\n");

        if(mpz_cmp(mpR_pureC,mp2P) >= 0){
            printf(" ----> Greater than 2*P\n");
        }
        
    }


    // 由於 modPmul（pureC）做的是 Montgomery 形態，
    // 最後需要乘以 2^60，再 mod P 來做對比
    mpz_mul_2exp(mpR_pureC, mpR_pureC, 60);
    mpz_mod(mpR_pureC, mpR_pureC, mpP);
    
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

