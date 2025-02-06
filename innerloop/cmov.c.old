#include <stdio.h>
#include <assert.h>
#include "types.h"

int main()
{
  uint64_t f0 = 314159;
  uint64_t g0 = 271828;
  uint64_t m = -1;
  uint64_t fuv = f0;
  uint64_t gqr = g0;
  int i;

  fuv += 1ULL<<32;
  gqr += 1ULL<<48;

  for (i = 0; i < 100; ++i) {
    {
      int64_t uv = ((int64_t)fuv+(1LL<<31))>>32;
      int64_t f = fuv-(uv<<32);
      int64_t v = (uv+(1LL<<15))>>16;
      int64_t u = uv-(v<<16);
      int64_t qr = ((int64_t)gqr+(1LL<<31))>>32;
      int64_t g = gqr-(qr<<32);
      int64_t r = (qr+(1LL<<15))>>16;
      int64_t q = qr-(r<<16);
  
      printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
        ,i,f>>i,g>>i,u,v,q,r);
      fflush(stdout);
  
      assert(f & (1<<i));
      assert(f == (f>>i)<<i);
      assert(g == (g>>i)<<i);
      assert(u * f0 + v * g0 == f);
      assert(q * f0 + r * g0 == g);
    }

    /* try to use 2-operand instructions */

    uint64_t h = gqr+fuv; /* g+f; use LEA */
    uint64_t z = 0;
    int flagodd = (gqr>>i)&1; /* use constant TEST */

    uint64_t g2 = gqr+gqr; /* 2g; use LEA */
    if (flagodd) gqr = h; /* g+(g mod 2)f */
    if (flagodd) z = m; /* m if g odd, else 0 */
    fuv += fuv; /* 2f; use ADD or SHL or LEA */

    uint64_t mnew = m-1; /* use LEA */
    m = -m; /* use NEG */
    uint64_t gf = gqr-fuv; /* g+(g mod 2)f-2f */
    int flagswap = z>>63; /* use constant TEST */

    m -= 1; /* -m-1 */
    if (flagswap) fuv = g2; /* 2g if swap, else 2f */
    if (flagswap) gqr = gf; /* g-f if swap, else g+(g mod 2)f */

    if (!flagswap) m = mnew; /* -m-1 if swap, else m-1 */
  }

  return 0;
}
