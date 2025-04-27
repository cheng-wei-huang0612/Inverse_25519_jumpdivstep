/* ------------------------------------------------------------------
 * random_test.c  ——  NUMBEROFTEST 次隨機測試
 * ------------------------------------------------------------------ */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>
#include "big30.h"
#include "big30_mpz.h"
#include "prg.h"

extern void update_FG(big30_t *F, big30_t *G, const int64_t *uuvvrrss);
extern void gmp_update_FG(big30_t *F, big30_t *G, const int64_t *uuvvrrss);

#define NUMBEROFTEST 100

int main(void)
{
    gmp_randstate_t rs;
    gmp_randinit_default(rs);
    gmp_randseed_ui(rs, (unsigned long)time(NULL));

    for (int t = 0; t < NUMBEROFTEST; ++t) {
        /* ----- 隨機產生測資 ------------------------------------ */
        mpz_t mpF, mpG, mpu, mpv, mpr, mps;
        mpz_inits(mpF, mpG, mpu, mpv, mpr, mps, NULL);

        random_gmp_in_range(mpF, rs, 255);
        random_gmp_in_range(mpG, rs, 255);
        random_gmp_in_range(mpu, rs, 61);
        random_gmp_in_range(mpv, rs, 61);
        random_gmp_in_range(mpr, rs, 61);
        random_gmp_in_range(mps, rs, 61);

        big30_t F0, G0;
        big30_from_mpz(&F0, mpF);
        big30_from_mpz(&G0, mpG);

        int64_t uvrs[4] = {
            mpz_get_si(mpu),
            mpz_get_si(mpv),
            mpz_get_si(mpr),
            mpz_get_si(mps)
        };

        big30_t F1 = F0, G1 = G0;
        big30_t F2 = F0, G2 = G0;

        update_FG(&F1, &G1, uvrs);
        gmp_update_FG(&F2, &G2, uvrs);

        mpz_t a1, b1, a2, b2;
        mpz_inits(a1, b1, a2, b2, NULL);
        mpz_from_big30(a1, &F1);
        mpz_from_big30(b1, &G1);
        mpz_from_big30(a2, &F2);
        mpz_from_big30(b2, &G2);

        if (mpz_cmp(a1, a2) || mpz_cmp(b1, b2)) {
            fprintf(stderr, "\n!! MISMATCH at test %d !!\n", t);
            mpz_out_str(stderr, 16, mpF); fputc('\n', stderr);
            mpz_out_str(stderr, 16, mpG); fputc('\n', stderr);
            exit(EXIT_FAILURE);
        }

        mpz_clears(mpF, mpG, mpu, mpv, mpr, mps, a1, b1, a2, b2, NULL);
    }

    printf("random_test: all %d cases passed.\n", NUMBEROFTEST);
    /*gmp_randclear(rs);*/
    return EXIT_SUCCESS;
}

