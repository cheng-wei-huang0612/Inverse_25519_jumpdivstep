#ifndef crypto_dh_x25519_h
#define crypto_dh_x25519_h

#define crypto_dh_x25519_keypair lib25519_dh_x25519_keypair
#define crypto_dh_x25519 lib25519_dh_x25519

#define crypto_dh_x25519_SECRETKEYBYTES 32
#define crypto_dh_x25519_PUBLICKEYBYTES 32
#define crypto_dh_x25519_BYTES 32

extern void crypto_dh_x25519_keypair(unsigned char *,unsigned char *);
extern void crypto_dh_x25519(unsigned char *,const unsigned char *,const unsigned char *);

#endif
