a.out: minimal.S
	gcc -S minimal.S > minimal_S.s
	as minimal_S.s -o minimal.o
	ld minimal.o

gcc-demo:
	strace -f gcc hello.c

xedit-demo:
	strace xedit