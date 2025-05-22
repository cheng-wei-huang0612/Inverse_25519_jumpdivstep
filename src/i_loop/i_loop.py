# i_loop.py
# Generates qhasm code for i_loop

code = """

enter i_loop

"""

for i in range(18, 29+1,1):
    code += f"caller calleesaved_x{i}\n"
for i in range(8, 15+1,1):
    code += f"caller calleesaved_v{i}\n"

for i in range(18, 29+1,2):
    code += f"push2xint64 calleesaved_x{i}, calleesaved_x{i+1}\n"

for i in range(8, 15+1,2):
    code += f"push2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"


code += """



int64 pointer_delta
int64 pointer_F
int64 pointer_G
int64 pointer_V
int64 pointer_S
int64 pointer_uuvvrrss

input pointer_delta
input pointer_F
input pointer_G
input pointer_V
input pointer_S
input pointer_uuvvrrss
int64 uu
int64 vv
int64 rr
int64 ss


# int64 ITERATION
# ITERATION = 9

# main_i_loop:
"""




code += """

# F, G Data Layout Configuration

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



code += """

# uu, vv, rr, ss 
# They are obtained in general-purpose register
# The method to move them into Neon register matters

# Simulating that they are given in the general-purpose register
# int64 uu
# int64 vv
# int64 rr
# int64 ss

uu, vv = mem128[pointer_uuvvrrss + 0]
rr, ss = mem128[pointer_uuvvrrss + 16]

"""


# Data initialization, we do not need optimization
# make vec_F0_F1_G0_G1, ... 

for symbol in ["uu","vv","rr","ss"]:

    code += f"int64 {symbol}0\n"
    code += f"int64 {symbol}1\n"
    code += f"{symbol}0 = {symbol} & ((1 << 30)-1)\n"
    code += f"{symbol}1 = ({symbol} >> 30) & ((1 << 32)-1)\n"
    code += "\n"


for j in range(2):
    code += f"reg128 vec_uu{j}_rr{j}_vv{j}_ss{j}\n"
    code += "\n"
    for (i, symbol) in enumerate(["uu", "rr", "vv", "ss"]):
        code += f"vec_uu{j}_rr{j}_vv{j}_ss{j}[{i}/4] = {symbol}{j}\n"

    code += "\n"






code += """
# Initialize some constants

reg128 vec_2x_2p30m1
reg128 vec_2x_2p32m1


2x vec_2x_2p32m1 = 0xFFFFFFFF
2x vec_2x_2p30m1 = vec_2x_2p32m1 unsigned>> 2

"""

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

mem256[pointer_F] = vec_F0_F1_F2_F3, vec_F4_F5_F6_F7
mem256[pointer_G] = vec_G0_G1_G2_G3, vec_G4_G5_G6_G7


int64 F8
F8 = vec_F8_F9_G8_G9[0/2]
mem32[pointer_F+32] = F8
int64 G8
G8 = vec_F8_F9_G8_G9[1/2]
mem32[pointer_G+32] = G8

"""



code += """
# register initialization and specification

reg128 vec_V0_V1_S0_S1
reg128 vec_V2_V3_S2_S3
reg128 vec_V4_V5_S4_S5
reg128 vec_V6_V7_S6_S7
reg128 vec_V8_V9_S8_S9
# The V9, S9 are always 0, we put them here for easy program writing

#reg128 vec_uu0_rr0_vv0_ss0
#reg128 vec_uu1_rr1_vv1_ss1

#reg128 vec_2x_2p30m1

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


"""

code += """

# V, S Data Layout Configuration

"""

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
    # code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
    code += "\n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
    code += "\n"







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

reg128 vec_2x_2p15m1
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
2x vec_2x_2p15m1 = vec_2x_2p30m1 >> 15
2x vec_2x_2p32m1 = 0xFFFFFFFF

reg128 vec_carry
2x vec_carry = vec_prod >> 15

#4x vec_carry = vec_carry[0/4] vec_carry[2/4] vec_carry[0/4] vec_carry[2/4]
#vec_V8_V9_S8_S9 = vec_prod 
vec_V8_V9_S8_S9 = vec_prod & vec_2x_2p15m1
4x vec_buffer = vec_4x_19 * vec_carry
vec_buffer &= vec_2x_2p32m1

4x vec_V0_V1_S0_S1 += vec_buffer


"""





# # Carry propagation
# code += """
# reg128 vec_4x_2p30m1
# 2x vec_4x_2p30m1 = vec_2x_2p30m1 << 32
# vec_4x_2p30m1 |= vec_2x_2p30m1



# 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# 2x vec_carry = vec_carry << 32
# 4x vec_V0_V1_S0_S1 += vec_carry
# 4x vec_carry = vec_V0_V1_S0_S1 >> 30
# 2x vec_carry = vec_carry unsigned>> 32
# vec_V0_V1_S0_S1 &= vec_4x_2p30m1

# 4x vec_V2_V3_S2_S3 += vec_carry
# """









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



mem256[pointer_V] = vec_V0_V1_V2_V3, vec_V4_V5_V6_V7
mem256[pointer_S] = vec_S0_S1_S2_S3, vec_S4_S5_S6_S7



int64 V8
V8 = vec_V8_V9_S8_S9[0/2]
mem32[pointer_V+32] = V8
int64 S8
S8 = vec_V8_V9_S8_S9[1/2]
mem32[pointer_S+32] = S8

"""



code += """

int64 f_hi
int64 f
int64 g_hi
int64 g

f_hi = mem32[pointer_F+4]
f = mem32[pointer_F]
g_hi = mem32[pointer_G+4]
g = mem32[pointer_G]
f = f + f_hi << 30
g = g + g_hi << 30

int64 m
m = mem64[pointer_delta]
"""


code += """


int64 2p41
2p41 = 1
2p41 = 2p41 << 41

int64 2p62
2p62 = 1
2p62 = 2p62 << 62
int64 fuv
int64 grs

int64 g1
int64 hh
int64 h
int64 m1

"""


code += """
fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62

"""


for i in range(20):
    code += """

    g1 = grs & 1
    hh = grs - fuv
    h = grs + g1 * fuv
    m1 = m - 1 
 
 
    m1 & (grs >>> 1)
    # if m - 1 < 0 ang grs & 1 == 1 then N = 1
    # else N = 0
    m = m1 if N=0 else -m
    fuv = fuv if N=0 else grs
    grs = h if N=0 else hh
    grs = grs signed>> 1


    """

code += """


# Extraction


vv = fuv
vv = vv + 1048576
vv = vv + 2p41
vv = vv signed>> 42

uu = fuv + 1048576
uu = uu << 22
uu = uu signed>> 43


ss = grs
ss = ss + 1048576
ss = ss + 2p41
ss = ss signed>> 42

rr = grs + 1048576
rr = rr << 22
rr = rr signed>> 43


"""

code += """
int64 tmp
int64 prod_lo
int64 prod_hi
int64 new_f
int64 new_g
int64 new_uu
int64 new_vv
int64 new_rr
int64 new_ss

prod_lo = uu * f
prod_hi = uu signed* f (hi)

tmp = vv * g
prod_lo += tmp !

tmp = vv signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi




prod_lo = rr * f
prod_hi = rr signed* f (hi)

tmp = ss * g
prod_lo += tmp !

tmp = ss signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
g = prod_lo | prod_hi
f = new_f



"""

# The second j_loop
code += """
# The second j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62


"""

for i in range(20):
    code += """

    g1 = grs & 1
    hh = grs - fuv
    h = grs + g1 * fuv
    m1 = m - 1 
 
 
    m1 & (grs >>> 1)
    # if m - 1 < 0 ang grs & 1 == 1 then N = 1
    # else N = 0
    m = m1 if N=0 else -m
    fuv = fuv if N=0 else grs
    grs = h if N=0 else hh
    grs = grs signed>> 1


    """
code += """


# Extraction
int64 u
int64 v
int64 r
int64 s

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43


"""



code += """
# int64 tmp
# int64 prod_lo
# int64 prod_hi
# int64 new_f
# int64 new_g
# int64 new_uu
# int64 new_vv
# int64 new_rr
# int64 new_ss
prod_lo = u * f
prod_hi = u signed* f (hi)

tmp = v * g
prod_lo += tmp !

tmp = v signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_f = prod_lo | prod_hi




prod_lo = r * f
prod_hi = r signed* f (hi)

tmp = s * g
prod_lo += tmp !

tmp = s signed* g (hi)
prod_hi = prod_hi + tmp + carry 

prod_lo = prod_lo unsigned>> 20
prod_hi = prod_hi << 44
new_g = prod_lo | prod_hi



f = new_f
g = new_g





tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss




uu = new_uu
vv = new_vv
rr = new_rr
ss = new_ss


"""



# The third (final) j_loop
code += """
# The second j_loop

fuv = f & 1048575
grs = g & 1048575
fuv -= 2p41
grs -= 2p62


"""

for i in range(20):
    code += """

    g1 = grs & 1
    hh = grs - fuv
    h = grs + g1 * fuv
    m1 = m - 1 
 
 
    m1 & (grs >>> 1)
    # if m - 1 < 0 ang grs & 1 == 1 then N = 1
    # else N = 0
    m = m1 if N=0 else -m
    fuv = fuv if N=0 else grs
    grs = h if N=0 else hh
    grs = grs signed>> 1


    """
code += """
mem64[pointer_delta] = m

# Extraction
# int64 u
# int64 v
# int64 r
# int64 s

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43


s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43


"""



code += """
# int64 tmp
# int64 prod_lo
# int64 prod_hi
# int64 new_f
# int64 new_g
# int64 new_uu
# int64 new_vv
# int64 new_rr
# int64 new_ss
# prod_lo = u * f
# prod_hi = u signed* f (hi)

# tmp = v * g
# prod_lo += tmp !

# tmp = v signed* g (hi)
# prod_hi = prod_hi + tmp + carry 

# prod_lo = prod_lo unsigned>> 20
# prod_hi = prod_hi << 44
# new_f = prod_lo | prod_hi




# prod_lo = r * f
# prod_hi = r signed* f (hi)

# tmp = s * g
# prod_lo += tmp !

# tmp = s signed* g (hi)
# prod_hi = prod_hi + tmp + carry 

# prod_lo = prod_lo unsigned>> 20
# prod_hi = prod_hi << 44
# new_g = prod_lo | prod_hi

# #mem64[pointer_f] = new_f
# #mem64[pointer_g] = new_g

# f = new_f
# g = new_g





tmp = u * uu
new_uu = tmp + v * rr

tmp = r * uu
new_rr = tmp + s * rr

tmp = u * vv
new_vv = tmp + v * ss

tmp = r * vv
new_ss = tmp + s * ss



uu = new_uu
vv = new_vv
rr = new_rr
ss = new_ss



mem128[pointer_uuvvrrss] = uu, vv
mem128[pointer_uuvvrrss + 16] = rr, ss


#ITERATION -= 1 !
#goto main_i_loop if unsigned>= 

"""











for i in range(15-1, 8-1,-2):
    code += f"pop2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"
for i in range(29, 18-1,-2):
    code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"



code += """
return

"""



with open("i_loop.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < i_loop.q > i_loop.S")
