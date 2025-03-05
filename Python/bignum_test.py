#!/usr/bin/env python3
import subprocess
import random
from bignum import int64_t

# -----------------------------------------------------------------------------
# 1. 準備測試資料 (corner cases + 一些隨機)
# -----------------------------------------------------------------------------
pairs = [
    ("Corner(0, 0)", 0, 0),
    ("Corner(1, -1)", 1, -1),
    ("Corner(2^63-1, -2^63)", (2**63 - 1), -(2**63)),
]

# 再加幾組隨機 (你可自行調整數量)
for i in range(30):
    a = random.randint(-2**63, 2**63 - 1)
    b = random.randint(-2**63, 2**63 - 1)
    pairs.append((f"Random#{i}", a, b))

# -----------------------------------------------------------------------------
# 2. 建立要測試的「運算清單」
#    每個運算以 (標籤, python計算函式, c端計算用的表達式) 表示
# -----------------------------------------------------------------------------
# 註: 對「單一操作元 (unary)」的運算（如 ~a, -a）只會用到 a，b 可忽略。
#     對「比較運算」(==, >) 會在 C 端印出 0 或 1。

ops = [
    # --- 二元整數運算 ---
    ("a + b",  lambda a, b: a + b,     "(a_VAR + b_VAR)"),
    ("a - b",  lambda a, b: a - b,     "(a_VAR - b_VAR)"),
    ("a * b",  lambda a, b: a * b,     "(a_VAR * b_VAR)"),
    ("a & b",  lambda a, b: a & b,     "(a_VAR & b_VAR)"),
    ("a | b",  lambda a, b: a | b,     "(a_VAR | b_VAR)"),
    ("a ^ b",  lambda a, b: a ^ b,     "(a_VAR ^ b_VAR)"),

    # --- 一元運算 (只測 a) ---
    ("~a",     lambda a, b: ~a,        "(~a_VAR)"),
    ("-a",     lambda a, b: -a,        "(-a_VAR)"),

    # --- 一元運算 (只測 b) ---
    ("~b",     lambda a, b: ~b,        "(~b_VAR)"),
    ("-b",     lambda a, b: -b,        "(-b_VAR)"),

    # --- 移位測試: 這邊示範右移/左移 1 bit、2 bit (針對 a、b 各做一次)
    # a >> 1, a >> 2, a << 1, a << 2, b >> 1, b >> 2, b << 1, b << 2
    ("a >> 1", lambda a, b: a >> 1,    "(a_VAR >> 1)"),
    ("a >> 2", lambda a, b: a >> 2,    "(a_VAR >> 2)"),
    ("a << 1", lambda a, b: a << 1,    "(a_VAR << 1)"),
    ("a << 2", lambda a, b: a << 2,    "(a_VAR << 2)"),

    ("b >> 1", lambda a, b: b >> 1,    "(b_VAR >> 1)"),
    ("b >> 2", lambda a, b: b >> 2,    "(b_VAR >> 2)"),
    ("b << 1", lambda a, b: b << 1,    "(b_VAR << 1)"),
    ("b << 2", lambda a, b: b << 2,    "(b_VAR << 2)"),

    # --- 比較運算 (回傳 True/False) => 在 C 端用 1/0 表示
    ("a == b", lambda a, b: 1 if (a == b) else 0,  "((a_VAR == b_VAR) ? 1 : 0)"),
    ("a > b",  lambda a, b: 1 if (a > b) else 0,   "((a_VAR > b_VAR) ? 1 : 0)"),
]

# -----------------------------------------------------------------------------
# 3. 建立 Python 端的預期結果清單 (label, 預期值) 以便後面與 C 比對
# -----------------------------------------------------------------------------
tests = []
for (name, a_val, b_val) in pairs:
    a_i = int64_t(a_val)
    b_i = int64_t(b_val)
    for (op_name, py_func, _) in ops:
        label = f"{name}: {op_name}"
        py_result_int = int(py_func(a_i, b_i))  # 轉為 Python int (0~64bit有符號)
        tests.append((label, py_result_int))

# -----------------------------------------------------------------------------
# 4. 產生 C 程式碼 (test_int64.c)
# -----------------------------------------------------------------------------
def to_c_literal(x: int) -> str:
    """處理 -2^63 的字面量，否則直接加 LL 即可。"""
    if x == -2**63:
        return "(-9223372036854775807LL - 1)"
    return f"{x}LL"

c_code_header = r"""
#include <stdio.h>
#include <stdint.h>

void print_int64(const char *label, int64_t value) {
    // 比對方便：用 "label -> decimal (0xHEX)" 格式
    printf("%s -> %lld (0x%llX)\n", label, (long long)value, (unsigned long long)value);
}

int main() {
"""

c_code_footer = r"""
    return 0;
}
"""

lines = []
for i, (name, a_val, b_val) in enumerate(pairs):
    var_id = f"pair{i}"
    cA = to_c_literal(a_val)
    cB = to_c_literal(b_val)

    lines.append(f"    int64_t a_{var_id} = {cA};")
    lines.append(f"    int64_t b_{var_id} = {cB};")

    # 根據 ops 清單，對 (a_{var_id}, b_{var_id}) 產生所有測試
    for (op_name, _, c_expr) in ops:
        # label
        label_str = f"{name}: {op_name}"
        # 把 c_expr 裡的 a_VAR, b_VAR 替換成對應實際變數
        expr = c_expr.replace("a_VAR", f"a_{var_id}").replace("b_VAR", f"b_{var_id}")

        lines.append(
            f'    print_int64("{label_str}", (int64_t){expr});'
        )

    lines.append("")  # 空一行，排版好看

c_code = c_code_header + "\n".join(lines) + c_code_footer

# 將 C 程式碼輸出到 test_int64.c
with open("test_int64.c", "w") as f:
    f.write(c_code)

# -----------------------------------------------------------------------------
# 5. 編譯並執行 C 程式，擷取輸出
# -----------------------------------------------------------------------------
subprocess.run(["gcc", "-o", "test_int64", "test_int64.c"], check=True)
c_out = subprocess.run(["./test_int64"], capture_output=True, text=True, check=True).stdout

# -----------------------------------------------------------------------------
# 6. 解析 C 輸出 (key -> "decimal (0xHEX)")
# -----------------------------------------------------------------------------
c_results = {}
for line in c_out.strip().split("\n"):
    # 預期行格式:  "Corner(0, 0): a + b -> 123 (0x7B)"
    if " -> " in line:
        key, val_str = line.split(" -> ", 1)
        key = key.strip()
        c_results[key] = val_str.strip()

def format_hex_64(x: int) -> str:
    """將 x 視為64bit二補數並轉16進位"""
    return f"0x{(x & 0xFFFFFFFFFFFFFFFF):X}"

# -----------------------------------------------------------------------------
# 7. 比對 Python 與 C 的結果 (只印出Mismatch)
# -----------------------------------------------------------------------------
mismatch_count = 0

for (label, py_val) in tests:
    # Python預期顯示
    py_hex = format_hex_64(py_val)
    py_display = f"{py_val} ({py_hex})"

    # 取得 C 輸出
    c_val = c_results.get(label)  # e.g. "123 (0x7B)" or None

    # 如果沒找到 或 與Python不符 -> 顯示Mismatch
    if c_val is None:
        mismatch_count += 1
        print(f"[Mismatch] {label}")
        print(f"  Python = {py_display}")
        print(f"  C      = (Not found)\n")
    else:
        # c_val 形如 "123 (0x7B)"
        if py_display != c_val:
            mismatch_count += 1
            print(f"[Mismatch] {label}")
            print(f"  Python = {py_display}")
            print(f"  C      = {c_val}\n")

if mismatch_count == 0:
    print("All tests matched! (No mismatches)")


