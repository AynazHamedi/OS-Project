
_cpu_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	e8 69 00 00 00       	call   74 <memorytest>
   b:	90                   	nop

0000000c <cpu_intensive_task>:
   c:	55                   	push   %ebp
   d:	89 e5                	mov    %esp,%ebp
   f:	53                   	push   %ebx
  10:	83 ec 18             	sub    $0x18,%esp
  13:	ff 75 08             	pushl  0x8(%ebp)
  16:	68 f8 07 00 00       	push   $0x7f8
  1b:	6a 01                	push   $0x1
  1d:	e8 8a 04 00 00       	call   4ac <printf>
  22:	83 c4 10             	add    $0x10,%esp
  25:	31 c9                	xor    %ecx,%ecx
  27:	31 db                	xor    %ebx,%ebx
  29:	8d 76 00             	lea    0x0(%esi),%esi
  2c:	83 c1 01             	add    $0x1,%ecx
  2f:	83 d3 00             	adc    $0x0,%ebx
  32:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  35:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  38:	df 6d f0             	fildll -0x10(%ebp)
  3b:	85 db                	test   %ebx,%ebx
  3d:	79 06                	jns    45 <cpu_intensive_task+0x39>
  3f:	d8 05 3c 09 00 00    	fadds  0x93c
  45:	dd 5d f0             	fstpl  -0x10(%ebp)
  48:	dd 45 f0             	fldl   -0x10(%ebp)
  4b:	d9 05 40 09 00 00    	flds   0x940
  51:	de d9                	fcompp 
  53:	df e0                	fnstsw %ax
  55:	f6 c4 45             	test   $0x45,%ah
  58:	74 d2                	je     2c <cpu_intensive_task+0x20>
  5a:	83 ec 08             	sub    $0x8,%esp
  5d:	68 0d 09 00 00       	push   $0x90d
  62:	6a 01                	push   $0x1
  64:	e8 43 04 00 00       	call   4ac <printf>
  69:	83 c4 10             	add    $0x10,%esp
  6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  6f:	c9                   	leave  
  70:	c3                   	ret    
  71:	8d 76 00             	lea    0x0(%esi),%esi

00000074 <memorytest>:
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	83 ec 10             	sub    $0x10,%esp
  7a:	68 24 08 00 00       	push   $0x824
  7f:	6a 01                	push   $0x1
  81:	e8 26 04 00 00       	call   4ac <printf>
  86:	c7 04 24 00 04 00 00 	movl   $0x400,(%esp)
  8d:	e8 65 03 00 00       	call   3f7 <set_mem_limit>
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 88 95 00 00 00    	js     132 <memorytest+0xbe>
  9d:	50                   	push   %eax
  9e:	50                   	push   %eax
  9f:	68 50 08 00 00       	push   $0x850
  a4:	6a 01                	push   $0x1
  a6:	e8 01 04 00 00       	call   4ac <printf>
  ab:	83 c4 10             	add    $0x10,%esp
  ae:	83 ec 0c             	sub    $0xc,%esp
  b1:	68 fe 01 00 00       	push   $0x1fe
  b6:	e8 19 06 00 00       	call   6d4 <malloc>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	85 c0                	test   %eax,%eax
  c0:	0f 84 ac 00 00 00    	je     172 <memorytest+0xfe>
  c6:	50                   	push   %eax
  c7:	68 fe 01 00 00       	push   $0x1fe
  cc:	68 20 09 00 00       	push   $0x920
  d1:	6a 01                	push   $0x1
  d3:	e8 d4 03 00 00       	call   4ac <printf>
  d8:	83 c4 10             	add    $0x10,%esp
  db:	83 ec 0c             	sub    $0xc,%esp
  de:	68 fe 01 00 00       	push   $0x1fe
  e3:	e8 ec 05 00 00       	call   6d4 <malloc>
  e8:	83 c4 10             	add    $0x10,%esp
  eb:	85 c0                	test   %eax,%eax
  ed:	74 6c                	je     15b <memorytest+0xe7>
  ef:	50                   	push   %eax
  f0:	68 fe 01 00 00       	push   $0x1fe
  f5:	68 20 09 00 00       	push   $0x920
  fa:	6a 01                	push   $0x1
  fc:	e8 ab 03 00 00       	call   4ac <printf>
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 ec 0c             	sub    $0xc,%esp
 107:	68 fe 01 00 00       	push   $0x1fe
 10c:	e8 c3 05 00 00       	call   6d4 <malloc>
 111:	83 c4 10             	add    $0x10,%esp
 114:	85 c0                	test   %eax,%eax
 116:	74 30                	je     148 <memorytest+0xd4>
 118:	52                   	push   %edx
 119:	68 fe 01 00 00       	push   $0x1fe
 11e:	68 b4 08 00 00       	push   $0x8b4
 123:	6a 01                	push   $0x1
 125:	e8 82 03 00 00       	call   4ac <printf>
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	e8 1d 02 00 00       	call   34f <exit>
 132:	50                   	push   %eax
 133:	50                   	push   %eax
 134:	68 74 08 00 00       	push   $0x874
 139:	6a 01                	push   $0x1
 13b:	e8 6c 03 00 00       	call   4ac <printf>
 140:	83 c4 10             	add    $0x10,%esp
 143:	e9 66 ff ff ff       	jmp    ae <memorytest+0x3a>
 148:	50                   	push   %eax
 149:	50                   	push   %eax
 14a:	68 dc 08 00 00       	push   $0x8dc
 14f:	6a 01                	push   $0x1
 151:	e8 56 03 00 00       	call   4ac <printf>
 156:	83 c4 10             	add    $0x10,%esp
 159:	eb d2                	jmp    12d <memorytest+0xb9>
 15b:	51                   	push   %ecx
 15c:	68 fe 01 00 00       	push   $0x1fe
 161:	68 94 08 00 00       	push   $0x894
 166:	6a 01                	push   $0x1
 168:	e8 3f 03 00 00       	call   4ac <printf>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb 92                	jmp    104 <memorytest+0x90>
 172:	50                   	push   %eax
 173:	68 fe 01 00 00       	push   $0x1fe
 178:	68 94 08 00 00       	push   $0x894
 17d:	6a 01                	push   $0x1
 17f:	e8 28 03 00 00       	call   4ac <printf>
 184:	83 c4 10             	add    $0x10,%esp
 187:	e9 4f ff ff ff       	jmp    db <memorytest+0x67>

0000018c <strcpy>:
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	53                   	push   %ebx
 190:	8b 4d 08             	mov    0x8(%ebp),%ecx
 193:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 196:	31 c0                	xor    %eax,%eax
 198:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 19b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 19e:	40                   	inc    %eax
 19f:	84 d2                	test   %dl,%dl
 1a1:	75 f5                	jne    198 <strcpy+0xc>
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a8:	c9                   	leave  
 1a9:	c3                   	ret    
 1aa:	66 90                	xchg   %ax,%ax

000001ac <strcmp>:
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	53                   	push   %ebx
 1b0:	8b 55 08             	mov    0x8(%ebp),%edx
 1b3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1b6:	0f b6 02             	movzbl (%edx),%eax
 1b9:	84 c0                	test   %al,%al
 1bb:	75 10                	jne    1cd <strcmp+0x21>
 1bd:	eb 2a                	jmp    1e9 <strcmp+0x3d>
 1bf:	90                   	nop
 1c0:	42                   	inc    %edx
 1c1:	8d 4b 01             	lea    0x1(%ebx),%ecx
 1c4:	0f b6 02             	movzbl (%edx),%eax
 1c7:	84 c0                	test   %al,%al
 1c9:	74 11                	je     1dc <strcmp+0x30>
 1cb:	89 cb                	mov    %ecx,%ebx
 1cd:	0f b6 0b             	movzbl (%ebx),%ecx
 1d0:	38 c1                	cmp    %al,%cl
 1d2:	74 ec                	je     1c0 <strcmp+0x14>
 1d4:	29 c8                	sub    %ecx,%eax
 1d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d9:	c9                   	leave  
 1da:	c3                   	ret    
 1db:	90                   	nop
 1dc:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 1e0:	31 c0                	xor    %eax,%eax
 1e2:	29 c8                	sub    %ecx,%eax
 1e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	0f b6 0b             	movzbl (%ebx),%ecx
 1ec:	31 c0                	xor    %eax,%eax
 1ee:	eb e4                	jmp    1d4 <strcmp+0x28>

000001f0 <strlen>:
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
 1f6:	80 3a 00             	cmpb   $0x0,(%edx)
 1f9:	74 15                	je     210 <strlen+0x20>
 1fb:	31 c0                	xor    %eax,%eax
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	40                   	inc    %eax
 201:	89 c1                	mov    %eax,%ecx
 203:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 207:	75 f7                	jne    200 <strlen+0x10>
 209:	89 c8                	mov    %ecx,%eax
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	31 c9                	xor    %ecx,%ecx
 212:	89 c8                	mov    %ecx,%eax
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    
 216:	66 90                	xchg   %ax,%ax

00000218 <memset>:
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	57                   	push   %edi
 21c:	8b 7d 08             	mov    0x8(%ebp),%edi
 21f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 222:	8b 45 0c             	mov    0xc(%ebp),%eax
 225:	fc                   	cld    
 226:	f3 aa                	rep stos %al,%es:(%edi)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 22e:	c9                   	leave  
 22f:	c3                   	ret    

00000230 <strchr>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	8a 4d 0c             	mov    0xc(%ebp),%cl
 239:	8a 10                	mov    (%eax),%dl
 23b:	84 d2                	test   %dl,%dl
 23d:	75 0c                	jne    24b <strchr+0x1b>
 23f:	eb 13                	jmp    254 <strchr+0x24>
 241:	8d 76 00             	lea    0x0(%esi),%esi
 244:	40                   	inc    %eax
 245:	8a 10                	mov    (%eax),%dl
 247:	84 d2                	test   %dl,%dl
 249:	74 09                	je     254 <strchr+0x24>
 24b:	38 d1                	cmp    %dl,%cl
 24d:	75 f5                	jne    244 <strchr+0x14>
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d 76 00             	lea    0x0(%esi),%esi
 254:	31 c0                	xor    %eax,%eax
 256:	5d                   	pop    %ebp
 257:	c3                   	ret    

00000258 <gets>:
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	57                   	push   %edi
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
 25e:	83 ec 1c             	sub    $0x1c,%esp
 261:	31 db                	xor    %ebx,%ebx
 263:	8d 75 e7             	lea    -0x19(%ebp),%esi
 266:	eb 24                	jmp    28c <gets+0x34>
 268:	50                   	push   %eax
 269:	6a 01                	push   $0x1
 26b:	56                   	push   %esi
 26c:	6a 00                	push   $0x0
 26e:	e8 f4 00 00 00       	call   367 <read>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	7e 1a                	jle    294 <gets+0x3c>
 27a:	8a 45 e7             	mov    -0x19(%ebp),%al
 27d:	8b 55 08             	mov    0x8(%ebp),%edx
 280:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 284:	3c 0a                	cmp    $0xa,%al
 286:	74 0e                	je     296 <gets+0x3e>
 288:	3c 0d                	cmp    $0xd,%al
 28a:	74 0a                	je     296 <gets+0x3e>
 28c:	89 df                	mov    %ebx,%edi
 28e:	43                   	inc    %ebx
 28f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 292:	7c d4                	jl     268 <gets+0x10>
 294:	89 fb                	mov    %edi,%ebx
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 29d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5f                   	pop    %edi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d 76 00             	lea    0x0(%esi),%esi

000002a8 <stat>:
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	56                   	push   %esi
 2ac:	53                   	push   %ebx
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	6a 00                	push   $0x0
 2b2:	ff 75 08             	pushl  0x8(%ebp)
 2b5:	e8 d5 00 00 00       	call   38f <open>
 2ba:	83 c4 10             	add    $0x10,%esp
 2bd:	85 c0                	test   %eax,%eax
 2bf:	78 27                	js     2e8 <stat+0x40>
 2c1:	89 c3                	mov    %eax,%ebx
 2c3:	83 ec 08             	sub    $0x8,%esp
 2c6:	ff 75 0c             	pushl  0xc(%ebp)
 2c9:	50                   	push   %eax
 2ca:	e8 d8 00 00 00       	call   3a7 <fstat>
 2cf:	89 c6                	mov    %eax,%esi
 2d1:	89 1c 24             	mov    %ebx,(%esp)
 2d4:	e8 9e 00 00 00       	call   377 <close>
 2d9:	83 c4 10             	add    $0x10,%esp
 2dc:	89 f0                	mov    %esi,%eax
 2de:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e1:	5b                   	pop    %ebx
 2e2:	5e                   	pop    %esi
 2e3:	5d                   	pop    %ebp
 2e4:	c3                   	ret    
 2e5:	8d 76 00             	lea    0x0(%esi),%esi
 2e8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ed:	eb ed                	jmp    2dc <stat+0x34>
 2ef:	90                   	nop

000002f0 <atoi>:
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f7:	0f be 01             	movsbl (%ecx),%eax
 2fa:	8d 50 d0             	lea    -0x30(%eax),%edx
 2fd:	80 fa 09             	cmp    $0x9,%dl
 300:	ba 00 00 00 00       	mov    $0x0,%edx
 305:	77 16                	ja     31d <atoi+0x2d>
 307:	90                   	nop
 308:	41                   	inc    %ecx
 309:	8d 14 92             	lea    (%edx,%edx,4),%edx
 30c:	01 d2                	add    %edx,%edx
 30e:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 312:	0f be 01             	movsbl (%ecx),%eax
 315:	8d 58 d0             	lea    -0x30(%eax),%ebx
 318:	80 fb 09             	cmp    $0x9,%bl
 31b:	76 eb                	jbe    308 <atoi+0x18>
 31d:	89 d0                	mov    %edx,%eax
 31f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 322:	c9                   	leave  
 323:	c3                   	ret    

00000324 <memmove>:
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	56                   	push   %esi
 329:	8b 55 08             	mov    0x8(%ebp),%edx
 32c:	8b 75 0c             	mov    0xc(%ebp),%esi
 32f:	8b 45 10             	mov    0x10(%ebp),%eax
 332:	85 c0                	test   %eax,%eax
 334:	7e 0b                	jle    341 <memmove+0x1d>
 336:	01 d0                	add    %edx,%eax
 338:	89 d7                	mov    %edx,%edi
 33a:	66 90                	xchg   %ax,%ax
 33c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 33d:	39 f8                	cmp    %edi,%eax
 33f:	75 fb                	jne    33c <memmove+0x18>
 341:	89 d0                	mov    %edx,%eax
 343:	5e                   	pop    %esi
 344:	5f                   	pop    %edi
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <fork>:
 347:	b8 01 00 00 00       	mov    $0x1,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <exit>:
 34f:	b8 02 00 00 00       	mov    $0x2,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <wait>:
 357:	b8 03 00 00 00       	mov    $0x3,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <pipe>:
 35f:	b8 04 00 00 00       	mov    $0x4,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <read>:
 367:	b8 05 00 00 00       	mov    $0x5,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <write>:
 36f:	b8 10 00 00 00       	mov    $0x10,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <close>:
 377:	b8 15 00 00 00       	mov    $0x15,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <kill>:
 37f:	b8 06 00 00 00       	mov    $0x6,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <exec>:
 387:	b8 07 00 00 00       	mov    $0x7,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <open>:
 38f:	b8 0f 00 00 00       	mov    $0xf,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <mknod>:
 397:	b8 11 00 00 00       	mov    $0x11,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <unlink>:
 39f:	b8 12 00 00 00       	mov    $0x12,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <fstat>:
 3a7:	b8 08 00 00 00       	mov    $0x8,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <link>:
 3af:	b8 13 00 00 00       	mov    $0x13,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <mkdir>:
 3b7:	b8 14 00 00 00       	mov    $0x14,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <chdir>:
 3bf:	b8 09 00 00 00       	mov    $0x9,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <dup>:
 3c7:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <getpid>:
 3cf:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <sbrk>:
 3d7:	b8 0c 00 00 00       	mov    $0xc,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <sleep>:
 3df:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <uptime>:
 3e7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <cpu_limit>:
 3ef:	b8 16 00 00 00       	mov    $0x16,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <set_mem_limit>:
 3f7:	b8 17 00 00 00       	mov    $0x17,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <get_mem_limit>:
 3ff:	b8 18 00 00 00       	mov    $0x18,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <increase_mem_limit>:
 407:	b8 19 00 00 00       	mov    $0x19,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <increase_mem_usage>:
 40f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <get_mem_usage>:
 417:	b8 1b 00 00 00       	mov    $0x1b,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    
 41f:	90                   	nop

00000420 <printint>:
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 3c             	sub    $0x3c,%esp
 429:	89 45 c0             	mov    %eax,-0x40(%ebp)
 42c:	89 cb                	mov    %ecx,%ebx
 42e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 431:	85 c9                	test   %ecx,%ecx
 433:	74 04                	je     439 <printint+0x19>
 435:	85 d2                	test   %edx,%edx
 437:	78 6b                	js     4a4 <printint+0x84>
 439:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 43c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 443:	31 c9                	xor    %ecx,%ecx
 445:	8d 75 d7             	lea    -0x29(%ebp),%esi
 448:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 44b:	31 d2                	xor    %edx,%edx
 44d:	f7 f3                	div    %ebx
 44f:	89 cf                	mov    %ecx,%edi
 451:	8d 49 01             	lea    0x1(%ecx),%ecx
 454:	8a 92 a4 09 00 00    	mov    0x9a4(%edx),%dl
 45a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 45e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 461:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 464:	39 da                	cmp    %ebx,%edx
 466:	73 e0                	jae    448 <printint+0x28>
 468:	8b 55 08             	mov    0x8(%ebp),%edx
 46b:	85 d2                	test   %edx,%edx
 46d:	74 07                	je     476 <printint+0x56>
 46f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 474:	89 cf                	mov    %ecx,%edi
 476:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 479:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	8a 07                	mov    (%edi),%al
 482:	88 45 d7             	mov    %al,-0x29(%ebp)
 485:	50                   	push   %eax
 486:	6a 01                	push   $0x1
 488:	56                   	push   %esi
 489:	ff 75 c0             	pushl  -0x40(%ebp)
 48c:	e8 de fe ff ff       	call   36f <write>
 491:	89 f8                	mov    %edi,%eax
 493:	4f                   	dec    %edi
 494:	83 c4 10             	add    $0x10,%esp
 497:	39 d8                	cmp    %ebx,%eax
 499:	75 e5                	jne    480 <printint+0x60>
 49b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49e:	5b                   	pop    %ebx
 49f:	5e                   	pop    %esi
 4a0:	5f                   	pop    %edi
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    
 4a3:	90                   	nop
 4a4:	f7 da                	neg    %edx
 4a6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 4a9:	eb 98                	jmp    443 <printint+0x23>
 4ab:	90                   	nop

000004ac <printf>:
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	57                   	push   %edi
 4b0:	56                   	push   %esi
 4b1:	53                   	push   %ebx
 4b2:	83 ec 2c             	sub    $0x2c,%esp
 4b5:	8b 75 08             	mov    0x8(%ebp),%esi
 4b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4bb:	8a 13                	mov    (%ebx),%dl
 4bd:	84 d2                	test   %dl,%dl
 4bf:	74 5c                	je     51d <printf+0x71>
 4c1:	43                   	inc    %ebx
 4c2:	8d 45 10             	lea    0x10(%ebp),%eax
 4c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4c8:	31 ff                	xor    %edi,%edi
 4ca:	eb 20                	jmp    4ec <printf+0x40>
 4cc:	83 f8 25             	cmp    $0x25,%eax
 4cf:	74 3f                	je     510 <printf+0x64>
 4d1:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d4:	50                   	push   %eax
 4d5:	6a 01                	push   $0x1
 4d7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4da:	50                   	push   %eax
 4db:	56                   	push   %esi
 4dc:	e8 8e fe ff ff       	call   36f <write>
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	43                   	inc    %ebx
 4e5:	8a 53 ff             	mov    -0x1(%ebx),%dl
 4e8:	84 d2                	test   %dl,%dl
 4ea:	74 31                	je     51d <printf+0x71>
 4ec:	0f b6 c2             	movzbl %dl,%eax
 4ef:	85 ff                	test   %edi,%edi
 4f1:	74 d9                	je     4cc <printf+0x20>
 4f3:	83 ff 25             	cmp    $0x25,%edi
 4f6:	75 ec                	jne    4e4 <printf+0x38>
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	0f 84 03 01 00 00    	je     604 <printf+0x158>
 501:	83 e8 63             	sub    $0x63,%eax
 504:	83 f8 15             	cmp    $0x15,%eax
 507:	77 1f                	ja     528 <printf+0x7c>
 509:	ff 24 85 4c 09 00 00 	jmp    *0x94c(,%eax,4)
 510:	bf 25 00 00 00       	mov    $0x25,%edi
 515:	43                   	inc    %ebx
 516:	8a 53 ff             	mov    -0x1(%ebx),%dl
 519:	84 d2                	test   %dl,%dl
 51b:	75 cf                	jne    4ec <printf+0x40>
 51d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5f                   	pop    %edi
 523:	5d                   	pop    %ebp
 524:	c3                   	ret    
 525:	8d 76 00             	lea    0x0(%esi),%esi
 528:	88 55 d0             	mov    %dl,-0x30(%ebp)
 52b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52f:	50                   	push   %eax
 530:	6a 01                	push   $0x1
 532:	8d 7d e7             	lea    -0x19(%ebp),%edi
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	e8 33 fe ff ff       	call   36f <write>
 53c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 53f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 542:	83 c4 0c             	add    $0xc,%esp
 545:	6a 01                	push   $0x1
 547:	57                   	push   %edi
 548:	56                   	push   %esi
 549:	e8 21 fe ff ff       	call   36f <write>
 54e:	83 c4 10             	add    $0x10,%esp
 551:	31 ff                	xor    %edi,%edi
 553:	eb 8f                	jmp    4e4 <printf+0x38>
 555:	8d 76 00             	lea    0x0(%esi),%esi
 558:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 55b:	8b 17                	mov    (%edi),%edx
 55d:	83 ec 0c             	sub    $0xc,%esp
 560:	6a 00                	push   $0x0
 562:	b9 10 00 00 00       	mov    $0x10,%ecx
 567:	89 f0                	mov    %esi,%eax
 569:	e8 b2 fe ff ff       	call   420 <printint>
 56e:	83 c7 04             	add    $0x4,%edi
 571:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 574:	83 c4 10             	add    $0x10,%esp
 577:	31 ff                	xor    %edi,%edi
 579:	e9 66 ff ff ff       	jmp    4e4 <printf+0x38>
 57e:	66 90                	xchg   %ax,%ax
 580:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 583:	8b 10                	mov    (%eax),%edx
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 58b:	85 d2                	test   %edx,%edx
 58d:	0f 84 81 00 00 00    	je     614 <printf+0x168>
 593:	8a 02                	mov    (%edx),%al
 595:	84 c0                	test   %al,%al
 597:	0f 84 80 00 00 00    	je     61d <printf+0x171>
 59d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5a0:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5a3:	89 d3                	mov    %edx,%ebx
 5a5:	8d 76 00             	lea    0x0(%esi),%esi
 5a8:	88 45 e7             	mov    %al,-0x19(%ebp)
 5ab:	50                   	push   %eax
 5ac:	6a 01                	push   $0x1
 5ae:	57                   	push   %edi
 5af:	56                   	push   %esi
 5b0:	e8 ba fd ff ff       	call   36f <write>
 5b5:	43                   	inc    %ebx
 5b6:	8a 03                	mov    (%ebx),%al
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	84 c0                	test   %al,%al
 5bd:	75 e9                	jne    5a8 <printf+0xfc>
 5bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5c2:	31 ff                	xor    %edi,%edi
 5c4:	e9 1b ff ff ff       	jmp    4e4 <printf+0x38>
 5c9:	8d 76 00             	lea    0x0(%esi),%esi
 5cc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5cf:	8b 17                	mov    (%edi),%edx
 5d1:	83 ec 0c             	sub    $0xc,%esp
 5d4:	6a 01                	push   $0x1
 5d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5db:	eb 8a                	jmp    567 <printf+0xbb>
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	8b 00                	mov    (%eax),%eax
 5e5:	88 45 e7             	mov    %al,-0x19(%ebp)
 5e8:	51                   	push   %ecx
 5e9:	6a 01                	push   $0x1
 5eb:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5ee:	57                   	push   %edi
 5ef:	56                   	push   %esi
 5f0:	e8 7a fd ff ff       	call   36f <write>
 5f5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f9:	83 c4 10             	add    $0x10,%esp
 5fc:	31 ff                	xor    %edi,%edi
 5fe:	e9 e1 fe ff ff       	jmp    4e4 <printf+0x38>
 603:	90                   	nop
 604:	88 55 e7             	mov    %dl,-0x19(%ebp)
 607:	52                   	push   %edx
 608:	6a 01                	push   $0x1
 60a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 60d:	e9 35 ff ff ff       	jmp    547 <printf+0x9b>
 612:	66 90                	xchg   %ax,%ax
 614:	b0 28                	mov    $0x28,%al
 616:	ba 44 09 00 00       	mov    $0x944,%edx
 61b:	eb 80                	jmp    59d <printf+0xf1>
 61d:	31 ff                	xor    %edi,%edi
 61f:	e9 c0 fe ff ff       	jmp    4e4 <printf+0x38>

00000624 <free>:
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	83 ec 0c             	sub    $0xc,%esp
 62d:	8b 75 08             	mov    0x8(%ebp),%esi
 630:	8d 5e f8             	lea    -0x8(%esi),%ebx
 633:	8b 7e fc             	mov    -0x4(%esi),%edi
 636:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 63d:	3d 00 80 00 00       	cmp    $0x8000,%eax
 642:	75 70                	jne    6b4 <free+0x90>
 644:	b9 00 80 00 00       	mov    $0x8000,%ecx
 649:	a1 0c 0a 00 00       	mov    0xa0c,%eax
 64e:	66 90                	xchg   %ax,%ax
 650:	89 c2                	mov    %eax,%edx
 652:	8b 00                	mov    (%eax),%eax
 654:	39 da                	cmp    %ebx,%edx
 656:	73 2c                	jae    684 <free+0x60>
 658:	39 c3                	cmp    %eax,%ebx
 65a:	72 04                	jb     660 <free+0x3c>
 65c:	39 c2                	cmp    %eax,%edx
 65e:	72 f0                	jb     650 <free+0x2c>
 660:	01 d9                	add    %ebx,%ecx
 662:	39 c8                	cmp    %ecx,%eax
 664:	74 2c                	je     692 <free+0x6e>
 666:	89 46 f8             	mov    %eax,-0x8(%esi)
 669:	8b 42 04             	mov    0x4(%edx),%eax
 66c:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 66f:	39 cb                	cmp    %ecx,%ebx
 671:	74 36                	je     6a9 <free+0x85>
 673:	89 1a                	mov    %ebx,(%edx)
 675:	89 15 0c 0a 00 00    	mov    %edx,0xa0c
 67b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5f                   	pop    %edi
 681:	5d                   	pop    %ebp
 682:	c3                   	ret    
 683:	90                   	nop
 684:	39 c2                	cmp    %eax,%edx
 686:	72 c8                	jb     650 <free+0x2c>
 688:	39 c3                	cmp    %eax,%ebx
 68a:	73 c4                	jae    650 <free+0x2c>
 68c:	01 d9                	add    %ebx,%ecx
 68e:	39 c8                	cmp    %ecx,%eax
 690:	75 d4                	jne    666 <free+0x42>
 692:	03 78 04             	add    0x4(%eax),%edi
 695:	89 7e fc             	mov    %edi,-0x4(%esi)
 698:	8b 02                	mov    (%edx),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	89 46 f8             	mov    %eax,-0x8(%esi)
 69f:	8b 42 04             	mov    0x4(%edx),%eax
 6a2:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 6a5:	39 cb                	cmp    %ecx,%ebx
 6a7:	75 ca                	jne    673 <free+0x4f>
 6a9:	03 46 fc             	add    -0x4(%esi),%eax
 6ac:	89 42 04             	mov    %eax,0x4(%edx)
 6af:	8b 5e f8             	mov    -0x8(%esi),%ebx
 6b2:	eb bf                	jmp    673 <free+0x4f>
 6b4:	83 ec 0c             	sub    $0xc,%esp
 6b7:	f7 d8                	neg    %eax
 6b9:	50                   	push   %eax
 6ba:	e8 50 fd ff ff       	call   40f <increase_mem_usage>
 6bf:	8b 7e fc             	mov    -0x4(%esi),%edi
 6c2:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 6c9:	83 c4 10             	add    $0x10,%esp
 6cc:	e9 78 ff ff ff       	jmp    649 <free+0x25>
 6d1:	8d 76 00             	lea    0x0(%esi),%esi

000006d4 <malloc>:
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	57                   	push   %edi
 6d8:	56                   	push   %esi
 6d9:	53                   	push   %ebx
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	8b 7d 08             	mov    0x8(%ebp),%edi
 6e0:	e8 1a fd ff ff       	call   3ff <get_mem_limit>
 6e5:	89 c3                	mov    %eax,%ebx
 6e7:	e8 2b fd ff ff       	call   417 <get_mem_usage>
 6ec:	83 fb ff             	cmp    $0xffffffff,%ebx
 6ef:	74 0b                	je     6fc <malloc+0x28>
 6f1:	8d 14 38             	lea    (%eax,%edi,1),%edx
 6f4:	39 d3                	cmp    %edx,%ebx
 6f6:	0f 82 e2 00 00 00    	jb     7de <malloc+0x10a>
 6fc:	83 ec 0c             	sub    $0xc,%esp
 6ff:	57                   	push   %edi
 700:	e8 0a fd ff ff       	call   40f <increase_mem_usage>
 705:	83 c7 07             	add    $0x7,%edi
 708:	c1 ef 03             	shr    $0x3,%edi
 70b:	47                   	inc    %edi
 70c:	8b 15 0c 0a 00 00    	mov    0xa0c,%edx
 712:	83 c4 10             	add    $0x10,%esp
 715:	85 d2                	test   %edx,%edx
 717:	0f 84 93 00 00 00    	je     7b0 <malloc+0xdc>
 71d:	8b 02                	mov    (%edx),%eax
 71f:	8b 48 04             	mov    0x4(%eax),%ecx
 722:	39 f9                	cmp    %edi,%ecx
 724:	73 62                	jae    788 <malloc+0xb4>
 726:	89 fb                	mov    %edi,%ebx
 728:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 72e:	72 78                	jb     7a8 <malloc+0xd4>
 730:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 737:	eb 0e                	jmp    747 <malloc+0x73>
 739:	8d 76 00             	lea    0x0(%esi),%esi
 73c:	89 c2                	mov    %eax,%edx
 73e:	8b 02                	mov    (%edx),%eax
 740:	8b 48 04             	mov    0x4(%eax),%ecx
 743:	39 f9                	cmp    %edi,%ecx
 745:	73 41                	jae    788 <malloc+0xb4>
 747:	39 05 0c 0a 00 00    	cmp    %eax,0xa0c
 74d:	75 ed                	jne    73c <malloc+0x68>
 74f:	83 ec 0c             	sub    $0xc,%esp
 752:	56                   	push   %esi
 753:	e8 7f fc ff ff       	call   3d7 <sbrk>
 758:	83 c4 10             	add    $0x10,%esp
 75b:	83 f8 ff             	cmp    $0xffffffff,%eax
 75e:	74 1c                	je     77c <malloc+0xa8>
 760:	89 58 04             	mov    %ebx,0x4(%eax)
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	83 c0 08             	add    $0x8,%eax
 769:	50                   	push   %eax
 76a:	e8 b5 fe ff ff       	call   624 <free>
 76f:	8b 15 0c 0a 00 00    	mov    0xa0c,%edx
 775:	83 c4 10             	add    $0x10,%esp
 778:	85 d2                	test   %edx,%edx
 77a:	75 c2                	jne    73e <malloc+0x6a>
 77c:	31 c0                	xor    %eax,%eax
 77e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 781:	5b                   	pop    %ebx
 782:	5e                   	pop    %esi
 783:	5f                   	pop    %edi
 784:	5d                   	pop    %ebp
 785:	c3                   	ret    
 786:	66 90                	xchg   %ax,%ax
 788:	39 cf                	cmp    %ecx,%edi
 78a:	74 4c                	je     7d8 <malloc+0x104>
 78c:	29 f9                	sub    %edi,%ecx
 78e:	89 48 04             	mov    %ecx,0x4(%eax)
 791:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 794:	89 78 04             	mov    %edi,0x4(%eax)
 797:	89 15 0c 0a 00 00    	mov    %edx,0xa0c
 79d:	83 c0 08             	add    $0x8,%eax
 7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
 7a8:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7ad:	eb 81                	jmp    730 <malloc+0x5c>
 7af:	90                   	nop
 7b0:	c7 05 0c 0a 00 00 10 	movl   $0xa10,0xa0c
 7b7:	0a 00 00 
 7ba:	c7 05 10 0a 00 00 10 	movl   $0xa10,0xa10
 7c1:	0a 00 00 
 7c4:	c7 05 14 0a 00 00 00 	movl   $0x0,0xa14
 7cb:	00 00 00 
 7ce:	b8 10 0a 00 00       	mov    $0xa10,%eax
 7d3:	e9 4e ff ff ff       	jmp    726 <malloc+0x52>
 7d8:	8b 08                	mov    (%eax),%ecx
 7da:	89 0a                	mov    %ecx,(%edx)
 7dc:	eb b9                	jmp    797 <malloc+0xc3>
 7de:	83 ec 0c             	sub    $0xc,%esp
 7e1:	57                   	push   %edi
 7e2:	50                   	push   %eax
 7e3:	53                   	push   %ebx
 7e4:	68 b8 09 00 00       	push   $0x9b8
 7e9:	6a 02                	push   $0x2
 7eb:	e8 bc fc ff ff       	call   4ac <printf>
 7f0:	83 c4 20             	add    $0x20,%esp
 7f3:	31 c0                	xor    %eax,%eax
 7f5:	eb 87                	jmp    77e <malloc+0xaa>
