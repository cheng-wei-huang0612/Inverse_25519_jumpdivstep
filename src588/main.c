#include <stdint.h>
#include <stdio.h>
#include "mybig30.h"

#ifdef USE_GMP
#include <gmp.h>  // 如果要用GMP加/減/乘
#endif

void compare_print(const char *label, int64_t actual, int64_t expected)
{
    // 同時印出十進位和十六進位，方便觀察
    printf("%s => actual = %lld (0x%llX),\n   expected = %lld (0x%llX)\n",
           label,
           (long long) actual,           // 10 進位 (有號)
           (unsigned long long) actual,  // 16 進位
           (long long) expected,
           (unsigned long long) expected);
}




// inline 2×2 矩陣乘 2×2 矩陣 (更新 [F, V; G, S])
// [F', V']   = [ u, v ] * [ F, V ]
// [G', S']     [ s, r ]   [ G, S ]
static inline void update_FVGS(
    big30_9 *F, big30_9 *V,
    big30_9 *G, big30_9 *S,
    int64_t u, int64_t v,
    int64_t s, int64_t r
)
{
    // 將 u,v,s,r 轉 big30_9
    big30_9 bu, bv, bs, br;
    big30_9_from_int64(&bu, u);
    big30_9_from_int64(&bv, v);
    big30_9_from_int64(&bs, s);
    big30_9_from_int64(&br, r);

    // F' = uF + vG
    big30_9 Fp, Vp, Gp, Sp, tmp;

    big30_9_mul_mod(&Fp, &bu, F);      // Fp = (u * F)
    big30_9_mul_mod(&tmp, &bv, G);     // tmp= (v * G)
    big30_9_add_mod(&Fp, &Fp, &tmp);   // F' = Fp+tmp

    // V' = uV + vS
    big30_9_mul_mod(&Vp, &bu, V);
    big30_9_mul_mod(&tmp, &bv, S);
    big30_9_add_mod(&Vp, &Vp, &tmp);

    // G' = sF + rG
    big30_9_mul_mod(&Gp, &bs, F);
    big30_9_mul_mod(&tmp, &br, G);
    big30_9_add_mod(&Gp, &Gp, &tmp);

    // S' = sV + rS
    big30_9_mul_mod(&Sp, &bs, V);
    big30_9_mul_mod(&tmp, &br, S);
    big30_9_add_mod(&Sp, &Sp, &tmp);

    // 回寫
    *F = Fp;  *V = Vp;
    *G = Gp;  *S = Sp;
}
static inline void update_fg(
    big30_9 *f, big30_9 *g,
    int64_t u, int64_t v,
    int64_t s, int64_t r
)
{
    big30_9 bu, bv, bs, br;
    big30_9_from_int64(&bu, u);
    big30_9_from_int64(&bv, v);
    big30_9_from_int64(&bs, s);
    big30_9_from_int64(&br, r);

    big30_9 fp, gp, tmp;

    // f' = u*f + v*g
    big30_9_mul_mod(&fp, &bu, f);
    big30_9_mul_mod(&tmp, &bv, g);
    big30_9_add_mod(&fp, &fp, &tmp);

    // g' = s*f + r*g
    big30_9_mul_mod(&gp, &bs, f);
    big30_9_mul_mod(&tmp, &br, g);
    big30_9_add_mod(&gp, &gp, &tmp);

    *f = fp;  
    *g = gp;
}


uint256_t cpt_inv(uint256_t *x){

    // Python: F = P
    big30_9 F = P;

    // Python: G = x
    big30_9 G;
    uint256_to_big30_9(&G, x);


    // print check:
    printf("g: ");
    for (size_t i = 0; i < 9; i++) {
        printf("%u ", G.limb[i]);  
    }
    printf("\nx: ");
    for (size_t i = 0; i < 4; i++) {
        printf("%llu ", (unsigned long long) x->limb64[i]); // x->limb64[i]是uint64_t
    }
    printf("\n");

    // Python: delta = 1
    int64_t delta = 1;
    
    // Python: V = 0
    big30_9 V = {0};
    
    // Python: S = 1
    big30_9 S = {1,0,0,0,0,0,0,0,0};

    // Python: fuv = 0
    int64_t fuv;
    // Python: grs = 0
    int64_t grs;

    // Python: f = 0 
    int64_t f;

    // Python: g = 0 
    int64_t g;

    // Python: uu, vv, rr, ss = 0, 0, 0, 0
    int64_t uu, vv, rr, ss;

    // Python: u, v, r, s = 0, 0, 0, 0 
    int64_t u, v, r, s;

    // Python: g0_and_1 = 0 
    int64_t g0_and_1;

    // Python: cond = 0 
    int64_t cond;

    // Python: fuv_new = 0
    int64_t fuv_new;

    // Python: grs_new = 0
    int64_t grs_new;

    // Python: for i in range(10):
    for (size_t i = 0; i < 10; i++){
        
        // Python: F % (2 ** 60)
        f = F.limb[0] + (F.limb[1] << 30);

        // Python: G % (2 ** 60)
        g = G.limb[0] + (G.limb[1] << 30);

        // Python: uu = 1
        uu = 1;

        // Python: vv = 0
        vv = 0;

        // Python: rr = 0
        rr = 0;

        // Python: ss = 1
        ss = 1;

        // Python: for j in range(3):
        for (size_t j = 0; j < 3; j++){

            // Python: fuv = (f % 2**20) - (1 << 41)
            fuv = (f & 0xFFFFF) - ((int64_t)1<<41);

            // Python: grs = (g % 2**20) - (1 << 62)
            grs = (g & 0xFFFFF) - ((int64_t)1<<62);


            // Python: for k in range(20):
            for (size_t k = 0; k < 20; k++){
                g0_and_1 = grs & (int64_t)1;
                cond = (delta > 0) & (g0_and_1 == 1);

                fuv_new = (1-cond) * fuv +     cond * grs;
                grs_new = ( -cond) * fuv + (1-cond) * grs;

                fuv = fuv_new;
                grs = grs_new;

                if (cond) {delta = -delta;}

                grs = (g0_and_1 * fuv + grs) >> 1;

                delta = delta + 2;


                u = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
                u = u >> 42;

                v = (fuv + ((int64_t)1 << 20));
                v = (uint64_t) v << 22;
                v = v >> 43;

                r = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
                r = r >> 42;
            
                s = (grs + ((int64_t)1 << 20));
                s = (uint64_t) s << 22;
                s = s >> 43;

            }




        }


        // inline update [F,V; G,S]
        update_FVGS(&F, &V, &G, &S, u, v, r, s);

        


        // inline update f,g
        update_fg(&f, &g, u, v, s, r);

        
    }


    // take V 
    // take result = (V * f (f is 1 or -1 ) * inv600) % P
    // return result
    uint256_t V_return;
    big30_9 Vf;
    big30_9 Vfinv600;
    big30_9_mul_mod(&Vf, &V, &f);
    big30_9_mul_mod(&Vfinv600, &Vf, &inv600);
    
    big30_9_to_uint256(&V_return, &Vfinv600);
    return V_return;


}




int main(void){
    
    uint256_t x = {
    .limb64 = {
        0x901bd64816c6bbacULL,
        0x0e2c73ab14dae5f1ULL,
        0xf6f53a29e0cbfbd9ULL,
        0x610c31f6f6c56c83ULL
    }
};
    uint256_t v = cpt_inv(&x);
    for (size_t i = 0; i < 4; i++) {
        printf("%llu ", (unsigned long long) v.limb64[i]); // x->limb64[i]是uint64_t
    }
    
    // Check the answer
    big30_9 vbig;
    big30_9 xbig;
    uint256_to_big30_9(&vbig, &v);
    uint256_to_big30_9(&xbig, &x);
    big30_9 tmp;
    big30_9_mul_mod(&tmp, &vbig, &xbig);
    for (size_t i = 0; i < 9; i++) {
        printf("%u ", tmp.limb[i]);  // 注意這裡改用 "%u" ！
    }


}
