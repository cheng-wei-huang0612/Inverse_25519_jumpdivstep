#include <stdint.h>
#include <stdio.h>
#include "big30.h"
#include "divstep.h"
#include "uv_extraction.h"
#include "update_FG.h"
#include "update_VS_mont.h"
#include "inner_update.h"
#include "sign_adjustment.h"
#include <gmp.h>



void cpt_inv(uint256_t *x, uint256_t *inv){

    big30_t F, G, V, S;
    int64_t f, g;
    int64_t delta = 1;
    int64_t fuv, grs;
    int64_t uuvvrrss[4];
    int64_t uvrs[4];
    
    big30_from_uint256(&G, x);



    for (size_t i = 0; i < 9; i++) {
        F.limb[i] = P.limb[i];
        V.limb[i] = 0;
        S.limb[i] = 0;
    }
    S.limb[0] = 1;



    for (int i = 0; i < 10; i++) {

        f = (int64_t) F.limb[1];
        g = (int64_t) G.limb[1];
        f = (f << 30);
        g = (g << 30);
        f = f + (int64_t)F.limb[0];
        g = g + (int64_t)G.limb[0];
        
        uuvvrrss[0] = 1;
        uuvvrrss[1] = 0;
        uuvvrrss[2] = 0;
        uuvvrrss[3] = 1;

        for (int j = 0; j < 3; j++) {
            fuv = (f & 0xFFFFF) - ( (int64_t) 1 << 41 );
            grs = (g & 0xFFFFF) - ( (int64_t) 1 << 62 );

            for (int k = 0; k < 20; k++) { divstep(&delta, &fuv, &grs); }

            // u, v, r, s extraction
            extraction(uvrs, &fuv, &grs);

            // update_fg_uuvvrrss
            inner_update(&f, &g, uuvvrrss, uvrs);

        }

        // Update FG
        update_FG(&F, &G, uuvvrrss);
        
        // Update VS
        update_VS_mont(&V, &S, uuvvrrss);
    }
    
    // sign_adjustment
    // V = sign(F) * V
    big30_t inv30;
    
    sign_adjustment(&inv30, &F, &V);

    uint256_from_big30(inv, &inv30);
}
