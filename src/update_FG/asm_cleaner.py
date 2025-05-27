import re
import sys

# 讀取標準輸入的內容
qhasm_code = sys.stdin.read()

# 移除 .align 開頭的行以及其後四行
qhasm_code = re.sub(r'\.align.*(?:\n.*){0,4}', '', qhasm_code)

# 移除 .global 行
# qhasm_code = re.sub(r'\.global.*\n', '', qhasm_code)

# 移除 ret 行
qhasm_code = re.sub(r'\bret\b\n', '', qhasm_code)

# 逐行掃描，移除以 # 開頭的註解行
lines = []
for line in qhasm_code.splitlines():
    stripped_line = line.strip()
    if not stripped_line.startswith('#') and stripped_line:
        lines.append(stripped_line)

final_code = '\n'.join(lines).lower()

# 輸出到標準輸出
sys.stdout.write(final_code + '\n')
