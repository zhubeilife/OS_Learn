minimal.img: Makefile
	( echo "eb fe 11 22 33 44" | xxd -r -p; \
	  cat /dev/zero | head -c 504; \
	  echo "55 aa" | xxd -r -p \
	) > minimal.img

run: minimal.img
	qemu-system-x86_64 -monitor stdio $<

run_nographic: minimal.img
	qemu-system-x86_64 -nographic $<

debug: minimal.img
	qemu-system-x86_64 -nographic -s -S $< &
	gdb -x init.gdb

debug_run: minimal.img
	qemu-system-x86_64 -nographic -s -S $< &

debug_gdb:
	gdb -x init.gdb

debug_orbstack:
	gdb-multiarch -x init.gdb.orbstack

clean:
	rm -f *.img

.PHONY: run debug
