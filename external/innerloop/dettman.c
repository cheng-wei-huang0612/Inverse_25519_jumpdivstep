#include <stdio.h>
#include <assert.h>
#include "types.h"

int main()
{
  uint64_t f0 = 314159;
  uint64_t g0 = 271828;
  uint64_t eta = -1;

    uint64_t u = 1, v = 0, q = 0, r = 1;
    uint64_t c1, c2, f = f0, g = g0, x, y, z;
    int i;

    for (i = 0; i < 19; ++i) {

      printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
        ,i,((int64_t)(f<<i))>>i,((int64_t)(g<<i))>>i,u,v,q,r);
        fflush(stdout);

        assert((f & 1) == 1);
        assert((u * f0 + v * g0) == f << i);
        assert((q * f0 + r * g0) == g << i);

        c1 = -(g & (eta >> 63));

        x = (f ^ g) & c1;
        f ^= x; g ^= x; g ^= c1; g -= c1;

        y = (u ^ q) & c1;
        u ^= y; q ^= y; q ^= c1; q -= c1;

        z = (v ^ r) & c1;
        v ^= z; r ^= z; r ^= c1; r -= c1;

        eta = (eta ^ c1) - c1 - 1;

        c2 = -(g & 1);

        g += (f & c2); g >>= 1;
        q += (u & c2); u <<= 1;
        r += (v & c2); v <<= 1;
    }

  printf("%d f=%lld g=%lld u=%lld v=%lld q=%lld r=%lld\n"
    ,i,((int64_t)(f<<i))>>i,((int64_t)(g<<i))>>i,u,v,q,r);
  return 0;
}
