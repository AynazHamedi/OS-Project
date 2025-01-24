
_echo:     file format elf32-i386


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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 41                	jle    5f <main+0x5f>
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 24                	je     4a <main+0x4a>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	90                   	nop
  2c:	68 d0 06 00 00       	push   $0x6d0
  31:	50                   	push   %eax
  32:	68 d2 06 00 00       	push   $0x6d2
  37:	6a 01                	push   $0x1
  39:	e8 46 03 00 00       	call   384 <printf>
  3e:	43                   	inc    %ebx
  3f:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  43:	83 c4 10             	add    $0x10,%esp
  46:	39 f3                	cmp    %esi,%ebx
  48:	75 e2                	jne    2c <main+0x2c>
  4a:	68 d7 06 00 00       	push   $0x6d7
  4f:	50                   	push   %eax
  50:	68 d2 06 00 00       	push   $0x6d2
  55:	6a 01                	push   $0x1
  57:	e8 28 03 00 00       	call   384 <printf>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	e8 c3 01 00 00       	call   227 <exit>

00000064 <strcpy>:
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	53                   	push   %ebx
  68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6e:	31 c0                	xor    %eax,%eax
  70:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  73:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  76:	40                   	inc    %eax
  77:	84 d2                	test   %dl,%dl
  79:	75 f5                	jne    70 <strcpy+0xc>
  7b:	89 c8                	mov    %ecx,%eax
  7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80:	c9                   	leave  
  81:	c3                   	ret    
  82:	66 90                	xchg   %ax,%ax

00000084 <strcmp>:
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	8b 55 08             	mov    0x8(%ebp),%edx
  8b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8e:	0f b6 02             	movzbl (%edx),%eax
  91:	84 c0                	test   %al,%al
  93:	75 10                	jne    a5 <strcmp+0x21>
  95:	eb 2a                	jmp    c1 <strcmp+0x3d>
  97:	90                   	nop
  98:	42                   	inc    %edx
  99:	8d 4b 01             	lea    0x1(%ebx),%ecx
  9c:	0f b6 02             	movzbl (%edx),%eax
  9f:	84 c0                	test   %al,%al
  a1:	74 11                	je     b4 <strcmp+0x30>
  a3:	89 cb                	mov    %ecx,%ebx
  a5:	0f b6 0b             	movzbl (%ebx),%ecx
  a8:	38 c1                	cmp    %al,%cl
  aa:	74 ec                	je     98 <strcmp+0x14>
  ac:	29 c8                	sub    %ecx,%eax
  ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b1:	c9                   	leave  
  b2:	c3                   	ret    
  b3:	90                   	nop
  b4:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  b8:	31 c0                	xor    %eax,%eax
  ba:	29 c8                	sub    %ecx,%eax
  bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  bf:	c9                   	leave  
  c0:	c3                   	ret    
  c1:	0f b6 0b             	movzbl (%ebx),%ecx
  c4:	31 c0                	xor    %eax,%eax
  c6:	eb e4                	jmp    ac <strcmp+0x28>

000000c8 <strlen>:
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  cb:	8b 55 08             	mov    0x8(%ebp),%edx
  ce:	80 3a 00             	cmpb   $0x0,(%edx)
  d1:	74 15                	je     e8 <strlen+0x20>
  d3:	31 c0                	xor    %eax,%eax
  d5:	8d 76 00             	lea    0x0(%esi),%esi
  d8:	40                   	inc    %eax
  d9:	89 c1                	mov    %eax,%ecx
  db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  df:	75 f7                	jne    d8 <strlen+0x10>
  e1:	89 c8                	mov    %ecx,%eax
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    
  e5:	8d 76 00             	lea    0x0(%esi),%esi
  e8:	31 c9                	xor    %ecx,%ecx
  ea:	89 c8                	mov    %ecx,%eax
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax

000000f0 <memset>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 7d 08             	mov    0x8(%ebp),%edi
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	fc                   	cld    
  fe:	f3 aa                	rep stos %al,%es:(%edi)
 100:	8b 45 08             	mov    0x8(%ebp),%eax
 103:	8b 7d fc             	mov    -0x4(%ebp),%edi
 106:	c9                   	leave  
 107:	c3                   	ret    

00000108 <strchr>:
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 111:	8a 10                	mov    (%eax),%dl
 113:	84 d2                	test   %dl,%dl
 115:	75 0c                	jne    123 <strchr+0x1b>
 117:	eb 13                	jmp    12c <strchr+0x24>
 119:	8d 76 00             	lea    0x0(%esi),%esi
 11c:	40                   	inc    %eax
 11d:	8a 10                	mov    (%eax),%dl
 11f:	84 d2                	test   %dl,%dl
 121:	74 09                	je     12c <strchr+0x24>
 123:	38 d1                	cmp    %dl,%cl
 125:	75 f5                	jne    11c <strchr+0x14>
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d 76 00             	lea    0x0(%esi),%esi
 12c:	31 c0                	xor    %eax,%eax
 12e:	5d                   	pop    %ebp
 12f:	c3                   	ret    

00000130 <gets>:
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	53                   	push   %ebx
 136:	83 ec 1c             	sub    $0x1c,%esp
 139:	31 db                	xor    %ebx,%ebx
 13b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 13e:	eb 24                	jmp    164 <gets+0x34>
 140:	50                   	push   %eax
 141:	6a 01                	push   $0x1
 143:	56                   	push   %esi
 144:	6a 00                	push   $0x0
 146:	e8 f4 00 00 00       	call   23f <read>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	7e 1a                	jle    16c <gets+0x3c>
 152:	8a 45 e7             	mov    -0x19(%ebp),%al
 155:	8b 55 08             	mov    0x8(%ebp),%edx
 158:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 15c:	3c 0a                	cmp    $0xa,%al
 15e:	74 0e                	je     16e <gets+0x3e>
 160:	3c 0d                	cmp    $0xd,%al
 162:	74 0a                	je     16e <gets+0x3e>
 164:	89 df                	mov    %ebx,%edi
 166:	43                   	inc    %ebx
 167:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 16a:	7c d4                	jl     140 <gets+0x10>
 16c:	89 fb                	mov    %edi,%ebx
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 175:	8d 65 f4             	lea    -0xc(%ebp),%esp
 178:	5b                   	pop    %ebx
 179:	5e                   	pop    %esi
 17a:	5f                   	pop    %edi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <stat>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	83 ec 08             	sub    $0x8,%esp
 188:	6a 00                	push   $0x0
 18a:	ff 75 08             	pushl  0x8(%ebp)
 18d:	e8 d5 00 00 00       	call   267 <open>
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	78 27                	js     1c0 <stat+0x40>
 199:	89 c3                	mov    %eax,%ebx
 19b:	83 ec 08             	sub    $0x8,%esp
 19e:	ff 75 0c             	pushl  0xc(%ebp)
 1a1:	50                   	push   %eax
 1a2:	e8 d8 00 00 00       	call   27f <fstat>
 1a7:	89 c6                	mov    %eax,%esi
 1a9:	89 1c 24             	mov    %ebx,(%esp)
 1ac:	e8 9e 00 00 00       	call   24f <close>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	89 f0                	mov    %esi,%eax
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c5:	eb ed                	jmp    1b4 <stat+0x34>
 1c7:	90                   	nop

000001c8 <atoi>:
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	53                   	push   %ebx
 1cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cf:	0f be 01             	movsbl (%ecx),%eax
 1d2:	8d 50 d0             	lea    -0x30(%eax),%edx
 1d5:	80 fa 09             	cmp    $0x9,%dl
 1d8:	ba 00 00 00 00       	mov    $0x0,%edx
 1dd:	77 16                	ja     1f5 <atoi+0x2d>
 1df:	90                   	nop
 1e0:	41                   	inc    %ecx
 1e1:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1e4:	01 d2                	add    %edx,%edx
 1e6:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1ea:	0f be 01             	movsbl (%ecx),%eax
 1ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1f0:	80 fb 09             	cmp    $0x9,%bl
 1f3:	76 eb                	jbe    1e0 <atoi+0x18>
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <memmove>:
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	57                   	push   %edi
 200:	56                   	push   %esi
 201:	8b 55 08             	mov    0x8(%ebp),%edx
 204:	8b 75 0c             	mov    0xc(%ebp),%esi
 207:	8b 45 10             	mov    0x10(%ebp),%eax
 20a:	85 c0                	test   %eax,%eax
 20c:	7e 0b                	jle    219 <memmove+0x1d>
 20e:	01 d0                	add    %edx,%eax
 210:	89 d7                	mov    %edx,%edi
 212:	66 90                	xchg   %ax,%ax
 214:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 215:	39 f8                	cmp    %edi,%eax
 217:	75 fb                	jne    214 <memmove+0x18>
 219:	89 d0                	mov    %edx,%eax
 21b:	5e                   	pop    %esi
 21c:	5f                   	pop    %edi
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    

0000021f <fork>:
 21f:	b8 01 00 00 00       	mov    $0x1,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <exit>:
 227:	b8 02 00 00 00       	mov    $0x2,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <wait>:
 22f:	b8 03 00 00 00       	mov    $0x3,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <pipe>:
 237:	b8 04 00 00 00       	mov    $0x4,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <read>:
 23f:	b8 05 00 00 00       	mov    $0x5,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <write>:
 247:	b8 10 00 00 00       	mov    $0x10,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <close>:
 24f:	b8 15 00 00 00       	mov    $0x15,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <kill>:
 257:	b8 06 00 00 00       	mov    $0x6,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <exec>:
 25f:	b8 07 00 00 00       	mov    $0x7,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <open>:
 267:	b8 0f 00 00 00       	mov    $0xf,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <mknod>:
 26f:	b8 11 00 00 00       	mov    $0x11,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <unlink>:
 277:	b8 12 00 00 00       	mov    $0x12,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <fstat>:
 27f:	b8 08 00 00 00       	mov    $0x8,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <link>:
 287:	b8 13 00 00 00       	mov    $0x13,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <mkdir>:
 28f:	b8 14 00 00 00       	mov    $0x14,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <chdir>:
 297:	b8 09 00 00 00       	mov    $0x9,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <dup>:
 29f:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <getpid>:
 2a7:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <sbrk>:
 2af:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <sleep>:
 2b7:	b8 0d 00 00 00       	mov    $0xd,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <uptime>:
 2bf:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <cpu_limit>:
 2c7:	b8 16 00 00 00       	mov    $0x16,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <set_mem_limit>:
 2cf:	b8 17 00 00 00       	mov    $0x17,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <get_mem_limit>:
 2d7:	b8 18 00 00 00       	mov    $0x18,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <increase_mem_limit>:
 2df:	b8 19 00 00 00       	mov    $0x19,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <increase_mem_usage>:
 2e7:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <get_mem_usage>:
 2ef:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    
 2f7:	90                   	nop

000002f8 <printint>:
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	57                   	push   %edi
 2fc:	56                   	push   %esi
 2fd:	53                   	push   %ebx
 2fe:	83 ec 3c             	sub    $0x3c,%esp
 301:	89 45 c0             	mov    %eax,-0x40(%ebp)
 304:	89 cb                	mov    %ecx,%ebx
 306:	8b 4d 08             	mov    0x8(%ebp),%ecx
 309:	85 c9                	test   %ecx,%ecx
 30b:	74 04                	je     311 <printint+0x19>
 30d:	85 d2                	test   %edx,%edx
 30f:	78 6b                	js     37c <printint+0x84>
 311:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 314:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 31b:	31 c9                	xor    %ecx,%ecx
 31d:	8d 75 d7             	lea    -0x29(%ebp),%esi
 320:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 323:	31 d2                	xor    %edx,%edx
 325:	f7 f3                	div    %ebx
 327:	89 cf                	mov    %ecx,%edi
 329:	8d 49 01             	lea    0x1(%ecx),%ecx
 32c:	8a 92 38 07 00 00    	mov    0x738(%edx),%dl
 332:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 336:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 339:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 33c:	39 da                	cmp    %ebx,%edx
 33e:	73 e0                	jae    320 <printint+0x28>
 340:	8b 55 08             	mov    0x8(%ebp),%edx
 343:	85 d2                	test   %edx,%edx
 345:	74 07                	je     34e <printint+0x56>
 347:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 34c:	89 cf                	mov    %ecx,%edi
 34e:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 351:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 355:	8d 76 00             	lea    0x0(%esi),%esi
 358:	8a 07                	mov    (%edi),%al
 35a:	88 45 d7             	mov    %al,-0x29(%ebp)
 35d:	50                   	push   %eax
 35e:	6a 01                	push   $0x1
 360:	56                   	push   %esi
 361:	ff 75 c0             	pushl  -0x40(%ebp)
 364:	e8 de fe ff ff       	call   247 <write>
 369:	89 f8                	mov    %edi,%eax
 36b:	4f                   	dec    %edi
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	39 d8                	cmp    %ebx,%eax
 371:	75 e5                	jne    358 <printint+0x60>
 373:	8d 65 f4             	lea    -0xc(%ebp),%esp
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	90                   	nop
 37c:	f7 da                	neg    %edx
 37e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 381:	eb 98                	jmp    31b <printint+0x23>
 383:	90                   	nop

00000384 <printf>:
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 2c             	sub    $0x2c,%esp
 38d:	8b 75 08             	mov    0x8(%ebp),%esi
 390:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 393:	8a 13                	mov    (%ebx),%dl
 395:	84 d2                	test   %dl,%dl
 397:	74 5c                	je     3f5 <printf+0x71>
 399:	43                   	inc    %ebx
 39a:	8d 45 10             	lea    0x10(%ebp),%eax
 39d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3a0:	31 ff                	xor    %edi,%edi
 3a2:	eb 20                	jmp    3c4 <printf+0x40>
 3a4:	83 f8 25             	cmp    $0x25,%eax
 3a7:	74 3f                	je     3e8 <printf+0x64>
 3a9:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3ac:	50                   	push   %eax
 3ad:	6a 01                	push   $0x1
 3af:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b2:	50                   	push   %eax
 3b3:	56                   	push   %esi
 3b4:	e8 8e fe ff ff       	call   247 <write>
 3b9:	83 c4 10             	add    $0x10,%esp
 3bc:	43                   	inc    %ebx
 3bd:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3c0:	84 d2                	test   %dl,%dl
 3c2:	74 31                	je     3f5 <printf+0x71>
 3c4:	0f b6 c2             	movzbl %dl,%eax
 3c7:	85 ff                	test   %edi,%edi
 3c9:	74 d9                	je     3a4 <printf+0x20>
 3cb:	83 ff 25             	cmp    $0x25,%edi
 3ce:	75 ec                	jne    3bc <printf+0x38>
 3d0:	83 f8 25             	cmp    $0x25,%eax
 3d3:	0f 84 03 01 00 00    	je     4dc <printf+0x158>
 3d9:	83 e8 63             	sub    $0x63,%eax
 3dc:	83 f8 15             	cmp    $0x15,%eax
 3df:	77 1f                	ja     400 <printf+0x7c>
 3e1:	ff 24 85 e0 06 00 00 	jmp    *0x6e0(,%eax,4)
 3e8:	bf 25 00 00 00       	mov    $0x25,%edi
 3ed:	43                   	inc    %ebx
 3ee:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3f1:	84 d2                	test   %dl,%dl
 3f3:	75 cf                	jne    3c4 <printf+0x40>
 3f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	88 55 d0             	mov    %dl,-0x30(%ebp)
 403:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 407:	50                   	push   %eax
 408:	6a 01                	push   $0x1
 40a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 40d:	57                   	push   %edi
 40e:	56                   	push   %esi
 40f:	e8 33 fe ff ff       	call   247 <write>
 414:	8a 55 d0             	mov    -0x30(%ebp),%dl
 417:	88 55 e7             	mov    %dl,-0x19(%ebp)
 41a:	83 c4 0c             	add    $0xc,%esp
 41d:	6a 01                	push   $0x1
 41f:	57                   	push   %edi
 420:	56                   	push   %esi
 421:	e8 21 fe ff ff       	call   247 <write>
 426:	83 c4 10             	add    $0x10,%esp
 429:	31 ff                	xor    %edi,%edi
 42b:	eb 8f                	jmp    3bc <printf+0x38>
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 433:	8b 17                	mov    (%edi),%edx
 435:	83 ec 0c             	sub    $0xc,%esp
 438:	6a 00                	push   $0x0
 43a:	b9 10 00 00 00       	mov    $0x10,%ecx
 43f:	89 f0                	mov    %esi,%eax
 441:	e8 b2 fe ff ff       	call   2f8 <printint>
 446:	83 c7 04             	add    $0x4,%edi
 449:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 44c:	83 c4 10             	add    $0x10,%esp
 44f:	31 ff                	xor    %edi,%edi
 451:	e9 66 ff ff ff       	jmp    3bc <printf+0x38>
 456:	66 90                	xchg   %ax,%ax
 458:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 45b:	8b 10                	mov    (%eax),%edx
 45d:	83 c0 04             	add    $0x4,%eax
 460:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 463:	85 d2                	test   %edx,%edx
 465:	0f 84 81 00 00 00    	je     4ec <printf+0x168>
 46b:	8a 02                	mov    (%edx),%al
 46d:	84 c0                	test   %al,%al
 46f:	0f 84 80 00 00 00    	je     4f5 <printf+0x171>
 475:	8d 7d e7             	lea    -0x19(%ebp),%edi
 478:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 47b:	89 d3                	mov    %edx,%ebx
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	88 45 e7             	mov    %al,-0x19(%ebp)
 483:	50                   	push   %eax
 484:	6a 01                	push   $0x1
 486:	57                   	push   %edi
 487:	56                   	push   %esi
 488:	e8 ba fd ff ff       	call   247 <write>
 48d:	43                   	inc    %ebx
 48e:	8a 03                	mov    (%ebx),%al
 490:	83 c4 10             	add    $0x10,%esp
 493:	84 c0                	test   %al,%al
 495:	75 e9                	jne    480 <printf+0xfc>
 497:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 49a:	31 ff                	xor    %edi,%edi
 49c:	e9 1b ff ff ff       	jmp    3bc <printf+0x38>
 4a1:	8d 76 00             	lea    0x0(%esi),%esi
 4a4:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4a7:	8b 17                	mov    (%edi),%edx
 4a9:	83 ec 0c             	sub    $0xc,%esp
 4ac:	6a 01                	push   $0x1
 4ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4b3:	eb 8a                	jmp    43f <printf+0xbb>
 4b5:	8d 76 00             	lea    0x0(%esi),%esi
 4b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4bb:	8b 00                	mov    (%eax),%eax
 4bd:	88 45 e7             	mov    %al,-0x19(%ebp)
 4c0:	51                   	push   %ecx
 4c1:	6a 01                	push   $0x1
 4c3:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4c6:	57                   	push   %edi
 4c7:	56                   	push   %esi
 4c8:	e8 7a fd ff ff       	call   247 <write>
 4cd:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	31 ff                	xor    %edi,%edi
 4d6:	e9 e1 fe ff ff       	jmp    3bc <printf+0x38>
 4db:	90                   	nop
 4dc:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4df:	52                   	push   %edx
 4e0:	6a 01                	push   $0x1
 4e2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4e5:	e9 35 ff ff ff       	jmp    41f <printf+0x9b>
 4ea:	66 90                	xchg   %ax,%ax
 4ec:	b0 28                	mov    $0x28,%al
 4ee:	ba d9 06 00 00       	mov    $0x6d9,%edx
 4f3:	eb 80                	jmp    475 <printf+0xf1>
 4f5:	31 ff                	xor    %edi,%edi
 4f7:	e9 c0 fe ff ff       	jmp    3bc <printf+0x38>

000004fc <free>:
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	57                   	push   %edi
 500:	56                   	push   %esi
 501:	53                   	push   %ebx
 502:	83 ec 0c             	sub    $0xc,%esp
 505:	8b 75 08             	mov    0x8(%ebp),%esi
 508:	8d 5e f8             	lea    -0x8(%esi),%ebx
 50b:	8b 7e fc             	mov    -0x4(%esi),%edi
 50e:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 515:	3d 00 80 00 00       	cmp    $0x8000,%eax
 51a:	75 70                	jne    58c <free+0x90>
 51c:	b9 00 80 00 00       	mov    $0x8000,%ecx
 521:	a1 a0 07 00 00       	mov    0x7a0,%eax
 526:	66 90                	xchg   %ax,%ax
 528:	89 c2                	mov    %eax,%edx
 52a:	8b 00                	mov    (%eax),%eax
 52c:	39 da                	cmp    %ebx,%edx
 52e:	73 2c                	jae    55c <free+0x60>
 530:	39 c3                	cmp    %eax,%ebx
 532:	72 04                	jb     538 <free+0x3c>
 534:	39 c2                	cmp    %eax,%edx
 536:	72 f0                	jb     528 <free+0x2c>
 538:	01 d9                	add    %ebx,%ecx
 53a:	39 c8                	cmp    %ecx,%eax
 53c:	74 2c                	je     56a <free+0x6e>
 53e:	89 46 f8             	mov    %eax,-0x8(%esi)
 541:	8b 42 04             	mov    0x4(%edx),%eax
 544:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 547:	39 cb                	cmp    %ecx,%ebx
 549:	74 36                	je     581 <free+0x85>
 54b:	89 1a                	mov    %ebx,(%edx)
 54d:	89 15 a0 07 00 00    	mov    %edx,0x7a0
 553:	8d 65 f4             	lea    -0xc(%ebp),%esp
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    
 55b:	90                   	nop
 55c:	39 c2                	cmp    %eax,%edx
 55e:	72 c8                	jb     528 <free+0x2c>
 560:	39 c3                	cmp    %eax,%ebx
 562:	73 c4                	jae    528 <free+0x2c>
 564:	01 d9                	add    %ebx,%ecx
 566:	39 c8                	cmp    %ecx,%eax
 568:	75 d4                	jne    53e <free+0x42>
 56a:	03 78 04             	add    0x4(%eax),%edi
 56d:	89 7e fc             	mov    %edi,-0x4(%esi)
 570:	8b 02                	mov    (%edx),%eax
 572:	8b 00                	mov    (%eax),%eax
 574:	89 46 f8             	mov    %eax,-0x8(%esi)
 577:	8b 42 04             	mov    0x4(%edx),%eax
 57a:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 57d:	39 cb                	cmp    %ecx,%ebx
 57f:	75 ca                	jne    54b <free+0x4f>
 581:	03 46 fc             	add    -0x4(%esi),%eax
 584:	89 42 04             	mov    %eax,0x4(%edx)
 587:	8b 5e f8             	mov    -0x8(%esi),%ebx
 58a:	eb bf                	jmp    54b <free+0x4f>
 58c:	83 ec 0c             	sub    $0xc,%esp
 58f:	f7 d8                	neg    %eax
 591:	50                   	push   %eax
 592:	e8 50 fd ff ff       	call   2e7 <increase_mem_usage>
 597:	8b 7e fc             	mov    -0x4(%esi),%edi
 59a:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 5a1:	83 c4 10             	add    $0x10,%esp
 5a4:	e9 78 ff ff ff       	jmp    521 <free+0x25>
 5a9:	8d 76 00             	lea    0x0(%esi),%esi

000005ac <malloc>:
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	57                   	push   %edi
 5b0:	56                   	push   %esi
 5b1:	53                   	push   %ebx
 5b2:	83 ec 0c             	sub    $0xc,%esp
 5b5:	8b 7d 08             	mov    0x8(%ebp),%edi
 5b8:	e8 1a fd ff ff       	call   2d7 <get_mem_limit>
 5bd:	89 c3                	mov    %eax,%ebx
 5bf:	e8 2b fd ff ff       	call   2ef <get_mem_usage>
 5c4:	83 fb ff             	cmp    $0xffffffff,%ebx
 5c7:	74 0b                	je     5d4 <malloc+0x28>
 5c9:	8d 14 38             	lea    (%eax,%edi,1),%edx
 5cc:	39 d3                	cmp    %edx,%ebx
 5ce:	0f 82 e2 00 00 00    	jb     6b6 <malloc+0x10a>
 5d4:	83 ec 0c             	sub    $0xc,%esp
 5d7:	57                   	push   %edi
 5d8:	e8 0a fd ff ff       	call   2e7 <increase_mem_usage>
 5dd:	83 c7 07             	add    $0x7,%edi
 5e0:	c1 ef 03             	shr    $0x3,%edi
 5e3:	47                   	inc    %edi
 5e4:	8b 15 a0 07 00 00    	mov    0x7a0,%edx
 5ea:	83 c4 10             	add    $0x10,%esp
 5ed:	85 d2                	test   %edx,%edx
 5ef:	0f 84 93 00 00 00    	je     688 <malloc+0xdc>
 5f5:	8b 02                	mov    (%edx),%eax
 5f7:	8b 48 04             	mov    0x4(%eax),%ecx
 5fa:	39 f9                	cmp    %edi,%ecx
 5fc:	73 62                	jae    660 <malloc+0xb4>
 5fe:	89 fb                	mov    %edi,%ebx
 600:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 606:	72 78                	jb     680 <malloc+0xd4>
 608:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 60f:	eb 0e                	jmp    61f <malloc+0x73>
 611:	8d 76 00             	lea    0x0(%esi),%esi
 614:	89 c2                	mov    %eax,%edx
 616:	8b 02                	mov    (%edx),%eax
 618:	8b 48 04             	mov    0x4(%eax),%ecx
 61b:	39 f9                	cmp    %edi,%ecx
 61d:	73 41                	jae    660 <malloc+0xb4>
 61f:	39 05 a0 07 00 00    	cmp    %eax,0x7a0
 625:	75 ed                	jne    614 <malloc+0x68>
 627:	83 ec 0c             	sub    $0xc,%esp
 62a:	56                   	push   %esi
 62b:	e8 7f fc ff ff       	call   2af <sbrk>
 630:	83 c4 10             	add    $0x10,%esp
 633:	83 f8 ff             	cmp    $0xffffffff,%eax
 636:	74 1c                	je     654 <malloc+0xa8>
 638:	89 58 04             	mov    %ebx,0x4(%eax)
 63b:	83 ec 0c             	sub    $0xc,%esp
 63e:	83 c0 08             	add    $0x8,%eax
 641:	50                   	push   %eax
 642:	e8 b5 fe ff ff       	call   4fc <free>
 647:	8b 15 a0 07 00 00    	mov    0x7a0,%edx
 64d:	83 c4 10             	add    $0x10,%esp
 650:	85 d2                	test   %edx,%edx
 652:	75 c2                	jne    616 <malloc+0x6a>
 654:	31 c0                	xor    %eax,%eax
 656:	8d 65 f4             	lea    -0xc(%ebp),%esp
 659:	5b                   	pop    %ebx
 65a:	5e                   	pop    %esi
 65b:	5f                   	pop    %edi
 65c:	5d                   	pop    %ebp
 65d:	c3                   	ret    
 65e:	66 90                	xchg   %ax,%ax
 660:	39 cf                	cmp    %ecx,%edi
 662:	74 4c                	je     6b0 <malloc+0x104>
 664:	29 f9                	sub    %edi,%ecx
 666:	89 48 04             	mov    %ecx,0x4(%eax)
 669:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 66c:	89 78 04             	mov    %edi,0x4(%eax)
 66f:	89 15 a0 07 00 00    	mov    %edx,0x7a0
 675:	83 c0 08             	add    $0x8,%eax
 678:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67b:	5b                   	pop    %ebx
 67c:	5e                   	pop    %esi
 67d:	5f                   	pop    %edi
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    
 680:	bb 00 10 00 00       	mov    $0x1000,%ebx
 685:	eb 81                	jmp    608 <malloc+0x5c>
 687:	90                   	nop
 688:	c7 05 a0 07 00 00 a4 	movl   $0x7a4,0x7a0
 68f:	07 00 00 
 692:	c7 05 a4 07 00 00 a4 	movl   $0x7a4,0x7a4
 699:	07 00 00 
 69c:	c7 05 a8 07 00 00 00 	movl   $0x0,0x7a8
 6a3:	00 00 00 
 6a6:	b8 a4 07 00 00       	mov    $0x7a4,%eax
 6ab:	e9 4e ff ff ff       	jmp    5fe <malloc+0x52>
 6b0:	8b 08                	mov    (%eax),%ecx
 6b2:	89 0a                	mov    %ecx,(%edx)
 6b4:	eb b9                	jmp    66f <malloc+0xc3>
 6b6:	83 ec 0c             	sub    $0xc,%esp
 6b9:	57                   	push   %edi
 6ba:	50                   	push   %eax
 6bb:	53                   	push   %ebx
 6bc:	68 4c 07 00 00       	push   $0x74c
 6c1:	6a 02                	push   $0x2
 6c3:	e8 bc fc ff ff       	call   384 <printf>
 6c8:	83 c4 20             	add    $0x20,%esp
 6cb:	31 c0                	xor    %eax,%eax
 6cd:	eb 87                	jmp    656 <malloc+0xaa>
