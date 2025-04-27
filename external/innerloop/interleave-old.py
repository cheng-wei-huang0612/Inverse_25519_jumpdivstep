#!/usr/bin/env python
import sys
import re

if len(sys.argv) < 5 :
    ratio2 = 1
else :
    ratio2 = int(sys.argv[4])

if len(sys.argv) < 4 :
    ratio1 = 1
else :
    ratio1 = int(sys.argv[3])

if len(sys.argv) < 3 :
    print("too few arguments")
    sys.exit()

file1 = open(sys.argv[1],"r")
file2 = open(sys.argv[2],"r")

inst1 = file1.readlines()
inst2 = file2.readlines()

inst1 = [L[:-1] for L in inst1 if not re.match("(^\s*$)|(^\s*#)",L)]
inst2 = [L[:-1] for L in inst2 if not re.match("(^\s*$)|(^\s*#)",L)]

i1 = 0
i2 = 0

            
while (i1 < len(inst1) or i2 < len(inst2)) :
    for j in range(ratio1) :
        while (i1 < len(inst1) and re.match("(^[A-Za-z0-9_]+:)|(^\s*new\s)",inst1[i1])) :
            print(inst1[i1])
            i1 += 1
        if (i1 < len(inst1)):
            print(inst1[i1])
            i1 += 1
    for j in range(ratio2) :
        while (i2 < len(inst2) and re.match("(^[A-Za-z0-9_]+:)|(^\s*new\s)",inst2[i2])) :
            print(inst2[i2])
            i2 += 1
        if (i2 < len(inst2)):
            print(inst2[i2])
            i2 += 1
            
