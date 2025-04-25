
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
            // ───── Stage 0: 預存常用值 ────────────────────────────────
        mov     x3,  x2              // oldG ← G              (備份 G)
        add     x4,  x2,  x1         // H    ← G + F          (候選 G’)

        tst     x2,  #1              // 測 G 奇偶 → NZCV      (Z=1⇒偶)

        // Z = (G 奇數) ? Δ : −1   —— 供稍後判斷 “Case A or B” vs 其他
        mov     x5,  #-1
        csel    x5,  x0,  x5,  NE    // NE⇔G 奇 ⇒ Z=Δ

        // 若 G 偶 ⇒ H 改成 G      —— 使 Case C 直接取 H=G/2
        csel    x4,  x2,  x4,  EQ    // EQ⇔G 偶

        add     x6,  x0,  #1         // Δnew = Δ + 1          (供 B/C)

        // ───── Stage 1: 通用部份 (三案皆需的算術) ───────────────
        sub     x2,  x2,  x1         // TmpG = G − F
        asr     x2,  x2,  #1         // G   ← (G − F)/2       —— 若後續被採用 → Case A
        asr     x4,  x4,  #1         // H   ← (G±F)/2 或 G/2  —— Case B/C
        neg     x0,  x0              // Δ   ← −Δ              —— Case A 預先完成

        // ───── Stage 2: 依 Z>≶0 決定最後結果 (CSEL 無分支) ─────
        cmp     x5,  #0              // Z ≷ 0？  (N,Z,V set)

        // -------- Case A：G 奇數 ∧ Δ≥0 ⇒ (Z ≥ 0) -------------
        //   F ←  G_old
        //   G ← (G−F)/2          [已在 x2]
        //   Δ ← −Δ_old           [已在 x0]
        csel    x1,  x3,  x1,  GE    // GE⇒採 oldG ；否則保留 F

        // -------- Case B / C：Z < 0  ---------------------------
        //   (B) G 奇數 ∧ Δ<0  →   G ← (G+F)/2  (在 x4)
        //   (C) G 偶            →   G ←  G/2    (x4 已預設此值)
        //   Δ ← Δ_old + 1       (x6)
        csel    x2,  x2,  x4,  LT    // LT⇒採用 x4
        csel    x0,  x0,  x6,  LT    // LT⇒Δ = Δnew

