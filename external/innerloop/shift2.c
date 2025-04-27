#include <stdio.h>
#include <assert.h>
#include "types.h"

int main()
{
  uint64_t f0 = 314159;
  uint64_t g0 = 271828;
  uint64_t m = -1; /* -delta */

    uint64_t u = 1, v = 0, q = 0, r = 1;
    uint64_t c1, c2, f = f0, g = g0, x, y, z;
    int i;
    int i63;

    for (i63 = 63; i63 > 44; --i63) {

        i = 63 - i63;

        printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n",i,((int64_t)f)>>i,((int64_t)g)>>i,u,v,q,r);
        fflush(stdout);

        assert(u * f0 + v * g0 == f);
        assert(q * f0 + r * g0 == g);
        assert((f & ((1ULL<<i)-1)) == 0);
        assert((f & (1ULL<<i)) == (1ULL<<i));

        c1 = ((int64_t) ((g << i63) & m)) >> 63;

        x = (f ^ g) & c1;
        y = (u ^ q) & c1;
        z = (v ^ r) & c1;

                        m ^= c1; m -= c1;
        f ^= x; g ^= x; g ^= c1; g -= c1;
        u ^= y; q ^= y; q ^= c1; q -= c1;
        v ^= z; r ^= z; r ^= c1; r -= c1;

        m -= 1;

        c2 = ((int64_t) (g << i63)) >> 63;

        g += (f & c2); f <<= 1;
        q += (u & c2); u <<= 1;
        r += (v & c2); v <<= 1;
    }

  i = 63 - i63;
  printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n",i,((int64_t)f)>>i,((int64_t)g)>>i,u,v,q,r);
  return 0;
}
