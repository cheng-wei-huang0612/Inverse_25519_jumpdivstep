enter update_VS_mont

int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
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

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8

V0V1, V2V3 = mem128[pointerV]
V4V5, V6V7 = mem128[pointerV+16]
V8 = mem32[pointerV+32]

int64 S0S1
int64 S2S3
int64 S4S5
int64 S6S7
int64 S8

S0S1, S2S3 = mem128[pointerS]
S4S5, S6S7 = mem128[pointerS+16]
S8 = mem32[pointerS+32]

reg128 vec_V0_V1_S0_S1 

vec_V0_V1_S0_S1[0/2] = V0V1 
vec_V0_V1_S0_S1[1/2] = S0S1 

reg128 vec_V2_V3_S2_S3 

vec_V2_V3_S2_S3[0/2] = V2V3 
vec_V2_V3_S2_S3[1/2] = S2S3 

reg128 vec_V4_V5_S4_S5 

vec_V4_V5_S4_S5[0/2] = V4V5 
vec_V4_V5_S4_S5[1/2] = S4S5 

reg128 vec_V6_V7_S6_S7 

vec_V6_V7_S6_S7[0/2] = V6V7 
vec_V6_V7_S6_S7[1/2] = S6S7 


reg128 vec_V8_0_S8_0
vec_V8_0_S8_0[0/2] = V8
vec_V8_0_S8_0[1/2] = S8


# At this function, the uu, vv, rr, ss are already in neon registers

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



# Now we do [uu0 * V, rr0 * V]

reg128 vec_prod
2x vec_prod = 0
reg128 vec_2x_2p30m1
int64 2p30m1
2p30m1 = 1073741823
2x vec_2x_2p30m1 = 2p30m1


# Prepare P values

int64 2p30m19
int64 2p15m1

reg128 vec_2x_2p30m19
reg128 vec_2x_2p15m1

2p30m19 = 2p30m1 - 18
2p15m1 = 2p30m1 unsigned>> 15

2x vec_2x_2p30m19 = 2p30m19
2x vec_2x_2p15m1 = 2p15m1



reg128 vec_uuV0_0_rrV0_0
reg128 vec_uuV1_0_rrV1_0
reg128 vec_uuV2_0_rrV2_0
reg128 vec_uuV3_0_rrV3_0
reg128 vec_uuV4_0_rrV4_0
reg128 vec_uuV5_0_rrV5_0
reg128 vec_uuV6_0_rrV6_0
reg128 vec_uuV7_0_rrV7_0
reg128 vec_uuV8_0_rrV8_0
reg128 vec_uuV9_0_rrV9_0
reg128 vec_uuV10_0_rrV10_0


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
vec_uuV0_0_rrV0_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
vec_uuV1_0_rrV1_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
vec_uuV2_0_rrV2_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
vec_uuV3_0_rrV3_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
vec_uuV4_0_rrV4_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
vec_uuV5_0_rrV5_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
vec_uuV6_0_rrV6_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
vec_uuV7_0_rrV7_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_0_S8_0[0/4]
vec_uuV8_0_rrV8_0 = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
vec_uuV9_0_rrV9_0 = vec_prod & vec_2x_2p30m1


# Compute l0 = (uu0 * V)[0] * M mod B
#            = (rr0 * V)[0] * M mod B


reg128 vec_l0 
reg128 vec_M
reg128 vec_4x_2p30m1
int64 M

4x vec_4x_2p30m1 = vec_2x_2p30m1[0]


M = 678152731
2x vec_M = M
# vec_M = [M, 0, M, 0]

4x vec_l0 = vec_uuV0_0_rrV0_0 * vec_M
vec_l0 &= vec_2x_2p30m1

# Currently, we get
# vec_l0 = [l0(uuV0 * M mod B), 0, l0(rrV0 * M mod B), 0]
# But we need the shape
# vec_l0 = [l0(uuV0 * M mod B), l0(rrV0 * M mod B), 0, 0]
# For this purpose, we do
4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4] 


# Now we perform
# [uuV, rrV] += l0 * P
reg128 vec_buf

2x vec_prod = 0
2x vec_buf = 0



# i = 0
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m19[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV0_0_rrV0_0 += vec_buf


# i = 1
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV1_0_rrV1_0 += vec_buf

# i = 2
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV2_0_rrV2_0 += vec_buf

# i = 3
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV3_0_rrV3_0 += vec_buf

# i = 4
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV4_0_rrV4_0 += vec_buf

# i = 5
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV5_0_rrV5_0 += vec_buf

# i = 6
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV6_0_rrV6_0 += vec_buf

# i = 7
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV7_0_rrV7_0 += vec_buf


# i = 8
2x vec_prod += vec_l0[0] unsigned* vec_2x_2p15m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV8_0_rrV8_0 += vec_buf

vec_buf = vec_prod & vec_2x_2p30m1
2x vec_uuV9_0_rrV9_0 += vec_buf


# Carry Propagation

reg128 vec_carry
2x vec_carry = 0

2x vec_carry = vec_uuV0_0_rrV0_0 unsigned>> 30
vec_uuV0_0_rrV0_0 &= vec_2x_2p30m1
2x vec_uuV1_0_rrV1_0 += vec_carry

2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
2x vec_uuV2_0_rrV2_0 += vec_carry

2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
2x vec_uuV3_0_rrV3_0 += vec_carry

2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
2x vec_uuV4_0_rrV4_0 += vec_carry

2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
2x vec_uuV5_0_rrV5_0 += vec_carry

2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
2x vec_uuV6_0_rrV6_0 += vec_carry

2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
2x vec_uuV7_0_rrV7_0 += vec_carry

2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
2x vec_uuV8_0_rrV8_0 += vec_carry

2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
2x vec_uuV9_0_rrV9_0 += vec_carry



2x vec_prod = 0
2x vec_buf = 0



2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV1_0_rrV1_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV2_0_rrV2_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV3_0_rrV3_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV4_0_rrV4_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV5_0_rrV5_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV6_0_rrV6_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV7_0_rrV7_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV8_0_rrV8_0 += vec_buf

2x vec_prod = vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_0_S8_0[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV9_0_rrV9_0 += vec_buf

vec_buf = vec_prod & vec_2x_2p30m1
2x vec_uuV10_0_rrV10_0 += vec_buf

# Carry Propagation
2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
2x vec_uuV2_0_rrV2_0 += vec_carry

2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
2x vec_uuV3_0_rrV3_0 += vec_carry

2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
2x vec_uuV4_0_rrV4_0 += vec_carry

2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
2x vec_uuV5_0_rrV5_0 += vec_carry

2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
2x vec_uuV6_0_rrV6_0 += vec_carry

2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
2x vec_uuV7_0_rrV7_0 += vec_carry

2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
2x vec_uuV8_0_rrV8_0 += vec_carry

2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
2x vec_uuV9_0_rrV9_0 += vec_carry

2x vec_carry = vec_uuV9_0_rrV9_0 unsigned>> 30
vec_uuV9_0_rrV9_0 &= vec_2x_2p30m1
2x vec_uuV10_0_rrV10_0 += vec_carry


# Compute l1

reg128 vec_l1
4x vec_l1 = vec_uuV1_0_rrV1_0 * vec_M
vec_l1 &= vec_2x_2p30m1

4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4] 

2x vec_prod = 0
2x vec_buf = 0



# i = 0
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m19[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV1_0_rrV1_0 += vec_buf


# i = 1
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV2_0_rrV2_0 += vec_buf

# i = 2
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV3_0_rrV3_0 += vec_buf

# i = 3
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV4_0_rrV4_0 += vec_buf

# i = 4
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV5_0_rrV5_0 += vec_buf

# i = 5
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV6_0_rrV6_0 += vec_buf

# i = 6
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV7_0_rrV7_0 += vec_buf

# i = 7
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p30m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV8_0_rrV8_0 += vec_buf


# i = 8
2x vec_prod += vec_l1[0] unsigned* vec_2x_2p15m1[0/4]
vec_buf = vec_prod & vec_2x_2p30m1
2x vec_prod unsigned>>= 30
2x vec_uuV9_0_rrV9_0 += vec_buf

vec_buf = vec_prod & vec_2x_2p30m1
2x vec_uuV10_0_rrV10_0 += vec_buf


# Carry Propagation
2x vec_carry = vec_uuV1_0_rrV1_0 unsigned>> 30
vec_uuV1_0_rrV1_0 &= vec_2x_2p30m1
2x vec_uuV2_0_rrV2_0 += vec_carry

2x vec_carry = vec_uuV2_0_rrV2_0 unsigned>> 30
vec_uuV2_0_rrV2_0 &= vec_2x_2p30m1
2x vec_uuV3_0_rrV3_0 += vec_carry

2x vec_carry = vec_uuV3_0_rrV3_0 unsigned>> 30
vec_uuV3_0_rrV3_0 &= vec_2x_2p30m1
2x vec_uuV4_0_rrV4_0 += vec_carry

2x vec_carry = vec_uuV4_0_rrV4_0 unsigned>> 30
vec_uuV4_0_rrV4_0 &= vec_2x_2p30m1
2x vec_uuV5_0_rrV5_0 += vec_carry

2x vec_carry = vec_uuV5_0_rrV5_0 unsigned>> 30
vec_uuV5_0_rrV5_0 &= vec_2x_2p30m1
2x vec_uuV6_0_rrV6_0 += vec_carry

2x vec_carry = vec_uuV6_0_rrV6_0 unsigned>> 30
vec_uuV6_0_rrV6_0 &= vec_2x_2p30m1
2x vec_uuV7_0_rrV7_0 += vec_carry

2x vec_carry = vec_uuV7_0_rrV7_0 unsigned>> 30
vec_uuV7_0_rrV7_0 &= vec_2x_2p30m1
2x vec_uuV8_0_rrV8_0 += vec_carry

2x vec_carry = vec_uuV8_0_rrV8_0 unsigned>> 30
vec_uuV8_0_rrV8_0 &= vec_2x_2p30m1
2x vec_uuV9_0_rrV9_0 += vec_carry

2x vec_carry = vec_uuV9_0_rrV9_0 unsigned>> 30
vec_uuV9_0_rrV9_0 &= vec_2x_2p30m1
2x vec_uuV10_0_rrV10_0 += vec_carry


# Reduce P once

2x vec_buf = 19

2x vec_buf = vec_buf + vec_uuV2_0_rrV2_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV3_0_rrV3_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV4_0_rrV4_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV5_0_rrV5_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV6_0_rrV6_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV7_0_rrV7_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV8_0_rrV8_0
2x vec_buf unsigned>>= 30
2x vec_buf = vec_buf + vec_uuV9_0_rrV9_0
2x vec_buf unsigned>>= 30
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