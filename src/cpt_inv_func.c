#include <stdint.h>
#include <stdio.h>
#include "big30.h"

#include <gmp.h>


void cpt_inv(uint256_t *x, uint256_t *inv){

    big30_t F, G, V, S;
    int64_t f, g;
    int64_t delta = 1;
    int64_t fuv, grs;
    int64_t uu, vv, rr, ss;
    int64_t u, v, r, s;
    
    big30_from_uint256(&G, x);
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

            for (int k = 0; k < 20; k++) { divstep(&delta, &fuv, &grs); }

            // u, v, r, s extraction
            extraction(&u, &v, &fuv);
            extraction(&r, &s, &grs);

            // update_fg_uuvvrrss
            if (i == 0 && j == 0) {
                printf("f = %lld\n", f);
                printf("g = %lld\n", g);
                printf("uu = %lld\n", uu);
                printf("vv = %lld\n", vv);
                printf("rr = %lld\n", rr);
                printf("ss = %lld\n", ss);
                printf("u = %lld\n", u);
                printf("v = %lld\n", v);
                printf("r = %lld\n", r);
                int64_t* pointer_s = &s;
                printf("*pointer_s: %llx\n", *(int64_t*)pointer_s);
                printf("s = %lld\n", s);
            }
            inner_update(&f, &g, &uu, &vv, &rr, &ss, &u, &v, &r, &s);
            if (i == 0 && j == 0) {
                printf("after inner update\n");
                printf("f = %lld\n", f);
                printf("g = %lld\n", g);
                printf("uu = %lld\n", uu);
                printf("vv = %lld\n", vv);
                printf("rr = %lld\n", rr);
                printf("ss = %lld\n", ss);
            }
        }

        // Update FG

        update_FG(&F, &G, &uu, &vv, &rr, &ss);
        
        // Update VS
        update_VS_mont(&V, &S, &uu, &vv, &rr, &ss);

    }
    
    // sign_adjustment
    // V = sign(F) * V
    big30_t inv30;
    
    sign_adjustment(&inv30, &F, &V);

    uint256_from_big30(inv, &inv30);
}



