// int128_adds_int128.c

#include <stdint.h>
#include <stdio.h>
#include "cint_types.h"

int int128_adds_int128(int128_t *A, int128_t *B, int128_t *R) {
    __int128_t a = ((__int128_t)A->v[1] << 64) | A->v[0];
    __int128_t b = ((__int128_t)B->v[1] << 64) | B->v[0];
    __int128_t result = a + b;
    R->v[0] = (uint64_t)result;
    R->v[1] = (uint64_t)(result >> 64);
    return 0;
}