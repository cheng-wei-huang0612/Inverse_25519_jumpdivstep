#include <stdint.h>
#include <stdio.h>
#include "sign_adjustment.h"
#include "big30.h"

void sign_adjustment(big30_t *inv30, big30_t *F, big30_t *V) {
    int32_t diff = ((int32_t)F->limb[0]) ^ ((1<<30) - 1);
    int32_t mask = ~((diff | -diff) >> 31);

    // big30_9 inv30;
    uint32_t borrow = 0;

    for (int i = 0; i < 9; i++) {
        inv30->limb[i] = 0;
        inv30->limb[i] += mask & P.limb[i];
    }
    inv30->limb[0] += (mask & 18); // inv30 == 2^255 - 1, the borrow will never happen
                          
    for (int i = 0; i < 9; i++) {
        inv30->limb[i] -= mask & V->limb[i];
        inv30->limb[i] += (~mask) & V->limb[i];
    }

    // if mask is set, minus the inv30 by 18
    // else minus the inv30 by 0
    // turns out: minus the inv30 by (18 & mask) and propagate the borrow

    inv30->limb[0] -= (mask & 18);

    for (int i = 0; i < 8; i++) {
        borrow = (inv30->limb[i]) >> 31;
        inv30->limb[i+1] = (inv30->limb[i+1]) - borrow;
        inv30->limb[i] = (inv30->limb[i]) + (borrow << 30);
    }
}

