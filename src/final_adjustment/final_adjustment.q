int64 pointer_inv
int64 pointer_F
int64 pointer_V

input pointer_inv
input pointer_F
input pointer_V

int64 signF

enter final_adjustment

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8

V0V1 = mem64[pointer_V]
V2V3 = mem64[pointer_V + 8]
V4V5 = mem64[pointer_V + 16]
V6V7 = mem64[pointer_V + 24]
V8 = mem32[pointer_V + 32]

int64 V0
int64 V1
V0 = V0V1 & 0x3FFFFFFF
V1 = V0V1 unsigned>> 32

int64 V2
int64 V3
V2 = V2V3 & 0x3FFFFFFF
V3 = V2V3 unsigned>> 32

int64 V4
int64 V5
V4 = V4V5 & 0x3FFFFFFF
V5 = V4V5 unsigned>> 32

int64 V6
int64 V7
V6 = V6V7 & 0x3FFFFFFF
V7 = V6V7 unsigned>> 32

int64 inv0
int64 inv1
int64 inv2
int64 inv3
int64 tmp

V1 = V1 << 30
inv0 = V0 | V1
tmp = V2 << 60
inv0 |= tmp

V2 = V2 unsigned>> 4
V3 = V3 << 26
inv1 = V2 | V3 
tmp = V4 << 56
inv1 |= tmp

V4 = V4 unsigned>> 8
V5 = V5 << 22
inv2 = V4 | V5
tmp = V6 << 52
inv2 |= tmp

V6 = V6 unsigned>> 12
V7 = V7 << 18
inv3 = V6 | V7
tmp = V8 << 48
inv3 |= tmp



# sign_adjustment

signF =signextend mem32[pointer_F+32]
signF = signF - 0!

int64 2p64m1
int64 2p63m1
int64 _18
2p64m1 set to ONES
2p63m1 = 2p64m1 unsigned>> 1
_18 = 18





inv0 = inv0 if N=0 else ~inv0
inv1 = inv1 if N=0 else ~inv1
inv2 = inv2 if N=0 else ~inv2

tmp = 2p63m1 - inv3
inv3 = inv3 if N=0 else tmp
tmp = _18 & signF
inv0 = inv0 - tmp




mem64[pointer_inv] = inv0
mem64[pointer_inv+8] = inv1
mem64[pointer_inv+16] = inv2
mem64[pointer_inv+24] = inv3

return