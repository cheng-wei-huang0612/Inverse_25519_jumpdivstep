#include "big30.h"
#include <stdio.h>
#include <gmp.h>
#include <time.h>

extern void double_mont(
    big30_t *resultV, big30_t *resultS,
    const big30_t *V,
    const int64_t *u, const int64_t *r
);

extern void gmp_double_mont(big30_t *resultV, big30_t *resultS,
    const big30_t *V,
    const int64_t *u, const int64_t *r);

    
static int compareResults(int64_t u, int64_t r, big30_t *V) {
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P);

    // 參考版
    big30_t V_ref, S_ref;
    gmp_double_mont(&V_ref, &S_ref, V, &u, &r);

    // 被測版（pure C）
    big30_t V_test, S_test;
    double_mont(&V_test, &S_test, V, &u, &r);

    // 轉回 mpz
    mpz_t mpV_ref, mpS_ref, mpV_test, mpS_test;
    mpz_inits(mpV_ref, mpS_ref, mpV_test, mpS_test, NULL);

    mpz_from_big30(mpV_ref, &V_ref);
    mpz_from_big30(mpS_ref, &S_ref);
    mpz_from_big30(mpV_test, &V_test);
    mpz_from_big30(mpS_test, &S_test);


    int cmp_u = mpz_cmp(mpV_ref, mpV_test);
    int cmp_r = mpz_cmp(mpS_ref, mpS_test);

    if( cmp_u == 0 && cmp_r == 0 ) {
        // printf("結果一致！ (Ru, Rr 都相同)\n");
        return 0;
    } else {
        // printf("結果不一致！\n");
        if(cmp_u != 0) {
            // gmp_printf("  NEON vs Ref (Ru): %Zd vs %Zd\n", mpV_ref, mpV_test);
            return 1;
        }
        if(cmp_r != 0) {
            // gmp_printf("  NEON vs Ref (Rr): %Zd vs %Zd\n", mpS_ref, mpS_test);
            return 1;
        }

    }
    return 1;

}

int main(void) {
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));
    mpz_t mpV, mpu, mpr, mpP;
    mpz_inits(mpV, mpu, mpr, mpP, NULL);
    mpz_from_big30(mpP, &P);


    int N = 1000000;
    for(int t = 0; t < N; t++){
        pos_random_gmp_in_range(mpV, rstate, 255);
        if (mpz_cmp(mpV, mpP) >= 0) {
            mpz_mod(mpV, mpV, mpP);
        }


        random_gmp_in_range(mpu, rstate, 60); 
        random_gmp_in_range(mpr, rstate, 60); 




        // 3) 轉 big30 / int64
        big30_t V_big30;
        big30_from_mpz(&V_big30, mpV);

        int64_t u_64, r_64;
        int64_from_mpz(&u_64, mpu);
        int64_from_mpz(&r_64, mpr);

        // gmp_printf("V = %Zd\n", mpV);
        // gmp_printf("u = %Zd\n", mpu);
        // gmp_printf("r = %Zd\n\n", mpr);

        int ret = compareResults(u_64,r_64,&V_big30);
        if (ret == 1) {
            printf("Wrong answer!");
            break;
        }
    }
    printf("If nothing printed, all random tests are passed\n");

}