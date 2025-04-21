#ifndef crypto_nP_h
#define crypto_nP_h

#define crypto_nP CRYPTO_NAMESPACE(nP)

#define crypto_nP_montgomery25519_SCALARBYTES 32
#define crypto_nP_montgomery25519_POINTBYTES 32
#define crypto_nP_SCALARBYTES 32
#define crypto_nP_POINTBYTES 32

extern void crypto_nP(unsigned char *,const unsigned char *,const unsigned char *);

#endif
