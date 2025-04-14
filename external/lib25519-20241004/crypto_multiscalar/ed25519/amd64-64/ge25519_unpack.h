#ifndef ge25519_unpack_h
#define ge25519_unpack_h

#include "ge25519.h"

#define ge25519_unpack_vartime         CRYPTO_NAMESPACE(unpack_vartime)

extern int ge25519_unpack_vartime(ge25519 *r, const unsigned char p[32]);

#endif
