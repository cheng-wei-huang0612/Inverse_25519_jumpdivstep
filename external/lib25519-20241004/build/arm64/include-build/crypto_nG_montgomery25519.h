#ifndef crypto_nG_montgomery25519_h
#define crypto_nG_montgomery25519_h

#define crypto_nG_montgomery25519 lib25519_nG_montgomery25519

#define crypto_nG_montgomery25519_SCALARBYTES 32
#define crypto_nG_montgomery25519_POINTBYTES 32

extern void crypto_nG_montgomery25519(unsigned char *,const unsigned char *);

#endif
