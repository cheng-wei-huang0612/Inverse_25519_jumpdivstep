#include<stdint.h>
#include<stdio.h>
#include"mybig30.h"
#include<gmp.h>

void mpz_t_from_uint256_t(mpz_t rop, const uint256_t *x){
    mpz_set_ui(rop, 0);
    for (int i = 3; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, 64);
        mpz_add_ui(rop, rop, x->limb64[i]);
    }
}

void uint256_t_from_mpz_t(uint256_t *rop, const mpz_t op) {
    mpz_t tmp;
    mpz_init_set(tmp, op);

    for (int i = 0; i < 4; i++) {
        rop->limb64[i] = mpz_get_ui(tmp);
        mpz_tdiv_q_2exp(tmp, tmp, 64);
    }

    mpz_clear(tmp);
}

/**
 * Each big30_9 limb covers 30 bits.
 * The array has 9 limbs in total.
 */
#define BIG30_SHIFT  30

/**
 * Convert a big30_9 structure to an mpz_t value.
 *
 * Explanation:
 *  1) We set the mpz_t 'rop' to the highest limb (limb[8]) with sign.
 *  2) Then, for i = 7 down to 0, we shift 'rop' left by 30 bits and add the current limb.
 */
void mpz_t_from_big30_9_t(mpz_t rop, const big30_9 *x)
{
    mpz_t temp;
    mpz_init(temp);

    // Initialize rop with the signed value from the top limb
    mpz_set_si(rop, (int32_t)(x->limb[8]));

    // Multiply by 2^30 and add each lower limb in descending order
    for (int i = 7; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_set_ui(temp, (unsigned long)x->limb[i]);
        mpz_add(rop, rop, temp);
    }

    mpz_clear(temp);
}

/**
 * Convert an mpz_t value to a big30_9 structure.
 *
 * Explanation:
 *  1) We create a copy of 'op' into 'tmp'.
 *  2) For i = 0..7, extract the lowest 30 bits (using mpz_mod_2exp),
 *     store them in rop->limb[i], then divide 'tmp' by 2^30.
 *  3) The remaining part in 'tmp' is placed into rop->limb[8] as a signed integer.
 */
void big30_9_t_from_mpz_t(big30_9 *rop, const mpz_t op)
{
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract 8 lower limbs, each 30 bits
    for (int i = 0; i < 8; i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }

    // The final signed part goes to limb[8]
    rop->limb[8] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}


void cpt_inv(uint256_t *x, uint256_t *inv){
    
    big30_9 F;
    
    for (int i = 0; i < 9; i++) {
        F.limb[i] = P.limb[i];
    }

    big30_9 G;
    uint256_to_big30_9(&G, x);

    int64_t delta = 1;

    big30_9 V;
    for (size_t i = 0; i < 9; i++) {
        V.limb[i] = 0;
    }

    big30_9 S;
    for (size_t i = 0; i < 9; i++) {
        S.limb[i] = 0;
    }
    S.limb[0] = 1;


    int64_t f, g;
    int64_t fuv, grs;
    int64_t uu, vv, rr, ss;
    int64_t uu_new, vv_new, rr_new, ss_new;

    for (int i = 0; i < (10-0); i++) {

        f = (int64_t) F.limb[1];
        g = (int64_t) G.limb[1];
        f = (f << 30);
        g = (g << 30);
        f = f + (int64_t)F.limb[0];
        g = g + (int64_t)G.limb[0];
        
        uu = 1;
        vv = 0;
        rr = 0;
        ss = 1;
        
        int64_t u, v, r, s;

        int64_t g0_and_1;
        int64_t cond, c_mask, n_mask;
        int64_t neg_fuv;
        int64_t fuv_new;
        int64_t grs_new;
        int64_t delta_swapper;

        for (int j = 0; j < 3; j++) {
            fuv = (f & 0xFFFFF) - ((int64_t) 1 << 41 );
            grs = (g & 0xFFFFF) - ((int64_t) 1 << 62 );

            for (int k = 0; k < 20; k++) {

                g0_and_1 = grs & 1;  // 0 or 1 

                
                cond = (~((delta - 1) >> 63)) & (g0_and_1);


                c_mask = -cond;
                n_mask = ~c_mask;


                neg_fuv = -fuv;
                fuv_new =     (n_mask & fuv) ^ (c_mask & grs);
                grs_new = (c_mask & neg_fuv) ^ (n_mask & grs);

                fuv = fuv_new;
                grs = grs_new;


                delta_swapper = delta ^ (-delta);
                delta = delta ^ (c_mask & delta_swapper);

                
                grs = (((-g0_and_1) & fuv) + grs )>>1;
                delta = delta + 2;

            }

            // u, v, r, s extraction

            v = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
            v = v >> 42;

            u = (fuv + ((int64_t)1 << 20));
            u = (uint64_t) u << 22;
            u = u >> 43;

            s = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
            s = s >> 42;
        
            r = (grs + ((int64_t)1 << 20));
            r = (uint64_t) r << 22;
            r = r >> 43;


            mpz_t mpf, mpf_new, mpg, mpg_new, mpu, mpv, mpr, mps, tmp;
            mpz_init(mpf_new);
            mpz_init(mpg_new);
            mpz_init(tmp);

            mpz_init_set_si(mpf, f);
            mpz_init_set_si(mpg, g);
            mpz_init_set_si(mpu, u);
            mpz_init_set_si(mpv, v);
            mpz_init_set_si(mpr, r);
            mpz_init_set_si(mps, s);
            
            mpz_mul(tmp, mpu, mpf);
            mpz_addmul(tmp, mpv, mpg);
            mpz_fdiv_q_2exp(mpf_new, tmp, 20);

            mpz_mul(tmp, mpr, mpf);
            mpz_addmul(tmp, mps, mpg);
            mpz_fdiv_q_2exp(mpg_new, tmp, 20);

            f = mpz_get_si(mpf_new);
            g = mpz_get_si(mpg_new);

            mpz_clears(mpf, mpg, mpf_new, mpg_new, tmp, mpu, mpv ,mpr ,mps, NULL);
            
                
            uu_new = u * uu + v * rr;         
            rr_new = r * uu + s * rr;
            vv_new = u * vv + v * ss;
            ss_new = r * vv + s * ss;

            uu = uu_new;
            rr = rr_new;
            vv = vv_new;
            ss = ss_new;


        }


        // Update FG
        {
        mpz_t mpF, mpF_new, mpG, mpG_new, mpuu, mpvv, mprr, mpss, tmp;
        mpz_inits(mpF, mpF_new, mpG, mpG_new, mpuu, mpvv, mprr, mpss, tmp, NULL);

        mpz_t_from_big30_9_t(mpF, &F);
        mpz_t_from_big30_9_t(mpG, &G);

        mpz_set_si(mpuu, uu);
        mpz_set_si(mpvv, vv);
        mpz_set_si(mprr, rr);
        mpz_set_si(mpss, ss);
        
        mpz_mul(tmp, mpuu, mpF);
        mpz_addmul(tmp, mpvv, mpG);
        mpz_fdiv_q_2exp(mpF_new, tmp, 60);

        mpz_mul(tmp, mprr, mpF);
        mpz_addmul(tmp, mpss, mpG);
        mpz_fdiv_q_2exp(mpG_new, tmp, 60);

        big30_9_t_from_mpz_t(&F, mpF_new);
        big30_9_t_from_mpz_t(&G, mpG_new);

        mpz_clears(mpF, mpG, mpF_new, mpG_new, tmp, mpuu, mpvv, mprr, mpss, NULL);
        }


        // Update VS
        {
        mpz_t mpV, mpV_new, mpS, mpS_new, mpuu, mpvv, mprr, mpss;
        mpz_inits(mpV, mpV_new, mpS, mpS_new, mpuu, mpvv, mprr, mpss, NULL);
        
        mpz_t mpP;
        mpz_init(mpP);
        mpz_t_from_big30_9_t(mpP,&P);

        mpz_t tmp1, tmp2;
        mpz_inits(tmp1, tmp2, NULL);

        mpz_t_from_big30_9_t(mpV, &V);
        mpz_t_from_big30_9_t(mpS, &S);

        mpz_set_si(mpuu, uu);
        mpz_set_si(mpvv, vv);
        mpz_set_si(mprr, rr);
        mpz_set_si(mpss, ss);

        mpz_mul(tmp1, mpuu, mpV);
        mpz_mod(tmp1, tmp1, mpP);

        mpz_mul(tmp2, mpvv, mpS);
        mpz_mod(tmp2, tmp2, mpP);

        mpz_add(tmp1, tmp1, tmp2);
        mpz_mod(mpV_new, tmp1, mpP);



        mpz_mul(tmp1, mprr, mpV);
        mpz_mod(tmp1, tmp1, mpP);

        mpz_mul(tmp2, mpss, mpS);
        mpz_mod(tmp2, tmp2, mpP);

        mpz_add(tmp1, tmp1, tmp2);
        mpz_mod(mpS_new, tmp1, mpP);


        big30_9_t_from_mpz_t(&V, mpV_new);
        big30_9_t_from_mpz_t(&S, mpS_new);

        mpz_clears(mpV, mpS, mpV_new, mpS_new, tmp1, tmp2, mpuu, mpvv, mprr, mpss, mpP, NULL);
        }

    }
    
    // Final Process
    

    mpz_t mpinv, mpinv600, mpP, mpV;
    mpz_inits(mpinv, mpinv600, mpP, mpV, NULL);

    mpz_t_from_big30_9_t(mpV, &V);
    mpz_t_from_big30_9_t(mpinv600, &inv600);
    mpz_t_from_big30_9_t(mpP, &P);

    mpz_mul(mpinv, mpV, mpinv600);

    mpz_mod(mpinv, mpinv, mpP);


    mpz_t mpF;
    int32_t sign_F;
    sign_F = (int32_t) F.limb[0];
    
    sign_F <<= 2;
    sign_F >>= 2;
    //printf("sign_F = %d\n", sign_F);


    mpz_init_set_si(mpF, sign_F);

    mpz_mul(mpinv, mpinv, mpF);

    mpz_mod(mpinv, mpinv, mpP);
    //gmp_printf("mpinv = %Zd\n", mpinv);
    

    
    uint256_t_from_mpz_t( inv, mpinv);

}

#include <stdlib.h>
#include <time.h>
// A small helper to generate a random 256-bit number in uint256_t
// (Not cryptographically secure! Just for test/demo.)
static void random_uint256_t(uint256_t *rop) {
    // Fill each 64-bit limb with random data.
    // rand() typically returns up to 31 bits, so we combine multiple calls.
    for (int i = 0; i < 4; i++) {
        uint64_t lo = (uint64_t)(rand() & 0xFFFF) << 16 | (rand() & 0xFFFF);
        uint64_t hi = (uint64_t)(rand() & 0xFFFF) << 16 | (rand() & 0xFFFF);
        rop->limb64[i] = (hi << 32) ^ lo;
    }
}


int main(void) {
    srand((unsigned)time(NULL));

    // Initialize GMP variables for prime P (in mpz form).
    mpz_t mpP;
    mpz_init(mpP);
    mpz_t_from_big30_9_t(mpP, &P);

    // We'll do 100 random tests.
    const int NUM_TESTS = 1000000;
    for (int i = 0; i < NUM_TESTS; i++) {
        // 1) Generate a random 256-bit x
        uint256_t x;
        random_uint256_t(&x);

        // 2) Convert x to mpz
        mpz_t mpX;
        mpz_init(mpX);
        mpz_t_from_uint256_t(mpX, &x);

        // One might check if mpX is 0 mod P; if so, invert is not defined.
        // For simplicity, let's skip the zero check or re-generate if it's zero.

        // 3) Compute the modular inverse using cpt_inv
        //    cpt_inv expects and returns a uint256_t, so we convert back and forth.
        uint256_t xInv;
        cpt_inv(&x, &xInv);

        // 4) Convert inverse back to mpz
        mpz_t mpInv;
        mpz_init(mpInv);
        mpz_t_from_uint256_t(mpInv, &xInv);

        // 5) Check that (x * xInv) mod P == 1
        mpz_t mpCheck;
        mpz_init(mpCheck);

        mpz_mul(mpCheck, mpX, mpInv);
        mpz_mod(mpCheck, mpCheck, mpP);

        // 6) Print results or confirm success
        if (mpz_cmp_ui(mpCheck, 1) != 0) {
            gmp_printf(
                "Test %d FAILED:\n"
                "  x       = %Zd\n"
                "  inv(x)  = %Zd\n"
                "  product = %Zd (mod P, should be 1)\n",
                i, mpX, mpInv, mpCheck
            );
            // **Immediately terminate** the program on failure:
            return 1;
        } else {
            gmp_printf("Test %d passed. \nx = %Zd\nv = %Zd\n", i, mpX, mpInv);
        }
        // Clean up
        mpz_clear(mpCheck);
        mpz_clear(mpInv);
        mpz_clear(mpX);
    }

    mpz_clear(mpP);
    return 0;
}

