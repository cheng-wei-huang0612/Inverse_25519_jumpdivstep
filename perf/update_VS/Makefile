AS = as -g -mcpu=cortex-a72
LD = ld
LDFLAGS = 
OBJS = driver.o update_VS_mont.o

all: bench_vs_mont

bench_vs_mont: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $@

%.o: %.S
	$(AS) $< -o $@

clean:
	rm -f $(OBJS) bench_vs_mont
