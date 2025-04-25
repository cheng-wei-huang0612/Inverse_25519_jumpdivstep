
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

# qhasm: int64 pointer_uint256

# qhasm: int64 pointer_big30

# qhasm: input pointer_uint256

# qhasm: input pointer_big30

# qhasm: int64 limb64_0

# qhasm: int64 limb64_1

# qhasm: int64 limb64_2

# qhasm: int64 limb64_3

# qhasm: int64 limb30_0

# qhasm: int64 limb30_1

# qhasm: int64 limb30_2

# qhasm: int64 limb30_3

# qhasm: int64 limb30_4

# qhasm: int64 limb30_5

# qhasm: int64 limb30_6

# qhasm: int64 limb30_7

# qhasm: int64 limb30_8

# qhasm: int64 tmp

# qhasm: enter uint256_from_big30
.align 4
.global _uint256_from_big30
.global uint256_from_big30
_uint256_from_big30:
uint256_from_big30:

    ldp     w2, w3, [x1]           // Load limbs[0..1] (32-bit each) from *in (x1)
    ldp     w4, w5, [x1, #8]       // Load limbs[2..3]
    ldp     w6, w7, [x1, #16]      // Load limbs[4..5]
    ldp     w8, w9, [x1, #24]      // Load limbs[6..7]
    ldr     w10, [x1, #32]         // Load limb[8]
    // Assemble 64-bit output limb 0 (out0 = limb0 | (limb1 << 30) | ((limb2 & 0xF) << 60))
    mov     x11, x2                // x11 = limb0 (low 30 bits)
    bfi     x11, x3, #30, #30      // Insert 30-bit limb1 into x11 at bit offset 30
    bfi     x11, x4, #60, #4       // Insert lower 4 bits of limb2 into x11 at bit offset 60
    // Assemble 64-bit output limb 1 (out1 = (limb2 >> 4) | (limb3 << 26) | ((limb4 & 0xFF) << 56))
    lsr     x12, x4, #4            // x12 = limb2 >> 4  (gets remaining 26 bits of limb2)
    bfi     x12, x5, #26, #30      // Insert 30-bit limb3 at bit offset 26
    bfi     x12, x6, #56, #8       // Insert lower 8 bits of limb4 at bit offset 56
    // Assemble 64-bit output limb 2 (out2 = (limb4 >> 8) | (limb5 << 22) | ((limb6 & 0xFFF) << 52))
    lsr     x13, x6, #8            // x13 = limb4 >> 8  (gets remaining 22 bits of limb4)
    bfi     x13, x7, #22, #30      // Insert 30-bit limb5 at bit offset 22
    bfi     x13, x8, #52, #12      // Insert lower 12 bits of limb6 at bit offset 52
    // Assemble 64-bit output limb 3 (out3 = (limb6 >> 12) | (limb7 << 18) | ((limb8 & 0xFFFF) << 48))
    lsr     x14, x8, #12           // x14 = limb6 >> 12 (gets remaining 18 bits of limb6)
    bfi     x14, x9, #18, #30      // Insert 30-bit limb7 at bit offset 18
    bfi     x14, x10, #48, #16     // Insert lower 16 bits of limb8 at bit offset 48
    // Store the 4×64-bit result limbs to *out (x0)
    stp     x11, x12, [x0]         // Store output limbs[0..1]
    stp     x13, x14, [x0, #16]    // Store output limbs[2..3]
    ret
