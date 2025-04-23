#include <stdint.h>

#ifndef BIG30_H
#define BIG30_H



// limb 相關常數
#define LIMBS       9
#define BIG30_SHIFT 30

// 型別定義
typedef struct {
    uint32_t limb[LIMBS]; 
} big30_t;


typedef struct 
{
    uint64_t limb64[4];
} uint256_t;

extern big30_t P;




void uint256_from_big30(uint256_t *rop, const big30_t *op);
void big30_from_uint256(big30_t *rop, const uint256_t *op);
void cpt_inv(uint256_t *x, uint256_t *inv);


#endif // BIG30_H
