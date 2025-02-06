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
      ,i,((int64_t)(f<<i))>>i,((int64_t)(g<<i))>>i,u,v,q,r);
    fflush(stdout);

    assert(f & 1);
    assert((u * f0 + v * g0) == f << i);
    assert((q * f0 + r * g0) == g << i);

    c = g&1;
      d = ((int64_t)m)>>63; /* -1 if m<0, 0 if m>=0 */
        fg = f^g;

    c = -c; /* -1 if g mod 2, 0 otherwise */
          dm = m<<1;

    cf = c&f; /* (g mod 2)f */
      d &= c; /* -1 if m<0 and g mod 2, 0 otherwise */
          m -= 1;

    g += cf; /* g+(g mod 2)f */
      df = d&f; /* f if m<0, 0 if m>=0 */
        fg &= d; /* f^g if m<0 and g mod 2, 0 otherwise */

    g >>= 1; /* (g+(g mod 2)f)/2 */
        f ^= fg; /* g if m<0 and g mod 2, f otherwise */
          dm &= d; /* 2m if m<0 and g mod 2, 0 otherwise */

      g -= df; /* (g-f)/2 if m<0 and g mod 2, (g+(g mod 2)f)/2 otherwise */
          m -= dm; /* -m-1 if m<0 and g mod 2, m-1 otherwise */

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
        u <<= 1;

        cv = c&v;
        r += cv;
        v <<= 1;
    }

  printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
    ,i,((int64_t)(f<<i))>>i,((int64_t)(g<<i))>>i,u,v,q,r);
  return 0;
}
