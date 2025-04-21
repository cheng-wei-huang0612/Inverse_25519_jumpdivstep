#ifndef crypto_sign_h
#define crypto_sign_h

#define crypto_sign_keypair CRYPTO_NAMESPACE(sign_keypair)
#define crypto_sign CRYPTO_NAMESPACE(sign)
#define crypto_sign_open CRYPTO_NAMESPACE(sign_open)

#define crypto_sign_ed25519_SECRETKEYBYTES 64
#define crypto_sign_ed25519_PUBLICKEYBYTES 32
#define crypto_sign_ed25519_BYTES 64
#define crypto_sign_SECRETKEYBYTES 64
#define crypto_sign_PUBLICKEYBYTES 32
#define crypto_sign_BYTES 64

extern void crypto_sign_keypair(unsigned char *,unsigned char *);
extern void crypto_sign(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);
extern int crypto_sign_open(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);

#endif
