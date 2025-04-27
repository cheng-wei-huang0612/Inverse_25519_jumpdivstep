#!/usr/bin/python3
import sys
import re
from math import log,ceil,floor,sqrt

# (obuf[e+8] obuf[e]) = ibuf[a] * ibuf[b] + ibuf[c] * ibuf[d]
def s64xs64(ibuf,obuf,a,b,c,d,e) :
    print("rax = mem64[ %s + %d ]" % (ibuf,a))
    print("(int128) rdx rax = rax * mem64[ %s + %d ]" % (ibuf,b))
    print('''t0 = rax
t1 = rdx
''')
    print("rax = mem64[ %s + %d ]" % (ibuf,c))
    print("(int128) rdx rax = rax * mem64[ %s + %d ]" % (ibuf,d))
    print('''carry? t0 += rax
t1 += rdx + carry
''')
    print("mem64[ %s + %d ] = t0" % (obuf,e))
    print("mem64[ %s + %d ] = t1" % (obuf,e+8))
    print("")

# [(ob[c+ 8] ob[c+ 0]) (ob[c+24] ob[c+16]) ] = [ib[a+ 0]
# [(ob[c+40] ob[c+32]) (ob[c+56] ob[c+48]) ]   [ib[a+16]
def s64xs64_2x2 (ib,ob,a,b,c) :
    s64xs64(ib,ob,a+ 0,b+ 0,a+ 8,b+16,c+ 0)
    s64xs64(ib,ob,a+ 0,b+ 8,a+ 8,b+24,c+16)
    s64xs64(ib,ob,a+16,b+ 0,a+24,b+16,c+32)
    s64xs64(ib,ob,a+16,b+ 8,a+24,b+24,c+48)


def s128xs128 (ib,t,a,b) :
    # (t3,t2,t1,t0) = (ib[a+8],ib[a]) * (ib[b+8],ib[b])
    # unsigned mul ib[a] * ib[b]
    print("rax = mem64[ %s + %d ]" % (ib,a))
    print("(uint128) rdx rax = rax * mem64[ %s + %d ]" % (ib,b))
    print('''%s0 = rax
%s1 = rdx''' % (t,t))
    # signed mul ib[a+8] * ib[b+8]
    print("rax = mem64[ %s + %d ]" % (ib,a+8))
    print("(int128) rdx rax = rax * mem64[ %s + %d ]" % (ib,b+8))
    print('''%s2 = rax
%s3 = rdx''' % (t,t))
    # signed to unsigned mul, ib[a+8] * ib[b]
    print("rax = mem64[ %s + %d ]" % (ib,a+8))
    print("ss  = mem64[ %s + %d ]" % (ib,b))
    print('''flag= rax
(int64) flag >>= 63

(uint128) rdx rax = rax * ss
       ss &= flag
carry? %s1 += rax
carry? %s2 += rdx + carry
       %s3 += 0 + carry
carry? %s2 -= ss
       %s3 -= 0 - carry
''' % (t,t,t,t,t))
    # unsigned to signed mul, ib[a] * ib[b+8]
    print("rax = mem64[ %s + %d ]" % (ib,b+8))
    print("ss  = mem64[ %s + %d ]" % (ib,a))
    print('''flag = rax
(int64) flag >>= 63

(uint128) rdx rax = rax * ss
       ss &= flag
carry? %s1 += rax
carry? %s2 += rdx + carry
       %s3 += 0 + carry
carry? %s2 -= ss
       %s3 -= 0 - carry
''' % (t,t,t,t,t))
    

def s256_sum_store(ob,stack_ob,e,a,t) :
    print('''carry? %s0 += %s0
carry? %s1 += %s1 + carry
carry? %s2 += %s2 + carry
       %s3 += %s3 + carry
''' % (a,t,a,t,a,t,a,t)) 
    print('''
         %s1 = %s3
(int64) %s1 >>= 63
%s0 = -19
%s0 &= %s1
%s3 = 9223372036854775807
%s3 &= %s1

carry? %s0 += %s0
carry? %s1 += %s1 + carry
carry? %s2 += %s1 + carry
       %s3 += %s3 + carry
    ''' % (t,a,t,t,t,t,t,t,t,a,t,a,t,a,t,a,t))
    print('''#%s = %s
mem64[ %s + %d ] = %s0
mem64[ %s + %d ] = %s1
mem64[ %s + %d ] = %s2
mem64[ %s + %d ] = %s3
''' % (ob,stack_ob,ob,e,a,ob,e+8,a,ob,e+16,a,ob,e+24,a))

    
    
def s128xs128_2x2 (ib,ob,stack_ob,a,b,e,s,t) :
    # u
    s128xs128 (ib,s,a,b)
    s128xs128 (ib,t,a+16,b+32)
    s256_sum_store(ob,stack_ob,e+0,s,t)
    # v
    s128xs128 (ib,s,a,b+16)
    s128xs128 (ib,t,a+16,b+48)
    s256_sum_store(ob,stack_ob,e+32,s,t)
    # r
    s128xs128 (ib,s,a+32,b)
    s128xs128 (ib,t,a+48,b+32)
    s256_sum_store(ob,stack_ob,e+64,s,t)
    # s
    s128xs128 (ib,s,a+32,b+16)
    s128xs128 (ib,t,a+48,b+48)
    s256_sum_store(ob,stack_ob,e+96,s,t)
    
    

print('''
int64 uvrs
int64 buf
#int64 r1
#int64 s1
#int64 u1
#int64 v1
#int64 r2
#int64 s2
#int64 u2
#int64 v2
int64 t0
int64 t1
int64 t2
int64 t3
int64 a0
int64 a1
int64 a2
int64 a3
int64 ss
int64 flag
int64 rax
int64 rdx
int64 i

stack64 stack_r11 
stack64 stack_r12 
stack64 stack_r13 
stack64 stack_r14 
stack64 stack_r15 
stack64 stack_rbx 
stack64 stack_rbp 

stack64 stack_buf
stack64 stack_uvrs

enter fold_12_60


uvrs = input_0
stack_uvrs = uvrs
buf = input_1
stack_buf = buf

stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r13 = caller_r13
stack_r14 = caller_r14
stack_r15 = caller_r15
stack_rbx = caller_rbx
stack_rbp = caller_rbp
''')

print("i = 6")
print("fold_12_s60:")
#for i in range(6) :
#    s64xs64_2x2("uvrs","buf",64*i+32,64*i,64*i)
s64xs64_2x2("uvrs","buf",32,0,0)
print('''uvrs+=64
buf+=64
signed>? i -= 1
goto fold_12_s60 if signed>
i=3
uvrs -= 384
buf -= 384
''')
print("fold_6_s120:")    
#for i in range(3) :    
#    s128xs128_2x2("buf","uvrs","stack_uvrs",128*i+64,128*i,128*i,"a","t")
s128xs128_2x2("buf","uvrs","stack_uvrs",64,0,0,"a","t")
print('''uvrs += 128
buf += 128
signed>? i -= 1
goto fold_6_s120 if signed>
    
caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r13 = stack_r13
caller_r14 = stack_r14
caller_r15 = stack_r15
caller_rbx = stack_rbx
caller_rbp = stack_rbp
return
''')
