#ifndef crypto_declassify_h
#define crypto_declassify_h

#include <valgrind/memcheck.h>

#define crypto_declassify_uses_valgrind 1

static void crypto_declassify(void *crypto_declassify_v,long long crypto_declassify_vlen) {
  VALGRIND_MAKE_MEM_DEFINED(crypto_declassify_v,crypto_declassify_vlen);
}

#endif
