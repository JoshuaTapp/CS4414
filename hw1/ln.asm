
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 20 03 00 00       	push   $0x320
  1f:	6a 02                	push   $0x2
  21:	e8 93 01 00 00       	call   1b9 <printf>
  26:	e8 39 00 00 00       	call   64 <exit>
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	pushl  0x8(%ebx)
  31:	ff 73 04             	pushl  0x4(%ebx)
  34:	e8 8b 00 00 00       	call   c4 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
  40:	e8 1f 00 00 00       	call   64 <exit>
  45:	ff 73 08             	pushl  0x8(%ebx)
  48:	ff 73 04             	pushl  0x4(%ebx)
  4b:	68 33 03 00 00       	push   $0x333
  50:	6a 02                	push   $0x2
  52:	e8 62 01 00 00       	call   1b9 <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <fork>:
  5c:	b8 01 00 00 00       	mov    $0x1,%eax
  61:	cd 40                	int    $0x40
  63:	c3                   	ret    

00000064 <exit>:
  64:	b8 02 00 00 00       	mov    $0x2,%eax
  69:	cd 40                	int    $0x40
  6b:	c3                   	ret    

0000006c <wait>:
  6c:	b8 03 00 00 00       	mov    $0x3,%eax
  71:	cd 40                	int    $0x40
  73:	c3                   	ret    

00000074 <pipe>:
  74:	b8 04 00 00 00       	mov    $0x4,%eax
  79:	cd 40                	int    $0x40
  7b:	c3                   	ret    

0000007c <read>:
  7c:	b8 05 00 00 00       	mov    $0x5,%eax
  81:	cd 40                	int    $0x40
  83:	c3                   	ret    

00000084 <write>:
  84:	b8 10 00 00 00       	mov    $0x10,%eax
  89:	cd 40                	int    $0x40
  8b:	c3                   	ret    

0000008c <close>:
  8c:	b8 15 00 00 00       	mov    $0x15,%eax
  91:	cd 40                	int    $0x40
  93:	c3                   	ret    

00000094 <kill>:
  94:	b8 06 00 00 00       	mov    $0x6,%eax
  99:	cd 40                	int    $0x40
  9b:	c3                   	ret    

0000009c <exec>:
  9c:	b8 07 00 00 00       	mov    $0x7,%eax
  a1:	cd 40                	int    $0x40
  a3:	c3                   	ret    

000000a4 <open>:
  a4:	b8 0f 00 00 00       	mov    $0xf,%eax
  a9:	cd 40                	int    $0x40
  ab:	c3                   	ret    

000000ac <mknod>:
  ac:	b8 11 00 00 00       	mov    $0x11,%eax
  b1:	cd 40                	int    $0x40
  b3:	c3                   	ret    

000000b4 <unlink>:
  b4:	b8 12 00 00 00       	mov    $0x12,%eax
  b9:	cd 40                	int    $0x40
  bb:	c3                   	ret    

000000bc <fstat>:
  bc:	b8 08 00 00 00       	mov    $0x8,%eax
  c1:	cd 40                	int    $0x40
  c3:	c3                   	ret    

000000c4 <link>:
  c4:	b8 13 00 00 00       	mov    $0x13,%eax
  c9:	cd 40                	int    $0x40
  cb:	c3                   	ret    

000000cc <mkdir>:
  cc:	b8 14 00 00 00       	mov    $0x14,%eax
  d1:	cd 40                	int    $0x40
  d3:	c3                   	ret    

000000d4 <chdir>:
  d4:	b8 09 00 00 00       	mov    $0x9,%eax
  d9:	cd 40                	int    $0x40
  db:	c3                   	ret    

000000dc <dup>:
  dc:	b8 0a 00 00 00       	mov    $0xa,%eax
  e1:	cd 40                	int    $0x40
  e3:	c3                   	ret    

000000e4 <getpid>:
  e4:	b8 0b 00 00 00       	mov    $0xb,%eax
  e9:	cd 40                	int    $0x40
  eb:	c3                   	ret    

000000ec <sbrk>:
  ec:	b8 0c 00 00 00       	mov    $0xc,%eax
  f1:	cd 40                	int    $0x40
  f3:	c3                   	ret    

000000f4 <sleep>:
  f4:	b8 0d 00 00 00       	mov    $0xd,%eax
  f9:	cd 40                	int    $0x40
  fb:	c3                   	ret    

000000fc <uptime>:
  fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 101:	cd 40                	int    $0x40
 103:	c3                   	ret    

00000104 <yield>:
 104:	b8 16 00 00 00       	mov    $0x16,%eax
 109:	cd 40                	int    $0x40
 10b:	c3                   	ret    

0000010c <shutdown>:
 10c:	b8 17 00 00 00       	mov    $0x17,%eax
 111:	cd 40                	int    $0x40
 113:	c3                   	ret    

00000114 <putc>:
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	83 ec 1c             	sub    $0x1c,%esp
 11a:	88 55 f4             	mov    %dl,-0xc(%ebp)
 11d:	6a 01                	push   $0x1
 11f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 122:	52                   	push   %edx
 123:	50                   	push   %eax
 124:	e8 5b ff ff ff       	call   84 <write>
 129:	83 c4 10             	add    $0x10,%esp
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <printint>:
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	57                   	push   %edi
 132:	56                   	push   %esi
 133:	53                   	push   %ebx
 134:	83 ec 2c             	sub    $0x2c,%esp
 137:	89 45 d0             	mov    %eax,-0x30(%ebp)
 13a:	89 d0                	mov    %edx,%eax
 13c:	89 ce                	mov    %ecx,%esi
 13e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 142:	0f 95 c1             	setne  %cl
 145:	c1 ea 1f             	shr    $0x1f,%edx
 148:	84 d1                	test   %dl,%cl
 14a:	74 44                	je     190 <printint+0x62>
 14c:	f7 d8                	neg    %eax
 14e:	89 c1                	mov    %eax,%ecx
 150:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 157:	bb 00 00 00 00       	mov    $0x0,%ebx
 15c:	89 c8                	mov    %ecx,%eax
 15e:	ba 00 00 00 00       	mov    $0x0,%edx
 163:	f7 f6                	div    %esi
 165:	89 df                	mov    %ebx,%edi
 167:	83 c3 01             	add    $0x1,%ebx
 16a:	0f b6 92 a8 03 00 00 	movzbl 0x3a8(%edx),%edx
 171:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 175:	89 ca                	mov    %ecx,%edx
 177:	89 c1                	mov    %eax,%ecx
 179:	39 d6                	cmp    %edx,%esi
 17b:	76 df                	jbe    15c <printint+0x2e>
 17d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 181:	74 31                	je     1b4 <printint+0x86>
 183:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 188:	8d 5f 02             	lea    0x2(%edi),%ebx
 18b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 18e:	eb 17                	jmp    1a7 <printint+0x79>
 190:	89 c1                	mov    %eax,%ecx
 192:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 199:	eb bc                	jmp    157 <printint+0x29>
 19b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 1a0:	89 f0                	mov    %esi,%eax
 1a2:	e8 6d ff ff ff       	call   114 <putc>
 1a7:	83 eb 01             	sub    $0x1,%ebx
 1aa:	79 ef                	jns    19b <printint+0x6d>
 1ac:	83 c4 2c             	add    $0x2c,%esp
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5f                   	pop    %edi
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1b7:	eb ee                	jmp    1a7 <printint+0x79>

000001b9 <printf>:
 1b9:	55                   	push   %ebp
 1ba:	89 e5                	mov    %esp,%ebp
 1bc:	57                   	push   %edi
 1bd:	56                   	push   %esi
 1be:	53                   	push   %ebx
 1bf:	83 ec 1c             	sub    $0x1c,%esp
 1c2:	8d 45 10             	lea    0x10(%ebp),%eax
 1c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1c8:	be 00 00 00 00       	mov    $0x0,%esi
 1cd:	bb 00 00 00 00       	mov    $0x0,%ebx
 1d2:	eb 14                	jmp    1e8 <printf+0x2f>
 1d4:	89 fa                	mov    %edi,%edx
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	e8 36 ff ff ff       	call   114 <putc>
 1de:	eb 05                	jmp    1e5 <printf+0x2c>
 1e0:	83 fe 25             	cmp    $0x25,%esi
 1e3:	74 25                	je     20a <printf+0x51>
 1e5:	83 c3 01             	add    $0x1,%ebx
 1e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1eb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 1ef:	84 c0                	test   %al,%al
 1f1:	0f 84 20 01 00 00    	je     317 <printf+0x15e>
 1f7:	0f be f8             	movsbl %al,%edi
 1fa:	0f b6 c0             	movzbl %al,%eax
 1fd:	85 f6                	test   %esi,%esi
 1ff:	75 df                	jne    1e0 <printf+0x27>
 201:	83 f8 25             	cmp    $0x25,%eax
 204:	75 ce                	jne    1d4 <printf+0x1b>
 206:	89 c6                	mov    %eax,%esi
 208:	eb db                	jmp    1e5 <printf+0x2c>
 20a:	83 f8 25             	cmp    $0x25,%eax
 20d:	0f 84 cf 00 00 00    	je     2e2 <printf+0x129>
 213:	0f 8c dd 00 00 00    	jl     2f6 <printf+0x13d>
 219:	83 f8 78             	cmp    $0x78,%eax
 21c:	0f 8f d4 00 00 00    	jg     2f6 <printf+0x13d>
 222:	83 f8 63             	cmp    $0x63,%eax
 225:	0f 8c cb 00 00 00    	jl     2f6 <printf+0x13d>
 22b:	83 e8 63             	sub    $0x63,%eax
 22e:	83 f8 15             	cmp    $0x15,%eax
 231:	0f 87 bf 00 00 00    	ja     2f6 <printf+0x13d>
 237:	ff 24 85 50 03 00 00 	jmp    *0x350(,%eax,4)
 23e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 241:	8b 17                	mov    (%edi),%edx
 243:	83 ec 0c             	sub    $0xc,%esp
 246:	6a 01                	push   $0x1
 248:	b9 0a 00 00 00       	mov    $0xa,%ecx
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
 250:	e8 d9 fe ff ff       	call   12e <printint>
 255:	83 c7 04             	add    $0x4,%edi
 258:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 25b:	83 c4 10             	add    $0x10,%esp
 25e:	be 00 00 00 00       	mov    $0x0,%esi
 263:	eb 80                	jmp    1e5 <printf+0x2c>
 265:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 268:	8b 17                	mov    (%edi),%edx
 26a:	83 ec 0c             	sub    $0xc,%esp
 26d:	6a 00                	push   $0x0
 26f:	b9 10 00 00 00       	mov    $0x10,%ecx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	e8 b2 fe ff ff       	call   12e <printint>
 27c:	83 c7 04             	add    $0x4,%edi
 27f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 282:	83 c4 10             	add    $0x10,%esp
 285:	be 00 00 00 00       	mov    $0x0,%esi
 28a:	e9 56 ff ff ff       	jmp    1e5 <printf+0x2c>
 28f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 292:	8b 30                	mov    (%eax),%esi
 294:	83 c0 04             	add    $0x4,%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	85 f6                	test   %esi,%esi
 29c:	75 15                	jne    2b3 <printf+0xfa>
 29e:	be 47 03 00 00       	mov    $0x347,%esi
 2a3:	eb 0e                	jmp    2b3 <printf+0xfa>
 2a5:	0f be d2             	movsbl %dl,%edx
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	e8 64 fe ff ff       	call   114 <putc>
 2b0:	83 c6 01             	add    $0x1,%esi
 2b3:	0f b6 16             	movzbl (%esi),%edx
 2b6:	84 d2                	test   %dl,%dl
 2b8:	75 eb                	jne    2a5 <printf+0xec>
 2ba:	be 00 00 00 00       	mov    $0x0,%esi
 2bf:	e9 21 ff ff ff       	jmp    1e5 <printf+0x2c>
 2c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2c7:	0f be 17             	movsbl (%edi),%edx
 2ca:	8b 45 08             	mov    0x8(%ebp),%eax
 2cd:	e8 42 fe ff ff       	call   114 <putc>
 2d2:	83 c7 04             	add    $0x4,%edi
 2d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2d8:	be 00 00 00 00       	mov    $0x0,%esi
 2dd:	e9 03 ff ff ff       	jmp    1e5 <printf+0x2c>
 2e2:	89 fa                	mov    %edi,%edx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	e8 28 fe ff ff       	call   114 <putc>
 2ec:	be 00 00 00 00       	mov    $0x0,%esi
 2f1:	e9 ef fe ff ff       	jmp    1e5 <printf+0x2c>
 2f6:	ba 25 00 00 00       	mov    $0x25,%edx
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
 2fe:	e8 11 fe ff ff       	call   114 <putc>
 303:	89 fa                	mov    %edi,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	e8 07 fe ff ff       	call   114 <putc>
 30d:	be 00 00 00 00       	mov    $0x0,%esi
 312:	e9 ce fe ff ff       	jmp    1e5 <printf+0x2c>
 317:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5f                   	pop    %edi
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    
