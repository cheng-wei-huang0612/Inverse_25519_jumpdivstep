#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>

#include <arm_neon.h>

#include "common/hal.h"
#include "common/fe25519.h"
#include "common/data.h"

#define ITERATIONS 10000

uint64_t t0, t1;
uint64_t times[ITERATIONS];

static int cmp_uint64(const void *a, const void *b){
    return ((*((const uint64_t*)a)) - ((*((const uint64_t*)b))));
}



extern void fe25519_intmul_invert(fe25519 *r, const fe25519 *x);
extern void fe25519_redmul_invert(fe25519 *r, const fe25519 *x);






int main(void){

    fe25519 op0, op1, op2, op3;
    fe25519 rop;


    for(size_t i = 0; i < (ITERATIONS>>2); i++) {
        op0 = vec_in[4*i + 0];
        op1 = vec_in[4*i + 1];
        op2 = vec_in[4*i + 2];
        op3 = vec_in[4*i + 3];
        t0 = hal_get_time();
        fe25519_intmul_invert(&rop, &op0);
        fe25519_intmul_invert(&rop, &op1);
        fe25519_intmul_invert(&rop, &op2);
        fe25519_intmul_invert(&rop, &op3);


        t1 = hal_get_time();
        times[i] = t1 - t0;
    }
    qsort(times, ITERATIONS, sizeof(uint64_t), cmp_uint64);
    printf("fe25519_intmul_invert: %lld\n", times[ITERATIONS >> 1]);

    /*for(size_t i = 0; i < ITERATIONS; i++){*/
    /*    t0 = hal_get_time();*/
    /*    t1 = hal_get_time();*/
    /*    times[i] = t1 - t0;*/
    /*}*/
    /*qsort(times, ITERATIONS, sizeof(uint64_t), cmp_uint64);*/
    /*printf("fe25519_intmul_invert: %lld\n", times[ITERATIONS >> 1]);*/

}






