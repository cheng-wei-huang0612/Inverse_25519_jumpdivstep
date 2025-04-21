#ifndef crypto_sign_ed25519_h
#define crypto_sign_ed25519_h

#define crypto_sign_ed25519_keypair lib25519_sign_ed25519_keypair
#define crypto_sign_ed25519 lib25519_sign_ed25519
#define crypto_sign_ed25519_open lib25519_sign_ed25519_open

#define crypto_sign_ed25519_SECRETKEYBYTES 64
#define crypto_sign_ed25519_PUBLICKEYBYTES 32
#define crypto_sign_ed25519_BYTES 64

extern void crypto_sign_ed25519_keypair(unsigned char *,unsigned char *);
extern void crypto_sign_ed25519(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);
extern int crypto_sign_ed25519_open(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);

#endif
