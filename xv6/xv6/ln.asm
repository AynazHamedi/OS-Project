
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 13                	je     2a <main+0x2a>
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 c8 06 00 00       	push   $0x6c8
  1e:	6a 02                	push   $0x2
  20:	e8 57 03 00 00       	call   37c <printf>
  25:	e8 f5 01 00 00       	call   21f <exit>
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	pushl  0x8(%ebx)
  2f:	ff 73 04             	pushl  0x4(%ebx)
  32:	e8 48 02 00 00       	call   27f <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
  3e:	e8 dc 01 00 00       	call   21f <exit>
  43:	ff 73 08             	pushl  0x8(%ebx)
  46:	ff 73 04             	pushl  0x4(%ebx)
  49:	68 db 06 00 00       	push   $0x6db
  4e:	6a 02                	push   $0x2
  50:	e8 27 03 00 00       	call   37c <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax

0000005c <strcpy>:
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	53                   	push   %ebx
  60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  63:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  66:	31 c0                	xor    %eax,%eax
  68:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  6b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6e:	40                   	inc    %eax
  6f:	84 d2                	test   %dl,%dl
  71:	75 f5                	jne    68 <strcpy+0xc>
  73:	89 c8                	mov    %ecx,%eax
  75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  78:	c9                   	leave  
  79:	c3                   	ret    
  7a:	66 90                	xchg   %ax,%ax

0000007c <strcmp>:
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	53                   	push   %ebx
  80:	8b 55 08             	mov    0x8(%ebp),%edx
  83:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  86:	0f b6 02             	movzbl (%edx),%eax
  89:	84 c0                	test   %al,%al
  8b:	75 10                	jne    9d <strcmp+0x21>
  8d:	eb 2a                	jmp    b9 <strcmp+0x3d>
  8f:	90                   	nop
  90:	42                   	inc    %edx
  91:	8d 4b 01             	lea    0x1(%ebx),%ecx
  94:	0f b6 02             	movzbl (%edx),%eax
  97:	84 c0                	test   %al,%al
  99:	74 11                	je     ac <strcmp+0x30>
  9b:	89 cb                	mov    %ecx,%ebx
  9d:	0f b6 0b             	movzbl (%ebx),%ecx
  a0:	38 c1                	cmp    %al,%cl
  a2:	74 ec                	je     90 <strcmp+0x14>
  a4:	29 c8                	sub    %ecx,%eax
  a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a9:	c9                   	leave  
  aa:	c3                   	ret    
  ab:	90                   	nop
  ac:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  b0:	31 c0                	xor    %eax,%eax
  b2:	29 c8                	sub    %ecx,%eax
  b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b7:	c9                   	leave  
  b8:	c3                   	ret    
  b9:	0f b6 0b             	movzbl (%ebx),%ecx
  bc:	31 c0                	xor    %eax,%eax
  be:	eb e4                	jmp    a4 <strcmp+0x28>

000000c0 <strlen>:
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	40                   	inc    %eax
  d1:	89 c1                	mov    %eax,%ecx
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	75 f7                	jne    d0 <strlen+0x10>
  d9:	89 c8                	mov    %ecx,%eax
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	31 c9                	xor    %ecx,%ecx
  e2:	89 c8                	mov    %ecx,%eax
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    
  e6:	66 90                	xchg   %ax,%ax

000000e8 <memset>:
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  eb:	57                   	push   %edi
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	fc                   	cld    
  f6:	f3 aa                	rep stos %al,%es:(%edi)
  f8:	8b 45 08             	mov    0x8(%ebp),%eax
  fb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  fe:	c9                   	leave  
  ff:	c3                   	ret    

00000100 <strchr>:
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8a 4d 0c             	mov    0xc(%ebp),%cl
 109:	8a 10                	mov    (%eax),%dl
 10b:	84 d2                	test   %dl,%dl
 10d:	75 0c                	jne    11b <strchr+0x1b>
 10f:	eb 13                	jmp    124 <strchr+0x24>
 111:	8d 76 00             	lea    0x0(%esi),%esi
 114:	40                   	inc    %eax
 115:	8a 10                	mov    (%eax),%dl
 117:	84 d2                	test   %dl,%dl
 119:	74 09                	je     124 <strchr+0x24>
 11b:	38 d1                	cmp    %dl,%cl
 11d:	75 f5                	jne    114 <strchr+0x14>
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	8d 76 00             	lea    0x0(%esi),%esi
 124:	31 c0                	xor    %eax,%eax
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    

00000128 <gets>:
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	57                   	push   %edi
 12c:	56                   	push   %esi
 12d:	53                   	push   %ebx
 12e:	83 ec 1c             	sub    $0x1c,%esp
 131:	31 db                	xor    %ebx,%ebx
 133:	8d 75 e7             	lea    -0x19(%ebp),%esi
 136:	eb 24                	jmp    15c <gets+0x34>
 138:	50                   	push   %eax
 139:	6a 01                	push   $0x1
 13b:	56                   	push   %esi
 13c:	6a 00                	push   $0x0
 13e:	e8 f4 00 00 00       	call   237 <read>
 143:	83 c4 10             	add    $0x10,%esp
 146:	85 c0                	test   %eax,%eax
 148:	7e 1a                	jle    164 <gets+0x3c>
 14a:	8a 45 e7             	mov    -0x19(%ebp),%al
 14d:	8b 55 08             	mov    0x8(%ebp),%edx
 150:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 154:	3c 0a                	cmp    $0xa,%al
 156:	74 0e                	je     166 <gets+0x3e>
 158:	3c 0d                	cmp    $0xd,%al
 15a:	74 0a                	je     166 <gets+0x3e>
 15c:	89 df                	mov    %ebx,%edi
 15e:	43                   	inc    %ebx
 15f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 162:	7c d4                	jl     138 <gets+0x10>
 164:	89 fb                	mov    %edi,%ebx
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 16d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 170:	5b                   	pop    %ebx
 171:	5e                   	pop    %esi
 172:	5f                   	pop    %edi
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi

00000178 <stat>:
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	56                   	push   %esi
 17c:	53                   	push   %ebx
 17d:	83 ec 08             	sub    $0x8,%esp
 180:	6a 00                	push   $0x0
 182:	ff 75 08             	pushl  0x8(%ebp)
 185:	e8 d5 00 00 00       	call   25f <open>
 18a:	83 c4 10             	add    $0x10,%esp
 18d:	85 c0                	test   %eax,%eax
 18f:	78 27                	js     1b8 <stat+0x40>
 191:	89 c3                	mov    %eax,%ebx
 193:	83 ec 08             	sub    $0x8,%esp
 196:	ff 75 0c             	pushl  0xc(%ebp)
 199:	50                   	push   %eax
 19a:	e8 d8 00 00 00       	call   277 <fstat>
 19f:	89 c6                	mov    %eax,%esi
 1a1:	89 1c 24             	mov    %ebx,(%esp)
 1a4:	e8 9e 00 00 00       	call   247 <close>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	89 f0                	mov    %esi,%eax
 1ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5e                   	pop    %esi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
 1b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1bd:	eb ed                	jmp    1ac <stat+0x34>
 1bf:	90                   	nop

000001c0 <atoi>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c7:	0f be 01             	movsbl (%ecx),%eax
 1ca:	8d 50 d0             	lea    -0x30(%eax),%edx
 1cd:	80 fa 09             	cmp    $0x9,%dl
 1d0:	ba 00 00 00 00       	mov    $0x0,%edx
 1d5:	77 16                	ja     1ed <atoi+0x2d>
 1d7:	90                   	nop
 1d8:	41                   	inc    %ecx
 1d9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1dc:	01 d2                	add    %edx,%edx
 1de:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1e2:	0f be 01             	movsbl (%ecx),%eax
 1e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e8:	80 fb 09             	cmp    $0x9,%bl
 1eb:	76 eb                	jbe    1d8 <atoi+0x18>
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <memmove>:
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	56                   	push   %esi
 1f9:	8b 55 08             	mov    0x8(%ebp),%edx
 1fc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1ff:	8b 45 10             	mov    0x10(%ebp),%eax
 202:	85 c0                	test   %eax,%eax
 204:	7e 0b                	jle    211 <memmove+0x1d>
 206:	01 d0                	add    %edx,%eax
 208:	89 d7                	mov    %edx,%edi
 20a:	66 90                	xchg   %ax,%ax
 20c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 20d:	39 f8                	cmp    %edi,%eax
 20f:	75 fb                	jne    20c <memmove+0x18>
 211:	89 d0                	mov    %edx,%eax
 213:	5e                   	pop    %esi
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <fork>:
 217:	b8 01 00 00 00       	mov    $0x1,%eax
 21c:	cd 40                	int    $0x40
 21e:	c3                   	ret    

0000021f <exit>:
 21f:	b8 02 00 00 00       	mov    $0x2,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <wait>:
 227:	b8 03 00 00 00       	mov    $0x3,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <pipe>:
 22f:	b8 04 00 00 00       	mov    $0x4,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <read>:
 237:	b8 05 00 00 00       	mov    $0x5,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <write>:
 23f:	b8 10 00 00 00       	mov    $0x10,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <close>:
 247:	b8 15 00 00 00       	mov    $0x15,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <kill>:
 24f:	b8 06 00 00 00       	mov    $0x6,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <exec>:
 257:	b8 07 00 00 00       	mov    $0x7,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <open>:
 25f:	b8 0f 00 00 00       	mov    $0xf,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <mknod>:
 267:	b8 11 00 00 00       	mov    $0x11,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <unlink>:
 26f:	b8 12 00 00 00       	mov    $0x12,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <fstat>:
 277:	b8 08 00 00 00       	mov    $0x8,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <link>:
 27f:	b8 13 00 00 00       	mov    $0x13,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <mkdir>:
 287:	b8 14 00 00 00       	mov    $0x14,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <chdir>:
 28f:	b8 09 00 00 00       	mov    $0x9,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <dup>:
 297:	b8 0a 00 00 00       	mov    $0xa,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <getpid>:
 29f:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <sbrk>:
 2a7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <sleep>:
 2af:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <uptime>:
 2b7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <cpu_limit>:
 2bf:	b8 16 00 00 00       	mov    $0x16,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <set_mem_limit>:
 2c7:	b8 17 00 00 00       	mov    $0x17,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <get_mem_limit>:
 2cf:	b8 18 00 00 00       	mov    $0x18,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <increase_mem_limit>:
 2d7:	b8 19 00 00 00       	mov    $0x19,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <increase_mem_usage>:
 2df:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <get_mem_usage>:
 2e7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    
 2ef:	90                   	nop

000002f0 <printint>:
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	53                   	push   %ebx
 2f6:	83 ec 3c             	sub    $0x3c,%esp
 2f9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2fc:	89 cb                	mov    %ecx,%ebx
 2fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
 301:	85 c9                	test   %ecx,%ecx
 303:	74 04                	je     309 <printint+0x19>
 305:	85 d2                	test   %edx,%edx
 307:	78 6b                	js     374 <printint+0x84>
 309:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 30c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 313:	31 c9                	xor    %ecx,%ecx
 315:	8d 75 d7             	lea    -0x29(%ebp),%esi
 318:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 31b:	31 d2                	xor    %edx,%edx
 31d:	f7 f3                	div    %ebx
 31f:	89 cf                	mov    %ecx,%edi
 321:	8d 49 01             	lea    0x1(%ecx),%ecx
 324:	8a 92 50 07 00 00    	mov    0x750(%edx),%dl
 32a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 32e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 331:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 334:	39 da                	cmp    %ebx,%edx
 336:	73 e0                	jae    318 <printint+0x28>
 338:	8b 55 08             	mov    0x8(%ebp),%edx
 33b:	85 d2                	test   %edx,%edx
 33d:	74 07                	je     346 <printint+0x56>
 33f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 344:	89 cf                	mov    %ecx,%edi
 346:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 349:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
 350:	8a 07                	mov    (%edi),%al
 352:	88 45 d7             	mov    %al,-0x29(%ebp)
 355:	50                   	push   %eax
 356:	6a 01                	push   $0x1
 358:	56                   	push   %esi
 359:	ff 75 c0             	pushl  -0x40(%ebp)
 35c:	e8 de fe ff ff       	call   23f <write>
 361:	89 f8                	mov    %edi,%eax
 363:	4f                   	dec    %edi
 364:	83 c4 10             	add    $0x10,%esp
 367:	39 d8                	cmp    %ebx,%eax
 369:	75 e5                	jne    350 <printint+0x60>
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	90                   	nop
 374:	f7 da                	neg    %edx
 376:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 379:	eb 98                	jmp    313 <printint+0x23>
 37b:	90                   	nop

0000037c <printf>:
 37c:	55                   	push   %ebp
 37d:	89 e5                	mov    %esp,%ebp
 37f:	57                   	push   %edi
 380:	56                   	push   %esi
 381:	53                   	push   %ebx
 382:	83 ec 2c             	sub    $0x2c,%esp
 385:	8b 75 08             	mov    0x8(%ebp),%esi
 388:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 38b:	8a 13                	mov    (%ebx),%dl
 38d:	84 d2                	test   %dl,%dl
 38f:	74 5c                	je     3ed <printf+0x71>
 391:	43                   	inc    %ebx
 392:	8d 45 10             	lea    0x10(%ebp),%eax
 395:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 398:	31 ff                	xor    %edi,%edi
 39a:	eb 20                	jmp    3bc <printf+0x40>
 39c:	83 f8 25             	cmp    $0x25,%eax
 39f:	74 3f                	je     3e0 <printf+0x64>
 3a1:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3a4:	50                   	push   %eax
 3a5:	6a 01                	push   $0x1
 3a7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3aa:	50                   	push   %eax
 3ab:	56                   	push   %esi
 3ac:	e8 8e fe ff ff       	call   23f <write>
 3b1:	83 c4 10             	add    $0x10,%esp
 3b4:	43                   	inc    %ebx
 3b5:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3b8:	84 d2                	test   %dl,%dl
 3ba:	74 31                	je     3ed <printf+0x71>
 3bc:	0f b6 c2             	movzbl %dl,%eax
 3bf:	85 ff                	test   %edi,%edi
 3c1:	74 d9                	je     39c <printf+0x20>
 3c3:	83 ff 25             	cmp    $0x25,%edi
 3c6:	75 ec                	jne    3b4 <printf+0x38>
 3c8:	83 f8 25             	cmp    $0x25,%eax
 3cb:	0f 84 03 01 00 00    	je     4d4 <printf+0x158>
 3d1:	83 e8 63             	sub    $0x63,%eax
 3d4:	83 f8 15             	cmp    $0x15,%eax
 3d7:	77 1f                	ja     3f8 <printf+0x7c>
 3d9:	ff 24 85 f8 06 00 00 	jmp    *0x6f8(,%eax,4)
 3e0:	bf 25 00 00 00       	mov    $0x25,%edi
 3e5:	43                   	inc    %ebx
 3e6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3e9:	84 d2                	test   %dl,%dl
 3eb:	75 cf                	jne    3bc <printf+0x40>
 3ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f0:	5b                   	pop    %ebx
 3f1:	5e                   	pop    %esi
 3f2:	5f                   	pop    %edi
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    
 3f5:	8d 76 00             	lea    0x0(%esi),%esi
 3f8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3fb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3ff:	50                   	push   %eax
 400:	6a 01                	push   $0x1
 402:	8d 7d e7             	lea    -0x19(%ebp),%edi
 405:	57                   	push   %edi
 406:	56                   	push   %esi
 407:	e8 33 fe ff ff       	call   23f <write>
 40c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 40f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 412:	83 c4 0c             	add    $0xc,%esp
 415:	6a 01                	push   $0x1
 417:	57                   	push   %edi
 418:	56                   	push   %esi
 419:	e8 21 fe ff ff       	call   23f <write>
 41e:	83 c4 10             	add    $0x10,%esp
 421:	31 ff                	xor    %edi,%edi
 423:	eb 8f                	jmp    3b4 <printf+0x38>
 425:	8d 76 00             	lea    0x0(%esi),%esi
 428:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 42b:	8b 17                	mov    (%edi),%edx
 42d:	83 ec 0c             	sub    $0xc,%esp
 430:	6a 00                	push   $0x0
 432:	b9 10 00 00 00       	mov    $0x10,%ecx
 437:	89 f0                	mov    %esi,%eax
 439:	e8 b2 fe ff ff       	call   2f0 <printint>
 43e:	83 c7 04             	add    $0x4,%edi
 441:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 444:	83 c4 10             	add    $0x10,%esp
 447:	31 ff                	xor    %edi,%edi
 449:	e9 66 ff ff ff       	jmp    3b4 <printf+0x38>
 44e:	66 90                	xchg   %ax,%ax
 450:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 453:	8b 10                	mov    (%eax),%edx
 455:	83 c0 04             	add    $0x4,%eax
 458:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 45b:	85 d2                	test   %edx,%edx
 45d:	0f 84 81 00 00 00    	je     4e4 <printf+0x168>
 463:	8a 02                	mov    (%edx),%al
 465:	84 c0                	test   %al,%al
 467:	0f 84 80 00 00 00    	je     4ed <printf+0x171>
 46d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 470:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 473:	89 d3                	mov    %edx,%ebx
 475:	8d 76 00             	lea    0x0(%esi),%esi
 478:	88 45 e7             	mov    %al,-0x19(%ebp)
 47b:	50                   	push   %eax
 47c:	6a 01                	push   $0x1
 47e:	57                   	push   %edi
 47f:	56                   	push   %esi
 480:	e8 ba fd ff ff       	call   23f <write>
 485:	43                   	inc    %ebx
 486:	8a 03                	mov    (%ebx),%al
 488:	83 c4 10             	add    $0x10,%esp
 48b:	84 c0                	test   %al,%al
 48d:	75 e9                	jne    478 <printf+0xfc>
 48f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 492:	31 ff                	xor    %edi,%edi
 494:	e9 1b ff ff ff       	jmp    3b4 <printf+0x38>
 499:	8d 76 00             	lea    0x0(%esi),%esi
 49c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 49f:	8b 17                	mov    (%edi),%edx
 4a1:	83 ec 0c             	sub    $0xc,%esp
 4a4:	6a 01                	push   $0x1
 4a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ab:	eb 8a                	jmp    437 <printf+0xbb>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4b3:	8b 00                	mov    (%eax),%eax
 4b5:	88 45 e7             	mov    %al,-0x19(%ebp)
 4b8:	51                   	push   %ecx
 4b9:	6a 01                	push   $0x1
 4bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4be:	57                   	push   %edi
 4bf:	56                   	push   %esi
 4c0:	e8 7a fd ff ff       	call   23f <write>
 4c5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4c9:	83 c4 10             	add    $0x10,%esp
 4cc:	31 ff                	xor    %edi,%edi
 4ce:	e9 e1 fe ff ff       	jmp    3b4 <printf+0x38>
 4d3:	90                   	nop
 4d4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d7:	52                   	push   %edx
 4d8:	6a 01                	push   $0x1
 4da:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4dd:	e9 35 ff ff ff       	jmp    417 <printf+0x9b>
 4e2:	66 90                	xchg   %ax,%ax
 4e4:	b0 28                	mov    $0x28,%al
 4e6:	ba ef 06 00 00       	mov    $0x6ef,%edx
 4eb:	eb 80                	jmp    46d <printf+0xf1>
 4ed:	31 ff                	xor    %edi,%edi
 4ef:	e9 c0 fe ff ff       	jmp    3b4 <printf+0x38>

000004f4 <free>:
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	57                   	push   %edi
 4f8:	56                   	push   %esi
 4f9:	53                   	push   %ebx
 4fa:	83 ec 0c             	sub    $0xc,%esp
 4fd:	8b 75 08             	mov    0x8(%ebp),%esi
 500:	8d 5e f8             	lea    -0x8(%esi),%ebx
 503:	8b 7e fc             	mov    -0x4(%esi),%edi
 506:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 50d:	3d 00 80 00 00       	cmp    $0x8000,%eax
 512:	75 70                	jne    584 <free+0x90>
 514:	b9 00 80 00 00       	mov    $0x8000,%ecx
 519:	a1 b8 07 00 00       	mov    0x7b8,%eax
 51e:	66 90                	xchg   %ax,%ax
 520:	89 c2                	mov    %eax,%edx
 522:	8b 00                	mov    (%eax),%eax
 524:	39 da                	cmp    %ebx,%edx
 526:	73 2c                	jae    554 <free+0x60>
 528:	39 c3                	cmp    %eax,%ebx
 52a:	72 04                	jb     530 <free+0x3c>
 52c:	39 c2                	cmp    %eax,%edx
 52e:	72 f0                	jb     520 <free+0x2c>
 530:	01 d9                	add    %ebx,%ecx
 532:	39 c8                	cmp    %ecx,%eax
 534:	74 2c                	je     562 <free+0x6e>
 536:	89 46 f8             	mov    %eax,-0x8(%esi)
 539:	8b 42 04             	mov    0x4(%edx),%eax
 53c:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 53f:	39 cb                	cmp    %ecx,%ebx
 541:	74 36                	je     579 <free+0x85>
 543:	89 1a                	mov    %ebx,(%edx)
 545:	89 15 b8 07 00 00    	mov    %edx,0x7b8
 54b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5f                   	pop    %edi
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    
 553:	90                   	nop
 554:	39 c2                	cmp    %eax,%edx
 556:	72 c8                	jb     520 <free+0x2c>
 558:	39 c3                	cmp    %eax,%ebx
 55a:	73 c4                	jae    520 <free+0x2c>
 55c:	01 d9                	add    %ebx,%ecx
 55e:	39 c8                	cmp    %ecx,%eax
 560:	75 d4                	jne    536 <free+0x42>
 562:	03 78 04             	add    0x4(%eax),%edi
 565:	89 7e fc             	mov    %edi,-0x4(%esi)
 568:	8b 02                	mov    (%edx),%eax
 56a:	8b 00                	mov    (%eax),%eax
 56c:	89 46 f8             	mov    %eax,-0x8(%esi)
 56f:	8b 42 04             	mov    0x4(%edx),%eax
 572:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 575:	39 cb                	cmp    %ecx,%ebx
 577:	75 ca                	jne    543 <free+0x4f>
 579:	03 46 fc             	add    -0x4(%esi),%eax
 57c:	89 42 04             	mov    %eax,0x4(%edx)
 57f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 582:	eb bf                	jmp    543 <free+0x4f>
 584:	83 ec 0c             	sub    $0xc,%esp
 587:	f7 d8                	neg    %eax
 589:	50                   	push   %eax
 58a:	e8 50 fd ff ff       	call   2df <increase_mem_usage>
 58f:	8b 7e fc             	mov    -0x4(%esi),%edi
 592:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 599:	83 c4 10             	add    $0x10,%esp
 59c:	e9 78 ff ff ff       	jmp    519 <free+0x25>
 5a1:	8d 76 00             	lea    0x0(%esi),%esi

000005a4 <malloc>:
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	57                   	push   %edi
 5a8:	56                   	push   %esi
 5a9:	53                   	push   %ebx
 5aa:	83 ec 0c             	sub    $0xc,%esp
 5ad:	8b 7d 08             	mov    0x8(%ebp),%edi
 5b0:	e8 1a fd ff ff       	call   2cf <get_mem_limit>
 5b5:	89 c3                	mov    %eax,%ebx
 5b7:	e8 2b fd ff ff       	call   2e7 <get_mem_usage>
 5bc:	83 fb ff             	cmp    $0xffffffff,%ebx
 5bf:	74 0b                	je     5cc <malloc+0x28>
 5c1:	8d 14 38             	lea    (%eax,%edi,1),%edx
 5c4:	39 d3                	cmp    %edx,%ebx
 5c6:	0f 82 e2 00 00 00    	jb     6ae <malloc+0x10a>
 5cc:	83 ec 0c             	sub    $0xc,%esp
 5cf:	57                   	push   %edi
 5d0:	e8 0a fd ff ff       	call   2df <increase_mem_usage>
 5d5:	83 c7 07             	add    $0x7,%edi
 5d8:	c1 ef 03             	shr    $0x3,%edi
 5db:	47                   	inc    %edi
 5dc:	8b 15 b8 07 00 00    	mov    0x7b8,%edx
 5e2:	83 c4 10             	add    $0x10,%esp
 5e5:	85 d2                	test   %edx,%edx
 5e7:	0f 84 93 00 00 00    	je     680 <malloc+0xdc>
 5ed:	8b 02                	mov    (%edx),%eax
 5ef:	8b 48 04             	mov    0x4(%eax),%ecx
 5f2:	39 f9                	cmp    %edi,%ecx
 5f4:	73 62                	jae    658 <malloc+0xb4>
 5f6:	89 fb                	mov    %edi,%ebx
 5f8:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 5fe:	72 78                	jb     678 <malloc+0xd4>
 600:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 607:	eb 0e                	jmp    617 <malloc+0x73>
 609:	8d 76 00             	lea    0x0(%esi),%esi
 60c:	89 c2                	mov    %eax,%edx
 60e:	8b 02                	mov    (%edx),%eax
 610:	8b 48 04             	mov    0x4(%eax),%ecx
 613:	39 f9                	cmp    %edi,%ecx
 615:	73 41                	jae    658 <malloc+0xb4>
 617:	39 05 b8 07 00 00    	cmp    %eax,0x7b8
 61d:	75 ed                	jne    60c <malloc+0x68>
 61f:	83 ec 0c             	sub    $0xc,%esp
 622:	56                   	push   %esi
 623:	e8 7f fc ff ff       	call   2a7 <sbrk>
 628:	83 c4 10             	add    $0x10,%esp
 62b:	83 f8 ff             	cmp    $0xffffffff,%eax
 62e:	74 1c                	je     64c <malloc+0xa8>
 630:	89 58 04             	mov    %ebx,0x4(%eax)
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	83 c0 08             	add    $0x8,%eax
 639:	50                   	push   %eax
 63a:	e8 b5 fe ff ff       	call   4f4 <free>
 63f:	8b 15 b8 07 00 00    	mov    0x7b8,%edx
 645:	83 c4 10             	add    $0x10,%esp
 648:	85 d2                	test   %edx,%edx
 64a:	75 c2                	jne    60e <malloc+0x6a>
 64c:	31 c0                	xor    %eax,%eax
 64e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 651:	5b                   	pop    %ebx
 652:	5e                   	pop    %esi
 653:	5f                   	pop    %edi
 654:	5d                   	pop    %ebp
 655:	c3                   	ret    
 656:	66 90                	xchg   %ax,%ax
 658:	39 cf                	cmp    %ecx,%edi
 65a:	74 4c                	je     6a8 <malloc+0x104>
 65c:	29 f9                	sub    %edi,%ecx
 65e:	89 48 04             	mov    %ecx,0x4(%eax)
 661:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 664:	89 78 04             	mov    %edi,0x4(%eax)
 667:	89 15 b8 07 00 00    	mov    %edx,0x7b8
 66d:	83 c0 08             	add    $0x8,%eax
 670:	8d 65 f4             	lea    -0xc(%ebp),%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	bb 00 10 00 00       	mov    $0x1000,%ebx
 67d:	eb 81                	jmp    600 <malloc+0x5c>
 67f:	90                   	nop
 680:	c7 05 b8 07 00 00 bc 	movl   $0x7bc,0x7b8
 687:	07 00 00 
 68a:	c7 05 bc 07 00 00 bc 	movl   $0x7bc,0x7bc
 691:	07 00 00 
 694:	c7 05 c0 07 00 00 00 	movl   $0x0,0x7c0
 69b:	00 00 00 
 69e:	b8 bc 07 00 00       	mov    $0x7bc,%eax
 6a3:	e9 4e ff ff ff       	jmp    5f6 <malloc+0x52>
 6a8:	8b 08                	mov    (%eax),%ecx
 6aa:	89 0a                	mov    %ecx,(%edx)
 6ac:	eb b9                	jmp    667 <malloc+0xc3>
 6ae:	83 ec 0c             	sub    $0xc,%esp
 6b1:	57                   	push   %edi
 6b2:	50                   	push   %eax
 6b3:	53                   	push   %ebx
 6b4:	68 64 07 00 00       	push   $0x764
 6b9:	6a 02                	push   $0x2
 6bb:	e8 bc fc ff ff       	call   37c <printf>
 6c0:	83 c4 20             	add    $0x20,%esp
 6c3:	31 c0                	xor    %eax,%eax
 6c5:	eb 87                	jmp    64e <malloc+0xaa>
