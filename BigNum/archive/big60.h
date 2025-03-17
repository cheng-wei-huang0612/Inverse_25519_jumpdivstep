#ifndef BIG60_H
#define BIG60_H

#include <stdint.h>

#define LIMBS 2  // 每個 big60_t 有 2 個 32-bit limb，實際只用前 30 bits

// 大整數結構：包含 2 個 32 位 limb
// 實際上只用它們的低 30 bits，最高 2 bits 盡量避免溢位/混淆
typedef struct {
    int32_t limb[LIMBS];
} big60_t;

// 暫時用來放 120 bits 的乘積
typedef struct {
    int32_t limb[2 * LIMBS];
} big120_t;

// 將 64-bit (int64_t) x 存入 big60_t，視為二補數(60 bits)
void big60_from_int64(int64_t x, big60_t *r);

// 從 big60_t 取回一個 64-bit 整數 (超過範圍則會溢位 mod 2^60)
int64_t int64_from_big60(const big60_t *r);

// a + b (mod 2^60) 的結果存入 r
void big60_add(const big60_t *a, const big60_t *b, big60_t *r);

// a - b (mod 2^60) 的結果存入 r
void big60_sub(const big60_t *a, const big60_t *b, big60_t *r);

#endif // BIG60_H

