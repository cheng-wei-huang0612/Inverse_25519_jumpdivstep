// 20240926 djb: using cryptoint

#include "crypto_nP.h"
#include "fe.h"
#include "crypto_uint8.h"

void crypto_nP(unsigned char *q,
  const unsigned char *n,
  const unsigned char *p
  )
{
  unsigned char e[32];
  unsigned int i;
  fe x1;
  fe x2;
  fe z2;
  fe x3;
  fe z3;
  fe tmp0;
  fe tmp1;
  int pos;
  unsigned int swap;
  unsigned int b;

  for (i = 0;i < 32;++i) e[i] = n[i];
  e[0] &= 248;
  e[31] &= 127;
  e[31] |= 64;
  fe_frombytes(x1,p);
  fe_1(x2);
  fe_0(z2);
  fe_copy(x3,x1);
  fe_1(z3);

  swap = 0;
  for (pos = 254;pos >= 0;--pos) {
    b = crypto_uint8_bitmod_01(e[pos / 8],pos);
    swap ^= b;
    fe_cswap(x2,x3,swap);
    fe_cswap(z2,z3,swap);
    swap = b;
#include "montgomery.h"
  }
  fe_cswap(x2,x3,swap);
  fe_cswap(z2,z3,swap);

  fe_invert(z2,z2);
  fe_mul(x2,x2,z2);
  fe_tobytes(q,x2);
}
