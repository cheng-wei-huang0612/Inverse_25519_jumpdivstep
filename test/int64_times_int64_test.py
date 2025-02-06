#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random

def int128_two_complement(x):
    """
    將 Python 的 int (可正可負，無限精度) 對應到 128-bit 的二補數表示。
    回傳一個非負整數 n，範圍在 [0, 2^128-1]。
    例如:
      若 x = 123，回傳 123
      若 x = -1，回傳 2^128 - 1
    """
    # 確保 x 落在 [-2^127, 2^127 - 1] 之間。
    if not (-2**127 <= x < 2**127):
        raise ValueError("超過 128-bit 帶正負號可表達範圍")

    # 若 x 為負，做二補數: x + 2^128
    if x < 0:
        x = (x + (1 << 128)) & ((1 << 128) - 1)
    return x

def int64_two_complement(x):
    """
    將 Python 的 int (可正可負，無限精度) 對應到 64-bit 的二補數表示。
    回傳一個非負整數 n，範圍在 [0, 2^64-1]。
    例如:
      若 x = 123，回傳 123
      若 x = -1，回傳 2^64 - 1
    """
    # 確保 x 落在 [-2^63, 2^63 - 1] 之間。
    if not (-2**63 <= x < 2**63):
        raise ValueError("超過 64-bit 帶正負號可表達範圍")

    # 若 x 為負，做二補數: x + 2^64
    if x < 0:
        x = (x + (1 << 64)) & ((1 << 64) - 1)
    return x



def split_uint128_into_two_64bit(n):
    """
    將 128-bit (非負) 的整數 n 分割成兩個 64-bit (v0, v1)。
    v0 為最低 64 bits，v1 為高位 64 bits。
    """
    v0 = n & ((1 << 64) - 1)
    v1 = n >> 64
    return v0, v1

# -----------------------------
# 主要程式開始
# -----------------------------

num_tests = 10  # 例: 產生 10 組隨機測試
test_vectors = []

# 1) 產生隨機測試案例
for _ in range(num_tests):
    A = random.randint(-2**63, 2**63 - 1)
    B = random.randint(-2**63, 2**63 - 1)
    R = A * B  # Python 自動做 64位*64位 => 任意精度

    # 確認結果在 [-2^127, 2^127-1] 之間
    if not (-2**127 <= R < 2**127):
        raise ValueError("R 超出 128-bit 帶正負號可表達範圍")

    test_vectors.append((A, B, R))

# 2) 也可手動加入一些特別的角落案例 (corner cases)
corner_cases = [
    (0, 0),
    (1, 1),
    (-1, -1),
    (2**63-1, 2**63-1),   # 9223372036854775807 * 9223372036854775807
    (-2**63, -2**63),    # -9223372036854775808 * -9223372036854775808
    (2**63-1, -2**63),   # ...
    # 其他您想測的特例
]

for (A, B) in corner_cases:
    R = A * B
    test_vectors.append((A, B, R))

# --------------------------------
# 產生 .c 檔
# --------------------------------

filename = "test/int64_times_int64_test.c"
with open(filename, "w") as f:
    # 先寫檔頭 (include、結構定義等)
    f.write('#include "cint_arith.h"\n')
    f.write('#include <stdio.h>\n')
    f.write('#include <stdint.h>\n')
    f.write('#include <stdlib.h>\n')
    f.write('\n')
    f.write('// 測試向量結構: 保存 A, B, 以及預期結果 R\n')
    f.write('typedef struct {\n')
    f.write('    int64_t A;\n')
    f.write('    int64_t B;\n')
    f.write('    int128_t R;\n')  # R 為 {v[0], v[1]}  (uint64_t)
    f.write('} test_vector_t;\n\n')

    # 開始定義測試陣列
    f.write('static test_vector_t test_vectors[] = {\n')

    for (A, B, R) in test_vectors:
        # 轉成二補數 128-bit
        R_128 = int128_two_complement(R)
        v0, v1 = split_uint128_into_two_64bit(R_128)
        A_64 = int64_two_complement(A)
        B_64 = int64_two_complement(B)

        # 將 R 寫成 {{0xXXXXXXXX, 0xXXXXXXXX}}
        # 注意 C99 語法: 用兩層大括號初始化 struct 中的陣列
        f.write('    { 0x%016XULL, 0x%016XULL, {{0x%016XULL, 0x%016XULL}} },\n' % (A_64, B_64, v0, v1))

    f.write('};\n\n')

    # 產生 main() 函式，逐筆測試
    f.write('int main(void)\n{\n')
    f.write('    int errors = 0;\n')
    f.write('    int num_tests = sizeof(test_vectors)/sizeof(test_vectors[0]);\n')
    f.write('    int128_t result;\n\n')
    f.write('    for (int i = 0; i < num_tests; i++) {\n')
    f.write('        // 呼叫被測函式\n')
    f.write('        int64_times_int64(&test_vectors[i].A, &test_vectors[i].B, &result);\n\n')
    f.write('        // 驗證結果: 比對 v[0], v[1]\n')
    f.write('        if (result.v[0] != test_vectors[i].R.v[0] ||\n')
    f.write('            result.v[1] != test_vectors[i].R.v[1]) {\n')
    f.write('            errors++;\n')
    f.write('            printf("Test #%d FAILED!\\n", i);\n')
    f.write('            printf("  A=%lld, B=%lld\\n", (long long)test_vectors[i].A, (long long)test_vectors[i].B);\n')
    f.write('            printf("  Expected R: [%016llX, %016llX]\\n",\n')
    f.write('                   (long long)test_vectors[i].R.v[1],\n')
    f.write('                   (long long)test_vectors[i].R.v[0]);\n')
    f.write('            printf("  Got R:      [%016llX, %016llX]\\n",\n')
    f.write('                   (long long)result.v[1],\n')
    f.write('                   (long long)result.v[0]);\n')
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
