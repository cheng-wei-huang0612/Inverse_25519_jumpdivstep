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







