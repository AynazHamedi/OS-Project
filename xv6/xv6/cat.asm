
_cat:     file format elf32-i386


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
  1d:	7e 58                	jle    77 <main+0x77>
  1f:	83 c3 04             	add    $0x4,%ebx
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	eb 20                	jmp    49 <main+0x49>
  29:	8d 76 00             	lea    0x0(%esi),%esi
  2c:	83 ec 0c             	sub    $0xc,%esp
  2f:	50                   	push   %eax
  30:	e8 53 00 00 00       	call   88 <cat>
  35:	89 3c 24             	mov    %edi,(%esp)
  38:	e8 a2 02 00 00       	call   2df <close>
  3d:	46                   	inc    %esi
  3e:	83 c3 04             	add    $0x4,%ebx
  41:	83 c4 10             	add    $0x10,%esp
  44:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  47:	74 29                	je     72 <main+0x72>
  49:	83 ec 08             	sub    $0x8,%esp
  4c:	6a 00                	push   $0x0
  4e:	ff 33                	pushl  (%ebx)
  50:	e8 a2 02 00 00       	call   2f7 <open>
  55:	89 c7                	mov    %eax,%edi
  57:	83 c4 10             	add    $0x10,%esp
  5a:	85 c0                	test   %eax,%eax
  5c:	79 ce                	jns    2c <main+0x2c>
  5e:	50                   	push   %eax
  5f:	ff 33                	pushl  (%ebx)
  61:	68 83 07 00 00       	push   $0x783
  66:	6a 01                	push   $0x1
  68:	e8 a7 03 00 00       	call   414 <printf>
  6d:	e8 45 02 00 00       	call   2b7 <exit>
  72:	e8 40 02 00 00       	call   2b7 <exit>
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 07 00 00 00       	call   88 <cat>
  81:	e8 31 02 00 00       	call   2b7 <exit>
  86:	66 90                	xchg   %ax,%ax

00000088 <cat>:
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	56                   	push   %esi
  8c:	53                   	push   %ebx
  8d:	8b 75 08             	mov    0x8(%ebp),%esi
  90:	eb 17                	jmp    a9 <cat+0x21>
  92:	66 90                	xchg   %ax,%ax
  94:	51                   	push   %ecx
  95:	53                   	push   %ebx
  96:	68 60 08 00 00       	push   $0x860
  9b:	6a 01                	push   $0x1
  9d:	e8 35 02 00 00       	call   2d7 <write>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	39 d8                	cmp    %ebx,%eax
  a7:	75 23                	jne    cc <cat+0x44>
  a9:	52                   	push   %edx
  aa:	68 00 02 00 00       	push   $0x200
  af:	68 60 08 00 00       	push   $0x860
  b4:	56                   	push   %esi
  b5:	e8 15 02 00 00       	call   2cf <read>
  ba:	89 c3                	mov    %eax,%ebx
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	85 c0                	test   %eax,%eax
  c1:	7f d1                	jg     94 <cat+0xc>
  c3:	75 1b                	jne    e0 <cat+0x58>
  c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c8:	5b                   	pop    %ebx
  c9:	5e                   	pop    %esi
  ca:	5d                   	pop    %ebp
  cb:	c3                   	ret    
  cc:	83 ec 08             	sub    $0x8,%esp
  cf:	68 60 07 00 00       	push   $0x760
  d4:	6a 01                	push   $0x1
  d6:	e8 39 03 00 00       	call   414 <printf>
  db:	e8 d7 01 00 00       	call   2b7 <exit>
  e0:	50                   	push   %eax
  e1:	50                   	push   %eax
  e2:	68 72 07 00 00       	push   $0x772
  e7:	6a 01                	push   $0x1
  e9:	e8 26 03 00 00       	call   414 <printf>
  ee:	e8 c4 01 00 00       	call   2b7 <exit>
  f3:	90                   	nop

000000f4 <strcpy>:
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	53                   	push   %ebx
  f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fe:	31 c0                	xor    %eax,%eax
 100:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 103:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 106:	40                   	inc    %eax
 107:	84 d2                	test   %dl,%dl
 109:	75 f5                	jne    100 <strcpy+0xc>
 10b:	89 c8                	mov    %ecx,%eax
 10d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 110:	c9                   	leave  
 111:	c3                   	ret    
 112:	66 90                	xchg   %ax,%ax

00000114 <strcmp>:
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	53                   	push   %ebx
 118:	8b 55 08             	mov    0x8(%ebp),%edx
 11b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11e:	0f b6 02             	movzbl (%edx),%eax
 121:	84 c0                	test   %al,%al
 123:	75 10                	jne    135 <strcmp+0x21>
 125:	eb 2a                	jmp    151 <strcmp+0x3d>
 127:	90                   	nop
 128:	42                   	inc    %edx
 129:	8d 4b 01             	lea    0x1(%ebx),%ecx
 12c:	0f b6 02             	movzbl (%edx),%eax
 12f:	84 c0                	test   %al,%al
 131:	74 11                	je     144 <strcmp+0x30>
 133:	89 cb                	mov    %ecx,%ebx
 135:	0f b6 0b             	movzbl (%ebx),%ecx
 138:	38 c1                	cmp    %al,%cl
 13a:	74 ec                	je     128 <strcmp+0x14>
 13c:	29 c8                	sub    %ecx,%eax
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	c9                   	leave  
 142:	c3                   	ret    
 143:	90                   	nop
 144:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 148:	31 c0                	xor    %eax,%eax
 14a:	29 c8                	sub    %ecx,%eax
 14c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 14f:	c9                   	leave  
 150:	c3                   	ret    
 151:	0f b6 0b             	movzbl (%ebx),%ecx
 154:	31 c0                	xor    %eax,%eax
 156:	eb e4                	jmp    13c <strcmp+0x28>

00000158 <strlen>:
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	8b 55 08             	mov    0x8(%ebp),%edx
 15e:	80 3a 00             	cmpb   $0x0,(%edx)
 161:	74 15                	je     178 <strlen+0x20>
 163:	31 c0                	xor    %eax,%eax
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	40                   	inc    %eax
 169:	89 c1                	mov    %eax,%ecx
 16b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 16f:	75 f7                	jne    168 <strlen+0x10>
 171:	89 c8                	mov    %ecx,%eax
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi
 178:	31 c9                	xor    %ecx,%ecx
 17a:	89 c8                	mov    %ecx,%eax
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	66 90                	xchg   %ax,%ax

00000180 <memset>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 7d 08             	mov    0x8(%ebp),%edi
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	fc                   	cld    
 18e:	f3 aa                	rep stos %al,%es:(%edi)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	8b 7d fc             	mov    -0x4(%ebp),%edi
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <strchr>:
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1a1:	8a 10                	mov    (%eax),%dl
 1a3:	84 d2                	test   %dl,%dl
 1a5:	75 0c                	jne    1b3 <strchr+0x1b>
 1a7:	eb 13                	jmp    1bc <strchr+0x24>
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	40                   	inc    %eax
 1ad:	8a 10                	mov    (%eax),%dl
 1af:	84 d2                	test   %dl,%dl
 1b1:	74 09                	je     1bc <strchr+0x24>
 1b3:	38 d1                	cmp    %dl,%cl
 1b5:	75 f5                	jne    1ac <strchr+0x14>
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d 76 00             	lea    0x0(%esi),%esi
 1bc:	31 c0                	xor    %eax,%eax
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <gets>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	83 ec 1c             	sub    $0x1c,%esp
 1c9:	31 db                	xor    %ebx,%ebx
 1cb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1ce:	eb 24                	jmp    1f4 <gets+0x34>
 1d0:	50                   	push   %eax
 1d1:	6a 01                	push   $0x1
 1d3:	56                   	push   %esi
 1d4:	6a 00                	push   $0x0
 1d6:	e8 f4 00 00 00       	call   2cf <read>
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	85 c0                	test   %eax,%eax
 1e0:	7e 1a                	jle    1fc <gets+0x3c>
 1e2:	8a 45 e7             	mov    -0x19(%ebp),%al
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1ec:	3c 0a                	cmp    $0xa,%al
 1ee:	74 0e                	je     1fe <gets+0x3e>
 1f0:	3c 0d                	cmp    $0xd,%al
 1f2:	74 0a                	je     1fe <gets+0x3e>
 1f4:	89 df                	mov    %ebx,%edi
 1f6:	43                   	inc    %ebx
 1f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1fa:	7c d4                	jl     1d0 <gets+0x10>
 1fc:	89 fb                	mov    %edi,%ebx
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	pushl  0x8(%ebp)
 21d:	e8 d5 00 00 00       	call   2f7 <open>
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
 229:	89 c3                	mov    %eax,%ebx
 22b:	83 ec 08             	sub    $0x8,%esp
 22e:	ff 75 0c             	pushl  0xc(%ebp)
 231:	50                   	push   %eax
 232:	e8 d8 00 00 00       	call   30f <fstat>
 237:	89 c6                	mov    %eax,%esi
 239:	89 1c 24             	mov    %ebx,(%esp)
 23c:	e8 9e 00 00 00       	call   2df <close>
 241:	83 c4 10             	add    $0x10,%esp
 244:	89 f0                	mov    %esi,%eax
 246:	8d 65 f8             	lea    -0x8(%ebp),%esp
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	90                   	nop

00000258 <atoi>:
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	53                   	push   %ebx
 25c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 25f:	0f be 01             	movsbl (%ecx),%eax
 262:	8d 50 d0             	lea    -0x30(%eax),%edx
 265:	80 fa 09             	cmp    $0x9,%dl
 268:	ba 00 00 00 00       	mov    $0x0,%edx
 26d:	77 16                	ja     285 <atoi+0x2d>
 26f:	90                   	nop
 270:	41                   	inc    %ecx
 271:	8d 14 92             	lea    (%edx,%edx,4),%edx
 274:	01 d2                	add    %edx,%edx
 276:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 27a:	0f be 01             	movsbl (%ecx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x18>
 285:	89 d0                	mov    %edx,%eax
 287:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28a:	c9                   	leave  
 28b:	c3                   	ret    

0000028c <memmove>:
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	57                   	push   %edi
 290:	56                   	push   %esi
 291:	8b 55 08             	mov    0x8(%ebp),%edx
 294:	8b 75 0c             	mov    0xc(%ebp),%esi
 297:	8b 45 10             	mov    0x10(%ebp),%eax
 29a:	85 c0                	test   %eax,%eax
 29c:	7e 0b                	jle    2a9 <memmove+0x1d>
 29e:	01 d0                	add    %edx,%eax
 2a0:	89 d7                	mov    %edx,%edi
 2a2:	66 90                	xchg   %ax,%ax
 2a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2a5:	39 f8                	cmp    %edi,%eax
 2a7:	75 fb                	jne    2a4 <memmove+0x18>
 2a9:	89 d0                	mov    %edx,%eax
 2ab:	5e                   	pop    %esi
 2ac:	5f                   	pop    %edi
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <fork>:
 2af:	b8 01 00 00 00       	mov    $0x1,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <exit>:
 2b7:	b8 02 00 00 00       	mov    $0x2,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <wait>:
 2bf:	b8 03 00 00 00       	mov    $0x3,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <pipe>:
 2c7:	b8 04 00 00 00       	mov    $0x4,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <read>:
 2cf:	b8 05 00 00 00       	mov    $0x5,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <write>:
 2d7:	b8 10 00 00 00       	mov    $0x10,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <close>:
 2df:	b8 15 00 00 00       	mov    $0x15,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <kill>:
 2e7:	b8 06 00 00 00       	mov    $0x6,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <exec>:
 2ef:	b8 07 00 00 00       	mov    $0x7,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <open>:
 2f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <mknod>:
 2ff:	b8 11 00 00 00       	mov    $0x11,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <unlink>:
 307:	b8 12 00 00 00       	mov    $0x12,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <fstat>:
 30f:	b8 08 00 00 00       	mov    $0x8,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <link>:
 317:	b8 13 00 00 00       	mov    $0x13,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <mkdir>:
 31f:	b8 14 00 00 00       	mov    $0x14,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <chdir>:
 327:	b8 09 00 00 00       	mov    $0x9,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <dup>:
 32f:	b8 0a 00 00 00       	mov    $0xa,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <getpid>:
 337:	b8 0b 00 00 00       	mov    $0xb,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <sbrk>:
 33f:	b8 0c 00 00 00       	mov    $0xc,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sleep>:
 347:	b8 0d 00 00 00       	mov    $0xd,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <uptime>:
 34f:	b8 0e 00 00 00       	mov    $0xe,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <cpu_limit>:
 357:	b8 16 00 00 00       	mov    $0x16,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <set_mem_limit>:
 35f:	b8 17 00 00 00       	mov    $0x17,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <get_mem_limit>:
 367:	b8 18 00 00 00       	mov    $0x18,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <increase_mem_limit>:
 36f:	b8 19 00 00 00       	mov    $0x19,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <increase_mem_usage>:
 377:	b8 1a 00 00 00       	mov    $0x1a,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <get_mem_usage>:
 37f:	b8 1b 00 00 00       	mov    $0x1b,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    
 387:	90                   	nop

00000388 <printint>:
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	57                   	push   %edi
 38c:	56                   	push   %esi
 38d:	53                   	push   %ebx
 38e:	83 ec 3c             	sub    $0x3c,%esp
 391:	89 45 c0             	mov    %eax,-0x40(%ebp)
 394:	89 cb                	mov    %ecx,%ebx
 396:	8b 4d 08             	mov    0x8(%ebp),%ecx
 399:	85 c9                	test   %ecx,%ecx
 39b:	74 04                	je     3a1 <printint+0x19>
 39d:	85 d2                	test   %edx,%edx
 39f:	78 6b                	js     40c <printint+0x84>
 3a1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3a4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 3ab:	31 c9                	xor    %ecx,%ecx
 3ad:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3b0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3b3:	31 d2                	xor    %edx,%edx
 3b5:	f7 f3                	div    %ebx
 3b7:	89 cf                	mov    %ecx,%edi
 3b9:	8d 49 01             	lea    0x1(%ecx),%ecx
 3bc:	8a 92 f8 07 00 00    	mov    0x7f8(%edx),%dl
 3c2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 3c6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3c9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3cc:	39 da                	cmp    %ebx,%edx
 3ce:	73 e0                	jae    3b0 <printint+0x28>
 3d0:	8b 55 08             	mov    0x8(%ebp),%edx
 3d3:	85 d2                	test   %edx,%edx
 3d5:	74 07                	je     3de <printint+0x56>
 3d7:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3dc:	89 cf                	mov    %ecx,%edi
 3de:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3e1:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3e5:	8d 76 00             	lea    0x0(%esi),%esi
 3e8:	8a 07                	mov    (%edi),%al
 3ea:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ed:	50                   	push   %eax
 3ee:	6a 01                	push   $0x1
 3f0:	56                   	push   %esi
 3f1:	ff 75 c0             	pushl  -0x40(%ebp)
 3f4:	e8 de fe ff ff       	call   2d7 <write>
 3f9:	89 f8                	mov    %edi,%eax
 3fb:	4f                   	dec    %edi
 3fc:	83 c4 10             	add    $0x10,%esp
 3ff:	39 d8                	cmp    %ebx,%eax
 401:	75 e5                	jne    3e8 <printint+0x60>
 403:	8d 65 f4             	lea    -0xc(%ebp),%esp
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    
 40b:	90                   	nop
 40c:	f7 da                	neg    %edx
 40e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 411:	eb 98                	jmp    3ab <printint+0x23>
 413:	90                   	nop

00000414 <printf>:
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	57                   	push   %edi
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
 41a:	83 ec 2c             	sub    $0x2c,%esp
 41d:	8b 75 08             	mov    0x8(%ebp),%esi
 420:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 423:	8a 13                	mov    (%ebx),%dl
 425:	84 d2                	test   %dl,%dl
 427:	74 5c                	je     485 <printf+0x71>
 429:	43                   	inc    %ebx
 42a:	8d 45 10             	lea    0x10(%ebp),%eax
 42d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 430:	31 ff                	xor    %edi,%edi
 432:	eb 20                	jmp    454 <printf+0x40>
 434:	83 f8 25             	cmp    $0x25,%eax
 437:	74 3f                	je     478 <printf+0x64>
 439:	88 55 e7             	mov    %dl,-0x19(%ebp)
 43c:	50                   	push   %eax
 43d:	6a 01                	push   $0x1
 43f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 442:	50                   	push   %eax
 443:	56                   	push   %esi
 444:	e8 8e fe ff ff       	call   2d7 <write>
 449:	83 c4 10             	add    $0x10,%esp
 44c:	43                   	inc    %ebx
 44d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 450:	84 d2                	test   %dl,%dl
 452:	74 31                	je     485 <printf+0x71>
 454:	0f b6 c2             	movzbl %dl,%eax
 457:	85 ff                	test   %edi,%edi
 459:	74 d9                	je     434 <printf+0x20>
 45b:	83 ff 25             	cmp    $0x25,%edi
 45e:	75 ec                	jne    44c <printf+0x38>
 460:	83 f8 25             	cmp    $0x25,%eax
 463:	0f 84 03 01 00 00    	je     56c <printf+0x158>
 469:	83 e8 63             	sub    $0x63,%eax
 46c:	83 f8 15             	cmp    $0x15,%eax
 46f:	77 1f                	ja     490 <printf+0x7c>
 471:	ff 24 85 a0 07 00 00 	jmp    *0x7a0(,%eax,4)
 478:	bf 25 00 00 00       	mov    $0x25,%edi
 47d:	43                   	inc    %ebx
 47e:	8a 53 ff             	mov    -0x1(%ebx),%dl
 481:	84 d2                	test   %dl,%dl
 483:	75 cf                	jne    454 <printf+0x40>
 485:	8d 65 f4             	lea    -0xc(%ebp),%esp
 488:	5b                   	pop    %ebx
 489:	5e                   	pop    %esi
 48a:	5f                   	pop    %edi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	88 55 d0             	mov    %dl,-0x30(%ebp)
 493:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 497:	50                   	push   %eax
 498:	6a 01                	push   $0x1
 49a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 49d:	57                   	push   %edi
 49e:	56                   	push   %esi
 49f:	e8 33 fe ff ff       	call   2d7 <write>
 4a4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 4a7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4aa:	83 c4 0c             	add    $0xc,%esp
 4ad:	6a 01                	push   $0x1
 4af:	57                   	push   %edi
 4b0:	56                   	push   %esi
 4b1:	e8 21 fe ff ff       	call   2d7 <write>
 4b6:	83 c4 10             	add    $0x10,%esp
 4b9:	31 ff                	xor    %edi,%edi
 4bb:	eb 8f                	jmp    44c <printf+0x38>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4c3:	8b 17                	mov    (%edi),%edx
 4c5:	83 ec 0c             	sub    $0xc,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	b9 10 00 00 00       	mov    $0x10,%ecx
 4cf:	89 f0                	mov    %esi,%eax
 4d1:	e8 b2 fe ff ff       	call   388 <printint>
 4d6:	83 c7 04             	add    $0x4,%edi
 4d9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4dc:	83 c4 10             	add    $0x10,%esp
 4df:	31 ff                	xor    %edi,%edi
 4e1:	e9 66 ff ff ff       	jmp    44c <printf+0x38>
 4e6:	66 90                	xchg   %ax,%ax
 4e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4eb:	8b 10                	mov    (%eax),%edx
 4ed:	83 c0 04             	add    $0x4,%eax
 4f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4f3:	85 d2                	test   %edx,%edx
 4f5:	0f 84 81 00 00 00    	je     57c <printf+0x168>
 4fb:	8a 02                	mov    (%edx),%al
 4fd:	84 c0                	test   %al,%al
 4ff:	0f 84 80 00 00 00    	je     585 <printf+0x171>
 505:	8d 7d e7             	lea    -0x19(%ebp),%edi
 508:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 50b:	89 d3                	mov    %edx,%ebx
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	88 45 e7             	mov    %al,-0x19(%ebp)
 513:	50                   	push   %eax
 514:	6a 01                	push   $0x1
 516:	57                   	push   %edi
 517:	56                   	push   %esi
 518:	e8 ba fd ff ff       	call   2d7 <write>
 51d:	43                   	inc    %ebx
 51e:	8a 03                	mov    (%ebx),%al
 520:	83 c4 10             	add    $0x10,%esp
 523:	84 c0                	test   %al,%al
 525:	75 e9                	jne    510 <printf+0xfc>
 527:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 52a:	31 ff                	xor    %edi,%edi
 52c:	e9 1b ff ff ff       	jmp    44c <printf+0x38>
 531:	8d 76 00             	lea    0x0(%esi),%esi
 534:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 537:	8b 17                	mov    (%edi),%edx
 539:	83 ec 0c             	sub    $0xc,%esp
 53c:	6a 01                	push   $0x1
 53e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 543:	eb 8a                	jmp    4cf <printf+0xbb>
 545:	8d 76 00             	lea    0x0(%esi),%esi
 548:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 54b:	8b 00                	mov    (%eax),%eax
 54d:	88 45 e7             	mov    %al,-0x19(%ebp)
 550:	51                   	push   %ecx
 551:	6a 01                	push   $0x1
 553:	8d 7d e7             	lea    -0x19(%ebp),%edi
 556:	57                   	push   %edi
 557:	56                   	push   %esi
 558:	e8 7a fd ff ff       	call   2d7 <write>
 55d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 561:	83 c4 10             	add    $0x10,%esp
 564:	31 ff                	xor    %edi,%edi
 566:	e9 e1 fe ff ff       	jmp    44c <printf+0x38>
 56b:	90                   	nop
 56c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 56f:	52                   	push   %edx
 570:	6a 01                	push   $0x1
 572:	8d 7d e7             	lea    -0x19(%ebp),%edi
 575:	e9 35 ff ff ff       	jmp    4af <printf+0x9b>
 57a:	66 90                	xchg   %ax,%ax
 57c:	b0 28                	mov    $0x28,%al
 57e:	ba 98 07 00 00       	mov    $0x798,%edx
 583:	eb 80                	jmp    505 <printf+0xf1>
 585:	31 ff                	xor    %edi,%edi
 587:	e9 c0 fe ff ff       	jmp    44c <printf+0x38>

0000058c <free>:
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
 58f:	57                   	push   %edi
 590:	56                   	push   %esi
 591:	53                   	push   %ebx
 592:	83 ec 0c             	sub    $0xc,%esp
 595:	8b 75 08             	mov    0x8(%ebp),%esi
 598:	8d 5e f8             	lea    -0x8(%esi),%ebx
 59b:	8b 7e fc             	mov    -0x4(%esi),%edi
 59e:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 5a5:	3d 00 80 00 00       	cmp    $0x8000,%eax
 5aa:	75 70                	jne    61c <free+0x90>
 5ac:	b9 00 80 00 00       	mov    $0x8000,%ecx
 5b1:	a1 60 0a 00 00       	mov    0xa60,%eax
 5b6:	66 90                	xchg   %ax,%ax
 5b8:	89 c2                	mov    %eax,%edx
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	39 da                	cmp    %ebx,%edx
 5be:	73 2c                	jae    5ec <free+0x60>
 5c0:	39 c3                	cmp    %eax,%ebx
 5c2:	72 04                	jb     5c8 <free+0x3c>
 5c4:	39 c2                	cmp    %eax,%edx
 5c6:	72 f0                	jb     5b8 <free+0x2c>
 5c8:	01 d9                	add    %ebx,%ecx
 5ca:	39 c8                	cmp    %ecx,%eax
 5cc:	74 2c                	je     5fa <free+0x6e>
 5ce:	89 46 f8             	mov    %eax,-0x8(%esi)
 5d1:	8b 42 04             	mov    0x4(%edx),%eax
 5d4:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 5d7:	39 cb                	cmp    %ecx,%ebx
 5d9:	74 36                	je     611 <free+0x85>
 5db:	89 1a                	mov    %ebx,(%edx)
 5dd:	89 15 60 0a 00 00    	mov    %edx,0xa60
 5e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    
 5eb:	90                   	nop
 5ec:	39 c2                	cmp    %eax,%edx
 5ee:	72 c8                	jb     5b8 <free+0x2c>
 5f0:	39 c3                	cmp    %eax,%ebx
 5f2:	73 c4                	jae    5b8 <free+0x2c>
 5f4:	01 d9                	add    %ebx,%ecx
 5f6:	39 c8                	cmp    %ecx,%eax
 5f8:	75 d4                	jne    5ce <free+0x42>
 5fa:	03 78 04             	add    0x4(%eax),%edi
 5fd:	89 7e fc             	mov    %edi,-0x4(%esi)
 600:	8b 02                	mov    (%edx),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	89 46 f8             	mov    %eax,-0x8(%esi)
 607:	8b 42 04             	mov    0x4(%edx),%eax
 60a:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 60d:	39 cb                	cmp    %ecx,%ebx
 60f:	75 ca                	jne    5db <free+0x4f>
 611:	03 46 fc             	add    -0x4(%esi),%eax
 614:	89 42 04             	mov    %eax,0x4(%edx)
 617:	8b 5e f8             	mov    -0x8(%esi),%ebx
 61a:	eb bf                	jmp    5db <free+0x4f>
 61c:	83 ec 0c             	sub    $0xc,%esp
 61f:	f7 d8                	neg    %eax
 621:	50                   	push   %eax
 622:	e8 50 fd ff ff       	call   377 <increase_mem_usage>
 627:	8b 7e fc             	mov    -0x4(%esi),%edi
 62a:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 631:	83 c4 10             	add    $0x10,%esp
 634:	e9 78 ff ff ff       	jmp    5b1 <free+0x25>
 639:	8d 76 00             	lea    0x0(%esi),%esi

0000063c <malloc>:
 63c:	55                   	push   %ebp
 63d:	89 e5                	mov    %esp,%ebp
 63f:	57                   	push   %edi
 640:	56                   	push   %esi
 641:	53                   	push   %ebx
 642:	83 ec 0c             	sub    $0xc,%esp
 645:	8b 7d 08             	mov    0x8(%ebp),%edi
 648:	e8 1a fd ff ff       	call   367 <get_mem_limit>
 64d:	89 c3                	mov    %eax,%ebx
 64f:	e8 2b fd ff ff       	call   37f <get_mem_usage>
 654:	83 fb ff             	cmp    $0xffffffff,%ebx
 657:	74 0b                	je     664 <malloc+0x28>
 659:	8d 14 38             	lea    (%eax,%edi,1),%edx
 65c:	39 d3                	cmp    %edx,%ebx
 65e:	0f 82 e2 00 00 00    	jb     746 <malloc+0x10a>
 664:	83 ec 0c             	sub    $0xc,%esp
 667:	57                   	push   %edi
 668:	e8 0a fd ff ff       	call   377 <increase_mem_usage>
 66d:	83 c7 07             	add    $0x7,%edi
 670:	c1 ef 03             	shr    $0x3,%edi
 673:	47                   	inc    %edi
 674:	8b 15 60 0a 00 00    	mov    0xa60,%edx
 67a:	83 c4 10             	add    $0x10,%esp
 67d:	85 d2                	test   %edx,%edx
 67f:	0f 84 93 00 00 00    	je     718 <malloc+0xdc>
 685:	8b 02                	mov    (%edx),%eax
 687:	8b 48 04             	mov    0x4(%eax),%ecx
 68a:	39 f9                	cmp    %edi,%ecx
 68c:	73 62                	jae    6f0 <malloc+0xb4>
 68e:	89 fb                	mov    %edi,%ebx
 690:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 696:	72 78                	jb     710 <malloc+0xd4>
 698:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 69f:	eb 0e                	jmp    6af <malloc+0x73>
 6a1:	8d 76 00             	lea    0x0(%esi),%esi
 6a4:	89 c2                	mov    %eax,%edx
 6a6:	8b 02                	mov    (%edx),%eax
 6a8:	8b 48 04             	mov    0x4(%eax),%ecx
 6ab:	39 f9                	cmp    %edi,%ecx
 6ad:	73 41                	jae    6f0 <malloc+0xb4>
 6af:	39 05 60 0a 00 00    	cmp    %eax,0xa60
 6b5:	75 ed                	jne    6a4 <malloc+0x68>
 6b7:	83 ec 0c             	sub    $0xc,%esp
 6ba:	56                   	push   %esi
 6bb:	e8 7f fc ff ff       	call   33f <sbrk>
 6c0:	83 c4 10             	add    $0x10,%esp
 6c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c6:	74 1c                	je     6e4 <malloc+0xa8>
 6c8:	89 58 04             	mov    %ebx,0x4(%eax)
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	83 c0 08             	add    $0x8,%eax
 6d1:	50                   	push   %eax
 6d2:	e8 b5 fe ff ff       	call   58c <free>
 6d7:	8b 15 60 0a 00 00    	mov    0xa60,%edx
 6dd:	83 c4 10             	add    $0x10,%esp
 6e0:	85 d2                	test   %edx,%edx
 6e2:	75 c2                	jne    6a6 <malloc+0x6a>
 6e4:	31 c0                	xor    %eax,%eax
 6e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e9:	5b                   	pop    %ebx
 6ea:	5e                   	pop    %esi
 6eb:	5f                   	pop    %edi
 6ec:	5d                   	pop    %ebp
 6ed:	c3                   	ret    
 6ee:	66 90                	xchg   %ax,%ax
 6f0:	39 cf                	cmp    %ecx,%edi
 6f2:	74 4c                	je     740 <malloc+0x104>
 6f4:	29 f9                	sub    %edi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6fc:	89 78 04             	mov    %edi,0x4(%eax)
 6ff:	89 15 60 0a 00 00    	mov    %edx,0xa60
 705:	83 c0 08             	add    $0x8,%eax
 708:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
 710:	bb 00 10 00 00       	mov    $0x1000,%ebx
 715:	eb 81                	jmp    698 <malloc+0x5c>
 717:	90                   	nop
 718:	c7 05 60 0a 00 00 64 	movl   $0xa64,0xa60
 71f:	0a 00 00 
 722:	c7 05 64 0a 00 00 64 	movl   $0xa64,0xa64
 729:	0a 00 00 
 72c:	c7 05 68 0a 00 00 00 	movl   $0x0,0xa68
 733:	00 00 00 
 736:	b8 64 0a 00 00       	mov    $0xa64,%eax
 73b:	e9 4e ff ff ff       	jmp    68e <malloc+0x52>
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0xc3>
 746:	83 ec 0c             	sub    $0xc,%esp
 749:	57                   	push   %edi
 74a:	50                   	push   %eax
 74b:	53                   	push   %ebx
 74c:	68 0c 08 00 00       	push   $0x80c
 751:	6a 02                	push   $0x2
 753:	e8 bc fc ff ff       	call   414 <printf>
 758:	83 c4 20             	add    $0x20,%esp
 75b:	31 c0                	xor    %eax,%eax
 75d:	eb 87                	jmp    6e6 <malloc+0xaa>
