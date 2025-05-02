#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "big30.h"


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
void print_u32x4(uint32x4_t vec) {
    uint32_t values[4];
    vst1q_u32(values, vec);  // 將 vec 的 4 個 lane 存到陣列
    printf("[ %u, %u, %u, %u ]\n",
           values[0], values[1], values[2], values[3]);
}
void print_vec_tmp(uint32x2_t *vec_tmp, int length) {
    for (int i = 0; i < length; i++) {
        printf("i = %d  ",i);
        print_u32x2(vec_tmp[i]);
    }
}
//
// //
// // void print_vec_tmp_as_mpz(uint32x2_t *vec_tmp) {
// //     big30_t left, right;
// //     mpz_t mpleft, mpright;
// //     mpz_inits(mpleft, mpright, NULL);
// //
// //     for (int i = 0; i < 9; i++) {
// //         left.limb[i] = vget_lane_u32(vec_tmp[i],0);
// //         right.limb[i] = vget_lane_u32(vec_tmp[i],1);
// //     }
// //
// //     mpz_from_big30(mpleft, &left);
// //     mpz_from_big30(mpright, &right);
// //
// //     gmp_printf("lane 0 = %Zd\n", mpleft);
// //     gmp_printf("lane 1 = %Zd\n", mpright);
// //
// //
// // }
// //

void update_VS_mont(
        big30_t *V, big30_t *S, int64_t *uuvvrrss
){
    int64_t *u = &(uuvvrrss[0]);
    int64_t *v = &(uuvvrrss[1]);
    int64_t *r = &(uuvvrrss[2]);
    int64_t *s = &(uuvvrrss[3]);


    // vec_M = [M, M]
    // M = -P^-1 mod B (B = 2^30)
    uint32x2_t vec_M = {678152731, 678152731};


    // Constants, buffer, and mask
    uint32x2_t vec_carry = {0};
    uint32x2_t vec_borrow = {0};
    uint64x2_t vec_prod = {0};
    uint32x2_t vec_reductionhat = {0};
    uint64x2_t vec_2p30m1 = {1073741823, 1073741823};
    uint32x2_t vec_u32_2p30m1 = {1073741823, 1073741823};
    uint32x2_t vec_u32_2p30m19 = {1073741805, 1073741805};
    uint32x2_t vec_u32_2p15m1 = {32767, 32767};




/* -------------  C 端變數（與原程式相同型別） ------------- */
uint32x2_t vec_u0_r0, vec_u1_r1, vec_uhat_rhat;
uint32x2_t vec_v0_s0, vec_v1_s1, vec_vhat_shat;

uint32x4_t vec_uu0_rr0_vv0_ss0;
uint32x4_t vec_uu1_rr1_vv1_ss1;
uint32x4_t vec_uuhat_rrhat_vvhat_sshat;
uint32x4_t vec_uuhat_rrhat;
uint32x4_t vec_vvhat_sshat;
    // uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
    // uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
    // uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};
    //
    // uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
    // uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
    // uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};

/* -------------  單一 inline-asm，顯式點名暫存器 ---------- */
__asm__ volatile(
    /* === (1) 讀 uu·vv·rr·ss 到 x0-x3 ======================== */
    "ldp     x0,  x1,  [%[ptr]]        \n"   /* x0=uu  x1=vv          */
    "ldp     x2,  x3,  [%[ptr], #16]   \n"   /* x2=rr  x3=ss          */

    /* === (2) 抽出 30-bit limbs 與 bit-63 hats ================ */
    /* -- uu ---------------------------------------------------- */
    "ubfx    x4,  x0, #0,  #30         \n"   /* u0  -> x4 */
    "ubfx    x0,  x0, #30, #32         \n"   /* u1  -> x6 */

    /* -- vv ---------------------------------------------------- */
    "ubfx    x5, x1, #0,  #30         \n"   /* v0  -> x10 */
    "ubfx    x1, x1, #30, #32         \n"   /* v1  -> x12 */

    /* -- rr ---------------------------------------------------- */
    "ubfx    x6,  x2, #0,  #30         \n"   /* r0  -> x5 */
    "ubfx    x2,  x2, #30, #32         \n"   /* r1  -> x7 */

    /* -- ss ---------------------------------------------------- */
    "ubfx    x7, x3, #0,  #30         \n"   /* s0  -> x11 */
    "ubfx    x3, x3, #30, #32         \n"   /* s1  -> x13 */


    "ins     v5.s[0],  w4              \n"
    "ins     v5.s[1],  w6              \n"
    "ins     v5.s[2],  w5              \n"
    "ins     v5.s[3],  w7              \n"

    "ins     v6.s[0],  w0              \n"
    "ins     v6.s[1],  w2              \n"
    "ins     v6.s[2],  w1              \n"
    "ins     v6.s[3],  w3              \n"
    "sshr    v7.4s, v6.4s, #31        \n"

    "mov     x0, #1\n"
    "lsl     x0, x0, #30\n"
    "sub     x0, x0, #1\n"
    "ins     v10.s[0], w0\n"
    "ins     v10.s[1], w0\n"
    "ins     v10.s[2], w0\n"
    "ins     v10.s[3], w0\n"
    "and     v6.16b, v6.16b, v10.16b\n"


    "zip1    v8.4s, v7.4s, v7.4s       \n"
    "zip2    v9.4s, v7.4s, v7.4s       \n"

    // v5 = vec_uu0_rr0_vv0_ss0
    // v6 = vec_uu1_rr1_vv1_ss1
    // v7 = vec_uuhat_rrhat_vvhat_sshat
    // v8 = vec_uuhat_rrhat
    // v9 = vec_vvhat_sshat
    "umov    w0, v5.s[0]\n"
    "umov    w1, v5.s[1]\n"
    "stp     w0, w1, [%[p_vec_uu0_rr0_vv0_ss0]] \n"
    "umov    w0, v5.s[2]\n"
    "umov    w1, v5.s[3]\n"
    "stp     w0, w1, [%[p_vec_uu0_rr0_vv0_ss0], #8] \n"
    "umov    w0, v6.s[0]\n"
    "umov    w1, v6.s[1]\n"
    "stp     w0, w1, [%[p_vec_uu1_rr1_vv1_ss1]] \n"
    "umov    w0, v6.s[2]\n"
    "umov    w1, v6.s[3]\n"
    "stp     w0, w1, [%[p_vec_uu1_rr1_vv1_ss1], #8] \n"
    "umov    w0, v7.s[0]\n"
    "umov    w1, v7.s[1]\n"
    "stp     w0, w1, [%[p_vec_uuhat_rrhat_vvhat_sshat]] \n"
    "umov    w0, v7.s[2]\n"
    "umov    w1, v7.s[3]\n"
    "stp     w0, w1, [%[p_vec_uuhat_rrhat_vvhat_sshat], #8] \n"
    "umov    w0, v8.s[0]\n"
    "umov    w1, v8.s[1]\n"
    "stp     w0, w1, [%[p_vec_uuhat_rrhat]] \n"
    "umov    w0, v8.s[2]\n"
    "umov    w1, v8.s[3]\n"
    "stp     w0, w1, [%[p_vec_uuhat_rrhat], #8] \n"
    "umov    w0, v9.s[0]\n"
    "umov    w1, v9.s[1]\n"
    "stp     w0, w1, [%[p_vec_vvhat_sshat]] \n"
    "umov    w0, v9.s[2]\n"
    "umov    w1, v9.s[3]\n"
    "stp     w0, w1, [%[p_vec_vvhat_sshat], #8] \n"

    "umov w0, v5.s[0]\n"
    "umov w1, v5.s[1]\n"
    "stp w0, w1, [%[out_u0r0]]\n"
    "umov w0, v5.s[2]\n"
    "umov w1, v5.s[3]\n"
    "stp w0, w1, [%[out_v0s0]]\n"
    "umov w0, v6.s[0]\n"
    "umov w1, v6.s[1]\n"
    "stp w0, w1, [%[out_u1r1]]\n"
    "umov w0, v6.s[2]\n"
    "umov w1, v6.s[3]\n"
    "stp w0, w1, [%[out_v1s1]]\n"


    "umov w0, v7.s[0]\n"
    "umov w1, v7.s[1]\n"
    "stp w0, w1, [%[out_uhatrhat]]\n"
    "umov w0, v7.s[2]\n"
    "umov w1, v7.s[3]\n"
    "stp w0, w1, [%[out_vhatshat]]\n"


    :
    : /* ---- 輸入 ---- */
      [ptr]           "r"(uuvvrrss),
      /* ---- 輸出地址 ---- */
      [out_u0r0]      "r"(&vec_u0_r0),
      [out_u1r1]      "r"(&vec_u1_r1),
      [out_uhatrhat]  "r"(&vec_uhat_rhat),
      [out_v0s0]      "r"(&vec_v0_s0),
      [out_v1s1]      "r"(&vec_v1_s1),
      [out_vhatshat]  "r"(&vec_vhat_shat),
      [p_vec_uu0_rr0_vv0_ss0] "r"(&vec_uu0_rr0_vv0_ss0),
      [p_vec_uu1_rr1_vv1_ss1] "r"(&vec_uu1_rr1_vv1_ss1),
      [p_vec_uuhat_rrhat_vvhat_sshat] "r"(&vec_uuhat_rrhat_vvhat_sshat),
      [p_vec_uuhat_rrhat] "r"(&vec_uuhat_rrhat),
      [p_vec_vvhat_sshat] "r"(&vec_vvhat_sshat)
    : /* ---- clobber：只在區塊內用到的暫存器 ---- */
      "memory",
      /* GPR：x0-x15 都被踩過 */
      "x0","x1","x2","x3","x4","x5","x6","x7",
      "x8","x9","x10","x11","x12","x13","x14","x15",
      /* NEON：v5-v10、v15 (別名 d?/q?) */
      "v5","v6","v7","v8","v9","v10"
);

/* --------------  退出 asm 區塊後  -----------------
 * vec_u0_r0     = {u0,      r0}
 * vec_u1_r1     = {u1,      r1}
 * vec_uhat_rhat = {û,       r̂}
 * vec_v0_s0     = {v0,      s0}
 * vec_v1_s1     = {v1,      s1}
 * vec_vhat_shat = {v̂,       ŝ}
 * 六個暫存器向量全部寫回變數，x / v 寄存器皆已釋放。
 * -------------------------------------------------- */


  // print_u32x2(vec_u0_r0);
  // print_u32x2(vec_v0_s0);
  // print_u32x4(vec_uu0_rr0_vv0_ss0);



    uint32x2_t vec_V[9];
    uint32x2_t vec_S[9];


__asm__ volatile(
    /* ==== 1. 把 V[0..8]、S[0..8] 載到 x4–x9 ===================== */
    "ldp   x4,  x5,  [%[pV]]        \n"   /* V0V1  V2V3 */
    "ldp   x6,  x7,  [%[pV], #16]   \n"   /* V4V5  V6V7 */
    "ldr   w8,      [%[pV], #32]    \n"   /* V8               */

    "ldp   x9,  x10, [%[pS]]        \n"   /* S0S1  S2S3 */
    "ldp   x11, x12, [%[pS], #16]   \n"   /* S4S5  S6S7 */
    "ldr   w13,     [%[pS], #32]    \n"   /* S8               */

    /* ==== 2. 用 ins 把它們塞進 v0–v4 =========================== */
    "ins   v0.d[0], x4              \n"   /* [V0V1, ?]  */
    "ins   v0.d[1], x9              \n"   /* [V0V1, S0S1] */

    "ins   v1.d[0], x5              \n"
    "ins   v1.d[1], x10             \n"

    "ins   v2.d[0], x6              \n"
    "ins   v2.d[1], x11             \n"

    "ins   v3.d[0], x7              \n"
    "ins   v3.d[1], x12             \n"

    "ins   v4.d[0], x8              \n"
    "ins   v4.d[1], x13             \n"
    // so, v0 = vec_V0_V1_S0_S1

    /* ==== 3. 立刻拆回 vec_V / vec_S，釋放 v0–v4 =============== */
    /* v0 --------------------------------------------------------- */
    "dup   v16.2s, v0.s[0]          \n"   /* V0 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v0.s[1]          \n"   /* V1 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v0.s[2]          \n"   /* S0 */
    "str   d16, [%[oS]], #8         \n"
    "dup   v16.2s, v0.s[3]          \n"   /* S1 */
    "str   d16, [%[oS]], #8         \n"

    /* v1 --------------------------------------------------------- */
    "dup   v16.2s, v1.s[0]          \n"   /* V2 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v1.s[1]          \n"   /* V3 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v1.s[2]          \n"   /* S2 */
    "str   d16, [%[oS]], #8         \n"
    "dup   v16.2s, v1.s[3]          \n"   /* S3 */
    "str   d16, [%[oS]], #8         \n"

    /* v2 --------------------------------------------------------- */
    "dup   v16.2s, v2.s[0]          \n"   /* V4 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v2.s[1]          \n"   /* V5 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v2.s[2]          \n"   /* S4 */
    "str   d16, [%[oS]], #8         \n"
    "dup   v16.2s, v2.s[3]          \n"   /* S5 */
    "str   d16, [%[oS]], #8         \n"

    /* v3 --------------------------------------------------------- */
    "dup   v16.2s, v3.s[0]          \n"   /* V6 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v3.s[1]          \n"   /* V7 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v3.s[2]          \n"   /* S6 */
    "str   d16, [%[oS]], #8         \n"
    "dup   v16.2s, v3.s[3]          \n"   /* S7 */
    "str   d16, [%[oS]], #8         \n"

    /* v4 --------------------------------------------------------- */
    "dup   v16.2s, v4.s[0]          \n"   /* V8 */
    "str   d16, [%[oV]], #8         \n"
    "dup   v16.2s, v4.s[2]          \n"   /* S8 (v4.s[1] 無效) */
    "str   d16, [%[oS]], #8         \n"
    :
    : /* 指標只宣告為一般 `"r"`，讓編譯器自由選擇暫存器 */
      [pV] "r"(V->limb),
      [pS] "r"(S->limb),
      [oV] "r"(vec_V),
      [oS] "r"(vec_S)
    : "memory",
      /* 這些在區塊內被用到／覆寫，列入 clobber */
      "x4","x5","x6","x7","x8","x9","x10","x11","x12","x13",
      "v0","v1","v2","v3","v4","v16"
);
    // for (int i = 0; i < 9; i++)
    // {
    //     vec_V[i] =  vdup_n_u32(V->limb[i]);
    //     vec_S[i] =  vdup_n_u32(S->limb[i]);
    // }


    // Step []: vec_uuV_rrV[0..10] = initialize to zero
    uint32x2_t vec_uuV_rrV[11] = {0}; 
    for (int i = 0; i < 11; i++) {
        vec_uuV_rrV[i] = vdup_n_u32(0);
    }








    

    // Step [3]: tmp += u0 * V
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u0_r0 );
        vec_uuV_rrV[i] = vadd_u32(vec_uuV_rrV[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_uuV_rrV[9] = vadd_u32(vec_uuV_rrV[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    
    // Step [4]: l0 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    uint32x2_t vec_l0 = vmul_u32(vec_uuV_rrV[0], vec_M);
    vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);

    // i = 0
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    vec_uuV_rrV[0] = vadd_u32(vec_uuV_rrV[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);


    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
        vec_uuV_rrV[i] = vadd_u32(vec_uuV_rrV[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }

    // i = 8
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    vec_uuV_rrV[8] = vadd_u32(vec_uuV_rrV[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_uuV_rrV[9] = vadd_u32(vec_uuV_rrV[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    // Step [5]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_uuV_rrV[i], 30);
        vec_uuV_rrV[i] = vand_u32(vec_uuV_rrV[i], vec_u32_2p30m1);
        vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vec_carry);
    }

    
    // Step [7]: tmp += u1 * V 
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u1_r1 );
        vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_uuV_rrV[9+1] = vadd_u32(vec_uuV_rrV[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    



    // Step [8]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_uuV_rrV[i+1], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_uuV_rrV[i+1] = vand_u32(vec_uuV_rrV[i+1], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_uuV_rrV[i+2] = vadd_u32(vec_uuV_rrV[i+2], vec_carry);
    }




    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    uint32x2_t vec_l1 = vmul_u32(vec_uuV_rrV[1], vec_M);
    vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    
    // i = 0
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    vec_uuV_rrV[1] = vadd_u32(vec_uuV_rrV[1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);


    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
        vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }

    // i = 8
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    vec_uuV_rrV[8+1] = vadd_u32(vec_uuV_rrV[8+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_uuV_rrV[9+1] = vadd_u32(vec_uuV_rrV[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
    
    // Step [10]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_uuV_rrV[i], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_uuV_rrV[i] = vand_u32(vec_uuV_rrV[i], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vec_carry);
    }
    
    
    
    // // Step [11]: tmp = tmp / B
    // for (int i = 0; i<9; i++){
    //     vec_uuV_rrV[i] = vec_uuV_rrV[i+1];
    // }
    // vec_uuV_rrV[9] = vdup_n_u32(0);

    // print_vec_uuV_rrV(vec_uuV_rrV,11);
  // clear


    // Step [12]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    uint32x2_t vec_small_tmp = {0};
    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[i+2]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[8+2]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vec_u32_2p15m1,
            vec_small_tmp
        ),
        31
    );

    vec_uuV_rrV[0+2] = vadd_u32(vec_uuV_rrV[2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[10], vand_u32(vec_reductionhat, vdup_n_u32(32768)));



    

    // Step [13]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<8; i++){
        vec_carry = vshr_n_u32(vec_uuV_rrV[i+2], 30);
        vec_uuV_rrV[i+2] = vand_u32(vec_uuV_rrV[i+2], vec_u32_2p30m1);
        vec_uuV_rrV[i+3] = vadd_u32(vec_uuV_rrV[i+3], vec_carry);
    }



    // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)
    vec_uuV_rrV[2] = vadd_u32(vec_uuV_rrV[2] , vand_u32(vec_uhat_rhat, vec_u32_2p30m19));
    vec_uuV_rrV[2] = vsub_u32(vec_uuV_rrV[2] , vand_u32(vec_uhat_rhat, vec_V[0]));
    for (int i = 0 + 1; i < (9 - 1); i++)
    {
        vec_uuV_rrV[i+2] = vadd_u32(vec_uuV_rrV[i+2] , vand_u32(vec_uhat_rhat, vec_u32_2p30m1));
        vec_uuV_rrV[i+2] = vsub_u32(vec_uuV_rrV[i+2] , vand_u32(vec_uhat_rhat, vec_V[i]));
    }
    vec_uuV_rrV[8+2] = vadd_u32(vec_uuV_rrV[8+2] , vand_u32(vec_uhat_rhat, vec_u32_2p15m1));
    vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[8+2] , vand_u32(vec_uhat_rhat, vec_V[8]));


    // Step [15]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        // borrow = tmp[i] >> 31;
        vec_borrow = vshr_n_u32(vec_uuV_rrV[i+2],31);
        // tmp[i+1] = tmp[i+1] - borrow;
        vec_uuV_rrV[i+1+2] = vsub_u32(vec_uuV_rrV[i+1+2], vec_borrow);
        // tmp[i+0] = tmp[i+0] + (borrow << 30);
        vec_uuV_rrV[i+0+2] = vadd_u32(vec_uuV_rrV[i+0+2], vshl_n_u32(vec_borrow,30));
    }


    
    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19ULL);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[i+2]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[8+2]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vec_u32_2p15m1,
            vec_small_tmp
        ),
        31
    );

    vec_uuV_rrV[0+2] = vadd_u32(vec_uuV_rrV[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));


    // Step [17]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<8; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_uuV_rrV[i+2], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_uuV_rrV[i+2] = vand_u32(vec_uuV_rrV[i+2], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_uuV_rrV[i+1+2] = vadd_u32(vec_uuV_rrV[i+1+2], vec_carry);
    }


    // So fat, vec_uuV_rrV[2:11] stores [ u*V*R-1 mod P, r*V*R-1 mod P ]


    // Step [1]: Initialization 

    // vec_tmp[0..10] = initialize to zero
    uint32x2_t vec_vvS_ssS[11] = {0}; 
    for (int i = 0; i < 11; i++) {
        vec_vvS_ssS[i] = vdup_n_u32(0);
    }




    // Step [2]: Decompose inputs (v, s) into limb formers


    // Step [3]: tmp += v0 * S, s0 * S
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v0_s0 );
        vec_vvS_ssS[i] = vadd_u32(vec_vvS_ssS[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_vvS_ssS[9] = vadd_u32(vec_vvS_ssS[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    
    // Step [4]: l0 = tmp2[0] * M mod 2^30
    //            and tmp2 += l0 * P
    vec_l0 = vmul_u32(vec_vvS_ssS[0], vec_M);
    vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    vec_vvS_ssS[0] = vadd_u32(vec_vvS_ssS[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
        vec_vvS_ssS[i] = vadd_u32(vec_vvS_ssS[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    vec_vvS_ssS[8] = vadd_u32(vec_vvS_ssS[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_vvS_ssS[9] = vadd_u32(vec_vvS_ssS[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));


    // Step [5]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i < 9; i++){
        vec_carry = vshr_n_u32(vec_vvS_ssS[i], 30);
        vec_vvS_ssS[i] = vand_u32(vec_vvS_ssS[i], vec_u32_2p30m1);
        vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vec_carry);
    }



    // // Step [6]: tmp2 = tmp2 / B
    // for (int i = 0; i<9; i++){
    //     vec_vvS_ssS[i] = vec_vvS_ssS[i+1];
    // }
    // vec_vvS_ssS[9] = vdup_n_u32(0);
    //
    //
    //
    
    
    
    // Step [7]: tmp2 += u1 * S
    vec_prod = vdupq_n_u64(0);
    for (int i = 0; i < 9; i++){
        vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v1_s1 );
        vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_vvS_ssS[9+1] = vadd_u32(vec_vvS_ssS[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    



    // Step [8]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_vvS_ssS[i+1], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_vvS_ssS[i+1] = vand_u32(vec_vvS_ssS[i+1], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_vvS_ssS[i+1+1] = vadd_u32(vec_vvS_ssS[i+1+1], vec_carry);
    }




    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    vec_l1 = vmul_u32(vec_vvS_ssS[0+1], vec_M);
    vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

    vec_prod = vdupq_n_u64(0);
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    vec_vvS_ssS[0+1] = vadd_u32(vec_vvS_ssS[0+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    for (int i = 0 + 1; i < (9 - 1); i++){
        vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
        vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
        vec_prod = vshrq_n_u64(vec_prod, 30);
    }
    vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    vec_vvS_ssS[8+1] = vadd_u32(vec_vvS_ssS[8+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    vec_prod = vshrq_n_u64(vec_prod, 30);

    vec_vvS_ssS[9+1] = vadd_u32(vec_vvS_ssS[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
    
    
    // Step [10]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<9; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_vvS_ssS[i+1], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_vvS_ssS[i+1] = vand_u32(vec_vvS_ssS[i+1], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_vvS_ssS[i+1+1] = vadd_u32(vec_vvS_ssS[i+1+1], vec_carry);
    }
    
    
    
    // // Step [11]: tmp = tmp / B
    // for (int i = 0; i<9; i++){
    //     vec_vvS_ssS[i] = vec_vvS_ssS[i+1];
    // }
    // vec_vvS_ssS[9] = vdup_n_u32(0);
    

    // Step [12]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[i+2]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[8+2]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vec_u32_2p15m1,
            vec_small_tmp
        ),
        31
    );

    vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));



    

    // Step [13]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<8; i++){
        vec_carry = vshr_n_u32(vec_vvS_ssS[i+2], 30);
        vec_vvS_ssS[i+2] = vand_u32(vec_vvS_ssS[i+2], vec_u32_2p30m1);
        vec_vvS_ssS[i+1+2] = vadd_u32(vec_vvS_ssS[i+1+2], vec_carry);
    }



    // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)

    vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2] , vand_u32(vec_vhat_shat, vec_u32_2p30m19));
    vec_vvS_ssS[0+2] = vsub_u32(vec_vvS_ssS[0+2] , vand_u32(vec_vhat_shat, vec_S[0]));
    for (int i = 0 + 1; i < (9 - 1); i++)
    {
        vec_vvS_ssS[i+2] = vadd_u32(vec_vvS_ssS[i+2] , vand_u32(vec_vhat_shat, vec_u32_2p30m1));
        vec_vvS_ssS[i+2] = vsub_u32(vec_vvS_ssS[i+2] , vand_u32(vec_vhat_shat, vec_S[i]));
    }
    vec_vvS_ssS[8+2] = vadd_u32(vec_vvS_ssS[8+2] , vand_u32(vec_vhat_shat, vec_u32_2p15m1));
    vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2] , vand_u32(vec_vhat_shat, vec_S[8]));


    // Step [15]: borrow propogation
    for (int i = 0; i < 8; i++)
    {   
        // borrow = tmp[i] >> 31;
        vec_borrow = vshr_n_u32(vec_vvS_ssS[i+2],31);
        // tmp[i+1] = tmp[i+1] - borrow;
        vec_vvS_ssS[i+1+2] = vsub_u32(vec_vvS_ssS[i+1+2], vec_borrow);
        // tmp[i+0] = tmp[i+0] + (borrow << 30);
        vec_vvS_ssS[i+0+2] = vadd_u32(vec_vvS_ssS[i+0+2], vshl_n_u32(vec_borrow,30));
    }


    
    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    vec_small_tmp = vdup_n_u32(19ULL);
    for (int i = 0; i < 8; i++)
    {
        vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[i+2]);
        vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    }
    vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[8+2]);

    vec_reductionhat = (uint32x2_t)vshr_n_s32(
        (int32x2_t)vsub_u32(
            vec_u32_2p15m1,
            vec_small_tmp
        ),
        31
    );

    vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));


    // Step [17]: carry propogation
    vec_carry = vdup_n_u32(0);
    for (int i = 0; i<8; i++){
        // carry = tmp[i] >> 30;
        vec_carry = vshr_n_u32(vec_vvS_ssS[i+2], 30);
        // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
        vec_vvS_ssS[i+2] = vand_u32(vec_vvS_ssS[i+2], vec_u32_2p30m1);
        // tmp[i+1] += carry; 
        vec_vvS_ssS[i+1+2] = vadd_u32(vec_vvS_ssS[i+1+2], vec_carry);
    }

    // Step [18]: 
    
    uint32x2_t vec_tmp[11];
    for (int i = 0; i < 9; i++) {
        vec_tmp[i] = vadd_u32(vec_uuV_rrV[i+2], vec_vvS_ssS[i+2]);
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
            vec_u32_2p15m1,
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


