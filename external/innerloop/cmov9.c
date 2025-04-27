#include <stdint.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

//#define radix (15)
#define radix (60)
#define limbs (254/radix+1)
#define bigloops (719/radix+1)
#define topbits (255-radix*(limbs-1))

#define urpos 32
#define vspos 16

//extern void innerloop(int64_t *out, int64_t m, int64_t fuv, int64_t grs, int64_t loop);
extern void transition(int64_t *f,int64_t *g,int64_t *uvrs);
extern int64_t innerloop60(int64_t *out, int64_t m, int64_t f, int64_t g);
extern long long cpucycles(void);

void print_ints (int64_t *g) {
  printf("0");
  for (int i = 0; i < limbs; i++) {
    printf("%+lld *(2** %d)", (long long) g[i], radix*i); 
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
    printf("u=%lld\n", (long long) uvrs[0]);
    printf("v=%lld\n", (long long) uvrs[1]);
    printf("r=%lld\n", (long long) uvrs[2]);
    printf("s=%lld\n", (long long) uvrs[3]);
    uvrs+= 4;
    printf("U,V,R,S=u*U+v*R,u*V+v*S,r*U+s*R,r*V+s*S\n");    
  }
  printf("print(U,V,R,S)\n");
}


void inverse_255 (int64_t *f, int64_t *g, int64_t *uvrs) {
  int32_t i;
  int64_t m = -1;  // minusdelta
  //int64_t fuv, grs;

  for (i=0; i<bigloops; i++) {
    //fuv = f[0] + (1LL<<urpos);
    //grs = g[0] + (1LL<<(vspos+urpos));
    //printf("fuv = 0x%llx; grs = 0x%llx; m = %d\n", fuv, grs, m);
    //printf("#f = 0x%llx; g = 0x%llx; m = %d\n", f[0], g[0], m);
    
    //innerloop(out,m,fuv,grs,radix);

    //int64_t time1 = cpucycles();
    m = innerloop60(uvrs,m,f[0],g[0]);
    //int64_t time2 = cpucycles();
    //printf("#%lld cycles\n",time2-time1);
 
    transition(f,g,uvrs);
    uvrs += 4;

    //printf("ff=");    print_ints(f);    printf("\n");
    //printf("gg=");    print_ints(g);    printf("\n");
  }
  	
}

#define TIMINGS 63

#define TIME(this,variables,time_this,output) \
  void time_this(void) \
  { \
    long long t[TIMINGS]; \
    int i,j; \
    variables \
   \
    for (i = 0;i < TIMINGS;++i) { \
      t[i] = cpucycles(); \
    } \
    for (i = 0;i < TIMINGS;++i) { \
      t[i] = cpucycles(); \
      this \
    } \
    printf("# %s cycles:",output); \
    for (i = TIMINGS-1;i > 0;--i) \
      t[i] -= t[i-1]; \
    for (i = 1;i < TIMINGS;++i) \
      printf(" %lld",t[i]); \
    printf("\n"); \
    for (i = 1;i < TIMINGS;++i) \
      for (j = i+1;j < TIMINGS;++j) \
        if (t[j] < t[i]) { \
          long long swap = t[j]; \
          t[j] = t[i]; \
          t[i] = swap; \
        } \
    printf("# %s sorted:",output); \
    for (i = 1;i < TIMINGS;++i) \
      printf(" %lld",t[i]); \
    printf("\n"); \
  } \

TIME(,,time_nothing,"nothing")
TIME(innerloop60(out,0,0,0);,
     int64_t out[4];,
     time_innerloop60,
     "innerloop60")
TIME(g[0] = -19; g[limbs-1] = (1<<topbits);
     for (j=1; j<limbs-1; j++) g[j] = 0;
     for (j=0; j<limbs; j++) f[j] = 0;
     inverse_255(g,f,uvrs);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     int64_t uvrs[bigloops*4];
     ,
     time_inverse_255,
     "inverse_255")
TIME(transition(f,g,uvrs);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     int64_t uvrs[4];
     for (j=0; j<limbs; j++) f[j] = 0;
     for (j=0; j<limbs; j++) g[j] = 0;
     ,
     time_transition,
     "transition")

int main () {
  int64_t f[limbs]; 
  int64_t g[limbs];
  int64_t uvrs[bigloops*4];
  int32_t i;	
  int64_t random64, hi, lo;

  time_nothing();
  time_innerloop60();
  time_transition();
  time_inverse_255();
  
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

  printf("print(hex((U*g+V*f)),hex((R*g+S*f)))\n");
  return(0);
}
