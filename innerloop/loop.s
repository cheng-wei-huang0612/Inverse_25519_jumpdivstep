
# qhasm: int64 input_0

# qhasm: int64 input_1

# qhasm: int64 input_2

# qhasm: int64 input_3

# qhasm: int64 input_4

# qhasm: int64 input_5

# qhasm: stack64 input_6

# qhasm: stack64 input_7

# qhasm: int64 caller_r11

# qhasm: int64 caller_r12

# qhasm: int64 caller_r13

# qhasm: int64 caller_r14

# qhasm: int64 caller_r15

# qhasm: int64 caller_rbx

# qhasm: int64 caller_rbp

# qhasm: int64 z

# qhasm: int64 h

# qhasm: int64 m

# qhasm: int64 grs

# qhasm: int64 fuv

# qhasm: int64 oldg

# qhasm: int64 mnew

# qhasm: int64 loop

# qhasm: enter innerloop
.p2align 5
.global _innerloop
.global innerloop
_innerloop:
innerloop:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: loop = 20000
# asm 1: mov  $20000,>loop=int64#1
# asm 2: mov  $20000,>loop=%rdi
mov  $20000,%rdi

# qhasm: innerloop:
._innerloop:

# qhasm: fuv = 0
# asm 1: xor  >fuv=int64#2,>fuv=int64#2
# asm 2: xor  >fuv=%rsi,>fuv=%rsi
xor  %rsi,%rsi

# qhasm: grs = 0
# asm 1: xor  >grs=int64#3,>grs=int64#3
# asm 2: xor  >grs=%rdx,>grs=%rdx
xor  %rdx,%rdx

# qhasm: m = 0
# asm 1: xor  >m=int64#4,>m=int64#4
# asm 2: xor  >m=%rcx,>m=%rcx
xor  %rcx,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm:   z = 0
# asm 1: xor  >z=int64#5,>z=int64#5
# asm 2: xor  >z=%r8,>z=%r8
xor  %r8,%r8

# qhasm:   oldg = grs
# asm 1: mov  <grs=int64#3,>oldg=int64#6
# asm 2: mov  <grs=%rdx,>oldg=%r9
mov  %rdx,%r9

# qhasm:   h = grs + fuv
# asm 1: lea  (<grs=int64#3,<fuv=int64#2),>h=int64#7
# asm 2: lea  (<grs=%rdx,<fuv=%rsi),>h=%rax
lea  (%rdx,%rsi),%rax

# qhasm:               =? grs & 1
# asm 1: test  $1,<grs=int64#3
# asm 2: test  $1,<grs=%rdx
test  $1,%rdx

# qhasm:   z = m   if !=
# asm 1: cmovne <m=int64#4,<z=int64#5
# asm 2: cmovne <m=%rcx,<z=%r8
cmovne %rcx,%r8

# qhasm:   h = grs if  =
# asm 1: cmove <grs=int64#3,<h=int64#7
# asm 2: cmove <grs=%rdx,<h=%rax
cmove %rdx,%rax

# qhasm:   mnew = m - 1
# asm 1: lea  -1(<m=int64#4),>mnew=int64#8
# asm 2: lea  -1(<m=%rcx),>mnew=%r10
lea  -1(%rcx),%r10

# qhasm:   grs -= fuv
# asm 1: sub  <fuv=int64#2,<grs=int64#3
# asm 2: sub  <fuv=%rsi,<grs=%rdx
sub  %rsi,%rdx

# qhasm:   (int64) grs >>= 1
# asm 1: sar  $1,<grs=int64#3
# asm 2: sar  $1,<grs=%rdx
sar  $1,%rdx

# qhasm:   (int64) h >>= 1
# asm 1: sar  $1,<h=int64#7
# asm 2: sar  $1,<h=%rax
sar  $1,%rax

# qhasm:   m = ~m
# asm 1: not  <m=int64#4
# asm 2: not  <m=%rcx
not  %rcx

# qhasm:                  signed<? z - 0
# asm 1: cmp  $0,<z=int64#5
# asm 2: cmp  $0,<z=%r8
cmp  $0,%r8

# qhasm:   fuv = oldg if  signed<
# asm 1: cmovl <oldg=int64#6,<fuv=int64#2
# asm 2: cmovl <oldg=%r9,<fuv=%rsi
cmovl %r9,%rsi

# qhasm:   grs = h    if !signed<
# asm 1: cmovge <h=int64#7,<grs=int64#3
# asm 2: cmovge <h=%rax,<grs=%rdx
cmovge %rax,%rdx

# qhasm:   m = mnew   if !signed<
# asm 1: cmovge <mnew=int64#8,<m=int64#4
# asm 2: cmovge <mnew=%r10,<m=%rcx
cmovge %r10,%rcx

# qhasm: =? loop -= 1
# asm 1: dec <loop=int64#1
# asm 2: dec <loop=%rdi
dec %rdi
# comment:fp stack unchanged by jump

# qhasm: goto innerloop if !=
jne ._innerloop

# qhasm: return
add %r11,%rsp
ret
