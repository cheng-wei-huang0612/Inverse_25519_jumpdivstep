/* -------------------------------------------------------------
 * random_test.c  ——  update_VS_mont 隨機測試
 * ------------------------------------------------------------- */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"
#include "prg.h"

extern void update_VS_mont    (big30_t *V, big30_t *S,
                               const int64_t *uuvvrrss);
extern void gmp_update_VS_mont(big30_t *V, big30_t *S,
                               const int64_t *uuvvrrss);
#define NUMBEROFTEST 100000

int main(void)
{
    gmp_randstate_t rs;
    gmp_randinit_default(rs);
    gmp_randseed_ui(rs, (unsigned long)time(NULL));

    for (int t = 0; t < NUMBEROFTEST; ++t) {
        /* ------- 隨機產生測資 ----------------------------------- */
        mpz_t mpV, mpS, mpu, mpv, mpr, mps;
        mpz_inits(mpV, mpS, mpu, mpv, mpr, mps, NULL);

        pos_random_gmp_in_range(mpV, rs, 255);
        pos_random_gmp_in_range(mpS, rs, 255);
        random_gmp_in_range(mpu, rs, 61);
        random_gmp_in_range(mpv, rs, 61);
        random_gmp_in_range(mpr, rs, 61);
        random_gmp_in_range(mps, rs, 61);

        big30_t V0, S0;
        big30_from_mpz(&V0, mpV);
        big30_from_mpz(&S0, mpS);

        int64_t uvrs[4] = {
            mpz_get_si(mpu), mpz_get_si(mpv),
            mpz_get_si(mpr), mpz_get_si(mps)
        };

        big30_t V1 = V0, S1 = S0;
        big30_t V2 = V0, S2 = S0;

        update_VS_mont(&V1, &S1, uvrs);
        gmp_update_VS_mont(&V2, &S2, uvrs);

        mpz_t a1, b1, a2, b2;
        mpz_inits(a1, b1, a2, b2, NULL);
        mpz_from_big30(a1, &V1);
        mpz_from_big30(b1, &S1);
        mpz_from_big30(a2, &V2);
        mpz_from_big30(b2, &S2);

        if (mpz_cmp(a1, a2) || mpz_cmp(b1, b2)) {
            fprintf(stderr, "\n!! MISMATCH at test %d !!\n", t);
            mpz_out_str(stderr, 10, mpV); fputc('\n', stderr);
            mpz_out_str(stderr, 10, mpS); fputc('\n', stderr);
            mpz_out_str(stderr, 10, mpu); fputc('\n', stderr);
            mpz_out_str(stderr, 10, mpv); fputc('\n', stderr);
            mpz_out_str(stderr, 10, mpr); fputc('\n', stderr);
            mpz_out_str(stderr, 10, mps); fputc('\n', stderr);
            exit(EXIT_FAILURE);
        }
        mpz_clears(mpV, mpS, mpu, mpv, mpr, mps, a1, b1, a2, b2, NULL);
    }

    printf("random_test_vs: all %d cases passed.\n", NUMBEROFTEST);
    gmp_randclear(rs);
    return EXIT_SUCCESS;
}

