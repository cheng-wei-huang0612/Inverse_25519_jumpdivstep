#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "big30.h"


/* update_VS_mont
 * we compute  (uu * V * 2^{-60} mod P) + (vv * S * 2^{-60} mod P) mod P
 * and         (rr * V * 2^{-60} mod P) + (ss * S * 2^{-60} mod P) mod P
 * by Montgomery Multiplication
 *
 * Step 1. 
 * vec_uuV_rrV[0:10] <- [uu0, rr0] * V[0:9]
 *
 * Step 2.
 * vec_l0 = vec_uuV_rrV[0] * vec_M mod 2^30
 *
 * Step 3.
 * vec_uuV_rrV[0:10] += vec_l0 * P[0:9]
 *
 * Step 4.
 * vec_uuV_rrV[1:11] += [uu1, rr1] * V[0:9]
 *
 * Step 5.
 * vec_l1 = vec_uuV_rrV[1] * vec_M mod 2^30
 *
 * Step 6.
 * vec_uuV_rrV[1:11] += vec_l1 * P[0:9]
 *
 *
 *
 * Step 7.
 * vec_vvS_ssS[0:10] <- [vv0, ss0] * S[0:9]
 *
 * Step 8.
 * vec_l0 = vec_vvS_ssS[0] * vec_M mod 2^30
 *
 * Step 9. 
 * vec_vvS_ssS[0:10] += vec_l0 * P[0:9]
 *
 * Step 10.
 * vec_vvS_ssS[1:11] += [vv1, ss1] * S[0:9]
 *
 * Step 11.
 * vec_l1 = vec_vvS_ssS[1] * vec_M mod 2^30
 *
 * Step 12.
 * vec_vvS_ssS[1:11] += vec_l1 * P[0:9]
 *
 *
 *
 */
void update_VS_mont(
        big30_t *V, big30_t *S, int64_t *uuvvrrss
){
    int64_t *uu = &(uuvvrrss[0]);
    int64_t *vv = &(uuvvrrss[1]);
    int64_t *rr = &(uuvvrrss[2]);
    int64_t *ss = &(uuvvrrss[3]);

    // vec_V[0..8] = broadcast each limb of V to 2 lanes
    uint32x2_t vec_V[9];
    for (int i = 0; i < 9; i++)
    {
        vec_V[i] =  vdup_n_u32(V->limb[i]);
    }

    // vec_uuV_rrV[0..10] = initialize to zero
    uint32x2_t vec_uuV_rrV[11] = {0}; 
    for (int i = 0; i < 11; i++) {
        vec_uuV_rrV[i] = vdup_n_u32(0);
    }




    




}
