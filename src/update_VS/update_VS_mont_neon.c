#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "big30.h"




void update_VS_mont(
        big30_t *V, big30_t *S, int64_t *uuvvrrss
){
    int64_t *u = &(uuvvrrss[0]);
    int64_t *v = &(uuvvrrss[1]);
    int64_t *r = &(uuvvrrss[2]);
    int64_t *s = &(uuvvrrss[3]);


    // Step [1]: Initialization 
    // vec_P[0..8] = broadcast each limb of P to 2 lanes
    /*uint32x2_t vec_P[9];*/
    /*for (int i = 0; i < 9; i++)*/
    /*{*/
    /*    vec_P[i] =  vdup_n_u32(P.limb[i]);*/
    /*}*/

    // vec_V[0..8] = broadcast each limb of V to 2 lanes
    uint32x2_t vec_V[9];
    for (int i = 0; i < 9; i++)
    {
        vec_V[i] =  vdup_n_u32(V->limb[i]);
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
    uint32x2_t vec_u32_2p30m19 = {1073741805, 1073741805};
    uint32x2_t vec_u32_2p15m1 = {32767, 32767};



    // Step [2]: Decompose inputs (u, r) into limb forms
    uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
    uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
    uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};
    

    // Step [3]: tmp += u0 * V
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u0_r0 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    
    // Step [4]: l0 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    uint32x2_t vec_l0 = vmul_u32(vec_tmp[0], vec_M);
    vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);

    // i = 0
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);


    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }

    // i = 8
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    vec_tmp[8] = vadd_u32(vec_tmp[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    // Step [5]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }



    // Step [6]: tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);


    
    
    
    
    // Step [7]: tmp += u1 * V 
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u1_r1 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    



    // Step [8]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }




    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    uint32x2_t vec_l1 = vmul_u32(vec_tmp[0], vec_M);
    vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    
    // i = 0
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    vec_tmp[0] = vadd_u32(vec_tmp[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);


    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }

    // i = 8
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    vec_tmp[8] = vadd_u32(vec_tmp[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
    
    // Step [10]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }
    
    
    
    // Step [11]: tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);
    

    // Step [12]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    uint32x2_t vec_small_tmp = {0};
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



    

    // Step [13]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }



    // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)
    vec_tmp[0] = vadd_u32(vec_tmp[0] , vand_u32(vec_uhat_rhat, vec_u32_2p30m19));
    vec_tmp[0] = vsub_u32(vec_tmp[0] , vand_u32(vec_uhat_rhat, vec_V[0]));
    for (int i = 0 + 1; i < (9 - 1); i++)
    {
        vec_tmp[i] = vadd_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_u32_2p30m1));
        vec_tmp[i] = vsub_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_V[i]));
    }
    vec_tmp[8] = vadd_u32(vec_tmp[8] , vand_u32(vec_uhat_rhat, vec_u32_2p15m1));
    vec_tmp[8] = vsub_u32(vec_tmp[8] , vand_u32(vec_uhat_rhat, vec_V[8]));


    // Step [15]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        // borrow = tmp[i] >> 31;
        vec_borrow = vshr_n_u32(vec_tmp[i],31);
        // tmp[i+1] = tmp[i+1] - borrow;
        vec_tmp[i+1] = vsub_u32(vec_tmp[i+1], vec_borrow);
        // tmp[i+0] = tmp[i+0] + (borrow << 30);
        vec_tmp[i+0] = vadd_u32(vec_tmp[i+0], vshl_n_u32(vec_borrow,30));
    }


    
    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19ULL);
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


    // Step [17]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }



    // So fat, vec_tmp[0:9] stores [ u*V*R-1 mod P, r*V*R-1 mod P ]


    // Step [1]: Initialization 

    // vec_V[0..8] = broadcast each limb of V to 2 lanes
    uint32x2_t vec_S[9];
    for (int i = 0; i < 9; i++)
    {
        vec_S[i] =  vdup_n_u32(S->limb[i]);
    }

    // vec_tmp[0..10] = initialize to zero
    uint32x2_t vec_tmp2[11] = {0}; 
    for (int i = 0; i < 11; i++) {
        vec_tmp2[i] = vdup_n_u32(0);
    }

    // vec_M = [M, M]
    // M = -P^-1 mod B (B = 2^30)
    /*uint32x2_t vec_M = {678152731,678152731};*/


    // Constants, buffer, and mask
    /*uint32x2_t vec_carry = {0};*/
    /*uint32x2_t vec_borrow = {0};*/
    /*uint64x2_t vec_prod = {0};*/
    /*uint32x2_t vec_reductionhat = {0};*/
    /*uint64x2_t vec_2p30m1 = {1073741823, 1073741823};*/
    /*uint32x2_t vec_u32_2p30m1 = {1073741823, 1073741823};*/



    // Step [2]: Decompose inputs (v, s) into limb formers
    uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
    uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
    uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};


    // Step [3]: tmp += v0 * S, s0 * S
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v0_s0 );
        vec_tmp2[i] = vadd_u32(vec_tmp2[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp2[9] = vadd_u32(vec_tmp2[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    
    // Step [4]: l0 = tmp2[0] * M mod 2^30
    //            and tmp2 += l0 * P
    vec_l0 = vmul_u32(vec_tmp2[0], vec_M);
    vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    vec_tmp2[0] = vadd_u32(vec_tmp2[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
        vec_tmp2[i] = vadd_u32(vec_tmp2[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    vec_tmp2[8] = vadd_u32(vec_tmp2[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_tmp2[9] = vadd_u32(vec_tmp2[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    // Step [5]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_tmp2[i], 30);
        vec_tmp2[i] = vand_u32(vec_tmp2[i], vec_u32_2p30m1);
        vec_tmp2[i+1] = vadd_u32(vec_tmp2[i+1], vec_carry);
    }



    // Step [6]: tmp2 = tmp2 / B
    for (int i = 0; i<9; i++){
        vec_tmp2[i] = vec_tmp2[i+1];
    }
    vec_tmp2[9] = vdup_n_u32(0);


    
    
    
    
    // Step [7]: tmp2 += u1 * S
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v1_s1 );
        vec_tmp2[i] = vadd_u32(vec_tmp2[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_tmp2[9] = vadd_u32(vec_tmp2[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    



    // Step [8]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp2[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp2[i] = vand_u32(vec_tmp2[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp2[i+1] = vadd_u32(vec_tmp2[i+1], vec_carry);
    }




    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    vec_l1 = vmul_u32(vec_tmp2[0], vec_M);
    vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    vec_tmp2[0] = vadd_u32(vec_tmp2[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
        vec_tmp2[i] = vadd_u32(vec_tmp2[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    vec_tmp2[8] = vadd_u32(vec_tmp2[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_tmp2[9] = vadd_u32(vec_tmp2[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
    
    
    // Step [10]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp2[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp2[i] = vand_u32(vec_tmp2[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp2[i+1] = vadd_u32(vec_tmp2[i+1], vec_carry);
    }
    
    
    
    // Step [11]: tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp2[i] = vec_tmp2[i+1];
    }
    vec_tmp2[9] = vdup_n_u32(0);
    

    // Step [12]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp2[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp2[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp2[0] = vadd_u32(vec_tmp2[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp2[8] = vsub_u32(vec_tmp2[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));



    

    // Step [13]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        vec_carry = vshr_n_u32(vec_tmp2[i], 30);
        vec_tmp2[i] = vand_u32(vec_tmp2[i], vec_u32_2p30m1);
        vec_tmp2[i+1] = vadd_u32(vec_tmp2[i+1], vec_carry);
    }



    // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)

    vec_tmp2[0] = vadd_u32(vec_tmp2[0] , vand_u32(vec_vhat_shat, vec_u32_2p30m19));
    vec_tmp2[0] = vsub_u32(vec_tmp2[0] , vand_u32(vec_vhat_shat, vec_S[0]));
    for (int i = 0 + 1; i < (9 - 1); i++)
    {
        vec_tmp2[i] = vadd_u32(vec_tmp2[i] , vand_u32(vec_vhat_shat, vec_u32_2p30m1));
        vec_tmp2[i] = vsub_u32(vec_tmp2[i] , vand_u32(vec_vhat_shat, vec_S[i]));
    }
    vec_tmp2[8] = vadd_u32(vec_tmp2[8] , vand_u32(vec_vhat_shat, vec_u32_2p15m1));
    vec_tmp2[8] = vsub_u32(vec_tmp2[8] , vand_u32(vec_vhat_shat, vec_S[8]));


    // Step [15]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        // borrow = tmp[i] >> 31;
        vec_borrow = vshr_n_u32(vec_tmp2[i],31);
        // tmp[i+1] = tmp[i+1] - borrow;
        vec_tmp2[i+1] = vsub_u32(vec_tmp2[i+1], vec_borrow);
        // tmp[i+0] = tmp[i+0] + (borrow << 30);
        vec_tmp2[i+0] = vadd_u32(vec_tmp2[i+0], vshl_n_u32(vec_borrow,30));
    }


    
    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19ULL);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp2[i]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp2[8]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );

    vec_tmp2[0] = vadd_u32(vec_tmp2[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp2[8] = vsub_u32(vec_tmp2[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));


    // Step [17]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp2[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp2[i] = vand_u32(vec_tmp2[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp2[i+1] = vadd_u32(vec_tmp2[i+1], vec_carry);
    }

    // Step [18]: 
    
    for (int i = 0; i<9; i++) {
        vec_tmp[i] = vadd_u32(vec_tmp[i], vec_tmp2[i]);
    }
    vec_carry = vdup_n_u32(0);

    for (int i = 0; i<9; i++) {
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }
    

    // final reduction
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
        V->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 0);  // lane 0
        S->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 1);  // lane 1
    }








    /*printf("the linear_comb function is over!\n");*/
    

}


