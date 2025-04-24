#include <stdint.h>
#include <stdio.h>
// #include "big30.h"
#include <gmp.h>

void divstep(int64_t *delta, int64_t *fuv, int64_t *grs) {
    int64_t g0_and_1 = (*grs) & 1;  // 0 or 1 
    
    int64_t cond = (~((*delta - 1) >> 63)) & (g0_and_1);

    int64_t c_mask = -cond;
    int64_t n_mask = ~c_mask;


    int64_t fuv_new =     (n_mask & (*fuv)) ^ (c_mask & (*grs));
    int64_t grs_new = (c_mask & (-(*fuv))) ^ (n_mask & (*grs));

    *fuv = fuv_new;
    *grs = grs_new;


    int64_t delta_swapper = (*delta) ^ (-(*delta));
    *delta ^= (c_mask & delta_swapper);

    
    *grs = (((-g0_and_1) & (*fuv)) + (*grs) ) >> 1;
    *delta += + 2;
}

