#include "crypto_multiscalar.h"

#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"
#include "crypto_verify_32.h"
#include "ge25519_unpack.h"

// warning: these constants are not encapsulated
#define P_WINDOWSIZE 5
#define P_MULTIPLES (1<<(P_WINDOWSIZE-2))

static void ge25519_sub(ge25519_p3 *r, const ge25519_p3 *p, const ge25519_p3 *q)
{
  ge25519_p3 qneg;
  fe25519_neg(&qneg.x,&q->x);
  fe25519_neg(&qneg.t,&q->t);
  qneg.y = q->y;
  qneg.z = q->z;
  ge25519_add(r,p,&qneg);
}

static void ge25519_multi_scalarmult_precompute(ge25519_p3 *cP, const ge25519_p3 *P, unsigned long long multiples)
{
  CRYPTO_ALIGN(32) ge25519_p3 twoP;

  ge25519_double(&twoP,P);
  cP[0] = *P;
  for (long long i = 0;i < multiples-1;++i)
    ge25519_add(&cP[i+1],&twoP,&cP[i]);
}

static void ge25519_p3_0(ge25519_p3 *r)
{
  fe25519_setint(&r->x,0);
  fe25519_setint(&r->y,1);
  fe25519_setint(&r->z,1);
  fe25519_setint(&r->t,0);
}

static void ge25519_multi_scalarmult_process(ge25519_p3 *r, const signed char (*nslide)[256], const ge25519_p3 (*cP)[P_MULTIPLES], long long num)
{
  int maybenonzero = 0;

  ge25519_p3_0(r);

  for (long long i = 255;i >= 0;--i) {
    if (maybenonzero)
      ge25519_double(r,r);

    for (long long j = 0;j < num;++j) {
      signed char c = nslide[j][i];
      if (c == 0) continue;
      maybenonzero = 1;
      if (c > 0)
        ge25519_add(r,r,&cP[j][c/2]);
      else
        ge25519_sub(r,r,&cP[j][-c/2]);
    }
  }
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
  CRYPTO_ALIGN(32) ge25519_p3 bigresult;

  ge25519_p3_0(&bigresult);

  while (len > 0) {
    signed char nslide[MAXTODO][256];
    CRYPTO_ALIGN(32)
    ge25519_p3 cP[MAXTODO][P_MULTIPLES]; /* P,3P,5P,7P,9P,11P,13P,15P */

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

    {
     CRYPTO_ALIGN(32) ge25519_p3 u;
      ge25519_multi_scalarmult_process(&u,nslide,cP,todo);
      ge25519_add(&bigresult,&bigresult,&u);
    }
  }

  ge25519_pack(Q,(ge25519_p2 *) &bigresult);
  Q[32] = ok;
}
