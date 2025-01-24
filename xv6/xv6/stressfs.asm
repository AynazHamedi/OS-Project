
_stressfs:     file format elf32-i386


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
  11:	81 ec 20 02 00 00    	sub    $0x220,%esp
  17:	be 8b 07 00 00       	mov    $0x78b,%esi
  1c:	b9 0a 00 00 00       	mov    $0xa,%ecx
  21:	8d bd de fd ff ff    	lea    -0x222(%ebp),%edi
  27:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  29:	68 68 07 00 00       	push   $0x768
  2e:	6a 01                	push   $0x1
  30:	e8 e7 03 00 00       	call   41c <printf>
  35:	83 c4 0c             	add    $0xc,%esp
  38:	68 00 02 00 00       	push   $0x200
  3d:	6a 61                	push   $0x61
  3f:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
  45:	56                   	push   %esi
  46:	e8 3d 01 00 00       	call   188 <memset>
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	31 db                	xor    %ebx,%ebx
  50:	e8 62 02 00 00       	call   2b7 <fork>
  55:	85 c0                	test   %eax,%eax
  57:	7f 06                	jg     5f <main+0x5f>
  59:	43                   	inc    %ebx
  5a:	83 fb 04             	cmp    $0x4,%ebx
  5d:	75 f1                	jne    50 <main+0x50>
  5f:	50                   	push   %eax
  60:	53                   	push   %ebx
  61:	68 7b 07 00 00       	push   $0x77b
  66:	6a 01                	push   $0x1
  68:	e8 af 03 00 00       	call   41c <printf>
  6d:	00 9d e6 fd ff ff    	add    %bl,-0x21a(%ebp)
  73:	58                   	pop    %eax
  74:	5a                   	pop    %edx
  75:	68 02 02 00 00       	push   $0x202
  7a:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  80:	50                   	push   %eax
  81:	e8 79 02 00 00       	call   2ff <open>
  86:	89 c7                	mov    %eax,%edi
  88:	83 c4 10             	add    $0x10,%esp
  8b:	bb 14 00 00 00       	mov    $0x14,%ebx
  90:	50                   	push   %eax
  91:	68 00 02 00 00       	push   $0x200
  96:	56                   	push   %esi
  97:	57                   	push   %edi
  98:	e8 42 02 00 00       	call   2df <write>
  9d:	83 c4 10             	add    $0x10,%esp
  a0:	4b                   	dec    %ebx
  a1:	75 ed                	jne    90 <main+0x90>
  a3:	83 ec 0c             	sub    $0xc,%esp
  a6:	57                   	push   %edi
  a7:	e8 3b 02 00 00       	call   2e7 <close>
  ac:	5a                   	pop    %edx
  ad:	59                   	pop    %ecx
  ae:	68 85 07 00 00       	push   $0x785
  b3:	6a 01                	push   $0x1
  b5:	e8 62 03 00 00       	call   41c <printf>
  ba:	5b                   	pop    %ebx
  bb:	5f                   	pop    %edi
  bc:	6a 00                	push   $0x0
  be:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  c4:	50                   	push   %eax
  c5:	e8 35 02 00 00       	call   2ff <open>
  ca:	89 c7                	mov    %eax,%edi
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	bb 14 00 00 00       	mov    $0x14,%ebx
  d4:	50                   	push   %eax
  d5:	68 00 02 00 00       	push   $0x200
  da:	56                   	push   %esi
  db:	57                   	push   %edi
  dc:	e8 f6 01 00 00       	call   2d7 <read>
  e1:	83 c4 10             	add    $0x10,%esp
  e4:	4b                   	dec    %ebx
  e5:	75 ed                	jne    d4 <main+0xd4>
  e7:	83 ec 0c             	sub    $0xc,%esp
  ea:	57                   	push   %edi
  eb:	e8 f7 01 00 00       	call   2e7 <close>
  f0:	e8 d2 01 00 00       	call   2c7 <wait>
  f5:	e8 c5 01 00 00       	call   2bf <exit>
  fa:	66 90                	xchg   %ax,%ax

000000fc <strcpy>:
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	53                   	push   %ebx
 100:	8b 4d 08             	mov    0x8(%ebp),%ecx
 103:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 106:	31 c0                	xor    %eax,%eax
 108:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 10b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 10e:	40                   	inc    %eax
 10f:	84 d2                	test   %dl,%dl
 111:	75 f5                	jne    108 <strcpy+0xc>
 113:	89 c8                	mov    %ecx,%eax
 115:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 118:	c9                   	leave  
 119:	c3                   	ret    
 11a:	66 90                	xchg   %ax,%ax

0000011c <strcmp>:
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	8b 55 08             	mov    0x8(%ebp),%edx
 123:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 126:	0f b6 02             	movzbl (%edx),%eax
 129:	84 c0                	test   %al,%al
 12b:	75 10                	jne    13d <strcmp+0x21>
 12d:	eb 2a                	jmp    159 <strcmp+0x3d>
 12f:	90                   	nop
 130:	42                   	inc    %edx
 131:	8d 4b 01             	lea    0x1(%ebx),%ecx
 134:	0f b6 02             	movzbl (%edx),%eax
 137:	84 c0                	test   %al,%al
 139:	74 11                	je     14c <strcmp+0x30>
 13b:	89 cb                	mov    %ecx,%ebx
 13d:	0f b6 0b             	movzbl (%ebx),%ecx
 140:	38 c1                	cmp    %al,%cl
 142:	74 ec                	je     130 <strcmp+0x14>
 144:	29 c8                	sub    %ecx,%eax
 146:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 149:	c9                   	leave  
 14a:	c3                   	ret    
 14b:	90                   	nop
 14c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 150:	31 c0                	xor    %eax,%eax
 152:	29 c8                	sub    %ecx,%eax
 154:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	0f b6 0b             	movzbl (%ebx),%ecx
 15c:	31 c0                	xor    %eax,%eax
 15e:	eb e4                	jmp    144 <strcmp+0x28>

00000160 <strlen>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	80 3a 00             	cmpb   $0x0,(%edx)
 169:	74 15                	je     180 <strlen+0x20>
 16b:	31 c0                	xor    %eax,%eax
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	40                   	inc    %eax
 171:	89 c1                	mov    %eax,%ecx
 173:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 177:	75 f7                	jne    170 <strlen+0x10>
 179:	89 c8                	mov    %ecx,%eax
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	31 c9                	xor    %ecx,%ecx
 182:	89 c8                	mov    %ecx,%eax
 184:	5d                   	pop    %ebp
 185:	c3                   	ret    
 186:	66 90                	xchg   %ax,%ax

00000188 <memset>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	57                   	push   %edi
 18c:	8b 7d 08             	mov    0x8(%ebp),%edi
 18f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 192:	8b 45 0c             	mov    0xc(%ebp),%eax
 195:	fc                   	cld    
 196:	f3 aa                	rep stos %al,%es:(%edi)
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 19e:	c9                   	leave  
 19f:	c3                   	ret    

000001a0 <strchr>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1a9:	8a 10                	mov    (%eax),%dl
 1ab:	84 d2                	test   %dl,%dl
 1ad:	75 0c                	jne    1bb <strchr+0x1b>
 1af:	eb 13                	jmp    1c4 <strchr+0x24>
 1b1:	8d 76 00             	lea    0x0(%esi),%esi
 1b4:	40                   	inc    %eax
 1b5:	8a 10                	mov    (%eax),%dl
 1b7:	84 d2                	test   %dl,%dl
 1b9:	74 09                	je     1c4 <strchr+0x24>
 1bb:	38 d1                	cmp    %dl,%cl
 1bd:	75 f5                	jne    1b4 <strchr+0x14>
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	8d 76 00             	lea    0x0(%esi),%esi
 1c4:	31 c0                	xor    %eax,%eax
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    

000001c8 <gets>:
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	57                   	push   %edi
 1cc:	56                   	push   %esi
 1cd:	53                   	push   %ebx
 1ce:	83 ec 1c             	sub    $0x1c,%esp
 1d1:	31 db                	xor    %ebx,%ebx
 1d3:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1d6:	eb 24                	jmp    1fc <gets+0x34>
 1d8:	50                   	push   %eax
 1d9:	6a 01                	push   $0x1
 1db:	56                   	push   %esi
 1dc:	6a 00                	push   $0x0
 1de:	e8 f4 00 00 00       	call   2d7 <read>
 1e3:	83 c4 10             	add    $0x10,%esp
 1e6:	85 c0                	test   %eax,%eax
 1e8:	7e 1a                	jle    204 <gets+0x3c>
 1ea:	8a 45 e7             	mov    -0x19(%ebp),%al
 1ed:	8b 55 08             	mov    0x8(%ebp),%edx
 1f0:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1f4:	3c 0a                	cmp    $0xa,%al
 1f6:	74 0e                	je     206 <gets+0x3e>
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0a                	je     206 <gets+0x3e>
 1fc:	89 df                	mov    %ebx,%edi
 1fe:	43                   	inc    %ebx
 1ff:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 202:	7c d4                	jl     1d8 <gets+0x10>
 204:	89 fb                	mov    %edi,%ebx
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 20d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 210:	5b                   	pop    %ebx
 211:	5e                   	pop    %esi
 212:	5f                   	pop    %edi
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 76 00             	lea    0x0(%esi),%esi

00000218 <stat>:
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	56                   	push   %esi
 21c:	53                   	push   %ebx
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	6a 00                	push   $0x0
 222:	ff 75 08             	pushl  0x8(%ebp)
 225:	e8 d5 00 00 00       	call   2ff <open>
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	85 c0                	test   %eax,%eax
 22f:	78 27                	js     258 <stat+0x40>
 231:	89 c3                	mov    %eax,%ebx
 233:	83 ec 08             	sub    $0x8,%esp
 236:	ff 75 0c             	pushl  0xc(%ebp)
 239:	50                   	push   %eax
 23a:	e8 d8 00 00 00       	call   317 <fstat>
 23f:	89 c6                	mov    %eax,%esi
 241:	89 1c 24             	mov    %ebx,(%esp)
 244:	e8 9e 00 00 00       	call   2e7 <close>
 249:	83 c4 10             	add    $0x10,%esp
 24c:	89 f0                	mov    %esi,%eax
 24e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 251:	5b                   	pop    %ebx
 252:	5e                   	pop    %esi
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    
 255:	8d 76 00             	lea    0x0(%esi),%esi
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb ed                	jmp    24c <stat+0x34>
 25f:	90                   	nop

00000260 <atoi>:
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 4d 08             	mov    0x8(%ebp),%ecx
 267:	0f be 01             	movsbl (%ecx),%eax
 26a:	8d 50 d0             	lea    -0x30(%eax),%edx
 26d:	80 fa 09             	cmp    $0x9,%dl
 270:	ba 00 00 00 00       	mov    $0x0,%edx
 275:	77 16                	ja     28d <atoi+0x2d>
 277:	90                   	nop
 278:	41                   	inc    %ecx
 279:	8d 14 92             	lea    (%edx,%edx,4),%edx
 27c:	01 d2                	add    %edx,%edx
 27e:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 282:	0f be 01             	movsbl (%ecx),%eax
 285:	8d 58 d0             	lea    -0x30(%eax),%ebx
 288:	80 fb 09             	cmp    $0x9,%bl
 28b:	76 eb                	jbe    278 <atoi+0x18>
 28d:	89 d0                	mov    %edx,%eax
 28f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memmove>:
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	56                   	push   %esi
 299:	8b 55 08             	mov    0x8(%ebp),%edx
 29c:	8b 75 0c             	mov    0xc(%ebp),%esi
 29f:	8b 45 10             	mov    0x10(%ebp),%eax
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0b                	jle    2b1 <memmove+0x1d>
 2a6:	01 d0                	add    %edx,%eax
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	66 90                	xchg   %ax,%ax
 2ac:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2ad:	39 f8                	cmp    %edi,%eax
 2af:	75 fb                	jne    2ac <memmove+0x18>
 2b1:	89 d0                	mov    %edx,%eax
 2b3:	5e                   	pop    %esi
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    

000002b7 <fork>:
 2b7:	b8 01 00 00 00       	mov    $0x1,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <exit>:
 2bf:	b8 02 00 00 00       	mov    $0x2,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <wait>:
 2c7:	b8 03 00 00 00       	mov    $0x3,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <pipe>:
 2cf:	b8 04 00 00 00       	mov    $0x4,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <read>:
 2d7:	b8 05 00 00 00       	mov    $0x5,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <write>:
 2df:	b8 10 00 00 00       	mov    $0x10,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <close>:
 2e7:	b8 15 00 00 00       	mov    $0x15,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <kill>:
 2ef:	b8 06 00 00 00       	mov    $0x6,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <exec>:
 2f7:	b8 07 00 00 00       	mov    $0x7,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <open>:
 2ff:	b8 0f 00 00 00       	mov    $0xf,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <mknod>:
 307:	b8 11 00 00 00       	mov    $0x11,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <unlink>:
 30f:	b8 12 00 00 00       	mov    $0x12,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <fstat>:
 317:	b8 08 00 00 00       	mov    $0x8,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <link>:
 31f:	b8 13 00 00 00       	mov    $0x13,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <mkdir>:
 327:	b8 14 00 00 00       	mov    $0x14,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <chdir>:
 32f:	b8 09 00 00 00       	mov    $0x9,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <dup>:
 337:	b8 0a 00 00 00       	mov    $0xa,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <getpid>:
 33f:	b8 0b 00 00 00       	mov    $0xb,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sbrk>:
 347:	b8 0c 00 00 00       	mov    $0xc,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <sleep>:
 34f:	b8 0d 00 00 00       	mov    $0xd,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <uptime>:
 357:	b8 0e 00 00 00       	mov    $0xe,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <cpu_limit>:
 35f:	b8 16 00 00 00       	mov    $0x16,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <set_mem_limit>:
 367:	b8 17 00 00 00       	mov    $0x17,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <get_mem_limit>:
 36f:	b8 18 00 00 00       	mov    $0x18,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <increase_mem_limit>:
 377:	b8 19 00 00 00       	mov    $0x19,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <increase_mem_usage>:
 37f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <get_mem_usage>:
 387:	b8 1b 00 00 00       	mov    $0x1b,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    
 38f:	90                   	nop

00000390 <printint>:
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	83 ec 3c             	sub    $0x3c,%esp
 399:	89 45 c0             	mov    %eax,-0x40(%ebp)
 39c:	89 cb                	mov    %ecx,%ebx
 39e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a1:	85 c9                	test   %ecx,%ecx
 3a3:	74 04                	je     3a9 <printint+0x19>
 3a5:	85 d2                	test   %edx,%edx
 3a7:	78 6b                	js     414 <printint+0x84>
 3a9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3ac:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 3b3:	31 c9                	xor    %ecx,%ecx
 3b5:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3b8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	f7 f3                	div    %ebx
 3bf:	89 cf                	mov    %ecx,%edi
 3c1:	8d 49 01             	lea    0x1(%ecx),%ecx
 3c4:	8a 92 f4 07 00 00    	mov    0x7f4(%edx),%dl
 3ca:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 3ce:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3d1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3d4:	39 da                	cmp    %ebx,%edx
 3d6:	73 e0                	jae    3b8 <printint+0x28>
 3d8:	8b 55 08             	mov    0x8(%ebp),%edx
 3db:	85 d2                	test   %edx,%edx
 3dd:	74 07                	je     3e6 <printint+0x56>
 3df:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3e4:	89 cf                	mov    %ecx,%edi
 3e6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3e9:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	8a 07                	mov    (%edi),%al
 3f2:	88 45 d7             	mov    %al,-0x29(%ebp)
 3f5:	50                   	push   %eax
 3f6:	6a 01                	push   $0x1
 3f8:	56                   	push   %esi
 3f9:	ff 75 c0             	pushl  -0x40(%ebp)
 3fc:	e8 de fe ff ff       	call   2df <write>
 401:	89 f8                	mov    %edi,%eax
 403:	4f                   	dec    %edi
 404:	83 c4 10             	add    $0x10,%esp
 407:	39 d8                	cmp    %ebx,%eax
 409:	75 e5                	jne    3f0 <printint+0x60>
 40b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    
 413:	90                   	nop
 414:	f7 da                	neg    %edx
 416:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 419:	eb 98                	jmp    3b3 <printint+0x23>
 41b:	90                   	nop

0000041c <printf>:
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	57                   	push   %edi
 420:	56                   	push   %esi
 421:	53                   	push   %ebx
 422:	83 ec 2c             	sub    $0x2c,%esp
 425:	8b 75 08             	mov    0x8(%ebp),%esi
 428:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 42b:	8a 13                	mov    (%ebx),%dl
 42d:	84 d2                	test   %dl,%dl
 42f:	74 5c                	je     48d <printf+0x71>
 431:	43                   	inc    %ebx
 432:	8d 45 10             	lea    0x10(%ebp),%eax
 435:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 438:	31 ff                	xor    %edi,%edi
 43a:	eb 20                	jmp    45c <printf+0x40>
 43c:	83 f8 25             	cmp    $0x25,%eax
 43f:	74 3f                	je     480 <printf+0x64>
 441:	88 55 e7             	mov    %dl,-0x19(%ebp)
 444:	50                   	push   %eax
 445:	6a 01                	push   $0x1
 447:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44a:	50                   	push   %eax
 44b:	56                   	push   %esi
 44c:	e8 8e fe ff ff       	call   2df <write>
 451:	83 c4 10             	add    $0x10,%esp
 454:	43                   	inc    %ebx
 455:	8a 53 ff             	mov    -0x1(%ebx),%dl
 458:	84 d2                	test   %dl,%dl
 45a:	74 31                	je     48d <printf+0x71>
 45c:	0f b6 c2             	movzbl %dl,%eax
 45f:	85 ff                	test   %edi,%edi
 461:	74 d9                	je     43c <printf+0x20>
 463:	83 ff 25             	cmp    $0x25,%edi
 466:	75 ec                	jne    454 <printf+0x38>
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	0f 84 03 01 00 00    	je     574 <printf+0x158>
 471:	83 e8 63             	sub    $0x63,%eax
 474:	83 f8 15             	cmp    $0x15,%eax
 477:	77 1f                	ja     498 <printf+0x7c>
 479:	ff 24 85 9c 07 00 00 	jmp    *0x79c(,%eax,4)
 480:	bf 25 00 00 00       	mov    $0x25,%edi
 485:	43                   	inc    %ebx
 486:	8a 53 ff             	mov    -0x1(%ebx),%dl
 489:	84 d2                	test   %dl,%dl
 48b:	75 cf                	jne    45c <printf+0x40>
 48d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5f                   	pop    %edi
 493:	5d                   	pop    %ebp
 494:	c3                   	ret    
 495:	8d 76 00             	lea    0x0(%esi),%esi
 498:	88 55 d0             	mov    %dl,-0x30(%ebp)
 49b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49f:	50                   	push   %eax
 4a0:	6a 01                	push   $0x1
 4a2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4a5:	57                   	push   %edi
 4a6:	56                   	push   %esi
 4a7:	e8 33 fe ff ff       	call   2df <write>
 4ac:	8a 55 d0             	mov    -0x30(%ebp),%dl
 4af:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b2:	83 c4 0c             	add    $0xc,%esp
 4b5:	6a 01                	push   $0x1
 4b7:	57                   	push   %edi
 4b8:	56                   	push   %esi
 4b9:	e8 21 fe ff ff       	call   2df <write>
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	31 ff                	xor    %edi,%edi
 4c3:	eb 8f                	jmp    454 <printf+0x38>
 4c5:	8d 76 00             	lea    0x0(%esi),%esi
 4c8:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4cb:	8b 17                	mov    (%edi),%edx
 4cd:	83 ec 0c             	sub    $0xc,%esp
 4d0:	6a 00                	push   $0x0
 4d2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d7:	89 f0                	mov    %esi,%eax
 4d9:	e8 b2 fe ff ff       	call   390 <printint>
 4de:	83 c7 04             	add    $0x4,%edi
 4e1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4e4:	83 c4 10             	add    $0x10,%esp
 4e7:	31 ff                	xor    %edi,%edi
 4e9:	e9 66 ff ff ff       	jmp    454 <printf+0x38>
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4f3:	8b 10                	mov    (%eax),%edx
 4f5:	83 c0 04             	add    $0x4,%eax
 4f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4fb:	85 d2                	test   %edx,%edx
 4fd:	0f 84 81 00 00 00    	je     584 <printf+0x168>
 503:	8a 02                	mov    (%edx),%al
 505:	84 c0                	test   %al,%al
 507:	0f 84 80 00 00 00    	je     58d <printf+0x171>
 50d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 510:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 513:	89 d3                	mov    %edx,%ebx
 515:	8d 76 00             	lea    0x0(%esi),%esi
 518:	88 45 e7             	mov    %al,-0x19(%ebp)
 51b:	50                   	push   %eax
 51c:	6a 01                	push   $0x1
 51e:	57                   	push   %edi
 51f:	56                   	push   %esi
 520:	e8 ba fd ff ff       	call   2df <write>
 525:	43                   	inc    %ebx
 526:	8a 03                	mov    (%ebx),%al
 528:	83 c4 10             	add    $0x10,%esp
 52b:	84 c0                	test   %al,%al
 52d:	75 e9                	jne    518 <printf+0xfc>
 52f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 532:	31 ff                	xor    %edi,%edi
 534:	e9 1b ff ff ff       	jmp    454 <printf+0x38>
 539:	8d 76 00             	lea    0x0(%esi),%esi
 53c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 53f:	8b 17                	mov    (%edi),%edx
 541:	83 ec 0c             	sub    $0xc,%esp
 544:	6a 01                	push   $0x1
 546:	b9 0a 00 00 00       	mov    $0xa,%ecx
 54b:	eb 8a                	jmp    4d7 <printf+0xbb>
 54d:	8d 76 00             	lea    0x0(%esi),%esi
 550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 553:	8b 00                	mov    (%eax),%eax
 555:	88 45 e7             	mov    %al,-0x19(%ebp)
 558:	51                   	push   %ecx
 559:	6a 01                	push   $0x1
 55b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 55e:	57                   	push   %edi
 55f:	56                   	push   %esi
 560:	e8 7a fd ff ff       	call   2df <write>
 565:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 569:	83 c4 10             	add    $0x10,%esp
 56c:	31 ff                	xor    %edi,%edi
 56e:	e9 e1 fe ff ff       	jmp    454 <printf+0x38>
 573:	90                   	nop
 574:	88 55 e7             	mov    %dl,-0x19(%ebp)
 577:	52                   	push   %edx
 578:	6a 01                	push   $0x1
 57a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 57d:	e9 35 ff ff ff       	jmp    4b7 <printf+0x9b>
 582:	66 90                	xchg   %ax,%ax
 584:	b0 28                	mov    $0x28,%al
 586:	ba 95 07 00 00       	mov    $0x795,%edx
 58b:	eb 80                	jmp    50d <printf+0xf1>
 58d:	31 ff                	xor    %edi,%edi
 58f:	e9 c0 fe ff ff       	jmp    454 <printf+0x38>

00000594 <free>:
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	57                   	push   %edi
 598:	56                   	push   %esi
 599:	53                   	push   %ebx
 59a:	83 ec 0c             	sub    $0xc,%esp
 59d:	8b 75 08             	mov    0x8(%ebp),%esi
 5a0:	8d 5e f8             	lea    -0x8(%esi),%ebx
 5a3:	8b 7e fc             	mov    -0x4(%esi),%edi
 5a6:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 5ad:	3d 00 80 00 00       	cmp    $0x8000,%eax
 5b2:	75 70                	jne    624 <free+0x90>
 5b4:	b9 00 80 00 00       	mov    $0x8000,%ecx
 5b9:	a1 5c 08 00 00       	mov    0x85c,%eax
 5be:	66 90                	xchg   %ax,%ax
 5c0:	89 c2                	mov    %eax,%edx
 5c2:	8b 00                	mov    (%eax),%eax
 5c4:	39 da                	cmp    %ebx,%edx
 5c6:	73 2c                	jae    5f4 <free+0x60>
 5c8:	39 c3                	cmp    %eax,%ebx
 5ca:	72 04                	jb     5d0 <free+0x3c>
 5cc:	39 c2                	cmp    %eax,%edx
 5ce:	72 f0                	jb     5c0 <free+0x2c>
 5d0:	01 d9                	add    %ebx,%ecx
 5d2:	39 c8                	cmp    %ecx,%eax
 5d4:	74 2c                	je     602 <free+0x6e>
 5d6:	89 46 f8             	mov    %eax,-0x8(%esi)
 5d9:	8b 42 04             	mov    0x4(%edx),%eax
 5dc:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 5df:	39 cb                	cmp    %ecx,%ebx
 5e1:	74 36                	je     619 <free+0x85>
 5e3:	89 1a                	mov    %ebx,(%edx)
 5e5:	89 15 5c 08 00 00    	mov    %edx,0x85c
 5eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ee:	5b                   	pop    %ebx
 5ef:	5e                   	pop    %esi
 5f0:	5f                   	pop    %edi
 5f1:	5d                   	pop    %ebp
 5f2:	c3                   	ret    
 5f3:	90                   	nop
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	72 c8                	jb     5c0 <free+0x2c>
 5f8:	39 c3                	cmp    %eax,%ebx
 5fa:	73 c4                	jae    5c0 <free+0x2c>
 5fc:	01 d9                	add    %ebx,%ecx
 5fe:	39 c8                	cmp    %ecx,%eax
 600:	75 d4                	jne    5d6 <free+0x42>
 602:	03 78 04             	add    0x4(%eax),%edi
 605:	89 7e fc             	mov    %edi,-0x4(%esi)
 608:	8b 02                	mov    (%edx),%eax
 60a:	8b 00                	mov    (%eax),%eax
 60c:	89 46 f8             	mov    %eax,-0x8(%esi)
 60f:	8b 42 04             	mov    0x4(%edx),%eax
 612:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 615:	39 cb                	cmp    %ecx,%ebx
 617:	75 ca                	jne    5e3 <free+0x4f>
 619:	03 46 fc             	add    -0x4(%esi),%eax
 61c:	89 42 04             	mov    %eax,0x4(%edx)
 61f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 622:	eb bf                	jmp    5e3 <free+0x4f>
 624:	83 ec 0c             	sub    $0xc,%esp
 627:	f7 d8                	neg    %eax
 629:	50                   	push   %eax
 62a:	e8 50 fd ff ff       	call   37f <increase_mem_usage>
 62f:	8b 7e fc             	mov    -0x4(%esi),%edi
 632:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 639:	83 c4 10             	add    $0x10,%esp
 63c:	e9 78 ff ff ff       	jmp    5b9 <free+0x25>
 641:	8d 76 00             	lea    0x0(%esi),%esi

00000644 <malloc>:
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 0c             	sub    $0xc,%esp
 64d:	8b 7d 08             	mov    0x8(%ebp),%edi
 650:	e8 1a fd ff ff       	call   36f <get_mem_limit>
 655:	89 c3                	mov    %eax,%ebx
 657:	e8 2b fd ff ff       	call   387 <get_mem_usage>
 65c:	83 fb ff             	cmp    $0xffffffff,%ebx
 65f:	74 0b                	je     66c <malloc+0x28>
 661:	8d 14 38             	lea    (%eax,%edi,1),%edx
 664:	39 d3                	cmp    %edx,%ebx
 666:	0f 82 e2 00 00 00    	jb     74e <malloc+0x10a>
 66c:	83 ec 0c             	sub    $0xc,%esp
 66f:	57                   	push   %edi
 670:	e8 0a fd ff ff       	call   37f <increase_mem_usage>
 675:	83 c7 07             	add    $0x7,%edi
 678:	c1 ef 03             	shr    $0x3,%edi
 67b:	47                   	inc    %edi
 67c:	8b 15 5c 08 00 00    	mov    0x85c,%edx
 682:	83 c4 10             	add    $0x10,%esp
 685:	85 d2                	test   %edx,%edx
 687:	0f 84 93 00 00 00    	je     720 <malloc+0xdc>
 68d:	8b 02                	mov    (%edx),%eax
 68f:	8b 48 04             	mov    0x4(%eax),%ecx
 692:	39 f9                	cmp    %edi,%ecx
 694:	73 62                	jae    6f8 <malloc+0xb4>
 696:	89 fb                	mov    %edi,%ebx
 698:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 69e:	72 78                	jb     718 <malloc+0xd4>
 6a0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6a7:	eb 0e                	jmp    6b7 <malloc+0x73>
 6a9:	8d 76 00             	lea    0x0(%esi),%esi
 6ac:	89 c2                	mov    %eax,%edx
 6ae:	8b 02                	mov    (%edx),%eax
 6b0:	8b 48 04             	mov    0x4(%eax),%ecx
 6b3:	39 f9                	cmp    %edi,%ecx
 6b5:	73 41                	jae    6f8 <malloc+0xb4>
 6b7:	39 05 5c 08 00 00    	cmp    %eax,0x85c
 6bd:	75 ed                	jne    6ac <malloc+0x68>
 6bf:	83 ec 0c             	sub    $0xc,%esp
 6c2:	56                   	push   %esi
 6c3:	e8 7f fc ff ff       	call   347 <sbrk>
 6c8:	83 c4 10             	add    $0x10,%esp
 6cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ce:	74 1c                	je     6ec <malloc+0xa8>
 6d0:	89 58 04             	mov    %ebx,0x4(%eax)
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	83 c0 08             	add    $0x8,%eax
 6d9:	50                   	push   %eax
 6da:	e8 b5 fe ff ff       	call   594 <free>
 6df:	8b 15 5c 08 00 00    	mov    0x85c,%edx
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	85 d2                	test   %edx,%edx
 6ea:	75 c2                	jne    6ae <malloc+0x6a>
 6ec:	31 c0                	xor    %eax,%eax
 6ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6f1:	5b                   	pop    %ebx
 6f2:	5e                   	pop    %esi
 6f3:	5f                   	pop    %edi
 6f4:	5d                   	pop    %ebp
 6f5:	c3                   	ret    
 6f6:	66 90                	xchg   %ax,%ax
 6f8:	39 cf                	cmp    %ecx,%edi
 6fa:	74 4c                	je     748 <malloc+0x104>
 6fc:	29 f9                	sub    %edi,%ecx
 6fe:	89 48 04             	mov    %ecx,0x4(%eax)
 701:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 704:	89 78 04             	mov    %edi,0x4(%eax)
 707:	89 15 5c 08 00 00    	mov    %edx,0x85c
 70d:	83 c0 08             	add    $0x8,%eax
 710:	8d 65 f4             	lea    -0xc(%ebp),%esp
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    
 718:	bb 00 10 00 00       	mov    $0x1000,%ebx
 71d:	eb 81                	jmp    6a0 <malloc+0x5c>
 71f:	90                   	nop
 720:	c7 05 5c 08 00 00 60 	movl   $0x860,0x85c
 727:	08 00 00 
 72a:	c7 05 60 08 00 00 60 	movl   $0x860,0x860
 731:	08 00 00 
 734:	c7 05 64 08 00 00 00 	movl   $0x0,0x864
 73b:	00 00 00 
 73e:	b8 60 08 00 00       	mov    $0x860,%eax
 743:	e9 4e ff ff ff       	jmp    696 <malloc+0x52>
 748:	8b 08                	mov    (%eax),%ecx
 74a:	89 0a                	mov    %ecx,(%edx)
 74c:	eb b9                	jmp    707 <malloc+0xc3>
 74e:	83 ec 0c             	sub    $0xc,%esp
 751:	57                   	push   %edi
 752:	50                   	push   %eax
 753:	53                   	push   %ebx
 754:	68 08 08 00 00       	push   $0x808
 759:	6a 02                	push   $0x2
 75b:	e8 bc fc ff ff       	call   41c <printf>
 760:	83 c4 20             	add    $0x20,%esp
 763:	31 c0                	xor    %eax,%eax
 765:	eb 87                	jmp    6ee <malloc+0xaa>
