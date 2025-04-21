#ifndef crypto_multiscalar_ed25519_h
#define crypto_multiscalar_ed25519_h

#define crypto_multiscalar_ed25519 lib25519_multiscalar_ed25519

#define crypto_multiscalar_ed25519_SCALARBYTES 32
#define crypto_multiscalar_ed25519_POINTBYTES 32
#define crypto_multiscalar_ed25519_OUTPUTBYTES 33

extern void crypto_multiscalar_ed25519(unsigned char *,const unsigned char *,const unsigned char *,long long);

#endif
