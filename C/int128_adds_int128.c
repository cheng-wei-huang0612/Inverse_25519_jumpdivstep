// int128_adds_int128.c
#include <stdint.h>
#include "cint_types.h"
#include "cint_arith.h"


void int128_adds_int128(int128_t *A, int128_t *B, int128_t *R) {
    __int128_t sum;
    uint64_t carry = 0;  // 進位應該是無號數，確保只會是 0 或 1

    sum = (__int128_t)A->v[0] + (__int128_t)B->v[0];
    carry = (uint64_t)(sum >> 64);  // 取高 64-bit 作為 carry
    R->v[0] = (uint64_t)sum;

    // 最高 limb
    sum = (__int128_t)A->v[1] + (__int128_t)B->v[1] + carry;
    R->v[1] = (uint64_t)sum;

    uint64_t overflow = (uint64_t)(sum >> 64);
    if (overflow != 0) {
    // 表示已經超過了 128 bits
    printf("Overflow detected!\n");
    }
}