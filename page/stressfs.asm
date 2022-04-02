
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
  2a:	68 90 05 00 00       	push   $0x590
  2f:	6a 01                	push   $0x1
  31:	e8 f2 03 00 00       	call   428 <printf>
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
  6b:	68 a3 05 00 00       	push   $0x5a3
  70:	6a 01                	push   $0x1
  72:	e8 b1 03 00 00       	call   428 <printf>
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
  c3:	68 ad 05 00 00       	push   $0x5ad
  c8:	6a 01                	push   $0x1
  ca:	e8 59 03 00 00       	call   428 <printf>
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

0000036b <getpagetableentry>:
 36b:	b8 18 00 00 00       	mov    $0x18,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <isphysicalpagefree>:
 373:	b8 19 00 00 00       	mov    $0x19,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <dumppagetable>:
 37b:	b8 1a 00 00 00       	mov    $0x1a,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <putc>:
 383:	55                   	push   %ebp
 384:	89 e5                	mov    %esp,%ebp
 386:	83 ec 1c             	sub    $0x1c,%esp
 389:	88 55 f4             	mov    %dl,-0xc(%ebp)
 38c:	6a 01                	push   $0x1
 38e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 391:	52                   	push   %edx
 392:	50                   	push   %eax
 393:	e8 43 ff ff ff       	call   2db <write>
 398:	83 c4 10             	add    $0x10,%esp
 39b:	c9                   	leave  
 39c:	c3                   	ret    

0000039d <printint>:
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
 3a0:	57                   	push   %edi
 3a1:	56                   	push   %esi
 3a2:	53                   	push   %ebx
 3a3:	83 ec 2c             	sub    $0x2c,%esp
 3a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3a9:	89 d0                	mov    %edx,%eax
 3ab:	89 ce                	mov    %ecx,%esi
 3ad:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3b1:	0f 95 c1             	setne  %cl
 3b4:	c1 ea 1f             	shr    $0x1f,%edx
 3b7:	84 d1                	test   %dl,%cl
 3b9:	74 44                	je     3ff <printint+0x62>
 3bb:	f7 d8                	neg    %eax
 3bd:	89 c1                	mov    %eax,%ecx
 3bf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 3c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 3cb:	89 c8                	mov    %ecx,%eax
 3cd:	ba 00 00 00 00       	mov    $0x0,%edx
 3d2:	f7 f6                	div    %esi
 3d4:	89 df                	mov    %ebx,%edi
 3d6:	83 c3 01             	add    $0x1,%ebx
 3d9:	0f b6 92 14 06 00 00 	movzbl 0x614(%edx),%edx
 3e0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 3e4:	89 ca                	mov    %ecx,%edx
 3e6:	89 c1                	mov    %eax,%ecx
 3e8:	39 d6                	cmp    %edx,%esi
 3ea:	76 df                	jbe    3cb <printint+0x2e>
 3ec:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3f0:	74 31                	je     423 <printint+0x86>
 3f2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3f7:	8d 5f 02             	lea    0x2(%edi),%ebx
 3fa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3fd:	eb 17                	jmp    416 <printint+0x79>
 3ff:	89 c1                	mov    %eax,%ecx
 401:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 408:	eb bc                	jmp    3c6 <printint+0x29>
 40a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 40f:	89 f0                	mov    %esi,%eax
 411:	e8 6d ff ff ff       	call   383 <putc>
 416:	83 eb 01             	sub    $0x1,%ebx
 419:	79 ef                	jns    40a <printint+0x6d>
 41b:	83 c4 2c             	add    $0x2c,%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5f                   	pop    %edi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    
 423:	8b 75 d0             	mov    -0x30(%ebp),%esi
 426:	eb ee                	jmp    416 <printint+0x79>

00000428 <printf>:
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	57                   	push   %edi
 42c:	56                   	push   %esi
 42d:	53                   	push   %ebx
 42e:	83 ec 1c             	sub    $0x1c,%esp
 431:	8d 45 10             	lea    0x10(%ebp),%eax
 434:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 437:	be 00 00 00 00       	mov    $0x0,%esi
 43c:	bb 00 00 00 00       	mov    $0x0,%ebx
 441:	eb 14                	jmp    457 <printf+0x2f>
 443:	89 fa                	mov    %edi,%edx
 445:	8b 45 08             	mov    0x8(%ebp),%eax
 448:	e8 36 ff ff ff       	call   383 <putc>
 44d:	eb 05                	jmp    454 <printf+0x2c>
 44f:	83 fe 25             	cmp    $0x25,%esi
 452:	74 25                	je     479 <printf+0x51>
 454:	83 c3 01             	add    $0x1,%ebx
 457:	8b 45 0c             	mov    0xc(%ebp),%eax
 45a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 45e:	84 c0                	test   %al,%al
 460:	0f 84 20 01 00 00    	je     586 <printf+0x15e>
 466:	0f be f8             	movsbl %al,%edi
 469:	0f b6 c0             	movzbl %al,%eax
 46c:	85 f6                	test   %esi,%esi
 46e:	75 df                	jne    44f <printf+0x27>
 470:	83 f8 25             	cmp    $0x25,%eax
 473:	75 ce                	jne    443 <printf+0x1b>
 475:	89 c6                	mov    %eax,%esi
 477:	eb db                	jmp    454 <printf+0x2c>
 479:	83 f8 25             	cmp    $0x25,%eax
 47c:	0f 84 cf 00 00 00    	je     551 <printf+0x129>
 482:	0f 8c dd 00 00 00    	jl     565 <printf+0x13d>
 488:	83 f8 78             	cmp    $0x78,%eax
 48b:	0f 8f d4 00 00 00    	jg     565 <printf+0x13d>
 491:	83 f8 63             	cmp    $0x63,%eax
 494:	0f 8c cb 00 00 00    	jl     565 <printf+0x13d>
 49a:	83 e8 63             	sub    $0x63,%eax
 49d:	83 f8 15             	cmp    $0x15,%eax
 4a0:	0f 87 bf 00 00 00    	ja     565 <printf+0x13d>
 4a6:	ff 24 85 bc 05 00 00 	jmp    *0x5bc(,%eax,4)
 4ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b0:	8b 17                	mov    (%edi),%edx
 4b2:	83 ec 0c             	sub    $0xc,%esp
 4b5:	6a 01                	push   $0x1
 4b7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	e8 d9 fe ff ff       	call   39d <printint>
 4c4:	83 c7 04             	add    $0x4,%edi
 4c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ca:	83 c4 10             	add    $0x10,%esp
 4cd:	be 00 00 00 00       	mov    $0x0,%esi
 4d2:	eb 80                	jmp    454 <printf+0x2c>
 4d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d7:	8b 17                	mov    (%edi),%edx
 4d9:	83 ec 0c             	sub    $0xc,%esp
 4dc:	6a 00                	push   $0x0
 4de:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	e8 b2 fe ff ff       	call   39d <printint>
 4eb:	83 c7 04             	add    $0x4,%edi
 4ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f1:	83 c4 10             	add    $0x10,%esp
 4f4:	be 00 00 00 00       	mov    $0x0,%esi
 4f9:	e9 56 ff ff ff       	jmp    454 <printf+0x2c>
 4fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 501:	8b 30                	mov    (%eax),%esi
 503:	83 c0 04             	add    $0x4,%eax
 506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 509:	85 f6                	test   %esi,%esi
 50b:	75 15                	jne    522 <printf+0xfa>
 50d:	be b3 05 00 00       	mov    $0x5b3,%esi
 512:	eb 0e                	jmp    522 <printf+0xfa>
 514:	0f be d2             	movsbl %dl,%edx
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	e8 64 fe ff ff       	call   383 <putc>
 51f:	83 c6 01             	add    $0x1,%esi
 522:	0f b6 16             	movzbl (%esi),%edx
 525:	84 d2                	test   %dl,%dl
 527:	75 eb                	jne    514 <printf+0xec>
 529:	be 00 00 00 00       	mov    $0x0,%esi
 52e:	e9 21 ff ff ff       	jmp    454 <printf+0x2c>
 533:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 536:	0f be 17             	movsbl (%edi),%edx
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	e8 42 fe ff ff       	call   383 <putc>
 541:	83 c7 04             	add    $0x4,%edi
 544:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 547:	be 00 00 00 00       	mov    $0x0,%esi
 54c:	e9 03 ff ff ff       	jmp    454 <printf+0x2c>
 551:	89 fa                	mov    %edi,%edx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	e8 28 fe ff ff       	call   383 <putc>
 55b:	be 00 00 00 00       	mov    $0x0,%esi
 560:	e9 ef fe ff ff       	jmp    454 <printf+0x2c>
 565:	ba 25 00 00 00       	mov    $0x25,%edx
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	e8 11 fe ff ff       	call   383 <putc>
 572:	89 fa                	mov    %edi,%edx
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	e8 07 fe ff ff       	call   383 <putc>
 57c:	be 00 00 00 00       	mov    $0x0,%esi
 581:	e9 ce fe ff ff       	jmp    454 <printf+0x2c>
 586:	8d 65 f4             	lea    -0xc(%ebp),%esp
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5f                   	pop    %edi
 58c:	5d                   	pop    %ebp
 58d:	c3                   	ret    
