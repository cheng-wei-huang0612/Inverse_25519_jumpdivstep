code = ""


code += "enter update_VS_mont\n"
code += """
int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
input pointeruuvvrrss
"""

code += """
# Calling Convention

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

# F, G Data Layout Configuration

"""

for symbol in ["V","S"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8\n"
    code += "\n"
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer{symbol}+16]\n"
    code += f"{symbol}8 = mem32[pointer{symbol}+32]\n"
    code += "\n"




for i in range(0,8,2):
    code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
    code += "\n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
    code += "\n"


code += """
reg128 vec_V8_0_S8_0
vec_V8_0_S8_0[0/2] = V8
vec_V8_0_S8_0[1/2] = S8
"""


code += """

# At this function, the uu, vv, rr, ss are already in neon registers

int64 uu
int64 vv
int64 rr
int64 ss

uu, vv = mem128[pointeruuvvrrss + 0]
rr, ss = mem128[pointeruuvvrrss + 16]

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

reg128 vec_uuhat_rrhat_vvhat_sshat
reg128 vec_uuhat_rrhat
reg128 vec_vvhat_sshat

# Get the hats
4x vec_uuhat_rrhat_vvhat_sshat = vec_uu1_rr1_vv1_ss1 >> 31
4x vec_uuhat_rrhat = vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[0/4] vec_uuhat_rrhat_vvhat_sshat[1/4] vec_uuhat_rrhat_vvhat_sshat[1/4]
4x vec_vvhat_sshat = vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[2/4] vec_uuhat_rrhat_vvhat_sshat[3/4] vec_uuhat_rrhat_vvhat_sshat[3/4]

"""



code += """

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



"""
for i in range(11):
    code += f"reg128 vec_uuV{i}_0_rrV{i}_0\n"



code += """

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

"""

code += """
# Compute l0 = (uu0 * V)[0] * M mod B
#            = (rr0 * V)[0] * M mod B
"""

code += """

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

"""


code += """
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

"""



code += """
# Carry Propagation

reg128 vec_carry
2x vec_carry = 0

"""

for i in range(9):
    code += f"2x vec_carry = vec_uuV{i}_0_rrV{i}_0 unsigned>> 30\n"
    code += f"vec_uuV{i}_0_rrV{i}_0 &= vec_2x_2p30m1\n"
    code += f"2x vec_uuV{i+1}_0_rrV{i+1}_0 += vec_carry\n"
    code += "\n"


code += """

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
"""


code += """
# Carry Propagation
"""

for i in range(1,10):
    code += f"2x vec_carry = vec_uuV{i}_0_rrV{i}_0 unsigned>> 30\n"
    code += f"vec_uuV{i}_0_rrV{i}_0 &= vec_2x_2p30m1\n"
    code += f"2x vec_uuV{i+1}_0_rrV{i+1}_0 += vec_carry\n"
    code += "\n"


code += """
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

"""


code += """
# Carry Propagation
"""

for i in range(1,10):
    code += f"2x vec_carry = vec_uuV{i}_0_rrV{i}_0 unsigned>> 30\n"
    code += f"vec_uuV{i}_0_rrV{i}_0 &= vec_2x_2p30m1\n"
    code += f"2x vec_uuV{i+1}_0_rrV{i+1}_0 += vec_carry\n"
    code += "\n"


code += """
# Reduce P once
"""

code += """
2x vec_buf = 19

"""
for i in range(2,10):
    code += f"2x vec_buf = vec_buf + vec_uuV{i}_0_rrV{i}_0\n"
    code += f"2x vec_buf unsigned>>= 30\n"









for i in range(15-1, 8-1,-2):
    code += f"pop2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"
for i in range(29, 18-1,-2):
    code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"






code += "return"

# ----
with open("update_VS_mont.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_VS_mont.q > update_VS_mont.S")


