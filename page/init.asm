
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
  14:	68 b8 03 00 00       	push   $0x3b8
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
  47:	68 b8 03 00 00       	push   $0x3b8
  4c:	e8 dc 00 00 00       	call   12d <mknod>
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 b8 03 00 00       	push   $0x3b8
  5b:	e8 c5 00 00 00       	call   125 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 d3 03 00 00       	push   $0x3d3
  6d:	6a 01                	push   $0x1
  6f:	e8 de 01 00 00       	call   252 <printf>
  74:	e8 6c 00 00 00       	call   e5 <exit>
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 ff 03 00 00       	push   $0x3ff
  81:	6a 01                	push   $0x1
  83:	e8 ca 01 00 00       	call   252 <printf>
  88:	83 c4 10             	add    $0x10,%esp
  8b:	e8 5d 00 00 00       	call   ed <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 c0 03 00 00       	push   $0x3c0
  a0:	6a 01                	push   $0x1
  a2:	e8 ab 01 00 00       	call   252 <printf>
  a7:	e8 31 00 00 00       	call   dd <fork>
  ac:	89 c3                	mov    %eax,%ebx
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
  b5:	75 d4                	jne    8b <main+0x8b>
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 7c 04 00 00       	push   $0x47c
  bf:	68 e6 03 00 00       	push   $0x3e6
  c4:	e8 54 00 00 00       	call   11d <exec>
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 e9 03 00 00       	push   $0x3e9
  d1:	6a 01                	push   $0x1
  d3:	e8 7a 01 00 00       	call   252 <printf>
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

00000195 <getpagetableentry>:
 195:	b8 18 00 00 00       	mov    $0x18,%eax
 19a:	cd 40                	int    $0x40
 19c:	c3                   	ret    

0000019d <isphysicalpagefree>:
 19d:	b8 19 00 00 00       	mov    $0x19,%eax
 1a2:	cd 40                	int    $0x40
 1a4:	c3                   	ret    

000001a5 <dumppagetable>:
 1a5:	b8 1a 00 00 00       	mov    $0x1a,%eax
 1aa:	cd 40                	int    $0x40
 1ac:	c3                   	ret    

000001ad <putc>:
 1ad:	55                   	push   %ebp
 1ae:	89 e5                	mov    %esp,%ebp
 1b0:	83 ec 1c             	sub    $0x1c,%esp
 1b3:	88 55 f4             	mov    %dl,-0xc(%ebp)
 1b6:	6a 01                	push   $0x1
 1b8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 1bb:	52                   	push   %edx
 1bc:	50                   	push   %eax
 1bd:	e8 43 ff ff ff       	call   105 <write>
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	c9                   	leave  
 1c6:	c3                   	ret    

000001c7 <printint>:
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	57                   	push   %edi
 1cb:	56                   	push   %esi
 1cc:	53                   	push   %ebx
 1cd:	83 ec 2c             	sub    $0x2c,%esp
 1d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1d3:	89 d0                	mov    %edx,%eax
 1d5:	89 ce                	mov    %ecx,%esi
 1d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 1db:	0f 95 c1             	setne  %cl
 1de:	c1 ea 1f             	shr    $0x1f,%edx
 1e1:	84 d1                	test   %dl,%cl
 1e3:	74 44                	je     229 <printint+0x62>
 1e5:	f7 d8                	neg    %eax
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 1f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1f5:	89 c8                	mov    %ecx,%eax
 1f7:	ba 00 00 00 00       	mov    $0x0,%edx
 1fc:	f7 f6                	div    %esi
 1fe:	89 df                	mov    %ebx,%edi
 200:	83 c3 01             	add    $0x1,%ebx
 203:	0f b6 92 68 04 00 00 	movzbl 0x468(%edx),%edx
 20a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 20e:	89 ca                	mov    %ecx,%edx
 210:	89 c1                	mov    %eax,%ecx
 212:	39 d6                	cmp    %edx,%esi
 214:	76 df                	jbe    1f5 <printint+0x2e>
 216:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 21a:	74 31                	je     24d <printint+0x86>
 21c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 221:	8d 5f 02             	lea    0x2(%edi),%ebx
 224:	8b 75 d0             	mov    -0x30(%ebp),%esi
 227:	eb 17                	jmp    240 <printint+0x79>
 229:	89 c1                	mov    %eax,%ecx
 22b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 232:	eb bc                	jmp    1f0 <printint+0x29>
 234:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 239:	89 f0                	mov    %esi,%eax
 23b:	e8 6d ff ff ff       	call   1ad <putc>
 240:	83 eb 01             	sub    $0x1,%ebx
 243:	79 ef                	jns    234 <printint+0x6d>
 245:	83 c4 2c             	add    $0x2c,%esp
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5f                   	pop    %edi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 250:	eb ee                	jmp    240 <printint+0x79>

00000252 <printf>:
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	57                   	push   %edi
 256:	56                   	push   %esi
 257:	53                   	push   %ebx
 258:	83 ec 1c             	sub    $0x1c,%esp
 25b:	8d 45 10             	lea    0x10(%ebp),%eax
 25e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 261:	be 00 00 00 00       	mov    $0x0,%esi
 266:	bb 00 00 00 00       	mov    $0x0,%ebx
 26b:	eb 14                	jmp    281 <printf+0x2f>
 26d:	89 fa                	mov    %edi,%edx
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	e8 36 ff ff ff       	call   1ad <putc>
 277:	eb 05                	jmp    27e <printf+0x2c>
 279:	83 fe 25             	cmp    $0x25,%esi
 27c:	74 25                	je     2a3 <printf+0x51>
 27e:	83 c3 01             	add    $0x1,%ebx
 281:	8b 45 0c             	mov    0xc(%ebp),%eax
 284:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 288:	84 c0                	test   %al,%al
 28a:	0f 84 20 01 00 00    	je     3b0 <printf+0x15e>
 290:	0f be f8             	movsbl %al,%edi
 293:	0f b6 c0             	movzbl %al,%eax
 296:	85 f6                	test   %esi,%esi
 298:	75 df                	jne    279 <printf+0x27>
 29a:	83 f8 25             	cmp    $0x25,%eax
 29d:	75 ce                	jne    26d <printf+0x1b>
 29f:	89 c6                	mov    %eax,%esi
 2a1:	eb db                	jmp    27e <printf+0x2c>
 2a3:	83 f8 25             	cmp    $0x25,%eax
 2a6:	0f 84 cf 00 00 00    	je     37b <printf+0x129>
 2ac:	0f 8c dd 00 00 00    	jl     38f <printf+0x13d>
 2b2:	83 f8 78             	cmp    $0x78,%eax
 2b5:	0f 8f d4 00 00 00    	jg     38f <printf+0x13d>
 2bb:	83 f8 63             	cmp    $0x63,%eax
 2be:	0f 8c cb 00 00 00    	jl     38f <printf+0x13d>
 2c4:	83 e8 63             	sub    $0x63,%eax
 2c7:	83 f8 15             	cmp    $0x15,%eax
 2ca:	0f 87 bf 00 00 00    	ja     38f <printf+0x13d>
 2d0:	ff 24 85 10 04 00 00 	jmp    *0x410(,%eax,4)
 2d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2da:	8b 17                	mov    (%edi),%edx
 2dc:	83 ec 0c             	sub    $0xc,%esp
 2df:	6a 01                	push   $0x1
 2e1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2e6:	8b 45 08             	mov    0x8(%ebp),%eax
 2e9:	e8 d9 fe ff ff       	call   1c7 <printint>
 2ee:	83 c7 04             	add    $0x4,%edi
 2f1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 2f4:	83 c4 10             	add    $0x10,%esp
 2f7:	be 00 00 00 00       	mov    $0x0,%esi
 2fc:	eb 80                	jmp    27e <printf+0x2c>
 2fe:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 301:	8b 17                	mov    (%edi),%edx
 303:	83 ec 0c             	sub    $0xc,%esp
 306:	6a 00                	push   $0x0
 308:	b9 10 00 00 00       	mov    $0x10,%ecx
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	e8 b2 fe ff ff       	call   1c7 <printint>
 315:	83 c7 04             	add    $0x4,%edi
 318:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 31b:	83 c4 10             	add    $0x10,%esp
 31e:	be 00 00 00 00       	mov    $0x0,%esi
 323:	e9 56 ff ff ff       	jmp    27e <printf+0x2c>
 328:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 32b:	8b 30                	mov    (%eax),%esi
 32d:	83 c0 04             	add    $0x4,%eax
 330:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 333:	85 f6                	test   %esi,%esi
 335:	75 15                	jne    34c <printf+0xfa>
 337:	be 08 04 00 00       	mov    $0x408,%esi
 33c:	eb 0e                	jmp    34c <printf+0xfa>
 33e:	0f be d2             	movsbl %dl,%edx
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	e8 64 fe ff ff       	call   1ad <putc>
 349:	83 c6 01             	add    $0x1,%esi
 34c:	0f b6 16             	movzbl (%esi),%edx
 34f:	84 d2                	test   %dl,%dl
 351:	75 eb                	jne    33e <printf+0xec>
 353:	be 00 00 00 00       	mov    $0x0,%esi
 358:	e9 21 ff ff ff       	jmp    27e <printf+0x2c>
 35d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 360:	0f be 17             	movsbl (%edi),%edx
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	e8 42 fe ff ff       	call   1ad <putc>
 36b:	83 c7 04             	add    $0x4,%edi
 36e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 371:	be 00 00 00 00       	mov    $0x0,%esi
 376:	e9 03 ff ff ff       	jmp    27e <printf+0x2c>
 37b:	89 fa                	mov    %edi,%edx
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
 380:	e8 28 fe ff ff       	call   1ad <putc>
 385:	be 00 00 00 00       	mov    $0x0,%esi
 38a:	e9 ef fe ff ff       	jmp    27e <printf+0x2c>
 38f:	ba 25 00 00 00       	mov    $0x25,%edx
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	e8 11 fe ff ff       	call   1ad <putc>
 39c:	89 fa                	mov    %edi,%edx
 39e:	8b 45 08             	mov    0x8(%ebp),%eax
 3a1:	e8 07 fe ff ff       	call   1ad <putc>
 3a6:	be 00 00 00 00       	mov    $0x0,%esi
 3ab:	e9 ce fe ff ff       	jmp    27e <printf+0x2c>
 3b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b3:	5b                   	pop    %ebx
 3b4:	5e                   	pop    %esi
 3b5:	5f                   	pop    %edi
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
