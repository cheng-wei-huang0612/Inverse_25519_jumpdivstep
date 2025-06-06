// linker define ge25519_pack
// linker use fe25519_invert
// linker use fe25519_mul
// linker use fe25519_pack
// linker use fe25519_getparity

#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"

void ge25519_pack(unsigned char r[32], const ge25519_p2 *p)
{
  fe25519 tx, ty, zi;
  fe25519_invert(&zi, &p->z); 
  fe25519_mul(&tx, &p->x, &zi);
  fe25519_mul(&ty, &p->y, &zi);
  fe25519_pack(r, &ty);
  r[31] ^= fe25519_getparity(&tx) << 7;
}
