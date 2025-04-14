#include <stdint.h>
#include <stdio.h>
#include "sign_adjustment.h"
#include "big30.h"
#include <arm_neon.h>

void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V) {
    int32_t diff = ((int32_t)F->limb[0]) ^ ((1<<30) - 1);
    int32_t mask = ~((diff | -diff) >> 31);
    int32_t const_2p30m1 = 1073741823;

    int32x4_t vMask   = vdupq_n_s32(mask);           // [mask, mask, mask, mask]
    int32x4_t vNotMask = vmvnq_s32(vMask); // bitwise NOT => ~mask
    int32x4_t vConst  = vdupq_n_s32(const_2p30m1);   // [0x3FFFFFFF, 0x3FFFFFFF, 0x3FFFFFFF, 0x3FFFFFFF]
    int32x4_t vInit   = vandq_s32(vMask, vConst);



    vst1q_s32((int32_t *)&inv30->limb[0], vInit);
    vst1q_s32((int32_t *)&inv30->limb[4], vInit);
 

    inv30->limb[8] = (mask & 32767);
    // inv30 == 2^255 - 1, the borrow in the following subtraction will never happen
                          

    int32x4_t vInvA = vld1q_s32((int32_t *)&inv30->limb[0]);
    int32x4_t vVA   = vld1q_s32((int32_t *)&V->limb[0]);

    int32x4_t t1 = vandq_s32(vVA, vMask);
    int32x4_t t2 = vandq_s32(vVA, vNotMask);

    vInvA = vsubq_s32(vInvA, t1); // invA -= t1
    vInvA = vaddq_s32(vInvA, t2); // invA += t2
    vst1q_s32((int32_t *)&inv30->limb[0], vInvA);

    
    int32x4_t vInvB = vld1q_s32((int32_t *)&inv30->limb[4]);
    int32x4_t vVB   = vld1q_s32((int32_t *)&V->limb[4]);

    t1    = vandq_s32(vVB, vMask);
    t2    = vandq_s32(vVB, vNotMask);

    vInvB = vsubq_s32(vInvB, t1);
    vInvB = vaddq_s32(vInvB, t2);
    vst1q_s32((int32_t *)&inv30->limb[4], vInvB);

    // ---處理 limb[8] (scalar)---
    inv30->limb[8] -= (mask & V->limb[8]);
    inv30->limb[8] += (~mask & V->limb[8]);




    // if mask is set, minus the inv30 by 18
    // else minus the inv30 by 0
    // turns out: minus the inv30 by (18 & mask) and propagate the borrow

    uint32_t borrow = 0;
    inv30->limb[0] -= (mask & 18);
    for (int i = 0; i < 8; i++) {
        borrow = (inv30->limb[i]) >> 31;
        inv30->limb[i+1] = (inv30->limb[i+1]) - borrow;
        inv30->limb[i] = (inv30->limb[i]) + (borrow << 30);
    }
}


