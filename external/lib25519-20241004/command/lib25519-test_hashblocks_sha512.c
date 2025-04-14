/* ----- hashblocks/sha512, derived from supercop/crypto_hashblocks/try.c */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <lib25519.h>
#include "lib25519_test.h"

#define fail ((ok = 0),printf)
static const char *hashblocks_sha512_checksums[] = {
  "f0bc623a9033f9f648336540e11e85be21aeb60905c7d8808d10ea20b39d58d1",
  "f1a2c46c9ce7fa4cd22f180907d77b6f7189badef4b9a1b5284d6fb9db859b76",
} ;

static int (*crypto_hashblocks)(unsigned char *,const unsigned char *,long long);
#define crypto_hashblocks_STATEBYTES lib25519_hashblocks_sha512_STATEBYTES
#define crypto_hashblocks_BLOCKBYTES lib25519_hashblocks_sha512_BLOCKBYTES

static void *storage_hashblocks_sha512_h;
static unsigned char *test_hashblocks_sha512_h;
static void *storage_hashblocks_sha512_m;
static unsigned char *test_hashblocks_sha512_m;
static void *storage_hashblocks_sha512_h2;
static unsigned char *test_hashblocks_sha512_h2;
static void *storage_hashblocks_sha512_m2;
static unsigned char *test_hashblocks_sha512_m2;

static void test_hashblocks_sha512_impl(long long impl)
{
  unsigned char *h = test_hashblocks_sha512_h;
  unsigned char *m = test_hashblocks_sha512_m;
  unsigned char *h2 = test_hashblocks_sha512_h2;
  unsigned char *m2 = test_hashblocks_sha512_m2;
  long long hlen = crypto_hashblocks_STATEBYTES;
  long long mlen;

  if (targeti && strcmp(targeti,".") && strcmp(targeti,lib25519_dispatch_hashblocks_sha512_implementation(impl))) return;
  if (targetn && atol(targetn) != impl) return;
  if (impl >= 0) {
    crypto_hashblocks = lib25519_dispatch_hashblocks_sha512(impl);
    printf("hashblocks_sha512 %lld implementation %s compiler %s\n",impl,lib25519_dispatch_hashblocks_sha512_implementation(impl),lib25519_dispatch_hashblocks_sha512_compiler(impl));
  } else {
    crypto_hashblocks = lib25519_hashblocks_sha512;
    printf("hashblocks_sha512 selected implementation %s compiler %s\n",lib25519_hashblocks_sha512_implementation(),lib25519_hashblocks_sha512_compiler());
  }
  for (long long checksumbig = 0;checksumbig < 2;++checksumbig) {
    long long loops = checksumbig ? 32768 : 4096;
    long long maxtest = checksumbig ? 4096 : 128;

    checksum_clear();

    for (long long loop = 0;loop < loops;++loop) {
      int result;
      mlen = myrandom() % (maxtest + 1);

      input_prepare(m2,m,mlen);
      input_prepare(h2,h,hlen);
      secret(m,mlen);
      secret(h,hlen);
      result = crypto_hashblocks(h,m,mlen);
      public(&result,sizeof result);
      if (result != mlen % crypto_hashblocks_BLOCKBYTES) fail("failure: crypto_hashblocks returns unexpected value\n");
      public(m,mlen);
      public(h,hlen);
      checksum(h,hlen);
      output_compare(h2,h,hlen,"crypto_hashblocks");
      input_compare(m2,m,mlen,"crypto_hashblocks");

      double_canary(h2,h,hlen);
      double_canary(m2,m,mlen);
      secret(m2,mlen);
      secret(h2,hlen);
      result = crypto_hashblocks(h2,m2,mlen);
      public(&result,sizeof result);
      if (result != mlen % crypto_hashblocks_BLOCKBYTES) fail("failure: crypto_hashblocks returns unexpected value\n");
      public(m2,mlen);
      public(h2,hlen);
      if (memcmp(h2,h,hlen) != 0) fail("failure: crypto_hashblocks is nondeterministic\n");
    }
    checksum_expected(hashblocks_sha512_checksums[checksumbig]);
  }
}

void test_hashblocks_sha512(void)
{
  long long maxalloc = 0;
  if (targeto && strcmp(targeto,"hashblocks")) return;
  if (targetp && strcmp(targetp,"sha512")) return;
  storage_hashblocks_sha512_h = callocplus(crypto_hashblocks_STATEBYTES);
  test_hashblocks_sha512_h = aligned(storage_hashblocks_sha512_h,crypto_hashblocks_STATEBYTES);
  if (crypto_hashblocks_STATEBYTES > maxalloc) maxalloc = crypto_hashblocks_STATEBYTES;
  storage_hashblocks_sha512_m = callocplus(4096);
  test_hashblocks_sha512_m = aligned(storage_hashblocks_sha512_m,4096);
  if (4096 > maxalloc) maxalloc = 4096;
  storage_hashblocks_sha512_h2 = callocplus(maxalloc);
  test_hashblocks_sha512_h2 = aligned(storage_hashblocks_sha512_h2,crypto_hashblocks_STATEBYTES);
  storage_hashblocks_sha512_m2 = callocplus(maxalloc);
  test_hashblocks_sha512_m2 = aligned(storage_hashblocks_sha512_m2,4096);

  for (long long offset = 0;offset < 2;++offset) {
    if (targetoffset && atol(targetoffset) != offset) continue;
    if (offset && valgrind) break;
    printf("hashblocks_sha512 offset %lld\n",offset);
    for (long long impl = -1;impl < lib25519_numimpl_hashblocks_sha512();++impl)
      forked(test_hashblocks_sha512_impl,impl);
    ++test_hashblocks_sha512_h;
    ++test_hashblocks_sha512_m;
    ++test_hashblocks_sha512_h2;
    ++test_hashblocks_sha512_m2;
  }
  free(storage_hashblocks_sha512_m2);
  free(storage_hashblocks_sha512_h2);
  free(storage_hashblocks_sha512_m);
  free(storage_hashblocks_sha512_h);
}
#undef crypto_hashblocks_STATEBYTES
#undef crypto_hashblocks_BLOCKBYTES

