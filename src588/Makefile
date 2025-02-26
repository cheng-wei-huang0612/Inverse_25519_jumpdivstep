CC = gcc
CFLAGS = -Wall -Wextra -O2

# 若要使用 GMP，就加上 -DUSE_GMP 以及對應的 include 路徑
TEST_CFLAGS = $(CFLAGS) -DUSE_GMP -I/opt/homebrew/include
TEST_LDFLAGS = -L/opt/homebrew/lib -lgmp

# 這裡的兩個執行檔：
#  1) main       (不使用 GMP)
#  2) test_mybig30 (使用 GMP)
all: main main_gmp test_mybig30

##################################################
# 1) main 可依需要連結 / 使用不含 GMP 的 mybig30.o
##################################################
main: main.o mybig30.o
	$(CC) $(CFLAGS) main.o mybig30.o -o main

main.o: main.c mybig30.h
	$(CC) $(CFLAGS) -c main.c

# mybig30.o 不加 -DUSE_GMP
mybig30.o: mybig30.c mybig30.h
	$(CC) $(CFLAGS) -c mybig30.c

##################################################
# 1.5) main_gmp (允許主程式也連 GMP)
##################################################
main_gmp: main_gmp.o mybig30_test.o
	$(CC) $(TEST_CFLAGS) main_gmp.o mybig30_test.o -o main_gmp $(TEST_LDFLAGS)

# main_gmp.o => 用 main.c 但要以 TEST_CFLAGS 編譯
main_gmp.o: main.c mybig30.h
	$(CC) $(TEST_CFLAGS) -c main.c -o main_gmp.o

# mybig30_test.o => 跟 test_mybig30 一樣，用 GMP 版本
mybig30_test.o: mybig30.c mybig30.h
	$(CC) $(TEST_CFLAGS) -c mybig30.c -o mybig30_test.o

##################################################
# 2) test_mybig30 (含所有測試, 使用 GMP)
##################################################
test_mybig30: test_mybig30.o mybig30_test.o
	$(CC) $(TEST_CFLAGS) test_mybig30.o mybig30_test.o -o test_mybig30 $(TEST_LDFLAGS)

# test_mybig30.c 裡面會呼叫各種測試 (P, inv600, 以及 uint256_to_big30_9 等)
test_mybig30.o: test_mybig30.c mybig30.h
	$(CC) $(TEST_CFLAGS) -c test_mybig30.c

# mybig30_test.o 使用 TEST_CFLAGS (含 USE_GMP)
mybig30_test.o: mybig30.c mybig30.h
	$(CC) $(TEST_CFLAGS) -c mybig30.c -o mybig30_test.o

##################################################
# clean
##################################################
clean:
	rm -f *.o main test_mybig30
