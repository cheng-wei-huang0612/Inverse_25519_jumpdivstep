#include <stdio.h>

unsigned long long cpucycles(void)
{ 
    unsigned int hi, lo;

    asm volatile ("rdtsc\n\t" : "=a" (lo), "=d"(hi));
    return ((long long)lo) | (((long long)hi) << 32);
}

unsigned long long t[100];

extern void innerloop(void);

int main()
{
  long long i;

  for (i = 0;i < 100;++i) {
    t[i] = cpucycles();
    innerloop();
  }
  for (i = 99;i > 0;--i) t[i] -= t[i-1];
  for (i = 1;i < 100;++i)
    printf(" %lld",t[i]);
  printf("\n");
}
