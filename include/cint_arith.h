#ifndef CINT_ARITH_H   // <-- Include guard start
#define CINT_ARITH_H

#include <stdio.h>
#include <stdint.h>

// Include the definitions for int128_t, int256_t, etc.
#include "cint_types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern void int64_times_int64(int64_t *A, int64_t *B, int128_t *R);
extern void int128_times_int128(int128_t *A, int128_t *B, int256_t *R);
extern void int64_times_int256(int64_t *A, int256_t *B, int320_t *R);
extern void int128_adds_int128(int128_t *A, int128_t *B, int128_t *R);

#ifdef __cplusplus
}
#endif

#endif // CINT_ARITH_H   // <-- Include guard end
