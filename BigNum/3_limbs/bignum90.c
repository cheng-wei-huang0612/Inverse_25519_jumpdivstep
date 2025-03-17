//gcc bignum90.c \
//    -I/opt/homebrew/include \
//    -L/opt/homebrew/lib \
//    -lgmp \
//    -o bignum90 && ./bignum90


#include <stdio.h>
#include <stdint.h>
#include <gmp.h>

#define LIMBS 3

typedef struct {
    int32_t limb[LIMBS];
} big90_t;

typedef struct {
    int32_t limb[2*LIMBS];
} big180_t;

void print_big_90_t(const big90_t *a){
    int32_t limb0 = a->limb[0];
    int32_t limb1 = a->limb[1];
    int32_t limb2 = a->limb[2];

    mpz_t mpA, tmp;
    mpz_init(mpA);
    mpz_init(tmp);

    mpz_set_si(tmp, limb2); // tmp = limb2 
    mpz_mul_2exp(tmp, tmp, 60); // tmp <<= 60
    mpz_add(mpA, mpA, tmp);

    mpz_set_si(tmp, limb1); // tmp = limb2 
    mpz_mul_2exp(tmp, tmp, 30); // tmp <<= 60
    mpz_add(mpA, mpA, tmp);

    mpz_set_si(tmp, limb0); // tmp = limb2 
    mpz_add(mpA, mpA, tmp);

    gmp_printf("%Zd", mpA);
    mpz_clear(tmp);
    mpz_clear(mpA);
}

void mpz_from_big90(const big90_t *a, mpz_t rop) {
    // 通常你會假設呼叫者已經先 mpz_init(rop)
    // 若你想在此函式內 init，也可以，但就得在函式內 clear，相當不直觀

    mpz_set_ui(rop, 0); // 若需要先歸零
    mpz_t tmp;
    mpz_init(tmp);

    // 依照 limb 逐步組合
    mpz_set_si(tmp, a->limb[2]);
    mpz_mul_2exp(tmp, tmp, 60);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[1]);
    mpz_mul_2exp(tmp, tmp, 30);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[0]);
    mpz_add(rop, rop, tmp);

    mpz_clear(tmp);
}

void mpz_from_big180(const big180_t *a, mpz_t rop) {
    // 通常你會假設呼叫者已經先 mpz_init(rop)
    // 若你想在此函式內 init，也可以，但就得在函式內 clear，相當不直觀

    mpz_set_ui(rop, 0); // 若需要先歸零
    mpz_t tmp;
    mpz_init(tmp);

    // 依照 limb 逐步組合
    mpz_set_si(tmp, a->limb[5]);
    mpz_mul_2exp(tmp, tmp, 150);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[4]);
    mpz_mul_2exp(tmp, tmp, 120);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[3]);
    mpz_mul_2exp(tmp, tmp, 90);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[2]);
    mpz_mul_2exp(tmp, tmp, 60);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[1]);
    mpz_mul_2exp(tmp, tmp, 30);
    mpz_add(rop, rop, tmp);

    mpz_set_si(tmp, a->limb[0]);
    mpz_add(rop, rop, tmp);

    mpz_clear(tmp);
}

void big90_add(const big90_t *a, const big90_t *b, big90_t *r) {
    int32_t limb0 = 0;
    int32_t limb1 = 0;
    int32_t limb2 = 0;

    limb0 = (a->limb[0]) + (b->limb[0]);
    limb1 = (a->limb[1]) + (b->limb[1]);
    limb2 = (a->limb[2]) + (b->limb[2]);

    limb1 += (limb0 >> 30);
    limb0 &= ((int32_t) 1 << 30) - 1;

    limb2 += (limb1 >> 30);
    limb1 &= ((int32_t) 1 << 30) - 1;

    r->limb[0] = limb0; 
    r->limb[1] = limb1;
    r->limb[2] = limb2;
}



int main(){
    printf("Hello\n\n");

    big90_t a_big, b_big;
    big180_t r_big = {0}; 

    a_big.limb[0] = 1303317654;
    a_big.limb[1] = 272580427;
    a_big.limb[2] = -149120;

    b_big.limb[0] = 296860118;
    b_big.limb[1] = 1234234234;
    b_big.limb[2] = -2039569;

    // Compute a(unsigned) X b(unsigned)
    
    int32_t limb0 = 0;
    int32_t limb1 = 0;
    int32_t limb2 = 0;
    int32_t limb3 = 0;
    int32_t limb4 = 0;
    int32_t limb5 = 0;

    uint64_t temp, temp_low; 


    



    mpz_t mpA, mpB, mpProd, mpR; 
    mpz_init(mpA);
    mpz_init(mpB);
    mpz_init(mpProd);
    mpz_init(mpR);

    mpz_from_big90( &a_big, mpA);
    mpz_from_big90( &b_big, mpB);
    mpz_from_big180( &r_big, mpR);
    mpz_mul(mpProd, mpA, mpB);
    

    gmp_printf("mpA = %Zd\n",mpA);
    gmp_printf("mpB = %Zd\n",mpB);
    gmp_printf("mpR = %Zd\n",mpR);
    gmp_printf("%Zd\n",mpProd);
    
    





    printf("\n\nByeBye");
}
