#ifndef crypto_hashblocks_sha512_h
#define crypto_hashblocks_sha512_h

#define crypto_hashblocks_sha512 lib25519_hashblocks_sha512

#define crypto_hashblocks_sha512_STATEBYTES 64
#define crypto_hashblocks_sha512_BLOCKBYTES 128

extern int crypto_hashblocks_sha512(unsigned char *,const unsigned char *,long long);

#endif
