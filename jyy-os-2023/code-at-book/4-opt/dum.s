
compiler-opt.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <spin_1>:
   0:	c3                   	ret
   1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   8:	00 00 00 00 
   c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000010 <spin_2>:
  10:	c7 44 24 fc 00 00 00 	movl   $0x0,-0x4(%rsp)
  17:	00 
  18:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
  1c:	83 f8 63             	cmp    $0x63,%eax
  1f:	7f 1b                	jg     3c <spin_2+0x2c>
  21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  28:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
  2c:	83 c0 01             	add    $0x1,%eax
  2f:	89 44 24 fc          	mov    %eax,-0x4(%rsp)
  33:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
  37:	83 f8 63             	cmp    $0x63,%eax
  3a:	7e ec                	jle    28 <spin_2+0x18>
  3c:	c3                   	ret
  3d:	0f 1f 00             	nopl   (%rax)

0000000000000040 <return_1>:
  40:	b8 64 00 00 00       	mov    $0x64,%eax
  45:	ba 01 00 00 00       	mov    $0x1,%edx
  4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  50:	83 e8 01             	sub    $0x1,%eax
  53:	75 fb                	jne    50 <return_1+0x10>
  55:	89 d0                	mov    %edx,%eax
  57:	c3                   	ret
  58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  5f:	00 

0000000000000060 <return_1_volatile>:
  60:	b8 64 00 00 00       	mov    $0x64,%eax
  65:	0f 1f 00             	nopl   (%rax)
  68:	ba 01 00 00 00       	mov    $0x1,%edx
  6d:	83 e8 01             	sub    $0x1,%eax
  70:	75 f6                	jne    68 <return_1_volatile+0x8>
  72:	89 d0                	mov    %edx,%eax
  74:	c3                   	ret
  75:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  7c:	00 00 00 00 

0000000000000080 <foo>:
  80:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  86:	b8 01 00 00 00       	mov    $0x1,%eax
  8b:	c3                   	ret
  8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000090 <foo_func_call>:
  90:	53                   	push   %rbx
  91:	31 c0                	xor    %eax,%eax
  93:	48 89 fb             	mov    %rdi,%rbx
  96:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  9c:	e8 00 00 00 00       	call   a1 <foo_func_call+0x11>
  a1:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
  a7:	b8 01 00 00 00       	mov    $0x1,%eax
  ac:	5b                   	pop    %rbx
  ad:	c3                   	ret
  ae:	66 90                	xchg   %ax,%ax

00000000000000b0 <foo_volatile>:
  b0:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  b6:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  bc:	8b 07                	mov    (%rdi),%eax
  be:	c3                   	ret
  bf:	90                   	nop

00000000000000c0 <foo_volatile2>:
  c0:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
  c5:	48 8b 44 24 f8       	mov    -0x8(%rsp),%rax
  ca:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  d0:	48 8b 44 24 f8       	mov    -0x8(%rsp),%rax
  d5:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  db:	48 8b 44 24 f8       	mov    -0x8(%rsp),%rax
  e0:	8b 00                	mov    (%rax),%eax
  e2:	c3                   	ret
  e3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  ea:	00 00 00 00 
  ee:	66 90                	xchg   %ax,%ax

00000000000000f0 <foo_barrier>:
  f0:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  f6:	b8 01 00 00 00       	mov    $0x1,%eax
  fb:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
 101:	c3                   	ret
