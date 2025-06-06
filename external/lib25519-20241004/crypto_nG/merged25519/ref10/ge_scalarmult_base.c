// 20240926 djb: use crypto_int8, crypto_uint8

// linker define ge_scalarmult_base
// linker use base
// linker use fe_cmov
// linker use ge_precomp_0
// linker use fe_copy
// linker use fe_neg
// linker use ge_p3_0
// linker use ge_madd
// linker use ge_p1p1_to_p3
// linker use ge_p3_dbl
// linker use ge_p1p1_to_p2
// linker use ge_p2_dbl

#include "ge.h"
#include "B.h"
#include "crypto_int8.h"
#include "crypto_uint8.h"

static void cmov(ge_precomp *t,const ge_precomp *u,unsigned char b)
{
  fe_cmov(t->yplusx,u->yplusx,b);
  fe_cmov(t->yminusx,u->yminusx,b);
  fe_cmov(t->xy2d,u->xy2d,b);
}

static void select(ge_precomp *t,int pos,signed char b)
{
  ge_precomp minust;
  unsigned char bnegative = crypto_int8_negative_01(b);
  unsigned char babs = b - (((-bnegative) & b) << 1);

  ge_precomp_0(t);
  cmov(t,&base[pos][0],crypto_uint8_equal_01(babs,1));
  cmov(t,&base[pos][1],crypto_uint8_equal_01(babs,2));
  cmov(t,&base[pos][2],crypto_uint8_equal_01(babs,3));
  cmov(t,&base[pos][3],crypto_uint8_equal_01(babs,4));
  cmov(t,&base[pos][4],crypto_uint8_equal_01(babs,5));
  cmov(t,&base[pos][5],crypto_uint8_equal_01(babs,6));
  cmov(t,&base[pos][6],crypto_uint8_equal_01(babs,7));
  cmov(t,&base[pos][7],crypto_uint8_equal_01(babs,8));
  fe_copy(minust.yplusx,t->yminusx);
  fe_copy(minust.yminusx,t->yplusx);
  fe_neg(minust.xy2d,t->xy2d);
  cmov(t,&minust,bnegative);
}

/*
h = a * B
where a = a[0]+256*a[1]+...+256^31 a[31]
B is the Ed25519 base point (x,4/5) with x positive.

Preconditions:
  a[31] <= 127
*/

void ge_scalarmult_base(ge_p3 *h,const unsigned char *a)
{
  signed char e[64];
  signed char carry;
  ge_p1p1 r;
  ge_p2 s;
  ge_precomp t;
  int i;

  for (i = 0;i < 32;++i) {
    e[2 * i + 0] = (a[i] >> 0) & 15;
    e[2 * i + 1] = (a[i] >> 4) & 15;
  }
  /* each e[i] is between 0 and 15 */
  /* e[63] is between 0 and 7 */

  carry = 0;
  for (i = 0;i < 63;++i) {
    e[i] += carry;
    carry = e[i] + 8;
    carry >>= 4;
    e[i] -= carry << 4;
  }
  e[63] += carry;
  /* each e[i] is between -8 and 8 */

  ge_p3_0(h);
  for (i = 1;i < 64;i += 2) {
    select(&t,i / 2,e[i]);
    ge_madd(&r,h,&t); ge_p1p1_to_p3(h,&r);
  }

  ge_p3_dbl(&r,h);  ge_p1p1_to_p2(&s,&r);
  ge_p2_dbl(&r,&s); ge_p1p1_to_p2(&s,&r);
  ge_p2_dbl(&r,&s); ge_p1p1_to_p2(&s,&r);
  ge_p2_dbl(&r,&s); ge_p1p1_to_p3(h,&r);

  for (i = 0;i < 64;i += 2) {
    select(&t,i / 2,e[i]);
    ge_madd(&r,h,&t); ge_p1p1_to_p3(h,&r);
  }
}
