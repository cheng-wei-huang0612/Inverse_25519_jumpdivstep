
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

# qhasm: enter update_VS_mont
.align 4
.global _update_VS_mont
.global update_VS_mont
_update_VS_mont:
update_VS_mont:
        ldp x9, x13, [x2, #0]                  // *....................................................................................................................................................................................................
        movi v0.2D, #0xffffffff                // *....................................................................................................................................................................................................
        ldp x14, x2, [x2, #16]                 // *....................................................................................................................................................................................................
        movz x3, #51739                        // .*...................................................................................................................................................................................................
        movk x3, #10347, lsl #16               // ..*..................................................................................................................................................................................................
        ldp x6, x5, [x0, #16]                  // ..*..................................................................................................................................................................................................
        sshr v6.2D, v0.2D, #2                  // ...*.................................................................................................................................................................................................
        dup v5.4S, w3                          // ...*.................................................................................................................................................................................................
        ubfx x7, x14, #30, #32                 // ....*................................................................................................................................................................................................
        ubfx x14, x14, #0, #30                 // ....*................................................................................................................................................................................................
        ubfx x15, x9, #0, #30                  // ....*................................................................................................................................................................................................
        ubfx x16, x13, #30, #32                // .....*...............................................................................................................................................................................................
        ins v16.s[0], w15                      // .....*...............................................................................................................................................................................................
        ubfx x15, x2, #0, #30                  // .....*...............................................................................................................................................................................................
        ubfx x10, x13, #0, #30                 // ......*..............................................................................................................................................................................................
        ubfx x13, x2, #30, #32                 // ......*..............................................................................................................................................................................................
        ubfx x2, x9, #30, #32                  // ......*..............................................................................................................................................................................................
        ins v25.d[0], x5                       // .......*.............................................................................................................................................................................................
        ldp x8, x5, [x0]                       // .......*.............................................................................................................................................................................................
        ins v17.s[0], w2                       // ........*............................................................................................................................................................................................
        ins v22.d[0], x6                       // ........*............................................................................................................................................................................................
        ins v16.s[1], w14                      // ...........*.........................................................................................................................................................................................
        ldr w17, [x1, #32]                     // ...........*.........................................................................................................................................................................................
        ins v19.d[0], x5                       // ...........*.........................................................................................................................................................................................
        ins v2.d[0], x8                        // ............*........................................................................................................................................................................................
        mov x3, #19                            // ............*........................................................................................................................................................................................
        dup v4.4S, w3                          // .............*.......................................................................................................................................................................................
        ldp x8, x3, [x1]                       // .............*.......................................................................................................................................................................................
        ins v16.s[2], w10                      // .................*...................................................................................................................................................................................
        ins v17.s[1], w7                       // ..................*..................................................................................................................................................................................
        ins v2.d[1], x8                        // ...................*.................................................................................................................................................................................
        ins v19.d[1], x3                       // ....................*................................................................................................................................................................................
        ins v16.s[3], w15                      // .......................*.............................................................................................................................................................................
        ins v17.s[2], w16                      // ........................*............................................................................................................................................................................
        smull v24.2D, v16.2S, v2.S[0]          // .............................*.......................................................................................................................................................................
        smlal2 v24.2D, v16.4S, v2.S[2]         // ..............................*......................................................................................................................................................................
        ins v17.s[3], w13                      // ...............................*.....................................................................................................................................................................
        ldp x8, x11, [x1, #16]                 // ...............................*.....................................................................................................................................................................
        mul v7.4S, v24.4S, v5.4S               // ..................................*..................................................................................................................................................................
        ins v22.d[1], x8                       // ....................................*................................................................................................................................................................
        and v23.16B, v7.16B, v6.16B            // .......................................*.............................................................................................................................................................
        uzp1 v0.4S, v23.4S, v23.4S             // ..........................................*..........................................................................................................................................................
        smlsl v24.2D, v0.2S, v4.2S             // .............................................*.......................................................................................................................................................
        sshll v1.2D, v0.2S, #15                // .............................................*.......................................................................................................................................................
        ldr w3, [x0, #32]                      // ..............................................*......................................................................................................................................................
        sshr v18.2D, v24.2D, #30               // .................................................*...................................................................................................................................................
        smlal v18.2D, v16.2S, v2.S[1]          // ....................................................*................................................................................................................................................
        smlal2 v18.2D, v16.4S, v2.S[3]         // .....................................................*...............................................................................................................................................
        smlal v18.2D, v17.2S, v2.S[0]          // ......................................................*..............................................................................................................................................
        smlal2 v18.2D, v17.4S, v2.S[2]         // .......................................................*.............................................................................................................................................
        ins v25.d[1], x11                      // ........................................................*............................................................................................................................................
        mul v5.4S, v18.4S, v5.4S               // ...........................................................*.........................................................................................................................................
        and v3.16B, v5.16B, v6.16B             // ................................................................*....................................................................................................................................
        uzp1 v30.4S, v3.4S, v3.4S              // ...................................................................*.................................................................................................................................
        smlsl v18.2D, v30.2S, v4.2S            // ......................................................................*..............................................................................................................................
        sshr v0.2D, v18.2D, #30                // ..........................................................................*..........................................................................................................................
        smlal v0.2D, v16.2S, v19.S[0]          // .............................................................................*.......................................................................................................................
        smlal2 v0.2D, v16.4S, v19.S[2]         // ..............................................................................*......................................................................................................................
        smlal v0.2D, v17.2S, v2.S[1]           // ...............................................................................*.....................................................................................................................
        smlal2 v0.2D, v17.4S, v2.S[3]          // ................................................................................*....................................................................................................................
        sshr v18.2D, v0.2D, #30                // ....................................................................................*................................................................................................................
        and v27.16B, v0.16B, v6.16B            // ....................................................................................*................................................................................................................
        ins v0.d[0], x3                        // .....................................................................................*...............................................................................................................
        smlal v18.2D, v16.2S, v19.S[1]         // .......................................................................................*.............................................................................................................
        smlal2 v18.2D, v16.4S, v19.S[3]        // ........................................................................................*............................................................................................................
        smlal v18.2D, v17.2S, v19.S[0]         // .........................................................................................*...........................................................................................................
        smlal2 v18.2D, v17.4S, v19.S[2]        // ..........................................................................................*..........................................................................................................
        ins v0.d[1], x17                       // ...........................................................................................*.........................................................................................................
        and v29.16B, v18.16B, v6.16B           // ..............................................................................................*......................................................................................................
        sshr v23.2D, v18.2D, #30               // ..............................................................................................*......................................................................................................
        smlal v23.2D, v16.2S, v22.S[0]         // .................................................................................................*...................................................................................................
        shl v7.2D, v29.2D, #32                 // .................................................................................................*...................................................................................................
        smlal2 v23.2D, v16.4S, v22.S[2]        // ..................................................................................................*..................................................................................................
        smlal v23.2D, v17.2S, v19.S[1]         // ...................................................................................................*.................................................................................................
        smlal2 v23.2D, v17.4S, v19.S[3]        // ....................................................................................................*................................................................................................
        orr v5.16B, v27.16B, v7.16B            // ....................................................................................................*................................................................................................
        sshll v7.2D, v30.2S, #15               // .....................................................................................................*...............................................................................................
        movi v30.2D, #0xffffffff               // ......................................................................................................*..............................................................................................
        sshr v26.2D, v23.2D, #30               // ........................................................................................................*............................................................................................
        smlal v26.2D, v16.2S, v22.S[1]         // ...........................................................................................................*.........................................................................................
        smlal2 v26.2D, v16.4S, v22.S[3]        // ............................................................................................................*........................................................................................
        smlal v26.2D, v17.2S, v22.S[0]         // .............................................................................................................*.......................................................................................
        smlal2 v26.2D, v17.4S, v22.S[2]        // ..............................................................................................................*......................................................................................
        and v19.16B, v26.16B, v6.16B           // ..................................................................................................................*..................................................................................
        sshr v26.2D, v26.2D, #30               // ..................................................................................................................*..................................................................................
        smlal v26.2D, v16.2S, v25.S[0]         // .....................................................................................................................*...............................................................................
        shl v31.2D, v19.2D, #32                // .....................................................................................................................*...............................................................................
        smlal2 v26.2D, v16.4S, v25.S[2]        // ......................................................................................................................*..............................................................................
        smlal v26.2D, v17.2S, v22.S[1]         // .......................................................................................................................*.............................................................................
        smlal2 v26.2D, v17.4S, v22.S[3]        // ........................................................................................................................*............................................................................
        sshr v18.2D, v6.2D, #15                // ........................................................................................................................*............................................................................
        sshr v19.2D, v26.2D, #30               // ............................................................................................................................*........................................................................
        smlal v19.2D, v16.2S, v25.S[1]         // ...............................................................................................................................*.....................................................................
        smlal2 v19.2D, v16.4S, v25.S[3]        // ................................................................................................................................*....................................................................
        smlal v19.2D, v17.2S, v25.S[0]         // .................................................................................................................................*...................................................................
        smlal2 v19.2D, v17.4S, v25.S[2]        // ..................................................................................................................................*..................................................................
        sshr v24.2D, v19.2D, #30               // ......................................................................................................................................*..............................................................
        smlal v24.2D, v16.2S, v0.S[0]          // .........................................................................................................................................*...........................................................
        smlal2 v24.2D, v16.4S, v0.S[2]         // ..........................................................................................................................................*..........................................................
        smlal v24.2D, v17.2S, v25.S[1]         // ...........................................................................................................................................*.........................................................
        smlal2 v24.2D, v17.4S, v25.S[3]        // ............................................................................................................................................*........................................................
        add v27.2D, v24.2D, v1.2D              // ................................................................................................................................................*....................................................
        and v3.16B, v27.16B, v6.16B            // ...................................................................................................................................................*.................................................
        sshr v22.2D, v27.2D, #30               // ...................................................................................................................................................*.................................................
        smlal v22.2D, v17.2S, v0.S[0]          // ......................................................................................................................................................*..............................................
        smlal2 v22.2D, v17.4S, v0.S[2]         // .......................................................................................................................................................*.............................................
        and v1.16B, v23.16B, v6.16B            // ........................................................................................................................................................*............................................
        and v0.16B, v19.16B, v6.16B            // ........................................................................................................................................................*............................................
        add v21.2D, v22.2D, v7.2D              // ...........................................................................................................................................................*.........................................
        sshr v28.2D, v21.2D, #30               // ..............................................................................................................................................................*......................................
        and v7.16B, v21.16B, v6.16B            // ..............................................................................................................................................................*......................................
        orr v1.16B, v1.16B, v31.16B            // ...............................................................................................................................................................*.....................................
        and v19.16B, v28.16B, v18.16B          // .................................................................................................................................................................*...................................
        sshr v31.2D, v28.2D, #15               // .................................................................................................................................................................*...................................
        shl v24.2D, v7.2D, #32                 // ..................................................................................................................................................................*..................................
        mul v17.4S, v4.4S, v31.4S              // ....................................................................................................................................................................*................................
        umov x8, v19.d[0]                      // ....................................................................................................................................................................*................................
        umov x5, v19.d[1]                      // .....................................................................................................................................................................*...............................
        orr v2.16B, v3.16B, v24.16B            // ......................................................................................................................................................................*..............................
        str w8, [x0, #32]                      // ........................................................................................................................................................................*............................
        and v3.16B, v17.16B, v30.16B           // .........................................................................................................................................................................*...........................
        str w5, [x1, #32]                      // .........................................................................................................................................................................*...........................
        and v17.16B, v26.16B, v6.16B           // .........................................................................................................................................................................*...........................
        shl v30.2D, v0.2D, #32                 // ..........................................................................................................................................................................*..........................
        add v18.4S, v5.4S, v3.4S               // ............................................................................................................................................................................*........................
        orr v19.16B, v17.16B, v30.16B          // .............................................................................................................................................................................*.......................
        sshr v30.4S, v18.4S, #30               // ...............................................................................................................................................................................*.....................
        zip1 v27.2D, v19.2D, v2.2D             // ................................................................................................................................................................................*....................
        zip2 v19.2D, v19.2D, v2.2D             // .................................................................................................................................................................................*...................
        shl v16.2D, v30.2D, #32                // ..................................................................................................................................................................................*..................
        str q27, [x0, #16]                     // ...................................................................................................................................................................................*.................
        str q19, [x1, #16]                     // ....................................................................................................................................................................................*................
        add v7.4S, v18.4S, v16.4S              // .....................................................................................................................................................................................*...............
        uzp1 v3.4S, v6.4S, v6.4S               // .....................................................................................................................................................................................*...............
        sshr v5.4S, v7.4S, #30                 // ........................................................................................................................................................................................*............
        and v2.16B, v7.16B, v3.16B             // .........................................................................................................................................................................................*...........
        ushr v5.2D, v5.2D, #32                 // ...........................................................................................................................................................................................*.........
        add v3.4S, v1.4S, v5.4S                // ..............................................................................................................................................................................................*......
        zip2 v6.2D, v2.2D, v3.2D               // .................................................................................................................................................................................................*...
        zip1 v29.2D, v2.2D, v3.2D              // .................................................................................................................................................................................................*...
        str q6, [x1]                           // ....................................................................................................................................................................................................*
        str q29, [x0]                          // ....................................................................................................................................................................................................*
# qhasm: return
ret
