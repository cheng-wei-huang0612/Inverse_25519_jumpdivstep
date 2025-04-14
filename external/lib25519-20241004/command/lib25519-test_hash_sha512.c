/* ----- hash/sha512, derived from supercop/crypto_hash/try.c */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <lib25519.h>
#include "lib25519_test.h"

#define fail ((ok = 0),printf)
static const char *hash_sha512_checksums[] = {
  "8220572f58bd4730be165c9739d8d4b0fd2e0229dbe01e25b4aed23f00f23b70",
  "c1e322b7cbfc941260c5508967ba05bce22eeee94d425e708b7c3301ea1d5e2e",
} ;

static void (*crypto_hash)(unsigned char *,const unsigned char *,long long);
#define crypto_hash_BYTES lib25519_hash_sha512_BYTES

static void *storage_hash_sha512_h;
static unsigned char *test_hash_sha512_h;
static void *storage_hash_sha512_m;
static unsigned char *test_hash_sha512_m;
static void *storage_hash_sha512_h2;
static unsigned char *test_hash_sha512_h2;
static void *storage_hash_sha512_m2;
static unsigned char *test_hash_sha512_m2;

static void test_hash_sha512_impl(long long impl)
{
  unsigned char *h = test_hash_sha512_h;
  unsigned char *m = test_hash_sha512_m;
  unsigned char *h2 = test_hash_sha512_h2;
  unsigned char *m2 = test_hash_sha512_m2;
  long long hlen = crypto_hash_BYTES;
  long long mlen;

  if (targeti && strcmp(targeti,".") && strcmp(targeti,lib25519_dispatch_hash_sha512_implementation(impl))) return;
  if (targetn && atol(targetn) != impl) return;
  if (impl >= 0) {
    crypto_hash = lib25519_dispatch_hash_sha512(impl);
    printf("hash_sha512 %lld implementation %s compiler %s\n",impl,lib25519_dispatch_hash_sha512_implementation(impl),lib25519_dispatch_hash_sha512_compiler(impl));
  } else {
    crypto_hash = lib25519_hash_sha512;
    printf("hash_sha512 selected implementation %s compiler %s\n",lib25519_hash_sha512_implementation(),lib25519_hash_sha512_compiler());
  }
  for (long long checksumbig = 0;checksumbig < 2;++checksumbig) {
    long long loops = checksumbig ? 512 : 64;
    long long maxtest = checksumbig ? 4096 : 128;

    checksum_clear();

    for (long long loop = 0;loop < loops;++loop) {
      mlen = myrandom() % (maxtest + 1);

      output_prepare(h2,h,hlen);
      input_prepare(m2,m,mlen);
      secret(m,mlen);
      crypto_hash(h,m,mlen);
      public(m,mlen);
      public(h,hlen);
      checksum(h,hlen);
      output_compare(h2,h,hlen,"crypto_hash");
      input_compare(m2,m,mlen,"crypto_hash");

      double_canary(h2,h,hlen);
      double_canary(m2,m,mlen);
      secret(m2,mlen);
      crypto_hash(h2,m2,mlen);
      public(m2,mlen);
      public(h2,hlen);
      if (memcmp(h2,h,hlen) != 0) fail("failure: crypto_hash is nondeterministic\n");

      double_canary(h2,h,hlen);
      double_canary(m2,m,mlen);
      secret(m2,mlen);
      crypto_hash(m2,m2,mlen);
      public(m2,hlen);
      if (memcmp(m2,h,hlen) != 0) fail("failure: crypto_hash does not handle m=h overlap\n");
      memcpy(m2,m,mlen);
    }
    checksum_expected(hash_sha512_checksums[checksumbig]);
  }
}

void test_hash_sha512(void)
{
  long long maxalloc = 0;
  if (targeto && strcmp(targeto,"hash")) return;
  if (targetp && strcmp(targetp,"sha512")) return;
  storage_hash_sha512_h = callocplus(crypto_hash_BYTES);
  test_hash_sha512_h = aligned(storage_hash_sha512_h,crypto_hash_BYTES);
  if (crypto_hash_BYTES > maxalloc) maxalloc = crypto_hash_BYTES;
  storage_hash_sha512_m = callocplus(4096+crypto_hash_BYTES);
  test_hash_sha512_m = aligned(storage_hash_sha512_m,4096+crypto_hash_BYTES);
  if (4096+crypto_hash_BYTES > maxalloc) maxalloc = 4096+crypto_hash_BYTES;
  storage_hash_sha512_h2 = callocplus(maxalloc);
  test_hash_sha512_h2 = aligned(storage_hash_sha512_h2,crypto_hash_BYTES);
  storage_hash_sha512_m2 = callocplus(maxalloc);
  test_hash_sha512_m2 = aligned(storage_hash_sha512_m2,4096+crypto_hash_BYTES);

  for (long long offset = 0;offset < 2;++offset) {
    if (targetoffset && atol(targetoffset) != offset) continue;
    if (offset && valgrind) break;
    printf("hash_sha512 offset %lld\n",offset);
    for (long long impl = -1;impl < lib25519_numimpl_hash_sha512();++impl)
      forked(test_hash_sha512_impl,impl);
    ++test_hash_sha512_h;
    ++test_hash_sha512_m;
    ++test_hash_sha512_h2;
    ++test_hash_sha512_m2;
  }
  free(storage_hash_sha512_m2);
  free(storage_hash_sha512_h2);
  free(storage_hash_sha512_m);
  free(storage_hash_sha512_h);
}
#undef crypto_hash_BYTES

