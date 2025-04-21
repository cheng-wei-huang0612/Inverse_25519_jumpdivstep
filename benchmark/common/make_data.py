# make_data_h.py
from random import SystemRandom
MOD = 2**255 - 19
N   = 10_000
rng = SystemRandom()

def inv25519(a):            # 參考實作
    return pow(a, MOD-2, MOD)

def split4(u):
    """回傳 4×uint64 (little‑endian limb)"""
    limbs = []
    for _ in range(4):
        limbs.append(u & ((1<<64)-1))
        u >>= 64
    return limbs            # [lo, …, hi]

with open("data.h", "w") as f:
    f.write("// Auto‑generated — DO NOT EDIT.\n\n")
    f.write("#pragma once\n\n")
    f.write("#include <stdint.h>\n\n")
    f.write("#include \"fe25519.h\"\n\n")
    f.write(f"#define VECNUM {N}\n\n")
    f.write("static const fe25519 vec_in[VECNUM] = {\n")
    vec_out = []
    for i in range(N):
        x = rng.randrange(1, MOD)
        # y = inv25519(x)
        lx = split4(x)
        # ly = split4(y)
        f.write("    { %s },\n" % ", ".join(f"0x{w:016x}ULL" for w in lx))
        # vec_out.append(ly)
    f.write("};\n\n")


