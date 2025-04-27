int64 out
int64 m
int64 fuv
int64 gqr
int64 loop

int64 h
int64 oldg

stack64 stack_r11
stack64 stack_r12

int64 z
int64 mnew

enter innerloop

stack_r11 = caller_r11
stack_r12 = caller_r12

m = input_1
fuv = input_2
gqr = input_3
loop = input_4

int64 minusone
minusone = -1

             =? loop & 1
goto even if =
  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<

  loop -= 1
even:

             =? loop & 2
goto 4times if =
  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<

  loop -= 2
4times:

             =? loop & 4
goto 8times if =
  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<

  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<

  loop -= 4
8times:

              unsigned>? loop - 0
goto done if !unsigned>

innerloop:

  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<



  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<



  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<



  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


  z = 0

  h = gqr + fuv
  mnew = minusone
  oldg = gqr
              =? gqr & 1

  h = gqr if  =
  z = m   if !=
  mnew ^= m
  gqr -= fuv

  (uint64) h >>= 1
  (uint64) gqr >>= 1
  m -= 1
                 signed<? z - 0

  fuv = oldg if  signed<
  gqr = h    if !signed<
  m = mnew   if  signed<


      z = 0

      h = gqr + fuv
      mnew = minusone
      oldg = gqr
                  =? gqr & 1
    
      h = gqr if  =
      z = m   if !=
      mnew ^= m
      gqr -= fuv
    
      (uint64) h >>= 1
      (uint64) gqr >>= 1
      m -= 1
                     signed<? z - 0
    
      fuv = oldg if  signed<
      gqr = h    if !signed<
      m = mnew   if  signed<

                   =? loop -= 8
goto innerloop if !=

done:

out = input_0
mem64[out+0] = m
mem64[out+8] = fuv
mem64[out+16] = gqr

caller_r11 = stack_r11
caller_r12 = stack_r12

return
