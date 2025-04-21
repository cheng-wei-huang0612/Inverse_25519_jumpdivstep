#ifndef crypto_hash_h
#define crypto_hash_h

#define crypto_hash CRYPTO_NAMESPACE(hash)

#define crypto_hash_sha512_BYTES 64
#define crypto_hash_BYTES 64

extern void crypto_hash(unsigned char *,const unsigned char *,long long);

#endif
