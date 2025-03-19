#include<stdint.h>
#include<stdio.h>
#include"mybig30.h"
#include<gmp.h>


extern void cpt_inv(uint256_t *x, uint256_t *inv);



int main(void) {

    // Initialize GMP variables for prime P (in mpz form).
    mpz_t mpP;
    mpz_init(mpP);
    mpz_t_from_big30_9_t(mpP, &P);


    mpz_t mpX;
    mpz_init(mpX);
    mpz_set_str(mpX, "21740116914082600554420437631634928787881354298405292420201453070194378295336", 10);
    uint256_t x;
    uint256_t_from_mpz_t(&x, mpX);



    uint256_t xInv;
    cpt_inv(&x, &xInv);


    mpz_t mpInv;
    mpz_init(mpInv);
    mpz_t_from_uint256_t(mpInv, &xInv);

    // Check that (x * xInv) mod P == 1
    mpz_t mpCheck;
    mpz_init(mpCheck);

    mpz_mul(mpCheck, mpX, mpInv);
    mpz_mod(mpCheck, mpCheck, mpP);

    // Print results or confirm success
    if (mpz_cmp_ui(mpCheck, 1) != 0) {
        gmp_printf(
            "Test FAILED:\n"
            "  x       = %Zd\n"
            "  inv(x)  = %Zd\n"
            "  product = %Zd (mod P, should be 1)\n",
            mpX, mpInv, mpCheck
        );
        // **Immediately terminate** the program on failure:
        return 1;
    } else {
        gmp_printf(
            "Test SUCCESS:\n"
            "  x       = %Zd\n"
            "  inv(x)  = %Zd\n"
            "  product = %Zd (mod P)\n",
            mpX, mpInv, mpCheck
        );

    }
    // Clean up
    mpz_clear(mpCheck);
    mpz_clear(mpInv);
    mpz_clear(mpX);

    mpz_clear(mpP);
    return 0;
}

