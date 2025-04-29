#include "prg.h"
#include <gmp.h>

void random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits) {
    // mpz_urandomb(rop, rstate, bits + 1);
    mpz_urandomb(rop, rstate, bits);
    mpz_t shift;
    mpz_init(shift);
    mpz_setbit(shift, bits-1);
    mpz_sub(rop, rop, shift);
    mpz_clear(shift);
}

void pos_random_gmp_in_range(mpz_t rop, gmp_randstate_t rstate, int bits) {
    mpz_urandomb(rop, rstate, bits);
}

