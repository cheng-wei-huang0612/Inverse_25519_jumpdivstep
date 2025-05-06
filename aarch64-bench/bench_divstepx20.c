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

#define NWARMUP 10
#define NITERATIONS 10
// #define NITERATIONS 500
#define NTESTS 1000

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

extern void divstepx20(int64_t *delta, int64_t *f, int64_t *g);

static int bench(void)
{

  int64_t f, g, delta;


  int i, j;
  uint64_t t0, t1;
  uint64_t cycles[NTESTS];

  for (i = 0; i < NTESTS; i++)
  {
    t0 = get_cyclecounter();

    for(int k=0;k<500;k++) __asm__ volatile("");

    t1 = get_cyclecounter();

    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("empty", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("empty", cycles);


  printf("\n\n\n\n");

  for (i = 0; i < NTESTS; i++)
  {
    // for (j = 0; j < NWARMUP; j++)
    // {
    //   divstepx20(&delta, &f, &g);
    // }
    for (volatile int k = 0; k < 32768; k++) __asm__ volatile("nop");

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      divstepx20(&delta, &f, &g);
    }
    t1 = get_cyclecounter();
    cycles[i] = t1 - t0;
  }

  qsort(cycles, NTESTS, sizeof(uint64_t), cmp_uint64_t);

  print_median("divstepx20", cycles);

  printf("\n");

  print_percentile_legend();

  print_percentiles("divstepx20", cycles);


  printf("\n\n\n\n");

  return 0;
}

int main(void)
{
  enable_cyclecounter();
  bench();
  disable_cyclecounter();

  return 0;
}
