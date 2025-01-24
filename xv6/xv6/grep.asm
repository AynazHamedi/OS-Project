
_grep:     file format elf32-i386


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
  14:	8b 01                	mov    (%ecx),%eax
  16:	89 45 e0             	mov    %eax,-0x20(%ebp)
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	48                   	dec    %eax
  1d:	7e 65                	jle    84 <main+0x84>
  1f:	8b 7b 04             	mov    0x4(%ebx),%edi
  22:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
  26:	74 6f                	je     97 <main+0x97>
  28:	83 c3 08             	add    $0x8,%ebx
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  30:	eb 26                	jmp    58 <main+0x58>
  32:	66 90                	xchg   %ax,%ax
  34:	83 ec 08             	sub    $0x8,%esp
  37:	50                   	push   %eax
  38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3b:	57                   	push   %edi
  3c:	e8 53 01 00 00       	call   194 <grep>
  41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 ab 04 00 00       	call   4f7 <close>
  4c:	46                   	inc    %esi
  4d:	83 c3 04             	add    $0x4,%ebx
  50:	83 c4 10             	add    $0x10,%esp
  53:	39 75 e0             	cmp    %esi,-0x20(%ebp)
  56:	7e 27                	jle    7f <main+0x7f>
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	6a 00                	push   $0x0
  5d:	ff 33                	pushl  (%ebx)
  5f:	e8 ab 04 00 00       	call   50f <open>
  64:	83 c4 10             	add    $0x10,%esp
  67:	85 c0                	test   %eax,%eax
  69:	79 c9                	jns    34 <main+0x34>
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 98 09 00 00       	push   $0x998
  73:	6a 01                	push   $0x1
  75:	e8 b2 05 00 00       	call   62c <printf>
  7a:	e8 50 04 00 00       	call   4cf <exit>
  7f:	e8 4b 04 00 00       	call   4cf <exit>
  84:	51                   	push   %ecx
  85:	51                   	push   %ecx
  86:	68 78 09 00 00       	push   $0x978
  8b:	6a 02                	push   $0x2
  8d:	e8 9a 05 00 00       	call   62c <printf>
  92:	e8 38 04 00 00       	call   4cf <exit>
  97:	52                   	push   %edx
  98:	52                   	push   %edx
  99:	6a 00                	push   $0x0
  9b:	57                   	push   %edi
  9c:	e8 f3 00 00 00       	call   194 <grep>
  a1:	e8 29 04 00 00       	call   4cf <exit>
  a6:	66 90                	xchg   %ax,%ax

000000a8 <matchhere>:
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	57                   	push   %edi
  ac:	56                   	push   %esi
  ad:	53                   	push   %ebx
  ae:	83 ec 0c             	sub    $0xc,%esp
  b1:	8b 75 08             	mov    0x8(%ebp),%esi
  b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  b7:	8a 16                	mov    (%esi),%dl
  b9:	84 d2                	test   %dl,%dl
  bb:	74 53                	je     110 <matchhere+0x68>
  bd:	8a 46 01             	mov    0x1(%esi),%al
  c0:	3c 2a                	cmp    $0x2a,%al
  c2:	74 1f                	je     e3 <matchhere+0x3b>
  c4:	8a 0b                	mov    (%ebx),%cl
  c6:	80 fa 24             	cmp    $0x24,%dl
  c9:	74 55                	je     120 <matchhere+0x78>
  cb:	84 c9                	test   %cl,%cl
  cd:	74 69                	je     138 <matchhere+0x90>
  cf:	80 fa 2e             	cmp    $0x2e,%dl
  d2:	75 60                	jne    134 <matchhere+0x8c>
  d4:	43                   	inc    %ebx
  d5:	46                   	inc    %esi
  d6:	84 c0                	test   %al,%al
  d8:	74 36                	je     110 <matchhere+0x68>
  da:	88 c2                	mov    %al,%dl
  dc:	8a 46 01             	mov    0x1(%esi),%al
  df:	3c 2a                	cmp    $0x2a,%al
  e1:	75 e1                	jne    c4 <matchhere+0x1c>
  e3:	83 c6 02             	add    $0x2,%esi
  e6:	0f be fa             	movsbl %dl,%edi
  e9:	eb 12                	jmp    fd <matchhere+0x55>
  eb:	90                   	nop
  ec:	0f be 0b             	movsbl (%ebx),%ecx
  ef:	84 c9                	test   %cl,%cl
  f1:	74 22                	je     115 <matchhere+0x6d>
  f3:	43                   	inc    %ebx
  f4:	39 cf                	cmp    %ecx,%edi
  f6:	74 05                	je     fd <matchhere+0x55>
  f8:	83 ff 2e             	cmp    $0x2e,%edi
  fb:	75 18                	jne    115 <matchhere+0x6d>
  fd:	83 ec 08             	sub    $0x8,%esp
 100:	53                   	push   %ebx
 101:	56                   	push   %esi
 102:	e8 a1 ff ff ff       	call   a8 <matchhere>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	85 c0                	test   %eax,%eax
 10c:	74 de                	je     ec <matchhere+0x44>
 10e:	66 90                	xchg   %ax,%ax
 110:	b8 01 00 00 00       	mov    $0x1,%eax
 115:	8d 65 f4             	lea    -0xc(%ebp),%esp
 118:	5b                   	pop    %ebx
 119:	5e                   	pop    %esi
 11a:	5f                   	pop    %edi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	84 c0                	test   %al,%al
 122:	74 1e                	je     142 <matchhere+0x9a>
 124:	84 c9                	test   %cl,%cl
 126:	74 10                	je     138 <matchhere+0x90>
 128:	80 f9 24             	cmp    $0x24,%cl
 12b:	75 0b                	jne    138 <matchhere+0x90>
 12d:	43                   	inc    %ebx
 12e:	46                   	inc    %esi
 12f:	88 c2                	mov    %al,%dl
 131:	eb a9                	jmp    dc <matchhere+0x34>
 133:	90                   	nop
 134:	38 d1                	cmp    %dl,%cl
 136:	74 9c                	je     d4 <matchhere+0x2c>
 138:	31 c0                	xor    %eax,%eax
 13a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13d:	5b                   	pop    %ebx
 13e:	5e                   	pop    %esi
 13f:	5f                   	pop    %edi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    
 142:	31 c0                	xor    %eax,%eax
 144:	84 c9                	test   %cl,%cl
 146:	0f 94 c0             	sete   %al
 149:	eb ca                	jmp    115 <matchhere+0x6d>
 14b:	90                   	nop

0000014c <match>:
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	56                   	push   %esi
 150:	53                   	push   %ebx
 151:	8b 5d 08             	mov    0x8(%ebp),%ebx
 154:	8b 75 0c             	mov    0xc(%ebp),%esi
 157:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 15a:	75 0b                	jne    167 <match+0x1b>
 15c:	eb 26                	jmp    184 <match+0x38>
 15e:	66 90                	xchg   %ax,%ax
 160:	46                   	inc    %esi
 161:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 165:	74 16                	je     17d <match+0x31>
 167:	83 ec 08             	sub    $0x8,%esp
 16a:	56                   	push   %esi
 16b:	53                   	push   %ebx
 16c:	e8 37 ff ff ff       	call   a8 <matchhere>
 171:	83 c4 10             	add    $0x10,%esp
 174:	85 c0                	test   %eax,%eax
 176:	74 e8                	je     160 <match+0x14>
 178:	b8 01 00 00 00       	mov    $0x1,%eax
 17d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 180:	5b                   	pop    %ebx
 181:	5e                   	pop    %esi
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	43                   	inc    %ebx
 185:	89 5d 08             	mov    %ebx,0x8(%ebp)
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	e9 15 ff ff ff       	jmp    a8 <matchhere>
 193:	90                   	nop

00000194 <grep>:
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	56                   	push   %esi
 199:	53                   	push   %ebx
 19a:	83 ec 1c             	sub    $0x1c,%esp
 19d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1a0:	31 ff                	xor    %edi,%edi
 1a2:	8d 43 01             	lea    0x1(%ebx),%eax
 1a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
 1a8:	89 7d e0             	mov    %edi,-0x20(%ebp)
 1ab:	90                   	nop
 1ac:	50                   	push   %eax
 1ad:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1b2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 1b5:	29 c8                	sub    %ecx,%eax
 1b7:	50                   	push   %eax
 1b8:	8d 81 80 0a 00 00    	lea    0xa80(%ecx),%eax
 1be:	50                   	push   %eax
 1bf:	ff 75 0c             	pushl  0xc(%ebp)
 1c2:	e8 20 03 00 00       	call   4e7 <read>
 1c7:	83 c4 10             	add    $0x10,%esp
 1ca:	85 c0                	test   %eax,%eax
 1cc:	0f 8e e1 00 00 00    	jle    2b3 <grep+0x11f>
 1d2:	01 45 e0             	add    %eax,-0x20(%ebp)
 1d5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 1d8:	c6 81 80 0a 00 00 00 	movb   $0x0,0xa80(%ecx)
 1df:	bf 80 0a 00 00       	mov    $0xa80,%edi
 1e4:	89 de                	mov    %ebx,%esi
 1e6:	66 90                	xchg   %ax,%ax
 1e8:	83 ec 08             	sub    $0x8,%esp
 1eb:	6a 0a                	push   $0xa
 1ed:	57                   	push   %edi
 1ee:	e8 bd 01 00 00       	call   3b0 <strchr>
 1f3:	89 c2                	mov    %eax,%edx
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	85 c0                	test   %eax,%eax
 1fa:	74 74                	je     270 <grep+0xdc>
 1fc:	c6 02 00             	movb   $0x0,(%edx)
 1ff:	80 3e 5e             	cmpb   $0x5e,(%esi)
 202:	74 48                	je     24c <grep+0xb8>
 204:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 207:	89 d3                	mov    %edx,%ebx
 209:	eb 08                	jmp    213 <grep+0x7f>
 20b:	90                   	nop
 20c:	47                   	inc    %edi
 20d:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 211:	74 31                	je     244 <grep+0xb0>
 213:	83 ec 08             	sub    $0x8,%esp
 216:	57                   	push   %edi
 217:	56                   	push   %esi
 218:	e8 8b fe ff ff       	call   a8 <matchhere>
 21d:	83 c4 10             	add    $0x10,%esp
 220:	85 c0                	test   %eax,%eax
 222:	74 e8                	je     20c <grep+0x78>
 224:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 227:	89 da                	mov    %ebx,%edx
 229:	8d 5b 01             	lea    0x1(%ebx),%ebx
 22c:	c6 02 0a             	movb   $0xa,(%edx)
 22f:	50                   	push   %eax
 230:	89 d8                	mov    %ebx,%eax
 232:	29 f8                	sub    %edi,%eax
 234:	50                   	push   %eax
 235:	57                   	push   %edi
 236:	6a 01                	push   $0x1
 238:	e8 b2 02 00 00       	call   4ef <write>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 df                	mov    %ebx,%edi
 242:	eb a4                	jmp    1e8 <grep+0x54>
 244:	8d 7b 01             	lea    0x1(%ebx),%edi
 247:	eb 9f                	jmp    1e8 <grep+0x54>
 249:	8d 76 00             	lea    0x0(%esi),%esi
 24c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	57                   	push   %edi
 253:	ff 75 dc             	pushl  -0x24(%ebp)
 256:	e8 4d fe ff ff       	call   a8 <matchhere>
 25b:	83 c4 10             	add    $0x10,%esp
 25e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 261:	8d 5a 01             	lea    0x1(%edx),%ebx
 264:	85 c0                	test   %eax,%eax
 266:	75 c4                	jne    22c <grep+0x98>
 268:	89 df                	mov    %ebx,%edi
 26a:	e9 79 ff ff ff       	jmp    1e8 <grep+0x54>
 26f:	90                   	nop
 270:	89 f3                	mov    %esi,%ebx
 272:	81 ff 80 0a 00 00    	cmp    $0xa80,%edi
 278:	74 2d                	je     2a7 <grep+0x113>
 27a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 27d:	85 c9                	test   %ecx,%ecx
 27f:	0f 8e 27 ff ff ff    	jle    1ac <grep+0x18>
 285:	89 f8                	mov    %edi,%eax
 287:	2d 80 0a 00 00       	sub    $0xa80,%eax
 28c:	29 45 e0             	sub    %eax,-0x20(%ebp)
 28f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 292:	52                   	push   %edx
 293:	51                   	push   %ecx
 294:	57                   	push   %edi
 295:	68 80 0a 00 00       	push   $0xa80
 29a:	e8 05 02 00 00       	call   4a4 <memmove>
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	e9 05 ff ff ff       	jmp    1ac <grep+0x18>
 2a7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 2ae:	e9 f9 fe ff ff       	jmp    1ac <grep+0x18>
 2b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	90                   	nop

000002bc <matchstar>:
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	57                   	push   %edi
 2c0:	56                   	push   %esi
 2c1:	53                   	push   %ebx
 2c2:	83 ec 0c             	sub    $0xc,%esp
 2c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2c8:	8b 75 0c             	mov    0xc(%ebp),%esi
 2cb:	8b 7d 10             	mov    0x10(%ebp),%edi
 2ce:	66 90                	xchg   %ax,%ax
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	e8 ce fd ff ff       	call   a8 <matchhere>
 2da:	83 c4 10             	add    $0x10,%esp
 2dd:	85 c0                	test   %eax,%eax
 2df:	75 1b                	jne    2fc <matchstar+0x40>
 2e1:	0f be 17             	movsbl (%edi),%edx
 2e4:	84 d2                	test   %dl,%dl
 2e6:	74 0a                	je     2f2 <matchstar+0x36>
 2e8:	47                   	inc    %edi
 2e9:	39 da                	cmp    %ebx,%edx
 2eb:	74 e3                	je     2d0 <matchstar+0x14>
 2ed:	83 fb 2e             	cmp    $0x2e,%ebx
 2f0:	74 de                	je     2d0 <matchstar+0x14>
 2f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5f                   	pop    %edi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
 2fa:	66 90                	xchg   %ax,%ax
 2fc:	b8 01 00 00 00       	mov    $0x1,%eax
 301:	8d 65 f4             	lea    -0xc(%ebp),%esp
 304:	5b                   	pop    %ebx
 305:	5e                   	pop    %esi
 306:	5f                   	pop    %edi
 307:	5d                   	pop    %ebp
 308:	c3                   	ret    
 309:	66 90                	xchg   %ax,%ax
 30b:	90                   	nop

0000030c <strcpy>:
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
 30f:	53                   	push   %ebx
 310:	8b 4d 08             	mov    0x8(%ebp),%ecx
 313:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 316:	31 c0                	xor    %eax,%eax
 318:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 31b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 31e:	40                   	inc    %eax
 31f:	84 d2                	test   %dl,%dl
 321:	75 f5                	jne    318 <strcpy+0xc>
 323:	89 c8                	mov    %ecx,%eax
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	c9                   	leave  
 329:	c3                   	ret    
 32a:	66 90                	xchg   %ax,%ax

0000032c <strcmp>:
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	53                   	push   %ebx
 330:	8b 55 08             	mov    0x8(%ebp),%edx
 333:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 336:	0f b6 02             	movzbl (%edx),%eax
 339:	84 c0                	test   %al,%al
 33b:	75 10                	jne    34d <strcmp+0x21>
 33d:	eb 2a                	jmp    369 <strcmp+0x3d>
 33f:	90                   	nop
 340:	42                   	inc    %edx
 341:	8d 4b 01             	lea    0x1(%ebx),%ecx
 344:	0f b6 02             	movzbl (%edx),%eax
 347:	84 c0                	test   %al,%al
 349:	74 11                	je     35c <strcmp+0x30>
 34b:	89 cb                	mov    %ecx,%ebx
 34d:	0f b6 0b             	movzbl (%ebx),%ecx
 350:	38 c1                	cmp    %al,%cl
 352:	74 ec                	je     340 <strcmp+0x14>
 354:	29 c8                	sub    %ecx,%eax
 356:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 359:	c9                   	leave  
 35a:	c3                   	ret    
 35b:	90                   	nop
 35c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 360:	31 c0                	xor    %eax,%eax
 362:	29 c8                	sub    %ecx,%eax
 364:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 367:	c9                   	leave  
 368:	c3                   	ret    
 369:	0f b6 0b             	movzbl (%ebx),%ecx
 36c:	31 c0                	xor    %eax,%eax
 36e:	eb e4                	jmp    354 <strcmp+0x28>

00000370 <strlen>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 55 08             	mov    0x8(%ebp),%edx
 376:	80 3a 00             	cmpb   $0x0,(%edx)
 379:	74 15                	je     390 <strlen+0x20>
 37b:	31 c0                	xor    %eax,%eax
 37d:	8d 76 00             	lea    0x0(%esi),%esi
 380:	40                   	inc    %eax
 381:	89 c1                	mov    %eax,%ecx
 383:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 387:	75 f7                	jne    380 <strlen+0x10>
 389:	89 c8                	mov    %ecx,%eax
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	31 c9                	xor    %ecx,%ecx
 392:	89 c8                	mov    %ecx,%eax
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    
 396:	66 90                	xchg   %ax,%ax

00000398 <memset>:
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	8b 7d 08             	mov    0x8(%ebp),%edi
 39f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a5:	fc                   	cld    
 3a6:	f3 aa                	rep stos %al,%es:(%edi)
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strchr>:
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	8a 4d 0c             	mov    0xc(%ebp),%cl
 3b9:	8a 10                	mov    (%eax),%dl
 3bb:	84 d2                	test   %dl,%dl
 3bd:	75 0c                	jne    3cb <strchr+0x1b>
 3bf:	eb 13                	jmp    3d4 <strchr+0x24>
 3c1:	8d 76 00             	lea    0x0(%esi),%esi
 3c4:	40                   	inc    %eax
 3c5:	8a 10                	mov    (%eax),%dl
 3c7:	84 d2                	test   %dl,%dl
 3c9:	74 09                	je     3d4 <strchr+0x24>
 3cb:	38 d1                	cmp    %dl,%cl
 3cd:	75 f5                	jne    3c4 <strchr+0x14>
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d 76 00             	lea    0x0(%esi),%esi
 3d4:	31 c0                	xor    %eax,%eax
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    

000003d8 <gets>:
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	57                   	push   %edi
 3dc:	56                   	push   %esi
 3dd:	53                   	push   %ebx
 3de:	83 ec 1c             	sub    $0x1c,%esp
 3e1:	31 db                	xor    %ebx,%ebx
 3e3:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3e6:	eb 24                	jmp    40c <gets+0x34>
 3e8:	50                   	push   %eax
 3e9:	6a 01                	push   $0x1
 3eb:	56                   	push   %esi
 3ec:	6a 00                	push   $0x0
 3ee:	e8 f4 00 00 00       	call   4e7 <read>
 3f3:	83 c4 10             	add    $0x10,%esp
 3f6:	85 c0                	test   %eax,%eax
 3f8:	7e 1a                	jle    414 <gets+0x3c>
 3fa:	8a 45 e7             	mov    -0x19(%ebp),%al
 3fd:	8b 55 08             	mov    0x8(%ebp),%edx
 400:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 404:	3c 0a                	cmp    $0xa,%al
 406:	74 0e                	je     416 <gets+0x3e>
 408:	3c 0d                	cmp    $0xd,%al
 40a:	74 0a                	je     416 <gets+0x3e>
 40c:	89 df                	mov    %ebx,%edi
 40e:	43                   	inc    %ebx
 40f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 412:	7c d4                	jl     3e8 <gets+0x10>
 414:	89 fb                	mov    %edi,%ebx
 416:	8b 45 08             	mov    0x8(%ebp),%eax
 419:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    
 425:	8d 76 00             	lea    0x0(%esi),%esi

00000428 <stat>:
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	56                   	push   %esi
 42c:	53                   	push   %ebx
 42d:	83 ec 08             	sub    $0x8,%esp
 430:	6a 00                	push   $0x0
 432:	ff 75 08             	pushl  0x8(%ebp)
 435:	e8 d5 00 00 00       	call   50f <open>
 43a:	83 c4 10             	add    $0x10,%esp
 43d:	85 c0                	test   %eax,%eax
 43f:	78 27                	js     468 <stat+0x40>
 441:	89 c3                	mov    %eax,%ebx
 443:	83 ec 08             	sub    $0x8,%esp
 446:	ff 75 0c             	pushl  0xc(%ebp)
 449:	50                   	push   %eax
 44a:	e8 d8 00 00 00       	call   527 <fstat>
 44f:	89 c6                	mov    %eax,%esi
 451:	89 1c 24             	mov    %ebx,(%esp)
 454:	e8 9e 00 00 00       	call   4f7 <close>
 459:	83 c4 10             	add    $0x10,%esp
 45c:	89 f0                	mov    %esi,%eax
 45e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 461:	5b                   	pop    %ebx
 462:	5e                   	pop    %esi
 463:	5d                   	pop    %ebp
 464:	c3                   	ret    
 465:	8d 76 00             	lea    0x0(%esi),%esi
 468:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46d:	eb ed                	jmp    45c <stat+0x34>
 46f:	90                   	nop

00000470 <atoi>:
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 4d 08             	mov    0x8(%ebp),%ecx
 477:	0f be 01             	movsbl (%ecx),%eax
 47a:	8d 50 d0             	lea    -0x30(%eax),%edx
 47d:	80 fa 09             	cmp    $0x9,%dl
 480:	ba 00 00 00 00       	mov    $0x0,%edx
 485:	77 16                	ja     49d <atoi+0x2d>
 487:	90                   	nop
 488:	41                   	inc    %ecx
 489:	8d 14 92             	lea    (%edx,%edx,4),%edx
 48c:	01 d2                	add    %edx,%edx
 48e:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 492:	0f be 01             	movsbl (%ecx),%eax
 495:	8d 58 d0             	lea    -0x30(%eax),%ebx
 498:	80 fb 09             	cmp    $0x9,%bl
 49b:	76 eb                	jbe    488 <atoi+0x18>
 49d:	89 d0                	mov    %edx,%eax
 49f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a2:	c9                   	leave  
 4a3:	c3                   	ret    

000004a4 <memmove>:
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	8b 55 08             	mov    0x8(%ebp),%edx
 4ac:	8b 75 0c             	mov    0xc(%ebp),%esi
 4af:	8b 45 10             	mov    0x10(%ebp),%eax
 4b2:	85 c0                	test   %eax,%eax
 4b4:	7e 0b                	jle    4c1 <memmove+0x1d>
 4b6:	01 d0                	add    %edx,%eax
 4b8:	89 d7                	mov    %edx,%edi
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 4bd:	39 f8                	cmp    %edi,%eax
 4bf:	75 fb                	jne    4bc <memmove+0x18>
 4c1:	89 d0                	mov    %edx,%eax
 4c3:	5e                   	pop    %esi
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    

000004c7 <fork>:
 4c7:	b8 01 00 00 00       	mov    $0x1,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <exit>:
 4cf:	b8 02 00 00 00       	mov    $0x2,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <wait>:
 4d7:	b8 03 00 00 00       	mov    $0x3,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <pipe>:
 4df:	b8 04 00 00 00       	mov    $0x4,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <read>:
 4e7:	b8 05 00 00 00       	mov    $0x5,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <write>:
 4ef:	b8 10 00 00 00       	mov    $0x10,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <close>:
 4f7:	b8 15 00 00 00       	mov    $0x15,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <kill>:
 4ff:	b8 06 00 00 00       	mov    $0x6,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <exec>:
 507:	b8 07 00 00 00       	mov    $0x7,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <open>:
 50f:	b8 0f 00 00 00       	mov    $0xf,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <mknod>:
 517:	b8 11 00 00 00       	mov    $0x11,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <unlink>:
 51f:	b8 12 00 00 00       	mov    $0x12,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <fstat>:
 527:	b8 08 00 00 00       	mov    $0x8,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <link>:
 52f:	b8 13 00 00 00       	mov    $0x13,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <mkdir>:
 537:	b8 14 00 00 00       	mov    $0x14,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <chdir>:
 53f:	b8 09 00 00 00       	mov    $0x9,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <dup>:
 547:	b8 0a 00 00 00       	mov    $0xa,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <getpid>:
 54f:	b8 0b 00 00 00       	mov    $0xb,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <sbrk>:
 557:	b8 0c 00 00 00       	mov    $0xc,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <sleep>:
 55f:	b8 0d 00 00 00       	mov    $0xd,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <uptime>:
 567:	b8 0e 00 00 00       	mov    $0xe,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <cpu_limit>:
 56f:	b8 16 00 00 00       	mov    $0x16,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <set_mem_limit>:
 577:	b8 17 00 00 00       	mov    $0x17,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <get_mem_limit>:
 57f:	b8 18 00 00 00       	mov    $0x18,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <increase_mem_limit>:
 587:	b8 19 00 00 00       	mov    $0x19,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <increase_mem_usage>:
 58f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <get_mem_usage>:
 597:	b8 1b 00 00 00       	mov    $0x1b,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    
 59f:	90                   	nop

000005a0 <printint>:
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5ac:	89 cb                	mov    %ecx,%ebx
 5ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5b1:	85 c9                	test   %ecx,%ecx
 5b3:	74 04                	je     5b9 <printint+0x19>
 5b5:	85 d2                	test   %edx,%edx
 5b7:	78 6b                	js     624 <printint+0x84>
 5b9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 5bc:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 5c3:	31 c9                	xor    %ecx,%ecx
 5c5:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5c8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5cb:	31 d2                	xor    %edx,%edx
 5cd:	f7 f3                	div    %ebx
 5cf:	89 cf                	mov    %ecx,%edi
 5d1:	8d 49 01             	lea    0x1(%ecx),%ecx
 5d4:	8a 92 10 0a 00 00    	mov    0xa10(%edx),%dl
 5da:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 5de:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 5e1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 5e4:	39 da                	cmp    %ebx,%edx
 5e6:	73 e0                	jae    5c8 <printint+0x28>
 5e8:	8b 55 08             	mov    0x8(%ebp),%edx
 5eb:	85 d2                	test   %edx,%edx
 5ed:	74 07                	je     5f6 <printint+0x56>
 5ef:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 5f4:	89 cf                	mov    %ecx,%edi
 5f6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5f9:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
 600:	8a 07                	mov    (%edi),%al
 602:	88 45 d7             	mov    %al,-0x29(%ebp)
 605:	50                   	push   %eax
 606:	6a 01                	push   $0x1
 608:	56                   	push   %esi
 609:	ff 75 c0             	pushl  -0x40(%ebp)
 60c:	e8 de fe ff ff       	call   4ef <write>
 611:	89 f8                	mov    %edi,%eax
 613:	4f                   	dec    %edi
 614:	83 c4 10             	add    $0x10,%esp
 617:	39 d8                	cmp    %ebx,%eax
 619:	75 e5                	jne    600 <printint+0x60>
 61b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    
 623:	90                   	nop
 624:	f7 da                	neg    %edx
 626:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 629:	eb 98                	jmp    5c3 <printint+0x23>
 62b:	90                   	nop

0000062c <printf>:
 62c:	55                   	push   %ebp
 62d:	89 e5                	mov    %esp,%ebp
 62f:	57                   	push   %edi
 630:	56                   	push   %esi
 631:	53                   	push   %ebx
 632:	83 ec 2c             	sub    $0x2c,%esp
 635:	8b 75 08             	mov    0x8(%ebp),%esi
 638:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 63b:	8a 13                	mov    (%ebx),%dl
 63d:	84 d2                	test   %dl,%dl
 63f:	74 5c                	je     69d <printf+0x71>
 641:	43                   	inc    %ebx
 642:	8d 45 10             	lea    0x10(%ebp),%eax
 645:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 648:	31 ff                	xor    %edi,%edi
 64a:	eb 20                	jmp    66c <printf+0x40>
 64c:	83 f8 25             	cmp    $0x25,%eax
 64f:	74 3f                	je     690 <printf+0x64>
 651:	88 55 e7             	mov    %dl,-0x19(%ebp)
 654:	50                   	push   %eax
 655:	6a 01                	push   $0x1
 657:	8d 45 e7             	lea    -0x19(%ebp),%eax
 65a:	50                   	push   %eax
 65b:	56                   	push   %esi
 65c:	e8 8e fe ff ff       	call   4ef <write>
 661:	83 c4 10             	add    $0x10,%esp
 664:	43                   	inc    %ebx
 665:	8a 53 ff             	mov    -0x1(%ebx),%dl
 668:	84 d2                	test   %dl,%dl
 66a:	74 31                	je     69d <printf+0x71>
 66c:	0f b6 c2             	movzbl %dl,%eax
 66f:	85 ff                	test   %edi,%edi
 671:	74 d9                	je     64c <printf+0x20>
 673:	83 ff 25             	cmp    $0x25,%edi
 676:	75 ec                	jne    664 <printf+0x38>
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	0f 84 03 01 00 00    	je     784 <printf+0x158>
 681:	83 e8 63             	sub    $0x63,%eax
 684:	83 f8 15             	cmp    $0x15,%eax
 687:	77 1f                	ja     6a8 <printf+0x7c>
 689:	ff 24 85 b8 09 00 00 	jmp    *0x9b8(,%eax,4)
 690:	bf 25 00 00 00       	mov    $0x25,%edi
 695:	43                   	inc    %ebx
 696:	8a 53 ff             	mov    -0x1(%ebx),%dl
 699:	84 d2                	test   %dl,%dl
 69b:	75 cf                	jne    66c <printf+0x40>
 69d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a0:	5b                   	pop    %ebx
 6a1:	5e                   	pop    %esi
 6a2:	5f                   	pop    %edi
 6a3:	5d                   	pop    %ebp
 6a4:	c3                   	ret    
 6a5:	8d 76 00             	lea    0x0(%esi),%esi
 6a8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 6ab:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6af:	50                   	push   %eax
 6b0:	6a 01                	push   $0x1
 6b2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 6b5:	57                   	push   %edi
 6b6:	56                   	push   %esi
 6b7:	e8 33 fe ff ff       	call   4ef <write>
 6bc:	8a 55 d0             	mov    -0x30(%ebp),%dl
 6bf:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c2:	83 c4 0c             	add    $0xc,%esp
 6c5:	6a 01                	push   $0x1
 6c7:	57                   	push   %edi
 6c8:	56                   	push   %esi
 6c9:	e8 21 fe ff ff       	call   4ef <write>
 6ce:	83 c4 10             	add    $0x10,%esp
 6d1:	31 ff                	xor    %edi,%edi
 6d3:	eb 8f                	jmp    664 <printf+0x38>
 6d5:	8d 76 00             	lea    0x0(%esi),%esi
 6d8:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6db:	8b 17                	mov    (%edi),%edx
 6dd:	83 ec 0c             	sub    $0xc,%esp
 6e0:	6a 00                	push   $0x0
 6e2:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e7:	89 f0                	mov    %esi,%eax
 6e9:	e8 b2 fe ff ff       	call   5a0 <printint>
 6ee:	83 c7 04             	add    $0x4,%edi
 6f1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6f4:	83 c4 10             	add    $0x10,%esp
 6f7:	31 ff                	xor    %edi,%edi
 6f9:	e9 66 ff ff ff       	jmp    664 <printf+0x38>
 6fe:	66 90                	xchg   %ax,%ax
 700:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 703:	8b 10                	mov    (%eax),%edx
 705:	83 c0 04             	add    $0x4,%eax
 708:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 70b:	85 d2                	test   %edx,%edx
 70d:	0f 84 81 00 00 00    	je     794 <printf+0x168>
 713:	8a 02                	mov    (%edx),%al
 715:	84 c0                	test   %al,%al
 717:	0f 84 80 00 00 00    	je     79d <printf+0x171>
 71d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 720:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 723:	89 d3                	mov    %edx,%ebx
 725:	8d 76 00             	lea    0x0(%esi),%esi
 728:	88 45 e7             	mov    %al,-0x19(%ebp)
 72b:	50                   	push   %eax
 72c:	6a 01                	push   $0x1
 72e:	57                   	push   %edi
 72f:	56                   	push   %esi
 730:	e8 ba fd ff ff       	call   4ef <write>
 735:	43                   	inc    %ebx
 736:	8a 03                	mov    (%ebx),%al
 738:	83 c4 10             	add    $0x10,%esp
 73b:	84 c0                	test   %al,%al
 73d:	75 e9                	jne    728 <printf+0xfc>
 73f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 742:	31 ff                	xor    %edi,%edi
 744:	e9 1b ff ff ff       	jmp    664 <printf+0x38>
 749:	8d 76 00             	lea    0x0(%esi),%esi
 74c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 74f:	8b 17                	mov    (%edi),%edx
 751:	83 ec 0c             	sub    $0xc,%esp
 754:	6a 01                	push   $0x1
 756:	b9 0a 00 00 00       	mov    $0xa,%ecx
 75b:	eb 8a                	jmp    6e7 <printf+0xbb>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
 760:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	88 45 e7             	mov    %al,-0x19(%ebp)
 768:	51                   	push   %ecx
 769:	6a 01                	push   $0x1
 76b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 76e:	57                   	push   %edi
 76f:	56                   	push   %esi
 770:	e8 7a fd ff ff       	call   4ef <write>
 775:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 779:	83 c4 10             	add    $0x10,%esp
 77c:	31 ff                	xor    %edi,%edi
 77e:	e9 e1 fe ff ff       	jmp    664 <printf+0x38>
 783:	90                   	nop
 784:	88 55 e7             	mov    %dl,-0x19(%ebp)
 787:	52                   	push   %edx
 788:	6a 01                	push   $0x1
 78a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 78d:	e9 35 ff ff ff       	jmp    6c7 <printf+0x9b>
 792:	66 90                	xchg   %ax,%ax
 794:	b0 28                	mov    $0x28,%al
 796:	ba ae 09 00 00       	mov    $0x9ae,%edx
 79b:	eb 80                	jmp    71d <printf+0xf1>
 79d:	31 ff                	xor    %edi,%edi
 79f:	e9 c0 fe ff ff       	jmp    664 <printf+0x38>

000007a4 <free>:
 7a4:	55                   	push   %ebp
 7a5:	89 e5                	mov    %esp,%ebp
 7a7:	57                   	push   %edi
 7a8:	56                   	push   %esi
 7a9:	53                   	push   %ebx
 7aa:	83 ec 0c             	sub    $0xc,%esp
 7ad:	8b 75 08             	mov    0x8(%ebp),%esi
 7b0:	8d 5e f8             	lea    -0x8(%esi),%ebx
 7b3:	8b 7e fc             	mov    -0x4(%esi),%edi
 7b6:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 7bd:	3d 00 80 00 00       	cmp    $0x8000,%eax
 7c2:	75 70                	jne    834 <free+0x90>
 7c4:	b9 00 80 00 00       	mov    $0x8000,%ecx
 7c9:	a1 80 0e 00 00       	mov    0xe80,%eax
 7ce:	66 90                	xchg   %ax,%ax
 7d0:	89 c2                	mov    %eax,%edx
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	39 da                	cmp    %ebx,%edx
 7d6:	73 2c                	jae    804 <free+0x60>
 7d8:	39 c3                	cmp    %eax,%ebx
 7da:	72 04                	jb     7e0 <free+0x3c>
 7dc:	39 c2                	cmp    %eax,%edx
 7de:	72 f0                	jb     7d0 <free+0x2c>
 7e0:	01 d9                	add    %ebx,%ecx
 7e2:	39 c8                	cmp    %ecx,%eax
 7e4:	74 2c                	je     812 <free+0x6e>
 7e6:	89 46 f8             	mov    %eax,-0x8(%esi)
 7e9:	8b 42 04             	mov    0x4(%edx),%eax
 7ec:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 7ef:	39 cb                	cmp    %ecx,%ebx
 7f1:	74 36                	je     829 <free+0x85>
 7f3:	89 1a                	mov    %ebx,(%edx)
 7f5:	89 15 80 0e 00 00    	mov    %edx,0xe80
 7fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7fe:	5b                   	pop    %ebx
 7ff:	5e                   	pop    %esi
 800:	5f                   	pop    %edi
 801:	5d                   	pop    %ebp
 802:	c3                   	ret    
 803:	90                   	nop
 804:	39 c2                	cmp    %eax,%edx
 806:	72 c8                	jb     7d0 <free+0x2c>
 808:	39 c3                	cmp    %eax,%ebx
 80a:	73 c4                	jae    7d0 <free+0x2c>
 80c:	01 d9                	add    %ebx,%ecx
 80e:	39 c8                	cmp    %ecx,%eax
 810:	75 d4                	jne    7e6 <free+0x42>
 812:	03 78 04             	add    0x4(%eax),%edi
 815:	89 7e fc             	mov    %edi,-0x4(%esi)
 818:	8b 02                	mov    (%edx),%eax
 81a:	8b 00                	mov    (%eax),%eax
 81c:	89 46 f8             	mov    %eax,-0x8(%esi)
 81f:	8b 42 04             	mov    0x4(%edx),%eax
 822:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 825:	39 cb                	cmp    %ecx,%ebx
 827:	75 ca                	jne    7f3 <free+0x4f>
 829:	03 46 fc             	add    -0x4(%esi),%eax
 82c:	89 42 04             	mov    %eax,0x4(%edx)
 82f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 832:	eb bf                	jmp    7f3 <free+0x4f>
 834:	83 ec 0c             	sub    $0xc,%esp
 837:	f7 d8                	neg    %eax
 839:	50                   	push   %eax
 83a:	e8 50 fd ff ff       	call   58f <increase_mem_usage>
 83f:	8b 7e fc             	mov    -0x4(%esi),%edi
 842:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 849:	83 c4 10             	add    $0x10,%esp
 84c:	e9 78 ff ff ff       	jmp    7c9 <free+0x25>
 851:	8d 76 00             	lea    0x0(%esi),%esi

00000854 <malloc>:
 854:	55                   	push   %ebp
 855:	89 e5                	mov    %esp,%ebp
 857:	57                   	push   %edi
 858:	56                   	push   %esi
 859:	53                   	push   %ebx
 85a:	83 ec 0c             	sub    $0xc,%esp
 85d:	8b 7d 08             	mov    0x8(%ebp),%edi
 860:	e8 1a fd ff ff       	call   57f <get_mem_limit>
 865:	89 c3                	mov    %eax,%ebx
 867:	e8 2b fd ff ff       	call   597 <get_mem_usage>
 86c:	83 fb ff             	cmp    $0xffffffff,%ebx
 86f:	74 0b                	je     87c <malloc+0x28>
 871:	8d 14 38             	lea    (%eax,%edi,1),%edx
 874:	39 d3                	cmp    %edx,%ebx
 876:	0f 82 e2 00 00 00    	jb     95e <malloc+0x10a>
 87c:	83 ec 0c             	sub    $0xc,%esp
 87f:	57                   	push   %edi
 880:	e8 0a fd ff ff       	call   58f <increase_mem_usage>
 885:	83 c7 07             	add    $0x7,%edi
 888:	c1 ef 03             	shr    $0x3,%edi
 88b:	47                   	inc    %edi
 88c:	8b 15 80 0e 00 00    	mov    0xe80,%edx
 892:	83 c4 10             	add    $0x10,%esp
 895:	85 d2                	test   %edx,%edx
 897:	0f 84 93 00 00 00    	je     930 <malloc+0xdc>
 89d:	8b 02                	mov    (%edx),%eax
 89f:	8b 48 04             	mov    0x4(%eax),%ecx
 8a2:	39 f9                	cmp    %edi,%ecx
 8a4:	73 62                	jae    908 <malloc+0xb4>
 8a6:	89 fb                	mov    %edi,%ebx
 8a8:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8ae:	72 78                	jb     928 <malloc+0xd4>
 8b0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8b7:	eb 0e                	jmp    8c7 <malloc+0x73>
 8b9:	8d 76 00             	lea    0x0(%esi),%esi
 8bc:	89 c2                	mov    %eax,%edx
 8be:	8b 02                	mov    (%edx),%eax
 8c0:	8b 48 04             	mov    0x4(%eax),%ecx
 8c3:	39 f9                	cmp    %edi,%ecx
 8c5:	73 41                	jae    908 <malloc+0xb4>
 8c7:	39 05 80 0e 00 00    	cmp    %eax,0xe80
 8cd:	75 ed                	jne    8bc <malloc+0x68>
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	56                   	push   %esi
 8d3:	e8 7f fc ff ff       	call   557 <sbrk>
 8d8:	83 c4 10             	add    $0x10,%esp
 8db:	83 f8 ff             	cmp    $0xffffffff,%eax
 8de:	74 1c                	je     8fc <malloc+0xa8>
 8e0:	89 58 04             	mov    %ebx,0x4(%eax)
 8e3:	83 ec 0c             	sub    $0xc,%esp
 8e6:	83 c0 08             	add    $0x8,%eax
 8e9:	50                   	push   %eax
 8ea:	e8 b5 fe ff ff       	call   7a4 <free>
 8ef:	8b 15 80 0e 00 00    	mov    0xe80,%edx
 8f5:	83 c4 10             	add    $0x10,%esp
 8f8:	85 d2                	test   %edx,%edx
 8fa:	75 c2                	jne    8be <malloc+0x6a>
 8fc:	31 c0                	xor    %eax,%eax
 8fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
 901:	5b                   	pop    %ebx
 902:	5e                   	pop    %esi
 903:	5f                   	pop    %edi
 904:	5d                   	pop    %ebp
 905:	c3                   	ret    
 906:	66 90                	xchg   %ax,%ax
 908:	39 cf                	cmp    %ecx,%edi
 90a:	74 4c                	je     958 <malloc+0x104>
 90c:	29 f9                	sub    %edi,%ecx
 90e:	89 48 04             	mov    %ecx,0x4(%eax)
 911:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 914:	89 78 04             	mov    %edi,0x4(%eax)
 917:	89 15 80 0e 00 00    	mov    %edx,0xe80
 91d:	83 c0 08             	add    $0x8,%eax
 920:	8d 65 f4             	lea    -0xc(%ebp),%esp
 923:	5b                   	pop    %ebx
 924:	5e                   	pop    %esi
 925:	5f                   	pop    %edi
 926:	5d                   	pop    %ebp
 927:	c3                   	ret    
 928:	bb 00 10 00 00       	mov    $0x1000,%ebx
 92d:	eb 81                	jmp    8b0 <malloc+0x5c>
 92f:	90                   	nop
 930:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 937:	0e 00 00 
 93a:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 941:	0e 00 00 
 944:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 94b:	00 00 00 
 94e:	b8 84 0e 00 00       	mov    $0xe84,%eax
 953:	e9 4e ff ff ff       	jmp    8a6 <malloc+0x52>
 958:	8b 08                	mov    (%eax),%ecx
 95a:	89 0a                	mov    %ecx,(%edx)
 95c:	eb b9                	jmp    917 <malloc+0xc3>
 95e:	83 ec 0c             	sub    $0xc,%esp
 961:	57                   	push   %edi
 962:	50                   	push   %eax
 963:	53                   	push   %ebx
 964:	68 24 0a 00 00       	push   $0xa24
 969:	6a 02                	push   $0x2
 96b:	e8 bc fc ff ff       	call   62c <printf>
 970:	83 c4 20             	add    $0x20,%esp
 973:	31 c0                	xor    %eax,%eax
 975:	eb 87                	jmp    8fe <malloc+0xaa>
