#!/usr/bin/env python3

server = 'samba'
serverpath = 'safegcd/cmovk'

import sys
from random import randrange
import subprocess

zlines = ('z = 0','z = stack_m1[1]')
mlines = ('mnew = -1','mnew = stack_m1[0]')

def score(P):
  with open('cmovk.q','w') as f:
    f.write(''.join(P))
  subprocess.check_output(['make'])
  while True:
    try:
      subprocess.check_output(['scp','cmovk','%s:%s'%(server,serverpath)])
      break
    except:
      pass
  while True:
    try:
      output = subprocess.check_output(['ssh','-n',server,serverpath],universal_newlines=True)
      break
    except:
      pass

  output = output.splitlines()
  for line in output:
    line = line.split()
    if len(line) < 35: continue
    if line[0] != '#': continue
    if line[1] != 'inverse_255_x1000': continue
    if line[2] != 'sorted:': continue
    return int(line[34])
  return None

def bigmutation(P):
  zseen = False
  Q = []
 
  for line in P:
    if line.strip() == 'nop':
      continue
    if line.strip() in ('bigloop:','loop15:'):
      for i in range(randrange(8)):
        Q += ['nop\n']
    if line.strip() in zlines:
      if zseen:
        line = '  '+zlines[randrange(2)]+'\n'
      zseen += 1
    if line.strip() in mlines:
      line = '  '+mlines[randrange(2)]+'\n'
    Q += [line]

  return Q

def smallmutation(P):
  Q = list(P)

  startswap = None
  endswap = None
  for i in range(len(Q)):
    if Q[i].strip() == '# startswap':
      startswap = i
    if Q[i].strip() == '# endswap':
      endswap = i

  assert startswap != None
  assert endswap != None
  assert startswap < endswap

  if startswap+1 <= endswap-2:
    assert any(Q[i].startswith('  ') for i in range(startswap+1,endswap-1))
    assert not all(Q[i].startswith('  ') for i in range(startswap+1,endswap-1))
    while True:
      i = randrange(startswap+1,endswap-1)
      if Q[i].startswith('  ') != Q[i+1].startswith(' '):
        Q[i],Q[i+1] = Q[i+1],Q[i]
        break

  return Q

P = [line for line in sys.stdin]
Pscore = score(P)
bestscore = Pscore
print('best %d' % bestscore)
sys.stdout.flush()
adults = [(Pscore,P)]

for generation in range(100):
  children = []
  for Pscore,P in adults:
    for loop in range(2):
      Q = bigmutation(P) if loop == 0 else smallmutation(P)
      Qscore = score(Q)
      print('%d -> %d' % (Pscore,Qscore))
      if Qscore < bestscore:
        with open('cmovk.q.%d' % Qscore,'w') as f:
          f.write(''.join(Q))
        bestscore = Qscore
        print('best %d' % bestscore)
      children += [(Qscore,Q)]
      sys.stdout.flush()

  adults += children
  adults.sort()

  adults = adults[:10]
