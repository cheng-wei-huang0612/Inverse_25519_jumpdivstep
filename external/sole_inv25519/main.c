
#include "fe25519.h"
#include <stdio.h>


int main(void) {
    printf("hello");

    fe25519 a = {2, 1, 1, 1};
    fe25519 b;
    fe25519 c;


    fe25519_redmul_invert(&c, &a);

    printf("The inverse seems to be:\n");
    for (int i = 0; i < 4; i++) {
        printf("limb%d = %llu\n", i, c.v[i]);
    }

    fe25519_redmul(&b, &c, &a);
    fe25519_freeze(&b);
    printf("Check the product\n");
    for (int i = 0; i < 4; i++) {
        printf("limb%d = %llu\n", i, b.v[i]);
    }



    return 0;
}
