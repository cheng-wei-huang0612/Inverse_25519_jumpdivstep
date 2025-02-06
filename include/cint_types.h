#ifndef CINT_TYPES_H   // <-- Include guard start
#define CINT_TYPES_H

#include <stdint.h>

// 128-bit
typedef struct {
    // v[0] is the lower 64 bits, v[1] is the upper 64 bits (total 128 bits)
    uint64_t v[2];
} int128_t;

// 256-bit
typedef struct {
    // v[0] is the lowest 64 bits, v[3] is the highest 64 bits (total 256 bits)
    uint64_t v[4];
} int256_t;

// 320-bit
typedef struct {
    // v[0] is the lowest 64 bits, v[4] is the highest 64 bits (total 320 bits)
    uint64_t v[5];
} int320_t;

// 256-bit unsigned
typedef struct {
    // v[0] is the lowest 64 bits, v[3] is the highest 64 bits (total 256 bits)
    uint64_t v[4];
} uint256_t;

// Example matrix types
typedef struct {
    int64_t v[2][2];
} matrix_int64_t;

typedef struct {
    int128_t v[2][2];
} matrix_int128_t;

typedef struct {
    int256_t v[2][2];
} matrix_int256_t;

#endif // CINT_TYPES_H   // <-- Include guard end
