
_echo:     file format elf32-i386


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
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
  20:	ba 16 03 00 00       	mov    $0x316,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	pushl  (%edi,%eax,4)
  29:	68 18 03 00 00       	push   $0x318
  2e:	6a 01                	push   $0x1
  30:	e8 79 01 00 00       	call   1ae <printf>
  35:	83 c4 10             	add    $0x10,%esp
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 14 03 00 00       	mov    $0x314,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  4c:	e8 08 00 00 00       	call   59 <exit>

00000051 <fork>:
  51:	b8 01 00 00 00       	mov    $0x1,%eax
  56:	cd 40                	int    $0x40
  58:	c3                   	ret    

00000059 <exit>:
  59:	b8 02 00 00 00       	mov    $0x2,%eax
  5e:	cd 40                	int    $0x40
  60:	c3                   	ret    

00000061 <wait>:
  61:	b8 03 00 00 00       	mov    $0x3,%eax
  66:	cd 40                	int    $0x40
  68:	c3                   	ret    

00000069 <pipe>:
  69:	b8 04 00 00 00       	mov    $0x4,%eax
  6e:	cd 40                	int    $0x40
  70:	c3                   	ret    

00000071 <read>:
  71:	b8 05 00 00 00       	mov    $0x5,%eax
  76:	cd 40                	int    $0x40
  78:	c3                   	ret    

00000079 <write>:
  79:	b8 10 00 00 00       	mov    $0x10,%eax
  7e:	cd 40                	int    $0x40
  80:	c3                   	ret    

00000081 <close>:
  81:	b8 15 00 00 00       	mov    $0x15,%eax
  86:	cd 40                	int    $0x40
  88:	c3                   	ret    

00000089 <kill>:
  89:	b8 06 00 00 00       	mov    $0x6,%eax
  8e:	cd 40                	int    $0x40
  90:	c3                   	ret    

00000091 <exec>:
  91:	b8 07 00 00 00       	mov    $0x7,%eax
  96:	cd 40                	int    $0x40
  98:	c3                   	ret    

00000099 <open>:
  99:	b8 0f 00 00 00       	mov    $0xf,%eax
  9e:	cd 40                	int    $0x40
  a0:	c3                   	ret    

000000a1 <mknod>:
  a1:	b8 11 00 00 00       	mov    $0x11,%eax
  a6:	cd 40                	int    $0x40
  a8:	c3                   	ret    

000000a9 <unlink>:
  a9:	b8 12 00 00 00       	mov    $0x12,%eax
  ae:	cd 40                	int    $0x40
  b0:	c3                   	ret    

000000b1 <fstat>:
  b1:	b8 08 00 00 00       	mov    $0x8,%eax
  b6:	cd 40                	int    $0x40
  b8:	c3                   	ret    

000000b9 <link>:
  b9:	b8 13 00 00 00       	mov    $0x13,%eax
  be:	cd 40                	int    $0x40
  c0:	c3                   	ret    

000000c1 <mkdir>:
  c1:	b8 14 00 00 00       	mov    $0x14,%eax
  c6:	cd 40                	int    $0x40
  c8:	c3                   	ret    

000000c9 <chdir>:
  c9:	b8 09 00 00 00       	mov    $0x9,%eax
  ce:	cd 40                	int    $0x40
  d0:	c3                   	ret    

000000d1 <dup>:
  d1:	b8 0a 00 00 00       	mov    $0xa,%eax
  d6:	cd 40                	int    $0x40
  d8:	c3                   	ret    

000000d9 <getpid>:
  d9:	b8 0b 00 00 00       	mov    $0xb,%eax
  de:	cd 40                	int    $0x40
  e0:	c3                   	ret    

000000e1 <sbrk>:
  e1:	b8 0c 00 00 00       	mov    $0xc,%eax
  e6:	cd 40                	int    $0x40
  e8:	c3                   	ret    

000000e9 <sleep>:
  e9:	b8 0d 00 00 00       	mov    $0xd,%eax
  ee:	cd 40                	int    $0x40
  f0:	c3                   	ret    

000000f1 <uptime>:
  f1:	b8 0e 00 00 00       	mov    $0xe,%eax
  f6:	cd 40                	int    $0x40
  f8:	c3                   	ret    

000000f9 <yield>:
  f9:	b8 16 00 00 00       	mov    $0x16,%eax
  fe:	cd 40                	int    $0x40
 100:	c3                   	ret    

00000101 <shutdown>:
 101:	b8 17 00 00 00       	mov    $0x17,%eax
 106:	cd 40                	int    $0x40
 108:	c3                   	ret    

00000109 <putc>:
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 1c             	sub    $0x1c,%esp
 10f:	88 55 f4             	mov    %dl,-0xc(%ebp)
 112:	6a 01                	push   $0x1
 114:	8d 55 f4             	lea    -0xc(%ebp),%edx
 117:	52                   	push   %edx
 118:	50                   	push   %eax
 119:	e8 5b ff ff ff       	call   79 <write>
 11e:	83 c4 10             	add    $0x10,%esp
 121:	c9                   	leave  
 122:	c3                   	ret    

00000123 <printint>:
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	57                   	push   %edi
 127:	56                   	push   %esi
 128:	53                   	push   %ebx
 129:	83 ec 2c             	sub    $0x2c,%esp
 12c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 12f:	89 d0                	mov    %edx,%eax
 131:	89 ce                	mov    %ecx,%esi
 133:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 137:	0f 95 c1             	setne  %cl
 13a:	c1 ea 1f             	shr    $0x1f,%edx
 13d:	84 d1                	test   %dl,%cl
 13f:	74 44                	je     185 <printint+0x62>
 141:	f7 d8                	neg    %eax
 143:	89 c1                	mov    %eax,%ecx
 145:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 14c:	bb 00 00 00 00       	mov    $0x0,%ebx
 151:	89 c8                	mov    %ecx,%eax
 153:	ba 00 00 00 00       	mov    $0x0,%edx
 158:	f7 f6                	div    %esi
 15a:	89 df                	mov    %ebx,%edi
 15c:	83 c3 01             	add    $0x1,%ebx
 15f:	0f b6 92 7c 03 00 00 	movzbl 0x37c(%edx),%edx
 166:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 16a:	89 ca                	mov    %ecx,%edx
 16c:	89 c1                	mov    %eax,%ecx
 16e:	39 d6                	cmp    %edx,%esi
 170:	76 df                	jbe    151 <printint+0x2e>
 172:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 176:	74 31                	je     1a9 <printint+0x86>
 178:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 17d:	8d 5f 02             	lea    0x2(%edi),%ebx
 180:	8b 75 d0             	mov    -0x30(%ebp),%esi
 183:	eb 17                	jmp    19c <printint+0x79>
 185:	89 c1                	mov    %eax,%ecx
 187:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 18e:	eb bc                	jmp    14c <printint+0x29>
 190:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 195:	89 f0                	mov    %esi,%eax
 197:	e8 6d ff ff ff       	call   109 <putc>
 19c:	83 eb 01             	sub    $0x1,%ebx
 19f:	79 ef                	jns    190 <printint+0x6d>
 1a1:	83 c4 2c             	add    $0x2c,%esp
 1a4:	5b                   	pop    %ebx
 1a5:	5e                   	pop    %esi
 1a6:	5f                   	pop    %edi
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1ac:	eb ee                	jmp    19c <printint+0x79>

000001ae <printf>:
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	57                   	push   %edi
 1b2:	56                   	push   %esi
 1b3:	53                   	push   %ebx
 1b4:	83 ec 1c             	sub    $0x1c,%esp
 1b7:	8d 45 10             	lea    0x10(%ebp),%eax
 1ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1bd:	be 00 00 00 00       	mov    $0x0,%esi
 1c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 1c7:	eb 14                	jmp    1dd <printf+0x2f>
 1c9:	89 fa                	mov    %edi,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	e8 36 ff ff ff       	call   109 <putc>
 1d3:	eb 05                	jmp    1da <printf+0x2c>
 1d5:	83 fe 25             	cmp    $0x25,%esi
 1d8:	74 25                	je     1ff <printf+0x51>
 1da:	83 c3 01             	add    $0x1,%ebx
 1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 1e4:	84 c0                	test   %al,%al
 1e6:	0f 84 20 01 00 00    	je     30c <printf+0x15e>
 1ec:	0f be f8             	movsbl %al,%edi
 1ef:	0f b6 c0             	movzbl %al,%eax
 1f2:	85 f6                	test   %esi,%esi
 1f4:	75 df                	jne    1d5 <printf+0x27>
 1f6:	83 f8 25             	cmp    $0x25,%eax
 1f9:	75 ce                	jne    1c9 <printf+0x1b>
 1fb:	89 c6                	mov    %eax,%esi
 1fd:	eb db                	jmp    1da <printf+0x2c>
 1ff:	83 f8 25             	cmp    $0x25,%eax
 202:	0f 84 cf 00 00 00    	je     2d7 <printf+0x129>
 208:	0f 8c dd 00 00 00    	jl     2eb <printf+0x13d>
 20e:	83 f8 78             	cmp    $0x78,%eax
 211:	0f 8f d4 00 00 00    	jg     2eb <printf+0x13d>
 217:	83 f8 63             	cmp    $0x63,%eax
 21a:	0f 8c cb 00 00 00    	jl     2eb <printf+0x13d>
 220:	83 e8 63             	sub    $0x63,%eax
 223:	83 f8 15             	cmp    $0x15,%eax
 226:	0f 87 bf 00 00 00    	ja     2eb <printf+0x13d>
 22c:	ff 24 85 24 03 00 00 	jmp    *0x324(,%eax,4)
 233:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 236:	8b 17                	mov    (%edi),%edx
 238:	83 ec 0c             	sub    $0xc,%esp
 23b:	6a 01                	push   $0x1
 23d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 242:	8b 45 08             	mov    0x8(%ebp),%eax
 245:	e8 d9 fe ff ff       	call   123 <printint>
 24a:	83 c7 04             	add    $0x4,%edi
 24d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 250:	83 c4 10             	add    $0x10,%esp
 253:	be 00 00 00 00       	mov    $0x0,%esi
 258:	eb 80                	jmp    1da <printf+0x2c>
 25a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 25d:	8b 17                	mov    (%edi),%edx
 25f:	83 ec 0c             	sub    $0xc,%esp
 262:	6a 00                	push   $0x0
 264:	b9 10 00 00 00       	mov    $0x10,%ecx
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	e8 b2 fe ff ff       	call   123 <printint>
 271:	83 c7 04             	add    $0x4,%edi
 274:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 277:	83 c4 10             	add    $0x10,%esp
 27a:	be 00 00 00 00       	mov    $0x0,%esi
 27f:	e9 56 ff ff ff       	jmp    1da <printf+0x2c>
 284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 287:	8b 30                	mov    (%eax),%esi
 289:	83 c0 04             	add    $0x4,%eax
 28c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 28f:	85 f6                	test   %esi,%esi
 291:	75 15                	jne    2a8 <printf+0xfa>
 293:	be 1d 03 00 00       	mov    $0x31d,%esi
 298:	eb 0e                	jmp    2a8 <printf+0xfa>
 29a:	0f be d2             	movsbl %dl,%edx
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	e8 64 fe ff ff       	call   109 <putc>
 2a5:	83 c6 01             	add    $0x1,%esi
 2a8:	0f b6 16             	movzbl (%esi),%edx
 2ab:	84 d2                	test   %dl,%dl
 2ad:	75 eb                	jne    29a <printf+0xec>
 2af:	be 00 00 00 00       	mov    $0x0,%esi
 2b4:	e9 21 ff ff ff       	jmp    1da <printf+0x2c>
 2b9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2bc:	0f be 17             	movsbl (%edi),%edx
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	e8 42 fe ff ff       	call   109 <putc>
 2c7:	83 c7 04             	add    $0x4,%edi
 2ca:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2cd:	be 00 00 00 00       	mov    $0x0,%esi
 2d2:	e9 03 ff ff ff       	jmp    1da <printf+0x2c>
 2d7:	89 fa                	mov    %edi,%edx
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	e8 28 fe ff ff       	call   109 <putc>
 2e1:	be 00 00 00 00       	mov    $0x0,%esi
 2e6:	e9 ef fe ff ff       	jmp    1da <printf+0x2c>
 2eb:	ba 25 00 00 00       	mov    $0x25,%edx
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	e8 11 fe ff ff       	call   109 <putc>
 2f8:	89 fa                	mov    %edi,%edx
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
 2fd:	e8 07 fe ff ff       	call   109 <putc>
 302:	be 00 00 00 00       	mov    $0x0,%esi
 307:	e9 ce fe ff ff       	jmp    1da <printf+0x2c>
 30c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30f:	5b                   	pop    %ebx
 310:	5e                   	pop    %esi
 311:	5f                   	pop    %edi
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    
