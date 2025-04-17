int64 pointer_uint256
int64 pointer_big30

input pointer_uint256
input pointer_big30

int64 limb64_0
int64 limb64_1
int64 limb64_2
int64 limb64_3

int64 limb30_0
int64 limb30_1
int64 limb30_2
int64 limb30_3
int64 limb30_4
int64 limb30_5
int64 limb30_6
int64 limb30_7
int64 limb30_8

int64 tmp


caller calleesaved_x18
caller calleesaved_x19
stack64 stack_x18
stack64 stack_x19
caller calleesaved_x20
caller calleesaved_x21
stack64 stack_x20
stack64 stack_x21
caller calleesaved_x22
caller calleesaved_x23
stack64 stack_x22
stack64 stack_x23
caller calleesaved_x24
caller calleesaved_x25
stack64 stack_x24
stack64 stack_x25
caller calleesaved_x26
caller calleesaved_x27
stack64 stack_x26
stack64 stack_x27
caller calleesaved_x28
caller calleesaved_x29
stack64 stack_x28
stack64 stack_x29


enter uint256_from_big30

push2xint64 calleesaved_x18, calleesaved_x19
push2xint64 calleesaved_x20, calleesaved_x21
push2xint64 calleesaved_x22, calleesaved_x23
push2xint64 calleesaved_x24, calleesaved_x25
push2xint64 calleesaved_x26, calleesaved_x27
push2xint64 calleesaved_x28, calleesaved_x29


limb30_0 = mem32[pointer_big30]
limb30_1 = mem32[pointer_big30 + 4]
limb30_2 = mem32[pointer_big30 + 8]
limb30_3 = mem32[pointer_big30 + 12]
limb30_4 = mem32[pointer_big30 + 16]
limb30_5 = mem32[pointer_big30 + 20]
limb30_6 = mem32[pointer_big30 + 24]
limb30_7 = mem32[pointer_big30 + 28]
limb30_8 = mem32[pointer_big30 + 32]


limb30_1 = limb30_1 << 30
tmp = limb30_2 << 60
limb64_0 = limb30_1 | limb30_0
limb64_0 = limb64_0 | tmp

limb30_2 = limb30_2 (unsigned)>> 4
limb30_3 = limb30_3 << 26
tmp = limb30_4 << 56
limb64_1 = limb30_2 | limb30_3
limb64_1 = limb64_1 | tmp

limb30_4 = limb30_4 (unsigned)>> 8
limb30_5 = limb30_5 << 22
tmp = limb30_6 << 52
limb64_2 = limb30_4 | limb30_5
limb64_2 = limb64_2 | tmp

limb30_6 = limb30_6 (unsigned)>> 12
limb30_7 = limb30_7 << 18
tmp = limb30_8 << 48
limb64_3 = limb30_6 | limb30_7
limb64_3 = limb64_3 | tmp


mem64[pointer_uint256] = limb64_0
mem64[pointer_uint256 + 8] = limb64_1
mem64[pointer_uint256 + 16] = limb64_2
mem64[pointer_uint256 + 24] = limb64_3


pop2xint64 calleesaved_x28, calleesaved_x29
pop2xint64 calleesaved_x26, calleesaved_x27
pop2xint64 calleesaved_x24, calleesaved_x25
pop2xint64 calleesaved_x22, calleesaved_x23
pop2xint64 calleesaved_x20, calleesaved_x21
pop2xint64 calleesaved_x18, calleesaved_x19



return 
