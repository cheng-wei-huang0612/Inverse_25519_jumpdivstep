#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "big30.h"
#include "prg.h"
#include "big30_mpz.h"

extern void update_FG(big30_t *F, big30_t *G, const int64_t *uuvvrrss);

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

void one_test(big30_t *F, big30_t *G, const int64_t *uuvvrrss) {

    big30_t F_for_gmp, G_for_gmp;

    gmp_update_FG(F, G, uuvvrrss);
    update_FG(F, G, uuvvrrss);


}




int main(void) {
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));
    printf("Hello\n\n");

    mpz_t mpF, mpG, mpu, mpv, mpr, mps, mpR, mpS, mpASMR, mpASMS, mpGMPF, mpGMPG; 
    mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, mpR, mpS, mpASMR, mpASMS, mpGMPF, mpGMPG, NULL);

    random_gmp_in_range(mpF, rstate, 255);
    random_gmp_in_range(mpG, rstate, 255);
    random_gmp_in_range(mpu, rstate, 61);
    random_gmp_in_range(mpv, rstate, 61);
    random_gmp_in_range(mpr, rstate, 61);
    random_gmp_in_range(mps, rstate, 61);

    printf("operands: \n");
    gmp_printf("mpF = %Zd\n", mpF);
    gmp_printf("mpG = %Zd\n", mpG);
    gmp_printf("mpu = %Zd\n", mpu);
    gmp_printf("mpv = %Zd\n", mpv);
    gmp_printf("mpr = %Zd\n", mpr);
    gmp_printf("mps = %Zd\n", mps);

    big30_t F, G;
    int64_t uuvvrrss[4];
    big30_from_mpz(&F, mpF);
    big30_from_mpz(&G, mpG);

    uuvvrrss[0] = mpz_get_si(mpu);
    uuvvrrss[1] = mpz_get_si(mpv);
    uuvvrrss[2] = mpz_get_si(mpr);
    uuvvrrss[3] = mpz_get_si(mps);

    gmp_linear_comb(&F, &G, uuvvrrss);

    mpz_from_big30(mpGMPF, &F);
    mpz_from_big30(mpGMPG, &G);


    gmp_printf("mpGMPF = %Zd\n", mpGMPF);
    gmp_printf("mpGMPG = %Zd\n", mpGMPG);

    gmp_printf("\nsage: (((%Zd) * (%Zd) + (%Zd) * (%Zd))>>60) == (%Zd)\n", mpu, mpF, mpv, mpG, mpGMPF);
    gmp_printf("\nsage: (((%Zd) * (%Zd) + (%Zd) * (%Zd))>>60) == (%Zd)\n", mpr, mpF, mps, mpG, mpGMPG);



    return 0;
}
