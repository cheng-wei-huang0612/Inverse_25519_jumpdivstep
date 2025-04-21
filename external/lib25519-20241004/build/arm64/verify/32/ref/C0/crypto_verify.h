#ifndef crypto_verify_h
#define crypto_verify_h

#define crypto_verify CRYPTO_NAMESPACE(verify)

#define crypto_verify_32_BYTES 32
#define crypto_verify_BYTES 32

extern int crypto_verify(const unsigned char *,const unsigned char *);

#endif
