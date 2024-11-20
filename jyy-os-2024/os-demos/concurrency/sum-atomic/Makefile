include ../../common.mk

all: sum

CFLAGS := -O2 -I$(TLIB_PATH) -I$(TLIB_PATH_HR) -pthread

sum: sum.c Makefile
	gcc $(CFLAGS) -o $@ $<

clean:
	rm -f sum
