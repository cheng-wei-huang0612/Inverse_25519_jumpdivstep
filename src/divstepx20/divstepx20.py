
code = ""


code += """
int64 pointer_delta
int64 pointer_fuv
int64 pointer_grs

input pointer_delta
input pointer_fuv
input pointer_grs

int64 m
int64 fuv
int64 grs

int64 h
int64 hh
int64 m1
int64 z



enter divstepx20

m = mem64[pointer_delta]
fuv = mem64[pointer_fuv]
grs = mem64[pointer_grs]

int64 ff

"""

for i in range(20):
    code += """

    m1 = m - 1 
    grs & 1
    ff = fuv if Z=0 else 0
    m1 & (grs >>> 1)
    m = m1 if N=0 else -m
    fuv = grs if N=1 else fuv
    ff = ff if N=0 else -ff
    grs = grs + ff
    grs = grs signed>> 1

    free m1
    free ff

    """

code += """
mem64[pointer_delta] = m
mem64[pointer_fuv] = fuv
mem64[pointer_grs] = grs




return


"""

with open("divstepx20.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < divstepx20.q > divstepx20.S")
