SRCS := start.S main.c

python_version_full := $(wordlist 2,4,$(subst ., ,$(shell python3 --version 2>&1)))
python_version_major := $(word 1,${python_version_full})
python_version_minor := $(word 2,${python_version_full})
python_version_patch := $(word 3,${python_version_full})

# a directly way to fix ubuntu18 python version is 3.6
ifeq ($(python_version_minor),6)
	PYTHON := python3.11
else
	PYTHON := python3
endif

bootblock.o: $(SRCS) Makefile
	@echo + CC $(SRCS)
	@$(CROSS_COMPILE)gcc -static -m32 -fno-pic -Os -nostdlib -Ttext 0x7c00 -I$(AM_HOME)/am/src -o bootblock.o $(SRCS)
	@$(PYTHON) genboot.py bootblock.o

clean:
	rm -rf *.o
