#include "mybig30.h"
#include <stdio.h>
#include <gmp.h>

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

void mpz_t_from_uint256_t(mpz_t rop, const uint256_t *x){
    mpz_set_ui(rop, 0);
    for (int i = 3; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, 64);
        mpz_add_ui(rop, rop, x->limb64[i]);
    }
}

void uint256_t_from_mpz_t(uint256_t *rop, const mpz_t op) {
    mpz_t tmp;
    mpz_init_set(tmp, op);

    for (int i = 0; i < 4; i++) {
        rop->limb64[i] = mpz_get_ui(tmp);
        mpz_tdiv_q_2exp(tmp, tmp, 64);
    }

    mpz_clear(tmp);
}

/**
 * Each big30_9 limb covers 30 bits.
 * The array has 9 limbs in total.
 */
#define BIG30_SHIFT  30

/**
 * Convert a big30_9 structure to an mpz_t value.
 *
 * Explanation:
 *  1) We set the mpz_t 'rop' to the highest limb (limb[8]) with sign.
 *  2) Then, for i = 7 down to 0, we shift 'rop' left by 30 bits and add the current limb.
 */
void mpz_t_from_big30_9_t(mpz_t rop, const big30_9 *x)
{
    mpz_t temp;
    mpz_init(temp);

    // Initialize rop with the signed value from the top limb
    mpz_set_si(rop, (int32_t)(x->limb[8]));

    // Multiply by 2^30 and add each lower limb in descending order
    for (int i = 7; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_set_ui(temp, (unsigned long)x->limb[i]);
        mpz_add(rop, rop, temp);
    }

    mpz_clear(temp);
}

/**
 * Convert an mpz_t value to a big30_9 structure.
 *
 * Explanation:
 *  1) We create a copy of 'op' into 'tmp'.
 *  2) For i = 0..7, extract the lowest 30 bits (using mpz_mod_2exp),
 *     store them in rop->limb[i], then divide 'tmp' by 2^30.
 *  3) The remaining part in 'tmp' is placed into rop->limb[8] as a signed integer.
 */
void big30_9_t_from_mpz_t(big30_9 *rop, const mpz_t op)
{
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract 8 lower limbs, each 30 bits
    for (int i = 0; i < 8; i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (int32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }

    // The final signed part goes to limb[8]
    rop->limb[8] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}


