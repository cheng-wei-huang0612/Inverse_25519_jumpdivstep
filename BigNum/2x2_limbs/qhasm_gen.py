
api_vars = """
int64 pointerR
int64 pointerF
int64 pointerG
int64 pointeru
int64 pointerv

input pointerR
input pointerF
input pointerG
input pointeru
input pointerv
"""

api = """
enter muladd
"""



read_u_and_v_vars = """
int64 u0u1
int64 v0v1

reg128 vec_u0_u1_v0_v1

int64 uhat
int64 vhat

reg128 vec_uhat_vhat

int64 u0
int64 u1
int64 v0
int64 v1

int64 u0v0
int64 u1v1

reg128 vec_u0_v0_0_0
reg128 vec_u1_v1_0_0
"""

read_u_and_v="""
u0u1 = mem64[pointeru]
v0v1 = mem64[pointerv]

vec_u0_u1_v0_v1[0/2] = u0u1 
vec_u0_u1_v0_v1[1/2] = v0v1

uhat = u0u1 signed>> 63
vhat = v0v1 signed>> 63

vec_uhat_vhat[0/2] = uhat
vec_uhat_vhat[1/2] = vhat

u0 = u0u1 & 1073741823
u1 = u0u1 unsigned>>32

v0 = v0v1 & 1073741823
v1 = v0v1 unsigned>>32

v0 = v0 << 32
u0v0 = u0 + v0

v1 = v1 << 32
u1v1 = u1 + v1

vec_u0_v0_0_0[0/2] = u0v0
vec_u1_v1_0_0[0/2] = u1v1

"""

read_F_and_G_vars = """
int64 F0F1
int64 G0G1

reg128 vec_F0_F1_G0_G1

int64 Fhat
int64 Ghat

reg128 vec_Fhat_Ghat

int64 F0
int64 F1
int64 G0
int64 G1

int64 F0G0
int64 F1G1

reg128 vec_F0_G0_0_0
reg128 vec_F1_G1_0_0

"""

read_F_and_G = """
F0F1 = mem64[pointerF]
G0G1 = mem64[pointerG]

vec_F0_F1_G0_G1[0/2] = F0F1
vec_F0_F1_G0_G1[1/2] = G0G1

Fhat = F0F1 signed>> 63
Ghat = G0G1 signed>> 63

vec_Fhat_Ghat[0/2] = Fhat
vec_Fhat_Ghat[1/2] = Ghat


F0 = F0F1 & 1073741823
F1 = F0F1 unsigned>>32

G0 = G0G1 & 1073741823
G1 = G0G1 unsigned>>32

G0 = G0 << 32
F0G0 = F0 + G0

G1 = G1 << 32
F1G1 = F1 + G1

vec_F0_G0_0_0[0/2] = F0G0
vec_F1_G1_0_0[0/2] = F1G1

"""


unsigned_product_var = """
reg128 vec_tmp0 

reg128 vec_F0_G0_0_0
reg128 vec_u0_v0_0_0

int64 unsigned_product_MASK2p30m1
reg128 vec_unsigned_product_MASK2p30m1

reg128 vec_R0_S0 
reg128 vec_tmp0

reg128 vec_F1_G1_0_0


"""

unsigned_product = """
2x vec_tmp0 = vec_F0_G0_0_0 * vec_u0_v0_0_0

2x vec_unsigned_product_MASK2p30m1 = unsigned_product_MASK2p30m1
vec_R0_S0 = vec_tmp0 & vec_unsigned_product_MASK2p30m1


2x vec_tmp0 = vec_tmp0 unsigned>> 30


2x vec_tmp0 += vec_F1_G1_0_0 * vec_u0_v0_0_0


2x vec_tmp0 += vec_F0_G0_0_0 * vec_u1_v1_0_0


vec_R1_S1 = vec_tmp0 & vec_MASK2p30m1


2x vec_R1_S1 = vec_R1_S1 << 32


2x vec_R0R1_S0S1 = vec_R0_S0 + vec_R1_S1


R0R1 = vec_R0R1_S0S1[0/2]
S0S1 = vec_R0R1_S0S1[1/2]


2x vec_tmp0 = vec_tmp0 unsigned>> 30
2x vec_tmp0 += vec_F1_G1_0_0 * vec_u1_v1_0_0


vec_R2_S2 = vec_tmp0 & vec_MASK2p30m1


2x vec_tmp0 = vec_tmp0 unsigned>> 30

MASK2p32m1 = 4294967295
2x vec_MASK2p32m1 = MASK2p32m1

vec_R3_S3 = vec_tmp0 & vec_MASK2p32m1


2x vec_R3_S3 = vec_R3_S3 << 32
2x vec_R2R3_S2S3 = vec_R2_S2 + vec_R3_S3

"""










mul_variable = """
int64 {tmp0}
int64 {tmp1}
"""
list_of_mul_variable = ["tmp0", "tmp1"]

mul_program = """
{tmp0} = {tmp0} * {tmp1}
{tmp0} >>= {tmp1}
"""

program_2_variable = """
int64 program2_int1
int64 program2_int2
"""

program_2="""
program2_int1 = program2_int1 * program2_int2
"""

# --- 開始輸出 qhasm ---
code = ""
print(api_vars)
code += api_vars
print(read_u_and_v_vars)
code += read_u_and_v_vars

print(read_F_and_G_vars)
code += read_F_and_G_vars


print(api)
code += api
print(read_u_and_v)
code += read_u_and_v
print(read_F_and_G)
code += read_F_and_G


with open("muladd3.q","w") as f:
    f.write(code)

#for i in range(NUM_OF_MUL):
    #code_out = mul_variable
    #for var in list_of_mul_variable:
        #old_str = f"{{{var}}}"              # "{tmp0}", "{tmp1}"
        #new_str = f"mul_{i}_{var}"          # "mul_0_tmp0", "mul_0_tmp1", ...
        #code_out = code_out.replace(old_str, new_str)
    #print(code_out)
#
#for i in range(NUM_OF_MUL):
    #code_out = mul_program
    #for var in list_of_mul_variable:
        #old_str = f"{{{var}}}"              
        #new_str = f"mul_{i}_{var}"          
        #code_out = code_out.replace(old_str, new_str)
    #print(code_out)
