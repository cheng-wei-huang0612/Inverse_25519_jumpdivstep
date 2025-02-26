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
    big30_9 f = P;
    big30_9 g;
    uint256_to_big30_9(&g, x);
    printf("g: ");
    for (size_t i = 0; i < 9; i++) {
        printf("%u ", g.limb[i]);  // 注意這裡改用 "%u" ！
    }
    printf("\nx: ");
    for (size_t i = 0; i < 4; i++) {
        printf("%llu ", (unsigned long long) x->limb64[i]); // x->limb64[i]是uint64_t
    }
    printf("\n");

    int32_t delta = 1;
    
    // initialize tha master matrix
    // [[ F, V ]  
    //  [ G, S ]] 
    big30_9 F = {1,0,0,0,0,0,0,0,0};
    big30_9 V = {0};
    big30_9 G = {0};
    big30_9 S = {1,0,0,0,0,0,0,0,0};


    int32_t f0;
    int32_t g0;
    int32_t u;
    int32_t v;
    int32_t r;
    int32_t s;

    int64_t fuv;
    int64_t grs;

    for (size_t i = 0; i < 30; i++)
    {
        printf("Jump %zu", i);
        // f0 = f[0:20]
        f0 = f.limb[0] & 0xFFFFF; // 20 bits mask

        // g0 = g[0:20]
        g0 = g.limb[0] & 0xFFFFF; // 20 bits mask
        
        // u = - 2 ** 20
        u = - 1048576;

        v = 0;

        r = 0;

        s = - 1048576;

        fuv = ((int64_t) u << 42) + ((int64_t) v << 21) + (int64_t) f0;
        grs = ((int64_t) r << 42) + ((int64_t) s << 21) + (int64_t) g0;


        int64_t extracted_u = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
        extracted_u = extracted_u >> 42;
        
        int64_t extracted_v = (fuv + ((int64_t)1 << 20));
        extracted_v = (uint64_t) extracted_v << 22;
        extracted_v = extracted_v >> 43;


        int64_t extracted_r = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
        extracted_r = extracted_r >> 42;
        
        int64_t extracted_s = (grs + ((int64_t)1 << 20));
        extracted_s = (uint64_t) extracted_s << 22;
        extracted_s = extracted_s >> 43;


        


        for (size_t j = 0; j < 20; j++)
        {

            // Conditional swap
            int64_t g0_and_1 = grs & 1;
            int64_t cond = (delta > 0) & (g0_and_1 == 1);
            if (cond)
            {
                int64_t temp_fuv = fuv;
                fuv = grs;
                grs = -temp_fuv;

                int64_t temp_f0 = f0;
                f0 = g0;
                g0 = -temp_f0;

                int64_t temp_u = u;
                u = r;
                r = -temp_u;

                int64_t temp_v = v;
                v = s;
                s = -temp_v;

                delta = - delta;
            }

            // Elimination
            grs = ((g0_and_1 * fuv + 1 * grs)) >> 1;
            r = (g0_and_1 * u + 1 * r) >> 1;
            s = (g0_and_1 * v + 1 * s) >> 1;
            g0 = (g0_and_1 * f0 + 1 * g0) >> 1;
            delta += 2;

            extracted_u = (fuv + ((int64_t)1 << 20) + ((int64_t)1 << 41));
            extracted_u = extracted_u >> 42;
            
            extracted_v = (fuv + ((int64_t)1 << 20));
            extracted_v = (uint64_t) extracted_v << 22;
            extracted_v = extracted_v >> 43;


            extracted_r = (grs + ((int64_t)1 << 20) + ((int64_t)1 << 41));
            extracted_r = extracted_r >> 42;
            
            extracted_s = (grs + ((int64_t)1 << 20));
            extracted_s = (uint64_t) extracted_s << 22;
            extracted_s = extracted_s >> 43;



        }
        printf("\n--- Extracted from fuv ---\n");
        compare_print("u", extracted_u, u);
        compare_print("v", extracted_v, v);

        printf("\n--- Extracted from grs ---\n");
        compare_print("r", extracted_r, r);
        compare_print("s", extracted_s, s);

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
