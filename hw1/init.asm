
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 a0 03 00 00       	push   $0x3a0
  19:	e8 07 01 00 00       	call   125 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 2e 01 00 00       	call   15d <dup>
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 22 01 00 00       	call   15d <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 a0 03 00 00       	push   $0x3a0
  4c:	e8 dc 00 00 00       	call   12d <mknod>
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 a0 03 00 00       	push   $0x3a0
  5b:	e8 c5 00 00 00       	call   125 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 bb 03 00 00       	push   $0x3bb
  6d:	6a 01                	push   $0x1
  6f:	e8 c6 01 00 00       	call   23a <printf>
  74:	e8 6c 00 00 00       	call   e5 <exit>
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 e7 03 00 00       	push   $0x3e7
  81:	6a 01                	push   $0x1
  83:	e8 b2 01 00 00       	call   23a <printf>
  88:	83 c4 10             	add    $0x10,%esp
  8b:	e8 5d 00 00 00       	call   ed <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 a8 03 00 00       	push   $0x3a8
  a0:	6a 01                	push   $0x1
  a2:	e8 93 01 00 00       	call   23a <printf>
  a7:	e8 31 00 00 00       	call   dd <fork>
  ac:	89 c3                	mov    %eax,%ebx
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
  b5:	75 d4                	jne    8b <main+0x8b>
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 24 05 00 00       	push   $0x524
  bf:	68 ce 03 00 00       	push   $0x3ce
  c4:	e8 54 00 00 00       	call   11d <exec>
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 d1 03 00 00       	push   $0x3d1
  d1:	6a 01                	push   $0x1
  d3:	e8 62 01 00 00       	call   23a <printf>
  d8:	e8 08 00 00 00       	call   e5 <exit>

000000dd <fork>:
  dd:	b8 01 00 00 00       	mov    $0x1,%eax
  e2:	cd 40                	int    $0x40
  e4:	c3                   	ret    

000000e5 <exit>:
  e5:	b8 02 00 00 00       	mov    $0x2,%eax
  ea:	cd 40                	int    $0x40
  ec:	c3                   	ret    

000000ed <wait>:
  ed:	b8 03 00 00 00       	mov    $0x3,%eax
  f2:	cd 40                	int    $0x40
  f4:	c3                   	ret    

000000f5 <pipe>:
  f5:	b8 04 00 00 00       	mov    $0x4,%eax
  fa:	cd 40                	int    $0x40
  fc:	c3                   	ret    

000000fd <read>:
  fd:	b8 05 00 00 00       	mov    $0x5,%eax
 102:	cd 40                	int    $0x40
 104:	c3                   	ret    

00000105 <write>:
 105:	b8 10 00 00 00       	mov    $0x10,%eax
 10a:	cd 40                	int    $0x40
 10c:	c3                   	ret    

0000010d <close>:
 10d:	b8 15 00 00 00       	mov    $0x15,%eax
 112:	cd 40                	int    $0x40
 114:	c3                   	ret    

00000115 <kill>:
 115:	b8 06 00 00 00       	mov    $0x6,%eax
 11a:	cd 40                	int    $0x40
 11c:	c3                   	ret    

0000011d <exec>:
 11d:	b8 07 00 00 00       	mov    $0x7,%eax
 122:	cd 40                	int    $0x40
 124:	c3                   	ret    

00000125 <open>:
 125:	b8 0f 00 00 00       	mov    $0xf,%eax
 12a:	cd 40                	int    $0x40
 12c:	c3                   	ret    

0000012d <mknod>:
 12d:	b8 11 00 00 00       	mov    $0x11,%eax
 132:	cd 40                	int    $0x40
 134:	c3                   	ret    

00000135 <unlink>:
 135:	b8 12 00 00 00       	mov    $0x12,%eax
 13a:	cd 40                	int    $0x40
 13c:	c3                   	ret    

0000013d <fstat>:
 13d:	b8 08 00 00 00       	mov    $0x8,%eax
 142:	cd 40                	int    $0x40
 144:	c3                   	ret    

00000145 <link>:
 145:	b8 13 00 00 00       	mov    $0x13,%eax
 14a:	cd 40                	int    $0x40
 14c:	c3                   	ret    

0000014d <mkdir>:
 14d:	b8 14 00 00 00       	mov    $0x14,%eax
 152:	cd 40                	int    $0x40
 154:	c3                   	ret    

00000155 <chdir>:
 155:	b8 09 00 00 00       	mov    $0x9,%eax
 15a:	cd 40                	int    $0x40
 15c:	c3                   	ret    

0000015d <dup>:
 15d:	b8 0a 00 00 00       	mov    $0xa,%eax
 162:	cd 40                	int    $0x40
 164:	c3                   	ret    

00000165 <getpid>:
 165:	b8 0b 00 00 00       	mov    $0xb,%eax
 16a:	cd 40                	int    $0x40
 16c:	c3                   	ret    

0000016d <sbrk>:
 16d:	b8 0c 00 00 00       	mov    $0xc,%eax
 172:	cd 40                	int    $0x40
 174:	c3                   	ret    

00000175 <sleep>:
 175:	b8 0d 00 00 00       	mov    $0xd,%eax
 17a:	cd 40                	int    $0x40
 17c:	c3                   	ret    

0000017d <uptime>:
 17d:	b8 0e 00 00 00       	mov    $0xe,%eax
 182:	cd 40                	int    $0x40
 184:	c3                   	ret    

00000185 <yield>:
 185:	b8 16 00 00 00       	mov    $0x16,%eax
 18a:	cd 40                	int    $0x40
 18c:	c3                   	ret    

0000018d <shutdown>:
 18d:	b8 17 00 00 00       	mov    $0x17,%eax
 192:	cd 40                	int    $0x40
 194:	c3                   	ret    

00000195 <putc>:
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	83 ec 1c             	sub    $0x1c,%esp
 19b:	88 55 f4             	mov    %dl,-0xc(%ebp)
 19e:	6a 01                	push   $0x1
 1a0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 1a3:	52                   	push   %edx
 1a4:	50                   	push   %eax
 1a5:	e8 5b ff ff ff       	call   105 <write>
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	c9                   	leave  
 1ae:	c3                   	ret    

000001af <printint>:
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	57                   	push   %edi
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	83 ec 2c             	sub    $0x2c,%esp
 1b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1bb:	89 d0                	mov    %edx,%eax
 1bd:	89 ce                	mov    %ecx,%esi
 1bf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1c3:	0f 95 c1             	setne  %cl
 1c6:	c1 ea 1f             	shr    $0x1f,%edx
 1c9:	84 d1                	test   %dl,%cl
 1cb:	74 44                	je     211 <printint+0x62>
 1cd:	f7 d8                	neg    %eax
 1cf:	89 c1                	mov    %eax,%ecx
 1d1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 1d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1dd:	89 c8                	mov    %ecx,%eax
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
 1e4:	f7 f6                	div    %esi
 1e6:	89 df                	mov    %ebx,%edi
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	0f b6 92 50 04 00 00 	movzbl 0x450(%edx),%edx
 1f2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 1f6:	89 ca                	mov    %ecx,%edx
 1f8:	89 c1                	mov    %eax,%ecx
 1fa:	39 d6                	cmp    %edx,%esi
 1fc:	76 df                	jbe    1dd <printint+0x2e>
 1fe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 202:	74 31                	je     235 <printint+0x86>
 204:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 209:	8d 5f 02             	lea    0x2(%edi),%ebx
 20c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 20f:	eb 17                	jmp    228 <printint+0x79>
 211:	89 c1                	mov    %eax,%ecx
 213:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 21a:	eb bc                	jmp    1d8 <printint+0x29>
 21c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 221:	89 f0                	mov    %esi,%eax
 223:	e8 6d ff ff ff       	call   195 <putc>
 228:	83 eb 01             	sub    $0x1,%ebx
 22b:	79 ef                	jns    21c <printint+0x6d>
 22d:	83 c4 2c             	add    $0x2c,%esp
 230:	5b                   	pop    %ebx
 231:	5e                   	pop    %esi
 232:	5f                   	pop    %edi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    
 235:	8b 75 d0             	mov    -0x30(%ebp),%esi
 238:	eb ee                	jmp    228 <printint+0x79>

0000023a <printf>:
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	57                   	push   %edi
 23e:	56                   	push   %esi
 23f:	53                   	push   %ebx
 240:	83 ec 1c             	sub    $0x1c,%esp
 243:	8d 45 10             	lea    0x10(%ebp),%eax
 246:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 249:	be 00 00 00 00       	mov    $0x0,%esi
 24e:	bb 00 00 00 00       	mov    $0x0,%ebx
 253:	eb 14                	jmp    269 <printf+0x2f>
 255:	89 fa                	mov    %edi,%edx
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	e8 36 ff ff ff       	call   195 <putc>
 25f:	eb 05                	jmp    266 <printf+0x2c>
 261:	83 fe 25             	cmp    $0x25,%esi
 264:	74 25                	je     28b <printf+0x51>
 266:	83 c3 01             	add    $0x1,%ebx
 269:	8b 45 0c             	mov    0xc(%ebp),%eax
 26c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 270:	84 c0                	test   %al,%al
 272:	0f 84 20 01 00 00    	je     398 <printf+0x15e>
 278:	0f be f8             	movsbl %al,%edi
 27b:	0f b6 c0             	movzbl %al,%eax
 27e:	85 f6                	test   %esi,%esi
 280:	75 df                	jne    261 <printf+0x27>
 282:	83 f8 25             	cmp    $0x25,%eax
 285:	75 ce                	jne    255 <printf+0x1b>
 287:	89 c6                	mov    %eax,%esi
 289:	eb db                	jmp    266 <printf+0x2c>
 28b:	83 f8 25             	cmp    $0x25,%eax
 28e:	0f 84 cf 00 00 00    	je     363 <printf+0x129>
 294:	0f 8c dd 00 00 00    	jl     377 <printf+0x13d>
 29a:	83 f8 78             	cmp    $0x78,%eax
 29d:	0f 8f d4 00 00 00    	jg     377 <printf+0x13d>
 2a3:	83 f8 63             	cmp    $0x63,%eax
 2a6:	0f 8c cb 00 00 00    	jl     377 <printf+0x13d>
 2ac:	83 e8 63             	sub    $0x63,%eax
 2af:	83 f8 15             	cmp    $0x15,%eax
 2b2:	0f 87 bf 00 00 00    	ja     377 <printf+0x13d>
 2b8:	ff 24 85 f8 03 00 00 	jmp    *0x3f8(,%eax,4)
 2bf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2c2:	8b 17                	mov    (%edi),%edx
 2c4:	83 ec 0c             	sub    $0xc,%esp
 2c7:	6a 01                	push   $0x1
 2c9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	e8 d9 fe ff ff       	call   1af <printint>
 2d6:	83 c7 04             	add    $0x4,%edi
 2d9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2dc:	83 c4 10             	add    $0x10,%esp
 2df:	be 00 00 00 00       	mov    $0x0,%esi
 2e4:	eb 80                	jmp    266 <printf+0x2c>
 2e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2e9:	8b 17                	mov    (%edi),%edx
 2eb:	83 ec 0c             	sub    $0xc,%esp
 2ee:	6a 00                	push   $0x0
 2f0:	b9 10 00 00 00       	mov    $0x10,%ecx
 2f5:	8b 45 08             	mov    0x8(%ebp),%eax
 2f8:	e8 b2 fe ff ff       	call   1af <printint>
 2fd:	83 c7 04             	add    $0x4,%edi
 300:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 303:	83 c4 10             	add    $0x10,%esp
 306:	be 00 00 00 00       	mov    $0x0,%esi
 30b:	e9 56 ff ff ff       	jmp    266 <printf+0x2c>
 310:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 313:	8b 30                	mov    (%eax),%esi
 315:	83 c0 04             	add    $0x4,%eax
 318:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 31b:	85 f6                	test   %esi,%esi
 31d:	75 15                	jne    334 <printf+0xfa>
 31f:	be f0 03 00 00       	mov    $0x3f0,%esi
 324:	eb 0e                	jmp    334 <printf+0xfa>
 326:	0f be d2             	movsbl %dl,%edx
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	e8 64 fe ff ff       	call   195 <putc>
 331:	83 c6 01             	add    $0x1,%esi
 334:	0f b6 16             	movzbl (%esi),%edx
 337:	84 d2                	test   %dl,%dl
 339:	75 eb                	jne    326 <printf+0xec>
 33b:	be 00 00 00 00       	mov    $0x0,%esi
 340:	e9 21 ff ff ff       	jmp    266 <printf+0x2c>
 345:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 348:	0f be 17             	movsbl (%edi),%edx
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	e8 42 fe ff ff       	call   195 <putc>
 353:	83 c7 04             	add    $0x4,%edi
 356:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 359:	be 00 00 00 00       	mov    $0x0,%esi
 35e:	e9 03 ff ff ff       	jmp    266 <printf+0x2c>
 363:	89 fa                	mov    %edi,%edx
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	e8 28 fe ff ff       	call   195 <putc>
 36d:	be 00 00 00 00       	mov    $0x0,%esi
 372:	e9 ef fe ff ff       	jmp    266 <printf+0x2c>
 377:	ba 25 00 00 00       	mov    $0x25,%edx
 37c:	8b 45 08             	mov    0x8(%ebp),%eax
 37f:	e8 11 fe ff ff       	call   195 <putc>
 384:	89 fa                	mov    %edi,%edx
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	e8 07 fe ff ff       	call   195 <putc>
 38e:	be 00 00 00 00       	mov    $0x0,%esi
 393:	e9 ce fe ff ff       	jmp    266 <printf+0x2c>
 398:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39b:	5b                   	pop    %ebx
 39c:	5e                   	pop    %esi
 39d:	5f                   	pop    %edi
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    
