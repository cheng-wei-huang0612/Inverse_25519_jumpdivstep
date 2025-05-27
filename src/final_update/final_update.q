enter final_update
int64 pointer_inv
int64 pointer_F
int64 pointer_G
int64 pointer_V
int64 pointer_S
int64 pointer_uuvvrrss

input pointer_inv
input pointer_F
input pointer_G
input pointer_V
input pointer_S
input pointer_uuvvrrss

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

reg128 vec_2x_2p15m1
reg128 vec_2x_2p30m1
reg128 vec_2x_2p32m1

2x vec_2x_2p32m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 = vec_2x_2p32m1 >> 2

2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
# M = 678152731
int64 M
M[0/4] =(0) 51739
M[1/4] = 10347
reg128 vec_M
4x vec_M = M
# vec_M = [M, M, M, M]

int64 _19
_19 = 19
reg128 vec_4x_19
4x vec_4x_19 = _19





int64 uu0
int64 uu1
int64 vv0
int64 vv1
int64 rr0
int64 rr1
int64 ss0
int64 ss1
reg128 vec_uu0_rr0_vv0_ss0
reg128 vec_uu1_rr1_vv1_ss1
reg128 vec_uu_vv
reg128 vec_uu0_vv0
reg128 vec_uu1_vv1
reg128 vec_rr_ss
reg128 vec_rr0_ss0
reg128 vec_rr1_ss1



vec_uu_vv = mem128[pointer_uuvvrrss + 0]
vec_rr_ss = mem128[pointer_uuvvrrss + 16]

vec_uu0_vv0 = vec_uu_vv & vec_2x_2p30m1
vec_rr0_ss0 = vec_rr_ss & vec_2x_2p30m1

4x vec_uu0_rr0_vv0_ss0 = vec_uu0_vv0[0/4] vec_rr0_ss0[0/4] vec_uu0_vv0[2/4] vec_rr0_ss0[2/4] 

2x vec_uu1_vv1 = vec_uu_vv >> 30
2x vec_rr1_ss1 = vec_rr_ss >> 30

4x vec_uu1_rr1_vv1_ss1 = vec_uu1_vv1[0/4] vec_rr1_ss1[0/4] vec_uu1_vv1[2/4] vec_rr1_ss1[2/4] 

int64 F0F1
int64 F2F3
int64 F4F5
int64 F6F7
int64 F8F9

F0F1, F2F3 = mem128[pointer_F]

int64 G0G1
int64 G2G3
int64 G4G5
int64 G6G7
int64 G8G9

G0G1, G2G3 = mem128[pointer_G]

reg128 vec_F0_F1_G0_G1 

vec_F0_F1_G0_G1[0/2] = F0F1 
vec_F0_F1_G0_G1[1/2] = G0G1 

reg128 vec_F2_F3_G2_G3 

vec_F2_F3_G2_G3[0/2] = F2F3 
vec_F2_F3_G2_G3[1/2] = G2G3 

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

reg128 vec_V8_V9_S8_S9 

vec_V8_V9_S8_S9[0/2] = V8V9 
vec_V8_V9_S8_S9[1/2] = S8S9 


reg128 vec_buffer
reg128 vec_prod

2x vec_prod = vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[2/4]




2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F0_F1_G0_G1[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F0_F1_G0_G1[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[2/4]
2x vec_prod >>= 30

2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F0_F1_G0_G1[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F0_F1_G0_G1[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F0_F1_G0_G1 = vec_buffer


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F2_F3_G2_G3[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F2_F3_G2_G3[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
#2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F0_F1_G0_G1 |= vec_buffer


# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F2_F3_G2_G3 = vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F2_F3_G2_G3 |= vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F4_F5_G4_G5 = vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F4_F5_G4_G5 |= vec_buffer



# 2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
# 2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# vec_F6_F7_G6_G7 = vec_buffer



# 2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
# 2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
# vec_buffer = vec_prod & vec_2x_2p30m1
# 2x vec_prod >>= 30
# 2x vec_buffer <<= 32
# vec_F6_F7_G6_G7 |= vec_buffer

# vec_F8_F9_G8_G9 = vec_prod



#reg128 vec_buffer
#reg128 vec_prod
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



reg128 vec_carry
2x vec_carry = vec_prod >> 15

#4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
#vec_V8_V9_S8_S9 = vec_prod 
vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
4x vec_buffer = vec_4x_19 * vec_carry
vec_buffer &= vec_2x_2p32m1

4x vec_V0_V1_S0_S1 += vec_buffer



reg128 vec_4x_2p30m1
4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]

4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry << 32
4x vec_V0_V1_S0_S1 += vec_carry
4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry unsigned>> 32
vec_V0_V1_S0_S1 &= vec_4x_2p30m1

4x vec_V2_V3_S2_S3 += vec_carry

int64 V8

V0V1 = vec_V0_V1_S0_S1[0/2]
V2V3 = vec_V2_V3_S2_S3[0/2]
V4V5 = vec_V4_V5_S4_S5[0/2]
V6V7 = vec_V6_V7_S6_S7[0/2]
V8 = vec_V8_V9_S8_S9[0/4]

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
int64 signF
signF = vec_F0_F1_G0_G1[0/2]
signF = signF << 2
signF = signF signed>> 3
signF - 0!

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




mem128[pointer_inv] = inv0, inv1
mem128[pointer_inv+16] = inv2, inv3



return

