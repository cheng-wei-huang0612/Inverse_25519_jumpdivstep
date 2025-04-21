#ifndef crypto_hashblocks_h
#define crypto_hashblocks_h

#define crypto_hashblocks CRYPTO_NAMESPACE(hashblocks)

#define crypto_hashblocks_sha512_STATEBYTES 64
#define crypto_hashblocks_sha512_BLOCKBYTES 128
#define crypto_hashblocks_STATEBYTES 64
#define crypto_hashblocks_BLOCKBYTES 128

extern int crypto_hashblocks(unsigned char *,const unsigned char *,long long);

#endif
