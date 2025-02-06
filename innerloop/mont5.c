#include <stdint.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define radix (15)
//#define radix (60)
//#define plen 511
#define radix (30)
#define limbs ((511-1)/64+1)
#define bigloops (1439/radix+1)
#define topbits (511-radix*(limbs-1))
#define slimbs ((511-1)/30+1)

#define urpos 32
#define vspos 16


extern long long cpucycles(void);

void print_ints (int64_t *g) {
  printf("0");
  for (int i = 0; i < limbs; i++) {
    printf("%+lld *(2** %d)", (long long) g[i], radix*i); 
  }
}


void print_int64 (int64_t *g) {
  printf("0");
  for (int i = 0; i < limbs; i++) {
    if (i< limbs-1 ) {
      printf("+%llu *(2** %d)", (unsigned long long) g[i], 64*i);
    } else {
      printf("%+lld *(2** %d)", (long long) g[i], 64*i);
    }
  }
}

void print_int64_5 (int64_t *g) {
  printf("0");
  for (int i = 0; i < 5; i++) {
    if (i<4) {
      printf("+%llu *(2** %d)", (unsigned long long) g[i], 64*i);
    } else {
      printf("%+lld *(2** %d)", (long long) g[i], 64*i);
    }
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

void print_uvrs2(int64_t *uvrs){
            
  printf("U,V,R,S = 1,0,0,1\n");	
  for (int i=0; i<bigloops/2; i++) {
    printf("u=cmod(0x%016llx%016llx, 2**128)\n", (long long) uvrs[1], (long long) uvrs[0]);
    printf("v=cmod(0x%016llx%016llx, 2**128)\n", (long long) uvrs[3], (long long) uvrs[2]);
    printf("r=cmod(0x%016llx%016llx, 2**128)\n", (long long) uvrs[5], (long long) uvrs[4]);
    printf("s=cmod(0x%016llx%016llx, 2**128)\n", (long long) uvrs[7], (long long) uvrs[6]);
    uvrs+= 8;
    printf("U,V,R,S=u*U+v*R,u*V+v*S,r*U+s*R,r*V+s*S\n");    
  }
  printf("print(U,V,R,S)\n");
}

void print_uvrs4(int64_t *uvrs){
            
  printf("U,V,R,S = 1,0,0,1\n");	
  for (int i=0; i<bigloops/4; i++) {
    printf("u=cmod(0x%016llx%016llx%016llx%016llx,2**256)\n", (long long) uvrs[3], (long long) uvrs[2], (long long) uvrs[1], (long long) uvrs[0]);
    printf("v=cmod(0x%016llx%016llx%016llx%016llx,2**256)\n", (long long) uvrs[7], (long long) uvrs[6], (long long) uvrs[5], (long long) uvrs[4]);
    printf("r=cmod(0x%016llx%016llx%016llx%016llx,2**256)\n", (long long) uvrs[11], (long long) uvrs[10], (long long) uvrs[9], (long long) uvrs[8]);
    printf("s=cmod(0x%016llx%016llx%016llx%016llx,2**256)\n", (long long) uvrs[15], (long long) uvrs[14], (long long) uvrs[13], (long long) uvrs[12]);
    uvrs+= 16;
    printf("U,V,R,S=u*U+v*R,u*V+v*S,r*U+s*R,r*V+s*S\n");    
  }
  printf("print(U,V,R,S)\n");
}


extern void inverse_511 (int64_t *f, int64_t *g, const int64_t *table); 
/* This is the CSIDH 512 Prime */
static const __attribute__((aligned(32)))
int64_t table[24+slimbs*4+((limbs-1)/4+1)*4]={0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL,
    0x200000000LL, 0x200000000LL, 0x200000000LL, 0x200000000LL,
    0x8000000000000000LL, 0x8000000000000000LL,
    0x8000000000000000LL, 0x8000000000000000LL, 
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0x20000000LL, 0x20000000LL, 0x20000000LL, 0x20000000LL,
    0x1b81b90533c6c87bULL, 0xc2721bf457aca835ULL,
    0x516730cc1f0b4f25ULL, 0xa7aac6c567f35507ULL,
    0x5afbfcc69322c9cdULL, 0xb42d083aedc88c42ULL,
    0xfc8ab0d15e3e4c4aULL, 0x65b48e8f740f89bfULL,
    0x033c6c87bLL, 0LL, 0LL, 0x03a7c00a3LL,
    0x02e06e414LL, 0LL, 0LL, 0x01b92604cLL,
    0x03aca8351LL, 0LL, 0LL, 0x0368824ecLL,
    0x01c86fd15LL, 0LL, 0LL, 0x00653fad4LL,
    0x00b4f25c2LL, 0LL, 0LL, 0x02acfdcd0LL,
    0x01cc3307cLL, 0LL, 0LL, 0x00fda0b14LL,
    0x035507516LL, 0LL, 0LL, 0x024b6dd33LL,
    0x031b159fcLL, 0LL, 0LL, 0x0022940ebLL,
    0x009cda7aaLL, 0LL, 0LL, 0x005bfa565LL,
    0x0331a4c8bLL, 0LL, 0LL, 0x012e3a944LL,
    0x00425afbfLL, 0LL, 0LL, 0x01b724762LL,
    0x00ebb7223LL, 0LL, 0LL, 0x004a75c1dLL,
    0x00ab42d08LL, 0LL, 0LL, 0x029022573LL,
    0x00578f931LL, 0LL, 0LL, 0x03203d4a2LL,
    0x03fc8ab0dLL, 0LL, 0LL, 0x0316a150fLL,
    0x01d03e26fLL, 0LL, 0LL, 0x01f5fb550LL,
    0x025b48e8fLL, 0LL, 0LL, 0x01621356aLL,
    0x000000001LL, 0LL, 0LL, 0x000000001LL,
    0x66c1301f632e294dULL, 0LL, 0LL, 0LL};

/* To set up the table for an arbitrary prime of bit length nbits
   Copy the first 20 entries of the table verbatim, these are the
   constants 2^30-1, 2^33, 2^63, 2^63-2^33, and 2^29;

   nqwords = (nbits+64-1)//64 is the number of qwords
   nnqw = (nqwords+3)//4*4 is the number of qwords this takes
   nlimbs = (nbits+30-1)//30  is the number of 30-bit limbs

   compute the prime radix 2^64, and enter starting at position 20
   ending at 19+nnqw.

   compute the prime radix 2^30, and enter the limbs every 4 positions
   starting at 20+nnqw.  Compute 2^(-34) mod p radix 2^30 and enter
   every 4 positions starting at 23+nnqw.  Put -1/p mod 2^64 in position
   20 + nnqw + 4 * nlimbs

   Note: the prime expansion needs all limbs between 0 and 2^30. */

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
/*
TIME(innerloop60(out,0,0,0);,
     int64_t out[4];,
     time_innerloop60,
     "innerloop60")
TIME(fpadd25519(f,g,h);,
     int64_t f[100];
     int64_t g[100];
     int64_t h[100];,
     time_fpadd25519,
     "fpadd25519")
TIME(fpmul25519(f,g,h);,
     int64_t f[100];
     int64_t g[100];
     int64_t h[100];,
     time_fpmul25519,
     "fpmul25519")
TIME(muls64xs64(f,g,h);,
     int64_t f[100];
     int64_t g[100];
     int64_t h[100];,
     time_muls64xs64,
     "muls64xs64")
TIME(mul2x2s128_25519(f,g,h);,
     int64_t f[100];
     int64_t g[100];
     int64_t h[100];,
     time_mul2x2s128_25519,
     "mul2x2s128_25519")
TIME(fold_12_60(f,g);,
     int64_t f[100];
     int64_t g[100];
     int64_t h[100];,
     time_fold_12_60,
     "fold_12_60")
TIME(transition(f,g,uvrs,v,s);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     int64_t v[limbs];
     int64_t s[limbs];
     int64_t uvrs[4];
     for (j=0; j<limbs; j++) f[j] = 0;
     for (j=0; j<limbs; j++) g[j] = 0;
     ,
     time_transition,
     "transition")
*/
TIME(g[0] = -19; g[limbs-1] = (1<<topbits);
     for (j=1; j<limbs-1; j++) g[j] = 0;
     inverse_511(f,g,table);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     ,
     time_inverse_511,
     "inverse_511")
TIME(g[0] = -19; g[limbs-1] = (1<<topbits);
     for (j=1; j<limbs-1; j++) g[j] = 0;
     for (j = 0;j < 1000;++j) inverse_511(f,g,table);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     ,
     time_inverse_511_x1000,
     "inverse_511_x1000")

int main () {
  int64_t f[limbs]; 
  int64_t g[limbs];
  //int64_t uvrs[bigloops*4];
  //int64_t uvrs2[bigloops*4];
  int32_t i,j;	
  int64_t random64, hi, lo;

  printf("limbs = %d; slimbs = %d\n",limbs,slimbs);
  printf("p = 0");
  for (i=0; i<slimbs; i++) printf("%+lld * 2**(%d)", table[24+(limbs-1)/4*4+4*i], 30*i);
  printf("\n");

  printf("qq = 0");
  for (i=0; i<slimbs; i++) printf("%+lld * 2**(%d)", table[27+(limbs-1)/4*4+4*i], 30*i);
  printf("\n");

  printf("def cmod(a,b) : \n");
  printf("    return((a+ b//2) %% b - b//2)\n\n");

  time_nothing();
  //time_innerloop60();
  //time_transition();
  //time_fpadd25519();
  //time_fpmul25519();
  //time_muls64xs64();
  //time_mul2x2s128_25519();
  //time_fold_12_60();
  time_inverse_511;
  time_inverse_511_x1000();

  for (j=0; j<250; j++) {
    srand(j);
    g[0] = -19; g[limbs-1] = (1<<topbits);
    for (i=1; i<limbs-1; i++) g[i] = 0;
    //print_25519(g);
    /*
    for (i=0; i<limbs-1; i++) {
      hi = random(); lo = random(); random64 = (hi << 32) + lo;
      f[i] = (random64  & ((1LL<<radix)-1)) - (1LL<<(radix-1));
    }
    hi = random(); lo = random(); random64 = (hi << 32) + lo;
    f[limbs-1] = (random64 & (( 1LL<<topbits) -1)) - (1LL<<(topbits-1));
    */
    for (i=0; i<limbs; i++) {
      hi = random(); lo = random(); random64 = (hi << 32) + lo;
      f[i] = random64;
    }
    hi = random(); lo = random(); random64 = (hi << 32) + lo;
    f[limbs-1] = (random64 & (~(1LL<<63)));
     
    printf("f=");
    print_int64(f);
    printf("\n");
    
    inverse_511(f,g,table);
    
    //print_uvrs(uvrs);
    //printf("print(hex((U*g+V*f)),hex((R*g+S*f)))\n");
    /*
    for (i=0; i<bigloops/2; i++) {
      muls64xs64(uvrs+8*i+4,uvrs+8*i,uvrs2+8*i);
    }
    print_uvrs2(uvrs2);
    
    printf("print(hex((U*g+V*f)),hex((R*g+S*f)))\n");
    
    for (i=0; i<bigloops/4; i++) {
      mul2x2s128_25519(uvrs2+16*i+8,uvrs2+16*i,uvrs+16*i);
    }
    */
    /*
    print_uvrs4(uvrs);
    printf("print(hex(Z*(U*g+V*f)%%(2**255-19)),hex((R*g+S*f)%%(2**255-19)))\n");
    
    // vx = u1 v0 + v1 s0
    fpmul25519(uvrs+4,uvrs+16,uvrs2); 
    fpmul25519(uvrs+12,uvrs+20,uvrs2+4);
    fpadd25519(uvrs2,uvrs2+4,uvrs2+4);
    // sx = r1 v0 + s1 s0
    fpmul25519(uvrs+4,uvrs+24,uvrs2+8); 
    fpmul25519(uvrs+12,uvrs+28,uvrs2+12);
    fpadd25519(uvrs2+8,uvrs2+12,uvrs2+12);
    // vy = u2 vx + v2 sx
    fpmul25519(uvrs2+4,uvrs+32,uvrs2+16); 
    fpmul25519(uvrs2+12,uvrs+36,uvrs2+20);
    fpadd25519(uvrs2+16,uvrs2+20,uvrs2+16);
    
    fpmul25519(cof,uvrs2+16,f);
    
    fpcneg25519(f,g[0]);
    */
    
    //printf("Y=0x%016llx%016llx%016llx%016llx\n", (long long) f[3], (long long) f[2], (long long) f[1], (long long) f[0]);
    
    printf("Y=");
    for (i=0; i<limbs; i++) printf("+%llu * 2**(%d)", g[i], 64*i);
    printf("\n");
    printf("print(hex(f*Y %% p))\n");
  }
  return(0);
}
