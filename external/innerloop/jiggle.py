#!/usr/bin/env python3

import sys
import random

zseen = 0
zlines = ('z = 0','z = stack_m1[1]')
mlines = ('mnew = -1','mnew = stack_m1[0]')

for line in sys.stdin:
  if line.strip() == 'nop':
    continue
  if line.strip() in ('bigloop:','loop15:'):
    for i in range(random.randrange(4)):
      sys.stdout.write('nop\n')
  if line.strip() in zlines:
    if zseen:
      line = '  '+zlines[random.randrange(2)]+'\n'
    zseen += 1
  if line.strip() in mlines:
    line = '  '+mlines[random.randrange(2)]+'\n'
  sys.stdout.write(line)
