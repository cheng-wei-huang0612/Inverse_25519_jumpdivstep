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
      int64_t fuvi = fuv<<i;
      int64_t uv = ((int64_t)fuvi+(1LL<<31))>>32;
      int64_t f = fuvi-(uv<<32);
      int64_t v = (uv+(1LL<<15))>>16;
      int64_t u = uv-(v<<16);
      int64_t gqri = gqr<<i;
      int64_t qr = ((int64_t)gqri+(1LL<<31))>>32;
      int64_t g = gqri-(qr<<32);
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

    uint64_t z = 0;
    uint64_t mnew = -1;

    uint64_t h = gqr+fuv; /* g+f; use LEA */
    uint64_t oldg = gqr; /* g */
    mnew -= m; /* -1-m */
    int flagodd = gqr&1; /* use constant TEST */

    if (flagodd) z = m; /* m if g odd, else 0 */
    if (!flagodd) h = gqr; /* g+(g mod 2)f */
    gqr -= fuv; /* g-f */
    m -= 1;
    
    gqr >>= 1; /* floor((g-f)/2) */
    h >>= 1; /* (g+(g mod 2)f)/2 */
    int flagswap = z>>63; /* use CMP */

    if (flagswap) m = mnew; /* -m-1 if swap, else m-1 */
    if (flagswap) fuv = oldg; /* g if swap, else f */
    if (!flagswap) gqr = h; /* (g-f)/2 if swap, else (g+(g mod 2)f)/2 */
  }

  return 0;
}
