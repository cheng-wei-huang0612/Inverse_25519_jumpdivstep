#ifndef crypto_nPbatch_montgomery25519_h
#define crypto_nPbatch_montgomery25519_h

#define crypto_nPbatch_montgomery25519 lib25519_nPbatch_montgomery25519

#define crypto_nPbatch_montgomery25519_SCALARBYTES 32
#define crypto_nPbatch_montgomery25519_POINTBYTES 32

extern void crypto_nPbatch_montgomery25519(unsigned char *,const unsigned char *,const unsigned char *,long long);

#endif
