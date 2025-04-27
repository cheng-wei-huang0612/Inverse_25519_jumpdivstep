#include <stdio.h>
#include <assert.h>
#include "types.h"

extern void innerloop(uint64_t *out,uint64_t m,uint64_t fuv,uint64_t gqr,uint64_t loop);

int main()
{
  int i;

  {
    uint64_t f0 = 314159;
    uint64_t g0 = 271828;
    uint64_t m = -1;
    uint64_t fuv = f0;
    uint64_t gqr = g0;
    uint64_t out[3];
    innerloop(out,m,fuv,gqr,1000000000);
  }

  for (i = 0;i < 100;++i) {
    uint64_t f0 = 314159;
    uint64_t g0 = 271828;
    uint64_t m = -1;
    uint64_t fuv = f0;
    uint64_t gqr = g0;
    uint64_t out[3];
  
    fuv += 1ULL<<32;
    gqr += 1ULL<<48;
    
    if (i > 0) {
      innerloop(out,m,fuv,gqr,i);
      m = out[0];
      fuv = out[1];
      gqr = out[2];
    }

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
  }

  return 0;
}
