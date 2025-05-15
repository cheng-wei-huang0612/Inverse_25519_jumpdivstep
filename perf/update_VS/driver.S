.global _start
.extern update_VS_mont

_start:
    ldr     x20, =1000000      // ⇦ 改這行：載入迴圈次數
loop:
    bl      update_VS_mont
    subs    x20, x20, #1
    b.ne    loop

    // exit(0)
    mov     x8, #93           // sys_exit
    mov     x0, #0
    svc     #0
