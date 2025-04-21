#ifndef crypto_mGnP_h
#define crypto_mGnP_h

#define crypto_mGnP CRYPTO_NAMESPACE(mGnP)

#define crypto_mGnP_ed25519_MBYTES 32
#define crypto_mGnP_ed25519_NBYTES 64
#define crypto_mGnP_ed25519_PBYTES 32
#define crypto_mGnP_ed25519_OUTPUTBYTES 33
#define crypto_mGnP_MBYTES 32
#define crypto_mGnP_NBYTES 64
#define crypto_mGnP_PBYTES 32
#define crypto_mGnP_OUTPUTBYTES 33

extern void crypto_mGnP(unsigned char *,const unsigned char *,const unsigned char *,const unsigned char *);

#endif
