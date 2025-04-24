/*  x0 = &delta , x1 = &fuv , x2 = &grs          */
/*  constant-time divstep                         */
    .global _divstep
    .global divstep
_divstep:
divstep:
/* ──────────────── load state ─────────────────── */
    ldr     x3, [x0]          // delta
    ldr     x4, [x1]          // f = fuv_old
    ldr     x11,[x2]          // g = grs_old           (x11 保留舊 g)

    and     x6,  x11,#1       // g0&1
    cmp     x3,  #0
    csetm   x7,  gt           // x7 = -1  (delta>0) , else 0
    and     x7,  x7, x6       // c_mask  = (delta>0 && (g&1)) ? -1 : 0

/* ──────────────── f  ←  cond?g:f ────────────── */
    eor     x5,  x4, x11      // diff = f ^ g
    and     x5,  x5, x7       // mask
    eor     x5,  x5, x4       // x5 = f'  (新 fuv)

/* ──────────────── g  ←  cond?-f:g ───────────── */
    neg     x10, x4           // -f   (不動 flags)
    eor     x4,  x11, x10     // diff2 = g ^ -f
    and     x4,  x4, x7
    eor     x4,  x4, x11      // x4 = g'  (暫存，稍後還要調整)

/* ──────────────── delta ← cond?-delta:delta ─── */
    neg     x9,  x3           // -delta
    eor     x9,  x9, x3
    and     x9,  x9, x7
    eor     x3,  x3, x9       // delta'

/* ──────────────── g' = (g' + (-g0&1)&f') >> 1 ─ */
    neg     x12, x6           //   -g0&1  (0 / -1)
    and     x12, x12, x5      //   (-g0&1)&f'
    add     x12, x12, x4      //   + g'
    asr     x4,  x12, #1      // g''  (最終 grs)

/* ──────────────── delta += 2  &  store ──────── */
    add     x3,  x3, #2

    str     x3, [x0]          // delta
    str     x5, [x1]          // fuv
    str     x4, [x2]          // grs
    ret

