
# qhasm: int64 input_x0

# qhasm: int64 input_x1

# qhasm: int64 input_x2

# qhasm: int64 input_x3

# qhasm: int64 input_x4

# qhasm: int64 input_x5

# qhasm: int64 input_x6

# qhasm: int64 input_x7

# qhasm: int64 output_x0

# qhasm: int64 calleesaved_x18

# qhasm: int64 calleesaved_x19

# qhasm: int64 calleesaved_x20

# qhasm: int64 calleesaved_x21

# qhasm: int64 calleesaved_x22

# qhasm: int64 calleesaved_x23

# qhasm: int64 calleesaved_x24

# qhasm: int64 calleesaved_x25

# qhasm: int64 calleesaved_x26

# qhasm: int64 calleesaved_x27

# qhasm: int64 calleesaved_x28

# qhasm: int64 calleesaved_x29

# qhasm: reg128 input_v0

# qhasm: reg128 input_v1

# qhasm: reg128 input_v2

# qhasm: reg128 input_v3

# qhasm: reg128 input_v4

# qhasm: reg128 input_v5

# qhasm: reg128 input_v6

# qhasm: reg128 input_v7

# qhasm: reg128 output_v0

# qhasm: reg128 calleesaved_v8

# qhasm: reg128 calleesaved_v9

# qhasm: reg128 calleesaved_v10

# qhasm: reg128 calleesaved_v11

# qhasm: reg128 calleesaved_v12

# qhasm: reg128 calleesaved_v13

# qhasm: reg128 calleesaved_v14

# qhasm: reg128 calleesaved_v15

# qhasm: int64 pointer_delta

# qhasm: int64 pointer_fuv

# qhasm: int64 pointer_grs

# qhasm: input pointer_delta

# qhasm: input pointer_fuv

# qhasm: input pointer_grs

# qhasm: int64 delta

# qhasm: int64 fuv

# qhasm: int64 grs

# qhasm: int64 g0_and_1

# qhasm: int64 cond

# qhasm: int64 delta_tmp

# qhasm: int64 c_mask

# qhasm: int64 n_mask

# qhasm: int64 fuv_new

# qhasm: int64 grs_new

# qhasm: int64 tmp

# qhasm: int64 neg_fuv

# qhasm: int64 neg_delta

# qhasm: int64 delta_swapper

# qhasm: enter divstep
.align 4
.global _divstep
.global divstep
_divstep:
divstep:
        ldr     x8, [x2]
        ldr     x9, [x0]
        and     x10, x8, #0x1
        cmp     x9, #0
        ldr     x9, [x1]
        csel    x10, x10, xzr, gt
        neg     x11, x10
        sub     x10, x10, #1
        neg     x12, x9
        and     x9, x10, x9
        and     x13, x8, x11
        and     x12, x11, x12
        and     x14, x10, x8
        eor     x9, x9, x13
        sbfx    x8, x8, #0, #1
        eor     x12, x14, x12
        str     x9, [x1]
        str     x12, [x2]
        ldr     x9, [x0]
        neg     x12, x9
        and     x9, x9, x10
        and     x10, x12, x11
        orr     x9, x10, x9
        str     x9, [x0]
        ldr     x9, [x1]
        ldr     x10, [x2]
        and     x8, x8, x9
        add     x8, x8, x10
        asr     x8, x8, #1
        str     x8, [x2]
        ldr     x8, [x0]
        add     x8, x8, #2
        str     x8, [x0]
        ret
