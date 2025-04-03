CC = gcc
CFLAGS = -Wall -O2

all: main test

big30.o: big30.c big30.h
	$(CC) $(CFLAGS) -c big30.c

double_product_neon_intrinsics.o: double_product_neon_intrinsics.c big30.h
	$(CC) $(CFLAGS) -c double_product_neon_intrinsics.c

double_mont_ref.o: double_mont_ref.c big30.h
	$(CC) $(CFLAGS) -c double_mont_ref.c

main.o: main.c big30.h
	$(CC) $(CFLAGS) -c main.c

test.o: test.c big30.h
	$(CC) $(CFLAGS) -c test.c

main: main.o big30.o double_product_neon_intrinsics.o double_mont_ref.o
	$(CC) $(CFLAGS) -o main main.o big30.o double_product_neon_intrinsics.o double_mont_ref.o -lgmp

test: test.o big30.o double_product_neon_intrinsics.o double_mont_ref.o
	$(CC) $(CFLAGS) -o test test.o big30.o double_product_neon_intrinsics.o double_mont_ref.o -lgmp

clean:
	rm -f *.o main test

