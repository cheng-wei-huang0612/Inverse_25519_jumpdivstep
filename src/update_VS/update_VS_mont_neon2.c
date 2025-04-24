#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "big30.h"

/*-------------------------------------------------------------------------
 *  update_VS_mont  ──  (uu·V + vv·S , rr·V + ss·S) · R⁻¹  (R = 2⁶⁰) mod P
 *  lane-0 存 V-路，lane-1 存 S-路
 *------------------------------------------------------------------------*/
void update_VS_mont(big30_t *V, big30_t *S, int64_t *k/*{u,v,r,s}*/)
{
    /*---------- 1. 便利常數 ------------------------------------------------*/
    const uint64_t LIMB_MASK   = (1ULL<<30) - 1;            // 2^30-1
    const uint32x2_t vec_mask30 = vdup_n_u32((1u<<30)-1);   // 0x3fffffff
    const uint32x2_t vec_mask15 = vdup_n_u32((1u<<15)-1);   // 0x00007fff
    const uint32x2_t vec_p30m1  = vec_mask30;               // 2^30-1
    const uint32x2_t vec_p30m19 = vdup_n_u32((1u<<30)-19);  // 2^30-19
    const uint32x2_t vec_p15m1  = vec_mask15;               // 2^15-1
    const uint32x2_t vec_M      = vdup_n_u32(678152731u);   // −P⁻¹ mod 2³⁰
    const uint64x2_t vec_wideMask = vdupq_n_u64((1ULL<<30)-1);

    /*---------- 2. 把 V,S limb 廣播到向量 ---------------------------------*/
    uint32x2_t vec_V[9], vec_S[9];
    for (int i = 0; i < 9; ++i) {
        vec_V[i] = vdup_n_u32(V->limb[i]);
        vec_S[i] = vdup_n_u32(S->limb[i]);
    }

    /*---------- 3. 解析 (u,v,r,s) → 30-bit limb ---------------------------*/
    uint32x2_t coeff0[2];     // lane0 = low-30(u/v) , lane1 = low-30(r/s)
    uint32x2_t coeff1[2];     // lane0 = high-30(u/v), lane1 = high-30(r/s)
    uint32x2_t coeffHat[2];   // lane0 = u>>63/v>>63, lane1 = r>>63/s>>63

    coeff0[0]  = (uint32x2_t){ (uint32_t)(k[0] & LIMB_MASK),
                               (uint32_t)(k[2] & LIMB_MASK) };
    coeff1[0]  = (uint32x2_t){ (uint32_t)((k[0]>>30) & LIMB_MASK),
                               (uint32_t)((k[2]>>30) & LIMB_MASK) };
    coeffHat[0]= (uint32x2_t){ (uint32_t)(k[0]>>63), (uint32_t)(k[2]>>63) };

    coeff0[1]  = (uint32x2_t){ (uint32_t)(k[1] & LIMB_MASK),
                               (uint32_t)(k[3] & LIMB_MASK) };
    coeff1[1]  = (uint32x2_t){ (uint32_t)((k[1]>>30) & LIMB_MASK),
                               (uint32_t)((k[3]>>30) & LIMB_MASK) };
    coeffHat[1]= (uint32x2_t){ (uint32_t)(k[1]>>63), (uint32_t)(k[3]>>63) };

    /*---------- 4. 兩條路 (pass = 0: V 路, 1: S 路) -----------------------*/
    uint32x2_t tmp[2][11];          // 各路 10 limb (+1 carry) 暫存
    for (int pass = 0; pass < 2; ++pass) {

        /*--- 4-A. 清零 ----------------------------------------------------*/
        for (int i = 0; i < 11; ++i) tmp[pass][i] = vdup_n_u32(0);

        uint32x2_t *vec_X   = (pass==0)? vec_V : vec_S;   // 指向 V 或 S
        uint32x2_t  c0      = coeff0[pass];
        uint32x2_t  c1      = coeff1[pass];
        uint32x2_t  cHat    = coeffHat[pass];

        /*--- 4-B. tmp += c0 * X ------------------------------------------*/
        uint64x2_t acc = vdupq_n_u64(0);
        for (int i = 0; i < 9; ++i) {
            acc        = vmlal_u32(acc, vec_X[i], c0);
            tmp[pass][i] = vadd_u32(tmp[pass][i],
                                     vmovn_u64(vandq_u64(acc, vec_wideMask)));
            acc        = vshrq_n_u64(acc, 30);
        }
        tmp[pass][9] = vadd_u32(tmp[pass][9],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));

        /*--- 4-C. Montgomery reduce 1 (l0) --------------------------------*/
        uint32x2_t l = vmul_u32(tmp[pass][0], vec_M);
        l            = vand_u32(l, vec_mask30);

        acc = vdupq_n_u64(0);
        /* i = 0 */
        acc          = vmlal_u32(acc, vec_p30m19, l);
        tmp[pass][0] = vadd_u32(tmp[pass][0],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));
        acc          = vshrq_n_u64(acc,30);
        /* i = 1…7 */
        for (int i = 1; i < 8; ++i) {
            acc          = vmlal_u32(acc, vec_p30m1, l);
            tmp[pass][i] = vadd_u32(tmp[pass][i],
                                     vmovn_u64(vandq_u64(acc, vec_wideMask)));
            acc          = vshrq_n_u64(acc,30);
        }
        /* i = 8 */
        acc          = vmlal_u32(acc, vec_p15m1, l);
        tmp[pass][8] = vadd_u32(tmp[pass][8],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));
        acc          = vshrq_n_u64(acc,30);
        tmp[pass][9] = vadd_u32(tmp[pass][9],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));

        /*--- 4-D. carry propagate #1 --------------------------------------*/
        uint32x2_t carry = vdup_n_u32(0);
        for (int i = 0; i < 9; ++i) {
            carry        = vshr_n_u32(tmp[pass][i],30);
            tmp[pass][i] = vand_u32(tmp[pass][i], vec_mask30);
            tmp[pass][i+1] = vadd_u32(tmp[pass][i+1], carry);
        }

        /*--- 4-E. tmp /= B (右移 limb) ------------------------------------*/
        for (int i = 0; i < 9; ++i) tmp[pass][i] = tmp[pass][i+1];
        tmp[pass][9] = vdup_n_u32(0);

        /*--- 4-F. tmp += c1 * X ------------------------------------------*/
        acc = vdupq_n_u64(0);
        for (int i = 0; i < 9; ++i) {
            acc          = vmlal_u32(acc, vec_X[i], c1);
            tmp[pass][i] = vadd_u32(tmp[pass][i],
                                     vmovn_u64(vandq_u64(acc, vec_wideMask)));
            acc          = vshrq_n_u64(acc,30);
        }
        tmp[pass][9] = vadd_u32(tmp[pass][9],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));

        /*--- 4-G. carry propagate #2 --------------------------------------*/
        carry = vdup_n_u32(0);
        for (int i = 0; i < 9; ++i) {
            carry        = vshr_n_u32(tmp[pass][i],30);
            tmp[pass][i] = vand_u32(tmp[pass][i], vec_mask30);
            tmp[pass][i+1] = vadd_u32(tmp[pass][i+1], carry);
        }

        /*--- 4-H. Montgomery reduce 2 (l1) --------------------------------*/
        l = vmul_u32(tmp[pass][0], vec_M);
        l = vand_u32(l, vec_mask30);

        acc = vdupq_n_u64(0);
        /* i = 0 */
        acc          = vmlal_u32(acc, vec_p30m19, l);
        tmp[pass][0] = vadd_u32(tmp[pass][0],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));
        acc          = vshrq_n_u64(acc,30);
        /* i = 1…7 */
        for (int i = 1; i < 8; ++i) {
            acc          = vmlal_u32(acc, vec_p30m1, l);
            tmp[pass][i] = vadd_u32(tmp[pass][i],
                                     vmovn_u64(vandq_u64(acc, vec_wideMask)));
            acc          = vshrq_n_u64(acc,30);
        }
        /* i = 8 */
        acc          = vmlal_u32(acc, vec_p15m1, l);
        tmp[pass][8] = vadd_u32(tmp[pass][8],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));
        acc          = vshrq_n_u64(acc,30);
        tmp[pass][9] = vadd_u32(tmp[pass][9],
                                 vmovn_u64(vandq_u64(acc, vec_wideMask)));

        /*--- 4-I. carry propagate #3 --------------------------------------*/
        carry = vdup_n_u32(0);
        for (int i = 0; i < 9; ++i) {
            carry        = vshr_n_u32(tmp[pass][i],30);
            tmp[pass][i] = vand_u32(tmp[pass][i], vec_mask30);
            tmp[pass][i+1] = vadd_u32(tmp[pass][i+1], carry);
        }

        /*--- 4-J. 一次 P-reduce（DJB trick）------------------------------*/
        uint32x2_t hi = vdup_n_u32(19);
        for (int i = 0; i < 8; ++i) {
            hi = vadd_u32(hi, tmp[pass][i]);
            hi = vshr_n_u32(hi,30);
        }
        hi = vadd_u32(hi, tmp[pass][8]);

        uint32x2_t redHat =
            (uint32x2_t)vshr_n_s32((int32x2_t)vsub_u32(vdup_n_u32(32767), hi),31);

        tmp[pass][0] = vadd_u32(tmp[pass][0],
                                 vand_u32(redHat, vdup_n_u32(19)));
        tmp[pass][8] = vsub_u32(tmp[pass][8],
                                 vand_u32(redHat, vdup_n_u32(32768)));

        /*--- 4-K. carry propagate #4 --------------------------------------*/
        carry = vdup_n_u32(0);
        for (int i = 0; i < 9; ++i) {
            carry        = vshr_n_u32(tmp[pass][i],30);
            tmp[pass][i] = vand_u32(tmp[pass][i], vec_mask30);
            tmp[pass][i+1] = vadd_u32(tmp[pass][i+1], carry);
        }

        /*--- 4-L. tmp += cHat * (P − X)  (conditional subtract) -----------*/
        tmp[pass][0] = vadd_u32(tmp[pass][0],
                                 vand_u32(cHat, vec_p30m19));
        tmp[pass][0] = vsub_u32(tmp[pass][0],
                                 vand_u32(cHat, vec_X[0]));
        for (int i = 1; i < 8; ++i) {
            tmp[pass][i] = vadd_u32(tmp[pass][i],
                                     vand_u32(cHat, vec_p30m1));
            tmp[pass][i] = vsub_u32(tmp[pass][i],
                                     vand_u32(cHat, vec_X[i]));
        }
        tmp[pass][8] = vadd_u32(tmp[pass][8],
                                 vand_u32(cHat, vec_p15m1));
        tmp[pass][8] = vsub_u32(tmp[pass][8],
                                 vand_u32(cHat, vec_X[8]));

        /*--- 4-M. borrow propagate ---------------------------------------*/
        for (int i = 0; i < 8; ++i) {
            uint32x2_t borrow = vshr_n_u32(tmp[pass][i],31);
            tmp[pass][i+1]    = vsub_u32(tmp[pass][i+1], borrow);
            tmp[pass][i]      = vadd_u32(tmp[pass][i],
                                          vshl_n_u32(borrow,30));
        }

        /*--- 4-N. 再做一次 P-reduce & carry（和上面一模一樣）-----------*/
        hi = vdup_n_u32(19);
        for (int i = 0; i < 8; ++i) {
            hi = vadd_u32(hi, tmp[pass][i]);
            hi = vshr_n_u32(hi,30);
        }
        hi = vadd_u32(hi, tmp[pass][8]);

        redHat =
            (uint32x2_t)vshr_n_s32((int32x2_t)vsub_u32(vdup_n_u32(32767), hi),31);

        tmp[pass][0] = vadd_u32(tmp[pass][0],
                                 vand_u32(redHat, vdup_n_u32(19)));
        tmp[pass][8] = vsub_u32(tmp[pass][8],
                                 vand_u32(redHat, vdup_n_u32(32768)));

        carry = vdup_n_u32(0);
        for (int i = 0; i < 9; ++i) {
            carry        = vshr_n_u32(tmp[pass][i],30);
            tmp[pass][i] = vand_u32(tmp[pass][i], vec_mask30);
            tmp[pass][i+1] = vadd_u32(tmp[pass][i+1], carry);
        }
    } /*-- end for pass ----------------------------------------------------*/

    /*---------- 5. 兩路相加 → lane0=V, lane1=S ---------------------------*/
    uint32x2_t out[10];
    for (int i = 0; i < 10; ++i) {
        out[i] = vadd_u32(tmp[0][i], tmp[1][i]);
    }

    /* 最終一次 carry & P-reduce（與上面套路相同，省略重複註解） */
    uint32x2_t carry = vdup_n_u32(0);
    for (int i = 0; i < 9; ++i) {
        carry  = vshr_n_u32(out[i],30);
        out[i] = vand_u32(out[i], vec_mask30);
        out[i+1] = vadd_u32(out[i+1], carry);
    }

    uint32x2_t hi = vdup_n_u32(19);
    for (int i = 0; i < 8; ++i) {
        hi = vadd_u32(hi, out[i]);
        hi = vshr_n_u32(hi,30);
    }
    hi = vadd_u32(hi, out[8]);

    uint32x2_t redHat =
        (uint32x2_t)vshr_n_s32((int32x2_t)vsub_u32(vdup_n_u32(32767), hi),31);

    out[0] = vadd_u32(out[0], vand_u32(redHat, vdup_n_u32(19)));
    out[8] = vsub_u32(out[8], vand_u32(redHat, vdup_n_u32(32768)));

    carry = vdup_n_u32(0);
    for (int i = 0; i < 9; ++i) {
        carry  = vshr_n_u32(out[i],30);
        out[i] = vand_u32(out[i], vec_mask30);
        out[i+1] = vadd_u32(out[i+1], carry);
    }

    /*---------- 6. 寫回 V,S ----------------------------------------------*/
    for (int i = 0; i < 9; ++i) {
        V->limb[i] = vget_lane_u32(out[i],0);   // lane0 = V
        S->limb[i] = vget_lane_u32(out[i],1);   // lane1 = S
    }
}

