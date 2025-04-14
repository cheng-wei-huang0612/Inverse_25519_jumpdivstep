#include "crypto_pow_inv25519.h"
#include "crypto_powbatch.h"
#include "fe.h"

#define MAXTODO 8

void crypto_powbatch(unsigned char *q,const unsigned char *p,long long batch)
{
  fe tmp[MAXTODO+MAXTODO-1];
  /* for todo=1: p0 */
  /* for todo=2: p0p1, p0, p1 */
  /* for todo=3: p0p1p2, p0p1, p0, p1, p2 */
  int zeroflag[MAXTODO];
  unsigned char product[32];
  fe zero;
  fe one;

  fe_0(zero);
  fe_1(one);

  while (batch > 0) {
    long long todo = MAXTODO;
    if (batch < todo) todo = batch;
    batch -= todo;

    for (long long pos = 0;pos < todo;++pos) {
      fe_frombytes(tmp[todo-1+pos],p);
      p += 32;
      zeroflag[pos] = 1+fe_isnonzero(tmp[todo-1+pos]);
      fe_cmov(tmp[todo-1+pos],one,zeroflag[pos]);
      if (pos > 0)
        fe_mul(tmp[todo-1-pos],tmp[todo-pos],tmp[todo-1+pos]);
    }

    fe_tobytes(product,tmp[0]);
    crypto_pow_inv25519(product,product);
    fe_frombytes(tmp[0],product);

    for (long long pos = todo-1;pos > 0;--pos) {
      fe_mul(tmp[todo-pos],tmp[todo-pos],tmp[todo-1-pos]);
      fe_cmov(tmp[todo-pos],zero,zeroflag[pos]);
      fe_tobytes(q+32*pos,tmp[todo-pos]);
      fe_mul(tmp[todo-pos],tmp[todo-1+pos],tmp[todo-1-pos]);
    }
    fe_cmov(tmp[todo-1],zero,zeroflag[0]);
    fe_tobytes(q,tmp[todo-1]);
    q += 32*todo;
  }
}
