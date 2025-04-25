#include <stdint.h>
#include <stdio.h>
#include "big30.h"
/*#include "divstep.h"*/
/*#include "uv_extraction.h"*/
/*#include "update_FG.h"*/
/*#include "update_VS_mont.h"*/
/*#include "inner_update.h"*/
/*#include "sign_adjustment.h"*/
#include <gmp.h>


extern void divstep(int64_t *delta, int64_t *fuv, int64_t *grs);
extern void inner_update(int64_t *f, int64_t *g, int64_t *uuvvrrss, int64_t *uvrs );
extern void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V);
extern void extraction(int64_t *uvrs, int64_t *fuv, int64_t *grs);
extern void update_FG(big30_t *F, big30_t *G, int64_t *uuvvrrss);
extern void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss);


big30_t P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};




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

            for (int k = 0; k < 20; k++) { 
                /*if (i == 0 && j == 0) { printf("grs = %lld\n",grs);}*/
                divstep(&delta, &fuv, &grs); 
                /*if (i == 0 && j == 0) { printf("grs = %lld\n",grs);}*/
            }
            /*divstepx20(&delta, &fuv, &grs); */



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
