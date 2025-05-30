#include <stdio.h>
#include <stdint.h>

extern void bignum_inv_p25519(uint64_t z[static 4],const uint64_t x[static 4]);
extern void bignum_mul_p25519(uint64_t z[static 4], const uint64_t x[static 4],
                                 const uint64_t y[static 4]);


int main(void) {
    printf("hello\n");

    uint64_t a[4] = {2, 43124, 12, 127};
    uint64_t b[4];
    uint64_t c[4];


    bignum_inv_p25519(c, a);

    printf("The inverse seems to be:\n");
    for (int i = 0; i < 4; i++) {
        printf("limb%d = %llu\n", i, c[i]);
    }

    bignum_mul_p25519(b, c, a);
    //fe25519_freeze(&b);
    printf("Check the product\n");
    for (int i = 0; i < 4; i++) {
        printf("limb%d = %llu\n", i, b[i]);
    }



    return 0;
}
