#ifndef BIG30_MPZ_H
#define BIG30_MPZ_H

#include <stdint.h>
#include <gmp.h>
#include "big30.h"




void mpz_from_big30(mpz_t rop, const big30_t *op);
void big30_from_mpz(big30_t *rop, const mpz_t op);
void mpz_from_uint256(mpz_t rop, const uint256_t *op);
void uint256_from_mpz(uint256_t *rop, const mpz_t op);

void print_big30_as_mpz(big30_t *op);

#endif
