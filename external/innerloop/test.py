#!/usr/bin/env python3

def cmod32(a) :
  return((a+ 2**31) % (2**32) - (2**31))

def divstep_c(c,f,g,ff,gg,u,v,r,s) :
  if (c!=0) and (g&1==1) :
    (f,g,ff,gg,u,r,v,s) = (g,-f,gg,-ff,r,-u,s,-v)
  r = (r + (g&1)*u); u <<= 1
  s = (s + (g&1)*v); v <<= 1
  gg = (gg + (g&1) * ff) >> 1
  g = cmod32(g + (g&1)*f) >> 1
  return((f,g,ff,gg,u,v,r,s))


l = 10
for f in range(-2**(l-1)+1,2**(l-1)-1,2) :
  for g in range(-2**(l-1),2**(l-1)-1) :
    for c in range(2**l) :
      (u,v,r,s) = (1,0,0,1)
      fuv = f - 2**(2*l) * u - 2**(3*l+1) * v
      grs = g - 2**(2*l) * r - 2**(3*l+1) * s
      (ff,gg) = (f,g) 
      for i in range(l) :
        print((c & (2**i),fuv,grs,ff,gg,u,v,r,s))
        (fuv,grs,ff,gg,u,v,r,s) = divstep_c(c & (2**i),fuv,grs,ff,gg,u,v,r,s)
      print((0,fuv,grs,ff,gg,u,v,r,s))
      f0 = cmod32(fuv << (32-l)) >> (32-l)
      g0 = cmod32(grs << (32-l)) >> (32-l)
      uv = cmod32(fuv - f0) >> l
      rs = cmod32(grs - g0) >> l
      u0 = -(cmod32(uv << (31-l)) >> (31-l))
      r0 = -(cmod32(rs << (31-l)) >> (31-l))
      v0 = -(cmod32(uv + u0) >> (l+1))
      s0 = -(cmod32(rs + r0) >> (l+1))
      if ((u0,v0,r0,s0) != (u,v,r,s)) :
        print(f,g,c,(u,v,r,s),(ff,gg),(f0,g0,u0,v0,r0,s0))
      
