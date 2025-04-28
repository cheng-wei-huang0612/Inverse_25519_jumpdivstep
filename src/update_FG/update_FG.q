enter update_FG
int64 pointerF
int64 pointerG
int64 pointeruuvvrrss

input pointerF
input pointerG
input pointeruuvvrrss

# Calling Convention

caller calleesaved_x18
caller calleesaved_x19
caller calleesaved_x20
caller calleesaved_x21
caller calleesaved_x22
caller calleesaved_x23
caller calleesaved_x24
caller calleesaved_x25
caller calleesaved_x26
caller calleesaved_x27
caller calleesaved_x28
caller calleesaved_x29
caller calleesaved_v8
caller calleesaved_v9
caller calleesaved_v10
caller calleesaved_v11
caller calleesaved_v12
caller calleesaved_v13
caller calleesaved_v14
caller calleesaved_v15
push2xint64 calleesaved_x18, calleesaved_x19
push2xint64 calleesaved_x20, calleesaved_x21
push2xint64 calleesaved_x22, calleesaved_x23
push2xint64 calleesaved_x24, calleesaved_x25
push2xint64 calleesaved_x26, calleesaved_x27
push2xint64 calleesaved_x28, calleesaved_x29
push2x8b calleesaved_v8, calleesaved_v9
push2x8b calleesaved_v10, calleesaved_v11
push2x8b calleesaved_v12, calleesaved_v13
push2x8b calleesaved_v14, calleesaved_v15


# F, G Data Layout Configuration

int64 F0F1
int64 F2F3
int64 F4F5
int64 F6F7
int64 F8

F0F1, F2F3 = mem128[pointerF]
F4F5, F6F7 = mem128[pointerF+16]
F8 = mem32[pointerF+32]

int64 G0G1
int64 G2G3
int64 G4G5
int64 G6G7
int64 G8

G0G1, G2G3 = mem128[pointerG]
G4G5, G6G7 = mem128[pointerG+16]
G8 = mem32[pointerG+32]

reg128 vec_F0_F1_G0_G1 

vec_F0_F1_G0_G1[0/2] = F0F1 
vec_F0_F1_G0_G1[1/2] = G0G1 

reg128 vec_F2_F3_G2_G3 

vec_F2_F3_G2_G3[0/2] = F2F3 
vec_F2_F3_G2_G3[1/2] = G2G3 

reg128 vec_F4_F5_G4_G5 

vec_F4_F5_G4_G5[0/2] = F4F5 
vec_F4_F5_G4_G5[1/2] = G4G5 

reg128 vec_F6_F7_G6_G7 

vec_F6_F7_G6_G7[0/2] = F6F7 
vec_F6_F7_G6_G7[1/2] = G6G7 


reg128 vec_F8_0_G8_0
vec_F8_0_G8_0[0/2] = F8
vec_F8_0_G8_0[1/2] = G8


# uu, vv, rr, ss 
# They are obtained in general-purpose register
# The method to move them into Neon register matters

# Simulating that they are given in the general-purpose register
int64 uu
int64 vv
int64 rr
int64 ss

uu, vv = mem128[pointeruuvvrrss + 0]
rr, ss = mem128[pointeruuvvrrss + 16]

int64 uu0
int64 uu1
uu0 = uu & ((1 << 30)-1)
uu1 = (uu >> 30) & ((1 << 32)-1)

int64 vv0
int64 vv1
vv0 = vv & ((1 << 30)-1)
vv1 = (vv >> 30) & ((1 << 32)-1)

int64 rr0
int64 rr1
rr0 = rr & ((1 << 30)-1)
rr1 = (rr >> 30) & ((1 << 32)-1)

int64 ss0
int64 ss1
ss0 = ss & ((1 << 30)-1)
ss1 = (ss >> 30) & ((1 << 32)-1)

reg128 vec_uu0_rr0_vv0_ss0

vec_uu0_rr0_vv0_ss0[0/4] = uu0
vec_uu0_rr0_vv0_ss0[1/4] = rr0
vec_uu0_rr0_vv0_ss0[2/4] = vv0
vec_uu0_rr0_vv0_ss0[3/4] = ss0

reg128 vec_uu1_rr1_vv1_ss1

vec_uu1_rr1_vv1_ss1[0/4] = uu1
vec_uu1_rr1_vv1_ss1[1/4] = rr1
vec_uu1_rr1_vv1_ss1[2/4] = vv1
vec_uu1_rr1_vv1_ss1[3/4] = ss1



reg128 vec_uuhat_rrhat_vvhat_sshat
reg128 vec_uuhat_rrhat
reg128 vec_vvhat_sshat

# Get the hats
4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]


# Now we perform the unsigned long product
reg128 vec_tmp0
reg128 vec_MASK2p30m1
reg128 vec_MASK2p32m1

2x vec_tmp0 = 0
2x vec_MASK2p32m1 = 0xFFFFFFFF
2x vec_MASK2p30m1 = vec_MASK2p32m1 unsigned>> 2

reg128 vec_R0_0_S0_0
reg128 vec_R1_0_S1_0
reg128 vec_R2_0_S2_0
reg128 vec_R3_0_S3_0
reg128 vec_R4_0_S4_0
reg128 vec_R5_0_S5_0
reg128 vec_R6_0_S6_0
reg128 vec_R7_0_S7_0
reg128 vec_R8_0_S8_0
reg128 vec_R9_0_S9_0
reg128 vec_R10_0_S10_0

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R0_0_S0_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F0_F1_G0_G1[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[2/4]

vec_R1_0_S1_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F0_F1_G0_G1[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F0_F1_G0_G1[3/4]

vec_R2_0_S2_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F2_F3_G2_G3[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[2/4]

vec_R3_0_S3_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F2_F3_G2_G3[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F2_F3_G2_G3[3/4]

vec_R4_0_S4_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F4_F5_G4_G5[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[2/4]

vec_R5_0_S5_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F4_F5_G4_G5[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F4_F5_G4_G5[3/4]

vec_R6_0_S6_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F6_F7_G6_G7[3/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[2/4]

vec_R7_0_S7_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_uu0_rr0_vv0_ss0[1] unsigned* vec_F8_0_G8_0[2/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F6_F7_G6_G7[1/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F6_F7_G6_G7[3/4]

vec_R8_0_S8_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_F8_0_G8_0[0/4]
2x vec_tmp0 += vec_uu1_rr1_vv1_ss1[1] unsigned* vec_F8_0_G8_0[2/4]

vec_R9_0_S9_0 = vec_tmp0 & vec_MASK2p30m1
2x vec_tmp0 unsigned>>= 30

vec_R10_0_S10_0 = vec_tmp0 



# We collect the unsigned products as
# vec_R0_R1_S0_S1
# vec_R2_R3_S2_S3
# vec_R4_R5_S4_S5
# vec_R6_R7_S6_S7
# vec_R8_R9_S8_S9
# vec_R10_0_S10_0

reg128 vec_R0_R1_S0_S1
2x vec_R1_0_S1_0 <<= 32
vec_R0_R1_S0_S1 = vec_R0_0_S0_0 | vec_R1_0_S1_0

reg128 vec_R2_R3_S2_S3
2x vec_R3_0_S3_0 <<= 32
vec_R2_R3_S2_S3 = vec_R2_0_S2_0 | vec_R3_0_S3_0

reg128 vec_R4_R5_S4_S5
2x vec_R5_0_S5_0 <<= 32
vec_R4_R5_S4_S5 = vec_R4_0_S4_0 | vec_R5_0_S5_0

reg128 vec_R6_R7_S6_S7
2x vec_R7_0_S7_0 <<= 32
vec_R6_R7_S6_S7 = vec_R6_0_S6_0 | vec_R7_0_S7_0

reg128 vec_R8_R9_S8_S9
2x vec_R9_0_S9_0 <<= 32
vec_R8_R9_S8_S9 = vec_R8_0_S8_0 | vec_R9_0_S9_0


int64 carry1

carry1 = 3221225472
reg128 vec_MASKcarry1

2x vec_MASKcarry1 = carry1

reg128 vec_MASKcarry2

2x vec_MASKcarry2 = vec_MASKcarry1 << 32

reg128 vec_MASKcarry

vec_MASKcarry = vec_MASKcarry1 | vec_MASKcarry2

reg128 vec_MASKeffect

vec_MASKeffect = ~vec_MASKcarry

int64 ONE

ONE = 1

reg128 vec_ONE

2x vec_ONE = ONE

reg128 vec_MASKhalfeffect

int64 2p32m1

2p32m1 = 4294967295

2x vec_MASKhalfeffect = 2p32m1


reg128 vec_tmp1
reg128 vec_tmp2
reg128 vec_tmp3
reg128 vec_tmp4
reg128 vec_tmp5

reg128 vec_carry1
reg128 vec_carry2

# Minus [ uhat & 4F , rhat & 4F ]
#
# Prepare vec_tmpn = 4*F
2x vec_tmp1 = vec_F0_F1_G0_G1[0/2]
2x vec_tmp2 = vec_F2_F3_G2_G3[0/2]
2x vec_tmp3 = vec_F4_F5_G4_G5[0/2]
2x vec_tmp4 = vec_F6_F7_G6_G7[0/2]
2x vec_tmp5 = vec_F8_0_G8_0[0/2]

2x vec_tmp1 <<= 2
2x vec_tmp2 <<= 2
2x vec_tmp3 <<= 2
2x vec_tmp4 <<= 2
2x vec_tmp5 <<= 2
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

vec_carry2 = vec_tmp2 & vec_MASKcarry2
vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp3 |= vec_carry2


vec_carry1 = vec_tmp3 & vec_MASKcarry1
vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp3 |= vec_carry1

vec_carry2 = vec_tmp3 & vec_MASKcarry2
vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp4 |= vec_carry2


vec_carry1 = vec_tmp4 & vec_MASKcarry1
vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp4 |= vec_carry1

vec_carry2 = vec_tmp4 & vec_MASKcarry2
vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp5 |= vec_carry2




# So far, we have stored 4F into tmp1-5
# We now take the negation of 4F, i.e., -4F
# Effectively, we do -A = not(A)+1 
# however, the not is perform according to effective bits, that is, excluded the carry buffer bits

vec_tmp1 ^= vec_MASKcarry
vec_tmp1 = ~vec_tmp1
vec_tmp2 ^= vec_MASKcarry
vec_tmp2 = ~vec_tmp2
vec_tmp3 ^= vec_MASKcarry
vec_tmp3 = ~vec_tmp3
vec_tmp4 ^= vec_MASKcarry
vec_tmp4 = ~vec_tmp4
vec_tmp5 ^= vec_MASKhalfeffect
2x vec_tmp1 += vec_ONE


# So far, we have stored F' = -4F into tmp1-5

# We now perform the conditional subtraction
vec_tmp1 &= vec_uuhat_rrhat
vec_tmp2 &= vec_uuhat_rrhat
vec_tmp3 &= vec_uuhat_rrhat
vec_tmp4 &= vec_uuhat_rrhat
vec_tmp5 &= vec_uuhat_rrhat
2x vec_R2_R3_S2_S3 += vec_tmp1
2x vec_R4_R5_S4_S5 += vec_tmp2
2x vec_R6_R7_S6_S7 += vec_tmp3
2x vec_R8_R9_S8_S9 += vec_tmp4
2x vec_R10_0_S10_0 += vec_tmp5



# Minus [ vhat & 4G , shat & 4G ]

2x vec_tmp1 = vec_F0_F1_G0_G1[1/2]
2x vec_tmp2 = vec_F2_F3_G2_G3[1/2]
2x vec_tmp3 = vec_F4_F5_G4_G5[1/2]
2x vec_tmp4 = vec_F6_F7_G6_G7[1/2]
2x vec_tmp5 = vec_F8_0_G8_0[1/2]
2x vec_tmp1 <<= 2
2x vec_tmp2 <<= 2
2x vec_tmp3 <<= 2
2x vec_tmp4 <<= 2
2x vec_tmp5 <<= 2


# Remark:
# vec_F0_F1_G0_G1
# vec_F2_F3_G2_G3
# vec_F4_F5_G4_G5
# vec_F6_F7_G6_G7
# These data are no longer used, 
# vec_F8_0_G8_0 will be used for getting vec_Fhat_0_Ghat_0 later

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

vec_carry2 = vec_tmp2 & vec_MASKcarry2
vec_tmp2 = vec_tmp2 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp3 |= vec_carry2


vec_carry1 = vec_tmp3 & vec_MASKcarry1
vec_tmp3 = vec_tmp3 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp3 |= vec_carry1

vec_carry2 = vec_tmp3 & vec_MASKcarry2
vec_tmp3 = vec_tmp3 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp4 |= vec_carry2


vec_carry1 = vec_tmp4 & vec_MASKcarry1
vec_tmp4 = vec_tmp4 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
vec_tmp4 |= vec_carry1

vec_carry2 = vec_tmp4 & vec_MASKcarry2
vec_tmp4 = vec_tmp4 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
vec_tmp5 |= vec_carry2



# So far, we have stored 4G into tmp1-5
vec_tmp1 ^= vec_MASKcarry
vec_tmp1 = ~vec_tmp1
vec_tmp2 ^= vec_MASKcarry
vec_tmp2 = ~vec_tmp2
vec_tmp3 ^= vec_MASKcarry
vec_tmp3 = ~vec_tmp3
vec_tmp4 ^= vec_MASKcarry
vec_tmp4 = ~vec_tmp4
vec_tmp5 ^= vec_MASKhalfeffect
2x vec_tmp1 += vec_ONE

# So far, we have stored G' = -4G into tmp1-5
vec_tmp1 &= vec_vvhat_sshat
vec_tmp2 &= vec_vvhat_sshat
vec_tmp3 &= vec_vvhat_sshat
vec_tmp4 &= vec_vvhat_sshat
vec_tmp5 &= vec_vvhat_sshat
reg128 vec_F8_F9_G8_G9
reg128 vec_F10_0_G10_0
2x vec_F2_F3_G2_G3 = vec_R2_R3_S2_S3 + vec_tmp1
2x vec_F4_F5_G4_G5 = vec_R4_R5_S4_S5 + vec_tmp2
2x vec_F6_F7_G6_G7 = vec_R6_R7_S6_S7 + vec_tmp3
2x vec_F8_F9_G8_G9 = vec_R8_R9_S8_S9 + vec_tmp4
2x vec_F10_0_G10_0 = vec_R10_0_S10_0 + vec_tmp5



# Carry propagation

vec_carry1 = vec_F2_F3_G2_G3 & vec_MASKcarry1
vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F2_F3_G2_G3 += vec_carry1
vec_carry2 = vec_F2_F3_G2_G3 & vec_MASKcarry2
vec_F2_F3_G2_G3 = vec_F2_F3_G2_G3 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F4_F5_G4_G5 += vec_carry2

vec_carry1 = vec_F4_F5_G4_G5 & vec_MASKcarry1
vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F4_F5_G4_G5 += vec_carry1
vec_carry2 = vec_F4_F5_G4_G5 & vec_MASKcarry2
vec_F4_F5_G4_G5 = vec_F4_F5_G4_G5 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F6_F7_G6_G7 += vec_carry2

vec_carry1 = vec_F6_F7_G6_G7 & vec_MASKcarry1
vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F6_F7_G6_G7 += vec_carry1
vec_carry2 = vec_F6_F7_G6_G7 & vec_MASKcarry2
vec_F6_F7_G6_G7 = vec_F6_F7_G6_G7 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F8_F9_G8_G9 += vec_carry2

vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F8_F9_G8_G9 += vec_carry1
vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F10_0_G10_0 += vec_carry2



reg128 vec_Fhat_0_Ghat_0
reg128 vec_Fhat
reg128 vec_Ghat



4x vec_Fhat_0_Ghat_0 = vec_F8_0_G8_0 >> 31

4x vec_Fhat = vec_Fhat_0_Ghat_0[0/4]
4x vec_Ghat = vec_Fhat_0_Ghat_0[2/4]

4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[0/4] vec_uu1_rr1_vv1_ss1[0/4] vec_uu0_rr0_vv0_ss0[1/4] vec_uu1_rr1_vv1_ss1[1/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

# vec_tmp1 = [ u'0, u'1, r'0, r'1 ]
# where u' = -4u, r' = -4r

vec_tmp1 &= vec_Fhat

# vec_tmp1 = [ (Fhat&u')0, (Fhat&u')1, (Fhat&r')0, (Fhat&r')1 ]
# where u' = -4u, r' = -4r


2x vec_tmp2 = vec_tmp1 << 32
# vec_tmp2 = [ 0, (Fhat&u')0, 0, (Fhat&r')0 ]

2x vec_tmp3 = vec_tmp1 unsigned>> 32
# vec_tmp3 = [ (Fhat&u')1, 0, (Fhat&r')1, 0 ]


2x vec_F8_F9_G8_G9 += vec_tmp2
2x vec_F10_0_G10_0 += vec_tmp3



4x vec_tmp1 = vec_uu0_rr0_vv0_ss0[2/4] vec_uu1_rr1_vv1_ss1[2/4] vec_uu0_rr0_vv0_ss0[3/4] vec_uu1_rr1_vv1_ss1[3/4]

2x vec_tmp1 <<= 2
vec_carry1 = vec_tmp1 & vec_MASKcarry1
vec_tmp1 = vec_tmp1 & ~vec_MASKcarry1

2x vec_carry1 <<= 2
vec_tmp1 |= vec_carry1

vec_tmp1 ^= vec_MASKcarry1
vec_tmp1 = ~vec_tmp1

2x vec_tmp1 += vec_ONE

vec_tmp1 &= vec_Ghat

# vec_tmp1 = [ v'0, v'1, s'0, s'1 ]
# where v' = -4v, s' = -4s

vec_tmp1 &= vec_Ghat

# vec_tmp1 = [ (Ghat&v')0, (Ghat&v')1, (Ghat&s')0, (Ghat&s')1 ]

2x vec_tmp2 = vec_tmp1 << 32
# vec_tmp2 = [ 0, (Ghat&v')0, 0, (Ghat&s')0]

2x vec_tmp3 = vec_tmp1 unsigned>> 32
# vec_tmp3 = [ (Ghat&v')1, 0, (Ghat&s')1, 0 ]


2x vec_F8_F9_G8_G9 += vec_tmp2
2x vec_F10_0_G10_0 += vec_tmp3


# Now we do carry propagation2

vec_carry1 = vec_F8_F9_G8_G9 & vec_MASKcarry1
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry1
2x vec_carry1 <<= 2
2x vec_F8_F9_G8_G9 += vec_carry1
vec_carry2 = vec_F8_F9_G8_G9 & vec_MASKcarry2
vec_F8_F9_G8_G9 = vec_F8_F9_G8_G9 & ~vec_MASKcarry2
2x vec_carry2 unsigned>>= 62
2x vec_F10_0_G10_0 += vec_carry2


# Now we store the results back to memory


reg128 vec_F2_F3_F4_F5
reg128 vec_G2_G3_G4_G5
2x vec_F2_F3_F4_F5 zip= vec_F2_F3_G2_G3[0/2] vec_F4_F5_G4_G5[0/2]
2x vec_G2_G3_G4_G5 zip= vec_F2_F3_G2_G3[1/2] vec_F4_F5_G4_G5[1/2]


reg128 vec_F6_F7_F8_F9
reg128 vec_G6_G7_G8_G9
2x vec_F6_F7_F8_F9 zip= vec_F6_F7_G6_G7[0/2] vec_F8_F9_G8_G9[0/2]
2x vec_G6_G7_G8_G9 zip= vec_F6_F7_G6_G7[1/2] vec_F8_F9_G8_G9[1/2]

mem256[pointerF] = vec_F2_F3_F4_F5, vec_F6_F7_F8_F9
mem256[pointerG] = vec_G2_G3_G4_G5, vec_G6_G7_G8_G9
# mem128[pointerF + 16] = vec_F6_F7_F8_F9
# mem128[pointerG + 16] = vec_G6_G7_G8_G9


int64 F10
F10 = vec_F10_0_G10_0[0/2]
mem32[pointerF+32] = F10
int64 G10
G10 = vec_F10_0_G10_0[1/2]
mem32[pointerG+32] = G10


pop2x8b calleesaved_v14, calleesaved_v15
pop2x8b calleesaved_v12, calleesaved_v13
pop2x8b calleesaved_v10, calleesaved_v11
pop2x8b calleesaved_v8, calleesaved_v9
pop2xint64 calleesaved_x28, calleesaved_x29
pop2xint64 calleesaved_x26, calleesaved_x27
pop2xint64 calleesaved_x24, calleesaved_x25
pop2xint64 calleesaved_x22, calleesaved_x23
pop2xint64 calleesaved_x20, calleesaved_x21
pop2xint64 calleesaved_x18, calleesaved_x19


return

