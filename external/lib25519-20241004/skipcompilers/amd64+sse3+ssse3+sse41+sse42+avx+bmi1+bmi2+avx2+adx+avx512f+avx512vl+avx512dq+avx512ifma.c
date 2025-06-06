#define CPUID(func,leaf,a,b,c,d) \
  __asm("cpuid":"=a"(a),"=b"(b),"=c"(c),"=d"(d):"a"(func),"c"(leaf):)

#define WANT_1_3 ((1<<23)|(1<<25)|(1<<26))
/* 23=mmx; 25=sse; 26=sse2 */

#define WANT_1_2 ((1<<0)|(1<<9)|(1<<19)|(1<<20)|(1<<27)|(1<<28))
/* 0=sse3; 9=ssse3; 19=sse41; 20=sse42; 27=osxsave; 28=avx */

#define WANT_7_1 ((1<<3)|(1<<5)|(1<<8)|(1<<16)|(1<<17)|(1<<19)|(1<<21)|(1<<31))
/* 3=bmi1; 5=avx2; 8=bmi2; 16=avx512_f; 17=avx512_dq; 19=adx; 21=avx512_ifma; 31=avx512_vl */

#define WANT_XCR ((1<<1)|(1<<2))
/* 1=xmm; 2=ymm */

int supports(void)
{
  unsigned int cpuidmax,id0,id1,id2;
  unsigned int familymodelstepping;
  unsigned int feature0,feature1,feature2,feature3;
  unsigned int xcrlow,xcrhigh;

  CPUID(0,0,cpuidmax,id0,id1,id2);
  if (cpuidmax < 7) return 0;

  CPUID(1,0,familymodelstepping,feature1,feature2,feature3);
  if (WANT_1_2 != (WANT_1_2 & feature2)) return 0;
  if (WANT_1_3 != (WANT_1_3 & feature3)) return 0;

  CPUID(7,0,feature0,feature1,feature2,feature3);
  if (WANT_7_1 != (WANT_7_1 & feature1)) return 0;

  asm(".byte 15;.byte 1;.byte 208":"=a"(xcrlow),"=d"(xcrhigh):"c"(0));
  if (WANT_XCR != (WANT_XCR & xcrlow)) return 0;

  return 1;
}
