// test_mybig30.c
#include <stdio.h>
#include "mybig30.h"   // 包含 P, inv600, uint256_to_big30_9, 以及 big30_9_to_mpz 等宣告

#ifdef USE_GMP
#include <gmp.h>
#endif

/***********************************************************************
 *  1. 測試 P == 2^255 - 19
 **********************************************************************/
static int test_P(void)
{
#ifdef USE_GMP
    mpz_t p_gmp, expect;
    mpz_init(p_gmp);
    mpz_init(expect);

    big30_9_to_mpz(p_gmp, &P);

    mpz_ui_pow_ui(expect, 2UL, 255UL);
    mpz_sub_ui(expect, expect, 19UL);

    int ok = (mpz_cmp(p_gmp, expect) == 0);

    mpz_clear(p_gmp);
    mpz_clear(expect);
    return ok;
#else
    printf("Skipping P test because USE_GMP is not defined.\n");
    return 1;
#endif
}

/***********************************************************************
 *  2. 測試 (inv600 * 2^600) mod P == 1
 **********************************************************************/
static int test_inv600(void)
{
#ifdef USE_GMP
    mpz_t p_gmp, inv600_gmp, tmp, two600;
    mpz_inits(p_gmp, inv600_gmp, tmp, two600, NULL);

    big30_9_to_mpz(p_gmp, &P);
    big30_9_to_mpz(inv600_gmp, &inv600);

    mpz_ui_pow_ui(two600, 2UL, 600UL); // two600 = 2^600
    mpz_mul(tmp, inv600_gmp, two600);
    mpz_mod(tmp, tmp, p_gmp);

    int ok = (mpz_cmp_ui(tmp, 1UL) == 0);

    mpz_clears(p_gmp, inv600_gmp, tmp, two600, NULL);
    return ok;
#else
    printf("Skipping inv600 test because USE_GMP is not defined.\n");
    return 1;
#endif
}

/***********************************************************************
 *  3. 測試 uint256_t <--> big30_9 轉換
 **********************************************************************/


/*
 *  做完整測試：  
 *     - 準備一些測試向量 (uint256_t)
 *     - 先轉成 big30_9
 *     - 再轉回 uint256_t
 *     - 比對前後是否相同
 *     - 若定義 USE_GMP, 再以 mpz_t 輔助比對
 */
static int test_uint256_to_big30_9_roundtrip(void)
{
    int overall_ok = 1;

    // 一些測試向量
    const uint256_t testVectors[] = {
        // 1) 全為 0
        { .limb64 = {0ULL, 0ULL, 0ULL, 0ULL} },
        // 2) 只在最低 64 bits
        { .limb64 = {0x123456789ABCDEF0ULL, 0ULL, 0ULL, 0ULL} },
        // 3) 只在最高 64 bits
        { .limb64 = {0ULL, 0ULL, 0ULL, 0xFFFFFFFFFFFFFFFFULL} },
        // 4) 雜湊
        { .limb64 = {0xFFFFFFFFFFFFFFFFULL, 0x0000000000000001ULL,
                     0xABCDEF1234567890ULL, 0x0123456789ABCDEFULL} },
    };
    const int numVectors = sizeof(testVectors)/sizeof(testVectors[0]);

#ifdef USE_GMP
    mpz_t mp_in, mp_out;
    mpz_init(mp_in);
    mpz_init(mp_out);
#endif

    for (int i = 0; i < numVectors; i++) {
        const uint256_t *orig = &testVectors[i];

        // 1) 轉成 big30_9
        big30_9 b30;
        uint256_to_big30_9(&b30, orig);

        // 2) 再轉回 uint256_t
        uint256_t back;
        big30_9_to_uint256(&back, &b30);

        // 3) 比對 back 與 orig
        int same = 1;
        for (int k = 0; k < 4; k++) {
            if (back.limb64[k] != orig->limb64[k]) {
                same = 0;
                break;
            }
        }

#ifdef USE_GMP
        // 也可進一步把 b30 -> mpz_t 做比對
        {
            // mp_in <- orig
            mpz_set_ui(mp_in, 0UL);
            for (int limb_i = 3; limb_i >= 0; limb_i--) {
                mpz_mul_2exp(mp_in, mp_in, 64);
                mpz_add_ui(mp_in, mp_in, orig->limb64[limb_i]);
            }

            big30_9_to_mpz(mp_out, &b30);
            if (mpz_cmp(mp_in, mp_out) != 0) {
                same = 0;
            }
        }
#endif

        if (!same) {
            overall_ok = 0;
            printf("[FAIL] testVectors[%d] roundtrip mismatch.\n", i);
#ifdef USE_GMP
            gmp_printf("  mp_in  = %Zd\n", mp_in);
            gmp_printf("  mp_out = %Zd\n", mp_out);
#endif
        }
        else {
            printf("[ OK ] testVectors[%d] roundtrip.\n", i);
        }
    }

#ifdef USE_GMP
    mpz_clear(mp_in);
    mpz_clear(mp_out);
#endif

    return overall_ok;
}

/***********************************************************************
 *  x2. 測試 big30_9_add_mod: 大測資 (硬編碼, 皆 < P)
 *     - 與 GMP 結果做比對 (若定義 USE_GMP)
 **********************************************************************/
static int test_add_mod_bigvectors(void)
{
#ifndef USE_GMP
    printf("Skipping add_mod BIG test because USE_GMP is not defined.\n");
    return 1;
#else
    /*
       這裡定義幾組 A[i], B[i]，皆以 256-bit 形式表示，但實際數值 < 2^255 - 19。
       你可以自行再增加更多案例。
    */

    // A 陣列: 4 組 uint256_t
    const uint256_t bigA[] = {
        // A[0] = P - 1 = (2^255 - 19) - 1 = 2^255 - 20
        {
            // = (2^255 - 1) - 19 => 再 -1 => -20
            // 2^255 -1 在 limb64[3]=0x7fffffffffffffff, 其餘=0xffffffffffffffff
            // 減 19 後, 再減 1 => 最低64位減 20
            .limb64 = {
                0xffffffffffffffecULL,  // = 0xffffffffffffffff - 0x13 (19) -1 => -0x14 => 0xec
                0xffffffffffffffffULL,
                0xffffffffffffffffULL,
                0x7fffffffffffffffULL
            }
        },
        // A[1] = 2^250
        // bit #250 (0-based) => 在 limb64[3] 的第 (250 - 192)=58 位
        {
            .limb64 = {
                0x0000000000000000ULL, 
                0x0000000000000000ULL,
                0x0000000000000000ULL,
                1ULL << 58  // 2^58
            }
        },
        // A[2] = 2^240 + 2^100
        // bit #240 => (240 - 192)=48 => limb64[3] = 1<<48
        // bit #100 => (100 - 64)=36 => limb64[1] = 1<<36
        {
            .limb64 = {
                0x0000000000000000ULL,     // limb64[0]
                (1ULL << 36),             // limb64[1], set bit 36
                0x0000000000000000ULL,     
                (1ULL << 48)              // limb64[3], set bit 48
            }
        },
        // A[3] = 2^200
        // bit #200 => (200 - 192)=8 => limb64[3] = 1<<8
        // 注意 2^200 明顯 < 2^255
        {
            .limb64 = {
                0x0000000000000000ULL,
                0x0000000000000000ULL,
                0x0000000000000000ULL,
                (1ULL << 8)
            }
        },
    };

    // B 陣列: 4 組 uint256_t
    const uint256_t bigB[] = {
        // B[0] = 2^128 + 2^127
        // bit #128 => limb64[2] = 1<<(128-128=0)? 其實 128 位在 limb64[2] 的第 (128-128=0) => 1<<0
        // bit #127 => limb64[1] 的第 (127-64=63)? 1<<63
        // 小心對齊
        {
            .limb64 = {
                0x0000000000000000ULL,  // limb64[0]
                (1ULL << 63),          // bit #127 => 63 in limb64[1]
                1ULL,                  // bit #128 => 0 in limb64[2]? 
                                       // 其實得再想一下: 
                                       // 128 ~ 191 bits => limb64[2].
                                       // bit #128 => index=128-128=0 => 1<<0 => 1
                0x0000000000000000ULL
            }
        },
        // B[1] = P - 5 = 2^255 - 24
        {
            .limb64 = {
                0xffffffffffffffe8ULL,  // = -0x18
                0xffffffffffffffffULL,
                0xffffffffffffffffULL,
                0x7fffffffffffffffULL
            }
        },
        // B[2] = 2^200 + 2^110
        // bit #200 => limb64[3] (200-192=8) => 1<<8
        // bit #110 => limb64[1] (110-64=46) => 1<<46
        {
            .limb64 = {
                0x0000000000000000ULL,  // limb64[0]
                (1ULL << 46),          // bit #110
                0x0000000000000000ULL,
                (1ULL << 8)           // bit #200
            }
        },
        // B[3] = 2^254 - 100
        // bit #254 => limb64[3] (254-192=62) => 1<<62
        // 再 -100 => 會影響最低64位
        {
            .limb64 = {
                0xffffffffffffff9cULL, 
                0xffffffffffffffffULL, 
                0xffffffffffffffffULL,
                (1ULL << 62) - 1ULL    // 1ULL<<62 => bit #62 => shift by 62?
                                       // 其實(1ULL<<62)-1 => bits [0..61]=1
            }
        }
    };

    const int nCase = sizeof(bigA)/sizeof(bigA[0]);
    // 需保證 bigA 與 bigB 數量相同 (同為4)

    mpz_t mpP;
    mpz_init(mpP);
    big30_9_to_mpz(mpP, &P);

    // GMP 中間變數
    mpz_t mpA, mpB, mpSum, mpSumCmp;
    mpz_inits(mpA, mpB, mpSum, mpSumCmp, NULL);

    int all_ok = 1;

    for (int i = 0; i < nCase; i++) {
        // 1) 把 A[i], B[i] 轉成 big30_9
        big30_9 a_b30, b_b30;
        uint256_to_big30_9(&a_b30, &bigA[i]);
        uint256_to_big30_9(&b_b30, &bigB[i]);

        // 2) 做 add_mod
        big30_9 addRes;
        big30_9_add_mod(&addRes, &a_b30, &b_b30);

        // 3) 轉成 GMP 做比對:
        //    mpA = a_b30, mpB = b_b30
        big30_9_to_mpz(mpA, &a_b30);
        mpz_mod(mpA, mpA, mpP);

        big30_9_to_mpz(mpB, &b_b30);
        mpz_mod(mpB, mpB, mpP);

        mpz_add(mpSum, mpA, mpB);
        mpz_mod(mpSum, mpSum, mpP);

        // 4) addRes -> mpSumCmp
        big30_9_to_mpz(mpSumCmp, &addRes);

        // 5) 比較
        if (mpz_cmp(mpSum, mpSumCmp) != 0) {
            all_ok = 0;
            printf("[FAIL] add_mod BIG test case %d:\n", i);
            gmp_printf("   mpA      = %Zd\n", mpA);
            gmp_printf("   mpB      = %Zd\n", mpB);
            gmp_printf("   Expected = %Zd\n", mpSum);
            gmp_printf("   Got      = %Zd\n", mpSumCmp);
        } else {
            printf("[ OK ] add_mod BIG: case %d => match.\n", i);
        }
    }

    mpz_clears(mpA, mpB, mpSum, mpSumCmp, mpP, NULL);
    return all_ok;
#endif
}




// /***********************************************************************
//  *  y2. 測試 big30_9_sub_mod: 大測資 (硬編碼, 皆 < P)
//  *     - 與 GMP 結果做比對 (若定義 USE_GMP)
//  **********************************************************************/
// static int test_sub_mod_bigvectors(void)
// {
// #ifndef USE_GMP
//     printf("Skipping sub_mod BIG test because USE_GMP is not defined.\n");
//     return 1;
// #else
//     /*
//        在這裡定義幾組 uint256_t 組合 A[i], B[i]，確保它們都 < P。
//        舉例先放 4 組示範，你可依需求再加更多。
//     */

//     // A 陣列: 4 組 uint256_t (皆 < 2^255-19)
//     const uint256_t bigA[] = {
//         // A[0] = P - 1 = (2^255 - 19) - 1 => 2^255 - 20
//         {
//             .limb64 = {
//                 0xffffffffffffffecULL,  // 0xffffffffffffffff - 0x13 => -19 => 0xec
//                 0xffffffffffffffffULL,
//                 0xffffffffffffffffULL,
//                 0x7fffffffffffffffULL
//             }
//         },
//         // A[1] = 2^250
//         {
//             .limb64 = {
//                 0ULL, 
//                 0ULL,
//                 0ULL,
//                 (1ULL << 58) // bit #58 => 2^58 (總長 250 bits)
//             }
//         },
//         // A[2] = 2^200
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 0ULL,
//                 (1ULL << 8) // bit #200 => (200-192)=8
//             }
//         },
//         // A[3] = 2^150 + 2^100 (兩個 bits)
//         {
//             .limb64 = {
//                 0ULL,                    // limb64[0]
//                 (1ULL << 36),            // 2^100 => bit#(100-64)=36
//                 (1ULL << 22),            // 2^150 => bit#(150-128)=22 in limb64[2]
//                 0ULL
//             }
//         },
//     };

//     // B 陣列: 4 組 uint256_t (皆 < P)
//     const uint256_t bigB[] = {
//         // B[0] = 2^128
//         // bit #128 => limb64[2] 的第 (128-128)=0 => 1<<0 => 1
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 1ULL,
//                 0ULL
//             }
//         },
//         // B[1] = (2^255 - 19) - 5 => 2^255 - 24
//         {
//             .limb64 = {
//                 0xffffffffffffffe8ULL, // -0x18
//                 0xffffffffffffffffULL,
//                 0xffffffffffffffffULL,
//                 0x7fffffffffffffffULL
//             }
//         },
//         // B[2] = 2^199
//         // bit #199 => (199-192)=7 => 1<<7
//         {
//             .limb64 = {
//                 0ULL, 
//                 0ULL,
//                 0ULL,
//                 (1ULL << 7)
//             }
//         },
//         // B[3] = 2^150
//         // bit #150 => (150-128)=22 => (1ULL<<22) in limb64[2]
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 (1ULL << 22),
//                 0ULL
//             }
//         },
//     };

//     const int nCase = sizeof(bigA)/sizeof(bigA[0]);
//     // bigA 與 bigB 數量相同 (4)

//     // 初始化 GMP 版 P
//     mpz_t mpP;
//     mpz_init(mpP);
//     big30_9_to_mpz(mpP, &P);

//     // GMP 中間變數
//     mpz_t mpA, mpB, mpDiff, mpDiffCmp;
//     mpz_inits(mpA, mpB, mpDiff, mpDiffCmp, NULL);

//     int all_ok = 1;

//     for (int i = 0; i < nCase; i++) {
//         // 1) 把 bigA[i], bigB[i] 轉成 big30_9
//         big30_9 a_b30, b_b30;
//         uint256_to_big30_9(&a_b30, &bigA[i]);
//         uint256_to_big30_9(&b_b30, &bigB[i]);

//         // 2) 做 sub_mod
//         big30_9 subRes;
//         big30_9_sub_mod(&subRes, &a_b30, &b_b30);

//         // 3) 用 GMP 算 (A - B) mod P
//         big30_9_to_mpz(mpA, &a_b30);
//         mpz_mod(mpA, mpA, mpP);

//         big30_9_to_mpz(mpB, &b_b30);
//         mpz_mod(mpB, mpB, mpP);

//         mpz_sub(mpDiff, mpA, mpB);
//         mpz_mod(mpDiff, mpDiff, mpP); // 確保結果在 [0, P-1]

//         // 4) subRes -> mpDiffCmp
//         big30_9_to_mpz(mpDiffCmp, &subRes);

//         // 5) 比較
//         if (mpz_cmp(mpDiff, mpDiffCmp) != 0) {
//             all_ok = 0;
//             printf("[FAIL] sub_mod BIG test case %d:\n", i);
//             gmp_printf("   mpA       = %Zd\n", mpA);
//             gmp_printf("   mpB       = %Zd\n", mpB);
//             gmp_printf("   Expected  = %Zd\n", mpDiff);
//             gmp_printf("   Got       = %Zd\n", mpDiffCmp);
//         } else {
//             printf("[ OK ] sub_mod BIG: case %d => match.\n", i);
//         }
//     }

//     mpz_clears(mpA, mpB, mpDiff, mpDiffCmp, mpP, NULL);


//     return all_ok;
// #endif
// }

// /***********************************************************************
//  *  z. 測試 big30_9_mul_mod: 大測資 (硬編碼, 皆 < P)
//  *     - 與 GMP 結果做比對 (若定義 USE_GMP)
//  **********************************************************************/
// static int test_mul_mod_bigvectors(void)
// {
// #ifndef USE_GMP
//     printf("Skipping mul_mod BIG test because USE_GMP is not defined.\n");
//     return 1;
// #else
//     /*
//        這裡定義一些 uint256_t 組合 A[i], B[i]，且保證都 < P=2^255-19。
//        重點在於：若要表示 2^130 或 2^150 等超過 64 bits 的數，
//        不能直接用 (1ULL << 66)、(1ULL << 86) 等超過 63 的位移，
//        而要按照 bit #n → limb64[n/64], (1ULL << (n % 64))。
//     */


//     const uint256_t bigA[] = {
//         // A[0] = 2^254 (bit #254 => limb64[3], offset=62)
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 0ULL,
//                 (1ULL << 62)  // bit #254 => 62 in limb64[3]
//             }
//         },
//         // A[1] = (2^255 - 19) - 1 => 2^255 - 20 (不變)
//         {
//             .limb64 = {
//                 0xffffffffffffffecULL,  // -20
//                 0xffffffffffffffffULL,
//                 0xffffffffffffffffULL,
//                 0x7fffffffffffffffULL
//             }
//         },
//         // A[2] = 2^200 + 2^199 (bit #200 => limb64[3] offset=8, bit #199 => offset=7)
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 0ULL,
//                 ((1ULL << 8) | (1ULL << 7)) // bits #200, #199
//             }
//         },
//         // A[3] = 2^150 + 2^130
//         //    bit #150 => index=2, offset=22 => (1ULL << 22)
//         //    bit #130 => index=2, offset=2  => (1ULL << 2)
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,                      // limb64[1] = 0
//                 ((1ULL << 22) | (1ULL << 2)), // limb64[2]
//                 0ULL
//             }
//         },
//     };

//     const uint256_t bigB[] = {
//         // B[0] = 2^1 + 2^0 = 3 (沒變)
//         {
//             .limb64 = { 3ULL, 0ULL, 0ULL, 0ULL }
//         },
//         // B[1] = 2^130
//         //    bit #130 => index=2, offset=2 => (1ULL << 2)
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 (1ULL << 2), // limb64[2]
//                 0ULL
//             }
//         },
//         // B[2] = (2^255 - 19) - 5 => 2^255 - 24 (不變)
//         {
//             .limb64 = {
//                 0xffffffffffffffe8ULL, // -0x18
//                 0xffffffffffffffffULL,
//                 0xffffffffffffffffULL,
//                 0x7fffffffffffffffULL
//             }
//         },
//         // B[3] = 2^190
//         // bit #190 => index=2, offset= (190-128)=62 => (1ULL << 62) in limb64[2]
//         {
//             .limb64 = {
//                 0ULL,
//                 0ULL,
//                 (1ULL << 62),
//                 0ULL
//             }
//         },
//     };

//     const int nCase = sizeof(bigA)/sizeof(bigA[0]); 
//     // bigA, bigB 數量相同 (4)

//     mpz_t mpP;
//     mpz_init(mpP);
//     big30_9_to_mpz(mpP, &P);

//     // GMP 變數
//     mpz_t mpA, mpB, mpProd, mpProdCmp;
//     mpz_inits(mpA, mpB, mpProd, mpProdCmp, NULL);

//     int all_ok = 1;


//     for (int i = 0; i < nCase; i++) {
//         // 1) 把 bigA[i], bigB[i] 轉成 big30_9
//         big30_9 a_b30, b_b30;
//         uint256_to_big30_9(&a_b30, &bigA[i]);
//         uint256_to_big30_9(&b_b30, &bigB[i]);

//         // 2) 進行 mul_mod
//         big30_9 mulRes;
//         big30_9_mul_mod(&mulRes, &a_b30, &b_b30);

//         // 3) 用 GMP 算 (A * B) mod P
//         big30_9_to_mpz(mpA, &a_b30);
//         mpz_mod(mpA, mpA, mpP);

//         big30_9_to_mpz(mpB, &b_b30);
//         mpz_mod(mpB, mpB, mpP);

//         mpz_mul(mpProd, mpA, mpB);
//         mpz_mod(mpProd, mpProd, mpP);

//         // 4) mulRes -> mpProdCmp
//         big30_9_to_mpz(mpProdCmp, &mulRes);

//         // 5) 比較
//         if (mpz_cmp(mpProd, mpProdCmp) != 0) {
//             all_ok = 0;
//             printf("[FAIL] mul_mod BIG test case %d:\n", i);
//             gmp_printf("   mpA      = %Zd\n", mpA);
//             gmp_printf("   mpB      = %Zd\n", mpB);
//             gmp_printf("   Expected = %Zd\n", mpProd);
//             gmp_printf("   Got      = %Zd\n", mpProdCmp);
//         } else {
//             printf("[ OK ] mul_mod BIG: case %d => match.\n", i);
//         }
//     }

//     mpz_clears(mpA, mpB, mpProd, mpProdCmp, mpP, NULL);
//     return all_ok;
// #endif
// }




/***********************************************************************
 *  主程式：把上面幾個測試通通跑一次
 **********************************************************************/
int main(void)
{
    // (1) 測試 P
    int okP = test_P();
    if (!okP) {
        printf("[FAIL] P != 2^255 - 19\n");
    } else {
        printf("[ OK ] P == 2^255 - 19\n");
    }

    // (2) 測試 inv600
    int okInv = test_inv600();
    if (!okInv) {
        printf("[FAIL] inv600 * 2^600 mod P != 1\n");
    } else {
        printf("[ OK ] (inv600 * 2^600) mod P == 1\n");
    }

    // (3) 測試 uint256 <-> big30_9
    int okConversion = test_uint256_to_big30_9_roundtrip();
    if (!okConversion) {
        printf("[FAIL] uint256_to_big30_9 roundtrip\n");
    } else {
        printf("[ OK ] uint256_to_big30_9 roundtrip\n");
    }

    // (4) 測試 add_mod
    int okAdd = test_add_mod_bigvectors();
    if (!okAdd) {
        printf("[FAIL] big30_9_add_mod() test.\n");
    } else {
        printf("[ OK ] big30_9_add_mod() test.\n");
    }

    // // (5) 測試 sub_mod
    // int okSub = test_sub_mod_bigvectors();
    // if (!okSub) {
    //     printf("[FAIL] big30_9_sub_mod() BIG test.\n");
    // } else {
    //     printf("[ OK ] big30_9_sub_mod() BIG test.\n");
    // }

    // // (6) 測試 mul_mod with BIG vectors
    // int okMul = test_mul_mod_bigvectors();
    // if (!okMul) {
    //     printf("[FAIL] big30_9_mul_mod() BIG test.\n");
    // } else {
    //     printf("[ OK ] big30_9_mul_mod() BIG test.\n");
    // }


    // 統一回傳
    return (okP && okInv && okConversion && okAdd) ? 0 : 1;
}
