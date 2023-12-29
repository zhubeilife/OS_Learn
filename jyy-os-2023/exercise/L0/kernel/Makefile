NAME := kernel
SRCS := kernel.c
export MODULE  := L0
export AM_HOME := $(PWD)/../../../abstract-machine
ifeq ($(ARCH),)
export ARCH := native
endif

include $(AM_HOME)/Makefile
#include ../Makefile.lab
#image: git
