export MOSAIC_HOME := $(PWD)/../../mosaic-copy

m-spin:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check spin.py | python3.10 $(MOSAIC_HOME)/vis/__main__.py | browser

m-peterson:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check peterson.py | python3.10 $(MOSAIC_HOME)/vis/__main__.py | browser

check-peterson:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check peterson.py | grep '"cs": ' | sort | uniq -c

c-peterson: peterson.c
	gcc -ggdb -Wall peterson.c
