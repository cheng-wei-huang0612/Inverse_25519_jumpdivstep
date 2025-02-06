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
int64 uv
int64 rs
int64 mnew
int64 z
int64 loop
int64 _2p15m1
int64 _m2p15
int64 _2p15
int64 _2p16
int64 _2p31
int64 _2p32
int64 _2p48
int64 rax
int64 rdx

int64 t0
int64 t1
int64 t2
int64 minusone
int64 h
int64 oldg

stack64 stack_r11
stack64 stack_r12
stack64 stack_r13
stack64 stack_r14
stack64 stack_r15
stack64 stack_rbx
stack64 stack_rbp

int64 stack_m1
stack64 stack_0
stack64 stack_2p15m1
stack64 stack_m2p15
stack64 stack_2p15
stack64 stack_2p16
stack64 stack_2p31
stack64 stack_2p32
stack64 stack_2p48

stack64 stack_u
stack64 stack_v
stack64 stack_r
stack64 stack_s
stack64 stack_out


enter innerloop60

stack_out = input_0
m = input_1
f = input_2
g = input_3

stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r13 = caller_r13
stack_r14 = caller_r14
stack_r15 = caller_r15
stack_rbx = caller_rbx
stack_rbp = caller_rbp

# set up stack values

    minusone = -1
    stack_m1 = minusone
#     _2p15m1 = 32767 
#stack_2p15m1 = _2p15m1
      _m2p15 = -32768
 stack_m2p15 = _m2p15
#       _2p15 = 32768
#  stack_2p15 = _2p15     
       _2p16 = 65536
  stack_2p16 = _2p16
       _2p31 = 2147483648
  stack_2p31 = _2p31     
       _2p32 = 4294967296
  stack_2p32 = _2p32
       _2p48 = 281474976710656
  stack_2p48 = _2p48

  loop = 4

loop15:

  fuv = f & ~ _m2p15
  grs = g & ~ _m2p15
  fuv |= stack_2p32
  grs |= stack_2p48

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

  #fuv <<= 15	
  #fuv += stack_2p31
  #(int64) fuv >>= 32
  fuv += stack_2p16
  (int64) fuv >>= 17
  #
  u = (int16) fuv
  fuv -= u
  (int64) fuv >>= 16
  # fuv = v

  #grs <<= 15
  #grs += stack_2p31
  #(int64) grs >>= 32
  grs += stack_2p16
  (int64) grs >>= 17
  #
  r = (int16) grs
  grs -= r
  (int64) grs >>= 16
  # grs = s

  rax = f
  (int128) rdx rax = rax * r
  t2 = rax
  t1 = rdx
  rax = g
  (int128) rdx rax = rax * grs
  carry? t2 += rax
         t1 += rdx + carry
  t2 = (t1 t2) >> 15	 

  rax = f
  (int128) rdx rax = rax * u
  f = rax
  t0 = rdx
  rax = g
  (int128) rdx rax = rax * fuv
  carry? f += rax
         t0 += rdx + carry
  f = (t0 f) >> 15
  g = t2

  =? loop - 4  
  goto first_loop if =

  t0 = u
  t0 *= stack_u
  t1 = fuv
  t1 *= stack_r

  u *= stack_v
  fuv *= stack_s
  fuv += u
  u = t0 + t1

  t0 = r
  t0 *= stack_u
  t1 = grs
  t1 *= stack_r

  r *= stack_v
  grs *= stack_s
  grs += r
  r = t0 + t1

first_loop:

  stack_u = u
  stack_v = fuv
  stack_r = r
  stack_s = grs

#  _m2p15 = stack_m2p15	
  =? loop -= 1		

goto loop15 if !=


out = stack_out

mem64[out + 0] = m
mem64[out + 8] = f
mem64[out + 16]= g
mem64[out + 24]= u
mem64[out + 32]= fuv
mem64[out + 40]= r
mem64[out + 48]= grs

caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r13 = stack_r13
caller_r14 = stack_r14
caller_r15 = stack_r15
caller_rbx = stack_rbx
caller_rbp = stack_rbp

return