#ifndef crypto_pow_h
#define crypto_pow_h

#define crypto_pow CRYPTO_NAMESPACE(pow)

#define crypto_pow_inv25519_BYTES 32
#define crypto_pow_BYTES 32

extern void crypto_pow(unsigned char *,const unsigned char *);

#endif
