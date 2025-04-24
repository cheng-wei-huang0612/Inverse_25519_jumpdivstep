code = ""

entrance = """
enter update_VS_mont
"""
code += entrance





# Calling Convention

code += """
# Prologue
# Calling Convention
"""

for i in range(18, 29+1,1):
    code += f"caller calleesaved_x{i}\n"

for i in range(8,15+1,1):
    code += f"caller calleesaved_v{i}\n"

for i in range(18, 29+1,2):
    code += f"push2xint64 calleesaved_x{i}, calleesaved_x{i+1}\n"

for i in range(8,15+1,2):
    code += f"push2x8b calleesaved_v{i}, calleesaved_v{i+1}\n"


code += """

# Function Inputs

int64 pointerV
int64 pointerS
int64 pointeruuvvrrss

input pointerV
input pointerS
input pointeruuvvrrss
"""

code += """

# Data Initialization

"""


code += """

# manage V and S

"""

for symbol in ["V","S"]:
    
    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}2{symbol}3\n"
    code += f"int64 {symbol}4{symbol}5\n"
    code += f"int64 {symbol}6{symbol}7\n"
    code += f"int64 {symbol}8\n"

for symbol in ["V", "S"]:
    code += f"{symbol}0{symbol}1, {symbol}2{symbol}3 = mem128[pointer{symbol}]\n"
    code += f"{symbol}4{symbol}5, {symbol}6{symbol}7 = mem128[pointer{symbol}+16]\n"
    code += f"{symbol}8 = mem32[pointer{symbol}+32]\n"


for i in range(0,8,2):
    code += f"reg128 vec_V{i}_V{i+1}_S{i}_S{i+1} \n"
code += "reg128 vec_V8_0_S8_0\n"

for i in range(0,8,2):
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[0/2] = V{i}V{i+1} \n"
    code += f"vec_V{i}_V{i+1}_S{i}_S{i+1}[1/2] = S{i}S{i+1} \n"
     
code += f"vec_V8_0_S8_0[0/2] = V8 \n"
code += f"vec_V8_0_S8_0[1/2] = S8 \n"



code += """

# manage uuvvrrss

"""

i = 0
for symbol in ["uu","vv","rr","ss"]:

    code += f"int64 {symbol}0{symbol}1\n"
    code += f"int64 {symbol}0\n"
    code += f"int64 {symbol}1\n"
    code += f"{symbol}0{symbol}1 = mem64[pointeruuvvrrss + {8*i}]\n"
    code += f"{symbol}0 = {symbol}0{symbol}1 & ((1 << 30)-1)\n"
    code += f"{symbol}1 = ({symbol}0{symbol}1 >> 30) & ((1 << 32)-1)\n"
    code += "\n"
    i += 1



for i in range(0,2):
    code += f"reg128 vec_uu{i}_rr{i}_vv{i}_ss{i}\n"




for i in range(0,2):
    for j,a,b in [(0,"uu", "rr"), (1,"vv", "ss")]:
        code += f"int64 {a}{i}{b}{i}\n"
        code += f"{b}{i} = {b}{i} << 32\n"
        code += f"{a}{i}{b}{i} = {a}{i} | {b}{i}\n"
        code += f"vec_uu{i}_rr{i}_vv{i}_ss{i}[{j}/2] = {a}{i}{b}{i}\n"
        code += "\n"


code += """

# Accumulate uu0 x V
#
# tmp = 0
# and 
# tmp += [uu0 * V, rr0 * V]

"""

for i in range(11):
    code += f"reg128 vec_uuV{i}_rrV{i}\n"

code += """

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

"""


for i in range(0,8,2):
    for j in range(2):
        code += f"2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V{i}_V{i+1}_S{i}_S{i+1}[{j}/4]\n"
        code += f"vec_uuV{i+j}_rrV{i+j} = vec_product & vec_2x_2p30m1\n"
        code += f"2x vec_product = vec_product unsigned>> 30\n"

code += f"2x vec_product += vec_uu0_rr0_vv0_ss0[0] unsigned* vec_V8_0_S8_0[0/4]\n"
code += f"vec_uuV8_rrV8 = vec_product & vec_2x_2p30m1\n"
code += f"2x vec_product = vec_product unsigned>> 30\n"
code += f"vec_uuV9_rrV9 = vec_product & vec_2x_2p30m1\n"


code += """

# Compute l0

"""
code += """
reg128 vec_l0
reg128 vec_M
2x vec_M = 678152731

4x vec_l0 = vec_uuV0_rrV0 * vec_M
vec_l0 = vec_l0 & vec_2x_2p30m1
"""


code += """

# Compute tmp += l0 * P

"""



code += """
2x vec_product = 0
reg128 vec_accu
2x vec_accu = 0

"""

code += """
2x vec_product += vec_4x_2p30m19[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV0_rrV0 += vec_accu
2x vec_product = vec_product >> 30

"""

for i in range(1, 8):
    code += "2x vec_product += vec_4x_2p30m1[0] unsigned* vec_l0[0/4]\n"
    code += "vec_accu = vec_product & vec_2x_2p30m1\n"
    code += f"2x vec_uuV{i}_rrV{i} += vec_accu\n"
    code += "2x vec_product = vec_product >> 30\n"
    code += "\n"


code += """
2x vec_product += vec_4x_2p15m1[0] unsigned* vec_l0[0/4]
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV8_rrV8 += vec_accu
2x vec_product = vec_product >> 30
vec_accu = vec_product & vec_2x_2p30m1
2x vec_uuV9_rrV9 += vec_accu

"""

code += """

# Carry Propogation

"""

code += """
reg128 vec_carry
2x vec_carry = 0

"""

for i in range(9):
    code += f"2x vec_carry = vec_uuV{i}_rrV{i} unsigned>> 30\n"
    code += f"vec_uuV{i}_rrV{i} = vec_uuV{i}_rrV{i} & vec_2x_2p30m1\n"
    code += f"2x vec_uuV{i+1}_rrV{i+1} = vec_uuV{i+1}_rrV{i+1} + vec_carry\n"
    code += "\n"



code += """

# vec_uuV_rrV[1:11] += [uu1, rr1] * V[0:9]

"""



for i in range(0,8,2):
    for j in range(2):
        code += f"2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V{i}_V{i+1}_S{i}_S{i+1}[{j}/4]\n"
        code += f"vec_uuV{i+j+1}_rrV{i+j+1} = vec_product & vec_2x_2p30m1\n"
        code += f"2x vec_product = vec_product unsigned>> 30\n"
        code += "\n"

code += f"2x vec_product += vec_uu1_rr1_vv1_ss1[0] unsigned* vec_V8_0_S8_0[0/4]\n"
code += f"vec_accu = vec_product & vec_2x_2p30m1\n"
code += f"vec_uuV8_rrV8 = vec_accu\n"
code += f"2x vec_product = vec_product unsigned>> 30\n"
code += f"vec_accu = vec_product & vec_2x_2p30m1\n"
code += f"vec_uuV9_rrV9 = vec_accu\n"







for i in range(15,8-1,-2):
    code += f"pop2x8b calleesaved_v{i-1}, calleesaved_v{i}\n"
for i in range(29, 18-1,-2):
    code += f"pop2xint64 calleesaved_x{i-1}, calleesaved_x{i}\n"

ret = """
return
"""
code += ret


# ----
with open("update_VS_mont.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_VS_mont.q > update_VS_mont.S")


