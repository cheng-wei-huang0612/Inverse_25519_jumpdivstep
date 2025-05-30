/*
 * Copyright (c) 2024-2025 The mlkem-native project authors
 * SPDX-License-Identifier: Apache-2.0
 */
#include <inttypes.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hal.h"
#include "fe25519.h"
#include "big30.h"
extern void bignum_inv_p25519(uint64_t z[static 4],const uint64_t x[static 4]);


#define NWARMUP 50
#define NITERATIONS 300
#define NTESTS 500

static int cmp_uint64_t(const void *a, const void *b)
{
  return (int)((*((const uint64_t *)a)) - (*((const uint64_t *)b)));
}

static void print_median(const char *txt, uint64_t cyc[NTESTS])
{
  printf("%10s cycles = %" PRIu64 "\n", txt, cyc[NTESTS >> 1] / NITERATIONS);
}

static int percentiles[] = {1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 99};

static void print_percentile_legend(void)
{
  unsigned i;
  printf("%21s", "percentile");
  for (i = 0; i < sizeof(percentiles) / sizeof(percentiles[0]); i++)
  {
    printf("%7d", percentiles[i]);
  }
  printf("\n");
}

static void print_percentiles(const char *txt, uint64_t cyc[NTESTS])
{
  unsigned i;
  printf("%10s percentiles:", txt);
  for (i = 0; i < sizeof(percentiles) / sizeof(percentiles[0]); i++)
  {
    printf("%7" PRIu64, (cyc)[NTESTS * percentiles[i] / 100] / NITERATIONS);
  }
  printf("\n");
}

extern const int16_t zetas_layer12345[];
extern const int16_t zetas_layer67[];
// void ntt_asm(int16_t *, const int16_t *, const int16_t *);


static int bench(void)
{
  fe25519 a = {0};
  uint256_t b = {0};
  int i, j;
  uint64_t t0, t1;
  uint64_t cycles[NTESTS];

  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      fe25519_intmul_invert(&a, &a);
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      fe25519_intmul_invert(&a, &a);
    }
    t1 = get_cyclecounter();
    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("intmul_invert", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("intmul_invert", cycles);

  printf("\n\n\n\n");

  uint64_t s2n_a[4];


  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      bignum_inv_p25519(s2n_a, s2n_a);
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      bignum_inv_p25519(s2n_a, s2n_a);
    }
    t1 = get_cyclecounter();
    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("s2n inversion", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("s2n inversion", cycles);

  printf("\n\n\n\n");

  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      cpt_inv(&b, &b);
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      cpt_inv(&b, &b);
    }
    t1 = get_cyclecounter();
    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("safegcd", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("safegcd", cycles);

  return 0;
}

int main(void)
{
  enable_cyclecounter();
  bench();
  disable_cyclecounter();

  return 0;
}
