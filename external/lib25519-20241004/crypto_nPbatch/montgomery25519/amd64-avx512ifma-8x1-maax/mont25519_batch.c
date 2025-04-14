// 8-way variable base scalar multiplication

#include "fe25519.h"
#include "crypto_uint64_vec8x1.h"
#include "mont25519_batch.h"
#include "crypto_powbatch_inv25519.h"

int crypto_nP_8x1(unsigned char q[8][CRYPTO_BYTES], const unsigned char n[8][CRYPTO_BYTES], const unsigned char p[8][CRYPTO_BYTES]) {

	crypto_uint64_vec8x1 r[5] = {{0}};
	crypto_uint64_vec8x1 t[10] = {{0}};
	crypto_uint64_vec8x1 s[4] = {{0}};	
	fe25519_base52_5l a[16];
	fe25519 b[32],c;

	unsigned char i,j,m[8][CRYPTO_BYTES];

	for (i=0;i<8;++i) {

		for (j=0;j<CRYPTO_BYTES;++j) m[i][j] = n[i][j];
		m[i][CRYPTO_BYTES-1] = m[i][CRYPTO_BYTES-1] & 0x7F;
		m[i][CRYPTO_BYTES-1] = m[i][CRYPTO_BYTES-1] | 0x40;
		m[i][0] = m[i][0] & 0xF8;
	}		
	
	for (i=0;i<8;++i) fe25519_unpack(b+i,(const unsigned char *)(m+i));
	
	for (i=0;i<4;++i) for (j=0;j<8;++j) s[i][j] = b[j].l[i];
	
	for (i=0;i<8;++i) {
	
		fe25519_unpack(&c,(const unsigned char *)(p+i));
	  	fe25519_to_base52_5l(a+i,&c);
	}
	
	for (i=0;i<5;++i) for (j=0;j<8;++j) r[i][j] = a[j].l[i];
	
	mladder_8x1(t,r,s);
		
	for (j=0;j<8;++j) {

		for (i=0;i<5;++i) {

			a[j+0].l[i] = t[i+0*5][j]; 
			a[j+8].l[i] = t[i+1*5][j];
		}
		fe25519_from_base52_5l(&b[j+0],&a[j+0]);
		fe25519_from_base52_5l(&b[j+8],&a[j+8]);
	}
	
	for (i=0;i<8;++i) fe25519_pack((unsigned char *)(m+i),&b[i+8]);

	crypto_powbatch_inv25519((unsigned char *)q,(const unsigned char *)m,8);
	
	for (i=0;i<8;++i) fe25519_unpack(b+i+24,(const unsigned char *)(q+i));	

	for (j=0;j<8;++j) {

		fe25519_mul(&b[8],&b[j+24],&b[j]); 
		fe25519_pack((unsigned char *)(q+j),&b[8]);
	}

	return 0;
}
