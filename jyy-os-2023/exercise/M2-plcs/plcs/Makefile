NAME := $(shell basename $(PWD))
export MODULE := M2
all: $(NAME)-64 $(NAME)-32
LDFLAGS += -lpthread

include ../../Makefile

test-1:$(NAME)-64
	cat test_1 | time ./$(NAME)-64

test-2:$(NAME)-64
	cat test_2 | time ./$(NAME)-64