NAME := kernel
SRCS := kernel.c
export MODULE  := L0
export AM_HOME := /Users/airmac/Documents/Workspace/OS_Learn/libs/abstract-machine
ifeq ($(ARCH),)
export ARCH := x86_64-qemu
endif

include ../../../libs/abstract-machine/Makefile
#include ../oslabs.mk

kernel_target: image