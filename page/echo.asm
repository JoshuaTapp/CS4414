
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
  20:	ba 2e 03 00 00       	mov    $0x32e,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	pushl  (%edi,%eax,4)
  29:	68 30 03 00 00       	push   $0x330
  2e:	6a 01                	push   $0x1
  30:	e8 91 01 00 00       	call   1c6 <printf>
  35:	83 c4 10             	add    $0x10,%esp
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 2c 03 00 00       	mov    $0x32c,%edx
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

00000109 <getpagetableentry>:
 109:	b8 18 00 00 00       	mov    $0x18,%eax
 10e:	cd 40                	int    $0x40
 110:	c3                   	ret    

00000111 <isphysicalpagefree>:
 111:	b8 19 00 00 00       	mov    $0x19,%eax
 116:	cd 40                	int    $0x40
 118:	c3                   	ret    

00000119 <dumppagetable>:
 119:	b8 1a 00 00 00       	mov    $0x1a,%eax
 11e:	cd 40                	int    $0x40
 120:	c3                   	ret    

00000121 <putc>:
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	83 ec 1c             	sub    $0x1c,%esp
 127:	88 55 f4             	mov    %dl,-0xc(%ebp)
 12a:	6a 01                	push   $0x1
 12c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 12f:	52                   	push   %edx
 130:	50                   	push   %eax
 131:	e8 43 ff ff ff       	call   79 <write>
 136:	83 c4 10             	add    $0x10,%esp
 139:	c9                   	leave  
 13a:	c3                   	ret    

0000013b <printint>:
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	56                   	push   %esi
 140:	53                   	push   %ebx
 141:	83 ec 2c             	sub    $0x2c,%esp
 144:	89 45 d0             	mov    %eax,-0x30(%ebp)
 147:	89 d0                	mov    %edx,%eax
 149:	89 ce                	mov    %ecx,%esi
 14b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 14f:	0f 95 c1             	setne  %cl
 152:	c1 ea 1f             	shr    $0x1f,%edx
 155:	84 d1                	test   %dl,%cl
 157:	74 44                	je     19d <printint+0x62>
 159:	f7 d8                	neg    %eax
 15b:	89 c1                	mov    %eax,%ecx
 15d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 164:	bb 00 00 00 00       	mov    $0x0,%ebx
 169:	89 c8                	mov    %ecx,%eax
 16b:	ba 00 00 00 00       	mov    $0x0,%edx
 170:	f7 f6                	div    %esi
 172:	89 df                	mov    %ebx,%edi
 174:	83 c3 01             	add    $0x1,%ebx
 177:	0f b6 92 94 03 00 00 	movzbl 0x394(%edx),%edx
 17e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 182:	89 ca                	mov    %ecx,%edx
 184:	89 c1                	mov    %eax,%ecx
 186:	39 d6                	cmp    %edx,%esi
 188:	76 df                	jbe    169 <printint+0x2e>
 18a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 18e:	74 31                	je     1c1 <printint+0x86>
 190:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 195:	8d 5f 02             	lea    0x2(%edi),%ebx
 198:	8b 75 d0             	mov    -0x30(%ebp),%esi
 19b:	eb 17                	jmp    1b4 <printint+0x79>
 19d:	89 c1                	mov    %eax,%ecx
 19f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 1a6:	eb bc                	jmp    164 <printint+0x29>
 1a8:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 1ad:	89 f0                	mov    %esi,%eax
 1af:	e8 6d ff ff ff       	call   121 <putc>
 1b4:	83 eb 01             	sub    $0x1,%ebx
 1b7:	79 ef                	jns    1a8 <printint+0x6d>
 1b9:	83 c4 2c             	add    $0x2c,%esp
 1bc:	5b                   	pop    %ebx
 1bd:	5e                   	pop    %esi
 1be:	5f                   	pop    %edi
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1c4:	eb ee                	jmp    1b4 <printint+0x79>

000001c6 <printf>:
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	57                   	push   %edi
 1ca:	56                   	push   %esi
 1cb:	53                   	push   %ebx
 1cc:	83 ec 1c             	sub    $0x1c,%esp
 1cf:	8d 45 10             	lea    0x10(%ebp),%eax
 1d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1d5:	be 00 00 00 00       	mov    $0x0,%esi
 1da:	bb 00 00 00 00       	mov    $0x0,%ebx
 1df:	eb 14                	jmp    1f5 <printf+0x2f>
 1e1:	89 fa                	mov    %edi,%edx
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	e8 36 ff ff ff       	call   121 <putc>
 1eb:	eb 05                	jmp    1f2 <printf+0x2c>
 1ed:	83 fe 25             	cmp    $0x25,%esi
 1f0:	74 25                	je     217 <printf+0x51>
 1f2:	83 c3 01             	add    $0x1,%ebx
 1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 1fc:	84 c0                	test   %al,%al
 1fe:	0f 84 20 01 00 00    	je     324 <printf+0x15e>
 204:	0f be f8             	movsbl %al,%edi
 207:	0f b6 c0             	movzbl %al,%eax
 20a:	85 f6                	test   %esi,%esi
 20c:	75 df                	jne    1ed <printf+0x27>
 20e:	83 f8 25             	cmp    $0x25,%eax
 211:	75 ce                	jne    1e1 <printf+0x1b>
 213:	89 c6                	mov    %eax,%esi
 215:	eb db                	jmp    1f2 <printf+0x2c>
 217:	83 f8 25             	cmp    $0x25,%eax
 21a:	0f 84 cf 00 00 00    	je     2ef <printf+0x129>
 220:	0f 8c dd 00 00 00    	jl     303 <printf+0x13d>
 226:	83 f8 78             	cmp    $0x78,%eax
 229:	0f 8f d4 00 00 00    	jg     303 <printf+0x13d>
 22f:	83 f8 63             	cmp    $0x63,%eax
 232:	0f 8c cb 00 00 00    	jl     303 <printf+0x13d>
 238:	83 e8 63             	sub    $0x63,%eax
 23b:	83 f8 15             	cmp    $0x15,%eax
 23e:	0f 87 bf 00 00 00    	ja     303 <printf+0x13d>
 244:	ff 24 85 3c 03 00 00 	jmp    *0x33c(,%eax,4)
 24b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 24e:	8b 17                	mov    (%edi),%edx
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 01                	push   $0x1
 255:	b9 0a 00 00 00       	mov    $0xa,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	e8 d9 fe ff ff       	call   13b <printint>
 262:	83 c7 04             	add    $0x4,%edi
 265:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 268:	83 c4 10             	add    $0x10,%esp
 26b:	be 00 00 00 00       	mov    $0x0,%esi
 270:	eb 80                	jmp    1f2 <printf+0x2c>
 272:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 275:	8b 17                	mov    (%edi),%edx
 277:	83 ec 0c             	sub    $0xc,%esp
 27a:	6a 00                	push   $0x0
 27c:	b9 10 00 00 00       	mov    $0x10,%ecx
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	e8 b2 fe ff ff       	call   13b <printint>
 289:	83 c7 04             	add    $0x4,%edi
 28c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 28f:	83 c4 10             	add    $0x10,%esp
 292:	be 00 00 00 00       	mov    $0x0,%esi
 297:	e9 56 ff ff ff       	jmp    1f2 <printf+0x2c>
 29c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 29f:	8b 30                	mov    (%eax),%esi
 2a1:	83 c0 04             	add    $0x4,%eax
 2a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2a7:	85 f6                	test   %esi,%esi
 2a9:	75 15                	jne    2c0 <printf+0xfa>
 2ab:	be 35 03 00 00       	mov    $0x335,%esi
 2b0:	eb 0e                	jmp    2c0 <printf+0xfa>
 2b2:	0f be d2             	movsbl %dl,%edx
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	e8 64 fe ff ff       	call   121 <putc>
 2bd:	83 c6 01             	add    $0x1,%esi
 2c0:	0f b6 16             	movzbl (%esi),%edx
 2c3:	84 d2                	test   %dl,%dl
 2c5:	75 eb                	jne    2b2 <printf+0xec>
 2c7:	be 00 00 00 00       	mov    $0x0,%esi
 2cc:	e9 21 ff ff ff       	jmp    1f2 <printf+0x2c>
 2d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2d4:	0f be 17             	movsbl (%edi),%edx
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	e8 42 fe ff ff       	call   121 <putc>
 2df:	83 c7 04             	add    $0x4,%edi
 2e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2e5:	be 00 00 00 00       	mov    $0x0,%esi
 2ea:	e9 03 ff ff ff       	jmp    1f2 <printf+0x2c>
 2ef:	89 fa                	mov    %edi,%edx
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	e8 28 fe ff ff       	call   121 <putc>
 2f9:	be 00 00 00 00       	mov    $0x0,%esi
 2fe:	e9 ef fe ff ff       	jmp    1f2 <printf+0x2c>
 303:	ba 25 00 00 00       	mov    $0x25,%edx
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	e8 11 fe ff ff       	call   121 <putc>
 310:	89 fa                	mov    %edi,%edx
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	e8 07 fe ff ff       	call   121 <putc>
 31a:	be 00 00 00 00       	mov    $0x0,%esi
 31f:	e9 ce fe ff ff       	jmp    1f2 <printf+0x2c>
 324:	8d 65 f4             	lea    -0xc(%ebp),%esp
 327:	5b                   	pop    %ebx
 328:	5e                   	pop    %esi
 329:	5f                   	pop    %edi
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    
