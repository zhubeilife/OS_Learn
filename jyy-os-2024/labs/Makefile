# ----- DO NOT MODIFY -----

ifeq ($(NAME),)
$(error Should make in each lab's directory)
endif

OS_NAME := $(shell uname -s | tr A-Z a-z) #linux darwin

SRCS   := $(shell find . -maxdepth 1 -name "*.c")
DEPS   := $(shell find . -maxdepth 1 -name "*.h") $(SRCS)
CFLAGS += -O1 -std=gnu11 -ggdb -Wall -Werror -Wno-unused-result -Wno-unused-value -Wno-unused-variable

.PHONY: all git test clean commit-and-make

.DEFAULT_GOAL := commit-and-make
commit-and-make: git all

$(NAME): $(DEPS) # native binary
	gcc $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(NAME)-64: $(DEPS) # 64bit binary
	gcc -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(NAME)-32: $(DEPS) # 32bit binary
	gcc -m32 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(NAME).so: $(DEPS) # 64bit shared library
	gcc -fPIC -shared $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(NAME)-64.so: $(DEPS) # 64bit shared library
	gcc -fPIC -shared -m64 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(NAME)-32.so: $(DEPS) # 32bit shared library
	gcc -fPIC -shared -m32 $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

run: $(NAME)
	./$(NAME)

clean:
	rm -f $(NAME)-64 $(NAME)-32 $(NAME)-64.so $(NAME)-32.so

#include ../oslabs.mk
