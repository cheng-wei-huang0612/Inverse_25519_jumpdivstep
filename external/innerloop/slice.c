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
  uint64_t c, d, df, dm;
  uint64_t fg;
  uint64_t cf;
  int i;

  fuv += 1ULL<<32;
  gqr += 1ULL<<48;

  for (i = 0; i < 100; ++i) {
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

    c = gqr<<(63-i); /* -2^63 if bit i is set, 0 otherwise */
      d = ((int64_t)m)>>63; /* -1 if m<0, 0 if m>=0 */
       fg = fuv^gqr;
          dm = m+m;

    c = ((int64_t) c)>>63; /* -1 if bit i is set, 0 otherwise */
          m -= 1;

    cf = c&fuv; /* (g mod 2)f */
      fuv += fuv; /* 2f */
      d &= c; /* -1 if swap, 0 otherwise */
        fg += fg; /* 2f^2g */

    gqr += cf; /* g+(g mod 2)f */
      df = d&fuv; /* 2f if swap, 0 otherwise */
        fg &= d; /* 2f^2g if swap, 0 otherwise */
          dm &= d; /* 2m if swap, 0 otherwise */

    gqr -= df; /* g-f if swap, g+(g mod 2)f otherwise */
        fuv ^= fg; /* 2g if swap, 2f otherwise */
          m -= dm; /* -m-1 if swap, m-1 otherwise */
  }

  return 0;
}
