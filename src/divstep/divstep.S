
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
    /* ────── ① 讀入狀態 ────── */
    ldr     x3,  [x0]          // delta
    ldr     x4,  [x1]          // f
    ldr     x11, [x2]          // g

/* ────── ② 取得 g0, 產生 c_mask (0 / -1) ────── */
    and     x6,  x11, #1       // x6 = g0
    cmp     x3,  #0            // delta > 0 ?
    csel    x7,  x6,  xzr, gt  // x7 = g0  (若 delta>0)；否則 0
    negs    x7,  x7            // x7 = c_mask (0 或 -1)，並設定旗標
                                // N = 1 ⇔ cond 成立（MI）

/* ────── ③ 預先算出 −f 與 −delta（不動旗標） ─ */
    neg     x10, x4            // −f
    neg     x9,  x3            // −delta

/* ────── ④ 依條件選 f', g', delta' ────── */
    csel    x5,  x11, x4,  mi  // f' = (cond? g : f)
    csel    x4,  x10, x11, mi  // g' = (cond? −f : g)
    csel    x3,  x9,  x3,  mi  // δ' = (cond? −δ : δ)

/* ────── ⑤ gʺ = (g' + ((−g0)&f')) >> 1 ────── */
    neg     x12, x6            // −g0 (0 / −1)
    and     x12, x12, x5       // (−g0)&f'
    add     x12, x12, x4
    asr     x4,  x12, #1       // gʺ (最終 grs)

/* ────── ⑥ δ += 2，寫回 ────── */
    add     x3,  x3,  #2

    str     x3,  [x0]          // delta
    str     x5,  [x1]          // fuv
    str     x4,  [x2]          // grs
    ret
