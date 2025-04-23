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

/*typedef struct {*/
/*    uint32_t limb[2];*/
/*} small30_t;*/

/*// to be deleted*/
/*typedef struct {*/
/*    uint32_t limb[LIMBS + 2]; */
/*} big30long_t;*/

typedef struct 
{
    uint64_t limb64[4];
} uint256_t;


extern big30_t P;



void uint256_from_big30(uint256_t *rop, const big30_t *op);
void big30_from_uint256(big30_t *rop, const uint256_t *op);
void cpt_inv(uint256_t *x, uint256_t *inv);

void mpz_from_big30(mpz_t rop, const big30_t *op);
void big30_from_mpz(big30_t *rop, const mpz_t op);
void mpz_from_uint256(mpz_t rop, const uint256_t *op);
void uint256_from_mpz(uint256_t *rop, const mpz_t op);

void print_big30_as_mpz(big30_t *op);

#endif // BIG30_H
