CC     = gcc
CFLAGS = -I../include -O2
LDFLAGS = -lgmp
# 如果需要 GMP，就加上 -lgmp
# LDFLAGS = -lgmp


# 通用的 SRC (可以視需求篩選或增減)

# SRC = $(wildcard ../src/cpt_inv_func4.c \
# 	  			 ../src/j_loop/j_loop.S \
# 				 ../src/j_loop_final/j_loop_final.S \
# 	             ../src/update_FG/update_FG.S \
# 	             ../src/update_VS/update_VS_mont_neon.c \
# 				 ../src/big30_and_uint256/big30_from_uint256.S \
# 				 ../src/final_adjustment/final_adjustment.S \
#                  ../src/common/*.c )

SRC = $(wildcard ../src/cpt_inv_func3.c \
	             ../src/update_FG/update_FG.S \
	             ../src/update_VS/update_VS_mont_inline_neon.c \
				 ../src/big30_and_uint256/big30_from_uint256.S \
				 ../src/big30_and_uint256/uint256_from_big30.S \
				 ../src/final_adjustment/final_adjustment.S \
				 ../src/divstepx20/divstepx20.S \
				 ../src/extraction/extraction.S \
				 ../src/inner_update/inner_update.S \
				 ../src/sign_adjustment/sign_adjustment.S \
                 ../src/common/*.c )

# SRC = $(wildcard ../src/cpt_inv_func2.c \
# 	             ../src/update_FG/update_FG.S \
# 	             ../src/update_VS/update_VS_mont_neon.c \
# 				 ../src/big30_and_uint256/big30_from_uint256.S \
# 				 ../src/big30_and_uint256/uint256_from_big30.S \
# 				 ../src/final_adjustment/final_adjustment.S \
# 				 ../src/divstep/divstep.S \
# 				 ../src/extraction/extraction.S \
# 				 ../src/inner_update/inner_update.S \
# 				 ../src/sign_adjustment/sign_adjustment.S \
#                  ../src/common/*.c )
# 如果你還有其他子目錄，也可繼續加在這：
# SRC += $(wildcard ../src/bignum/9_limbs_linear_comb/*.c)

# 這裡假設 tests/ 裡有 main2.c、main2_clean.c 兩個測試程式
# 你可以根據實際情況增減

all: single_test random_test

single_test: single_test.c $(SRC)
	$(CC) $(CFLAGS) single_test.c $(SRC) $(LDFLAGS) -o single_test

random_test: random_test.c $(SRC)
	$(CC) $(CFLAGS) random_test.c $(SRC) $(LDFLAGS) -o random_test


clean:
	rm -f single_test random_test 

