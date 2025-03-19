#!/usr/bin/env python3

import sys

def dec_to_uint256_t(x_dec: str) -> str:
    """
    將十進位大整數 (x_dec) 轉換為 C 語言的 uint256_t 結構初始值。
    limb64[0] 存最低 64 bits，limb64[3] 存最高 64 bits。
    """
    x = int(x_dec, 10)   # 以十進位解析輸入字串
    limbs = []
    
    # 逐段擷取 64-bit (小端序)
    for _ in range(4):
        limb = x & ((1 << 64) - 1)  # 取最低 64 bits
        limbs.append(limb)
        x >>= 64                   # 右移 64 bits
    
    # 生成 C 程式碼片段
    lines = []
    lines.append("uint256_t val = {")
    lines.append("    .limb64 = {")
    for i, limb in enumerate(limbs):
        # 以 16 進位格式 (補足 16 位十六進位數) + "ULL" 結尾
        line = f"        0x{limb:016x}ULL"
        if i < 3:
            line += ","
        lines.append(line)
    lines.append("    }")
    lines.append("};")
    
    return "\n".join(lines)

def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <decimal_number>")
        sys.exit(1)
    
    x_dec = sys.argv[1]
    snippet = dec_to_uint256_t(x_dec)
    print(snippet)

if __name__ == "__main__":
    main()
