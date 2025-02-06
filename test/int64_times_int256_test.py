#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random

def int64_two_complement(x):
    """
    將 Python 的 int (可正可負) 對應到 64-bit 二補數表示，回傳 [0, 2^64-1].
    """
    if not (-2**63 <= x < 2**63):
        raise ValueError("A 超過 64-bit 帶正負號可表達範圍")
    # 負數要加上 2^64
    if x < 0:
        x = (x + (1 << 64)) & ((1 << 64) - 1)
    return x

def int256_two_complement(x):
    """
    將 Python 的 int (可正可負) 對應到 256-bit 二補數表示，回傳 [0, 2^256-1].
    """
    if not (-2**255 <= x < 2**255):
        raise ValueError("值超過 256-bit 帶正負號可表達範圍")
    if x < 0:
        x = (x + (1 << 256)) & ((1 << 256) - 1)
    return x

def int320_two_complement(x):
    """
    將 Python 的 int (可正可負) 對應到 320-bit 二補數表示，回傳 [0, 2^320-1].
    """
    if not (-2**319 <= x < 2**319):
        raise ValueError("值超過 320-bit 帶正負號可表達範圍")
    if x < 0:
        x = (x + (1 << 320)) & ((1 << 320) - 1)
    return x

def split_uint256_into_4_64bit(n):
    """
    將 256-bit (非負) 的整數 n 分割成 4 個 64-bit (v0, v1, v2, v3)。
    v0 為最低 64 bits，v3 為最高 64 bits。
    """
    v0 =  n         & ((1 << 64) - 1)
    v1 = (n >> 64)  & ((1 << 64) - 1)
    v2 = (n >> 128) & ((1 << 64) - 1)
    v3 = (n >> 192) & ((1 << 64) - 1)
    return (v0, v1, v2, v3)

def split_uint320_into_5_64bit(n):
    """
    將 320-bit (非負) 的整數 n 分割成 5 個 64-bit (v0..v4)。
    v0 為最低 64 bits，v4 為最高 64 bits。
    """
    v0 =  n          & ((1 << 64) - 1)
    v1 = (n >> 64)   & ((1 << 64) - 1)
    v2 = (n >> 128)  & ((1 << 64) - 1)
    v3 = (n >> 192)  & ((1 << 64) - 1)
    v4 = (n >> 256)  & ((1 << 64) - 1)
    return (v0, v1, v2, v3, v4)

# -----------------------------
# 主要程式開始
# -----------------------------

# 決定要產生幾組隨機測試案例
num_tests = 10
test_vectors = []

# 1) 隨機產生 A, B
#    A 是 64-bit 整數 ([-2^63, 2^63-1])
#    B 是 256-bit 整數 ([-2^255, 2^255-1])
#    R = A * B => 最多 320-bit
for _ in range(num_tests):
    A = random.randint(-2**63, 2**63 - 1)
    B = random.randint(-2**255, 2**255 - 1)
    R = A * B  # Python 任意精度

    # 確認 R 落在 320-bit 範圍內
    if not (-2**319 <= R < 2**319):
        raise ValueError("乘積超出 320-bit 帶正負號可表達範圍")

    test_vectors.append((A, B, R))

# 2) 角落案例 (可依需求再補充)
corner_cases = [
    (0, 0),
    (1, 1),
    (-1, -1),
    (2**63-1, -2**255),       # 混合極大/極小值
    (-2**63, 2**255-1),      # ...
]
for (A, B) in corner_cases:
    R = A * B
    if not (-2**319 <= R < 2**319):
        # 若真的超出範圍也可自行決定是否要忽略或 raise
        pass
    else:
        test_vectors.append((A, B, R))

# --------------------------------
# 產生對應的 C 檔
# --------------------------------

filename = "test/int64_times_int256_test.c"
with open(filename, "w") as f:
    # 檔頭
    f.write('#include "cint_arith.h"\n')  # 裡面應該定義 int256_t, int320_t, 等
    f.write('#include <stdio.h>\n')
    f.write('#include <stdint.h>\n')
    f.write('#include <stdlib.h>\n')
    f.write('\n')
    f.write('// 測試向量結構: A (64-bit), B (256-bit), R (320-bit)\n')
    f.write('typedef struct {\n')
    f.write('    int64_t   A;\n')
    f.write('    int256_t  B;\n')
    f.write('    int320_t  R;\n')
    f.write('} test_vector_t;\n\n')

    # 測試陣列
    f.write('static test_vector_t test_vectors[] = {\n')

    for (A, B, R) in test_vectors:
        # 轉成二補數
        A_64    = int64_two_complement(A)
        B_256   = int256_two_complement(B)
        R_320   = int320_two_complement(R)

        # 拆分 B
        b0, b1, b2, b3 = split_uint256_into_4_64bit(B_256)
        # 拆分 R
        r0, r1, r2, r3, r4 = split_uint320_into_5_64bit(R_320)

        # 寫出一行 { A, {{b0,b1,b2,b3}}, {{r0,r1,r2,r3,r4}} }
        f.write('    {\n')
        f.write('        0x%016XULL,\n' % (A_64,))
        f.write('        {{0x%016XULL, 0x%016XULL, 0x%016XULL, 0x%016XULL}},\n' % (b0, b1, b2, b3))
        f.write('        {{0x%016XULL, 0x%016XULL, 0x%016XULL, 0x%016XULL, 0x%016XULL}}\n' % (r0, r1, r2, r3, r4))
        f.write('    },\n')

    f.write('};\n\n')

    # 產生 main() 函式，逐筆測試
    f.write('int main(void)\n{\n')
    f.write('    int errors = 0;\n')
    f.write('    int num_tests = sizeof(test_vectors)/sizeof(test_vectors[0]);\n')
    f.write('    int320_t result;\n\n')
    f.write('    for (int i = 0; i < num_tests; i++) {\n')
    f.write('        // 呼叫被測函式\n')
    f.write('        // 假設函式原型: void int64_times_int256(int64_t *A, int256_t *B, int320_t *R);\n')
    f.write('        int64_times_int256(&test_vectors[i].A, &test_vectors[i].B, &result);\n\n')
    f.write('        // 驗證 result 的 5 個 64-bit (v[0..4]) 與預期是否相符\n')
    f.write('        for (int j = 0; j < 5; j++) {\n')
    f.write('            if (result.v[j] != test_vectors[i].R.v[j]) {\n')
    f.write('                errors++;\n')
    f.write('                printf("Test #%d FAILED!\\n", i);\n')
    f.write('                break;\n')
    f.write('            }\n')
    f.write('        }\n')
    f.write('    }\n\n')
    f.write('    if (errors == 0) {\n')
    f.write('        printf("All tests PASSED!\\n");\n')
    f.write('    } else {\n')
    f.write('        printf("%d tests FAILED.\\n", errors);\n')
    f.write('    }\n\n')
    f.write('    return errors ? 1 : 0;\n')
    f.write('}\n')

print(f"已產生 C 測試檔案: {filename}")
