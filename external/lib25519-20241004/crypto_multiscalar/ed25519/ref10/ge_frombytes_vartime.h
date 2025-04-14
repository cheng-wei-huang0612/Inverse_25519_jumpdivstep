#ifndef ge_frombytes_vartime_h
#define ge_frombytes_vartime_h

#include "ge.h"

#define ge_frombytes_vartime CRYPTO_NAMESPACE(ge_frombytes_vartime)

extern int ge_frombytes_vartime(ge_p3 *,const unsigned char *);

#endif
