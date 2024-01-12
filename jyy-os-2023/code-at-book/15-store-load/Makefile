export MOSAIC_HOME := $(PWD)/../../mosaic

m-store-load:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check store-load.py | python3.10 $(MOSAIC_HOME)/vis/__main__.py | browser

store-load:
	gcc -fdiagnostics-color=always -ggdb -Wall store-load.c -o store-load

run: store-load
	./store-load | head -n 1000000 | sort | uniq -c