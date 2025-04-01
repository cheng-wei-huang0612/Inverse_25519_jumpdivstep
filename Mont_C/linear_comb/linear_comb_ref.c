#include <stdio.h>
#include <gmp.h>
#include "big30.h"


/*
 * Computes 
 * V = u * V + v * S (mod P)
 * S = r * V + s * S (mod P)
 * by gmp functions
 */
void gmp_linear_comb(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
){

    // Prepare the GMP variables
    mpz_t mpP, mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp;
    mpz_inits(mpP, mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);
    mpz_from_big30(mpP, &P);

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

    mpz_mod(mpSum, mpSum, mpP);
    big30_from_mpz(resultV, mpSum);


    mpz_mul(mpSum, mpV, mpr);
    mpz_mul(mpTmp, mpS, mps);
    mpz_add(mpSum, mpSum, mpTmp);

    mpz_mod(mpSum, mpSum, mpP);
    big30_from_mpz(resultS, mpSum);
    

    // Clear the GMP variables

    mpz_clears(mpV, mpS, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);
}



