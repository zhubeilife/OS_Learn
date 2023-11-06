mbr.img: mbr.S
	x86_64-elf-gcc -ggdb -c $<
	x86_64-elf-ld mbr.o -Ttext 0x7c00
	x86_64-elf-objcopy -S -O binary -j .text a.out $@

run: mbr.img
	qemu-system-x86_64 $<

debug: mbr.img
	qemu-system-x86_64 -s -S $< &  # Run QEMU in background, -S not start code, -s start gdb server
	x86_64-elf-gdb -x init.gdb  # RTFM: gdb (1)

clean:
	rm -f *.img *.o a.out