#include      <stdint.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define radix (15)
#define limbs (254/radix+1)
#define bigloops (739/radix+1)
#define urpos 32
#define vspos 16
#define topbits (255-radix*(limbs-1))

extern void innerloop( int64_t *out, int64_t m, int64_t fuv, int64_t grs, int64_t loop);

int print_ints (int32_t *g) {
  printf("0");
  for (int i = 0; i < limbs; i++) {
    printf("%+d *(2** %d)", g[i], radix*i); 
  }
}

void print_25519 (int32_t *g) {
  printf("g=" );
  print_ints(g);
  printf("\nassert g== 2**255-19\n");
}

void print_uvrs(int32_t *uvrs){
            
  printf("U,V,R,S = 1,0,0,1\n");	
  for (int i=0; i<bigloops; i++) {
    printf("u=%d\n", uvrs[0]);
    printf("v=%d\n", uvrs[1]);
    printf("r=%d\n", uvrs[2]);
    printf("s=%d\n", uvrs[3]);
    uvrs+= 4;
    printf("U,V,R,S=u*U+v*R,u*V+v*S,r*U+s*R,r*V+s*S\n");    
  }
  printf("print(U,V,R,S)\n");
}

void inverse_255 (int32_t *f, int32_t *g, int32_t *uvrs) {
  int32_t i, j;
  int32_t m = -1;  // minusdelta
  int64_t fuv, grs;	
  int64_t out[3];

  for (i=0; i<bigloops; i++) {
    fuv = f[0] + (1LL<<urpos);
    grs = g[0] + (1LL<<(vspos+urpos));

    printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);

    innerloop(out,m,fuv,grs,radix);		

    m = out[0];
    fuv = out[1];
    grs = out[2];

    printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);	
    fuv <<= radix;
    int64_t uv = (fuv + (1LL<<(urpos-1))) >> urpos;
    int64_t ff = fuv - (uv << urpos);
    int64_t v = (uv + (1LL<<(vspos-1))) >> vspos;
    int64_t u = uv - (v << vspos);
    grs <<= radix;
    int64_t rs = (grs + (1LL<<(urpos-1))) >> urpos;
    int64_t gg = grs - (rs << urpos);
    int64_t s = (rs + (1LL<<(vspos-1))) >> vspos;
    int64_t r = rs - (s << vspos); 

    printf("#line %d\n", i);
    printf("#f=%lld; g=%lld; u=%lld; v=%lld; r=%lld; s=%lld\n", ff>>radix,gg>>radix, u, v, r, s); 

    int64_t f_top, f_bot, g_top, g_bot;
    int64_t f_carry = 0;
    int64_t g_carry = 0;
    for (j=0; j<limbs; j++) {
      f_carry += u * f[j] + v * g[j];  	    
      g_carry += r * f[j] + s * g[j];
      f_top = (f_carry +  (1LL<<(radix-1))) >> radix;
      f_bot = f_carry - (f_top << radix);
      g_top = (g_carry +  (1LL<<(radix-1))) >> radix;
      g_bot = g_carry - (g_top << radix);
      if (j>0) {
	f[j-1] = f_bot; g[j-1] = g_bot;	
      } 
      f_carry = f_top;
      g_carry = g_top;	      
    }
    f[limbs-1] = f_carry; g[limbs-1] = g_carry;
    uvrs[0] = u; uvrs[1] = v; uvrs[2] = r; uvrs[3] = s;
    uvrs += 4;
  }
  	
}

int main () {
  int32_t f[limbs]; 
  int32_t g[limbs];
  int32_t uvrs[bigloops*4];
  int32_t i;	

  g[0] = -19; g[limbs-1] = (1<<topbits);
  for (i=1; i<limbs-1; i++) g[i] = 0;
  print_25519(g);

  for (i=0; i<limbs-1; i++) f[i] = (random() & ((1<<radix)-1)) - (1<<(radix-1));
  f[limbs-1] = (random() & (( 1<<topbits) -1)) - (1<<(topbits-1));

  printf("f=");
  print_ints(f);
  printf("\n");

  inverse_255(g,f,uvrs);
  print_uvrs(uvrs);

  printf("print(hex(U*g+V*f),hex(R*g+S*f))\n");
  return(0);
}
