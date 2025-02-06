#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random

def int128_two_complement(x):
    """
    將 Python 的 int (可正可負) 對應到 128-bit 二補數表示，回傳 [0, 2^128-1].
    """
    if not (-2**127 <= x < 2**127):
        raise ValueError("值超過 128-bit 帶正負號可表達範圍")
    if x < 0:
        x = (x + (1 << 128)) & ((1 << 128) - 1)
    return x

def int256_two_complement(x):
    """
    將 Python 的 int (可正可負) 對應到 256-bit 二補數表示，回傳 [0, 2^256-1].
    """
    if not (-2**255 <= x < 2**255):
        raise ValueError("乘積超出 256-bit 帶正負號可表達範圍")
    if x < 0:
        x = (x + (1 << 256)) & ((1 << 256) - 1)
    return x

def split_uint128_into_2_64bit(n):
    """
    將 128-bit (非負) 的整數 n 分割成 2 個 64-bit (v0, v1)。
    v0 為最低 64 bits，v1 為最高 64 bits。
    """
    v0 = n & ((1 << 64) - 1)
    v1 = n >> 64
    return (v0, v1)

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

# -----------------------------
# 主要程式開始
# -----------------------------

num_tests = 10
test_vectors = []

# 1) 隨機產生 A, B (皆為 128-bit)
#    A, B ∈ [-2^127, 2^127-1]
#    R = A * B => 最大到 256-bit
for _ in range(num_tests):
    A = random.randint(-2**127, 2**127 - 1)
    B = random.randint(-2**127, 2**127 - 1)
    R = A * B  # Python 任意精度

    # 確認 R 在 [-2^255, 2^255-1] 內 (256-bit 帶正負號範圍)
    if not (-2**255 <= R < 2**255):
        raise ValueError("乘積超出 256-bit 帶正負號可表達範圍")

    test_vectors.append((A, B, R))

# 2) 角落案例 (可依需求增修)
corner_cases = [
    (0, 0),
    (1, 1),
    (-1, -1),
    (2**127 - 1, 2**127 - 1),     # 最大正數 * 最大正數
    (-2**127, -2**127),          # 最小值 * 最小值
    (2**127 - 1, -2**127),       # 混合極大正*極小負
]
for (A, B) in corner_cases:
    R = A * B
    if not (-2**255 <= R < 2**255):
        # 若超出 256-bit 範圍可忽略或 raise
        pass
    else:
        test_vectors.append((A, B, R))

# --------------------------------
# 產生 C 檔
# --------------------------------
filename = "test/int128_times_int128_test.c"
with open(filename, "w") as f:
    # 檔頭
    f.write('#include "cint_arith.h"\n')  # 應包含 int128_t, int256_t 定義
    f.write('#include <stdio.h>\n')
    f.write('#include <stdint.h>\n')
    f.write('#include <stdlib.h>\n')
    f.write('\n')
    f.write('// 測試向量結構: A (128-bit), B (128-bit), R (256-bit)\n')
    f.write('typedef struct {\n')
    f.write('    int128_t A;\n')
    f.write('    int128_t B;\n')
    f.write('    int256_t R;\n')
    f.write('} test_vector_t;\n\n')

    # 測試陣列
    f.write('static test_vector_t test_vectors[] = {\n')

    for (A, B, R) in test_vectors:
        # 轉成二補數
        A_128 = int128_two_complement(A)
        B_128 = int128_two_complement(B)
        R_256 = int256_two_complement(R)

        # 拆分 A, B, R
        A0, A1 = split_uint128_into_2_64bit(A_128)
        B0, B1 = split_uint128_into_2_64bit(B_128)
        R0, R1, R2, R3 = split_uint256_into_4_64bit(R_256)

        # 寫出結構初始化
        f.write('    {\n')
        f.write('        {{0x%016XULL, 0x%016XULL}},  // A\n' % (A0, A1))
        f.write('        {{0x%016XULL, 0x%016XULL}},  // B\n' % (B0, B1))
        f.write('        {{0x%016XULL, 0x%016XULL, 0x%016XULL, 0x%016XULL}} // R\n' % (R0, R1, R2, R3))
        f.write('    },\n')

    f.write('};\n\n')

    # 產生 main() 函式
    f.write('int main(void)\n{\n')
    f.write('    int errors = 0;\n')
    f.write('    int num_tests = sizeof(test_vectors)/sizeof(test_vectors[0]);\n')
    f.write('    int256_t result;\n\n')
    f.write('    for (int i = 0; i < num_tests; i++) {\n')
    f.write('        // 呼叫被測函式\n')
    f.write('        // 假設函式原型: void int128_times_int128(int128_t *A, int128_t *B, int256_t *R);\n')
    f.write('        int128_times_int128(&test_vectors[i].A, &test_vectors[i].B, &result);\n\n')
    f.write('        // 驗證 result 的 4 個 64-bit (v[0..3]) 與預期是否相符\n')
    f.write('        for (int j = 0; j < 4; j++) {\n')
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
