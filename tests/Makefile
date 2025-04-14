CC     = gcc
CFLAGS = -I../include -O2
LDFLAGS = -lgmp
# 如果需要 GMP，就加上 -lgmp
# LDFLAGS = -lgmp

# 通用的 SRC (可以視需求篩選或增減)
SRC = $(wildcard ../src/cpt_inv_func.c \
	             ../src/update_FG/update_FG_ref.c \
	             ../src/update_VS/update_VS_mont_ref.c \
	             ../src/inner_update/inner_update_ref.c \
	             ../src/sign_adjustment/sign_adjustment_ref.c \
	             ../src/divstep/divstep.S \
	             ../src/uv_extraction/uv_extraction.S \
                 ../src/common/*.c )

# 如果你還有其他子目錄，也可繼續加在這：
# SRC += $(wildcard ../src/bignum/9_limbs_linear_comb/*.c)

# 這裡假設 tests/ 裡有 main2.c、main2_clean.c 兩個測試程式
# 你可以根據實際情況增減

all: main2 main2_clean

main2: main2.c $(SRC)
	$(CC) $(CFLAGS) main2.c $(SRC) $(LDFLAGS) -o main2

main2_clean: main2_clean.c $(SRC)
	$(CC) $(CFLAGS) main2_clean.c $(SRC) $(LDFLAGS) -o main2_clean

clean:
	rm -f main2 main2_clean

