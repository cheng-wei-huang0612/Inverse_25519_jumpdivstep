// curve operations

#ifndef __MONT25519_8x1_H__
#define __MONT25519_8x1_H__

#include "crypto_uint64_vec8x1.h"

#define CRYPTO_BYTES 32

#define mladder_8x1 CRYPTO_SHARED_NAMESPACE(mladder_8x1)
#define crypto_nP_8x1 CRYPTO_NAMESPACE(crypto_nP_8x1)

extern void mladder_8x1(crypto_uint64_vec8x1 *, const crypto_uint64_vec8x1 *, const crypto_uint64_vec8x1 *);
int crypto_nP_8x1(unsigned char [8][CRYPTO_BYTES], const unsigned char [8][CRYPTO_BYTES], const unsigned char [8][CRYPTO_BYTES]);

#endif


