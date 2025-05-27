code = """enter update_FG_VS"""




code += """
int64 pointer_F
int64 pointer_G
int64 pointer_V
int64 pointer_S
int64 pointer_uuvvrrss

input pointer_F
input pointer_G
input pointer_V
input pointer_S
input pointer_uuvvrrss
"""

code += """
# Calling Convention
"""
for i in range(18, 29+1,1):
    code += f"caller calleesaved_x{i}\n"
for i in range(8, 15+1,1):
    code += f"caller calleesaved_v{i}\n"

code += """
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



"""



code += """

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

"""



for symbol in ["F","G"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8{symbol}9\n"
    code += "\n"
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer_{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer_{symbol}+16]\n"
    code += f"{symbol}8{symbol}9 = mem32[pointer_{symbol}+32]\n"
    code += "\n"

for i in range(0,10,2):
    code += f"reg128 vec_F{i}_F{i+1}_G{i}_G{i+1} \n"
    code += "\n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[0/2] = F{i}F{i+1} \n"
    code += f"vec_F{i}_F{i+1}_G{i}_G{i+1}[1/2] = G{i}G{i+1} \n"
    code += "\n"

for symbol in ["V","S"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8{symbol}9\n"
    code += "\n"
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer_{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer_{symbol}+16]\n"
    code += f"{symbol}8{symbol}9 = mem32[pointer_{symbol}+32]\n"
    code += "\n"
for i in range(0,10,2):
    code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
    code += "\n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
    code += "\n"







# update FG:

code += """
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

"""


# update VS:
code += """

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


"""


# Carry propagation
code += """
reg128 vec_4x_2p30m1
4x vec_4x_2p30m1 = vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4] vec_2x_2p30m1[0/4] vec_2x_2p30m1[2/4]

4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry << 32
4x vec_V0_V1_S0_S1 += vec_carry
4x vec_carry = vec_V0_V1_S0_S1 >> 30
2x vec_carry = vec_carry unsigned>> 32
vec_V0_V1_S0_S1 &= vec_4x_2p30m1

4x vec_V2_V3_S2_S3 += vec_carry
"""




code += """

# Now we store the results back to memory

reg128 vec_F0_F1_F2_F3
reg128 vec_G0_G1_G2_G3

2x vec_F0_F1_F2_F3 zip= vec_F0_F1_G0_G1[0/2] vec_F2_F3_G2_G3[0/2]
2x vec_G0_G1_G2_G3 zip= vec_F0_F1_G0_G1[1/2] vec_F2_F3_G2_G3[1/2]

reg128 vec_F4_F5_F6_F7
reg128 vec_G4_G5_G6_G7
2x vec_F4_F5_F6_F7 zip= vec_F4_F5_G4_G5[0/2] vec_F6_F7_G6_G7[0/2]
2x vec_G4_G5_G6_G7 zip= vec_F4_F5_G4_G5[1/2] vec_F6_F7_G6_G7[1/2]

mem128[pointer_F] = vec_F0_F1_F2_F3
mem128[pointer_F + 16] = vec_F4_F5_F6_F7
mem128[pointer_G] = vec_G0_G1_G2_G3
mem128[pointer_G + 16] = vec_G4_G5_G6_G7


int64 F8
F8 = vec_F8_F9_G8_G9[0/2]
mem32[pointer_F+32] = F8
int64 G8
G8 = vec_F8_F9_G8_G9[1/2]
mem32[pointer_G+32] = G8

"""



# Store the result
code += """
# Store the result



reg128 vec_V0_V1_V2_V3
reg128 vec_V4_V5_V6_V7
reg128 vec_S0_S1_S2_S3
reg128 vec_S4_S5_S6_S7





2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2]
2x vec_S0_S1_S2_S3 zip= vec_V0_V1_S0_S1[1/2] vec_V2_V3_S2_S3[1/2]

2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
2x vec_S4_S5_S6_S7 zip= vec_V4_V5_S4_S5[1/2] vec_V6_V7_S6_S7[1/2]



mem128[pointer_V] = vec_V0_V1_V2_V3
mem128[pointer_V + 16] = vec_V4_V5_V6_V7
mem128[pointer_S] = vec_S0_S1_S2_S3
mem128[pointer_S + 16] = vec_S4_S5_S6_S7



int64 V8
V8 = vec_V8_V9_S8_S9[0/2]
mem32[pointer_V+32] = V8
int64 S8
S8 = vec_V8_V9_S8_S9[1/2]
mem32[pointer_S+32] = S8

"""










code += """

return

"""
with open("update_FG_VS.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_FG_VS.q > update_FG_VS.S")
