#include <stdint.h>
#include <stdio.h>
#include "big30.h"
/*#include "divstep.h"*/
/*#include "uv_extraction.h"*/
/*#include "update_FG.h"*/
/*#include "update_VS_mont.h"*/
/*#include "inner_update.h"*/
/*#include "sign_adjustment.h"*/
#include <gmp.h>


extern void divstepx20(int64_t *delta, int64_t *fuv, int64_t *grs);
extern void inner_update(int64_t *f, int64_t *g, int64_t *uuvvrrss, int64_t *uvrs );
extern void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V);
extern void extraction(int64_t *uvrs, int64_t *fuv, int64_t *grs);
extern void update_FG(big30_t *F, big30_t *G, int64_t *uuvvrrss);
extern void update_VS_mont(big30_t *V, big30_t *S, int64_t *uuvvrrss);


big30_t P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};




void cpt_inv(uint256_t *x, uint256_t *inv){

    big30_t F, G, V, S;
    int64_t f, g;
    int64_t delta = 1;
    int64_t fuv, grs;
    int64_t uuvvrrss[4];
    int64_t uvrs[4];
    
    big30_from_uint256(&G, x);



    for (size_t i = 0; i < 9; i++) {
        F.limb[i] = P.limb[i];
        V.limb[i] = 0;
        S.limb[i] = 0;
    }
    S.limb[0] = 1;



    for (int i = 0; i < 10; i++) {

        f = (int64_t) F.limb[1];
        g = (int64_t) G.limb[1];
        f = (f << 30);
        g = (g << 30);
        f = f + (int64_t)F.limb[0];
        g = g + (int64_t)G.limb[0];
        
        uuvvrrss[0] = 1;
        uuvvrrss[1] = 0;
        uuvvrrss[2] = 0;
        uuvvrrss[3] = 1;

        for (int j = 0; j < 3; j++) {
            fuv = (f & 0xFFFFF) - ( (int64_t) 1 << 41 );
            grs = (g & 0xFFFFF) - ( (int64_t) 1 << 62 );

            divstepx20(&delta, &fuv, &grs); 



            // u, v, r, s extraction
            // extraction(uvrs, &fuv, &grs);
              /* LDP 把 fuv,grs 讀進 v0 */

/*------------  extraction : fuv,grs  →  uvrs[0..3]  ----------------*/
__asm__ volatile(
    /* ---- 讀 fuv, grs ------------------------------------------------ */
    "ldr        x1,  [%[pfuv]]              \n"   /* fuv → x1 */
    "ldr        x6,  [%[pgrs]]              \n"   /* grs → x6 */

    /* ---- 暫存進 NEON (與之前相同) ---------------------------------- */
    "dup        v0.2d,  x1                  \n"   /* v0 = {fuv,fuv} */
    "mov        v0.d[1], x6                 \n"   /* v0 = {fuv,grs} */
    // "umov       x1,  v0.d[0]                \n"   /* 取回 fuv */
    // "umov       x6,  v0.d[1]                \n"   /* 取回 grs */

    /* ------------------------------------------------------------------
     * (A) 用 NEON 產生 2^20 與 2^41
     * -----------------------------------------------------------------*/

    /* v1 = {1,1} */

    "mov       x3   , #1                   \n"
    "dup       v1.2d, x3                   \n"

    /* v2 = v1 << 20  ==> {2^20,2^20}  */
    "shl        v2.2d, v1.2d, #20           \n"

    /* v3 = v1 << 41  ==> {2^41,2^41}  */
    "shl        v3.2d, v1.2d, #41           \n"


    /* ------------------------------------------------------------------
     * (B) 與原先純 GPR 版本相同，但把 #1048576 immediate → x9
     * -----------------------------------------------------------------*/

    /* v = (fuv + 2^20 + 2^41) >> 42  */
    /* s = (grs + 2^20 + 2^41) >> 42  */
    "mov        v4.16b,  v0.16b                     \n"
    "add        v4.2d,  v4.2d, v2.2d                     \n"
    "add        v4.2d,  v4.2d, v3.2d                     \n"
    "sshr       v4.2d,  v4.2d, #42                     \n"


    // "umov       x4,  v4.d[0]                \n"   /* 取回 fuv */
    // "umov       x7,  v4.d[1]                \n"   /* 取回 grs */

    // "asr        x4,  x4, #42                \n"   /* v */
    // "asr        x7,  x7, #42                \n"   /* s */

    /* u = round(fuv/2^21)    r = round(grs/2^21)  */

    "mov        v5.16b,  v0.16b                     \n"
    "add        v5.2d,  v5.2d, v2.2d                     \n"
    "shl        v5.2d,  v5.2d, #22                     \n"
    "sshr       v5.2d,  v5.2d, #43                     \n"

    /* ---- 把 {u,r} | {v,s} 重新排列成 {u,v} | {r,s} ------------------- */
    "zip1       v6.2d,  v5.2d, v4.2d     \n"   /* v6.d = {u,v} */
    "zip2       v7.2d,  v5.2d, v4.2d     \n"   /* v7.d = {r,s} */
    "st1        {v6.2d, v7.2d}, [%[puvrs]]   \n"


    :
    : [pfuv]"r"(&fuv),
      [pgrs]"r"(&grs),
      [puvrs]"r"(uvrs)
    : /* GPR clobber */
      "x1","x3","x4","x5","x6","x7","x8","x9",
      /* NEON clobber */
      "v0","v1","v2","v3","v4","v5","v6","v7",
      "memory","cc"
);

            // update_fg_uuvvrrss
            inner_update(&f, &g, uuvvrrss, uvrs);
            // __asm__ volatile(
            //     /* ───── 1. 取出 f, g, 以及 u v r s ───── */
            //     "ldr     x4, [%[pf]]              \n"   /* f */
            //     "ldr     x5, [%[pg]]              \n"   /* g */
            //
            //     "ldr     x6, [%[uvrs]]            \n"   /* u */
            //     "ldr     x7, [%[uvrs],  #8]       \n"   /* v */
            //     "ldr     x8, [%[uvrs], #16]       \n"   /* r */
            //     "ldr     x3, [%[uvrs], #24]       \n"   /* s */
            //
            //     /* ───── new_f = (u*f + v*g) 組合位移 ───── */
            //     "mul     x9,  x6, x4              \n"
            //     "smulh   x10, x6, x4              \n"
            //     "mul     x11, x7, x5              \n"
            //     "adds    x9,  x9, x11             \n"
            //     "smulh   x11, x7, x5              \n"
            //     "adc     x10, x10, x11            \n"
            //     "lsr     x9,  x9,  #20            \n"
            //     "lsl     x10, x10, #44            \n"
            //     "orr     x9,  x9,  x10            \n"
            //     "str     x9,  [%[pf]]             \n"
            //
            //     /* ───── new_g = (r*f + s*g) 組合位移 ───── */
            //     "mul     x0,  x8, x4              \n"
            //     "smulh   x4,  x8, x4              \n"
            //     "mul     x9,  x3, x5              \n"
            //     "adds    x0,  x0, x9              \n"
            //     "smulh   x5,  x3, x5              \n"
            //     "adc     x4,  x4, x5              \n"
            //     "lsr     x0,  x0,  #20            \n"
            //     "lsl     x4,  x4,  #44            \n"
            //     "orr     x0,  x0,  x4             \n"
            //     "str     x0,  [%[pg]]             \n"
            //
            //     /* ───── 2. 讀 uu vv rr ss ───── */
            //     "ldr     x0, [%[uuvv]]            \n"   /* uu */
            //     "ldr     x1, [%[uuvv],  #8]       \n"   /* vv */
            //     "ldr     x4, [%[uuvv], #16]       \n"   /* rr */
            //     "ldr     x5, [%[uuvv], #24]       \n"   /* ss */
            //
            //     /* new_uu = u*uu + v*rr */
            //     "mul     x9,  x6, x0              \n"
            //     "madd    x9,  x7, x4, x9          \n"
            //     "str     x9, [%[uuvv]]            \n"
            //
            //     /* new_rr = r*uu + s*rr */
            //     "mul     x0,  x8, x0              \n"
            //     "madd    x0,  x3, x4, x0          \n"
            //     "str     x0, [%[uuvv], #16]       \n"
            //
            //     /* new_vv = u*vv + v*ss */
            //     "mul     x0,  x6, x1              \n"
            //     "madd    x0,  x7, x5, x0          \n"
            //     "str     x0, [%[uuvv],  #8]       \n"
            //
            //     /* new_ss = r*vv + s*ss */
            //     "mul     x0,  x8, x1              \n"
            //     "madd    x0,  x3, x5, x0          \n"
            //     "str     x0, [%[uuvv], #24]       \n"
            //     :
            //     : [pf]   "r"(&f),          /* %0 */
            //       [pg]   "r"(&g),          /* %1 */
            //       [uuvv] "r"(uuvvrrss),    /* %2 */
            //       [uvrs] "r"(uvrs)         /* %3 */
            //     : /* clobber：列出所有用到的暫存器與狀態 */
            //       "x0","x1","x3","x4","x5","x6","x7","x8",
            //       "x9","x10","x11","memory","cc"
            // );
        }


        // Update FG

        update_FG(&F, &G, uuvvrrss);

        // Update VS
        update_VS_mont(&V, &S, uuvvrrss);
    }
    
    // sign_adjustment
    // V = sign(F) * V
    big30_t inv30;
    
    sign_adjustment(&inv30, &F, &V);

    uint256_from_big30(inv, &inv30);
}
