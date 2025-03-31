#include "big30.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/*
 * ---------------------------------------------------------
 * big30.c
 *
 * 與 big30 相關的通用函式實作
 * 包括：
 *  1. mpz <-> big30/small30 轉換
 *  2. 亂數產生工具
 *  3. 全域變數 P
 * ---------------------------------------------------------
 */

// ----------------------------------------------------------
// 全域變數 P
// ----------------------------------------------------------
big30_t P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};

// ----------------------------------------------------------
// mpz <-> big30 轉換
// ----------------------------------------------------------
void mpz_from_big30(mpz_t rop, const big30_t *x) {
    mpz_set_ui(rop, 0);
    mpz_t tmp;
    mpz_init(tmp);

    // 從 x->limb[LIMBS-1] (最高位) 開始，往下處理
    for(int i = LIMBS - 1; i >= 0; i--) {
        mpz_set_si(tmp, (int32_t)x->limb[i]);
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_add(rop, rop, tmp);
    }
    mpz_clear(tmp);
}

void big30_from_mpz(const mpz_t op, big30_t *rop) {
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // Extract lower limbs, each 30 bits
    for(int i = 0; i < LIMBS - 1; i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (uint32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // final signed part goes to limb[LIMBS-1]
    rop->limb[LIMBS - 1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

// ----------------------------------------------------------
// mpz <-> big30long (若無需求可自行刪除)
// ----------------------------------------------------------
void mpz_from_big30long(mpz_t rop, const big30long_t *x) {
    mpz_set_ui(rop, 0);
    mpz_t tmp;
    mpz_init(tmp);

    for(int i = (LIMBS + 1); i >= 0; i--) {
        mpz_set_si(tmp, (int32_t)x->limb[i]);
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_add(rop, rop, tmp);
    }
    mpz_clear(tmp);
}

void big30long_from_mpz(const mpz_t op, big30long_t *rop) {
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    for(int i = 0; i < (LIMBS + 1); i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (uint32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    rop->limb[LIMBS+1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

// ----------------------------------------------------------
// mpz <-> small30
// ----------------------------------------------------------
void small30_from_mpz(const mpz_t op, small30_t *rop) {
    mpz_t tmp, rem;
    mpz_init_set(tmp, op);
    mpz_init(rem);

    // 取低位
    for(int i = 0; i < 1; i++) {
        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);
        rop->limb[i] = (uint32_t)mpz_get_ui(rem);
        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);
    }
    // 最後一個 (signed)
    rop->limb[1] = (int32_t)mpz_get_si(tmp);

    mpz_clear(rem);
    mpz_clear(tmp);
}

void int64_from_small30(int64_t *rop, small30_t *op) {
    // 將 small30_t 轉為 64-bit
    *rop = (int64_t)( (int32_t)op->limb[1] ); // 先放高位
    *rop <<= BIG30_SHIFT;                    // 左 shift 30 bits
    *rop += op->limb[0];                     // 加入低位
}

void int64_from_mpz(const mpz_t op, int64_t *rop) {
    small30_t tmp30;
    small30_from_mpz(op, &tmp30);
    int64_from_small30(rop, &tmp30);
}

// ----------------------------------------------------------
// 亂數工具：產生範圍 [ -2^bits, 2^bits )
// ----------------------------------------------------------
void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits) {
    // 1) rop ∈ [0, 2^(bits+1))
    mpz_urandomb(rop, rstate, bits + 1);

    // 2) shift = 2^bits
    mpz_t shift;
    mpz_init(shift);
    mpz_setbit(shift, bits);

    // 3) rop -= shift => rop ∈ [ -2^bits, 2^bits )
    mpz_sub(rop, rop, shift);

    mpz_clear(shift);
}

