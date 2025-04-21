#ifndef crypto_multiscalar_h
#define crypto_multiscalar_h

#define crypto_multiscalar CRYPTO_NAMESPACE(multiscalar)

#define crypto_multiscalar_ed25519_SCALARBYTES 32
#define crypto_multiscalar_ed25519_POINTBYTES 32
#define crypto_multiscalar_ed25519_OUTPUTBYTES 33
#define crypto_multiscalar_SCALARBYTES 32
#define crypto_multiscalar_POINTBYTES 32
#define crypto_multiscalar_OUTPUTBYTES 33

extern void crypto_multiscalar(unsigned char *,const unsigned char *,const unsigned char *,long long);

#endif
