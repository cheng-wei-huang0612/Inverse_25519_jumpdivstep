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
extern void dummy();

static int bench(void)
{
  // big30_t V, S;
  // int64_t uuvvrrss[4] = {0, 0, 0, 0};
  int64_t delta = 0;
  big30_t F, G, V, S;
  int64_t uuvvrrss[4];
  int i, j;
  uint64_t t0, t1;
  uint64_t cycles[NTESTS];

  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      dummy(&delta, &F, &G, &V, &S, uuvvrrss);
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      dummy(&delta, &F, &G, &V, &S, uuvvrrss);
    }
    t1 = get_cyclecounter();
    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("dummy", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("dummy", cycles);


  return 0;
}

int main(void)
{
  enable_cyclecounter();
  bench();
  disable_cyclecounter();

  return 0;
}
