NAME := kernel
SRCS := kernel.c
export MODULE  := L0
export AM_HOME := $(PWD)/../../../abstract-machine
ifeq ($(ARCH),)
export ARCH := native
#export ARCH := x86_64-qemu
endif

include $(AM_HOME)/Makefile
#include ../Makefile.lab
#image: git

mac-run:
	qemu-system-x86_64 -drive format=raw,file=kernel-x86_64-qemu