#include "big30.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <gmp.h>

big30_t P = {
    0x3fffffed, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x3fffffff, 0x3fffffff, 0x3fffffff, 0x3fffffff,
    0x00007fff
};


void uint256_from_big30(uint256_t *rop, const big30_t *op) {
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
        t[0] |= (uint64_t)op->limb[i] & 0x3FFFFFFF; 
    }

    // 將 t[0..3] 複製回 rop->limb64[0..3]
    rop->limb64[0] = t[0];
    rop->limb64[1] = t[1];
    rop->limb64[2] = t[2];
    rop->limb64[3] = t[3];
}

void big30_from_uint256(big30_t *rop, const uint256_t *op) {
    /* 先把 x->limb64[] 複製到暫存陣列 t[0..3]
     * t[0] = 最低位 64 bits, t[3] = 最高位 64 bits
     */
    uint64_t t[4];
    t[0] = op->limb64[0];
    t[1] = op->limb64[1];
    t[2] = op->limb64[2];
    t[3] = op->limb64[3];

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

// ----------------------------------------------------------
// mpz <-> big30 轉換
// ----------------------------------------------------------
void mpz_from_big30(mpz_t rop, const big30_t *op) {
    mpz_set_ui(rop, 0);
    mpz_t tmp;
    mpz_init(tmp);

    // 從 x->limb[LIMBS-1] (最高位) 開始，往下處理
    for(int i = LIMBS - 1; i >= 0; i--) {
        mpz_set_si(tmp, (int32_t)op->limb[i]);
        mpz_mul_2exp(rop, rop, BIG30_SHIFT);
        mpz_add(rop, rop, tmp);
    }
    mpz_clear(tmp);
}


void big30_from_mpz(big30_t *rop, const mpz_t op) {
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

void mpz_from_uint256(mpz_t rop, const uint256_t *op){
    mpz_set_ui(rop, 0);
    for (int i = 3; i >= 0; i--) {
        mpz_mul_2exp(rop, rop, 64);
        mpz_add_ui(rop, rop, op->limb64[i]);
    }
}

void uint256_from_mpz(uint256_t *rop, const mpz_t op) {
    mpz_t tmp;
    mpz_init_set(tmp, op);

    for (int i = 0; i < 4; i++) {
        rop->limb64[i] = mpz_get_ui(tmp);
        mpz_tdiv_q_2exp(tmp, tmp, 64);
    }

    mpz_clear(tmp);
}


void print_big30_as_mpz(big30_t *op) {
    mpz_t tmp; 
    mpz_init(tmp);
    mpz_from_big30(tmp, op);
    gmp_printf("%Zd\n", tmp);
    mpz_clear(tmp);
}



/*// ----------------------------------------------------------*/
/*// mpz <-> big30long (若無需求可自行刪除)*/
/*// ----------------------------------------------------------*/
/*void mpz_from_big30long(mpz_t rop, const big30long_t *op) {*/
/*    mpz_set_ui(rop, 0);*/
/*    mpz_t tmp;*/
/*    mpz_init(tmp);*/
/**/
/*    for(int i = (LIMBS + 1); i >= 0; i--) {*/
/*        mpz_set_si(tmp, (int32_t)op->limb[i]);*/
/*        mpz_mul_2exp(rop, rop, BIG30_SHIFT);*/
/*        mpz_add(rop, rop, tmp);*/
/*    }*/
/*    mpz_clear(tmp);*/
/*}*/
/**/
/*void big30long_from_mpz(big30long_t *rop, const mpz_t op) {*/
/*    mpz_t tmp, rem;*/
/*    mpz_init_set(tmp, op);*/
/*    mpz_init(rem);*/
/**/
/*    for(int i = 0; i < (LIMBS + 1); i++) {*/
/*        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);*/
/*        rop->limb[i] = (uint32_t)mpz_get_ui(rem);*/
/*        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);*/
/*    }*/
/*    rop->limb[LIMBS+1] = (int32_t)mpz_get_si(tmp);*/
/**/
/*    mpz_clear(rem);*/
/*    mpz_clear(tmp);*/
/*}*/

// ----------------------------------------------------------
// mpz <-> small30
// ----------------------------------------------------------
/*void small30_from_mpz(small30_t *rop, const mpz_t op) {*/
/*    mpz_t tmp, rem;*/
/*    mpz_init_set(tmp, op);*/
/*    mpz_init(rem);*/
/**/
/*    // 取低位*/
/*    for(int i = 0; i < 1; i++) {*/
/*        mpz_mod_2exp(rem, tmp, BIG30_SHIFT);*/
/*        rop->limb[i] = (uint32_t)mpz_get_ui(rem);*/
/*        mpz_fdiv_q_2exp(tmp, tmp, BIG30_SHIFT);*/
/*    }*/
/*    // 最後一個 (signed)*/
/*    rop->limb[1] = (int32_t)mpz_get_si(tmp);*/
/**/
/*    mpz_clear(rem);*/
/*    mpz_clear(tmp);*/
/*}*/
/**/
/*void int64_from_small30(int64_t *rop, small30_t *op) {*/
/*    // 將 small30_t 轉為 64-bit*/
/*    *rop = (int64_t)( (int32_t)op->limb[1] ); // 先放高位*/
/*    *rop <<= BIG30_SHIFT;                    // 左 shift 30 bits*/
/*    *rop += op->limb[0];                     // 加入低位*/
/*}*/
/**/
/*void int64_from_mpz(int64_t *rop, const mpz_t op) {*/
/*    small30_t tmp30;*/
/*    small30_from_mpz(&tmp30, op);*/
/*    int64_from_small30(rop, &tmp30);*/
/*}*/







