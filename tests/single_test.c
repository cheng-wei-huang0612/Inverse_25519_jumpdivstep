#include <stdint.h>
#include <stdio.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"
/*#include "cpt_inv.h"*/

const char *TEST_X = "97165018423823247783865467928919784927142320732975169496993440879442771425739";
// const char *TEST_X = "29117641286608306238495715644116414192630722323124200381980140954205159429133";
// const char *TEST_X = "51594937704745900782878427907903488982031175296730183711367891400868856617456";
// const char *TEST_X = "8447652333555256815180248154595013921330191454237389748465485098126138843358";
// const char *TEST_X = "41539168527567215076744596298652135611477756802866708682274748875823690114131";


int main(void) {

    // Initialize GMP variables for prime P (in mpz form).
    mpz_t mpP;
    mpz_init(mpP);
    mpz_from_big30(mpP, &P);


    mpz_t mpX;
    mpz_init(mpX);
    mpz_set_str(mpX, TEST_X, 10);
    uint256_t x;
    uint256_from_mpz(&x, mpX);



    uint256_t xInv;
    cpt_inv(&x, &xInv);

    // printf("xInv (uint64_t[4]) = {\n");
    // for (int i = 0; i < 4; ++i) {
    //     printf("  %lld%s\n", (unsigned long long)xInv.limb64[i], (i < 3) ? "," : "");
    // }
    // printf("}\n");


    mpz_t mpInv;
    mpz_init(mpInv);
    mpz_from_uint256(mpInv, &xInv);

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
        return 0;
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

