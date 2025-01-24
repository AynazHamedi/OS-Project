
_mkdir:     file format elf32-i386


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
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 3a                	jle    58 <main+0x58>
  1e:	83 c3 04             	add    $0x4,%ebx
  21:	bf 01 00 00 00       	mov    $0x1,%edi
  26:	eb 08                	jmp    30 <main+0x30>
  28:	47                   	inc    %edi
  29:	83 c3 04             	add    $0x4,%ebx
  2c:	39 fe                	cmp    %edi,%esi
  2e:	74 23                	je     53 <main+0x53>
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 5d 02 00 00       	call   297 <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	79 e7                	jns    28 <main+0x28>
  41:	50                   	push   %eax
  42:	ff 33                	pushl  (%ebx)
  44:	68 ef 06 00 00       	push   $0x6ef
  49:	6a 02                	push   $0x2
  4b:	e8 3c 03 00 00       	call   38c <printf>
  50:	83 c4 10             	add    $0x10,%esp
  53:	e8 d7 01 00 00       	call   22f <exit>
  58:	52                   	push   %edx
  59:	52                   	push   %edx
  5a:	68 d8 06 00 00       	push   $0x6d8
  5f:	6a 02                	push   $0x2
  61:	e8 26 03 00 00       	call   38c <printf>
  66:	e8 c4 01 00 00       	call   22f <exit>
  6b:	90                   	nop

0000006c <strcpy>:
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	53                   	push   %ebx
  70:	8b 4d 08             	mov    0x8(%ebp),%ecx
  73:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  76:	31 c0                	xor    %eax,%eax
  78:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  7b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  7e:	40                   	inc    %eax
  7f:	84 d2                	test   %dl,%dl
  81:	75 f5                	jne    78 <strcpy+0xc>
  83:	89 c8                	mov    %ecx,%eax
  85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  88:	c9                   	leave  
  89:	c3                   	ret    
  8a:	66 90                	xchg   %ax,%ax

0000008c <strcmp>:
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	53                   	push   %ebx
  90:	8b 55 08             	mov    0x8(%ebp),%edx
  93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  96:	0f b6 02             	movzbl (%edx),%eax
  99:	84 c0                	test   %al,%al
  9b:	75 10                	jne    ad <strcmp+0x21>
  9d:	eb 2a                	jmp    c9 <strcmp+0x3d>
  9f:	90                   	nop
  a0:	42                   	inc    %edx
  a1:	8d 4b 01             	lea    0x1(%ebx),%ecx
  a4:	0f b6 02             	movzbl (%edx),%eax
  a7:	84 c0                	test   %al,%al
  a9:	74 11                	je     bc <strcmp+0x30>
  ab:	89 cb                	mov    %ecx,%ebx
  ad:	0f b6 0b             	movzbl (%ebx),%ecx
  b0:	38 c1                	cmp    %al,%cl
  b2:	74 ec                	je     a0 <strcmp+0x14>
  b4:	29 c8                	sub    %ecx,%eax
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
  bb:	90                   	nop
  bc:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  c0:	31 c0                	xor    %eax,%eax
  c2:	29 c8                	sub    %ecx,%eax
  c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c7:	c9                   	leave  
  c8:	c3                   	ret    
  c9:	0f b6 0b             	movzbl (%ebx),%ecx
  cc:	31 c0                	xor    %eax,%eax
  ce:	eb e4                	jmp    b4 <strcmp+0x28>

000000d0 <strlen>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  d6:	80 3a 00             	cmpb   $0x0,(%edx)
  d9:	74 15                	je     f0 <strlen+0x20>
  db:	31 c0                	xor    %eax,%eax
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	40                   	inc    %eax
  e1:	89 c1                	mov    %eax,%ecx
  e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  e7:	75 f7                	jne    e0 <strlen+0x10>
  e9:	89 c8                	mov    %ecx,%eax
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	31 c9                	xor    %ecx,%ecx
  f2:	89 c8                	mov    %ecx,%eax
  f4:	5d                   	pop    %ebp
  f5:	c3                   	ret    
  f6:	66 90                	xchg   %ax,%ax

000000f8 <memset>:
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	57                   	push   %edi
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 102:	8b 45 0c             	mov    0xc(%ebp),%eax
 105:	fc                   	cld    
 106:	f3 aa                	rep stos %al,%es:(%edi)
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 10e:	c9                   	leave  
 10f:	c3                   	ret    

00000110 <strchr>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	8a 4d 0c             	mov    0xc(%ebp),%cl
 119:	8a 10                	mov    (%eax),%dl
 11b:	84 d2                	test   %dl,%dl
 11d:	75 0c                	jne    12b <strchr+0x1b>
 11f:	eb 13                	jmp    134 <strchr+0x24>
 121:	8d 76 00             	lea    0x0(%esi),%esi
 124:	40                   	inc    %eax
 125:	8a 10                	mov    (%eax),%dl
 127:	84 d2                	test   %dl,%dl
 129:	74 09                	je     134 <strchr+0x24>
 12b:	38 d1                	cmp    %dl,%cl
 12d:	75 f5                	jne    124 <strchr+0x14>
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	8d 76 00             	lea    0x0(%esi),%esi
 134:	31 c0                	xor    %eax,%eax
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    

00000138 <gets>:
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	56                   	push   %esi
 13d:	53                   	push   %ebx
 13e:	83 ec 1c             	sub    $0x1c,%esp
 141:	31 db                	xor    %ebx,%ebx
 143:	8d 75 e7             	lea    -0x19(%ebp),%esi
 146:	eb 24                	jmp    16c <gets+0x34>
 148:	50                   	push   %eax
 149:	6a 01                	push   $0x1
 14b:	56                   	push   %esi
 14c:	6a 00                	push   $0x0
 14e:	e8 f4 00 00 00       	call   247 <read>
 153:	83 c4 10             	add    $0x10,%esp
 156:	85 c0                	test   %eax,%eax
 158:	7e 1a                	jle    174 <gets+0x3c>
 15a:	8a 45 e7             	mov    -0x19(%ebp),%al
 15d:	8b 55 08             	mov    0x8(%ebp),%edx
 160:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 164:	3c 0a                	cmp    $0xa,%al
 166:	74 0e                	je     176 <gets+0x3e>
 168:	3c 0d                	cmp    $0xd,%al
 16a:	74 0a                	je     176 <gets+0x3e>
 16c:	89 df                	mov    %ebx,%edi
 16e:	43                   	inc    %ebx
 16f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 172:	7c d4                	jl     148 <gets+0x10>
 174:	89 fb                	mov    %edi,%ebx
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 17d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 180:	5b                   	pop    %ebx
 181:	5e                   	pop    %esi
 182:	5f                   	pop    %edi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 76 00             	lea    0x0(%esi),%esi

00000188 <stat>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	56                   	push   %esi
 18c:	53                   	push   %ebx
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	6a 00                	push   $0x0
 192:	ff 75 08             	pushl  0x8(%ebp)
 195:	e8 d5 00 00 00       	call   26f <open>
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	85 c0                	test   %eax,%eax
 19f:	78 27                	js     1c8 <stat+0x40>
 1a1:	89 c3                	mov    %eax,%ebx
 1a3:	83 ec 08             	sub    $0x8,%esp
 1a6:	ff 75 0c             	pushl  0xc(%ebp)
 1a9:	50                   	push   %eax
 1aa:	e8 d8 00 00 00       	call   287 <fstat>
 1af:	89 c6                	mov    %eax,%esi
 1b1:	89 1c 24             	mov    %ebx,(%esp)
 1b4:	e8 9e 00 00 00       	call   257 <close>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	89 f0                	mov    %esi,%eax
 1be:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
 1c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1cd:	eb ed                	jmp    1bc <stat+0x34>
 1cf:	90                   	nop

000001d0 <atoi>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d7:	0f be 01             	movsbl (%ecx),%eax
 1da:	8d 50 d0             	lea    -0x30(%eax),%edx
 1dd:	80 fa 09             	cmp    $0x9,%dl
 1e0:	ba 00 00 00 00       	mov    $0x0,%edx
 1e5:	77 16                	ja     1fd <atoi+0x2d>
 1e7:	90                   	nop
 1e8:	41                   	inc    %ecx
 1e9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1ec:	01 d2                	add    %edx,%edx
 1ee:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1f2:	0f be 01             	movsbl (%ecx),%eax
 1f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1f8:	80 fb 09             	cmp    $0x9,%bl
 1fb:	76 eb                	jbe    1e8 <atoi+0x18>
 1fd:	89 d0                	mov    %edx,%eax
 1ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 202:	c9                   	leave  
 203:	c3                   	ret    

00000204 <memmove>:
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	8b 55 08             	mov    0x8(%ebp),%edx
 20c:	8b 75 0c             	mov    0xc(%ebp),%esi
 20f:	8b 45 10             	mov    0x10(%ebp),%eax
 212:	85 c0                	test   %eax,%eax
 214:	7e 0b                	jle    221 <memmove+0x1d>
 216:	01 d0                	add    %edx,%eax
 218:	89 d7                	mov    %edx,%edi
 21a:	66 90                	xchg   %ax,%ax
 21c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 21d:	39 f8                	cmp    %edi,%eax
 21f:	75 fb                	jne    21c <memmove+0x18>
 221:	89 d0                	mov    %edx,%eax
 223:	5e                   	pop    %esi
 224:	5f                   	pop    %edi
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    

00000227 <fork>:
 227:	b8 01 00 00 00       	mov    $0x1,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <exit>:
 22f:	b8 02 00 00 00       	mov    $0x2,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <wait>:
 237:	b8 03 00 00 00       	mov    $0x3,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <pipe>:
 23f:	b8 04 00 00 00       	mov    $0x4,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <read>:
 247:	b8 05 00 00 00       	mov    $0x5,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <write>:
 24f:	b8 10 00 00 00       	mov    $0x10,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <close>:
 257:	b8 15 00 00 00       	mov    $0x15,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <kill>:
 25f:	b8 06 00 00 00       	mov    $0x6,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <exec>:
 267:	b8 07 00 00 00       	mov    $0x7,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <open>:
 26f:	b8 0f 00 00 00       	mov    $0xf,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <mknod>:
 277:	b8 11 00 00 00       	mov    $0x11,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <unlink>:
 27f:	b8 12 00 00 00       	mov    $0x12,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <fstat>:
 287:	b8 08 00 00 00       	mov    $0x8,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <link>:
 28f:	b8 13 00 00 00       	mov    $0x13,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <mkdir>:
 297:	b8 14 00 00 00       	mov    $0x14,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <chdir>:
 29f:	b8 09 00 00 00       	mov    $0x9,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <dup>:
 2a7:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <getpid>:
 2af:	b8 0b 00 00 00       	mov    $0xb,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <sbrk>:
 2b7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <sleep>:
 2bf:	b8 0d 00 00 00       	mov    $0xd,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <uptime>:
 2c7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <cpu_limit>:
 2cf:	b8 16 00 00 00       	mov    $0x16,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <set_mem_limit>:
 2d7:	b8 17 00 00 00       	mov    $0x17,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <get_mem_limit>:
 2df:	b8 18 00 00 00       	mov    $0x18,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <increase_mem_limit>:
 2e7:	b8 19 00 00 00       	mov    $0x19,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <increase_mem_usage>:
 2ef:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <get_mem_usage>:
 2f7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    
 2ff:	90                   	nop

00000300 <printint>:
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
 306:	83 ec 3c             	sub    $0x3c,%esp
 309:	89 45 c0             	mov    %eax,-0x40(%ebp)
 30c:	89 cb                	mov    %ecx,%ebx
 30e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 311:	85 c9                	test   %ecx,%ecx
 313:	74 04                	je     319 <printint+0x19>
 315:	85 d2                	test   %edx,%edx
 317:	78 6b                	js     384 <printint+0x84>
 319:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 31c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 323:	31 c9                	xor    %ecx,%ecx
 325:	8d 75 d7             	lea    -0x29(%ebp),%esi
 328:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 32b:	31 d2                	xor    %edx,%edx
 32d:	f7 f3                	div    %ebx
 32f:	89 cf                	mov    %ecx,%edi
 331:	8d 49 01             	lea    0x1(%ecx),%ecx
 334:	8a 92 6c 07 00 00    	mov    0x76c(%edx),%dl
 33a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 33e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 341:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 344:	39 da                	cmp    %ebx,%edx
 346:	73 e0                	jae    328 <printint+0x28>
 348:	8b 55 08             	mov    0x8(%ebp),%edx
 34b:	85 d2                	test   %edx,%edx
 34d:	74 07                	je     356 <printint+0x56>
 34f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 354:	89 cf                	mov    %ecx,%edi
 356:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 359:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	8a 07                	mov    (%edi),%al
 362:	88 45 d7             	mov    %al,-0x29(%ebp)
 365:	50                   	push   %eax
 366:	6a 01                	push   $0x1
 368:	56                   	push   %esi
 369:	ff 75 c0             	pushl  -0x40(%ebp)
 36c:	e8 de fe ff ff       	call   24f <write>
 371:	89 f8                	mov    %edi,%eax
 373:	4f                   	dec    %edi
 374:	83 c4 10             	add    $0x10,%esp
 377:	39 d8                	cmp    %ebx,%eax
 379:	75 e5                	jne    360 <printint+0x60>
 37b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37e:	5b                   	pop    %ebx
 37f:	5e                   	pop    %esi
 380:	5f                   	pop    %edi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    
 383:	90                   	nop
 384:	f7 da                	neg    %edx
 386:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 389:	eb 98                	jmp    323 <printint+0x23>
 38b:	90                   	nop

0000038c <printf>:
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
 38f:	57                   	push   %edi
 390:	56                   	push   %esi
 391:	53                   	push   %ebx
 392:	83 ec 2c             	sub    $0x2c,%esp
 395:	8b 75 08             	mov    0x8(%ebp),%esi
 398:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 39b:	8a 13                	mov    (%ebx),%dl
 39d:	84 d2                	test   %dl,%dl
 39f:	74 5c                	je     3fd <printf+0x71>
 3a1:	43                   	inc    %ebx
 3a2:	8d 45 10             	lea    0x10(%ebp),%eax
 3a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3a8:	31 ff                	xor    %edi,%edi
 3aa:	eb 20                	jmp    3cc <printf+0x40>
 3ac:	83 f8 25             	cmp    $0x25,%eax
 3af:	74 3f                	je     3f0 <printf+0x64>
 3b1:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3b4:	50                   	push   %eax
 3b5:	6a 01                	push   $0x1
 3b7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ba:	50                   	push   %eax
 3bb:	56                   	push   %esi
 3bc:	e8 8e fe ff ff       	call   24f <write>
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	43                   	inc    %ebx
 3c5:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3c8:	84 d2                	test   %dl,%dl
 3ca:	74 31                	je     3fd <printf+0x71>
 3cc:	0f b6 c2             	movzbl %dl,%eax
 3cf:	85 ff                	test   %edi,%edi
 3d1:	74 d9                	je     3ac <printf+0x20>
 3d3:	83 ff 25             	cmp    $0x25,%edi
 3d6:	75 ec                	jne    3c4 <printf+0x38>
 3d8:	83 f8 25             	cmp    $0x25,%eax
 3db:	0f 84 03 01 00 00    	je     4e4 <printf+0x158>
 3e1:	83 e8 63             	sub    $0x63,%eax
 3e4:	83 f8 15             	cmp    $0x15,%eax
 3e7:	77 1f                	ja     408 <printf+0x7c>
 3e9:	ff 24 85 14 07 00 00 	jmp    *0x714(,%eax,4)
 3f0:	bf 25 00 00 00       	mov    $0x25,%edi
 3f5:	43                   	inc    %ebx
 3f6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3f9:	84 d2                	test   %dl,%dl
 3fb:	75 cf                	jne    3cc <printf+0x40>
 3fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5f                   	pop    %edi
 403:	5d                   	pop    %ebp
 404:	c3                   	ret    
 405:	8d 76 00             	lea    0x0(%esi),%esi
 408:	88 55 d0             	mov    %dl,-0x30(%ebp)
 40b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 40f:	50                   	push   %eax
 410:	6a 01                	push   $0x1
 412:	8d 7d e7             	lea    -0x19(%ebp),%edi
 415:	57                   	push   %edi
 416:	56                   	push   %esi
 417:	e8 33 fe ff ff       	call   24f <write>
 41c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 41f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 422:	83 c4 0c             	add    $0xc,%esp
 425:	6a 01                	push   $0x1
 427:	57                   	push   %edi
 428:	56                   	push   %esi
 429:	e8 21 fe ff ff       	call   24f <write>
 42e:	83 c4 10             	add    $0x10,%esp
 431:	31 ff                	xor    %edi,%edi
 433:	eb 8f                	jmp    3c4 <printf+0x38>
 435:	8d 76 00             	lea    0x0(%esi),%esi
 438:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 43b:	8b 17                	mov    (%edi),%edx
 43d:	83 ec 0c             	sub    $0xc,%esp
 440:	6a 00                	push   $0x0
 442:	b9 10 00 00 00       	mov    $0x10,%ecx
 447:	89 f0                	mov    %esi,%eax
 449:	e8 b2 fe ff ff       	call   300 <printint>
 44e:	83 c7 04             	add    $0x4,%edi
 451:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 454:	83 c4 10             	add    $0x10,%esp
 457:	31 ff                	xor    %edi,%edi
 459:	e9 66 ff ff ff       	jmp    3c4 <printf+0x38>
 45e:	66 90                	xchg   %ax,%ax
 460:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 463:	8b 10                	mov    (%eax),%edx
 465:	83 c0 04             	add    $0x4,%eax
 468:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 46b:	85 d2                	test   %edx,%edx
 46d:	0f 84 81 00 00 00    	je     4f4 <printf+0x168>
 473:	8a 02                	mov    (%edx),%al
 475:	84 c0                	test   %al,%al
 477:	0f 84 80 00 00 00    	je     4fd <printf+0x171>
 47d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 480:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 483:	89 d3                	mov    %edx,%ebx
 485:	8d 76 00             	lea    0x0(%esi),%esi
 488:	88 45 e7             	mov    %al,-0x19(%ebp)
 48b:	50                   	push   %eax
 48c:	6a 01                	push   $0x1
 48e:	57                   	push   %edi
 48f:	56                   	push   %esi
 490:	e8 ba fd ff ff       	call   24f <write>
 495:	43                   	inc    %ebx
 496:	8a 03                	mov    (%ebx),%al
 498:	83 c4 10             	add    $0x10,%esp
 49b:	84 c0                	test   %al,%al
 49d:	75 e9                	jne    488 <printf+0xfc>
 49f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4a2:	31 ff                	xor    %edi,%edi
 4a4:	e9 1b ff ff ff       	jmp    3c4 <printf+0x38>
 4a9:	8d 76 00             	lea    0x0(%esi),%esi
 4ac:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4af:	8b 17                	mov    (%edi),%edx
 4b1:	83 ec 0c             	sub    $0xc,%esp
 4b4:	6a 01                	push   $0x1
 4b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4bb:	eb 8a                	jmp    447 <printf+0xbb>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4c3:	8b 00                	mov    (%eax),%eax
 4c5:	88 45 e7             	mov    %al,-0x19(%ebp)
 4c8:	51                   	push   %ecx
 4c9:	6a 01                	push   $0x1
 4cb:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ce:	57                   	push   %edi
 4cf:	56                   	push   %esi
 4d0:	e8 7a fd ff ff       	call   24f <write>
 4d5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4d9:	83 c4 10             	add    $0x10,%esp
 4dc:	31 ff                	xor    %edi,%edi
 4de:	e9 e1 fe ff ff       	jmp    3c4 <printf+0x38>
 4e3:	90                   	nop
 4e4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e7:	52                   	push   %edx
 4e8:	6a 01                	push   $0x1
 4ea:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ed:	e9 35 ff ff ff       	jmp    427 <printf+0x9b>
 4f2:	66 90                	xchg   %ax,%ax
 4f4:	b0 28                	mov    $0x28,%al
 4f6:	ba 0b 07 00 00       	mov    $0x70b,%edx
 4fb:	eb 80                	jmp    47d <printf+0xf1>
 4fd:	31 ff                	xor    %edi,%edi
 4ff:	e9 c0 fe ff ff       	jmp    3c4 <printf+0x38>

00000504 <free>:
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	53                   	push   %ebx
 50a:	83 ec 0c             	sub    $0xc,%esp
 50d:	8b 75 08             	mov    0x8(%ebp),%esi
 510:	8d 5e f8             	lea    -0x8(%esi),%ebx
 513:	8b 7e fc             	mov    -0x4(%esi),%edi
 516:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 51d:	3d 00 80 00 00       	cmp    $0x8000,%eax
 522:	75 70                	jne    594 <free+0x90>
 524:	b9 00 80 00 00       	mov    $0x8000,%ecx
 529:	a1 d4 07 00 00       	mov    0x7d4,%eax
 52e:	66 90                	xchg   %ax,%ax
 530:	89 c2                	mov    %eax,%edx
 532:	8b 00                	mov    (%eax),%eax
 534:	39 da                	cmp    %ebx,%edx
 536:	73 2c                	jae    564 <free+0x60>
 538:	39 c3                	cmp    %eax,%ebx
 53a:	72 04                	jb     540 <free+0x3c>
 53c:	39 c2                	cmp    %eax,%edx
 53e:	72 f0                	jb     530 <free+0x2c>
 540:	01 d9                	add    %ebx,%ecx
 542:	39 c8                	cmp    %ecx,%eax
 544:	74 2c                	je     572 <free+0x6e>
 546:	89 46 f8             	mov    %eax,-0x8(%esi)
 549:	8b 42 04             	mov    0x4(%edx),%eax
 54c:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 54f:	39 cb                	cmp    %ecx,%ebx
 551:	74 36                	je     589 <free+0x85>
 553:	89 1a                	mov    %ebx,(%edx)
 555:	89 15 d4 07 00 00    	mov    %edx,0x7d4
 55b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5f                   	pop    %edi
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    
 563:	90                   	nop
 564:	39 c2                	cmp    %eax,%edx
 566:	72 c8                	jb     530 <free+0x2c>
 568:	39 c3                	cmp    %eax,%ebx
 56a:	73 c4                	jae    530 <free+0x2c>
 56c:	01 d9                	add    %ebx,%ecx
 56e:	39 c8                	cmp    %ecx,%eax
 570:	75 d4                	jne    546 <free+0x42>
 572:	03 78 04             	add    0x4(%eax),%edi
 575:	89 7e fc             	mov    %edi,-0x4(%esi)
 578:	8b 02                	mov    (%edx),%eax
 57a:	8b 00                	mov    (%eax),%eax
 57c:	89 46 f8             	mov    %eax,-0x8(%esi)
 57f:	8b 42 04             	mov    0x4(%edx),%eax
 582:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 585:	39 cb                	cmp    %ecx,%ebx
 587:	75 ca                	jne    553 <free+0x4f>
 589:	03 46 fc             	add    -0x4(%esi),%eax
 58c:	89 42 04             	mov    %eax,0x4(%edx)
 58f:	8b 5e f8             	mov    -0x8(%esi),%ebx
 592:	eb bf                	jmp    553 <free+0x4f>
 594:	83 ec 0c             	sub    $0xc,%esp
 597:	f7 d8                	neg    %eax
 599:	50                   	push   %eax
 59a:	e8 50 fd ff ff       	call   2ef <increase_mem_usage>
 59f:	8b 7e fc             	mov    -0x4(%esi),%edi
 5a2:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 5a9:	83 c4 10             	add    $0x10,%esp
 5ac:	e9 78 ff ff ff       	jmp    529 <free+0x25>
 5b1:	8d 76 00             	lea    0x0(%esi),%esi

000005b4 <malloc>:
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	57                   	push   %edi
 5b8:	56                   	push   %esi
 5b9:	53                   	push   %ebx
 5ba:	83 ec 0c             	sub    $0xc,%esp
 5bd:	8b 7d 08             	mov    0x8(%ebp),%edi
 5c0:	e8 1a fd ff ff       	call   2df <get_mem_limit>
 5c5:	89 c3                	mov    %eax,%ebx
 5c7:	e8 2b fd ff ff       	call   2f7 <get_mem_usage>
 5cc:	83 fb ff             	cmp    $0xffffffff,%ebx
 5cf:	74 0b                	je     5dc <malloc+0x28>
 5d1:	8d 14 38             	lea    (%eax,%edi,1),%edx
 5d4:	39 d3                	cmp    %edx,%ebx
 5d6:	0f 82 e2 00 00 00    	jb     6be <malloc+0x10a>
 5dc:	83 ec 0c             	sub    $0xc,%esp
 5df:	57                   	push   %edi
 5e0:	e8 0a fd ff ff       	call   2ef <increase_mem_usage>
 5e5:	83 c7 07             	add    $0x7,%edi
 5e8:	c1 ef 03             	shr    $0x3,%edi
 5eb:	47                   	inc    %edi
 5ec:	8b 15 d4 07 00 00    	mov    0x7d4,%edx
 5f2:	83 c4 10             	add    $0x10,%esp
 5f5:	85 d2                	test   %edx,%edx
 5f7:	0f 84 93 00 00 00    	je     690 <malloc+0xdc>
 5fd:	8b 02                	mov    (%edx),%eax
 5ff:	8b 48 04             	mov    0x4(%eax),%ecx
 602:	39 f9                	cmp    %edi,%ecx
 604:	73 62                	jae    668 <malloc+0xb4>
 606:	89 fb                	mov    %edi,%ebx
 608:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 60e:	72 78                	jb     688 <malloc+0xd4>
 610:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 617:	eb 0e                	jmp    627 <malloc+0x73>
 619:	8d 76 00             	lea    0x0(%esi),%esi
 61c:	89 c2                	mov    %eax,%edx
 61e:	8b 02                	mov    (%edx),%eax
 620:	8b 48 04             	mov    0x4(%eax),%ecx
 623:	39 f9                	cmp    %edi,%ecx
 625:	73 41                	jae    668 <malloc+0xb4>
 627:	39 05 d4 07 00 00    	cmp    %eax,0x7d4
 62d:	75 ed                	jne    61c <malloc+0x68>
 62f:	83 ec 0c             	sub    $0xc,%esp
 632:	56                   	push   %esi
 633:	e8 7f fc ff ff       	call   2b7 <sbrk>
 638:	83 c4 10             	add    $0x10,%esp
 63b:	83 f8 ff             	cmp    $0xffffffff,%eax
 63e:	74 1c                	je     65c <malloc+0xa8>
 640:	89 58 04             	mov    %ebx,0x4(%eax)
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	83 c0 08             	add    $0x8,%eax
 649:	50                   	push   %eax
 64a:	e8 b5 fe ff ff       	call   504 <free>
 64f:	8b 15 d4 07 00 00    	mov    0x7d4,%edx
 655:	83 c4 10             	add    $0x10,%esp
 658:	85 d2                	test   %edx,%edx
 65a:	75 c2                	jne    61e <malloc+0x6a>
 65c:	31 c0                	xor    %eax,%eax
 65e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 661:	5b                   	pop    %ebx
 662:	5e                   	pop    %esi
 663:	5f                   	pop    %edi
 664:	5d                   	pop    %ebp
 665:	c3                   	ret    
 666:	66 90                	xchg   %ax,%ax
 668:	39 cf                	cmp    %ecx,%edi
 66a:	74 4c                	je     6b8 <malloc+0x104>
 66c:	29 f9                	sub    %edi,%ecx
 66e:	89 48 04             	mov    %ecx,0x4(%eax)
 671:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 674:	89 78 04             	mov    %edi,0x4(%eax)
 677:	89 15 d4 07 00 00    	mov    %edx,0x7d4
 67d:	83 c0 08             	add    $0x8,%eax
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret    
 688:	bb 00 10 00 00       	mov    $0x1000,%ebx
 68d:	eb 81                	jmp    610 <malloc+0x5c>
 68f:	90                   	nop
 690:	c7 05 d4 07 00 00 d8 	movl   $0x7d8,0x7d4
 697:	07 00 00 
 69a:	c7 05 d8 07 00 00 d8 	movl   $0x7d8,0x7d8
 6a1:	07 00 00 
 6a4:	c7 05 dc 07 00 00 00 	movl   $0x0,0x7dc
 6ab:	00 00 00 
 6ae:	b8 d8 07 00 00       	mov    $0x7d8,%eax
 6b3:	e9 4e ff ff ff       	jmp    606 <malloc+0x52>
 6b8:	8b 08                	mov    (%eax),%ecx
 6ba:	89 0a                	mov    %ecx,(%edx)
 6bc:	eb b9                	jmp    677 <malloc+0xc3>
 6be:	83 ec 0c             	sub    $0xc,%esp
 6c1:	57                   	push   %edi
 6c2:	50                   	push   %eax
 6c3:	53                   	push   %ebx
 6c4:	68 80 07 00 00       	push   $0x780
 6c9:	6a 02                	push   $0x2
 6cb:	e8 bc fc ff ff       	call   38c <printf>
 6d0:	83 c4 20             	add    $0x20,%esp
 6d3:	31 c0                	xor    %eax,%eax
 6d5:	eb 87                	jmp    65e <malloc+0xaa>
