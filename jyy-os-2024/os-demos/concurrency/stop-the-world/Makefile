include ../../common.mk
cli: cli.c
	gcc -O2 -g -o $@ $<

NAME := cli
SRCS := cli.c
export ARCH := x86_64-qemu

-include $(AM_HOME)/Makefile

debug:
	qemu-system-x86_64 -s -S -machine accel=tcg -smp "1,sockets=1" \
		-drive format=raw,file=build/cli-x86_64-qemu &
	gdb -x debug.py
