NAME := $(shell basename $(PWD))
export MODULE := M1
all: $(NAME)-64 $(NAME)-32

include ../Makefile

pstree-opt: getopt.c
	gcc $(CFLAGS) getopt.c -o $@ $(LDFLAGS)

run: all
	./$(NAME)-64

run-arm: $(NAME)-arm
	./$(NAME)-arm