
sum:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 2f 00 00 	mov    0x2fc5(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <printf@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <__assert_fail@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <__assert_fail@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <pthread_create@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <pthread_create@GLIBC_2.34>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <__cxa_atexit@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4018 <__cxa_atexit@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <pthread_join@plt>:
    1070:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 4020 <pthread_join@GLIBC_2.34>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001080 <__cxa_finalize@plt>:
    1080:	ff 25 5a 2f 00 00    	jmp    *0x2f5a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1086:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001090 <_start>:
    1090:	31 ed                	xor    %ebp,%ebp
    1092:	49 89 d1             	mov    %rdx,%r9
    1095:	5e                   	pop    %rsi
    1096:	48 89 e2             	mov    %rsp,%rdx
    1099:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    109d:	50                   	push   %rax
    109e:	54                   	push   %rsp
    109f:	45 31 c0             	xor    %r8d,%r8d
    10a2:	31 c9                	xor    %ecx,%ecx
    10a4:	48 8d 3d e9 02 00 00 	lea    0x2e9(%rip),%rdi        # 1394 <main>
    10ab:	ff 15 0f 2f 00 00    	call   *0x2f0f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    10b1:	f4                   	hlt
    10b2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10b9:	00 00 00 
    10bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010c0 <deregister_tm_clones>:
    10c0:	48 8d 3d 71 2f 00 00 	lea    0x2f71(%rip),%rdi        # 4038 <__TMC_END__>
    10c7:	48 8d 05 6a 2f 00 00 	lea    0x2f6a(%rip),%rax        # 4038 <__TMC_END__>
    10ce:	48 39 f8             	cmp    %rdi,%rax
    10d1:	74 15                	je     10e8 <deregister_tm_clones+0x28>
    10d3:	48 8b 05 ee 2e 00 00 	mov    0x2eee(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10da:	48 85 c0             	test   %rax,%rax
    10dd:	74 09                	je     10e8 <deregister_tm_clones+0x28>
    10df:	ff e0                	jmp    *%rax
    10e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10e8:	c3                   	ret
    10e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010f0 <register_tm_clones>:
    10f0:	48 8d 3d 41 2f 00 00 	lea    0x2f41(%rip),%rdi        # 4038 <__TMC_END__>
    10f7:	48 8d 35 3a 2f 00 00 	lea    0x2f3a(%rip),%rsi        # 4038 <__TMC_END__>
    10fe:	48 29 fe             	sub    %rdi,%rsi
    1101:	48 89 f0             	mov    %rsi,%rax
    1104:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1108:	48 c1 f8 03          	sar    $0x3,%rax
    110c:	48 01 c6             	add    %rax,%rsi
    110f:	48 d1 fe             	sar    %rsi
    1112:	74 14                	je     1128 <register_tm_clones+0x38>
    1114:	48 8b 05 bd 2e 00 00 	mov    0x2ebd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    111b:	48 85 c0             	test   %rax,%rax
    111e:	74 08                	je     1128 <register_tm_clones+0x38>
    1120:	ff e0                	jmp    *%rax
    1122:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1128:	c3                   	ret
    1129:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001130 <__do_global_dtors_aux>:
    1130:	f3 0f 1e fa          	endbr64
    1134:	80 3d 05 2f 00 00 00 	cmpb   $0x0,0x2f05(%rip)        # 4040 <completed.0>
    113b:	75 2b                	jne    1168 <__do_global_dtors_aux+0x38>
    113d:	55                   	push   %rbp
    113e:	48 83 3d 9a 2e 00 00 	cmpq   $0x0,0x2e9a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1145:	00 
    1146:	48 89 e5             	mov    %rsp,%rbp
    1149:	74 0c                	je     1157 <__do_global_dtors_aux+0x27>
    114b:	48 8b 3d de 2e 00 00 	mov    0x2ede(%rip),%rdi        # 4030 <__dso_handle>
    1152:	e8 29 ff ff ff       	call   1080 <__cxa_finalize@plt>
    1157:	e8 64 ff ff ff       	call   10c0 <deregister_tm_clones>
    115c:	c6 05 dd 2e 00 00 01 	movb   $0x1,0x2edd(%rip)        # 4040 <completed.0>
    1163:	5d                   	pop    %rbp
    1164:	c3                   	ret
    1165:	0f 1f 00             	nopl   (%rax)
    1168:	c3                   	ret
    1169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001170 <frame_dummy>:
    1170:	f3 0f 1e fa          	endbr64
    1174:	e9 77 ff ff ff       	jmp    10f0 <register_tm_clones>

0000000000001179 <wrapper_>:
    1179:	55                   	push   %rbp
    117a:	48 89 e5             	mov    %rsp,%rbp
    117d:	48 83 ec 20          	sub    $0x20,%rsp
    1181:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1185:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1189:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    118d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1191:	48 8b 50 10          	mov    0x10(%rax),%rdx
    1195:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1199:	8b 00                	mov    (%rax),%eax
    119b:	89 c7                	mov    %eax,%edi
    119d:	ff d2                	call   *%rdx
    119f:	b8 00 00 00 00       	mov    $0x0,%eax
    11a4:	c9                   	leave
    11a5:	c3                   	ret

00000000000011a6 <create>:
    11a6:	55                   	push   %rbp
    11a7:	48 89 e5             	mov    %rsp,%rbp
    11aa:	48 83 ec 30          	sub    $0x30,%rsp
    11ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    11b2:	8b 05 c8 ae 01 00    	mov    0x1aec8(%rip),%eax        # 1c080 <n_>
    11b8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    11bd:	76 28                	jbe    11e7 <create+0x41>
    11bf:	48 8d 05 ce 0e 00 00 	lea    0xece(%rip),%rax        # 2094 <__PRETTY_FUNCTION__.0>
    11c6:	48 89 c1             	mov    %rax,%rcx
    11c9:	ba 29 00 00 00       	mov    $0x29,%edx
    11ce:	48 8d 05 33 0e 00 00 	lea    0xe33(%rip),%rax        # 2008 <_IO_stdin_used+0x8>
    11d5:	48 89 c6             	mov    %rax,%rsi
    11d8:	48 8d 05 89 0e 00 00 	lea    0xe89(%rip),%rax        # 2068 <_IO_stdin_used+0x68>
    11df:	48 89 c7             	mov    %rax,%rdi
    11e2:	e8 59 fe ff ff       	call   1040 <__assert_fail@plt>
    11e7:	8b 15 93 ae 01 00    	mov    0x1ae93(%rip),%edx        # 1c080 <n_>
    11ed:	8b 05 8d ae 01 00    	mov    0x1ae8d(%rip),%eax        # 1c080 <n_>
    11f3:	8d 78 01             	lea    0x1(%rax),%edi
    11f6:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    11fa:	48 63 ca             	movslq %edx,%rcx
    11fd:	48 89 c8             	mov    %rcx,%rax
    1200:	48 01 c0             	add    %rax,%rax
    1203:	48 01 c8             	add    %rcx,%rax
    1206:	48 c1 e0 03          	shl    $0x3,%rax
    120a:	48 89 c1             	mov    %rax,%rcx
    120d:	48 8d 05 6c 2e 00 00 	lea    0x2e6c(%rip),%rax        # 4080 <threads_>
    1214:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1218:	0f 11 04 01          	movups %xmm0,(%rcx,%rax,1)
    121c:	66 0f d6 44 01 10    	movq   %xmm0,0x10(%rcx,%rax,1)
    1222:	48 63 ca             	movslq %edx,%rcx
    1225:	48 89 c8             	mov    %rcx,%rax
    1228:	48 01 c0             	add    %rax,%rax
    122b:	48 01 c8             	add    %rcx,%rax
    122e:	48 c1 e0 03          	shl    $0x3,%rax
    1232:	48 89 c1             	mov    %rax,%rcx
    1235:	48 8d 05 44 2e 00 00 	lea    0x2e44(%rip),%rax        # 4080 <threads_>
    123c:	89 3c 01             	mov    %edi,(%rcx,%rax,1)
    123f:	48 63 ca             	movslq %edx,%rcx
    1242:	48 89 c8             	mov    %rcx,%rax
    1245:	48 01 c0             	add    %rax,%rax
    1248:	48 01 c8             	add    %rcx,%rax
    124b:	48 c1 e0 03          	shl    $0x3,%rax
    124f:	48 89 c1             	mov    %rax,%rcx
    1252:	48 8d 05 2b 2e 00 00 	lea    0x2e2b(%rip),%rax        # 4084 <threads_+0x4>
    1259:	c7 04 01 01 00 00 00 	movl   $0x1,(%rcx,%rax,1)
    1260:	48 63 d2             	movslq %edx,%rdx
    1263:	48 89 d0             	mov    %rdx,%rax
    1266:	48 01 c0             	add    %rax,%rax
    1269:	48 01 d0             	add    %rdx,%rax
    126c:	48 c1 e0 03          	shl    $0x3,%rax
    1270:	48 89 c2             	mov    %rax,%rdx
    1273:	48 8d 05 16 2e 00 00 	lea    0x2e16(%rip),%rax        # 4090 <threads_+0x10>
    127a:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    127e:	8b 05 fc ad 01 00    	mov    0x1adfc(%rip),%eax        # 1c080 <n_>
    1284:	48 63 d0             	movslq %eax,%rdx
    1287:	48 89 d0             	mov    %rdx,%rax
    128a:	48 01 c0             	add    %rax,%rax
    128d:	48 01 d0             	add    %rdx,%rax
    1290:	48 c1 e0 03          	shl    $0x3,%rax
    1294:	48 8d 15 e5 2d 00 00 	lea    0x2de5(%rip),%rdx        # 4080 <threads_>
    129b:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
    129f:	8b 05 db ad 01 00    	mov    0x1addb(%rip),%eax        # 1c080 <n_>
    12a5:	48 63 d0             	movslq %eax,%rdx
    12a8:	48 89 d0             	mov    %rdx,%rax
    12ab:	48 01 c0             	add    %rax,%rax
    12ae:	48 01 d0             	add    %rdx,%rax
    12b1:	48 c1 e0 03          	shl    $0x3,%rax
    12b5:	48 8d 15 c4 2d 00 00 	lea    0x2dc4(%rip),%rdx        # 4080 <threads_>
    12bc:	48 01 d0             	add    %rdx,%rax
    12bf:	48 83 c0 08          	add    $0x8,%rax
    12c3:	48 8d 15 af fe ff ff 	lea    -0x151(%rip),%rdx        # 1179 <wrapper_>
    12ca:	be 00 00 00 00       	mov    $0x0,%esi
    12cf:	48 89 c7             	mov    %rax,%rdi
    12d2:	e8 79 fd ff ff       	call   1050 <pthread_create@plt>
    12d7:	8b 05 a3 ad 01 00    	mov    0x1ada3(%rip),%eax        # 1c080 <n_>
    12dd:	83 c0 01             	add    $0x1,%eax
    12e0:	89 05 9a ad 01 00    	mov    %eax,0x1ad9a(%rip)        # 1c080 <n_>
    12e6:	90                   	nop
    12e7:	c9                   	leave
    12e8:	c3                   	ret

00000000000012e9 <join>:
    12e9:	55                   	push   %rbp
    12ea:	48 89 e5             	mov    %rsp,%rbp
    12ed:	48 83 ec 10          	sub    $0x10,%rsp
    12f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12f8:	eb 51                	jmp    134b <join+0x62>
    12fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12fd:	48 63 d0             	movslq %eax,%rdx
    1300:	48 89 d0             	mov    %rdx,%rax
    1303:	48 01 c0             	add    %rax,%rax
    1306:	48 01 d0             	add    %rdx,%rax
    1309:	48 c1 e0 03          	shl    $0x3,%rax
    130d:	48 8d 15 6c 2d 00 00 	lea    0x2d6c(%rip),%rdx        # 4080 <threads_>
    1314:	48 01 d0             	add    %rdx,%rax
    1317:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    131b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    131f:	8b 40 04             	mov    0x4(%rax),%eax
    1322:	83 f8 01             	cmp    $0x1,%eax
    1325:	75 20                	jne    1347 <join+0x5e>
    1327:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    132b:	48 8b 40 08          	mov    0x8(%rax),%rax
    132f:	be 00 00 00 00       	mov    $0x0,%esi
    1334:	48 89 c7             	mov    %rax,%rdi
    1337:	e8 34 fd ff ff       	call   1070 <pthread_join@plt>
    133c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1340:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    1347:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    134b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    134e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1353:	76 a5                	jbe    12fa <join+0x11>
    1355:	90                   	nop
    1356:	90                   	nop
    1357:	c9                   	leave
    1358:	c3                   	ret

0000000000001359 <startup>:
    1359:	55                   	push   %rbp
    135a:	48 89 e5             	mov    %rsp,%rbp
    135d:	48 8d 05 85 ff ff ff 	lea    -0x7b(%rip),%rax        # 12e9 <join>
    1364:	48 89 c7             	mov    %rax,%rdi
    1367:	e8 94 00 00 00       	call   1400 <atexit>
    136c:	90                   	nop
    136d:	5d                   	pop    %rbp
    136e:	c3                   	ret

000000000000136f <T_sum>:
    136f:	55                   	push   %rbp                  # 保存基指针寄存器（rbp）的旧值到栈上
    1370:	48 89 e5             	mov    %rsp,%rbp             # 将栈指针寄存器（rsp）的值移动到基指针寄存器（rbp）
    1373:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)       # 初始化循环计数器,
    137a:	eb 0b                	jmp    1387 <T_sum+0x18>     # 无条件跳转到地址`<T_sum+0x18>` (即地址1387)
    137c:	48 ff 05 dd 2c 00 00 	incq   0x2cdd(%rip)          # 4060 <sum>, 对位置`rip+0x2cdd`（寄存器中的地址并加上0x2cdd的值，即对总和sum假设的内存地址）的内容加1
    1383:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)       # 循环计数器加1
    1387:	81 7d fc ff e0 f5 05 	cmpl   $0x5f5e0ff,-0x4(%rbp) # 循环计数器小于0x5f5e0ff(10000000)
    138e:	7e ec                	jle    137c <T_sum+0xd>      # 若循环计数器小于0x5f5e0ff，则跳转到地址`<T_sum+0xd>` (即地址137c)
    1390:	90                   	nop
    1391:	90                   	nop
    1392:	5d                   	pop    %rbp                  # 恢复基指针寄存器（rbp）的旧值
    1393:	c3                   	ret

0000000000001394 <main>:
    1394:	55                   	push   %rbp
    1395:	48 89 e5             	mov    %rsp,%rbp
    1398:	48 8d 05 d0 ff ff ff 	lea    -0x30(%rip),%rax        # 136f <T_sum>
    139f:	48 89 c7             	mov    %rax,%rdi
    13a2:	e8 ff fd ff ff       	call   11a6 <create>
    13a7:	48 8d 05 c1 ff ff ff 	lea    -0x3f(%rip),%rax        # 136f <T_sum>
    13ae:	48 89 c7             	mov    %rax,%rdi
    13b1:	e8 f0 fd ff ff       	call   11a6 <create>
    13b6:	b8 00 00 00 00       	mov    $0x0,%eax
    13bb:	e8 29 ff ff ff       	call   12e9 <join>
    13c0:	48 8b 05 99 2c 00 00 	mov    0x2c99(%rip),%rax        # 4060 <sum>
    13c7:	48 89 c6             	mov    %rax,%rsi
    13ca:	48 8d 05 ad 0c 00 00 	lea    0xcad(%rip),%rax        # 207e <_IO_stdin_used+0x7e>
    13d1:	48 89 c7             	mov    %rax,%rdi
    13d4:	b8 00 00 00 00       	mov    $0x0,%eax
    13d9:	e8 52 fc ff ff       	call   1030 <printf@plt>
    13de:	be 00 c2 eb 0b       	mov    $0xbebc200,%esi
    13e3:	48 8d 05 9f 0c 00 00 	lea    0xc9f(%rip),%rax        # 2089 <_IO_stdin_used+0x89>
    13ea:	48 89 c7             	mov    %rax,%rdi
    13ed:	b8 00 00 00 00       	mov    $0x0,%eax
    13f2:	e8 39 fc ff ff       	call   1030 <printf@plt>
    13f7:	b8 00 00 00 00       	mov    $0x0,%eax
    13fc:	5d                   	pop    %rbp
    13fd:	c3                   	ret
    13fe:	66 90                	xchg   %ax,%ax

0000000000001400 <atexit>:
    1400:	48 8b 15 29 2c 00 00 	mov    0x2c29(%rip),%rdx        # 4030 <__dso_handle>
    1407:	31 f6                	xor    %esi,%esi
    1409:	e9 52 fc ff ff       	jmp    1060 <__cxa_atexit@plt>

Disassembly of section .fini:

0000000000001410 <_fini>:
    1410:	48 83 ec 08          	sub    $0x8,%rsp
    1414:	48 83 c4 08          	add    $0x8,%rsp
    1418:	c3                   	ret
