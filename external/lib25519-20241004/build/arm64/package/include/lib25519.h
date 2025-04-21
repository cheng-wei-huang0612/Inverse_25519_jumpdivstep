/*

The stable lib25519 API consists of the functions defined in `api.md`.
Other functions defined in `lib25519.h` (e.g., functions used for
internal tests and benchmarks) may change.

*/

#ifndef lib25519_h
#define lib25519_h

#ifdef __cplusplus
extern "C" {
#endif


#define lib25519_version "20241004"
#define lib25519_arch "arm64"

extern void lib25519_cpuid(unsigned int *,long long);

#define lib25519_verify_BYTES 32

#define lib25519_verify_32_BYTES 32

#define lib25519_verify lib25519_verify_32
#define lib25519_dispatch_verify lib25519_dispatch_verify_32

extern int lib25519_verify_32(const unsigned char *,const unsigned char *);
extern int (*lib25519_dispatch_verify_32(long long))(const unsigned char *,const unsigned char *);

#define lib25519_verify_implementation lib25519_verify_32_implementation
#define lib25519_verify_compiler lib25519_verify_32_compiler
#define lib25519_dispatch_verify_implementation lib25519_dispatch_verify_32_implementation
#define lib25519_dispatch_verify_compiler lib25519_dispatch_verify_32_compiler
#define lib25519_numimpl_verify lib25519_numimpl_verify_32

extern const char *lib25519_verify_32_implementation(void);
extern const char *lib25519_verify_32_compiler(void);
extern const char *lib25519_dispatch_verify_32_implementation(long long);
extern const char *lib25519_dispatch_verify_32_compiler(long long);
extern long long lib25519_numimpl_verify_32(void);

#define lib25519_hashblocks_STATEBYTES 64
#define lib25519_hashblocks_BLOCKBYTES 128

#define lib25519_hashblocks_sha512_STATEBYTES 64
#define lib25519_hashblocks_sha512_BLOCKBYTES 128

#define lib25519_hashblocks lib25519_hashblocks_sha512
#define lib25519_dispatch_hashblocks lib25519_dispatch_hashblocks_sha512

extern int lib25519_hashblocks_sha512(unsigned char *,const unsigned char *,long long);
extern int (*lib25519_dispatch_hashblocks_sha512(long long))(unsigned char *,const unsigned char *,long long);

#define lib25519_hashblocks_implementation lib25519_hashblocks_sha512_implementation
#define lib25519_hashblocks_compiler lib25519_hashblocks_sha512_compiler
#define lib25519_dispatch_hashblocks_implementation lib25519_dispatch_hashblocks_sha512_implementation
#define lib25519_dispatch_hashblocks_compiler lib25519_dispatch_hashblocks_sha512_compiler
#define lib25519_numimpl_hashblocks lib25519_numimpl_hashblocks_sha512

extern const char *lib25519_hashblocks_sha512_implementation(void);
extern const char *lib25519_hashblocks_sha512_compiler(void);
extern const char *lib25519_dispatch_hashblocks_sha512_implementation(long long);
extern const char *lib25519_dispatch_hashblocks_sha512_compiler(long long);
extern long long lib25519_numimpl_hashblocks_sha512(void);

#define lib25519_hash_BYTES 64

#define lib25519_hash_sha512_BYTES 64

#define lib25519_hash lib25519_hash_sha512
#define lib25519_dispatch_hash lib25519_dispatch_hash_sha512

extern void lib25519_hash_sha512(unsigned char *,const unsigned char *,long long);
extern void (*lib25519_dispatch_hash_sha512(long long))(unsigned char *,const unsigned char *,long long);

#define lib25519_hash_implementation lib25519_hash_sha512_implementation
#define lib25519_hash_compiler lib25519_hash_sha512_compiler
#define lib25519_dispatch_hash_implementation lib25519_dispatch_hash_sha512_implementation
#define lib25519_dispatch_hash_compiler lib25519_dispatch_hash_sha512_compiler
#define lib25519_numimpl_hash lib25519_numimpl_hash_sha512

extern const char *lib25519_hash_sha512_implementation(void);
extern const char *lib25519_hash_sha512_compiler(void);
extern const char *lib25519_dispatch_hash_sha512_implementation(long long);
extern const char *lib25519_dispatch_hash_sha512_compiler(long long);
extern long long lib25519_numimpl_hash_sha512(void);

#define lib25519_pow_BYTES 32

#define lib25519_pow_inv25519_BYTES 32

#define lib25519_pow lib25519_pow_inv25519
#define lib25519_dispatch_pow lib25519_dispatch_pow_inv25519

extern void lib25519_pow_inv25519(unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_pow_inv25519(long long))(unsigned char *,const unsigned char *);

#define lib25519_pow_implementation lib25519_pow_inv25519_implementation
#define lib25519_pow_compiler lib25519_pow_inv25519_compiler
#define lib25519_dispatch_pow_implementation lib25519_dispatch_pow_inv25519_implementation
#define lib25519_dispatch_pow_compiler lib25519_dispatch_pow_inv25519_compiler
#define lib25519_numimpl_pow lib25519_numimpl_pow_inv25519

extern const char *lib25519_pow_inv25519_implementation(void);
extern const char *lib25519_pow_inv25519_compiler(void);
extern const char *lib25519_dispatch_pow_inv25519_implementation(long long);
extern const char *lib25519_dispatch_pow_inv25519_compiler(long long);
extern long long lib25519_numimpl_pow_inv25519(void);

#define lib25519_powbatch_BYTES 32

#define lib25519_powbatch_inv25519_BYTES 32

#define lib25519_powbatch lib25519_powbatch_inv25519
#define lib25519_dispatch_powbatch lib25519_dispatch_powbatch_inv25519

extern void lib25519_powbatch_inv25519(unsigned char *,const unsigned char *,long long);
extern void (*lib25519_dispatch_powbatch_inv25519(long long))(unsigned char *,const unsigned char *,long long);

#define lib25519_powbatch_implementation lib25519_powbatch_inv25519_implementation
#define lib25519_powbatch_compiler lib25519_powbatch_inv25519_compiler
#define lib25519_dispatch_powbatch_implementation lib25519_dispatch_powbatch_inv25519_implementation
#define lib25519_dispatch_powbatch_compiler lib25519_dispatch_powbatch_inv25519_compiler
#define lib25519_numimpl_powbatch lib25519_numimpl_powbatch_inv25519

extern const char *lib25519_powbatch_inv25519_implementation(void);
extern const char *lib25519_powbatch_inv25519_compiler(void);
extern const char *lib25519_dispatch_powbatch_inv25519_implementation(long long);
extern const char *lib25519_dispatch_powbatch_inv25519_compiler(long long);
extern long long lib25519_numimpl_powbatch_inv25519(void);

#define lib25519_nP_SCALARBYTES 32
#define lib25519_nP_POINTBYTES 32

#define lib25519_nP_montgomery25519_SCALARBYTES 32
#define lib25519_nP_montgomery25519_POINTBYTES 32

#define lib25519_nP lib25519_nP_montgomery25519
#define lib25519_dispatch_nP lib25519_dispatch_nP_montgomery25519

extern void lib25519_nP_montgomery25519(unsigned char *,const unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_nP_montgomery25519(long long))(unsigned char *,const unsigned char *,const unsigned char *);

#define lib25519_nP_implementation lib25519_nP_montgomery25519_implementation
#define lib25519_nP_compiler lib25519_nP_montgomery25519_compiler
#define lib25519_dispatch_nP_implementation lib25519_dispatch_nP_montgomery25519_implementation
#define lib25519_dispatch_nP_compiler lib25519_dispatch_nP_montgomery25519_compiler
#define lib25519_numimpl_nP lib25519_numimpl_nP_montgomery25519

extern const char *lib25519_nP_montgomery25519_implementation(void);
extern const char *lib25519_nP_montgomery25519_compiler(void);
extern const char *lib25519_dispatch_nP_montgomery25519_implementation(long long);
extern const char *lib25519_dispatch_nP_montgomery25519_compiler(long long);
extern long long lib25519_numimpl_nP_montgomery25519(void);

#define lib25519_nPbatch_SCALARBYTES 32
#define lib25519_nPbatch_POINTBYTES 32

#define lib25519_nPbatch_montgomery25519_SCALARBYTES 32
#define lib25519_nPbatch_montgomery25519_POINTBYTES 32

#define lib25519_nPbatch lib25519_nPbatch_montgomery25519
#define lib25519_dispatch_nPbatch lib25519_dispatch_nPbatch_montgomery25519

extern void lib25519_nPbatch_montgomery25519(unsigned char *,const unsigned char *,const unsigned char *,long long);
extern void (*lib25519_dispatch_nPbatch_montgomery25519(long long))(unsigned char *,const unsigned char *,const unsigned char *,long long);

#define lib25519_nPbatch_implementation lib25519_nPbatch_montgomery25519_implementation
#define lib25519_nPbatch_compiler lib25519_nPbatch_montgomery25519_compiler
#define lib25519_dispatch_nPbatch_implementation lib25519_dispatch_nPbatch_montgomery25519_implementation
#define lib25519_dispatch_nPbatch_compiler lib25519_dispatch_nPbatch_montgomery25519_compiler
#define lib25519_numimpl_nPbatch lib25519_numimpl_nPbatch_montgomery25519

extern const char *lib25519_nPbatch_montgomery25519_implementation(void);
extern const char *lib25519_nPbatch_montgomery25519_compiler(void);
extern const char *lib25519_dispatch_nPbatch_montgomery25519_implementation(long long);
extern const char *lib25519_dispatch_nPbatch_montgomery25519_compiler(long long);
extern long long lib25519_numimpl_nPbatch_montgomery25519(void);

#define lib25519_nG_SCALARBYTES 32
#define lib25519_nG_POINTBYTES 32

#define lib25519_nG_merged25519_SCALARBYTES 32
#define lib25519_nG_merged25519_POINTBYTES 32

#define lib25519_nG lib25519_nG_merged25519
#define lib25519_dispatch_nG lib25519_dispatch_nG_merged25519

extern void lib25519_nG_merged25519(unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_nG_merged25519(long long))(unsigned char *,const unsigned char *);

#define lib25519_nG_implementation lib25519_nG_merged25519_implementation
#define lib25519_nG_compiler lib25519_nG_merged25519_compiler
#define lib25519_dispatch_nG_implementation lib25519_dispatch_nG_merged25519_implementation
#define lib25519_dispatch_nG_compiler lib25519_dispatch_nG_merged25519_compiler
#define lib25519_numimpl_nG lib25519_numimpl_nG_merged25519

extern const char *lib25519_nG_merged25519_implementation(void);
extern const char *lib25519_nG_merged25519_compiler(void);
extern const char *lib25519_dispatch_nG_merged25519_implementation(long long);
extern const char *lib25519_dispatch_nG_merged25519_compiler(long long);
extern long long lib25519_numimpl_nG_merged25519(void);

#define lib25519_nG_montgomery25519_SCALARBYTES 32
#define lib25519_nG_montgomery25519_POINTBYTES 32

extern void lib25519_nG_montgomery25519(unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_nG_montgomery25519(long long))(unsigned char *,const unsigned char *);

extern const char *lib25519_nG_montgomery25519_implementation(void);
extern const char *lib25519_nG_montgomery25519_compiler(void);
extern const char *lib25519_dispatch_nG_montgomery25519_implementation(long long);
extern const char *lib25519_dispatch_nG_montgomery25519_compiler(long long);
extern long long lib25519_numimpl_nG_montgomery25519(void);

#define lib25519_mGnP_MBYTES 32
#define lib25519_mGnP_NBYTES 64
#define lib25519_mGnP_PBYTES 32
#define lib25519_mGnP_OUTPUTBYTES 33

#define lib25519_mGnP_ed25519_MBYTES 32
#define lib25519_mGnP_ed25519_NBYTES 64
#define lib25519_mGnP_ed25519_PBYTES 32
#define lib25519_mGnP_ed25519_OUTPUTBYTES 33

#define lib25519_mGnP lib25519_mGnP_ed25519
#define lib25519_dispatch_mGnP lib25519_dispatch_mGnP_ed25519

extern void lib25519_mGnP_ed25519(unsigned char *,const unsigned char *,const unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_mGnP_ed25519(long long))(unsigned char *,const unsigned char *,const unsigned char *,const unsigned char *);

#define lib25519_mGnP_implementation lib25519_mGnP_ed25519_implementation
#define lib25519_mGnP_compiler lib25519_mGnP_ed25519_compiler
#define lib25519_dispatch_mGnP_implementation lib25519_dispatch_mGnP_ed25519_implementation
#define lib25519_dispatch_mGnP_compiler lib25519_dispatch_mGnP_ed25519_compiler
#define lib25519_numimpl_mGnP lib25519_numimpl_mGnP_ed25519

extern const char *lib25519_mGnP_ed25519_implementation(void);
extern const char *lib25519_mGnP_ed25519_compiler(void);
extern const char *lib25519_dispatch_mGnP_ed25519_implementation(long long);
extern const char *lib25519_dispatch_mGnP_ed25519_compiler(long long);
extern long long lib25519_numimpl_mGnP_ed25519(void);

#define lib25519_multiscalar_SCALARBYTES 32
#define lib25519_multiscalar_POINTBYTES 32
#define lib25519_multiscalar_OUTPUTBYTES 33

#define lib25519_multiscalar_ed25519_SCALARBYTES 32
#define lib25519_multiscalar_ed25519_POINTBYTES 32
#define lib25519_multiscalar_ed25519_OUTPUTBYTES 33

#define lib25519_multiscalar lib25519_multiscalar_ed25519
#define lib25519_dispatch_multiscalar lib25519_dispatch_multiscalar_ed25519

extern void lib25519_multiscalar_ed25519(unsigned char *,const unsigned char *,const unsigned char *,long long);
extern void (*lib25519_dispatch_multiscalar_ed25519(long long))(unsigned char *,const unsigned char *,const unsigned char *,long long);

#define lib25519_multiscalar_implementation lib25519_multiscalar_ed25519_implementation
#define lib25519_multiscalar_compiler lib25519_multiscalar_ed25519_compiler
#define lib25519_dispatch_multiscalar_implementation lib25519_dispatch_multiscalar_ed25519_implementation
#define lib25519_dispatch_multiscalar_compiler lib25519_dispatch_multiscalar_ed25519_compiler
#define lib25519_numimpl_multiscalar lib25519_numimpl_multiscalar_ed25519

extern const char *lib25519_multiscalar_ed25519_implementation(void);
extern const char *lib25519_multiscalar_ed25519_compiler(void);
extern const char *lib25519_dispatch_multiscalar_ed25519_implementation(long long);
extern const char *lib25519_dispatch_multiscalar_ed25519_compiler(long long);
extern long long lib25519_numimpl_multiscalar_ed25519(void);

#define lib25519_dh_SECRETKEYBYTES 32
#define lib25519_dh_PUBLICKEYBYTES 32
#define lib25519_dh_BYTES 32

#define lib25519_dh_x25519_SECRETKEYBYTES 32
#define lib25519_dh_x25519_PUBLICKEYBYTES 32
#define lib25519_dh_x25519_BYTES 32

#define lib25519_dh_keypair lib25519_dh_x25519_keypair
#define lib25519_dispatch_dh_keypair lib25519_dispatch_dh_x25519_keypair

extern void lib25519_dh_x25519_keypair(unsigned char *,unsigned char *);
extern void (*lib25519_dispatch_dh_x25519_keypair(long long))(unsigned char *,unsigned char *);

#define lib25519_dh lib25519_dh_x25519
#define lib25519_dispatch_dh lib25519_dispatch_dh_x25519

extern void lib25519_dh_x25519(unsigned char *,const unsigned char *,const unsigned char *);
extern void (*lib25519_dispatch_dh_x25519(long long))(unsigned char *,const unsigned char *,const unsigned char *);

#define lib25519_dh_implementation lib25519_dh_x25519_implementation
#define lib25519_dh_compiler lib25519_dh_x25519_compiler
#define lib25519_dispatch_dh_implementation lib25519_dispatch_dh_x25519_implementation
#define lib25519_dispatch_dh_compiler lib25519_dispatch_dh_x25519_compiler
#define lib25519_numimpl_dh lib25519_numimpl_dh_x25519

extern const char *lib25519_dh_x25519_implementation(void);
extern const char *lib25519_dh_x25519_compiler(void);
extern const char *lib25519_dispatch_dh_x25519_implementation(long long);
extern const char *lib25519_dispatch_dh_x25519_compiler(long long);
extern long long lib25519_numimpl_dh_x25519(void);

#define lib25519_sign_SECRETKEYBYTES 64
#define lib25519_sign_PUBLICKEYBYTES 32
#define lib25519_sign_BYTES 64

#define lib25519_sign_ed25519_SECRETKEYBYTES 64
#define lib25519_sign_ed25519_PUBLICKEYBYTES 32
#define lib25519_sign_ed25519_BYTES 64

#define lib25519_sign_keypair lib25519_sign_ed25519_keypair
#define lib25519_dispatch_sign_keypair lib25519_dispatch_sign_ed25519_keypair

extern void lib25519_sign_ed25519_keypair(unsigned char *,unsigned char *);
extern void (*lib25519_dispatch_sign_ed25519_keypair(long long))(unsigned char *,unsigned char *);

#define lib25519_sign lib25519_sign_ed25519
#define lib25519_dispatch_sign lib25519_dispatch_sign_ed25519

extern void lib25519_sign_ed25519(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);
extern void (*lib25519_dispatch_sign_ed25519(long long))(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);

#define lib25519_sign_open lib25519_sign_ed25519_open
#define lib25519_dispatch_sign_open lib25519_dispatch_sign_ed25519_open

extern int lib25519_sign_ed25519_open(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);
extern int (*lib25519_dispatch_sign_ed25519_open(long long))(unsigned char *,long long *,const unsigned char *,long long,const unsigned char *);

#define lib25519_sign_implementation lib25519_sign_ed25519_implementation
#define lib25519_sign_compiler lib25519_sign_ed25519_compiler
#define lib25519_dispatch_sign_implementation lib25519_dispatch_sign_ed25519_implementation
#define lib25519_dispatch_sign_compiler lib25519_dispatch_sign_ed25519_compiler
#define lib25519_numimpl_sign lib25519_numimpl_sign_ed25519

extern const char *lib25519_sign_ed25519_implementation(void);
extern const char *lib25519_sign_ed25519_compiler(void);
extern const char *lib25519_dispatch_sign_ed25519_implementation(long long);
extern const char *lib25519_dispatch_sign_ed25519_compiler(long long);
extern long long lib25519_numimpl_sign_ed25519(void);

#ifdef __cplusplus
}
#endif

#endif
