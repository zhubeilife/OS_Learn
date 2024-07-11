all: mem-model
include ../../common.mk
CFLAGS := -O2 -I$(TLIB_PATH)

mem-model: mem-model.c
	gcc $(CFLAGS) -o $@ $<

clean:
	rm -f mem-model

run: mem-model
	./mem-model | head -n 10000 | sort | uniq -c
