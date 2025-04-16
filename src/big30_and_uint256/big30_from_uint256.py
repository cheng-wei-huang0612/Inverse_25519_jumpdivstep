


function_inputs_var = """
int64 pointer_uint256
int64 pointer_big30

input pointer_uint256
input pointer_big30

"""

entrance = """
enter big30_from_uint256
"""

ret = """
return
"""

limb64_extraction_var = ""
limb64_extraction = ""


for i in range(4):
    limb64_extraction_var += f"int64 limb64_{i}\n"
    limb64_extraction += f"limb64_{i} = mem64[pointer_uint256 + {8*i}]\n"






code = ""
code += function_inputs_var
code += limb64_extraction_var

code += entrance

code += limb64_extraction


code += ret




with open("big30_from_uint256.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < big30_from_uint256.q > big30_from_uint256.S")

