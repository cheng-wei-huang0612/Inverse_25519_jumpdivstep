#include<stdint.h>
//#include<stdio.h>
#include"mybig30.h"
#include<gmp.h>


void cpt_inv(uint256_t *x, uint256_t *inv){

    big30_9 F, G, V, S;
    int64_t f, g;
    int64_t delta = 1;
    int64_t fuv, grs;
    int64_t uu, vv, rr, ss;
    int64_t uu_new, vv_new, rr_new, ss_new;
        
    int64_t u, v, r, s;
    int64_t g0_and_1;
    int64_t cond, c_mask, n_mask;
    int64_t neg_fuv;
    int64_t fuv_new;
    int64_t grs_new;
    int64_t delta_swapper;
    
    uint256_to_big30_9(&G, x);
    for (size_t i = 0; i < 9; i++) {
        F.limb[i] = P.limb[i];
        V.limb[i] = 0;
        S.limb[i] = 0;
    }

    S.limb[0] = 1;



    for (int i = 0; i < (10); i++) {

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

        for (int j = 0; j < 3; j++) {
            fuv = (f & 0xFFFFF) - ( (int64_t) 1 << 41 );
            grs = (g & 0xFFFFF) - ( (int64_t) 1 << 62 );

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

            // update_fg_uuvvrrss
            {
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
            }
            
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
    

    
    uint256_t_from_mpz_t(inv, mpinv);

}


