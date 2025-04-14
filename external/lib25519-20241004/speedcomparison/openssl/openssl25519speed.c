#include <assert.h>
#include <string.h>
#include <cpucycles.h>
#include <openssl/evp.h>
#include <openssl/opensslv.h>

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
  EVP_PKEY *keypair;
  size_t len;
  start("x25519-keygen-main");
  keypair = EVP_PKEY_Q_keygen(0,0,"X25519");
  assert(keypair);
  start("x25519-keygen-pkencode");
  len = 32;
  assert(EVP_PKEY_get_raw_public_key(keypair,pk,&len) == 1);
  assert(len == 32);
  start("x25519-keygen-skencode");
  len = 32;
  assert(EVP_PKEY_get_raw_private_key(keypair,sk,&len) == 1);
  assert(len == 32);
  start("x25519-keygen-free");
  EVP_PKEY_free(keypair);
  start("x25519-keygen-done");
}

static void x25519_dh(unsigned char *k,const unsigned char *pk,const unsigned char *sk)
{
  EVP_PKEY *privatekey;
  EVP_PKEY *publickey;
  EVP_PKEY_CTX *dh;
  size_t len;
  start("x25519-dh-skdecode");
  privatekey = EVP_PKEY_new_raw_private_key(EVP_PKEY_X25519,0,sk,32);
  assert(privatekey);
  start("x25519-dh-pkdecode");
  publickey = EVP_PKEY_new_raw_public_key(EVP_PKEY_X25519,0,pk,32);
  assert(publickey);
  start("x25519-dh-init");
  dh = EVP_PKEY_CTX_new(privatekey,0);
  assert(dh);
  assert(EVP_PKEY_derive_init(dh) == 1);
  assert(EVP_PKEY_derive_set_peer(dh,publickey) == 1);
  len = 32;
  start("x25519-dh-main");
  assert(EVP_PKEY_derive(dh,k,&len) == 1);
  assert(len == 32);
  start("x25519-dh-free");
  EVP_PKEY_CTX_free(dh);
  EVP_PKEY_free(publickey);
  EVP_PKEY_free(privatekey);
  start("x25519-dh-done");
}

static void ed25519_keygen(unsigned char *pk,unsigned char *sk)
{
  EVP_PKEY *keypair;
  size_t len;
  start("ed25519-keygen-main");
  keypair = EVP_PKEY_Q_keygen(0,0,"ED25519");
  assert(keypair);
  start("ed25519-keygen-pkencode");
  len = 32;
  assert(EVP_PKEY_get_raw_public_key(keypair,pk,&len) == 1);
  assert(len == 32);
  start("ed25519-keygen-skencode");
  len = 32;
  assert(EVP_PKEY_get_raw_private_key(keypair,sk,&len) == 1);
  assert(len == 32);
  start("ed25519-keygen-free");
  EVP_PKEY_free(keypair);
  start("ed25519-keygen-done");
}

static void ed25519_sign(const unsigned char *sk)
{
  EVP_PKEY *privatekey;
  EVP_MD_CTX *signer;
  start("ed25519-sign-skdecode");
  privatekey = EVP_PKEY_new_raw_private_key(EVP_PKEY_ED25519,0,sk,32);
  assert(privatekey);
  start("ed25519-sign-init");
  signer = EVP_MD_CTX_new();
  assert(signer);
  assert(EVP_DigestSignInit(signer,0,0,0,privatekey) == 1);
  start("ed25519-sign-main");
  siglen = sizeof sig;
  assert(EVP_DigestSign(signer,sig,&siglen,message,sizeof message) == 1);
  start("ed25519-sign-free");
  EVP_MD_CTX_free(signer);
  EVP_PKEY_free(privatekey);
  start("ed25519-sign-done");
}

static void ed25519_verify(const unsigned char *pk)
{
  EVP_PKEY *publickey;
  EVP_MD_CTX *verifier;
  start("ed25519-verify-pkdecode");
  publickey = EVP_PKEY_new_raw_public_key(EVP_PKEY_ED25519,0,pk,32);
  assert(publickey);
  start("ed25519-verify-init");
  verifier = EVP_MD_CTX_new();
  assert(verifier);
  assert(EVP_DigestVerifyInit(verifier,0,0,0,publickey) == 1);
  start("ed25519-verify-main");
  assert(EVP_DigestVerify(verifier,sig,siglen,message,sizeof message) == 1);
  start("ed25519-verify-free");
  EVP_MD_CTX_free(verifier);
  EVP_PKEY_free(publickey);
  start("ed25519-verify-done");
}

int main()
{
  for (long long loop = 0;loop < 45;++loop) {
    ed25519_keygen(alicepk,alicesk);
    ed25519_sign(alicesk);
    ed25519_verify(alicepk);
  }
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

  printf("openssl version %s\n",OPENSSL_VERSION_TEXT);
  printf("cpucycles persecond %lld\n",cpucycles_persecond());
  printf("cpucycles version %s\n",cpucycles_version());
  printf("cpucycles implementation %s\n",cpucycles_implementation());
  printf("events %lld\n",start_pos);
  
  statistics("x25519-keygen-main");
  statistics("x25519-keygen-pkencode");
  statistics("x25519-keygen-skencode");
  statistics("x25519-keygen-free");
  statistics("x25519-keygen-done");
  statistics("x25519-dh-pkdecode");
  statistics("x25519-dh-skdecode");
  statistics("x25519-dh-init");
  statistics("x25519-dh-main");
  statistics("x25519-dh-free");
  statistics("x25519-dh-done");
  statistics("ed25519-keygen-main");
  statistics("ed25519-keygen-pkencode");
  statistics("ed25519-keygen-skencode");
  statistics("ed25519-keygen-free");
  statistics("ed25519-keygen-done");
  statistics("ed25519-sign-skdecode");
  statistics("ed25519-sign-init");
  statistics("ed25519-sign-main");
  statistics("ed25519-sign-free");
  statistics("ed25519-sign-done");
  statistics("ed25519-verify-pkdecode");
  statistics("ed25519-verify-init");
  statistics("ed25519-verify-main");
  statistics("ed25519-verify-free");
  statistics("ed25519-verify-done");
}
