
_ls:     file format elf32-i386


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
  1c:	7e 1e                	jle    3c <main+0x3c>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	90                   	nop
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 34 9f             	pushl  (%edi,%ebx,4)
  2a:	e8 b1 00 00 00       	call   e0 <ls>
  2f:	43                   	inc    %ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	39 de                	cmp    %ebx,%esi
  35:	75 ed                	jne    24 <main+0x24>
  37:	e8 7b 04 00 00       	call   4b7 <exit>
  3c:	83 ec 0c             	sub    $0xc,%esp
  3f:	68 a8 09 00 00       	push   $0x9a8
  44:	e8 97 00 00 00       	call   e0 <ls>
  49:	e8 69 04 00 00       	call   4b7 <exit>
  4e:	66 90                	xchg   %ax,%ax

00000050 <fmtname>:
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	56                   	push   %esi
  54:	53                   	push   %ebx
  55:	8b 75 08             	mov    0x8(%ebp),%esi
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	56                   	push   %esi
  5c:	e8 f7 02 00 00       	call   358 <strlen>
  61:	83 c4 10             	add    $0x10,%esp
  64:	01 f0                	add    %esi,%eax
  66:	89 c3                	mov    %eax,%ebx
  68:	73 0b                	jae    75 <fmtname+0x25>
  6a:	eb 0e                	jmp    7a <fmtname+0x2a>
  6c:	8d 43 ff             	lea    -0x1(%ebx),%eax
  6f:	39 f0                	cmp    %esi,%eax
  71:	72 08                	jb     7b <fmtname+0x2b>
  73:	89 c3                	mov    %eax,%ebx
  75:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  78:	75 f2                	jne    6c <fmtname+0x1c>
  7a:	43                   	inc    %ebx
  7b:	83 ec 0c             	sub    $0xc,%esp
  7e:	53                   	push   %ebx
  7f:	e8 d4 02 00 00       	call   358 <strlen>
  84:	83 c4 10             	add    $0x10,%esp
  87:	83 f8 0d             	cmp    $0xd,%eax
  8a:	77 4a                	ja     d6 <fmtname+0x86>
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	53                   	push   %ebx
  90:	e8 c3 02 00 00       	call   358 <strlen>
  95:	83 c4 0c             	add    $0xc,%esp
  98:	50                   	push   %eax
  99:	53                   	push   %ebx
  9a:	68 74 0a 00 00       	push   $0xa74
  9f:	e8 e8 03 00 00       	call   48c <memmove>
  a4:	89 1c 24             	mov    %ebx,(%esp)
  a7:	e8 ac 02 00 00       	call   358 <strlen>
  ac:	89 c6                	mov    %eax,%esi
  ae:	89 1c 24             	mov    %ebx,(%esp)
  b1:	e8 a2 02 00 00       	call   358 <strlen>
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	ba 0e 00 00 00       	mov    $0xe,%edx
  be:	29 f2                	sub    %esi,%edx
  c0:	52                   	push   %edx
  c1:	6a 20                	push   $0x20
  c3:	05 74 0a 00 00       	add    $0xa74,%eax
  c8:	50                   	push   %eax
  c9:	e8 b2 02 00 00       	call   380 <memset>
  ce:	83 c4 10             	add    $0x10,%esp
  d1:	bb 74 0a 00 00       	mov    $0xa74,%ebx
  d6:	89 d8                	mov    %ebx,%eax
  d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  db:	5b                   	pop    %ebx
  dc:	5e                   	pop    %esi
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop

000000e0 <ls>:
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	81 ec 64 02 00 00    	sub    $0x264,%esp
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  ef:	6a 00                	push   $0x0
  f1:	57                   	push   %edi
  f2:	e8 00 04 00 00       	call   4f7 <open>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	85 c0                	test   %eax,%eax
  fc:	0f 88 82 01 00 00    	js     284 <ls+0x1a4>
 102:	89 c3                	mov    %eax,%ebx
 104:	83 ec 08             	sub    $0x8,%esp
 107:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 10d:	56                   	push   %esi
 10e:	50                   	push   %eax
 10f:	e8 fb 03 00 00       	call   50f <fstat>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	0f 88 99 01 00 00    	js     2b8 <ls+0x1d8>
 11f:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 125:	66 83 f8 01          	cmp    $0x1,%ax
 129:	74 59                	je     184 <ls+0xa4>
 12b:	66 83 f8 02          	cmp    $0x2,%ax
 12f:	74 17                	je     148 <ls+0x68>
 131:	83 ec 0c             	sub    $0xc,%esp
 134:	53                   	push   %ebx
 135:	e8 a5 03 00 00       	call   4df <close>
 13a:	83 c4 10             	add    $0x10,%esp
 13d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 14e:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 154:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 15a:	83 ec 0c             	sub    $0xc,%esp
 15d:	57                   	push   %edi
 15e:	e8 ed fe ff ff       	call   50 <fmtname>
 163:	59                   	pop    %ecx
 164:	5f                   	pop    %edi
 165:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 16b:	52                   	push   %edx
 16c:	56                   	push   %esi
 16d:	6a 02                	push   $0x2
 16f:	50                   	push   %eax
 170:	68 88 09 00 00       	push   $0x988
 175:	6a 01                	push   $0x1
 177:	e8 98 04 00 00       	call   614 <printf>
 17c:	83 c4 20             	add    $0x20,%esp
 17f:	eb b0                	jmp    131 <ls+0x51>
 181:	8d 76 00             	lea    0x0(%esi),%esi
 184:	83 ec 0c             	sub    $0xc,%esp
 187:	57                   	push   %edi
 188:	e8 cb 01 00 00       	call   358 <strlen>
 18d:	83 c0 10             	add    $0x10,%eax
 190:	83 c4 10             	add    $0x10,%esp
 193:	3d 00 02 00 00       	cmp    $0x200,%eax
 198:	0f 87 02 01 00 00    	ja     2a0 <ls+0x1c0>
 19e:	83 ec 08             	sub    $0x8,%esp
 1a1:	57                   	push   %edi
 1a2:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1a8:	57                   	push   %edi
 1a9:	e8 46 01 00 00       	call   2f4 <strcpy>
 1ae:	89 3c 24             	mov    %edi,(%esp)
 1b1:	e8 a2 01 00 00       	call   358 <strlen>
 1b6:	8d 0c 07             	lea    (%edi,%eax,1),%ecx
 1b9:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
 1bf:	8d 44 07 01          	lea    0x1(%edi,%eax,1),%eax
 1c3:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
 1c9:	c6 01 2f             	movb   $0x2f,(%ecx)
 1cc:	83 c4 10             	add    $0x10,%esp
 1cf:	90                   	nop
 1d0:	50                   	push   %eax
 1d1:	6a 10                	push   $0x10
 1d3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1d9:	50                   	push   %eax
 1da:	53                   	push   %ebx
 1db:	e8 ef 02 00 00       	call   4cf <read>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	83 f8 10             	cmp    $0x10,%eax
 1e6:	0f 85 45 ff ff ff    	jne    131 <ls+0x51>
 1ec:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 1f3:	00 
 1f4:	74 da                	je     1d0 <ls+0xf0>
 1f6:	50                   	push   %eax
 1f7:	6a 0e                	push   $0xe
 1f9:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 1ff:	50                   	push   %eax
 200:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 206:	e8 81 02 00 00       	call   48c <memmove>
 20b:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 211:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
 215:	58                   	pop    %eax
 216:	5a                   	pop    %edx
 217:	56                   	push   %esi
 218:	57                   	push   %edi
 219:	e8 f2 01 00 00       	call   410 <stat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	85 c0                	test   %eax,%eax
 223:	0f 88 b3 00 00 00    	js     2dc <ls+0x1fc>
 229:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 22f:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 235:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 23b:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 241:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 248:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	57                   	push   %edi
 252:	e8 f9 fd ff ff       	call   50 <fmtname>
 257:	5a                   	pop    %edx
 258:	59                   	pop    %ecx
 259:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 25f:	51                   	push   %ecx
 260:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 266:	52                   	push   %edx
 267:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 26d:	50                   	push   %eax
 26e:	68 88 09 00 00       	push   $0x988
 273:	6a 01                	push   $0x1
 275:	e8 9a 03 00 00       	call   614 <printf>
 27a:	83 c4 20             	add    $0x20,%esp
 27d:	e9 4e ff ff ff       	jmp    1d0 <ls+0xf0>
 282:	66 90                	xchg   %ax,%ax
 284:	50                   	push   %eax
 285:	57                   	push   %edi
 286:	68 60 09 00 00       	push   $0x960
 28b:	6a 02                	push   $0x2
 28d:	e8 82 03 00 00       	call   614 <printf>
 292:	83 c4 10             	add    $0x10,%esp
 295:	8d 65 f4             	lea    -0xc(%ebp),%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	68 95 09 00 00       	push   $0x995
 2a8:	6a 01                	push   $0x1
 2aa:	e8 65 03 00 00       	call   614 <printf>
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	e9 7a fe ff ff       	jmp    131 <ls+0x51>
 2b7:	90                   	nop
 2b8:	50                   	push   %eax
 2b9:	57                   	push   %edi
 2ba:	68 74 09 00 00       	push   $0x974
 2bf:	6a 02                	push   $0x2
 2c1:	e8 4e 03 00 00       	call   614 <printf>
 2c6:	89 1c 24             	mov    %ebx,(%esp)
 2c9:	e8 11 02 00 00       	call   4df <close>
 2ce:	83 c4 10             	add    $0x10,%esp
 2d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d4:	5b                   	pop    %ebx
 2d5:	5e                   	pop    %esi
 2d6:	5f                   	pop    %edi
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret    
 2d9:	8d 76 00             	lea    0x0(%esi),%esi
 2dc:	50                   	push   %eax
 2dd:	57                   	push   %edi
 2de:	68 74 09 00 00       	push   $0x974
 2e3:	6a 01                	push   $0x1
 2e5:	e8 2a 03 00 00       	call   614 <printf>
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	e9 de fe ff ff       	jmp    1d0 <ls+0xf0>
 2f2:	66 90                	xchg   %ax,%ax

000002f4 <strcpy>:
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	53                   	push   %ebx
 2f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2fe:	31 c0                	xor    %eax,%eax
 300:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 303:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 306:	40                   	inc    %eax
 307:	84 d2                	test   %dl,%dl
 309:	75 f5                	jne    300 <strcpy+0xc>
 30b:	89 c8                	mov    %ecx,%eax
 30d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 310:	c9                   	leave  
 311:	c3                   	ret    
 312:	66 90                	xchg   %ax,%ax

00000314 <strcmp>:
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	53                   	push   %ebx
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 31e:	0f b6 02             	movzbl (%edx),%eax
 321:	84 c0                	test   %al,%al
 323:	75 10                	jne    335 <strcmp+0x21>
 325:	eb 2a                	jmp    351 <strcmp+0x3d>
 327:	90                   	nop
 328:	42                   	inc    %edx
 329:	8d 4b 01             	lea    0x1(%ebx),%ecx
 32c:	0f b6 02             	movzbl (%edx),%eax
 32f:	84 c0                	test   %al,%al
 331:	74 11                	je     344 <strcmp+0x30>
 333:	89 cb                	mov    %ecx,%ebx
 335:	0f b6 0b             	movzbl (%ebx),%ecx
 338:	38 c1                	cmp    %al,%cl
 33a:	74 ec                	je     328 <strcmp+0x14>
 33c:	29 c8                	sub    %ecx,%eax
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	c9                   	leave  
 342:	c3                   	ret    
 343:	90                   	nop
 344:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 348:	31 c0                	xor    %eax,%eax
 34a:	29 c8                	sub    %ecx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave  
 350:	c3                   	ret    
 351:	0f b6 0b             	movzbl (%ebx),%ecx
 354:	31 c0                	xor    %eax,%eax
 356:	eb e4                	jmp    33c <strcmp+0x28>

00000358 <strlen>:
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	8b 55 08             	mov    0x8(%ebp),%edx
 35e:	80 3a 00             	cmpb   $0x0,(%edx)
 361:	74 15                	je     378 <strlen+0x20>
 363:	31 c0                	xor    %eax,%eax
 365:	8d 76 00             	lea    0x0(%esi),%esi
 368:	40                   	inc    %eax
 369:	89 c1                	mov    %eax,%ecx
 36b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 36f:	75 f7                	jne    368 <strlen+0x10>
 371:	89 c8                	mov    %ecx,%eax
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    
 375:	8d 76 00             	lea    0x0(%esi),%esi
 378:	31 c9                	xor    %ecx,%ecx
 37a:	89 c8                	mov    %ecx,%eax
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <memset>:
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 7d 08             	mov    0x8(%ebp),%edi
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	fc                   	cld    
 38e:	f3 aa                	rep stos %al,%es:(%edi)
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	8b 7d fc             	mov    -0x4(%ebp),%edi
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <strchr>:
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 3a1:	8a 10                	mov    (%eax),%dl
 3a3:	84 d2                	test   %dl,%dl
 3a5:	75 0c                	jne    3b3 <strchr+0x1b>
 3a7:	eb 13                	jmp    3bc <strchr+0x24>
 3a9:	8d 76 00             	lea    0x0(%esi),%esi
 3ac:	40                   	inc    %eax
 3ad:	8a 10                	mov    (%eax),%dl
 3af:	84 d2                	test   %dl,%dl
 3b1:	74 09                	je     3bc <strchr+0x24>
 3b3:	38 d1                	cmp    %dl,%cl
 3b5:	75 f5                	jne    3ac <strchr+0x14>
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d 76 00             	lea    0x0(%esi),%esi
 3bc:	31 c0                	xor    %eax,%eax
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <gets>:
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 1c             	sub    $0x1c,%esp
 3c9:	31 db                	xor    %ebx,%ebx
 3cb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3ce:	eb 24                	jmp    3f4 <gets+0x34>
 3d0:	50                   	push   %eax
 3d1:	6a 01                	push   $0x1
 3d3:	56                   	push   %esi
 3d4:	6a 00                	push   $0x0
 3d6:	e8 f4 00 00 00       	call   4cf <read>
 3db:	83 c4 10             	add    $0x10,%esp
 3de:	85 c0                	test   %eax,%eax
 3e0:	7e 1a                	jle    3fc <gets+0x3c>
 3e2:	8a 45 e7             	mov    -0x19(%ebp),%al
 3e5:	8b 55 08             	mov    0x8(%ebp),%edx
 3e8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 3ec:	3c 0a                	cmp    $0xa,%al
 3ee:	74 0e                	je     3fe <gets+0x3e>
 3f0:	3c 0d                	cmp    $0xd,%al
 3f2:	74 0a                	je     3fe <gets+0x3e>
 3f4:	89 df                	mov    %ebx,%edi
 3f6:	43                   	inc    %ebx
 3f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3fa:	7c d4                	jl     3d0 <gets+0x10>
 3fc:	89 fb                	mov    %edi,%ebx
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 405:	8d 65 f4             	lea    -0xc(%ebp),%esp
 408:	5b                   	pop    %ebx
 409:	5e                   	pop    %esi
 40a:	5f                   	pop    %edi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <stat>:
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	83 ec 08             	sub    $0x8,%esp
 418:	6a 00                	push   $0x0
 41a:	ff 75 08             	pushl  0x8(%ebp)
 41d:	e8 d5 00 00 00       	call   4f7 <open>
 422:	83 c4 10             	add    $0x10,%esp
 425:	85 c0                	test   %eax,%eax
 427:	78 27                	js     450 <stat+0x40>
 429:	89 c3                	mov    %eax,%ebx
 42b:	83 ec 08             	sub    $0x8,%esp
 42e:	ff 75 0c             	pushl  0xc(%ebp)
 431:	50                   	push   %eax
 432:	e8 d8 00 00 00       	call   50f <fstat>
 437:	89 c6                	mov    %eax,%esi
 439:	89 1c 24             	mov    %ebx,(%esp)
 43c:	e8 9e 00 00 00       	call   4df <close>
 441:	83 c4 10             	add    $0x10,%esp
 444:	89 f0                	mov    %esi,%eax
 446:	8d 65 f8             	lea    -0x8(%ebp),%esp
 449:	5b                   	pop    %ebx
 44a:	5e                   	pop    %esi
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	be ff ff ff ff       	mov    $0xffffffff,%esi
 455:	eb ed                	jmp    444 <stat+0x34>
 457:	90                   	nop

00000458 <atoi>:
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	53                   	push   %ebx
 45c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 45f:	0f be 01             	movsbl (%ecx),%eax
 462:	8d 50 d0             	lea    -0x30(%eax),%edx
 465:	80 fa 09             	cmp    $0x9,%dl
 468:	ba 00 00 00 00       	mov    $0x0,%edx
 46d:	77 16                	ja     485 <atoi+0x2d>
 46f:	90                   	nop
 470:	41                   	inc    %ecx
 471:	8d 14 92             	lea    (%edx,%edx,4),%edx
 474:	01 d2                	add    %edx,%edx
 476:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 47a:	0f be 01             	movsbl (%ecx),%eax
 47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 480:	80 fb 09             	cmp    $0x9,%bl
 483:	76 eb                	jbe    470 <atoi+0x18>
 485:	89 d0                	mov    %edx,%eax
 487:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48a:	c9                   	leave  
 48b:	c3                   	ret    

0000048c <memmove>:
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	8b 55 08             	mov    0x8(%ebp),%edx
 494:	8b 75 0c             	mov    0xc(%ebp),%esi
 497:	8b 45 10             	mov    0x10(%ebp),%eax
 49a:	85 c0                	test   %eax,%eax
 49c:	7e 0b                	jle    4a9 <memmove+0x1d>
 49e:	01 d0                	add    %edx,%eax
 4a0:	89 d7                	mov    %edx,%edi
 4a2:	66 90                	xchg   %ax,%ax
 4a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 4a5:	39 f8                	cmp    %edi,%eax
 4a7:	75 fb                	jne    4a4 <memmove+0x18>
 4a9:	89 d0                	mov    %edx,%eax
 4ab:	5e                   	pop    %esi
 4ac:	5f                   	pop    %edi
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    

000004af <fork>:
 4af:	b8 01 00 00 00       	mov    $0x1,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <exit>:
 4b7:	b8 02 00 00 00       	mov    $0x2,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <wait>:
 4bf:	b8 03 00 00 00       	mov    $0x3,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <pipe>:
 4c7:	b8 04 00 00 00       	mov    $0x4,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <read>:
 4cf:	b8 05 00 00 00       	mov    $0x5,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <write>:
 4d7:	b8 10 00 00 00       	mov    $0x10,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <close>:
 4df:	b8 15 00 00 00       	mov    $0x15,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <kill>:
 4e7:	b8 06 00 00 00       	mov    $0x6,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <exec>:
 4ef:	b8 07 00 00 00       	mov    $0x7,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <open>:
 4f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <mknod>:
 4ff:	b8 11 00 00 00       	mov    $0x11,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <unlink>:
 507:	b8 12 00 00 00       	mov    $0x12,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <fstat>:
 50f:	b8 08 00 00 00       	mov    $0x8,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <link>:
 517:	b8 13 00 00 00       	mov    $0x13,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <mkdir>:
 51f:	b8 14 00 00 00       	mov    $0x14,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <chdir>:
 527:	b8 09 00 00 00       	mov    $0x9,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <dup>:
 52f:	b8 0a 00 00 00       	mov    $0xa,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <getpid>:
 537:	b8 0b 00 00 00       	mov    $0xb,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <sbrk>:
 53f:	b8 0c 00 00 00       	mov    $0xc,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <sleep>:
 547:	b8 0d 00 00 00       	mov    $0xd,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <uptime>:
 54f:	b8 0e 00 00 00       	mov    $0xe,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <cpu_limit>:
 557:	b8 16 00 00 00       	mov    $0x16,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <set_mem_limit>:
 55f:	b8 17 00 00 00       	mov    $0x17,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <get_mem_limit>:
 567:	b8 18 00 00 00       	mov    $0x18,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <increase_mem_limit>:
 56f:	b8 19 00 00 00       	mov    $0x19,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <increase_mem_usage>:
 577:	b8 1a 00 00 00       	mov    $0x1a,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <get_mem_usage>:
 57f:	b8 1b 00 00 00       	mov    $0x1b,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    
 587:	90                   	nop

00000588 <printint>:
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
 58e:	83 ec 3c             	sub    $0x3c,%esp
 591:	89 45 c0             	mov    %eax,-0x40(%ebp)
 594:	89 cb                	mov    %ecx,%ebx
 596:	8b 4d 08             	mov    0x8(%ebp),%ecx
 599:	85 c9                	test   %ecx,%ecx
 59b:	74 04                	je     5a1 <printint+0x19>
 59d:	85 d2                	test   %edx,%edx
 59f:	78 6b                	js     60c <printint+0x84>
 5a1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 5a4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 5ab:	31 c9                	xor    %ecx,%ecx
 5ad:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5b0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5b3:	31 d2                	xor    %edx,%edx
 5b5:	f7 f3                	div    %ebx
 5b7:	89 cf                	mov    %ecx,%edi
 5b9:	8d 49 01             	lea    0x1(%ecx),%ecx
 5bc:	8a 92 0c 0a 00 00    	mov    0xa0c(%edx),%dl
 5c2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 5c6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 5c9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 5cc:	39 da                	cmp    %ebx,%edx
 5ce:	73 e0                	jae    5b0 <printint+0x28>
 5d0:	8b 55 08             	mov    0x8(%ebp),%edx
 5d3:	85 d2                	test   %edx,%edx
 5d5:	74 07                	je     5de <printint+0x56>
 5d7:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 5dc:	89 cf                	mov    %ecx,%edi
 5de:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5e1:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
 5e8:	8a 07                	mov    (%edi),%al
 5ea:	88 45 d7             	mov    %al,-0x29(%ebp)
 5ed:	50                   	push   %eax
 5ee:	6a 01                	push   $0x1
 5f0:	56                   	push   %esi
 5f1:	ff 75 c0             	pushl  -0x40(%ebp)
 5f4:	e8 de fe ff ff       	call   4d7 <write>
 5f9:	89 f8                	mov    %edi,%eax
 5fb:	4f                   	dec    %edi
 5fc:	83 c4 10             	add    $0x10,%esp
 5ff:	39 d8                	cmp    %ebx,%eax
 601:	75 e5                	jne    5e8 <printint+0x60>
 603:	8d 65 f4             	lea    -0xc(%ebp),%esp
 606:	5b                   	pop    %ebx
 607:	5e                   	pop    %esi
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret    
 60b:	90                   	nop
 60c:	f7 da                	neg    %edx
 60e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 611:	eb 98                	jmp    5ab <printint+0x23>
 613:	90                   	nop

00000614 <printf>:
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	57                   	push   %edi
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 2c             	sub    $0x2c,%esp
 61d:	8b 75 08             	mov    0x8(%ebp),%esi
 620:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 623:	8a 13                	mov    (%ebx),%dl
 625:	84 d2                	test   %dl,%dl
 627:	74 5c                	je     685 <printf+0x71>
 629:	43                   	inc    %ebx
 62a:	8d 45 10             	lea    0x10(%ebp),%eax
 62d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 630:	31 ff                	xor    %edi,%edi
 632:	eb 20                	jmp    654 <printf+0x40>
 634:	83 f8 25             	cmp    $0x25,%eax
 637:	74 3f                	je     678 <printf+0x64>
 639:	88 55 e7             	mov    %dl,-0x19(%ebp)
 63c:	50                   	push   %eax
 63d:	6a 01                	push   $0x1
 63f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 642:	50                   	push   %eax
 643:	56                   	push   %esi
 644:	e8 8e fe ff ff       	call   4d7 <write>
 649:	83 c4 10             	add    $0x10,%esp
 64c:	43                   	inc    %ebx
 64d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 650:	84 d2                	test   %dl,%dl
 652:	74 31                	je     685 <printf+0x71>
 654:	0f b6 c2             	movzbl %dl,%eax
 657:	85 ff                	test   %edi,%edi
 659:	74 d9                	je     634 <printf+0x20>
 65b:	83 ff 25             	cmp    $0x25,%edi
 65e:	75 ec                	jne    64c <printf+0x38>
 660:	83 f8 25             	cmp    $0x25,%eax
 663:	0f 84 03 01 00 00    	je     76c <printf+0x158>
 669:	83 e8 63             	sub    $0x63,%eax
 66c:	83 f8 15             	cmp    $0x15,%eax
 66f:	77 1f                	ja     690 <printf+0x7c>
 671:	ff 24 85 b4 09 00 00 	jmp    *0x9b4(,%eax,4)
 678:	bf 25 00 00 00       	mov    $0x25,%edi
 67d:	43                   	inc    %ebx
 67e:	8a 53 ff             	mov    -0x1(%ebx),%dl
 681:	84 d2                	test   %dl,%dl
 683:	75 cf                	jne    654 <printf+0x40>
 685:	8d 65 f4             	lea    -0xc(%ebp),%esp
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5f                   	pop    %edi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8d 76 00             	lea    0x0(%esi),%esi
 690:	88 55 d0             	mov    %dl,-0x30(%ebp)
 693:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 697:	50                   	push   %eax
 698:	6a 01                	push   $0x1
 69a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 69d:	57                   	push   %edi
 69e:	56                   	push   %esi
 69f:	e8 33 fe ff ff       	call   4d7 <write>
 6a4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 6a7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6aa:	83 c4 0c             	add    $0xc,%esp
 6ad:	6a 01                	push   $0x1
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 21 fe ff ff       	call   4d7 <write>
 6b6:	83 c4 10             	add    $0x10,%esp
 6b9:	31 ff                	xor    %edi,%edi
 6bb:	eb 8f                	jmp    64c <printf+0x38>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
 6c0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6c3:	8b 17                	mov    (%edi),%edx
 6c5:	83 ec 0c             	sub    $0xc,%esp
 6c8:	6a 00                	push   $0x0
 6ca:	b9 10 00 00 00       	mov    $0x10,%ecx
 6cf:	89 f0                	mov    %esi,%eax
 6d1:	e8 b2 fe ff ff       	call   588 <printint>
 6d6:	83 c7 04             	add    $0x4,%edi
 6d9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	31 ff                	xor    %edi,%edi
 6e1:	e9 66 ff ff ff       	jmp    64c <printf+0x38>
 6e6:	66 90                	xchg   %ax,%ax
 6e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6eb:	8b 10                	mov    (%eax),%edx
 6ed:	83 c0 04             	add    $0x4,%eax
 6f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6f3:	85 d2                	test   %edx,%edx
 6f5:	0f 84 81 00 00 00    	je     77c <printf+0x168>
 6fb:	8a 02                	mov    (%edx),%al
 6fd:	84 c0                	test   %al,%al
 6ff:	0f 84 80 00 00 00    	je     785 <printf+0x171>
 705:	8d 7d e7             	lea    -0x19(%ebp),%edi
 708:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 70b:	89 d3                	mov    %edx,%ebx
 70d:	8d 76 00             	lea    0x0(%esi),%esi
 710:	88 45 e7             	mov    %al,-0x19(%ebp)
 713:	50                   	push   %eax
 714:	6a 01                	push   $0x1
 716:	57                   	push   %edi
 717:	56                   	push   %esi
 718:	e8 ba fd ff ff       	call   4d7 <write>
 71d:	43                   	inc    %ebx
 71e:	8a 03                	mov    (%ebx),%al
 720:	83 c4 10             	add    $0x10,%esp
 723:	84 c0                	test   %al,%al
 725:	75 e9                	jne    710 <printf+0xfc>
 727:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72a:	31 ff                	xor    %edi,%edi
 72c:	e9 1b ff ff ff       	jmp    64c <printf+0x38>
 731:	8d 76 00             	lea    0x0(%esi),%esi
 734:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 737:	8b 17                	mov    (%edi),%edx
 739:	83 ec 0c             	sub    $0xc,%esp
 73c:	6a 01                	push   $0x1
 73e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 743:	eb 8a                	jmp    6cf <printf+0xbb>
 745:	8d 76 00             	lea    0x0(%esi),%esi
 748:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 74b:	8b 00                	mov    (%eax),%eax
 74d:	88 45 e7             	mov    %al,-0x19(%ebp)
 750:	51                   	push   %ecx
 751:	6a 01                	push   $0x1
 753:	8d 7d e7             	lea    -0x19(%ebp),%edi
 756:	57                   	push   %edi
 757:	56                   	push   %esi
 758:	e8 7a fd ff ff       	call   4d7 <write>
 75d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 761:	83 c4 10             	add    $0x10,%esp
 764:	31 ff                	xor    %edi,%edi
 766:	e9 e1 fe ff ff       	jmp    64c <printf+0x38>
 76b:	90                   	nop
 76c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 76f:	52                   	push   %edx
 770:	6a 01                	push   $0x1
 772:	8d 7d e7             	lea    -0x19(%ebp),%edi
 775:	e9 35 ff ff ff       	jmp    6af <printf+0x9b>
 77a:	66 90                	xchg   %ax,%ax
 77c:	b0 28                	mov    $0x28,%al
 77e:	ba aa 09 00 00       	mov    $0x9aa,%edx
 783:	eb 80                	jmp    705 <printf+0xf1>
 785:	31 ff                	xor    %edi,%edi
 787:	e9 c0 fe ff ff       	jmp    64c <printf+0x38>

0000078c <free>:
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	57                   	push   %edi
 790:	56                   	push   %esi
 791:	53                   	push   %ebx
 792:	83 ec 0c             	sub    $0xc,%esp
 795:	8b 75 08             	mov    0x8(%ebp),%esi
 798:	8d 5e f8             	lea    -0x8(%esi),%ebx
 79b:	8b 7e fc             	mov    -0x4(%esi),%edi
 79e:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 7a5:	3d 00 80 00 00       	cmp    $0x8000,%eax
 7aa:	75 70                	jne    81c <free+0x90>
 7ac:	b9 00 80 00 00       	mov    $0x8000,%ecx
 7b1:	a1 84 0a 00 00       	mov    0xa84,%eax
 7b6:	66 90                	xchg   %ax,%ax
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	39 da                	cmp    %ebx,%edx
 7be:	73 2c                	jae    7ec <free+0x60>
 7c0:	39 c3                	cmp    %eax,%ebx
 7c2:	72 04                	jb     7c8 <free+0x3c>
 7c4:	39 c2                	cmp    %eax,%edx
 7c6:	72 f0                	jb     7b8 <free+0x2c>
 7c8:	01 d9                	add    %ebx,%ecx
 7ca:	39 c8                	cmp    %ecx,%eax
 7cc:	74 2c                	je     7fa <free+0x6e>
 7ce:	89 46 f8             	mov    %eax,-0x8(%esi)
 7d1:	8b 42 04             	mov    0x4(%edx),%eax
 7d4:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 7d7:	39 cb                	cmp    %ecx,%ebx
 7d9:	74 36                	je     811 <free+0x85>
 7db:	89 1a                	mov    %ebx,(%edx)
 7dd:	89 15 84 0a 00 00    	mov    %edx,0xa84
 7e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    
 7eb:	90                   	nop
 7ec:	39 c2                	cmp    %eax,%edx
 7ee:	72 c8                	jb     7b8 <free+0x2c>
 7f0:	39 c3                	cmp    %eax,%ebx
 7f2:	73 c4                	jae    7b8 <free+0x2c>
 7f4:	01 d9                	add    %ebx,%ecx
 7f6:	39 c8                	cmp    %ecx,%eax
 7f8:	75 d4                	jne    7ce <free+0x42>
 7fa:	03 78 04             	add    0x4(%eax),%edi
 7fd:	89 7e fc             	mov    %edi,-0x4(%esi)
 800:	8b 02                	mov    (%edx),%eax
 802:	8b 00                	mov    (%eax),%eax
 804:	89 46 f8             	mov    %eax,-0x8(%esi)
 807:	8b 42 04             	mov    0x4(%edx),%eax
 80a:	8d 0c c2             	lea    (%edx,%eax,8),%ecx
 80d:	39 cb                	cmp    %ecx,%ebx
 80f:	75 ca                	jne    7db <free+0x4f>
 811:	03 46 fc             	add    -0x4(%esi),%eax
 814:	89 42 04             	mov    %eax,0x4(%edx)
 817:	8b 5e f8             	mov    -0x8(%esi),%ebx
 81a:	eb bf                	jmp    7db <free+0x4f>
 81c:	83 ec 0c             	sub    $0xc,%esp
 81f:	f7 d8                	neg    %eax
 821:	50                   	push   %eax
 822:	e8 50 fd ff ff       	call   577 <increase_mem_usage>
 827:	8b 7e fc             	mov    -0x4(%esi),%edi
 82a:	8d 0c fd 00 00 00 00 	lea    0x0(,%edi,8),%ecx
 831:	83 c4 10             	add    $0x10,%esp
 834:	e9 78 ff ff ff       	jmp    7b1 <free+0x25>
 839:	8d 76 00             	lea    0x0(%esi),%esi

0000083c <malloc>:
 83c:	55                   	push   %ebp
 83d:	89 e5                	mov    %esp,%ebp
 83f:	57                   	push   %edi
 840:	56                   	push   %esi
 841:	53                   	push   %ebx
 842:	83 ec 0c             	sub    $0xc,%esp
 845:	8b 7d 08             	mov    0x8(%ebp),%edi
 848:	e8 1a fd ff ff       	call   567 <get_mem_limit>
 84d:	89 c3                	mov    %eax,%ebx
 84f:	e8 2b fd ff ff       	call   57f <get_mem_usage>
 854:	83 fb ff             	cmp    $0xffffffff,%ebx
 857:	74 0b                	je     864 <malloc+0x28>
 859:	8d 14 38             	lea    (%eax,%edi,1),%edx
 85c:	39 d3                	cmp    %edx,%ebx
 85e:	0f 82 e2 00 00 00    	jb     946 <malloc+0x10a>
 864:	83 ec 0c             	sub    $0xc,%esp
 867:	57                   	push   %edi
 868:	e8 0a fd ff ff       	call   577 <increase_mem_usage>
 86d:	83 c7 07             	add    $0x7,%edi
 870:	c1 ef 03             	shr    $0x3,%edi
 873:	47                   	inc    %edi
 874:	8b 15 84 0a 00 00    	mov    0xa84,%edx
 87a:	83 c4 10             	add    $0x10,%esp
 87d:	85 d2                	test   %edx,%edx
 87f:	0f 84 93 00 00 00    	je     918 <malloc+0xdc>
 885:	8b 02                	mov    (%edx),%eax
 887:	8b 48 04             	mov    0x4(%eax),%ecx
 88a:	39 f9                	cmp    %edi,%ecx
 88c:	73 62                	jae    8f0 <malloc+0xb4>
 88e:	89 fb                	mov    %edi,%ebx
 890:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 896:	72 78                	jb     910 <malloc+0xd4>
 898:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 89f:	eb 0e                	jmp    8af <malloc+0x73>
 8a1:	8d 76 00             	lea    0x0(%esi),%esi
 8a4:	89 c2                	mov    %eax,%edx
 8a6:	8b 02                	mov    (%edx),%eax
 8a8:	8b 48 04             	mov    0x4(%eax),%ecx
 8ab:	39 f9                	cmp    %edi,%ecx
 8ad:	73 41                	jae    8f0 <malloc+0xb4>
 8af:	39 05 84 0a 00 00    	cmp    %eax,0xa84
 8b5:	75 ed                	jne    8a4 <malloc+0x68>
 8b7:	83 ec 0c             	sub    $0xc,%esp
 8ba:	56                   	push   %esi
 8bb:	e8 7f fc ff ff       	call   53f <sbrk>
 8c0:	83 c4 10             	add    $0x10,%esp
 8c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c6:	74 1c                	je     8e4 <malloc+0xa8>
 8c8:	89 58 04             	mov    %ebx,0x4(%eax)
 8cb:	83 ec 0c             	sub    $0xc,%esp
 8ce:	83 c0 08             	add    $0x8,%eax
 8d1:	50                   	push   %eax
 8d2:	e8 b5 fe ff ff       	call   78c <free>
 8d7:	8b 15 84 0a 00 00    	mov    0xa84,%edx
 8dd:	83 c4 10             	add    $0x10,%esp
 8e0:	85 d2                	test   %edx,%edx
 8e2:	75 c2                	jne    8a6 <malloc+0x6a>
 8e4:	31 c0                	xor    %eax,%eax
 8e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8e9:	5b                   	pop    %ebx
 8ea:	5e                   	pop    %esi
 8eb:	5f                   	pop    %edi
 8ec:	5d                   	pop    %ebp
 8ed:	c3                   	ret    
 8ee:	66 90                	xchg   %ax,%ax
 8f0:	39 cf                	cmp    %ecx,%edi
 8f2:	74 4c                	je     940 <malloc+0x104>
 8f4:	29 f9                	sub    %edi,%ecx
 8f6:	89 48 04             	mov    %ecx,0x4(%eax)
 8f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 8fc:	89 78 04             	mov    %edi,0x4(%eax)
 8ff:	89 15 84 0a 00 00    	mov    %edx,0xa84
 905:	83 c0 08             	add    $0x8,%eax
 908:	8d 65 f4             	lea    -0xc(%ebp),%esp
 90b:	5b                   	pop    %ebx
 90c:	5e                   	pop    %esi
 90d:	5f                   	pop    %edi
 90e:	5d                   	pop    %ebp
 90f:	c3                   	ret    
 910:	bb 00 10 00 00       	mov    $0x1000,%ebx
 915:	eb 81                	jmp    898 <malloc+0x5c>
 917:	90                   	nop
 918:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 91f:	0a 00 00 
 922:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 929:	0a 00 00 
 92c:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 933:	00 00 00 
 936:	b8 88 0a 00 00       	mov    $0xa88,%eax
 93b:	e9 4e ff ff ff       	jmp    88e <malloc+0x52>
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb b9                	jmp    8ff <malloc+0xc3>
 946:	83 ec 0c             	sub    $0xc,%esp
 949:	57                   	push   %edi
 94a:	50                   	push   %eax
 94b:	53                   	push   %ebx
 94c:	68 20 0a 00 00       	push   $0xa20
 951:	6a 02                	push   $0x2
 953:	e8 bc fc ff ff       	call   614 <printf>
 958:	83 c4 20             	add    $0x20,%esp
 95b:	31 c0                	xor    %eax,%eax
 95d:	eb 87                	jmp    8e6 <malloc+0xaa>
