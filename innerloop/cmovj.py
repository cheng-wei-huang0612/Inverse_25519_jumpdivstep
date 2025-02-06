#!/usr/bin/python3
import sys
import re
from math import log,ceil,floor,sqrt

def loadx4(s) :
    #print("%sx4 = 4x %s" % (s,s))
    print("%sx4 = stack%sx4" % (s,s))

def innerloop15 () :
    for i in range(15) :
        print('''# Rep #%d''' % (i))
        if (i % 3 == 2) :
            print("  z = 0")
        else:
            print("  z = stack_m1[1]")
        print('''  
  h = grs + fuv
#''')
        if False :
            print("  mnew = stack_m1[0]")
        else:
            print("  mnew = -1")
        print('''  oldg = grs
              =? grs & 1

  h = grs if  =
  z = m   if !=
  mnew ^= m
  grs -= fuv

  (int64) h >>= 1
  (int64) grs >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  grs = h    if !signed<
  m = mnew   if  signed<
#  (int64) grs >>= 1
''')
    
def next_fvgs(i,s) :
    print('''
FVGS%d = stack_FVGS%d 
GSFV%d = FVGS%d[1,0]
4x ta = int32 uuss1 * int32 FVGS%d
4x tb = int32 vvrr1 * int32 GSFV%d
4x out%dplus = ta + tb
4x ta = int32 uuss0 * int32 FVGS%d
4x tb = int32 vvrr0 * int32 GSFV%d
4x out%d = ta + tb
4x out%d += out%dplus
4x out%d += %s
''' % (i,i,i,i,i-1,i-1,i,i,i,i,i,i,i,s))

def carry_01(i,s) :
    print('''
4x d%d = int32 out%d * int32 _inv19_2p30x4
d%d &= _2p30m1x4
#4x %s = d%d << 15
4x d%dx19 = int32 d%d * int32 _19x4
4x out%d -= d%dx19
''' % (i,i,i,s,i,i,i,i,i))

def m2p33_srl30_p2p33(a,b) :
    print('''
4x %s = %s + _2p63m2p33x4 
4x %s unsigned>>= 30
''' % (b,a,b))

def m2p33_srl30_p2p33_mask30(a,b) :
    m2p33_srl30_p2p33(a,b)
    print("%s &= _2p30m1x4" % a)

def mask30_store(i) :
    print("out%d &= _2p30m1x4" % i)
    print("stack_FVGS%d = out%d" % (i-2,i))

print('''# Generated by cmovg.py
int64 m
int64 f
int64 g
int64 u
int64 v
int64 r
int64 s
int64 uvrs
int64 fuv
int64 grs
int64 mnew
int64 z
int64 loop
int64 _m2p15
int64 _2p16
int64 _2p31
int64 _m2p32
int64 _m2p48
int64 _2p16a2p32
int64 rax
int64 rdx
int64 t0
int64 t1
int64 t2
int64 h
int64 oldg
int64 i
int64 f0
int64 g0

int64 rtimesoldv
int64 stimesolds

stack64 stack_r11
stack64 stack_r12
stack64 stack_r13
stack64 stack_r14
stack64 stack_r15
stack64 stack_rbx
stack64 stack_rbp

stack64 stack_out

stack256 stack_m1
#stack64 stack_f   #inplace stack_fxgx[0] = f
#stack64 stack_g   #inplace stack_fxgx[2] = g
#stack64 stack_u   #inplace stack_uuss[0] = u
#stack64 stack_v   #inplace stack_vvrr[0] = v
#stack64 stack_r   #inplace stack_vvrr[2] = r
#stack64 stack_s   #inplace stack_uuss[2] = s
stack64 stack_m
stack64 stack_2p16a2p32
stack64 stack_m2p15
stack64 stack_2p16
stack64 stack_2p31
stack64 stack_m2p32
stack64 stack_m2p48

stack256 stack_fxgx
stack256 stack_uuss
stack256 stack_vvrr
stack256 stack_fygy

reg256 carryy
reg256 carryz
reg256 d0
reg256 d1
reg256 d0x19
reg256 d1x19
reg256 out0
''')
for i in range(9) :
    print("reg256 FVGS%d\nreg256 GSFV%d" % (i,i))
    print("reg256 out%d\nreg256 out%dplus" % (i+1,i+1))
    print("stack256 stack_FVGS%d" % (i))
print('''
reg256 out8plus2
reg256 out10
reg256 ta
reg256 tb
reg256 uuss
reg256 uuss0
reg256 uuss1
reg256 vvrr
reg256 vvrr0
reg256 vvrr1
''')

constants = ["_19","_0_19","_32767","_inv19_2p30","_2p30m1","_2p33","_2p48","_2p63","_2p63m2p33"]
for i in range(len(constants)) : print("reg256 %sx4" % (constants[i]))
for i in range(len(constants)) : print("stack256 stack%sx4" % (constants[i]))

print('''enter inverse_255
# input_0 = input
# input_1 = output
# input_2 = table of constants

d0 = 0
stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r13 = caller_r13
stack_r14 = caller_r14
stack_r15 = caller_r15
stack_rbx = caller_rbx
stack_rbp = caller_rbp

stack_out = input_1
# load and set up input (radix 2^64) in radix 2^30
''')
for i in range(4) :
    print("int64 a%d" % (i))
    print("a%d = mem64[input_0 + %2d]" % (i,8*i))
print('''
t0 = -1152921504606846976
g = a0 & ~ t0
g0 = a1
g0 = (g0.a0) << 4
g0 = g0 & ~ t0
''')
for i in range(8) :
    print("stack_FVGS%d = d0" % (i))
    limb_bot = (30*i) // 64
    limb_pos = (30*i) % 64
    limb_top = (30*i+29) // 64
    if (limb_bot == limb_top) :
        print("t0 = a%d" % (limb_bot))
        if (limb_pos > 0) :
            print("(uint64) t0 >>= %d" % (limb_pos))
        print("t0 &= 1073741823")
        print("inplace stack_FVGS%d[2] = t0" % (i))
    else:
        print("a%d = (a%d a%d) >> %d" % (limb_bot,limb_top,limb_bot,limb_pos))
        print("a%d &= 1073741823" % (limb_bot))
        print("inplace stack_FVGS%d[2] = a%d" % (i,limb_bot))
print("stack_FVGS8 = d0")
limb_pos = (30*8) % 64
print("(uint64) a3 >>= %d" % (limb_pos))
print("inplace stack_FVGS8[2] = a3")

print('''
f = -19
inplace stack_FVGS0[0] = f
t1 = 32768
inplace stack_FVGS8[0] = t1
t0 = 1
inplace stack_FVGS0[3] = t0

                 m = -1
new stack_m1
inplace stack_m1[0] = m
                  z = 0
                 f0 = z
inplace stack_m1[1] = z

           _m2p15 = -32768
      stack_m2p15 = _m2p15
            _2p16 = 65536
       stack_2p16 = _2p16
            _2p31 = 2147483648
       stack_2p31 = _2p31     
           _m2p32 = -4294967296
      stack_m2p32 = _m2p32
           _m2p48 = -281474976710656
      stack_m2p48 = _m2p48
       _2p16a2p32 = 4295032832
  stack_2p16a2p32 = _2p16a2p32
''')
    
for i in range(len(constants)) :
    print("%sx4 = mem256[ input_2 + %3d ]" % (constants[i],32*i))
    if (constants[i] != "_2p63m2p33") :
        print("stack%sx4 = %sx4" % (constants[i],constants[i]))

print('''# test idle loop
i = 12
u = 1152921504606846976
v = 0
s = u
r = 0
''')

#print('''#i = 12
#i = 11
#
#first_bigloop:
## entering condition: f and g are 60-bit signed ints
#
#  loop = 4
#
#first_loop15:
#
#  fuv = f & ~ _m2p15
#  grs = g & ~ _m2p15
#  fuv |= stack_m2p32
#  grs |= stack_m2p48
#''')
#
#innerloop15()
print('''
#  =? loop -= 1		
#goto first_lastloop if =
#
## extract u,v,r,s
#first_extract:
#
#  _2p16a2p32 = stack_2p16a2p32
#  s = grs + _2p16a2p32
#  (int64) s >>= 33
#
#  t2 = g
#  g *= s  
#  # g = gs
#
#  v = fuv + _2p16a2p32
#  (int64) v >>= 33
#  t2 *= v
#  # t2 = gv
#
#  _2p16 = stack_2p16
#  grs += _2p16
#  (int64) grs >>= 17
#  r = (int16) grs
#
#      rax = f
#      rax *= r
#      # rax = fr
#
#  fuv += _2p16
#  (int64) fuv >>= 17
#  u = (int16) fuv
#
#       f *= u
#       f += t2
#       g += rax
# 
#       (int64) f >>= 15
#       (int64) g >>= 15
#
#  =? loop - 3  
#  goto first_first_loop if =
#
#  t0 = stack_uuss[0]
#  t0 *= u
#  t1 = stack_vvrr[2]
#  t1 *= v
#
#  rtimesoldv = stack_vvrr[0]
#  u *= rtimesoldv
#  stimesolds = stack_uuss[2]
#  v *= stimesolds
#  rtimesoldv *= r
#  stimesolds *= s
#  r *= stack_uuss[0]
#  s *= stack_vvrr[2]
#
#  v += u
#  u = t0 + t1
#
#  r += s
#  s = rtimesoldv + stimesolds
#
#first_first_loop:
#
#  inplace stack_vvrr[0] = v
#  inplace stack_uuss[0] = u
#  inplace stack_uuss[2] = s
#  inplace stack_vvrr[2] = r
#
#goto first_loop15 
#
#first_lastloop:
#
#  _2p16a2p32 = stack_2p16a2p32
#  s = grs + _2p16a2p32
#  (int64) s >>= 33
#
#  v = fuv + _2p16a2p32
#  (int64) v >>= 33
#
#  t1 = stack_vvrr[2]
#  t1 *= v
#  stimesolds = stack_uuss[2]
#  v *= stimesolds
#  stimesolds *= s
#
#  _2p16 = stack_2p16
#  grs += _2p16
#  (int64) grs >>= 17
#  r = (int16) grs
#
#  fuv += _2p16
#  (int64) fuv >>= 17
#  u = (int16) fuv
#
#
#
#  t0 = stack_uuss[0]
#  t0 *= u
#  rtimesoldv = stack_vvrr[0]
#  u *= rtimesoldv
#  rtimesoldv *= r
#
#  s *= stack_vvrr[2]
#  r *= stack_uuss[0]
#
#  v += u
#  u = t0 + t1
#  r += s
#  s = rtimesoldv + stimesolds
#
bigloop:

# transition portion

## want to compute next f,g very quickly
#t0 = stack_FVGS0[2]
#t1 = stack_FVGS1[2]
#t1 <<= 30
#g = t0 + t1
#t0 = stack_FVGS0[0]
#t1 = stack_FVGS1[0]
#t1 <<= 30
#f = t0 + t1

      rax = g
      (int128) rdx rax = rax * s
      t2 = rax
      t1 = rdx

      rax = f
      (int128) rdx rax = rax * r
      carry? t2 += rax
             t1 += rdx + carry
      t2 = (t1 t2) >> 60	 

#t0 = stack_FVGS2[2]
#t1 = stack_FVGS3[2]
#t1 <<= 30
#g0 = t0 + t1
#t0 = stack_FVGS2[0]
#t1 = stack_FVGS3[0]
#t1 <<= 30
#f0 = t0 + t1

      rax = f
      (int128) rdx rax = rax * u
      f = rax
      t0 = rdx
      rax = g
      (int128) rdx rax = rax * v
      carry? f += rax
             t0 += rdx + carry
      f = (t0 f) >> 60
      g = t2

      t2 = g0
      g0 *= s  
      t2 *= v
      # t2 = gv

      rax = f0
      rax *= r
      # rax = f0 r
      f0 *= u
      f0 += t2
      g0 += rax

f+=f0
g+=g0       

# at this point new f and g are computed.

FVGS0 = stack_FVGS0

new uuss
new vvrr
uuss = u,uuss[1],0,0
vvrr = v,vvrr[1],0,0
uuss = uuss[0],s,0,0
vvrr = vvrr[0],r,0,0

GSFV0 = FVGS0[1,0]

uuss = uuss[0,0,1,1]
vvrr = vvrr[0,0,1,1]

''')
loadx4("_2p30m1")
print('''
uuss0 = uuss & _2p30m1x4
vvrr0 = vvrr & _2p30m1x4
4x ta = int32 uuss0 * int32 FVGS0

4x tb = int32 vvrr0 * int32 GSFV0
4x out0 = ta + tb
''')
loadx4("_inv19_2p30")
loadx4("_19")
carry_01(0,"out8plus2")
#loadx4("_2p63")
print('''
4x carryy = out0 + stack_2p63x4
4x carryy unsigned>>= 30

4x out8plus2 = d0 << 15

FVGS1 = stack_FVGS1
GSFV1 = FVGS1[1,0]

4x ta = int32 uuss0 * int32 FVGS1
4x tb = int32 vvrr0 * int32 GSFV1
4x out1plus = ta + tb

4x uuss1 = uuss unsigned>> 30
4x vvrr1 = vvrr unsigned>> 30

4x ta = int32 uuss1 * int32 FVGS0
4x tb = int32 vvrr1 * int32 GSFV0
4x out1 = ta + tb
4x out1 += out1plus
4x out1 += carryy
''')
#next_fvgs(1)
carry_01(1,"out9")
#loadx4("_2p63m2p33")
m2p33_srl30_p2p33("out1","carryy")
print("4x out9 = d1 << 15")

next_fvgs(2,"carryy")
#m2p33_srl30_p2p33_mask30("out2","carryy")
m2p33_srl30_p2p33("out2","carryy")

next_fvgs(3,"carryy")
print("out2 &= _2p30m1x4")
m2p33_srl30_p2p33_mask30("out3","carryy")
print("stack_FVGS1 = out3")

print('''# store-ahead for f0 and g0
4x ta = out3 << 30
4x ta += out2
stack_fxgx = ta
''')

next_fvgs(4,"carryy")
#m2p33_srl30_p2p33_mask30("out4","carryy")
m2p33_srl30_p2p33("out4","carryy")

next_fvgs(5,"carryy")
#m2p33_srl30_p2p33_mask30("out5","carryy")
m2p33_srl30_p2p33_mask30("out5","carryy")
mask30_store(4)

print('''# store-ahead for f1 and g1
4x ta = out5 << 30
4x ta += out4
stack_fygy = ta
''')

next_fvgs(6,"carryy")
#m2p33_srl30_p2p33_mask30("out6","carryy")
m2p33_srl30_p2p33("out6","carryz")
print("stack_FVGS3 = out5")

next_fvgs(7,"carryz")
#m2p33_srl30_p2p33_mask30("out7","carryy")
m2p33_srl30_p2p33("out7","carryz")
mask30_store(6)

next_fvgs(8,"carryz")
print("4x out8 += out8plus2")
m2p33_srl30_p2p33("out8","carryz")
mask30_store(7)

print('''
4x ta = int32 uuss1 * int32 FVGS8
4x tb = int32 vvrr1 * int32 GSFV8
4x out9plus = ta + tb
4x out9 += out9plus
4x out9 += carryz
''')
m2p33_srl30_p2p33("out9","out10")

mask30_store(8)

loadx4("_32767")
loadx4("_2p48")
print('''
4x carryy = out10 + _2p63m2p33x4
4x carryy unsigned>>= 15
4x carryy -= _2p48x4
4x out10 -= stack_2p33x4

out9 &= _2p30m1x4

out10 &= _32767x4
4x carryy = int32 carryy * int32 stack_0_19x4

4x out2 += carryy
stack_FVGS7 = out9
stack_FVGS8 = out10
stack_FVGS0 = out2

#m = stack_m	     
#_m2p15 = stack_m2p15	

#f = stack_fxgx[0]
#g = stack_fxgx[2] 
''')

print('''
# entering condition: f and g are 60-bit signed ints

loop15_init:

  fuv = f & ~ _m2p15
  grs = g & ~ _m2p15
  fuv |= stack_m2p32
  grs |= stack_m2p48
''')
innerloop15()
print('''
# extract u,v,r,s
extract_init:

  _2p16a2p32 = stack_2p16a2p32
  s = grs + _2p16a2p32
  (int64) s >>= 33

  t2 = g
  g *= s  
  # g = gs

  v = fuv + _2p16a2p32
  (int64) v >>= 33
  t2 *= v
  # t2 = gv

  _2p16 = stack_2p16
  grs += _2p16
  (int64) grs >>= 17
  r = (int16) grs

      rax = f
      rax *= r
      # rax = fr

  fuv += _2p16
  (int64) fuv >>= 17
  u = (int16) fuv

       f *= u
       f += t2
       g += rax
 
       (int64) f >>= 15
       (int64) g >>= 15

  inplace stack_vvrr[0] = v
  inplace stack_uuss[0] = u
  inplace stack_uuss[2] = s
  inplace stack_vvrr[2] = r

''')


print('''#  loop = 4
  loop = 3

loop15:

  fuv = f & ~ _m2p15
  grs = g & ~ _m2p15
  fuv |= stack_m2p32
  grs |= stack_m2p48
''')

innerloop15()
print('''
  =? loop -= 1		
goto lastloop if =

# extract u,v,r,s
extract:

  _2p16a2p32 = stack_2p16a2p32
  s = grs + _2p16a2p32
  (int64) s >>= 33

  t2 = g
  g *= s  
  # g = gs

  v = fuv + _2p16a2p32
  (int64) v >>= 33
  t2 *= v
  # t2 = gv

  _2p16 = stack_2p16
  grs += _2p16
  (int64) grs >>= 17
  r = (int16) grs

      rax = f
      rax *= r
      # rax = fr

  fuv += _2p16
  (int64) fuv >>= 17
  u = (int16) fuv

       f *= u
       f += t2
       g += rax
 
       (int64) f >>= 15
       (int64) g >>= 15

# first loop15 iteration has been removed
#  =? loop - 3  
#  goto first_loop if =

  t0 = stack_uuss[0]
  t0 *= u
  t1 = stack_vvrr[2]
  t1 *= v

  rtimesoldv = stack_vvrr[0]
  u *= rtimesoldv
  stimesolds = stack_uuss[2]
  v *= stimesolds
  rtimesoldv *= r
  stimesolds *= s
  r *= stack_uuss[0]
  s *= stack_vvrr[2]

  v += u
  u = t0 + t1

  r += s
  s = rtimesoldv + stimesolds

first_loop:

  inplace stack_vvrr[0] = v
  inplace stack_uuss[0] = u
  inplace stack_uuss[2] = s
  inplace stack_vvrr[2] = r

goto loop15 

lastloop:

  _2p16a2p32 = stack_2p16a2p32
  s = grs + _2p16a2p32
  (int64) s >>= 33

  v = fuv + _2p16a2p32
  (int64) v >>= 33

  t1 = stack_vvrr[2]
  t1 *= v
  stimesolds = stack_uuss[2]
  v *= stimesolds
  stimesolds *= s

  _2p16 = stack_2p16
  grs += _2p16
  (int64) grs >>= 17
  r = (int16) grs

  fuv += _2p16
  (int64) fuv >>= 17
  u = (int16) fuv



  t0 = stack_uuss[0]
  t0 *= u
  rtimesoldv = stack_vvrr[0]
  u *= rtimesoldv
  rtimesoldv *= r

  s *= stack_vvrr[2]
  r *= stack_uuss[0]

  v += u
  u = t0 + t1
  r += s
  s = rtimesoldv + stimesolds

  f = stack_fxgx[0]
  g = stack_fxgx[2]
  f0 = stack_fygy[0]
  g0 = stack_fygy[2]

=? i -= 1
goto bigloop if !=
''')

print('''
FVGS0 = stack_FVGS0


new uuss
new vvrr
uuss = u,uuss[1],0,0
vvrr = v,vvrr[1],0,0
uuss = uuss[0],s,0,0
vvrr = vvrr[0],r,0,0

GSFV0 = FVGS0[1,0]

uuss = uuss[0,0,1,1]
vvrr = vvrr[0,0,1,1]

''')
loadx4("_2p30m1")
print('''
uuss0 = uuss & _2p30m1x4
vvrr0 = vvrr & _2p30m1x4
4x ta = int32 uuss0 * int32 FVGS0

4x tb = int32 vvrr0 * int32 GSFV0
4x out0 = ta + tb
''')
loadx4("_inv19_2p30")
loadx4("_19")
carry_01(0,"out8plus2")
#loadx4("_2p63")
print('''
4x carryy = out0 + stack_2p63x4
4x carryy unsigned>>= 30

4x out8plus2 = d0 << 15

FVGS1 = stack_FVGS1
GSFV1 = FVGS1[1,0]

4x ta = int32 uuss0 * int32 FVGS1
4x tb = int32 vvrr0 * int32 GSFV1
4x out1plus = ta + tb

4x uuss1 = uuss unsigned>> 30
4x vvrr1 = vvrr unsigned>> 30

4x ta = int32 uuss1 * int32 FVGS0
4x tb = int32 vvrr1 * int32 GSFV0
4x out1 = ta + tb
4x out1 += out1plus
4x out1 += carryy
''')
#next_fvgs(1)
carry_01(1,"out9")
#loadx4("_2p63m2p33")
m2p33_srl30_p2p33("out1","carryy")
print("4x out9 = d1 << 15")

next_fvgs(2,"carryy")
#m2p33_srl30_p2p33_mask30("out2","carryy")
m2p33_srl30_p2p33("out2","carryy")

next_fvgs(3,"carryy")
print("out2 &= _2p30m1x4")
m2p33_srl30_p2p33_mask30("out3","carryy")
print("stack_FVGS1 = out3")

print('''# store-ahead for f0 and g0
4x ta = out3 << 30
4x ta += out2
stack_fxgx = ta
''')

next_fvgs(4,"carryy")
#m2p33_srl30_p2p33_mask30("out4","carryy")
m2p33_srl30_p2p33("out4","carryy")

next_fvgs(5,"carryy")
#m2p33_srl30_p2p33_mask30("out5","carryy")
m2p33_srl30_p2p33_mask30("out5","carryy")
mask30_store(4)

print('''# store-ahead for f1 and g1
4x ta = out5 << 30
4x ta += out4
stack_fygy = ta
''')

next_fvgs(6,"carryy")
#m2p33_srl30_p2p33_mask30("out6","carryy")
m2p33_srl30_p2p33("out6","carryz")
print("stack_FVGS3 = out5")

next_fvgs(7,"carryz")
#m2p33_srl30_p2p33_mask30("out7","carryy")
m2p33_srl30_p2p33("out7","carryz")
mask30_store(6)

next_fvgs(8,"carryz")
print("4x out8 += out8plus2")
m2p33_srl30_p2p33("out8","carryz")
mask30_store(7)

print('''
4x ta = int32 uuss1 * int32 FVGS8
4x tb = int32 vvrr1 * int32 GSFV8
4x out9plus = ta + tb
4x out9 += out9plus
4x out9 += carryz
''')
m2p33_srl30_p2p33("out9","out10")

mask30_store(8)

loadx4("_32767")
loadx4("_2p48")
print('''
4x carryy = out10 + _2p63m2p33x4
4x carryy unsigned>>= 15
4x carryy -= _2p48x4
4x out10 -= stack_2p33x4

out9 &= _2p30m1x4

out10 &= _32767x4
4x carryy = int32 carryy * int32 stack_0_19x4

4x out2 += carryy
stack_FVGS7 = out9
stack_FVGS8 = out10
stack_FVGS0 = out2
''')




for i in range(4,9) :
    print("int64 a%d" % (i))
for i in range(9) :
    print("a%d = stack_FVGS%d[1]" %(i,i))
print('''
z = 0
t0 = 19
t1 = 32768
carry? a8 - 16384
t1 = z if carry
t0 = z if carry
a8 -= t1
a0 += t0
''')
print('''
t2 = stack_out
rax = stack_FVGS0[0]
rax <<= 34
signed<? (int64) rax >>= 34
''')
for i in range(9) :
    print("a%d *= rax" % (i))
    if (i > 0) : print("a%d += h" % (i))
    if (i < 8) : print("h = a%d\n(int64) h >>= 30\na%d &= 1073741823" % (i,i))
print('''    
a1 <<= 30
a0 += a1
a1 = a2
(uint64) a1 >>= 4
a2 <<= 60
a0 += a2
a3 <<= 26
a1 += a3
a2 = a4
(uint64) a2 >>= 8
a4 <<= 56
a1 += a4
a5 <<= 22 
a2 += a5
a3 = a6
(uint64) a3 >>= 12
a6 <<= 52
a2 += a6
a7 <<= 18
a3 += a7
a8 <<= 48
a3 += a8

a4 = -19
a5 = -1
a6 = 9223372036854775807
carry? a3 - 0
a4 = z if !carry
a5 = z if !carry
a6 = z if !carry
carry? a0 += a4
carry? a1 += a5 + carry
carry? a2 += a5 + carry
       a3 += a6 + carry
''')
for i in range(4) :
    print("mem64[t2 + %2d] = a%d" % (8*i,i))
print('''
caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r13 = stack_r13
caller_r14 = stack_r14
caller_r15 = stack_r15
caller_rbx = stack_rbx
caller_rbp = stack_rbp

return
''')



