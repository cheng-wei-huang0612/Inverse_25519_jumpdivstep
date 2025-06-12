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
slothy.load_source_from_file("cpt_inv_clean.S")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32


slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x2","x3","x4","x5","x6","x7","x8","x9","x10","x11","x12","x13","x14","x15","x16","x17",
    "v0","v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20","v21","v22","v23","v24","v25","v26","v27","v28","v29","v30","v31"]
slothy.config.reserved_regs = ["x0","x1","x18","x19","x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27", "x28", "x29", "x30", "sp"]
slothy.config.reserved_regs_are_locked = True




slothy.optimize()
slothy.write_source_to_file("cpt_inv_clean_opt_a72.s")