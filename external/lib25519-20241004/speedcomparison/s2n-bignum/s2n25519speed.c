#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <cpucycles.h>
#include <randombytes.h>
#include <inttypes.h>
#include "s2n-bignum.h"

static unsigned char alicepk[32];
static unsigned char alicesk[32];
static unsigned char bobpk[32];
static unsigned char bobsk[32];
static unsigned char charliepk[32];
static unsigned char charliesk[32];

static unsigned char alicebobk[32];
static unsigned char bobalicek[32];
static unsigned char alicecharliek[32];
static unsigned char charliealicek[32];
static unsigned char bobcharliek[32];
static unsigned char charliebobk[32];

static unsigned char message[59];
static unsigned char sig[64]; static size_t siglen;

#define MAXEVENTS 16384
static long long start_pos;
static const char *start_event[MAXEVENTS];
static long long start_timestamp[MAXEVENTS];

static inline void start(const char *e)
{
  if (start_pos < MAXEVENTS) {
    start_event[start_pos] = e;
    start_timestamp[start_pos] = cpucycles();
    ++start_pos;
  }
}

static long long statistics_interval[MAXEVENTS];

static void statistics(const char *e)
{
  long long nume = 0;
  long long median = 0;

  printf("%s",e);

  for (long long j = 0;j+1 < start_pos;++j)
    if (!strcmp(e,start_event[j])) {
      statistics_interval[nume++] = start_timestamp[j+1]-start_timestamp[j];
    }
  assert(nume&1);

  for (long long j = 0;j < nume;++j) {
    long long below = 0;
    long long above = 0;
    long long maybemedian = statistics_interval[j];
    for (long long i = 0;i < nume;++i) if (statistics_interval[i] < maybemedian) ++below;
    for (long long i = 0;i < nume;++i) if (statistics_interval[i] > maybemedian) ++above;
    if (below*2 < nume && above*2 < nume) {
      median = maybemedian;
      break;
    }
  }
  printf(" %lld ",median);
  for (long long i = 0;i < nume;++i)
    printf("%+lld",statistics_interval[i]-median);
  printf("\n");
  fflush(stdout);
}

static void x25519_keygen(unsigned char *pk,unsigned char *sk)
{
  start("x25519-keygen");
  randombytes(sk,32);
  curve25519_x25519base_byte(pk,sk);
  start("x25519-keygen-done");
}

static void x25519_dh(unsigned char *k,const unsigned char *pk,const unsigned char *sk)
{
  start("x25519-dh");
  curve25519_x25519_byte(k,(void *) sk,(void *) pk);
  start("x25519-dh-done");
}

int main()
{
  for (long long loop = 0;loop < 15;++loop) {
    x25519_keygen(alicepk,alicesk);
    x25519_keygen(bobpk,bobsk);
    x25519_keygen(charliepk,charliesk);
    x25519_dh(alicebobk,bobpk,alicesk);
    x25519_dh(alicecharliek,charliepk,alicesk);
    x25519_dh(bobcharliek,charliepk,bobsk);
    x25519_dh(bobalicek,alicepk,bobsk);
    x25519_dh(charliealicek,alicepk,charliesk);
    x25519_dh(charliebobk,bobpk,charliesk);
    assert(!memcmp(alicebobk,bobalicek,sizeof(alicebobk)));
    assert(!memcmp(alicecharliek,charliealicek,sizeof(alicecharliek)));
    assert(!memcmp(bobcharliek,charliebobk,sizeof(bobcharliek)));
    x25519_dh(charliebobk,bobpk,charliesk);
  }
  start("timestampsdone");

  printf("cpucycles persecond %lld\n",cpucycles_persecond());
  printf("cpucycles version %s\n",cpucycles_version());
  printf("cpucycles implementation %s\n",cpucycles_implementation());
  printf("events %lld\n",start_pos);
  
  statistics("x25519-keygen");
  statistics("x25519-keygen-done");
  statistics("x25519-dh");
  statistics("x25519-dh-done");
}
