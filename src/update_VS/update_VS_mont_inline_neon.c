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
    // int64_t *u = &(uuvvrrss[0]);
    // int64_t *v = &(uuvvrrss[1]);
    // int64_t *r = &(uuvvrrss[2]);
    // int64_t *s = &(uuvvrrss[3]);


    // // vec_M = [M, M]
    // // M = -P^-1 mod B (B = 2^30)
    // uint32x2_t vec_M = {678152731, 678152731};


    // Constants, buffer, and mask
    // uint32x2_t vec_carry = {0};
    // uint32x2_t vec_borrow = {0};
    // uint64x2_t vec_prod = {0};
    // uint32x2_t vec_reductionhat = {0};
    // uint64x2_t vec_2p30m1 = {1073741823, 1073741823};
    // uint32x2_t vec_u32_2p30m1 = {1073741823, 1073741823};
    // uint32x2_t vec_u32_2p30m19 = {1073741805, 1073741805};
    // uint32x2_t vec_u32_2p15m1 = {32767, 32767};




/* -------------  C 端變數（與原程式相同型別） ------------- */
// uint32x2_t vec_u0_r0, vec_u1_r1, vec_uhat_rhat;
// uint32x2_t vec_v0_s0, vec_v1_s1, vec_vhat_shat;

uint32x4_t vec_uu0_rr0_vv0_ss0;
uint32x4_t vec_uu1_rr1_vv1_ss1;
uint32x4_t vec_uuhat_rrhat_vvhat_sshat;
// uint32x4_t vec_uuhat_rrhat;
// uint32x4_t vec_vvhat_sshat;
    // uint32x2_t vec_u0_r0 = {(*u) & ((1ULL << 30)-1), (*r) & ((1ULL << 30)-1)};
    // uint32x2_t vec_u1_r1 = {((*u) >> 30) & ((1ULL << 30)-1), ((*r) >> 30) & ((1ULL << 30)-1)};
    // uint32x2_t vec_uhat_rhat = {(*u) >> 63, (*r) >> 63};
    //
    // uint32x2_t vec_v0_s0 = {(*v) & ((1ULL << 30)-1), (*s) & ((1ULL << 30)-1)};
    // uint32x2_t vec_v1_s1 = {((*v) >> 30) & ((1ULL << 30)-1), ((*s) >> 30) & ((1ULL << 30)-1)};
    // uint32x2_t vec_vhat_shat = {(*v) >> 63, (*s) >> 63};

  /* Load the data from the function input, and store in specified registers */
  /* v5 = vec_uu0_rr0_vv0_ss0 */
  /* v5 = vec_uu1_rr1_vv1_ss1 */
  /* v5 = vec_uuhat_rrhat_vvhat_sshat */
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



    // v5 = vec_uu0_rr0_vv0_ss0
    // v6 = vec_uu1_rr1_vv1_ss1
    // v7 = vec_uuhat_rrhat_vvhat_sshat
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


    :
    : /* ---- 輸入 ---- */
      [ptr]           "r"(uuvvrrss),
      /* ---- 輸出地址 ---- */
      [p_vec_uu0_rr0_vv0_ss0] "r"(&vec_uu0_rr0_vv0_ss0),
      [p_vec_uu1_rr1_vv1_ss1] "r"(&vec_uu1_rr1_vv1_ss1),
      [p_vec_uuhat_rrhat_vvhat_sshat] "r"(&vec_uuhat_rrhat_vvhat_sshat)
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



    // uint32x2_t vec_V[9];
    // uint32x2_t vec_S[9];

    uint32x4_t vec_V0_V1_S0_S1;
    uint32x4_t vec_V2_V3_S2_S3;
    uint32x4_t vec_V4_V5_S4_S5;
    uint32x4_t vec_V6_V7_S6_S7;
    uint32x4_t vec_V8_0_S8_0;


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

    // dump to vec_V0_V1_S0_S1
    "umov    x0, v0.d[0]\n"
    "umov    x1, v0.d[1]\n"
    "stp     x0, x1, [%[p_vec_V0_V1_S0_S1]]\n"
    "umov    x0, v1.d[0]\n"
    "umov    x1, v1.d[1]\n"
    "stp     x0, x1, [%[p_vec_V2_V3_S2_S3]]\n"
    "umov    x0, v2.d[0]\n"
    "umov    x1, v2.d[1]\n"
    "stp     x0, x1, [%[p_vec_V4_V5_S4_S5]]\n"
    "umov    x0, v3.d[0]\n"
    "umov    x1, v3.d[1]\n"
    "stp     x0, x1, [%[p_vec_V6_V7_S6_S7]]\n"
    "umov    x0, v4.d[0]\n"
    "umov    x1, v4.d[1]\n"
    "stp     x0, x1, [%[p_vec_V8_0_S8_0]]\n"


    // /* ==== 3. 立刻拆回 vec_V / vec_S，釋放 v0–v4 =============== */
    // /* v0 --------------------------------------------------------- */
    // "dup   v16.2s, v0.s[0]          \n"   /* V0 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v0.s[1]          \n"   /* V1 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v0.s[2]          \n"   /* S0 */
    // "str   d16, [%[oS]], #8         \n"
    // "dup   v16.2s, v0.s[3]          \n"   /* S1 */
    // "str   d16, [%[oS]], #8         \n"
    //
    // /* v1 --------------------------------------------------------- */
    // "dup   v16.2s, v1.s[0]          \n"   /* V2 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v1.s[1]          \n"   /* V3 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v1.s[2]          \n"   /* S2 */
    // "str   d16, [%[oS]], #8         \n"
    // "dup   v16.2s, v1.s[3]          \n"   /* S3 */
    // "str   d16, [%[oS]], #8         \n"
    //
    // /* v2 --------------------------------------------------------- */
    // "dup   v16.2s, v2.s[0]          \n"   /* V4 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v2.s[1]          \n"   /* V5 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v2.s[2]          \n"   /* S4 */
    // "str   d16, [%[oS]], #8         \n"
    // "dup   v16.2s, v2.s[3]          \n"   /* S5 */
    // "str   d16, [%[oS]], #8         \n"
    //
    // /* v3 --------------------------------------------------------- */
    // "dup   v16.2s, v3.s[0]          \n"   /* V6 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v3.s[1]          \n"   /* V7 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v3.s[2]          \n"   /* S6 */
    // "str   d16, [%[oS]], #8         \n"
    // "dup   v16.2s, v3.s[3]          \n"   /* S7 */
    // "str   d16, [%[oS]], #8         \n"
    //
    // /* v4 --------------------------------------------------------- */
    // "dup   v16.2s, v4.s[0]          \n"   /* V8 */
    // "str   d16, [%[oV]], #8         \n"
    // "dup   v16.2s, v4.s[2]          \n"   /* S8 (v4.s[1] 無效) */
    // "str   d16, [%[oS]], #8         \n"
    :
    : /* 指標只宣告為一般 `"r"`，讓編譯器自由選擇暫存器 */
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0] "r"(&vec_V8_0_S8_0),
      [pV] "r"(V->limb),
      [pS] "r"(S->limb)
      // [oV] "r"(vec_V),
      // [oS] "r"(vec_S),
    : "memory",
      /* 這些在區塊內被用到／覆寫，列入 clobber */
      "x0","x1","x4","x5","x6","x7","x8","x9","x10","x11","x12","x13",
      "v0","v1","v2","v3","v4","v16"
);
    // for (int i = 0; i < 9; i++)
    // {
    //     vec_V[i] =  vdup_n_u32(V->limb[i]);
    //     vec_S[i] =  vdup_n_u32(S->limb[i]);
    // }

  // print_u32x4((uint32x4_t){V->limb[8],0,S->limb[8],0  });
  // print_u32x4(vec_V8_0_S8_0);

    // Step []: vec_uuV_rrV[0..10] = initialize to zero
    
    uint32x4_t vec_uuV0_uuV1_rrV0_rrV1;
    uint32x4_t vec_uuV2_uuV3_rrV2_rrV3;
    uint32x4_t vec_uuV4_uuV5_rrV4_rrV5;
    uint32x4_t vec_uuV6_uuV7_rrV6_rrV7;
    uint32x4_t vec_uuV8_uuV9_rrV8_rrV9;
    uint32x4_t vec_uuV10_0_rrV10_0;

    uint32x2_t vec_uuV_rrV[11]; 

    // for (int i = 0; i < 11; i++) {
    //     vec_uuV_rrV[i] = vdup_n_u32(0);
    // }


    // // Step [3]: tmp += u0 * V
    // vec_prod = vdupq_n_u64(0);
    // for (int i = 0; i < 9; i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u0_r0 );
    //     vec_uuV_rrV[i] = vadd_u32(vec_uuV_rrV[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_uuV_rrV[9] = vadd_u32(vec_uuV_rrV[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));



  __asm__(
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]] \n"
    "ins   v0.d[0], x0              \n"
    "ins   v0.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]] \n"
    "ins   v1.d[0], x0              \n"
    "ins   v1.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]] \n"
    "ins   v2.d[0], x0              \n"
    "ins   v2.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]] \n"
    "ins   v3.d[0], x0              \n"
    "ins   v3.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]] \n"
    "ins   v4.d[0], x0              \n"
    "ins   v4.d[1], x1              \n"


    // "ldp   x0, x1, [%[p_vec_uu0_rr0_vv0_ss0]] \n"
    // "ins   v5.d[0], x0              \n"
    // "ins   v5.d[1], x1              \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    // "ins   v13.d[0], x0                   \n"
    // "ins   v13.d[1], x1                   \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    // "ins   v14.d[0], x0                   \n"
    // "ins   v14.d[1], x1                   \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    // "ins   v15.d[0], x0                   \n"
    // "ins   v15.d[1], x1                   \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    // "ins   v16.d[0], x0                   \n"
    // "ins   v16.d[1], x1                   \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    // "ins   v17.d[0], x0                   \n"
    // "ins   v17.d[1], x1                   \n"
    //
    // "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    // "ins   v18.d[0], x0                   \n"
    // "ins   v18.d[1], x1                   \n"

    // v13 = vec_uuV0_uuV1_rrV0_rrV1
    // v14 = vec_uuV2_uuV3_rrV2_rrV3
    // v15 = vec_uuV4_uuV5_rrV4_rrV5
    // v16 = vec_uuV6_uuV7_rrV6_rrV7
    // v17 = vec_uuV8_uuV9_rrV8_rrV9
    // v18 = vec_uuV10_0_rrV10_0
    "movi  v13.2d, #0   \n"
    "movi  v14.2d, #0   \n"
    "movi  v15.2d, #0   \n"
    "movi  v16.2d, #0   \n"
    "movi  v17.2d, #0   \n"
    "movi  v18.2d, #0   \n"

    "mov   x0, #1                   \n"
    "lsl   x0, x0, #30              \n"
    "sub   x0, x0, #1                   \n"
    "dup   v20.2d, x0               \n"



    "movi  v21.2d, #0                \n"
    // v21 = vec_prod
    // v22 = vec_buf
    "umlal v21.2d, v5.2s, v0.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v13.2d, v13.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v0.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v13.2d, v13.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v1.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v14.2d, v14.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v1.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v14.2d, v14.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v2.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v15.2d, v15.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v2.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v15.2d, v15.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v3.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v16.2d, v16.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v3.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v16.2d, v16.2d, v22.2d        \n"

    "umlal v21.2d, v5.2s, v4.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v17.2d, v17.2d, v22.2d        \n"

    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v17.2d, v17.2d, v22.2d        \n"


    // dump to 
    // v13 = vec_uuV0_uuV1_rrV0_rrV1
    // v14 = vec_uuV2_uuV3_rrV2_rrV3
    // v15 = vec_uuV4_uuV5_rrV4_rrV5
    // v16 = vec_uuV6_uuV7_rrV6_rrV7
    // v17 = vec_uuV8_uuV9_rrV8_rrV9
    // v18 = vec_uuV10_0_rrV10_0

    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v18.d[0]              \n"
    "umov   x1, v18.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //
    /* offset 0  (uuV0 , rrV0) */
    "umov   w0, v13.s[0]            \n"
    "umov   w1, v13.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV]]         \n"

    /* offset 8  (uuV1 , rrV1) */
    "umov   w0, v13.s[1]            \n"
    "umov   w1, v13.s[3]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #8]     \n"

    /* offset 16 (uuV2 , rrV2) */
    "umov   w0, v14.s[0]            \n"
    "umov   w1, v14.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #16]    \n"

    /* offset 24 (uuV3 , rrV3) */
    "umov   w0, v14.s[1]            \n"
    "umov   w1, v14.s[3]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #24]    \n"

    /* offset 32 (uuV4 , rrV4) */
    "umov   w0, v15.s[0]            \n"
    "umov   w1, v15.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #32]    \n"

    /* offset 40 (uuV5 , rrV5) */
    "umov   w0, v15.s[1]            \n"
    "umov   w1, v15.s[3]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #40]    \n"

    /* offset 48 (uuV6 , rrV6) */
    "umov   w0, v16.s[0]            \n"
    "umov   w1, v16.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #48]    \n"

    /* offset 56 (uuV7 , rrV7) */
    "umov   w0, v16.s[1]            \n"
    "umov   w1, v16.s[3]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #56]    \n"

    /* offset 64 (uuV8 , rrV8) */
    "umov   w0, v17.s[0]            \n"
    "umov   w1, v17.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #64]    \n"

    /* offset 72 (uuV9 , rrV9) */
    "umov   w0, v17.s[1]            \n"
    "umov   w1, v17.s[3]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #72]    \n"

    /* offset 80 (uuV10, rrV10) – 低半 */
    "umov   w0, v18.s[0]            \n"
    "umov   w1, v18.s[2]            \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #80]    \n"

    
    :
    : // pointers
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0] "r"(&vec_V8_0_S8_0),
      [p_vec_uu0_rr0_vv0_ss0] "r"(&vec_uu0_rr0_vv0_ss0),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10",
      "v11","v12","v13","v14","v15","v16","v17","v18",
      "v20", "v21", "v22"
  );





  // print_u32x2(vec_uuV_rrV[6]);
  // print_u32x2(vec_uuV_rrV[7]);
  // print_u32x4(vec_uuV6_uuV7_rrV6_rrV7);





    
    // Step [4]: l0 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
  
    // vec_M = [M, M]
    // M = -P^-1 mod B (B = 2^30)
    // uint32x2_t vec_M = {678152731, 678152731};

    uint32x2_t vec_l0;
    // vec_l0 = vmul_u32(vec_uuV_rrV[0], vec_M);
    // vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

__asm__ volatile(

    "ldr    w0, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]              \n" 
    "ldr    w1, [%[p_vec_uuV0_uuV1_rrV0_rrV1], #8]              \n" 
    "ins    v13.s[0], w0   \n"
    "ins    v13.s[1], w1   \n"

    /* === 2. 建立 vec_M = [678152731, 678152731] = 0x286BCA1B ==== */
    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v19.2s,  w1                          \n"  

    /* === 3. vec_l0 = (v0 * v1) & (2³⁰‑1) ====================== */
    "mul    v19.2s, v13.2s, v19.2s                 \n"

        /* 2³⁰‑1 mask：0x3FFFFFFF */
    "mov    w1,  #1                             \n"
    "lsl    w1,  w1,  #30                       \n"
    "sub    w1,  w1,  #1                        \n"
    "dup    v20.2s,  w1                          \n"

    "and    v19.8b, v19.8b, v20.8b                 \n"
    "st1    {v19.2s}, [%[p_vec_l0]]              \n"

    :
    : [p_vec_uuV0_uuV1_rrV0_rrV1]   "r" (&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_l0]   "r" (&vec_l0)
    : "memory",
      /* GPR */
      "w0","w1",
      /* NEON */
      "v0","v1","v2","v3","v4","v13","v19","v20"
);



    // vec_prod = vdupq_n_u64(0);
    // // i = 0
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    // vec_uuV_rrV[0] = vadd_u32(vec_uuV_rrV[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    //
    // for (int i = 0 + 1; i < (9 - 1); i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
    //     vec_uuV_rrV[i] = vadd_u32(vec_uuV_rrV[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    //
    // // i = 8
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    // vec_uuV_rrV[8] = vadd_u32(vec_uuV_rrV[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // vec_uuV_rrV[9] = vadd_u32(vec_uuV_rrV[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));



__asm__ volatile(
    /* ---- load l0 (2×32-bit) → v19.s[0,1] ----------------- */
    "ldp   w0, w1, [%[p_vec_l0]]          \n"
    "ins   v19.s[0], w0                   \n"
    "ins   v19.s[1], w1                   \n"

    /* ---- load accumulated uuV/rrV vectors ---------------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                   \n"
    "ins   v13.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                   \n"
    "ins   v14.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                   \n"
    "ins   v15.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                   \n"
    "ins   v16.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                   \n"
    "ins   v17.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                   \n"
    "ins   v18.d[1], x1                   \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---- prepare constants -------------------------------- */
    "mov   x0, #1                         \n"
    "lsl   x1, x0, #30                    \n"
    "sub   x1, x1, #1                     \n"
    "dup   v24.2d, x1                     \n"   /* 2^30-1  */
    "sub   x1, x1, #18                    \n"
    "dup   v25.2d, x1                     \n"   /* 2^30-19 */
    "lsl   x1, x0, #15                    \n"
    "sub   x1, x1, #1                     \n"
    "dup   v26.2d, x1                     \n"   /* 2^15-1  */

    /* ---- initialize prod / buf ---------------------------- */
    "movi  v22.2d, #0                     \n"   /* vec_prod */
    /* v23 = vec_buf (masked limbs)                           */

    /* ------------ accumulate (l0 × constants) -------------- */
    /* —— uuV0 / rrV0 ——————————————— */
    "umlal v22.2d, v19.2s, v25.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v13.2d, v13.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v13.2d, v13.2d, v23.2d         \n"

    /* —— uuV2 / rrV2 ——————————————— */
    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v14.2d, v14.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v14.2d, v14.2d, v23.2d         \n"

    /* —— uuV4 / rrV4 ——————————————— */
    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v15.2d, v15.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v15.2d, v15.2d, v23.2d         \n"

    /* —— uuV6 / rrV6 ——————————————— */
    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v16.2d, v16.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v24.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v16.2d, v16.2d, v23.2d         \n"

    /* —— uuV8 / rrV8 ——————————————— */
    "umlal v22.2d, v19.2s, v26.s[0]       \n"
    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v17.2d, v17.2d, v23.2d         \n"

    "and   v23.16b, v22.16b, v24.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v17.2d, v17.2d, v23.2d         \n"

    /* ---- store back 64-bit uuV/rrV vectors ---------------- */
    "umov  x0, v13.d[0]                   \n"
    "umov  x1, v13.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"

    "umov  x0, v14.d[0]                   \n"
    "umov  x1, v14.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v15.d[0]                   \n"
    "umov  x1, v15.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v16.d[0]                   \n"
    "umov  x1, v16.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v17.d[0]                   \n"
    "umov  x1, v17.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v18.d[0]                   \n"
    "umov  x1, v18.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    /* ---- store 32-bit interleaved uuV/rrV ------------------ */
    "umov  w0, v13.s[0]                   \n"
    "umov  w1, v13.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV]]           \n"

    "umov  w0, v13.s[1]                   \n"
    "umov  w1, v13.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #8]       \n"

    "umov  w0, v14.s[0]                   \n"
    "umov  w1, v14.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]      \n"

    "umov  w0, v14.s[1]                   \n"
    "umov  w1, v14.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]      \n"

    "umov  w0, v15.s[0]                   \n"
    "umov  w1, v15.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]      \n"

    "umov  w0, v15.s[1]                   \n"
    "umov  w1, v15.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]      \n"

    "umov  w0, v16.s[0]                   \n"
    "umov  w1, v16.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]      \n"

    "umov  w0, v16.s[1]                   \n"
    "umov  w1, v16.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]      \n"

    "umov  w0, v17.s[0]                   \n"
    "umov  w1, v17.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]      \n"

    "umov  w0, v17.s[1]                   \n"
    "umov  w1, v17.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]      \n"

    "umov  w0, v18.s[0]                   \n"
    "umov  w1, v18.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]      \n"
    :
    : /* pointers */
      [p_vec_l0]   "r" (&vec_l0),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4",
      "v13","v14","v15","v16","v17","v18",
      "v19","v22","v23",
      "v24","v25","v26"
);
  // print_u32x2(vec_uuV_rrV[1]);


    // Step [5]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i < 9; i++){
    //     vec_carry = vshr_n_u32(vec_uuV_rrV[i], 30);
    //     vec_uuV_rrV[i] = vand_u32(vec_uuV_rrV[i], vec_u32_2p30m1);
    //     vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vec_carry);
    // }
__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                      \n"
    "ins   v13.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                      \n"
    "ins   v14.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                      \n"
    "ins   v15.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                      \n"
    "ins   v16.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                      \n"
    "ins   v17.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v19.2d, x0                         \n"   /* v19 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v20.2d, x0                         \n"   /* v20 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v21.2d, #0                         \n"   /* v21 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- uuV0/rrV0 (v13) --------------------------------- */
    "and   v21.16b, v13.16b, v19.16b          \n"
    "bic   v13.16b, v13.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v13.2d,  v13.2d,  v21.2d           \n"

    "and   v21.16b, v13.16b, v20.16b          \n"
    "bic   v13.16b, v13.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    /* ---- uuV2/rrV2 (v14) --------------------------------- */
    "and   v21.16b, v14.16b, v19.16b          \n"
    "bic   v14.16b, v14.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    "and   v21.16b, v14.16b, v20.16b          \n"
    "bic   v14.16b, v14.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    /* ---- uuV4/rrV4 (v15) --------------------------------- */
    "and   v21.16b, v15.16b, v19.16b          \n"
    "bic   v15.16b, v15.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    "and   v21.16b, v15.16b, v20.16b          \n"
    "bic   v15.16b, v15.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    /* ---- uuV6/rrV6 (v16) --------------------------------- */
    "and   v21.16b, v16.16b, v19.16b          \n"
    "bic   v16.16b, v16.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    "and   v21.16b, v16.16b, v20.16b          \n"
    "bic   v16.16b, v16.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    /* ---- uuV8/rrV8 (v17) --------------------------------- */
    "and   v21.16b, v17.16b, v19.16b          \n"
    "bic   v17.16b, v17.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    /* ---------- store back 64-bit uuV/rrV vectors ---------- */
    "umov  x0, v13.d[0]                       \n"
    "umov  x1, v13.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov  x0, v14.d[0]                       \n"
    "umov  x1, v14.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov  x0, v15.d[0]                       \n"
    "umov  x1, v15.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov  x0, v16.d[0]                       \n"
    "umov  x1, v16.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov  x0, v17.d[0]                       \n"
    "umov  x1, v17.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov  x0, v18.d[0]                       \n"
    "umov  x1, v18.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"

    /* ---------- store 32-bit interleaved uuV/rrV ----------- */
    "umov  w0, v13.s[0]                       \n"
    "umov  w1, v13.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV]]          \n"

    "umov  w0, v13.s[1]                       \n"
    "umov  w1, v13.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #8]      \n"

    "umov  w0, v14.s[0]                       \n"
    "umov  w1, v14.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]     \n"

    "umov  w0, v14.s[1]                       \n"
    "umov  w1, v14.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]     \n"

    "umov  w0, v15.s[0]                       \n"
    "umov  w1, v15.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]     \n"

    "umov  w0, v15.s[1]                       \n"
    "umov  w1, v15.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]     \n"

    "umov  w0, v16.s[0]                       \n"
    "umov  w1, v16.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]     \n"

    "umov  w0, v16.s[1]                       \n"
    "umov  w1, v16.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]     \n"

    "umov  w0, v17.s[0]                       \n"
    "umov  w1, v17.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]     \n"

    "umov  w0, v17.s[1]                       \n"
    "umov  w1, v17.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]     \n"

    "umov  w0, v18.s[0]                       \n"
    "umov  w1, v18.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]     \n"
    :
    : [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v13","v14","v15","v16","v17","v18",
      "v19","v20","v21"
);




  // print_u32x2(vec_uuV_rrV[1]);
    
    // // Step [7]: tmp += u1 * V 
    // vec_prod = vdupq_n_u64(0);
    // for (int i = 0; i < 9; i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_V[i], vec_u1_r1 );
    //     vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_uuV_rrV[9+1] = vadd_u32(vec_uuV_rrV[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
__asm__(
    /* ---------- load base V / S vectors ------------------- */
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]]  \n"
    "ins   v0.d[0], x0                     \n"
    "ins   v0.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]]  \n"
    "ins   v1.d[0], x0                     \n"
    "ins   v1.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]]  \n"
    "ins   v2.d[0], x0                     \n"
    "ins   v2.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]]  \n"
    "ins   v3.d[0], x0                     \n"
    "ins   v3.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]]    \n"
    "ins   v4.d[0], x0                     \n"
    "ins   v4.d[1], x1                     \n"

    /* ---------- load l1 vector ----------------------------- */
    "ldp   x0, x1, [%[p_vec_uu1_rr1_vv1_ss1]] \n"
    "ins   v11.d[0], x0                    \n"
    "ins   v11.d[1], x1                    \n"

    /* ---------- load accumulated uuV/rrV vectors ----------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                    \n"
    "ins   v13.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                    \n"
    "ins   v14.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                    \n"
    "ins   v15.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                    \n"
    "ins   v16.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                    \n"
    "ins   v17.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                    \n"
    "ins   v18.d[1], x1                    \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---------- constant mask in v21 ---------------------- */
    "mov   x0, #1                          \n"
    "lsl   x0, x0, #30                     \n"
    "sub   x0, x0, #1                      \n"
    "dup   v21.2d, x0                      \n"  /* v21 = 2^30−1 */

    /* ---------- prod / buf vectors ------------------------ */
    "movi  v19.2d, #0                      \n"  /* vec_prod */
    /* v20 = vec_buf */

    /* ------------ l1 × V0..V4 accumulate ------------------ */
    "umlal v19.2d, v11.2s, v0.s[0]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "shl   v20.2d, v20.2d, #32             \n"
    "add   v13.2d, v13.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v0.s[1]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "add   v14.2d, v14.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v1.s[0]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "shl   v20.2d, v20.2d, #32             \n"
    "add   v14.2d, v14.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v1.s[1]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "add   v15.2d, v15.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v2.s[0]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "shl   v20.2d, v20.2d, #32             \n"
    "add   v15.2d, v15.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v2.s[1]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "add   v16.2d, v16.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v3.s[0]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "shl   v20.2d, v20.2d, #32             \n"
    "add   v16.2d, v16.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v3.s[1]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "add   v17.2d, v17.2d, v20.2d          \n"

    "umlal v19.2d, v11.2s, v4.s[0]         \n"
    "and   v20.16b, v19.16b, v21.16b       \n"
    "ushr  v19.2d, v19.2d, #30             \n"
    "shl   v20.2d, v20.2d, #32             \n"
    "add   v17.2d, v17.2d, v20.2d          \n"

    "and   v20.16b, v19.16b, v21.16b       \n"
    "add   v18.2d, v18.2d, v20.2d          \n"

    /* ---------- store back 64-bit uuV/rrV vectors ---------- */
    "umov  x0, v13.d[0]                    \n"
    "umov  x1, v13.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"

    "umov  x0, v14.d[0]                    \n"
    "umov  x1, v14.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v15.d[0]                    \n"
    "umov  x1, v15.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v16.d[0]                    \n"
    "umov  x1, v16.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v17.d[0]                    \n"
    "umov  x1, v17.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v18.d[0]                    \n"
    "umov  x1, v18.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    /* ---------- store 32-bit interleaved uuV/rrV ----------- */
    "umov  w0, v13.s[0]                    \n"
    "umov  w1, v13.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV]]           \n"

    "umov  w0, v13.s[1]                    \n"
    "umov  w1, v13.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #8]       \n"

    "umov  w0, v14.s[0]                    \n"
    "umov  w1, v14.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]      \n"

    "umov  w0, v14.s[1]                    \n"
    "umov  w1, v14.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]      \n"

    "umov  w0, v15.s[0]                    \n"
    "umov  w1, v15.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]      \n"

    "umov  w0, v15.s[1]                    \n"
    "umov  w1, v15.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]      \n"

    "umov  w0, v16.s[0]                    \n"
    "umov  w1, v16.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]      \n"

    "umov  w0, v16.s[1]                    \n"
    "umov  w1, v16.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]      \n"

    "umov  w0, v17.s[0]                    \n"
    "umov  w1, v17.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]      \n"

    "umov  w0, v17.s[1]                    \n"
    "umov  w1, v17.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]      \n"

    "umov  w0, v18.s[0]                    \n"
    "umov  w1, v18.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]      \n"
    :
    : /* pointers */
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0]   "r"(&vec_V8_0_S8_0),
      [p_vec_uu1_rr1_vv1_ss1] "r"(&vec_uu1_rr1_vv1_ss1),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v13","v14","v15","v16","v17","v18",
      "v19","v20","v21"
);



  // print_u32x2(vec_uuV_rrV[6]);
  // print_u32x2(vec_uuV_rrV[7]);
  // print_u32x4(vec_uuV6_uuV7_rrV6_rrV7);



    // // Step [8]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i < 9; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_uuV_rrV[i+1], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_uuV_rrV[i+1] = vand_u32(vec_uuV_rrV[i+1], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_uuV_rrV[i+2] = vadd_u32(vec_uuV_rrV[i+2], vec_carry);
    // }

__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                      \n"
    "ins   v13.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                      \n"
    "ins   v14.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                      \n"
    "ins   v15.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                      \n"
    "ins   v16.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                      \n"
    "ins   v17.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v19.2d, x0                         \n"   /* v19 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v20.2d, x0                         \n"   /* v20 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v21.2d, #0                         \n"   /* v21 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- uuV0/rrV0 (v13) --------------------------------- */
    // "and   v21.16b, v13.16b, v19.16b          \n"
    // "bic   v13.16b, v13.16b, v19.16b          \n"
    // "shl   v21.2d,  v21.2d,  #2               \n"
    // "add   v13.2d,  v13.2d,  v21.2d           \n"

    "and   v21.16b, v13.16b, v20.16b          \n"
    "bic   v13.16b, v13.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    /* ---- uuV2/rrV2 (v14) --------------------------------- */
    "and   v21.16b, v14.16b, v19.16b          \n"
    "bic   v14.16b, v14.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    "and   v21.16b, v14.16b, v20.16b          \n"
    "bic   v14.16b, v14.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    /* ---- uuV4/rrV4 (v15) --------------------------------- */
    "and   v21.16b, v15.16b, v19.16b          \n"
    "bic   v15.16b, v15.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    "and   v21.16b, v15.16b, v20.16b          \n"
    "bic   v15.16b, v15.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    /* ---- uuV6/rrV6 (v16) --------------------------------- */
    "and   v21.16b, v16.16b, v19.16b          \n"
    "bic   v16.16b, v16.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    "and   v21.16b, v16.16b, v20.16b          \n"
    "bic   v16.16b, v16.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    /* ---- uuV8/rrV8 (v17) --------------------------------- */
    "and   v21.16b, v17.16b, v19.16b          \n"
    "bic   v17.16b, v17.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    "and   v21.16b, v17.16b, v20.16b          \n"
    "bic   v17.16b, v17.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v18.2d,  v18.2d,  v21.2d           \n"

    /* ---------- store back 64-bit uuV/rrV vectors ---------- */
    "umov  x0, v13.d[0]                       \n"
    "umov  x1, v13.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov  x0, v14.d[0]                       \n"
    "umov  x1, v14.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov  x0, v15.d[0]                       \n"
    "umov  x1, v15.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov  x0, v16.d[0]                       \n"
    "umov  x1, v16.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov  x0, v17.d[0]                       \n"
    "umov  x1, v17.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov  x0, v18.d[0]                       \n"
    "umov  x1, v18.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"

    /* ---------- store 32-bit interleaved uuV/rrV ----------- */
    "umov  w0, v13.s[0]                       \n"
    "umov  w1, v13.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV]]          \n"

    "umov  w0, v13.s[1]                       \n"
    "umov  w1, v13.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #8]      \n"

    "umov  w0, v14.s[0]                       \n"
    "umov  w1, v14.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]     \n"

    "umov  w0, v14.s[1]                       \n"
    "umov  w1, v14.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]     \n"

    "umov  w0, v15.s[0]                       \n"
    "umov  w1, v15.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]     \n"

    "umov  w0, v15.s[1]                       \n"
    "umov  w1, v15.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]     \n"

    "umov  w0, v16.s[0]                       \n"
    "umov  w1, v16.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]     \n"

    "umov  w0, v16.s[1]                       \n"
    "umov  w1, v16.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]     \n"

    "umov  w0, v17.s[0]                       \n"
    "umov  w1, v17.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]     \n"

    "umov  w0, v17.s[1]                       \n"
    "umov  w1, v17.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]     \n"

    "umov  w0, v18.s[0]                       \n"
    "umov  w1, v18.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]     \n"
    :
    : [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v13","v14","v15","v16","v17","v18",
      "v19","v20","v21"
);




    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    uint32x2_t vec_l1;
    // vec_l1 = vmul_u32(vec_uuV_rrV[1], vec_M);
    // vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);

  __asm__(
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    // v13 = vec_uuV0_uuV1_rrV0_rrV1

    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v19.4s,  w1                          \n"  
    // v19 = [M, M, M, M]

    "mov    x0, #3  \n"
    "lsl    x0, x0, #30  \n"
    "dup    v20.4s, w0 \n"
    // v20 = vec_4x_2p30a2p31

    "mul    v19.4s, v13.4s, v19.4s \n"
    "bic    v19.16b, v19.16b, v20.16b \n"
    // v19 = [*, l1_left, *, l1_right]
    "uzp2    v19.4s, v19.4s, v19.4s \n"
    // v19 = [l1_left, l1_right, *, *]
    
     "umov   w0, v19.s[0]                        \n"
     "umov   w1, v19.s[1]                        \n"
     "stp    w0, w1, [%[p_vec_l1]]         \n"



    :
    : // pointers
      [p_vec_l1] "r"(&vec_l1),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
  );

    // print_u32x2(vec_l1);


    //
    // vec_prod = vdupq_n_u64(0);
    //
    // // i = 0
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    // vec_uuV_rrV[1] = vadd_u32(vec_uuV_rrV[1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    //
    // for (int i = 0 + 1; i < (9 - 1); i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
    //     vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    //
    // // i = 8
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    // vec_uuV_rrV[8+1] = vadd_u32(vec_uuV_rrV[8+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // vec_uuV_rrV[9+1] = vadd_u32(vec_uuV_rrV[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    
__asm__(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                     \n"
    "ins   v13.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                     \n"
    "ins   v14.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                     \n"
    "ins   v15.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                     \n"
    "ins   v16.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                     \n"
    "ins   v17.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                     \n"
    "ins   v18.d[1], x1                     \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---------- load l1 into v19 --------------------------- */
    "ldp   x0, x1, [%[p_vec_l1]]            \n"
    "ins   v19.d[0], x0                     \n"
    "ins   v19.d[1], x1                     \n"
    /* v19 = vec_l1                                             */

    /* ---------- prepare constants -------------------------- */
    "mov   x0, #1                           \n"
    "lsl   x1, x0, #30                      \n"
    "sub   x1, x1, #1                       \n"
    "dup   v24.2d, x1                       \n"   /* v24 = 2^30−1 */
    "sub   x1, x1, #18                      \n"
    "dup   v20.2d, x1                       \n"   /* v20 = 2^30−19 */
    "lsl   x1, x0, #15                      \n"
    "sub   x1, x1, #1                       \n"
    "dup   v21.2d, x1                       \n"   /* v21 = 2^15−1 */

    /* ---------- prod / buf vectors ------------------------ */
    "movi  v22.2d, #0                       \n"   /* vec_prod */
    /* v23 = vec_buf */

    /* ------------ l1 × V0..V4 accumulate ------------------ */
    "umlal v22.2d, v19.2s, v20.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "shl   v23.2d, v23.2d, #32              \n"
    "add   v13.2d, v13.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "add   v14.2d, v14.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "shl   v23.2d, v23.2d, #32              \n"
    "add   v14.2d, v14.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "add   v15.2d, v15.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "shl   v23.2d, v23.2d, #32              \n"
    "add   v15.2d, v15.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "add   v16.2d, v16.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "shl   v23.2d, v23.2d, #32              \n"
    "add   v16.2d, v16.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v24.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "add   v17.2d, v17.2d, v23.2d           \n"

    "umlal v22.2d, v19.2s, v21.s[0]         \n"
    "and   v23.16b, v22.16b, v24.16b        \n"
    "ushr  v22.2d, v22.2d, #30              \n"
    "shl   v23.2d, v23.2d, #32              \n"
    "add   v17.2d, v17.2d, v23.2d           \n"

    "and   v23.16b, v22.16b, v24.16b        \n"
    "add   v18.2d, v18.2d, v23.2d           \n"

    /* ---------- store back 64-bit uuV/rrV vectors ---------- */
    "umov  x0, v13.d[0]                     \n"
    "umov  x1, v13.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"

    "umov  x0, v14.d[0]                     \n"
    "umov  x1, v14.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v15.d[0]                     \n"
    "umov  x1, v15.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v16.d[0]                     \n"
    "umov  x1, v16.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v17.d[0]                     \n"
    "umov  x1, v17.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v18.d[0]                     \n"
    "umov  x1, v18.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    /* ---------- store 32-bit interleaved uuV/rrV ----------- */
    "umov  w0, v13.s[0]                     \n"
    "umov  w1, v13.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV]]            \n"

    "umov  w0, v13.s[1]                     \n"
    "umov  w1, v13.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #8]        \n"

    "umov  w0, v14.s[0]                     \n"
    "umov  w1, v14.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]       \n"

    "umov  w0, v14.s[1]                     \n"
    "umov  w1, v14.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]       \n"

    "umov  w0, v15.s[0]                     \n"
    "umov  w1, v15.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]       \n"

    "umov  w0, v15.s[1]                     \n"
    "umov  w1, v15.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]       \n"

    "umov  w0, v16.s[0]                     \n"
    "umov  w1, v16.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]       \n"

    "umov  w0, v16.s[1]                     \n"
    "umov  w1, v16.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]       \n"

    "umov  w0, v17.s[0]                     \n"
    "umov  w1, v17.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]       \n"

    "umov  w0, v17.s[1]                     \n"
    "umov  w1, v17.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]       \n"

    "umov  w0, v18.s[0]                     \n"
    "umov  w1, v18.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]       \n"
    :
    : /* pointers */
      [p_vec_l1] "r"(&vec_l1),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v13","v14","v15","v16","v17","v18","v19",
      "v20","v21","v22","v23","v24"
);


    
    // // Step [10]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<9; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_uuV_rrV[i], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_uuV_rrV[i] = vand_u32(vec_uuV_rrV[i], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_uuV_rrV[i+1] = vadd_u32(vec_uuV_rrV[i+1], vec_carry);
    // }
    


__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]] \n"
    "ins   v13.d[0], x0                      \n"
    "ins   v13.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v14.d[0], x0                      \n"
    "ins   v14.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v15.d[0], x0                      \n"
    "ins   v15.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v16.d[0], x0                      \n"
    "ins   v16.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v17.d[0], x0                      \n"
    "ins   v17.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"
    /* v13–v18 = uuV/rrV0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v19.2d, x0                         \n"   /* v19 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v20.2d, x0                         \n"   /* v20 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v21.2d, #0                         \n"   /* v21 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- uuV0/rrV0 (v13) --------------------------------- */
    // "and   v21.16b, v13.16b, v19.16b          \n"
    // "bic   v13.16b, v13.16b, v19.16b          \n"
    // "shl   v21.2d,  v21.2d,  #2               \n"
    // "add   v13.2d,  v13.2d,  v21.2d           \n"

    "and   v21.16b, v13.16b, v20.16b          \n"
    "bic   v13.16b, v13.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v13.2d,  v14.2d,  v21.2d           \n"

    /* ---- uuV2/rrV2 (v14) --------------------------------- */
    "and   v21.16b, v13.16b, v19.16b          \n"
    "bic   v13.16b, v13.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v13.2d,  v13.2d,  v21.2d           \n"

    "and   v21.16b, v13.16b, v20.16b          \n"
    "bic   v13.16b, v13.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v14.2d,  v15.2d,  v21.2d           \n"

    /* ---- uuV4/rrV4 (v15) --------------------------------- */
    "and   v21.16b, v14.16b, v19.16b          \n"
    "bic   v14.16b, v14.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    "and   v21.16b, v14.16b, v20.16b          \n"
    "bic   v14.16b, v14.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v15.2d,  v16.2d,  v21.2d           \n"

    /* ---- uuV6/rrV6 (v16) --------------------------------- */
    "and   v21.16b, v15.16b, v19.16b          \n"
    "bic   v15.16b, v15.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    "and   v21.16b, v15.16b, v20.16b          \n"
    "bic   v15.16b, v15.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v16.2d,  v17.2d,  v21.2d           \n"

    /* ---- uuV8/rrV8 (v17) --------------------------------- */
    "and   v21.16b, v16.16b, v19.16b          \n"
    "bic   v16.16b, v16.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    "and   v21.16b, v16.16b, v20.16b          \n"
    "bic   v16.16b, v16.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v17.2d,  v18.2d,  v21.2d           \n"

    /* ---------- store back 64-bit uuV/rrV vectors ---------- */
    // "umov  x0, v13.d[0]                       \n"
    // "umov  x1, v13.d[1]                       \n"
    // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov  x0, v13.d[0]                       \n"
    "umov  x1, v13.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov  x0, v14.d[0]                       \n"
    "umov  x1, v14.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov  x0, v15.d[0]                       \n"
    "umov  x1, v15.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov  x0, v16.d[0]                       \n"
    "umov  x1, v16.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov  x0, v17.d[0]                       \n"
    "umov  x1, v17.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"

    /* ---------- store 32-bit interleaved uuV/rrV ----------- */
    // "umov  w0, v13.s[0]                       \n"
    // "umov  w1, v13.s[2]                       \n"
    // "stp   w0, w1, [%[p_vec_uuV_rrV]]          \n"
    //
    // "umov  w0, v13.s[1]                       \n"
    // "umov  w1, v13.s[3]                       \n"
    // "stp   w0, w1, [%[p_vec_uuV_rrV], #8]      \n"

    "umov  w0, v13.s[0]                       \n"
    "umov  w1, v13.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]     \n"

    "umov  w0, v13.s[1]                       \n"
    "umov  w1, v13.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]     \n"

    "umov  w0, v14.s[0]                       \n"
    "umov  w1, v14.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]     \n"

    "umov  w0, v14.s[1]                       \n"
    "umov  w1, v14.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]     \n"

    "umov  w0, v15.s[0]                       \n"
    "umov  w1, v15.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]     \n"

    "umov  w0, v15.s[1]                       \n"
    "umov  w1, v15.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]     \n"

    "umov  w0, v16.s[0]                       \n"
    "umov  w1, v16.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]     \n"

    "umov  w0, v16.s[1]                       \n"
    "umov  w1, v16.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]     \n"

    "umov  w0, v17.s[0]                       \n"
    "umov  w1, v17.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]     \n"
    :
    : [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v13","v14","v15","v16","v17","v18",
      "v19","v20","v21"
);









    
    
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

    // uint32x2_t vec_small_tmp;

    // vec_small_tmp = vdup_n_u32(19);
    // for (int i = 0; i < 8; i++)
    // {
    //     vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[i+2]);
    //     vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    // }
    // vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[8+2]);
    //
    // vec_reductionhat = (uint32x2_t)vshr_n_s32(
    //     (int32x2_t)vsub_u32(
    //         vec_u32_2p15m1,
    //         vec_small_tmp
    //     ),
    //     31
    // );


    // vec_uuV_rrV[0+2] = vadd_u32(vec_uuV_rrV[2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    // vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[10], vand_u32(vec_reductionhat, vdup_n_u32(32768)));


__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v13.d[0], x0                     \n"
    "ins   v13.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v14.d[0], x0                     \n"
    "ins   v14.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v15.d[0], x0                     \n"
    "ins   v15.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v16.d[0], x0                     \n"
    "ins   v16.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v17.d[0], x0                     \n"
    "ins   v17.d[1], x1                     \n"
    /* v13–v17 = uuV/rrV0‥8,10                                  */

    /* ---------- prepare constants (mask moved to v24) ------ */
    "mov   x0, #3                           \n"
    "lsl   x0, x0, #30                      \n"
    "dup   v24.2d, x0                       \n"   /* v24 = 2^30+2^31 */
    "lsl   x0, x0, #32                      \n"
    "dup   v19.2d, x0                       \n"   /* v19 = 2^62+2^63 */

    "mov   x0, #19                          \n"
    "dup   v20.2d, x0                       \n"   /* v20 = [19,19] */
    "mov   x0, #1                           \n"
    "lsl   x0, x0, #15                      \n"
    "dup   v26.2d, x0                       \n"   /* v26 = [32768,32768] */
    "sub   x0, x0, #1                       \n"
    "dup   v21.2d, x0                       \n"   /* v21 = [32767,32767] */

    "mov   v22.16b, v20.16b                 \n"   /* v22 = small tmp */

    /* ---------- carry-scan with new slots ----------------- */
    "add   v22.2d, v22.2d, v13.2d           \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v13.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v17.2d          \n"
    "sub   v25.2d, v21.2d, v22.2d           \n"
    "sshr  v25.2d, v25.2d, #63              \n"   /* v25 = reduction-hat */


    /* adjust limbs with reduction-hat */
    "and   v20.16b, v20.16b, v25.16b        \n"
    "add   v13.2d,  v13.2d,  v20.2d         \n"
    "and   v26.16b, v26.16b, v25.16b        \n"
    "sub   v17.2d,  v17.2d,  v26.2d         \n"

    /* ---------- store back 64-bit uuV/rrV vectors --------- */
    "umov  x0, v13.d[0]                     \n"
    "umov  x1, v13.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v14.d[0]                     \n"
    "umov  x1, v14.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v15.d[0]                     \n"
    "umov  x1, v15.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v16.d[0]                     \n"
    "umov  x1, v16.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v17.d[0]                     \n"
    "umov  x1, v17.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    /* ---------- store 32-bit interleaved uuV/rrV ---------- */
    "umov  w0, v13.s[0]                     \n"
    "umov  w1, v13.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]  \n"

    "umov  w0, v13.s[1]                     \n"
    "umov  w1, v13.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]  \n"

    "umov  w0, v14.s[0]                     \n"
    "umov  w1, v14.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]  \n"

    "umov  w0, v14.s[1]                     \n"
    "umov  w1, v14.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]  \n"

    "umov  w0, v15.s[0]                     \n"
    "umov  w1, v15.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]  \n"

    "umov  w0, v15.s[1]                     \n"
    "umov  w1, v15.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]  \n"

    "umov  w0, v16.s[0]                     \n"
    "umov  w1, v16.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]  \n"

    "umov  w0, v16.s[1]                     \n"
    "umov  w1, v16.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]  \n"

    "umov  w0, v17.s[0]                     \n"
    "umov  w1, v17.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]  \n"
    :
    : [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
      // [p_vec_reductionhat]        "r"(&vec_reductionhat)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v13","v14","v15","v16","v17",
      "v19","v20","v21","v22","v24","v25"
);


    // // Step [13]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<8; i++){
    //     vec_carry = vshr_n_u32(vec_uuV_rrV[i+2], 30);
    //     vec_uuV_rrV[i+2] = vand_u32(vec_uuV_rrV[i+2], vec_u32_2p30m1);
    //     vec_uuV_rrV[i+3] = vadd_u32(vec_uuV_rrV[i+3], vec_carry);
    // }


  __asm__(
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
    "ins   v14.d[0], x0              \n"
    "ins   v14.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
    "ins   v15.d[0], x0              \n"
    "ins   v15.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
    "ins   v16.d[0], x0              \n"
    "ins   v16.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
    "ins   v17.d[0], x0              \n"
    "ins   v17.d[1], x1              \n"
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0



    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x1 = 2p30a2p31
    "dup   v18.2d, x0               \n"
    // v18 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v19.2d, x0               \n"
    // v19 = vec_2x_2p62a2p63


    "movi  v20.2d, #0                \n"
    // v20 = vec_carry


    // "and   v20.16b, v12.16b, v18.16b   \n"
    // "bic   v12.16b, v12.16b, v18.16b   \n"
    // "shl   v20.2d,  v20.2d,  #2       \n"
    // "add   v12.2d,  v12.2d,  v20.2d   \n"

    // "and   v20.16b, v12.16b, v19.16b   \n"
    // "bic   v12.16b, v12.16b, v19.16b   \n"
    // "ushr  v20.2d,  v20.2d,  #62       \n"
    // "add   v13.2d,  v13.2d,  v20.2d   \n"


    "and   v20.16b, v13.16b, v18.16b   \n"
    "bic   v13.16b, v13.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v13.2d,  v13.2d,  v20.2d   \n"

    "and   v20.16b, v13.16b, v19.16b   \n"
    "bic   v13.16b, v13.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"


    "and   v20.16b, v14.16b, v18.16b   \n"
    "bic   v14.16b, v14.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"

    "and   v20.16b, v14.16b, v19.16b   \n"
    "bic   v14.16b, v14.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"


    "and   v20.16b, v15.16b, v18.16b   \n"
    "bic   v15.16b, v15.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"

    "and   v20.16b, v15.16b, v19.16b   \n"
    "bic   v15.16b, v15.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"


    "and   v20.16b, v16.16b, v18.16b   \n"
    "bic   v16.16b, v16.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"

    "and   v20.16b, v16.16b, v19.16b   \n"
    "bic   v16.16b, v16.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v17.2d,  v17.2d,  v20.2d   \n"
    // dump to 
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"
     "umov   w0, v14.s[0]                        \n"
     "umov   w1, v14.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"
     "umov   w0, v14.s[1]                        \n"
     "umov   w1, v14.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"
     "umov   w0, v15.s[1]                        \n"
     "umov   w1, v15.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"
     "umov   w0, v16.s[0]                        \n"
     "umov   w1, v16.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"
     "umov   w0, v16.s[1]                        \n"
     "umov   w1, v16.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"
     "umov   w0, v17.s[0]                        \n"
     "umov   w1, v17.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"

    :
    : // pointers
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
  );


    //
    //
    // // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)
    // vec_uuV_rrV[2] = vadd_u32(vec_uuV_rrV[2] , vand_u32(vec_uhat_rhat, vec_u32_2p30m19));
    // vec_uuV_rrV[2] = vsub_u32(vec_uuV_rrV[2] , vand_u32(vec_uhat_rhat, vec_V[0]));
    // for (int i = 0 + 1; i < (9 - 1); i++)
    // {
    //     vec_uuV_rrV[i+2] = vadd_u32(vec_uuV_rrV[i+2] , vand_u32(vec_uhat_rhat, vec_u32_2p30m1));
    //     vec_uuV_rrV[i+2] = vsub_u32(vec_uuV_rrV[i+2] , vand_u32(vec_uhat_rhat, vec_V[i]));
    // }
    // vec_uuV_rrV[8+2] = vadd_u32(vec_uuV_rrV[8+2] , vand_u32(vec_uhat_rhat, vec_u32_2p15m1));
    // vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[8+2] , vand_u32(vec_uhat_rhat, vec_V[8]));
    //
    //
    // // Step [15]: borrow propogation
    // for (int i = 0; i < 8; i++)
    // {   
    //     // borrow = tmp[i] >> 31;
    //     vec_borrow = vshr_n_u32(vec_uuV_rrV[i+2],31);
    //     // tmp[i+1] = tmp[i+1] - borrow;
    //     vec_uuV_rrV[i+1+2] = vsub_u32(vec_uuV_rrV[i+1+2], vec_borrow);
    //     // tmp[i+0] = tmp[i+0] + (borrow << 30);
    //     vec_uuV_rrV[i+0+2] = vadd_u32(vec_uuV_rrV[i+0+2], vshl_n_u32(vec_borrow,30));
    // }
    //

  __asm__(
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]] \n"
    "ins   v0.d[0], x0              \n"
    "ins   v0.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]] \n"
    "ins   v1.d[0], x0              \n"
    "ins   v1.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]] \n"
    "ins   v2.d[0], x0              \n"
    "ins   v2.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]] \n"
    "ins   v3.d[0], x0              \n"
    "ins   v3.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]] \n"
    "ins   v4.d[0], x0              \n"
    "ins   v4.d[1], x1              \n"


    "ldp   x0, x1, [%[p_vec_uuhat_rrhat_vvhat_sshat]]\n"
    "ins   v12.d[0], x0              \n"
    "ins   v12.d[1], x1              \n"


    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
    "ins   v14.d[0], x0              \n"
    "ins   v14.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
    "ins   v15.d[0], x0              \n"
    "ins   v15.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
    "ins   v16.d[0], x0              \n"
    "ins   v16.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
    "ins   v17.d[0], x0              \n"
    "ins   v17.d[1], x1              \n"
    // v12 = vec_uuV0_uuV1_rrV0_rrV1
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    /* v18 = 2^30-1  (0x3fffffff) */
    "mov     x0, #1     \n"
    "lsl     x0, x0, #30\n"
    "sub     x0, x0, #1 \n"
    "dup     v18.4s, w0\n"

    /* v22 = 2^15-1  (0x7fff)      */
    "mov     x0, #1     \n"
    "lsl     x0, x0, #15\n"
    "sub     x0, x0, #1 \n"
    "dup     v22.2d,  x0\n"

    /* v23 = zip(ûh,ûh,r̂h,r̂h)    */
    "zip1    v23.4s,  v12.4s,  v12.4s   \n"
    /* = [uhat,uhat,rhat,rhat] */


    "zip1    v21.2d,  v0.2d,  v0.2d \n"
    "sub     v21.4s,  v18.4s,  v21.4s\n"
    "and     v21.16b, v21.16b,  v23.16b\n"
    "add     v13.4s,  v13.4s,  v21.4s\n"

    "zip1    v21.2d,  v1.2d,  v1.2d \n"
    "sub     v21.4s,  v18.4s,  v21.4s\n"
    "and     v21.16b, v21.16b,  v23.16b\n"
    "add     v14.4s,  v14.4s,  v21.4s\n"

    "zip1    v21.2d,  v2.2d,  v2.2d \n"
    "sub     v21.4s,  v18.4s,  v21.4s\n"
    "and     v21.16b, v21.16b,  v23.16b\n"
    "add     v15.4s,  v15.4s,  v21.4s\n"

    "zip1    v21.2d,  v3.2d,  v3.2d \n"
    "sub     v21.4s,  v18.4s,  v21.4s\n"
    "and     v21.16b, v21.16b,  v23.16b\n"
    "add     v16.4s,  v16.4s,  v21.4s\n"

    "zip1    v21.2d,  v4.2d,  v4.2d \n"
    "sub     v21.4s,  v22.4s,  v21.4s\n"
    "and     v21.16b, v21.16b,  v23.16b\n"
    "add     v17.4s,  v17.4s,  v21.4s\n"

    /* carry propogation */
    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x0 = 2p30a2p31
    "dup   v18.2d, x0               \n"
    // v18 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v19.2d, x0               \n"
    // v19 = vec_2x_2p62a2p63


    "movi  v20.2d, #0                \n"
    // v20 = vec_carry



    "and   v20.16b, v13.16b, v18.16b   \n"




    "bic   v13.16b, v13.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v13.2d,  v13.2d,  v20.2d   \n"

    "and   v20.16b, v13.16b, v19.16b   \n"
    "bic   v13.16b, v13.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"


    "and   v20.16b, v14.16b, v18.16b   \n"
    "bic   v14.16b, v14.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"

    "and   v20.16b, v14.16b, v19.16b   \n"
    "bic   v14.16b, v14.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"


    "and   v20.16b, v15.16b, v18.16b   \n"
    "bic   v15.16b, v15.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"

    "and   v20.16b, v15.16b, v19.16b   \n"
    "bic   v15.16b, v15.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"


    "and   v20.16b, v16.16b, v18.16b   \n"
    "bic   v16.16b, v16.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"

    "and   v20.16b, v16.16b, v19.16b   \n"
    "bic   v16.16b, v16.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v17.2d,  v17.2d,  v20.2d   \n"


    /* minus 18 from uuV[0], rrV[0] */
    "mov     x0, #18                   \n"
    "dup     v18.2d, x0               \n"
    "and     v18.16b,  v18.16b,  v23.16b\n"
    "sub     v13.4s,  v13.4s,  v18.4s\n"

    /* borrow propogation */

    "mov     x0, #1                   \n"
    "lsl     x0, x0, #31                   \n"
    "dup     v18.2d, x0               \n"
    "lsl     x0, x0, #32                   \n"
    "dup     v19.2d, x0               \n"
    // v18 = vec_2p31
    // v19 = vec_2p63

    "mov     x0, #3                   \n"
    "lsl     x0, x0, #30                   \n"
    "dup     v20.2d, x0               \n"
    "lsl     x0, x0, #32                   \n"
    "dup     v21.2d, x0               \n"
    // v20 = vec_2x_2p30a2p31
    // v21 = vec_2x_2p62a2p63

     // v22 = vec_borrow
     "and     v22.16b, v13.16b, v18.16b\n"
     "bic     v13.16b, v13.16b, v20.16b\n"
     "shl     v22.2d,  v22.2d, #1      \n"
     "sub     v13.4s,  v13.4s, v22.4s  \n"

     "and     v22.16b, v13.16b, v19.16b\n"
     "bic     v13.16b, v13.16b, v21.16b\n"
     "ushr    v22.2d,  v22.2d, #63     \n"
     "sub     v14.4s,  v14.4s, v22.4s  \n"


     "and     v22.16b, v14.16b, v18.16b\n"
     "bic     v14.16b, v14.16b, v20.16b\n"
     "shl     v22.2d,  v22.2d, #1      \n"
     "sub     v14.4s,  v14.4s, v22.4s  \n"

     "and     v22.16b, v14.16b, v19.16b\n"
     "bic     v14.16b, v14.16b, v21.16b\n"
     "ushr    v22.2d,  v22.2d, #63     \n"
     "sub     v15.4s,  v15.4s, v22.4s  \n"


     "and     v22.16b, v15.16b, v18.16b\n"
     "bic     v15.16b, v15.16b, v20.16b\n"
     "shl     v22.2d,  v22.2d, #1      \n"
     "sub     v15.4s,  v15.4s, v22.4s  \n"

     "and     v22.16b, v15.16b, v19.16b\n"
     "bic     v15.16b, v15.16b, v21.16b\n"
     "ushr    v22.2d,  v22.2d, #63     \n"
     "sub     v16.4s,  v16.4s, v22.4s  \n"


     "and     v22.16b, v16.16b, v18.16b\n"
     "bic     v16.16b, v16.16b, v20.16b\n"
     "shl     v22.2d,  v22.2d, #1      \n"
     "sub     v16.4s,  v16.4s, v22.4s  \n"

     "and     v22.16b, v16.16b, v19.16b\n"
     "bic     v16.16b, v16.16b, v21.16b\n"
     "ushr    v22.2d,  v22.2d, #63     \n"
     "sub     v17.4s,  v17.4s, v22.4s  \n"
    // dump to 
    // v12 = vec_uuV0_uuV1_rrV0_rrV1
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0


    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"
    "umov   w0, v14.s[0]                        \n"
    "umov   w1, v14.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"
    "umov   w0, v14.s[1]                        \n"
    "umov   w1, v14.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"
    "umov   w0, v15.s[1]                        \n"
    "umov   w1, v15.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"
    "umov   w0, v16.s[0]                        \n"
    "umov   w1, v16.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"
    "umov   w0, v16.s[1]                        \n"
    "umov   w1, v16.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"
    "umov   w0, v17.s[0]                        \n"
    "umov   w1, v17.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"
    :
    : // pointers
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0] "r"(&vec_V8_0_S8_0),
      [p_vec_uuhat_rrhat_vvhat_sshat] "r"(&vec_uuhat_rrhat_vvhat_sshat),
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1","x2","x3",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10",
      "v11","v12","v13","v14","v15","v16","v17","v18","v19","v20",
      "v21","v22","v23"
  );

    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    // vec_small_tmp = vdup_n_u32(19ULL);
    // for (int i = 0; i < 8; i++)
    // {
    //     vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[i+2]);
    //     vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    // }
    // vec_small_tmp = vadd_u32(vec_small_tmp, vec_uuV_rrV[8+2]);
    //
    // vec_reductionhat = (uint32x2_t)vshr_n_s32(
    //     (int32x2_t)vsub_u32(
    //         vec_u32_2p15m1,
    //         vec_small_tmp
    //     ),
    //     31
    // );
    //
    // vec_uuV_rrV[0+2] = vadd_u32(vec_uuV_rrV[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    // vec_uuV_rrV[8+2] = vsub_u32(vec_uuV_rrV[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));

__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v13.d[0], x0                     \n"
    "ins   v13.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v14.d[0], x0                     \n"
    "ins   v14.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v15.d[0], x0                     \n"
    "ins   v15.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v16.d[0], x0                     \n"
    "ins   v16.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v17.d[0], x0                     \n"
    "ins   v17.d[1], x1                     \n"
    /* v13–v17 = uuV/rrV0‥8,10                                  */
    /* ---------- prepare constants (mask moved to v24) ------ */
    "mov   x0, #3                           \n"
    "lsl   x0, x0, #30                      \n"
    "dup   v24.2d, x0                       \n"   /* v24 = 2^30+2^31 */
    "lsl   x0, x0, #32                      \n"
    "dup   v19.2d, x0                       \n"   /* v19 = 2^62+2^63 */

    "mov   x0, #19                          \n"
    "dup   v20.2d, x0                       \n"   /* v20 = [19,19] */
    "mov   x0, #1                           \n"
    "lsl   x0, x0, #15                      \n"
    "dup   v26.2d, x0                       \n"   /* v26 = [32768,32768] */
    "sub   x0, x0, #1                       \n"
    "dup   v21.2d, x0                       \n"   /* v21 = [32767,32767] */

    "mov   v22.16b, v20.16b                 \n"   /* v22 = small tmp */

    /* ---------- carry-scan with new slots ----------------- */
    "add   v22.2d, v22.2d, v13.2d           \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v13.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v17.2d          \n"
    "sub   v25.2d, v21.2d, v22.2d           \n"
    "sshr  v25.2d, v25.2d, #63              \n"   /* v25 = reduction-hat */


    /* adjust limbs with reduction-hat */
    "and   v20.16b, v20.16b, v25.16b        \n"
    "add   v13.2d,  v13.2d,  v20.2d         \n"
    "and   v26.16b, v26.16b, v25.16b        \n"
    "sub   v17.2d,  v17.2d,  v26.2d         \n"


    /* ---------- store back 64-bit uuV/rrV vectors --------- */
    "umov  x0, v13.d[0]                     \n"
    "umov  x1, v13.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v14.d[0]                     \n"
    "umov  x1, v14.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v15.d[0]                     \n"
    "umov  x1, v15.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v16.d[0]                     \n"
    "umov  x1, v16.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v17.d[0]                     \n"
    "umov  x1, v17.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    /* ---------- store 32-bit interleaved uuV/rrV ---------- */
    "umov  w0, v13.s[0]                     \n"
    "umov  w1, v13.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #16]  \n"

    "umov  w0, v13.s[1]                     \n"
    "umov  w1, v13.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #24]  \n"

    "umov  w0, v14.s[0]                     \n"
    "umov  w1, v14.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #32]  \n"

    "umov  w0, v14.s[1]                     \n"
    "umov  w1, v14.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #40]  \n"

    "umov  w0, v15.s[0]                     \n"
    "umov  w1, v15.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #48]  \n"

    "umov  w0, v15.s[1]                     \n"
    "umov  w1, v15.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #56]  \n"

    "umov  w0, v16.s[0]                     \n"
    "umov  w1, v16.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #64]  \n"

    "umov  w0, v16.s[1]                     \n"
    "umov  w1, v16.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #72]  \n"

    "umov  w0, v17.s[0]                     \n"
    "umov  w1, v17.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_uuV_rrV], #80]  \n"
    :
    : [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0]     "r"(&vec_uuV10_0_rrV10_0)
      // [p_vec_reductionhat]        "r"(&vec_reductionhat)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v13","v14","v15","v16","v17",
      "v19","v20","v21","v22","v24","v25"
);



    // // Step [17]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<8; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_uuV_rrV[i+2], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_uuV_rrV[i+2] = vand_u32(vec_uuV_rrV[i+2], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_uuV_rrV[i+1+2] = vadd_u32(vec_uuV_rrV[i+1+2], vec_carry);
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
    "ins   v14.d[0], x0              \n"
    "ins   v14.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
    "ins   v15.d[0], x0              \n"
    "ins   v15.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
    "ins   v16.d[0], x0              \n"
    "ins   v16.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
    "ins   v17.d[0], x0              \n"
    "ins   v17.d[1], x1              \n"
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0



    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x1 = 2p30a2p31
    "dup   v18.2d, x0               \n"
    // v18 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v19.2d, x0               \n"
    // v19 = vec_2x_2p62a2p63


    "movi  v20.2d, #0                \n"
    // v20 = vec_carry


    // "and   v20.16b, v12.16b, v18.16b   \n"
    // "bic   v12.16b, v12.16b, v18.16b   \n"
    // "shl   v20.2d,  v20.2d,  #2       \n"
    // "add   v12.2d,  v12.2d,  v20.2d   \n"

    // "and   v20.16b, v12.16b, v19.16b   \n"
    // "bic   v12.16b, v12.16b, v19.16b   \n"
    // "ushr  v20.2d,  v20.2d,  #62       \n"
    // "add   v13.2d,  v13.2d,  v20.2d   \n"


    "and   v20.16b, v13.16b, v18.16b   \n"
    "bic   v13.16b, v13.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v13.2d,  v13.2d,  v20.2d   \n"

    "and   v20.16b, v13.16b, v19.16b   \n"
    "bic   v13.16b, v13.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"


    "and   v20.16b, v14.16b, v18.16b   \n"
    "bic   v14.16b, v14.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"

    "and   v20.16b, v14.16b, v19.16b   \n"
    "bic   v14.16b, v14.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"


    "and   v20.16b, v15.16b, v18.16b   \n"
    "bic   v15.16b, v15.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"

    "and   v20.16b, v15.16b, v19.16b   \n"
    "bic   v15.16b, v15.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"


    "and   v20.16b, v16.16b, v18.16b   \n"
    "bic   v16.16b, v16.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"

    "and   v20.16b, v16.16b, v19.16b   \n"
    "bic   v16.16b, v16.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v17.2d,  v17.2d,  v20.2d   \n"
    // dump to 
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #24]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"
     "umov   w0, v14.s[0]                        \n"
     "umov   w1, v14.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #32]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"
     "umov   w0, v14.s[1]                        \n"
     "umov   w1, v14.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_uuV_rrV], #48]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"
     "umov   w0, v15.s[1]                        \n"
     "umov   w1, v15.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #56]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"
     "umov   w0, v16.s[0]                        \n"
     "umov   w1, v16.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #64]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"
     "umov   w0, v16.s[1]                        \n"
     "umov   w1, v16.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #72]         \n"

     // "ldp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"
     "umov   w0, v17.s[0]                        \n"
     "umov   w1, v17.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_uuV_rrV], #80]         \n"

    :
    : // pointers
      [p_vec_uuV_rrV] "r"(vec_uuV_rrV),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
  );


    // So fat, vec_uuV_rrV[2:11] stores [ u*V*R-1 mod P, r*V*R-1 mod P ]


    uint32x4_t vec_vvS0_vvS1_ssS0_ssS1;
    uint32x4_t vec_vvS2_vvS3_ssS2_ssS3;
    uint32x4_t vec_vvS4_vvS5_ssS4_ssS5;
    uint32x4_t vec_vvS6_vvS7_ssS6_ssS7;
    uint32x4_t vec_vvS8_vvS9_ssS8_ssS9;
    uint32x4_t vec_vvS10_0_ssS10_0;


    // Step [1]: Initialization 



    // vec_tmp[0..10] = initialize to zero
    uint32x2_t vec_vvS_ssS[11]; 
    // for (int i = 0; i < 11; i++) {
    //     vec_vvS_ssS[i] = vdup_n_u32(0);
    // }
    //
    //
    //
    //
    // // Step [2]: Decompose inputs (v, s) into limb formers
    //
    //
    // // Step [3]: tmp += v0 * S, s0 * S
    // vec_prod = vdupq_n_u64(0);
    // for (int i = 0; i < 9; i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v0_s0 );
    //     vec_vvS_ssS[i] = vadd_u32(vec_vvS_ssS[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_vvS_ssS[9] = vadd_u32(vec_vvS_ssS[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

__asm__ volatile(
    /* ---------- load source limbs -------------------------------- */
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]]      \n"
    "ins   v0.d[0],  x0                        \n"
    "ins   v0.d[1],  x1                        \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]]      \n"
    "ins   v1.d[0],  x0                        \n"
    "ins   v1.d[1],  x1                        \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]]      \n"
    "ins   v2.d[0],  x0                        \n"
    "ins   v2.d[1],  x1                        \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]]      \n"
    "ins   v3.d[0],  x0                        \n"
    "ins   v3.d[1],  x1                        \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]]        \n"
    "ins   v4.d[0],  x0                        \n"
    "ins   v4.d[1],  x1                        \n"

    /* ---------- load (û0,r̂0,ṽ0,ṡ0) ----------------------------- */
    "ldp   x0, x1, [%[p_vec_uu0_rr0_vv0_ss0]]  \n"
    "ins   v5.d[0],  x0                        \n"
    "ins   v5.d[1],  x1                        \n"

    /* ---------- load previous vvS/ssS ----------------------------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                        \n"
    "ins   v18.d[1], x1                        \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                        \n"
    "ins   v19.d[1], x1                        \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                        \n"
    "ins   v20.d[1], x1                        \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                        \n"
    "ins   v21.d[1], x1                        \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                        \n"
    "ins   v22.d[1], x1                        \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]     \n"
    "ins   v23.d[0], x0                        \n"
    "ins   v23.d[1], x1                        \n"

    /* ---------- clear working accumulators ----------------------- */
    "movi  v18.2d, #0      \n"
    "movi  v19.2d, #0      \n"
    "movi  v20.2d, #0      \n"
    "movi  v21.2d, #0      \n"
    "movi  v22.2d, #0      \n"
    "movi  v23.2d, #0      \n"

    /* ---------- constant mask (2^30-1) → v24 --------------------- */
    "mov   x0, #1          \n"
    "lsl   x0, x0, #30     \n"
    "sub   x0, x0, #1      \n"
    "dup   v24.2d, x0      \n"

    /* ---------- prod / buf vectors ------------------------------- */
    "movi  v25.2d, #0      \n"   /* v25 = vec_prod */
    /* v26 = vec_buf */

    /* ---------- multiply (high limbs, umlal2) -------------------- */
    "umlal2 v25.2d, v5.4s, v0.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v18.2d,  v18.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v0.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v18.2d,  v18.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v1.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v19.2d,  v19.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v1.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v19.2d,  v19.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v2.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v20.2d,  v20.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v2.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v20.2d,  v20.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v3.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v21.2d,  v21.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v3.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v21.2d,  v21.2d, v26.2d    \n"

    "umlal2 v25.2d, v5.4s, v4.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v22.2d,  v22.2d, v26.2d    \n"

    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v22.2d,  v22.2d, v26.2d    \n"

    /* ---------- write-back (64‑bit) ------------------------------- */
    "umov   x0, v18.d[0]                     \n"
    "umov   x1, v18.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"

    "umov   x0, v19.d[0]                     \n"
    "umov   x1, v19.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov   x0, v20.d[0]                     \n"
    "umov   x1, v20.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov   x0, v21.d[0]                     \n"
    "umov   x1, v21.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov   x0, v22.d[0]                     \n"
    "umov   x1, v22.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov   x0, v23.d[0]                     \n"
    "umov   x1, v23.d[1]                     \n"
    "stp    x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---------- write-back (32‑bit inter‑leave) ------------------- */
    /* offset 0‑8 */
    "umov   w0, v18.s[0]                     \n"
    "umov   w1, v18.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS]]       \n"

    "umov   w0, v18.s[1]                     \n"
    "umov   w1, v18.s[3]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #8]   \n"

    /* offset 16‑24 */
    "umov   w0, v19.s[0]                     \n"
    "umov   w1, v19.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #16]  \n"

    "umov   w0, v19.s[1]                     \n"
    "umov   w1, v19.s[3]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #24]  \n"

    /* offset 32‑40 */
    "umov   w0, v20.s[0]                     \n"
    "umov   w1, v20.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #32]  \n"

    "umov   w0, v20.s[1]                     \n"
    "umov   w1, v20.s[3]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #40]  \n"

    /* offset 48‑56 */
    "umov   w0, v21.s[0]                     \n"
    "umov   w1, v21.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #48]  \n"

    "umov   w0, v21.s[1]                     \n"
    "umov   w1, v21.s[3]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #56]  \n"

    /* offset 64‑72 */
    "umov   w0, v22.s[0]                     \n"
    "umov   w1, v22.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #64]  \n"

    "umov   w0, v22.s[1]                     \n"
    "umov   w1, v22.s[3]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #72]  \n"

    /* offset 80 */
    "umov   w0, v23.s[0]                     \n"
    "umov   w1, v23.s[2]                     \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #80]  \n"

    :
    : [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0]   "r"(&vec_V8_0_S8_0),
      [p_vec_uu0_rr0_vv0_ss0] "r"(&vec_uu0_rr0_vv0_ss0),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v18","v19","v20","v21","v22","v23",
      "v24","v25","v26"
);









    
    // Step [4]: l0 = tmp2[0] * M mod 2^30
    //            and tmp2 += l0 * P
    // vec_l0 = vmul_u32(vec_vvS_ssS[0], vec_M);
    // vec_l0 = vand_u32(vec_l0 ,vec_u32_2p30m1);

__asm__ volatile(

    "ldr    w0, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]              \n" 
    "ldr    w1, [%[p_vec_vvS0_vvS1_ssS0_ssS1], #8]              \n" 
    "ins    v18.s[0], w0   \n"
    "ins    v18.s[1], w1   \n"

    /* === 2. 建立 vec_M = [678152731, 678152731] = 0x286BCA1B ==== */
    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v24.2s,  w1                          \n"  

    /* === 3. vec_l0 = (v0 * v1) & (2³⁰‑1) ====================== */
    "mul    v24.2s, v18.2s, v24.2s                 \n"

        /* 2³⁰‑1 mask：0x3FFFFFFF */
    "mov    w1,  #1                             \n"
    "lsl    w1,  w1,  #30                       \n"
    "sub    w1,  w1,  #1                        \n"
    "dup    v25.2s,  w1                          \n"

    "and    v24.8b, v24.8b, v25.8b                 \n"
    "st1    {v24.2s}, [%[p_vec_l0]]              \n"

    :
    : [p_vec_vvS0_vvS1_ssS0_ssS1]   "r" (&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_l0]   "r" (&vec_l0)
    : "memory",
      /* GPR */
      "w0","w1",
      /* NEON */
      "v0","v1","v2","v3","v4","v18","v24","v25"
);




    // vec_prod = vdupq_n_u64(0);
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l0 );
    // vec_vvS_ssS[0] = vadd_u32(vec_vvS_ssS[0], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // for (int i = 0 + 1; i < (9 - 1); i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l0 );
    //     vec_vvS_ssS[i] = vadd_u32(vec_vvS_ssS[i], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l0 );
    // vec_vvS_ssS[8] = vadd_u32(vec_vvS_ssS[8], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // vec_vvS_ssS[9] = vadd_u32(vec_vvS_ssS[9], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

__asm__ volatile(
    /* ---- load l0 (2×32-bit) → v24.s[0,1] ----------------- */
    "ldp   w0, w1, [%[p_vec_l0]]          \n"
    "ins   v24.s[0], w0                   \n"
    "ins   v24.s[1], w1                   \n"

    /* ---- load accumulated vvS/ssS vectors ---------------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                   \n"
    "ins   v18.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                   \n"
    "ins   v19.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                   \n"
    "ins   v20.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                   \n"
    "ins   v21.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                   \n"
    "ins   v22.d[1], x1                   \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v23.d[0], x0                   \n"
    "ins   v23.d[1], x1                   \n"
    /* v18–v23 = vvS/ssS0‥10                                   */

    /* ---- prepare constants -------------------------------- */
    "mov   x0, #1                         \n"
    "lsl   x1, x0, #30                    \n"
    "sub   x1, x1, #1                     \n"
    "dup   v27.2d, x1                     \n"   /* 2^30-1  */
    "sub   x1, x1, #18                    \n"
    "dup   v25.2d, x1                     \n"   /* 2^30-19 */
    "lsl   x1, x0, #15                    \n"
    "sub   x1, x1, #1                     \n"
    "dup   v29.2d, x1                     \n"   /* 2^15-1  */

    /* ---- initialize prod / buf ---------------------------- */
    "movi  v30.2d, #0                     \n"   /* vec_prod */
    /* v31 = vec_buf (masked limbs)                           */

    /* ------------ accumulate (l0 × constants) -------------- */
    /* —— vvS0 / ssS0 ——————————————— */
    "umlal v30.2d, v24.2s, v25.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "add   v18.2d, v18.2d, v31.2d         \n"

    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "shl   v31.2d, v31.2d, #32            \n"
    "add   v18.2d, v18.2d, v31.2d         \n"

    /* —— vvS2 / ssS2 ——————————————— */
    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "add   v19.2d, v19.2d, v31.2d         \n"

    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "shl   v31.2d, v31.2d, #32            \n"
    "add   v19.2d, v19.2d, v31.2d         \n"

    /* —— vvS4 / ssS4 ——————————————— */
    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "add   v20.2d, v20.2d, v31.2d         \n"

    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "shl   v31.2d, v31.2d, #32            \n"
    "add   v20.2d, v20.2d, v31.2d         \n"

    /* —— vvS6 / ssS6 ——————————————— */
    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "add   v21.2d, v21.2d, v31.2d         \n"

    "umlal v30.2d, v24.2s, v27.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "shl   v31.2d, v31.2d, #32            \n"
    "add   v21.2d, v21.2d, v31.2d         \n"

    /* —— vvS8 / ssS8 ——————————————— */
    "umlal v30.2d, v24.2s, v29.s[0]       \n"
    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "add   v22.2d, v22.2d, v31.2d         \n"

    "and   v31.16b, v30.16b, v27.16b      \n"
    "ushr  v30.2d, v30.2d, #30            \n"
    "shl   v31.2d, v31.2d, #32            \n"
    "add   v22.2d, v22.2d, v31.2d         \n"

    /* ---- store back 64-bit vvS/ssS vectors ---------------- */
    "umov  x0, v18.d[0]                   \n"
    "umov  x1, v18.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"

    "umov  x0, v19.d[0]                   \n"
    "umov  x1, v19.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov  x0, v20.d[0]                   \n"
    "umov  x1, v20.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov  x0, v21.d[0]                   \n"
    "umov  x1, v21.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov  x0, v22.d[0]                   \n"
    "umov  x1, v22.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov  x0, v23.d[0]                   \n"
    "umov  x1, v23.d[1]                   \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---- store 32-bit interleaved vvS/ssS ------------------ */
    "umov  w0, v18.s[0]                   \n"
    "umov  w1, v18.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS]]           \n"

    "umov  w0, v18.s[1]                   \n"
    "umov  w1, v18.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #8]       \n"

    "umov  w0, v19.s[0]                   \n"
    "umov  w1, v19.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]      \n"

    "umov  w0, v19.s[1]                   \n"
    "umov  w1, v19.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]      \n"

    "umov  w0, v20.s[0]                   \n"
    "umov  w1, v20.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]      \n"

    "umov  w0, v20.s[1]                   \n"
    "umov  w1, v20.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]      \n"

    "umov  w0, v21.s[0]                   \n"
    "umov  w1, v21.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]      \n"

    "umov  w0, v21.s[1]                   \n"
    "umov  w1, v21.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]      \n"

    "umov  w0, v22.s[0]                   \n"
    "umov  w1, v22.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]      \n"

    "umov  w0, v22.s[1]                   \n"
    "umov  w1, v22.s[3]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]      \n"

    "umov  w0, v23.s[0]                   \n"
    "umov  w1, v23.s[2]                   \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]      \n"
    :
    : /* pointers */
      [p_vec_l0]   "r" (&vec_l0),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v18","v19","v20","v21","v22","v23",
      "v24","v25","v27","v28","v29","v30","v31"
);

    // Step [5]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i < 9; i++){
    //     vec_carry = vshr_n_u32(vec_vvS_ssS[i], 30);
    //     vec_vvS_ssS[i] = vand_u32(vec_vvS_ssS[i], vec_u32_2p30m1);
    //     vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vec_carry);
    // }
__asm__ volatile(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v13.d[0], x0                      \n"
    "ins   v13.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v14.d[0], x0                      \n"
    "ins   v14.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v15.d[0], x0                      \n"
    "ins   v15.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v16.d[0], x0                      \n"
    "ins   v16.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v17.d[0], x0                      \n"
    "ins   v17.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"
    /* v13–v18 = vvS/ssS0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v19.2d, x0                         \n"   /* v19 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v20.2d, x0                         \n"   /* v20 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v21.2d, #0                         \n"   /* v21 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- vvS0/ssS0 (v13) --------------------------------- */
    "and   v21.16b, v13.16b, v19.16b          \n"
    "bic   v13.16b, v13.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v13.2d,  v13.2d,  v21.2d           \n"

    "and   v21.16b, v13.16b, v20.16b          \n"
    "bic   v13.16b, v13.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    /* ---- vvS2/ssS2 (v14) --------------------------------- */
    "and   v21.16b, v14.16b, v19.16b          \n"
    "bic   v14.16b, v14.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v14.2d,  v14.2d,  v21.2d           \n"

    "and   v21.16b, v14.16b, v20.16b          \n"
    "bic   v14.16b, v14.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    /* ---- vvS4/ssS4 (v15) --------------------------------- */
    "and   v21.16b, v15.16b, v19.16b          \n"
    "bic   v15.16b, v15.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v15.2d,  v15.2d,  v21.2d           \n"

    "and   v21.16b, v15.16b, v20.16b          \n"
    "bic   v15.16b, v15.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    /* ---- vvS6/ssS6 (v16) --------------------------------- */
    "and   v21.16b, v16.16b, v19.16b          \n"
    "bic   v16.16b, v16.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v16.2d,  v16.2d,  v21.2d           \n"

    "and   v21.16b, v16.16b, v20.16b          \n"
    "bic   v16.16b, v16.16b, v20.16b          \n"
    "ushr  v21.2d,  v21.2d,  #62              \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    /* ---- vvS8/ssS8 (v17) --------------------------------- */
    "and   v21.16b, v17.16b, v19.16b          \n"
    "bic   v17.16b, v17.16b, v19.16b          \n"
    "shl   v21.2d,  v21.2d,  #2               \n"
    "add   v17.2d,  v17.2d,  v21.2d           \n"

    /* ---------- store back 64-bit vvS/ssS vectors ---------- */
    "umov  x0, v13.d[0]                       \n"
    "umov  x1, v13.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"

    "umov  x0, v14.d[0]                       \n"
    "umov  x1, v14.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov  x0, v15.d[0]                       \n"
    "umov  x1, v15.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov  x0, v16.d[0]                       \n"
    "umov  x1, v16.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov  x0, v17.d[0]                       \n"
    "umov  x1, v17.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov  x0, v18.d[0]                       \n"
    "umov  x1, v18.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"

    /* ---------- store 32-bit interleaved vvS/ssS ----------- */
    "umov  w0, v13.s[0]                       \n"
    "umov  w1, v13.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS]]          \n"

    "umov  w0, v13.s[1]                       \n"
    "umov  w1, v13.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #8]      \n"

    "umov  w0, v14.s[0]                       \n"
    "umov  w1, v14.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]     \n"

    "umov  w0, v14.s[1]                       \n"
    "umov  w1, v14.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]     \n"

    "umov  w0, v15.s[0]                       \n"
    "umov  w1, v15.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]     \n"

    "umov  w0, v15.s[1]                       \n"
    "umov  w1, v15.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]     \n"

    "umov  w0, v16.s[0]                       \n"
    "umov  w1, v16.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]     \n"

    "umov  w0, v16.s[1]                       \n"
    "umov  w1, v16.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]     \n"

    "umov  w0, v17.s[0]                       \n"
    "umov  w1, v17.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]     \n"

    "umov  w0, v17.s[1]                       \n"
    "umov  w1, v17.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]     \n"

    "umov  w0, v18.s[0]                       \n"
    "umov  w1, v18.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]     \n"
    :
    : [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v13","v14","v15","v16","v17","v18",
      "v19","v20","v21"
);



    // // Step [6]: tmp2 = tmp2 / B
    // for (int i = 0; i<9; i++){
    //     vec_vvS_ssS[i] = vec_vvS_ssS[i+1];
    // }
    // vec_vvS_ssS[9] = vdup_n_u32(0);
    //
    //
    //
    
    
    
    // Step [7]: tmp2 += u1 * S
    // vec_prod = vdupq_n_u64(0);
    // for (int i = 0; i < 9; i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_S[i], vec_v1_s1 );
    //     vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_vvS_ssS[9+1] = vadd_u32(vec_vvS_ssS[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //


__asm__(
    /* ---------- load base V / S vectors ------------------- */
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]]  \n"
    "ins   v0.d[0], x0                     \n"
    "ins   v0.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]]  \n"
    "ins   v1.d[0], x0                     \n"
    "ins   v1.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]]  \n"
    "ins   v2.d[0], x0                     \n"
    "ins   v2.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]]  \n"
    "ins   v3.d[0], x0                     \n"
    "ins   v3.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]]    \n"
    "ins   v4.d[0], x0                     \n"
    "ins   v4.d[1], x1                     \n"

    /* ---------- load l1 vector ----------------------------- */
    "ldp   x0, x1, [%[p_vec_uu1_rr1_vv1_ss1]] \n"
    "ins   v11.d[0], x0                    \n"
    "ins   v11.d[1], x1                    \n"

    /* ---------- load accumulated vvS/ssS vectors ----------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                    \n"
    "ins   v18.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                    \n"
    "ins   v19.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                    \n"
    "ins   v20.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                    \n"
    "ins   v21.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                    \n"
    "ins   v22.d[1], x1                    \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v23.d[0], x0                    \n"
    "ins   v23.d[1], x1                    \n"
    /* v18–v23 = vvS/ssS0‥10                                   */

    /* ---------- constant mask in v27 ---------------------- */
    "mov   x0, #1                          \n"
    "lsl   x0, x0, #30                     \n"
    "sub   x0, x0, #1                      \n"
    "dup   v27.2d, x0                      \n"  /* v27 = 2^30−1 */

    /* ---------- prod / buf vectors ------------------------ */
    "movi  v24.2d, #0                      \n"  /* vec_prod */
    /* v25 = vec_buf */

    /* ------------ l1 × V0..V4 accumulate ------------------ */
    "umlal2 v24.2d, v11.4s, v0.s[2]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "shl   v25.2d, v25.2d, #32             \n"
    "add   v18.2d, v18.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v0.s[3]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "add   v19.2d, v19.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v1.s[2]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "shl   v25.2d, v25.2d, #32             \n"
    "add   v19.2d, v19.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v1.s[3]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "add   v20.2d, v20.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v2.s[2]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "shl   v25.2d, v25.2d, #32             \n"
    "add   v20.2d, v20.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v2.s[3]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "add   v21.2d, v21.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v3.s[2]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "shl   v25.2d, v25.2d, #32             \n"
    "add   v21.2d, v21.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v3.s[3]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "add   v22.2d, v22.2d, v25.2d          \n"

    "umlal2 v24.2d, v11.4s, v4.s[2]         \n"
    "and   v25.16b, v24.16b, v27.16b       \n"
    "ushr  v24.2d, v24.2d, #30             \n"
    "shl   v25.2d, v25.2d, #32             \n"
    "add   v22.2d, v22.2d, v25.2d          \n"

    "and   v25.16b, v24.16b, v27.16b       \n"
    "add   v23.2d, v23.2d, v25.2d          \n"

    /* ---------- store back 64-bit vvS/ssS vectors ---------- */
    "umov  x0, v18.d[0]                    \n"
    "umov  x1, v18.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"

    "umov  x0, v19.d[0]                    \n"
    "umov  x1, v19.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov  x0, v20.d[0]                    \n"
    "umov  x1, v20.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov  x0, v21.d[0]                    \n"
    "umov  x1, v21.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov  x0, v22.d[0]                    \n"
    "umov  x1, v22.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov  x0, v23.d[0]                    \n"
    "umov  x1, v23.d[1]                    \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---------- store 32-bit interleaved vvS/ssS ----------- */
    "umov  w0, v18.s[0]                    \n"
    "umov  w1, v18.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS]]           \n"

    "umov  w0, v18.s[1]                    \n"
    "umov  w1, v18.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #8]       \n"

    "umov  w0, v19.s[0]                    \n"
    "umov  w1, v19.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]      \n"

    "umov  w0, v19.s[1]                    \n"
    "umov  w1, v19.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]      \n"

    "umov  w0, v20.s[0]                    \n"
    "umov  w1, v20.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]      \n"

    "umov  w0, v20.s[1]                    \n"
    "umov  w1, v20.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]      \n"

    "umov  w0, v21.s[0]                    \n"
    "umov  w1, v21.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]      \n"

    "umov  w0, v21.s[1]                    \n"
    "umov  w1, v21.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]      \n"

    "umov  w0, v22.s[0]                    \n"
    "umov  w1, v22.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]      \n"

    "umov  w0, v22.s[1]                    \n"
    "umov  w1, v22.s[3]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]      \n"

    "umov  w0, v23.s[0]                    \n"
    "umov  w1, v23.s[2]                    \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]      \n"
    :
    : /* pointers */
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0]   "r"(&vec_V8_0_S8_0),
      [p_vec_uu1_rr1_vv1_ss1] "r"(&vec_uu1_rr1_vv1_ss1),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v18","v19","v20","v21","v22","v23",
      "v24","v25","v27"
);




    // // Step [8]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<9; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_vvS_ssS[i+1], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_vvS_ssS[i+1] = vand_u32(vec_vvS_ssS[i+1], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_vvS_ssS[i+1+1] = vadd_u32(vec_vvS_ssS[i+1+1], vec_carry);
    // }

__asm__ volatile(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                      \n"
    "ins   v19.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                      \n"
    "ins   v20.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                      \n"
    "ins   v21.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                      \n"
    "ins   v22.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v23.d[0], x0                      \n"
    "ins   v23.d[1], x1                      \n"
    /* v18–v23 = vvS/ssS0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v28.2d, x0                         \n"   /* v28 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v29.2d, x0                         \n"   /* v29 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v30.2d, #0                         \n"   /* v30 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- vvS0/ssS0 (v18) --------------------------------- */
    // "and   v30.16b, v18.16b, v28.16b          \n"
    // "bic   v18.16b, v18.16b, v28.16b          \n"
    // "shl   v30.2d,  v30.2d,  #2               \n"
    // "add   v18.2d,  v18.2d,  v30.2d           \n"

    "and   v30.16b, v18.16b, v29.16b          \n"
    "bic   v18.16b, v18.16b, v29.16b          \n"
    "ushr  v30.2d,  v30.2d,  #62              \n"
    "add   v19.2d,  v19.2d,  v30.2d           \n"

    /* ---- vvS2/ssS2 (v19) --------------------------------- */
    "and   v30.16b, v19.16b, v28.16b          \n"
    "bic   v19.16b, v19.16b, v28.16b          \n"
    "shl   v30.2d,  v30.2d,  #2               \n"
    "add   v19.2d,  v19.2d,  v30.2d           \n"

    "and   v30.16b, v19.16b, v29.16b          \n"
    "bic   v19.16b, v19.16b, v29.16b          \n"
    "ushr  v30.2d,  v30.2d,  #62              \n"
    "add   v20.2d,  v20.2d,  v30.2d           \n"

    /* ---- vvS4/ssS4 (v20) --------------------------------- */
    "and   v30.16b, v20.16b, v28.16b          \n"
    "bic   v20.16b, v20.16b, v28.16b          \n"
    "shl   v30.2d,  v30.2d,  #2               \n"
    "add   v20.2d,  v20.2d,  v30.2d           \n"

    "and   v30.16b, v20.16b, v29.16b          \n"
    "bic   v20.16b, v20.16b, v29.16b          \n"
    "ushr  v30.2d,  v30.2d,  #62              \n"
    "add   v21.2d,  v21.2d,  v30.2d           \n"

    /* ---- vvS6/ssS6 (v21) --------------------------------- */
    "and   v30.16b, v21.16b, v28.16b          \n"
    "bic   v21.16b, v21.16b, v28.16b          \n"
    "shl   v30.2d,  v30.2d,  #2               \n"
    "add   v21.2d,  v21.2d,  v30.2d           \n"

    "and   v30.16b, v21.16b, v29.16b          \n"
    "bic   v21.16b, v21.16b, v29.16b          \n"
    "ushr  v30.2d,  v30.2d,  #62              \n"
    "add   v22.2d,  v22.2d,  v30.2d           \n"

    /* ---- vvS8/ssS8 (v22) --------------------------------- */
    "and   v30.16b, v22.16b, v28.16b          \n"
    "bic   v22.16b, v22.16b, v28.16b          \n"
    "shl   v30.2d,  v30.2d,  #2               \n"
    "add   v22.2d,  v22.2d,  v30.2d           \n"

    "and   v30.16b, v22.16b, v29.16b          \n"
    "bic   v22.16b, v22.16b, v29.16b          \n"
    "ushr  v30.2d,  v30.2d,  #62              \n"
    "add   v23.2d,  v23.2d,  v30.2d           \n"

    /* ---------- store back 64-bit vvS/ssS vectors ---------- */
    "umov  x0, v18.d[0]                       \n"
    "umov  x1, v18.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"

    "umov  x0, v19.d[0]                       \n"
    "umov  x1, v19.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov  x0, v20.d[0]                       \n"
    "umov  x1, v20.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov  x0, v21.d[0]                       \n"
    "umov  x1, v21.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov  x0, v22.d[0]                       \n"
    "umov  x1, v22.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov  x0, v23.d[0]                       \n"
    "umov  x1, v23.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"

    /* ---------- store 32-bit interleaved vvS/ssS ----------- */
    "umov  w0, v18.s[0]                       \n"
    "umov  w1, v18.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS]]          \n"

    "umov  w0, v18.s[1]                       \n"
    "umov  w1, v18.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #8]      \n"

    "umov  w0, v19.s[0]                       \n"
    "umov  w1, v19.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]     \n"

    "umov  w0, v19.s[1]                       \n"
    "umov  w1, v19.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]     \n"

    "umov  w0, v20.s[0]                       \n"
    "umov  w1, v20.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]     \n"

    "umov  w0, v20.s[1]                       \n"
    "umov  w1, v20.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]     \n"

    "umov  w0, v21.s[0]                       \n"
    "umov  w1, v21.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]     \n"

    "umov  w0, v21.s[1]                       \n"
    "umov  w1, v21.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]     \n"

    "umov  w0, v22.s[0]                       \n"
    "umov  w1, v22.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]     \n"

    "umov  w0, v22.s[1]                       \n"
    "umov  w1, v22.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]     \n"

    "umov  w0, v23.s[0]                       \n"
    "umov  w1, v23.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]     \n"
    :
    : [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v18","v19","v20","v21","v22","v23",
      "v28","v29","v30"
);





    // Step [9]: l1 = tmp[0] * M mod 2^30
    //            and tmp += l0 * P
    // vec_l1 = vmul_u32(vec_vvS_ssS[0+1], vec_M);
    // vec_l1 = vand_u32(vec_l1 ,vec_u32_2p30m1);



  __asm__(
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"
    "ins   v18.d[0], x0              \n"
    "ins   v18.d[1], x1              \n"

    // v18 = vec_vvS0_vvS1_ssS0_ssS1

    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v24.4s,  w1                          \n"  
    // v24 = [M, M, M, M]

    "mov    x0, #3  \n"
    "lsl    x0, x0, #30  \n"
    "dup    v25.4s, w0 \n"
    // v25 = vec_4x_2p30a2p31

    "mul    v24.4s, v18.4s, v24.4s \n"
    "bic    v24.16b, v24.16b, v25.16b \n"
    // v24 = [*, l1_left, *, l1_right]
    "uzp2    v24.4s, v24.4s, v24.4s \n"
    // v24 = [l1_left, l1_right, *, *]
    
     "umov   w0, v24.s[0]                        \n"
     "umov   w1, v24.s[1]                        \n"
     "stp    w0, w1, [%[p_vec_l1]]         \n"



    :
    : // pointers
      [p_vec_l1] "r"(&vec_l1),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)

    : "memory","cc",
      "x0","x1",
      "v18","v24","v25"
  );








    // vec_prod = vdupq_n_u64(0);
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m19, vec_l1 );
    // vec_vvS_ssS[0+1] = vadd_u32(vec_vvS_ssS[0+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // for (int i = 0 + 1; i < (9 - 1); i++){
    //     vec_prod = vmlal_u32(vec_prod, vec_u32_2p30m1, vec_l1 );
    //     vec_vvS_ssS[i+1] = vadd_u32(vec_vvS_ssS[i+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    //     vec_prod = vshrq_n_u64(vec_prod, 30);
    // }
    // vec_prod = vmlal_u32(vec_prod, vec_u32_2p15m1, vec_l1 );
    // vec_vvS_ssS[8+1] = vadd_u32(vec_vvS_ssS[8+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));
    // vec_prod = vshrq_n_u64(vec_prod, 30);
    //
    // vec_vvS_ssS[9+1] = vadd_u32(vec_vvS_ssS[9+1], vmovn_u64( vandq_u64(vec_prod, vec_2p30m1)));

    __asm__(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                     \n"
    "ins   v18.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                     \n"
    "ins   v19.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                     \n"
    "ins   v20.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                     \n"
    "ins   v21.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                     \n"
    "ins   v22.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v23.d[0], x0                     \n"
    "ins   v23.d[1], x1                     \n"
    /* v18–v23 = vvS/ssS0‥10                                   */

    /* ---------- load l1 into v24 --------------------------- */
    "ldp   x0, x1, [%[p_vec_l1]]            \n"
    "ins   v24.d[0], x0                     \n"
    "ins   v24.d[1], x1                     \n"
    /* v24 = vec_l1                                             */

    /* ---------- prepare constants -------------------------- */
    "mov   x0, #1                           \n"
    "lsl   x1, x0, #30                      \n"
    "sub   x1, x1, #1                       \n"
    "dup   v29.2d, x1                       \n"   /* v29 = 2^30−1 */
    "sub   x1, x1, #18                      \n"
    "dup   v25.2d, x1                       \n"   /* v25 = 2^30−19 */
    "lsl   x1, x0, #15                      \n"
    "sub   x1, x1, #1                       \n"
    "dup   v26.2d, x1                       \n"   /* v26 = 2^15−1 */

    /* ---------- prod / buf vectors ------------------------ */
    "movi  v27.2d, #0                       \n"   /* vec_prod */
    /* v28 = vec_buf */

    /* ------------ l1 × V0..V4 accumulate ------------------ */
    "umlal v27.2d, v24.2s, v25.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "shl   v28.2d, v28.2d, #32              \n"
    "add   v18.2d, v18.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "add   v19.2d, v19.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "shl   v28.2d, v28.2d, #32              \n"
    "add   v19.2d, v19.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "add   v20.2d, v20.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "shl   v28.2d, v28.2d, #32              \n"
    "add   v20.2d, v20.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "add   v21.2d, v21.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "shl   v28.2d, v28.2d, #32              \n"
    "add   v21.2d, v21.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v29.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "add   v22.2d, v22.2d, v28.2d           \n"

    "umlal v27.2d, v24.2s, v26.s[0]         \n"
    "and   v28.16b, v27.16b, v29.16b        \n"
    "ushr  v27.2d, v27.2d, #30              \n"
    "shl   v28.2d, v28.2d, #32              \n"
    "add   v22.2d, v22.2d, v28.2d           \n"

    "and   v28.16b, v27.16b, v29.16b        \n"
    "add   v23.2d, v23.2d, v28.2d           \n"

    /* ---------- store back 64-bit vvS/ssS vectors ---------- */
    "umov  x0, v18.d[0]                     \n"
    "umov  x1, v18.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"

    "umov  x0, v19.d[0]                     \n"
    "umov  x1, v19.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov  x0, v20.d[0]                     \n"
    "umov  x1, v20.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov  x0, v21.d[0]                     \n"
    "umov  x1, v21.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov  x0, v22.d[0]                     \n"
    "umov  x1, v22.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov  x0, v23.d[0]                     \n"
    "umov  x1, v23.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---------- store 32-bit interleaved vvS/ssS ----------- */
    "umov  w0, v18.s[0]                     \n"
    "umov  w1, v18.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS]]            \n"

    "umov  w0, v18.s[1]                     \n"
    "umov  w1, v18.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #8]        \n"

    "umov  w0, v19.s[0]                     \n"
    "umov  w1, v19.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]       \n"

    "umov  w0, v19.s[1]                     \n"
    "umov  w1, v19.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]       \n"

    "umov  w0, v20.s[0]                     \n"
    "umov  w1, v20.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]       \n"

    "umov  w0, v20.s[1]                     \n"
    "umov  w1, v20.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]       \n"

    "umov  w0, v21.s[0]                     \n"
    "umov  w1, v21.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]       \n"

    "umov  w0, v21.s[1]                     \n"
    "umov  w1, v21.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]       \n"

    "umov  w0, v22.s[0]                     \n"
    "umov  w1, v22.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]       \n"

    "umov  w0, v22.s[1]                     \n"
    "umov  w1, v22.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]       \n"

    "umov  w0, v23.s[0]                     \n"
    "umov  w1, v23.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]       \n"
    :
    : /* pointers */
      [p_vec_l1] "r"(&vec_l1),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v18","v19","v20","v21","v22","v23","v24",
      "v25","v26","v27","v28","v29"
);



    
    
    // // Step [10]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<9; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_vvS_ssS[i+1], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_vvS_ssS[i+1] = vand_u32(vec_vvS_ssS[i+1], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_vvS_ssS[i+1+1] = vadd_u32(vec_vvS_ssS[i+1+1], vec_carry);
    // }
    
__asm__ volatile(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]] \n"
    "ins   v18.d[0], x0                      \n"
    "ins   v18.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v19.d[0], x0                      \n"
    "ins   v19.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v20.d[0], x0                      \n"
    "ins   v20.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v21.d[0], x0                      \n"
    "ins   v21.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v22.d[0], x0                      \n"
    "ins   v22.d[1], x1                      \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v23.d[0], x0                      \n"
    "ins   v23.d[1], x1                      \n"
    /* v18–v23 = vvS/ssS0‥10                                   */

    /* ---------- prepare two mask constants ---------------- */
    "mov   x0, #3                             \n"
    "lsl   x0, x0, #30                        \n"
    "dup   v24.2d, x0                         \n"   /* v24 = 2^30+2^31 */
    "lsl   x0, x0, #32                        \n"
    "dup   v25.2d, x0                         \n"   /* v25 = 2^62+2^63 */

    /* ---------- init carry vector ------------------------- */
    "movi  v26.2d, #0                         \n"   /* v26 = vec_carry */

    /* ---------- limb-wise carry-propagation --------------- */
    /* ---- vvS0/ssS0 (v18) --------------------------------- */
    // "and   v26.16b, v18.16b, v24.16b          \n"
    // "bic   v18.16b, v18.16b, v24.16b          \n"
    // "shl   v26.2d,  v26.2d,  #2               \n"
    // "add   v18.2d,  v18.2d,  v26.2d           \n"

    "and   v26.16b, v18.16b, v25.16b          \n"
    "bic   v18.16b, v18.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v18.2d,  v19.2d,  v26.2d           \n"

    /* ---- vvS2/ssS2 (v19) --------------------------------- */
    "and   v26.16b, v18.16b, v24.16b          \n"
    "bic   v18.16b, v18.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v18.2d,  v18.2d,  v26.2d           \n"

    "and   v26.16b, v18.16b, v25.16b          \n"
    "bic   v18.16b, v18.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v19.2d,  v20.2d,  v26.2d           \n"

    /* ---- vvS4/ssS4 (v20) --------------------------------- */
    "and   v26.16b, v19.16b, v24.16b          \n"
    "bic   v19.16b, v19.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v19.2d,  v19.2d,  v26.2d           \n"

    "and   v26.16b, v19.16b, v25.16b          \n"
    "bic   v19.16b, v19.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v20.2d,  v21.2d,  v26.2d           \n"

    /* ---- vvS6/ssS6 (v21) --------------------------------- */
    "and   v26.16b, v20.16b, v24.16b          \n"
    "bic   v20.16b, v20.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v20.2d,  v20.2d,  v26.2d           \n"

    "and   v26.16b, v20.16b, v25.16b          \n"
    "bic   v20.16b, v20.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v21.2d,  v22.2d,  v26.2d           \n"

    /* ---- vvS8/ssS8 (v22) --------------------------------- */
    "and   v26.16b, v21.16b, v24.16b          \n"
    "bic   v21.16b, v21.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v21.2d,  v21.2d,  v26.2d           \n"

    "and   v26.16b, v21.16b, v25.16b          \n"
    "bic   v21.16b, v21.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v22.2d,  v23.2d,  v26.2d           \n"

    /* ---------- store back 64-bit vvS/ssS vectors ---------- */
    // "umov  x0, v18.d[0]                       \n"
    // "umov  x1, v18.d[1]                       \n"
    // "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"

    "umov  x0, v18.d[0]                       \n"
    "umov  x1, v18.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov  x0, v19.d[0]                       \n"
    "umov  x1, v19.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov  x0, v20.d[0]                       \n"
    "umov  x1, v20.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov  x0, v21.d[0]                       \n"
    "umov  x1, v21.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov  x0, v22.d[0]                       \n"
    "umov  x1, v22.d[1]                       \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"

    /* ---------- store 32-bit interleaved vvS/ssS ----------- */
    // "umov  w0, v18.s[0]                       \n"
    // "umov  w1, v18.s[2]                       \n"
    // "stp   w0, w1, [%[p_vec_vvS_ssS]]          \n"
    //
    // "umov  w0, v18.s[1]                       \n"
    // "umov  w1, v18.s[3]                       \n"
    // "stp   w0, w1, [%[p_vec_vvS_ssS], #8]      \n"

    "umov  w0, v18.s[0]                       \n"
    "umov  w1, v18.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]     \n"

    "umov  w0, v18.s[1]                       \n"
    "umov  w1, v18.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]     \n"

    "umov  w0, v19.s[0]                       \n"
    "umov  w1, v19.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]     \n"

    "umov  w0, v19.s[1]                       \n"
    "umov  w1, v19.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]     \n"

    "umov  w0, v20.s[0]                       \n"
    "umov  w1, v20.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]     \n"

    "umov  w0, v20.s[1]                       \n"
    "umov  w1, v20.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]     \n"

    "umov  w0, v21.s[0]                       \n"
    "umov  w1, v21.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]     \n"

    "umov  w0, v21.s[1]                       \n"
    "umov  w1, v21.s[3]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]     \n"

    "umov  w0, v22.s[0]                       \n"
    "umov  w1, v22.s[2]                       \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]     \n"
    :
    : [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5",
      "v18","v19","v20","v21","v22","v23",
      "v24","v25","v26"
);








    
    
    // // Step [11]: tmp = tmp / B
    // for (int i = 0; i<9; i++){
    //     vec_vvS_ssS[i] = vec_vvS_ssS[i+1];
    // }
    // vec_vvS_ssS[9] = vdup_n_u32(0);
    

    // Step [12]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    // vec_small_tmp = vdup_n_u32(19);
    // for (int i = 0; i < 8; i++)
    // {
    //     vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[i+2]);
    //     vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    // }
    // vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[8+2]);
    //
    // vec_reductionhat = (uint32x2_t)vshr_n_s32(
    //     (int32x2_t)vsub_u32(
    //         vec_u32_2p15m1,
    //         vec_small_tmp
    //     ),
    //     31
    // );
    //
    // vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    // vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));


__asm__ volatile(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v18.d[0], x0                     \n"
    "ins   v18.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v19.d[0], x0                     \n"
    "ins   v19.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v20.d[0], x0                     \n"
    "ins   v20.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v21.d[0], x0                     \n"
    "ins   v21.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v22.d[0], x0                     \n"
    "ins   v22.d[1], x1                     \n"
    /* v18–v22 = vvS/ssS0‥8,10                                  */

    /* ---------- prepare constants (mask moved to v30) ------ */
    "mov   x0, #3                           \n"
    "lsl   x0, x0, #30                      \n"
    "dup   v30.2d, x0                       \n"   /* v30 = 2^30+2^31 */
    "lsl   x0, x0, #32                      \n"
    "dup   v26.2d, x0                       \n"   /* v26 = 2^62+2^63 */

    "mov   x0, #19                          \n"
    "dup   v27.2d, x0                       \n"   /* v27 = [19,19] */
    "mov   x0, #1                           \n"
    "lsl   x0, x0, #15                      \n"
    "dup   v28.2d, x0                       \n"   /* v28 = [32768,32768] */
    "sub   x0, x0, #1                       \n"
    "dup   v25.2d, x0                       \n"   /* v25 = [32767,32767] */


    "mov   v29.16b, v27.16b                 \n"   /* v29 = small tmp */

    /* ---------- carry-scan with new slots ----------------- */
    "add   v29.2d, v29.2d, v18.2d           \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v18.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v19.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v19.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v20.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v20.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v21.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v21.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v22.2d          \n"
    "sub   v31.2d, v25.2d, v29.2d           \n"
    "sshr  v31.2d, v31.2d, #63              \n"   /* v31 = reduction-hat */

    /* adjust limbs with reduction-hat */
    "and   v27.16b, v27.16b, v31.16b        \n"
    "add   v18.2d,  v18.2d,  v27.2d         \n"
    "and   v28.16b, v28.16b, v31.16b        \n"
    "sub   v22.2d,  v22.2d,  v28.2d         \n"

    /* ---------- store back 64-bit vvS/ssS vectors --------- */
    "umov  x0, v18.d[0]                     \n"
    "umov  x1, v18.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov  x0, v19.d[0]                     \n"
    "umov  x1, v19.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov  x0, v20.d[0]                     \n"
    "umov  x1, v20.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov  x0, v21.d[0]                     \n"
    "umov  x1, v21.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov  x0, v22.d[0]                     \n"
    "umov  x1, v22.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---------- store 32-bit interleaved vvS/ssS ---------- */
    "umov  w0, v18.s[0]                     \n"
    "umov  w1, v18.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]  \n"

    "umov  w0, v18.s[1]                     \n"
    "umov  w1, v18.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]  \n"

    "umov  w0, v19.s[0]                     \n"
    "umov  w1, v19.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]  \n"

    "umov  w0, v19.s[1]                     \n"
    "umov  w1, v19.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]  \n"

    "umov  w0, v20.s[0]                     \n"
    "umov  w1, v20.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]  \n"

    "umov  w0, v20.s[1]                     \n"
    "umov  w1, v20.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]  \n"

    "umov  w0, v21.s[0]                     \n"
    "umov  w1, v21.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]  \n"

    "umov  w0, v21.s[1]                     \n"
    "umov  w1, v21.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]  \n"

    "umov  w0, v22.s[0]                     \n"
    "umov  w1, v22.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]  \n"
    :
    : [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
      // [p_vec_reductionhat]        "r"(&vec_reductionhat)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v18","v19","v20","v21","v22",
      "v26","v27","v28","v29","v30","v31"
);



    

    // // Step [13]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<8; i++){
    //     vec_carry = vshr_n_u32(vec_vvS_ssS[i+2], 30);
    //     vec_vvS_ssS[i+2] = vand_u32(vec_vvS_ssS[i+2], vec_u32_2p30m1);
    //     vec_vvS_ssS[i+1+2] = vadd_u32(vec_vvS_ssS[i+1+2], vec_carry);
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"
    "ins   v18.d[0], x0              \n"
    "ins   v18.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"
    "ins   v19.d[0], x0              \n"
    "ins   v19.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"
    "ins   v20.d[0], x0              \n"
    "ins   v20.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"
    "ins   v21.d[0], x0              \n"
    "ins   v21.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"
    "ins   v22.d[0], x0              \n"
    "ins   v22.d[1], x1              \n"
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0



    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x1 = 2p30a2p31
    "dup   v23.2d, x0               \n"
    // v23 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v24.2d, x0               \n"
    // v24 = vec_2x_2p62a2p63


    "movi  v25.2d, #0                \n"
    // v25 = vec_carry


    // "and   v25.16b, v12.16b, v23.16b   \n"
    // "bic   v12.16b, v12.16b, v23.16b   \n"
    // "shl   v25.2d,  v25.2d,  #2       \n"
    // "add   v12.2d,  v12.2d,  v25.2d   \n"

    // "and   v25.16b, v12.16b, v24.16b   \n"
    // "bic   v12.16b, v12.16b, v24.16b   \n"
    // "ushr  v25.2d,  v25.2d,  #62       \n"
    // "add   v18.2d,  v18.2d,  v25.2d   \n"


    "and   v25.16b, v18.16b, v23.16b   \n"
    "bic   v18.16b, v18.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v18.2d,  v18.2d,  v25.2d   \n"

    "and   v25.16b, v18.16b, v24.16b   \n"
    "bic   v18.16b, v18.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v19.2d,  v19.2d,  v25.2d   \n"


    "and   v25.16b, v19.16b, v23.16b   \n"
    "bic   v19.16b, v19.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v19.2d,  v19.2d,  v25.2d   \n"

    "and   v25.16b, v19.16b, v24.16b   \n"
    "bic   v19.16b, v19.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v20.2d,  v20.2d,  v25.2d   \n"


    "and   v25.16b, v20.16b, v23.16b   \n"
    "bic   v20.16b, v20.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v20.2d,  v20.2d,  v25.2d   \n"

    "and   v25.16b, v20.16b, v24.16b   \n"
    "bic   v20.16b, v20.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v21.2d,  v21.2d,  v25.2d   \n"


    "and   v25.16b, v21.16b, v23.16b   \n"
    "bic   v21.16b, v21.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v21.2d,  v21.2d,  v25.2d   \n"

    "and   v25.16b, v21.16b, v24.16b   \n"
    "bic   v21.16b, v21.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v22.2d,  v22.2d,  v25.2d   \n"
    // dump to 
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"

    "umov   x0, v18.d[0]              \n"
    "umov   x1, v18.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov   x0, v19.d[0]              \n"
    "umov   x1, v19.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov   x0, v20.d[0]              \n"
    "umov   x1, v20.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov   x0, v21.d[0]              \n"
    "umov   x1, v21.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov   x0, v22.d[0]              \n"
    "umov   x1, v22.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"
    "umov   w0, v18.s[0]                        \n"
    "umov   w1, v18.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"
    "umov   w0, v18.s[1]                        \n"
    "umov   w1, v18.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"
     "umov   w0, v19.s[0]                        \n"
     "umov   w1, v19.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"
     "umov   w0, v19.s[1]                        \n"
     "umov   w1, v19.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"
    "umov   w0, v20.s[0]                        \n"
    "umov   w1, v20.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"
     "umov   w0, v20.s[1]                        \n"
     "umov   w1, v20.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"
     "umov   w0, v21.s[0]                        \n"
     "umov   w1, v21.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"
     "umov   w0, v21.s[1]                        \n"
     "umov   w1, v21.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"
     "umov   w0, v22.s[0]                        \n"
     "umov   w1, v22.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"

    :
    : // pointers
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v18","v19","v20","v21","v22","v23","v24","v25"
  );




    // // Step [14]: tmp += 2x vec_uhat_rhat & (P-A)
    //
    // vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2] , vand_u32(vec_vhat_shat, vec_u32_2p30m19));
    // vec_vvS_ssS[0+2] = vsub_u32(vec_vvS_ssS[0+2] , vand_u32(vec_vhat_shat, vec_S[0]));
    // for (int i = 0 + 1; i < (9 - 1); i++)
    // {
    //     vec_vvS_ssS[i+2] = vadd_u32(vec_vvS_ssS[i+2] , vand_u32(vec_vhat_shat, vec_u32_2p30m1));
    //     vec_vvS_ssS[i+2] = vsub_u32(vec_vvS_ssS[i+2] , vand_u32(vec_vhat_shat, vec_S[i]));
    // }
    // vec_vvS_ssS[8+2] = vadd_u32(vec_vvS_ssS[8+2] , vand_u32(vec_vhat_shat, vec_u32_2p15m1));
    // vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2] , vand_u32(vec_vhat_shat, vec_S[8]));
    //
    //
    // // Step [15]: borrow propogation
    // for (int i = 0; i < 8; i++)
    // {   
    //     // borrow = tmp[i] >> 31;
    //     vec_borrow = vshr_n_u32(vec_vvS_ssS[i+2],31);
    //     // tmp[i+1] = tmp[i+1] - borrow;
    //     vec_vvS_ssS[i+1+2] = vsub_u32(vec_vvS_ssS[i+1+2], vec_borrow);
    //     // tmp[i+0] = tmp[i+0] + (borrow << 30);
    //     vec_vvS_ssS[i+0+2] = vadd_u32(vec_vvS_ssS[i+0+2], vshl_n_u32(vec_borrow,30));
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_V0_V1_S0_S1]] \n"
    "ins   v0.d[0], x0              \n"
    "ins   v0.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V2_V3_S2_S3]] \n"
    "ins   v1.d[0], x0              \n"
    "ins   v1.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V4_V5_S4_S5]] \n"
    "ins   v2.d[0], x0              \n"
    "ins   v2.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V6_V7_S6_S7]] \n"
    "ins   v3.d[0], x0              \n"
    "ins   v3.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_V8_0_S8_0]] \n"
    "ins   v4.d[0], x0              \n"
    "ins   v4.d[1], x1              \n"


    "ldp   x0, x1, [%[p_vec_uuhat_rrhat_vvhat_sshat]]\n"
    "ins   v12.d[0], x0              \n"
    "ins   v12.d[1], x1              \n"


    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"
    "ins   v18.d[0], x0              \n"
    "ins   v18.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"
    "ins   v19.d[0], x0              \n"
    "ins   v19.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"
    "ins   v20.d[0], x0              \n"
    "ins   v20.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"
    "ins   v21.d[0], x0              \n"
    "ins   v21.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"
    "ins   v22.d[0], x0              \n"
    "ins   v22.d[1], x1              \n"
    // v12 = vec_vvS0_vvS1_ssS0_ssS1
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    /* v23 = 2^30-1  (0x3fffffff) */
    "mov     x0, #1     \n"
    "lsl     x0, x0, #30\n"
    "sub     x0, x0, #1 \n"
    "dup     v23.4s, w0\n"

    /* v28 = 2^15-1  (0x7fff)      */
    "mov     x0, #1     \n"
    "lsl     x0, x0, #15\n"
    "sub     x0, x0, #1 \n"
    "dup     v28.2d,  x0\n"

    /* v29 = zip(ûh,ûh,r̂h,r̂h)    */
    "zip2    v29.4s,  v12.4s,  v12.4s   \n"
    /* = [uhat,uhat,rhat,rhat] */


    "zip2    v27.2d,  v0.2d,  v0.2d \n"
    "sub     v27.4s,  v23.4s,  v27.4s\n"
    "and     v27.16b, v27.16b,  v29.16b\n"
    "add     v18.4s,  v18.4s,  v27.4s\n"

    "zip2    v27.2d,  v1.2d,  v1.2d \n"
    "sub     v27.4s,  v23.4s,  v27.4s\n"
    "and     v27.16b, v27.16b,  v29.16b\n"
    "add     v19.4s,  v19.4s,  v27.4s\n"

    "zip2    v27.2d,  v2.2d,  v2.2d \n"
    "sub     v27.4s,  v23.4s,  v27.4s\n"
    "and     v27.16b, v27.16b,  v29.16b\n"
    "add     v20.4s,  v20.4s,  v27.4s\n"

    "zip2    v27.2d,  v3.2d,  v3.2d \n"
    "sub     v27.4s,  v23.4s,  v27.4s\n"
    "and     v27.16b, v27.16b,  v29.16b\n"
    "add     v21.4s,  v21.4s,  v27.4s\n"

    "zip2    v27.2d,  v4.2d,  v4.2d \n"
    "sub     v27.4s,  v28.4s,  v27.4s\n"
    "and     v27.16b, v27.16b,  v29.16b\n"
    "add     v22.4s,  v22.4s,  v27.4s\n"

    /* carry propogation */
    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x0 = 2p30a2p31
    "dup   v23.2d, x0               \n"
    // v23 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v25.2d, x0               \n"
    // v25 = vec_2x_2p62a2p63


    "movi  v26.2d, #0                \n"
    // v26 = vec_carry



    "and   v26.16b, v18.16b, v23.16b   \n"




    "bic   v18.16b, v18.16b, v23.16b   \n"
    "shl   v26.2d,  v26.2d,  #2       \n"
    "add   v18.2d,  v18.2d,  v26.2d   \n"

    "and   v26.16b, v18.16b, v25.16b   \n"
    "bic   v18.16b, v18.16b, v25.16b   \n"
    "ushr  v26.2d,  v26.2d,  #62       \n"
    "add   v19.2d,  v19.2d,  v26.2d   \n"


    "and   v26.16b, v19.16b, v23.16b   \n"
    "bic   v19.16b, v19.16b, v23.16b   \n"
    "shl   v26.2d,  v26.2d,  #2       \n"
    "add   v19.2d,  v19.2d,  v26.2d   \n"

    "and   v26.16b, v19.16b, v25.16b   \n"
    "bic   v19.16b, v19.16b, v25.16b   \n"
    "ushr  v26.2d,  v26.2d,  #62       \n"
    "add   v20.2d,  v20.2d,  v26.2d   \n"


    "and   v26.16b, v20.16b, v23.16b   \n"
    "bic   v20.16b, v20.16b, v23.16b   \n"
    "shl   v26.2d,  v26.2d,  #2       \n"
    "add   v20.2d,  v20.2d,  v26.2d   \n"

    "and   v26.16b, v20.16b, v25.16b   \n"
    "bic   v20.16b, v20.16b, v25.16b   \n"
    "ushr  v26.2d,  v26.2d,  #62       \n"
    "add   v21.2d,  v21.2d,  v26.2d   \n"


    "and   v26.16b, v21.16b, v23.16b   \n"
    "bic   v21.16b, v21.16b, v23.16b   \n"
    "shl   v26.2d,  v26.2d,  #2       \n"
    "add   v21.2d,  v21.2d,  v26.2d   \n"

    "and   v26.16b, v21.16b, v25.16b   \n"
    "bic   v21.16b, v21.16b, v25.16b   \n"
    "ushr  v26.2d,  v26.2d,  #62       \n"
    "add   v22.2d,  v22.2d,  v26.2d   \n"


    /* minus 18 from vvS[0], ssS[0] */
    "mov     x0, #18                   \n"
    "dup     v23.2d, x0               \n"
    "and     v23.16b,  v23.16b,  v29.16b\n"
    "sub     v18.4s,  v18.4s,  v23.4s\n"

    /* borrow propogation */

    "mov     x0, #1                   \n"
    "lsl     x0, x0, #31                   \n"
    "dup     v23.2d, x0               \n"
    "lsl     x0, x0, #32                   \n"
    "dup     v25.2d, x0               \n"
    // v23 = vec_2p31
    // v25 = vec_2p63

    "mov     x0, #3                   \n"
    "lsl     x0, x0, #30                   \n"
    "dup     v26.2d, x0               \n"
    "lsl     x0, x0, #32                   \n"
    "dup     v27.2d, x0               \n"
    // v26 = vec_2x_2p30a2p31
    // v27 = vec_2x_2p62a2p63

     // v28 = vec_borrow
     "and     v28.16b, v18.16b, v23.16b\n"
     "bic     v18.16b, v18.16b, v26.16b\n"
     "shl     v28.2d,  v28.2d, #1      \n"
     "sub     v18.4s,  v18.4s, v28.4s  \n"

     "and     v28.16b, v18.16b, v25.16b\n"
     "bic     v18.16b, v18.16b, v27.16b\n"
     "ushr    v28.2d,  v28.2d, #63     \n"
     "sub     v19.4s,  v19.4s, v28.4s  \n"


     "and     v28.16b, v19.16b, v23.16b\n"
     "bic     v19.16b, v19.16b, v26.16b\n"
     "shl     v28.2d,  v28.2d, #1      \n"
     "sub     v19.4s,  v19.4s, v28.4s  \n"

     "and     v28.16b, v19.16b, v25.16b\n"
     "bic     v19.16b, v19.16b, v27.16b\n"
     "ushr    v28.2d,  v28.2d, #63     \n"
     "sub     v20.4s,  v20.4s, v28.4s  \n"


     "and     v28.16b, v20.16b, v23.16b\n"
     "bic     v20.16b, v20.16b, v26.16b\n"
     "shl     v28.2d,  v28.2d, #1      \n"
     "sub     v20.4s,  v20.4s, v28.4s  \n"

     "and     v28.16b, v20.16b, v25.16b\n"
     "bic     v20.16b, v20.16b, v27.16b\n"
     "ushr    v28.2d,  v28.2d, #63     \n"
     "sub     v21.4s,  v21.4s, v28.4s  \n"


     "and     v28.16b, v21.16b, v23.16b\n"
     "bic     v21.16b, v21.16b, v26.16b\n"
     "shl     v28.2d,  v28.2d, #1      \n"
     "sub     v21.4s,  v21.4s, v28.4s  \n"

     "and     v28.16b, v21.16b, v25.16b\n"
     "bic     v21.16b, v21.16b, v27.16b\n"
     "ushr    v28.2d,  v28.2d, #63     \n"
     "sub     v22.4s,  v22.4s, v28.4s  \n"
    // dump to 
    // v12 = vec_vvS0_vvS1_ssS0_ssS1
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0


    "umov   x0, v18.d[0]              \n"
    "umov   x1, v18.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov   x0, v19.d[0]              \n"
    "umov   x1, v19.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov   x0, v20.d[0]              \n"
    "umov   x1, v20.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov   x0, v21.d[0]              \n"
    "umov   x1, v21.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov   x0, v22.d[0]              \n"
    "umov   x1, v22.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"
    "umov   w0, v18.s[0]                        \n"
    "umov   w1, v18.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"
    "umov   w0, v18.s[1]                        \n"
    "umov   w1, v18.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"
    "umov   w0, v19.s[0]                        \n"
    "umov   w1, v19.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"
    "umov   w0, v19.s[1]                        \n"
    "umov   w1, v19.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"
    "umov   w0, v20.s[0]                        \n"
    "umov   w1, v20.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"
    "umov   w0, v20.s[1]                        \n"
    "umov   w1, v20.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"
    "umov   w0, v21.s[0]                        \n"
    "umov   w1, v21.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"
    "umov   w0, v21.s[1]                        \n"
    "umov   w1, v21.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"
    "umov   w0, v22.s[0]                        \n"
    "umov   w1, v22.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"
    :
    : // pointers
      [p_vec_V0_V1_S0_S1] "r"(&vec_V0_V1_S0_S1),
      [p_vec_V2_V3_S2_S3] "r"(&vec_V2_V3_S2_S3),
      [p_vec_V4_V5_S4_S5] "r"(&vec_V4_V5_S4_S5),
      [p_vec_V6_V7_S6_S7] "r"(&vec_V6_V7_S6_S7),
      [p_vec_V8_0_S8_0] "r"(&vec_V8_0_S8_0),
      [p_vec_uuhat_rrhat_vvhat_sshat] "r"(&vec_uuhat_rrhat_vvhat_sshat),
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)

    : "memory",
      "x0","x1","x2","x3",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10",
      "v11","v12","v18","v19","v20","v21","v22","v23","v25","v26",
      "v27","v28","v29"
  );



    
    
    // Step [16]: Reduction P once:

    // See if tmp[0:9] >= P;
    // tmp >= P iff tmp + 19 >= 2^255;

    // vec_small_tmp = vdup_n_u32(19ULL);
    // for (int i = 0; i < 8; i++)
    // {
    //     vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[i+2]);
    //     vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    // }
    // vec_small_tmp = vadd_u32(vec_small_tmp, vec_vvS_ssS[8+2]);
    //
    // vec_reductionhat = (uint32x2_t)vshr_n_s32(
    //     (int32x2_t)vsub_u32(
    //         vec_u32_2p15m1,
    //         vec_small_tmp
    //     ),
    //     31
    // );
    //
    // vec_vvS_ssS[0+2] = vadd_u32(vec_vvS_ssS[0+2], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    // vec_vvS_ssS[8+2] = vsub_u32(vec_vvS_ssS[8+2], vand_u32(vec_reductionhat, vdup_n_u32(32768)));
    //


__asm__ volatile(
    /* ---------- load accumulated vvS/ssS vectors ---------- */
    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"
    "ins   v18.d[0], x0                     \n"
    "ins   v18.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"
    "ins   v19.d[0], x0                     \n"
    "ins   v19.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"
    "ins   v20.d[0], x0                     \n"
    "ins   v20.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"
    "ins   v21.d[0], x0                     \n"
    "ins   v21.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]] \n"
    "ins   v22.d[0], x0                     \n"
    "ins   v22.d[1], x1                     \n"
    /* v18–v22 = vvS/ssS0‥8,10                                  */

    /* ---------- prepare constants (mask moved to v30) ------ */
    "mov   x0, #3                           \n"
    "lsl   x0, x0, #30                      \n"
    "dup   v30.2d, x0                       \n"   /* v30 = 2^30+2^31 */
    "lsl   x0, x0, #32                      \n"
    "dup   v26.2d, x0                       \n"   /* v26 = 2^62+2^63 */

    "mov   x0, #19                          \n"
    "dup   v27.2d, x0                       \n"   /* v27 = [19,19] */
    "mov   x0, #1                           \n"
    "lsl   x0, x0, #15                      \n"
    "dup   v28.2d, x0                       \n"   /* v28 = [32768,32768] */
    "sub   x0, x0, #1                       \n"
    "dup   v25.2d, x0                       \n"   /* v25 = [32767,32767] */


    "mov   v29.16b, v27.16b                 \n"   /* v29 = small tmp */

    /* ---------- carry-scan with new slots ----------------- */
    "add   v29.2d, v29.2d, v18.2d           \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v18.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v19.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v19.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v20.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v20.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v21.2d          \n"
    "and   v29.16b, v29.16b, v30.16b        \n"
    "shl   v29.2d,  v29.2d,  #2             \n"

    "add   v29.2d, v29.2d,  v21.2d          \n"
    "and   v29.16b, v29.16b, v26.16b        \n"
    "ushr  v29.2d, v29.2d,  #62             \n"

    "add   v29.2d, v29.2d,  v22.2d          \n"
    "sub   v31.2d, v25.2d, v29.2d           \n"
    "sshr  v31.2d, v31.2d, #63              \n"   /* v31 = reduction-hat */

    /* adjust limbs with reduction-hat */
    "and   v27.16b, v27.16b, v31.16b        \n"
    "add   v18.2d,  v18.2d,  v27.2d         \n"
    "and   v28.16b, v28.16b, v31.16b        \n"
    "sub   v22.2d,  v22.2d,  v28.2d         \n"


    /* ---------- store back 64-bit vvS/ssS vectors --------- */
    "umov  x0, v18.d[0]                     \n"
    "umov  x1, v18.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]] \n"

    "umov  x0, v19.d[0]                     \n"
    "umov  x1, v19.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]] \n"

    "umov  x0, v20.d[0]                     \n"
    "umov  x1, v20.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]] \n"

    "umov  x0, v21.d[0]                     \n"
    "umov  x1, v21.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]] \n"

    "umov  x0, v22.d[0]                     \n"
    "umov  x1, v22.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]    \n"

    /* ---------- store 32-bit interleaved vvS/ssS ---------- */
    "umov  w0, v18.s[0]                     \n"
    "umov  w1, v18.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #16]  \n"

    "umov  w0, v18.s[1]                     \n"
    "umov  w1, v18.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #24]  \n"

    "umov  w0, v19.s[0]                     \n"
    "umov  w1, v19.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #32]  \n"

    "umov  w0, v19.s[1]                     \n"
    "umov  w1, v19.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #40]  \n"

    "umov  w0, v20.s[0]                     \n"
    "umov  w1, v20.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #48]  \n"

    "umov  w0, v20.s[1]                     \n"
    "umov  w1, v20.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #56]  \n"

    "umov  w0, v21.s[0]                     \n"
    "umov  w1, v21.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #64]  \n"

    "umov  w0, v21.s[1]                     \n"
    "umov  w1, v21.s[3]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #72]  \n"

    "umov  w0, v22.s[0]                     \n"
    "umov  w1, v22.s[2]                     \n"
    "stp   w0, w1, [%[p_vec_vvS_ssS], #80]  \n"
    :
    : [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0]     "r"(&vec_vvS10_0_ssS10_0)
      // [p_vec_reductionhat]        "r"(&vec_reductionhat)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v18","v19","v20","v21","v22",
      "v26","v27","v28","v29","v30","v31"
);












    // Step [17]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<8; i++){
    //     // carry = tmp[i] >> 30;
    //     vec_carry = vshr_n_u32(vec_vvS_ssS[i+2], 30);
    //     // tmp[i] = tmp[i] & (((uint64_t)1<<30) -1);
    //     vec_vvS_ssS[i+2] = vand_u32(vec_vvS_ssS[i+2], vec_u32_2p30m1);
    //     // tmp[i+1] += carry; 
    //     vec_vvS_ssS[i+1+2] = vadd_u32(vec_vvS_ssS[i+1+2], vec_carry);
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"
    "ins   v18.d[0], x0              \n"
    "ins   v18.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"
    "ins   v19.d[0], x0              \n"
    "ins   v19.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"
    "ins   v20.d[0], x0              \n"
    "ins   v20.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"
    "ins   v21.d[0], x0              \n"
    "ins   v21.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"
    "ins   v22.d[0], x0              \n"
    "ins   v22.d[1], x1              \n"
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0



    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x1 = 2p30a2p31
    "dup   v23.2d, x0               \n"
    // v23 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v24.2d, x0               \n"
    // v24 = vec_2x_2p62a2p63


    "movi  v25.2d, #0                \n"
    // v25 = vec_carry


    // "and   v25.16b, v12.16b, v23.16b   \n"
    // "bic   v12.16b, v12.16b, v23.16b   \n"
    // "shl   v25.2d,  v25.2d,  #2       \n"
    // "add   v12.2d,  v12.2d,  v25.2d   \n"

    // "and   v25.16b, v12.16b, v24.16b   \n"
    // "bic   v12.16b, v12.16b, v24.16b   \n"
    // "ushr  v25.2d,  v25.2d,  #62       \n"
    // "add   v18.2d,  v18.2d,  v25.2d   \n"


    "and   v25.16b, v18.16b, v23.16b   \n"
    "bic   v18.16b, v18.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v18.2d,  v18.2d,  v25.2d   \n"

    "and   v25.16b, v18.16b, v24.16b   \n"
    "bic   v18.16b, v18.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v19.2d,  v19.2d,  v25.2d   \n"


    "and   v25.16b, v19.16b, v23.16b   \n"
    "bic   v19.16b, v19.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v19.2d,  v19.2d,  v25.2d   \n"

    "and   v25.16b, v19.16b, v24.16b   \n"
    "bic   v19.16b, v19.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v20.2d,  v20.2d,  v25.2d   \n"


    "and   v25.16b, v20.16b, v23.16b   \n"
    "bic   v20.16b, v20.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v20.2d,  v20.2d,  v25.2d   \n"

    "and   v25.16b, v20.16b, v24.16b   \n"
    "bic   v20.16b, v20.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v21.2d,  v21.2d,  v25.2d   \n"


    "and   v25.16b, v21.16b, v23.16b   \n"
    "bic   v21.16b, v21.16b, v23.16b   \n"
    "shl   v25.2d,  v25.2d,  #2       \n"
    "add   v21.2d,  v21.2d,  v25.2d   \n"

    "and   v25.16b, v21.16b, v24.16b   \n"
    "bic   v21.16b, v21.16b, v24.16b   \n"
    "ushr  v25.2d,  v25.2d,  #62       \n"
    "add   v22.2d,  v22.2d,  v25.2d   \n"
    // dump to 
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_vvS0_vvS1_ssS0_ssS1]]\n"

    "umov   x0, v18.d[0]              \n"
    "umov   x1, v18.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"

    "umov   x0, v19.d[0]              \n"
    "umov   x1, v19.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"

    "umov   x0, v20.d[0]              \n"
    "umov   x1, v20.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"

    "umov   x0, v21.d[0]              \n"
    "umov   x1, v21.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"

    "umov   x0, v22.d[0]              \n"
    "umov   x1, v22.d[1]              \n"
    "stp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"
    "umov   w0, v18.s[0]                        \n"
    "umov   w1, v18.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"
    "umov   w0, v18.s[1]                        \n"
    "umov   w1, v18.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #24]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"
     "umov   w0, v19.s[0]                        \n"
     "umov   w1, v19.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #32]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"
     "umov   w0, v19.s[1]                        \n"
     "umov   w1, v19.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"
    "umov   w0, v20.s[0]                        \n"
    "umov   w1, v20.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_vvS_ssS], #48]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"
     "umov   w0, v20.s[1]                        \n"
     "umov   w1, v20.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #56]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"
     "umov   w0, v21.s[0]                        \n"
     "umov   w1, v21.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #64]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"
     "umov   w0, v21.s[1]                        \n"
     "umov   w1, v21.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #72]         \n"

     // "ldp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"
     "umov   w0, v22.s[0]                        \n"
     "umov   w1, v22.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_vvS_ssS], #80]         \n"

    :
    : // pointers
      [p_vec_vvS_ssS] "r"(vec_vvS_ssS),
      [p_vec_vvS0_vvS1_ssS0_ssS1] "r"(&vec_vvS0_vvS1_ssS0_ssS1),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v18","v19","v20","v21","v22","v23","v24","v25"
  );





    // Final [1]: add the results
    
    uint32x2_t vec_tmp[11];
    // for (int i = 0; i < 9; i++) {
    //     vec_tmp[i] = vadd_u32(vec_uuV_rrV[i+2], vec_vvS_ssS[i+2]);
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
    "ins   v14.d[0], x0              \n"
    "ins   v14.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
    "ins   v15.d[0], x0              \n"
    "ins   v15.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
    "ins   v16.d[0], x0              \n"
    "ins   v16.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
    "ins   v17.d[0], x0              \n"
    "ins   v17.d[1], x1              \n"
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    "ldp   x0, x1, [%[p_vec_vvS2_vvS3_ssS2_ssS3]]\n"
    "ins   v18.d[0], x0              \n"
    "ins   v18.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS4_vvS5_ssS4_ssS5]]\n"
    "ins   v19.d[0], x0              \n"
    "ins   v19.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS6_vvS7_ssS6_ssS7]]\n"
    "ins   v20.d[0], x0              \n"
    "ins   v20.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS8_vvS9_ssS8_ssS9]]\n"
    "ins   v21.d[0], x0              \n"
    "ins   v21.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_vvS10_0_ssS10_0]]\n"
    "ins   v22.d[0], x0              \n"
    "ins   v22.d[1], x1              \n"
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    "add   v13.2d, v13.2d, v18.2d  \n"
    "add   v14.2d, v14.2d, v19.2d  \n"
    "add   v15.2d, v15.2d, v20.2d  \n"
    "add   v16.2d, v16.2d, v21.2d  \n"
    "add   v17.2d, v17.2d, v22.2d  \n"


    // dump to 
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //

    // "ldp    w0, w1, [%[p_vec_tmp]]"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp]]              \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #8]"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #8]          \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #16]"
    "umov   w0, v14.s[0]                        \n"
    "umov   w1, v14.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #24]"
    "umov   w0, v14.s[1]                        \n"
    "umov   w1, v14.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #24]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #32]"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #32]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #40]"
    "umov   w0, v15.s[1]                        \n"
    "umov   w1, v15.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #48]"
    "umov   w0, v16.s[0]                        \n"
    "umov   w1, v16.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #48]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #56]"
    "umov   w0, v16.s[1]                        \n"
    "umov   w1, v16.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #56]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #64]"
    "umov   w0, v17.s[0]                        \n"
    "umov   w1, v17.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #64]         \n"

    :
    : // pointers
      [p_vec_tmp] "r"(vec_tmp),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
  );






    // Final [2]: carry propogation

    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i<9; i++) {
    //     vec_carry = vshr_n_u32(vec_tmp[i], 30);
    //     vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
    //     vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    // }
  __asm__(
     "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
     "ins   v13.d[0], x0              \n"
     "ins   v13.d[1], x1              \n"

     "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
     "ins   v14.d[0], x0              \n"
     "ins   v14.d[1], x1              \n"

     "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
     "ins   v15.d[0], x0              \n"
     "ins   v15.d[1], x1              \n"

     "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
     "ins   v16.d[0], x0              \n"
     "ins   v16.d[1], x1              \n"

     "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
     "ins   v17.d[0], x0              \n"
     "ins   v17.d[1], x1              \n"
     // v13 = vec_uuV2_uuV3_rrV2_rrV3
     // v14 = vec_uuV4_uuV5_rrV4_rrV5
     // v15 = vec_uuV6_uuV7_rrV6_rrV7
     // v16 = vec_uuV8_uuV9_rrV8_rrV9
     // v17 = vec_uuV10_0_rrV10_0



     "mov   x0, #3                   \n"
     "lsl   x0, x0, #30              \n"
     // x1 = 2p30a2p31
     "dup   v18.2d, x0               \n"
     // v18 = vec_2x_2p30a2p31
     "lsl   x0, x0, #32              \n"
     "dup   v19.2d, x0               \n"
     // v19 = vec_2x_2p62a2p63


     "movi  v20.2d, #0                \n"
     // v20 = vec_carry


     // "and   v20.16b, v12.16b, v18.16b   \n"
     // "bic   v12.16b, v12.16b, v18.16b   \n"
     // "shl   v20.2d,  v20.2d,  #2       \n"
     // "add   v12.2d,  v12.2d,  v20.2d   \n"

     // "and   v20.16b, v12.16b, v19.16b   \n"
     // "bic   v12.16b, v12.16b, v19.16b   \n"
     // "ushr  v20.2d,  v20.2d,  #62       \n"
     // "add   v13.2d,  v13.2d,  v20.2d   \n"


     "and   v20.16b, v13.16b, v18.16b   \n"
     "bic   v13.16b, v13.16b, v18.16b   \n"
     "shl   v20.2d,  v20.2d,  #2       \n"
     "add   v13.2d,  v13.2d,  v20.2d   \n"

     "and   v20.16b, v13.16b, v19.16b   \n"
     "bic   v13.16b, v13.16b, v19.16b   \n"
     "ushr  v20.2d,  v20.2d,  #62       \n"
     "add   v14.2d,  v14.2d,  v20.2d   \n"


     "and   v20.16b, v14.16b, v18.16b   \n"
     "bic   v14.16b, v14.16b, v18.16b   \n"
     "shl   v20.2d,  v20.2d,  #2       \n"
     "add   v14.2d,  v14.2d,  v20.2d   \n"

     "and   v20.16b, v14.16b, v19.16b   \n"
     "bic   v14.16b, v14.16b, v19.16b   \n"
     "ushr  v20.2d,  v20.2d,  #62       \n"
     "add   v15.2d,  v15.2d,  v20.2d   \n"


     "and   v20.16b, v15.16b, v18.16b   \n"
     "bic   v15.16b, v15.16b, v18.16b   \n"
     "shl   v20.2d,  v20.2d,  #2       \n"
     "add   v15.2d,  v15.2d,  v20.2d   \n"

     "and   v20.16b, v15.16b, v19.16b   \n"
     "bic   v15.16b, v15.16b, v19.16b   \n"
     "ushr  v20.2d,  v20.2d,  #62       \n"
     "add   v16.2d,  v16.2d,  v20.2d   \n"


     "and   v20.16b, v16.16b, v18.16b   \n"
     "bic   v16.16b, v16.16b, v18.16b   \n"
     "shl   v20.2d,  v20.2d,  #2       \n"
     "add   v16.2d,  v16.2d,  v20.2d   \n"

     "and   v20.16b, v16.16b, v19.16b   \n"
     "bic   v16.16b, v16.16b, v19.16b   \n"
     "ushr  v20.2d,  v20.2d,  #62       \n"
     "add   v17.2d,  v17.2d,  v20.2d   \n"
     // dump to 
     // v13 = vec_uuV2_uuV3_rrV2_rrV3
     // v14 = vec_uuV4_uuV5_rrV4_rrV5
     // v15 = vec_uuV6_uuV7_rrV6_rrV7
     // v16 = vec_uuV8_uuV9_rrV8_rrV9
     // v17 = vec_uuV10_0_rrV10_0

     // "umov   x0, v12.d[0]              \n"
     // "umov   x1, v12.d[1]              \n"
     // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

     "umov   x0, v13.d[0]              \n"
     "umov   x1, v13.d[1]              \n"
     "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

     "umov   x0, v14.d[0]              \n"
     "umov   x1, v14.d[1]              \n"
     "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

     "umov   x0, v15.d[0]              \n"
     "umov   x1, v15.d[1]              \n"
     "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

     "umov   x0, v16.d[0]              \n"
     "umov   x1, v16.d[1]              \n"
     "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

     "umov   x0, v17.d[0]              \n"
     "umov   x1, v17.d[1]              \n"
     "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

     // dump to
     //


     // "ldp    w0, w1, [%[p_vec_tmp]]"
     "umov   w0, v13.s[0]                        \n"
     "umov   w1, v13.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_tmp]]              \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #8]"
     "umov   w0, v13.s[1]                        \n"
     "umov   w1, v13.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #8]          \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #16]"
     "umov   w0, v14.s[0]                        \n"
     "umov   w1, v14.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #16]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #24]"
     "umov   w0, v14.s[1]                        \n"
     "umov   w1, v14.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #24]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #32]"
     "umov   w0, v15.s[0]                        \n"
     "umov   w1, v15.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #32]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #40]"
     "umov   w0, v15.s[1]                        \n"
     "umov   w1, v15.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #40]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #48]"
     "umov   w0, v16.s[0]                        \n"
     "umov   w1, v16.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #48]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #56]"
     "umov   w0, v16.s[1]                        \n"
     "umov   w1, v16.s[3]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #56]         \n"

     // "ldp    w0, w1, [%[p_vec_tmp], #64]"
     "umov   w0, v17.s[0]                        \n"
     "umov   w1, v17.s[2]                        \n"
     "stp    w0, w1, [%[p_vec_tmp], #64]         \n"
     :
     : // pointers
  [p_vec_tmp] "r"(vec_tmp),
  [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
  [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
  [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
  [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
  [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0),
  [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
  [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
  [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
  [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
  [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)

     : "memory",
  "x0","x1",
  "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
   );

    // Final [3]: Reduction P
    // vec_small_tmp = vdup_n_u32(19);
    // for (int i = 0; i < 8; i++)
    // {
    //     vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[i]);
    //     vec_small_tmp = vshr_n_u32(vec_small_tmp, 30);
    // }
    // vec_small_tmp = vadd_u32(vec_small_tmp, vec_tmp[8]);
    //
    // vec_reductionhat = (uint32x2_t)vshr_n_s32(
    //     (int32x2_t)vsub_u32(
    //         vec_u32_2p15m1,
    //         vec_small_tmp
    //     ),
    //     31
    // );
    // print_u32x2(vec_reductionhat);
    //
    // vec_tmp[0] = vadd_u32(vec_tmp[0], vand_u32(vec_reductionhat, vdup_n_u32(19)));
    // vec_tmp[8] = vsub_u32(vec_tmp[8], vand_u32(vec_reductionhat, vdup_n_u32(32768)));

  // print_vec_tmp(vec_tmp, 9);

__asm__ volatile(
    /* ---------- load accumulated uuV/rrV vectors ---------- */
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"
    "ins   v13.d[0], x0                     \n"
    "ins   v13.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"
    "ins   v14.d[0], x0                     \n"
    "ins   v14.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"
    "ins   v15.d[0], x0                     \n"
    "ins   v15.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"
    "ins   v16.d[0], x0                     \n"
    "ins   v16.d[1], x1                     \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]] \n"
    "ins   v17.d[0], x0                     \n"
    "ins   v17.d[1], x1                     \n"
    /* v13–v17 = uuV/rrV0‥8,10                                  */


    /* ---------- prepare constants (mask moved to v24) ------ */
    "mov   x0, #3                           \n"
    "lsl   x0, x0, #30                      \n"
    "dup   v24.2d, x0                       \n"   /* v24 = 2^30+2^31 */
    "lsl   x0, x0, #32                      \n"
    "dup   v19.2d, x0                       \n"   /* v19 = 2^62+2^63 */

    "mov   x0, #19                          \n"
    "dup   v20.2d, x0                       \n"   /* v20 = [19,19] */
    "mov   x0, #1                           \n"
    "lsl   x0, x0, #15                      \n"
    "dup   v26.2d, x0                       \n"   /* v26 = [32768,32768] */
    "sub   x0, x0, #1                       \n"
    "dup   v21.2d, x0                       \n"   /* v21 = [32767,32767] */

    "mov   v22.16b, v20.16b                 \n"   /* v22 = small tmp */

    /* ---------- carry-scan with new slots ----------------- */
    "add   v22.2d, v22.2d, v13.2d           \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v13.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v14.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v15.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v24.16b        \n"
    "shl   v22.2d,  v22.2d,  #2             \n"

    "add   v22.2d, v22.2d,  v16.2d          \n"
    "and   v22.16b, v22.16b, v19.16b        \n"
    "ushr  v22.2d, v22.2d,  #62             \n"

    "add   v22.2d, v22.2d,  v17.2d          \n"
    "sub   v25.2d, v21.2d, v22.2d           \n"
    "sshr  v25.2d, v25.2d, #63              \n"   /* v25 = reduction-hat */


    /* adjust limbs with reduction-hat */
    "and   v20.16b, v20.16b, v25.16b        \n"
    "add   v13.2d,  v13.2d,  v20.2d         \n"
    "and   v26.16b, v26.16b, v25.16b        \n"
    "sub   v17.2d,  v17.2d,  v26.2d         \n"

    /* ---------- store back 64-bit uuV/rrV vectors --------- */
    "umov  x0, v13.d[0]                     \n"
    "umov  x1, v13.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]] \n"

    "umov  x0, v14.d[0]                     \n"
    "umov  x1, v14.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]] \n"

    "umov  x0, v15.d[0]                     \n"
    "umov  x1, v15.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]] \n"

    "umov  x0, v16.d[0]                     \n"
    "umov  x1, v16.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]] \n"

    "umov  x0, v17.d[0]                     \n"
    "umov  x1, v17.d[1]                     \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]    \n"

    // "ldp    w0, w1, [%[p_vec_tmp]]"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp]]              \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #8]"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #8]          \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #16]"
    "umov   w0, v14.s[0]                        \n"
    "umov   w1, v14.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #24]"
    "umov   w0, v14.s[1]                        \n"
    "umov   w1, v14.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #24]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #32]"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #32]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #40]"
    "umov   w0, v15.s[1]                        \n"
    "umov   w1, v15.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #48]"
    "umov   w0, v16.s[0]                        \n"
    "umov   w1, v16.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #48]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #56]"
    "umov   w0, v16.s[1]                        \n"
    "umov   w1, v16.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #56]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #64]"
    "umov   w0, v17.s[0]                        \n"
    "umov   w1, v17.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #64]         \n"
    :
    : // pointers
      [p_vec_tmp] "r"(vec_tmp),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0),
      [p_vec_vvS2_vvS3_ssS2_ssS3] "r"(&vec_vvS2_vvS3_ssS2_ssS3),
      [p_vec_vvS4_vvS5_ssS4_ssS5] "r"(&vec_vvS4_vvS5_ssS4_ssS5),
      [p_vec_vvS6_vvS7_ssS6_ssS7] "r"(&vec_vvS6_vvS7_ssS6_ssS7),
      [p_vec_vvS8_vvS9_ssS8_ssS9] "r"(&vec_vvS8_vvS9_ssS8_ssS9),
      [p_vec_vvS10_0_ssS10_0] "r"(&vec_vvS10_0_ssS10_0)
    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11",
      "v13","v14","v15","v16","v17",
      "v19","v20","v21","v22","v24","v25"
);


  // print_vec_tmp(vec_tmp, 9);





    // Final [4]: carry propogation
    // vec_carry = vdup_n_u32(0);
    // for (int i = 0; i < 9; i++){
    //     vec_carry = vshr_n_u32(vec_tmp[i], 30);
    //     vec_tmp[i] = vand_u32(vec_tmp[i], vec_u32_2p30m1);
    //     vec_tmp[i+1] = vadd_u32(vec_tmp[i+1], vec_carry);
    // }

  __asm__(
    "ldp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"
    "ins   v13.d[0], x0              \n"
    "ins   v13.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"
    "ins   v14.d[0], x0              \n"
    "ins   v14.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"
    "ins   v15.d[0], x0              \n"
    "ins   v15.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"
    "ins   v16.d[0], x0              \n"
    "ins   v16.d[1], x1              \n"

    "ldp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"
    "ins   v17.d[0], x0              \n"
    "ins   v17.d[1], x1              \n"
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0



    "mov   x0, #3                   \n"
    "lsl   x0, x0, #30              \n"
    // x1 = 2p30a2p31
    "dup   v18.2d, x0               \n"
    // v18 = vec_2x_2p30a2p31
    "lsl   x0, x0, #32              \n"
    "dup   v19.2d, x0               \n"
    // v19 = vec_2x_2p62a2p63


    "movi  v20.2d, #0                \n"
    // v20 = vec_carry


    // "and   v20.16b, v12.16b, v18.16b   \n"
    // "bic   v12.16b, v12.16b, v18.16b   \n"
    // "shl   v20.2d,  v20.2d,  #2       \n"
    // "add   v12.2d,  v12.2d,  v20.2d   \n"

    // "and   v20.16b, v12.16b, v19.16b   \n"
    // "bic   v12.16b, v12.16b, v19.16b   \n"
    // "ushr  v20.2d,  v20.2d,  #62       \n"
    // "add   v13.2d,  v13.2d,  v20.2d   \n"


    "and   v20.16b, v13.16b, v18.16b   \n"
    "bic   v13.16b, v13.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v13.2d,  v13.2d,  v20.2d   \n"

    "and   v20.16b, v13.16b, v19.16b   \n"
    "bic   v13.16b, v13.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"


    "and   v20.16b, v14.16b, v18.16b   \n"
    "bic   v14.16b, v14.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v14.2d,  v14.2d,  v20.2d   \n"

    "and   v20.16b, v14.16b, v19.16b   \n"
    "bic   v14.16b, v14.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"


    "and   v20.16b, v15.16b, v18.16b   \n"
    "bic   v15.16b, v15.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v15.2d,  v15.2d,  v20.2d   \n"

    "and   v20.16b, v15.16b, v19.16b   \n"
    "bic   v15.16b, v15.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"


    "and   v20.16b, v16.16b, v18.16b   \n"
    "bic   v16.16b, v16.16b, v18.16b   \n"
    "shl   v20.2d,  v20.2d,  #2       \n"
    "add   v16.2d,  v16.2d,  v20.2d   \n"

    "and   v20.16b, v16.16b, v19.16b   \n"
    "bic   v16.16b, v16.16b, v19.16b   \n"
    "ushr  v20.2d,  v20.2d,  #62       \n"
    "add   v17.2d,  v17.2d,  v20.2d   \n"
    // dump to 
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // "umov   x0, v12.d[0]              \n"
    // "umov   x1, v12.d[1]              \n"
    // "stp   x0, x1, [%[p_vec_uuV0_uuV1_rrV0_rrV1]]\n"

    "umov   x0, v13.d[0]              \n"
    "umov   x1, v13.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV2_uuV3_rrV2_rrV3]]\n"

    "umov   x0, v14.d[0]              \n"
    "umov   x1, v14.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV4_uuV5_rrV4_rrV5]]\n"

    "umov   x0, v15.d[0]              \n"
    "umov   x1, v15.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV6_uuV7_rrV6_rrV7]]\n"

    "umov   x0, v16.d[0]              \n"
    "umov   x1, v16.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV8_uuV9_rrV8_rrV9]]\n"

    "umov   x0, v17.d[0]              \n"
    "umov   x1, v17.d[1]              \n"
    "stp   x0, x1, [%[p_vec_uuV10_0_rrV10_0]]\n"

    // dump to
    //


    // "ldp    w0, w1, [%[p_vec_tmp]]"
    "umov   w0, v13.s[0]                        \n"
    "umov   w1, v13.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp]]              \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #8]"
    "umov   w0, v13.s[1]                        \n"
    "umov   w1, v13.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #8]          \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #16]"
    "umov   w0, v14.s[0]                        \n"
    "umov   w1, v14.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #16]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #24]"
    "umov   w0, v14.s[1]                        \n"
    "umov   w1, v14.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #24]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #32]"
    "umov   w0, v15.s[0]                        \n"
    "umov   w1, v15.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #32]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #40]"
    "umov   w0, v15.s[1]                        \n"
    "umov   w1, v15.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #40]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #48]"
    "umov   w0, v16.s[0]                        \n"
    "umov   w1, v16.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #48]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #56]"
    "umov   w0, v16.s[1]                        \n"
    "umov   w1, v16.s[3]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #56]         \n"

    // "ldp    w0, w1, [%[p_vec_tmp], #64]"
    "umov   w0, v17.s[0]                        \n"
    "umov   w1, v17.s[2]                        \n"
    "stp    w0, w1, [%[p_vec_tmp], #64]         \n"
    :
    : // pointers
      [p_vec_tmp] "r"(vec_tmp),
      [p_vec_uuV0_uuV1_rrV0_rrV1] "r"(&vec_uuV0_uuV1_rrV0_rrV1),
      [p_vec_uuV2_uuV3_rrV2_rrV3] "r"(&vec_uuV2_uuV3_rrV2_rrV3),
      [p_vec_uuV4_uuV5_rrV4_rrV5] "r"(&vec_uuV4_uuV5_rrV4_rrV5),
      [p_vec_uuV6_uuV7_rrV6_rrV7] "r"(&vec_uuV6_uuV7_rrV6_rrV7),
      [p_vec_uuV8_uuV9_rrV8_rrV9] "r"(&vec_uuV8_uuV9_rrV8_rrV9),
      [p_vec_uuV10_0_rrV10_0] "r"(&vec_uuV10_0_rrV10_0)

    : "memory",
      "x0","x1",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20"
  );


    // Step [str]
    for (int i = 0; i < 9; i++) {
        V->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 0);  // lane 0
        S->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 1);  // lane 1
    }








    /*printf("the linear_comb function is over!\n");*/
    

}


