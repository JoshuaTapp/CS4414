
_rm:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 38 03 00 00       	push   $0x338
  30:	6a 02                	push   $0x2
  32:	e8 99 01 00 00       	call   1d0 <printf>
  37:	e8 3f 00 00 00       	call   7b <exit>
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	pushl  (%esi)
  4e:	e8 78 00 00 00       	call   cb <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	pushl  (%esi)
  5f:	68 4c 03 00 00       	push   $0x34c
  64:	6a 02                	push   $0x2
  66:	e8 65 01 00 00       	call   1d0 <printf>
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	e8 08 00 00 00       	call   7b <exit>

00000073 <fork>:
  73:	b8 01 00 00 00       	mov    $0x1,%eax
  78:	cd 40                	int    $0x40
  7a:	c3                   	ret    

0000007b <exit>:
  7b:	b8 02 00 00 00       	mov    $0x2,%eax
  80:	cd 40                	int    $0x40
  82:	c3                   	ret    

00000083 <wait>:
  83:	b8 03 00 00 00       	mov    $0x3,%eax
  88:	cd 40                	int    $0x40
  8a:	c3                   	ret    

0000008b <pipe>:
  8b:	b8 04 00 00 00       	mov    $0x4,%eax
  90:	cd 40                	int    $0x40
  92:	c3                   	ret    

00000093 <read>:
  93:	b8 05 00 00 00       	mov    $0x5,%eax
  98:	cd 40                	int    $0x40
  9a:	c3                   	ret    

0000009b <write>:
  9b:	b8 10 00 00 00       	mov    $0x10,%eax
  a0:	cd 40                	int    $0x40
  a2:	c3                   	ret    

000000a3 <close>:
  a3:	b8 15 00 00 00       	mov    $0x15,%eax
  a8:	cd 40                	int    $0x40
  aa:	c3                   	ret    

000000ab <kill>:
  ab:	b8 06 00 00 00       	mov    $0x6,%eax
  b0:	cd 40                	int    $0x40
  b2:	c3                   	ret    

000000b3 <exec>:
  b3:	b8 07 00 00 00       	mov    $0x7,%eax
  b8:	cd 40                	int    $0x40
  ba:	c3                   	ret    

000000bb <open>:
  bb:	b8 0f 00 00 00       	mov    $0xf,%eax
  c0:	cd 40                	int    $0x40
  c2:	c3                   	ret    

000000c3 <mknod>:
  c3:	b8 11 00 00 00       	mov    $0x11,%eax
  c8:	cd 40                	int    $0x40
  ca:	c3                   	ret    

000000cb <unlink>:
  cb:	b8 12 00 00 00       	mov    $0x12,%eax
  d0:	cd 40                	int    $0x40
  d2:	c3                   	ret    

000000d3 <fstat>:
  d3:	b8 08 00 00 00       	mov    $0x8,%eax
  d8:	cd 40                	int    $0x40
  da:	c3                   	ret    

000000db <link>:
  db:	b8 13 00 00 00       	mov    $0x13,%eax
  e0:	cd 40                	int    $0x40
  e2:	c3                   	ret    

000000e3 <mkdir>:
  e3:	b8 14 00 00 00       	mov    $0x14,%eax
  e8:	cd 40                	int    $0x40
  ea:	c3                   	ret    

000000eb <chdir>:
  eb:	b8 09 00 00 00       	mov    $0x9,%eax
  f0:	cd 40                	int    $0x40
  f2:	c3                   	ret    

000000f3 <dup>:
  f3:	b8 0a 00 00 00       	mov    $0xa,%eax
  f8:	cd 40                	int    $0x40
  fa:	c3                   	ret    

000000fb <getpid>:
  fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 100:	cd 40                	int    $0x40
 102:	c3                   	ret    

00000103 <sbrk>:
 103:	b8 0c 00 00 00       	mov    $0xc,%eax
 108:	cd 40                	int    $0x40
 10a:	c3                   	ret    

0000010b <sleep>:
 10b:	b8 0d 00 00 00       	mov    $0xd,%eax
 110:	cd 40                	int    $0x40
 112:	c3                   	ret    

00000113 <uptime>:
 113:	b8 0e 00 00 00       	mov    $0xe,%eax
 118:	cd 40                	int    $0x40
 11a:	c3                   	ret    

0000011b <yield>:
 11b:	b8 16 00 00 00       	mov    $0x16,%eax
 120:	cd 40                	int    $0x40
 122:	c3                   	ret    

00000123 <shutdown>:
 123:	b8 17 00 00 00       	mov    $0x17,%eax
 128:	cd 40                	int    $0x40
 12a:	c3                   	ret    

0000012b <putc>:
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	83 ec 1c             	sub    $0x1c,%esp
 131:	88 55 f4             	mov    %dl,-0xc(%ebp)
 134:	6a 01                	push   $0x1
 136:	8d 55 f4             	lea    -0xc(%ebp),%edx
 139:	52                   	push   %edx
 13a:	50                   	push   %eax
 13b:	e8 5b ff ff ff       	call   9b <write>
 140:	83 c4 10             	add    $0x10,%esp
 143:	c9                   	leave  
 144:	c3                   	ret    

00000145 <printint>:
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
 148:	57                   	push   %edi
 149:	56                   	push   %esi
 14a:	53                   	push   %ebx
 14b:	83 ec 2c             	sub    $0x2c,%esp
 14e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 151:	89 d0                	mov    %edx,%eax
 153:	89 ce                	mov    %ecx,%esi
 155:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 159:	0f 95 c1             	setne  %cl
 15c:	c1 ea 1f             	shr    $0x1f,%edx
 15f:	84 d1                	test   %dl,%cl
 161:	74 44                	je     1a7 <printint+0x62>
 163:	f7 d8                	neg    %eax
 165:	89 c1                	mov    %eax,%ecx
 167:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 16e:	bb 00 00 00 00       	mov    $0x0,%ebx
 173:	89 c8                	mov    %ecx,%eax
 175:	ba 00 00 00 00       	mov    $0x0,%edx
 17a:	f7 f6                	div    %esi
 17c:	89 df                	mov    %ebx,%edi
 17e:	83 c3 01             	add    $0x1,%ebx
 181:	0f b6 92 c4 03 00 00 	movzbl 0x3c4(%edx),%edx
 188:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 18c:	89 ca                	mov    %ecx,%edx
 18e:	89 c1                	mov    %eax,%ecx
 190:	39 d6                	cmp    %edx,%esi
 192:	76 df                	jbe    173 <printint+0x2e>
 194:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 198:	74 31                	je     1cb <printint+0x86>
 19a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 19f:	8d 5f 02             	lea    0x2(%edi),%ebx
 1a2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1a5:	eb 17                	jmp    1be <printint+0x79>
 1a7:	89 c1                	mov    %eax,%ecx
 1a9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 1b0:	eb bc                	jmp    16e <printint+0x29>
 1b2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 1b7:	89 f0                	mov    %esi,%eax
 1b9:	e8 6d ff ff ff       	call   12b <putc>
 1be:	83 eb 01             	sub    $0x1,%ebx
 1c1:	79 ef                	jns    1b2 <printint+0x6d>
 1c3:	83 c4 2c             	add    $0x2c,%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1ce:	eb ee                	jmp    1be <printint+0x79>

000001d0 <printf>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8d 45 10             	lea    0x10(%ebp),%eax
 1dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1df:	be 00 00 00 00       	mov    $0x0,%esi
 1e4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e9:	eb 14                	jmp    1ff <printf+0x2f>
 1eb:	89 fa                	mov    %edi,%edx
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	e8 36 ff ff ff       	call   12b <putc>
 1f5:	eb 05                	jmp    1fc <printf+0x2c>
 1f7:	83 fe 25             	cmp    $0x25,%esi
 1fa:	74 25                	je     221 <printf+0x51>
 1fc:	83 c3 01             	add    $0x1,%ebx
 1ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 202:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 206:	84 c0                	test   %al,%al
 208:	0f 84 20 01 00 00    	je     32e <printf+0x15e>
 20e:	0f be f8             	movsbl %al,%edi
 211:	0f b6 c0             	movzbl %al,%eax
 214:	85 f6                	test   %esi,%esi
 216:	75 df                	jne    1f7 <printf+0x27>
 218:	83 f8 25             	cmp    $0x25,%eax
 21b:	75 ce                	jne    1eb <printf+0x1b>
 21d:	89 c6                	mov    %eax,%esi
 21f:	eb db                	jmp    1fc <printf+0x2c>
 221:	83 f8 25             	cmp    $0x25,%eax
 224:	0f 84 cf 00 00 00    	je     2f9 <printf+0x129>
 22a:	0f 8c dd 00 00 00    	jl     30d <printf+0x13d>
 230:	83 f8 78             	cmp    $0x78,%eax
 233:	0f 8f d4 00 00 00    	jg     30d <printf+0x13d>
 239:	83 f8 63             	cmp    $0x63,%eax
 23c:	0f 8c cb 00 00 00    	jl     30d <printf+0x13d>
 242:	83 e8 63             	sub    $0x63,%eax
 245:	83 f8 15             	cmp    $0x15,%eax
 248:	0f 87 bf 00 00 00    	ja     30d <printf+0x13d>
 24e:	ff 24 85 6c 03 00 00 	jmp    *0x36c(,%eax,4)
 255:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 258:	8b 17                	mov    (%edi),%edx
 25a:	83 ec 0c             	sub    $0xc,%esp
 25d:	6a 01                	push   $0x1
 25f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	e8 d9 fe ff ff       	call   145 <printint>
 26c:	83 c7 04             	add    $0x4,%edi
 26f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 272:	83 c4 10             	add    $0x10,%esp
 275:	be 00 00 00 00       	mov    $0x0,%esi
 27a:	eb 80                	jmp    1fc <printf+0x2c>
 27c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 27f:	8b 17                	mov    (%edi),%edx
 281:	83 ec 0c             	sub    $0xc,%esp
 284:	6a 00                	push   $0x0
 286:	b9 10 00 00 00       	mov    $0x10,%ecx
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	e8 b2 fe ff ff       	call   145 <printint>
 293:	83 c7 04             	add    $0x4,%edi
 296:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 299:	83 c4 10             	add    $0x10,%esp
 29c:	be 00 00 00 00       	mov    $0x0,%esi
 2a1:	e9 56 ff ff ff       	jmp    1fc <printf+0x2c>
 2a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2a9:	8b 30                	mov    (%eax),%esi
 2ab:	83 c0 04             	add    $0x4,%eax
 2ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2b1:	85 f6                	test   %esi,%esi
 2b3:	75 15                	jne    2ca <printf+0xfa>
 2b5:	be 65 03 00 00       	mov    $0x365,%esi
 2ba:	eb 0e                	jmp    2ca <printf+0xfa>
 2bc:	0f be d2             	movsbl %dl,%edx
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	e8 64 fe ff ff       	call   12b <putc>
 2c7:	83 c6 01             	add    $0x1,%esi
 2ca:	0f b6 16             	movzbl (%esi),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	75 eb                	jne    2bc <printf+0xec>
 2d1:	be 00 00 00 00       	mov    $0x0,%esi
 2d6:	e9 21 ff ff ff       	jmp    1fc <printf+0x2c>
 2db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2de:	0f be 17             	movsbl (%edi),%edx
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	e8 42 fe ff ff       	call   12b <putc>
 2e9:	83 c7 04             	add    $0x4,%edi
 2ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2ef:	be 00 00 00 00       	mov    $0x0,%esi
 2f4:	e9 03 ff ff ff       	jmp    1fc <printf+0x2c>
 2f9:	89 fa                	mov    %edi,%edx
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
 2fe:	e8 28 fe ff ff       	call   12b <putc>
 303:	be 00 00 00 00       	mov    $0x0,%esi
 308:	e9 ef fe ff ff       	jmp    1fc <printf+0x2c>
 30d:	ba 25 00 00 00       	mov    $0x25,%edx
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	e8 11 fe ff ff       	call   12b <putc>
 31a:	89 fa                	mov    %edi,%edx
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
 31f:	e8 07 fe ff ff       	call   12b <putc>
 324:	be 00 00 00 00       	mov    $0x0,%esi
 329:	e9 ce fe ff ff       	jmp    1fc <printf+0x2c>
 32e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 331:	5b                   	pop    %ebx
 332:	5e                   	pop    %esi
 333:	5f                   	pop    %edi
 334:	5d                   	pop    %ebp
 335:	c3                   	ret    
