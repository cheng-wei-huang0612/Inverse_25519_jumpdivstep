#include <stdint.h>
#include <stdio.h>

#include "big30.h"

extern void j_loop(int64_t *delta, int64_t *f, int64_t *g, int64_t *uuvvrrss);
extern void j_loop_final(int64_t *delta, int64_t *f, int64_t *g,
                         int64_t *uuvvrrss);

extern void i_loop(int64_t *delta, big30_t *F, big30_t *G, big30_t *V,
                   big30_t *S, int64_t *uuvvrrss);

extern void update_FG(big30_t *F, big30_t *G, int64_t *uuvvrrss);
extern void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss);
extern void final_adjustment(uint256_t *inv, big30_t *F, big30_t *V);
/*extern void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V);*/

big30_t P = {{0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
              0x3fffffff, 0x3fffffff, 0x3fffffff, 0x00007fff}};

void cpt_inv(uint256_t *x, uint256_t *inv) {
  // printf("Hello from cpt_inv5\n");

  big30_t F, G, V, S;
  // int64_t f, g;
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

  f = (int64_t)F.limb[1];
  g = (int64_t)G.limb[1];
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

  for (int i = 0; i < 9; i++) {
    // // Print every limb of F only if i == 0
    // if (i <5) {
    //     // for (int j = 0; j < 9; j++) {
    //     // printf("V.limb[%d] = %d\n", j, V.limb[j]);
    //     // }

    //     for (int k = 0; k < 4; k++) {
    //         printf("uuvvrrss[%d] = %lld\n", k, uuvvrrss[k]);
    //     }
    // }

    i_loop(&delta, &F, &G, &V, &S, uuvvrrss);
    // update_VS_mont(&V, &S, uuvvrrss);

    // f = (int64_t) F.limb[1];
    // g = (int64_t) G.limb[1];
    // f = (f << 30);
    // g = (g << 30);
    // f = f + (int64_t)F.limb[0];
    // g = g + (int64_t)G.limb[0];

    // uuvvrrss[0] = 1;
    // uuvvrrss[1] = 0;
    // uuvvrrss[2] = 0;
    // uuvvrrss[3] = 1;
    // j_loop(&delta, &f, &g, uuvvrrss);
    // j_loop(&delta, &f, &g, uuvvrrss);
    // j_loop_final(&delta, &f, &g, uuvvrrss);

    // if (i == 1) {
    //     for (int j = 0; j < 9; j++) {
    //     printf("V.limb[%d] = %d\n", j, V.limb[j]);
    //     }
    //     for (int k = 0; k < 4; k++) {
    //         printf("uuvvrrss[%d] = %lld\n", k, uuvvrrss[k]);
    //     }
    // }
  }
  
  update_FG(&F, &G, uuvvrrss);
  update_VS_mont(&V, &S, uuvvrrss);
  final_adjustment(inv, &F, &V);
}
