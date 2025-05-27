enter update_FG
int64 pointer_F
int64 pointer_G
int64 pointer_uuvvrrss

input pointer_F
input pointer_G
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

#push2x8b calleesaved_v8, calleesaved_v9
#push2x8b calleesaved_v10, calleesaved_v11
#push2x8b calleesaved_v12, calleesaved_v13
#push2x8b calleesaved_v14, calleesaved_v15


# F, G Data Layout Configuration

int64 F0F1
int64 F2F3
int64 F4F5
int64 F6F7
int64 F8F9

F0F1, F2F3 = mem128[pointer_F]
F4F5, F6F7 = mem128[pointer_F+16]
F8F9 = mem32[pointer_F+32]

int64 G0G1
int64 G2G3
int64 G4G5
int64 G6G7
int64 G8G9

G0G1, G2G3 = mem128[pointer_G]
G4G5, G6G7 = mem128[pointer_G+16]
G8G9 = mem32[pointer_G+32]

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

reg128 vec_F8_F9_G8_G9 

vec_F8_F9_G8_G9[0/2] = F8F9 
vec_F8_F9_G8_G9[1/2] = G8G9 



# uu, vv, rr, ss 
# They are obtained in general-purpose register
# The method to move them into Neon register matters

# Simulating that they are given in the general-purpose register
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


# Initialize some constants

reg128 vec_2x_2p30m1
reg128 vec_2x_2p32m1


2x vec_2x_2p32m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2


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
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F0_F1_G0_G1 |= vec_buffer


2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F2_F3_G2_G3[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F2_F3_G2_G3[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F2_F3_G2_G3 = vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F4_F5_G4_G5[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F4_F5_G4_G5[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F2_F3_G2_G3 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F4_F5_G4_G5[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F4_F5_G4_G5[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F4_F5_G4_G5 = vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F6_F7_G6_G7[1/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F6_F7_G6_G7[3/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F4_F5_G4_G5 |= vec_buffer



2x vec_prod += vec_uu0_rr0_vv0_ss0[0] * vec_F8_F9_G8_G9[0/4]
2x vec_prod += vec_uu0_rr0_vv0_ss0[1] * vec_F8_F9_G8_G9[2/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F6_F7_G6_G7[1/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F6_F7_G6_G7[3/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
vec_F6_F7_G6_G7 = vec_buffer



2x vec_prod += vec_uu1_rr1_vv1_ss1[0] * vec_F8_F9_G8_G9[0/4]
2x vec_prod += vec_uu1_rr1_vv1_ss1[1] * vec_F8_F9_G8_G9[2/4]
vec_buffer = vec_prod & vec_2x_2p30m1
2x vec_prod >>= 30
2x vec_buffer <<= 32
vec_F6_F7_G6_G7 |= vec_buffer

vec_F8_F9_G8_G9 = vec_prod



# Now we store the results back to memory

reg128 vec_F0_F1_F2_F3
reg128 vec_G0_G1_G2_G3

2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]

reg128 vec_F4_F5_F6_F7
reg128 vec_G4_G5_G6_G7
2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]

mem256[pointer_F] = vec_F0_F1_F2_F3, vec_F4_F5_F6_F7
mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7


int64 F8
F8 = vec_F8_F9_G8_G9[0/2]
mem32[pointer_F+32] = F8
int64 G8
G8 = vec_F8_F9_G8_G9[1/2]
mem32[pointer_G+32] = G8

#pop2x8b calleesaved_v14, calleesaved_v15
#pop2x8b calleesaved_v12, calleesaved_v13
#pop2x8b calleesaved_v10, calleesaved_v11
#pop2x8b calleesaved_v8, calleesaved_v9


return

