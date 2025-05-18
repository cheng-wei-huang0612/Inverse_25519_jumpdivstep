

#include "big30.h"
extern void j_loop(int64_t *delta, int64_t *f, int64_t *g, int64_t *uuvvrrss);
extern void j_loop_final(int64_t *delta, int64_t *f, int64_t *g, int64_t *uuvvrrss);

extern void update_FG(big30_t *F, big30_t *G, int64_t *uuvvrrss);
extern void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss);


void i_loop(
    int64_t *delta,
    big30_t *F,
    big30_t *G,
    big30_t *V,
    big30_t *S,
    int64_t *uuvvrrss
) {
    int64_t f, g;

    
    update_FG(F, G, uuvvrrss);
    update_VS_mont(V, S, uuvvrrss);


    f = (int64_t) F->limb[1];
    g = (int64_t) G->limb[1];
    f = (f << 30);
    g = (g << 30);
    f = f + (int64_t)F->limb[0];
    g = g + (int64_t)G->limb[0];

    uuvvrrss[0] = 1;
    uuvvrrss[1] = 0;
    uuvvrrss[2] = 0;
    uuvvrrss[3] = 1;

    j_loop(delta, &f, &g, uuvvrrss);
    j_loop(delta, &f, &g, uuvvrrss);
    j_loop_final(delta, &f, &g, uuvvrrss);

}