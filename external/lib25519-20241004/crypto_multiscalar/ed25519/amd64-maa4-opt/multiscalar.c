#include "crypto_multiscalar.h"

#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"
#include "crypto_verify_32.h"
#include "ge25519_unpack.h"

// warning: these constants are not encapsulated
#define P_WINDOWSIZE 5
#define P_MULTIPLES (1<<(P_WINDOWSIZE-2))

#define ge25519_multi_scalarmult_precompute ge25519_double_scalarmult_precompute

static void ge25519_p1p1_0(ge25519_p1p1 *r)
{
  fe25519_setint(&r->x,0);
  fe25519_setint(&r->y,1);
  fe25519_setint(&r->z,1);
  fe25519_setint(&r->t,1);
}

#define MAXTODO 16

void crypto_multiscalar(
  unsigned char *Q,
  const unsigned char *n,
  const unsigned char *P,
  long long len
)
{
  int ok = 1;
  ge25519_p1p1 bigresult;

  ge25519_p1p1_0(&bigresult);

  while (len > 0) {
    signed char nslide[MAXTODO][256];
    ge25519_pniels cP[MAXTODO][P_MULTIPLES]; /* P,3P,5P,7P,9P,11P,13P,15P */

    long long todo = MAXTODO;
    if (len < todo) todo = len;

    for (long long j = 0;j < todo;++j) {
      sc25519 nj;
      unsigned char njcheck[32];
      ge25519_p3 Pj;

      sc25519_from32bytes(&nj,n);
      sc25519_to32bytes(njcheck,&nj);
      if (crypto_verify_32(njcheck,n)) ok = 0;
      sc25519_slide(nslide[j],&nj,P_WINDOWSIZE);

      ok &= ge25519_unpack_vartime(&Pj,P);
      ge25519_multi_scalarmult_precompute(cP[j],&Pj,P_MULTIPLES);

      P += 32;
      n += 32;
      --len;
    }

      ge25519_multi_scalarmult_process(&bigresult,nslide,cP,todo,P_MULTIPLES);

  }

  {
    ge25519_p2 t;

    ge25519_p1p1_to_p2(&t,&bigresult);
    ge25519_pack(Q,&t);
    Q[32] = ok;
  }
}
