CC = gcc
CFLAGS = -Wall -O2

all: main test

big30.o: big30.c big30.h
	$(CC) $(CFLAGS) -c big30.c

modPmul_pureC.o: modPmul_pureC.c big30.h
	$(CC) $(CFLAGS) -c modPmul_pureC.c

modPmul_ref.o: modPmul_ref.c big30.h
	$(CC) $(CFLAGS) -c modPmul_ref.c

main.o: main.c big30.h
	$(CC) $(CFLAGS) -c main.c

test.o: test.c big30.h
	$(CC) $(CFLAGS) -c test.c

main: main.o big30.o modPmul_pureC.o modPmul_ref.o
	$(CC) $(CFLAGS) -o main main.o big30.o modPmul_pureC.o modPmul_ref.o -lgmp

test: test.o big30.o modPmul_pureC.o modPmul_ref.o
	$(CC) $(CFLAGS) -o test test.o big30.o modPmul_pureC.o modPmul_ref.o -lgmp

clean:
	rm -f *.o main test

