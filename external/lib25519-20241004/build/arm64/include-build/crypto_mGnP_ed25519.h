#ifndef crypto_mGnP_ed25519_h
#define crypto_mGnP_ed25519_h

#define crypto_mGnP_ed25519 lib25519_mGnP_ed25519

#define crypto_mGnP_ed25519_MBYTES 32
#define crypto_mGnP_ed25519_NBYTES 64
#define crypto_mGnP_ed25519_PBYTES 32
#define crypto_mGnP_ed25519_OUTPUTBYTES 33

extern void crypto_mGnP_ed25519(unsigned char *,const unsigned char *,const unsigned char *,const unsigned char *);

#endif
