enter update_VS_mont

int64 pointer_V
int64 pointer_S
int64 pointer_uuvvrrss

input pointer_V
input pointer_S
input pointer_uuvvrrss

# Calling Convention

caller calleesaved_v8
caller calleesaved_v9
caller calleesaved_v10
caller calleesaved_v11
caller calleesaved_v12
caller calleesaved_v13
caller calleesaved_v14
caller calleesaved_v15
push2x8b calleesaved_v8, calleesaved_v9
push2x8b calleesaved_v10, calleesaved_v11
push2x8b calleesaved_v12, calleesaved_v13
push2x8b calleesaved_v14, calleesaved_v15

# register initialization and specification

reg128 vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing

reg128 vec_uu0_rr0_vv0_ss0
reg128 vec_uu1_rr1_vv1_ss1

reg128 vec_2x_2p30m1

2x vec_2x_2p30m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 >>= 2

# M = 678152731
int64 M
M = 0
M[0/4] = 51739
M[1/4] = 10347
reg128 vec_M
4x vec_M = M
# vec_M = [M, M, M, M]

int64 _19
_19 = 19
reg128 vec_4x_19
4x vec_4x_19 = _19




# V, S Data Layout Configuration

int64 V0V1
int64 V2V3
int64 V4V5
int64 V6V7
int64 V8V9

V0V1, V2V3 = mem128[pointer_V]
V4V5, V6V7 = mem128[pointer_V+16]
V8V9 = mem32[pointer_V+32]

int64 S0S1
int64 S2S3
int64 S4S5
int64 S6S7
int64 S8S9

S0S1, S2S3 = mem128[pointer_S]
S4S5, S6S7 = mem128[pointer_S+16]
S8S9 = mem32[pointer_S+32]


vec_V0_V1_S0_S1[0/2] = V0V1 
vec_V0_V1_S0_S1[1/2] = S0S1 


vec_V2_V3_S2_S3[0/2] = V2V3 
vec_V2_V3_S2_S3[1/2] = S2S3 


vec_V4_V5_S4_S5[0/2] = V4V5 
vec_V4_V5_S4_S5[1/2] = S4S5 


vec_V6_V7_S6_S7[0/2] = V6V7 
vec_V6_V7_S6_S7[1/2] = S6S7 


vec_V8_V9_S8_S9[0/2] = V8V9 
vec_V8_V9_S8_S9[1/2] = S8S9 



# At this function, the uu, vv, rr, ss are already in neon registers

int64 uu
int64 vv
int64 rr
int64 ss

uu, vv = mem128[pointer_uuvvrrss + 0]
rr, ss = mem128[pointer_uuvvrrss + 16]

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


vec_uu0_rr0_vv0_ss0[0/4] = uu0
vec_uu0_rr0_vv0_ss0[1/4] = rr0
vec_uu0_rr0_vv0_ss0[2/4] = vv0
vec_uu0_rr0_vv0_ss0[3/4] = ss0


vec_uu1_rr1_vv1_ss1[0/4] = uu1
vec_uu1_rr1_vv1_ss1[1/4] = rr1
vec_uu1_rr1_vv1_ss1[2/4] = vv1
vec_uu1_rr1_vv1_ss1[3/4] = ss1



reg128 vec_buffer
reg128 vec_prod
reg128 final_add_0
reg128 final_add_1

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[2/4]

reg128 vec_l0
4x vec_l0 = vec_prod * vec_M
vec_l0 &= vec_2x_2p30m1
4x vec_l0 = vec_l0[0/4] vec_l0[2/4] vec_l0[0/4] vec_l0[2/4]

2x vec_prod -= vec_l0[0] * vec_4x_19[0]
2x final_add_0 = vec_l0[0] << 15

2x vec_prod >>= 30


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V0_V1_S0_S1[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[2/4]

reg128 vec_l1
4x vec_l1 = vec_prod * vec_M
vec_l1 &= vec_2x_2p30m1
4x vec_l1 = vec_l1[0/4] vec_l1[2/4] vec_l1[0/4] vec_l1[2/4]

2x vec_prod -= vec_l1[0] * vec_4x_19[0]
2x final_add_1 = vec_l1[0] << 15

2x vec_prod >>= 30



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V0_V1_S0_S1[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V0_V1_S0_S1[3/4]

vec_V0_V1_S0_S1 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V2_V3_S2_S3[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[2/4]

vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V0_V1_S0_S1 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V2_V3_S2_S3[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V2_V3_S2_S3[3/4]

vec_V2_V3_S2_S3 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V4_V5_S4_S5[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[2/4]

vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V2_V3_S2_S3 |= vec_buffer




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V4_V5_S4_S5[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V4_V5_S4_S5[3/4]

vec_V4_V5_S4_S5 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V6_V7_S6_S7[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[2/4]


vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_V4_V5_S4_S5 |= vec_buffer




2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_V8_V9_S8_S9[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V6_V7_S6_S7[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V6_V7_S6_S7[3/4]

2x vec_prod += final_add_0
vec_V6_V7_S6_S7 = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30


2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_V8_V9_S8_S9[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_V8_V9_S8_S9[2/4]

2x vec_prod += final_add_1
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_buffer <<= 32
vec_V6_V7_S6_S7 |= vec_buffer

2x vec_prod >>= 30

reg128 vec_2x_2p15m1
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15


reg128 vec_carry
2x vec_carry = vec_prod >> 15
4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
2x vec_buffer = vec_4x_19[0] * vec_carry[0]

2x vec_V0_V1_S0_S1 += vec_buffer



# Store the result



reg128 store_back_vec_V0_V1_V2_V3
reg128 store_back_vec_V4_V5_V6_V7
reg128 store_back_vec_S0_S1_S2_S3
reg128 store_back_vec_S4_S5_S6_S7
reg128 store_back_vec_V8_V9_S8_S9




2x store_back_vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
2x store_back_vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]

2x store_back_vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
2x store_back_vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]

store_back_vec_V8_V9_S8_S9 = vec_V8_V9_S8_S9

mem256[pointer_V] = store_back_vec_V0_V1_V2_V3, store_back_vec_V4_V5_V6_V7
mem256[pointer_S] = store_back_vec_S0_S1_S2_S3, store_back_vec_S4_S5_S6_S7



int64 V8
V8 = store_back_vec_V8_V9_S8_S9[0/2]
mem32[pointer_V+32] = V8
int64 S8
S8 = store_back_vec_V8_V9_S8_S9[1/2]
mem32[pointer_S+32] = S8

pop2x8b calleesaved_v14, calleesaved_v15
pop2x8b calleesaved_v12, calleesaved_v13
pop2x8b calleesaved_v10, calleesaved_v11
pop2x8b calleesaved_v8, calleesaved_v9
return