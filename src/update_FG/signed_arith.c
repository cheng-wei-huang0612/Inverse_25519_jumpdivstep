// r30x2_gmp_demo.c
// Radix‑2^30 two‑limb arithmetic (AArch64‑style) + GMP cross‑check
// Build:  gcc -O3 -std=c11 r30x2_gmp_demo.c -lgmp -o demo && ./demo

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <gmp.h>

/* -------------------------------------------------------------
   Radix‑2^30 layout & helpers
   -------------------------------------------------------------*/
#define RMASK   ((uint32_t)((1u << 30) - 1))
#define RSHIFT  30
#define LIMBS 11

typedef struct {
    int32_t limb[11];
} r30x11;




static inline r30x11 signed_mul(const r30x11 F, const r30x11 uu)
{
    /* a  has 9 canonical limbs (0‑8), b 只有 2 limbs (0‑1) */
    int64_t prod;
    r30x11 m = {0};

    /* limb 0 */
    prod  = (int64_t)F.limb[0] * uu.limb[0];
    m.limb[0] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 1 */
    prod += (int64_t)F.limb[0] * uu.limb[1];
    prod += (int64_t)F.limb[1] * uu.limb[0];
    m.limb[1] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 2 */
    prod += (int64_t)F.limb[1] * uu.limb[1];
    prod += (int64_t)F.limb[2] * uu.limb[0];
    m.limb[2] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 3 */
    prod += (int64_t)F.limb[2] * uu.limb[1];
    prod += (int64_t)F.limb[3] * uu.limb[0];
    m.limb[3] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 4 */
    prod += (int64_t)F.limb[3] * uu.limb[1];
    prod += (int64_t)F.limb[4] * uu.limb[0];
    m.limb[4] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 5 */
    prod += (int64_t)F.limb[4] * uu.limb[1];
    prod += (int64_t)F.limb[5] * uu.limb[0];
    m.limb[5] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 6 */
    prod += (int64_t)F.limb[5] * uu.limb[1];
    prod += (int64_t)F.limb[6] * uu.limb[0];
    m.limb[6] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 7 */
    prod += (int64_t)F.limb[6] * uu.limb[1];
    prod += (int64_t)F.limb[7] * uu.limb[0];
    m.limb[7] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 8 */
    prod += (int64_t)F.limb[7] * uu.limb[1];
    prod += (int64_t)F.limb[8] * uu.limb[0];
    m.limb[8] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 9 */
    prod += (int64_t)F.limb[8] * uu.limb[1];
    m.limb[9] = (int32_t)(prod & RMASK);
    prod >>= RSHIFT;

    /* limb 10 (top) — carries fit into ±2^31 */
    m.limb[10] = (int32_t)prod;

    return m;
}

/* Pretty‑printer for 11 limbs without PRIx32 — pure C99 specifiers */
static inline void dump11(const char *tag, r30x11 v)
{
    printf("%s:\n", tag);
    for (int i = 0; i < 11; ++i) {
        printf("  l%d = %d (%u)\n", i, v.limb[i], (unsigned)v.limb[i]);
    }
}
/* -------------------------------------------------------------
   Convert r30x4 → mpz_t  (every limb treated as signed int32)
   -------------------------------------------------------------*/
static void r30x11_to_mpz(const r30x11 *x, mpz_t z)
{
    mpz_set_si(z, 0);               /* z = 0 */
    mpz_t tmp;
    mpz_init(tmp);

    for (int i = (11-1); i >= 0; --i) {
        mpz_mul_2exp(z, z, RSHIFT); /* z <<= 30 */
        mpz_set_si(tmp, x->limb[i]);
        mpz_add(z, z, tmp);         /* z += signed limb[i] */
    }

    mpz_clear(tmp);
}

/* -------------------------------------------------------------
   Demo / single test vector
   -------------------------------------------------------------*/
int main(void)
{
    /* example operands (only limb0 & limb1 used) */
    r30x11 F = { .limb = {  12314,
                            123456789, 
                            0, 
                            0,
                            0,
                            0,
                            0,
                            0,
                            -12314} };
    r30x11 uu = { .limb = { 0x00034502, -987654321 } }; 
    for (size_t i = 2; i < 11; i++)
    {
        uu.limb[i] = 0;
    }
    for (size_t i = 9; i < 11; i++)
    {
        F.limb[i] = 0;
    }

    /* our multiplication */
    r30x11 c = signed_mul(F, uu);

    /* Dump */
    dump11("F", F);
    dump11("uu", uu);
    dump11("F*uu (ours)", c);

    /* GMP verification */
    mpz_t gF, guu, gC, gProd;
    mpz_inits(gF, guu, gC, gProd, NULL);

    r30x11_to_mpz(&F, gF);
    r30x11_to_mpz(&uu, guu);
    gmp_printf("gA = %Zd\n", gF);
    gmp_printf("gB = %Zd\n", guu);
    mpz_mul(gProd, gF, guu);
    r30x11_to_mpz(&c, gC);

    int ok = mpz_cmp(gProd, gC) == 0;
    printf("\nGMP check: %s\n", ok ? "PASS" : "FAIL");

    char *sProd = mpz_get_str(NULL, 10, gProd);
    char *sC    = mpz_get_str(NULL, 10, gC);
    if (!ok) {
        printf("expected = %s\ncalc     = %s\n", sProd, sC);
        free(sProd);
        free(sC);
    } else {
        printf("expected = %s\n", sProd);
    }

    mpz_clears(gF, guu, gC, gProd, NULL);
    return ok ? 0 : 1;
}
