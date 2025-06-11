
code = ""


code += """
int64 pointer_delta
int64 pointer_fuv
int64 pointer_grs

input pointer_delta
input pointer_fuv
input pointer_grs

int64 delta
int64 fuv
int64 grs


int64 g0_and_1
int64 c_mask

int64 fuv_new
int64 grs_new
int64 grs_final
int64 neg_fuv
int64 neg_delta



enter divstepx20

delta = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]


"""

code += """
    grs & 1



"""

for i in range(19):
    code += """



    """

code += """
mem64[pointer_delta] = delta
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs




return


"""

with open("divstepx20_2.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < divstepx20_2.q > divstepx20_2.S")
