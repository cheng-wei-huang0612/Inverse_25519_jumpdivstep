
int64 pointer_big30
int64 pointer_uint256

input pointer_big30
input pointer_uint256

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

int64 tmp60

enter big30_from_uint256
limb64_0 = mem64[pointer_uint256 + 0]
limb64_1 = mem64[pointer_uint256 + 8]
limb64_2 = mem64[pointer_uint256 + 16]
limb64_3 = mem64[pointer_uint256 + 24]

tmp60 = limb64_0


limb30_0 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
limb30_1 = tmp60 & 0x3FFFFFFF

mem32[pointer_big30] = limb30_0
mem32[pointer_big30 + 4] = limb30_1


tmp60 = limb64_1, limb64_0 >> 60

limb30_2 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
limb30_3 = tmp60 & 0x3FFFFFFF

mem32[pointer_big30 + 8] = limb30_2
mem32[pointer_big30 + 12] = limb30_3



tmp60 = limb64_2, limb64_1 >> 56

limb30_4 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
limb30_5 = tmp60 & 0x3FFFFFFF

mem32[pointer_big30 + 16] = limb30_4
mem32[pointer_big30 + 20] = limb30_5



tmp60 = limb64_3, limb64_2 >> 52

limb30_6 = tmp60 & 0x3FFFFFFF
tmp60 = tmp60 unsigned>> 30
limb30_7 = tmp60 & 0x3FFFFFFF


limb30_8 = limb64_3 unsigned>> 48



mem32[pointer_big30 + 24] = limb30_6
mem32[pointer_big30 + 28] = limb30_7
mem32[pointer_big30 + 32] = limb30_8

return
