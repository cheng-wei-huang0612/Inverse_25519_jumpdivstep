# inv600 in decimal:
big_str = 2**255 - 19

# 轉成 Python int
x = int(big_str)

# 每個 limb = 30 bits
LIMB_SIZE = 30
NUM_LIMBS = 9

limbs = []
for i in range(NUM_LIMBS):
    # 取最低 30 bits
    chunk = x & ((1 << LIMB_SIZE) - 1)
    limbs.append(chunk)
    # 右移 30 bits，準備取下一段
    x >>= LIMB_SIZE

# 如果 x 在這裡還不是 0，代表超出 9*30=270 bits，要另外處理
# 不過就您給的數字 2^255 尺寸來看，9 個 limb (270 bits) 足以容納
if x != 0:
    print("Warning: the number exceeds 9 limbs of 30 bits!", x)

# 現在 limbs[0] 是最低有效 limb，limbs[8] 是最高
# 印出 C 初始化 (以十六進位為例):
#   big30_9 inv600 = { 0x1234abcd, 0x..., ... };

# 也可印十進位，但十六進位對除錯、對比更方便
limb_strs = []
for limb in limbs:
    limb_strs.append(f"0x{limb:08x}")  # 8 hex digits, zero-padded if needed

# 注意順序：因為我們是 limbs[0] = LSB，最後 limbs[8] = MSB
# 就直接用這個順序 { limbs[0], limbs[1], ..., limbs[8] }
# （這裡就是 little-endian 的 limb 排列）
c_init = "{" + ", ".join(limb_strs) + "}"

print(f"big30_9 inv600 = {c_init};")

# 如果想用十進位：
# limb_strs_dec = [str(limb) for limb in limbs]
# c_init_dec = "{" + ", ".join(limb_strs_dec) + "}"
# print(f"big30_9 inv600_dec = {c_init_dec};")