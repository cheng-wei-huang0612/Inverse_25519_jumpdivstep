#include <stdint.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define radix (15)
//#define radix (60)
//#define plen 2048
#define radix (30)
#define limbs ((2048-1)/64+1)
#define bigloops (1439/radix+1)
#define topbits (2048-radix*(limbs-1))
#define slimbs ((2048-1)/30+1)

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


extern void inverse_2048 (int64_t *f, int64_t *g, const int64_t *table); 
/* This is the 2048 bit prime */
static const __attribute__((aligned(32)))
int64_t table[332]={0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL, 0x3FFFFFFFLL,
    0x200000000LL, 0x200000000LL, 0x200000000LL, 0x200000000LL,
    0x8000000000000000LL, 0x8000000000000000LL,
    0x8000000000000000LL, 0x8000000000000000LL, 
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0X7FFFFFFE00000000LL, 0X7FFFFFFE00000000LL,
    0x20000000LL, 0x20000000LL, 0x20000000LL, 0x20000000LL,
    0x6553e355d3bfd199ULL, 0x25729fc8b0a55257ULL,
    0xc4fbc8bc93577489ULL, 0xfeb9552405a18c97ULL,
    0x4c9679160ec0ab49ULL, 0xc89dce7653a509b9ULL,
    0x18885476e6561d98ULL, 0x5920577ce6e0feb2ULL,
    0xd502a66aaf91b2b5ULL, 0xf4c6d99c072ce532ULL,
    0xb9badb4c078c91b9ULL, 0x4082c6aefbe4ceabULL,
    0x897d4709986429dfULL, 0x90a63577af4afd3bULL,
    0xb57012176b24ad48ULL, 0x7fd716398988b346ULL,
    0xc410b6de6677b027ULL, 0x3f81dc8ec570a50dULL,
    0xf5e659ed722deffeULL, 0x8cc0b327cb028b22ULL,
    0x0f908103cfbd18c5ULL, 0x3e55a692ee85227dULL,
    0x18e0f063d0d22b99ULL, 0x1a0972465b381e85ULL,
    0xeb97b371ccb09515ULL, 0xb0ee02f4114d3a19ULL,
    0x804500d58dd12894ULL, 0xcab2558332f210b7ULL,
    0x500890ee62e03866ULL, 0xff0644e70deb5e1bULL,
    0xa930dd081b742ae6ULL, 0xada67757d74f92e9ULL,
    0x013bfd199LL, 0LL, 0LL, 0x003a69e4aLL,
    0x0154f8d57LL, 0LL, 0LL, 0x010055f4fLL,
    0x00a552576LL, 0LL, 0LL, 0x030c8955dLL,
    0x01ca7f22cLL, 0LL, 0LL, 0x0062dcf44LL,
    0x017748925LL, 0LL, 0LL, 0x0167f7358LL,
    0x02f22f24dLL, 0LL, 0LL, 0x015500bd3LL,
    0x018c97c4fLL, 0LL, 0LL, 0x030eb947fLL,
    0x015490168LL, 0LL, 0LL, 0x0171306fbLL,
    0x02b49feb9LL, 0LL, 0LL, 0x01be4f483LL,
    0x024583b02LL, 0LL, 0LL, 0x02bcc1e09LL,
    0x01b94c967LL, 0LL, 0LL, 0x01f15be78LL,
    0x01d94e942LL, 0LL, 0LL, 0x0101b1ed0LL,
    0x018c89dceLL, 0LL, 0LL, 0x0076d262eLL,
    0x01b995876LL, 0LL, 0LL, 0x032436a1cLL,
    0x021888547LL, 0LL, 0LL, 0x0309891f7LL,
    0x039b83facLL, 0LL, 0LL, 0x01b023865LL,
    0x01920577cLL, 0LL, 0LL, 0x01df54a3eLL,
    0x03e46cad5LL, 0LL, 0LL, 0x02ff8b813LL,
    0x0102a66aaLL, 0LL, 0LL, 0x01a6e72a9LL,
    0x00b394cb5LL, 0LL, 0LL, 0x00fd2e3b4LL,
    0x006d99c07LL, 0LL, 0LL, 0x00d0c8363LL,
    0x03246e7d3LL, 0LL, 0LL, 0x0282183daLL,
    0x02db4c078LL, 0LL, 0LL, 0x02cda18a0LL,
    0x033aaee6eLL, 0LL, 0LL, 0x0027393fcLL,
    0x006aefbe4LL, 0LL, 0LL, 0x02973430bLL,
    0x0277d020bLL, 0LL, 0LL, 0x00268207fLL,
    0x030998642LL, 0LL, 0LL, 0x01b1ead68LL,
    0x00ee25f51LL, 0LL, 0LL, 0x0377bc2b4LL,
    0x037af4afdLL, 0LL, 0LL, 0x03b3a826eLL,
    0x0224298d5LL, 0LL, 0LL, 0x03fe11a73LL,
    0x036b24ad4LL, 0LL, 0LL, 0x017d3d4e4LL,
    0x02d5c0485LL, 0LL, 0LL, 0x002a76039LL,
    0x00988b346LL, 0LL, 0LL, 0x021da09a8LL,
    0x03f5c58e6LL, 0LL, 0LL, 0x03e6d7234LL,
    0x0277b0277LL, 0LL, 0LL, 0x00caedc96LL,
    0x0042db799LL, 0LL, 0LL, 0x026594d8cLL,
    0x030a50dc4LL, 0LL, 0LL, 0x03ee4aa7eLL,
    0x007723b15LL, 0LL, 0LL, 0x02d7c03beLL,
    0x01effe3f8LL, 0LL, 0LL, 0x03d6d7340LL,
    0x0167b5c8bLL, 0LL, 0LL, 0x0002e8af2LL,
    0x00b22f5e6LL, 0LL, 0LL, 0x0375c5677LL,
    0x00c9f2c0aLL, 0LL, 0LL, 0x02eac7bbaLL,
    0x00c58cc0bLL, 0LL, 0LL, 0x03a2e291dLL,
    0x000f3ef46LL, 0LL, 0LL, 0x0125afbe5LL,
    0x03d0f9081LL, 0LL, 0LL, 0x024a2fd5cLL,
    0x00bba1489LL, 0LL, 0LL, 0x0206a2d5aLL,
    0x013e55a69LL, 0LL, 0LL, 0x021d21689LL,
    0x034348ae6LL, 0LL, 0LL, 0x004508408LL,
    0x018e0f063LL, 0LL, 0LL, 0x0257eb030LL,
    0x02ce07a14LL, 0LL, 0LL, 0x0247718a8LL,
    0x020972465LL, 0LL, 0LL, 0x00415ebbeLL,
    0x02c254546LL, 0LL, 0LL, 0x035a401f0LL,
    0x017b371ccLL, 0LL, 0LL, 0x01ba6c9e3LL,
    0x034e867aeLL, 0LL, 0LL, 0x01c56e835LL,
    0x0202f4114LL, 0LL, 0LL, 0x03840d998LL,
    0x00a252c3bLL, 0LL, 0LL, 0x02bd8d20fLL,
    0x000d58dd1LL, 0LL, 0LL, 0x030c04423LL,
    0x002de0114LL, 0LL, 0LL, 0x019c2abddLL,
    0x018332f21LL, 0LL, 0LL, 0x032dd87c2LL,
    0x019b2ac95LL, 0LL, 0LL, 0x01fbf2a73LL,
    0x02e62e038LL, 0LL, 0LL, 0x010c5089fLL,
    0x02d402243LL, 0LL, 0LL, 0x03417cd6aLL,
    0x030deb5e1LL, 0LL, 0LL, 0x036330c57LL,
    0x03fc19139LL, 0LL, 0LL, 0x0391214cbLL,
    0x01b742ae6LL, 0LL, 0LL, 0x00d595eb0LL,
    0x024c37420LL, 0LL, 0LL, 0x0148a6073LL,
    0x034f92e9aLL, 0LL, 0LL, 0x01d95a3deLL,
    0x0299dd5f5LL, 0LL, 0LL, 0x0100e20ffLL,
    0x0000000adLL, 0LL, 0LL, 0x00000007fLL,
    0xd91e349aee630d57ULL, 0LL, 0LL, 0LL};

char p_2048_bytes[256] =
  {
   0x99, 0xd1, 0xbf, 0xd3, 0x55, 0xe3, 0x53, 0x65,
   0x57, 0x52, 0xa5, 0xb0, 0xc8, 0x9f, 0x72, 0x25,
   0x89, 0x74, 0x57, 0x93, 0xbc, 0xc8, 0xfb, 0xc4,
   0x97, 0x8c, 0xa1, 0x05, 0x24, 0x55, 0xb9, 0xfe,
   0x49, 0xab, 0xc0, 0x0e, 0x16, 0x79, 0x96, 0x4c,
   0xb9, 0x09, 0xa5, 0x53, 0x76, 0xce, 0x9d, 0xc8,
   0x98, 0x1d, 0x56, 0xe6, 0x76, 0x54, 0x88, 0x18,
   0xb2, 0xfe, 0xe0, 0xe6, 0x7c, 0x57, 0x20, 0x59,
   0xb5, 0xb2, 0x91, 0xaf, 0x6a, 0xa6, 0x02, 0xd5,
   0x32, 0xe5, 0x2c, 0x07, 0x9c, 0xd9, 0xc6, 0xf4,
   0xb9, 0x91, 0x8c, 0x07, 0x4c, 0xdb, 0xba, 0xb9,
   0xab, 0xce, 0xe4, 0xfb, 0xae, 0xc6, 0x82, 0x40,
   0xdf, 0x29, 0x64, 0x98, 0x09, 0x47, 0x7d, 0x89,
   0x3b, 0xfd, 0x4a, 0xaf, 0x77, 0x35, 0xa6, 0x90,
   0x48, 0xad, 0x24, 0x6b, 0x17, 0x12, 0x70, 0xb5,
   0x46, 0xb3, 0x88, 0x89, 0x39, 0x16, 0xd7, 0x7f,
   0x27, 0xb0, 0x77, 0x66, 0xde, 0xb6, 0x10, 0xc4,
   0x0d, 0xa5, 0x70, 0xc5, 0x8e, 0xdc, 0x81, 0x3f,
   0xfe, 0xef, 0x2d, 0x72, 0xed, 0x59, 0xe6, 0xf5,
   0x22, 0x8b, 0x02, 0xcb, 0x27, 0xb3, 0xc0, 0x8c,
   0xc5, 0x18, 0xbd, 0xcf, 0x03, 0x81, 0x90, 0x0f,
   0x7d, 0x22, 0x85, 0xee, 0x92, 0xa6, 0x55, 0x3e,
   0x99, 0x2b, 0xd2, 0xd0, 0x63, 0xf0, 0xe0, 0x18,
   0x85, 0x1e, 0x38, 0x5b, 0x46, 0x72, 0x09, 0x1a,
   0x15, 0x95, 0xb0, 0xcc, 0x71, 0xb3, 0x97, 0xeb,
   0x19, 0x3a, 0x4d, 0x11, 0xf4, 0x02, 0xee, 0xb0,
   0x94, 0x28, 0xd1, 0x8d, 0xd5, 0x00, 0x45, 0x80,
   0xb7, 0x10, 0xf2, 0x32, 0x83, 0x55, 0xb2, 0xca,
   0x66, 0x38, 0xe0, 0x62, 0xee, 0x90, 0x08, 0x50,
   0x1b, 0x5e, 0xeb, 0x0d, 0xe7, 0x44, 0x06, 0xff,
   0xe6, 0x2a, 0x74, 0x1b, 0x08, 0xdd, 0x30, 0xa9,
   0xe9, 0x92, 0x4f, 0xd7, 0x57, 0x77, 0xa6, 0xad};
  
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
     inverse_2048(f,g,table);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     ,
     time_inverse_2048,
     "inverse_2048")
TIME(g[0] = -19; g[limbs-1] = (1<<topbits);
     for (j=1; j<limbs-1; j++) g[j] = 0;
     for (j = 0;j < 1000;++j) inverse_2048(f,g,table);
     ,
     int64_t f[limbs];
     int64_t g[limbs];
     ,
     time_inverse_2048_x1000,
     "inverse_2048_x1000")

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
  time_inverse_2048;
  time_inverse_2048_x1000();

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
    
    inverse_2048(f,g,table);
    
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
