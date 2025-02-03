# Compiler and flags
CC     = gcc
CFLAGS = -Wall -Wextra -O2
ASFLAGS= -Wall -Wextra -O2  # Assembly compile flags (if needed)

# List of object files
OBJS = main.o int64_times_int64.o int128_adds_int128.o int128_times_int128.o int64_times_int256.o

# Default target
all: main

# Link the final executable
main: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Compile C source files
main.o: main.c cint_arith.h cint_types.h
	$(CC) $(CFLAGS) -c main.c


int128_adds_int128.o: int128_adds_int128.c cint_arith.h cint_types.h
	$(CC) $(CFLAGS) -c int128_adds_int128.c

# Assemble .S files
int64_times_int64.o: int64_times_int64.S cint_arith.h cint_types.h
	$(CC) $(ASFLAGS) -c int64_times_int64.S

int128_times_int128.o: int128_times_int128.S cint_arith.h cint_types.h
	$(CC) $(ASFLAGS) -c int128_times_int128.S

int64_times_int256.o: int64_times_int256.S cint_arith.h cint_types.h
	$(CC) $(ASFLAGS) -c int64_times_int256.S

# Cleanup
clean:
	rm -f $(OBJS) main

.PHONY: all clean
