#include "mybig30.h"
#include <stdio.h>

big30_9 P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};

big30_9 inv600 = {
    0x08dd407e, 0x15a0f99e, 0x3c744c96, 0x2a8c68f3,
    0x016b1490, 0x2c6c8938, 0x05dc1855, 0x36508b24,
    0x00004469
};

void uint256_to_big30_9(big30_9 *rop, const uint256_t *x)
{
    /* 先把 x->limb64[] 複製到暫存陣列 t[0..3]
     * t[0] = 最低位 64 bits, t[3] = 最高位 64 bits
     */
    uint64_t t[4];
    t[0] = x->limb64[0];
    t[1] = x->limb64[1];
    t[2] = x->limb64[2];
    t[3] = x->limb64[3];

    /*
     * 依序取出 9 組 30-bit
     * 這可把 256 bits 拆成 9 個 30-bit (總計 270 bits，可容納 256 bits)
     * rop->limb[i] 依序取 t[0] 的最低 30 bits
     */
    for(int i = 0; i < 9; i++) {
        /* 取出當前 t[0] 的最低 30 bits */
        rop->limb[i] = (uint32_t)(t[0] & 0x3FFFFFFF);

        /*
         * 下面直接展開「整個 256-bit (t[3]:t[2]:t[1]:t[0]) 向右移 30 bits」的步驟：
         * new_t[0] = (old_t[0] >> 30) | (old_t[1] << 34)
         * new_t[1] = (old_t[1] >> 30) | (old_t[2] << 34)
         * new_t[2] = (old_t[2] >> 30) | (old_t[3] << 34)
         * new_t[3] =  old_t[3] >> 30
         */
        uint64_t t0 = t[0];
        uint64_t t1 = t[1];
        uint64_t t2 = t[2];
        uint64_t t3 = t[3];

        t[0] = (t0 >> 30) | (t1 << 34);
        t[1] = (t1 >> 30) | (t2 << 34);
        t[2] = (t2 >> 30) | (t3 << 34);
        t[3] =  t3 >> 30;
    }
}
void big30_9_to_uint256(uint256_t *rop, const big30_9 *x)
{
    // 暫存在 256-bit（t[0..3]）中，最後再存回 rop->limb64[]
    uint64_t t[4] = {0ULL, 0ULL, 0ULL, 0ULL};

    // 從最高 limb (x->limb[8]) 到最低 limb (x->limb[0])
    for (int i = 8; i >= 0; i--) {
        // 整個 t[3..0] << 30
        // new_t[3] = (old_t[3] << 30) | (old_t[2] >> (64-30))
        // new_t[2] = (old_t[2] << 30) | (old_t[1] >> (64-30))
        // ... 類似 shiftLeft30，這裡直接手動 inline

        uint64_t old0 = t[0];
        uint64_t old1 = t[1];
        uint64_t old2 = t[2];
        uint64_t old3 = t[3];

        t[3] = (old3 << 30) | (old2 >> 34);
        t[2] = (old2 << 30) | (old1 >> 34);
        t[1] = (old1 << 30) | (old0 >> 34);
        t[0] = (old0 << 30);

        // 再加上 x->limb[i] (最低 30 bits)，以 64-bit 來裝沒問題
        t[0] |= (uint64_t)x->limb[i] & 0x3FFFFFFF; 
    }

    // 將 t[0..3] 複製回 rop->limb64[0..3]
    rop->limb64[0] = t[0];
    rop->limb64[1] = t[1];
    rop->limb64[2] = t[2];
    rop->limb64[3] = t[3];
}


#ifdef USE_GMP
#include <gmp.h>
#include <stddef.h>

/* 把 big30_9 decode 成 mpz_t (little-endian 30-bit limb) */
void big30_9_to_mpz(mpz_t rop, const big30_9 *x)
{
    mpz_set_ui(rop, 0UL); // rop = 0
    // 輪 9 次，最高 limb 在 x->limb[8]
    // 每次 left-shift rop by 30，再加上 limb[i]
    for (int i = 8; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, 30);        // rop <<= 30
        mpz_add_ui(rop, rop, x->limb[i]);  // rop += limb[i]
    }
}

/* 把 mpz_t 轉成 big30_9 (little-endian 30-bit limb)
   假設 mpz_t 數值未超過 9×30=270 bits。
*/
void mpz_to_big30_9(big30_9 *x, const mpz_t rop)
{
    // 先清 zero
    for (int i = 0; i < 9; i++) {
        x->limb[i] = 0;
    }

    // 建立暫時拷貝，以免改到原始 rop
    mpz_t t;
    mpz_init_set(t, rop);

    // 逐 limb 取出 (t % 2^30)，再 t >>= 30
    for (int i = 0; i < 9; i++) {
        // x->limb[i] = low30 bits of t
        unsigned long low = mpz_get_ui(t) & 0x3fffffffUL; // 只取低30 bits
        x->limb[i] = (uint32_t) low;

        // 再把 t 右移 30 bits
        mpz_fdiv_q_2exp(t, t, 30); // t >>= 30
        // 若 mpz_t 超過 2^32, mpz_get_ui(t) 只會取低 32 bits
        // 但因為取完之後再右移 30 bits，就可以迭代
    }

    mpz_clear(t);
}
#endif

void big30_9_add_mod(big30_9 *a, const big30_9 *x, const big30_9 *y)
{
#ifdef USE_GMP
    // ====== GMP 版: 直接用 mpz 做加法 mod P ======
    mpz_t mpX, mpY, mpP, mpSum;
    mpz_inits(mpX, mpY, mpP, mpSum, NULL);

    // 把 x,y,P 都轉成 mpz
    big30_9_to_mpz(mpX, x);
    big30_9_to_mpz(mpY, y);
    big30_9_to_mpz(mpP, &P);

    mpz_add(mpSum, mpX, mpY);
    mpz_mod(mpSum, mpSum, mpP);

    // 再把 mpSum 轉回 a
    mpz_to_big30_9(a, mpSum);

    mpz_clears(mpX, mpY, mpP, mpSum, NULL);
#else
    // ====== 非 GMP 版: 先暫時不做 ======
    printf("We have not implemented this for non-GMP mode!\n");
#endif
}
void big30_9_sub_mod(big30_9 *a, const big30_9 *x, const big30_9 *y)
{
#ifdef USE_GMP
    // ====== GMP 版: 直接用 mpz 做 (x - y) mod P ======
    mpz_t mpX, mpY, mpP, mpDiff;
    mpz_inits(mpX, mpY, mpP, mpDiff, NULL);

    // 1) 轉 x, y, P 成 mpz
    big30_9_to_mpz(mpX, x);  // 假設 x in [0..P-1]
    big30_9_to_mpz(mpY, y);  // 假設 y in [0..P-1]
    big30_9_to_mpz(mpP, &P); // P

    // 2) 做 (x - y) mod P
    mpz_sub(mpDiff, mpX, mpY);
    mpz_mod(mpDiff, mpDiff, mpP);

    // 3) mpDiff -> a
    mpz_to_big30_9(a, mpDiff);

    mpz_clears(mpX, mpY, mpP, mpDiff, NULL);
#else
    // ====== 非 GMP 版: 先暫時不做 ======
    printf("We have not implemented this for non-GMP mode!\n");
#endif
}


void big30_9_mul_mod(big30_9 *a, const big30_9 *x, const big30_9 *y)
{
#ifdef USE_GMP
    // ====== GMP 版: 直接用 mpz 做 (x * y) mod P ======
    mpz_t mpX, mpY, mpP, mpProd;
    mpz_inits(mpX, mpY, mpP, mpProd, NULL);

    // 1) 轉 x, y, P 成 mpz
    big30_9_to_mpz(mpX, x);  
    big30_9_to_mpz(mpY, y);
    big30_9_to_mpz(mpP, &P);

    // 2) 做 (x * y) mod P
    mpz_mul(mpProd, mpX, mpY);
    mpz_mod(mpProd, mpProd, mpP);

    // 3) mpProd -> a
    mpz_to_big30_9(a, mpProd);

    mpz_clears(mpX, mpY, mpP, mpProd, NULL);
#else
    // ====== 非 GMP 版: 先暫時不做 ======
    printf("We have not implemented this for non-GMP mode!\n");
#endif
}
void big30_9_from_int64(big30_9 *out, int64_t val)
{
#ifdef USE_GMP
    // ====== GMP 版: 直接把 val mod P 後轉回 big30_9 ======
    mpz_t mpVal, mpP;
    mpz_inits(mpVal, mpP, NULL);

    // 1) 先把 P 轉成 mpz
    big30_9_to_mpz(mpP, &P);

    // 2) mpVal = val mod P (考慮 val 可能為負)
    mpz_set_si(mpVal, val);   // mpVal = val
    mpz_mod(mpVal, mpVal, mpP);

    // 3) mpVal -> out (big30_9)
    mpz_to_big30_9(out, mpVal);

    mpz_clears(mpVal, mpP, NULL);
#else
    // ====== 非 GMP 版: 先暫時不做 ======
    printf("We have not implemented this for non-GMP mode!\n");
#endif
}
