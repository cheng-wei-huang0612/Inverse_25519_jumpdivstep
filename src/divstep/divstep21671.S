.align 4
.global _divstep
.global divstep
_divstep:
divstep:
        ldr     x3,  [x0]          // δ  (delta)
        ldr     x4,  [x1]          // f
        ldr     x11, [x2]          // g

        and     x6,  x11, #1       // g0
        cmp     x3,  #0            // δ > 0 ?
        csel    x7,  x6,  xzr, gt  // x7 = g0 if δ>0 else 0
        negs    x7,  x7            // c_mask = 0 / –1，並設旗標 (N=1 ⇒ cond)

        neg     x10, x4            // −f
        neg     x9,  x3            // −δ

        csel    x4,  x11, x4,  mi  // f′ → x4         (cond ? g  : f)
        csel    x11, x10, x11, mi  // g′ → x11        (cond ? −f : g)
        csel    x3,  x9,  x3,  mi  // δ′ → x3         (cond ? −δ : δ)

        neg     x12, x6            // −g0 (0 / −1)
        and     x12, x12, x4       // (−g0) & f′
        add     x11, x11, x12      // g′ + ...
        asr     x11, x11, #1       // gʺ → x11

        add     x3,  x3,  #2

        str     x3,  [x0]          // δ
        str     x4,  [x1]          // f
        str     x11, [x2]          // g
        ret
