#include "crypto_nP_montgomery25519.h"
#include "crypto_nPbatch.h"

void crypto_nPbatch(unsigned char *nP,
  const unsigned char *n,
  const unsigned char *P,
  long long batch
  )
{
  while (batch > 0) {
    crypto_nP_montgomery25519(nP,n,P);
    nP += 32;
    n += 32;
    P += 32;
    --batch;
  }
}
