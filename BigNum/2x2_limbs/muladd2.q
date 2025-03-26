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


int64 F0F1

int64 F0
int64 F1
int64 Fhat

int64 G0G1

int64 G0
int64 G1
int64 Ghat

int64 F0G0
int64 F1G1

int64 u0u1 

int64 u0 
int64 u1 
int64 uhat

int64 v0v1 

int64 v0 
int64 v1 
int64 vhat

int64 u0v0
int64 u1v1

int64 R0R1
int64 R2R3

int64 S0S1
int64 S2S3

int64 ONE
int64 MASK2p30m1
int64 MASK2p32m1
int64 MASKupperhalf 
int64 MASK2p28a2p29
int64 MASK2p28m1
int64 MASK_effective_potition
int64 MASK_carry
reg128 vec_ZERO
reg128 vec_ONE
reg128 vec_MASK2p30m1
reg128 vec_MASK2p32m1
reg128 vec_MASKupperhalf
reg128 vec_MASK2p28a2p29
reg128 vec_MASK2p28m1
reg128 vec_MASK_effective_potition
reg128 vec_MASK_carry



reg128 vec_F0_G0_0_0 #[F0, G0, 0, 0]
reg128 vec_F1_G1_0_0 #[F1, G1, 0, 0]
reg128 vec_F0_F1_G0_G1 #[F0, F1, G0, G1]
reg128 vec_Fhat_Ghat #[Fhat, Ghat]


reg128 vec_u0_v0_0_0
reg128 vec_u1_v1_0_0
reg128 vec_u0_u1_v0_v1 #[u0, u1, v0, v1]
reg128 vec_uhat_vhat

reg128 vec_R0_S0
reg128 vec_R1_S1
reg128 vec_R0R1_S0S1
reg128 vec_R2_S2
reg128 vec_R3_S3
reg128 vec_R2R3_S2S3

reg128 vec_R0_R1_R2_R3
reg128 vec_S0_S1_S2_S3
reg128 vec_sum0_sum1_sum2_sum3

reg128 vec_tmp0
reg128 vec_tmp1
reg128 vec_tmp1l
reg128 vec_tmp1m
reg128 vec_tmp1r
reg128 vec_carry

int64 sum0sum1
int64 sum2sum3

int64 debug0
int64 debug1
reg128 debug128

enter muladd

# Read u and v 

u0u1 = mem64[pointeru]
v0v1 = mem64[pointerv]

vec_u0_u1_v0_v1[0/2] = u0u1 
vec_u0_u1_v0_v1[1/2] = v0v1

uhat = u0u1 signed>> 63
vhat = v0v1 signed>> 63

vec_uhat_vhat[0/2] = uhat
vec_uhat_vhat[1/2] = vhat

MASK2p30m1 = 1073741823

u0 = u0u1 & MASK2p30m1
u1 = u0u1 unsigned>>32

v0 = v0v1 & MASK2p30m1
v1 = v0v1 unsigned>>32

v0 = v0 << 32
u0v0 = u0 + v0

v1 = v1 << 32
u1v1 = u1 + v1

vec_u0_v0_0_0[0/2] = u0v0
vec_u1_v1_0_0[0/2] = u1v1

# Read F and G

F0F1 = mem64[pointerF]
G0G1 = mem64[pointerG]

vec_F0_F1_G0_G1[0/2] = F0F1
vec_F0_F1_G0_G1[1/2] = G0G1

Fhat = F0F1 signed>> 63
Ghat = G0G1 signed>> 63

vec_Fhat_Ghat[0/2] = Fhat
vec_Fhat_Ghat[1/2] = Ghat


F0 = F0F1 & MASK2p30m1
F1 = F0F1 unsigned>>32

G0 = G0G1 & MASK2p30m1
G1 = G0G1 unsigned>>32

G0 = G0 << 32
F0G0 = F0 + G0

G1 = G1 << 32
F1G1 = F1 + G1

vec_F0_G0_0_0[0/2] = F0G0
vec_F1_G1_0_0[0/2] = F1G1




# Compute unsigned product


2x vec_tmp0 = vec_F0_G0_0_0 * vec_u0_v0_0_0
# tmp0 = [ F0*u0    , G0*v0 ]

2x vec_MASK2p30m1 = MASK2p30m1
vec_R0_S0 = vec_tmp0 & vec_MASK2p30m1


2x vec_tmp0 = vec_tmp0 unsigned>> 30


2x vec_tmp0 += vec_F1_G1_0_0 * vec_u0_v0_0_0


2x vec_tmp0 += vec_F0_G0_0_0 * vec_u1_v1_0_0


vec_R1_S1 = vec_tmp0 & vec_MASK2p30m1


2x vec_R1_S1 = vec_R1_S1 << 32


2x vec_R0R1_S0S1 = vec_R0_S0 + vec_R1_S1


R0R1 = vec_R0R1_S0S1[0/2]
S0S1 = vec_R0R1_S0S1[1/2]


2x vec_tmp0 = vec_tmp0 unsigned>> 30
2x vec_tmp0 += vec_F1_G1_0_0 * vec_u1_v1_0_0


vec_R2_S2 = vec_tmp0 & vec_MASK2p30m1


2x vec_tmp0 = vec_tmp0 unsigned>> 30

MASK2p32m1 = 4294967295
2x vec_MASK2p32m1 = MASK2p32m1

vec_R3_S3 = vec_tmp0 & vec_MASK2p32m1


2x vec_R3_S3 = vec_R3_S3 << 32
2x vec_R2R3_S2S3 = vec_R2_S2 + vec_R3_S3





# Minus the FGhat * uv01 


vec_tmp1 = vec_Fhat_Ghat & vec_u0_u1_v0_v1


MASKupperhalf = 0xFFFFFFFF00000000 
2x vec_MASKupperhalf = MASKupperhalf

vec_tmp1l = vec_tmp1 & vec_MASKupperhalf

MASK2p28a2p29 = 805306368
2x vec_MASK2p28a2p29 = MASK2p28a2p29
vec_tmp1m = vec_tmp1 & vec_MASK2p28a2p29

MASK2p28m1 = 268435455
2x vec_MASK2p28m1 = MASK2p28m1
vec_tmp1r = vec_tmp1 & vec_MASK2p28m1

2x vec_tmp1l = vec_tmp1l << 2 
2x vec_tmp1m = vec_tmp1m << 4 
2x vec_tmp1r = vec_tmp1r << 2

vec_tmp1 = vec_tmp1l
2x vec_tmp1 = vec_tmp1 + vec_tmp1m
2x vec_tmp1 = vec_tmp1 + vec_tmp1r


## Negation of tmp1

MASK_effective_potition = 0xFFFFFFFF3FFFFFFF
2x vec_MASK_effective_potition = MASK_effective_potition

vec_tmp1 = vec_tmp1 ^ vec_MASK_effective_potition

ONE = 1
2x vec_ONE = ONE
2x vec_tmp1 = vec_tmp1 + vec_ONE



## Plus R2R3 and S2S3 with the negation of FGhat & uv01

2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_tmp1





# Minus the uvhat * FG01

vec_tmp1 = vec_uhat_vhat & vec_F0_F1_G0_G1

vec_tmp1l = vec_tmp1 & vec_MASKupperhalf
vec_tmp1m = vec_tmp1 & vec_MASK2p28a2p29
vec_tmp1r = vec_tmp1 & vec_MASK2p28m1

2x vec_tmp1l = vec_tmp1l << 2
2x vec_tmp1m = vec_tmp1m << 4
2x vec_tmp1r = vec_tmp1r << 2

vec_tmp1 = vec_tmp1l
2x vec_tmp1 = vec_tmp1 + vec_tmp1m
2x vec_tmp1 = vec_tmp1 + vec_tmp1r

vec_tmp1 = vec_tmp1 ^ vec_MASK_effective_potition

2x vec_tmp1 = vec_tmp1 + vec_ONE

2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_tmp1



# Final carry propagation

MASK_carry = 0x00000000C0000000
2x vec_MASK_carry = MASK_carry

vec_carry = vec_R2R3_S2S3 & vec_MASK_carry
2x vec_R2R3_S2S3 = vec_R2R3_S2S3 - vec_carry
2x vec_carry = vec_carry << 2
2x vec_R2R3_S2S3 = vec_R2R3_S2S3 + vec_carry




# Addition of R and S 

2x vec_R0_R1_R2_R3 zip= vec_R0R1_S0S1[0/2] vec_R2R3_S2S3[0/2]
2x vec_S0_S1_S2_S3 zip= vec_R0R1_S0S1[1/2] vec_R2R3_S2S3[1/2]

4x vec_sum0_sum1_sum2_sum3 = vec_R0_R1_R2_R3 + vec_S0_S1_S2_S3

vec_MASK_carry[1/2] = MASK_carry

MASK_carry = MASK_carry + MASK_carry << 32
vec_MASK_carry[0/2] = MASK_carry


vec_carry = vec_sum0_sum1_sum2_sum3 & vec_MASK_carry


## clear out the carrys
4x vec_sum0_sum1_sum2_sum3 = vec_sum0_sum1_sum2_sum3 - vec_carry



## shift carry to a correct place
vec_ZERO = vec_carry ^ vec_carry #make it zero
vec_carry = vec_ZERO , vec_carry >> 12
4x vec_carry = vec_carry >> 30


4x vec_sum0_sum1_sum2_sum3 = vec_sum0_sum1_sum2_sum3 + vec_carry


# transform to 
# F0_G0_0_0 = [F0, G0, 0, 0] 
# F1_G1_0_0 = [F1, G1, 0, 0] 
# F2_G2_0_0 = [F2, G2, 0, 0] 
# F3_G3_0_0 = [F3, G3, 0, 0] 


sum0sum1 = vec_sum0_sum1_sum2_sum3[0/2]
sum2sum3 = vec_sum0_sum1_sum2_sum3[1/2]
mem64[pointerR] = sum0sum1
mem64[pointerR+8] = sum2sum3





return
