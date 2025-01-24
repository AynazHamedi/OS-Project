
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	50                   	push   %eax
   f:	e8 d3 01 00 00       	call   1e7 <fork>
  14:	85 c0                	test   %eax,%eax
  16:	7e 0d                	jle    25 <main+0x25>
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	6a 05                	push   $0x5
  1d:	e8 5d 02 00 00       	call   27f <sleep>
  22:	83 c4 10             	add    $0x10,%esp
  25:	e8 c5 01 00 00       	call   1ef <exit>
  2a:	66 90                	xchg   %ax,%ax

0000002c <strcpy>:
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	53                   	push   %ebx
  30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  33:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  36:	31 c0                	xor    %eax,%eax
  38:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  3b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  3e:	40                   	inc    %eax
  3f:	84 d2                	test   %dl,%dl
  41:	75 f5                	jne    38 <strcpy+0xc>
  43:	89 c8                	mov    %ecx,%eax
  45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  48:	c9                   	leave  
  49:	c3                   	ret    
  4a:	66 90                	xchg   %ax,%ax

0000004c <strcmp>:
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	53                   	push   %ebx
  50:	8b 55 08             	mov    0x8(%ebp),%edx
  53:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  56:	0f b6 02             	movzbl (%edx),%eax
  59:	84 c0                	test   %al,%al
  5b:	75 10                	jne    6d <strcmp+0x21>
  5d:	eb 2a                	jmp    89 <strcmp+0x3d>
  5f:	90                   	nop
  60:	42                   	inc    %edx
  61:	8d 4b 01             	lea    0x1(%ebx),%ecx
  64:	0f b6 02             	movzbl (%edx),%eax
  67:	84 c0                	test   %al,%al
  69:	74 11                	je     7c <strcmp+0x30>
  6b:	89 cb                	mov    %ecx,%ebx
  6d:	0f b6 0b             	movzbl (%ebx),%ecx
  70:	38 c1                	cmp    %al,%cl
  72:	74 ec                	je     60 <strcmp+0x14>
  74:	29 c8                	sub    %ecx,%eax
  76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  79:	c9                   	leave  
  7a:	c3                   	ret    
  7b:	90                   	nop
  7c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  80:	31 c0                	xor    %eax,%eax
  82:	29 c8                	sub    %ecx,%eax
  84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  87:	c9                   	leave  
  88:	c3                   	ret    
  89:	0f b6 0b             	movzbl (%ebx),%ecx
  8c:	31 c0                	xor    %eax,%eax
  8e:	eb e4                	jmp    74 <strcmp+0x28>

00000090 <strlen>:
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 55 08             	mov    0x8(%ebp),%edx
  96:	80 3a 00             	cmpb   $0x0,(%edx)
  99:	74 15                	je     b0 <strlen+0x20>
  9b:	31 c0                	xor    %eax,%eax
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	40                   	inc    %eax
  a1:	89 c1                	mov    %eax,%ecx
  a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  a7:	75 f7                	jne    a0 <strlen+0x10>
  a9:	89 c8                	mov    %ecx,%eax
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  b0:	31 c9                	xor    %ecx,%ecx
  b2:	89 c8                	mov    %ecx,%eax
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    
  b6:	66 90                	xchg   %ax,%ax

000000b8 <memset>:
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  c5:	fc                   	cld    
  c6:	f3 aa                	rep stos %al,%es:(%edi)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ce:	c9                   	leave  
  cf:	c3                   	ret    

000000d0 <strchr>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	8a 4d 0c             	mov    0xc(%ebp),%cl
  d9:	8a 10                	mov    (%eax),%dl
  db:	84 d2                	test   %dl,%dl
  dd:	75 0c                	jne    eb <strchr+0x1b>
  df:	eb 13                	jmp    f4 <strchr+0x24>
  e1:	8d 76 00             	lea    0x0(%esi),%esi
  e4:	40                   	inc    %eax
  e5:	8a 10                	mov    (%eax),%dl
  e7:	84 d2                	test   %dl,%dl
  e9:	74 09                	je     f4 <strchr+0x24>
  eb:	38 d1                	cmp    %dl,%cl
  ed:	75 f5                	jne    e4 <strchr+0x14>
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    
  f1:	8d 76 00             	lea    0x0(%esi),%esi
  f4:	31 c0                	xor    %eax,%eax
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <gets>:
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	57                   	push   %edi
  fc:	56                   	push   %esi
  fd:	53                   	push   %ebx
  fe:	83 ec 1c             	sub    $0x1c,%esp
 101:	31 db                	xor    %ebx,%ebx
 103:	8d 75 e7             	lea    -0x19(%ebp),%esi
 106:	eb 24                	jmp    12c <gets+0x34>
 108:	50                   	push   %eax
 109:	6a 01                	push   $0x1
 10b:	56                   	push   %esi
 10c:	6a 00                	push   $0x0
 10e:	e8 f4 00 00 00       	call   207 <read>
 113:	83 c4 10             	add    $0x10,%esp
 116:	85 c0                	test   %eax,%eax
 118:	7e 1a                	jle    134 <gets+0x3c>
 11a:	8a 45 e7             	mov    -0x19(%ebp),%al
 11d:	8b 55 08             	mov    0x8(%ebp),%edx
 120:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 124:	3c 0a                	cmp    $0xa,%al
 126:	74 0e                	je     136 <gets+0x3e>
 128:	3c 0d                	cmp    $0xd,%al
 12a:	74 0a                	je     136 <gets+0x3e>
 12c:	89 df                	mov    %ebx,%edi
 12e:	43                   	inc    %ebx
 12f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 132:	7c d4                	jl     108 <gets+0x10>
 134:	89 fb                	mov    %edi,%ebx
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 13d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi

00000148 <stat>:
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	pushl  0x8(%ebp)
 155:	e8 d5 00 00 00       	call   22f <open>
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 27                	js     188 <stat+0x40>
 161:	89 c3                	mov    %eax,%ebx
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	pushl  0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 d8 00 00 00       	call   247 <fstat>
 16f:	89 c6                	mov    %eax,%esi
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 9e 00 00 00       	call   217 <close>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 76 00             	lea    0x0(%esi),%esi
 188:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18d:	eb ed                	jmp    17c <stat+0x34>
 18f:	90                   	nop

00000190 <atoi>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 4d 08             	mov    0x8(%ebp),%ecx
 197:	0f be 01             	movsbl (%ecx),%eax
 19a:	8d 50 d0             	lea    -0x30(%eax),%edx
 19d:	80 fa 09             	cmp    $0x9,%dl
 1a0:	ba 00 00 00 00       	mov    $0x0,%edx
 1a5:	77 16                	ja     1bd <atoi+0x2d>
 1a7:	90                   	nop
 1a8:	41                   	inc    %ecx
 1a9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1ac:	01 d2                	add    %edx,%edx
 1ae:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1b2:	0f be 01             	movsbl (%ecx),%eax
 1b5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b8:	80 fb 09             	cmp    $0x9,%bl
 1bb:	76 eb                	jbe    1a8 <atoi+0x18>
 1bd:	89 d0                	mov    %edx,%eax
 1bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c2:	c9                   	leave  
 1c3:	c3                   	ret    

000001c4 <memmove>:
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	56                   	push   %esi
 1c9:	8b 55 08             	mov    0x8(%ebp),%edx
 1cc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1cf:	8b 45 10             	mov    0x10(%ebp),%eax
 1d2:	85 c0                	test   %eax,%eax
 1d4:	7e 0b                	jle    1e1 <memmove+0x1d>
 1d6:	01 d0                	add    %edx,%eax
 1d8:	89 d7                	mov    %edx,%edi
 1da:	66 90                	xchg   %ax,%ax
 1dc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 1dd:	39 f8                	cmp    %edi,%eax
 1df:	75 fb                	jne    1dc <memmove+0x18>
 1e1:	89 d0                	mov    %edx,%eax
 1e3:	5e                   	pop    %esi
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <fork>:
 1e7:	b8 01 00 00 00       	mov    $0x1,%eax
 1ec:	cd 40                	int    $0x40
 1ee:	c3                   	ret    

000001ef <exit>:
 1ef:	b8 02 00 00 00       	mov    $0x2,%eax
 1f4:	cd 40                	int    $0x40
 1f6:	c3                   	ret    

000001f7 <wait>:
 1f7:	b8 03 00 00 00       	mov    $0x3,%eax
 1fc:	cd 40                	int    $0x40
 1fe:	c3                   	ret    

000001ff <pipe>:
 1ff:	b8 04 00 00 00       	mov    $0x4,%eax
 204:	cd 40                	int    $0x40
 206:	c3                   	ret    

00000207 <read>:
 207:	b8 05 00 00 00       	mov    $0x5,%eax
 20c:	cd 40                	int    $0x40
 20e:	c3                   	ret    

0000020f <write>:
 20f:	b8 10 00 00 00       	mov    $0x10,%eax
 214:	cd 40                	int    $0x40
 216:	c3                   	ret    

00000217 <close>:
 217:	b8 15 00 00 00       	mov    $0x15,%eax
 21c:	cd 40                	int    $0x40
 21e:	c3                   	ret    

0000021f <kill>:
 21f:	b8 06 00 00 00       	mov    $0x6,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <exec>:
 227:	b8 07 00 00 00       	mov    $0x7,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <open>:
 22f:	b8 0f 00 00 00       	mov    $0xf,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <mknod>:
 237:	b8 11 00 00 00       	mov    $0x11,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <unlink>:
 23f:	b8 12 00 00 00       	mov    $0x12,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <fstat>:
 247:	b8 08 00 00 00       	mov    $0x8,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <link>:
 24f:	b8 13 00 00 00       	mov    $0x13,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <mkdir>:
 257:	b8 14 00 00 00       	mov    $0x14,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <chdir>:
 25f:	b8 09 00 00 00       	mov    $0x9,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <dup>:
 267:	b8 0a 00 00 00       	mov    $0xa,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <getpid>:
 26f:	b8 0b 00 00 00       	mov    $0xb,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <sbrk>:
 277:	b8 0c 00 00 00       	mov    $0xc,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <sleep>:
 27f:	b8 0d 00 00 00       	mov    $0xd,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <uptime>:
 287:	b8 0e 00 00 00       	mov    $0xe,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <cpu_limit>:
 28f:	b8 16 00 00 00       	mov    $0x16,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <set_mem_limit>:
 297:	b8 17 00 00 00       	mov    $0x17,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <get_mem_limit>:
 29f:	b8 18 00 00 00       	mov    $0x18,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <increase_mem_limit>:
 2a7:	b8 19 00 00 00       	mov    $0x19,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <increase_mem_usage>:
 2af:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <get_mem_usage>:
 2b7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    
 2bf:	90                   	nop

000002c0 <printint>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
 2c6:	83 ec 3c             	sub    $0x3c,%esp
 2c9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2cc:	89 cb                	mov    %ecx,%ebx
 2ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d1:	85 c9                	test   %ecx,%ecx
 2d3:	74 04                	je     2d9 <printint+0x19>
 2d5:	85 d2                	test   %edx,%edx
 2d7:	78 6b                	js     344 <printint+0x84>
 2d9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2dc:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2e3:	31 c9                	xor    %ecx,%ecx
 2e5:	8d 75 d7             	lea    -0x29(%ebp),%esi
 2e8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2eb:	31 d2                	xor    %edx,%edx
 2ed:	f7 f3                	div    %ebx
 2ef:	89 cf                	mov    %ecx,%edi
 2f1:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f4:	8a 92 f8 06 00 00    	mov    0x6f8(%edx),%dl
 2fa:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 2fe:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 301:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 304:	39 da                	cmp    %ebx,%edx
 306:	73 e0                	jae    2e8 <printint+0x28>
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	85 d2                	test   %edx,%edx
 30d:	74 07                	je     316 <printint+0x56>
 30f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 314:	89 cf                	mov    %ecx,%edi
 316:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 319:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	8a 07                	mov    (%edi),%al
 322:	88 45 d7             	mov    %al,-0x29(%ebp)
 325:	50                   	push   %eax
 326:	6a 01                	push   $0x1
 328:	56                   	push   %esi
 329:	ff 75 c0             	pushl  -0x40(%ebp)
 32c:	e8 de fe ff ff       	call   20f <write>
 331:	89 f8                	mov    %edi,%eax
 333:	4f                   	dec    %edi
 334:	83 c4 10             	add    $0x10,%esp
 337:	39 d8                	cmp    %ebx,%eax
 339:	75 e5                	jne    320 <printint+0x60>
 33b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33e:	5b                   	pop    %ebx
 33f:	5e                   	pop    %esi
 340:	5f                   	pop    %edi
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	90                   	nop
 344:	f7 da                	neg    %edx
 346:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 349:	eb 98                	jmp    2e3 <printint+0x23>
 34b:	90                   	nop

0000034c <printf>:
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	57                   	push   %edi
 350:	56                   	push   %esi
 351:	53                   	push   %ebx
 352:	83 ec 2c             	sub    $0x2c,%esp
 355:	8b 75 08             	mov    0x8(%ebp),%esi
 358:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35b:	8a 13                	mov    (%ebx),%dl
 35d:	84 d2                	test   %dl,%dl
 35f:	74 5c                	je     3bd <printf+0x71>
 361:	43                   	inc    %ebx
 362:	8d 45 10             	lea    0x10(%ebp),%eax
 365:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 368:	31 ff                	xor    %edi,%edi
 36a:	eb 20                	jmp    38c <printf+0x40>
 36c:	83 f8 25             	cmp    $0x25,%eax
 36f:	74 3f                	je     3b0 <printf+0x64>
 371:	88 55 e7             	mov    %dl,-0x19(%ebp)
 374:	50                   	push   %eax
 375:	6a 01                	push   $0x1
 377:	8d 45 e7             	lea    -0x19(%ebp),%eax
 37a:	50                   	push   %eax
 37b:	56                   	push   %esi
 37c:	e8 8e fe ff ff       	call   20f <write>
 381:	83 c4 10             	add    $0x10,%esp
 384:	43                   	inc    %ebx
 385:	8a 53 ff             	mov    -0x1(%ebx),%dl
 388:	84 d2                	test   %dl,%dl
 38a:	74 31                	je     3bd <printf+0x71>
 38c:	0f b6 c2             	movzbl %dl,%eax
 38f:	85 ff                	test   %edi,%edi
 391:	74 d9                	je     36c <printf+0x20>
 393:	83 ff 25             	cmp    $0x25,%edi
 396:	75 ec                	jne    384 <printf+0x38>
 398:	83 f8 25             	cmp    $0x25,%eax
 39b:	0f 84 03 01 00 00    	je     4a4 <printf+0x158>
 3a1:	83 e8 63             	sub    $0x63,%eax
 3a4:	83 f8 15             	cmp    $0x15,%eax
 3a7:	77 1f                	ja     3c8 <printf+0x7c>
 3a9:	ff 24 85 a0 06 00 00 	jmp    *0x6a0(,%eax,4)
 3b0:	bf 25 00 00 00       	mov    $0x25,%edi
 3b5:	43                   	inc    %ebx
 3b6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3b9:	84 d2                	test   %dl,%dl
 3bb:	75 cf                	jne    38c <printf+0x40>
 3bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5f                   	pop    %edi
 3c3:	5d                   	pop    %ebp
 3c4:	c3                   	ret    
 3c5:	8d 76 00             	lea    0x0(%esi),%esi
 3c8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3cb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3cf:	50                   	push   %eax
 3d0:	6a 01                	push   $0x1
 3d2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3d5:	57                   	push   %edi
 3d6:	56                   	push   %esi
 3d7:	e8 33 fe ff ff       	call   20f <write>
 3dc:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3df:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	6a 01                	push   $0x1
 3e7:	57                   	push   %edi
 3e8:	56                   	push   %esi
 3e9:	e8 21 fe ff ff       	call   20f <write>
 3ee:	83 c4 10             	add    $0x10,%esp
 3f1:	31 ff                	xor    %edi,%edi
 3f3:	eb 8f                	jmp    384 <printf+0x38>
 3f5:	8d 76 00             	lea    0x0(%esi),%esi
 3f8:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3fb:	8b 17                	mov    (%edi),%edx
 3fd:	83 ec 0c             	sub    $0xc,%esp
 400:	6a 00                	push   $0x0
 402:	b9 10 00 00 00       	mov    $0x10,%ecx
 407:	89 f0                	mov    %esi,%eax
 409:	e8 b2 fe ff ff       	call   2c0 <printint>
 40e:	83 c7 04             	add    $0x4,%edi
 411:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 414:	83 c4 10             	add    $0x10,%esp
 417:	31 ff                	xor    %edi,%edi
 419:	e9 66 ff ff ff       	jmp    384 <printf+0x38>
 41e:	66 90                	xchg   %ax,%ax
 420:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 423:	8b 10                	mov    (%eax),%edx
 425:	83 c0 04             	add    $0x4,%eax
 428:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 42b:	85 d2                	test   %edx,%edx
 42d:	0f 84 81 00 00 00    	je     4b4 <printf+0x168>
 433:	8a 02                	mov    (%edx),%al
 435:	84 c0                	test   %al,%al
 437:	0f 84 80 00 00 00    	je     4bd <printf+0x171>
 43d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 440:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 443:	89 d3                	mov    %edx,%ebx
 445:	8d 76 00             	lea    0x0(%esi),%esi
 448:	88 45 e7             	mov    %al,-0x19(%ebp)
 44b:	50                   	push   %eax
 44c:	6a 01                	push   $0x1
 44e:	57                   	push   %edi
 44f:	56                   	push   %esi
 450:	e8 ba fd ff ff       	call   20f <write>
 455:	43                   	inc    %ebx
 456:	8a 03                	mov    (%ebx),%al
 458:	83 c4 10             	add    $0x10,%esp
 45b:	84 c0                	test   %al,%al
 45d:	75 e9                	jne    448 <printf+0xfc>
 45f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 462:	31 ff                	xor    %edi,%edi
 464:	e9 1b ff ff ff       	jmp    384 <printf+0x38>
 469:	8d 76 00             	lea    0x0(%esi),%esi
 46c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 46f:	8b 17                	mov    (%edi),%edx
 471:	83 ec 0c             	sub    $0xc,%esp
 474:	6a 01                	push   $0x1
 476:	b9 0a 00 00 00       	mov    $0xa,%ecx
 47b:	eb 8a                	jmp    407 <printf+0xbb>
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 483:	8b 00                	mov    (%eax),%eax
 485:	88 45 e7             	mov    %al,-0x19(%ebp)
 488:	51                   	push   %ecx
 489:	6a 01                	push   $0x1
 48b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 48e:	57                   	push   %edi
 48f:	56                   	push   %esi
 490:	e8 7a fd ff ff       	call   20f <write>
 495:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 499:	83 c4 10             	add    $0x10,%esp
 49c:	31 ff                	xor    %edi,%edi
 49e:	e9 e1 fe ff ff       	jmp    384 <printf+0x38>
 4a3:	90                   	nop
 4a4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4a7:	52                   	push   %edx
 4a8:	6a 01                	push   $0x1
 4aa:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ad:	e9 35 ff ff ff       	jmp    3e7 <printf+0x9b>
 4b2:	66 90                	xchg   %ax,%ax
 4b4:	b0 28                	mov    $0x28,%al
 4b6:	ba 98 06 00 00       	mov    $0x698,%edx
 4bb:	eb 80                	jmp    43d <printf+0xf1>
 4bd:	31 ff                	xor    %edi,%edi
 4bf:	e9 c0 fe ff ff       	jmp    384 <printf+0x38>

000004c4 <free>:
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	57                   	push   %edi
 4c8:	56                   	push   %esi
 4c9:	53                   	push   %ebx
 4ca:	83 ec 0c             	sub    $0xc,%esp
 4cd:	8b 75 08             	mov    0x8(%ebp),%esi
 4d0:	8d 5e f8             	lea    -0x8(%esi),%ebx
 4d3:	8b 7e fc             	mov    -0x4(%esi),%edi
 4d6:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 4dd:	3d 00 80 00 00       	cmp    $0x8000,%eax
 4e2:	75 70                	jne    554 <free+0x90>
 4e4:	b9 00 80 00 00       	mov    $0x8000,%ecx
 4e9:	a1 60 07 00 00       	mov    0x760,%eax
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	89 c2                	mov    %eax,%edx
 4f2:	8b 00                	mov    (%eax),%eax
 4f4:	39 da                	cmp    %ebx,%edx
 4f6:	73 2c                	jae    524 <free+0x60>
 4f8:	39 c3                	cmp    %eax,%ebx
 4fa:	72 04                	jb     500 <free+0x3c>
 4fc:	39 c2                	cmp    %eax,%edx
 4fe:	72 f0                	jb     4f0 <free+0x2c>
 500:	01 d9                	add    %ebx,%ecx
 502:	39 c8                	cmp    %ecx,%eax
 504:	74 2c                	je     532 <free+0x6e>
 506:	89 46 f8             	mov    %eax,-0x8(%esi)
 509:	8b 42 04             	mov    0x4(%edx),%eax
 50c:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 50f:	39 cb                	cmp    %ecx,%ebx
 511:	74 36                	je     549 <free+0x85>
 513:	89 1a                	mov    %ebx,(%edx)
 515:	89 15 60 07 00 00    	mov    %edx,0x760
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    
 523:	90                   	nop
 524:	39 c2                	cmp    %eax,%edx
 526:	72 c8                	jb     4f0 <free+0x2c>
 528:	39 c3                	cmp    %eax,%ebx
 52a:	73 c4                	jae    4f0 <free+0x2c>
 52c:	01 d9                	add    %ebx,%ecx
 52e:	39 c8                	cmp    %ecx,%eax
 530:	75 d4                	jne    506 <free+0x42>
 532:	03 78 04             	add    0x4(%eax),%edi
 535:	89 7e fc             	mov    %edi,-0x4(%esi)
 538:	8b 02                	mov    (%edx),%eax
 53a:	8b 00                	mov    (%eax),%eax
 53c:	89 46 f8             	mov    %eax,-0x8(%esi)
 53f:	8b 42 04             	mov    0x4(%edx),%eax
 542:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 545:	39 cb                	cmp    %ecx,%ebx
 547:	75 ca                	jne    513 <free+0x4f>
 549:	03 46 fc             	add    -0x4(%esi),%eax
 54c:	89 42 04             	mov    %eax,0x4(%edx)
 54f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 552:	eb bf                	jmp    513 <free+0x4f>
 554:	83 ec 0c             	sub    $0xc,%esp
 557:	f7 d8                	neg    %eax
 559:	50                   	push   %eax
 55a:	e8 50 fd ff ff       	call   2af <increase_mem_usage>
 55f:	8b 7e fc             	mov    -0x4(%esi),%edi
 562:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 569:	83 c4 10             	add    $0x10,%esp
 56c:	e9 78 ff ff ff       	jmp    4e9 <free+0x25>
 571:	8d 76 00             	lea    0x0(%esi),%esi

00000574 <malloc>:
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	56                   	push   %esi
 579:	53                   	push   %ebx
 57a:	83 ec 0c             	sub    $0xc,%esp
 57d:	8b 7d 08             	mov    0x8(%ebp),%edi
 580:	e8 1a fd ff ff       	call   29f <get_mem_limit>
 585:	89 c3                	mov    %eax,%ebx
 587:	e8 2b fd ff ff       	call   2b7 <get_mem_usage>
 58c:	83 fb ff             	cmp    $0xffffffff,%ebx
 58f:	74 0b                	je     59c <malloc+0x28>
 591:	8d 14 38             	lea    (%eax,%edi,1),%edx
 594:	39 d3                	cmp    %edx,%ebx
 596:	0f 82 e2 00 00 00    	jb     67e <malloc+0x10a>
 59c:	83 ec 0c             	sub    $0xc,%esp
 59f:	57                   	push   %edi
 5a0:	e8 0a fd ff ff       	call   2af <increase_mem_usage>
 5a5:	83 c7 07             	add    $0x7,%edi
 5a8:	c1 ef 03             	shr    $0x3,%edi
 5ab:	47                   	inc    %edi
 5ac:	8b 15 60 07 00 00    	mov    0x760,%edx
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	85 d2                	test   %edx,%edx
 5b7:	0f 84 93 00 00 00    	je     650 <malloc+0xdc>
 5bd:	8b 02                	mov    (%edx),%eax
 5bf:	8b 48 04             	mov    0x4(%eax),%ecx
 5c2:	39 f9                	cmp    %edi,%ecx
 5c4:	73 62                	jae    628 <malloc+0xb4>
 5c6:	89 fb                	mov    %edi,%ebx
 5c8:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 5ce:	72 78                	jb     648 <malloc+0xd4>
 5d0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 5d7:	eb 0e                	jmp    5e7 <malloc+0x73>
 5d9:	8d 76 00             	lea    0x0(%esi),%esi
 5dc:	89 c2                	mov    %eax,%edx
 5de:	8b 02                	mov    (%edx),%eax
 5e0:	8b 48 04             	mov    0x4(%eax),%ecx
 5e3:	39 f9                	cmp    %edi,%ecx
 5e5:	73 41                	jae    628 <malloc+0xb4>
 5e7:	39 05 60 07 00 00    	cmp    %eax,0x760
 5ed:	75 ed                	jne    5dc <malloc+0x68>
 5ef:	83 ec 0c             	sub    $0xc,%esp
 5f2:	56                   	push   %esi
 5f3:	e8 7f fc ff ff       	call   277 <sbrk>
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5fe:	74 1c                	je     61c <malloc+0xa8>
 600:	89 58 04             	mov    %ebx,0x4(%eax)
 603:	83 ec 0c             	sub    $0xc,%esp
 606:	83 c0 08             	add    $0x8,%eax
 609:	50                   	push   %eax
 60a:	e8 b5 fe ff ff       	call   4c4 <free>
 60f:	8b 15 60 07 00 00    	mov    0x760,%edx
 615:	83 c4 10             	add    $0x10,%esp
 618:	85 d2                	test   %edx,%edx
 61a:	75 c2                	jne    5de <malloc+0x6a>
 61c:	31 c0                	xor    %eax,%eax
 61e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 621:	5b                   	pop    %ebx
 622:	5e                   	pop    %esi
 623:	5f                   	pop    %edi
 624:	5d                   	pop    %ebp
 625:	c3                   	ret    
 626:	66 90                	xchg   %ax,%ax
 628:	39 cf                	cmp    %ecx,%edi
 62a:	74 4c                	je     678 <malloc+0x104>
 62c:	29 f9                	sub    %edi,%ecx
 62e:	89 48 04             	mov    %ecx,0x4(%eax)
 631:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 634:	89 78 04             	mov    %edi,0x4(%eax)
 637:	89 15 60 07 00 00    	mov    %edx,0x760
 63d:	83 c0 08             	add    $0x8,%eax
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	bb 00 10 00 00       	mov    $0x1000,%ebx
 64d:	eb 81                	jmp    5d0 <malloc+0x5c>
 64f:	90                   	nop
 650:	c7 05 60 07 00 00 64 	movl   $0x764,0x760
 657:	07 00 00 
 65a:	c7 05 64 07 00 00 64 	movl   $0x764,0x764
 661:	07 00 00 
 664:	c7 05 68 07 00 00 00 	movl   $0x0,0x768
 66b:	00 00 00 
 66e:	b8 64 07 00 00       	mov    $0x764,%eax
 673:	e9 4e ff ff ff       	jmp    5c6 <malloc+0x52>
 678:	8b 08                	mov    (%eax),%ecx
 67a:	89 0a                	mov    %ecx,(%edx)
 67c:	eb b9                	jmp    637 <malloc+0xc3>
 67e:	83 ec 0c             	sub    $0xc,%esp
 681:	57                   	push   %edi
 682:	50                   	push   %eax
 683:	53                   	push   %ebx
 684:	68 0c 07 00 00       	push   $0x70c
 689:	6a 02                	push   $0x2
 68b:	e8 bc fc ff ff       	call   34c <printf>
 690:	83 c4 20             	add    $0x20,%esp
 693:	31 c0                	xor    %eax,%eax
 695:	eb 87                	jmp    61e <malloc+0xaa>
