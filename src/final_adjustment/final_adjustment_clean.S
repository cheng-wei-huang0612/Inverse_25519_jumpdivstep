ldr x3, [x2]
ldr x4, [x2, #8]
ldr x5, [x2, #16]
ldr x6, [x2, #24]
ldr w2, [x2, #32]
and x7, x3, #0x3fffffff
lsr x3, x3, #32
and x8, x4, #0x3fffffff
lsr x4, x4, #32
and x9, x5, #0x3fffffff
lsr x5, x5, #32
and x10, x6, #0x3fffffff
lsr x6, x6, #32
lsl x3, x3, #30
orr x3, x7, x3
lsl x7, x8, #60
orr x3,x3,x7
lsr x7, x8, #4
lsl x4, x4, #26
orr x4, x7, x4
lsl x7, x9, #56
orr x4,x4,x7
lsr x7, x9, #8
lsl x5, x5, #22
orr x5, x7, x5
lsl x7, x10, #52
orr x5,x5,x7
lsr x7, x10, #12
lsl x6, x6, #18
orr x6, x7, x6
lsl x2, x2, #48
orr x2,x6,x2
ldrsw x1, [x1, #32]
subs x1,x1,#0
mvn x6, xzr
lsr x6, x6, #1
mov x7, #18
csinv x3, x3, x3, pl
csinv x4, x4, x4, pl
csinv x5, x5, x5, pl
sub x6,x6,x2
csel x2, x2, x6, pl
and  x1, x7, x1
sub x1,x3,x1
str x1, [x0]
str x4, [x0, #8]
str x5, [x0, #16]
str x2, [x0, #24]
