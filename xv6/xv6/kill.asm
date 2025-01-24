
_kill:     file format elf32-i386


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
  1c:	7e 26                	jle    44 <main+0x44>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	90                   	nop
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 34 9f             	pushl  (%edi,%ebx,4)
  2a:	e8 8d 01 00 00       	call   1bc <atoi>
  2f:	89 04 24             	mov    %eax,(%esp)
  32:	e8 14 02 00 00       	call   24b <kill>
  37:	43                   	inc    %ebx
  38:	83 c4 10             	add    $0x10,%esp
  3b:	39 de                	cmp    %ebx,%esi
  3d:	75 e5                	jne    24 <main+0x24>
  3f:	e8 d7 01 00 00       	call   21b <exit>
  44:	50                   	push   %eax
  45:	50                   	push   %eax
  46:	68 c4 06 00 00       	push   $0x6c4
  4b:	6a 02                	push   $0x2
  4d:	e8 26 03 00 00       	call   378 <printf>
  52:	e8 c4 01 00 00       	call   21b <exit>
  57:	90                   	nop

00000058 <strcpy>:
  58:	55                   	push   %ebp
  59:	89 e5                	mov    %esp,%ebp
  5b:	53                   	push   %ebx
  5c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  62:	31 c0                	xor    %eax,%eax
  64:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  67:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6a:	40                   	inc    %eax
  6b:	84 d2                	test   %dl,%dl
  6d:	75 f5                	jne    64 <strcpy+0xc>
  6f:	89 c8                	mov    %ecx,%eax
  71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  74:	c9                   	leave  
  75:	c3                   	ret    
  76:	66 90                	xchg   %ax,%ax

00000078 <strcmp>:
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  7b:	53                   	push   %ebx
  7c:	8b 55 08             	mov    0x8(%ebp),%edx
  7f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  82:	0f b6 02             	movzbl (%edx),%eax
  85:	84 c0                	test   %al,%al
  87:	75 10                	jne    99 <strcmp+0x21>
  89:	eb 2a                	jmp    b5 <strcmp+0x3d>
  8b:	90                   	nop
  8c:	42                   	inc    %edx
  8d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  90:	0f b6 02             	movzbl (%edx),%eax
  93:	84 c0                	test   %al,%al
  95:	74 11                	je     a8 <strcmp+0x30>
  97:	89 cb                	mov    %ecx,%ebx
  99:	0f b6 0b             	movzbl (%ebx),%ecx
  9c:	38 c1                	cmp    %al,%cl
  9e:	74 ec                	je     8c <strcmp+0x14>
  a0:	29 c8                	sub    %ecx,%eax
  a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a5:	c9                   	leave  
  a6:	c3                   	ret    
  a7:	90                   	nop
  a8:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  ac:	31 c0                	xor    %eax,%eax
  ae:	29 c8                	sub    %ecx,%eax
  b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b3:	c9                   	leave  
  b4:	c3                   	ret    
  b5:	0f b6 0b             	movzbl (%ebx),%ecx
  b8:	31 c0                	xor    %eax,%eax
  ba:	eb e4                	jmp    a0 <strcmp+0x28>

000000bc <strlen>:
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  bf:	8b 55 08             	mov    0x8(%ebp),%edx
  c2:	80 3a 00             	cmpb   $0x0,(%edx)
  c5:	74 15                	je     dc <strlen+0x20>
  c7:	31 c0                	xor    %eax,%eax
  c9:	8d 76 00             	lea    0x0(%esi),%esi
  cc:	40                   	inc    %eax
  cd:	89 c1                	mov    %eax,%ecx
  cf:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0x10>
  d5:	89 c8                	mov    %ecx,%eax
  d7:	5d                   	pop    %ebp
  d8:	c3                   	ret    
  d9:	8d 76 00             	lea    0x0(%esi),%esi
  dc:	31 c9                	xor    %ecx,%ecx
  de:	89 c8                	mov    %ecx,%eax
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    
  e2:	66 90                	xchg   %ax,%ax

000000e4 <memset>:
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	57                   	push   %edi
  e8:	8b 7d 08             	mov    0x8(%ebp),%edi
  eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  f1:	fc                   	cld    
  f2:	f3 aa                	rep stos %al,%es:(%edi)
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	8b 7d fc             	mov    -0x4(%ebp),%edi
  fa:	c9                   	leave  
  fb:	c3                   	ret    

000000fc <strchr>:
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	8b 45 08             	mov    0x8(%ebp),%eax
 102:	8a 4d 0c             	mov    0xc(%ebp),%cl
 105:	8a 10                	mov    (%eax),%dl
 107:	84 d2                	test   %dl,%dl
 109:	75 0c                	jne    117 <strchr+0x1b>
 10b:	eb 13                	jmp    120 <strchr+0x24>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	40                   	inc    %eax
 111:	8a 10                	mov    (%eax),%dl
 113:	84 d2                	test   %dl,%dl
 115:	74 09                	je     120 <strchr+0x24>
 117:	38 d1                	cmp    %dl,%cl
 119:	75 f5                	jne    110 <strchr+0x14>
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	31 c0                	xor    %eax,%eax
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    

00000124 <gets>:
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
 12a:	83 ec 1c             	sub    $0x1c,%esp
 12d:	31 db                	xor    %ebx,%ebx
 12f:	8d 75 e7             	lea    -0x19(%ebp),%esi
 132:	eb 24                	jmp    158 <gets+0x34>
 134:	50                   	push   %eax
 135:	6a 01                	push   $0x1
 137:	56                   	push   %esi
 138:	6a 00                	push   $0x0
 13a:	e8 f4 00 00 00       	call   233 <read>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	85 c0                	test   %eax,%eax
 144:	7e 1a                	jle    160 <gets+0x3c>
 146:	8a 45 e7             	mov    -0x19(%ebp),%al
 149:	8b 55 08             	mov    0x8(%ebp),%edx
 14c:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 150:	3c 0a                	cmp    $0xa,%al
 152:	74 0e                	je     162 <gets+0x3e>
 154:	3c 0d                	cmp    $0xd,%al
 156:	74 0a                	je     162 <gets+0x3e>
 158:	89 df                	mov    %ebx,%edi
 15a:	43                   	inc    %ebx
 15b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 15e:	7c d4                	jl     134 <gets+0x10>
 160:	89 fb                	mov    %edi,%ebx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 169:	8d 65 f4             	lea    -0xc(%ebp),%esp
 16c:	5b                   	pop    %ebx
 16d:	5e                   	pop    %esi
 16e:	5f                   	pop    %edi
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d 76 00             	lea    0x0(%esi),%esi

00000174 <stat>:
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	56                   	push   %esi
 178:	53                   	push   %ebx
 179:	83 ec 08             	sub    $0x8,%esp
 17c:	6a 00                	push   $0x0
 17e:	ff 75 08             	pushl  0x8(%ebp)
 181:	e8 d5 00 00 00       	call   25b <open>
 186:	83 c4 10             	add    $0x10,%esp
 189:	85 c0                	test   %eax,%eax
 18b:	78 27                	js     1b4 <stat+0x40>
 18d:	89 c3                	mov    %eax,%ebx
 18f:	83 ec 08             	sub    $0x8,%esp
 192:	ff 75 0c             	pushl  0xc(%ebp)
 195:	50                   	push   %eax
 196:	e8 d8 00 00 00       	call   273 <fstat>
 19b:	89 c6                	mov    %eax,%esi
 19d:	89 1c 24             	mov    %ebx,(%esp)
 1a0:	e8 9e 00 00 00       	call   243 <close>
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	89 f0                	mov    %esi,%eax
 1aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1ad:	5b                   	pop    %ebx
 1ae:	5e                   	pop    %esi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d 76 00             	lea    0x0(%esi),%esi
 1b4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b9:	eb ed                	jmp    1a8 <stat+0x34>
 1bb:	90                   	nop

000001bc <atoi>:
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	53                   	push   %ebx
 1c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c3:	0f be 01             	movsbl (%ecx),%eax
 1c6:	8d 50 d0             	lea    -0x30(%eax),%edx
 1c9:	80 fa 09             	cmp    $0x9,%dl
 1cc:	ba 00 00 00 00       	mov    $0x0,%edx
 1d1:	77 16                	ja     1e9 <atoi+0x2d>
 1d3:	90                   	nop
 1d4:	41                   	inc    %ecx
 1d5:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1d8:	01 d2                	add    %edx,%edx
 1da:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1de:	0f be 01             	movsbl (%ecx),%eax
 1e1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e4:	80 fb 09             	cmp    $0x9,%bl
 1e7:	76 eb                	jbe    1d4 <atoi+0x18>
 1e9:	89 d0                	mov    %edx,%eax
 1eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <memmove>:
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	8b 55 08             	mov    0x8(%ebp),%edx
 1f8:	8b 75 0c             	mov    0xc(%ebp),%esi
 1fb:	8b 45 10             	mov    0x10(%ebp),%eax
 1fe:	85 c0                	test   %eax,%eax
 200:	7e 0b                	jle    20d <memmove+0x1d>
 202:	01 d0                	add    %edx,%eax
 204:	89 d7                	mov    %edx,%edi
 206:	66 90                	xchg   %ax,%ax
 208:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 209:	39 f8                	cmp    %edi,%eax
 20b:	75 fb                	jne    208 <memmove+0x18>
 20d:	89 d0                	mov    %edx,%eax
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <fork>:
 213:	b8 01 00 00 00       	mov    $0x1,%eax
 218:	cd 40                	int    $0x40
 21a:	c3                   	ret    

0000021b <exit>:
 21b:	b8 02 00 00 00       	mov    $0x2,%eax
 220:	cd 40                	int    $0x40
 222:	c3                   	ret    

00000223 <wait>:
 223:	b8 03 00 00 00       	mov    $0x3,%eax
 228:	cd 40                	int    $0x40
 22a:	c3                   	ret    

0000022b <pipe>:
 22b:	b8 04 00 00 00       	mov    $0x4,%eax
 230:	cd 40                	int    $0x40
 232:	c3                   	ret    

00000233 <read>:
 233:	b8 05 00 00 00       	mov    $0x5,%eax
 238:	cd 40                	int    $0x40
 23a:	c3                   	ret    

0000023b <write>:
 23b:	b8 10 00 00 00       	mov    $0x10,%eax
 240:	cd 40                	int    $0x40
 242:	c3                   	ret    

00000243 <close>:
 243:	b8 15 00 00 00       	mov    $0x15,%eax
 248:	cd 40                	int    $0x40
 24a:	c3                   	ret    

0000024b <kill>:
 24b:	b8 06 00 00 00       	mov    $0x6,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <exec>:
 253:	b8 07 00 00 00       	mov    $0x7,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <open>:
 25b:	b8 0f 00 00 00       	mov    $0xf,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <mknod>:
 263:	b8 11 00 00 00       	mov    $0x11,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <unlink>:
 26b:	b8 12 00 00 00       	mov    $0x12,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <fstat>:
 273:	b8 08 00 00 00       	mov    $0x8,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <link>:
 27b:	b8 13 00 00 00       	mov    $0x13,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <mkdir>:
 283:	b8 14 00 00 00       	mov    $0x14,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <chdir>:
 28b:	b8 09 00 00 00       	mov    $0x9,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <dup>:
 293:	b8 0a 00 00 00       	mov    $0xa,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <getpid>:
 29b:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <sbrk>:
 2a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <sleep>:
 2ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <uptime>:
 2b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <cpu_limit>:
 2bb:	b8 16 00 00 00       	mov    $0x16,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <set_mem_limit>:
 2c3:	b8 17 00 00 00       	mov    $0x17,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <get_mem_limit>:
 2cb:	b8 18 00 00 00       	mov    $0x18,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <increase_mem_limit>:
 2d3:	b8 19 00 00 00       	mov    $0x19,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <increase_mem_usage>:
 2db:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <get_mem_usage>:
 2e3:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    
 2eb:	90                   	nop

000002ec <printint>:
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	57                   	push   %edi
 2f0:	56                   	push   %esi
 2f1:	53                   	push   %ebx
 2f2:	83 ec 3c             	sub    $0x3c,%esp
 2f5:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2f8:	89 cb                	mov    %ecx,%ebx
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fd:	85 c9                	test   %ecx,%ecx
 2ff:	74 04                	je     305 <printint+0x19>
 301:	85 d2                	test   %edx,%edx
 303:	78 6b                	js     370 <printint+0x84>
 305:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 308:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 30f:	31 c9                	xor    %ecx,%ecx
 311:	8d 75 d7             	lea    -0x29(%ebp),%esi
 314:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 317:	31 d2                	xor    %edx,%edx
 319:	f7 f3                	div    %ebx
 31b:	89 cf                	mov    %ecx,%edi
 31d:	8d 49 01             	lea    0x1(%ecx),%ecx
 320:	8a 92 38 07 00 00    	mov    0x738(%edx),%dl
 326:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 32a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 32d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 330:	39 da                	cmp    %ebx,%edx
 332:	73 e0                	jae    314 <printint+0x28>
 334:	8b 55 08             	mov    0x8(%ebp),%edx
 337:	85 d2                	test   %edx,%edx
 339:	74 07                	je     342 <printint+0x56>
 33b:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 340:	89 cf                	mov    %ecx,%edi
 342:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 345:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 349:	8d 76 00             	lea    0x0(%esi),%esi
 34c:	8a 07                	mov    (%edi),%al
 34e:	88 45 d7             	mov    %al,-0x29(%ebp)
 351:	50                   	push   %eax
 352:	6a 01                	push   $0x1
 354:	56                   	push   %esi
 355:	ff 75 c0             	pushl  -0x40(%ebp)
 358:	e8 de fe ff ff       	call   23b <write>
 35d:	89 f8                	mov    %edi,%eax
 35f:	4f                   	dec    %edi
 360:	83 c4 10             	add    $0x10,%esp
 363:	39 d8                	cmp    %ebx,%eax
 365:	75 e5                	jne    34c <printint+0x60>
 367:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36a:	5b                   	pop    %ebx
 36b:	5e                   	pop    %esi
 36c:	5f                   	pop    %edi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop
 370:	f7 da                	neg    %edx
 372:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 375:	eb 98                	jmp    30f <printint+0x23>
 377:	90                   	nop

00000378 <printf>:
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	57                   	push   %edi
 37c:	56                   	push   %esi
 37d:	53                   	push   %ebx
 37e:	83 ec 2c             	sub    $0x2c,%esp
 381:	8b 75 08             	mov    0x8(%ebp),%esi
 384:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 387:	8a 13                	mov    (%ebx),%dl
 389:	84 d2                	test   %dl,%dl
 38b:	74 5c                	je     3e9 <printf+0x71>
 38d:	43                   	inc    %ebx
 38e:	8d 45 10             	lea    0x10(%ebp),%eax
 391:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 394:	31 ff                	xor    %edi,%edi
 396:	eb 20                	jmp    3b8 <printf+0x40>
 398:	83 f8 25             	cmp    $0x25,%eax
 39b:	74 3f                	je     3dc <printf+0x64>
 39d:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3a0:	50                   	push   %eax
 3a1:	6a 01                	push   $0x1
 3a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a6:	50                   	push   %eax
 3a7:	56                   	push   %esi
 3a8:	e8 8e fe ff ff       	call   23b <write>
 3ad:	83 c4 10             	add    $0x10,%esp
 3b0:	43                   	inc    %ebx
 3b1:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3b4:	84 d2                	test   %dl,%dl
 3b6:	74 31                	je     3e9 <printf+0x71>
 3b8:	0f b6 c2             	movzbl %dl,%eax
 3bb:	85 ff                	test   %edi,%edi
 3bd:	74 d9                	je     398 <printf+0x20>
 3bf:	83 ff 25             	cmp    $0x25,%edi
 3c2:	75 ec                	jne    3b0 <printf+0x38>
 3c4:	83 f8 25             	cmp    $0x25,%eax
 3c7:	0f 84 03 01 00 00    	je     4d0 <printf+0x158>
 3cd:	83 e8 63             	sub    $0x63,%eax
 3d0:	83 f8 15             	cmp    $0x15,%eax
 3d3:	77 1f                	ja     3f4 <printf+0x7c>
 3d5:	ff 24 85 e0 06 00 00 	jmp    *0x6e0(,%eax,4)
 3dc:	bf 25 00 00 00       	mov    $0x25,%edi
 3e1:	43                   	inc    %ebx
 3e2:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3e5:	84 d2                	test   %dl,%dl
 3e7:	75 cf                	jne    3b8 <printf+0x40>
 3e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ec:	5b                   	pop    %ebx
 3ed:	5e                   	pop    %esi
 3ee:	5f                   	pop    %edi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	8d 76 00             	lea    0x0(%esi),%esi
 3f4:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3f7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3fb:	50                   	push   %eax
 3fc:	6a 01                	push   $0x1
 3fe:	8d 7d e7             	lea    -0x19(%ebp),%edi
 401:	57                   	push   %edi
 402:	56                   	push   %esi
 403:	e8 33 fe ff ff       	call   23b <write>
 408:	8a 55 d0             	mov    -0x30(%ebp),%dl
 40b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 40e:	83 c4 0c             	add    $0xc,%esp
 411:	6a 01                	push   $0x1
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	e8 21 fe ff ff       	call   23b <write>
 41a:	83 c4 10             	add    $0x10,%esp
 41d:	31 ff                	xor    %edi,%edi
 41f:	eb 8f                	jmp    3b0 <printf+0x38>
 421:	8d 76 00             	lea    0x0(%esi),%esi
 424:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 427:	8b 17                	mov    (%edi),%edx
 429:	83 ec 0c             	sub    $0xc,%esp
 42c:	6a 00                	push   $0x0
 42e:	b9 10 00 00 00       	mov    $0x10,%ecx
 433:	89 f0                	mov    %esi,%eax
 435:	e8 b2 fe ff ff       	call   2ec <printint>
 43a:	83 c7 04             	add    $0x4,%edi
 43d:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 440:	83 c4 10             	add    $0x10,%esp
 443:	31 ff                	xor    %edi,%edi
 445:	e9 66 ff ff ff       	jmp    3b0 <printf+0x38>
 44a:	66 90                	xchg   %ax,%ax
 44c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 44f:	8b 10                	mov    (%eax),%edx
 451:	83 c0 04             	add    $0x4,%eax
 454:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 457:	85 d2                	test   %edx,%edx
 459:	0f 84 81 00 00 00    	je     4e0 <printf+0x168>
 45f:	8a 02                	mov    (%edx),%al
 461:	84 c0                	test   %al,%al
 463:	0f 84 80 00 00 00    	je     4e9 <printf+0x171>
 469:	8d 7d e7             	lea    -0x19(%ebp),%edi
 46c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 46f:	89 d3                	mov    %edx,%ebx
 471:	8d 76 00             	lea    0x0(%esi),%esi
 474:	88 45 e7             	mov    %al,-0x19(%ebp)
 477:	50                   	push   %eax
 478:	6a 01                	push   $0x1
 47a:	57                   	push   %edi
 47b:	56                   	push   %esi
 47c:	e8 ba fd ff ff       	call   23b <write>
 481:	43                   	inc    %ebx
 482:	8a 03                	mov    (%ebx),%al
 484:	83 c4 10             	add    $0x10,%esp
 487:	84 c0                	test   %al,%al
 489:	75 e9                	jne    474 <printf+0xfc>
 48b:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 48e:	31 ff                	xor    %edi,%edi
 490:	e9 1b ff ff ff       	jmp    3b0 <printf+0x38>
 495:	8d 76 00             	lea    0x0(%esi),%esi
 498:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 49b:	8b 17                	mov    (%edi),%edx
 49d:	83 ec 0c             	sub    $0xc,%esp
 4a0:	6a 01                	push   $0x1
 4a2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4a7:	eb 8a                	jmp    433 <printf+0xbb>
 4a9:	8d 76 00             	lea    0x0(%esi),%esi
 4ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4af:	8b 00                	mov    (%eax),%eax
 4b1:	88 45 e7             	mov    %al,-0x19(%ebp)
 4b4:	51                   	push   %ecx
 4b5:	6a 01                	push   $0x1
 4b7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ba:	57                   	push   %edi
 4bb:	56                   	push   %esi
 4bc:	e8 7a fd ff ff       	call   23b <write>
 4c1:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	31 ff                	xor    %edi,%edi
 4ca:	e9 e1 fe ff ff       	jmp    3b0 <printf+0x38>
 4cf:	90                   	nop
 4d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d3:	52                   	push   %edx
 4d4:	6a 01                	push   $0x1
 4d6:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4d9:	e9 35 ff ff ff       	jmp    413 <printf+0x9b>
 4de:	66 90                	xchg   %ax,%ax
 4e0:	b0 28                	mov    $0x28,%al
 4e2:	ba d8 06 00 00       	mov    $0x6d8,%edx
 4e7:	eb 80                	jmp    469 <printf+0xf1>
 4e9:	31 ff                	xor    %edi,%edi
 4eb:	e9 c0 fe ff ff       	jmp    3b0 <printf+0x38>

000004f0 <free>:
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 0c             	sub    $0xc,%esp
 4f9:	8b 75 08             	mov    0x8(%ebp),%esi
 4fc:	8d 5e f8             	lea    -0x8(%esi),%ebx
 4ff:	8b 7e fc             	mov    -0x4(%esi),%edi
 502:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 509:	3d 00 80 00 00       	cmp    $0x8000,%eax
 50e:	75 70                	jne    580 <free+0x90>
 510:	b9 00 80 00 00       	mov    $0x8000,%ecx
 515:	a1 a0 07 00 00       	mov    0x7a0,%eax
 51a:	66 90                	xchg   %ax,%ax
 51c:	89 c2                	mov    %eax,%edx
 51e:	8b 00                	mov    (%eax),%eax
 520:	39 da                	cmp    %ebx,%edx
 522:	73 2c                	jae    550 <free+0x60>
 524:	39 c3                	cmp    %eax,%ebx
 526:	72 04                	jb     52c <free+0x3c>
 528:	39 c2                	cmp    %eax,%edx
 52a:	72 f0                	jb     51c <free+0x2c>
 52c:	01 d9                	add    %ebx,%ecx
 52e:	39 c8                	cmp    %ecx,%eax
 530:	74 2c                	je     55e <free+0x6e>
 532:	89 46 f8             	mov    %eax,-0x8(%esi)
 535:	8b 42 04             	mov    0x4(%edx),%eax
 538:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 53b:	39 cb                	cmp    %ecx,%ebx
 53d:	74 36                	je     575 <free+0x85>
 53f:	89 1a                	mov    %ebx,(%edx)
 541:	89 15 a0 07 00 00    	mov    %edx,0x7a0
 547:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54a:	5b                   	pop    %ebx
 54b:	5e                   	pop    %esi
 54c:	5f                   	pop    %edi
 54d:	5d                   	pop    %ebp
 54e:	c3                   	ret    
 54f:	90                   	nop
 550:	39 c2                	cmp    %eax,%edx
 552:	72 c8                	jb     51c <free+0x2c>
 554:	39 c3                	cmp    %eax,%ebx
 556:	73 c4                	jae    51c <free+0x2c>
 558:	01 d9                	add    %ebx,%ecx
 55a:	39 c8                	cmp    %ecx,%eax
 55c:	75 d4                	jne    532 <free+0x42>
 55e:	03 78 04             	add    0x4(%eax),%edi
 561:	89 7e fc             	mov    %edi,-0x4(%esi)
 564:	8b 02                	mov    (%edx),%eax
 566:	8b 00                	mov    (%eax),%eax
 568:	89 46 f8             	mov    %eax,-0x8(%esi)
 56b:	8b 42 04             	mov    0x4(%edx),%eax
 56e:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 571:	39 cb                	cmp    %ecx,%ebx
 573:	75 ca                	jne    53f <free+0x4f>
 575:	03 46 fc             	add    -0x4(%esi),%eax
 578:	89 42 04             	mov    %eax,0x4(%edx)
 57b:	8b 5e f8             	mov    -0x8(%esi),%ebx
 57e:	eb bf                	jmp    53f <free+0x4f>
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	f7 d8                	neg    %eax
 585:	50                   	push   %eax
 586:	e8 50 fd ff ff       	call   2db <increase_mem_usage>
 58b:	8b 7e fc             	mov    -0x4(%esi),%edi
 58e:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 595:	83 c4 10             	add    $0x10,%esp
 598:	e9 78 ff ff ff       	jmp    515 <free+0x25>
 59d:	8d 76 00             	lea    0x0(%esi),%esi

000005a0 <malloc>:
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 0c             	sub    $0xc,%esp
 5a9:	8b 7d 08             	mov    0x8(%ebp),%edi
 5ac:	e8 1a fd ff ff       	call   2cb <get_mem_limit>
 5b1:	89 c3                	mov    %eax,%ebx
 5b3:	e8 2b fd ff ff       	call   2e3 <get_mem_usage>
 5b8:	83 fb ff             	cmp    $0xffffffff,%ebx
 5bb:	74 0b                	je     5c8 <malloc+0x28>
 5bd:	8d 14 38             	lea    (%eax,%edi,1),%edx
 5c0:	39 d3                	cmp    %edx,%ebx
 5c2:	0f 82 e2 00 00 00    	jb     6aa <malloc+0x10a>
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	57                   	push   %edi
 5cc:	e8 0a fd ff ff       	call   2db <increase_mem_usage>
 5d1:	83 c7 07             	add    $0x7,%edi
 5d4:	c1 ef 03             	shr    $0x3,%edi
 5d7:	47                   	inc    %edi
 5d8:	8b 15 a0 07 00 00    	mov    0x7a0,%edx
 5de:	83 c4 10             	add    $0x10,%esp
 5e1:	85 d2                	test   %edx,%edx
 5e3:	0f 84 93 00 00 00    	je     67c <malloc+0xdc>
 5e9:	8b 02                	mov    (%edx),%eax
 5eb:	8b 48 04             	mov    0x4(%eax),%ecx
 5ee:	39 f9                	cmp    %edi,%ecx
 5f0:	73 62                	jae    654 <malloc+0xb4>
 5f2:	89 fb                	mov    %edi,%ebx
 5f4:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 5fa:	72 78                	jb     674 <malloc+0xd4>
 5fc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 603:	eb 0e                	jmp    613 <malloc+0x73>
 605:	8d 76 00             	lea    0x0(%esi),%esi
 608:	89 c2                	mov    %eax,%edx
 60a:	8b 02                	mov    (%edx),%eax
 60c:	8b 48 04             	mov    0x4(%eax),%ecx
 60f:	39 f9                	cmp    %edi,%ecx
 611:	73 41                	jae    654 <malloc+0xb4>
 613:	39 05 a0 07 00 00    	cmp    %eax,0x7a0
 619:	75 ed                	jne    608 <malloc+0x68>
 61b:	83 ec 0c             	sub    $0xc,%esp
 61e:	56                   	push   %esi
 61f:	e8 7f fc ff ff       	call   2a3 <sbrk>
 624:	83 c4 10             	add    $0x10,%esp
 627:	83 f8 ff             	cmp    $0xffffffff,%eax
 62a:	74 1c                	je     648 <malloc+0xa8>
 62c:	89 58 04             	mov    %ebx,0x4(%eax)
 62f:	83 ec 0c             	sub    $0xc,%esp
 632:	83 c0 08             	add    $0x8,%eax
 635:	50                   	push   %eax
 636:	e8 b5 fe ff ff       	call   4f0 <free>
 63b:	8b 15 a0 07 00 00    	mov    0x7a0,%edx
 641:	83 c4 10             	add    $0x10,%esp
 644:	85 d2                	test   %edx,%edx
 646:	75 c2                	jne    60a <malloc+0x6a>
 648:	31 c0                	xor    %eax,%eax
 64a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
 652:	66 90                	xchg   %ax,%ax
 654:	39 cf                	cmp    %ecx,%edi
 656:	74 4c                	je     6a4 <malloc+0x104>
 658:	29 f9                	sub    %edi,%ecx
 65a:	89 48 04             	mov    %ecx,0x4(%eax)
 65d:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 660:	89 78 04             	mov    %edi,0x4(%eax)
 663:	89 15 a0 07 00 00    	mov    %edx,0x7a0
 669:	83 c0 08             	add    $0x8,%eax
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	bb 00 10 00 00       	mov    $0x1000,%ebx
 679:	eb 81                	jmp    5fc <malloc+0x5c>
 67b:	90                   	nop
 67c:	c7 05 a0 07 00 00 a4 	movl   $0x7a4,0x7a0
 683:	07 00 00 
 686:	c7 05 a4 07 00 00 a4 	movl   $0x7a4,0x7a4
 68d:	07 00 00 
 690:	c7 05 a8 07 00 00 00 	movl   $0x0,0x7a8
 697:	00 00 00 
 69a:	b8 a4 07 00 00       	mov    $0x7a4,%eax
 69f:	e9 4e ff ff ff       	jmp    5f2 <malloc+0x52>
 6a4:	8b 08                	mov    (%eax),%ecx
 6a6:	89 0a                	mov    %ecx,(%edx)
 6a8:	eb b9                	jmp    663 <malloc+0xc3>
 6aa:	83 ec 0c             	sub    $0xc,%esp
 6ad:	57                   	push   %edi
 6ae:	50                   	push   %eax
 6af:	53                   	push   %ebx
 6b0:	68 4c 07 00 00       	push   $0x74c
 6b5:	6a 02                	push   $0x2
 6b7:	e8 bc fc ff ff       	call   378 <printf>
 6bc:	83 c4 20             	add    $0x20,%esp
 6bf:	31 c0                	xor    %eax,%eax
 6c1:	eb 87                	jmp    64a <malloc+0xaa>
