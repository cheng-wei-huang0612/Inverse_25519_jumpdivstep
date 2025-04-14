### NAME

lib25519 - C API for the lib25519 implementation of the X25519 and Ed25519 cryptosystems

### SYNOPSIS

Using lib25519:

    #include <lib25519.h>

Link with `-l25519`.

X25519 key generation:

    unsigned char pk[lib25519_dh_PUBLICKEYBYTES];
    unsigned char sk[lib25519_dh_SECRETKEYBYTES];

    lib25519_dh_keypair(pk,sk);

X25519 shared-secret generation:

    unsigned char k[lib25519_dh_BYTES];
    const unsigned char pk[lib25519_dh_PUBLICKEYBYTES];
    const unsigned char sk[lib25519_dh_SECRETKEYBYTES];

    lib25519_dh(k,pk,sk);

Ed25519 key generation:

    unsigned char pk[lib25519_sign_PUBLICKEYBYTES];
    unsigned char sk[lib25519_sign_SECRETKEYBYTES];

    lib25519_sign_keypair(pk,sk);

Ed25519 signature generation:

    const unsigned char sk[lib25519_sign_SECRETKEYBYTES];
    const unsigned char m[...]; long long mlen;
    unsigned char sm[...]; long long smlen;

    lib25519_sign(sm,&smlen,m,mlen,sk);

Ed25519 signature verification and message recovery:

    const unsigned char pk[lib25519_sign_PUBLICKEYBYTES];
    const unsigned char sm[...]; long long smlen;
    unsigned char m[...]; long long mlen;
    int result;

    result = lib25519_sign_open(m,&mlen,sm,smlen,pk);

### DESCRIPTION

lib25519 is an implementation
of the X25519 encryption system
and the Ed25519 signature system.
The stable C API for lib25519
consists of the five functions listed above.

All of these functions
follow the SUPERCOP/NaCl APIs for
[DH](https://bench.cr.yp.to/call-dh.html)
and
[signatures](https://bench.cr.yp.to/call-sign.html)
except that

* the function names are lib25519-specific instead of `crypto_*`,
* message lengths are `long long` instead of `unsigned long long`, and
* all functions except signature verification return `void` instead of `int`.

### X25519 KEY GENERATION

`lib25519_dh_keypair(pk,sk)` randomly generates
Alice's secret key
`sk[0], sk[1], ..., sk[lib25519_dh_SECRETKEYBYTES-1]`
and Alice's corresponding public key
`pk[0], pk[1], ..., pk[lib25519_dh_PUBLICKEYBYTES-1]`.

`lib25519_dh_PUBLICKEYBYTES` and `lib25519_dh_SECRETKEYBYTES` are
guaranteed to be 32, but callers wishing to allow easy substitution of
other DH systems should not rely on this guarantee.

### X25519 SHARED-SECRET GENERATION

`lib25519_dh(k,pk,sk)` computes the X25519 secret
`k[0], k[1], ..., k[lib25519_dh_BYTES-1]`
shared between Alice and Bob, given Bob's public key
`pk[0], pk[1], ..., pk[lib25519_dh_PUBLICKEYBYTES-1]`
and Alice's secret key
`sk[0], sk[1], ..., sk[lib25519_dh_SECRETKEYBYTES-1]`.

`lib25519_dh_PUBLICKEYBYTES`, `lib25519_dh_SECRETKEYBYTES`, and
`lib25519_dh_BYTES` are guaranteed to be 32, but callers wishing to
allow easy substitution of other DH systems should not rely on this
guarantee.

### ED25519 KEY GENERATION

`lib25519_sign_keypair(pk,sk)` randomly generates a secret key
`sk[0], sk[1], ..., sk[lib25519_sign_SECRETKEYBYTES-1]`
and a corresponding public key
`pk[0], pk[1], ..., pk[lib25519_sign_PUBLICKEYBYTES-1]`.

`lib25519_sign_PUBLICKEYBYTES` is guaranteed to be 32, and
`lib25519_sign_SECRETKEYBYTES` is guaranteed to be 64, but callers
wishing to allow easy substitution of other signature systems should not
rely on these guarantees.

### ED25519 SIGNATURE GENERATION

`lib25519_sign(sm,&smlen,m,mlen,sk)` signs a message
`m[0], ..., m[mlen-1]`
using the signer's secret key
`sk[0], sk[1], ..., sk[lib25519_sign_SECRETKEYBYTES-1]`,
puts the length of the signed message into `smlen`,
and puts the signed message into
`sm[0], sm[1], ..., sm[smlen-1]`.

The maximum possible length `smlen` is `mlen+lib25519_sign_BYTES`.
The caller must allocate at least `mlen+lib25519_sign_BYTES` for `sm`.

`lib25519_sign_SECRETKEYBYTES` is guaranteed to be 64,
`lib25519_sign_BYTES` is guaranteed to be 64, and signed messages are
always exactly 64 bytes longer than messages, but callers wishing to
allow easy substitution of other signature systems should not rely on
these guarantees.

### ED25519 SIGNATURE VERIFICATION AND MESSAGE RECOVERY

`lib25519_sign_open(m,&mlen,sm,smlen,pk)` verifies the signed message in
`sm[0], ..., sm[smlen-1]`
using the signer's public key
`pk[0], pk[1], ..., pk[lib25519_sign_PUBLICKEYBYTES-1]`.
This function puts the length of the message into `mlen`
and puts the message into
`m[0], m[1], ..., m[mlen-1]`.
It then returns `0`.

The maximum possible length `mlen` is `smlen`. The caller must allocate
at least `smlen` bytes for `m` (not just some guess for the number of
bytes expected in `m`).

If the signature fails verification, `lib25519_sign_open` instead
returns `-1`. It also sets `mlen` to `-1` and clears
`m[0], m[1], ..., m[smlen-1]`,
but callers should note that other signature software does not
necessarily do this; callers should always check the return value.

`lib25519_sign_PUBLICKEYBYTES` is guaranteed to be 32, but callers
wishing to allow easy substitution of other signature systems should not
rely on this guarantee.

### SEE ALSO

**x25519-cli**(1), **ed25519-cli**(1), **randombytes**(3)
