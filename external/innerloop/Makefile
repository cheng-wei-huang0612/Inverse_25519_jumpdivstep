CC=gcc -O3 -Wall -fPIC -fPIE

all: dettman shift shift2 latency latency2 slice slice2 cmov cmov2 cmov3 cmov4 cmov5 cmov6 cmov7 cmov8 cmov9 cmovb cmovc cmovd cmove cmovf cmovg cmovh cmovi cmovj cmovk cmovl cmovm cmovn cmovo cmovp mont0 mont1 mont2 mont3 mont4 mont5 mont5a

#all: dettman shift shift2 latency latency2 slice slice2 cmov cmov[2-9a-j]

dettman: dettman.c
	$(CC) -o dettman dettman.c

shift: shift.c
	$(CC) -o shift shift.c

shift2: shift2.c
	$(CC) -o shift2 shift2.c

latency: latency.c
	$(CC) -o latency latency.c

latency2: latency2.c
	$(CC) -o latency2 latency2.c

slice: slice.c
	$(CC) -o slice slice.c

slice2: slice2.c
	$(CC) -o slice2 slice2.c

cmov: cmov.c
	$(CC) -o cmov cmov.c

cmov2: cmov2.c
	$(CC) -o cmov2 cmov2.c

cmov3: cmov3.c
	$(CC) -o cmov3 cmov3.c

cmov4: cmov4.c cmov4.s
	$(CC) -o cmov4 cmov4.c cmov4.s

cmov4.s: cmov4.q
	qhasm-amd64 < cmov4.q > cmov4.s

cmov5: cmov5.c cmov4.s
	$(CC) -o cmov5 cmov5.c cmov4.s

cmov6: cmov6.c cmov4.s
	$(CC) -o cmov6 cmov6.c cmov4.s

cmov7.s: cmov7.q
	qhasm-amd64 < cmov7.q > cmov7.s

cmov7: cmov7.c cmov7.s cpucycles.c
	$(CC) -o cmov7 cmov7.c cmov7.s cpucycles.c

cmov8.s: cmov8.q
	qhasm-amd64 < cmov8.q > cmov8.s

cmov8: cmov8.c cmov8.s cpucycles.c
	$(CC) -o cmov8 cmov8.c cmov8.s cpucycles.c

cmov9.s: cmov9.q
	qhasm-amd64 < cmov9.q > cmov9.s

cmov9: cmov9.c cmov8.s cmov9.s cpucycles.c
	$(CC) -o cmov9 cmov9.c cmov8.s cmov9.s cpucycles.c

cmova.q: cmova.py
	python3 cmova.py > cmova.q

cmova.s: cmova.q
	qhasm-amd64 < cmova.q > cmova.s

cmova: cmova.c cmov8.s cmov9.s cpucycles.c mul2x2s128_25519.s muls64xs64.s fpcneg25519.s fpadd25519.s fpmul25519.s cmova.s
	$(CC) -o cmova -no-pie cmova.c cmov8.s cmov9.s cpucycles.c mul2x2s128_25519.s muls64xs64.s fpcneg25519.s fpadd25519.s fpmul25519.s cmova.s

cmovb.s: cmovb.q
	qhasm-amd64 < cmovb.q > cmovb.s

cmovb: cmovb.c cmov8.s cmovb.s cpucycles.c
	$(CC) -o cmovb cmovb.c cmov8.s cmovb.s cpucycles.c

cmovc.s: cmovc.q
	qhasm-amd64 < cmovc.q > cmovc.s

cmovc: cmovc.c cmovc.s cpucycles.c
	$(CC) -o cmovc cmovc.c cmovc.s cpucycles.c

cmovd.s: cmovd.q
	qhasm-amd64 < cmovd.q > cmovd.s

cmovd: cmovd.c cmovd.s cpucycles.c
	$(CC) -o cmovd cmovd.c cmovd.s cpucycles.c

cmove.q: cmove.py
	python3 cmove.py > cmove.q

cmove.s: cmove.q
	qhasm-amd64 < cmove.q > cmove.s

cmove: cmove.c cmove.s cpucycles.c
	$(CC) -o cmove cmove.c cmove.s cpucycles.c

cmovf.q: cmovf.py
	python3 cmovf.py > cmovf.q

cmovf.s: cmovf.q
	qhasm-amd64 < cmovf.q > cmovf.s

cmovf: cmovf.c cmovf.s cpucycles.c
	$(CC) -o cmovf cmovf.c cmovf.s cpucycles.c

cmovg.q: cmovg.py
	python3 cmovg.py > cmovg.q

cmovg.s: cmovg.q
	qhasm-amd64 < cmovg.q > cmovg.s

cmovg: cmovg.c cmovg.s cpucycles.c
	$(CC) -o cmovg cmovg.c cmovg.s cpucycles.c

cmovh.q: cmovh.py
	python3 cmovh.py > cmovh.q

cmovh.s: cmovh.q
	qhasm-amd64 < cmovh.q > cmovh.s

cmovh: cmovh.c cmovh.s cpucycles.c
	$(CC) -o cmovh cmovh.c cmovh.s cpucycles.c

cmovi.q: cmovi.py
	python3 cmovi.py > cmovi.q

cmovi.s: cmovi.q
	qhasm-amd64 < cmovi.q > cmovi.s

cmovi: cmovi.c cmovi.s cpucycles.c
	$(CC) -o cmovi cmovi.c cmovi.s cpucycles.c

cmovj.q: cmovj.py
	python3 cmovj.py > cmovj.q

cmovj.s: cmovj.q
	qhasm-amd64 < cmovj.q > cmovj.s

cmovj: cmovj.c cmovj.s cpucycles.c
	$(CC) -o cmovj cmovj.c cmovj.s cpucycles.c

cmovk.q: cmovk.py
	python3 cmovk.py > cmovk.q

cmovk.s: cmovk.q
	qhasm-amd64 < cmovk.q > cmovk.s

cmovk: cmovk.c cmovk.s cpucycles.c
	$(CC) -o cmovk cmovk.c cmovk.s cpucycles.c

cmovl.q: cmovl.py
	python3 cmovl.py > cmovl.q

cmovl.s: cmovl.q
	qhasm-amd64 < cmovl.q > cmovl.s

cmovl: cmovl.c cmovl.s cpucycles.c
	$(CC) -o cmovl cmovl.c cmovl.s cpucycles.c

cmovm.q: cmovm.py
	python3 cmovm.py > cmovm.q

cmovm.s: cmovm.q
	qhasm-amd64 < cmovm.q > cmovm.s

cmovm: cmovm.o cmovm.s cpucycles.o
	$(CC) -o cmovm cmovm.o cmovm.s cpucycles.o

cmovm.o: cmovm.c
	$(CC) -c cmovm.c

cmovn.q: cmovn.py
	python3 cmovn.py > cmovn.q

cmovn.s: cmovn.q
	qhasm-amd64 < cmovn.q > cmovn.s

cmovn: cmovn.o cmovn.s cpucycles.o
	$(CC) -o cmovn cmovn.o cmovn.s cpucycles.o

cmovn.o: cmovn.c
	$(CC) -c cmovn.c

cmovo.q: cmovo.py
	python3 cmovo.py > cmovo.q

cmovo.s: cmovo.q
	qhasm-amd64 < cmovo.q > cmovo.s

cmovo: cmovo.o cmovo.s cpucycles.o
	$(CC) -o cmovo cmovo.o cmovo.s cpucycles.o

cmovp.o: cmovp.c
	$(CC) -c cmovp.c

cmovp.q: cmovp.py
	python3 cmovp.py > cmovp.q

cmovp.s: cmovp.q
	qhasm-amd64 < cmovp.q > cmovp.s

cmovp: cmovp.o cmovp.s cpucycles.o
	$(CC) -o cmovp cmovp.o cmovp.s cpucycles.o

mont0.o: mont0.c
	$(CC) -c mont0.c

mont0.q: mont0.py
	python3 mont0.py > mont0.q

mont0.s: mont0.q
	qhasm-amd64 < mont0.q > mont0.s

mont0: mont0.o mont0.s cpucycles.o
	$(CC) -o mont0 mont0.o mont0.s cpucycles.o

mont1.o: mont1.c
	$(CC) -c mont1.c

mont1.q: mont1.py
	python3 mont1.py > mont1.q

mont1.s: mont1.q
	qhasm-amd64 < mont1.q > mont1.s

mont1: mont1.o mont1.s cpucycles.o
	$(CC) -o mont1 mont1.o mont1.s cpucycles.o

mont2.o: mont2.c
	$(CC) -c mont2.c

mont2.q: mont2.py
	python3 mont2.py > mont2.q

mont2.s: mont2.q
	qhasm-amd64 < mont2.q > mont2.s

mont2: mont2.o mont2.s cpucycles.o
	$(CC) -o mont2 mont2.o mont2.s cpucycles.o

mont3.o: mont3.c
	$(CC) -c mont3.c

mont3.q: mont3.py
	python3 mont3.py > mont3.q

mont3.s: mont3.q
	qhasm-amd64 < mont3.q > mont3.s

mont3: mont3.o mont3.s cpucycles.o
	$(CC) -o mont3 mont3.o mont3.s cpucycles.o

mont4.o: mont4.c
	$(CC) -c mont4.c

mont4.q: mont4.py
	python3 mont4.py > mont4.q

mont4.s: mont4.q
	qhasm-amd64 < mont4.q > mont4.s

mont4: mont4.o mont4.s cpucycles.o
	$(CC) -o mont4 mont4.o mont4.s cpucycles.o

mont5.o: mont5.c
	$(CC) -c mont5.c

mont5.q: mont5.py
	python3 mont5.py 511 > mont5.q

mont5.s: mont5.q
	qhasm-amd64 < mont5.q > mont5.s

mont5: mont5.o mont5.s cpucycles.o
	$(CC) -o mont5 mont5.o mont5.s cpucycles.o

mont5a.o: mont5a.c
	$(CC) -c mont5a.c

mont5a.q: mont5.py
	python3 mont5.py 1024 > mont5a.q

mont5a.s: mont5a.q
	qhasm-amd64 < mont5a.q > mont5a.s

mont5a: mont5a.o mont5a.s cpucycles.o
	$(CC) -o mont5a mont5a.o mont5a.s cpucycles.o

mont5b.o: mont5b.c
	$(CC) -c mont5b.c

mont5b.q: mont5.py
	python3 mont5.py 2048 > mont5b.q

mont5b.s: mont5b.q
	qhasm-amd64 < mont5b.q > mont5b.s

mont5b: mont5b.o mont5b.s cpucycles.o
	$(CC) -o mont5b mont5b.o mont5b.s cpucycles.o

mont5c.o: mont5c.c
	$(CC) -c mont5c.c

mont5c.q: mont5.py
	python3 mont5.py 192 > mont5c.q

mont5c.s: mont5c.q
	qhasm-amd64 < mont5c.q > mont5c.s

mont5c: mont5c.o mont5c.s cpucycles.o
	$(CC) -o mont5c mont5c.o mont5c.s cpucycles.o

mont5d.o: mont5d.c
	$(CC) -c mont5d.c

mont5d.q: mont5.py
	python3 mont5.py 256 > mont5d.q

mont5d.s: mont5d.q
	qhasm-amd64 < mont5d.q > mont5d.s

mont5d: mont5d.o mont5d.s cpucycles.o
	$(CC) -o mont5d mont5d.o mont5d.s cpucycles.o


mont5-new.o: mont5-new.c
	$(CC) -c mont5-new.c

mont5-new: mont5-new.o mont5.s cpucycles.o
	$(CC) -o mont5-new mont5-new.o mont5.s cpucycles.o -lgmp


cpucycles.o: cpucycles.c
	$(CC) -c cpucycles.c

loop: loop.c loop.s
	$(CC) -o loop loop.c loop.s

loop.s: loop.q
	qhasm-amd64 < loop.q > loop.s

loop.q: loop.q.py
	./loop.q.py > loop.q
