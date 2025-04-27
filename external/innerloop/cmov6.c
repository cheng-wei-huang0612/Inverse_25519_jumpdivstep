#include <stdint.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

//#define radix (15)
#define radix (60)
#define limbs (254/radix+1)
#define bigloops (739/radix+1)
#define topbits (255-radix*(limbs-1))

#define urpos 32
#define vspos 16

extern void innerloop(int64_t *out, int64_t m, int64_t fuv, int64_t grs, int64_t loop);

int print_ints (int64_t *g) {
  printf("0");
  for (int i = 0; i < limbs; i++) {
    printf("%+lld *(2** %d)", g[i], radix*i); 
  }
}

void print_25519 (int64_t *g) {
  printf("g=" );
  print_ints(g);
  printf("\nassert g== 2**255-19\n");
}

void print_uvrs(int64_t *uvrs){
            
  printf("U,V,R,S = 1,0,0,1\n");	
  for (int i=0; i<bigloops; i++) {
    printf("u=%lld\n", uvrs[0]);
    printf("v=%lld\n", uvrs[1]);
    printf("r=%lld\n", uvrs[2]);
    printf("s=%lld\n", uvrs[3]);
    uvrs+= 4;
    printf("U,V,R,S=u*U+v*R,u*V+v*S,r*U+s*R,r*V+s*S\n");    
  }
  printf("print(U,V,R,S)\n");
}


void innerloop60 (int64_t *out, int64_t m, int64_t f, int64_t g) {

  int64_t uu=1, vv=0, rr=0, ss=1;

  for (int i=0; i<4; i++){
    int64_t fuv = (f & ((1<<15)-1)) + (1LL<<urpos);
    int64_t grs = (g & ((1<<15)-1)) + (1LL<<(vspos+urpos));
    //printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);
    innerloop(out,m,fuv,grs,15);

    m = out[0];
    fuv = out[1];
    grs = out[2];
    
    printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);	
    fuv <<= 15;
    int64_t uv = (fuv + (1LL<<(urpos-1))) >> urpos;
    int64_t ff = (fuv - (uv << urpos)) >> 15;
    int64_t v = (uv + (1LL<<(vspos-1))) >> vspos;
    int64_t u = uv - (v << vspos);
    grs <<= 15;
    int64_t rs = (grs + (1LL<<(urpos-1))) >> urpos;
    int64_t gg = (grs - (rs << urpos)) >> 15;
    int64_t s = (rs + (1LL<<(vspos-1))) >> vspos;
    int64_t r = rs - (s << vspos); 
    printf("#f=%lld;g=%lld;Matrix([[%lld,%lld],[%lld,%lld]])\n",ff,gg,u,v,r,s); 
    
    ff =  (((__int128) u) * f + ((__int128) v) * g ) >> 15;
    gg =  (((__int128) r) * f + ((__int128) s) * g ) >> 15;

    int64_t uuu =  u * uu + v * rr;
    int64_t rrr =  r * uu + s * rr;

    int64_t vvv =  u * vv + v * ss;
    int64_t sss =  r * vv + s * ss;

    f = ff; g = gg; uu = uuu; vv = vvv; rr = rrr; ss = sss;
  }
  //printf("#f=%lld;g=%lld;Matrix([[%lld,%lld],[%lld,%lld]])\n",f,g,uu,vv,rr,ss); 

  out[0] = m;  out[1] = f;  out[2] = g;
  out[3] = uu; out[4] = vv; out[5] = rr; out[6] = ss;
  
  
}

void inverse_255 (int64_t *f, int64_t *g, int64_t *uvrs) {
  int32_t i, j;
  int32_t m = -1;  // minusdelta
  //int64_t fuv, grs;
  int64_t out[7];

  for (i=0; i<bigloops; i++) {
    //fuv = f[0] + (1LL<<urpos);
    //grs = g[0] + (1LL<<(vspos+urpos));
    //printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);
    //printf("#f = 0x%llx; g = 0x%llx; m = %d\n", f[0], g[0], m);
    
    //innerloop(out,m,fuv,grs,radix);
    innerloop60(out,m,f[0],g[0]);
    
    m = out[0];
    int64_t ff = out[1];
    int64_t gg = out[2];
    int64_t u = out[3];
    int64_t v = out[4];
    int64_t r = out[5];
    int64_t s = out[6];

    printf("#line %d\n", i);
    printf("#f=%lld; g=%lld; u=%lld; v=%lld; r=%lld; s=%lld\n",ff,gg,u,v,r,s); 

    __int128 f_top, f_bot, g_top, g_bot;
    __int128 f_carry = 0;
    __int128 g_carry = 0;

    //printf("ff=");    print_ints(f);    printf("\n");
    //printf("gg=");    print_ints(g);    printf("\n");

    for (j=0; j<limbs; j++) {
      
      f_carry += (__int128) u * f[j] + (__int128) v * g[j];  	    
      g_carry += (__int128) r * f[j] + (__int128) s * g[j];
      //printf("#fh=%lld; fl=%lld; gh=%lld; gl=%lld\n",(int64_t)(f_carry>>64),(int64_t)f_carry,(int64_t)(g_carry>>64),(int64_t)g_carry);

      f_top = (f_carry +  (1LL<<(radix-1))) >> radix;
      f_bot = f_carry - (f_top << radix);
      g_top = (g_carry +  (1LL<<(radix-1))) >> radix;
      g_bot = g_carry - (g_top << radix);
      //printf("#f1=%lld; f0=%lld; g1=%lld; g0=%lld\n",(int64_t)f_top,(int64_t)f_bot,(int64_t)g_top,(int64_t)g_bot); 
      
      if (j>0) {
	f[j-1] = f_bot; g[j-1] = g_bot;	
      } else {
	assert(f_bot==0);
	assert(g_bot==0);
      }
      f_carry = f_top;
      g_carry = g_top;
    }
    f[limbs-1] = f_carry; g[limbs-1] = g_carry;
    uvrs[0] = u; uvrs[1] = v; uvrs[2] = r; uvrs[3] = s;
    uvrs += 4;

    //printf("ff=");    print_ints(f);    printf("\n");
    //printf("gg=");    print_ints(g);    printf("\n");
  }
  	
}

int main () {
  int64_t f[limbs]; 
  int64_t g[limbs];
  int64_t uvrs[bigloops*4];
  int32_t i;	
  int64_t random64, hi, lo;
  
  g[0] = -19; g[limbs-1] = (1<<topbits);
  for (i=1; i<limbs-1; i++) g[i] = 0;
  print_25519(g);

  for (i=0; i<limbs-1; i++) {
    hi = random(); lo = random(); random64 = (hi << 32) + lo;
    f[i] = (random64  & ((1LL<<radix)-1)) - (1LL<<(radix-1));
  }
  hi = random(); lo = random(); random64 = (hi << 32) + lo;
  f[limbs-1] = (random64 & (( 1LL<<topbits) -1)) - (1LL<<(topbits-1));

  printf("f=");
  print_ints(f);
  printf("\n");

  inverse_255(g,f,uvrs);
  print_uvrs(uvrs);

  int loops = bigloops * radix;
  printf("print(hex((U*g+V*f)),hex((R*g+S*f)))\n");
  return(0);
}
