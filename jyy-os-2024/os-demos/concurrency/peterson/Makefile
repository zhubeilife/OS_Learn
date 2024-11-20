include ../../common.mk

all: peterson

CFLAGS := -I$(TLIB_PATH) -O2

m-peterson:
	python3 $(MOSAIC)/mosaic.py --check peterson.py | python3 $(MOSAIC)/vis/__main__.py | browse

check-peterson:
	python3.11 $(MOSAIC)/mosaic.py --check peterson.py | grep '"cs": ' | sort | uniq

peterson: peterson.c Makefile
	gcc $(CFLAGS) -o $@ $<

clean:
	rm -f peterson
