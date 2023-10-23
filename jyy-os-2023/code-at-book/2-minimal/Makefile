a.out: minimal.S
	gcc -c minimal.S
	ld minimal.o

detail.out:
	gcc -E minimal.S -o minimal.s
	as minimal.s -o minimal.o
	ld minimal.o

step:
	#gcc -E hello.c
	gcc -c hello.c
	ld hello.o -e main

clean:
	rm -f minimal.o a.out