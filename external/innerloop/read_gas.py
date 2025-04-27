#! /usr/bin/python3

import sys
import re

regs = ["%rdi","%rsi","%rdx","%rcx","%r8","%r9","%rax","%r10","%r11","%r12","%r13","%r14","%r15","%rbx","%rbp","%rsp"]




try : GAS = int(sys.argv[1])
except : GAS = "t"

fn = open(GAS)
gas = fn.readlines()
EAs = set(())


for X in gas :
    for Y in re.finditer("0x([0-9a-f]+)\\((%s)\\)" % ("|".join(regs)), X) :
        EAs.add(Y.group(0))

for X in gas :
    for Y in re.finditer("\\((%s)\\)" % ("|".join(regs)), X) :
        EAs.add(Y.group(0))

EAs = [X for X in EAs]        
EAs.sort()
            
for X in EAs :
    print("#! %s = %%%%EA" % X)

print("")
    
for r in regs :
    print("#! %s = %%%s" % (r,r))
            
