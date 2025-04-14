#include <stdint.h>
#include <stdio.h>
#include "uv_extraction.h"
//#include "big30.h"
#include <gmp.h>


void extraction(int64_t *u, int64_t *v, int64_t *fuv) {
    *v = ((*fuv) + ((int64_t)1 << 20) + ((int64_t)1 << 41));
    *v = (*v) >> 42;

    *u = ((*fuv) + ((int64_t)1 << 20));
    *u = (uint64_t) (*u) << 22;
    *u = (*u) >> 43;
}

