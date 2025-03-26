
int64 pointerR
int64 pointerS
int64 pointerF
int64 pointerG
int64 pointeru
int64 pointerv
int64 pointerr
int64 pointers


input pointerR
input pointerS
input pointerF
input pointerG
input pointeru
input pointerv
input pointerr
input pointers


int64 u0u1
int64 u0
int64 u1
int64 v0v1
int64 v0
int64 v1
int64 r0r1
int64 r0
int64 r1
int64 s0s1
int64 s0
int64 s1
int64 F0F1
int64 F2F3
int64 G0G1
int64 G2G3
reg128 vec_F0_F1_G0_G1 
reg128 vec_F2_F3_G2_G3 
reg128 vec_u0_r0_v0_s0
int64 u0r0
int64 v0s0
reg128 vec_u1_r1_v1_s1
int64 u1r1
int64 v1s1

reg128 vec_tmp0
reg128 vec_MASK2p30m1
reg128 vec_MASK2p32m1
reg128 vec_R0_0_S0_0
reg128 vec_R1_0_S1_0
reg128 vec_R2_0_S2_0
reg128 vec_R3_0_S3_0
reg128 vec_R4_0_S4_0
reg128 vec_R5_0_S5_0
reg128 vec_R0_R1_S0_S1
reg128 vec_R2_R3_S2_S3
reg128 vec_R4_R5_S4_S5
int64 R0R1
int64 R2R3
int64 R4R5
int64 R0
int64 R1
int64 R2
int64 R3
int64 R4
int64 R5
int64 S0S1
int64 S2S3
int64 S4S5
int64 S0
int64 S1
int64 S2
int64 S3
int64 S4
int64 S5

int64 carry1
int64 ONE

reg128 vec_MASKcarry1
reg128 vec_MASKcarry2
reg128 vec_MASKcarry
reg128 vec_MASKeffect
reg128 vec_ONE


reg128 vec_uhat_rhat_vhat_shat
reg128 vec_uhat_rhat
reg128 vec_vhat_shat

reg128 vec_tmp1
reg128 vec_tmp2
reg128 vec_carry1
reg128 vec_carry2


reg128 vec_Fhat_Ghat
reg128 vec_Fhat
reg128 vec_Ghat



int64 debug0
int64 debug1
int64 debug2
int64 debug3


enter linear_comb


#Data initialization:
u0u1 = mem64[pointeru]
u0 = u0u1 & ((1 << 30)-1)
u1 = (u0u1 >> 30) & ((1 << 32)-1)
v0v1 = mem64[pointerv]
v0 = v0v1 & ((1 << 30)-1)
v1 = (v0v1 >> 30) & ((1 << 32)-1)
r0r1 = mem64[pointerr]
r0 = r0r1 & ((1 << 30)-1)
r1 = (r0r1 >> 30) & ((1 << 32)-1)
s0s1 = mem64[pointers]
s0 = s0s1 & ((1 << 30)-1)
s1 = (s0s1 >> 30) & ((1 << 32)-1)
F0F1, F2F3 = mem128[pointerF]
G0G1, G2G3 = mem128[pointerG]
vec_F0_F1_G0_G1[0/2] = F0F1 
vec_F0_F1_G0_G1[1/2] = G0G1 
vec_F2_F3_G2_G3[0/2] = F2F3 
vec_F2_F3_G2_G3[1/2] = G2G3 
r0 = r0 << 32
u0r0 = u0 | r0
vec_u0_r0_v0_s0[0/2] = u0r0
s0 = s0 << 32
v0s0 = v0 | s0
vec_u0_r0_v0_s0[1/2] = v0s0
r1 = r1 << 32
u1r1 = u1 | r1
vec_u1_r1_v1_s1[0/2] = u1r1
s1 = s1 << 32
v1s1 = v1 | s1
vec_u1_r1_v1_s1[1/2] = v1s1

#so far, we are ready for the real computation, i.e., from now on, we will be serious on optimizations.

#Unsigned product
vec_tmp0 = vec_tmp0 ^ vec_tmp0

2x vec_MASK2p32m1 = 0xFFFFFFFF
2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2
2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[2/4]
vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30 
2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F0_F1_G0_G1[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[2/4]
vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30 
2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[2/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F0_F1_G0_G1[3/4]
vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30 
2x vec_tmp0 += vec_u0_r0_v0_s0[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_u0_r0_v0_s0[1] unsigned* vec_F2_F3_G2_G3[3/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[2/4]
vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30 
2x vec_tmp0 += vec_u1_r1_v1_s1[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_u1_r1_v1_s1[1] unsigned* vec_F2_F3_G2_G3[3/4]
vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30 
vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p32m1


#Collect the unsigned_product

2x vec_R1_0_S1_0 <<= 32
vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0
2x vec_R3_0_S3_0 <<= 32
vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0
2x vec_R5_0_S5_0 <<= 32
vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0


#DEBUG: The unsigned product behaves as expected

R0R1 = vec_R0_R1_S0_S1[0/2]
S0S1 = vec_R0_R1_S0_S1[1/2]
mem64[pointerR+0] = R0R1
mem64[pointerS+0] = S0S1
R2R3 = vec_R2_R3_S2_S3[0/2]
S2S3 = vec_R2_R3_S2_S3[1/2]
mem64[pointerR+8] = R2R3
mem64[pointerS+8] = S2S3
R4R5 = vec_R4_R5_S4_S5[0/2]
S4S5 = vec_R4_R5_S4_S5[1/2]
mem64[pointerR+16] = R4R5
mem64[pointerS+16] = S4S5


#Producing the masks

carry1 = 3221225472
2x vec_MASKcarry1 = carry1
2x vec_MASKcarry2 = vec_MASKcarry1 << 32
vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2
vec_MASKeffect = ~vec_MASKcarry
ONE = 1
2x vec_ONE = ONE


#Minus the [ uhat & F , rhat & F ] and [ vhat & G , shat & G ]

# Get the hats
4x vec_uhat_rhat_vhat_shat = vec_u1_r1_v1_s1 >> 31
4x vec_uhat_rhat = vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[0/4] vec_uhat_rhat_vhat_shat[1/4] vec_uhat_rhat_vhat_shat[1/4]
4x vec_vhat_shat = vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[2/4] vec_uhat_rhat_vhat_shat[3/4] vec_uhat_rhat_vhat_shat[3/4]
# Minus [ uhat & 4F , rhat & 4F ]
2x vec_tmp1 = vec_F0_F1_G0_G1[0/2]
2x vec_tmp2 = vec_F2_F3_G2_G3[0/2]
2x vec_tmp1 <<= 2
2x vec_tmp2 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1
vec_carry2 = vec_tmp1 & vec_MASKcarry2
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp2 |= vec_carry2
vec_carry1 = vec_tmp2 & vec_MASKcarry1
vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp2 |= vec_carry1

# So far, 4F is stored in tmp1 and tmp2
#Negation starts

vec_tmp1 = vec_tmp1 ^ vec_MASKcarry
vec_tmp1 = ~vec_tmp1
vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1
vec_tmp2 = ~vec_tmp2
2x vec_tmp1 += vec_ONE

#So far, we have stored F' = -4F into tmp1 and tmp2

vec_tmp1 &= vec_uhat_rhat
vec_tmp2 &= vec_uhat_rhat
2x vec_R2_R3_S2_S3 += vec_tmp1
2x vec_R4_R5_S4_S5 += vec_tmp2
# Minus [ vhat & 4G , shat & 4G ]
2x vec_tmp1 = vec_F0_F1_G0_G1[1/2]
2x vec_tmp2 = vec_F2_F3_G2_G3[1/2]
2x vec_tmp1 <<= 2
2x vec_tmp2 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1
vec_carry2 = vec_tmp1 & vec_MASKcarry2
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp2 |= vec_carry2
vec_carry1 = vec_tmp2 & vec_MASKcarry1
vec_tmp2 = vec_tmp2 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp2 |= vec_carry1

# So far, 4G is stored in tmp1 and tmp2
#Negation starts

vec_tmp1 = vec_tmp1 ^ vec_MASKcarry
vec_tmp1 = ~vec_tmp1
vec_tmp2 = vec_tmp2 ^ vec_MASKcarry1
vec_tmp2 = ~vec_tmp2
2x vec_tmp1 += vec_ONE

#So far, we have stored G' = -4G into tmp1 and tmp2

vec_tmp1 &= vec_vhat_shat
vec_tmp2 &= vec_vhat_shat
2x vec_R2_R3_S2_S3 += vec_tmp1
2x vec_R4_R5_S4_S5 += vec_tmp2

# Now we do carry propagation

vec_carry1 = vec_R2_R3_S2_S3 & vec_MASKcarry1
vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_R2_R3_S2_S3 += vec_carry1
vec_carry2 = vec_R2_R3_S2_S3 & vec_MASKcarry2
vec_R2_R3_S2_S3 = vec_R2_R3_S2_S3 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_R4_R5_S4_S5 += vec_carry2
vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1
vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_R4_R5_S4_S5 += vec_carry1

2x vec_Fhat_Ghat = vec_F2_F3_G2_G3 >> 63
2x vec_Fhat = vec_Fhat_Ghat[0/2]
2x vec_Ghat = vec_Fhat_Ghat[1/2]

4x vec_tmp1 = vec_u0_r0_v0_s0[0/4] vec_u1_r1_v1_s1[0/4] vec_u0_r0_v0_s0[1/4] vec_u1_r1_v1_s1[1/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

vec_tmp1 &= vec_Fhat
2x vec_R4_R5_S4_S5 += vec_tmp1




4x vec_tmp1 = vec_u0_r0_v0_s0[2/4] vec_u1_r1_v1_s1[2/4] vec_u0_r0_v0_s0[3/4] vec_u1_r1_v1_s1[3/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

vec_tmp1 &= vec_Ghat
2x vec_R4_R5_S4_S5 += vec_tmp1


# Now we do carry propagation2

vec_carry1 = vec_R4_R5_S4_S5 & vec_MASKcarry1
vec_R4_R5_S4_S5 = vec_R4_R5_S4_S5 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_R4_R5_S4_S5 += vec_carry1
R0R1 = vec_R0_R1_S0_S1[0/2]
S0S1 = vec_R0_R1_S0_S1[1/2]
mem64[pointerR+0] = R0R1
mem64[pointerS+0] = S0S1
R2R3 = vec_R2_R3_S2_S3[0/2]
S2S3 = vec_R2_R3_S2_S3[1/2]
mem64[pointerR+8] = R2R3
mem64[pointerS+8] = S2S3
R4R5 = vec_R4_R5_S4_S5[0/2]
S4S5 = vec_R4_R5_S4_S5[1/2]
mem64[pointerR+16] = R4R5
mem64[pointerS+16] = S4S5


return

