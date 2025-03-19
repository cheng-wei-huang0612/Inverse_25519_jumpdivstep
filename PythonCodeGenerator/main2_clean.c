#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include "mybig30.h"
#include <gmp.h>


extern void cpt_inv(uint256_t *x, uint256_t *inv);


// A small helper to generate a random 256-bit number in uint256_t
// (Not cryptographically secure! Just for test/demo.)
static void random_uint256_t(uint256_t *rop) {
    // Fill each 64-bit limb with random data.
    // rand() typically returns up to 31 bits, so we combine multiple calls.
    for (int i = 0; i < 4; i++) {
        uint64_t lo = (uint64_t)(rand() & 0xFFFF) << 16 | (rand() & 0xFFFF);
        uint64_t hi = (uint64_t)(rand() & 0xFFFF) << 16 | (rand() & 0xFFFF);
        rop->limb64[i] = (hi << 32) ^ lo;
    }
}


int main(void) {
    srand((unsigned)time(NULL));

    // Initialize GMP variables for prime P (in mpz form).
    mpz_t mpP;
    mpz_init(mpP);
    mpz_t_from_big30_9_t(mpP, &P);

    // We'll do 100 random tests.
    const int NUM_TESTS = 100000;
    for (int i = 0; i < NUM_TESTS; i++) {
        // 1) Generate a random 256-bit x
        uint256_t x;
        random_uint256_t(&x);

        // 2) Convert x to mpz
        mpz_t mpX;
        mpz_init(mpX);
        mpz_t_from_uint256_t(mpX, &x);

        
        //mpz_set_str(mpX, "21740116914082600554420437631634928787881354298405292420201453070194378295336", 10);
        uint256_t_from_mpz_t(&x, mpX);






        // One might check if mpX is 0 mod P; if so, invert is not defined.
        // For simplicity, let's skip the zero check or re-generate if it's zero.

        // 3) Compute the modular inverse using cpt_inv
        //    cpt_inv expects and returns a uint256_t, so we convert back and forth.
        uint256_t xInv;
        cpt_inv(&x, &xInv);

        // 4) Convert inverse back to mpz
        mpz_t mpInv;
        mpz_init(mpInv);
        mpz_t_from_uint256_t(mpInv, &xInv);

        // 5) Check that (x * xInv) mod P == 1
        mpz_t mpCheck;
        mpz_init(mpCheck);

        mpz_mul(mpCheck, mpX, mpInv);
        mpz_mod(mpCheck, mpCheck, mpP);

        // 6) Print results or confirm success
        if (mpz_cmp_ui(mpCheck, 1) != 0) {
            gmp_printf(
                "Test %d FAILED:\n"
                "  x       = %Zd\n"
                "  inv(x)  = %Zd\n"
                "  product = %Zd (mod P, should be 1)\n",
                i, mpX, mpInv, mpCheck
            );
            // **Immediately terminate** the program on failure:
            return 1;
        } else {
            gmp_printf("Test %d passed. \nx = %Zd\nv = %Zd\n\n", i, mpX, mpInv);

        }
        // Clean up
        mpz_clear(mpCheck);
        mpz_clear(mpInv);
        mpz_clear(mpX);
    }

    mpz_clear(mpP);
    return 0;
}

