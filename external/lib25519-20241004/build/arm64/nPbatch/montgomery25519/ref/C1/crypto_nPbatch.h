#ifndef crypto_nPbatch_h
#define crypto_nPbatch_h

#define crypto_nPbatch CRYPTO_NAMESPACE(nPbatch)

#define crypto_nPbatch_montgomery25519_SCALARBYTES 32
#define crypto_nPbatch_montgomery25519_POINTBYTES 32
#define crypto_nPbatch_SCALARBYTES 32
#define crypto_nPbatch_POINTBYTES 32

extern void crypto_nPbatch(unsigned char *,const unsigned char *,const unsigned char *,long long);

#endif
