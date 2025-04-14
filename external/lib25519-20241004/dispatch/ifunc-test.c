#include <stdlib.h>

int xyzzy_inner1(void) { return 1; }
int xyzzy_inner2(void) { return 2; }

void *xyzzy_select(void)
{
  if (getenv("2")) return xyzzy_inner2;
  return xyzzy_inner1;
}

int xyzzy_wrapper(void) __attribute__((ifunc("xyzzy_select")));
