class QhasmBlock:
    def __init__(self, block_name, int64s, reg128s, template):
        """
        block_name: 例如 "program_1"
        int64s:   list of str, 該 block 需要的 int64 變數名稱
        reg128s:  list of str, 該 block 需要的 reg128 變數名稱
        template: string, 這個 block 的 qhasm 程式碼模板
                  其中用 {var_name} placeholder
        """
        self.block_name = block_name
        self.int64s = int64s    # e.g. ["tmp0", "MASK", "carry64"]
        self.reg128s = reg128s  # e.g. ["vec0", "vec1"]
        self.template = template

def main():
    # 定義多個 QhasmBlock 並放入 list_of_qhasm_blocks
    list_of_qhasm_blocks = []

    # --- block_1 範例 ---
    tpl1 = """
# {block_name} code
2x {tmp0} = {MASK} * {tmp1}
2x {tmp0} = {tmp0} + 123

2x {vec0} = {vec1} + {tmp0}
"""
    block1_int64s = ["tmp0", "tmp1", "MASK"]
    block1_reg128s = ["vec0", "vec1"]
    block1 = QhasmBlock("program_1", block1_int64s, block1_reg128s, tpl1)
    list_of_qhasm_blocks.append(block1)

    # --- block_2 範例 ---
    tpl2 = """
enter {block_name}
2x {tmpA} = {tmpB} * {MASK}
2x {tmpA} = {tmpA} - {tmpB}
2x {vecA} = {vecB} ^ {tmpA}
"""
    block2_int64s = ["tmpA", "tmpB", "MASK"]
    block2_reg128s = ["vecA", "vecB"]
    block2 = QhasmBlock("program_2", block2_int64s, block2_reg128s, tpl2)
    list_of_qhasm_blocks.append(block2)

    # == 接下來就是產生 qhasm ==
    variable_declaration = ""
    program_code = ""

    # 1) 統一在檔案最前方宣告所有變數
    for block in list_of_qhasm_blocks:
        # 先宣告 int64
        for var in block.int64s:
            prefix_var = f"{block.block_name}_{var}"
            variable_declaration += f"int64 {prefix_var}\n"

        # 再宣告 reg128
        for var in block.reg128s:
            prefix_var = f"{block.block_name}_{var}"
            variable_declaration += f"reg128 {prefix_var}\n"
        variable_declaration += "\n"

    # 2) 產生每個 block 的程式碼
    for block in list_of_qhasm_blocks:
        code_out = block.template

        # 若模板裡也用到 {block_name}，先做替換
        code_out = code_out.replace("{block_name}", block.block_name)

        # 用 int64s 替換
        for var in block.int64s:
            old_str = f"{{{var}}}"  
            new_str = f"{block.block_name}_{var}"
            code_out = code_out.replace(old_str, new_str)

        # 用 reg128s 替換
        for var in block.reg128s:
            old_str = f"{{{var}}}"
            new_str = f"{block.block_name}_{var}"
            code_out = code_out.replace(old_str, new_str)

        program_code += code_out + "\n"

    final_qhasm = variable_declaration
    final_qhasm += "\nenter main_program\n"
    final_qhasm += program_code

    print(final_qhasm)

if __name__ == "__main__":
    main()

