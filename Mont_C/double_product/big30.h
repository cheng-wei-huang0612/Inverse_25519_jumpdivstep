#ifndef BIG30_H
#define BIG30_H

#include <stdint.h>
#include <gmp.h>

/* 
 * ---------------------------------------------------------
 * big30.h 
 *
 * 放置基礎型別定義與函式原型
 * ---------------------------------------------------------
 */

// limb 相關常數
#define LIMBS       9
#define BIG30_SHIFT 30

// 型別定義
typedef struct {
    uint32_t limb[LIMBS]; 
} big30_t;

typedef struct {
    uint32_t limb[2]; // 只需存 u, v 兩個 30-bit limb，用於小範圍
} small30_t;

/* 若您未使用，可自行刪除或保留 */
typedef struct {
    uint32_t limb[LIMBS + 2]; // 額外用於更大範圍運算（示範）
} big30long_t;

/* 專案全域的模數 P */
extern big30_t P;

/* 函式原型宣告 */

// mpz ↔ big30
void mpz_from_big30(mpz_t rop, const big30_t *op);
void big30_from_mpz(big30_t *rop, const mpz_t op);

// 如果需要 big30long
void mpz_from_big30long(mpz_t rop, const big30long_t *x);
void big30long_from_mpz(big30long_t *rop, const mpz_t op);

// mpz ↔ small30
void small30_from_mpz(small30_t *rop, const mpz_t op);
void int64_from_small30(int64_t *rop, small30_t *op);
void int64_from_mpz(int64_t *rop, const mpz_t op);

// GMP 協助產生亂數
void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits);
void pos_random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits);
/* modPmul（Montgomery 版，純 C） */
//void modPmul(big30_t *rop, int64_t *u, big30_t *A);

/* gmp 參考版本 modPmul */
//void gmp_modPmul(big30_t *rop, int64_t *u, big30_t *A);

#endif

