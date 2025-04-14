#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <cpucycles.h>
#include <openssl/rand.h>
#include "ecdh.h"
#include "ed255.h"

extern void scalar_mult_var_base(unsigned char *q, const unsigned char *n,
                          const unsigned char *p, const unsigned char *A);

static unsigned char alicepk[256];
static unsigned char alicesk[256];
static unsigned char bobpk[256];
static unsigned char bobsk[256];
static unsigned char charliepk[256];
static unsigned char charliesk[256];

static unsigned char alicebobk[256];
static unsigned char bobalicek[256];
static unsigned char alicecharliek[256];
static unsigned char charliealicek[256];
static unsigned char bobcharliek[256];
static unsigned char charliebobk[256];

static unsigned char message[59];
static unsigned char sig[64];

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

static void x25519_keygen8(unsigned char pk8[256],unsigned char sk8[256])
{
  start("x25519-keygen8-rand");
  RAND_bytes(sk8,256);
  start("x25519-keygen8-pk");
  crypto_x25519_batch_keygen(pk8,sk8);
  start("x25519-keygen8-done");
}

static const unsigned char A[32] = {
        0x06, 0x6D, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

static void x25519_dh(unsigned char k8[256],const unsigned char pk8[256],const unsigned char sk8[256])
{
  start("x25519-dh-main");
  scalar_mult_var_base(k8,sk8,pk8,A);
  start("x25519-dh-done");
}

static void ed25519_keygen8(unsigned char pk8[256],unsigned char sk8[256])
{
  start("ed25519-keygen8-rand");
  RAND_bytes(sk8,256);
  start("ed25519-keygen8-pk");
  crypto_ed25519_batch_keygen(pk8,sk8);
  start("ed25519-keygen8-done");
}

static void ed25519_sign_global(unsigned char pk8[256],unsigned char sk8[256])
{
  start("ed25519-sign-main");
  assert(ed25519_sign(sig,message,59,pk8,sk8) == 1);
  start("ed25519-sign-done");
}

static void ed25519_verify_global(unsigned char pk8[256])
{
  start("ed25519-verify-main");
  assert(ed25519_verify(message,59,pk8,sig) == 1);
  start("ed25519-verify-done");
}

int main()
{
  for (long long loop = 0;loop < 45;++loop) {
    ed25519_keygen8(alicepk,alicesk);
    ed25519_sign_global(alicepk,alicesk);
    ed25519_verify_global(alicepk);
  }

  for (long long loop = 0;loop < 15;++loop) {
    x25519_keygen8(alicepk,alicesk);
    x25519_keygen8(bobpk,bobsk);
    x25519_keygen8(charliepk,charliesk);
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

  statistics("x25519-keygen8-rand");
  statistics("x25519-keygen8-pk");
  statistics("x25519-keygen8-done");

  statistics("x25519-dh-main");
  statistics("x25519-dh-done");

  statistics("ed25519-keygen8-rand");
  statistics("ed25519-keygen8-pk");
  statistics("ed25519-keygen8-done");

  statistics("ed25519-sign-main");
  statistics("ed25519-sign-done");

  statistics("ed25519-verify-main");
  statistics("ed25519-verify-done");

  return 0;
}
