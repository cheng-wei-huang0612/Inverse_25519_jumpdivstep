#ifndef crypto_nG_h
#define crypto_nG_h

#define crypto_nG CRYPTO_NAMESPACE(nG)

#define crypto_nG_montgomery25519_SCALARBYTES 32
#define crypto_nG_montgomery25519_POINTBYTES 32
#define crypto_nG_SCALARBYTES 32
#define crypto_nG_POINTBYTES 32

extern void crypto_nG(unsigned char *,const unsigned char *);

#endif
