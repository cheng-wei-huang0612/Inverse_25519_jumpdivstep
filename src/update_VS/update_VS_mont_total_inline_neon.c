#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "big30.h"



void update_VS_mont(
        big30_t *V, big30_t *S, int64_t *uuvvrrss
){

    uint32x2_t vec_tmp[11];


    // uint32x4_t vec_uuV0_uuV1_rrV0_rrV1;
    uint32x4_t vec_uuV2_uuV3_rrV2_rrV3;
    uint32x4_t vec_uuV4_uuV5_rrV4_rrV5;
    uint32x4_t vec_uuV6_uuV7_rrV6_rrV7;
    uint32x4_t vec_uuV8_uuV9_rrV8_rrV9;
    uint32x4_t vec_uuV10_0_rrV10_0;
    // uint32x4_t vec_vvS0_vvS1_ssS0_ssS1;
    uint32x4_t vec_vvS2_vvS3_ssS2_ssS3;
    uint32x4_t vec_vvS4_vvS5_ssS4_ssS5;
    uint32x4_t vec_vvS6_vvS7_ssS6_ssS7;
    uint32x4_t vec_vvS8_vvS9_ssS8_ssS9;
    uint32x4_t vec_vvS10_0_ssS10_0;


__asm__ volatile(
    /* === (1) 讀 uu·vv·rr·ss 到 x0-x3 ======================== */
    "ldp     x0,  x1,  [%[p_uuvvrrss]]        \n"   /* x0=uu  x1=vv          */
    "ldp     x2,  x3,  [%[p_uuvvrrss], #16]   \n"   /* x2=rr  x3=ss          */

    "ins     v10.s[0],  w0              \n"
    "ins     v10.s[1],  w2              \n"
    "ins     v10.s[2],  w1              \n"
    "ins     v10.s[3],  w3              \n"

    /* === (2) 抽出 30-bit limbs 與 bit-63 hats ================ */
    "ubfx    x0,  x0, #30, #32         \n"   /* u1  -> x6 */
    "ubfx    x1,  x1, #30, #32         \n"   /* v1  -> x12 */
    "ubfx    x2,  x2, #30, #32         \n"   /* r1  -> x7 */
    "ubfx    x3,  x3, #30, #32         \n"   /* s1  -> x13 */


    "ins     v11.s[0],  w0              \n"
    "ins     v11.s[1],  w2              \n"
    "ins     v11.s[2],  w1              \n"
    "ins     v11.s[3],  w3              \n"
    "sshr    v12.4s, v11.4s, #31        \n"

    "mov     x0, #1\n"
    "lsl     x0, x0, #30\n"
    "sub     x0, x0, #1\n"
    "ins     v31.s[0], w0\n"
    "ins     v31.s[1], w0\n"
    "ins     v31.s[2], w0\n"
    "ins     v31.s[3], w0\n"
    "and     v10.16b, v10.16b, v31.16b\n"
    "and     v11.16b, v11.16b, v31.16b\n"



    // v10 = vec_uu0_rr0_vv0_ss0
    // v11 = vec_uu1_rr1_vv1_ss1
    // v12 = vec_uuhat_rrhat_vvhat_sshat

    /* ==== 1. 把 V[0..8]、S[0..8] 載到 x4–x9 ===================== */
    "ldp   x0,  x1,  [%[pV]]        \n"   /* V0V1  V2V3 */
    "ldp   x2,  x3,  [%[pS]]        \n"   /* S0S1  S2S3 */

    "ins   v0.d[0], x0              \n"   /* [V0V1, ?]  */
    "ins   v0.d[1], x2              \n"   /* [V0V1, S0S1] */
    "ins   v1.d[0], x1              \n"
    "ins   v1.d[1], x3              \n"


    "ldp   x0,  x1,  [%[pV], #16]   \n"   /* V4V5  V6V7 */
    "ldp   x2,  x3,  [%[pS], #16]   \n"   /* S4S5  S6S7 */


    "ins   v2.d[0], x0              \n"
    "ins   v2.d[1], x2              \n"
    "ins   v3.d[0], x1              \n"
    "ins   v3.d[1], x3              \n"


    "ldr   w0,      [%[pV], #32]    \n"   /* V8               */
    "ldr   w1,      [%[pS], #32]    \n"   /* S8               */
    "ins   v4.d[0], x0              \n"
    "ins   v4.d[1], x1              \n"

    // dump to vec_V0_V1_S0_S1
    // "umov    x0, v0.d[0]\n"
    // "umov    x1, v0.d[1]\n"
    // "stp     x0, x1, [%[p_vec_V0_V1_S0_S1]]\n"
    // "umov    x0, v1.d[0]\n"
    // "umov    x1, v1.d[1]\n"
    // "stp     x0, x1, [%[p_vec_V2_V3_S2_S3]]\n"
    // "umov    x0, v2.d[0]\n"
    // "umov    x1, v2.d[1]\n"
    // "stp     x0, x1, [%[p_vec_V4_V5_S4_S5]]\n"
    // "umov    x0, v3.d[0]\n"
    // "umov    x1, v3.d[1]\n"
    // "stp     x0, x1, [%[p_vec_V6_V7_S6_S7]]\n"
    // "umov    x0, v4.d[0]\n"
    // "umov    x1, v4.d[1]\n"
    // "stp     x0, x1, [%[p_vec_V8_0_S8_0]]\n"

    "movi  v13.2d, #0   \n"
    "movi  v14.2d, #0   \n"
    "movi  v15.2d, #0   \n"
    "movi  v16.2d, #0   \n"
    "movi  v17.2d, #0   \n"
    "movi  v18.2d, #0   \n"
    // v13 = vec_uuV0_uuV1_rrV0_rrV1
    // v14 = vec_uuV2_uuV3_rrV2_rrV3
    // v15 = vec_uuV4_uuV5_rrV4_rrV5
    // v16 = vec_uuV6_uuV7_rrV6_rrV7
    // v17 = vec_uuV8_uuV9_rrV8_rrV9
    // v18 = vec_uuV10_0_rrV10_0

    "mov   x0, #1                   \n"
    "lsl   x0, x0, #30              \n"
    "sub   x0, x0, #1                   \n"
    "dup   v20.2d, x0               \n"



    "movi  v21.2d, #0                \n"
    // v21 = vec_prod
    // v22 = vec_buf
    "umlal v21.2d, v10.2s, v0.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v13.2d, v13.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v0.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v13.2d, v13.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v1.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v14.2d, v14.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v1.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v14.2d, v14.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v2.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v15.2d, v15.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v2.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v15.2d, v15.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v3.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v16.2d, v16.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v3.s[1]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v16.2d, v16.2d, v22.2d        \n"

    "umlal v21.2d, v10.2s, v4.s[0]        \n"
    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "add   v17.2d, v17.2d, v22.2d        \n"

    "and   v22.16b, v21.16b, v20.16b     \n"
    "ushr  v21.2d, v21.2d, #30           \n"
    "shl   v22.2d, v22.2d, #32           \n"
    "add   v17.2d, v17.2d, v22.2d        \n"



    /* === 2. 建立 vec_M = [678152731, 678152731] = 0x286BCA1B ==== */
    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v19.4s,  w1                          \n"  

    /* === 3. vec_l0 = (v0 * v1) & (2³⁰‑1) ====================== */
    "mul    v19.4s, v13.4s, v19.4s                 \n"
    "uzp1   v19.4s, v19.4s, v19.4s                  \n"

        /* 2³⁰‑1 mask：0x3FFFFFFF */
    "mov    w1,  #1                             \n"
    "lsl    w1,  w1,  #30                       \n"
    "sub    w1,  w1,  #1                        \n"
    "dup    v20.2s,  w1                          \n"

    "and    v19.8b, v19.8b, v20.8b                 \n"


    /* ---- prepare constants -------------------------------- */
    "mov   x0, #1                         \n"
    "lsl   x1, x0, #30                    \n"
    "sub   x1, x1, #1                     \n"
    "dup   v20.2d, x1                     \n"   /* 2^30-1  */
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
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v13.2d, v13.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v13.2d, v13.2d, v23.2d         \n"

    /* —— uuV2 / rrV2 ——————————————— */
    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v14.2d, v14.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v14.2d, v14.2d, v23.2d         \n"

    /* —— uuV4 / rrV4 ——————————————— */
    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v15.2d, v15.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v15.2d, v15.2d, v23.2d         \n"

    /* —— uuV6 / rrV6 ——————————————— */
    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v16.2d, v16.2d, v23.2d         \n"

    "umlal v22.2d, v19.2s, v20.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v16.2d, v16.2d, v23.2d         \n"

    /* —— uuV8 / rrV8 ——————————————— */
    "umlal v22.2d, v19.2s, v26.s[0]       \n"
    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "add   v17.2d, v17.2d, v23.2d         \n"

    "and   v23.16b, v22.16b, v20.16b      \n"
    "ushr  v22.2d, v22.2d, #30            \n"
    "shl   v23.2d, v23.2d, #32            \n"
    "add   v17.2d, v17.2d, v23.2d         \n"


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

    /* ------------ l1 × P0..P4 accumulate ------------------ */
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

    // v13 = vec_uuV0_uuV1_rrV0_rrV1
    // v14 = vec_uuV2_uuV3_rrV2_rrV3
    // v15 = vec_uuV4_uuV5_rrV4_rrV5
    // v16 = vec_uuV6_uuV7_rrV6_rrV7
    // v17 = vec_uuV8_uuV9_rrV8_rrV9
    // v18 = vec_uuV10_0_rrV10_0

    // carry propogation
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

    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // reduction P once
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




    // carry propogation
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
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // conditional subtraction to uuhat_rrhat & V
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
    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0


    // reduction P once
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


    // Carry propogation
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






    /* ---------- clear working accumulators ----------------------- */
    "movi  v18.2d, #0      \n"
    "movi  v19.2d, #0      \n"
    "movi  v20.2d, #0      \n"
    "movi  v21.2d, #0      \n"
    "movi  v22.2d, #0      \n"
    "movi  v23.2d, #0      \n"
    // v18 = p_vec_vvS0_vvS1_ssS0_ssS1
    // v19 = p_vec_vvS2_vvS3_ssS2_ssS3
    // v20 = p_vec_vvS4_vvS5_ssS4_ssS5
    // v21 = p_vec_vvS6_vvS7_ssS6_ssS7
    // v22 = p_vec_vvS8_vvS9_ssS8_ssS9
    // v23 = p_vec_vvS10_0_ssS10_0

    // += vv0, ss0 * S[0:9]
    /* ---------- constant mask (2^30-1) → v24 --------------------- */
    "mov   x0, #1          \n"
    "lsl   x0, x0, #30     \n"
    "sub   x0, x0, #1      \n"
    "dup   v24.2d, x0      \n"

    /* ---------- prod / buf vectors ------------------------------- */
    "movi  v25.2d, #0      \n"   /* v25 = vec_prod */
    /* v26 = vec_buf */

    
    /* ---------- multiply (umlal2) -------------------- */
    "umlal2 v25.2d, v10.4s, v0.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v18.2d,  v18.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v0.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v18.2d,  v18.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v1.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v19.2d,  v19.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v1.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v19.2d,  v19.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v2.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v20.2d,  v20.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v2.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v20.2d,  v20.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v3.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v21.2d,  v21.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v3.s[3]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v21.2d,  v21.2d, v26.2d    \n"

    "umlal2 v25.2d, v10.4s, v4.s[2]     \n"
    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "add    v22.2d,  v22.2d, v26.2d    \n"

    "and    v26.16b, v25.16b, v24.16b  \n"
    "ushr   v25.2d,  v25.2d, #30       \n"
    "shl    v26.2d,  v26.2d, #32       \n"
    "add    v22.2d,  v22.2d, v26.2d    \n"


    // get vec_l0
    /* === 2. 建立 vec_M = [678152731, 678152731] = 0x286BCA1B ==== */
    "movz   w1,  #0xCA1B                        \n"  /* 低 16‑bit          */
    "movk   w1,  #0x286B,  lsl #16              \n"  /* 高 16‑bit          */
    "dup    v24.4s,  w1                          \n"  

    /* === 3. vec_l0  ====================== */
    "mul    v24.4s, v18.4s, v24.4s                 \n"
    "uzp1   v24.4s, v24.4s, v24.4s                \n"

        /* 2³⁰‑1 mask：0x3FFFFFFF */
    "mov    w1,  #1                             \n"
    "lsl    w1,  w1,  #30                       \n"
    "sub    w1,  w1,  #1                        \n"
    "dup    v25.2s,  w1                          \n"

    "and    v24.8b, v24.8b, v25.8b                 \n"

    /* v18–v23 = vvS/ssS0‥10                                   */

    // += l0 * P[0:9]
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

    // carry propogation
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
    "and   v26.16b, v18.16b, v24.16b          \n"
    "bic   v18.16b, v18.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v18.2d,  v18.2d,  v26.2d           \n"

    "and   v26.16b, v18.16b, v25.16b          \n"
    "bic   v18.16b, v18.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v19.2d,  v19.2d,  v26.2d           \n"

    /* ---- vvS2/ssS2 (v19) --------------------------------- */
    "and   v26.16b, v19.16b, v24.16b          \n"
    "bic   v19.16b, v19.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v19.2d,  v19.2d,  v26.2d           \n"

    "and   v26.16b, v19.16b, v25.16b          \n"
    "bic   v19.16b, v19.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v20.2d,  v20.2d,  v26.2d           \n"

    /* ---- vvS4/ssS4 (v20) --------------------------------- */
    "and   v26.16b, v20.16b, v24.16b          \n"
    "bic   v20.16b, v20.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v20.2d,  v20.2d,  v26.2d           \n"

    "and   v26.16b, v20.16b, v25.16b          \n"
    "bic   v20.16b, v20.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v21.2d,  v21.2d,  v26.2d           \n"

    /* ---- vvS6/ssS6 (v21) --------------------------------- */
    "and   v26.16b, v21.16b, v24.16b          \n"
    "bic   v21.16b, v21.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v21.2d,  v21.2d,  v26.2d           \n"

    "and   v26.16b, v21.16b, v25.16b          \n"
    "bic   v21.16b, v21.16b, v25.16b          \n"
    "ushr  v26.2d,  v26.2d,  #62              \n"
    "add   v22.2d,  v22.2d,  v26.2d           \n"

    /* ---- vvS8/ssS8 (v22) --------------------------------- */
    "and   v26.16b, v22.16b, v24.16b          \n"
    "bic   v22.16b, v22.16b, v24.16b          \n"
    "shl   v26.2d,  v26.2d,  #2               \n"
    "add   v22.2d,  v22.2d,  v26.2d           \n"

    /* v18–v23 = vvS/ssS0‥10                                   */


    /* ---------- constant mask in v27 ---------------------- */
    "mov   x0, #1                          \n"
    "lsl   x0, x0, #30                     \n"
    "sub   x0, x0, #1                      \n"
    "dup   v27.2d, x0                      \n"  /* v27 = 2^30−1 */

    /* ---------- prod / buf vectors ------------------------ */
    "movi  v24.2d, #0                      \n"  /* vec_prod */
    /* v25 = vec_buf */

    /* ------------ l1 × P[0:9] accumulate ------------------ */
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

    /* v18–v23 = vvS/ssS0‥10                                   */
    // carry propogation

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


    /* v18–v23 = vvS/ssS0‥10                                   */


    // l1 * P[0:9]
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

    /* ------------ l1 × P0..P4 accumulate ------------------ */
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

    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0



    // carry propogation
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
    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0


    /* v18–v22 = vvS/ssS0‥8,10                                  */
    // carry propogation

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


    


    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    // carry propogation


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


    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0

    // v18 = vec_vvS2_vvS3_ssS2_ssS3
    // v19 = vec_vvS4_vvS5_ssS4_ssS5
    // v20 = vec_vvS6_vvS7_ssS6_ssS7
    // v21 = vec_vvS8_vvS9_ssS8_ssS9
    // v22 = vec_vvS10_0_ssS10_0

    // final addition

    "add   v13.2d, v13.2d, v18.2d  \n"
    "add   v14.2d, v14.2d, v19.2d  \n"
    "add   v15.2d, v15.2d, v20.2d  \n"
    "add   v16.2d, v16.2d, v21.2d  \n"
    "add   v17.2d, v17.2d, v22.2d  \n"



     // linear combination
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
     // v13 = vec_uuV2_uuV3_rrV2_rrV3
     // v14 = vec_uuV4_uuV5_rrV4_rrV5
     // v15 = vec_uuV6_uuV7_rrV6_rrV7
     // v16 = vec_uuV8_uuV9_rrV8_rrV9
     // v17 = vec_uuV10_0_rrV10_0



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

    // v13 = vec_uuV2_uuV3_rrV2_rrV3
    // v14 = vec_uuV4_uuV5_rrV4_rrV5
    // v15 = vec_uuV6_uuV7_rrV6_rrV7
    // v16 = vec_uuV8_uuV9_rrV8_rrV9
    // v17 = vec_uuV10_0_rrV10_0


    // carry propogation

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
      [pV] "r"(V->limb),
      [pS] "r"(S->limb),
      [p_uuvvrrss]           "r"(uuvvrrss),
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
      "x0","x1","x2","x3","x4",
      "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10",
      "v11","v12","v13","v14","v15","v16","v17","v18","v19","v20",
      "v21","v22","v23","v24","v25","v26","v27","v28","v29","v30",
      "v31"
  );









    // Step [str]
    for (int i = 0; i < 9; i++) {
        V->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 0);  // lane 0
        S->limb[i] = (uint32_t)vget_lane_u32(vec_tmp[i], 1);  // lane 1
    }








    /*printf("the linear_comb function is over!\n");*/
    

}


