export MOSAIC_HOME := $(PWD)/../../mosaic

m-print:
	python3.10 $(MOSAIC_HOME)/mosaic.py --check print.py | python3.10 $(MOSAIC_HOME)/vis/__main__.py | browser
