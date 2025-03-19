int64 pointerA
int64 pointerB
int64 pointerR

input pointerA
input pointerB
input pointerR

int64 A01

int64 A0
int64 A1
int64 Ahat

int64 B01

int64 B0
int64 B1
int64 Bhat

int64 R01
int64 R23

int64 R0
int64 R1
int64 R2
int64 R3

int64 tmp0
int64 tmp1
int64 tmp1l
int64 tmp1m
int64 tmp1r
int64 carry
int64 MASK


enter big60_mul

A01 = mem64[pointerA]
B01 = mem64[pointerB]

Ahat = A01 signed>> 63
Bhat = B01 signed>> 63

MASK = 1073741823


A0 = A01 & MASK
A1 = A01 unsigned>> 32


B0 = B01 & MASK
B1 = B01 unsigned>> 32

tmp0 = A0 * B0


R0 = tmp0 & MASK 
tmp0 = tmp0 unsigned>> 30


tmp0 = A1 * B0 + tmp0
tmp0 = A0 * B1 + tmp0


R1 = tmp0 & MASK
tmp0 = tmp0 unsigned>> 30

tmp0 = A1 * B1 + tmp0

R2 = tmp0 & MASK
tmp0 = tmp0 unsigned>>30
R3 = tmp0 & 4294967295

R3 = R3 << 32 
R23 = R2 + R3

R1 = R1 << 32 
R01 = R0 + R1





tmp1 = Ahat & B01

tmp1l = tmp1 & 0xFFFFFFFF00000000
tmp1m = tmp1 & 805306368
tmp1r = tmp1 & 268435455

tmp1l = tmp1l << 2
tmp1m = tmp1m << 4
tmp1r = tmp1r << 2

tmp1 = tmp1l
tmp1 = tmp1 + tmp1m 
tmp1 = tmp1 + tmp1r

tmp1 = tmp1 ^ 0xFFFFFFFF3FFFFFFF
tmp1 += 1


R23 = R23 + tmp1




tmp1 = Bhat & A01 

tmp1l = tmp1 & 0xFFFFFFFF00000000
tmp1m = tmp1 & 805306368
tmp1r = tmp1 & 268435455

tmp1l = tmp1l << 2
tmp1m = tmp1m << 4
tmp1r = tmp1r << 2

tmp1 = tmp1l
tmp1 = tmp1 + tmp1m 
tmp1 = tmp1 + tmp1r

tmp1 = tmp1 ^ 0xFFFFFFFF3FFFFFFF
tmp1 += 1

R23 = R23 + tmp1

carry = R23 & 0x00000000C0000000
R23 = R23 - carry
carry = carry << 2
R23 = R23 + carry



mem64[pointerR] = R01
mem64[pointerR + 8] = R23




return
