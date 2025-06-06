#ifndef FE25519_H
#define FE25519_H

/*#define fe25519              CRYPTO_NAMESPACE(fe25519)*/
/*#define fe25519_freeze       CRYPTO_SHARED_NAMESPACE(fe25519_freeze)*/
/*#define fe25519_unpack       CRYPTO_NAMESPACE(fe25519_unpack)*/
/*#define fe25519_pack         CRYPTO_NAMESPACE(fe25519_pack)*/
/*#define fe25519_iszero_vartime       CRYPTO_NAMESPACE(fe25519_iszero_vartime)*/
/*#define fe25519_iseq_vartime CRYPTO_NAMESPACE(fe25519_iseq_vartime)*/
/*#define fe25519_cmov         CRYPTO_NAMESPACE(fe25519_cmov)*/
/*#define fe25519_setint       CRYPTO_NAMESPACE(fe25519_setint)*/
/*#define fe25519_neg          CRYPTO_NAMESPACE(fe25519_neg)*/
/*#define fe25519_getparity    CRYPTO_NAMESPACE(fe25519_getparity)*/
/*#define fe25519_add          CRYPTO_NAMESPACE(fe25519_add)*/
/*#define fe25519_sub          CRYPTO_NAMESPACE(fe25519_sub)*/
/*#define fe25519_mul          CRYPTO_SHARED_NAMESPACE(fe25519_mul)*/
/*#define fe25519_mul121666    CRYPTO_NAMESPACE(fe25519_mul121666)*/
/*#define fe25519_square       CRYPTO_SHARED_NAMESPACE(fe25519_square)*/
/*#define fe25519_invert       CRYPTO_NAMESPACE(fe25519_invert)*/
/*#define fe25519_pow2523      CRYPTO_NAMESPACE(fe25519_pow2523)*/

typedef struct 
{
  unsigned long long v[4]; 
}
fe25519;

void fe25519_freeze(fe25519 *r);

void fe25519_unpack(fe25519 *r, const unsigned char x[32]);

void fe25519_pack(unsigned char r[32], const fe25519 *x);

void fe25519_intmul(fe25519 *r, const fe25519 *x, const fe25519 *y);

void fe25519_redmul(fe25519 *r, const fe25519 *x, const fe25519 *y);

void fe25519_intmul_nsquare(fe25519 *r, const fe25519 *x, long long n);

void fe25519_redmul_nsquare(fe25519 *r, const fe25519 *x, long long n);

void fe25519_intmul_square(fe25519 *r, const fe25519 *x);

void fe25519_redmul_square(fe25519 *r, const fe25519 *x);

void fe25519_intmul_invert(fe25519 *r, const fe25519 *x);

void fe25519_redmul_invert(fe25519 *r, const fe25519 *x);

#endif
