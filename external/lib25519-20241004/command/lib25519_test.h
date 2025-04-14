#ifndef lib25519_test_h
#define lib25519_test_h

#define aligned lib25519_test_aligned
#define callocplus lib25519_test_callocplus
#define checksum lib25519_test_checksum
#define checksum_clear lib25519_test_checksum_clear
#define checksum_expected lib25519_test_checksum_expected
#define double_canary lib25519_test_double_canary
#define endianness lib25519_test_endianness
#define forked lib25519_test_forked
#define input_compare lib25519_test_input_compare
#define input_prepare lib25519_test_input_prepare
#define myrandom lib25519_test_myrandom
#define ok lib25519_test_ok
#define output_compare lib25519_test_output_compare
#define output_prepare lib25519_test_output_prepare
#define public lib25519_test_public
#define secret lib25519_test_secret
#define targeti lib25519_test_targeti
#define targetn lib25519_test_targetn
#define targetoffset lib25519_test_targetoffset
#define targeto lib25519_test_targeto
#define targetp lib25519_test_targetp
#define valgrind lib25519_test_valgrind

extern const char *targeto;
extern const char *targetp;
extern const char *targeti;
extern const char *targetn;
extern const char *targetoffset;
extern int ok;
extern int valgrind;

extern unsigned long long myrandom(void);
extern void forked(void (*)(long long),long long);
extern void *aligned(void *,long long);
extern void *callocplus(long long);
extern void secret(void *,long long);
extern void public(void *,long long);
extern void double_canary(unsigned char *,unsigned char *,unsigned long long);
extern void input_prepare(unsigned char *,unsigned char *,unsigned long long);
extern void output_prepare(unsigned char *,unsigned char *,unsigned long long);
extern void input_compare(const unsigned char *,const unsigned char *,unsigned long long,const char *);
extern void output_compare(const unsigned char *,const unsigned char *,unsigned long long,const char *);
extern void checksum_expected(const char *);
extern void checksum(const unsigned char *,unsigned long long);
extern void checksum_clear(void);
extern void endianness(unsigned char *,unsigned long long,unsigned long long);

#define test_hashblocks_sha512 lib25519_test_hashblockssha512
extern void test_hashblocks_sha512(void);
#define test_hash_sha512 lib25519_test_hashsha512
extern void test_hash_sha512(void);
#define test_pow_inv25519 lib25519_test_powinv25519
extern void test_pow_inv25519(void);
#define test_powbatch_inv25519 lib25519_test_powbatchinv25519
extern void test_powbatch_inv25519(void);
#define test_nP_montgomery25519 lib25519_test_nPmontgomery25519
extern void test_nP_montgomery25519(void);
#define test_nPbatch_montgomery25519 lib25519_test_nPbatchmontgomery25519
extern void test_nPbatch_montgomery25519(void);
#define test_nG_merged25519 lib25519_test_nGmerged25519
extern void test_nG_merged25519(void);
#define test_nG_montgomery25519 lib25519_test_nGmontgomery25519
extern void test_nG_montgomery25519(void);
#define test_mGnP_ed25519 lib25519_test_mGnPed25519
extern void test_mGnP_ed25519(void);
#define test_multiscalar_ed25519 lib25519_test_multiscalared25519
extern void test_multiscalar_ed25519(void);
#define test_dh_x25519 lib25519_test_dhx25519
extern void test_dh_x25519(void);
#define test_sign_ed25519 lib25519_test_signed25519
extern void test_sign_ed25519(void);
#endif
