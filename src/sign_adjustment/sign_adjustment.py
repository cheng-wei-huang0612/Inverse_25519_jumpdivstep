
code = ""

function_input = """
int64 pointer_inv30
int64 pointer_F
int64 pointer_V

input pointer_inv30
input pointer_F
input pointer_V

"""

entrance = """
enter sign_adjustment
"""

initial_condition_var = """
int64 F0_F1
reg128 vec_F0_F1_G0_G1
"""
for n in range(0,8,2):
    initial_condition_var += f"int64 V{n}_V{n+1}\n"
initial_condition_var += f"int64 V{8}_0\n"

for n in range(0,8,2):
    initial_condition_var += f"reg128 vec_V{n}_V{n+1}_S{n}_S{n+1}\n"
initial_condition_var += f"reg128 vec_V{8}_0_S{8}_0\n"

initial_condition = """
F0_F1 = mem64[pointer_F]
vec_F0_F1_G0_G1[0/2] = F0_F1
"""

for n in range(0,8,2):
    initial_condition += f"V{n}_V{n+1} = mem64[pointer_V + {8*n}]\n"
initial_condition += f"V{8}_0 = mem64[pointer_V + {8*5}]\n"

for n in range(0,8,2):
    initial_condition += f"vec_V{n}_V{n+1}_S{n}_S{n+1}[0/2] = V{n}_V{n+1}\n"
initial_condition += f"vec_V{8}_0_S{8}_0[0/2] = V{8}_0\n"

initial_condition += """

# initial conditioning ends


"""

create_mask_and_constant = ""
create_mask_and_constant_var = ""

create_mask_and_constant_var += """
int64 2p30m1
reg128 vec_F0_F0_F0_F0
reg128 vec_2p30m1
reg128 vec_mask
int64 mask
reg128 vec_not_mask
int64 not_mask
reg128 vec_diff
reg128 vec_neg_diff
"""

create_mask_and_constant += """
4x vec_F0_F0_F0_F0 = vec_F0_F1_G0_G1[0/4]
2p30m1 = 1073741823
4x vec_2p30m1 = 2p30m1

vec_diff = vec_F0_F0_F0_F0 ^ vec_2p30m1
4x vec_neg_diff = -vec_diff
vec_not_mask = vec_diff | vec_neg_diff
4x vec_not_mask = vec_not_mask >> 31
vec_mask = ~vec_not_mask

mask = vec_mask[0/4]
not_mask = ~mask



"""

#inv30 = P + 18 = 2^255 - 1
inv30_to_Padd18_var = """
reg128 vec_inv0_inv1_inv2_inv3
reg128 vec_inv4_inv5_inv6_inv7
int64 inv8

"""
inv30_to_Padd18 = """
vec_inv0_inv1_inv2_inv3 = vec_mask & vec_2p30m1
vec_inv4_inv5_inv6_inv7 = vec_inv0_inv1_inv2_inv3 
inv8 = 32767
inv8 = inv8 & mask

"""


V_30_reshape_var = """
reg128 vec_V0_V1_V2_V3 
reg128 vec_V4_V5_V6_V7 
"""

V_30_reshape = """
2x vec_V0_V1_V2_V3 zip= vec_V0_V1_S0_S1[0/2] vec_V2_V3_S2_S3[0/2] 
2x vec_V4_V5_V6_V7 zip= vec_V4_V5_S4_S5[0/2] vec_V6_V7_S6_S7[0/2]
"""










ret = """return"""

code += function_input
code += initial_condition_var
code += create_mask_and_constant_var
code += inv30_to_Padd18_var
code += V_30_reshape_var

code += entrance

code += initial_condition
code += create_mask_and_constant
code += inv30_to_Padd18
code += V_30_reshape

code += ret


import os

path = os.path.expanduser("~/Documents/Ed25519/src/sign_adjustment/sign_adjustment.q")
with open(path, "w") as f:
    f.write(code)
