#include "crypto_nP_montgomery25519.h"
#include "crypto_nPbatch.h"
#include "mont25519_batch.h"

void crypto_nPbatch(unsigned char *nP,
  const unsigned char *n,
  const unsigned char *P,
  long long batch
  )
{
  while (batch >= 8) {
    crypto_nP_8x1((void *) nP,(void *) n,(void *) P);
    nP += 32*8;
    n += 32*8;
    P += 32*8;
    batch -= 8;
  }
  while (batch > 0) {
    crypto_nP_montgomery25519(nP,n,P);
    nP += 32;
    n += 32;
    P += 32;
    --batch;
  }
}
