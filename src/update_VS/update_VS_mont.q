
enter update_VS_mont

# Prologue
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


# Function Inputs

int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
input pointeruuvvrrss


# Data Initialization



# manage V and S

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8
int64 S0S1
int64 S2S3
int64 S4S5
int64 S6S7
int64 S8
V0V1, V2V3 = mem128[pointerV]
V4V5, V6V7 = mem128[pointerV+16]
V8 = mem32[pointerV+32]
S0S1, S2S3 = mem128[pointerS]
S4S5, S6S7 = mem128[pointerS+16]
S8 = mem32[pointerS+32]
reg128 vec_V0_V1_S0_S1 
reg128 vec_V2_V3_S2_S3 
reg128 vec_V4_V5_S4_S5 
reg128 vec_V6_V7_S6_S7 
reg128 vec_V8_0_S8_0
vec_V0_V1_S0_S1[0/2] = V0V1 
vec_V0_V1_S0_S1[1/2] = S0S1 
vec_V2_V3_S2_S3[0/2] = V2V3 
vec_V2_V3_S2_S3[1/2] = S2S3 
vec_V4_V5_S4_S5[0/2] = V4V5 
vec_V4_V5_S4_S5[1/2] = S4S5 
vec_V6_V7_S6_S7[0/2] = V6V7 
vec_V6_V7_S6_S7[1/2] = S6S7 
vec_V8_0_S8_0[0/2] = V8 
vec_V8_0_S8_0[1/2] = S8 


# manage uuvvrrss

int64 uu0uu1
int64 uu0
int64 uu1
uu0uu1 = mem64[pointeruuvvrrss + 0]
uu0 = uu0uu1 & ((1 << 30)-1)
uu1 = (uu0uu1 >> 30) & ((1 << 32)-1)

int64 vv0vv1
int64 vv0
int64 vv1
vv0vv1 = mem64[pointeruuvvrrss + 8]
vv0 = vv0vv1 & ((1 << 30)-1)
vv1 = (vv0vv1 >> 30) & ((1 << 32)-1)

int64 rr0rr1
int64 rr0
int64 rr1
rr0rr1 = mem64[pointeruuvvrrss + 16]
rr0 = rr0rr1 & ((1 << 30)-1)
rr1 = (rr0rr1 >> 30) & ((1 << 32)-1)

int64 ss0ss1
int64 ss0
int64 ss1
ss0ss1 = mem64[pointeruuvvrrss + 24]
ss0 = ss0ss1 & ((1 << 30)-1)
ss1 = (ss0ss1 >> 30) & ((1 << 32)-1)

reg128 vec_uu0_rr0_vv0_ss0
reg128 vec_uu1_rr1_vv1_ss1
int64 uu0rr0
rr0 = rr0 << 32
uu0rr0 = uu0 | rr0
vec_uu0_rr0_vv0_ss0[0/2] = uu0rr0

int64 vv0ss0
ss0 = ss0 << 32
vv0ss0 = vv0 | ss0
vec_uu0_rr0_vv0_ss0[1/2] = vv0ss0

int64 uu1rr1
rr1 = rr1 << 32
uu1rr1 = uu1 | rr1
vec_uu1_rr1_vv1_ss1[0/2] = uu1rr1

int64 vv1ss1
ss1 = ss1 << 32
vv1ss1 = vv1 | ss1
vec_uu1_rr1_vv1_ss1[1/2] = vv1ss1



# Accumulate uu0 x V
#
# tmp = 0
# and 
# tmp += [uu0 * V, rr0 * V]

reg128 vec_uuV0_rrV0
reg128 vec_uuV1_rrV1
reg128 vec_uuV2_rrV2
reg128 vec_uuV3_rrV3
reg128 vec_uuV4_rrV4
reg128 vec_uuV5_rrV5
reg128 vec_uuV6_rrV6
reg128 vec_uuV7_rrV7
reg128 vec_uuV8_rrV8
reg128 vec_uuV9_rrV9
reg128 vec_uuV10_rrV10


reg128 vec_product
reg128 vec_2x_2p30m1

reg128 vec_4x_2p30m1
reg128 vec_4x_2p30m19
reg128 vec_4x_2p15m1

2x vec_product = 0

2x vec_2x_2p30m1 = 1073741823

int64 2p30m1
2p30m1 = 1073741823
int64 2p30m19
2p30m1 = 1073741805
int64 2p15m1
2p30m1 = 32767
4x vec_4x_2p30m1 = 2p30m1
4x vec_4x_2p30m19 = 2p30m19
4x vec_4x_2p15m1 = 2p15m1

2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[0/4]
vec_uuV0_rrV0 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V0_V1_S0_S1[1/4]
vec_uuV1_rrV1 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[0/4]
vec_uuV2_rrV2 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V2_V3_S2_S3[1/4]
vec_uuV3_rrV3 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[0/4]
vec_uuV4_rrV4 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V4_V5_S4_S5[1/4]
vec_uuV5_rrV5 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[0/4]
vec_uuV6_rrV6 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V6_V7_S6_S7[1/4]
vec_uuV7_rrV7 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_0_S8_0[0/4]
vec_uuV8_rrV8 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30
vec_uuV9_rrV9 = vec_product & vec_2x_2p30m1


# Compute l0


reg128 vec_l0
reg128 vec_M
2x vec_M = 678152731

4x vec_l0 = vec_uuV0_rrV0 * vec_M
vec_l0 = vec_l0 & vec_2x_2p30m1


# Compute tmp += l0 * P


2x vec_product = 0
reg128 vec_accu
2x vec_accu = 0


2x vec_product += vec_4x_2p30m19[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV0_rrV0 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV1_rrV1 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV2_rrV2 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV3_rrV3 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV4_rrV4 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV5_rrV5 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV6_rrV6 += vec_accu
2x vec_product = vec_product >> 30

2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV7_rrV7 += vec_accu
2x vec_product = vec_product >> 30


2x vec_product += vec_4x_2p15m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV8_rrV8 += vec_accu
2x vec_product = vec_product >> 30
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV9_rrV9 += vec_accu



# Carry Propogation


reg128 vec_carry
2x vec_carry = 0

2x vec_carry = vec_uuV0_rrV0 unsigned>> 30
vec_uuV0_rrV0 = vec_uuV0_rrV0 & vec_2x_2p30m1
2x vec_uuV1_rrV1 = vec_uuV1_rrV1 + vec_carry

2x vec_carry = vec_uuV1_rrV1 unsigned>> 30
vec_uuV1_rrV1 = vec_uuV1_rrV1 & vec_2x_2p30m1
2x vec_uuV2_rrV2 = vec_uuV2_rrV2 + vec_carry

2x vec_carry = vec_uuV2_rrV2 unsigned>> 30
vec_uuV2_rrV2 = vec_uuV2_rrV2 & vec_2x_2p30m1
2x vec_uuV3_rrV3 = vec_uuV3_rrV3 + vec_carry

2x vec_carry = vec_uuV3_rrV3 unsigned>> 30
vec_uuV3_rrV3 = vec_uuV3_rrV3 & vec_2x_2p30m1
2x vec_uuV4_rrV4 = vec_uuV4_rrV4 + vec_carry

2x vec_carry = vec_uuV4_rrV4 unsigned>> 30
vec_uuV4_rrV4 = vec_uuV4_rrV4 & vec_2x_2p30m1
2x vec_uuV5_rrV5 = vec_uuV5_rrV5 + vec_carry

2x vec_carry = vec_uuV5_rrV5 unsigned>> 30
vec_uuV5_rrV5 = vec_uuV5_rrV5 & vec_2x_2p30m1
2x vec_uuV6_rrV6 = vec_uuV6_rrV6 + vec_carry

2x vec_carry = vec_uuV6_rrV6 unsigned>> 30
vec_uuV6_rrV6 = vec_uuV6_rrV6 & vec_2x_2p30m1
2x vec_uuV7_rrV7 = vec_uuV7_rrV7 + vec_carry

2x vec_carry = vec_uuV7_rrV7 unsigned>> 30
vec_uuV7_rrV7 = vec_uuV7_rrV7 & vec_2x_2p30m1
2x vec_uuV8_rrV8 = vec_uuV8_rrV8 + vec_carry

2x vec_carry = vec_uuV8_rrV8 unsigned>> 30
vec_uuV8_rrV8 = vec_uuV8_rrV8 & vec_2x_2p30m1
2x vec_uuV9_rrV9 = vec_uuV9_rrV9 + vec_carry



# vec_uuV_rrV[1:11] += [uu1, rr1] * V[0:9]

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[0/4]
vec_uuV1_rrV1 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V0_V1_S0_S1[1/4]
vec_uuV2_rrV2 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[0/4]
vec_uuV3_rrV3 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V2_V3_S2_S3[1/4]
vec_uuV4_rrV4 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[0/4]
vec_uuV5_rrV5 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V4_V5_S4_S5[1/4]
vec_uuV6_rrV6 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[0/4]
vec_uuV7_rrV7 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V6_V7_S6_S7[1/4]
vec_uuV8_rrV8 = vec_product & vec_2x_2p30m1
2x vec_product = vec_product unsigned>> 30

2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_0_S8_0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
vec_uuV8_rrV8 = vec_accu
2x vec_product = vec_product unsigned>> 30
vec_accu = vec_product & vec_2x_2p30m1
vec_uuV9_rrV9 = vec_accu
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
