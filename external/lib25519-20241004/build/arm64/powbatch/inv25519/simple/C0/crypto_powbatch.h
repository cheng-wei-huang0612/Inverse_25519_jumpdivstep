#ifndef crypto_powbatch_h
#define crypto_powbatch_h

#define crypto_powbatch CRYPTO_NAMESPACE(powbatch)

#define crypto_powbatch_inv25519_BYTES 32
#define crypto_powbatch_BYTES 32

extern void crypto_powbatch(unsigned char *,const unsigned char *,long long);

#endif
