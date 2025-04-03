#include <stdio.h>
#include "big30.h"
#include <arm_neon.h>


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


void double_mont(
        big30_t *resultV, big30_t *resultS,
        const big30_t *V,
        const int64_t *u, const int64_t *r
){
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

    uint32x2_t vec_uhat_rhat = (uint32x2_t){uhat, rhat};
    uint32x2_t vec_u0_r0 = (uint32x2_t){u0, r0};
    uint32x2_t vec_u1_r1 = (uint32x2_t){u1, r1};


    // Constants and buffer initialization
    // M = -P^-1 mod B (B = 2^30)
    uint32x2_t vec_M = {678152731,678152731};
    uint32x2_t vec_tmp[11] = {0}; 
    uint32x2_t vec_carry = {0};
    uint32x2_t vec_borrow = {0};
    uint64x2_t vec_prod = {0};
    uint32x2_t vec_reductionhat = {0};
    uint64x2_t vec_2p30m1 = {1073741823, 1073741823};
    uint32x2_t vec_u32_2p30m1 = {1073741823, 1073741823};

    for (int i = 0; i < 11; i++) {
        vec_tmp[i] = vdup_n_u32(0);
    }



    // Step 2: tmp = u0 * V
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        // prod += (uint64_t)(A->limb[i]) * u0;
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u0_r0 );
        // tmp[i] += prod & ((1<<30)-1);
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        //prod >>= 30;
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    // tmp[9] += prod & (((uint64_t)1<<30)-1);
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    
    //  l0 = tmp[0] * M mod 2^30
    uint32x2_t vec_l0 = vmul_u32(vec_tmp[0], vec_M);
    vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);
    

    // debug: vec_l0 = [ 678152731, 0 ]



    // tmp = (tmp + l0*P) / B 
    // tmp = tmp + l0*P
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        // prod += (uint64_t)(P.limb[i]) * l0;
        vec_prod = vmlal_u32(vec_prod, vec_P[i], vec_l0 );
        // tmp[i] += prod & ((1<<30)-1);
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        // prod >>= 30;
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    // tmp[9] += prod & (((uint64_t)1<<30)-1);
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));



    // debug: vec_tmp[0] = [ 1073741824, 0 ]





    // carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }


    // debug: vec_tmp[0] = [ 0, 0 ]


    // tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);


    
    
    
    
    // tmp += u1 * A 
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        // prod += (uint64_t)(A->limb[i]) * u1;
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u1_r1 );
        // tmp[i] += prod & ((1<<30)-1);
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        //prod >>= 30;
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    // tmp[9] += prod & (((uint64_t)1<<30)-1);
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    


    



    // carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }




    //  l1 = tmp[0] * M mod 2^30
    uint32x2_t vec_l1 = vmul_u32(vec_tmp[0], vec_M);
    vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

    

    
    
    // tmp = (tmp + l1*P) / B 
    // tmp = tmp + l1*P
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        // prod += (uint64_t)(P.limb[i]) * l1;
        vec_prod = vmlal_u32(vec_prod, vec_P[i], vec_l1 );
        // tmp[i] += prod & ((1<<30)-1);
        vec_tmp[i] = vadd_u32(vec_tmp[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        // prod >>= 30;
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    // tmp[9] += prod & (((uint64_t)1<<30)-1);
    vec_tmp[9] = vadd_u32(vec_tmp[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
    
    
    // carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }
    
    
    
    // tmp = tmp / B
    for (int i = 0; i<9; i++){
        vec_tmp[i] = vec_tmp[i+1];
    }
    vec_tmp[9] = vdup_n_u32(0);
    
    
    
    
    



    // Reduction P once:
    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    uint32x2_t vec_small_tmp = {0};
    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        // small_tmp += tmp[i];
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        // small_tmp >>= 30;
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);





    // reductionhat =  - ((32767 - small_tmp) >> 31);
    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );




    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));



    

    // carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }





    
    // result += uhat & (P-A)


    

    for (int i = 0; i < 9; i++)
    {
        // tmp[i] += (uhat & P.limb[i]);
        vec_tmp[i] = vadd_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_P[i]));
        // tmp[i] -= (uhat & (A->limb[i]));
        vec_tmp[i] = vsub_u32(vec_tmp[i] , vand_u32(vec_uhat_rhat, vec_V[i]));
    }





    for (int i = 0; i < 8; i++)
    {   
        // borrow = tmp[i] >> 31;
        vec_borrow = vshr_n_u32(vec_tmp[i],31);
        // tmp[i+1] = tmp[i+1] - borrow;
        vec_tmp[i+1] = vsub_u32(vec_tmp[i+1], vec_borrow);
        // tmp[i+0] = tmp[i+0] + (borrow << 30);
        vec_tmp[i+0] = vadd_u32(vec_tmp[i+0], vshl_n_u32(vec_borrow,30));
    }


    
    
    // Reduction P once:
    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    // uint32x2_t vec_small_tmp = {0};
    vec_small_tmp = vdup_n_u32(19ULL);
    for (int i = 0; i < 8; i++)
    {
        // small_tmp += tmp[i];
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
        // small_tmp >>= 30;
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);

    // reductionhat =  - ((32767 - small_tmp) >> 31);
    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vdup_n_u32(32767),
            vec_small_tmp
        ),
        31
    );


    vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));

    // carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_tmp[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    }





    
    for (int i = 0; i < 9; i++) {
        resultV->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 0);  // lane 0
        resultS->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 1);  // lane 1
    }


    

}