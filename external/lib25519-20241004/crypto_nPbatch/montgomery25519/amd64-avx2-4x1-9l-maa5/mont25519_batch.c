// 4-way variable base scalar multiplication

#include "fe25519.h"
#include "crypto_uint64_vec4x1.h"
#include "mont25519_batch.h"
#include "crypto_powbatch_inv25519.h"

int crypto_nP_4x1(unsigned char q[4][CRYPTO_BYTES], const unsigned char n[4][CRYPTO_BYTES], const unsigned char p[4][CRYPTO_BYTES]) {

	crypto_uint64_vec4x1 r[9] = {{0}};
	crypto_uint64_vec4x1 t[18] = {{0}};
	crypto_uint64_vec4x1 s[4] = {{0}};	
	fe25519_9l a[8];
	fe25519_5l b[8],d;
	fe25519 c[4];

	unsigned char i,j,m[4][CRYPTO_BYTES];

	for (i=0;i<4;++i) {

		for (j=0;j<CRYPTO_BYTES;++j) m[i][j] = n[i][j];
		m[i][CRYPTO_BYTES-1] = m[i][CRYPTO_BYTES-1] & 0x7F;
		m[i][CRYPTO_BYTES-1] = m[i][CRYPTO_BYTES-1] | 0x40;
		m[i][0] = m[i][0] & 0xF8;
	}		
	
	for (i=0;i<4;++i) fe25519_unpack(c+i,(const unsigned char *)(m+i));
	
	for (i=0;i<4;++i) for (j=0;j<4;++j) s[i][j] = c[j].l[i];
	
	for (i=0;i<4;++i) {
	
		fe25519_unpack(&c[0],(const unsigned char *)(p+i));
	  	fe25519_to_9l(a+i,&c[0]);
	}
	
	for (i=0;i<9;++i) for (j=0;j<4;++j) r[i][j] = a[j].l[i];
	
	mladder_4x1(t,r,s);
		
	for (j=0;j<4;++j) {

		for (i=0;i<9;++i) {

			a[j+0].l[i] = t[i+0*9][j]; 
			a[j+4].l[i] = t[i+1*9][j];
		}
		fe25519_9l_to_5l(&b[j+0],&a[j+0]);
		fe25519_9l_to_5l(&b[j+4],&a[j+4]);
	}

	for (i=0;i<4;++i) {
	
		fe25519_from_5l(&c[i],&b[i+4]);
		fe25519_pack((unsigned char *)(m+i),&c[i]);
	}

	crypto_powbatch_inv25519((unsigned char *)q,(const unsigned char *)m,4);
	
	for (i=0;i<4;++i) {
	
		fe25519_unpack(&c[i],(const unsigned char *)(q+i));
		fe25519_to_5l(&b[i+4],&c[i]);
	}

	for (j=0;j<4;++j) {

		fe25519_mul(&d,&b[j+4],&b[j]); 
  		fe25519_from_5l(&c[0],&d);
		fe25519_pack((unsigned char *)(q+j),&c[0]);
	}

	return 0;
}
