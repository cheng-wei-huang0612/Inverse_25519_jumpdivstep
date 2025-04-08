#include "big30.h"
#include <stdio.h>
#include <gmp.h>

extern void double_mont(
    big30_t *resultV, big30_t *resultS,
    const big30_t *V,
    const int64_t *u, const int64_t *r
);

extern void gmp_double_mont(big30_t *resultV, big30_t *resultS,
    const big30_t *V,
    const int64_t *u, const int64_t *r);


//----------------------------------------------------------------------------
// 主程式：一次測試 u*V*R^{-1} mod P / r*V*R^{-1} mod P
//----------------------------------------------------------------------------

int main()
{
    printf("=== test_NEON.c: NEON Double Multiply 測試 ===\n\n");

    // 1) 轉 P 為 mpz 印出來看看
    mpz_t mpP, mp2P;
    mpz_inits(mpP, mp2P, NULL);

    mpz_from_big30(mpP, &P);
    // gmp_printf("P = %Zd\n\n", mpP);

    mpz_mul_2exp(mp2P, mpP, 1);  // 2P, 用來檢查代表元

    // 2) 指定測資
    //    V, u, r (這裡給個簡單的數字，實際可自由換)
    mpz_t mpV, mpu, mpr;
    mpz_inits(mpV, mpu, mpr, NULL);

    // mpV = 123456...
    mpz_set_str(mpV, "1990722789690322711207917334797004654545030125479463068579830179208085763260", 10);  
    // u = 100
    mpz_set_str(mpu, "-10902621393230986", 10);
    // r = 9999
    mpz_set_str(mpr, "1090262139323098679", 10);

    // 3) 轉 big30 / int64
    big30_t V_big30;
    big30_from_mpz(&V_big30, mpV);

    int64_t u_64, r_64;
    int64_from_mpz(&u_64, mpu);
    int64_from_mpz(&r_64, mpr);

    // 印出確認
    gmp_printf("V = %Zd\n", mpV);
    gmp_printf("u = %Zd\n", mpu);
    gmp_printf("r = %Zd\n\n", mpr);

    // 4) 呼叫 NEON 版本的蒙哥馬利運算 (此函式需你自行實作)
    //    NEON 設計：一次做
    //      Ru = u*V*R^{-1} mod P
    //      Rr = r*V*R^{-1} mod P
    big30_t Ru_NEON, Rr_NEON;
    // 初始化防止殘值
    for(int i=0; i<9; i++) {
        Ru_NEON.limb[i] = 0;
        Rr_NEON.limb[i] = 0;
    }

    // 假設你已寫好這個函式
    double_mont(&Ru_NEON, &Rr_NEON, &V_big30, &u_64, &r_64);

    //--------------------------------------------------------------------------
    // 5) 先檢查 NEON 結果是否為 canonical representative (0 <= x < P)
    //    若你的 NEON 函式回傳的值是蒙哥馬利形式，
    //    一般會在比較之前再乘一次 2^60，然後 mod P。
    //--------------------------------------------------------------------------
    {
        mpz_t mpRu, mpRr;
        mpz_inits(mpRu, mpRr, NULL);

        // 轉到 GMP
        mpz_from_big30(mpRu, &Ru_NEON);
        mpz_from_big30(mpRr, &Rr_NEON);

        gmp_printf("NEON: Ru = %Zd\n", mpRu);
        gmp_printf("NEON: Rr = %Zd\n\n", mpRr);

        // 檢查是否 >= P
        if(mpz_cmp(mpRu, mpP) >= 0){
            printf("Ru_NEON ----> Non-canonical representative!\n");
            if(mpz_cmp(mpRu, mp2P) >= 0) {
                printf("Ru_NEON ----> Greater than 2*P\n");
            }
        }
        if(mpz_cmp(mpRr, mpP) >= 0){
            printf("Rr_NEON ----> Non-canonical representative!\n");
            if(mpz_cmp(mpRr, mp2P) >= 0) {
                printf("Rr_NEON ----> Greater than 2*P\n");
            }
        }

        // 如果你確定 Ru_NEON / Rr_NEON 的值本來就是蒙哥馬利域，
        // 就要乘上 2^60 再 mod P 跟參考比
        mpz_mul_2exp(mpRu, mpRu, 60);
        mpz_mod(mpRu, mpRu, mpP);

        mpz_mul_2exp(mpRr, mpRr, 60);
        mpz_mod(mpRr, mpRr, mpP);

        gmp_printf("NEON: Ru (final) = %Zd\n", mpRu);
        gmp_printf("NEON: Rr (final) = %Zd\n\n", mpRr);

        mpz_clears(mpRu, mpRr, NULL);
    }

    //--------------------------------------------------------------------------
    // 6) 用 GMP 參考版本分別算
    //    (示範寫一個函式 gmp_modPmul_double() 做類似工作)
    //--------------------------------------------------------------------------
    big30_t Ru_ref, Rr_ref;
    gmp_double_mont(&Ru_ref, &Rr_ref, &V_big30, &u_64, &r_64);

    // 參考結果要再乘 2^60 (若要對比蒙哥馬利域)
    {
        mpz_t mpRu, mpRr;
        mpz_inits(mpRu, mpRr, NULL);

        mpz_from_big30(mpRu, &Ru_ref);
        mpz_from_big30(mpRr, &Rr_ref);

        mpz_mul_2exp(mpRu, mpRu, 60);
        mpz_mod(mpRu, mpRu, mpP);

        mpz_mul_2exp(mpRr, mpRr, 60);
        mpz_mod(mpRr, mpRr, mpP);

        // 再轉回 big30
        big30_t Ru_ref_mont, Rr_ref_mont;
        big30_from_mpz(&Ru_ref_mont, mpRu);
        big30_from_mpz(&Rr_ref_mont, mpRr);

        //--------------------------------------------------------------------------
        // 7) 比較 NEON 與參考結果
        //--------------------------------------------------------------------------
        {
            // 把 NEON 的也轉 GMP 來比較
            mpz_t mpRuN, mpRrN;
            mpz_inits(mpRuN, mpRrN, NULL);

            // 由於前面 NEON 結果還沒重新讀取到 big30_t(已乘2^60之後)，
            // 這裡可再轉一次 (或你可以直接保存在 big30_t 都可以)
            // ------------------------------------------------------------
            // 注意：這裡純粹示範流程，實際可依你需求簡化
            mpz_from_big30(mpRuN, &Ru_NEON);
            mpz_from_big30(mpRrN, &Rr_NEON);

            // 先乘 2^60
            mpz_mul_2exp(mpRuN, mpRuN, 60);
            mpz_mul_2exp(mpRrN, mpRrN, 60);

            // mod P
            mpz_mod(mpRuN, mpRuN, mpP);
            mpz_mod(mpRrN, mpRrN, mpP);

            // 比對
            int cmp_u = mpz_cmp(mpRuN, mpRu);
            int cmp_r = mpz_cmp(mpRrN, mpRr);

            if( cmp_u == 0 && cmp_r == 0 ) {
                printf("結果一致！ (Ru, Rr 都相同)\n");
            } else {
                printf("結果不一致！\n");
                if(cmp_u != 0) {
                    gmp_printf("  NEON vs Ref (Ru): %Zd vs %Zd\n", mpRuN, mpRu);
                }
                if(cmp_r != 0) {
                    gmp_printf("  NEON vs Ref (Rr): %Zd vs %Zd\n", mpRrN, mpRr);
                }
            }

            mpz_clears(mpRuN, mpRrN, NULL);
        }

        mpz_clears(mpRu, mpRr, NULL);
    }

    //--------------------------------------------------------------------------
    // 收尾
    //--------------------------------------------------------------------------
    mpz_clears(mpP, mp2P, mpV, mpu, mpr, NULL);
    return 0;
}
