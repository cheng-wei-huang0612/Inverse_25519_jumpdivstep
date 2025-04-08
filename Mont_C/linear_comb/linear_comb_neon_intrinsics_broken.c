#include <stdio.h>
#include "big30.h"
#include <gmp.h>
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


void print_vec_tmp(uint32x2_t *vec_tmp, int length) {
    for (int i = 0; i < length; i++) {
        printf("i = %d  ",i);
        print_u32x2(vec_tmp[i]);
    }
}

void print_vec_tmp_as_mpz(uint32x2_t *vec_tmp) {
    big30_t left, right;
    mpz_t mpleft, mpright;
    mpz_inits(mpleft, mpright, NULL);
    
    for (int i = 0; i < 9; i++) {
        left.limb[i] = vget_lane_u32(vec_tmp[i],0);
        right.limb[i] = vget_lane_u32(vec_tmp[i],1);
    }

    mpz_from_big30(mpleft, &left);
    mpz_from_big30(mpright, &right);

    gmp_printf("lane 0 = %Zd\n", mpleft);
    gmp_printf("lane 1 = %Zd\n", mpright);


}



void linear_mont_neon_intrinsics(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V, const big30_t *S,
        const int64_t *u, const int64_t *v, const int64_t *r, const int64_t *s
){
    printf("the linear_comb function is executed!\n");

    // Step [1]: Initialization
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

    uint32x2_t vec_S[9];
    for (int i = 0; i < 9; i++)
    {
        vec_S[i] =  vdup_n_u32(S->limb[i]);
    }
    // vec_tmp[0..10] = initialize to zero
    uint32x2_t vec_tmp[11] = {0}; 
    for (int i = 0; i < 11; i++) {
        vec_tmp[i] = vdup_n_u32(0);
    }



    // vec_M = [M, M]
    // M = -P^-1 mod B (B = 2^30)
    uint32x2_t vec_M = {678152731,678152731};


    // Constants, buffer, and mask
    uint32x2_t vec_carry = {0};
    uint32x2_t vec_borrow = {0};
    uint64x2_t vec_prod = {0};
    uint32x2_t vec_reductionhat = {0};
    uint64x2_t vec_2p30m1 = {1073741823, 1073741823};
    uint32x2_t vec_u32_2p30m1 = {1073741823, 1073741823};

    uint32x2_t vec_small_tmp = {0};


    // Step [2]: 
    // Decompose inputs (u, r) into limbs
    // Decompose inputs (v, s) into limbs
    
    uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
    uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
    uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};

    uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
    uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
    uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};


    /*uint32x4_t vec_u0_r0_v0_s0 = vdupq_n_u32(0);*/
    /*vec_u0_r0_v0_s0 = vsetq_lane_u32(u0, vec_u0_r0_v0_s0, 0);*/
    /*vec_u0_r0_v0_s0 = vsetq_lane_u32(r0, vec_u0_r0_v0_s0, 1);*/
    /*vec_u0_r0_v0_s0 = vsetq_lane_u32(v0, vec_u0_r0_v0_s0, 2);*/
    /*vec_u0_r0_v0_s0 = vsetq_lane_u32(s0, vec_u0_r0_v0_s0, 3);*/
    /**/
    /*uint32x4_t vec_u1_r1_v1_s1 = vdupq_n_u32(0);*/
    /*vec_u1_r1_v1_s1 = vsetq_lane_u32(u1, vec_u1_r1_v1_s1, 0);*/
    /*vec_u1_r1_v1_s1 = vsetq_lane_u32(r1, vec_u1_r1_v1_s1, 1);*/
    /*vec_u1_r1_v1_s1 = vsetq_lane_u32(v1, vec_u1_r1_v1_s1, 2);*/
    /*vec_u1_r1_v1_s1 = vsetq_lane_u32(s1, vec_u1_r1_v1_s1, 3);*/


    /**/
    /*// vec_V0_V1_S0_S1 = [V0, V1, S0, S1]*/
    /*uint32x4_t vec_V0_V1_S0_S1 = {*/
    /*    V->limb[0],*/
    /*    V->limb[1],*/
    /*    S->limb[0],*/
    /*    S->limb[1],*/
    /*};*/
    /**/
    /*// vec_V2_V3_S2_S3 = [V2, V3, S2, S3]*/
    /*uint32x4_t vec_V2_V3_S2_S3 = {*/
    /*    V->limb[2],*/
    /*    V->limb[3],*/
    /*    S->limb[2],*/
    /*    S->limb[3],*/
    /*};*/
    /**/
    /*// vec_V4_V5_S4_S5 = [V4, V5, S4, S5]*/
    /*uint32x4_t vec_V4_V5_S4_S5 = {*/
    /*    V->limb[4],*/
    /*    V->limb[5],*/
    /*    S->limb[4],*/
    /*    S->limb[5],*/
    /*};*/
    /**/
    /*// vec_V6_V7_S6_S7 = [V6, V7, S6, S7]*/
    /*uint32x4_t vec_V6_V7_S6_S7 = {*/
    /*    V->limb[6],*/
    /*    V->limb[7],*/
    /*    S->limb[6],*/
    /*    S->limb[7],*/
    /*};*/
    /**/
    /*// 第 9 個 limb (index = 8) 只能手動補，成為 [V8, 0, S8, 0]*/
    /*uint32x4_t vec_V8_0_S8_0 = {*/
    /*    V->limb[8],*/
    /*    0,*/
    /*    S->limb[8],*/
    /*    0*/
    /*};*/
    /**/
    /*//printf("%d\n",vgetq_lane_u32(vec_V0_V1_S0_S1,0));*/
    /**/
    /**/
    /*// vec_V0_V1_S0_S1 = [V0, V1, S0, S1]*/
    /*// vec_V2_V3_S2_S3 = [V2, V3, S2, S3]*/
    /*// vec_V4_V5_S4_S5 = [V4, V5, S4, S5]*/
    /*// vec_V6_V7_S6_S7 = [V6, V7, S6, S7]*/
    /*// vec_V8_0_S8_0 = [V8, 0, S8, 0]*/


    uint32x2_t vec_l0_0 = {0};
    
    // Step [3]: tmp += [u0 * V, r0 * V]
    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_V[0], vec_u0_r0 );
    vec_l0_0 = vmul_u32(vmovn_u64(vec_prod), vec_M);
    vec_l0_0 = vand_u32(vec_l0_0, vec_u32_2p30m1);
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 1; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u0_r0 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    print_vec_tmp(vec_tmp,11);

    printf("l0_0 = ");
    print_u32x2(vec_l0_0);



    uint32x2_t vec_l0_1 = {0};
    
    // Step [4]: tmp += [v0 * S, s0 * S]
    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_S[0], vec_v0_s0 );
    vec_l0_1 = vmul_u32(vmovn_u64(vec_prod), vec_M);
    vec_l0_1 = vand_u32(vec_l0_1, vec_u32_2p30m1);
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 1; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v0_s0 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    print_vec_tmp(vec_tmp,11);
    printf("l0_1 = ");
    print_u32x2(vec_l0_1);

    // Step [optional]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }

    // Step [5]: Compute Montgomery reduction (l0 * P)
    uint32x2_t vec_l0 = vadd_u32(vec_l0_0, vec_l0_1);

    printf("l0 = ");
    print_u32x2(vec_l0);
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_P[i], vec_l0 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));



    // Step [6]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }
    printf("after step [6]\n");
    print_vec_tmp(vec_tmp,11);

    // Step [7]: tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);


    printf("after step [7]\n");
    print_vec_tmp(vec_tmp,11);
    // Step [8]: Compute second Montgomery multiplication step (u1 * V)
    //           Extract the l1_0 in the first intermediate product

    uint32x2_t vec_l1_0 = {0};
    uint32x2_t vec_l1_1 = {0};

    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_V[0], vec_u1_r1 );
    vec_l1_0 = vmul_u32(vmovn_u64(vec_prod), vec_M);
    vec_l1_0 = vand_u32(vec_l1_0, vec_u32_2p30m1);
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 1; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u1_r1 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    printf("after step [8]\n");
    print_vec_tmp(vec_tmp,11);

    // Step [9]: tmp += [v1 * S, s1 * S]
    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_S[0], vec_v1_s1 );
    vec_l1_1 = vmul_u32(vmovn_u64(vec_prod), vec_M);
    vec_l1_1 = vand_u32(vec_l1_1, vec_u32_2p30m1);
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 1; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v1_s1 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    printf("after step [9]\n");
    print_vec_tmp(vec_tmp,11);
    // Step [10]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }

    // Step [11]: Compute Montgomery reduction (l1 * P)
    uint32x2_t vec_l1 = vadd_u32(vec_l1_0, vec_l1_1);
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_P[i], vec_l1 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    printf("after step [10]\n");
    print_vec_tmp(vec_tmp,11);


    // Step [12]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }


    // Step [13]: tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);

    
    // Step [14]: reduction P
    
    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }


    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }



    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }

    // Step [16]: Conditional subtraction of V based on (uhat, rhat):
    for (int i = 0; i < 9; i++)
    {
        vec_tmp[i] = vadd_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_P[i]));
        vec_tmp[i] = vsub_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_V[i]));
    }


    // Step [17]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        vec_borrow = vshr_n_u32(vec_tmp[i],31);
        vec_tmp[i+1] = vsub_u32(vec_tmp[i+1], vec_borrow);
        vec_tmp[i+0] = vadd_u32(vec_tmp[i+0], vshl_n_u32(vec_borrow,30));
    }


    // Step [18]: Conditional subtraction of S based on (vhat, shat):
    for (int i = 0; i < 9; i++)
    {
        vec_tmp[i] = vadd_u32(vec_tmp[i] , vand_u32(vec_vhat_shat, vec_P[i]));
        vec_tmp[i] = vsub_u32(vec_tmp[i] , vand_u32(vec_vhat_shat, vec_S[i]));
    }


    // Step [19]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        vec_borrow = vshr_n_u32(vec_tmp[i],31);
        vec_tmp[i+1] = vsub_u32(vec_tmp[i+1], vec_borrow);
        vec_tmp[i+0] = vadd_u32(vec_tmp[i+0], vshl_n_u32(vec_borrow,30));
    }


    // Step [20]: final reduction twice

    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }

    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }


    // Step [str]
    for (int i = 0; i < 9; i++) {
        resultV->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 0);  // lane 0
        resultS->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 1);  // lane 1
    }



    printf("the linear_comb function is over!\n");
    

}
