int64 out
int64 m
int64 f
int64 g
int64 u
int64 v
int64 r
int64 s
int64 fuv
int64 grs
int64 mnew
int64 z
int64 loop
int64 _2p15m1
int64 _m2p15
int64 _2p15
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
int64 minusone
int64 h
int64 oldg

int64 f_carry
int64 g_carry
int64 f_top
int64 g_top
int64 vv
int64 ss
int64 v_carry
int64 s_carry
int64 v_top
int64 s_top

stack64 stack_r11
stack64 stack_r12
stack64 stack_r13
stack64 stack_r14
stack64 stack_r15
stack64 stack_rbx
stack64 stack_rbp

int64 stack_m1

stack64 stack_f
stack64 stack_g
stack64 stack_u
stack64 stack_v
stack64 stack_r
stack64 stack_s
stack64 stack_m
stack64 stack_vv
stack64 stack_ss
stack64 stack_0
stack64 stack_2p15m1
stack64 stack_2p16a2p32
stack64 stack_m2p15
stack64 stack_2p15
stack64 stack_2p16
stack64 stack_2p31
stack64 stack_m2p32
stack64 stack_m2p48


enter innerloop60_transition

m = input_0
stack_f = input_1
f = mem64[input_1 +0]
stack_g = input_2
g = mem64[input_2 +0]
stack_vv = input_3
stack_ss = input_4

stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r13 = caller_r13
stack_r14 = caller_r14
stack_r15 = caller_r15
stack_rbx = caller_rbx
stack_rbp = caller_rbp

# set up stack values

#    minusone= -1
#    stack_m1= minusone
    stack_m1 = -1
#     _2p15m1= 32767 
#stack_2p15m1= _2p15m1
      _m2p15 = -32768
 stack_m2p15 = _m2p15
#       _2p15= 32768
#  stack_2p15= _2p15     
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

  loop = 4

loop15:

  fuv = f & ~ _m2p15
  grs = g & ~ _m2p15
  fuv |= stack_m2p32
  grs |= stack_m2p48

# Rep #1
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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
 
# Rep #2
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #3
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #4
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #5
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #6
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #7
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #8
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #9
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #10
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #11
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #12
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #13
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #14
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# Rep #15
  z = 0

  h = grs + fuv
  mnew = stack_m1
  oldg = grs
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

# extract u,v,r,s
extract:

  _2p16a2p32 = stack_2p16a2p32
  s = grs + _2p16a2p32
  (int64) s >>= 33

      rax = g
      (int128) rdx rax = rax * s
      t2 = rax
      t1 = rdx

  _2p16 = stack_2p16
  grs += _2p16
  (int64) grs >>= 17
  r = (int16) grs
  # s = grs

      rax = f
      (int128) rdx rax = rax * r
      carry? t2 += rax
             t1 += rdx + carry
      t2 = (t1 t2) >> 15	 
    
  v = fuv + _2p16a2p32
  (int64) v >>= 33

  fuv += _2p16
  (int64) fuv >>= 17
  u = (int16) fuv
  # v = fuv

      rax = f
      (int128) rdx rax = rax * u
      f = rax
      t0 = rdx
      rax = g
      (int128) rdx rax = rax * v
      carry? f += rax
             t0 += rdx + carry
      f = (t0 f) >> 15
      g = t2

  =? loop - 4  
  goto first_loop if =

  t0 = u
  t0 *= stack_u
  t1 = v
  t1 *= stack_r

  u *= stack_v
  v *= stack_s
  v += u
  u = t0 + t1

  t0 = r
  t0 *= stack_u
  t1 = s
  t1 *= stack_r

  r *= stack_v
  s *= stack_s
  s += r
  r = t0 + t1

first_loop:

  stack_u = u
  stack_v = v
  stack_r = r
  stack_s = s

#  _m2p15 = stack_m2p15	
  =? loop -= 1		

goto loop15 if !=

f = stack_f
g = stack_g
vv = stack_vv
ss = stack_ss
stack_m = m

transition_uv_limb0:

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

transition_uv_limb1:

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

transition_uv_limb2:

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

transition_uv_limb3:

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

transition_uv_limb4:

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

transition_vs_limb0:

rax = mem64[vv+ 0]
(int128) rdx rax = rax * u
v_top = rdx
v_carry = rax
rax = mem64[ss+ 0]
(int128) rdx rax = rax * v
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry
carry? v_carry = (v_top v_carry) >> 51
       v_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
rax = mem64[vv+ 0]
mem64[vv+ 0] = t0
(int128) rdx rax = rax * r
s_top = rdx
s_carry = rax
rax = mem64[ss+ 0]
(int128) rdx rax = rax * s
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry
carry? s_carry = (s_top s_carry) >> 51
       s_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+ 0] = t0

transition_vs_limb1:

v_top = v_carry
(int64) v_top >>= 63
rax = mem64[vv+ 8]
(int128) rdx rax = rax * u
carry? v_carry += rax
         v_top += rdx + carry
rax = mem64[ss+ 8]
(int128) rdx rax = rax * v
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry	       
carry? v_carry = (v_top v_carry) >> 51
       v_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
s_top = s_carry
(int64) s_top >>= 63
rax = mem64[vv+ 8]
mem64[vv+ 8] = t0
(int128) rdx rax = rax * r
carry? s_carry += rax
         s_top += rdx + carry
rax = mem64[ss+ 8]
(int128) rdx rax = rax * s
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry	       
carry? s_carry = (s_top s_carry) >> 51
       s_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+ 8] = t0       

transition_vs_limb2:

v_top = v_carry
(int64) v_top >>= 63
rax = mem64[vv+16]
(int128) rdx rax = rax * u
carry? v_carry += rax
         v_top += rdx + carry
rax = mem64[ss+16]
(int128) rdx rax = rax * v
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry	       
carry? v_carry = (v_top v_carry) >> 51
       v_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
s_top = s_carry
(int64) s_top >>= 63
rax = mem64[vv+16]
mem64[vv+16] = t0
(int128) rdx rax = rax * r
carry? s_carry += rax
         s_top += rdx + carry
rax = mem64[ss+16]
(int128) rdx rax = rax * s
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry	       
carry? s_carry = (s_top s_carry) >> 51
       s_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+16] = t0       

transition_vs_limb3:

v_top = v_carry
(int64) v_top >>= 63
rax = mem64[vv+24]
(int128) rdx rax = rax * u
carry? v_carry += rax
         v_top += rdx + carry
rax = mem64[ss+24]
(int128) rdx rax = rax * v
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry	       
carry? v_carry = (v_top v_carry) >> 51
       v_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
s_top = s_carry
(int64) s_top >>= 63
rax = mem64[vv+24]
mem64[vv+24] = t0
(int128) rdx rax = rax * r
carry? s_carry += rax
         s_top += rdx + carry
rax = mem64[ss+24]
(int128) rdx rax = rax * s
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry	       
carry? s_carry = (s_top s_carry) >> 51
       s_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+24] = t0       

transition_vs_limb4:

v_top = v_carry
(int64) v_top >>= 63
rax = mem64[vv+32]
(int128) rdx rax = rax * u
carry? v_carry += rax
         v_top += rdx + carry
rax = mem64[ss+32]
(int128) rdx rax = rax * v
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry	       
carry? v_carry = (v_top v_carry) >> 51
       v_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13

s_top = s_carry
(int64) s_top >>= 63
rax = mem64[vv+32]
mem64[vv+32] = t0
(int128) rdx rax = rax * r
carry? s_carry += rax
         s_top += rdx + carry
rax = mem64[ss+32]
(int128) rdx rax = rax * s
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry	       
carry? s_carry = (s_top s_carry) >> 51
       s_carry += 0 + carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+32] = t0       

transition_vs_limb5:

rax = 19
(int128) rdx rax = rax * v_carry
v_top = mem64[vv+ 0]
v_carry = v_top
(int64) v_top >>= 63
carry? v_carry += rax
         v_top += rdx + carry
t0 = v_carry
t0 <<= 13
(int64) t0 >>= 13
mem64[vv+ 0] = t0
carry? v_carry = (v_top v_carry) >> 51
       v_carry += mem64[vv+ 8] + carry
mem64[vv+ 8] = v_carry       

rax = 19
(int128) rdx rax = rax * s_carry
s_top = mem64[ss+ 0]
s_carry = s_top
(int64) s_top >>= 63
carry? s_carry += rax
         s_top += rdx + carry
t0 = s_carry
t0 <<= 13
(int64) t0 >>= 13
mem64[ss+ 0] = t0
carry? s_carry = (s_top s_carry) >> 51
       s_carry += mem64[ss+ 8] + carry
mem64[ss+ 8] = s_carry       

caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r13 = stack_r13
caller_r14 = stack_r14
caller_r15 = stack_r15
caller_rbx = stack_rbx
caller_rbp = stack_rbp
	 m = stack_m

return m
