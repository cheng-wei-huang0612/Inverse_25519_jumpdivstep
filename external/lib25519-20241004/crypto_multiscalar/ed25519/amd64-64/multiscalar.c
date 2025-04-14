#include "crypto_multiscalar.h"

#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"
#include "crypto_verify_32.h"
#include "ge25519_unpack.h"

// warning: these constants are not encapsulated
#define P_WINDOWSIZE 5
#define P_MULTIPLES (1<<(P_WINDOWSIZE-2))

static const fe25519 ec2d = {{0xEBD69B9426B2F146, 0x00E0149A8283B156, 0x198E80F2EEF3D130, 0xA406D9DC56DFFCE7}};

static void ge25519_pnielssub_p1p1(ge25519_p1p1 *r,const ge25519_p3 *p,const ge25519_pniels *q)
{
  ge25519_pniels neg;
  fe25519 d;

  neg = *q;
  d = neg.ysubx;
  neg.ysubx = neg.xaddy;
  neg.xaddy = d;
  fe25519_neg(&neg.t2d, &neg.t2d);
  ge25519_pnielsadd_p1p1(r, p, &neg);
}

static void ge25519_p3_to_cached(ge25519_pniels *r,const ge25519_p3 *p)
{
  fe25519_add(&r->xaddy,&p->x,&p->y);
  fe25519_sub(&r->ysubx,&p->y,&p->x);
  r->z = p->z;
  fe25519_mul(&r->t2d,&p->t,&ec2d);
}

static void ge25519_double_scalarmult_precompute(ge25519_pniels *cP, const ge25519_p3 *P, unsigned long long multiples)
{
  ge25519_p3 twoP;
  ge25519_p3 d1;
  ge25519_p1p1 t;

  ge25519_dbl_p1p1(&t,(ge25519_p2 *)P);
  ge25519_p1p1_to_p3(&twoP,&t);

  ge25519_p3_to_cached(cP,P);

  for (long long i = 0;i < multiples-1;++i) {
    ge25519_pnielsadd_p1p1(&t,&twoP,&cP[i]);
    ge25519_p1p1_to_p3(&d1,&t);
    ge25519_p3_to_cached(&cP[i+1],&d1);
  }
}

static void ge25519_p1p1_0(ge25519_p1p1 *r)
{
  fe25519_setint(&r->x,0);
  fe25519_setint(&r->y,1);
  fe25519_setint(&r->z,1);
  fe25519_setint(&r->t,1);
}

static void ge25519_double_scalarmult_process(ge25519_p3 *r, const signed char (*nslide)[256], const ge25519_pniels (*cP)[P_MULTIPLES], long long num)
{
  ge25519_p1p1 p1p1;
  ge25519_p2 p2;
  ge25519_p3 p3;
  int maybenonzero = 0;

  ge25519_p1p1_0(&p1p1);

  for (long long i = 255;i >= 0;--i) {
    if (maybenonzero) {
      ge25519_p1p1_to_p2(&p2,&p1p1);
      ge25519_dbl_p1p1(&p1p1,&p2);
    }

    for (long long j = 0;j < num;++j) {
      signed char c = nslide[j][i];
      if (c == 0) continue;
      maybenonzero = 1;
      ge25519_p1p1_to_p3(&p3,&p1p1);
      if (c > 0)
        ge25519_pnielsadd_p1p1(&p1p1,&p3,&cP[j][c/2]);
      else
        ge25519_pnielssub_p1p1(&p1p1,&p3,&cP[j][-c/2]);
    }
  }

  ge25519_p1p1_to_p3(r,&p1p1);
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
      ge25519_double_scalarmult_precompute(cP[j],&Pj,P_MULTIPLES);

      P += 32;
      n += 32;
      --len;
    }

    {
      ge25519_p3 u;
      ge25519_pniels v;

      ge25519_double_scalarmult_process(&u,nslide,cP,todo);

      ge25519_p3_to_cached(&v,&u);
      ge25519_p1p1_to_p3(&u,&bigresult);
      ge25519_pnielsadd_p1p1(&bigresult,&u,&v);
    }
  }

  {
    ge25519_p2 t;

    ge25519_p1p1_to_p2(&t,&bigresult);
    ge25519_pack(Q,&t);
    Q[32] = ok;
  }
}
