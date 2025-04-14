#include <string.h>
#include "ge.h"
#include "ge_p1p1_0.h"
#include "ge_frombytes_vartime.h"
#include "sc.h"
#include "crypto_verify_32.h"
#include "crypto_multiscalar.h"

static void slide(signed char *r,const unsigned char *a)
{
  int i;
  int b;
  int k;

  for (i = 0;i < 256;++i)
    r[i] = 1 & (a[i >> 3] >> (i & 7));

  for (i = 0;i < 256;++i)
    if (r[i]) {
      for (b = 1;b <= 6 && i + b < 256;++b) {
        if (r[i + b]) {
          if (r[i] + (r[i + b] << b) <= 15) {
            r[i] += r[i + b] << b; r[i + b] = 0;
          } else if (r[i] - (r[i + b] << b) >= -15) {
            r[i] -= r[i + b] << b;
            for (k = i + b;k < 256;++k) {
              if (!r[k]) {
                r[k] = 1;
                break;
              }
              r[k] = 0;
            }
          } else
            break;
        }
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
  ge_p1p1 bigresult;

  ge_p1p1_0(&bigresult);

  while (len > 0) {
    signed char nslide[MAXTODO][256];
    ge_cached cP[MAXTODO][8]; /* P,3P,5P,7P,9P,11P,13P,15P */

    long long todo = MAXTODO;
    if (len < todo) todo = len;

    for (long long j = 0;j < todo;++j) {
      unsigned char nj[32];
      ge_p3 Pj;
      ge_p3 twoPj;
      ge_p1p1 t;
      ge_p3 u;

      memcpy(nj,n,32);
      sc_reduce(nj);
      if (crypto_verify_32(nj,n)) ok = 0;
      slide(nslide[j],nj);

      ok &= ge_frombytes_vartime(&Pj,P);
      ge_p3_to_cached(&cP[j][0],&Pj);
      ge_p3_dbl(&t,&Pj); ge_p1p1_to_p3(&twoPj,&t);
      ge_add(&t,&twoPj,&cP[j][0]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][1],&u);
      ge_add(&t,&twoPj,&cP[j][1]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][2],&u);
      ge_add(&t,&twoPj,&cP[j][2]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][3],&u);
      ge_add(&t,&twoPj,&cP[j][3]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][4],&u);
      ge_add(&t,&twoPj,&cP[j][4]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][5],&u);
      ge_add(&t,&twoPj,&cP[j][5]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][6],&u);
      ge_add(&t,&twoPj,&cP[j][6]); ge_p1p1_to_p3(&u,&t); ge_p3_to_cached(&cP[j][7],&u);

      P += 32;
      n += 32;
      --len;
    }

    {
      ge_p1p1 result;
      ge_p3 u;
      ge_cached v;
      int maybenonzero = 0;

      ge_p1p1_0(&result);

      for (long long i = 255;i >= 0;--i) {
        ge_p2 t;
  
        if (maybenonzero) {
          ge_p1p1_to_p2(&t,&result);
          ge_p2_dbl(&result,&t);
        }
        for (long long j = 0;j < todo;++j) {
          signed char c = nslide[j][i];
          if (!c) continue;
          maybenonzero = 1;
          if (c > 0) {
            ge_p1p1_to_p3(&u,&result);
            ge_add(&result,&u,&cP[j][c/2]);
          } else {
            ge_p1p1_to_p3(&u,&result);
            ge_sub(&result,&u,&cP[j][(-c)/2]);
          }
        }
      }

      ge_p1p1_to_p3(&u,&result);
      ge_p3_to_cached(&v,&u);
      ge_p1p1_to_p3(&u,&bigresult);
      ge_add(&bigresult,&u,&v);
    }
  }

  {
    ge_p2 t;

    ge_p1p1_to_p2(&t,&bigresult);
    ge_tobytes(Q,&t);
    Q[32] = ok;
  }
}
