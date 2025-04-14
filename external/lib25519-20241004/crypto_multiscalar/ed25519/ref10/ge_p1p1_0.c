// linker define ge_p1p1_0
// linker use fe_0
// linker use fe_1

#include "ge_p1p1_0.h"

void ge_p1p1_0(ge_p1p1 *h)
{
  fe_0(h->X);
  fe_1(h->Y);
  fe_1(h->Z);
  fe_1(h->T);
}
