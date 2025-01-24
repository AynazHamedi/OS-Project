
_wc:     file format elf32-i386


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
  16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	48                   	dec    %eax
  1d:	7e 5a                	jle    79 <main+0x79>
  1f:	83 c3 04             	add    $0x4,%ebx
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	eb 22                	jmp    4b <main+0x4b>
  29:	8d 76 00             	lea    0x0(%esi),%esi
  2c:	83 ec 08             	sub    $0x8,%esp
  2f:	ff 33                	pushl  (%ebx)
  31:	50                   	push   %eax
  32:	e8 55 00 00 00       	call   8c <wc>
  37:	89 3c 24             	mov    %edi,(%esp)
  3a:	e8 f8 02 00 00       	call   337 <close>
  3f:	46                   	inc    %esi
  40:	83 c3 04             	add    $0x4,%ebx
  43:	83 c4 10             	add    $0x10,%esp
  46:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  49:	74 29                	je     74 <main+0x74>
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	6a 00                	push   $0x0
  50:	ff 33                	pushl  (%ebx)
  52:	e8 f8 02 00 00       	call   34f <open>
  57:	89 c7                	mov    %eax,%edi
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	79 cc                	jns    2c <main+0x2c>
  60:	50                   	push   %eax
  61:	ff 33                	pushl  (%ebx)
  63:	68 db 07 00 00       	push   $0x7db
  68:	6a 01                	push   $0x1
  6a:	e8 fd 03 00 00       	call   46c <printf>
  6f:	e8 9b 02 00 00       	call   30f <exit>
  74:	e8 96 02 00 00       	call   30f <exit>
  79:	52                   	push   %edx
  7a:	52                   	push   %edx
  7b:	68 cd 07 00 00       	push   $0x7cd
  80:	6a 00                	push   $0x0
  82:	e8 05 00 00 00       	call   8c <wc>
  87:	e8 83 02 00 00       	call   30f <exit>

0000008c <wc>:
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	57                   	push   %edi
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	83 ec 1c             	sub    $0x1c,%esp
  95:	31 db                	xor    %ebx,%ebx
  97:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  9e:	31 c9                	xor    %ecx,%ecx
  a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  a7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  aa:	66 90                	xchg   %ax,%ax
  ac:	52                   	push   %edx
  ad:	68 00 02 00 00       	push   $0x200
  b2:	68 c0 08 00 00       	push   $0x8c0
  b7:	ff 75 08             	pushl  0x8(%ebp)
  ba:	e8 68 02 00 00       	call   327 <read>
  bf:	89 c7                	mov    %eax,%edi
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	7e 48                	jle    110 <wc+0x84>
  c8:	31 f6                	xor    %esi,%esi
  ca:	eb 07                	jmp    d3 <wc+0x47>
  cc:	31 db                	xor    %ebx,%ebx
  ce:	46                   	inc    %esi
  cf:	39 f7                	cmp    %esi,%edi
  d1:	74 35                	je     108 <wc+0x7c>
  d3:	0f be 86 c0 08 00 00 	movsbl 0x8c0(%esi),%eax
  da:	3c 0a                	cmp    $0xa,%al
  dc:	75 03                	jne    e1 <wc+0x55>
  de:	ff 45 e4             	incl   -0x1c(%ebp)
  e1:	83 ec 08             	sub    $0x8,%esp
  e4:	50                   	push   %eax
  e5:	68 b8 07 00 00       	push   $0x7b8
  ea:	e8 01 01 00 00       	call   1f0 <strchr>
  ef:	83 c4 10             	add    $0x10,%esp
  f2:	85 c0                	test   %eax,%eax
  f4:	75 d6                	jne    cc <wc+0x40>
  f6:	85 db                	test   %ebx,%ebx
  f8:	75 d4                	jne    ce <wc+0x42>
  fa:	ff 45 e0             	incl   -0x20(%ebp)
  fd:	bb 01 00 00 00       	mov    $0x1,%ebx
 102:	46                   	inc    %esi
 103:	39 f7                	cmp    %esi,%edi
 105:	75 cc                	jne    d3 <wc+0x47>
 107:	90                   	nop
 108:	01 7d dc             	add    %edi,-0x24(%ebp)
 10b:	eb 9f                	jmp    ac <wc+0x20>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 113:	75 24                	jne    139 <wc+0xad>
 115:	83 ec 08             	sub    $0x8,%esp
 118:	ff 75 0c             	pushl  0xc(%ebp)
 11b:	ff 75 dc             	pushl  -0x24(%ebp)
 11e:	51                   	push   %ecx
 11f:	ff 75 e4             	pushl  -0x1c(%ebp)
 122:	68 ce 07 00 00       	push   $0x7ce
 127:	6a 01                	push   $0x1
 129:	e8 3e 03 00 00       	call   46c <printf>
 12e:	83 c4 20             	add    $0x20,%esp
 131:	8d 65 f4             	lea    -0xc(%ebp),%esp
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5f                   	pop    %edi
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	50                   	push   %eax
 13a:	50                   	push   %eax
 13b:	68 be 07 00 00       	push   $0x7be
 140:	6a 01                	push   $0x1
 142:	e8 25 03 00 00       	call   46c <printf>
 147:	e8 c3 01 00 00       	call   30f <exit>

0000014c <strcpy>:
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	53                   	push   %ebx
 150:	8b 4d 08             	mov    0x8(%ebp),%ecx
 153:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 156:	31 c0                	xor    %eax,%eax
 158:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 15b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 15e:	40                   	inc    %eax
 15f:	84 d2                	test   %dl,%dl
 161:	75 f5                	jne    158 <strcpy+0xc>
 163:	89 c8                	mov    %ecx,%eax
 165:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 168:	c9                   	leave  
 169:	c3                   	ret    
 16a:	66 90                	xchg   %ax,%ax

0000016c <strcmp>:
 16c:	55                   	push   %ebp
 16d:	89 e5                	mov    %esp,%ebp
 16f:	53                   	push   %ebx
 170:	8b 55 08             	mov    0x8(%ebp),%edx
 173:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 176:	0f b6 02             	movzbl (%edx),%eax
 179:	84 c0                	test   %al,%al
 17b:	75 10                	jne    18d <strcmp+0x21>
 17d:	eb 2a                	jmp    1a9 <strcmp+0x3d>
 17f:	90                   	nop
 180:	42                   	inc    %edx
 181:	8d 4b 01             	lea    0x1(%ebx),%ecx
 184:	0f b6 02             	movzbl (%edx),%eax
 187:	84 c0                	test   %al,%al
 189:	74 11                	je     19c <strcmp+0x30>
 18b:	89 cb                	mov    %ecx,%ebx
 18d:	0f b6 0b             	movzbl (%ebx),%ecx
 190:	38 c1                	cmp    %al,%cl
 192:	74 ec                	je     180 <strcmp+0x14>
 194:	29 c8                	sub    %ecx,%eax
 196:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 199:	c9                   	leave  
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	29 c8                	sub    %ecx,%eax
 1a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a7:	c9                   	leave  
 1a8:	c3                   	ret    
 1a9:	0f b6 0b             	movzbl (%ebx),%ecx
 1ac:	31 c0                	xor    %eax,%eax
 1ae:	eb e4                	jmp    194 <strcmp+0x28>

000001b0 <strlen>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	40                   	inc    %eax
 1c1:	89 c1                	mov    %eax,%ecx
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	75 f7                	jne    1c0 <strlen+0x10>
 1c9:	89 c8                	mov    %ecx,%eax
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	31 c9                	xor    %ecx,%ecx
 1d2:	89 c8                	mov    %ecx,%eax
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    
 1d6:	66 90                	xchg   %ax,%ax

000001d8 <memset>:
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	57                   	push   %edi
 1dc:	8b 7d 08             	mov    0x8(%ebp),%edi
 1df:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e5:	fc                   	cld    
 1e6:	f3 aa                	rep stos %al,%es:(%edi)
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <strchr>:
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1f9:	8a 10                	mov    (%eax),%dl
 1fb:	84 d2                	test   %dl,%dl
 1fd:	75 0c                	jne    20b <strchr+0x1b>
 1ff:	eb 13                	jmp    214 <strchr+0x24>
 201:	8d 76 00             	lea    0x0(%esi),%esi
 204:	40                   	inc    %eax
 205:	8a 10                	mov    (%eax),%dl
 207:	84 d2                	test   %dl,%dl
 209:	74 09                	je     214 <strchr+0x24>
 20b:	38 d1                	cmp    %dl,%cl
 20d:	75 f5                	jne    204 <strchr+0x14>
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	8d 76 00             	lea    0x0(%esi),%esi
 214:	31 c0                	xor    %eax,%eax
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    

00000218 <gets>:
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	57                   	push   %edi
 21c:	56                   	push   %esi
 21d:	53                   	push   %ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	31 db                	xor    %ebx,%ebx
 223:	8d 75 e7             	lea    -0x19(%ebp),%esi
 226:	eb 24                	jmp    24c <gets+0x34>
 228:	50                   	push   %eax
 229:	6a 01                	push   $0x1
 22b:	56                   	push   %esi
 22c:	6a 00                	push   $0x0
 22e:	e8 f4 00 00 00       	call   327 <read>
 233:	83 c4 10             	add    $0x10,%esp
 236:	85 c0                	test   %eax,%eax
 238:	7e 1a                	jle    254 <gets+0x3c>
 23a:	8a 45 e7             	mov    -0x19(%ebp),%al
 23d:	8b 55 08             	mov    0x8(%ebp),%edx
 240:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 244:	3c 0a                	cmp    $0xa,%al
 246:	74 0e                	je     256 <gets+0x3e>
 248:	3c 0d                	cmp    $0xd,%al
 24a:	74 0a                	je     256 <gets+0x3e>
 24c:	89 df                	mov    %ebx,%edi
 24e:	43                   	inc    %ebx
 24f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 252:	7c d4                	jl     228 <gets+0x10>
 254:	89 fb                	mov    %edi,%ebx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 25d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 260:	5b                   	pop    %ebx
 261:	5e                   	pop    %esi
 262:	5f                   	pop    %edi
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    
 265:	8d 76 00             	lea    0x0(%esi),%esi

00000268 <stat>:
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	56                   	push   %esi
 26c:	53                   	push   %ebx
 26d:	83 ec 08             	sub    $0x8,%esp
 270:	6a 00                	push   $0x0
 272:	ff 75 08             	pushl  0x8(%ebp)
 275:	e8 d5 00 00 00       	call   34f <open>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	85 c0                	test   %eax,%eax
 27f:	78 27                	js     2a8 <stat+0x40>
 281:	89 c3                	mov    %eax,%ebx
 283:	83 ec 08             	sub    $0x8,%esp
 286:	ff 75 0c             	pushl  0xc(%ebp)
 289:	50                   	push   %eax
 28a:	e8 d8 00 00 00       	call   367 <fstat>
 28f:	89 c6                	mov    %eax,%esi
 291:	89 1c 24             	mov    %ebx,(%esp)
 294:	e8 9e 00 00 00       	call   337 <close>
 299:	83 c4 10             	add    $0x10,%esp
 29c:	89 f0                	mov    %esi,%eax
 29e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a1:	5b                   	pop    %ebx
 2a2:	5e                   	pop    %esi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d 76 00             	lea    0x0(%esi),%esi
 2a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ad:	eb ed                	jmp    29c <stat+0x34>
 2af:	90                   	nop

000002b0 <atoi>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2b7:	0f be 01             	movsbl (%ecx),%eax
 2ba:	8d 50 d0             	lea    -0x30(%eax),%edx
 2bd:	80 fa 09             	cmp    $0x9,%dl
 2c0:	ba 00 00 00 00       	mov    $0x0,%edx
 2c5:	77 16                	ja     2dd <atoi+0x2d>
 2c7:	90                   	nop
 2c8:	41                   	inc    %ecx
 2c9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 2cc:	01 d2                	add    %edx,%edx
 2ce:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 2d2:	0f be 01             	movsbl (%ecx),%eax
 2d5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d8:	80 fb 09             	cmp    $0x9,%bl
 2db:	76 eb                	jbe    2c8 <atoi+0x18>
 2dd:	89 d0                	mov    %edx,%eax
 2df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e2:	c9                   	leave  
 2e3:	c3                   	ret    

000002e4 <memmove>:
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	57                   	push   %edi
 2e8:	56                   	push   %esi
 2e9:	8b 55 08             	mov    0x8(%ebp),%edx
 2ec:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ef:	8b 45 10             	mov    0x10(%ebp),%eax
 2f2:	85 c0                	test   %eax,%eax
 2f4:	7e 0b                	jle    301 <memmove+0x1d>
 2f6:	01 d0                	add    %edx,%eax
 2f8:	89 d7                	mov    %edx,%edi
 2fa:	66 90                	xchg   %ax,%ax
 2fc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2fd:	39 f8                	cmp    %edi,%eax
 2ff:	75 fb                	jne    2fc <memmove+0x18>
 301:	89 d0                	mov    %edx,%eax
 303:	5e                   	pop    %esi
 304:	5f                   	pop    %edi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <fork>:
 307:	b8 01 00 00 00       	mov    $0x1,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <exit>:
 30f:	b8 02 00 00 00       	mov    $0x2,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <wait>:
 317:	b8 03 00 00 00       	mov    $0x3,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <pipe>:
 31f:	b8 04 00 00 00       	mov    $0x4,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <read>:
 327:	b8 05 00 00 00       	mov    $0x5,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <write>:
 32f:	b8 10 00 00 00       	mov    $0x10,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <close>:
 337:	b8 15 00 00 00       	mov    $0x15,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <kill>:
 33f:	b8 06 00 00 00       	mov    $0x6,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <exec>:
 347:	b8 07 00 00 00       	mov    $0x7,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <open>:
 34f:	b8 0f 00 00 00       	mov    $0xf,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <mknod>:
 357:	b8 11 00 00 00       	mov    $0x11,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <unlink>:
 35f:	b8 12 00 00 00       	mov    $0x12,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <fstat>:
 367:	b8 08 00 00 00       	mov    $0x8,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <link>:
 36f:	b8 13 00 00 00       	mov    $0x13,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <mkdir>:
 377:	b8 14 00 00 00       	mov    $0x14,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <chdir>:
 37f:	b8 09 00 00 00       	mov    $0x9,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <dup>:
 387:	b8 0a 00 00 00       	mov    $0xa,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <getpid>:
 38f:	b8 0b 00 00 00       	mov    $0xb,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <sbrk>:
 397:	b8 0c 00 00 00       	mov    $0xc,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <sleep>:
 39f:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <uptime>:
 3a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <cpu_limit>:
 3af:	b8 16 00 00 00       	mov    $0x16,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <set_mem_limit>:
 3b7:	b8 17 00 00 00       	mov    $0x17,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <get_mem_limit>:
 3bf:	b8 18 00 00 00       	mov    $0x18,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <increase_mem_limit>:
 3c7:	b8 19 00 00 00       	mov    $0x19,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <increase_mem_usage>:
 3cf:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <get_mem_usage>:
 3d7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    
 3df:	90                   	nop

000003e0 <printint>:
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
 3e9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3ec:	89 cb                	mov    %ecx,%ebx
 3ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f1:	85 c9                	test   %ecx,%ecx
 3f3:	74 04                	je     3f9 <printint+0x19>
 3f5:	85 d2                	test   %edx,%edx
 3f7:	78 6b                	js     464 <printint+0x84>
 3f9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3fc:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 403:	31 c9                	xor    %ecx,%ecx
 405:	8d 75 d7             	lea    -0x29(%ebp),%esi
 408:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 40b:	31 d2                	xor    %edx,%edx
 40d:	f7 f3                	div    %ebx
 40f:	89 cf                	mov    %ecx,%edi
 411:	8d 49 01             	lea    0x1(%ecx),%ecx
 414:	8a 92 50 08 00 00    	mov    0x850(%edx),%dl
 41a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 41e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 421:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 424:	39 da                	cmp    %ebx,%edx
 426:	73 e0                	jae    408 <printint+0x28>
 428:	8b 55 08             	mov    0x8(%ebp),%edx
 42b:	85 d2                	test   %edx,%edx
 42d:	74 07                	je     436 <printint+0x56>
 42f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 434:	89 cf                	mov    %ecx,%edi
 436:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 439:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	8a 07                	mov    (%edi),%al
 442:	88 45 d7             	mov    %al,-0x29(%ebp)
 445:	50                   	push   %eax
 446:	6a 01                	push   $0x1
 448:	56                   	push   %esi
 449:	ff 75 c0             	pushl  -0x40(%ebp)
 44c:	e8 de fe ff ff       	call   32f <write>
 451:	89 f8                	mov    %edi,%eax
 453:	4f                   	dec    %edi
 454:	83 c4 10             	add    $0x10,%esp
 457:	39 d8                	cmp    %ebx,%eax
 459:	75 e5                	jne    440 <printint+0x60>
 45b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5f                   	pop    %edi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	90                   	nop
 464:	f7 da                	neg    %edx
 466:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 469:	eb 98                	jmp    403 <printint+0x23>
 46b:	90                   	nop

0000046c <printf>:
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	57                   	push   %edi
 470:	56                   	push   %esi
 471:	53                   	push   %ebx
 472:	83 ec 2c             	sub    $0x2c,%esp
 475:	8b 75 08             	mov    0x8(%ebp),%esi
 478:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 47b:	8a 13                	mov    (%ebx),%dl
 47d:	84 d2                	test   %dl,%dl
 47f:	74 5c                	je     4dd <printf+0x71>
 481:	43                   	inc    %ebx
 482:	8d 45 10             	lea    0x10(%ebp),%eax
 485:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 488:	31 ff                	xor    %edi,%edi
 48a:	eb 20                	jmp    4ac <printf+0x40>
 48c:	83 f8 25             	cmp    $0x25,%eax
 48f:	74 3f                	je     4d0 <printf+0x64>
 491:	88 55 e7             	mov    %dl,-0x19(%ebp)
 494:	50                   	push   %eax
 495:	6a 01                	push   $0x1
 497:	8d 45 e7             	lea    -0x19(%ebp),%eax
 49a:	50                   	push   %eax
 49b:	56                   	push   %esi
 49c:	e8 8e fe ff ff       	call   32f <write>
 4a1:	83 c4 10             	add    $0x10,%esp
 4a4:	43                   	inc    %ebx
 4a5:	8a 53 ff             	mov    -0x1(%ebx),%dl
 4a8:	84 d2                	test   %dl,%dl
 4aa:	74 31                	je     4dd <printf+0x71>
 4ac:	0f b6 c2             	movzbl %dl,%eax
 4af:	85 ff                	test   %edi,%edi
 4b1:	74 d9                	je     48c <printf+0x20>
 4b3:	83 ff 25             	cmp    $0x25,%edi
 4b6:	75 ec                	jne    4a4 <printf+0x38>
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 03 01 00 00    	je     5c4 <printf+0x158>
 4c1:	83 e8 63             	sub    $0x63,%eax
 4c4:	83 f8 15             	cmp    $0x15,%eax
 4c7:	77 1f                	ja     4e8 <printf+0x7c>
 4c9:	ff 24 85 f8 07 00 00 	jmp    *0x7f8(,%eax,4)
 4d0:	bf 25 00 00 00       	mov    $0x25,%edi
 4d5:	43                   	inc    %ebx
 4d6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 4d9:	84 d2                	test   %dl,%dl
 4db:	75 cf                	jne    4ac <printf+0x40>
 4dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5f                   	pop    %edi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
 4e8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 4eb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ef:	50                   	push   %eax
 4f0:	6a 01                	push   $0x1
 4f2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4f5:	57                   	push   %edi
 4f6:	56                   	push   %esi
 4f7:	e8 33 fe ff ff       	call   32f <write>
 4fc:	8a 55 d0             	mov    -0x30(%ebp),%dl
 4ff:	88 55 e7             	mov    %dl,-0x19(%ebp)
 502:	83 c4 0c             	add    $0xc,%esp
 505:	6a 01                	push   $0x1
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	e8 21 fe ff ff       	call   32f <write>
 50e:	83 c4 10             	add    $0x10,%esp
 511:	31 ff                	xor    %edi,%edi
 513:	eb 8f                	jmp    4a4 <printf+0x38>
 515:	8d 76 00             	lea    0x0(%esi),%esi
 518:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 51b:	8b 17                	mov    (%edi),%edx
 51d:	83 ec 0c             	sub    $0xc,%esp
 520:	6a 00                	push   $0x0
 522:	b9 10 00 00 00       	mov    $0x10,%ecx
 527:	89 f0                	mov    %esi,%eax
 529:	e8 b2 fe ff ff       	call   3e0 <printint>
 52e:	83 c7 04             	add    $0x4,%edi
 531:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 534:	83 c4 10             	add    $0x10,%esp
 537:	31 ff                	xor    %edi,%edi
 539:	e9 66 ff ff ff       	jmp    4a4 <printf+0x38>
 53e:	66 90                	xchg   %ax,%ax
 540:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 543:	8b 10                	mov    (%eax),%edx
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 54b:	85 d2                	test   %edx,%edx
 54d:	0f 84 81 00 00 00    	je     5d4 <printf+0x168>
 553:	8a 02                	mov    (%edx),%al
 555:	84 c0                	test   %al,%al
 557:	0f 84 80 00 00 00    	je     5dd <printf+0x171>
 55d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 560:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 563:	89 d3                	mov    %edx,%ebx
 565:	8d 76 00             	lea    0x0(%esi),%esi
 568:	88 45 e7             	mov    %al,-0x19(%ebp)
 56b:	50                   	push   %eax
 56c:	6a 01                	push   $0x1
 56e:	57                   	push   %edi
 56f:	56                   	push   %esi
 570:	e8 ba fd ff ff       	call   32f <write>
 575:	43                   	inc    %ebx
 576:	8a 03                	mov    (%ebx),%al
 578:	83 c4 10             	add    $0x10,%esp
 57b:	84 c0                	test   %al,%al
 57d:	75 e9                	jne    568 <printf+0xfc>
 57f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 582:	31 ff                	xor    %edi,%edi
 584:	e9 1b ff ff ff       	jmp    4a4 <printf+0x38>
 589:	8d 76 00             	lea    0x0(%esi),%esi
 58c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 58f:	8b 17                	mov    (%edi),%edx
 591:	83 ec 0c             	sub    $0xc,%esp
 594:	6a 01                	push   $0x1
 596:	b9 0a 00 00 00       	mov    $0xa,%ecx
 59b:	eb 8a                	jmp    527 <printf+0xbb>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	8b 00                	mov    (%eax),%eax
 5a5:	88 45 e7             	mov    %al,-0x19(%ebp)
 5a8:	51                   	push   %ecx
 5a9:	6a 01                	push   $0x1
 5ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5ae:	57                   	push   %edi
 5af:	56                   	push   %esi
 5b0:	e8 7a fd ff ff       	call   32f <write>
 5b5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5b9:	83 c4 10             	add    $0x10,%esp
 5bc:	31 ff                	xor    %edi,%edi
 5be:	e9 e1 fe ff ff       	jmp    4a4 <printf+0x38>
 5c3:	90                   	nop
 5c4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5c7:	52                   	push   %edx
 5c8:	6a 01                	push   $0x1
 5ca:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5cd:	e9 35 ff ff ff       	jmp    507 <printf+0x9b>
 5d2:	66 90                	xchg   %ax,%ax
 5d4:	b0 28                	mov    $0x28,%al
 5d6:	ba ef 07 00 00       	mov    $0x7ef,%edx
 5db:	eb 80                	jmp    55d <printf+0xf1>
 5dd:	31 ff                	xor    %edi,%edi
 5df:	e9 c0 fe ff ff       	jmp    4a4 <printf+0x38>

000005e4 <free>:
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	83 ec 0c             	sub    $0xc,%esp
 5ed:	8b 75 08             	mov    0x8(%ebp),%esi
 5f0:	8d 5e f8             	lea    -0x8(%esi),%ebx
 5f3:	8b 7e fc             	mov    -0x4(%esi),%edi
 5f6:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 5fd:	3d 00 80 00 00       	cmp    $0x8000,%eax
 602:	75 70                	jne    674 <free+0x90>
 604:	b9 00 80 00 00       	mov    $0x8000,%ecx
 609:	a1 c0 0a 00 00       	mov    0xac0,%eax
 60e:	66 90                	xchg   %ax,%ax
 610:	89 c2                	mov    %eax,%edx
 612:	8b 00                	mov    (%eax),%eax
 614:	39 da                	cmp    %ebx,%edx
 616:	73 2c                	jae    644 <free+0x60>
 618:	39 c3                	cmp    %eax,%ebx
 61a:	72 04                	jb     620 <free+0x3c>
 61c:	39 c2                	cmp    %eax,%edx
 61e:	72 f0                	jb     610 <free+0x2c>
 620:	01 d9                	add    %ebx,%ecx
 622:	39 c8                	cmp    %ecx,%eax
 624:	74 2c                	je     652 <free+0x6e>
 626:	89 46 f8             	mov    %eax,-0x8(%esi)
 629:	8b 42 04             	mov    0x4(%edx),%eax
 62c:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 62f:	39 cb                	cmp    %ecx,%ebx
 631:	74 36                	je     669 <free+0x85>
 633:	89 1a                	mov    %ebx,(%edx)
 635:	89 15 c0 0a 00 00    	mov    %edx,0xac0
 63b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    
 643:	90                   	nop
 644:	39 c2                	cmp    %eax,%edx
 646:	72 c8                	jb     610 <free+0x2c>
 648:	39 c3                	cmp    %eax,%ebx
 64a:	73 c4                	jae    610 <free+0x2c>
 64c:	01 d9                	add    %ebx,%ecx
 64e:	39 c8                	cmp    %ecx,%eax
 650:	75 d4                	jne    626 <free+0x42>
 652:	03 78 04             	add    0x4(%eax),%edi
 655:	89 7e fc             	mov    %edi,-0x4(%esi)
 658:	8b 02                	mov    (%edx),%eax
 65a:	8b 00                	mov    (%eax),%eax
 65c:	89 46 f8             	mov    %eax,-0x8(%esi)
 65f:	8b 42 04             	mov    0x4(%edx),%eax
 662:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 665:	39 cb                	cmp    %ecx,%ebx
 667:	75 ca                	jne    633 <free+0x4f>
 669:	03 46 fc             	add    -0x4(%esi),%eax
 66c:	89 42 04             	mov    %eax,0x4(%edx)
 66f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 672:	eb bf                	jmp    633 <free+0x4f>
 674:	83 ec 0c             	sub    $0xc,%esp
 677:	f7 d8                	neg    %eax
 679:	50                   	push   %eax
 67a:	e8 50 fd ff ff       	call   3cf <increase_mem_usage>
 67f:	8b 7e fc             	mov    -0x4(%esi),%edi
 682:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 689:	83 c4 10             	add    $0x10,%esp
 68c:	e9 78 ff ff ff       	jmp    609 <free+0x25>
 691:	8d 76 00             	lea    0x0(%esi),%esi

00000694 <malloc>:
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	56                   	push   %esi
 699:	53                   	push   %ebx
 69a:	83 ec 0c             	sub    $0xc,%esp
 69d:	8b 7d 08             	mov    0x8(%ebp),%edi
 6a0:	e8 1a fd ff ff       	call   3bf <get_mem_limit>
 6a5:	89 c3                	mov    %eax,%ebx
 6a7:	e8 2b fd ff ff       	call   3d7 <get_mem_usage>
 6ac:	83 fb ff             	cmp    $0xffffffff,%ebx
 6af:	74 0b                	je     6bc <malloc+0x28>
 6b1:	8d 14 38             	lea    (%eax,%edi,1),%edx
 6b4:	39 d3                	cmp    %edx,%ebx
 6b6:	0f 82 e2 00 00 00    	jb     79e <malloc+0x10a>
 6bc:	83 ec 0c             	sub    $0xc,%esp
 6bf:	57                   	push   %edi
 6c0:	e8 0a fd ff ff       	call   3cf <increase_mem_usage>
 6c5:	83 c7 07             	add    $0x7,%edi
 6c8:	c1 ef 03             	shr    $0x3,%edi
 6cb:	47                   	inc    %edi
 6cc:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
 6d2:	83 c4 10             	add    $0x10,%esp
 6d5:	85 d2                	test   %edx,%edx
 6d7:	0f 84 93 00 00 00    	je     770 <malloc+0xdc>
 6dd:	8b 02                	mov    (%edx),%eax
 6df:	8b 48 04             	mov    0x4(%eax),%ecx
 6e2:	39 f9                	cmp    %edi,%ecx
 6e4:	73 62                	jae    748 <malloc+0xb4>
 6e6:	89 fb                	mov    %edi,%ebx
 6e8:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6ee:	72 78                	jb     768 <malloc+0xd4>
 6f0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6f7:	eb 0e                	jmp    707 <malloc+0x73>
 6f9:	8d 76 00             	lea    0x0(%esi),%esi
 6fc:	89 c2                	mov    %eax,%edx
 6fe:	8b 02                	mov    (%edx),%eax
 700:	8b 48 04             	mov    0x4(%eax),%ecx
 703:	39 f9                	cmp    %edi,%ecx
 705:	73 41                	jae    748 <malloc+0xb4>
 707:	39 05 c0 0a 00 00    	cmp    %eax,0xac0
 70d:	75 ed                	jne    6fc <malloc+0x68>
 70f:	83 ec 0c             	sub    $0xc,%esp
 712:	56                   	push   %esi
 713:	e8 7f fc ff ff       	call   397 <sbrk>
 718:	83 c4 10             	add    $0x10,%esp
 71b:	83 f8 ff             	cmp    $0xffffffff,%eax
 71e:	74 1c                	je     73c <malloc+0xa8>
 720:	89 58 04             	mov    %ebx,0x4(%eax)
 723:	83 ec 0c             	sub    $0xc,%esp
 726:	83 c0 08             	add    $0x8,%eax
 729:	50                   	push   %eax
 72a:	e8 b5 fe ff ff       	call   5e4 <free>
 72f:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
 735:	83 c4 10             	add    $0x10,%esp
 738:	85 d2                	test   %edx,%edx
 73a:	75 c2                	jne    6fe <malloc+0x6a>
 73c:	31 c0                	xor    %eax,%eax
 73e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 741:	5b                   	pop    %ebx
 742:	5e                   	pop    %esi
 743:	5f                   	pop    %edi
 744:	5d                   	pop    %ebp
 745:	c3                   	ret    
 746:	66 90                	xchg   %ax,%ax
 748:	39 cf                	cmp    %ecx,%edi
 74a:	74 4c                	je     798 <malloc+0x104>
 74c:	29 f9                	sub    %edi,%ecx
 74e:	89 48 04             	mov    %ecx,0x4(%eax)
 751:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 754:	89 78 04             	mov    %edi,0x4(%eax)
 757:	89 15 c0 0a 00 00    	mov    %edx,0xac0
 75d:	83 c0 08             	add    $0x8,%eax
 760:	8d 65 f4             	lea    -0xc(%ebp),%esp
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
 768:	bb 00 10 00 00       	mov    $0x1000,%ebx
 76d:	eb 81                	jmp    6f0 <malloc+0x5c>
 76f:	90                   	nop
 770:	c7 05 c0 0a 00 00 c4 	movl   $0xac4,0xac0
 777:	0a 00 00 
 77a:	c7 05 c4 0a 00 00 c4 	movl   $0xac4,0xac4
 781:	0a 00 00 
 784:	c7 05 c8 0a 00 00 00 	movl   $0x0,0xac8
 78b:	00 00 00 
 78e:	b8 c4 0a 00 00       	mov    $0xac4,%eax
 793:	e9 4e ff ff ff       	jmp    6e6 <malloc+0x52>
 798:	8b 08                	mov    (%eax),%ecx
 79a:	89 0a                	mov    %ecx,(%edx)
 79c:	eb b9                	jmp    757 <malloc+0xc3>
 79e:	83 ec 0c             	sub    $0xc,%esp
 7a1:	57                   	push   %edi
 7a2:	50                   	push   %eax
 7a3:	53                   	push   %ebx
 7a4:	68 64 08 00 00       	push   $0x864
 7a9:	6a 02                	push   $0x2
 7ab:	e8 bc fc ff ff       	call   46c <printf>
 7b0:	83 c4 20             	add    $0x20,%esp
 7b3:	31 c0                	xor    %eax,%eax
 7b5:	eb 87                	jmp    73e <malloc+0xaa>
