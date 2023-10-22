a.out: minimal.S
	gcc -S minimal.S > minimal.s
	as minimal.s -o minimal.o
	ld minimal.o

step:
	#gcc -E hello.c
	gcc -c hello.c
	ld hello.o -e main