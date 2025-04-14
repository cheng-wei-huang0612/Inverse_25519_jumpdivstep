#include <stdint.h>
#include <stdio.h>
#include "update_FG.h"
#include "big30.h"
#include <gmp.h>

void update_FG(big30_t *F, big30_t *G, int64_t *uu, int64_t *vv, int64_t *rr, int64_t *ss) {
    mpz_t mpF, mpF_new, mpG, mpG_new, mpuu, mpvv, mprr, mpss, tmp;
    mpz_inits(mpF, mpF_new, mpG, mpG_new, mpuu, mpvv, mprr, mpss, tmp, NULL);

    mpz_from_big30(mpF, F);
    mpz_from_big30(mpG, G);

    mpz_set_si(mpuu, *uu);
    mpz_set_si(mpvv, *vv);
    mpz_set_si(mprr, *rr);
    mpz_set_si(mpss, *ss);
    
    mpz_mul(tmp, mpuu, mpF);
    mpz_addmul(tmp, mpvv, mpG);
    mpz_fdiv_q_2exp(mpF_new, tmp, 60);

    mpz_mul(tmp, mprr, mpF);
    mpz_addmul(tmp, mpss, mpG);
    mpz_fdiv_q_2exp(mpG_new, tmp, 60);

    big30_from_mpz(F, mpF_new);
    big30_from_mpz(G, mpG_new);

    mpz_clears(mpF, mpG, mpF_new, mpG_new, tmp, mpuu, mpvv, mprr, mpss, NULL);
}

