export MOSAIC_HOME := $(PWD)/../../mosaic-copy

m-model:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check model.py | python3.10 $(MOSAIC_HOME)/vis/__main__.py | browser

hello:
	gcc -fdiagnostics-color=always -ggdb -Wall hello.c