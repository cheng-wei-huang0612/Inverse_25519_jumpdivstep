#ifndef UPDATE_VS
#define UPDATE_VS

#include <stdint.h>
#include <stdio.h>
#include "big30.h"
#include <gmp.h>

void update_VS_mont(big30_t *V, big30_t *S, int64_t *uu, int64_t *vv, int64_t *rr, int64_t *ss);

#endif
