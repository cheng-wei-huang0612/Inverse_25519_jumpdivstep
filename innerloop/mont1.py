#!/usr/bin/python3
import sys
import re
from math import log,ceil,floor,sqrt

def loadx4(s) :
    #print("%sx4 = 4x %s" % (s,s))
    print("%sx4 = stack%sx4" % (s,s))


#ni = 15 # the number of iterations per small loop
#loc_ur = 32
#loc_vs = 48
ni = 20 # the number of iterations per small loop
loc_ur = 41
loc_vs = 62
msk_fg = "_m2p%d" % (ni)
init_u = "_m2p%d" % (loc_ur)
init_s = "_m2p%d" % (loc_vs)
adj_ur = "_2p%d" % (loc_ur-ni-1)
adj_vs = "_2p%da2p%d" % (loc_ur-ni-1,loc_vs-ni-1)


const64s = { msk_fg : - 2**ni,
             adj_ur : 2**(loc_ur-ni-1),
             #"_2p31":2147483648,
             init_u : -2**(loc_ur),
             init_s : -2**(loc_vs),
             adj_vs : 2**(loc_vs-ni-1) + 2**(loc_ur-ni-1)
}

def innerloops (ni) :
    for i in range(ni) :
        print('''# Rep #%d
  z = -1
  oldg = grs
  h = grs + fuv
              =? grs & 1

  z = m   if !=
  h = grs if  =
  mnew = m + 1
  grs -= fuv

  (int64) grs >>= 1
  (int64) h >>= 1
  m = -m
                 signed<? z - 0

  fuv = oldg if !signed<
  grs = h    if  signed<
  m = mnew   if  signed<
#  (int64) grs >>= 1
''' % (i))

        
def extract() :
    print("  %s = stack%s" % (adj_vs,adj_vs))
    print("  s = grs + %s" % (adj_vs))
    print("  (int64) s >>= %d" % (loc_vs - ni))
    print('''
  t2 = g
  g *= s  
  # g = gs
''')
    print("  v = fuv + %s" % (adj_vs))
    print("  (int64) v >>= %d" % (loc_vs - ni))
    print('''
  t2 *= v
  # t2 = gv
''')
    print("  %s = stack%s" % (adj_ur,adj_ur))
    print("  r = grs + %s" % (adj_ur))
    print("  r <<= %d" % (63-loc_ur))
    print("  (int64) r >>= %d" % (63 - ni))
    print('''
      rax = f
      rax *= r
      # rax = fr
''')
    print("  u = fuv + %s" % (adj_ur))
    print("  u <<= %d" % (63-loc_ur))
    print("  (int64) u >>= %d" % (63 - ni))
    print('''
       f *= u
       f += t2
       g += rax
''')
    print("  (int64) f >>= %d\n  (int64) g >>= %d" % (ni,ni))

def store_uvrs() :
    print('''
  inplace stack_vvrr[0] = v
  inplace stack_uuss[0] = u
  inplace stack_uuss[2] = s
  inplace stack_vvrr[2] = r
''')

def next_fvgs_1(i) :
    print("");
    print("FVGS%d = stack_FVGS%d" % (i, i))
    print("GSFV%d = FVGS%d[1,0]" % (i,i))
    print("mod%d = stack_mod%d" % (i, i))
    print("4x ta = int32 uuss1 * int32 FVGS%d" % (i-1))
    print("4x tb = int32 vvrr1 * int32 GSFV%d" % (i-1))
    print("4x out%dplus = ta + tb" % (i))
    print("4x ta = int32 uuss0 * int32 FVGS%d" % (i))
    print("4x tb = int32 vvrr0 * int32 GSFV%d" % (i))
    print("4x out%d = ta + tb" % (i))
    print("4x out%d += out%dplus" % (i,i)) 

def next_fvgs_2(i) :
    next_fvgs_1(i)
    print("4x ta = int32 d0 * int32 mod%d" % (i))
    print("4x tb = int32 d1 * int32 mod%d" % (i-1))
    print("4x out%dplus2 = ta + tb" % (i))
    print("4x out%dplus2 += carryy" % (i))
    print("4x out%d += out%dplus2" % (i,i))
    
def next_fvgs(i) :
    next_fvgs_2(i)
    m2p33_srl30_p2p33_mask30("out%d" % (i), "carryy")
    print("stack_FVGS%d = out%d" % (i-2, i))

def next_fvgs_final(i) :
    print("");
    print("FVGS%d = stack_FVGS%d" % (i, i))
    print("GSFV%d = FVGS%d[1,0]" % (i,i))
    print("4x ta = int32 uuss1 * int32 FVGS%d" % (i-1))
    print("4x out%d = ta + carryy" % (i))
    print("4x tb = int32 vvrr1 * int32 GSFV%d" % (i-1))
    print("4x out%d += tb" % (i))
    print("4x ta = int32 uuss0 * int32 FVGS%d" % (i))
    print("4x out%d += ta" % (i))
    print("4x tb = int32 vvrr0 * int32 GSFV%d" % (i))
    print("4x out%d += tb" % (i)) 
    print("mod%d = stack_mod%d" % (i, i))
    print("4x ta = int32 d2 * int32 mod%d" % (i-2))
    print("4x out%d += ta" % (i))
    print("4x tb = int32 d1 * int32 mod%d" % (i-1))
    print("4x out%d += tb" % (i))
    print("4x ta = int32 d0 * int32 mod%d" % (i))
    print("4x out%d += ta" % (i))
    loadx4("_2p30m1")
    loadx4("_2p63m2p33")
    m2p33_srl30_p2p33_mask30("out%d" % (i), "carryy")
    print("stack_FVGS%d = out%d" % (i-3, i))    
    
def carry_01(i) :    
    #print("carry%d:" % (i))
    print("4x d%d = int32 minvx4 * int32 out%d" % (i,i))
    print("d%d &= _2p30m1x4" % (i))
    print("4x ta = int32 mod0 * int32 d%d" % (i))
    print("4x out%d += ta" % (i))
    
nbits = 256
nlimbs = (nbits+30-1)//30    
nqwords = (nbits+64-1)//64

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

print('''# Generated by cmov-mont0.py
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
int64 rax
int64 rdx
int64 t0
int64 t1
int64 t2
int64 h
int64 oldg
int64 i
int64 j
int64 f0
int64 g0
int64 minv
stack64 stack_minv

int64 rtimesoldv
int64 stimesolds

stack64 stack_out

stack256 stack_m1
#inplace stack_fxgx[0] = f
#inplace stack_fxgx[2] = g
#inplace stack_uuss[0] = u
#inplace stack_vvrr[0] = v
#inplace stack_vvrr[2] = r
#inplace stack_uuss[2] = s
stack64 stack_m

stack256 stack_fxgx
stack256 stack_uuss
stack256 stack_vvrr
stack256 stack_fygy

stack64 stack_fuv
stack64 stack_f

reg256 carryy
reg256 minvx4
reg256 d0
reg256 d1
reg256 d2
reg256 out0
''')
for i in range(nlimbs) :
    print("int64 a%d" % (i))
    print("reg256 mod%d\nstack256 stack_mod%d" % (i,i))
    print("reg256 FVGS%d\nreg256 GSFV%d\nstack256 stack_FVGS%d" % (i,i,i))
    print("reg256 out%d\nreg256 out%dplus" % (i+1,i+1))
    if (i < nlimbs-2) : print("reg256 out%dplus2" % (i+2))

print('''
reg256 out%d
reg256 out%dplus
reg256 out%d
reg256 ta
reg256 tb
reg256 uuss
reg256 uuss0
reg256 uuss1
reg256 vvrr
reg256 vvrr0
reg256 vvrr1

''' % (nlimbs+1,nlimbs+1,nlimbs+2))



# declare constants table
for s in const64s.keys() : print("int64 %17s\nstack64 %15s" % (s,"stack"+s))

intab256 = ["_2p30m1","_2p33","_2p63","_2p63m2p33","_2p29"
]
for i in intab256 : print("reg256 %sx4" % (i))
for i in intab256 : print("stack256 stack%sx4" % (i))

print('''
enter inverse_%d
# input_0 = input
# input_1 = output
# input_2 = table of constants

new stack_m1
stack_out = input_1
''' % (nbits))

caller_saved = ["r11","r12","r13","r14","r15","rbx","rbp"]
for s in caller_saved :
    print("stack64 stack_%s\nstack_%s = caller_%s" % (s,s,s))

for i in range(nqwords) :
    print("a%d = mem64[input_0 + %2d]" % (i,8*i))
#
# carrying in cmovp deleted here.
print('''
t0 = -1152921504606846976
g = a0 & ~ t0''')
#
    
for i in range(nlimbs-1) :
    print("d1 = mem256[ input_2 + %3d ]"% (32*(len(intab256)+i)) )
    #print("d0 = 4x d1[0]")
    #print("stack_mod%d = d0" % (i))
    print("stack_FVGS%d = d1" % (i))
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
print("d1 = mem256[ input_2 + %d]" % (32*(len(intab256)+nlimbs-1)))
#print("d0 = 4x d1[0]")
#print("stack_mod%d = d0" % (nlimbs-1))
print("stack_FVGS%d = d1" % (nlimbs-1))
limb_pos = (30*(nlimbs-1)) % 64
print("(uint64) a%d >>= %d" % (nqwords-1,limb_pos))
print("inplace stack_FVGS%d[2] = a%d" %  (nlimbs-1,nqwords-1))
print("minv = mem64[ input_2 + %d]" % (32*(len(intab256)+nlimbs)))
print("stack_minv = minv")

for i in range(nlimbs) :
    #print("d1 = 4x mem64[ input_2 + %3d ]"% (32*(len(intab256)+i)) )
    print("d1 = 4x stack_FVGS%d[0]" % (i))
    print("stack_mod%d = d1" % (i))

    
print('''
f = stack_FVGS0[0]
f0 = stack_FVGS1[0]
f0 <<= 30
f += f0 

#                 m = -1
#                  z = 0
                  m = 0
                  z = -1
inplace stack_m1[0] = m
inplace stack_m1[1] = z
''')

for s in const64s.keys() :
    print("%19s = %d\n%19s = %s"%(s,const64s[s],"stack"+s,s))
print("")    
for i in range(len(intab256)) :
    print("%17sx4 = mem256[ input_2 + %3d ]" % (intab256[i],32*i))
    print("%17sx4 = %sx4" % ("stack"+intab256[i],intab256[i]))

print('''# idle loop
i = 10
u = 1152921504606846976
v = 0
s = u
r = 0
''')


print('''
bigloop:

# transition portion

      rax = g
      (int128) rdx rax = rax * s
      t2 = rax
      t1 = rdx

      rax = f
      (int128) rdx rax = rax * r
      carry? t2 += rax
             t1 += rdx + carry
      t2 = (t1 t2) >> 60	 

      rax = f
      (int128) rdx rax = rax * u
      f = rax
      t0 = rdx
      rax = g
      (int128) rdx rax = rax * v
      carry? f += rax
             t0 += rdx + carry
      f = (t0 f) >> 60

new vvrr
vvrr = v,vvrr[1],0,0
vvrr = vvrr[0],r,0,0

      v *= g0
      g0 *= s

      r *= f0
      f0 *= u
      f0 += v
      g0 += r

      f += f0
      g = t2+g0

# at this point new f and g are computed.

# startswap
FVGS0 = stack_FVGS0

new uuss
uuss = u,uuss[1],0,0
uuss = uuss[0],s,0,0

GSFV0 = FVGS0[1,0]

uuss = uuss[0,0,1,1]
vvrr = vvrr[0,0,1,1]

''')

loadx4("_2p30m1")
print('''
uuss0 = uuss & _2p30m1x4
vvrr0 = vvrr & _2p30m1x4 
''')
loadx4("_2p63")
print('''
uuss1 = uuss ^ _2p63x4
vvrr1 = vvrr ^ _2p63x4
4x uuss1 unsigned>>= 30
4x vvrr1 unsigned>>= 30
''')
loadx4("_2p33")
print('''
4x uuss1 -= _2p33x4
4x vvrr1 -= _2p33x4

4x ta = int32 uuss0 * int32 FVGS0
4x tb = int32 vvrr0 * int32 GSFV0
4x out0 = ta + tb

minvx4 = 4x stack_minv
mod0 = stack_mod0
''')
carry_01(0)
print('''
4x carryy = out0 +_2p63x4
4x carryy unsigned>>= 30
''')
next_fvgs_1(1)
print("4x ta = int32 d0 * int32 mod1\n4x ta += carryy\n4x out1 += ta")


carry_01(1)

loadx4("_2p63m2p33")
m2p33_srl30_p2p33("out1","carryy")

for i in range(2,nlimbs) :
    next_fvgs(i)

loadx4("_2p33")
print('''
4x ta = int32 uuss1 * int32 FVGS8
4x tb = int32 vvrr1 * int32 GSFV8
4x out%dplus = ta + tb
4x ta = int32 mod8 * int32 d1
4x out%d = ta + carryy
4x out%d += out%dplus
''' % ((nlimbs,) * 4))
print("4x out%d = out%d + _2p63m2p33x4" % (nlimbs+1,nlimbs))
print("4x out%d unsigned >>= 30\n4x out%d -= _2p33x4" % (nlimbs+1,nlimbs+1))
print("out%d &= _2p30m1x4" % (nlimbs))
print("stack_FVGS%d = out%d" % (nlimbs-2,nlimbs))
print("stack_FVGS%d = out%d" % (nlimbs-1,nlimbs+1))

print('''
# entering condition: f and g are 60-bit signed ints

loop%d_init:

  fuv = f & ~ %s
  grs = g & ~ %s
  #fuv = f
  #grs = g
  #fuv <<= %d
  #grs <<= %d
  #(int64) fuv >>= %d
  #(int64) grs >>= %d
  fuv += stack%s
  grs += stack%s
''' % (ni,msk_fg,msk_fg,
       64-ni,64-ni,64-ni,64-ni,
       init_u,init_s))

innerloops(ni)

print('''
# extract u,v,r,s; compute next f,g
extract_init:
''')

extract()
store_uvrs()

print('''#  loop = 4
  #loop = 3
  loop = 2
# endswap

loop%d:

  fuv = f & ~ %s
  grs = g & ~ %s
  #fuv = f
  #grs = g
  #fuv <<= %d
  #grs <<= %d
  #(int64) fuv >>= %d
  #(int64) grs >>= %d
  fuv += stack%s
  grs += stack%s
''' % (ni,msk_fg,msk_fg,
       64-ni,64-ni,64-ni,64-ni,
       init_u,init_s))

print("j = 2")
print("loop2:")
innerloops(ni//2)
print(" =? j -= 1")
print("goto loop2 if !=")
print('''
  =? loop -= 1		
goto lastloop if =

# extract u,v,r,s
extract:
''')

extract()

print('''
#first loops iteration has NOT been removed
#=? loop - 2  
#goto first_loop if =

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
''')
store_uvrs()
print('''
goto loop%d 

lastloop:
''' % (ni))

print("  %s = stack%s" % (adj_vs,adj_vs))
print("  s = grs + %s" % (adj_vs))
print("  (int64) s >>= %d" % (loc_vs - ni))
print("  v = fuv + %s" % (adj_vs))
print("  (int64) v >>= %d" % (loc_vs - ni))
print('''
  t1 = stack_vvrr[2]
  t1 *= v
  stimesolds = stack_uuss[2]
  v *= stimesolds
  stimesolds *= s
''')
print("  %s = stack%s" % (adj_ur,adj_ur))
print("  r = grs + %s" % (adj_ur))
print("  r <<= %d" % (63-loc_ur))
print("  (int64) r >>= %d" % (63 - ni))
print("  u = fuv + %s" % (adj_ur))
print("  u <<= %d" % (63-loc_ur))
print("  (int64) u >>= %d" % (63 - ni))
print('''
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

  #f = stack_fxgx[0]
  #g = stack_fxgx[2]
  #f0 = stack_fygy[0]
  #g0 = stack_fygy[2]

  t0 = stack_FVGS0[0]
  t1 = stack_FVGS1[0]
  t1 <<= 30
  f = t0 + t1
 
  t0 = stack_FVGS0[2]
  t1 = stack_FVGS1[2]
  t1 <<= 30
  g = t0 + t1

  t0 = stack_FVGS2[0]
  t1 = stack_FVGS3[0]
  t1 <<= 30
  f0 = t0 + t1
 
  t0 = stack_FVGS2[2]
  t1 = stack_FVGS3[2]
  t1 <<= 30
  g0 = t0 + t1

=? i -= 1
goto bigloop if !=

''')

print('''
last_transition:

fuv &= 2
t0 = fuv - 1
u *= t0
v *= t0

# transition portion


new vvrr
vvrr = v,vvrr[1],0,0
vvrr = vvrr[0],r,0,0

FVGS0 = stack_FVGS0

new uuss
uuss = u,uuss[1],0,0
uuss = uuss[0],s,0,0

GSFV0 = FVGS0[1,0]

uuss = uuss[0,0,1,1]
vvrr = vvrr[0,0,1,1]

''')

loadx4("_2p30m1")
print('''
uuss0 = uuss & _2p30m1x4
vvrr0 = vvrr & _2p30m1x4 
''')
loadx4("_2p63")
print('''
uuss1 = uuss ^ _2p63x4
vvrr1 = vvrr ^ _2p63x4
4x uuss1 unsigned>>= 30
4x vvrr1 unsigned>>= 30
''')
loadx4("_2p33")
print('''
4x uuss1 -= _2p33x4
4x vvrr1 -= _2p33x4

4x ta = int32 uuss0 * int32 FVGS0
4x tb = int32 vvrr0 * int32 GSFV0
4x out0 = ta + tb

minvx4 = 4x stack_minv
mod0 = stack_mod0
''')
carry_01(0)
print('''
4x carryy = out0 +_2p63x4
4x carryy unsigned>>= 30
''')
next_fvgs_1(1)
print("4x ta = int32 d0 * int32 mod1\n4x ta += carryy\n4x out1 += ta")
carry_01(1)

loadx4("_2p63m2p33")
m2p33_srl30_p2p33("out1","carryy")

i = 2
print("FVGS%d = stack_FVGS%d" % (i, i))
print("GSFV%d = FVGS%d[1,0]" % (i,i))
print("4x ta = int32 uuss1 * int32 FVGS%d" % (i-1))
print("4x out%d = ta + carryy" % (i))
print("4x tb = int32 vvrr1 * int32 GSFV%d" % (i-1))
print("4x out%d += tb" % (i))
print("4x ta = int32 uuss0 * int32 FVGS%d" % (i))
print("4x out%d += ta" % (i))
print("4x tb = int32 vvrr0 * int32 GSFV%d" % (i))
print("4x out%d += tb" % (i)) 
print("4x tb = int32 d1 * int32 mod%d" % (i-1))
print("4x out%d += tb" % (i))
print("mod%d = stack_mod%d" % (i, i))
print("4x ta = int32 d0 * int32 mod%d" % (i))
print("4x out%d += ta" % (i))
loadx4("_2p30m1")
#carry_01(2)
loadx4("_2p29")
print("4x d%d = int32 minvx4 * int32 out%d" % (i,i))
print("d%d &= _2p30m1x4" % (i))
print("d%d ^= _2p29x4" % (i))
print("4x d%d -=  _2p29x4" % (i))
print("4x ta = int32 mod0 * int32 d%d" % (i))
print("4x out%d += ta" % (i))
loadx4("_2p63m2p33")
m2p33_srl30_p2p33("out2", "carryy")

for i in range(3,nlimbs) :
    next_fvgs_final(i)

print("4x ta = int32 uuss1 * int32 FVGS%d" % (nlimbs-1))
print("4x tb = int32 vvrr1 * int32 GSFV%d" % (nlimbs-1))
print("4x out%dplus = ta + tb" % (nlimbs))
print("4x ta = int32 mod%d * int32 d1" % (nlimbs-1))
print("4x tb = int32 mod%d * int32 d2" % (nlimbs-2))
print("4x tb += carryy")
print("4x out%d = ta + tb\n4x out%d += out%dplus" % ((nlimbs,)*3) )
m2p33_srl30_p2p33_mask30(("out%d" % nlimbs), "carryy")
print("stack_FVGS%d = out%d" % ((nlimbs-3),nlimbs))

loadx4("_2p33")

print("4x tb = int32 mod%d * int32 d2" % (nlimbs-1))
print("4x out%d = tb + carryy" % (nlimbs+1))
print("4x out%d = out%d + _2p63m2p33x4" % (nlimbs+2,nlimbs+1))
print("4x out%d unsigned >>= 30\n4x out%d -= _2p33x4" % (nlimbs+2,nlimbs+2))
print("out%d &= _2p30m1x4" % (nlimbs+1))
print("stack_FVGS%d = out%d" % (nlimbs-1,nlimbs+2))
print("stack_FVGS%d = out%d" % (nlimbs-2,nlimbs+1))
print("t2 = stack_out")

for i in range(nlimbs) :
    print("a%d = stack_FVGS%d[1]" % (i,i))
    print("mem64[t2 + %2d] = a%d" % (8*i,i))

for s in caller_saved :
    print("caller_%s = stack_%s" % (s,s))

print("return")



