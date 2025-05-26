import logging
import sys


from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a72_frontend as Target_CortexA72

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

arch = AArch64_Neon
target = Target_CortexA72

slothy = Slothy(arch, target)


# example
slothy.load_source_from_file("i_loop_clean.S")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 512


slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x16","x17","sp"]
slothy.config.reserved_regs = ["x0","x1","x2","x3","x4","x5","x6","x29","x30"]
slothy.config.reserved_regs_are_locked = True
# slothy.config.reserved_regs = [
#     # 保留的 x 暫存器
#     "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7",
#     "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
#     "x16", "x17", "x18", "x19", "x20", "x21", "x22", "x30", "sp",

#     # 保留的 v 暫存器 (v0 到 v22, v30, v31)
#     "v0", "v1", "v2", "v3", "v4", "v5", "v6", "v7",
#     "v8", "v9", "v10", "v11", "v12", "v13", "v14", "v15",
#     "v16", "v17", "v18", "v19",  "v30", "v31"
# ]
# slothy.config.reserved_regs_are_locked = True

# slothy.config.outputs = ["x11", "x12", "x13",
#     "v1","v2","v3","v4","v5","v6","v7","v8","v9", "v18"]

slothy.optimize()
slothy.write_source_to_file("i_loop_opt_a72.s")