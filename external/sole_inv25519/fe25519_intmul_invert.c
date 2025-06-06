// linker define fe25519_invert
// linker use fe25519_mul
// linker use fe25519_square
// linker use fe25519_nsquare

#include "fe25519.h"

void fe25519_intmul_invert(fe25519 *r, const fe25519 *x)
{
	fe25519 z2;
	fe25519 z9;
	fe25519 z11;
	fe25519 z2_5_0;
	fe25519 z2_10_0;
	fe25519 z2_20_0;
	fe25519 z2_50_0;
	fe25519 z2_100_0;
	fe25519 t;
	
	/* 2 */ fe25519_intmul_square(&z2,x);
	/* 4 */ fe25519_intmul_square(&t,&z2);
	/* 8 */ fe25519_intmul_square(&t,&t);
	/* 9 */ fe25519_intmul(&z9,&t,x);
	/* 11 */ fe25519_intmul(&z11,&z9,&z2);
	/* 22 */ fe25519_intmul_square(&t,&z11);
	/* 2^5 - 2^0 = 31 */ fe25519_intmul(&z2_5_0,&t,&z9);

	/* 2^10 - 2^5 */ fe25519_intmul_nsquare(&t,&z2_5_0,5);
	/* 2^10 - 2^0 */ fe25519_intmul(&z2_10_0,&t,&z2_5_0);

	/* 2^20 - 2^10 */ fe25519_intmul_nsquare(&t,&z2_10_0,10);
	/* 2^20 - 2^0 */ fe25519_intmul(&z2_20_0,&t,&z2_10_0);

	/* 2^40 - 2^20 */ fe25519_intmul_nsquare(&t,&z2_20_0,20);
	/* 2^40 - 2^0 */ fe25519_intmul(&t,&t,&z2_20_0);

	/* 2^50 - 2^10 */ fe25519_intmul_nsquare(&t,&t,10);
	/* 2^50 - 2^0 */ fe25519_intmul(&z2_50_0,&t,&z2_10_0);

	/* 2^100 - 2^50 */ fe25519_intmul_nsquare(&t,&z2_50_0,50);
	/* 2^100 - 2^0 */ fe25519_intmul(&z2_100_0,&t,&z2_50_0);

	/* 2^200 - 2^100 */ fe25519_intmul_nsquare(&t,&z2_100_0,100);
	/* 2^200 - 2^0 */ fe25519_intmul(&t,&t,&z2_100_0);

	/* 2^250 - 2^50 */ fe25519_intmul_nsquare(&t,&t,50);
	/* 2^250 - 2^0 */ fe25519_intmul(&t,&t,&z2_50_0);

	/* 2^255 - 2^5 */ fe25519_intmul_nsquare(&t,&t,5);
	/* 2^255 - 21 */ fe25519_intmul(r,&t,&z11);
}
