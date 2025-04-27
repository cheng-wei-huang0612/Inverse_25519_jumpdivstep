#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "big30.h"
#include "prg.h"
#include "big30_mpz.h"


void gmp_update_FG(
    big30_t *F, big30_t *G,
    const int64_t *uuvvrrss
) {
    mpz_t mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp;
    mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);

    mpz_from_big30(mpF, F);
    mpz_from_big30(mpG, G);
    
    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    mpz_set_si(mpu, uu);
    mpz_set_si(mpv, vv);
    mpz_set_si(mpr, rr);
    mpz_set_si(mps, ss);


    mpz_mul(mpSum, mpF, mpu);
    mpz_mul(mpTmp, mpG, mpv);
    mpz_add(mpSum, mpSum, mpTmp);
    mpz_fdiv_q_2exp(mpSum, mpSum, 60);


    big30_from_mpz(F, mpSum);

    mpz_mul(mpSum, mpF, mpr);
    mpz_mul(mpTmp, mpG, mps);
    mpz_add(mpSum, mpSum, mpTmp);
    mpz_fdiv_q_2exp(mpSum, mpSum, 60);

    big30_from_mpz(G, mpSum);
    mpz_clears(mpF, mpG, mpu, mpv, mpr, mps, mpSum, mpTmp, NULL);
}


