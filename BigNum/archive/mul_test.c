#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "big60.h"

/*
  在此假設:
  - limb[0] 只用 30 bits
  - limb[1] 用 32 bits，其中最高 bit (bit 31) 為符號 (sign bit)
  => 整數總共有 62 bits: 31 bits + 30 bits + 1 bit (sign) = 62

  若 limb[1] >> 31 == 1，表示負數 => A_s = A_u - 2^62
  若 limb[1] >> 31 == 0，表示非負 => A_s = A_u
*/

/*
  將 A, B (視為 'signed' in mod 2^62) 做相乘, 存到 R (max 120 bits).
  套用:
    A_s = A_u - (signA * 2^62)
    B_s = B_u - (signB * 2^62)
    => A_sB_s = A_uB_u - 2^62( signA*B_u + signB*A_u ) + ( signA*signB * 2^124 )

  最後那項若你只存 120 bits，也會被截掉 (mod 2^120)。
*/
static void big120_mul_signed(const big60_t *A, const big60_t *B, big120_t *R)
{
    // 先清空 R
    for (int i = 0; i < 2 * LIMBS; i++) {
        R->limb[i] = 0;
    }

    // 取出 limb
    int32_t a0 = A->limb[0]; // 30 bits
    int32_t a1 = A->limb[1]; // 32 bits
    int32_t b0 = B->limb[0]; // 30 bits
    int32_t b1 = B->limb[1]; // 32 bits

    // 抓符號位: limb[1] >> 31
    int32_t signA = (a1 >> 31) & 1;  // 0 or 1
    int32_t signB = (b1 >> 31) & 1;  // 0 or 1

    // A_u = 下方 30 bits (limb0) + (上方 31 bits of limb1) << 30
    // 因為最高 bit of limb1 是 sign，所以先 mask 掉
    uint64_t A_u = ((uint64_t)(a1 & 0x7FFFFFFF) << 30) | (uint64_t)(a0 & 0x3FFFFFFF);
    uint64_t B_u = ((uint64_t)(b1 & 0x7FFFFFFF) << 30) | (uint64_t)(b0 & 0x3FFFFFFF);

    // (1) 做 unsigned multiply => A_u * B_u
    //    簡易 schoolbook multiply, 結果放到 (limb0..3)
    //    這跟你原本的 big120 程式邏輯類似，只要確定每 limb 是 30 bits carry
    uint64_t temp;
    uint64_t mask30 = ((uint64_t)1 << 30) - 1;

    uint64_t prod0 = 0, prod1 = 0, prod2 = 0, prod3 = 0;

    // a0, a1 這裡其實只是為了 schoolbook multiply
    // 先把 "unsigned" 30 bits from a0, 31 bits from a1 masked
    uint64_t a0u = (uint64_t)(a0 & 0x3FFFFFFF);
    uint64_t a1u = (uint64_t)(a1 & 0x7FFFFFFF);
    uint64_t b0u = (uint64_t)(b0 & 0x3FFFFFFF);
    uint64_t b1u = (uint64_t)(b1 & 0x7FFFFFFF);

    // step1: (a0 * b0)
    temp = a0u * b0u;
    prod0 += (temp & mask30);
    temp >>= 30;
    prod1 += temp;

    // step2: (a0 * b1)
    temp = a0u * b1u;
    prod1 += (temp & mask30);
    temp >>= 30;
    prod2 += temp;

    // step3: (a1 * b0)
    temp = a1u * b0u;
    prod1 += (temp & mask30);
    temp >>= 30;
    prod2 += temp;

    // step4: (a1 * b1)
    temp = a1u * b1u;
    prod2 += (temp & mask30);
    temp >>= 30;
    prod3 += temp;

    // carry chain
    prod1 += (prod0 >> 30); prod0 &= mask30;
    prod2 += (prod1 >> 30); prod1 &= mask30;
    prod3 += (prod2 >> 30); prod2 &= mask30;
    // prod3 可能還有 >30 bits, 超過就 mod 掉 => 只留 30 bits
    prod3 &= mask30;

    // 存到 R->limb
    R->limb[0] = (int32_t)prod0;
    R->limb[1] = (int32_t)prod1;
    R->limb[2] = (int32_t)prod2;
    R->limb[3] = (int32_t)prod3;

    // (2) 修正項 =>  - 2^62( signA * B_u + signB * A_u )
    //     shift 62 bits => 要分拆到對應 limb
    //     可能需要 128-bit 中介 (like __int128) 來安全放 (T << 62)
    __int128 T = 0;
    if (signA) T += B_u; 
    if (signB) T += A_u; 
    // => subVal = T << 62
    __int128 subVal = T << 62; 

    // 取出 subVal 的低 120 bits => (s0, s1, s2, s3) each 30 bits
    // 這跟 carry 類似
    int64_t s0, s1, s2, s3;
    {
        uint64_t m30 = (1ULL << 30) - 1;

        s0 = (int64_t)( (uint64_t)subVal & m30 );
        subVal >>= 30;
        s1 = (int64_t)( (uint64_t)subVal & m30 );
        subVal >>= 30;
        s2 = (int64_t)( (uint64_t)subVal & m30 );
        subVal >>= 30;
        s3 = (int64_t)( (uint64_t)subVal  );
        // 若還有高的 bits => mod 掉
    }

    // R - (s0..s3)
    // 需要 borrow chain
    int64_t r0 = R->limb[0] - s0;
    int64_t r1 = R->limb[1] - s1;
    int64_t r2 = R->limb[2] - s2;
    int64_t r3 = R->limb[3] - s3;

    // borrow
    if (r0 < 0) { r1 -= 1; r0 += ((int64_t)1 << 30); }
    if (r1 < 0) { r2 -= 1; r1 += ((int64_t)1 << 30); }
    if (r2 < 0) { r3 -= 1; r2 += ((int64_t)1 << 30); }
    // 若 r3 < 0 => 在 mod 2^120 意義下，再加 1<<30
    // 這裡僅示範一次
    if (r3 < 0) { r3 += ((int64_t)1 << 30); }

    // 存回
    R->limb[0] = (int32_t)(r0 & 0x3FFFFFFF);
    R->limb[1] = (int32_t)(r1 & 0x3FFFFFFF);
    R->limb[2] = (int32_t)(r2 & 0x3FFFFFFF);
    R->limb[3] = (int32_t)(r3 & 0x3FFFFFFF);

    // (3) 若需要 + (signA*signB * 2^124) => 已超過120 bits, 會直接被 mod 掉, 故不存
}

// 把 big120_t => mpz_t (低 limb[0], 高 limb[3]), each limb=30 bits
static void big120_to_mpz(const big120_t *X, mpz_t z)
{
    mpz_set_ui(z, 0);
    for (int i = 3; i >= 0; i--) {
        mpz_mul_2exp(z, z, 30);
        mpz_add_ui(z, z, (unsigned long)(X->limb[i] & 0x3FFFFFFF));
    }
}

int main(void)
{
    printf("=== test_mul: 62-bit signed multiply (sign bit in limb[1] highest bit) ===\n\n");

    mpz_t mpA, mpB, mpProd, mpCheck;
    mpz_init(mpA); mpz_init(mpB); 
    mpz_init(mpProd); mpz_init(mpCheck);

    // 固定值測試
    int64_t testvals[] = {
        // around ±2^61
        -((int64_t)1 << 61),
        -((int64_t)1 << 61) - 1,
        ((int64_t)1 << 61),
        ((int64_t)1 << 61) + 1,
        // zero, ±1
        0, 1, -1,
        // ±2^63
        INT64_MIN,
        INT64_MAX
    };
    size_t N = sizeof(testvals)/sizeof(testvals[0]);

    // 先測這些固定點
    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < N; j++) {
            int64_t a = testvals[i];
            int64_t b = testvals[j];

            big60_t bigA, bigB;
            big60_from_int64(a, &bigA);
            big60_from_int64(b, &bigB);

            big120_t bigR;
            big120_mul_signed(&bigA, &bigB, &bigR);

            mpz_set_si(mpA, a);
            mpz_set_si(mpB, b);
            mpz_mul(mpProd, mpA, mpB);

            big120_to_mpz(&bigR, mpCheck);

            gmp_printf("A=%lld, B=%lld => A*B=%Zd\n", (long long)a, (long long)b, mpProd);
            gmp_printf("   bigR (mod 2^120 ) = %Zd\n\n", mpCheck);
        }
    }

    // 隨機測試
    printf("=== random tests ===\n");
    srand((unsigned)time(NULL));
    for (int k = 0; k < 5; k++) {
        // 亂數 64-bit, 然後一半機率變負
        uint64_t rA = ((uint64_t)rand() << 32) ^ rand();
        uint64_t rB = ((uint64_t)rand() << 32) ^ rand();
        int64_t a = (rA & 1) ? -(int64_t)(rA >> 1) : (int64_t)(rA >> 1);
        int64_t b = (rB & 1) ? -(int64_t)(rB >> 1) : (int64_t)(rB >> 1);

        big60_t bigA, bigB;
        big60_from_int64(a, &bigA);
        big60_from_int64(b, &bigB);

        big120_t bigR;
        big120_mul_signed(&bigA, &bigB, &bigR);

        mpz_set_si(mpA, a);
        mpz_set_si(mpB, b);
        mpz_mul(mpProd, mpA, mpB);

        big120_to_mpz(&bigR, mpCheck);

        gmp_printf("Random A=%lld, B=%lld => A*B=%Zd\n", (long long)a, (long long)b, mpProd);
        gmp_printf("   bigR (mod 2^120 ) = %Zd\n\n", mpCheck);
    }

    mpz_clear(mpA);
    mpz_clear(mpB);
    mpz_clear(mpProd);
    mpz_clear(mpCheck);
    return 0;
}

