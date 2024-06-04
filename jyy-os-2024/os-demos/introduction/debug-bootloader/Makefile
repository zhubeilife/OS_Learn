include ../../common.mk

NAME := hello
SRCS := hello.c
export ARCH := x86-qemu

include $(AM_HOME)/Makefile

debug:
	qemu-system-i386 -s -S -machine accel=tcg -smp "1,sockets=1" \
		-drive format=raw,file=build/hello-x86-qemu &
	gdb -x debug.py

debug_run:
	qemu-system-i386 -nographic -s -S -machine accel=tcg -smp "1,sockets=1" \
		-drive format=raw,file=build/hello-x86-qemu

debug_debug:
	gdb -x debug.py

log:
	make -nB \
	     | grep -ve '^\(\#\|echo\|mkdir\|make\)' \
	     | sed "s#$(AM_HOME)#\AM#g" \
	     | sed "s#$(PWD)#.#g" | tr ' ' '\
	     ' \
	     > compile.log
		# or use vim -
