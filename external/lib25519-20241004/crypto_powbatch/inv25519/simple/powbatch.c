#include "crypto_pow_inv25519.h"
#include "crypto_powbatch.h"

void crypto_powbatch(unsigned char *y,
  const unsigned char *x,
  long long batch
  )
{
  while (batch > 0) {
    crypto_pow_inv25519(y,x);
    y += 32;
    x += 32;
    --batch;
  }
}
