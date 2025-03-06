# Makefile for bignum30_18 + main.c that uses GMP in naive_mul_mod()

CC = gcc
CFLAGS = -Wall -Wextra -O2

# 若要使用 GMP，就加上 -DUSE_GMP 以及對應的 include 路徑
TEST_CFLAGS = $(CFLAGS) -DUSE_GMP -I/opt/homebrew/include
TEST_LDFLAGS = -L/opt/homebrew/lib -lgmp

# 最終只要生成一個執行檔: main
all: main

# 編譯並連結
main: main.o bignum30_18.o
	$(CC) $(TEST_CFLAGS) main.o bignum30_18.o -o main $(TEST_LDFLAGS)

# 生成 main.o
main.o: main.c bignum30_18.h
	$(CC) $(TEST_CFLAGS) -c main.c

# 生成 bignum30_18.o
bignum30_18.o: bignum30_18.c bignum30_18.h
	$(CC) $(TEST_CFLAGS) -c bignum30_18.c

# 清理
clean:
	rm -f *.o main

