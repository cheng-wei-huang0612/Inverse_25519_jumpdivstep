
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

# qhasm: int64 c_mask

# qhasm: int64 fuv_new

# qhasm: int64 grs_new

# qhasm: int64 grs_final

# qhasm: int64 neg_fuv

# qhasm: int64 neg_delta

# qhasm: enter divstep
.align 4
.global _divstep
.global divstep
_divstep:
divstep:
        ldr     x3,  [x0]          // δ
        ldr     x4,  [x1]          // f
        ldr     x11, [x2]          // g

        and     x6,  x11, #1       // g0
        cmp     x3,  #0
        csel    x7,  x6,  xzr, gt  // x7 = g0 或 0
        negs    x7,  x7            // c_mask & 立 MI

        // --- swap 或取負 ---
        neg     x10, x4            // −f
        neg     x9,  x3            // −δ
        csel    x4,  x11, x4,  mi  // f′
        csel    x11, x10, x11, mi  // g′
        csel    x3,  x9,  x3,  mi  // δ′

        neg     x12, x6            // –g0
        and     x12, x12, x4
        add     x11, x11, x12
        asr     x11, x11, #1

        add     x3,  x3,  #2

        str     x3,  [x0]
        str     x4,  [x1]
        str     x11,[x2]
        ret
