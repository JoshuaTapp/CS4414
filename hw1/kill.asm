
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 b8 04 00 00       	push   $0x4b8
  2d:	6a 02                	push   $0x2
  2f:	e8 1b 03 00 00       	call   34f <printf>
  34:	e8 c1 01 00 00       	call   1fa <exit>
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	pushl  (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 de 01 00 00       	call   22a <kill>
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  56:	e8 9f 01 00 00       	call   1fa <exit>

0000005b <strcpy>:
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	8b 75 08             	mov    0x8(%ebp),%esi
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  66:	89 f0                	mov    %esi,%eax
  68:	89 d1                	mov    %edx,%ecx
  6a:	83 c2 01             	add    $0x1,%edx
  6d:	89 c3                	mov    %eax,%ebx
  6f:	83 c0 01             	add    $0x1,%eax
  72:	0f b6 09             	movzbl (%ecx),%ecx
  75:	88 0b                	mov    %cl,(%ebx)
  77:	84 c9                	test   %cl,%cl
  79:	75 ed                	jne    68 <strcpy+0xd>
  7b:	89 f0                	mov    %esi,%eax
  7d:	5b                   	pop    %ebx
  7e:	5e                   	pop    %esi
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    

00000081 <strcmp>:
  81:	55                   	push   %ebp
  82:	89 e5                	mov    %esp,%ebp
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  8a:	eb 06                	jmp    92 <strcmp+0x11>
  8c:	83 c1 01             	add    $0x1,%ecx
  8f:	83 c2 01             	add    $0x1,%edx
  92:	0f b6 01             	movzbl (%ecx),%eax
  95:	84 c0                	test   %al,%al
  97:	74 04                	je     9d <strcmp+0x1c>
  99:	3a 02                	cmp    (%edx),%al
  9b:	74 ef                	je     8c <strcmp+0xb>
  9d:	0f b6 c0             	movzbl %al,%eax
  a0:	0f b6 12             	movzbl (%edx),%edx
  a3:	29 d0                	sub    %edx,%eax
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <strlen>:
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ad:	b8 00 00 00 00       	mov    $0x0,%eax
  b2:	eb 03                	jmp    b7 <strlen+0x10>
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bb:	75 f7                	jne    b4 <strlen+0xd>
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <memset>:
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	57                   	push   %edi
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  c6:	89 d7                	mov    %edx,%edi
  c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	fc                   	cld    
  cf:	f3 aa                	rep stos %al,%es:(%edi)
  d1:	89 d0                	mov    %edx,%eax
  d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d6:	c9                   	leave  
  d7:	c3                   	ret    

000000d8 <strchr>:
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  e2:	eb 03                	jmp    e7 <strchr+0xf>
  e4:	83 c0 01             	add    $0x1,%eax
  e7:	0f b6 10             	movzbl (%eax),%edx
  ea:	84 d2                	test   %dl,%dl
  ec:	74 06                	je     f4 <strchr+0x1c>
  ee:	38 ca                	cmp    %cl,%dl
  f0:	75 f2                	jne    e4 <strchr+0xc>
  f2:	eb 05                	jmp    f9 <strchr+0x21>
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <gets>:
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	57                   	push   %edi
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	83 ec 1c             	sub    $0x1c,%esp
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
 107:	bb 00 00 00 00       	mov    $0x0,%ebx
 10c:	89 de                	mov    %ebx,%esi
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 114:	7d 2e                	jge    144 <gets+0x49>
 116:	83 ec 04             	sub    $0x4,%esp
 119:	6a 01                	push   $0x1
 11b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11e:	50                   	push   %eax
 11f:	6a 00                	push   $0x0
 121:	e8 ec 00 00 00       	call   212 <read>
 126:	83 c4 10             	add    $0x10,%esp
 129:	85 c0                	test   %eax,%eax
 12b:	7e 17                	jle    144 <gets+0x49>
 12d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 131:	88 04 37             	mov    %al,(%edi,%esi,1)
 134:	3c 0a                	cmp    $0xa,%al
 136:	0f 94 c2             	sete   %dl
 139:	3c 0d                	cmp    $0xd,%al
 13b:	0f 94 c0             	sete   %al
 13e:	08 c2                	or     %al,%dl
 140:	74 ca                	je     10c <gets+0x11>
 142:	89 de                	mov    %ebx,%esi
 144:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
 148:	89 f8                	mov    %edi,%eax
 14a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <stat>:
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	6a 00                	push   $0x0
 15c:	ff 75 08             	pushl  0x8(%ebp)
 15f:	e8 d6 00 00 00       	call   23a <open>
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	78 24                	js     18f <stat+0x3d>
 16b:	89 c3                	mov    %eax,%ebx
 16d:	83 ec 08             	sub    $0x8,%esp
 170:	ff 75 0c             	pushl  0xc(%ebp)
 173:	50                   	push   %eax
 174:	e8 d9 00 00 00       	call   252 <fstat>
 179:	89 c6                	mov    %eax,%esi
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 9f 00 00 00       	call   222 <close>
 183:	83 c4 10             	add    $0x10,%esp
 186:	89 f0                	mov    %esi,%eax
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 194:	eb f0                	jmp    186 <stat+0x34>

00000196 <atoi>:
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	ba 00 00 00 00       	mov    $0x0,%edx
 1a2:	eb 10                	jmp    1b4 <atoi+0x1e>
 1a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1aa:	83 c1 01             	add    $0x1,%ecx
 1ad:	0f be c0             	movsbl %al,%eax
 1b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1b4:	0f b6 01             	movzbl (%ecx),%eax
 1b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ba:	80 fb 09             	cmp    $0x9,%bl
 1bd:	76 e5                	jbe    1a4 <atoi+0xe>
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <memmove>:
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
 1d4:	89 f2                	mov    %esi,%edx
 1d6:	eb 0d                	jmp    1e5 <memmove+0x1f>
 1d8:	0f b6 01             	movzbl (%ecx),%eax
 1db:	88 02                	mov    %al,(%edx)
 1dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e0:	8d 52 01             	lea    0x1(%edx),%edx
 1e3:	89 d8                	mov    %ebx,%eax
 1e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <memmove+0x12>
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <fork>:
 1f2:	b8 01 00 00 00       	mov    $0x1,%eax
 1f7:	cd 40                	int    $0x40
 1f9:	c3                   	ret    

000001fa <exit>:
 1fa:	b8 02 00 00 00       	mov    $0x2,%eax
 1ff:	cd 40                	int    $0x40
 201:	c3                   	ret    

00000202 <wait>:
 202:	b8 03 00 00 00       	mov    $0x3,%eax
 207:	cd 40                	int    $0x40
 209:	c3                   	ret    

0000020a <pipe>:
 20a:	b8 04 00 00 00       	mov    $0x4,%eax
 20f:	cd 40                	int    $0x40
 211:	c3                   	ret    

00000212 <read>:
 212:	b8 05 00 00 00       	mov    $0x5,%eax
 217:	cd 40                	int    $0x40
 219:	c3                   	ret    

0000021a <write>:
 21a:	b8 10 00 00 00       	mov    $0x10,%eax
 21f:	cd 40                	int    $0x40
 221:	c3                   	ret    

00000222 <close>:
 222:	b8 15 00 00 00       	mov    $0x15,%eax
 227:	cd 40                	int    $0x40
 229:	c3                   	ret    

0000022a <kill>:
 22a:	b8 06 00 00 00       	mov    $0x6,%eax
 22f:	cd 40                	int    $0x40
 231:	c3                   	ret    

00000232 <exec>:
 232:	b8 07 00 00 00       	mov    $0x7,%eax
 237:	cd 40                	int    $0x40
 239:	c3                   	ret    

0000023a <open>:
 23a:	b8 0f 00 00 00       	mov    $0xf,%eax
 23f:	cd 40                	int    $0x40
 241:	c3                   	ret    

00000242 <mknod>:
 242:	b8 11 00 00 00       	mov    $0x11,%eax
 247:	cd 40                	int    $0x40
 249:	c3                   	ret    

0000024a <unlink>:
 24a:	b8 12 00 00 00       	mov    $0x12,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <fstat>:
 252:	b8 08 00 00 00       	mov    $0x8,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <link>:
 25a:	b8 13 00 00 00       	mov    $0x13,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <mkdir>:
 262:	b8 14 00 00 00       	mov    $0x14,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <chdir>:
 26a:	b8 09 00 00 00       	mov    $0x9,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <dup>:
 272:	b8 0a 00 00 00       	mov    $0xa,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <getpid>:
 27a:	b8 0b 00 00 00       	mov    $0xb,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <sbrk>:
 282:	b8 0c 00 00 00       	mov    $0xc,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <sleep>:
 28a:	b8 0d 00 00 00       	mov    $0xd,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <uptime>:
 292:	b8 0e 00 00 00       	mov    $0xe,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <yield>:
 29a:	b8 16 00 00 00       	mov    $0x16,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <shutdown>:
 2a2:	b8 17 00 00 00       	mov    $0x17,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <putc>:
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
 2ad:	83 ec 1c             	sub    $0x1c,%esp
 2b0:	88 55 f4             	mov    %dl,-0xc(%ebp)
 2b3:	6a 01                	push   $0x1
 2b5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 2b8:	52                   	push   %edx
 2b9:	50                   	push   %eax
 2ba:	e8 5b ff ff ff       	call   21a <write>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	c9                   	leave  
 2c3:	c3                   	ret    

000002c4 <printint>:
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
 2c9:	53                   	push   %ebx
 2ca:	83 ec 2c             	sub    $0x2c,%esp
 2cd:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2d0:	89 d0                	mov    %edx,%eax
 2d2:	89 ce                	mov    %ecx,%esi
 2d4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2d8:	0f 95 c1             	setne  %cl
 2db:	c1 ea 1f             	shr    $0x1f,%edx
 2de:	84 d1                	test   %dl,%cl
 2e0:	74 44                	je     326 <printint+0x62>
 2e2:	f7 d8                	neg    %eax
 2e4:	89 c1                	mov    %eax,%ecx
 2e6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 2ed:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f2:	89 c8                	mov    %ecx,%eax
 2f4:	ba 00 00 00 00       	mov    $0x0,%edx
 2f9:	f7 f6                	div    %esi
 2fb:	89 df                	mov    %ebx,%edi
 2fd:	83 c3 01             	add    $0x1,%ebx
 300:	0f b6 92 2c 05 00 00 	movzbl 0x52c(%edx),%edx
 307:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 30b:	89 ca                	mov    %ecx,%edx
 30d:	89 c1                	mov    %eax,%ecx
 30f:	39 d6                	cmp    %edx,%esi
 311:	76 df                	jbe    2f2 <printint+0x2e>
 313:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 317:	74 31                	je     34a <printint+0x86>
 319:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 31e:	8d 5f 02             	lea    0x2(%edi),%ebx
 321:	8b 75 d0             	mov    -0x30(%ebp),%esi
 324:	eb 17                	jmp    33d <printint+0x79>
 326:	89 c1                	mov    %eax,%ecx
 328:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 32f:	eb bc                	jmp    2ed <printint+0x29>
 331:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 336:	89 f0                	mov    %esi,%eax
 338:	e8 6d ff ff ff       	call   2aa <putc>
 33d:	83 eb 01             	sub    $0x1,%ebx
 340:	79 ef                	jns    331 <printint+0x6d>
 342:	83 c4 2c             	add    $0x2c,%esp
 345:	5b                   	pop    %ebx
 346:	5e                   	pop    %esi
 347:	5f                   	pop    %edi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    
 34a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 34d:	eb ee                	jmp    33d <printint+0x79>

0000034f <printf>:
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
 352:	57                   	push   %edi
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	83 ec 1c             	sub    $0x1c,%esp
 358:	8d 45 10             	lea    0x10(%ebp),%eax
 35b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 35e:	be 00 00 00 00       	mov    $0x0,%esi
 363:	bb 00 00 00 00       	mov    $0x0,%ebx
 368:	eb 14                	jmp    37e <printf+0x2f>
 36a:	89 fa                	mov    %edi,%edx
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
 36f:	e8 36 ff ff ff       	call   2aa <putc>
 374:	eb 05                	jmp    37b <printf+0x2c>
 376:	83 fe 25             	cmp    $0x25,%esi
 379:	74 25                	je     3a0 <printf+0x51>
 37b:	83 c3 01             	add    $0x1,%ebx
 37e:	8b 45 0c             	mov    0xc(%ebp),%eax
 381:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 385:	84 c0                	test   %al,%al
 387:	0f 84 20 01 00 00    	je     4ad <printf+0x15e>
 38d:	0f be f8             	movsbl %al,%edi
 390:	0f b6 c0             	movzbl %al,%eax
 393:	85 f6                	test   %esi,%esi
 395:	75 df                	jne    376 <printf+0x27>
 397:	83 f8 25             	cmp    $0x25,%eax
 39a:	75 ce                	jne    36a <printf+0x1b>
 39c:	89 c6                	mov    %eax,%esi
 39e:	eb db                	jmp    37b <printf+0x2c>
 3a0:	83 f8 25             	cmp    $0x25,%eax
 3a3:	0f 84 cf 00 00 00    	je     478 <printf+0x129>
 3a9:	0f 8c dd 00 00 00    	jl     48c <printf+0x13d>
 3af:	83 f8 78             	cmp    $0x78,%eax
 3b2:	0f 8f d4 00 00 00    	jg     48c <printf+0x13d>
 3b8:	83 f8 63             	cmp    $0x63,%eax
 3bb:	0f 8c cb 00 00 00    	jl     48c <printf+0x13d>
 3c1:	83 e8 63             	sub    $0x63,%eax
 3c4:	83 f8 15             	cmp    $0x15,%eax
 3c7:	0f 87 bf 00 00 00    	ja     48c <printf+0x13d>
 3cd:	ff 24 85 d4 04 00 00 	jmp    *0x4d4(,%eax,4)
 3d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3d7:	8b 17                	mov    (%edi),%edx
 3d9:	83 ec 0c             	sub    $0xc,%esp
 3dc:	6a 01                	push   $0x1
 3de:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	e8 d9 fe ff ff       	call   2c4 <printint>
 3eb:	83 c7 04             	add    $0x4,%edi
 3ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	be 00 00 00 00       	mov    $0x0,%esi
 3f9:	eb 80                	jmp    37b <printf+0x2c>
 3fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3fe:	8b 17                	mov    (%edi),%edx
 400:	83 ec 0c             	sub    $0xc,%esp
 403:	6a 00                	push   $0x0
 405:	b9 10 00 00 00       	mov    $0x10,%ecx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	e8 b2 fe ff ff       	call   2c4 <printint>
 412:	83 c7 04             	add    $0x4,%edi
 415:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 418:	83 c4 10             	add    $0x10,%esp
 41b:	be 00 00 00 00       	mov    $0x0,%esi
 420:	e9 56 ff ff ff       	jmp    37b <printf+0x2c>
 425:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 428:	8b 30                	mov    (%eax),%esi
 42a:	83 c0 04             	add    $0x4,%eax
 42d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 430:	85 f6                	test   %esi,%esi
 432:	75 15                	jne    449 <printf+0xfa>
 434:	be cc 04 00 00       	mov    $0x4cc,%esi
 439:	eb 0e                	jmp    449 <printf+0xfa>
 43b:	0f be d2             	movsbl %dl,%edx
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	e8 64 fe ff ff       	call   2aa <putc>
 446:	83 c6 01             	add    $0x1,%esi
 449:	0f b6 16             	movzbl (%esi),%edx
 44c:	84 d2                	test   %dl,%dl
 44e:	75 eb                	jne    43b <printf+0xec>
 450:	be 00 00 00 00       	mov    $0x0,%esi
 455:	e9 21 ff ff ff       	jmp    37b <printf+0x2c>
 45a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45d:	0f be 17             	movsbl (%edi),%edx
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	e8 42 fe ff ff       	call   2aa <putc>
 468:	83 c7 04             	add    $0x4,%edi
 46b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 46e:	be 00 00 00 00       	mov    $0x0,%esi
 473:	e9 03 ff ff ff       	jmp    37b <printf+0x2c>
 478:	89 fa                	mov    %edi,%edx
 47a:	8b 45 08             	mov    0x8(%ebp),%eax
 47d:	e8 28 fe ff ff       	call   2aa <putc>
 482:	be 00 00 00 00       	mov    $0x0,%esi
 487:	e9 ef fe ff ff       	jmp    37b <printf+0x2c>
 48c:	ba 25 00 00 00       	mov    $0x25,%edx
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	e8 11 fe ff ff       	call   2aa <putc>
 499:	89 fa                	mov    %edi,%edx
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	e8 07 fe ff ff       	call   2aa <putc>
 4a3:	be 00 00 00 00       	mov    $0x0,%esi
 4a8:	e9 ce fe ff ff       	jmp    37b <printf+0x2c>
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
