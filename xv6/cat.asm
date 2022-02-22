
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 60 05 00 00       	push   $0x560
  15:	56                   	push   %esi
  16:	e8 fd 00 00 00       	call   118 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 60 05 00 00       	push   $0x560
  2d:	6a 01                	push   $0x1
  2f:	e8 ec 00 00 00       	call   120 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 bc 03 00 00       	push   $0x3bc
  43:	6a 01                	push   $0x1
  45:	e8 0b 02 00 00       	call   255 <printf>
  4a:	e8 b1 00 00 00       	call   100 <exit>
  4f:	78 07                	js     58 <cat+0x58>
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 ce 03 00 00       	push   $0x3ce
  60:	6a 01                	push   $0x1
  62:	e8 ee 01 00 00       	call   255 <printf>
  67:	e8 94 00 00 00       	call   100 <exit>

0000006c <main>:
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	pushl  -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
  a1:	e8 5a 00 00 00       	call   100 <exit>
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 71 00 00 00       	call   128 <close>
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	pushl  (%edi)
  cf:	e8 6c 00 00 00       	call   140 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	pushl  (%edi)
  e2:	68 df 03 00 00       	push   $0x3df
  e7:	6a 01                	push   $0x1
  e9:	e8 67 01 00 00       	call   255 <printf>
  ee:	e8 0d 00 00 00       	call   100 <exit>
  f3:	e8 08 00 00 00       	call   100 <exit>

000000f8 <fork>:
  f8:	b8 01 00 00 00       	mov    $0x1,%eax
  fd:	cd 40                	int    $0x40
  ff:	c3                   	ret    

00000100 <exit>:
 100:	b8 02 00 00 00       	mov    $0x2,%eax
 105:	cd 40                	int    $0x40
 107:	c3                   	ret    

00000108 <wait>:
 108:	b8 03 00 00 00       	mov    $0x3,%eax
 10d:	cd 40                	int    $0x40
 10f:	c3                   	ret    

00000110 <pipe>:
 110:	b8 04 00 00 00       	mov    $0x4,%eax
 115:	cd 40                	int    $0x40
 117:	c3                   	ret    

00000118 <read>:
 118:	b8 05 00 00 00       	mov    $0x5,%eax
 11d:	cd 40                	int    $0x40
 11f:	c3                   	ret    

00000120 <write>:
 120:	b8 10 00 00 00       	mov    $0x10,%eax
 125:	cd 40                	int    $0x40
 127:	c3                   	ret    

00000128 <close>:
 128:	b8 15 00 00 00       	mov    $0x15,%eax
 12d:	cd 40                	int    $0x40
 12f:	c3                   	ret    

00000130 <kill>:
 130:	b8 06 00 00 00       	mov    $0x6,%eax
 135:	cd 40                	int    $0x40
 137:	c3                   	ret    

00000138 <exec>:
 138:	b8 07 00 00 00       	mov    $0x7,%eax
 13d:	cd 40                	int    $0x40
 13f:	c3                   	ret    

00000140 <open>:
 140:	b8 0f 00 00 00       	mov    $0xf,%eax
 145:	cd 40                	int    $0x40
 147:	c3                   	ret    

00000148 <mknod>:
 148:	b8 11 00 00 00       	mov    $0x11,%eax
 14d:	cd 40                	int    $0x40
 14f:	c3                   	ret    

00000150 <unlink>:
 150:	b8 12 00 00 00       	mov    $0x12,%eax
 155:	cd 40                	int    $0x40
 157:	c3                   	ret    

00000158 <fstat>:
 158:	b8 08 00 00 00       	mov    $0x8,%eax
 15d:	cd 40                	int    $0x40
 15f:	c3                   	ret    

00000160 <link>:
 160:	b8 13 00 00 00       	mov    $0x13,%eax
 165:	cd 40                	int    $0x40
 167:	c3                   	ret    

00000168 <mkdir>:
 168:	b8 14 00 00 00       	mov    $0x14,%eax
 16d:	cd 40                	int    $0x40
 16f:	c3                   	ret    

00000170 <chdir>:
 170:	b8 09 00 00 00       	mov    $0x9,%eax
 175:	cd 40                	int    $0x40
 177:	c3                   	ret    

00000178 <dup>:
 178:	b8 0a 00 00 00       	mov    $0xa,%eax
 17d:	cd 40                	int    $0x40
 17f:	c3                   	ret    

00000180 <getpid>:
 180:	b8 0b 00 00 00       	mov    $0xb,%eax
 185:	cd 40                	int    $0x40
 187:	c3                   	ret    

00000188 <sbrk>:
 188:	b8 0c 00 00 00       	mov    $0xc,%eax
 18d:	cd 40                	int    $0x40
 18f:	c3                   	ret    

00000190 <sleep>:
 190:	b8 0d 00 00 00       	mov    $0xd,%eax
 195:	cd 40                	int    $0x40
 197:	c3                   	ret    

00000198 <uptime>:
 198:	b8 0e 00 00 00       	mov    $0xe,%eax
 19d:	cd 40                	int    $0x40
 19f:	c3                   	ret    

000001a0 <yield>:
 1a0:	b8 16 00 00 00       	mov    $0x16,%eax
 1a5:	cd 40                	int    $0x40
 1a7:	c3                   	ret    

000001a8 <shutdown>:
 1a8:	b8 17 00 00 00       	mov    $0x17,%eax
 1ad:	cd 40                	int    $0x40
 1af:	c3                   	ret    

000001b0 <putc>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 1c             	sub    $0x1c,%esp
 1b6:	88 55 f4             	mov    %dl,-0xc(%ebp)
 1b9:	6a 01                	push   $0x1
 1bb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 1be:	52                   	push   %edx
 1bf:	50                   	push   %eax
 1c0:	e8 5b ff ff ff       	call   120 <write>
 1c5:	83 c4 10             	add    $0x10,%esp
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <printint>:
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	57                   	push   %edi
 1ce:	56                   	push   %esi
 1cf:	53                   	push   %ebx
 1d0:	83 ec 2c             	sub    $0x2c,%esp
 1d3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1d6:	89 d0                	mov    %edx,%eax
 1d8:	89 ce                	mov    %ecx,%esi
 1da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1de:	0f 95 c1             	setne  %cl
 1e1:	c1 ea 1f             	shr    $0x1f,%edx
 1e4:	84 d1                	test   %dl,%cl
 1e6:	74 44                	je     22c <printint+0x62>
 1e8:	f7 d8                	neg    %eax
 1ea:	89 c1                	mov    %eax,%ecx
 1ec:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 1f3:	bb 00 00 00 00       	mov    $0x0,%ebx
 1f8:	89 c8                	mov    %ecx,%eax
 1fa:	ba 00 00 00 00       	mov    $0x0,%edx
 1ff:	f7 f6                	div    %esi
 201:	89 df                	mov    %ebx,%edi
 203:	83 c3 01             	add    $0x1,%ebx
 206:	0f b6 92 54 04 00 00 	movzbl 0x454(%edx),%edx
 20d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 211:	89 ca                	mov    %ecx,%edx
 213:	89 c1                	mov    %eax,%ecx
 215:	39 d6                	cmp    %edx,%esi
 217:	76 df                	jbe    1f8 <printint+0x2e>
 219:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 21d:	74 31                	je     250 <printint+0x86>
 21f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 224:	8d 5f 02             	lea    0x2(%edi),%ebx
 227:	8b 75 d0             	mov    -0x30(%ebp),%esi
 22a:	eb 17                	jmp    243 <printint+0x79>
 22c:	89 c1                	mov    %eax,%ecx
 22e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 235:	eb bc                	jmp    1f3 <printint+0x29>
 237:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 23c:	89 f0                	mov    %esi,%eax
 23e:	e8 6d ff ff ff       	call   1b0 <putc>
 243:	83 eb 01             	sub    $0x1,%ebx
 246:	79 ef                	jns    237 <printint+0x6d>
 248:	83 c4 2c             	add    $0x2c,%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
 250:	8b 75 d0             	mov    -0x30(%ebp),%esi
 253:	eb ee                	jmp    243 <printint+0x79>

00000255 <printf>:
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	57                   	push   %edi
 259:	56                   	push   %esi
 25a:	53                   	push   %ebx
 25b:	83 ec 1c             	sub    $0x1c,%esp
 25e:	8d 45 10             	lea    0x10(%ebp),%eax
 261:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 264:	be 00 00 00 00       	mov    $0x0,%esi
 269:	bb 00 00 00 00       	mov    $0x0,%ebx
 26e:	eb 14                	jmp    284 <printf+0x2f>
 270:	89 fa                	mov    %edi,%edx
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	e8 36 ff ff ff       	call   1b0 <putc>
 27a:	eb 05                	jmp    281 <printf+0x2c>
 27c:	83 fe 25             	cmp    $0x25,%esi
 27f:	74 25                	je     2a6 <printf+0x51>
 281:	83 c3 01             	add    $0x1,%ebx
 284:	8b 45 0c             	mov    0xc(%ebp),%eax
 287:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 28b:	84 c0                	test   %al,%al
 28d:	0f 84 20 01 00 00    	je     3b3 <printf+0x15e>
 293:	0f be f8             	movsbl %al,%edi
 296:	0f b6 c0             	movzbl %al,%eax
 299:	85 f6                	test   %esi,%esi
 29b:	75 df                	jne    27c <printf+0x27>
 29d:	83 f8 25             	cmp    $0x25,%eax
 2a0:	75 ce                	jne    270 <printf+0x1b>
 2a2:	89 c6                	mov    %eax,%esi
 2a4:	eb db                	jmp    281 <printf+0x2c>
 2a6:	83 f8 25             	cmp    $0x25,%eax
 2a9:	0f 84 cf 00 00 00    	je     37e <printf+0x129>
 2af:	0f 8c dd 00 00 00    	jl     392 <printf+0x13d>
 2b5:	83 f8 78             	cmp    $0x78,%eax
 2b8:	0f 8f d4 00 00 00    	jg     392 <printf+0x13d>
 2be:	83 f8 63             	cmp    $0x63,%eax
 2c1:	0f 8c cb 00 00 00    	jl     392 <printf+0x13d>
 2c7:	83 e8 63             	sub    $0x63,%eax
 2ca:	83 f8 15             	cmp    $0x15,%eax
 2cd:	0f 87 bf 00 00 00    	ja     392 <printf+0x13d>
 2d3:	ff 24 85 fc 03 00 00 	jmp    *0x3fc(,%eax,4)
 2da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2dd:	8b 17                	mov    (%edi),%edx
 2df:	83 ec 0c             	sub    $0xc,%esp
 2e2:	6a 01                	push   $0x1
 2e4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	e8 d9 fe ff ff       	call   1ca <printint>
 2f1:	83 c7 04             	add    $0x4,%edi
 2f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2f7:	83 c4 10             	add    $0x10,%esp
 2fa:	be 00 00 00 00       	mov    $0x0,%esi
 2ff:	eb 80                	jmp    281 <printf+0x2c>
 301:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 304:	8b 17                	mov    (%edi),%edx
 306:	83 ec 0c             	sub    $0xc,%esp
 309:	6a 00                	push   $0x0
 30b:	b9 10 00 00 00       	mov    $0x10,%ecx
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	e8 b2 fe ff ff       	call   1ca <printint>
 318:	83 c7 04             	add    $0x4,%edi
 31b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 31e:	83 c4 10             	add    $0x10,%esp
 321:	be 00 00 00 00       	mov    $0x0,%esi
 326:	e9 56 ff ff ff       	jmp    281 <printf+0x2c>
 32b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 32e:	8b 30                	mov    (%eax),%esi
 330:	83 c0 04             	add    $0x4,%eax
 333:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 336:	85 f6                	test   %esi,%esi
 338:	75 15                	jne    34f <printf+0xfa>
 33a:	be f4 03 00 00       	mov    $0x3f4,%esi
 33f:	eb 0e                	jmp    34f <printf+0xfa>
 341:	0f be d2             	movsbl %dl,%edx
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	e8 64 fe ff ff       	call   1b0 <putc>
 34c:	83 c6 01             	add    $0x1,%esi
 34f:	0f b6 16             	movzbl (%esi),%edx
 352:	84 d2                	test   %dl,%dl
 354:	75 eb                	jne    341 <printf+0xec>
 356:	be 00 00 00 00       	mov    $0x0,%esi
 35b:	e9 21 ff ff ff       	jmp    281 <printf+0x2c>
 360:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 363:	0f be 17             	movsbl (%edi),%edx
 366:	8b 45 08             	mov    0x8(%ebp),%eax
 369:	e8 42 fe ff ff       	call   1b0 <putc>
 36e:	83 c7 04             	add    $0x4,%edi
 371:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 374:	be 00 00 00 00       	mov    $0x0,%esi
 379:	e9 03 ff ff ff       	jmp    281 <printf+0x2c>
 37e:	89 fa                	mov    %edi,%edx
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	e8 28 fe ff ff       	call   1b0 <putc>
 388:	be 00 00 00 00       	mov    $0x0,%esi
 38d:	e9 ef fe ff ff       	jmp    281 <printf+0x2c>
 392:	ba 25 00 00 00       	mov    $0x25,%edx
 397:	8b 45 08             	mov    0x8(%ebp),%eax
 39a:	e8 11 fe ff ff       	call   1b0 <putc>
 39f:	89 fa                	mov    %edi,%edx
 3a1:	8b 45 08             	mov    0x8(%ebp),%eax
 3a4:	e8 07 fe ff ff       	call   1b0 <putc>
 3a9:	be 00 00 00 00       	mov    $0x0,%esi
 3ae:	e9 ce fe ff ff       	jmp    281 <printf+0x2c>
 3b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    
