
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  2a:	68 78 05 00 00       	push   $0x578
  2f:	6a 01                	push   $0x1
  31:	e8 da 03 00 00       	call   410 <printf>
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
  59:	e8 55 02 00 00       	call   2b3 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 8b 05 00 00       	push   $0x58b
  70:	6a 01                	push   $0x1
  72:	e8 99 03 00 00       	call   410 <printf>
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 70 02 00 00       	call   2fb <open>
  8b:	89 c6                	mov    %eax,%esi
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 2f 02 00 00       	call   2db <write>
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 23 02 00 00       	call   2e3 <close>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 95 05 00 00       	push   $0x595
  c8:	6a 01                	push   $0x1
  ca:	e8 41 03 00 00       	call   410 <printf>
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 1e 02 00 00       	call   2fb <open>
  dd:	89 c6                	mov    %eax,%esi
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 d5 01 00 00       	call   2d3 <read>
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 d1 01 00 00       	call   2e3 <close>
 112:	e8 ac 01 00 00       	call   2c3 <wait>
 117:	e8 9f 01 00 00       	call   2bb <exit>

0000011c <strcpy>:
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
 14b:	eb 06                	jmp    153 <strcmp+0x11>
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 ec 00 00 00       	call   2d3 <read>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
 203:	89 de                	mov    %ebx,%esi
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	pushl  0x8(%ebp)
 220:	e8 d6 00 00 00       	call   2fb <open>
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	pushl  0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 d9 00 00 00       	call   313 <fstat>
 23a:	89 c6                	mov    %eax,%esi
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 9f 00 00 00       	call   2e3 <close>
 244:	83 c4 10             	add    $0x10,%esp
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
 263:	eb 10                	jmp    275 <atoi+0x1e>
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
 295:	89 f2                	mov    %esi,%edx
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <fork>:
 2b3:	b8 01 00 00 00       	mov    $0x1,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exit>:
 2bb:	b8 02 00 00 00       	mov    $0x2,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <wait>:
 2c3:	b8 03 00 00 00       	mov    $0x3,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <pipe>:
 2cb:	b8 04 00 00 00       	mov    $0x4,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <read>:
 2d3:	b8 05 00 00 00       	mov    $0x5,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <write>:
 2db:	b8 10 00 00 00       	mov    $0x10,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <close>:
 2e3:	b8 15 00 00 00       	mov    $0x15,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <kill>:
 2eb:	b8 06 00 00 00       	mov    $0x6,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <exec>:
 2f3:	b8 07 00 00 00       	mov    $0x7,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <open>:
 2fb:	b8 0f 00 00 00       	mov    $0xf,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <mknod>:
 303:	b8 11 00 00 00       	mov    $0x11,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <unlink>:
 30b:	b8 12 00 00 00       	mov    $0x12,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <fstat>:
 313:	b8 08 00 00 00       	mov    $0x8,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <link>:
 31b:	b8 13 00 00 00       	mov    $0x13,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <mkdir>:
 323:	b8 14 00 00 00       	mov    $0x14,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <chdir>:
 32b:	b8 09 00 00 00       	mov    $0x9,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <dup>:
 333:	b8 0a 00 00 00       	mov    $0xa,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <getpid>:
 33b:	b8 0b 00 00 00       	mov    $0xb,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sbrk>:
 343:	b8 0c 00 00 00       	mov    $0xc,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sleep>:
 34b:	b8 0d 00 00 00       	mov    $0xd,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <uptime>:
 353:	b8 0e 00 00 00       	mov    $0xe,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <yield>:
 35b:	b8 16 00 00 00       	mov    $0x16,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <shutdown>:
 363:	b8 17 00 00 00       	mov    $0x17,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <putc>:
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	83 ec 1c             	sub    $0x1c,%esp
 371:	88 55 f4             	mov    %dl,-0xc(%ebp)
 374:	6a 01                	push   $0x1
 376:	8d 55 f4             	lea    -0xc(%ebp),%edx
 379:	52                   	push   %edx
 37a:	50                   	push   %eax
 37b:	e8 5b ff ff ff       	call   2db <write>
 380:	83 c4 10             	add    $0x10,%esp
 383:	c9                   	leave  
 384:	c3                   	ret    

00000385 <printint>:
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	57                   	push   %edi
 389:	56                   	push   %esi
 38a:	53                   	push   %ebx
 38b:	83 ec 2c             	sub    $0x2c,%esp
 38e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 391:	89 d0                	mov    %edx,%eax
 393:	89 ce                	mov    %ecx,%esi
 395:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 399:	0f 95 c1             	setne  %cl
 39c:	c1 ea 1f             	shr    $0x1f,%edx
 39f:	84 d1                	test   %dl,%cl
 3a1:	74 44                	je     3e7 <printint+0x62>
 3a3:	f7 d8                	neg    %eax
 3a5:	89 c1                	mov    %eax,%ecx
 3a7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 3ae:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b3:	89 c8                	mov    %ecx,%eax
 3b5:	ba 00 00 00 00       	mov    $0x0,%edx
 3ba:	f7 f6                	div    %esi
 3bc:	89 df                	mov    %ebx,%edi
 3be:	83 c3 01             	add    $0x1,%ebx
 3c1:	0f b6 92 fc 05 00 00 	movzbl 0x5fc(%edx),%edx
 3c8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 3cc:	89 ca                	mov    %ecx,%edx
 3ce:	89 c1                	mov    %eax,%ecx
 3d0:	39 d6                	cmp    %edx,%esi
 3d2:	76 df                	jbe    3b3 <printint+0x2e>
 3d4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3d8:	74 31                	je     40b <printint+0x86>
 3da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3df:	8d 5f 02             	lea    0x2(%edi),%ebx
 3e2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3e5:	eb 17                	jmp    3fe <printint+0x79>
 3e7:	89 c1                	mov    %eax,%ecx
 3e9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3f0:	eb bc                	jmp    3ae <printint+0x29>
 3f2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	e8 6d ff ff ff       	call   36b <putc>
 3fe:	83 eb 01             	sub    $0x1,%ebx
 401:	79 ef                	jns    3f2 <printint+0x6d>
 403:	83 c4 2c             	add    $0x2c,%esp
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    
 40b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 40e:	eb ee                	jmp    3fe <printint+0x79>

00000410 <printf>:
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 1c             	sub    $0x1c,%esp
 419:	8d 45 10             	lea    0x10(%ebp),%eax
 41c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 41f:	be 00 00 00 00       	mov    $0x0,%esi
 424:	bb 00 00 00 00       	mov    $0x0,%ebx
 429:	eb 14                	jmp    43f <printf+0x2f>
 42b:	89 fa                	mov    %edi,%edx
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
 430:	e8 36 ff ff ff       	call   36b <putc>
 435:	eb 05                	jmp    43c <printf+0x2c>
 437:	83 fe 25             	cmp    $0x25,%esi
 43a:	74 25                	je     461 <printf+0x51>
 43c:	83 c3 01             	add    $0x1,%ebx
 43f:	8b 45 0c             	mov    0xc(%ebp),%eax
 442:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 446:	84 c0                	test   %al,%al
 448:	0f 84 20 01 00 00    	je     56e <printf+0x15e>
 44e:	0f be f8             	movsbl %al,%edi
 451:	0f b6 c0             	movzbl %al,%eax
 454:	85 f6                	test   %esi,%esi
 456:	75 df                	jne    437 <printf+0x27>
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	75 ce                	jne    42b <printf+0x1b>
 45d:	89 c6                	mov    %eax,%esi
 45f:	eb db                	jmp    43c <printf+0x2c>
 461:	83 f8 25             	cmp    $0x25,%eax
 464:	0f 84 cf 00 00 00    	je     539 <printf+0x129>
 46a:	0f 8c dd 00 00 00    	jl     54d <printf+0x13d>
 470:	83 f8 78             	cmp    $0x78,%eax
 473:	0f 8f d4 00 00 00    	jg     54d <printf+0x13d>
 479:	83 f8 63             	cmp    $0x63,%eax
 47c:	0f 8c cb 00 00 00    	jl     54d <printf+0x13d>
 482:	83 e8 63             	sub    $0x63,%eax
 485:	83 f8 15             	cmp    $0x15,%eax
 488:	0f 87 bf 00 00 00    	ja     54d <printf+0x13d>
 48e:	ff 24 85 a4 05 00 00 	jmp    *0x5a4(,%eax,4)
 495:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 498:	8b 17                	mov    (%edi),%edx
 49a:	83 ec 0c             	sub    $0xc,%esp
 49d:	6a 01                	push   $0x1
 49f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	e8 d9 fe ff ff       	call   385 <printint>
 4ac:	83 c7 04             	add    $0x4,%edi
 4af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	be 00 00 00 00       	mov    $0x0,%esi
 4ba:	eb 80                	jmp    43c <printf+0x2c>
 4bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4bf:	8b 17                	mov    (%edi),%edx
 4c1:	83 ec 0c             	sub    $0xc,%esp
 4c4:	6a 00                	push   $0x0
 4c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	e8 b2 fe ff ff       	call   385 <printint>
 4d3:	83 c7 04             	add    $0x4,%edi
 4d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4d9:	83 c4 10             	add    $0x10,%esp
 4dc:	be 00 00 00 00       	mov    $0x0,%esi
 4e1:	e9 56 ff ff ff       	jmp    43c <printf+0x2c>
 4e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4e9:	8b 30                	mov    (%eax),%esi
 4eb:	83 c0 04             	add    $0x4,%eax
 4ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4f1:	85 f6                	test   %esi,%esi
 4f3:	75 15                	jne    50a <printf+0xfa>
 4f5:	be 9b 05 00 00       	mov    $0x59b,%esi
 4fa:	eb 0e                	jmp    50a <printf+0xfa>
 4fc:	0f be d2             	movsbl %dl,%edx
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	e8 64 fe ff ff       	call   36b <putc>
 507:	83 c6 01             	add    $0x1,%esi
 50a:	0f b6 16             	movzbl (%esi),%edx
 50d:	84 d2                	test   %dl,%dl
 50f:	75 eb                	jne    4fc <printf+0xec>
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 21 ff ff ff       	jmp    43c <printf+0x2c>
 51b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 51e:	0f be 17             	movsbl (%edi),%edx
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	e8 42 fe ff ff       	call   36b <putc>
 529:	83 c7 04             	add    $0x4,%edi
 52c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	e9 03 ff ff ff       	jmp    43c <printf+0x2c>
 539:	89 fa                	mov    %edi,%edx
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	e8 28 fe ff ff       	call   36b <putc>
 543:	be 00 00 00 00       	mov    $0x0,%esi
 548:	e9 ef fe ff ff       	jmp    43c <printf+0x2c>
 54d:	ba 25 00 00 00       	mov    $0x25,%edx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 11 fe ff ff       	call   36b <putc>
 55a:	89 fa                	mov    %edi,%edx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	e8 07 fe ff ff       	call   36b <putc>
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	e9 ce fe ff ff       	jmp    43c <printf+0x2c>
 56e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 571:	5b                   	pop    %ebx
 572:	5e                   	pop    %esi
 573:	5f                   	pop    %edi
 574:	5d                   	pop    %ebp
 575:	c3                   	ret    
