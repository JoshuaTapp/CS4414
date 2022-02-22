
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	0f be d2             	movsbl %dl,%edx
  30:	39 f2                	cmp    %esi,%edx
  32:	74 de                	je     12 <matchstar+0x12>
  34:	83 fe 2e             	cmp    $0x2e,%esi
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <matchhere>:
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	8b 55 08             	mov    0x8(%ebp),%edx
  51:	0f b6 02             	movzbl (%edx),%eax
  54:	84 c0                	test   %al,%al
  56:	74 68                	je     c0 <matchhere+0x78>
  58:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  5c:	80 f9 2a             	cmp    $0x2a,%cl
  5f:	74 1d                	je     7e <matchhere+0x36>
  61:	3c 24                	cmp    $0x24,%al
  63:	74 31                	je     96 <matchhere+0x4e>
  65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	84 c9                	test   %cl,%cl
  6d:	74 58                	je     c7 <matchhere+0x7f>
  6f:	3c 2e                	cmp    $0x2e,%al
  71:	74 35                	je     a8 <matchhere+0x60>
  73:	38 c8                	cmp    %cl,%al
  75:	74 31                	je     a8 <matchhere+0x60>
  77:	b8 00 00 00 00       	mov    $0x0,%eax
  7c:	eb 47                	jmp    c5 <matchhere+0x7d>
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	ff 75 0c             	pushl  0xc(%ebp)
  84:	83 c2 02             	add    $0x2,%edx
  87:	52                   	push   %edx
  88:	0f be c0             	movsbl %al,%eax
  8b:	50                   	push   %eax
  8c:	e8 6f ff ff ff       	call   0 <matchstar>
  91:	83 c4 10             	add    $0x10,%esp
  94:	eb 2f                	jmp    c5 <matchhere+0x7d>
  96:	84 c9                	test   %cl,%cl
  98:	75 cb                	jne    65 <matchhere+0x1d>
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	80 38 00             	cmpb   $0x0,(%eax)
  a0:	0f 94 c0             	sete   %al
  a3:	0f b6 c0             	movzbl %al,%eax
  a6:	eb 1d                	jmp    c5 <matchhere+0x7d>
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	50                   	push   %eax
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	52                   	push   %edx
  b6:	e8 8d ff ff ff       	call   48 <matchhere>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	eb 05                	jmp    c5 <matchhere+0x7d>
  c0:	b8 01 00 00 00       	mov    $0x1,%eax
  c5:	c9                   	leave  
  c6:	c3                   	ret    
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
  cc:	eb f7                	jmp    c5 <matchhere+0x7d>

000000ce <match>:
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  d9:	80 3e 5e             	cmpb   $0x5e,(%esi)
  dc:	75 14                	jne    f2 <match+0x24>
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	53                   	push   %ebx
  e2:	83 c6 01             	add    $0x1,%esi
  e5:	56                   	push   %esi
  e6:	e8 5d ff ff ff       	call   48 <matchhere>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb 22                	jmp    112 <match+0x44>
  f0:	89 d3                	mov    %edx,%ebx
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	53                   	push   %ebx
  f6:	56                   	push   %esi
  f7:	e8 4c ff ff ff       	call   48 <matchhere>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	85 c0                	test   %eax,%eax
 101:	75 0a                	jne    10d <match+0x3f>
 103:	8d 53 01             	lea    0x1(%ebx),%edx
 106:	80 3b 00             	cmpb   $0x0,(%ebx)
 109:	75 e5                	jne    f0 <match+0x22>
 10b:	eb 05                	jmp    112 <match+0x44>
 10d:	b8 01 00 00 00       	mov    $0x1,%eax
 112:	8d 65 f8             	lea    -0x8(%ebp),%esp
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <grep>:
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	56                   	push   %esi
 11e:	53                   	push   %ebx
 11f:	83 ec 1c             	sub    $0x1c,%esp
 122:	8b 7d 08             	mov    0x8(%ebp),%edi
 125:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 12c:	eb 53                	jmp    181 <grep+0x68>
 12e:	8d 73 01             	lea    0x1(%ebx),%esi
 131:	83 ec 08             	sub    $0x8,%esp
 134:	6a 0a                	push   $0xa
 136:	56                   	push   %esi
 137:	e8 e1 01 00 00       	call   31d <strchr>
 13c:	89 c3                	mov    %eax,%ebx
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 2d                	je     172 <grep+0x59>
 145:	c6 03 00             	movb   $0x0,(%ebx)
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	56                   	push   %esi
 14c:	57                   	push   %edi
 14d:	e8 7c ff ff ff       	call   ce <match>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	74 d5                	je     12e <grep+0x15>
 159:	c6 03 0a             	movb   $0xa,(%ebx)
 15c:	8d 43 01             	lea    0x1(%ebx),%eax
 15f:	83 ec 04             	sub    $0x4,%esp
 162:	29 f0                	sub    %esi,%eax
 164:	50                   	push   %eax
 165:	56                   	push   %esi
 166:	6a 01                	push   $0x1
 168:	e8 f2 02 00 00       	call   45f <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
 172:	81 fe 80 0a 00 00    	cmp    $0xa80,%esi
 178:	74 62                	je     1dc <grep+0xc3>
 17a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 17d:	85 c9                	test   %ecx,%ecx
 17f:	7f 3b                	jg     1bc <grep+0xa3>
 181:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 189:	29 c8                	sub    %ecx,%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	8d 81 80 0a 00 00    	lea    0xa80(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	pushl  0xc(%ebp)
 199:	e8 b9 02 00 00       	call   457 <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1ab:	c6 82 80 0a 00 00 00 	movb   $0x0,0xa80(%edx)
 1b2:	be 80 0a 00 00       	mov    $0xa80,%esi
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d 80 0a 00 00       	sub    $0xa80,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 80 0a 00 00       	push   $0xa80
 1d2:	e8 34 02 00 00       	call   40b <memmove>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	eb a5                	jmp    181 <grep+0x68>
 1dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1e3:	eb 9c                	jmp    181 <grep+0x68>
 1e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <main>:
 1ed:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	ff 71 fc             	pushl  -0x4(%ecx)
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	51                   	push   %ecx
 1fe:	83 ec 18             	sub    $0x18,%esp
 201:	8b 01                	mov    (%ecx),%eax
 203:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 206:	8b 51 04             	mov    0x4(%ecx),%edx
 209:	89 55 e0             	mov    %edx,-0x20(%ebp)
 20c:	83 f8 01             	cmp    $0x1,%eax
 20f:	7e 50                	jle    261 <main+0x74>
 211:	8b 45 e0             	mov    -0x20(%ebp),%eax
 214:	8b 40 04             	mov    0x4(%eax),%eax
 217:	89 45 dc             	mov    %eax,-0x24(%ebp)
 21a:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 21e:	7e 55                	jle    275 <main+0x88>
 220:	be 02 00 00 00       	mov    $0x2,%esi
 225:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 228:	7d 71                	jge    29b <main+0xae>
 22a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22d:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 00                	push   $0x0
 235:	ff 37                	pushl  (%edi)
 237:	e8 43 02 00 00       	call   47f <open>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 40                	js     285 <main+0x98>
 245:	83 ec 08             	sub    $0x8,%esp
 248:	50                   	push   %eax
 249:	ff 75 dc             	pushl  -0x24(%ebp)
 24c:	e8 c8 fe ff ff       	call   119 <grep>
 251:	89 1c 24             	mov    %ebx,(%esp)
 254:	e8 0e 02 00 00       	call   467 <close>
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 fc 06 00 00       	push   $0x6fc
 269:	6a 02                	push   $0x2
 26b:	e8 24 03 00 00       	call   594 <printf>
 270:	e8 ca 01 00 00       	call   43f <exit>
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
 280:	e8 ba 01 00 00       	call   43f <exit>
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	pushl  (%edi)
 28a:	68 1c 07 00 00       	push   $0x71c
 28f:	6a 01                	push   $0x1
 291:	e8 fe 02 00 00       	call   594 <printf>
 296:	e8 a4 01 00 00       	call   43f <exit>
 29b:	e8 9f 01 00 00       	call   43f <exit>

000002a0 <strcpy>:
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	8b 75 08             	mov    0x8(%ebp),%esi
 2a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 2ab:	89 f0                	mov    %esi,%eax
 2ad:	89 d1                	mov    %edx,%ecx
 2af:	83 c2 01             	add    $0x1,%edx
 2b2:	89 c3                	mov    %eax,%ebx
 2b4:	83 c0 01             	add    $0x1,%eax
 2b7:	0f b6 09             	movzbl (%ecx),%ecx
 2ba:	88 0b                	mov    %cl,(%ebx)
 2bc:	84 c9                	test   %cl,%cl
 2be:	75 ed                	jne    2ad <strcpy+0xd>
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	5b                   	pop    %ebx
 2c3:	5e                   	pop    %esi
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <strcmp>:
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2cc:	8b 55 0c             	mov    0xc(%ebp),%edx
 2cf:	eb 06                	jmp    2d7 <strcmp+0x11>
 2d1:	83 c1 01             	add    $0x1,%ecx
 2d4:	83 c2 01             	add    $0x1,%edx
 2d7:	0f b6 01             	movzbl (%ecx),%eax
 2da:	84 c0                	test   %al,%al
 2dc:	74 04                	je     2e2 <strcmp+0x1c>
 2de:	3a 02                	cmp    (%edx),%al
 2e0:	74 ef                	je     2d1 <strcmp+0xb>
 2e2:	0f b6 c0             	movzbl %al,%eax
 2e5:	0f b6 12             	movzbl (%edx),%edx
 2e8:	29 d0                	sub    %edx,%eax
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <strlen>:
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f2:	b8 00 00 00 00       	mov    $0x0,%eax
 2f7:	eb 03                	jmp    2fc <strlen+0x10>
 2f9:	83 c0 01             	add    $0x1,%eax
 2fc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 300:	75 f7                	jne    2f9 <strlen+0xd>
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <memset>:
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	57                   	push   %edi
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	89 d7                	mov    %edx,%edi
 30d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 310:	8b 45 0c             	mov    0xc(%ebp),%eax
 313:	fc                   	cld    
 314:	f3 aa                	rep stos %al,%es:(%edi)
 316:	89 d0                	mov    %edx,%eax
 318:	8b 7d fc             	mov    -0x4(%ebp),%edi
 31b:	c9                   	leave  
 31c:	c3                   	ret    

0000031d <strchr>:
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 327:	eb 03                	jmp    32c <strchr+0xf>
 329:	83 c0 01             	add    $0x1,%eax
 32c:	0f b6 10             	movzbl (%eax),%edx
 32f:	84 d2                	test   %dl,%dl
 331:	74 06                	je     339 <strchr+0x1c>
 333:	38 ca                	cmp    %cl,%dl
 335:	75 f2                	jne    329 <strchr+0xc>
 337:	eb 05                	jmp    33e <strchr+0x21>
 339:	b8 00 00 00 00       	mov    $0x0,%eax
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    

00000340 <gets>:
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 1c             	sub    $0x1c,%esp
 349:	8b 7d 08             	mov    0x8(%ebp),%edi
 34c:	bb 00 00 00 00       	mov    $0x0,%ebx
 351:	89 de                	mov    %ebx,%esi
 353:	83 c3 01             	add    $0x1,%ebx
 356:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 359:	7d 2e                	jge    389 <gets+0x49>
 35b:	83 ec 04             	sub    $0x4,%esp
 35e:	6a 01                	push   $0x1
 360:	8d 45 e7             	lea    -0x19(%ebp),%eax
 363:	50                   	push   %eax
 364:	6a 00                	push   $0x0
 366:	e8 ec 00 00 00       	call   457 <read>
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	7e 17                	jle    389 <gets+0x49>
 372:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 376:	88 04 37             	mov    %al,(%edi,%esi,1)
 379:	3c 0a                	cmp    $0xa,%al
 37b:	0f 94 c2             	sete   %dl
 37e:	3c 0d                	cmp    $0xd,%al
 380:	0f 94 c0             	sete   %al
 383:	08 c2                	or     %al,%dl
 385:	74 ca                	je     351 <gets+0x11>
 387:	89 de                	mov    %ebx,%esi
 389:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
 38d:	89 f8                	mov    %edi,%eax
 38f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5f                   	pop    %edi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    

00000397 <stat>:
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	56                   	push   %esi
 39b:	53                   	push   %ebx
 39c:	83 ec 08             	sub    $0x8,%esp
 39f:	6a 00                	push   $0x0
 3a1:	ff 75 08             	pushl  0x8(%ebp)
 3a4:	e8 d6 00 00 00       	call   47f <open>
 3a9:	83 c4 10             	add    $0x10,%esp
 3ac:	85 c0                	test   %eax,%eax
 3ae:	78 24                	js     3d4 <stat+0x3d>
 3b0:	89 c3                	mov    %eax,%ebx
 3b2:	83 ec 08             	sub    $0x8,%esp
 3b5:	ff 75 0c             	pushl  0xc(%ebp)
 3b8:	50                   	push   %eax
 3b9:	e8 d9 00 00 00       	call   497 <fstat>
 3be:	89 c6                	mov    %eax,%esi
 3c0:	89 1c 24             	mov    %ebx,(%esp)
 3c3:	e8 9f 00 00 00       	call   467 <close>
 3c8:	83 c4 10             	add    $0x10,%esp
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d0:	5b                   	pop    %ebx
 3d1:	5e                   	pop    %esi
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d9:	eb f0                	jmp    3cb <stat+0x34>

000003db <atoi>:
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	53                   	push   %ebx
 3df:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e2:	ba 00 00 00 00       	mov    $0x0,%edx
 3e7:	eb 10                	jmp    3f9 <atoi+0x1e>
 3e9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3ec:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ef:	83 c1 01             	add    $0x1,%ecx
 3f2:	0f be c0             	movsbl %al,%eax
 3f5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 3f9:	0f b6 01             	movzbl (%ecx),%eax
 3fc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3ff:	80 fb 09             	cmp    $0x9,%bl
 402:	76 e5                	jbe    3e9 <atoi+0xe>
 404:	89 d0                	mov    %edx,%eax
 406:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 409:	c9                   	leave  
 40a:	c3                   	ret    

0000040b <memmove>:
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	56                   	push   %esi
 40f:	53                   	push   %ebx
 410:	8b 75 08             	mov    0x8(%ebp),%esi
 413:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 416:	8b 45 10             	mov    0x10(%ebp),%eax
 419:	89 f2                	mov    %esi,%edx
 41b:	eb 0d                	jmp    42a <memmove+0x1f>
 41d:	0f b6 01             	movzbl (%ecx),%eax
 420:	88 02                	mov    %al,(%edx)
 422:	8d 49 01             	lea    0x1(%ecx),%ecx
 425:	8d 52 01             	lea    0x1(%edx),%edx
 428:	89 d8                	mov    %ebx,%eax
 42a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 42d:	85 c0                	test   %eax,%eax
 42f:	7f ec                	jg     41d <memmove+0x12>
 431:	89 f0                	mov    %esi,%eax
 433:	5b                   	pop    %ebx
 434:	5e                   	pop    %esi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    

00000437 <fork>:
 437:	b8 01 00 00 00       	mov    $0x1,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <exit>:
 43f:	b8 02 00 00 00       	mov    $0x2,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <wait>:
 447:	b8 03 00 00 00       	mov    $0x3,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <pipe>:
 44f:	b8 04 00 00 00       	mov    $0x4,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <read>:
 457:	b8 05 00 00 00       	mov    $0x5,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <write>:
 45f:	b8 10 00 00 00       	mov    $0x10,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <close>:
 467:	b8 15 00 00 00       	mov    $0x15,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <kill>:
 46f:	b8 06 00 00 00       	mov    $0x6,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <exec>:
 477:	b8 07 00 00 00       	mov    $0x7,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <open>:
 47f:	b8 0f 00 00 00       	mov    $0xf,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <mknod>:
 487:	b8 11 00 00 00       	mov    $0x11,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <unlink>:
 48f:	b8 12 00 00 00       	mov    $0x12,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <fstat>:
 497:	b8 08 00 00 00       	mov    $0x8,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <link>:
 49f:	b8 13 00 00 00       	mov    $0x13,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <mkdir>:
 4a7:	b8 14 00 00 00       	mov    $0x14,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <chdir>:
 4af:	b8 09 00 00 00       	mov    $0x9,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <dup>:
 4b7:	b8 0a 00 00 00       	mov    $0xa,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <getpid>:
 4bf:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <sbrk>:
 4c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <sleep>:
 4cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <uptime>:
 4d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <yield>:
 4df:	b8 16 00 00 00       	mov    $0x16,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <shutdown>:
 4e7:	b8 17 00 00 00       	mov    $0x17,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <putc>:
 4ef:	55                   	push   %ebp
 4f0:	89 e5                	mov    %esp,%ebp
 4f2:	83 ec 1c             	sub    $0x1c,%esp
 4f5:	88 55 f4             	mov    %dl,-0xc(%ebp)
 4f8:	6a 01                	push   $0x1
 4fa:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4fd:	52                   	push   %edx
 4fe:	50                   	push   %eax
 4ff:	e8 5b ff ff ff       	call   45f <write>
 504:	83 c4 10             	add    $0x10,%esp
 507:	c9                   	leave  
 508:	c3                   	ret    

00000509 <printint>:
 509:	55                   	push   %ebp
 50a:	89 e5                	mov    %esp,%ebp
 50c:	57                   	push   %edi
 50d:	56                   	push   %esi
 50e:	53                   	push   %ebx
 50f:	83 ec 2c             	sub    $0x2c,%esp
 512:	89 45 d0             	mov    %eax,-0x30(%ebp)
 515:	89 d0                	mov    %edx,%eax
 517:	89 ce                	mov    %ecx,%esi
 519:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 51d:	0f 95 c1             	setne  %cl
 520:	c1 ea 1f             	shr    $0x1f,%edx
 523:	84 d1                	test   %dl,%cl
 525:	74 44                	je     56b <printint+0x62>
 527:	f7 d8                	neg    %eax
 529:	89 c1                	mov    %eax,%ecx
 52b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 532:	bb 00 00 00 00       	mov    $0x0,%ebx
 537:	89 c8                	mov    %ecx,%eax
 539:	ba 00 00 00 00       	mov    $0x0,%edx
 53e:	f7 f6                	div    %esi
 540:	89 df                	mov    %ebx,%edi
 542:	83 c3 01             	add    $0x1,%ebx
 545:	0f b6 92 94 07 00 00 	movzbl 0x794(%edx),%edx
 54c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
 550:	89 ca                	mov    %ecx,%edx
 552:	89 c1                	mov    %eax,%ecx
 554:	39 d6                	cmp    %edx,%esi
 556:	76 df                	jbe    537 <printint+0x2e>
 558:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 55c:	74 31                	je     58f <printint+0x86>
 55e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 563:	8d 5f 02             	lea    0x2(%edi),%ebx
 566:	8b 75 d0             	mov    -0x30(%ebp),%esi
 569:	eb 17                	jmp    582 <printint+0x79>
 56b:	89 c1                	mov    %eax,%ecx
 56d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 574:	eb bc                	jmp    532 <printint+0x29>
 576:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 57b:	89 f0                	mov    %esi,%eax
 57d:	e8 6d ff ff ff       	call   4ef <putc>
 582:	83 eb 01             	sub    $0x1,%ebx
 585:	79 ef                	jns    576 <printint+0x6d>
 587:	83 c4 2c             	add    $0x2c,%esp
 58a:	5b                   	pop    %ebx
 58b:	5e                   	pop    %esi
 58c:	5f                   	pop    %edi
 58d:	5d                   	pop    %ebp
 58e:	c3                   	ret    
 58f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 592:	eb ee                	jmp    582 <printint+0x79>

00000594 <printf>:
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	57                   	push   %edi
 598:	56                   	push   %esi
 599:	53                   	push   %ebx
 59a:	83 ec 1c             	sub    $0x1c,%esp
 59d:	8d 45 10             	lea    0x10(%ebp),%eax
 5a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5a3:	be 00 00 00 00       	mov    $0x0,%esi
 5a8:	bb 00 00 00 00       	mov    $0x0,%ebx
 5ad:	eb 14                	jmp    5c3 <printf+0x2f>
 5af:	89 fa                	mov    %edi,%edx
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	e8 36 ff ff ff       	call   4ef <putc>
 5b9:	eb 05                	jmp    5c0 <printf+0x2c>
 5bb:	83 fe 25             	cmp    $0x25,%esi
 5be:	74 25                	je     5e5 <printf+0x51>
 5c0:	83 c3 01             	add    $0x1,%ebx
 5c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5ca:	84 c0                	test   %al,%al
 5cc:	0f 84 20 01 00 00    	je     6f2 <printf+0x15e>
 5d2:	0f be f8             	movsbl %al,%edi
 5d5:	0f b6 c0             	movzbl %al,%eax
 5d8:	85 f6                	test   %esi,%esi
 5da:	75 df                	jne    5bb <printf+0x27>
 5dc:	83 f8 25             	cmp    $0x25,%eax
 5df:	75 ce                	jne    5af <printf+0x1b>
 5e1:	89 c6                	mov    %eax,%esi
 5e3:	eb db                	jmp    5c0 <printf+0x2c>
 5e5:	83 f8 25             	cmp    $0x25,%eax
 5e8:	0f 84 cf 00 00 00    	je     6bd <printf+0x129>
 5ee:	0f 8c dd 00 00 00    	jl     6d1 <printf+0x13d>
 5f4:	83 f8 78             	cmp    $0x78,%eax
 5f7:	0f 8f d4 00 00 00    	jg     6d1 <printf+0x13d>
 5fd:	83 f8 63             	cmp    $0x63,%eax
 600:	0f 8c cb 00 00 00    	jl     6d1 <printf+0x13d>
 606:	83 e8 63             	sub    $0x63,%eax
 609:	83 f8 15             	cmp    $0x15,%eax
 60c:	0f 87 bf 00 00 00    	ja     6d1 <printf+0x13d>
 612:	ff 24 85 3c 07 00 00 	jmp    *0x73c(,%eax,4)
 619:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 61c:	8b 17                	mov    (%edi),%edx
 61e:	83 ec 0c             	sub    $0xc,%esp
 621:	6a 01                	push   $0x1
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	e8 d9 fe ff ff       	call   509 <printint>
 630:	83 c7 04             	add    $0x4,%edi
 633:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 636:	83 c4 10             	add    $0x10,%esp
 639:	be 00 00 00 00       	mov    $0x0,%esi
 63e:	eb 80                	jmp    5c0 <printf+0x2c>
 640:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 643:	8b 17                	mov    (%edi),%edx
 645:	83 ec 0c             	sub    $0xc,%esp
 648:	6a 00                	push   $0x0
 64a:	b9 10 00 00 00       	mov    $0x10,%ecx
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	e8 b2 fe ff ff       	call   509 <printint>
 657:	83 c7 04             	add    $0x4,%edi
 65a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65d:	83 c4 10             	add    $0x10,%esp
 660:	be 00 00 00 00       	mov    $0x0,%esi
 665:	e9 56 ff ff ff       	jmp    5c0 <printf+0x2c>
 66a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66d:	8b 30                	mov    (%eax),%esi
 66f:	83 c0 04             	add    $0x4,%eax
 672:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 675:	85 f6                	test   %esi,%esi
 677:	75 15                	jne    68e <printf+0xfa>
 679:	be 32 07 00 00       	mov    $0x732,%esi
 67e:	eb 0e                	jmp    68e <printf+0xfa>
 680:	0f be d2             	movsbl %dl,%edx
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	e8 64 fe ff ff       	call   4ef <putc>
 68b:	83 c6 01             	add    $0x1,%esi
 68e:	0f b6 16             	movzbl (%esi),%edx
 691:	84 d2                	test   %dl,%dl
 693:	75 eb                	jne    680 <printf+0xec>
 695:	be 00 00 00 00       	mov    $0x0,%esi
 69a:	e9 21 ff ff ff       	jmp    5c0 <printf+0x2c>
 69f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a2:	0f be 17             	movsbl (%edi),%edx
 6a5:	8b 45 08             	mov    0x8(%ebp),%eax
 6a8:	e8 42 fe ff ff       	call   4ef <putc>
 6ad:	83 c7 04             	add    $0x4,%edi
 6b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b3:	be 00 00 00 00       	mov    $0x0,%esi
 6b8:	e9 03 ff ff ff       	jmp    5c0 <printf+0x2c>
 6bd:	89 fa                	mov    %edi,%edx
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	e8 28 fe ff ff       	call   4ef <putc>
 6c7:	be 00 00 00 00       	mov    $0x0,%esi
 6cc:	e9 ef fe ff ff       	jmp    5c0 <printf+0x2c>
 6d1:	ba 25 00 00 00       	mov    $0x25,%edx
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	e8 11 fe ff ff       	call   4ef <putc>
 6de:	89 fa                	mov    %edi,%edx
 6e0:	8b 45 08             	mov    0x8(%ebp),%eax
 6e3:	e8 07 fe ff ff       	call   4ef <putc>
 6e8:	be 00 00 00 00       	mov    $0x0,%esi
 6ed:	e9 ce fe ff ff       	jmp    5c0 <printf+0x2c>
 6f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f5:	5b                   	pop    %ebx
 6f6:	5e                   	pop    %esi
 6f7:	5f                   	pop    %edi
 6f8:	5d                   	pop    %ebp
 6f9:	c3                   	ret    
