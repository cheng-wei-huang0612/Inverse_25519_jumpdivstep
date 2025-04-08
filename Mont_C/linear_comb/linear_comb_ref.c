#include <stdio.h>
#include <gmp.h>
#include "big30.h"

/*#define SAGECHECK*/

/*
 * Computes 
 * V = [u * V * (2^(-60)) + v * S * (2^(-60))] (mod P)
 * S = [r * V * (2^(-60)) + s * S * (2^(-60))] (mod P)
 * by gmp functions
 */
void gmp_linear_mont(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
){

    // Prepare the GMP variables
    mpz_t mpP, mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp, mpinv2p60;
    mpz_inits(mpP, mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp, mpinv2p60, NULL);
    mpz_from_big30(mpP, &P);
    mpz_set_ui(mpinv2p60, 1);
    mpz_mul_2exp(mpinv2p60,mpinv2p60, 60);
    mpz_invert(mpinv2p60, mpinv2p60, mpP);

    // Transform V, S, u, v, r, s into mpz_t
    mpz_from_big30(mpV, V);
    mpz_from_big30(mpS, S);
    mpz_set_si(mpu, *u);
    mpz_set_si(mpv, *v);
    mpz_set_si(mpr, *r);
    mpz_set_si(mps, *s);


    
    // Main Computation
    mpz_mul(mpSum, mpV, mpu);
    mpz_mul(mpTmp, mpS, mpv);
    mpz_add(mpSum, mpSum, mpTmp);
    mpz_mul(mpSum, mpSum, mpinv2p60);
    mpz_mod(mpSum, mpSum, mpP);

#ifdef SAGECHECK
    // debug:
    gmp_printf("sage: %Zd == ((%Zd) * (%Zd) * (%Zd) + (%Zd) * (%Zd) * (%Zd)) %% (%Zd)\n",
            mpSum, mpu, mpV, mpinv2p60, mpv, mpS, mpinv2p60, mpP);
#endif
    big30_from_mpz(resultV, mpSum);


    mpz_mul(mpSum, mpV, mpr);
    mpz_mul(mpTmp, mpS, mps);
    mpz_add(mpSum, mpSum, mpTmp);
    mpz_mul(mpSum, mpSum, mpinv2p60);
    mpz_mod(mpSum, mpSum, mpP);
    
#ifdef SAGECHECK
    // debug:
    gmp_printf("sage: %Zd == ((%Zd) * (%Zd) * (%Zd) + (%Zd) * (%Zd) * (%Zd)) %% (%Zd)\n",
            mpSum, mpr, mpV, mpinv2p60, mps, mpS, mpinv2p60, mpP);
#endif

    big30_from_mpz(resultS, mpSum);

    // Clear the GMP variables

    mpz_clears(mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);
}



