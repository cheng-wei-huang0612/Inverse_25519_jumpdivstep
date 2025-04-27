int64 f
int64 g
int64 u
int64 v
int64 r
int64 s
int64 f_carry
int64 g_carry
int64 rax
int64 rdx
int64 f_top
int64 g_top
int64 t0


int64 uvrs

int64 _2p59
stack64 stack_2p59

stack64 stack_r11
stack64 stack_r12
stack64 stack_r13
stack64 stack_r14
stack64 stack_r15
stack64 stack_rbx
stack64 stack_rbp


enter transition

uvrs = input_2
f = input_0
g = input_1

stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r13 = caller_r13
#stack_r14 = caller_r14
#stack_r15 = caller_r15
#stack_rbx = caller_rbx
#stack_rbp = caller_rbp

u = mem64[uvrs + 0]
v = mem64[uvrs + 8]
r = mem64[uvrs + 16]
s = mem64[uvrs + 24]
_2p59 = 576460752303423488
stack_2p59 = _2p59

transition_limb0:

rax = mem64[f + 0]
(int128) rdx rax = rax * u
t0 = rdx
f_carry = rax
rax = mem64[g + 0]
(int128) rdx rax = rax * v
carry? f_carry += rax
            t0 += rdx + carry
f_carry = (t0 f_carry) >> 60   

rax = mem64[f + 0]
(int128) rdx rax = rax * r
t0 = rdx
g_carry = rax
rax = mem64[g + 0]
(int128) rdx rax = rax * s
carry? g_carry += rax
            t0 += rdx + carry
g_carry = (t0 g_carry) >> 60   

transition_limb1:

f_top = f_carry
(int64) f_top >>= 63
rax = mem64[f + 8]
(int128) rdx rax = rax * u
carry? f_carry += rax
         f_top += rdx + carry
rax = mem64[g + 8]
(int128) rdx rax = rax * v
carry? f_carry += rax
         f_top += rdx + carry
t0 = f_carry	       
carry? f_carry = (f_top f_carry) >> 60
       f_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[f + 0] = t0

g_top = g_carry
(int64) g_top >>= 63
rax = mem64[f + 8]
(int128) rdx rax = rax * r
carry? g_carry += rax
         g_top += rdx + carry
rax = mem64[g + 8]
(int128) rdx rax = rax * s
carry? g_carry += rax
         g_top += rdx + carry
t0 = g_carry	       
carry? g_carry = (g_top g_carry) >> 60
       g_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[g + 0] = t0       

transition_limb2:

f_top = f_carry
(int64) f_top >>= 63
rax = mem64[f +16]
(int128) rdx rax = rax * u
carry? f_carry += rax
         f_top += rdx + carry
rax = mem64[g +16]
(int128) rdx rax = rax * v
carry? f_carry += rax
         f_top += rdx + carry
t0 = f_carry	       
carry? f_carry = (f_top f_carry) >> 60
       f_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[f + 8] = t0

g_top = g_carry
(int64) g_top >>= 63
rax = mem64[f +16]
(int128) rdx rax = rax * r
carry? g_carry += rax
         g_top += rdx + carry
rax = mem64[g +16]
(int128) rdx rax = rax * s
carry? g_carry += rax
         g_top += rdx + carry
t0 = g_carry	       
carry? g_carry = (g_top g_carry) >> 60
       g_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[g + 8] = t0

transition_limb3:

f_top = f_carry
(int64) f_top >>= 63
rax = mem64[f +24]
(int128) rdx rax = rax * u
carry? f_carry += rax
         f_top += rdx + carry
rax = mem64[g +24]
(int128) rdx rax = rax * v
carry? f_carry += rax
         f_top += rdx + carry
t0 = f_carry	       
carry? f_carry = (f_top f_carry) >> 60
       f_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[f +16] = t0

g_top = g_carry
(int64) g_top >>= 63
rax = mem64[f +24]
(int128) rdx rax = rax * r
carry? g_carry += rax
         g_top += rdx + carry
rax = mem64[g +24]
(int128) rdx rax = rax * s
carry? g_carry += rax
         g_top += rdx + carry
t0 = g_carry	       
carry? g_carry = (g_top g_carry) >> 60
       g_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[g +16] = t0

transition_limb4:

f_top = f_carry
(int64) f_top >>= 63
rax = mem64[f +32]
(int128) rdx rax = rax * u
carry? f_carry += rax
         f_top += rdx + carry
rax = mem64[g +32]
(int128) rdx rax = rax * v
carry? f_carry += rax
         f_top += rdx + carry
t0 = f_carry	       
carry? f_carry = (f_top f_carry) >> 60
       f_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[f +24] = t0

g_top = g_carry
(int64) g_top >>= 63
rax = mem64[f +32]
(int128) rdx rax = rax * r
carry? g_carry += rax
         g_top += rdx + carry
rax = mem64[g +32]
(int128) rdx rax = rax * s
carry? g_carry += rax
         g_top += rdx + carry
t0 = g_carry	       
carry? g_carry = (g_top g_carry) >> 60
       g_carry += 0 + carry
t0 <<= 4
(int64) t0 >>= 4
mem64[g +24] = t0       

mem64[f +32] = f_carry
mem64[g +32] = g_carry

caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r13 = stack_r13
#caller_r14 = stack_r14
#caller_r15 = stack_r15
#caller_rbx = stack_rbx
#caller_rbp = stack_rbp

return 
