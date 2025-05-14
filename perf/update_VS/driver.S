.global _start
.extern update_VS_mont

_start:
    ldr     x3, =1000000      // ⇦ 改這行：載入迴圈次數
1:  bl      update_VS_mont
    subs    x3, x3, #1
    b.ne    1b

    // exit(0)
    mov     x8, #93           // sys_exit
    mov     x0, #0
    svc     #0
