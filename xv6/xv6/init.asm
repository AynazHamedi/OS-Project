
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
  14:	68 50 07 00 00       	push   $0x750
  19:	e8 c9 02 00 00       	call   2e7 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 93 00 00 00    	js     bc <main+0xbc>
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 ec 02 00 00       	call   31f <dup>
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 e0 02 00 00       	call   31f <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	66 90                	xchg   %ax,%ax
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 58 07 00 00       	push   $0x758
  4c:	6a 01                	push   $0x1
  4e:	e8 b1 03 00 00       	call   404 <printf>
  53:	e8 47 02 00 00       	call   29f <fork>
  58:	89 c3                	mov    %eax,%ebx
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	85 c0                	test   %eax,%eax
  5f:	78 24                	js     85 <main+0x85>
  61:	74 35                	je     98 <main+0x98>
  63:	90                   	nop
  64:	e8 46 02 00 00       	call   2af <wait>
  69:	85 c0                	test   %eax,%eax
  6b:	78 d7                	js     44 <main+0x44>
  6d:	39 c3                	cmp    %eax,%ebx
  6f:	74 d3                	je     44 <main+0x44>
  71:	83 ec 08             	sub    $0x8,%esp
  74:	68 97 07 00 00       	push   $0x797
  79:	6a 01                	push   $0x1
  7b:	e8 84 03 00 00       	call   404 <printf>
  80:	83 c4 10             	add    $0x10,%esp
  83:	eb df                	jmp    64 <main+0x64>
  85:	53                   	push   %ebx
  86:	53                   	push   %ebx
  87:	68 6b 07 00 00       	push   $0x76b
  8c:	6a 01                	push   $0x1
  8e:	e8 71 03 00 00       	call   404 <printf>
  93:	e8 0f 02 00 00       	call   2a7 <exit>
  98:	50                   	push   %eax
  99:	50                   	push   %eax
  9a:	68 68 08 00 00       	push   $0x868
  9f:	68 7e 07 00 00       	push   $0x77e
  a4:	e8 36 02 00 00       	call   2df <exec>
  a9:	5a                   	pop    %edx
  aa:	59                   	pop    %ecx
  ab:	68 81 07 00 00       	push   $0x781
  b0:	6a 01                	push   $0x1
  b2:	e8 4d 03 00 00       	call   404 <printf>
  b7:	e8 eb 01 00 00       	call   2a7 <exit>
  bc:	50                   	push   %eax
  bd:	6a 01                	push   $0x1
  bf:	6a 01                	push   $0x1
  c1:	68 50 07 00 00       	push   $0x750
  c6:	e8 24 02 00 00       	call   2ef <mknod>
  cb:	58                   	pop    %eax
  cc:	5a                   	pop    %edx
  cd:	6a 02                	push   $0x2
  cf:	68 50 07 00 00       	push   $0x750
  d4:	e8 0e 02 00 00       	call   2e7 <open>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	e9 48 ff ff ff       	jmp    29 <main+0x29>
  e1:	66 90                	xchg   %ax,%ax
  e3:	90                   	nop

000000e4 <strcpy>:
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	53                   	push   %ebx
  e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ee:	31 c0                	xor    %eax,%eax
  f0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  f3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f6:	40                   	inc    %eax
  f7:	84 d2                	test   %dl,%dl
  f9:	75 f5                	jne    f0 <strcpy+0xc>
  fb:	89 c8                	mov    %ecx,%eax
  fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 100:	c9                   	leave  
 101:	c3                   	ret    
 102:	66 90                	xchg   %ax,%ax

00000104 <strcmp>:
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	53                   	push   %ebx
 108:	8b 55 08             	mov    0x8(%ebp),%edx
 10b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10e:	0f b6 02             	movzbl (%edx),%eax
 111:	84 c0                	test   %al,%al
 113:	75 10                	jne    125 <strcmp+0x21>
 115:	eb 2a                	jmp    141 <strcmp+0x3d>
 117:	90                   	nop
 118:	42                   	inc    %edx
 119:	8d 4b 01             	lea    0x1(%ebx),%ecx
 11c:	0f b6 02             	movzbl (%edx),%eax
 11f:	84 c0                	test   %al,%al
 121:	74 11                	je     134 <strcmp+0x30>
 123:	89 cb                	mov    %ecx,%ebx
 125:	0f b6 0b             	movzbl (%ebx),%ecx
 128:	38 c1                	cmp    %al,%cl
 12a:	74 ec                	je     118 <strcmp+0x14>
 12c:	29 c8                	sub    %ecx,%eax
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	c9                   	leave  
 132:	c3                   	ret    
 133:	90                   	nop
 134:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 138:	31 c0                	xor    %eax,%eax
 13a:	29 c8                	sub    %ecx,%eax
 13c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13f:	c9                   	leave  
 140:	c3                   	ret    
 141:	0f b6 0b             	movzbl (%ebx),%ecx
 144:	31 c0                	xor    %eax,%eax
 146:	eb e4                	jmp    12c <strcmp+0x28>

00000148 <strlen>:
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	8b 55 08             	mov    0x8(%ebp),%edx
 14e:	80 3a 00             	cmpb   $0x0,(%edx)
 151:	74 15                	je     168 <strlen+0x20>
 153:	31 c0                	xor    %eax,%eax
 155:	8d 76 00             	lea    0x0(%esi),%esi
 158:	40                   	inc    %eax
 159:	89 c1                	mov    %eax,%ecx
 15b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 15f:	75 f7                	jne    158 <strlen+0x10>
 161:	89 c8                	mov    %ecx,%eax
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	31 c9                	xor    %ecx,%ecx
 16a:	89 c8                	mov    %ecx,%eax
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
 16e:	66 90                	xchg   %ax,%ax

00000170 <memset>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 7d 08             	mov    0x8(%ebp),%edi
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	fc                   	cld    
 17e:	f3 aa                	rep stos %al,%es:(%edi)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	8b 7d fc             	mov    -0x4(%ebp),%edi
 186:	c9                   	leave  
 187:	c3                   	ret    

00000188 <strchr>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 191:	8a 10                	mov    (%eax),%dl
 193:	84 d2                	test   %dl,%dl
 195:	75 0c                	jne    1a3 <strchr+0x1b>
 197:	eb 13                	jmp    1ac <strchr+0x24>
 199:	8d 76 00             	lea    0x0(%esi),%esi
 19c:	40                   	inc    %eax
 19d:	8a 10                	mov    (%eax),%dl
 19f:	84 d2                	test   %dl,%dl
 1a1:	74 09                	je     1ac <strchr+0x24>
 1a3:	38 d1                	cmp    %dl,%cl
 1a5:	75 f5                	jne    19c <strchr+0x14>
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	31 c0                	xor    %eax,%eax
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <gets>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	83 ec 1c             	sub    $0x1c,%esp
 1b9:	31 db                	xor    %ebx,%ebx
 1bb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1be:	eb 24                	jmp    1e4 <gets+0x34>
 1c0:	50                   	push   %eax
 1c1:	6a 01                	push   $0x1
 1c3:	56                   	push   %esi
 1c4:	6a 00                	push   $0x0
 1c6:	e8 f4 00 00 00       	call   2bf <read>
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	85 c0                	test   %eax,%eax
 1d0:	7e 1a                	jle    1ec <gets+0x3c>
 1d2:	8a 45 e7             	mov    -0x19(%ebp),%al
 1d5:	8b 55 08             	mov    0x8(%ebp),%edx
 1d8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1dc:	3c 0a                	cmp    $0xa,%al
 1de:	74 0e                	je     1ee <gets+0x3e>
 1e0:	3c 0d                	cmp    $0xd,%al
 1e2:	74 0a                	je     1ee <gets+0x3e>
 1e4:	89 df                	mov    %ebx,%edi
 1e6:	43                   	inc    %ebx
 1e7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ea:	7c d4                	jl     1c0 <gets+0x10>
 1ec:	89 fb                	mov    %edi,%ebx
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 d5 00 00 00       	call   2e7 <open>
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
 219:	89 c3                	mov    %eax,%ebx
 21b:	83 ec 08             	sub    $0x8,%esp
 21e:	ff 75 0c             	pushl  0xc(%ebp)
 221:	50                   	push   %eax
 222:	e8 d8 00 00 00       	call   2ff <fstat>
 227:	89 c6                	mov    %eax,%esi
 229:	89 1c 24             	mov    %ebx,(%esp)
 22c:	e8 9e 00 00 00       	call   2cf <close>
 231:	83 c4 10             	add    $0x10,%esp
 234:	89 f0                	mov    %esi,%eax
 236:	8d 65 f8             	lea    -0x8(%ebp),%esp
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	90                   	nop

00000248 <atoi>:
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	53                   	push   %ebx
 24c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 24f:	0f be 01             	movsbl (%ecx),%eax
 252:	8d 50 d0             	lea    -0x30(%eax),%edx
 255:	80 fa 09             	cmp    $0x9,%dl
 258:	ba 00 00 00 00       	mov    $0x0,%edx
 25d:	77 16                	ja     275 <atoi+0x2d>
 25f:	90                   	nop
 260:	41                   	inc    %ecx
 261:	8d 14 92             	lea    (%edx,%edx,4),%edx
 264:	01 d2                	add    %edx,%edx
 266:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 26a:	0f be 01             	movsbl (%ecx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x18>
 275:	89 d0                	mov    %edx,%eax
 277:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 27a:	c9                   	leave  
 27b:	c3                   	ret    

0000027c <memmove>:
 27c:	55                   	push   %ebp
 27d:	89 e5                	mov    %esp,%ebp
 27f:	57                   	push   %edi
 280:	56                   	push   %esi
 281:	8b 55 08             	mov    0x8(%ebp),%edx
 284:	8b 75 0c             	mov    0xc(%ebp),%esi
 287:	8b 45 10             	mov    0x10(%ebp),%eax
 28a:	85 c0                	test   %eax,%eax
 28c:	7e 0b                	jle    299 <memmove+0x1d>
 28e:	01 d0                	add    %edx,%eax
 290:	89 d7                	mov    %edx,%edi
 292:	66 90                	xchg   %ax,%ax
 294:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 295:	39 f8                	cmp    %edi,%eax
 297:	75 fb                	jne    294 <memmove+0x18>
 299:	89 d0                	mov    %edx,%eax
 29b:	5e                   	pop    %esi
 29c:	5f                   	pop    %edi
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    

0000029f <fork>:
 29f:	b8 01 00 00 00       	mov    $0x1,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <exit>:
 2a7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <wait>:
 2af:	b8 03 00 00 00       	mov    $0x3,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <pipe>:
 2b7:	b8 04 00 00 00       	mov    $0x4,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <read>:
 2bf:	b8 05 00 00 00       	mov    $0x5,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <write>:
 2c7:	b8 10 00 00 00       	mov    $0x10,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <close>:
 2cf:	b8 15 00 00 00       	mov    $0x15,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <kill>:
 2d7:	b8 06 00 00 00       	mov    $0x6,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <exec>:
 2df:	b8 07 00 00 00       	mov    $0x7,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <open>:
 2e7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <mknod>:
 2ef:	b8 11 00 00 00       	mov    $0x11,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <unlink>:
 2f7:	b8 12 00 00 00       	mov    $0x12,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <fstat>:
 2ff:	b8 08 00 00 00       	mov    $0x8,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <link>:
 307:	b8 13 00 00 00       	mov    $0x13,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <mkdir>:
 30f:	b8 14 00 00 00       	mov    $0x14,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <chdir>:
 317:	b8 09 00 00 00       	mov    $0x9,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <dup>:
 31f:	b8 0a 00 00 00       	mov    $0xa,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <getpid>:
 327:	b8 0b 00 00 00       	mov    $0xb,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <sbrk>:
 32f:	b8 0c 00 00 00       	mov    $0xc,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <sleep>:
 337:	b8 0d 00 00 00       	mov    $0xd,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <uptime>:
 33f:	b8 0e 00 00 00       	mov    $0xe,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <cpu_limit>:
 347:	b8 16 00 00 00       	mov    $0x16,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <set_mem_limit>:
 34f:	b8 17 00 00 00       	mov    $0x17,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <get_mem_limit>:
 357:	b8 18 00 00 00       	mov    $0x18,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <increase_mem_limit>:
 35f:	b8 19 00 00 00       	mov    $0x19,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <increase_mem_usage>:
 367:	b8 1a 00 00 00       	mov    $0x1a,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <get_mem_usage>:
 36f:	b8 1b 00 00 00       	mov    $0x1b,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    
 377:	90                   	nop

00000378 <printint>:
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	57                   	push   %edi
 37c:	56                   	push   %esi
 37d:	53                   	push   %ebx
 37e:	83 ec 3c             	sub    $0x3c,%esp
 381:	89 45 c0             	mov    %eax,-0x40(%ebp)
 384:	89 cb                	mov    %ecx,%ebx
 386:	8b 4d 08             	mov    0x8(%ebp),%ecx
 389:	85 c9                	test   %ecx,%ecx
 38b:	74 04                	je     391 <printint+0x19>
 38d:	85 d2                	test   %edx,%edx
 38f:	78 6b                	js     3fc <printint+0x84>
 391:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 394:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 39b:	31 c9                	xor    %ecx,%ecx
 39d:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3a3:	31 d2                	xor    %edx,%edx
 3a5:	f7 f3                	div    %ebx
 3a7:	89 cf                	mov    %ecx,%edi
 3a9:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ac:	8a 92 00 08 00 00    	mov    0x800(%edx),%dl
 3b2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 3b6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3b9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3bc:	39 da                	cmp    %ebx,%edx
 3be:	73 e0                	jae    3a0 <printint+0x28>
 3c0:	8b 55 08             	mov    0x8(%ebp),%edx
 3c3:	85 d2                	test   %edx,%edx
 3c5:	74 07                	je     3ce <printint+0x56>
 3c7:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3cc:	89 cf                	mov    %ecx,%edi
 3ce:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3d1:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3d5:	8d 76 00             	lea    0x0(%esi),%esi
 3d8:	8a 07                	mov    (%edi),%al
 3da:	88 45 d7             	mov    %al,-0x29(%ebp)
 3dd:	50                   	push   %eax
 3de:	6a 01                	push   $0x1
 3e0:	56                   	push   %esi
 3e1:	ff 75 c0             	pushl  -0x40(%ebp)
 3e4:	e8 de fe ff ff       	call   2c7 <write>
 3e9:	89 f8                	mov    %edi,%eax
 3eb:	4f                   	dec    %edi
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	39 d8                	cmp    %ebx,%eax
 3f1:	75 e5                	jne    3d8 <printint+0x60>
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	90                   	nop
 3fc:	f7 da                	neg    %edx
 3fe:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 401:	eb 98                	jmp    39b <printint+0x23>
 403:	90                   	nop

00000404 <printf>:
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 2c             	sub    $0x2c,%esp
 40d:	8b 75 08             	mov    0x8(%ebp),%esi
 410:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 413:	8a 13                	mov    (%ebx),%dl
 415:	84 d2                	test   %dl,%dl
 417:	74 5c                	je     475 <printf+0x71>
 419:	43                   	inc    %ebx
 41a:	8d 45 10             	lea    0x10(%ebp),%eax
 41d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 420:	31 ff                	xor    %edi,%edi
 422:	eb 20                	jmp    444 <printf+0x40>
 424:	83 f8 25             	cmp    $0x25,%eax
 427:	74 3f                	je     468 <printf+0x64>
 429:	88 55 e7             	mov    %dl,-0x19(%ebp)
 42c:	50                   	push   %eax
 42d:	6a 01                	push   $0x1
 42f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 432:	50                   	push   %eax
 433:	56                   	push   %esi
 434:	e8 8e fe ff ff       	call   2c7 <write>
 439:	83 c4 10             	add    $0x10,%esp
 43c:	43                   	inc    %ebx
 43d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 440:	84 d2                	test   %dl,%dl
 442:	74 31                	je     475 <printf+0x71>
 444:	0f b6 c2             	movzbl %dl,%eax
 447:	85 ff                	test   %edi,%edi
 449:	74 d9                	je     424 <printf+0x20>
 44b:	83 ff 25             	cmp    $0x25,%edi
 44e:	75 ec                	jne    43c <printf+0x38>
 450:	83 f8 25             	cmp    $0x25,%eax
 453:	0f 84 03 01 00 00    	je     55c <printf+0x158>
 459:	83 e8 63             	sub    $0x63,%eax
 45c:	83 f8 15             	cmp    $0x15,%eax
 45f:	77 1f                	ja     480 <printf+0x7c>
 461:	ff 24 85 a8 07 00 00 	jmp    *0x7a8(,%eax,4)
 468:	bf 25 00 00 00       	mov    $0x25,%edi
 46d:	43                   	inc    %ebx
 46e:	8a 53 ff             	mov    -0x1(%ebx),%dl
 471:	84 d2                	test   %dl,%dl
 473:	75 cf                	jne    444 <printf+0x40>
 475:	8d 65 f4             	lea    -0xc(%ebp),%esp
 478:	5b                   	pop    %ebx
 479:	5e                   	pop    %esi
 47a:	5f                   	pop    %edi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	88 55 d0             	mov    %dl,-0x30(%ebp)
 483:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 487:	50                   	push   %eax
 488:	6a 01                	push   $0x1
 48a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	e8 33 fe ff ff       	call   2c7 <write>
 494:	8a 55 d0             	mov    -0x30(%ebp),%dl
 497:	88 55 e7             	mov    %dl,-0x19(%ebp)
 49a:	83 c4 0c             	add    $0xc,%esp
 49d:	6a 01                	push   $0x1
 49f:	57                   	push   %edi
 4a0:	56                   	push   %esi
 4a1:	e8 21 fe ff ff       	call   2c7 <write>
 4a6:	83 c4 10             	add    $0x10,%esp
 4a9:	31 ff                	xor    %edi,%edi
 4ab:	eb 8f                	jmp    43c <printf+0x38>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4b3:	8b 17                	mov    (%edi),%edx
 4b5:	83 ec 0c             	sub    $0xc,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	b9 10 00 00 00       	mov    $0x10,%ecx
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	e8 b2 fe ff ff       	call   378 <printint>
 4c6:	83 c7 04             	add    $0x4,%edi
 4c9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4cc:	83 c4 10             	add    $0x10,%esp
 4cf:	31 ff                	xor    %edi,%edi
 4d1:	e9 66 ff ff ff       	jmp    43c <printf+0x38>
 4d6:	66 90                	xchg   %ax,%ax
 4d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4db:	8b 10                	mov    (%eax),%edx
 4dd:	83 c0 04             	add    $0x4,%eax
 4e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4e3:	85 d2                	test   %edx,%edx
 4e5:	0f 84 81 00 00 00    	je     56c <printf+0x168>
 4eb:	8a 02                	mov    (%edx),%al
 4ed:	84 c0                	test   %al,%al
 4ef:	0f 84 80 00 00 00    	je     575 <printf+0x171>
 4f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4f8:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4fb:	89 d3                	mov    %edx,%ebx
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	88 45 e7             	mov    %al,-0x19(%ebp)
 503:	50                   	push   %eax
 504:	6a 01                	push   $0x1
 506:	57                   	push   %edi
 507:	56                   	push   %esi
 508:	e8 ba fd ff ff       	call   2c7 <write>
 50d:	43                   	inc    %ebx
 50e:	8a 03                	mov    (%ebx),%al
 510:	83 c4 10             	add    $0x10,%esp
 513:	84 c0                	test   %al,%al
 515:	75 e9                	jne    500 <printf+0xfc>
 517:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51a:	31 ff                	xor    %edi,%edi
 51c:	e9 1b ff ff ff       	jmp    43c <printf+0x38>
 521:	8d 76 00             	lea    0x0(%esi),%esi
 524:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 527:	8b 17                	mov    (%edi),%edx
 529:	83 ec 0c             	sub    $0xc,%esp
 52c:	6a 01                	push   $0x1
 52e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 533:	eb 8a                	jmp    4bf <printf+0xbb>
 535:	8d 76 00             	lea    0x0(%esi),%esi
 538:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 53b:	8b 00                	mov    (%eax),%eax
 53d:	88 45 e7             	mov    %al,-0x19(%ebp)
 540:	51                   	push   %ecx
 541:	6a 01                	push   $0x1
 543:	8d 7d e7             	lea    -0x19(%ebp),%edi
 546:	57                   	push   %edi
 547:	56                   	push   %esi
 548:	e8 7a fd ff ff       	call   2c7 <write>
 54d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 551:	83 c4 10             	add    $0x10,%esp
 554:	31 ff                	xor    %edi,%edi
 556:	e9 e1 fe ff ff       	jmp    43c <printf+0x38>
 55b:	90                   	nop
 55c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 55f:	52                   	push   %edx
 560:	6a 01                	push   $0x1
 562:	8d 7d e7             	lea    -0x19(%ebp),%edi
 565:	e9 35 ff ff ff       	jmp    49f <printf+0x9b>
 56a:	66 90                	xchg   %ax,%ax
 56c:	b0 28                	mov    $0x28,%al
 56e:	ba a0 07 00 00       	mov    $0x7a0,%edx
 573:	eb 80                	jmp    4f5 <printf+0xf1>
 575:	31 ff                	xor    %edi,%edi
 577:	e9 c0 fe ff ff       	jmp    43c <printf+0x38>

0000057c <free>:
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	57                   	push   %edi
 580:	56                   	push   %esi
 581:	53                   	push   %ebx
 582:	83 ec 0c             	sub    $0xc,%esp
 585:	8b 75 08             	mov    0x8(%ebp),%esi
 588:	8d 5e f8             	lea    -0x8(%esi),%ebx
 58b:	8b 7e fc             	mov    -0x4(%esi),%edi
 58e:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 595:	3d 00 80 00 00       	cmp    $0x8000,%eax
 59a:	75 70                	jne    60c <free+0x90>
 59c:	b9 00 80 00 00       	mov    $0x8000,%ecx
 5a1:	a1 70 08 00 00       	mov    0x870,%eax
 5a6:	66 90                	xchg   %ax,%ax
 5a8:	89 c2                	mov    %eax,%edx
 5aa:	8b 00                	mov    (%eax),%eax
 5ac:	39 da                	cmp    %ebx,%edx
 5ae:	73 2c                	jae    5dc <free+0x60>
 5b0:	39 c3                	cmp    %eax,%ebx
 5b2:	72 04                	jb     5b8 <free+0x3c>
 5b4:	39 c2                	cmp    %eax,%edx
 5b6:	72 f0                	jb     5a8 <free+0x2c>
 5b8:	01 d9                	add    %ebx,%ecx
 5ba:	39 c8                	cmp    %ecx,%eax
 5bc:	74 2c                	je     5ea <free+0x6e>
 5be:	89 46 f8             	mov    %eax,-0x8(%esi)
 5c1:	8b 42 04             	mov    0x4(%edx),%eax
 5c4:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 5c7:	39 cb                	cmp    %ecx,%ebx
 5c9:	74 36                	je     601 <free+0x85>
 5cb:	89 1a                	mov    %ebx,(%edx)
 5cd:	89 15 70 08 00 00    	mov    %edx,0x870
 5d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop
 5dc:	39 c2                	cmp    %eax,%edx
 5de:	72 c8                	jb     5a8 <free+0x2c>
 5e0:	39 c3                	cmp    %eax,%ebx
 5e2:	73 c4                	jae    5a8 <free+0x2c>
 5e4:	01 d9                	add    %ebx,%ecx
 5e6:	39 c8                	cmp    %ecx,%eax
 5e8:	75 d4                	jne    5be <free+0x42>
 5ea:	03 78 04             	add    0x4(%eax),%edi
 5ed:	89 7e fc             	mov    %edi,-0x4(%esi)
 5f0:	8b 02                	mov    (%edx),%eax
 5f2:	8b 00                	mov    (%eax),%eax
 5f4:	89 46 f8             	mov    %eax,-0x8(%esi)
 5f7:	8b 42 04             	mov    0x4(%edx),%eax
 5fa:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 5fd:	39 cb                	cmp    %ecx,%ebx
 5ff:	75 ca                	jne    5cb <free+0x4f>
 601:	03 46 fc             	add    -0x4(%esi),%eax
 604:	89 42 04             	mov    %eax,0x4(%edx)
 607:	8b 5e f8             	mov    -0x8(%esi),%ebx
 60a:	eb bf                	jmp    5cb <free+0x4f>
 60c:	83 ec 0c             	sub    $0xc,%esp
 60f:	f7 d8                	neg    %eax
 611:	50                   	push   %eax
 612:	e8 50 fd ff ff       	call   367 <increase_mem_usage>
 617:	8b 7e fc             	mov    -0x4(%esi),%edi
 61a:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 621:	83 c4 10             	add    $0x10,%esp
 624:	e9 78 ff ff ff       	jmp    5a1 <free+0x25>
 629:	8d 76 00             	lea    0x0(%esi),%esi

0000062c <malloc>:
 62c:	55                   	push   %ebp
 62d:	89 e5                	mov    %esp,%ebp
 62f:	57                   	push   %edi
 630:	56                   	push   %esi
 631:	53                   	push   %ebx
 632:	83 ec 0c             	sub    $0xc,%esp
 635:	8b 7d 08             	mov    0x8(%ebp),%edi
 638:	e8 1a fd ff ff       	call   357 <get_mem_limit>
 63d:	89 c3                	mov    %eax,%ebx
 63f:	e8 2b fd ff ff       	call   36f <get_mem_usage>
 644:	83 fb ff             	cmp    $0xffffffff,%ebx
 647:	74 0b                	je     654 <malloc+0x28>
 649:	8d 14 38             	lea    (%eax,%edi,1),%edx
 64c:	39 d3                	cmp    %edx,%ebx
 64e:	0f 82 e2 00 00 00    	jb     736 <malloc+0x10a>
 654:	83 ec 0c             	sub    $0xc,%esp
 657:	57                   	push   %edi
 658:	e8 0a fd ff ff       	call   367 <increase_mem_usage>
 65d:	83 c7 07             	add    $0x7,%edi
 660:	c1 ef 03             	shr    $0x3,%edi
 663:	47                   	inc    %edi
 664:	8b 15 70 08 00 00    	mov    0x870,%edx
 66a:	83 c4 10             	add    $0x10,%esp
 66d:	85 d2                	test   %edx,%edx
 66f:	0f 84 93 00 00 00    	je     708 <malloc+0xdc>
 675:	8b 02                	mov    (%edx),%eax
 677:	8b 48 04             	mov    0x4(%eax),%ecx
 67a:	39 f9                	cmp    %edi,%ecx
 67c:	73 62                	jae    6e0 <malloc+0xb4>
 67e:	89 fb                	mov    %edi,%ebx
 680:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 686:	72 78                	jb     700 <malloc+0xd4>
 688:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 68f:	eb 0e                	jmp    69f <malloc+0x73>
 691:	8d 76 00             	lea    0x0(%esi),%esi
 694:	89 c2                	mov    %eax,%edx
 696:	8b 02                	mov    (%edx),%eax
 698:	8b 48 04             	mov    0x4(%eax),%ecx
 69b:	39 f9                	cmp    %edi,%ecx
 69d:	73 41                	jae    6e0 <malloc+0xb4>
 69f:	39 05 70 08 00 00    	cmp    %eax,0x870
 6a5:	75 ed                	jne    694 <malloc+0x68>
 6a7:	83 ec 0c             	sub    $0xc,%esp
 6aa:	56                   	push   %esi
 6ab:	e8 7f fc ff ff       	call   32f <sbrk>
 6b0:	83 c4 10             	add    $0x10,%esp
 6b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b6:	74 1c                	je     6d4 <malloc+0xa8>
 6b8:	89 58 04             	mov    %ebx,0x4(%eax)
 6bb:	83 ec 0c             	sub    $0xc,%esp
 6be:	83 c0 08             	add    $0x8,%eax
 6c1:	50                   	push   %eax
 6c2:	e8 b5 fe ff ff       	call   57c <free>
 6c7:	8b 15 70 08 00 00    	mov    0x870,%edx
 6cd:	83 c4 10             	add    $0x10,%esp
 6d0:	85 d2                	test   %edx,%edx
 6d2:	75 c2                	jne    696 <malloc+0x6a>
 6d4:	31 c0                	xor    %eax,%eax
 6d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d9:	5b                   	pop    %ebx
 6da:	5e                   	pop    %esi
 6db:	5f                   	pop    %edi
 6dc:	5d                   	pop    %ebp
 6dd:	c3                   	ret    
 6de:	66 90                	xchg   %ax,%ax
 6e0:	39 cf                	cmp    %ecx,%edi
 6e2:	74 4c                	je     730 <malloc+0x104>
 6e4:	29 f9                	sub    %edi,%ecx
 6e6:	89 48 04             	mov    %ecx,0x4(%eax)
 6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6ec:	89 78 04             	mov    %edi,0x4(%eax)
 6ef:	89 15 70 08 00 00    	mov    %edx,0x870
 6f5:	83 c0 08             	add    $0x8,%eax
 6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6fb:	5b                   	pop    %ebx
 6fc:	5e                   	pop    %esi
 6fd:	5f                   	pop    %edi
 6fe:	5d                   	pop    %ebp
 6ff:	c3                   	ret    
 700:	bb 00 10 00 00       	mov    $0x1000,%ebx
 705:	eb 81                	jmp    688 <malloc+0x5c>
 707:	90                   	nop
 708:	c7 05 70 08 00 00 74 	movl   $0x874,0x870
 70f:	08 00 00 
 712:	c7 05 74 08 00 00 74 	movl   $0x874,0x874
 719:	08 00 00 
 71c:	c7 05 78 08 00 00 00 	movl   $0x0,0x878
 723:	00 00 00 
 726:	b8 74 08 00 00       	mov    $0x874,%eax
 72b:	e9 4e ff ff ff       	jmp    67e <malloc+0x52>
 730:	8b 08                	mov    (%eax),%ecx
 732:	89 0a                	mov    %ecx,(%edx)
 734:	eb b9                	jmp    6ef <malloc+0xc3>
 736:	83 ec 0c             	sub    $0xc,%esp
 739:	57                   	push   %edi
 73a:	50                   	push   %eax
 73b:	53                   	push   %ebx
 73c:	68 14 08 00 00       	push   $0x814
 741:	6a 02                	push   $0x2
 743:	e8 bc fc ff ff       	call   404 <printf>
 748:	83 c4 20             	add    $0x20,%esp
 74b:	31 c0                	xor    %eax,%eax
 74d:	eb 87                	jmp    6d6 <malloc+0xaa>
