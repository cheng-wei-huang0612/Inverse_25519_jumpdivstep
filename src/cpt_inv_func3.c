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
extern void final_adjustment(uint256_t *inv, big30_t *F, big30_t *V);


big30_t P = {{
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff}
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



              /* ---------- extraction + inner_update (u,v,r,s 免 load) ----------- */
              __asm__ volatile(
                  /* === 1) 讀 fuv,grs → v0 ======================================= */
                  "ldr        x1, [%[pfuv]]              \n"
                  "ldr        x6, [%[pgrs]]              \n"
                  "dup        v0.2d,  x1                 \n"
                  "mov        v0.d[1], x6                \n"

                  /* === 2) 常數向量 v2={2^20}, v3={2^41} ========================= */
                  "mov        x3,  #1                    \n"
                  "dup        v1.2d, x3                  \n"   /* v1={1,1}          */
                  "shl        v2.2d, v1.2d, #20          \n"   /* 2^20              */
                  "shl        v3.2d, v1.2d, #41          \n"   /* 2^41              */

                  /* === 3) v4.d={v,s} , v5.d={u,r} =============================== */
                  "add        v4.2d, v0.2d, v2.2d        \n"
                  "add        v4.2d, v4.2d, v3.2d        \n"
                  "sshr       v4.2d, v4.2d, #42          \n"   /* v4={v,s}          */

                  "add        v5.2d, v0.2d, v2.2d        \n"
                  "shl        v5.2d, v5.2d, #22          \n"
                  "sshr       v5.2d, v5.2d, #43          \n"   /* v5={u,r}          */

                  /* === 4) 為測試寫回 uvrs[4] (若 release 可拿掉) =============== */
                  "zip1       v6.2d, v5.2d, v4.2d        \n"   /* v6={u,v}          */
                  "zip2       v7.2d, v5.2d, v4.2d        \n"   /* v7={r,s}          */
                  "st1        {v6.2d, v7.2d}, [%[puvrs]] \n"

                  /* === 5) 把 u,v,r,s 直接搬進 GPR，免去 4× LDR ================ */
                  "umov       x6, v5.d[0]                \n"   /* u */
                  "umov       x7, v4.d[0]                \n"   /* v */
                  "umov       x8, v5.d[1]                \n"   /* r */
                  "umov       x3, v4.d[1]                \n"   /* s */

                  /* === 6) new_f,new_g 與 uu,vv,rr,ss 更新 —— 與原碼完全相同 ==== */

                  /* -- 6-1 讀 f,g ------------------------------------------------- */
                  "ldr     x4, [%[pf]]                   \n"   /* f */
                  "ldr     x5, [%[pg]]                   \n"   /* g */

                  /* -- 6-2 new_f = (u*f + v*g) >> 20 ----------------------------- */
                  "mul     x9,  x6, x4                   \n" //  x9 = u * f (lo)
                  "smulh   x10, x6, x4                   \n" // x10 = u * f (hi)
                  "mul     x11, x7, x5                   \n"
                  "adds    x9,  x9, x11                  \n"
                  "smulh   x11, x7, x5                   \n"
                  "adc     x10, x10, x11                 \n"
                  "lsr     x9,  x9,  #20                 \n"
                  "lsl     x10, x10, #44                 \n"
                  "orr     x9,  x9,  x10                 \n"
                  "str     x9,  [%[pf]]                  \n"

                  /* -- 6-3 new_g = (r*f + s*g) >> 20 ----------------------------- */
                  "mul     x0,  x8, x4                   \n"
                  "smulh   x4,  x8, x4                   \n"
                  "mul     x9,  x3, x5                   \n"
                  "adds    x0,  x0, x9                   \n"
                  "smulh   x5,  x3, x5                   \n"
                  "adc     x4,  x4, x5                   \n"
                  "lsr     x0,  x0,  #20                 \n"
                  "lsl     x4,  x4,  #44                 \n"
                  "orr     x0,  x0,  x4                  \n"
                  "str     x0,  [%[pg]]                  \n"

                  /* -- 6-4 uu,vv,rr,ss 更新 (保持原純 GPR 版本) ------------------ */
                  "ldr     x0, [%[uuvv]]                 \n"   /* uu */
                  "ldr     x1, [%[uuvv],  #8]            \n"   /* vv */
                  "ldr     x4, [%[uuvv], #16]            \n"   /* rr */
                  "ldr     x5, [%[uuvv], #24]            \n"   /* ss */

                  "mul     x9,  x6, x0                   \n"
                  "madd    x9,  x7, x4, x9               \n"
                  "str     x9, [%[uuvv]]                 \n"

                  "mul     x0,  x8, x0                   \n"
                  "madd    x0,  x3, x4, x0               \n"
                  "str     x0, [%[uuvv], #16]            \n"

                  "mul     x0,  x6, x1                   \n"
                  "madd    x0,  x7, x5, x0               \n"
                  "str     x0, [%[uuvv],  #8]            \n"

                  "mul     x0,  x8, x1                   \n"
                  "madd    x0,  x3, x5, x0               \n"
                  "str     x0, [%[uuvv], #24]            \n"
                  :
                  : [pfuv] "r"(&fuv),   [pgrs] "r"(&grs),
                    [puvrs]"r"(uvrs),
                    [pf]   "r"(&f),     [pg]   "r"(&g),
                    [uuvv] "r"(uuvvrrss)
                  : /* GPR */
                    "x0","x1","x3","x4","x5","x6","x7","x8","x9","x10","x11",
                    /* SIMD */
                    "v0","v1","v2","v3","v4","v5","v6","v7",
                    "memory","cc"
              );






        }


        // Update FG

        update_FG(&F, &G, uuvvrrss);

        // Update VS
        update_VS_mont(&V, &S, uuvvrrss);
    }
    
    // sign_adjustment
    // V = sign(F) * V
    
    final_adjustment(inv, &F, &V);
}
