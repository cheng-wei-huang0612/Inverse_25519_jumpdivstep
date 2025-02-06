#include <stdio.h>
#include <assert.h>
#include "types.h"

int main()
{
  uint64_t f0 = 314159;
  uint64_t g0 = 271828;
  uint64_t m = -1;
  uint64_t f = f0;
  uint64_t g = g0;
  uint64_t u = 1;
  uint64_t v = 0;
  uint64_t q = 0;
  uint64_t r = 1;
  uint64_t c, d, df, dm;
  uint64_t fg, uq, vr;
  uint64_t cf, cu, cv;
  int i;

  for (i = 0; i < 19; ++i) {

    printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
      ,i,((int64_t)f)>>i,((int64_t)g)>>i,u,v,q,r);
    fflush(stdout);

    assert(f & (1<<i));
    assert(f == (f>>i)<<i);
    assert(u * f0 + v * g0 == f);
    assert(q * f0 + r * g0 == g);

    c = g<<(63-i); /* -2^63 if bit i is set, 0 otherwise */
      d = ((int64_t)m)>>63; /* -1 if m<0, 0 if m>=0 */
       fg = f^g;
          dm = m+m;

    c = ((int64_t) c)>>63; /* -1 if bit i is set, 0 otherwise */
          m -= 1;

    cf = c&f; /* (g mod 2)f */
      f += f; /* 2f */
      d &= c; /* -1 if swap, 0 otherwise */
        fg += fg; /* 2f^2g */

    g += cf; /* g+(g mod 2)f */
      df = d&f; /* 2f if swap, 0 otherwise */
        fg &= d; /* 2f^2g if swap, 0 otherwise */
          dm &= d; /* 2m if swap, 0 otherwise */

    g -= df; /* g-f if swap, g+(g mod 2)f otherwise */
        f ^= fg; /* 2g if swap, 2f otherwise */
          m -= dm; /* -m-1 if swap, m-1 otherwise */

        uq = u^q;
        uq &= d;
        u ^= uq;
        q ^= uq;
        q ^= d;
        q -= d;

        vr = v^r;
        vr &= d;
        v ^= vr;
        r ^= vr;
        r ^= d;
        r -= d;

        cu = c&u;
        q += cu;
        u += u;

        cv = c&v;
        r += cv;
        v += v;
    }

  printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
    ,i,((int64_t)f)>>i,((int64_t)g)>>i,u,v,q,r);
  return 0;
}
