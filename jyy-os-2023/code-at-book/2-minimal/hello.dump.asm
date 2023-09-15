
a.out:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100003f7c <_main>:
100003f7c: fd 7b bf a9 	stp	x29, x30, [sp, #-16]!
100003f80: fd 03 00 91 	mov	x29, sp
100003f84: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x8>
100003f88: 00 a0 3e 91 	add	x0, x0, #4008
100003f8c: 04 00 00 94 	bl	0x100003f9c <_printf+0x100003f9c>
100003f90: 00 00 80 52 	mov	w0, #0
100003f94: fd 7b c1 a8 	ldp	x29, x30, [sp], #16
100003f98: c0 03 5f d6 	ret

Disassembly of section __TEXT,__stubs:

0000000100003f9c <__stubs>:
100003f9c: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4>
100003fa0: 10 02 40 f9 	ldr	x16, [x16]
100003fa4: 00 02 1f d6 	br	x16
