
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

# qhasm: int64 pointer_inv

# qhasm: int64 pointer_F

# qhasm: int64 pointer_V

# qhasm: input pointer_inv

# qhasm: input pointer_F

# qhasm: input pointer_V

# qhasm: int64 signF

# qhasm: enter final_adjustment
.align 4
.global _final_adjustment
.global final_adjustment
_final_adjustment:
final_adjustment:

# qhasm: int64 V0V1

# qhasm: int64 V2V3

# qhasm: int64 V4V5

# qhasm: int64 V6V7
        ldrsw x15, [x1, #32]             // *.............................
        ldp x1, x10, [x2]                // *.............................
        mov x9, #18                      // *.............................
        mvn x11, xzr                     // .*............................
        ldr w14, [x2, #32]               // .*............................
        ldp x13, x2, [x2, #16]           // ..*...........................
        lsr x4, x11, #1                  // ..*...........................
        and x5, x9, x15                  // ....*.........................
        cmp x15, #0                      // ....*.........................
        lsr x7, x1, #32                  // ....*.........................
        and x3, x10, #0x3fffffff         // .....*........................
        lsr x15, x10, #32                // .....*........................
        lsl x7, x7, #30                  // .....*........................
        and x6, x1, #0x3fffffff          // ......*.......................
        lsl x11, x14, #48                // ......*.......................
        and x17, x13, #0x3fffffff        // ......*.......................
        lsr x8, x13, #32                 // .......*......................
        orr x14, x6, x7                  // .......*......................
        lsr x7, x2, #32                  // .......*......................
        and x12, x2, #0x3fffffff         // ........*.....................
        lsl x15, x15, #26                // ........*.....................
        lsl x10, x7, #18                 // ........*.....................
        lsl x7, x8, #22                  // .........*....................
        lsr x16, x12, #12                // .........*....................
        lsl x1, x3, #60                  // ..........*...................
        lsr x3, x3, #4                   // ..........*...................
        orr x10, x16, x10                // ..........*...................
        orr x10, x10, x11                // ...........*..................
        lsl x11, x12, #52                // ...........*..................
        lsr x6, x17, #8                  // ...........*..................
        sub x12, x4, x10                 // ............*.................
        lsl x2, x17, #56                 // ............*.................
        orr x14, x14, x1                 // ............*.................
        orr x4, x3, x15                  // .............*................
        orr x3, x6, x7                   // .............*................
        csinv x15, x14, x14, pl          // .............*................
        sub x15, x15, x5                 // ..............*...............
        orr x3, x3, x11                  // ..............*...............
        orr x7, x4, x2                   // ..............*...............
        csel x11, x10, x12, pl           // ...............*..............
        csinv x10, x3, x3, pl            // ...............*..............
        csinv x14, x7, x7, pl            // ...............*..............
        stp x15, x14, [x0]               // ................*.............
        stp x10, x11, [x0, #16]          // ................*.............

# qhasm: return
ret
