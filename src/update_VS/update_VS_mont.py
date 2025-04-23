
code = ""






with open("update_VS_mont.q", "w") as f:
    f.write(code)

import os
os.system("qhasm-aarch64-align < update_VS_mont.q > update_VS_mont.S")
