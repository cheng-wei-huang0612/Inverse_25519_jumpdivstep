#include"big30.h"
#include <stdio.h>
#include <gmp.h>
#include <time.h>

extern void gmp_linear_comb(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
);

extern void linear_comb(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
);


int main(){
    gmp_randstate_t rstate;
    gmp_randinit_default(rstate);
    gmp_randseed_ui(rstate, (unsigned long) time(NULL));
    printf("Hello\n\n");

    big30_t V, S;
    //small30_t u, v, r, s;
    int64_t u, v, r, s;
    big30_t resultV, resultS, asm_resultV, asm_resultS;
    for (int i = 0; i<LIMBS+2; i++){
        asm_resultV.limb[i] = 0;
        asm_resultS.limb[i] = 0;
    }

    mpz_t mpP, mpV, mpS, mpu, mpv, mpr, mps, mpGMPV, mpGMPS, mpASMV, mpASMS; 
    mpz_inits(mpP, mpV, mpS, mpu, mpv, mpr, mps, mpGMPV, mpGMPS, mpASMV, mpASMS, NULL);
    mpz_from_big30(mpP, &P);

    random_gmp_in_range(mpV, rstate, 257);
    random_gmp_in_range(mpS, rstate, 257);
    random_gmp_in_range(mpu, rstate, 60);
    random_gmp_in_range(mpv, rstate, 60);
    random_gmp_in_range(mpr, rstate, 60);
    random_gmp_in_range(mps, rstate, 60);

    mpz_abs(mpV, mpV);
    mpz_abs(mpS, mpS);
    if (mpz_cmp(mpV, mpP) >= 0) {
        mpz_mod(mpV, mpV, mpP);
    }
    if (mpz_cmp(mpS, mpP) >= 0) {
        mpz_mod(mpS, mpS, mpP);
    }

    //mpz_set_str(mpV, "442357494465584232994334592845894063794367687384513334427836909710584277991970871", 10);
    //mpz_set_str(mpS, "3661128208310271021703216770528491304024322876653174195830950232681513943315393052", 10);

    //mpz_set_str(mpu, "70321677052849", 10);
    //mpz_set_str(mpv, "123", 10);
    //mpz_set_str(mpr, "4196370423833798", 10);
    //mpz_set_str(mps, "4374690674658530", 10);




    big30_from_mpz(&V, mpV);
    big30_from_mpz(&S, mpS);
    int64_from_mpz(&u, mpu);
    int64_from_mpz(&v, mpv);
    int64_from_mpz(&r, mpr);
    int64_from_mpz(&s, mps);

    // gmp_printf("mpF = %Zd\n", mpF);
    // gmp_printf("mpG = %Zd\n", mpG);
    // gmp_printf("mpu = %Zd\n", mpu);
    // gmp_printf("mpv = %Zd\n", mpv);
    // gmp_printf("mpr = %Zd\n", mpr);
    // gmp_printf("mps = %Zd\n", mps);
    
    mpz_t mp2p62, mp2p272,mptmp;
    mpz_inits(mp2p272,mp2p62,mptmp,NULL);
    mpz_set_si(mp2p62, 1);
    mpz_mul_2exp(mp2p62,mp2p62, 62);
    mpz_set_si(mp2p272, 1);
    mpz_mul_2exp(mp2p272,mp2p272, 272);

    printf("    Given    V = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, V.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");

    gmp_printf("               = %Zd\n",mpV);
    mpz_add(mptmp,mpV,mp2p272);
    mpz_mod(mptmp, mptmp, mp2p272);
    gmp_printf("    unsigned V = %Zd\n\n",mptmp);

    
    printf("    Given    S = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, S.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");

    gmp_printf("               = %Zd\n",mpS);
    mpz_add(mptmp,mpS,mp2p272);
    mpz_mod(mptmp, mptmp, mp2p272);
    gmp_printf("    unsigned V = %Zd\n\n",mptmp);



    small30_t small30u;
    small30_t small30v;
    small30_t small30r;
    small30_t small30s;


    small30_from_mpz(&small30u, mpu);
    printf("    Given    u = [limb0 = %d, limb1 = %d]\n", small30u.limb[0], small30u.limb[1]);
    gmp_printf("               = %Zd\n",mpu);
    gmp_printf("(Sage: %Zd == %d + (2**30) * %d)\n",mpu, small30u.limb[0], small30u.limb[1]);
    mpz_add(mptmp,mpu,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned u = %Zd\n\n",mptmp);

    small30_from_mpz(&small30v, mpv);
    printf("    Given    v = [limb0 = %d, limb1 = %d]\n", small30v.limb[0], small30v.limb[1]);
    gmp_printf("               = %Zd\n",mpv);
    mpz_add(mptmp,mpv,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned v = %Zd\n\n",mptmp);

    small30_from_mpz(&small30r, mpr);
    printf("    Given    r = [limb0 = %d, limb1 = %d]\n", small30r.limb[0], small30r.limb[1]);
    gmp_printf("               = %Zd\n",mpr);
    mpz_add(mptmp,mpr,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned r = %Zd\n\n",mptmp);

    small30_from_mpz(&small30s, mps);
    printf("    Given    s = [limb0 = %d, limb1 = %d]\n", small30s.limb[0], small30s.limb[1]);
    gmp_printf("               = %Zd\n",mps);
    mpz_add(mptmp,mps,mp2p62);
    mpz_mod(mptmp, mptmp, mp2p62);
    gmp_printf("    unsigned s = %Zd\n\n",mptmp);
    printf("\n");


    
    //printf("Address of asm_resultF: %p\n", (void*)&asm_resultF);
    //printf("Address of asm_resultG: %p\n", (void*)&asm_resultG);

    linear_comb(&asm_resultV, &asm_resultS, &V, &S, &u, &v, &r, &s);
    
    
    printf("asm complete\n");
    mpz_from_big30(mpASMV, &asm_resultV);
    mpz_from_big30(mpASMS, &asm_resultS);

    printf("ASM result of V = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, asm_resultV.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");
    gmp_printf("                 = %Zd\n\n", mpASMV);

    // printf("ASM result of V = [");
    // for (int i = 0; i < LIMBS; i++) {
    //     printf("limb%d = %u", i, asm_resultV.limb[i]);
    //     if (i < LIMBS - 1) {
    //         printf(", ");
    //     }
    // }
    // printf("]\n");
    // gmp_printf("                 = %Zd\n\n", mpASMV);

    printf("ASM result of S = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, asm_resultS.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");
    gmp_printf("                 = %Zd\n\n", mpASMS);

    // printf("ASM result of S = [");
    // for (int i = 0; i < LIMBS; i++) {
    //     printf("limb%d = %u", i, asm_resultS.limb[i]);
    //     if (i < LIMBS - 1) {
    //         printf(", ");
    //     }
    // }
    // printf("]\n");
    // gmp_printf("                 = %Zd\n\n", mpASMV);
    

    gmp_linear_comb(&resultV, &resultS, &V, &S, &u, &v, &r, &s);
    mpz_from_big30(mpGMPV, &resultV);
    mpz_from_big30(mpGMPS, &resultS);

    printf("GMP result of V = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, resultV.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");
    gmp_printf("                 = %Zd\n\n", mpGMPV);

    printf("GMP result of S = [");
    for (int i = 0; i < LIMBS; i++) {
        printf("limb%d = %d", i, resultS.limb[i]);
        if (i < LIMBS - 1) {
            printf(", ");
        }
    }
    printf("]\n");
    gmp_printf("                 = %Zd\n\n", mpGMPS);


    //gmp_printf("\nsage: (%Zd) == (%Zd)\n ", mpR, mpASMR);
    //gmp_printf("\nsage: (%Zd) == (%Zd)\n ", mpS, mpASMS);


    gmp_printf("\nsage: (((%Zd) * (%Zd)) + ((%Zd) * (%Zd))) %% (%Zd) == %Zd\n", mpu, mpV, mpv, mpS, mpP, mpGMPV);
    gmp_printf("\nsage: (((%Zd) * (%Zd)) + ((%Zd) * (%Zd))) %% (%Zd) == %Zd\n", mpr, mpV, mps, mpS, mpP, mpGMPS);


    mpz_clears(mpP, mpV, mpS, mpu, mpv, mpr, mps, mpGMPV, mpGMPS, mpASMV, mpASMS, NULL);
    printf("\n\nByeBye\n");
    return 0;
}


