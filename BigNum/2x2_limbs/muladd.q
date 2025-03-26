int64 pointerR
int64 pointerF
int64 pointerG
int64 pointeru
int64 pointerv

input pointerR
input pointerF
input pointerG
input pointeru
input pointerv


int64 F01

int64 F0
int64 F1
int64 Fhat

int64 G01

int64 G0
int64 G1
int64 Ghat

int64 F0G0
int64 F1G1

int64 u01 

int64 u0 
int64 u1 
int64 uhat

int64 v01 

int64 v0 
int64 v1 
int64 vhat

int64 u0v0
int64 u1v1

int64 F0xu0
int64 G0xv0

int64 R01
int64 R23

int64 R0
int64 R1
int64 R2
int64 R3

int64 S01
int64 S23

int64 ONE
int64 MASK2p30m1
int64 MASK2p32m1
int64 MASKupperhalf 
int64 MASK2p28a2p29
int64 MASK2p28m1
int64 MASK_effective_potition
int64 MASK_carry
reg128 vZERO
reg128 vONE
reg128 vMASK2p30m1
reg128 vMASK2p32m1
reg128 vMASKupperhalf
reg128 vMASK2p28a2p29
reg128 vMASK2p28m1
reg128 vMASK_effective_potition
reg128 vMASK_carry



reg128 FG0 #[F0, G0, 0, 0]
reg128 vec_F0_G0_0_0
reg128 FG1 #[F1, G1, 0, 0]
reg128 FG01 #[F0, F1, G0, G1]
reg128 FGhat #[Fhat, Ghat]


reg128 uv0
reg128 uv1
reg128 uv01 #[u0, u1, v0, v1]
reg128 uvhat #[uhat, vhat]

reg128 RS0
reg128 RS1
reg128 RS01
reg128 RS2
reg128 RS3
reg128 RS23

reg128 R0R1R2R3
reg128 S0S1S2S3
reg128 R0pS0R1pS1R2pS2R3pS3

reg128 tmp0
reg128 tmp1
reg128 tmp1l
reg128 tmp1m
reg128 tmp1r
reg128 carry


int64 debug0
int64 debug1
reg128 debug128

enter muladd

u01 = mem64[pointeru]
v01 = mem64[pointerv]

uv01[0/2] = u01 
uv01[1/2] = v01

uhat = u01 signed>> 63
vhat = v01 signed>> 63

uvhat[0/2] = uhat 
uvhat[1/2] = vhat

MASK2p30m1 = 1073741823

u0 = u01 & MASK2p30m1
u1 = u01 unsigned>>32

v0 = v01 & MASK2p30m1
v1 = v01 unsigned>>32

v0 = v0 << 32
u0v0 = u0 + v0

v1 = v1 << 32
u1v1 = u1 + v1


uv0[0/2] = u0v0
uv1[0/2] = u1v1

F01 = mem64[pointerF]
G01 = mem64[pointerG]

FG01[0/2] = F01 
FG01[1/2] = G01

Fhat = F01 signed>> 63
Ghat = G01 signed>> 63

FGhat[0/2] = Fhat
FGhat[1/2] = Ghat


F0 = F01 & MASK2p30m1
F1 = F01 unsigned>>32

G0 = G01 & MASK2p30m1
G1 = G01 unsigned>>32

G0 = G0 << 32
F0G0 = F0 + G0

G1 = G1 << 32
F1G1 = F1 + G1

FG0[0/2] = F0G0
FG1[0/2] = F1G1





# Computation starts


2x tmp0 = FG0 * uv0



# tmp0 = [ F0*u0    , G0*v0 ]



2x vMASK2p30m1 = MASK2p30m1
RS0 = tmp0 & vMASK2p30m1


2x tmp0 = tmp0 unsigned>> 30


2x tmp0 += FG1 * uv0 


2x tmp0 += FG0 * uv1



RS1 = tmp0 & vMASK2p30m1
2x RS1 = RS1 << 32
2x RS01 = RS0 + RS1

R01 = RS01[0/2]
S01 = RS01[1/2]


2x tmp0 = tmp0 unsigned>> 30
2x tmp0 += FG1 * uv1


RS2 = tmp0 & vMASK2p30m1


2x tmp0 = tmp0 unsigned>> 30

MASK2p32m1 = 4294967295
2x vMASK2p32m1 = MASK2p32m1

RS3 = tmp0 & vMASK2p32m1



2x RS3 = RS3 << 32
2x RS23 = RS2 + RS3


# Minus the FGhat * uv01 

tmp1 = FGhat & uv01


MASKupperhalf = 0xFFFFFFFF00000000 
2x vMASKupperhalf = MASKupperhalf
tmp1l = tmp1 & vMASKupperhalf

MASK2p28a2p29 = 805306368
2x vMASK2p28a2p29 = MASK2p28a2p29
tmp1m = tmp1 & vMASK2p28a2p29

MASK2p28m1 = 268435455
2x vMASK2p28m1 = MASK2p28m1
tmp1r = tmp1 & vMASK2p28m1

2x tmp1l = tmp1l << 2 
2x tmp1m = tmp1m << 4 
2x tmp1r = tmp1r << 2

tmp1 = tmp1l
2x tmp1 = tmp1 + tmp1m
2x tmp1 = tmp1 + tmp1r


# Negation of tmp1

MASK_effective_potition = 0xFFFFFFFF3FFFFFFF
2x vMASK_effective_potition = MASK_effective_potition

tmp1 = tmp1 ^ vMASK_effective_potition

ONE = 1
2x vONE = ONE
2x tmp1 = tmp1 + vONE



# Plus R2R3 and S2S3 with the negation of FGhat & uv01

2x RS23 = RS23 + tmp1




# Minus the uvhat * FG01

tmp1 = uvhat & FG01

tmp1l = tmp1 & vMASKupperhalf
tmp1m = tmp1 & vMASK2p28a2p29
tmp1r = tmp1 & vMASK2p28m1

2x tmp1l = tmp1l << 2
2x tmp1m = tmp1m << 4
2x tmp1r = tmp1r << 2

tmp1 = tmp1l
2x tmp1 = tmp1 + tmp1m
2x tmp1 = tmp1 + tmp1r

tmp1 = tmp1 ^ vMASK_effective_potition

2x tmp1 = tmp1 + vONE

2x RS23 = RS23 + tmp1



# Final carry propagation

MASK_carry = 0x00000000C0000000
2x vMASK_carry = MASK_carry

carry = RS23 & vMASK_carry
2x RS23 = RS23 - carry
2x carry = carry << 2
2x RS23 = RS23 + carry






#R01 = RS01[0/2]
#S01 = RS01[1/2]
#R23 = RS23[0/2]
#S23 = RS23[1/2]


# Addition of R and S 

#RS01 = [R0, R1, S0, S1]
#RS23 = [R2, R3, S2, S3]

2x R0R1R2R3 zip= RS01[0/2] RS23[0/2]
2x S0S1S2S3 zip= RS01[1/2] RS23[1/2]

4x R0pS0R1pS1R2pS2R3pS3 = R0R1R2R3 + S0S1S2S3

vMASK_carry[1/2] = MASK_carry

MASK_carry = MASK_carry + MASK_carry << 32
vMASK_carry[0/2] = MASK_carry




carry = R0pS0R1pS1R2pS2R3pS3 & vMASK_carry
vMASK_carry = ~vMASK_carry


# clear out the carrys
R0pS0R1pS1R2pS2R3pS3 = R0pS0R1pS1R2pS2R3pS3 & vMASK_carry


# shift carry to a correct place
vZERO = carry ^ carry #make it zero
carry = vZERO , carry >> 12
4x carry = carry >> 30

4x R0pS0R1pS1R2pS2R3pS3 = R0pS0R1pS1R2pS2R3pS3 + carry


# transform to 
# F0_G0_0_0 = [F0, G0, 0, 0] 
# F1_G1_0_0 = [F1, G1, 0, 0] 
# F2_G2_0_0 = [F2, G2, 0, 0] 
# F3_G3_0_0 = [F3, G3, 0, 0] 



debug0 = R0pS0R1pS1R2pS2R3pS3[0/2]
debug1 = R0pS0R1pS1R2pS2R3pS3[1/2]
mem64[pointerR] = debug0
mem64[pointerR+8] = debug1



#mem64[pointerR] = 
#mem64[pointerR+8] = S23




return
