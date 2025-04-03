#include <stdio.h>
#include "big30.h"
#include <arm_neon.h>

void print_u32x4(uint32x4_t vec) {
    uint32_t values[4];
    vst1q_u32(values, vec);  // 將 vec 的 4 個 lane 存到陣列
    printf("[ %u, %u, %u, %u ]\n",
           values[0], values[1], values[2], values[3]);
}
void print_u64x2(uint64x2_t vec) {
    uint64_t values[2];
    vst1q_u64(values, vec);  // 將 vec 的 4 個 lane 存到陣列
    printf("[ %llu, %llu ]\n",
           values[0], values[1]);
}
void print_u32x2(uint32x2_t vec) {
    uint32_t values[2];
    vst1_u32(values, vec);  // 將 vec 的 4 個 lane 存到陣列
    printf("[ %u, %u ]\n",
           values[0], values[1]);
}


void double_product(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V,
        const int64_t *u, const int64_t *r
){
    printf("the double_product function is executed!\n");

    // P in neon

    uint32x2_t vec_P[9];
    for (int i = 0; i < 9; i++)
    {
        vec_P[i] =  vdup_n_u32(P.limb[i]);
    }

    uint32x2_t vec_V[9];
    for (int i = 0; i < 9; i++)
    {
        vec_V[i] =  vdup_n_u32(V->limb[i]);
    }



    // Put the data into neon registers
    int64_t UU = *u;
    int64_t RR = *r;

    uint32_t u0 = (uint32_t)(UU & ((1ULL << 30) - 1));
    uint32_t r0 = (uint32_t)(RR & ((1ULL << 30) - 1));

    uint32_t u1 = (uint32_t)((UU >> 30) & ((1ULL << 30) - 1));
    uint32_t r1 = (uint32_t)((RR >> 30) & ((1ULL << 30) - 1));

    uint32_t uhat = (UU >> 63);
    uint32_t rhat = (RR >> 63);

    uint32x2_t vec_uhat_rhat = {uhat, rhat};

    uint32x4_t vec_u0_r0_v0_s0 = vdupq_n_u32(0);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(u0, vec_u0_r0_v0_s0, 0);
    vec_u0_r0_v0_s0 = vsetq_lane_u32(r0, vec_u0_r0_v0_s0, 1);
    
    uint32x4_t vec_u1_r1_v1_s1 = vdupq_n_u32(0);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(u1, vec_u1_r1_v1_s1, 0);
    vec_u1_r1_v1_s1 = vsetq_lane_u32(r1, vec_u1_r1_v1_s1, 1);



//     uint32x4_t vec_V0_V1_S0_S1 = {
//         V->limb[0],
//         V->limb[1],
//         S->limb[0],
//         S->limb[1],
//     };

//     // vec_V2_V3_S2_S3 = [V2, V3, S2, S3]
//     uint32x4_t vec_V2_V3_S2_S3 = {
//         V->limb[2],
//         V->limb[3],
//         S->limb[2],
//         S->limb[3],
//     };

//     // vec_V4_V5_S4_S5 = [V4, V5, S4, S5]
//     uint32x4_t vec_V4_V5_S4_S5 = {
//         V->limb[4],
//         V->limb[5],
//         S->limb[4],
//         S->limb[5],
//     };

//     // vec_V6_V7_S6_S7 = [V6, V7, S6, S7]
//     uint32x4_t vec_V6_V7_S6_S7 = {
//         V->limb[6],
//         V->limb[7],
//         S->limb[6],
//         S->limb[7],
//     };

//     // 第 9 個 limb (index = 8) 只能手動補，成為 [V8, 0, S8, 0]
//     uint32x4_t vec_V8_0_S8_0 = {
//         V->limb[8],
//         0,
//         S->limb[8],
//         0
//     };

//     //printf("%d\n",vgetq_lane_u32(vec_V0_V1_S0_S1,0));

    
//     // vec_V0_V1_S0_S1 = [V0, V1, S0, S1]
//     // vec_V2_V3_S2_S3 = [V2, V3, S2, S3]
//     // vec_V4_V5_S4_S5 = [V4, V5, S4, S5]
//     // vec_V6_V7_S6_S7 = [V6, V7, S6, S7]
//     // vec_V8_0_S8_0 = [V8, 0, S8, 0]

//     // Constants and buffer initialization
//     // M = -P^-1 mod B (B = 2^30)
    
//     uint64x2_t vec_M = vdupq_n_u64((uint64_t)678152731);
//     uint64x2_t vec_tmp[11] = {0};
//     uint64x2_t vec_carry = {0};
//     uint64x2_t vec_borrow = {0};
//     uint64x2_t vec_prod = {0};
//     uint64x2_t vec_prod2 = {0};
//     uint64x2_t vec_reductionhat = {0};
//     uint64x2_t vec_u64_2p30m1;
//     uint32x2_t vec_u32_2p30m1;
//     vec_u64_2p30m1 = vdupq_n_u64((uint64_t)1073741823);
//     vec_u32_2p30m1 = vdup_n_u32((uint32_t)1073741823);
//     uint32x2_t vec_l0_0;
//     uint32x2_t vec_l0_1;


    
//     vec_prod = vdupq_n_u64(0);
//     vec_prod2 = vdupq_n_u64(0);
//     uint32x2_t vec_u0_r0 = vget_low_u32(vec_u0_r0_v0_s0);
//     uint32x2_t vec_v0_s0 = vget_high_u32(vec_u0_r0_v0_s0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V0_V1_S0_S1, 0);
//     vec_l0_0 = vmovn_u64(
//         vandq_u64(
//             vmull_u32(
//                 vmovn_u64(vec_prod), 
//                 vmovn_u64(vec_M)
//             ),
//             vec_u64_2p30m1
//         )
//     );
    
    
//     vec_prod2 = vmlal_laneq_u32(vec_prod2, vec_v0_s0, vec_V0_V1_S0_S1, 2);
//     vec_l0_1 = vmovn_u64(
//         vandq_u64(
//             vmull_u32(
//                 vmovn_u64(vec_prod2), 
//                 vmovn_u64(vec_M)
//             ),
//             vec_u64_2p30m1
//         )
//     );


//     vec_prod = vaddq_u64(vec_prod, vec_prod2);

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V0_V1_S0_S1, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V0_V1_S0_S1, 3);
//     vec_tmp[1] = vaddq_u64(vec_tmp[1], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V2_V3_S2_S3, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V2_V3_S2_S3, 2);
//     vec_tmp[2] = vaddq_u64(vec_tmp[2], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V2_V3_S2_S3, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V2_V3_S2_S3, 3);
//     vec_tmp[3] = vaddq_u64(vec_tmp[3], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V4_V5_S4_S5, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V4_V5_S4_S5, 2);
//     vec_tmp[4] = vaddq_u64(vec_tmp[4], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V4_V5_S4_S5, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V4_V5_S4_S5, 3);
//     vec_tmp[5] = vaddq_u64(vec_tmp[5], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V6_V7_S6_S7, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V6_V7_S6_S7, 2);
//     vec_tmp[6] = vaddq_u64(vec_tmp[6], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V6_V7_S6_S7, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V6_V7_S6_S7, 3);
//     vec_tmp[7] = vaddq_u64(vec_tmp[7], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u0_r0, vec_V8_0_S8_0, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v0_s0, vec_V8_0_S8_0, 2);
//     vec_tmp[8] = vaddq_u64(vec_tmp[8], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);
//     vec_tmp[9] = vaddq_u64(vec_tmp[9], vandq_u64(vec_prod, vec_u64_2p30m1));

    
//     uint32x2_t vec_l0 = vadd_u32(vec_l0_0, vec_l0_1);

//     // tmp = (tmp + l0 * P) 
//     vec_prod = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {   
//         vec_prod = vmlal_u32(vec_prod, vec_l0, vec_P[i]);
//         vec_tmp[i] = vaddq_u64(vec_tmp[i], vandq_u64(vec_prod, vec_u64_2p30m1));
//         vec_prod = vshrq_n_u64(vec_prod, 30);
//     }
//     vec_tmp[9] = vaddq_u64(vec_tmp[9], vandq_u64(vec_prod, vec_u64_2p30m1));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }

//     // tmp = tmp / B
//     for (int i = 0; i<9; i++){
//         vec_tmp[i] = vec_tmp[i+1];
//     }
//     vec_tmp[9] = vdupq_n_u64(0);


//     // tmp += u1 * A
//     vec_prod = vdupq_n_u64(0);
//     vec_prod2 = vdupq_n_u64(0);
//     uint32x2_t vec_u1_r1 = vget_low_u32(vec_u1_r1_v1_s1);
//     uint32x2_t vec_v1_s1 = vget_high_u32(vec_u1_r1_v1_s1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V0_V1_S0_S1, 0);
//     uint32x2_t vec_l1_0 = vmovn_u64(
//         vandq_u64(
//             vmull_u32(
//                 vmovn_u64(vec_prod), 
//                 vmovn_u64(vec_M)
//             ),
//             vec_u64_2p30m1
//         )
//     );


//     vec_prod2 = vmlal_laneq_u32(vec_prod2, vec_v1_s1, vec_V0_V1_S0_S1, 2);
//     uint32x2_t vec_l1_1 = vmovn_u64(
//         vandq_u64(
//             vmull_u32(
//                 vmovn_u64(vec_prod2), 
//                 vmovn_u64(vec_M)
//             ),
//             vec_u64_2p30m1
//         )
//     );

//     vec_prod = vaddq_u64(vec_prod, vec_prod2);
//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V0_V1_S0_S1, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V0_V1_S0_S1, 3);
//     vec_tmp[1] = vaddq_u64(vec_tmp[1], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V2_V3_S2_S3, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V2_V3_S2_S3, 2);
//     vec_tmp[2] = vaddq_u64(vec_tmp[2], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V2_V3_S2_S3, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V2_V3_S2_S3, 3);
//     vec_tmp[3] = vaddq_u64(vec_tmp[3], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V4_V5_S4_S5, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V4_V5_S4_S5, 2);
//     vec_tmp[4] = vaddq_u64(vec_tmp[4], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V4_V5_S4_S5, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V4_V5_S4_S5, 3);
//     vec_tmp[5] = vaddq_u64(vec_tmp[5], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V6_V7_S6_S7, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V6_V7_S6_S7, 2);
//     vec_tmp[6] = vaddq_u64(vec_tmp[6], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V6_V7_S6_S7, 1);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V6_V7_S6_S7, 3);
//     vec_tmp[7] = vaddq_u64(vec_tmp[7], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);

//     vec_prod = vmlal_laneq_u32(vec_prod, vec_u1_r1, vec_V8_0_S8_0, 0);
//     vec_prod = vmlal_laneq_u32(vec_prod, vec_v1_s1, vec_V8_0_S8_0, 2);
//     vec_tmp[8] = vaddq_u64(vec_tmp[8], vandq_u64(vec_prod, vec_u64_2p30m1));
//     vec_prod = vshrq_n_u64(vec_prod, 30);
//     vec_tmp[9] = vaddq_u64(vec_tmp[9], vandq_u64(vec_prod, vec_u64_2p30m1));

    
    
//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }
    
//     uint32x2_t vec_l1 = vadd_u32(vec_l1_0, vec_l1_1);

//     // tmp = (tmp + l1 * P) 
//     vec_prod = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {   
//         vec_prod = vmlal_u32(vec_prod, vec_l1, vec_P[i]);
//         vec_tmp[i] = vaddq_u64(vec_tmp[i], vandq_u64(vec_prod, vec_u64_2p30m1));
//         vec_prod = vshrq_n_u64(vec_prod, 30);
//     }
//     vec_tmp[9] = vaddq_u64(vec_tmp[9], vandq_u64(vec_prod, vec_u64_2p30m1));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }

//     // tmp = tmp / B
//     for (int i = 0; i<9; i++){
//         vec_tmp[i] = vec_tmp[i+1];
//     }
//     vec_tmp[9] = vdupq_n_u64(0);




//     // Reduction P once:
//     // See if tmp[0:9] >= P;
//     // tmp >= P iff tmp + 19 >= 2^255;

//     uint64x2_t vec_small_tmp;
//     vec_small_tmp = vdupq_n_u64(19ULL);
//     for (int i = 0; i < 8; i++)
//     {
//         // small_tmp += tmp[i];
//         vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[i]);
//         // small_tmp >>= 30;
//         vec_small_tmp = vshrq_n_u64(vec_small_tmp, 30);
//     }
//     vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[8]);

//     // reductionhat =  - ((32767 - small_tmp) >> 31);
//     vec_reductionhat = (uint64x2_t)vshrq_n_s64(
//         (int64x2_t)vsubq_u64(
//             vdupq_n_u64(32767ULL),
//             vec_small_tmp
//         ),
//         63
//     );

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_reductionhat, vdupq_n_u64(19ULL)));
//     vec_tmp[8] = vsubq_u64(vec_tmp[8], vandq_u64(vec_reductionhat, vdupq_n_u64(32768ULL)));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }


//     // Reduction P once:
//     // See if tmp[0:9] >= P;
//     // tmp >= P iff tmp + 19 >= 2^255;

//     // uint64x2_t vec_small_tmp;
//     vec_small_tmp = vdupq_n_u64(19ULL);
//     for (int i = 0; i < 8; i++)
//     {
//         // small_tmp += tmp[i];
//         vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[i]);
//         // small_tmp >>= 30;
//         vec_small_tmp = vshrq_n_u64(vec_small_tmp, 30);
//     }
//     vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[8]);

//     // reductionhat =  - ((32767 - small_tmp) >> 31);
//     vec_reductionhat = (uint64x2_t)vshrq_n_s64(
//         (int64x2_t)vsubq_u64(
//             vdupq_n_u64(32767ULL),
//             vec_small_tmp
//         ),
//         63
//     );

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_reductionhat, vdupq_n_u64(19ULL)));
//     vec_tmp[8] = vsubq_u64(vec_tmp[8], vandq_u64(vec_reductionhat, vdupq_n_u64(32768ULL)));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }

    
//     // Reduction P once:
//     // See if tmp[0:9] >= P;
//     // tmp >= P iff tmp + 19 >= 2^255;

//     // uint64x2_t vec_small_tmp;
//     vec_small_tmp = vdupq_n_u64(19ULL);
//     for (int i = 0; i < 8; i++)
//     {
//         // small_tmp += tmp[i];
//         vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[i]);
//         // small_tmp >>= 30;
//         vec_small_tmp = vshrq_n_u64(vec_small_tmp, 30);
//     }
//     vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[8]);

//     // reductionhat =  - ((32767 - small_tmp) >> 31);
//     vec_reductionhat = (uint64x2_t)vshrq_n_s64(
//         (int64x2_t)vsubq_u64(
//             vdupq_n_u64(32767ULL),
//             vec_small_tmp
//         ),
//         63
//     );

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_reductionhat, vdupq_n_u64(19ULL)));
//     vec_tmp[8] = vsubq_u64(vec_tmp[8], vandq_u64(vec_reductionhat, vdupq_n_u64(32768ULL)));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }

    

//     // After reudcion three times, we perform
//     // result += [uhat & (P-A), rhat & (P-A)]
//     // result += [vhat & (P-A), shat & (P-A)]

//     for (int i = 0; i < 9; i++)
//     {
//         // tmp[i] += (uhat & P.limb[i]);
//         vec_tmp[i] = vaddq_u64(
//             vec_tmp[i],
//             vmovl_u32(
//                 vand_u32(
//                     vec_uhat_rhat,
//                     vec_P[i]
//                 )
//             )
//         );


//         // tmp[i] -= (uhat & (A->limb[i]));
//         vec_tmp[i] = vsubq_u64(
//             vec_tmp[i],
//             vmovl_u32(
//                 vand_u32(
//                     vec_uhat_rhat,
//                     vec_V[i]
//                 )
//             )
//         );

//     }
    
//     vec_borrow = vdupq_n_u64(0);
//     for (int i = 0; i < 8; i++)
//     {   
//         // borrow = tmp[i] >> 31;
//         vec_borrow = vshrq_n_u64(vec_tmp[i], 31);

//         // tmp[i+1] = tmp[i+1] - borrow;
//         vec_tmp[i+1] = vsubq_u64(vec_tmp[i+1], vec_borrow);

//         // tmp[i+0] = tmp[i+0] + (borrow << 30);
//         vec_tmp[i] = vaddq_u64( vshlq_n_u64(vec_borrow, 30), vec_tmp[i]);
//     }


//     for (int i = 0; i < 9; i++)
//     {
//         vec_tmp[i] = vaddq_u64(
//             vec_tmp[i],
//             vmovl_u32(
//                 vand_u32(
//                     vec_vhat_shat,
//                     vec_P[i]
//                 )
//             )
//         );


//         vec_tmp[i] = vsubq_u64(
//             vec_tmp[i],
//             vmovl_u32(
//                 vand_u32(
//                     vec_vhat_shat,
//                     vec_S[i]
//                 )
//             )
//         );

//     }
    
//     vec_borrow = vdupq_n_u64(0);
//     for (int i = 0; i < 8; i++)
//     {   
//         // borrow = tmp[i] >> 31;
//         vec_borrow = vshrq_n_u64(vec_tmp[i], 31);

//         // tmp[i+1] = tmp[i+1] - borrow;
//         vec_tmp[i+1] = vsubq_u64(vec_tmp[i+1], vec_borrow);

//         // tmp[i+0] = tmp[i+0] + (borrow << 30);
//         vec_tmp[i] = vaddq_u64( vshlq_n_u64(vec_borrow, 30), vec_tmp[i]);
//     }


// // Reduction P once:
//     // See if tmp[0:9] >= P;
//     // tmp >= P iff tmp + 19 >= 2^255;

//     // uint64x2_t vec_small_tmp;
//     vec_small_tmp = vdupq_n_u64(19ULL);
//     for (int i = 0; i < 8; i++)
//     {
//         // small_tmp += tmp[i];
//         vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[i]);
//         // small_tmp >>= 30;
//         vec_small_tmp = vshrq_n_u64(vec_small_tmp, 30);
//     }
//     vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[8]);

//     // reductionhat =  - ((32767 - small_tmp) >> 31);
//     vec_reductionhat = (uint64x2_t)vshrq_n_s64(
//         (int64x2_t)vsubq_u64(
//             vdupq_n_u64(32767ULL),
//             vec_small_tmp
//         ),
//         63
//     );

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_reductionhat, vdupq_n_u64(19ULL)));
//     vec_tmp[8] = vsubq_u64(vec_tmp[8], vandq_u64(vec_reductionhat, vdupq_n_u64(32768ULL)));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }
// // Reduction P once:
//     // See if tmp[0:9] >= P;
//     // tmp >= P iff tmp + 19 >= 2^255;

//     // uint64x2_t vec_small_tmp;
//     vec_small_tmp = vdupq_n_u64(19ULL);
//     for (int i = 0; i < 8; i++)
//     {
//         // small_tmp += tmp[i];
//         vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[i]);
//         // small_tmp >>= 30;
//         vec_small_tmp = vshrq_n_u64(vec_small_tmp, 30);
//     }
//     vec_small_tmp = vaddq_u64(vec_small_tmp, vec_tmp[8]);

//     // reductionhat =  - ((32767 - small_tmp) >> 31);
//     vec_reductionhat = (uint64x2_t)vshrq_n_s64(
//         (int64x2_t)vsubq_u64(
//             vdupq_n_u64(32767ULL),
//             vec_small_tmp
//         ),
//         63
//     );

//     vec_tmp[0] = vaddq_u64(vec_tmp[0], vandq_u64(vec_reductionhat, vdupq_n_u64(19ULL)));
//     vec_tmp[8] = vsubq_u64(vec_tmp[8], vandq_u64(vec_reductionhat, vdupq_n_u64(32768ULL)));

//     // carry propagation
//     vec_carry = vdupq_n_u64(0);
//     for (int i = 0; i < 9; i++) {
//         vec_carry = vshrq_n_u64(vec_tmp[i], 30);
//         vec_tmp[i] = vandq_u64(vec_tmp[i], vec_u64_2p30m1);
//         vec_tmp[i+1] = vaddq_u64(vec_tmp[i+1], vec_carry);
//     }


//     for (int i = 0; i < 9; i++) {
//         resultV->limb[i] = (uint32_t)vgetq_lane_u64(vec_tmp[i], 0);  // lane 0
//         resultS->limb[i] = (uint32_t)vgetq_lane_u64(vec_tmp[i], 1);  // lane 1
//     }
    
    printf("the linear_comb function is over!\n");
    

}