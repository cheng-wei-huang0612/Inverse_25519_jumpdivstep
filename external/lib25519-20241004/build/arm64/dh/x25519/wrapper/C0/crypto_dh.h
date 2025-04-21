#ifndef crypto_dh_h
#define crypto_dh_h

#define crypto_dh_keypair CRYPTO_NAMESPACE(dh_keypair)
#define crypto_dh CRYPTO_NAMESPACE(dh)

#define crypto_dh_x25519_SECRETKEYBYTES 32
#define crypto_dh_x25519_PUBLICKEYBYTES 32
#define crypto_dh_x25519_BYTES 32
#define crypto_dh_SECRETKEYBYTES 32
#define crypto_dh_PUBLICKEYBYTES 32
#define crypto_dh_BYTES 32

extern void crypto_dh_keypair(unsigned char *,unsigned char *);
extern void crypto_dh(unsigned char *,const unsigned char *,const unsigned char *);

#endif
