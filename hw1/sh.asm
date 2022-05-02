
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   8:	8b 75 0c             	mov    0xc(%ebp),%esi
   b:	83 ec 08             	sub    $0x8,%esp
   e:	68 5c 0f 00 00       	push   $0xf5c
  13:	6a 02                	push   $0x2
  15:	e8 92 0c 00 00       	call   cac <printf>
  1a:	83 c4 0c             	add    $0xc,%esp
  1d:	56                   	push   %esi
  1e:	6a 00                	push   $0x0
  20:	53                   	push   %ebx
  21:	e8 f6 09 00 00       	call   a1c <memset>
  26:	83 c4 08             	add    $0x8,%esp
  29:	56                   	push   %esi
  2a:	53                   	push   %ebx
  2b:	e8 28 0a 00 00       	call   a58 <gets>
  30:	83 c4 10             	add    $0x10,%esp
  33:	80 3b 00             	cmpb   $0x0,(%ebx)
  36:	74 0c                	je     44 <getcmd+0x44>
  38:	b8 00 00 00 00       	mov    $0x0,%eax
  3d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  40:	5b                   	pop    %ebx
  41:	5e                   	pop    %esi
  42:	5d                   	pop    %ebp
  43:	c3                   	ret    
  44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  49:	eb f2                	jmp    3d <getcmd+0x3d>

0000004b <panic>:
  4b:	55                   	push   %ebp
  4c:	89 e5                	mov    %esp,%ebp
  4e:	83 ec 0c             	sub    $0xc,%esp
  51:	ff 75 08             	pushl  0x8(%ebp)
  54:	68 f9 0f 00 00       	push   $0xff9
  59:	6a 02                	push   $0x2
  5b:	e8 4c 0c 00 00       	call   cac <printf>
  60:	e8 f2 0a 00 00       	call   b57 <exit>

00000065 <fork1>:
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	83 ec 08             	sub    $0x8,%esp
  6b:	e8 df 0a 00 00       	call   b4f <fork>
  70:	83 f8 ff             	cmp    $0xffffffff,%eax
  73:	74 02                	je     77 <fork1+0x12>
  75:	c9                   	leave  
  76:	c3                   	ret    
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 5f 0f 00 00       	push   $0xf5f
  7f:	e8 c7 ff ff ff       	call   4b <panic>

00000084 <runcmd>:
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	83 ec 14             	sub    $0x14,%esp
  8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8e:	85 db                	test   %ebx,%ebx
  90:	74 0e                	je     a0 <runcmd+0x1c>
  92:	8b 03                	mov    (%ebx),%eax
  94:	83 f8 05             	cmp    $0x5,%eax
  97:	77 0c                	ja     a5 <runcmd+0x21>
  99:	ff 24 85 14 10 00 00 	jmp    *0x1014(,%eax,4)
  a0:	e8 b2 0a 00 00       	call   b57 <exit>
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	68 64 0f 00 00       	push   $0xf64
  ad:	e8 99 ff ff ff       	call   4b <panic>
  b2:	8b 43 04             	mov    0x4(%ebx),%eax
  b5:	85 c0                	test   %eax,%eax
  b7:	74 27                	je     e0 <runcmd+0x5c>
  b9:	8d 53 04             	lea    0x4(%ebx),%edx
  bc:	83 ec 08             	sub    $0x8,%esp
  bf:	52                   	push   %edx
  c0:	50                   	push   %eax
  c1:	e8 c9 0a 00 00       	call   b8f <exec>
  c6:	83 c4 0c             	add    $0xc,%esp
  c9:	ff 73 04             	pushl  0x4(%ebx)
  cc:	68 6b 0f 00 00       	push   $0xf6b
  d1:	6a 02                	push   $0x2
  d3:	e8 d4 0b 00 00       	call   cac <printf>
  d8:	83 c4 10             	add    $0x10,%esp
  db:	e8 77 0a 00 00       	call   b57 <exit>
  e0:	e8 72 0a 00 00       	call   b57 <exit>
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	ff 73 14             	pushl  0x14(%ebx)
  eb:	e8 8f 0a 00 00       	call   b7f <close>
  f0:	83 c4 08             	add    $0x8,%esp
  f3:	ff 73 10             	pushl  0x10(%ebx)
  f6:	ff 73 08             	pushl  0x8(%ebx)
  f9:	e8 99 0a 00 00       	call   b97 <open>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	78 0b                	js     110 <runcmd+0x8c>
 105:	83 ec 0c             	sub    $0xc,%esp
 108:	ff 73 04             	pushl  0x4(%ebx)
 10b:	e8 74 ff ff ff       	call   84 <runcmd>
 110:	83 ec 04             	sub    $0x4,%esp
 113:	ff 73 08             	pushl  0x8(%ebx)
 116:	68 7b 0f 00 00       	push   $0xf7b
 11b:	6a 02                	push   $0x2
 11d:	e8 8a 0b 00 00       	call   cac <printf>
 122:	e8 30 0a 00 00       	call   b57 <exit>
 127:	e8 39 ff ff ff       	call   65 <fork1>
 12c:	85 c0                	test   %eax,%eax
 12e:	74 10                	je     140 <runcmd+0xbc>
 130:	e8 2a 0a 00 00       	call   b5f <wait>
 135:	83 ec 0c             	sub    $0xc,%esp
 138:	ff 73 08             	pushl  0x8(%ebx)
 13b:	e8 44 ff ff ff       	call   84 <runcmd>
 140:	83 ec 0c             	sub    $0xc,%esp
 143:	ff 73 04             	pushl  0x4(%ebx)
 146:	e8 39 ff ff ff       	call   84 <runcmd>
 14b:	83 ec 0c             	sub    $0xc,%esp
 14e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 151:	50                   	push   %eax
 152:	e8 10 0a 00 00       	call   b67 <pipe>
 157:	83 c4 10             	add    $0x10,%esp
 15a:	85 c0                	test   %eax,%eax
 15c:	78 3a                	js     198 <runcmd+0x114>
 15e:	e8 02 ff ff ff       	call   65 <fork1>
 163:	85 c0                	test   %eax,%eax
 165:	74 3e                	je     1a5 <runcmd+0x121>
 167:	e8 f9 fe ff ff       	call   65 <fork1>
 16c:	85 c0                	test   %eax,%eax
 16e:	74 6b                	je     1db <runcmd+0x157>
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	ff 75 f0             	pushl  -0x10(%ebp)
 176:	e8 04 0a 00 00       	call   b7f <close>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 75 f4             	pushl  -0xc(%ebp)
 181:	e8 f9 09 00 00       	call   b7f <close>
 186:	e8 d4 09 00 00       	call   b5f <wait>
 18b:	e8 cf 09 00 00       	call   b5f <wait>
 190:	83 c4 10             	add    $0x10,%esp
 193:	e9 43 ff ff ff       	jmp    db <runcmd+0x57>
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	68 8b 0f 00 00       	push   $0xf8b
 1a0:	e8 a6 fe ff ff       	call   4b <panic>
 1a5:	83 ec 0c             	sub    $0xc,%esp
 1a8:	6a 01                	push   $0x1
 1aa:	e8 d0 09 00 00       	call   b7f <close>
 1af:	83 c4 04             	add    $0x4,%esp
 1b2:	ff 75 f4             	pushl  -0xc(%ebp)
 1b5:	e8 15 0a 00 00       	call   bcf <dup>
 1ba:	83 c4 04             	add    $0x4,%esp
 1bd:	ff 75 f0             	pushl  -0x10(%ebp)
 1c0:	e8 ba 09 00 00       	call   b7f <close>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 75 f4             	pushl  -0xc(%ebp)
 1cb:	e8 af 09 00 00       	call   b7f <close>
 1d0:	83 c4 04             	add    $0x4,%esp
 1d3:	ff 73 04             	pushl  0x4(%ebx)
 1d6:	e8 a9 fe ff ff       	call   84 <runcmd>
 1db:	83 ec 0c             	sub    $0xc,%esp
 1de:	6a 00                	push   $0x0
 1e0:	e8 9a 09 00 00       	call   b7f <close>
 1e5:	83 c4 04             	add    $0x4,%esp
 1e8:	ff 75 f0             	pushl  -0x10(%ebp)
 1eb:	e8 df 09 00 00       	call   bcf <dup>
 1f0:	83 c4 04             	add    $0x4,%esp
 1f3:	ff 75 f0             	pushl  -0x10(%ebp)
 1f6:	e8 84 09 00 00       	call   b7f <close>
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 75 f4             	pushl  -0xc(%ebp)
 201:	e8 79 09 00 00       	call   b7f <close>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 73 08             	pushl  0x8(%ebx)
 20c:	e8 73 fe ff ff       	call   84 <runcmd>
 211:	e8 4f fe ff ff       	call   65 <fork1>
 216:	85 c0                	test   %eax,%eax
 218:	0f 85 bd fe ff ff    	jne    db <runcmd+0x57>
 21e:	83 ec 0c             	sub    $0xc,%esp
 221:	ff 73 04             	pushl  0x4(%ebx)
 224:	e8 5b fe ff ff       	call   84 <runcmd>

00000229 <execcmd>:
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	53                   	push   %ebx
 22d:	83 ec 10             	sub    $0x10,%esp
 230:	68 a4 00 00 00       	push   $0xa4
 235:	e8 98 0c 00 00       	call   ed2 <malloc>
 23a:	89 c3                	mov    %eax,%ebx
 23c:	83 c4 0c             	add    $0xc,%esp
 23f:	68 a4 00 00 00       	push   $0xa4
 244:	6a 00                	push   $0x0
 246:	50                   	push   %eax
 247:	e8 d0 07 00 00       	call   a1c <memset>
 24c:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 252:	89 d8                	mov    %ebx,%eax
 254:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 257:	c9                   	leave  
 258:	c3                   	ret    

00000259 <redircmd>:
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	53                   	push   %ebx
 25d:	83 ec 10             	sub    $0x10,%esp
 260:	6a 18                	push   $0x18
 262:	e8 6b 0c 00 00       	call   ed2 <malloc>
 267:	89 c3                	mov    %eax,%ebx
 269:	83 c4 0c             	add    $0xc,%esp
 26c:	6a 18                	push   $0x18
 26e:	6a 00                	push   $0x0
 270:	50                   	push   %eax
 271:	e8 a6 07 00 00       	call   a1c <memset>
 276:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	89 43 04             	mov    %eax,0x4(%ebx)
 282:	8b 45 0c             	mov    0xc(%ebp),%eax
 285:	89 43 08             	mov    %eax,0x8(%ebx)
 288:	8b 45 10             	mov    0x10(%ebp),%eax
 28b:	89 43 0c             	mov    %eax,0xc(%ebx)
 28e:	8b 45 14             	mov    0x14(%ebp),%eax
 291:	89 43 10             	mov    %eax,0x10(%ebx)
 294:	8b 45 18             	mov    0x18(%ebp),%eax
 297:	89 43 14             	mov    %eax,0x14(%ebx)
 29a:	89 d8                	mov    %ebx,%eax
 29c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <pipecmd>:
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	53                   	push   %ebx
 2a5:	83 ec 10             	sub    $0x10,%esp
 2a8:	6a 0c                	push   $0xc
 2aa:	e8 23 0c 00 00       	call   ed2 <malloc>
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	83 c4 0c             	add    $0xc,%esp
 2b4:	6a 0c                	push   $0xc
 2b6:	6a 00                	push   $0x0
 2b8:	50                   	push   %eax
 2b9:	e8 5e 07 00 00       	call   a1c <memset>
 2be:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	89 43 04             	mov    %eax,0x4(%ebx)
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 43 08             	mov    %eax,0x8(%ebx)
 2d0:	89 d8                	mov    %ebx,%eax
 2d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d5:	c9                   	leave  
 2d6:	c3                   	ret    

000002d7 <listcmd>:
 2d7:	55                   	push   %ebp
 2d8:	89 e5                	mov    %esp,%ebp
 2da:	53                   	push   %ebx
 2db:	83 ec 10             	sub    $0x10,%esp
 2de:	6a 0c                	push   $0xc
 2e0:	e8 ed 0b 00 00       	call   ed2 <malloc>
 2e5:	89 c3                	mov    %eax,%ebx
 2e7:	83 c4 0c             	add    $0xc,%esp
 2ea:	6a 0c                	push   $0xc
 2ec:	6a 00                	push   $0x0
 2ee:	50                   	push   %eax
 2ef:	e8 28 07 00 00       	call   a1c <memset>
 2f4:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
 2fd:	89 43 04             	mov    %eax,0x4(%ebx)
 300:	8b 45 0c             	mov    0xc(%ebp),%eax
 303:	89 43 08             	mov    %eax,0x8(%ebx)
 306:	89 d8                	mov    %ebx,%eax
 308:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30b:	c9                   	leave  
 30c:	c3                   	ret    

0000030d <backcmd>:
 30d:	55                   	push   %ebp
 30e:	89 e5                	mov    %esp,%ebp
 310:	53                   	push   %ebx
 311:	83 ec 10             	sub    $0x10,%esp
 314:	6a 08                	push   $0x8
 316:	e8 b7 0b 00 00       	call   ed2 <malloc>
 31b:	89 c3                	mov    %eax,%ebx
 31d:	83 c4 0c             	add    $0xc,%esp
 320:	6a 08                	push   $0x8
 322:	6a 00                	push   $0x0
 324:	50                   	push   %eax
 325:	e8 f2 06 00 00       	call   a1c <memset>
 32a:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	89 43 04             	mov    %eax,0x4(%ebx)
 336:	89 d8                	mov    %ebx,%eax
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <gettoken>:
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	57                   	push   %edi
 341:	56                   	push   %esi
 342:	53                   	push   %ebx
 343:	83 ec 0c             	sub    $0xc,%esp
 346:	8b 75 0c             	mov    0xc(%ebp),%esi
 349:	8b 7d 10             	mov    0x10(%ebp),%edi
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	8b 18                	mov    (%eax),%ebx
 351:	eb 03                	jmp    356 <gettoken+0x19>
 353:	83 c3 01             	add    $0x1,%ebx
 356:	39 f3                	cmp    %esi,%ebx
 358:	73 18                	jae    372 <gettoken+0x35>
 35a:	83 ec 08             	sub    $0x8,%esp
 35d:	0f be 03             	movsbl (%ebx),%eax
 360:	50                   	push   %eax
 361:	68 20 16 00 00       	push   $0x1620
 366:	e8 ca 06 00 00       	call   a35 <strchr>
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	75 e1                	jne    353 <gettoken+0x16>
 372:	85 ff                	test   %edi,%edi
 374:	74 02                	je     378 <gettoken+0x3b>
 376:	89 1f                	mov    %ebx,(%edi)
 378:	0f b6 03             	movzbl (%ebx),%eax
 37b:	0f be f8             	movsbl %al,%edi
 37e:	3c 3c                	cmp    $0x3c,%al
 380:	7f 27                	jg     3a9 <gettoken+0x6c>
 382:	3c 3b                	cmp    $0x3b,%al
 384:	7d 13                	jge    399 <gettoken+0x5c>
 386:	84 c0                	test   %al,%al
 388:	74 12                	je     39c <gettoken+0x5f>
 38a:	78 41                	js     3cd <gettoken+0x90>
 38c:	3c 26                	cmp    $0x26,%al
 38e:	74 09                	je     399 <gettoken+0x5c>
 390:	7c 3b                	jl     3cd <gettoken+0x90>
 392:	83 e8 28             	sub    $0x28,%eax
 395:	3c 01                	cmp    $0x1,%al
 397:	77 34                	ja     3cd <gettoken+0x90>
 399:	83 c3 01             	add    $0x1,%ebx
 39c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3a0:	74 77                	je     419 <gettoken+0xdc>
 3a2:	8b 45 14             	mov    0x14(%ebp),%eax
 3a5:	89 18                	mov    %ebx,(%eax)
 3a7:	eb 70                	jmp    419 <gettoken+0xdc>
 3a9:	3c 3e                	cmp    $0x3e,%al
 3ab:	75 0d                	jne    3ba <gettoken+0x7d>
 3ad:	8d 43 01             	lea    0x1(%ebx),%eax
 3b0:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
 3b4:	74 0a                	je     3c0 <gettoken+0x83>
 3b6:	89 c3                	mov    %eax,%ebx
 3b8:	eb e2                	jmp    39c <gettoken+0x5f>
 3ba:	3c 7c                	cmp    $0x7c,%al
 3bc:	75 0f                	jne    3cd <gettoken+0x90>
 3be:	eb d9                	jmp    399 <gettoken+0x5c>
 3c0:	83 c3 02             	add    $0x2,%ebx
 3c3:	bf 2b 00 00 00       	mov    $0x2b,%edi
 3c8:	eb d2                	jmp    39c <gettoken+0x5f>
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	39 f3                	cmp    %esi,%ebx
 3cf:	73 37                	jae    408 <gettoken+0xcb>
 3d1:	83 ec 08             	sub    $0x8,%esp
 3d4:	0f be 03             	movsbl (%ebx),%eax
 3d7:	50                   	push   %eax
 3d8:	68 20 16 00 00       	push   $0x1620
 3dd:	e8 53 06 00 00       	call   a35 <strchr>
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	75 26                	jne    40f <gettoken+0xd2>
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	0f be 03             	movsbl (%ebx),%eax
 3ef:	50                   	push   %eax
 3f0:	68 18 16 00 00       	push   $0x1618
 3f5:	e8 3b 06 00 00       	call   a35 <strchr>
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	85 c0                	test   %eax,%eax
 3ff:	74 c9                	je     3ca <gettoken+0x8d>
 401:	bf 61 00 00 00       	mov    $0x61,%edi
 406:	eb 94                	jmp    39c <gettoken+0x5f>
 408:	bf 61 00 00 00       	mov    $0x61,%edi
 40d:	eb 8d                	jmp    39c <gettoken+0x5f>
 40f:	bf 61 00 00 00       	mov    $0x61,%edi
 414:	eb 86                	jmp    39c <gettoken+0x5f>
 416:	83 c3 01             	add    $0x1,%ebx
 419:	39 f3                	cmp    %esi,%ebx
 41b:	73 18                	jae    435 <gettoken+0xf8>
 41d:	83 ec 08             	sub    $0x8,%esp
 420:	0f be 03             	movsbl (%ebx),%eax
 423:	50                   	push   %eax
 424:	68 20 16 00 00       	push   $0x1620
 429:	e8 07 06 00 00       	call   a35 <strchr>
 42e:	83 c4 10             	add    $0x10,%esp
 431:	85 c0                	test   %eax,%eax
 433:	75 e1                	jne    416 <gettoken+0xd9>
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	89 18                	mov    %ebx,(%eax)
 43a:	89 f8                	mov    %edi,%eax
 43c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43f:	5b                   	pop    %ebx
 440:	5e                   	pop    %esi
 441:	5f                   	pop    %edi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    

00000444 <peek>:
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	57                   	push   %edi
 448:	56                   	push   %esi
 449:	53                   	push   %ebx
 44a:	83 ec 0c             	sub    $0xc,%esp
 44d:	8b 7d 08             	mov    0x8(%ebp),%edi
 450:	8b 75 0c             	mov    0xc(%ebp),%esi
 453:	8b 1f                	mov    (%edi),%ebx
 455:	eb 03                	jmp    45a <peek+0x16>
 457:	83 c3 01             	add    $0x1,%ebx
 45a:	39 f3                	cmp    %esi,%ebx
 45c:	73 18                	jae    476 <peek+0x32>
 45e:	83 ec 08             	sub    $0x8,%esp
 461:	0f be 03             	movsbl (%ebx),%eax
 464:	50                   	push   %eax
 465:	68 20 16 00 00       	push   $0x1620
 46a:	e8 c6 05 00 00       	call   a35 <strchr>
 46f:	83 c4 10             	add    $0x10,%esp
 472:	85 c0                	test   %eax,%eax
 474:	75 e1                	jne    457 <peek+0x13>
 476:	89 1f                	mov    %ebx,(%edi)
 478:	0f b6 03             	movzbl (%ebx),%eax
 47b:	84 c0                	test   %al,%al
 47d:	75 0d                	jne    48c <peek+0x48>
 47f:	b8 00 00 00 00       	mov    $0x0,%eax
 484:	8d 65 f4             	lea    -0xc(%ebp),%esp
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
 48c:	83 ec 08             	sub    $0x8,%esp
 48f:	0f be c0             	movsbl %al,%eax
 492:	50                   	push   %eax
 493:	ff 75 10             	pushl  0x10(%ebp)
 496:	e8 9a 05 00 00       	call   a35 <strchr>
 49b:	83 c4 10             	add    $0x10,%esp
 49e:	85 c0                	test   %eax,%eax
 4a0:	74 07                	je     4a9 <peek+0x65>
 4a2:	b8 01 00 00 00       	mov    $0x1,%eax
 4a7:	eb db                	jmp    484 <peek+0x40>
 4a9:	b8 00 00 00 00       	mov    $0x0,%eax
 4ae:	eb d4                	jmp    484 <peek+0x40>

000004b0 <parseredirs>:
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 1c             	sub    $0x1c,%esp
 4b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 4bc:	8b 75 10             	mov    0x10(%ebp),%esi
 4bf:	eb 28                	jmp    4e9 <parseredirs+0x39>
 4c1:	83 ec 0c             	sub    $0xc,%esp
 4c4:	68 90 0f 00 00       	push   $0xf90
 4c9:	e8 7d fb ff ff       	call   4b <panic>
 4ce:	83 ec 0c             	sub    $0xc,%esp
 4d1:	6a 00                	push   $0x0
 4d3:	6a 00                	push   $0x0
 4d5:	ff 75 e0             	pushl  -0x20(%ebp)
 4d8:	ff 75 e4             	pushl  -0x1c(%ebp)
 4db:	ff 75 08             	pushl  0x8(%ebp)
 4de:	e8 76 fd ff ff       	call   259 <redircmd>
 4e3:	89 45 08             	mov    %eax,0x8(%ebp)
 4e6:	83 c4 20             	add    $0x20,%esp
 4e9:	83 ec 04             	sub    $0x4,%esp
 4ec:	68 ad 0f 00 00       	push   $0xfad
 4f1:	56                   	push   %esi
 4f2:	57                   	push   %edi
 4f3:	e8 4c ff ff ff       	call   444 <peek>
 4f8:	83 c4 10             	add    $0x10,%esp
 4fb:	85 c0                	test   %eax,%eax
 4fd:	74 76                	je     575 <parseredirs+0xc5>
 4ff:	6a 00                	push   $0x0
 501:	6a 00                	push   $0x0
 503:	56                   	push   %esi
 504:	57                   	push   %edi
 505:	e8 33 fe ff ff       	call   33d <gettoken>
 50a:	89 c3                	mov    %eax,%ebx
 50c:	8d 45 e0             	lea    -0x20(%ebp),%eax
 50f:	50                   	push   %eax
 510:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 513:	50                   	push   %eax
 514:	56                   	push   %esi
 515:	57                   	push   %edi
 516:	e8 22 fe ff ff       	call   33d <gettoken>
 51b:	83 c4 20             	add    $0x20,%esp
 51e:	83 f8 61             	cmp    $0x61,%eax
 521:	75 9e                	jne    4c1 <parseredirs+0x11>
 523:	83 fb 3c             	cmp    $0x3c,%ebx
 526:	74 a6                	je     4ce <parseredirs+0x1e>
 528:	83 fb 3e             	cmp    $0x3e,%ebx
 52b:	74 25                	je     552 <parseredirs+0xa2>
 52d:	83 fb 2b             	cmp    $0x2b,%ebx
 530:	75 b7                	jne    4e9 <parseredirs+0x39>
 532:	83 ec 0c             	sub    $0xc,%esp
 535:	6a 01                	push   $0x1
 537:	68 01 02 00 00       	push   $0x201
 53c:	ff 75 e0             	pushl  -0x20(%ebp)
 53f:	ff 75 e4             	pushl  -0x1c(%ebp)
 542:	ff 75 08             	pushl  0x8(%ebp)
 545:	e8 0f fd ff ff       	call   259 <redircmd>
 54a:	89 45 08             	mov    %eax,0x8(%ebp)
 54d:	83 c4 20             	add    $0x20,%esp
 550:	eb 97                	jmp    4e9 <parseredirs+0x39>
 552:	83 ec 0c             	sub    $0xc,%esp
 555:	6a 01                	push   $0x1
 557:	68 01 02 00 00       	push   $0x201
 55c:	ff 75 e0             	pushl  -0x20(%ebp)
 55f:	ff 75 e4             	pushl  -0x1c(%ebp)
 562:	ff 75 08             	pushl  0x8(%ebp)
 565:	e8 ef fc ff ff       	call   259 <redircmd>
 56a:	89 45 08             	mov    %eax,0x8(%ebp)
 56d:	83 c4 20             	add    $0x20,%esp
 570:	e9 74 ff ff ff       	jmp    4e9 <parseredirs+0x39>
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57b:	5b                   	pop    %ebx
 57c:	5e                   	pop    %esi
 57d:	5f                   	pop    %edi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <parseexec>:
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 30             	sub    $0x30,%esp
 589:	8b 75 08             	mov    0x8(%ebp),%esi
 58c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 58f:	68 b0 0f 00 00       	push   $0xfb0
 594:	57                   	push   %edi
 595:	56                   	push   %esi
 596:	e8 a9 fe ff ff       	call   444 <peek>
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	85 c0                	test   %eax,%eax
 5a0:	75 1d                	jne    5bf <parseexec+0x3f>
 5a2:	89 c3                	mov    %eax,%ebx
 5a4:	e8 80 fc ff ff       	call   229 <execcmd>
 5a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ac:	83 ec 04             	sub    $0x4,%esp
 5af:	57                   	push   %edi
 5b0:	56                   	push   %esi
 5b1:	50                   	push   %eax
 5b2:	e8 f9 fe ff ff       	call   4b0 <parseredirs>
 5b7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5ba:	83 c4 10             	add    $0x10,%esp
 5bd:	eb 35                	jmp    5f4 <parseexec+0x74>
 5bf:	83 ec 08             	sub    $0x8,%esp
 5c2:	57                   	push   %edi
 5c3:	56                   	push   %esi
 5c4:	e8 8f 01 00 00       	call   758 <parseblock>
 5c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5cc:	83 c4 10             	add    $0x10,%esp
 5cf:	e9 8a 00 00 00       	jmp    65e <parseexec+0xde>
 5d4:	83 ec 0c             	sub    $0xc,%esp
 5d7:	68 b2 0f 00 00       	push   $0xfb2
 5dc:	e8 6a fa ff ff       	call   4b <panic>
 5e1:	83 ec 04             	sub    $0x4,%esp
 5e4:	57                   	push   %edi
 5e5:	56                   	push   %esi
 5e6:	ff 75 d4             	pushl  -0x2c(%ebp)
 5e9:	e8 c2 fe ff ff       	call   4b0 <parseredirs>
 5ee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5f1:	83 c4 10             	add    $0x10,%esp
 5f4:	83 ec 04             	sub    $0x4,%esp
 5f7:	68 c7 0f 00 00       	push   $0xfc7
 5fc:	57                   	push   %edi
 5fd:	56                   	push   %esi
 5fe:	e8 41 fe ff ff       	call   444 <peek>
 603:	83 c4 10             	add    $0x10,%esp
 606:	85 c0                	test   %eax,%eax
 608:	75 41                	jne    64b <parseexec+0xcb>
 60a:	8d 45 e0             	lea    -0x20(%ebp),%eax
 60d:	50                   	push   %eax
 60e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 611:	50                   	push   %eax
 612:	57                   	push   %edi
 613:	56                   	push   %esi
 614:	e8 24 fd ff ff       	call   33d <gettoken>
 619:	83 c4 10             	add    $0x10,%esp
 61c:	85 c0                	test   %eax,%eax
 61e:	74 2b                	je     64b <parseexec+0xcb>
 620:	83 f8 61             	cmp    $0x61,%eax
 623:	75 af                	jne    5d4 <parseexec+0x54>
 625:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 628:	8b 55 d0             	mov    -0x30(%ebp),%edx
 62b:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
 62f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 632:	89 44 9a 54          	mov    %eax,0x54(%edx,%ebx,4)
 636:	83 c3 01             	add    $0x1,%ebx
 639:	83 fb 13             	cmp    $0x13,%ebx
 63c:	7e a3                	jle    5e1 <parseexec+0x61>
 63e:	83 ec 0c             	sub    $0xc,%esp
 641:	68 b9 0f 00 00       	push   $0xfb9
 646:	e8 00 fa ff ff       	call   4b <panic>
 64b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 64e:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
 655:	00 
 656:	c7 44 98 54 00 00 00 	movl   $0x0,0x54(%eax,%ebx,4)
 65d:	00 
 65e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 661:	8d 65 f4             	lea    -0xc(%ebp),%esp
 664:	5b                   	pop    %ebx
 665:	5e                   	pop    %esi
 666:	5f                   	pop    %edi
 667:	5d                   	pop    %ebp
 668:	c3                   	ret    

00000669 <parsepipe>:
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	57                   	push   %edi
 66d:	56                   	push   %esi
 66e:	53                   	push   %ebx
 66f:	83 ec 14             	sub    $0x14,%esp
 672:	8b 75 08             	mov    0x8(%ebp),%esi
 675:	8b 7d 0c             	mov    0xc(%ebp),%edi
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	e8 01 ff ff ff       	call   580 <parseexec>
 67f:	89 c3                	mov    %eax,%ebx
 681:	83 c4 0c             	add    $0xc,%esp
 684:	68 cc 0f 00 00       	push   $0xfcc
 689:	57                   	push   %edi
 68a:	56                   	push   %esi
 68b:	e8 b4 fd ff ff       	call   444 <peek>
 690:	83 c4 10             	add    $0x10,%esp
 693:	85 c0                	test   %eax,%eax
 695:	75 0a                	jne    6a1 <parsepipe+0x38>
 697:	89 d8                	mov    %ebx,%eax
 699:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69c:	5b                   	pop    %ebx
 69d:	5e                   	pop    %esi
 69e:	5f                   	pop    %edi
 69f:	5d                   	pop    %ebp
 6a0:	c3                   	ret    
 6a1:	6a 00                	push   $0x0
 6a3:	6a 00                	push   $0x0
 6a5:	57                   	push   %edi
 6a6:	56                   	push   %esi
 6a7:	e8 91 fc ff ff       	call   33d <gettoken>
 6ac:	83 c4 08             	add    $0x8,%esp
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 b3 ff ff ff       	call   669 <parsepipe>
 6b6:	83 c4 08             	add    $0x8,%esp
 6b9:	50                   	push   %eax
 6ba:	53                   	push   %ebx
 6bb:	e8 e1 fb ff ff       	call   2a1 <pipecmd>
 6c0:	89 c3                	mov    %eax,%ebx
 6c2:	83 c4 10             	add    $0x10,%esp
 6c5:	eb d0                	jmp    697 <parsepipe+0x2e>

000006c7 <parseline>:
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	57                   	push   %edi
 6cb:	56                   	push   %esi
 6cc:	53                   	push   %ebx
 6cd:	83 ec 14             	sub    $0x14,%esp
 6d0:	8b 75 08             	mov    0x8(%ebp),%esi
 6d3:	8b 7d 0c             	mov    0xc(%ebp),%edi
 6d6:	57                   	push   %edi
 6d7:	56                   	push   %esi
 6d8:	e8 8c ff ff ff       	call   669 <parsepipe>
 6dd:	89 c3                	mov    %eax,%ebx
 6df:	83 c4 10             	add    $0x10,%esp
 6e2:	eb 18                	jmp    6fc <parseline+0x35>
 6e4:	6a 00                	push   $0x0
 6e6:	6a 00                	push   $0x0
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	e8 4e fc ff ff       	call   33d <gettoken>
 6ef:	89 1c 24             	mov    %ebx,(%esp)
 6f2:	e8 16 fc ff ff       	call   30d <backcmd>
 6f7:	89 c3                	mov    %eax,%ebx
 6f9:	83 c4 10             	add    $0x10,%esp
 6fc:	83 ec 04             	sub    $0x4,%esp
 6ff:	68 ce 0f 00 00       	push   $0xfce
 704:	57                   	push   %edi
 705:	56                   	push   %esi
 706:	e8 39 fd ff ff       	call   444 <peek>
 70b:	83 c4 10             	add    $0x10,%esp
 70e:	85 c0                	test   %eax,%eax
 710:	75 d2                	jne    6e4 <parseline+0x1d>
 712:	83 ec 04             	sub    $0x4,%esp
 715:	68 ca 0f 00 00       	push   $0xfca
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
 71c:	e8 23 fd ff ff       	call   444 <peek>
 721:	83 c4 10             	add    $0x10,%esp
 724:	85 c0                	test   %eax,%eax
 726:	75 0a                	jne    732 <parseline+0x6b>
 728:	89 d8                	mov    %ebx,%eax
 72a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 72d:	5b                   	pop    %ebx
 72e:	5e                   	pop    %esi
 72f:	5f                   	pop    %edi
 730:	5d                   	pop    %ebp
 731:	c3                   	ret    
 732:	6a 00                	push   $0x0
 734:	6a 00                	push   $0x0
 736:	57                   	push   %edi
 737:	56                   	push   %esi
 738:	e8 00 fc ff ff       	call   33d <gettoken>
 73d:	83 c4 08             	add    $0x8,%esp
 740:	57                   	push   %edi
 741:	56                   	push   %esi
 742:	e8 80 ff ff ff       	call   6c7 <parseline>
 747:	83 c4 08             	add    $0x8,%esp
 74a:	50                   	push   %eax
 74b:	53                   	push   %ebx
 74c:	e8 86 fb ff ff       	call   2d7 <listcmd>
 751:	89 c3                	mov    %eax,%ebx
 753:	83 c4 10             	add    $0x10,%esp
 756:	eb d0                	jmp    728 <parseline+0x61>

00000758 <parseblock>:
 758:	55                   	push   %ebp
 759:	89 e5                	mov    %esp,%ebp
 75b:	57                   	push   %edi
 75c:	56                   	push   %esi
 75d:	53                   	push   %ebx
 75e:	83 ec 10             	sub    $0x10,%esp
 761:	8b 5d 08             	mov    0x8(%ebp),%ebx
 764:	8b 75 0c             	mov    0xc(%ebp),%esi
 767:	68 b0 0f 00 00       	push   $0xfb0
 76c:	56                   	push   %esi
 76d:	53                   	push   %ebx
 76e:	e8 d1 fc ff ff       	call   444 <peek>
 773:	83 c4 10             	add    $0x10,%esp
 776:	85 c0                	test   %eax,%eax
 778:	74 4b                	je     7c5 <parseblock+0x6d>
 77a:	6a 00                	push   $0x0
 77c:	6a 00                	push   $0x0
 77e:	56                   	push   %esi
 77f:	53                   	push   %ebx
 780:	e8 b8 fb ff ff       	call   33d <gettoken>
 785:	83 c4 08             	add    $0x8,%esp
 788:	56                   	push   %esi
 789:	53                   	push   %ebx
 78a:	e8 38 ff ff ff       	call   6c7 <parseline>
 78f:	89 c7                	mov    %eax,%edi
 791:	83 c4 0c             	add    $0xc,%esp
 794:	68 ec 0f 00 00       	push   $0xfec
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	e8 a4 fc ff ff       	call   444 <peek>
 7a0:	83 c4 10             	add    $0x10,%esp
 7a3:	85 c0                	test   %eax,%eax
 7a5:	74 2b                	je     7d2 <parseblock+0x7a>
 7a7:	6a 00                	push   $0x0
 7a9:	6a 00                	push   $0x0
 7ab:	56                   	push   %esi
 7ac:	53                   	push   %ebx
 7ad:	e8 8b fb ff ff       	call   33d <gettoken>
 7b2:	83 c4 0c             	add    $0xc,%esp
 7b5:	56                   	push   %esi
 7b6:	53                   	push   %ebx
 7b7:	57                   	push   %edi
 7b8:	e8 f3 fc ff ff       	call   4b0 <parseredirs>
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c0:	5b                   	pop    %ebx
 7c1:	5e                   	pop    %esi
 7c2:	5f                   	pop    %edi
 7c3:	5d                   	pop    %ebp
 7c4:	c3                   	ret    
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	68 d0 0f 00 00       	push   $0xfd0
 7cd:	e8 79 f8 ff ff       	call   4b <panic>
 7d2:	83 ec 0c             	sub    $0xc,%esp
 7d5:	68 db 0f 00 00       	push   $0xfdb
 7da:	e8 6c f8 ff ff       	call   4b <panic>

000007df <nulterminate>:
 7df:	55                   	push   %ebp
 7e0:	89 e5                	mov    %esp,%ebp
 7e2:	53                   	push   %ebx
 7e3:	83 ec 04             	sub    $0x4,%esp
 7e6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e9:	85 db                	test   %ebx,%ebx
 7eb:	74 1f                	je     80c <nulterminate+0x2d>
 7ed:	8b 03                	mov    (%ebx),%eax
 7ef:	83 f8 05             	cmp    $0x5,%eax
 7f2:	77 18                	ja     80c <nulterminate+0x2d>
 7f4:	ff 24 85 2c 10 00 00 	jmp    *0x102c(,%eax,4)
 7fb:	8b 54 83 54          	mov    0x54(%ebx,%eax,4),%edx
 7ff:	c6 02 00             	movb   $0x0,(%edx)
 802:	83 c0 01             	add    $0x1,%eax
 805:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
 80a:	75 ef                	jne    7fb <nulterminate+0x1c>
 80c:	89 d8                	mov    %ebx,%eax
 80e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 811:	c9                   	leave  
 812:	c3                   	ret    
 813:	b8 00 00 00 00       	mov    $0x0,%eax
 818:	eb eb                	jmp    805 <nulterminate+0x26>
 81a:	83 ec 0c             	sub    $0xc,%esp
 81d:	ff 73 04             	pushl  0x4(%ebx)
 820:	e8 ba ff ff ff       	call   7df <nulterminate>
 825:	8b 43 0c             	mov    0xc(%ebx),%eax
 828:	c6 00 00             	movb   $0x0,(%eax)
 82b:	83 c4 10             	add    $0x10,%esp
 82e:	eb dc                	jmp    80c <nulterminate+0x2d>
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	ff 73 04             	pushl  0x4(%ebx)
 836:	e8 a4 ff ff ff       	call   7df <nulterminate>
 83b:	83 c4 04             	add    $0x4,%esp
 83e:	ff 73 08             	pushl  0x8(%ebx)
 841:	e8 99 ff ff ff       	call   7df <nulterminate>
 846:	83 c4 10             	add    $0x10,%esp
 849:	eb c1                	jmp    80c <nulterminate+0x2d>
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	ff 73 04             	pushl  0x4(%ebx)
 851:	e8 89 ff ff ff       	call   7df <nulterminate>
 856:	83 c4 04             	add    $0x4,%esp
 859:	ff 73 08             	pushl  0x8(%ebx)
 85c:	e8 7e ff ff ff       	call   7df <nulterminate>
 861:	83 c4 10             	add    $0x10,%esp
 864:	eb a6                	jmp    80c <nulterminate+0x2d>
 866:	83 ec 0c             	sub    $0xc,%esp
 869:	ff 73 04             	pushl  0x4(%ebx)
 86c:	e8 6e ff ff ff       	call   7df <nulterminate>
 871:	83 c4 10             	add    $0x10,%esp
 874:	eb 96                	jmp    80c <nulterminate+0x2d>

00000876 <parsecmd>:
 876:	55                   	push   %ebp
 877:	89 e5                	mov    %esp,%ebp
 879:	56                   	push   %esi
 87a:	53                   	push   %ebx
 87b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 87e:	83 ec 0c             	sub    $0xc,%esp
 881:	53                   	push   %ebx
 882:	e8 7d 01 00 00       	call   a04 <strlen>
 887:	01 c3                	add    %eax,%ebx
 889:	83 c4 08             	add    $0x8,%esp
 88c:	53                   	push   %ebx
 88d:	8d 45 08             	lea    0x8(%ebp),%eax
 890:	50                   	push   %eax
 891:	e8 31 fe ff ff       	call   6c7 <parseline>
 896:	89 c6                	mov    %eax,%esi
 898:	83 c4 0c             	add    $0xc,%esp
 89b:	68 7a 0f 00 00       	push   $0xf7a
 8a0:	53                   	push   %ebx
 8a1:	8d 45 08             	lea    0x8(%ebp),%eax
 8a4:	50                   	push   %eax
 8a5:	e8 9a fb ff ff       	call   444 <peek>
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	83 c4 10             	add    $0x10,%esp
 8b0:	39 d8                	cmp    %ebx,%eax
 8b2:	75 12                	jne    8c6 <parsecmd+0x50>
 8b4:	83 ec 0c             	sub    $0xc,%esp
 8b7:	56                   	push   %esi
 8b8:	e8 22 ff ff ff       	call   7df <nulterminate>
 8bd:	89 f0                	mov    %esi,%eax
 8bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8c2:	5b                   	pop    %ebx
 8c3:	5e                   	pop    %esi
 8c4:	5d                   	pop    %ebp
 8c5:	c3                   	ret    
 8c6:	83 ec 04             	sub    $0x4,%esp
 8c9:	50                   	push   %eax
 8ca:	68 ee 0f 00 00       	push   $0xfee
 8cf:	6a 02                	push   $0x2
 8d1:	e8 d6 03 00 00       	call   cac <printf>
 8d6:	c7 04 24 b2 0f 00 00 	movl   $0xfb2,(%esp)
 8dd:	e8 69 f7 ff ff       	call   4b <panic>

000008e2 <main>:
 8e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8e6:	83 e4 f0             	and    $0xfffffff0,%esp
 8e9:	ff 71 fc             	pushl  -0x4(%ecx)
 8ec:	55                   	push   %ebp
 8ed:	89 e5                	mov    %esp,%ebp
 8ef:	51                   	push   %ecx
 8f0:	83 ec 04             	sub    $0x4,%esp
 8f3:	83 ec 08             	sub    $0x8,%esp
 8f6:	6a 02                	push   $0x2
 8f8:	68 fd 0f 00 00       	push   $0xffd
 8fd:	e8 95 02 00 00       	call   b97 <open>
 902:	83 c4 10             	add    $0x10,%esp
 905:	85 c0                	test   %eax,%eax
 907:	78 21                	js     92a <main+0x48>
 909:	83 f8 02             	cmp    $0x2,%eax
 90c:	7e e5                	jle    8f3 <main+0x11>
 90e:	83 ec 0c             	sub    $0xc,%esp
 911:	50                   	push   %eax
 912:	e8 68 02 00 00       	call   b7f <close>
 917:	83 c4 10             	add    $0x10,%esp
 91a:	eb 0e                	jmp    92a <main+0x48>
 91c:	e8 44 f7 ff ff       	call   65 <fork1>
 921:	85 c0                	test   %eax,%eax
 923:	74 79                	je     99e <main+0xbc>
 925:	e8 35 02 00 00       	call   b5f <wait>
 92a:	83 ec 08             	sub    $0x8,%esp
 92d:	68 c8 00 00 00       	push   $0xc8
 932:	68 40 16 00 00       	push   $0x1640
 937:	e8 c4 f6 ff ff       	call   0 <getcmd>
 93c:	83 c4 10             	add    $0x10,%esp
 93f:	85 c0                	test   %eax,%eax
 941:	78 70                	js     9b3 <main+0xd1>
 943:	80 3d 40 16 00 00 63 	cmpb   $0x63,0x1640
 94a:	75 d0                	jne    91c <main+0x3a>
 94c:	80 3d 41 16 00 00 64 	cmpb   $0x64,0x1641
 953:	75 c7                	jne    91c <main+0x3a>
 955:	80 3d 42 16 00 00 20 	cmpb   $0x20,0x1642
 95c:	75 be                	jne    91c <main+0x3a>
 95e:	83 ec 0c             	sub    $0xc,%esp
 961:	68 40 16 00 00       	push   $0x1640
 966:	e8 99 00 00 00       	call   a04 <strlen>
 96b:	c6 80 3f 16 00 00 00 	movb   $0x0,0x163f(%eax)
 972:	c7 04 24 43 16 00 00 	movl   $0x1643,(%esp)
 979:	e8 49 02 00 00       	call   bc7 <chdir>
 97e:	83 c4 10             	add    $0x10,%esp
 981:	85 c0                	test   %eax,%eax
 983:	79 a5                	jns    92a <main+0x48>
 985:	83 ec 04             	sub    $0x4,%esp
 988:	68 43 16 00 00       	push   $0x1643
 98d:	68 05 10 00 00       	push   $0x1005
 992:	6a 02                	push   $0x2
 994:	e8 13 03 00 00       	call   cac <printf>
 999:	83 c4 10             	add    $0x10,%esp
 99c:	eb 8c                	jmp    92a <main+0x48>
 99e:	83 ec 0c             	sub    $0xc,%esp
 9a1:	68 40 16 00 00       	push   $0x1640
 9a6:	e8 cb fe ff ff       	call   876 <parsecmd>
 9ab:	89 04 24             	mov    %eax,(%esp)
 9ae:	e8 d1 f6 ff ff       	call   84 <runcmd>
 9b3:	e8 9f 01 00 00       	call   b57 <exit>

000009b8 <strcpy>:
 9b8:	55                   	push   %ebp
 9b9:	89 e5                	mov    %esp,%ebp
 9bb:	56                   	push   %esi
 9bc:	53                   	push   %ebx
 9bd:	8b 75 08             	mov    0x8(%ebp),%esi
 9c0:	8b 55 0c             	mov    0xc(%ebp),%edx
 9c3:	89 f0                	mov    %esi,%eax
 9c5:	89 d1                	mov    %edx,%ecx
 9c7:	83 c2 01             	add    $0x1,%edx
 9ca:	89 c3                	mov    %eax,%ebx
 9cc:	83 c0 01             	add    $0x1,%eax
 9cf:	0f b6 09             	movzbl (%ecx),%ecx
 9d2:	88 0b                	mov    %cl,(%ebx)
 9d4:	84 c9                	test   %cl,%cl
 9d6:	75 ed                	jne    9c5 <strcpy+0xd>
 9d8:	89 f0                	mov    %esi,%eax
 9da:	5b                   	pop    %ebx
 9db:	5e                   	pop    %esi
 9dc:	5d                   	pop    %ebp
 9dd:	c3                   	ret    

000009de <strcmp>:
 9de:	55                   	push   %ebp
 9df:	89 e5                	mov    %esp,%ebp
 9e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9e4:	8b 55 0c             	mov    0xc(%ebp),%edx
 9e7:	eb 06                	jmp    9ef <strcmp+0x11>
 9e9:	83 c1 01             	add    $0x1,%ecx
 9ec:	83 c2 01             	add    $0x1,%edx
 9ef:	0f b6 01             	movzbl (%ecx),%eax
 9f2:	84 c0                	test   %al,%al
 9f4:	74 04                	je     9fa <strcmp+0x1c>
 9f6:	3a 02                	cmp    (%edx),%al
 9f8:	74 ef                	je     9e9 <strcmp+0xb>
 9fa:	0f b6 c0             	movzbl %al,%eax
 9fd:	0f b6 12             	movzbl (%edx),%edx
 a00:	29 d0                	sub    %edx,%eax
 a02:	5d                   	pop    %ebp
 a03:	c3                   	ret    

00000a04 <strlen>:
 a04:	55                   	push   %ebp
 a05:	89 e5                	mov    %esp,%ebp
 a07:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a0a:	b8 00 00 00 00       	mov    $0x0,%eax
 a0f:	eb 03                	jmp    a14 <strlen+0x10>
 a11:	83 c0 01             	add    $0x1,%eax
 a14:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 a18:	75 f7                	jne    a11 <strlen+0xd>
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    

00000a1c <memset>:
 a1c:	55                   	push   %ebp
 a1d:	89 e5                	mov    %esp,%ebp
 a1f:	57                   	push   %edi
 a20:	8b 55 08             	mov    0x8(%ebp),%edx
 a23:	89 d7                	mov    %edx,%edi
 a25:	8b 4d 10             	mov    0x10(%ebp),%ecx
 a28:	8b 45 0c             	mov    0xc(%ebp),%eax
 a2b:	fc                   	cld    
 a2c:	f3 aa                	rep stos %al,%es:(%edi)
 a2e:	89 d0                	mov    %edx,%eax
 a30:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a33:	c9                   	leave  
 a34:	c3                   	ret    

00000a35 <strchr>:
 a35:	55                   	push   %ebp
 a36:	89 e5                	mov    %esp,%ebp
 a38:	8b 45 08             	mov    0x8(%ebp),%eax
 a3b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 a3f:	eb 03                	jmp    a44 <strchr+0xf>
 a41:	83 c0 01             	add    $0x1,%eax
 a44:	0f b6 10             	movzbl (%eax),%edx
 a47:	84 d2                	test   %dl,%dl
 a49:	74 06                	je     a51 <strchr+0x1c>
 a4b:	38 ca                	cmp    %cl,%dl
 a4d:	75 f2                	jne    a41 <strchr+0xc>
 a4f:	eb 05                	jmp    a56 <strchr+0x21>
 a51:	b8 00 00 00 00       	mov    $0x0,%eax
 a56:	5d                   	pop    %ebp
 a57:	c3                   	ret    

00000a58 <gets>:
 a58:	55                   	push   %ebp
 a59:	89 e5                	mov    %esp,%ebp
 a5b:	57                   	push   %edi
 a5c:	56                   	push   %esi
 a5d:	53                   	push   %ebx
 a5e:	83 ec 1c             	sub    $0x1c,%esp
 a61:	8b 7d 08             	mov    0x8(%ebp),%edi
 a64:	bb 00 00 00 00       	mov    $0x0,%ebx
 a69:	89 de                	mov    %ebx,%esi
 a6b:	83 c3 01             	add    $0x1,%ebx
 a6e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 a71:	7d 2e                	jge    aa1 <gets+0x49>
 a73:	83 ec 04             	sub    $0x4,%esp
 a76:	6a 01                	push   $0x1
 a78:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a7b:	50                   	push   %eax
 a7c:	6a 00                	push   $0x0
 a7e:	e8 ec 00 00 00       	call   b6f <read>
 a83:	83 c4 10             	add    $0x10,%esp
 a86:	85 c0                	test   %eax,%eax
 a88:	7e 17                	jle    aa1 <gets+0x49>
 a8a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 a8e:	88 04 37             	mov    %al,(%edi,%esi,1)
 a91:	3c 0a                	cmp    $0xa,%al
 a93:	0f 94 c2             	sete   %dl
 a96:	3c 0d                	cmp    $0xd,%al
 a98:	0f 94 c0             	sete   %al
 a9b:	08 c2                	or     %al,%dl
 a9d:	74 ca                	je     a69 <gets+0x11>
 a9f:	89 de                	mov    %ebx,%esi
 aa1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
 aa5:	89 f8                	mov    %edi,%eax
 aa7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 aaa:	5b                   	pop    %ebx
 aab:	5e                   	pop    %esi
 aac:	5f                   	pop    %edi
 aad:	5d                   	pop    %ebp
 aae:	c3                   	ret    

00000aaf <stat>:
 aaf:	55                   	push   %ebp
 ab0:	89 e5                	mov    %esp,%ebp
 ab2:	56                   	push   %esi
 ab3:	53                   	push   %ebx
 ab4:	83 ec 08             	sub    $0x8,%esp
 ab7:	6a 00                	push   $0x0
 ab9:	ff 75 08             	pushl  0x8(%ebp)
 abc:	e8 d6 00 00 00       	call   b97 <open>
 ac1:	83 c4 10             	add    $0x10,%esp
 ac4:	85 c0                	test   %eax,%eax
 ac6:	78 24                	js     aec <stat+0x3d>
 ac8:	89 c3                	mov    %eax,%ebx
 aca:	83 ec 08             	sub    $0x8,%esp
 acd:	ff 75 0c             	pushl  0xc(%ebp)
 ad0:	50                   	push   %eax
 ad1:	e8 d9 00 00 00       	call   baf <fstat>
 ad6:	89 c6                	mov    %eax,%esi
 ad8:	89 1c 24             	mov    %ebx,(%esp)
 adb:	e8 9f 00 00 00       	call   b7f <close>
 ae0:	83 c4 10             	add    $0x10,%esp
 ae3:	89 f0                	mov    %esi,%eax
 ae5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ae8:	5b                   	pop    %ebx
 ae9:	5e                   	pop    %esi
 aea:	5d                   	pop    %ebp
 aeb:	c3                   	ret    
 aec:	be ff ff ff ff       	mov    $0xffffffff,%esi
 af1:	eb f0                	jmp    ae3 <stat+0x34>

00000af3 <atoi>:
 af3:	55                   	push   %ebp
 af4:	89 e5                	mov    %esp,%ebp
 af6:	53                   	push   %ebx
 af7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 afa:	ba 00 00 00 00       	mov    $0x0,%edx
 aff:	eb 10                	jmp    b11 <atoi+0x1e>
 b01:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 b04:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 b07:	83 c1 01             	add    $0x1,%ecx
 b0a:	0f be c0             	movsbl %al,%eax
 b0d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 b11:	0f b6 01             	movzbl (%ecx),%eax
 b14:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b17:	80 fb 09             	cmp    $0x9,%bl
 b1a:	76 e5                	jbe    b01 <atoi+0xe>
 b1c:	89 d0                	mov    %edx,%eax
 b1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b21:	c9                   	leave  
 b22:	c3                   	ret    

00000b23 <memmove>:
 b23:	55                   	push   %ebp
 b24:	89 e5                	mov    %esp,%ebp
 b26:	56                   	push   %esi
 b27:	53                   	push   %ebx
 b28:	8b 75 08             	mov    0x8(%ebp),%esi
 b2b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b2e:	8b 45 10             	mov    0x10(%ebp),%eax
 b31:	89 f2                	mov    %esi,%edx
 b33:	eb 0d                	jmp    b42 <memmove+0x1f>
 b35:	0f b6 01             	movzbl (%ecx),%eax
 b38:	88 02                	mov    %al,(%edx)
 b3a:	8d 49 01             	lea    0x1(%ecx),%ecx
 b3d:	8d 52 01             	lea    0x1(%edx),%edx
 b40:	89 d8                	mov    %ebx,%eax
 b42:	8d 58 ff             	lea    -0x1(%eax),%ebx
 b45:	85 c0                	test   %eax,%eax
 b47:	7f ec                	jg     b35 <memmove+0x12>
 b49:	89 f0                	mov    %esi,%eax
 b4b:	5b                   	pop    %ebx
 b4c:	5e                   	pop    %esi
 b4d:	5d                   	pop    %ebp
 b4e:	c3                   	ret    

00000b4f <fork>:
 b4f:	b8 01 00 00 00       	mov    $0x1,%eax
 b54:	cd 40                	int    $0x40
 b56:	c3                   	ret    

00000b57 <exit>:
 b57:	b8 02 00 00 00       	mov    $0x2,%eax
 b5c:	cd 40                	int    $0x40
 b5e:	c3                   	ret    

00000b5f <wait>:
 b5f:	b8 03 00 00 00       	mov    $0x3,%eax
 b64:	cd 40                	int    $0x40
 b66:	c3                   	ret    

00000b67 <pipe>:
 b67:	b8 04 00 00 00       	mov    $0x4,%eax
 b6c:	cd 40                	int    $0x40
 b6e:	c3                   	ret    

00000b6f <read>:
 b6f:	b8 05 00 00 00       	mov    $0x5,%eax
 b74:	cd 40                	int    $0x40
 b76:	c3                   	ret    

00000b77 <write>:
 b77:	b8 10 00 00 00       	mov    $0x10,%eax
 b7c:	cd 40                	int    $0x40
 b7e:	c3                   	ret    

00000b7f <close>:
 b7f:	b8 15 00 00 00       	mov    $0x15,%eax
 b84:	cd 40                	int    $0x40
 b86:	c3                   	ret    

00000b87 <kill>:
 b87:	b8 06 00 00 00       	mov    $0x6,%eax
 b8c:	cd 40                	int    $0x40
 b8e:	c3                   	ret    

00000b8f <exec>:
 b8f:	b8 07 00 00 00       	mov    $0x7,%eax
 b94:	cd 40                	int    $0x40
 b96:	c3                   	ret    

00000b97 <open>:
 b97:	b8 0f 00 00 00       	mov    $0xf,%eax
 b9c:	cd 40                	int    $0x40
 b9e:	c3                   	ret    

00000b9f <mknod>:
 b9f:	b8 11 00 00 00       	mov    $0x11,%eax
 ba4:	cd 40                	int    $0x40
 ba6:	c3                   	ret    

00000ba7 <unlink>:
 ba7:	b8 12 00 00 00       	mov    $0x12,%eax
 bac:	cd 40                	int    $0x40
 bae:	c3                   	ret    

00000baf <fstat>:
 baf:	b8 08 00 00 00       	mov    $0x8,%eax
 bb4:	cd 40                	int    $0x40
 bb6:	c3                   	ret    

00000bb7 <link>:
 bb7:	b8 13 00 00 00       	mov    $0x13,%eax
 bbc:	cd 40                	int    $0x40
 bbe:	c3                   	ret    

00000bbf <mkdir>:
 bbf:	b8 14 00 00 00       	mov    $0x14,%eax
 bc4:	cd 40                	int    $0x40
 bc6:	c3                   	ret    

00000bc7 <chdir>:
 bc7:	b8 09 00 00 00       	mov    $0x9,%eax
 bcc:	cd 40                	int    $0x40
 bce:	c3                   	ret    

00000bcf <dup>:
 bcf:	b8 0a 00 00 00       	mov    $0xa,%eax
 bd4:	cd 40                	int    $0x40
 bd6:	c3                   	ret    

00000bd7 <getpid>:
 bd7:	b8 0b 00 00 00       	mov    $0xb,%eax
 bdc:	cd 40                	int    $0x40
 bde:	c3                   	ret    

00000bdf <sbrk>:
 bdf:	b8 0c 00 00 00       	mov    $0xc,%eax
 be4:	cd 40                	int    $0x40
 be6:	c3                   	ret    

00000be7 <sleep>:
 be7:	b8 0d 00 00 00       	mov    $0xd,%eax
 bec:	cd 40                	int    $0x40
 bee:	c3                   	ret    

00000bef <uptime>:
 bef:	b8 0e 00 00 00       	mov    $0xe,%eax
 bf4:	cd 40                	int    $0x40
 bf6:	c3                   	ret    

00000bf7 <yield>:
 bf7:	b8 16 00 00 00       	mov    $0x16,%eax
 bfc:	cd 40                	int    $0x40
 bfe:	c3                   	ret    

00000bff <shutdown>:
 bff:	b8 17 00 00 00       	mov    $0x17,%eax
 c04:	cd 40                	int    $0x40
 c06:	c3                   	ret    

00000c07 <putc>:
 c07:	55                   	push   %ebp
 c08:	89 e5                	mov    %esp,%ebp
 c0a:	83 ec 1c             	sub    $0x1c,%esp
 c0d:	88 55 f4             	mov    %dl,-0xc(%ebp)
 c10:	6a 01                	push   $0x1
 c12:	8d 55 f4             	lea    -0xc(%ebp),%edx
 c15:	52                   	push   %edx
 c16:	50                   	push   %eax
 c17:	e8 5b ff ff ff       	call   b77 <write>
 c1c:	83 c4 10             	add    $0x10,%esp
 c1f:	c9                   	leave  
 c20:	c3                   	ret    

00000c21 <printint>:
 c21:	55                   	push   %ebp
 c22:	89 e5                	mov    %esp,%ebp
 c24:	57                   	push   %edi
 c25:	56                   	push   %esi
 c26:	53                   	push   %ebx
 c27:	83 ec 2c             	sub    $0x2c,%esp
 c2a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 c2d:	89 d0                	mov    %edx,%eax
 c2f:	89 ce                	mov    %ecx,%esi
 c31:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 c35:	0f 95 c1             	setne  %cl
 c38:	c1 ea 1f             	shr    $0x1f,%edx
 c3b:	84 d1                	test   %dl,%cl
 c3d:	74 44                	je     c83 <printint+0x62>
 c3f:	f7 d8                	neg    %eax
 c41:	89 c1                	mov    %eax,%ecx
 c43:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 c4a:	bb 00 00 00 00       	mov    $0x0,%ebx
 c4f:	89 c8                	mov    %ecx,%eax
 c51:	ba 00 00 00 00       	mov    $0x0,%edx
 c56:	f7 f6                	div    %esi
 c58:	89 df                	mov    %ebx,%edi
 c5a:	83 c3 01             	add    $0x1,%ebx
 c5d:	0f b6 92 a4 10 00 00 	movzbl 0x10a4(%edx),%edx
 c64:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 c68:	89 ca                	mov    %ecx,%edx
 c6a:	89 c1                	mov    %eax,%ecx
 c6c:	39 d6                	cmp    %edx,%esi
 c6e:	76 df                	jbe    c4f <printint+0x2e>
 c70:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 c74:	74 31                	je     ca7 <printint+0x86>
 c76:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 c7b:	8d 5f 02             	lea    0x2(%edi),%ebx
 c7e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 c81:	eb 17                	jmp    c9a <printint+0x79>
 c83:	89 c1                	mov    %eax,%ecx
 c85:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 c8c:	eb bc                	jmp    c4a <printint+0x29>
 c8e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 c93:	89 f0                	mov    %esi,%eax
 c95:	e8 6d ff ff ff       	call   c07 <putc>
 c9a:	83 eb 01             	sub    $0x1,%ebx
 c9d:	79 ef                	jns    c8e <printint+0x6d>
 c9f:	83 c4 2c             	add    $0x2c,%esp
 ca2:	5b                   	pop    %ebx
 ca3:	5e                   	pop    %esi
 ca4:	5f                   	pop    %edi
 ca5:	5d                   	pop    %ebp
 ca6:	c3                   	ret    
 ca7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 caa:	eb ee                	jmp    c9a <printint+0x79>

00000cac <printf>:
 cac:	55                   	push   %ebp
 cad:	89 e5                	mov    %esp,%ebp
 caf:	57                   	push   %edi
 cb0:	56                   	push   %esi
 cb1:	53                   	push   %ebx
 cb2:	83 ec 1c             	sub    $0x1c,%esp
 cb5:	8d 45 10             	lea    0x10(%ebp),%eax
 cb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 cbb:	be 00 00 00 00       	mov    $0x0,%esi
 cc0:	bb 00 00 00 00       	mov    $0x0,%ebx
 cc5:	eb 14                	jmp    cdb <printf+0x2f>
 cc7:	89 fa                	mov    %edi,%edx
 cc9:	8b 45 08             	mov    0x8(%ebp),%eax
 ccc:	e8 36 ff ff ff       	call   c07 <putc>
 cd1:	eb 05                	jmp    cd8 <printf+0x2c>
 cd3:	83 fe 25             	cmp    $0x25,%esi
 cd6:	74 25                	je     cfd <printf+0x51>
 cd8:	83 c3 01             	add    $0x1,%ebx
 cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
 cde:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 ce2:	84 c0                	test   %al,%al
 ce4:	0f 84 20 01 00 00    	je     e0a <printf+0x15e>
 cea:	0f be f8             	movsbl %al,%edi
 ced:	0f b6 c0             	movzbl %al,%eax
 cf0:	85 f6                	test   %esi,%esi
 cf2:	75 df                	jne    cd3 <printf+0x27>
 cf4:	83 f8 25             	cmp    $0x25,%eax
 cf7:	75 ce                	jne    cc7 <printf+0x1b>
 cf9:	89 c6                	mov    %eax,%esi
 cfb:	eb db                	jmp    cd8 <printf+0x2c>
 cfd:	83 f8 25             	cmp    $0x25,%eax
 d00:	0f 84 cf 00 00 00    	je     dd5 <printf+0x129>
 d06:	0f 8c dd 00 00 00    	jl     de9 <printf+0x13d>
 d0c:	83 f8 78             	cmp    $0x78,%eax
 d0f:	0f 8f d4 00 00 00    	jg     de9 <printf+0x13d>
 d15:	83 f8 63             	cmp    $0x63,%eax
 d18:	0f 8c cb 00 00 00    	jl     de9 <printf+0x13d>
 d1e:	83 e8 63             	sub    $0x63,%eax
 d21:	83 f8 15             	cmp    $0x15,%eax
 d24:	0f 87 bf 00 00 00    	ja     de9 <printf+0x13d>
 d2a:	ff 24 85 4c 10 00 00 	jmp    *0x104c(,%eax,4)
 d31:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 d34:	8b 17                	mov    (%edi),%edx
 d36:	83 ec 0c             	sub    $0xc,%esp
 d39:	6a 01                	push   $0x1
 d3b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 d40:	8b 45 08             	mov    0x8(%ebp),%eax
 d43:	e8 d9 fe ff ff       	call   c21 <printint>
 d48:	83 c7 04             	add    $0x4,%edi
 d4b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 d4e:	83 c4 10             	add    $0x10,%esp
 d51:	be 00 00 00 00       	mov    $0x0,%esi
 d56:	eb 80                	jmp    cd8 <printf+0x2c>
 d58:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 d5b:	8b 17                	mov    (%edi),%edx
 d5d:	83 ec 0c             	sub    $0xc,%esp
 d60:	6a 00                	push   $0x0
 d62:	b9 10 00 00 00       	mov    $0x10,%ecx
 d67:	8b 45 08             	mov    0x8(%ebp),%eax
 d6a:	e8 b2 fe ff ff       	call   c21 <printint>
 d6f:	83 c7 04             	add    $0x4,%edi
 d72:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 d75:	83 c4 10             	add    $0x10,%esp
 d78:	be 00 00 00 00       	mov    $0x0,%esi
 d7d:	e9 56 ff ff ff       	jmp    cd8 <printf+0x2c>
 d82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d85:	8b 30                	mov    (%eax),%esi
 d87:	83 c0 04             	add    $0x4,%eax
 d8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 d8d:	85 f6                	test   %esi,%esi
 d8f:	75 15                	jne    da6 <printf+0xfa>
 d91:	be 44 10 00 00       	mov    $0x1044,%esi
 d96:	eb 0e                	jmp    da6 <printf+0xfa>
 d98:	0f be d2             	movsbl %dl,%edx
 d9b:	8b 45 08             	mov    0x8(%ebp),%eax
 d9e:	e8 64 fe ff ff       	call   c07 <putc>
 da3:	83 c6 01             	add    $0x1,%esi
 da6:	0f b6 16             	movzbl (%esi),%edx
 da9:	84 d2                	test   %dl,%dl
 dab:	75 eb                	jne    d98 <printf+0xec>
 dad:	be 00 00 00 00       	mov    $0x0,%esi
 db2:	e9 21 ff ff ff       	jmp    cd8 <printf+0x2c>
 db7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 dba:	0f be 17             	movsbl (%edi),%edx
 dbd:	8b 45 08             	mov    0x8(%ebp),%eax
 dc0:	e8 42 fe ff ff       	call   c07 <putc>
 dc5:	83 c7 04             	add    $0x4,%edi
 dc8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 dcb:	be 00 00 00 00       	mov    $0x0,%esi
 dd0:	e9 03 ff ff ff       	jmp    cd8 <printf+0x2c>
 dd5:	89 fa                	mov    %edi,%edx
 dd7:	8b 45 08             	mov    0x8(%ebp),%eax
 dda:	e8 28 fe ff ff       	call   c07 <putc>
 ddf:	be 00 00 00 00       	mov    $0x0,%esi
 de4:	e9 ef fe ff ff       	jmp    cd8 <printf+0x2c>
 de9:	ba 25 00 00 00       	mov    $0x25,%edx
 dee:	8b 45 08             	mov    0x8(%ebp),%eax
 df1:	e8 11 fe ff ff       	call   c07 <putc>
 df6:	89 fa                	mov    %edi,%edx
 df8:	8b 45 08             	mov    0x8(%ebp),%eax
 dfb:	e8 07 fe ff ff       	call   c07 <putc>
 e00:	be 00 00 00 00       	mov    $0x0,%esi
 e05:	e9 ce fe ff ff       	jmp    cd8 <printf+0x2c>
 e0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e0d:	5b                   	pop    %ebx
 e0e:	5e                   	pop    %esi
 e0f:	5f                   	pop    %edi
 e10:	5d                   	pop    %ebp
 e11:	c3                   	ret    

00000e12 <free>:
 e12:	55                   	push   %ebp
 e13:	89 e5                	mov    %esp,%ebp
 e15:	57                   	push   %edi
 e16:	56                   	push   %esi
 e17:	53                   	push   %ebx
 e18:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e1b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 e1e:	a1 08 17 00 00       	mov    0x1708,%eax
 e23:	eb 02                	jmp    e27 <free+0x15>
 e25:	89 d0                	mov    %edx,%eax
 e27:	39 c8                	cmp    %ecx,%eax
 e29:	73 04                	jae    e2f <free+0x1d>
 e2b:	39 08                	cmp    %ecx,(%eax)
 e2d:	77 12                	ja     e41 <free+0x2f>
 e2f:	8b 10                	mov    (%eax),%edx
 e31:	39 c2                	cmp    %eax,%edx
 e33:	77 f0                	ja     e25 <free+0x13>
 e35:	39 c8                	cmp    %ecx,%eax
 e37:	72 08                	jb     e41 <free+0x2f>
 e39:	39 ca                	cmp    %ecx,%edx
 e3b:	77 04                	ja     e41 <free+0x2f>
 e3d:	89 d0                	mov    %edx,%eax
 e3f:	eb e6                	jmp    e27 <free+0x15>
 e41:	8b 73 fc             	mov    -0x4(%ebx),%esi
 e44:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 e47:	8b 10                	mov    (%eax),%edx
 e49:	39 d7                	cmp    %edx,%edi
 e4b:	74 19                	je     e66 <free+0x54>
 e4d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 e50:	8b 50 04             	mov    0x4(%eax),%edx
 e53:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 e56:	39 ce                	cmp    %ecx,%esi
 e58:	74 1b                	je     e75 <free+0x63>
 e5a:	89 08                	mov    %ecx,(%eax)
 e5c:	a3 08 17 00 00       	mov    %eax,0x1708
 e61:	5b                   	pop    %ebx
 e62:	5e                   	pop    %esi
 e63:	5f                   	pop    %edi
 e64:	5d                   	pop    %ebp
 e65:	c3                   	ret    
 e66:	03 72 04             	add    0x4(%edx),%esi
 e69:	89 73 fc             	mov    %esi,-0x4(%ebx)
 e6c:	8b 10                	mov    (%eax),%edx
 e6e:	8b 12                	mov    (%edx),%edx
 e70:	89 53 f8             	mov    %edx,-0x8(%ebx)
 e73:	eb db                	jmp    e50 <free+0x3e>
 e75:	03 53 fc             	add    -0x4(%ebx),%edx
 e78:	89 50 04             	mov    %edx,0x4(%eax)
 e7b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 e7e:	89 10                	mov    %edx,(%eax)
 e80:	eb da                	jmp    e5c <free+0x4a>

00000e82 <morecore>:
 e82:	55                   	push   %ebp
 e83:	89 e5                	mov    %esp,%ebp
 e85:	53                   	push   %ebx
 e86:	83 ec 04             	sub    $0x4,%esp
 e89:	89 c3                	mov    %eax,%ebx
 e8b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 e90:	77 05                	ja     e97 <morecore+0x15>
 e92:	bb 00 10 00 00       	mov    $0x1000,%ebx
 e97:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 e9e:	83 ec 0c             	sub    $0xc,%esp
 ea1:	50                   	push   %eax
 ea2:	e8 38 fd ff ff       	call   bdf <sbrk>
 ea7:	83 c4 10             	add    $0x10,%esp
 eaa:	83 f8 ff             	cmp    $0xffffffff,%eax
 ead:	74 1c                	je     ecb <morecore+0x49>
 eaf:	89 58 04             	mov    %ebx,0x4(%eax)
 eb2:	83 c0 08             	add    $0x8,%eax
 eb5:	83 ec 0c             	sub    $0xc,%esp
 eb8:	50                   	push   %eax
 eb9:	e8 54 ff ff ff       	call   e12 <free>
 ebe:	a1 08 17 00 00       	mov    0x1708,%eax
 ec3:	83 c4 10             	add    $0x10,%esp
 ec6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ec9:	c9                   	leave  
 eca:	c3                   	ret    
 ecb:	b8 00 00 00 00       	mov    $0x0,%eax
 ed0:	eb f4                	jmp    ec6 <morecore+0x44>

00000ed2 <malloc>:
 ed2:	55                   	push   %ebp
 ed3:	89 e5                	mov    %esp,%ebp
 ed5:	53                   	push   %ebx
 ed6:	83 ec 04             	sub    $0x4,%esp
 ed9:	8b 45 08             	mov    0x8(%ebp),%eax
 edc:	8d 58 07             	lea    0x7(%eax),%ebx
 edf:	c1 eb 03             	shr    $0x3,%ebx
 ee2:	83 c3 01             	add    $0x1,%ebx
 ee5:	8b 0d 08 17 00 00    	mov    0x1708,%ecx
 eeb:	85 c9                	test   %ecx,%ecx
 eed:	74 04                	je     ef3 <malloc+0x21>
 eef:	8b 01                	mov    (%ecx),%eax
 ef1:	eb 4a                	jmp    f3d <malloc+0x6b>
 ef3:	c7 05 08 17 00 00 0c 	movl   $0x170c,0x1708
 efa:	17 00 00 
 efd:	c7 05 0c 17 00 00 0c 	movl   $0x170c,0x170c
 f04:	17 00 00 
 f07:	c7 05 10 17 00 00 00 	movl   $0x0,0x1710
 f0e:	00 00 00 
 f11:	b9 0c 17 00 00       	mov    $0x170c,%ecx
 f16:	eb d7                	jmp    eef <malloc+0x1d>
 f18:	74 19                	je     f33 <malloc+0x61>
 f1a:	29 da                	sub    %ebx,%edx
 f1c:	89 50 04             	mov    %edx,0x4(%eax)
 f1f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
 f22:	89 58 04             	mov    %ebx,0x4(%eax)
 f25:	89 0d 08 17 00 00    	mov    %ecx,0x1708
 f2b:	83 c0 08             	add    $0x8,%eax
 f2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 f31:	c9                   	leave  
 f32:	c3                   	ret    
 f33:	8b 10                	mov    (%eax),%edx
 f35:	89 11                	mov    %edx,(%ecx)
 f37:	eb ec                	jmp    f25 <malloc+0x53>
 f39:	89 c1                	mov    %eax,%ecx
 f3b:	8b 00                	mov    (%eax),%eax
 f3d:	8b 50 04             	mov    0x4(%eax),%edx
 f40:	39 da                	cmp    %ebx,%edx
 f42:	73 d4                	jae    f18 <malloc+0x46>
 f44:	39 05 08 17 00 00    	cmp    %eax,0x1708
 f4a:	75 ed                	jne    f39 <malloc+0x67>
 f4c:	89 d8                	mov    %ebx,%eax
 f4e:	e8 2f ff ff ff       	call   e82 <morecore>
 f53:	85 c0                	test   %eax,%eax
 f55:	75 e2                	jne    f39 <malloc+0x67>
 f57:	eb d5                	jmp    f2e <malloc+0x5c>