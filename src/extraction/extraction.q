int64 pointer_uvrs
int64 pointer_fuv
int64 pointer_grs


input pointer_uvrs
input pointer_fuv
input pointer_grs

int64 u
int64 v
int64 r
int64 s
int64 fuv
int64 grs

int64 2p41


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
enter extraction
push2xint64 calleesaved_x18, calleesaved_x19
push2xint64 calleesaved_x20, calleesaved_x21
push2xint64 calleesaved_x22, calleesaved_x23
push2xint64 calleesaved_x24, calleesaved_x25
push2xint64 calleesaved_x26, calleesaved_x27
push2xint64 calleesaved_x28, calleesaved_x29

fuv = mem64[pointer_fuv]
2p41 = 1
2p41 = 2p41 << 41

v = fuv
v = v + 1048576
v = v + 2p41
v = v signed>> 42

u = fuv + 1048576
u = u << 22
u = u signed>> 43

mem64[pointer_uvrs] = u
mem64[pointer_uvrs + 8] = v

grs = mem64[pointer_grs]

s = grs
s = s + 1048576
s = s + 2p41
s = s signed>> 42

r = grs + 1048576
r = r << 22
r = r signed>> 43

mem64[pointer_uvrs + 16] = r
mem64[pointer_uvrs + 24] = s

pop2xint64 calleesaved_x28, calleesaved_x29
pop2xint64 calleesaved_x26, calleesaved_x27
pop2xint64 calleesaved_x24, calleesaved_x25
pop2xint64 calleesaved_x22, calleesaved_x23
pop2xint64 calleesaved_x20, calleesaved_x21
pop2xint64 calleesaved_x18, calleesaved_x19

return
