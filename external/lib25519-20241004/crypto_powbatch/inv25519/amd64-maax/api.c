#include "crypto_verify_32.h"
#include "crypto_pow_inv25519.h"
#include "crypto_powbatch.h"
#include "fe25519.h"

#define MAXTODO 8

static const unsigned char zerobytes[32] = {0};
static const fe25519 zero = {{0,0,0,0}};
static const fe25519 one = {{1,0,0,0}};

void crypto_powbatch(unsigned char *q,const unsigned char *p,long long batch)
{
  fe25519 tmp[MAXTODO+MAXTODO-1];
  /* for todo=1: p0 */
  /* for todo=2: p0p1, p0, p1 */
  /* for todo=3: p0p1p2, p0p1, p0, p1, p2 */
  int zeroflag[MAXTODO];
  unsigned char s[32];

  while (batch > 0) {
    long long todo = MAXTODO;
    if (batch < todo) todo = batch;
    batch -= todo;

    for (long long pos = 0;pos < todo;++pos) {
      fe25519_unpack(&tmp[todo-1+pos],p);
      p += 32;
      fe25519_pack(s,&tmp[todo-1+pos]);
      zeroflag[pos] = 1+crypto_verify_32(s,zerobytes);
      fe25519_cmov(&tmp[todo-1+pos],&one,zeroflag[pos]);
      if (pos > 0)
        fe25519_mul(&tmp[todo-1-pos],&tmp[todo-pos],&tmp[todo-1+pos]);
    }

    fe25519_pack(s,&tmp[0]);
    crypto_pow_inv25519(s,s);
    fe25519_unpack(&tmp[0],s);

    for (long long pos = todo-1;pos > 0;--pos) {
      fe25519_mul(&tmp[todo-pos],&tmp[todo-pos],&tmp[todo-1-pos]);
      fe25519_cmov(&tmp[todo-pos],&zero,zeroflag[pos]);
      fe25519_pack(q+32*pos,&tmp[todo-pos]);
      fe25519_mul(&tmp[todo-pos],&tmp[todo-1+pos],&tmp[todo-1-pos]);
    }
    fe25519_cmov(&tmp[todo-1],&zero,zeroflag[0]);
    fe25519_pack(q,&tmp[todo-1]);
    q += 32*todo;
  }
}
