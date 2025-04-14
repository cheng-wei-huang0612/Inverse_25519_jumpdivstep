#ifndef PRG_H
#define PRG_H

#include <gmp.h>

// 亂數生成函式原型
void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits);
void pos_random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits);

#endif
