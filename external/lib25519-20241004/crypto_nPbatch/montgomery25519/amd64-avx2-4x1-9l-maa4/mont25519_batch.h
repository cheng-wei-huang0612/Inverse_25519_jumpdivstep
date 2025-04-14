// curve operations

#ifndef __MONT25519_4x1_H__
#define __MONT25519_4x1_H__

#include "crypto_uint64_vec4x1.h"

#define CRYPTO_BYTES 32

#define mladder_4x1 CRYPTO_SHARED_NAMESPACE(mladder_4x1)
#define crypto_nP_4x1 CRYPTO_NAMESPACE(crypto_nP_4x1)

extern void mladder_4x1(crypto_uint64_vec4x1 *, const crypto_uint64_vec4x1 *, const crypto_uint64_vec4x1 *);
int crypto_nP_4x1(unsigned char [4][CRYPTO_BYTES], const unsigned char [4][CRYPTO_BYTES], const unsigned char [4][CRYPTO_BYTES]);

#endif


