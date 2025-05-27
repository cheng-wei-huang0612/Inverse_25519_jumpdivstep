#include <stdint.h>
#include <stdio.h>
#include "big30.h"

extern void j_loop(int64_t *delta, int64_t *f, int64_t *g, int64_t *uuvvrrss);
extern void j_loop_final(int64_t *delta, int64_t *f, int64_t *g, int64_t *uuvvrrss);

extern void i_loop(int64_t *delta, big30_t *F, big30_t *G, big30_t *V, big30_t *S, int64_t *uuvvrrss);

// extern void update_FG(big30_t *F, big30_t *G, int64_t *uuvvrrss);
// extern void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss);
extern void final_update(uint256_t *inv, big30_t *F, big30_t *G, big30_t *V, big30_t *S, int64_t *uuvvrrss);
//extern void final_adjustment(uint256_t *inv, big30_t *F, big30_t *V);







big30_t P = {{
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff}
};




void cpt_inv(uint256_t *x, uint256_t *inv) {
    //printf("Hello from cpt_inv5\n");

    big30_t F, G, V, S;
    //int64_t f, g;
    int64_t delta = 0;
    // int64_t fuv, grs;
    
    big30_from_uint256(&G, x);



    for (size_t i = 0; i < 9; i++) {
        F.limb[i] = P.limb[i];
        V.limb[i] = 0;
        S.limb[i] = 0;
    }
    S.limb[0] = 1;





    int64_t f, g;
    int64_t uuvvrrss[4];



    
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

    j_loop(&delta, &f, &g, uuvvrrss);
    j_loop(&delta, &f, &g, uuvvrrss);
    j_loop_final(&delta, &f, &g, uuvvrrss);

    i_loop(&delta, &F, &G, &V, &S, uuvvrrss);


    // for (int k = 0; k < 4; k++) {
    //     printf("uuvvrrss[%d] = %lld\n", k, uuvvrrss[k]);
    // }
    
    
    final_update(inv, &F, &G, &V, &S, uuvvrrss);
    
    // for (int j = 0; j < 4; j++) {
    // printf("V.limb[%d] = %llu\n", j, inv->limb64[j]);
    // }

}
