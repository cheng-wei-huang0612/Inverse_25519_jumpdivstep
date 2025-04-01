#include <stdio.h>
#include "big30.h"
#include <arm_neon.h>


void linear_comb(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
){
    printf("the linear_comb function is executed!\n");

    // Put the data into neon registers
    uint64_t UU = (uint64_t)*u;
    uint64_t VV = (uint64_t)*v;
    uint64_t RR = (uint64_t)*r;
    uint64_t SS = (uint64_t)*s;

    uint32_t u0 = (uint32_t)(UU & ((1ULL << 30) - 1));
    uint32_t v0 = (uint32_t)(VV & ((1ULL << 30) - 1));
    uint32_t r0 = (uint32_t)(RR & ((1ULL << 30) - 1));
    uint32_t s0 = (uint32_t)(SS & ((1ULL << 30) - 1));

    uint32_t u1 = (uint32_t)((UU >> 30) & ((1ULL << 32) - 1));
    uint32_t v1 = (uint32_t)((VV >> 30) & ((1ULL << 32) - 1));
    uint32_t r1 = (uint32_t)((RR >> 30) & ((1ULL << 32) - 1));
    uint32_t s1 = (uint32_t)((SS >> 30) & ((1ULL << 32) - 1));

    uint32x4_t vec_u0_r0_v0_s0 = vdupq_n_u32(0);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(u0, vec_u0_r0_v0_s0, 0);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(r0, vec_u0_r0_v0_s0, 1);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(v0, vec_u0_r0_v0_s0, 2);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(s0, vec_u0_r0_v0_s0, 3);
    
    uint32x4_t vec_u1_r1_v1_s1 = vdupq_n_u32(0);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(u1, vec_u1_r1_v1_s1, 0);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(r1, vec_u1_r1_v1_s1, 1);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(v1, vec_u1_r1_v1_s1, 2);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(s1, vec_u1_r1_v1_s1, 3);

    //vec_uhat_rhat_vhat_shat

    // vec_u0_r0_v0_s0 = [u0, r0, v0, s0]
    // vec_u1_r1_v1_s1 = [u1, r1, v1, s1]

    uint32x4_t v0 = vld1q_u32(&V->limb[0]);
    uint32x4_t v1 = vld1q_u32(&V->limb[4]);
    uint32x4_t v2 = vld1q_u32(&S->limb[0]);
    uint32x4_t v3 = vld1q_u32(&S->limb[4]);

    // vec_V0_V1_S0_S1 = [V0, V1, S0, S1]
    uint32x4_t vec_V0_V1_S0_S1 = vzip1q_u32(v0, v2);

    // vec_V2_V3_S2_S3 = [V2, V3, S2, S3]
    uint32x4_t vec_V2_V3_S2_S3 = vzip2q_u32(v0, v2);

    // vec_V4_V5_S4_S5 = [V4, V5, S4, S5]
    uint32x4_t vec_V4_V5_S4_S5 = vzip1q_u32(v1, v3);

    // vec_V6_V7_S6_S7 = [V6, V7, S6, S7]
    uint32x4_t vec_V6_V7_S6_S7 = vzip2q_u32(v1, v3);

    // 第 9 個 limb (index = 8) 只能手動補，成為 [V8, 0, S8, 0]
    uint32x4_t vec_V8_0_S8_0 = {
        V->limb[8],
        0,
        S->limb[8],
        0
    };

    // vec_V0_V1_S0_S1 = [V0, V1, S0, S1]
    // vec_V2_V3_S2_S3 = [V2, V3, S2, S3]
    // vec_V4_V5_S4_S5 = [V4, V5, S4, S5]
    // vec_V6_V7_S6_S7 = [V6, V7, S6, S7]
    // vec_V8_0_S8_0 = [V8, 0, S8, 0]

    

    
    










}
