#ifndef crypto_hash_sha512_h
#define crypto_hash_sha512_h

#define crypto_hash_sha512 lib25519_hash_sha512

#define crypto_hash_sha512_BYTES 64

extern void crypto_hash_sha512(unsigned char *,const unsigned char *,long long);

#endif
