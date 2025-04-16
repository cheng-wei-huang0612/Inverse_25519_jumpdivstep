#include <stdint.h>
#include <stdio.h>
#include "update_VS_mont.h"
#include "big30.h"
#include <gmp.h>


void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss) {
    int64_t uu = uuvvrrss[0];
    int64_t vv = uuvvrrss[1];
    int64_t rr = uuvvrrss[2];
    int64_t ss = uuvvrrss[3];

    mpz_t mpV, mpV_new, mpS, mpS_new, mpuu, mpvv, mprr, mpss, mpinv2p60;
    mpz_inits(mpV, mpV_new, mpS, mpS_new, mpuu, mpvv, mprr, mpss, mpinv2p60, NULL);
    
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP,&P);

    mpz_set_si(mpinv2p60, 1);
    mpz_mul_2exp(mpinv2p60, mpinv2p60, 60);
    mpz_invert(mpinv2p60, mpinv2p60, mpP);

    mpz_t tmp1, tmp2;
    mpz_inits(tmp1, tmp2, NULL);

    mpz_from_big30(mpV, V);
    mpz_from_big30(mpS, S);

    mpz_set_si(mpuu, uu);
    mpz_set_si(mpvv, vv);
    mpz_set_si(mprr, rr);
    mpz_set_si(mpss, ss);

    mpz_mul(tmp1, mpuu, mpV);
    mpz_mul(tmp2, mpvv, mpS);
    mpz_add(tmp1, tmp1, tmp2);
    mpz_mul(tmp1, tmp1, mpinv2p60);
    mpz_mod(mpV_new, tmp1, mpP);


    mpz_mul(tmp1, mprr, mpV);
    mpz_mul(tmp2, mpss, mpS);
    mpz_add(tmp1, tmp1, tmp2);
    mpz_mul(tmp1, tmp1, mpinv2p60);
    mpz_mod(mpS_new, tmp1, mpP);

    big30_from_mpz(V, mpV_new);
    big30_from_mpz(S, mpS_new);

    mpz_clears(mpV, mpS, mpV_new, mpS_new, tmp1, tmp2, mpuu, mpvv, mprr, mpss, mpP, NULL);
}

