
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 59 11 80       	mov    $0x801159d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 80 2c 10 80       	mov    $0x80102c80,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	53                   	push   %ebx
80100038:	83 ec 0c             	sub    $0xc,%esp
8010003b:	68 60 6a 10 80       	push   $0x80106a60
80100040:	68 20 a5 10 80       	push   $0x8010a520
80100045:	e8 c2 3e 00 00       	call   80103f0c <initlock>
8010004a:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
80100051:	ec 10 80 
80100054:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
8010005b:	ec 10 80 
8010005e:	83 c4 10             	add    $0x10,%esp
80100061:	b8 1c ec 10 80       	mov    $0x8010ec1c,%eax
80100066:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
8010006b:	eb 05                	jmp    80100072 <binit+0x3e>
8010006d:	8d 76 00             	lea    0x0(%esi),%esi
80100070:	89 d3                	mov    %edx,%ebx
80100072:	89 43 54             	mov    %eax,0x54(%ebx)
80100075:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
8010007c:	83 ec 08             	sub    $0x8,%esp
8010007f:	68 67 6a 10 80       	push   $0x80106a67
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
80100087:	50                   	push   %eax
80100088:	e8 73 3d 00 00       	call   80103e00 <initsleeplock>
8010008d:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100092:	89 58 50             	mov    %ebx,0x50(%eax)
80100095:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
8010009b:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a1:	89 d8                	mov    %ebx,%eax
801000a3:	83 c4 10             	add    $0x10,%esp
801000a6:	81 fb c0 e9 10 80    	cmp    $0x8010e9c0,%ebx
801000ac:	75 c2                	jne    80100070 <binit+0x3c>
801000ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000b1:	c9                   	leave  
801000b2:	c3                   	ret    
801000b3:	90                   	nop

801000b4 <bread>:
801000b4:	55                   	push   %ebp
801000b5:	89 e5                	mov    %esp,%ebp
801000b7:	57                   	push   %edi
801000b8:	56                   	push   %esi
801000b9:	53                   	push   %ebx
801000ba:	83 ec 18             	sub    $0x18,%esp
801000bd:	8b 75 08             	mov    0x8(%ebp),%esi
801000c0:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000c3:	68 20 a5 10 80       	push   $0x8010a520
801000c8:	e8 ff 3f 00 00       	call   801040cc <acquire>
801000cd:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
801000d3:	83 c4 10             	add    $0x10,%esp
801000d6:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000dc:	75 0d                	jne    801000eb <bread+0x37>
801000de:	eb 1c                	jmp    801000fc <bread+0x48>
801000e0:	8b 5b 54             	mov    0x54(%ebx),%ebx
801000e3:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000e9:	74 11                	je     801000fc <bread+0x48>
801000eb:	3b 73 04             	cmp    0x4(%ebx),%esi
801000ee:	75 f0                	jne    801000e0 <bread+0x2c>
801000f0:	3b 7b 08             	cmp    0x8(%ebx),%edi
801000f3:	75 eb                	jne    801000e0 <bread+0x2c>
801000f5:	ff 43 4c             	incl   0x4c(%ebx)
801000f8:	eb 3c                	jmp    80100136 <bread+0x82>
801000fa:	66 90                	xchg   %ax,%ax
801000fc:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100102:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100108:	75 0d                	jne    80100117 <bread+0x63>
8010010a:	eb 6a                	jmp    80100176 <bread+0xc2>
8010010c:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010010f:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100115:	74 5f                	je     80100176 <bread+0xc2>
80100117:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010011a:	85 c0                	test   %eax,%eax
8010011c:	75 ee                	jne    8010010c <bread+0x58>
8010011e:	f6 03 04             	testb  $0x4,(%ebx)
80100121:	75 e9                	jne    8010010c <bread+0x58>
80100123:	89 73 04             	mov    %esi,0x4(%ebx)
80100126:	89 7b 08             	mov    %edi,0x8(%ebx)
80100129:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010012f:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80100136:	83 ec 0c             	sub    $0xc,%esp
80100139:	68 20 a5 10 80       	push   $0x8010a520
8010013e:	e8 29 3f 00 00       	call   8010406c <release>
80100143:	8d 43 0c             	lea    0xc(%ebx),%eax
80100146:	89 04 24             	mov    %eax,(%esp)
80100149:	e8 e6 3c 00 00       	call   80103e34 <acquiresleep>
8010014e:	83 c4 10             	add    $0x10,%esp
80100151:	f6 03 02             	testb  $0x2,(%ebx)
80100154:	74 0a                	je     80100160 <bread+0xac>
80100156:	89 d8                	mov    %ebx,%eax
80100158:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010015b:	5b                   	pop    %ebx
8010015c:	5e                   	pop    %esi
8010015d:	5f                   	pop    %edi
8010015e:	5d                   	pop    %ebp
8010015f:	c3                   	ret    
80100160:	83 ec 0c             	sub    $0xc,%esp
80100163:	53                   	push   %ebx
80100164:	e8 1b 1f 00 00       	call   80102084 <iderw>
80100169:	83 c4 10             	add    $0x10,%esp
8010016c:	89 d8                	mov    %ebx,%eax
8010016e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100171:	5b                   	pop    %ebx
80100172:	5e                   	pop    %esi
80100173:	5f                   	pop    %edi
80100174:	5d                   	pop    %ebp
80100175:	c3                   	ret    
80100176:	83 ec 0c             	sub    $0xc,%esp
80100179:	68 6e 6a 10 80       	push   $0x80106a6e
8010017e:	e8 b5 01 00 00       	call   80100338 <panic>
80100183:	90                   	nop

80100184 <bwrite>:
80100184:	55                   	push   %ebp
80100185:	89 e5                	mov    %esp,%ebp
80100187:	53                   	push   %ebx
80100188:	83 ec 10             	sub    $0x10,%esp
8010018b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010018e:	8d 43 0c             	lea    0xc(%ebx),%eax
80100191:	50                   	push   %eax
80100192:	e8 2d 3d 00 00       	call   80103ec4 <holdingsleep>
80100197:	83 c4 10             	add    $0x10,%esp
8010019a:	85 c0                	test   %eax,%eax
8010019c:	74 0f                	je     801001ad <bwrite+0x29>
8010019e:	83 0b 04             	orl    $0x4,(%ebx)
801001a1:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001a7:	c9                   	leave  
801001a8:	e9 d7 1e 00 00       	jmp    80102084 <iderw>
801001ad:	83 ec 0c             	sub    $0xc,%esp
801001b0:	68 7f 6a 10 80       	push   $0x80106a7f
801001b5:	e8 7e 01 00 00       	call   80100338 <panic>
801001ba:	66 90                	xchg   %ax,%ax

801001bc <brelse>:
801001bc:	55                   	push   %ebp
801001bd:	89 e5                	mov    %esp,%ebp
801001bf:	56                   	push   %esi
801001c0:	53                   	push   %ebx
801001c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001c4:	8d 73 0c             	lea    0xc(%ebx),%esi
801001c7:	83 ec 0c             	sub    $0xc,%esp
801001ca:	56                   	push   %esi
801001cb:	e8 f4 3c 00 00       	call   80103ec4 <holdingsleep>
801001d0:	83 c4 10             	add    $0x10,%esp
801001d3:	85 c0                	test   %eax,%eax
801001d5:	74 61                	je     80100238 <brelse+0x7c>
801001d7:	83 ec 0c             	sub    $0xc,%esp
801001da:	56                   	push   %esi
801001db:	e8 a8 3c 00 00       	call   80103e88 <releasesleep>
801001e0:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801001e7:	e8 e0 3e 00 00       	call   801040cc <acquire>
801001ec:	8b 43 4c             	mov    0x4c(%ebx),%eax
801001ef:	48                   	dec    %eax
801001f0:	89 43 4c             	mov    %eax,0x4c(%ebx)
801001f3:	83 c4 10             	add    $0x10,%esp
801001f6:	85 c0                	test   %eax,%eax
801001f8:	75 2c                	jne    80100226 <brelse+0x6a>
801001fa:	8b 53 54             	mov    0x54(%ebx),%edx
801001fd:	8b 43 50             	mov    0x50(%ebx),%eax
80100200:	89 42 50             	mov    %eax,0x50(%edx)
80100203:	8b 53 54             	mov    0x54(%ebx),%edx
80100206:	89 50 54             	mov    %edx,0x54(%eax)
80100209:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010020e:	89 43 54             	mov    %eax,0x54(%ebx)
80100211:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
80100218:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010021d:	89 58 50             	mov    %ebx,0x50(%eax)
80100220:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
80100226:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
8010022d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100230:	5b                   	pop    %ebx
80100231:	5e                   	pop    %esi
80100232:	5d                   	pop    %ebp
80100233:	e9 34 3e 00 00       	jmp    8010406c <release>
80100238:	83 ec 0c             	sub    $0xc,%esp
8010023b:	68 86 6a 10 80       	push   $0x80106a86
80100240:	e8 f3 00 00 00       	call   80100338 <panic>
80100245:	66 90                	xchg   %ax,%ax
80100247:	90                   	nop

80100248 <consoleread>:
80100248:	55                   	push   %ebp
80100249:	89 e5                	mov    %esp,%ebp
8010024b:	57                   	push   %edi
8010024c:	56                   	push   %esi
8010024d:	53                   	push   %ebx
8010024e:	83 ec 18             	sub    $0x18,%esp
80100251:	8b 7d 08             	mov    0x8(%ebp),%edi
80100254:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100257:	57                   	push   %edi
80100258:	e8 7f 14 00 00       	call   801016dc <iunlock>
8010025d:	89 de                	mov    %ebx,%esi
8010025f:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
80100266:	e8 61 3e 00 00       	call   801040cc <acquire>
8010026b:	83 c4 10             	add    $0x10,%esp
8010026e:	85 db                	test   %ebx,%ebx
80100270:	0f 8e 93 00 00 00    	jle    80100309 <consoleread+0xc1>
80100276:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010027b:	39 05 04 ef 10 80    	cmp    %eax,0x8010ef04
80100281:	74 27                	je     801002aa <consoleread+0x62>
80100283:	eb 57                	jmp    801002dc <consoleread+0x94>
80100285:	8d 76 00             	lea    0x0(%esi),%esi
80100288:	83 ec 08             	sub    $0x8,%esp
8010028b:	68 20 ef 10 80       	push   $0x8010ef20
80100290:	68 00 ef 10 80       	push   $0x8010ef00
80100295:	e8 2a 39 00 00       	call   80103bc4 <sleep>
8010029a:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010029f:	83 c4 10             	add    $0x10,%esp
801002a2:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002a8:	75 32                	jne    801002dc <consoleread+0x94>
801002aa:	e8 61 32 00 00       	call   80103510 <myproc>
801002af:	8b 40 24             	mov    0x24(%eax),%eax
801002b2:	85 c0                	test   %eax,%eax
801002b4:	74 d2                	je     80100288 <consoleread+0x40>
801002b6:	83 ec 0c             	sub    $0xc,%esp
801002b9:	68 20 ef 10 80       	push   $0x8010ef20
801002be:	e8 a9 3d 00 00       	call   8010406c <release>
801002c3:	89 3c 24             	mov    %edi,(%esp)
801002c6:	e8 49 13 00 00       	call   80101614 <ilock>
801002cb:	83 c4 10             	add    $0x10,%esp
801002ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002d6:	5b                   	pop    %ebx
801002d7:	5e                   	pop    %esi
801002d8:	5f                   	pop    %edi
801002d9:	5d                   	pop    %ebp
801002da:	c3                   	ret    
801002db:	90                   	nop
801002dc:	8d 50 01             	lea    0x1(%eax),%edx
801002df:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
801002e5:	89 c2                	mov    %eax,%edx
801002e7:	83 e2 7f             	and    $0x7f,%edx
801002ea:	0f be 8a 80 ee 10 80 	movsbl -0x7fef1180(%edx),%ecx
801002f1:	80 f9 04             	cmp    $0x4,%cl
801002f4:	74 37                	je     8010032d <consoleread+0xe5>
801002f6:	ff 45 0c             	incl   0xc(%ebp)
801002f9:	8b 45 0c             	mov    0xc(%ebp),%eax
801002fc:	88 48 ff             	mov    %cl,-0x1(%eax)
801002ff:	4b                   	dec    %ebx
80100300:	83 f9 0a             	cmp    $0xa,%ecx
80100303:	0f 85 65 ff ff ff    	jne    8010026e <consoleread+0x26>
80100309:	83 ec 0c             	sub    $0xc,%esp
8010030c:	68 20 ef 10 80       	push   $0x8010ef20
80100311:	e8 56 3d 00 00       	call   8010406c <release>
80100316:	89 3c 24             	mov    %edi,(%esp)
80100319:	e8 f6 12 00 00       	call   80101614 <ilock>
8010031e:	89 f0                	mov    %esi,%eax
80100320:	29 d8                	sub    %ebx,%eax
80100322:	83 c4 10             	add    $0x10,%esp
80100325:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100328:	5b                   	pop    %ebx
80100329:	5e                   	pop    %esi
8010032a:	5f                   	pop    %edi
8010032b:	5d                   	pop    %ebp
8010032c:	c3                   	ret    
8010032d:	39 f3                	cmp    %esi,%ebx
8010032f:	73 d8                	jae    80100309 <consoleread+0xc1>
80100331:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
80100336:	eb d1                	jmp    80100309 <consoleread+0xc1>

80100338 <panic>:
80100338:	55                   	push   %ebp
80100339:	89 e5                	mov    %esp,%ebp
8010033b:	56                   	push   %esi
8010033c:	53                   	push   %ebx
8010033d:	83 ec 30             	sub    $0x30,%esp
80100340:	fa                   	cli    
80100341:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100348:	00 00 00 
8010034b:	e8 9c 22 00 00       	call   801025ec <lapicid>
80100350:	83 ec 08             	sub    $0x8,%esp
80100353:	50                   	push   %eax
80100354:	68 8d 6a 10 80       	push   $0x80106a8d
80100359:	e8 ca 02 00 00       	call   80100628 <cprintf>
8010035e:	58                   	pop    %eax
8010035f:	ff 75 08             	pushl  0x8(%ebp)
80100362:	e8 c1 02 00 00       	call   80100628 <cprintf>
80100367:	c7 04 24 2b 74 10 80 	movl   $0x8010742b,(%esp)
8010036e:	e8 b5 02 00 00       	call   80100628 <cprintf>
80100373:	5a                   	pop    %edx
80100374:	59                   	pop    %ecx
80100375:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100378:	53                   	push   %ebx
80100379:	8d 45 08             	lea    0x8(%ebp),%eax
8010037c:	50                   	push   %eax
8010037d:	e8 a6 3b 00 00       	call   80103f28 <getcallerpcs>
80100382:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100385:	83 c4 10             	add    $0x10,%esp
80100388:	83 ec 08             	sub    $0x8,%esp
8010038b:	ff 33                	pushl  (%ebx)
8010038d:	68 a1 6a 10 80       	push   $0x80106aa1
80100392:	e8 91 02 00 00       	call   80100628 <cprintf>
80100397:	83 c3 04             	add    $0x4,%ebx
8010039a:	83 c4 10             	add    $0x10,%esp
8010039d:	39 f3                	cmp    %esi,%ebx
8010039f:	75 e7                	jne    80100388 <panic+0x50>
801003a1:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003a8:	00 00 00 
801003ab:	eb fe                	jmp    801003ab <panic+0x73>
801003ad:	8d 76 00             	lea    0x0(%esi),%esi

801003b0 <consputc.part.0>:
801003b0:	55                   	push   %ebp
801003b1:	89 e5                	mov    %esp,%ebp
801003b3:	57                   	push   %edi
801003b4:	56                   	push   %esi
801003b5:	53                   	push   %ebx
801003b6:	83 ec 1c             	sub    $0x1c,%esp
801003b9:	3d 00 01 00 00       	cmp    $0x100,%eax
801003be:	0f 84 b4 00 00 00    	je     80100478 <consputc.part.0+0xc8>
801003c4:	89 c6                	mov    %eax,%esi
801003c6:	83 ec 0c             	sub    $0xc,%esp
801003c9:	50                   	push   %eax
801003ca:	e8 cd 52 00 00       	call   8010569c <uartputc>
801003cf:	bf d4 03 00 00       	mov    $0x3d4,%edi
801003d4:	b0 0e                	mov    $0xe,%al
801003d6:	89 fa                	mov    %edi,%edx
801003d8:	ee                   	out    %al,(%dx)
801003d9:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801003de:	89 ca                	mov    %ecx,%edx
801003e0:	ec                   	in     (%dx),%al
801003e1:	0f b6 d8             	movzbl %al,%ebx
801003e4:	c1 e3 08             	shl    $0x8,%ebx
801003e7:	b0 0f                	mov    $0xf,%al
801003e9:	89 fa                	mov    %edi,%edx
801003eb:	ee                   	out    %al,(%dx)
801003ec:	89 ca                	mov    %ecx,%edx
801003ee:	ec                   	in     (%dx),%al
801003ef:	0f b6 c8             	movzbl %al,%ecx
801003f2:	09 d9                	or     %ebx,%ecx
801003f4:	83 c4 10             	add    $0x10,%esp
801003f7:	83 fe 0a             	cmp    $0xa,%esi
801003fa:	75 64                	jne    80100460 <consputc.part.0+0xb0>
801003fc:	bb 50 00 00 00       	mov    $0x50,%ebx
80100401:	89 c8                	mov    %ecx,%eax
80100403:	99                   	cltd   
80100404:	f7 fb                	idiv   %ebx
80100406:	29 d3                	sub    %edx,%ebx
80100408:	01 cb                	add    %ecx,%ebx
8010040a:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100410:	0f 8f 0e 01 00 00    	jg     80100524 <consputc.part.0+0x174>
80100416:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
8010041c:	0f 8f aa 00 00 00    	jg     801004cc <consputc.part.0+0x11c>
80100422:	0f b6 c7             	movzbl %bh,%eax
80100425:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100428:	88 d9                	mov    %bl,%cl
8010042a:	01 db                	add    %ebx,%ebx
8010042c:	8d bb 00 80 0b 80    	lea    -0x7ff48000(%ebx),%edi
80100432:	be d4 03 00 00       	mov    $0x3d4,%esi
80100437:	b0 0e                	mov    $0xe,%al
80100439:	89 f2                	mov    %esi,%edx
8010043b:	ee                   	out    %al,(%dx)
8010043c:	bb d5 03 00 00       	mov    $0x3d5,%ebx
80100441:	8a 45 e4             	mov    -0x1c(%ebp),%al
80100444:	89 da                	mov    %ebx,%edx
80100446:	ee                   	out    %al,(%dx)
80100447:	b0 0f                	mov    $0xf,%al
80100449:	89 f2                	mov    %esi,%edx
8010044b:	ee                   	out    %al,(%dx)
8010044c:	88 c8                	mov    %cl,%al
8010044e:	89 da                	mov    %ebx,%edx
80100450:	ee                   	out    %al,(%dx)
80100451:	66 c7 07 20 07       	movw   $0x720,(%edi)
80100456:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100459:	5b                   	pop    %ebx
8010045a:	5e                   	pop    %esi
8010045b:	5f                   	pop    %edi
8010045c:	5d                   	pop    %ebp
8010045d:	c3                   	ret    
8010045e:	66 90                	xchg   %ax,%ax
80100460:	8d 59 01             	lea    0x1(%ecx),%ebx
80100463:	89 f0                	mov    %esi,%eax
80100465:	0f b6 f0             	movzbl %al,%esi
80100468:	81 ce 00 07 00 00    	or     $0x700,%esi
8010046e:	66 89 b4 09 00 80 0b 	mov    %si,-0x7ff48000(%ecx,%ecx,1)
80100475:	80 
80100476:	eb 92                	jmp    8010040a <consputc.part.0+0x5a>
80100478:	83 ec 0c             	sub    $0xc,%esp
8010047b:	6a 08                	push   $0x8
8010047d:	e8 1a 52 00 00       	call   8010569c <uartputc>
80100482:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100489:	e8 0e 52 00 00       	call   8010569c <uartputc>
8010048e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100495:	e8 02 52 00 00       	call   8010569c <uartputc>
8010049a:	be d4 03 00 00       	mov    $0x3d4,%esi
8010049f:	b0 0e                	mov    $0xe,%al
801004a1:	89 f2                	mov    %esi,%edx
801004a3:	ee                   	out    %al,(%dx)
801004a4:	bb d5 03 00 00       	mov    $0x3d5,%ebx
801004a9:	89 da                	mov    %ebx,%edx
801004ab:	ec                   	in     (%dx),%al
801004ac:	0f b6 c8             	movzbl %al,%ecx
801004af:	c1 e1 08             	shl    $0x8,%ecx
801004b2:	b0 0f                	mov    $0xf,%al
801004b4:	89 f2                	mov    %esi,%edx
801004b6:	ee                   	out    %al,(%dx)
801004b7:	89 da                	mov    %ebx,%edx
801004b9:	ec                   	in     (%dx),%al
801004ba:	0f b6 d8             	movzbl %al,%ebx
801004bd:	83 c4 10             	add    $0x10,%esp
801004c0:	09 cb                	or     %ecx,%ebx
801004c2:	74 50                	je     80100514 <consputc.part.0+0x164>
801004c4:	4b                   	dec    %ebx
801004c5:	e9 40 ff ff ff       	jmp    8010040a <consputc.part.0+0x5a>
801004ca:	66 90                	xchg   %ax,%ax
801004cc:	50                   	push   %eax
801004cd:	68 60 0e 00 00       	push   $0xe60
801004d2:	68 a0 80 0b 80       	push   $0x800b80a0
801004d7:	68 00 80 0b 80       	push   $0x800b8000
801004dc:	e8 27 3d 00 00       	call   80104208 <memmove>
801004e1:	8d 73 b0             	lea    -0x50(%ebx),%esi
801004e4:	8d 84 1b 60 ff ff ff 	lea    -0xa0(%ebx,%ebx,1),%eax
801004eb:	8d b8 00 80 0b 80    	lea    -0x7ff48000(%eax),%edi
801004f1:	83 c4 0c             	add    $0xc,%esp
801004f4:	b8 80 07 00 00       	mov    $0x780,%eax
801004f9:	29 f0                	sub    %esi,%eax
801004fb:	01 c0                	add    %eax,%eax
801004fd:	50                   	push   %eax
801004fe:	6a 00                	push   $0x0
80100500:	57                   	push   %edi
80100501:	e8 86 3c 00 00       	call   8010418c <memset>
80100506:	89 f1                	mov    %esi,%ecx
80100508:	83 c4 10             	add    $0x10,%esp
8010050b:	c6 45 e4 07          	movb   $0x7,-0x1c(%ebp)
8010050f:	e9 1e ff ff ff       	jmp    80100432 <consputc.part.0+0x82>
80100514:	bf 00 80 0b 80       	mov    $0x800b8000,%edi
80100519:	31 c9                	xor    %ecx,%ecx
8010051b:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
8010051f:	e9 0e ff ff ff       	jmp    80100432 <consputc.part.0+0x82>
80100524:	83 ec 0c             	sub    $0xc,%esp
80100527:	68 a5 6a 10 80       	push   $0x80106aa5
8010052c:	e8 07 fe ff ff       	call   80100338 <panic>
80100531:	8d 76 00             	lea    0x0(%esi),%esi

80100534 <consolewrite>:
80100534:	55                   	push   %ebp
80100535:	89 e5                	mov    %esp,%ebp
80100537:	57                   	push   %edi
80100538:	56                   	push   %esi
80100539:	53                   	push   %ebx
8010053a:	83 ec 18             	sub    $0x18,%esp
8010053d:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100540:	ff 75 08             	pushl  0x8(%ebp)
80100543:	e8 94 11 00 00       	call   801016dc <iunlock>
80100548:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
8010054f:	e8 78 3b 00 00       	call   801040cc <acquire>
80100554:	83 c4 10             	add    $0x10,%esp
80100557:	85 db                	test   %ebx,%ebx
80100559:	7e 23                	jle    8010057e <consolewrite+0x4a>
8010055b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010055e:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
80100561:	0f b6 06             	movzbl (%esi),%eax
80100564:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010056a:	85 d2                	test   %edx,%edx
8010056c:	74 06                	je     80100574 <consolewrite+0x40>
8010056e:	fa                   	cli    
8010056f:	eb fe                	jmp    8010056f <consolewrite+0x3b>
80100571:	8d 76 00             	lea    0x0(%esi),%esi
80100574:	e8 37 fe ff ff       	call   801003b0 <consputc.part.0>
80100579:	46                   	inc    %esi
8010057a:	39 f7                	cmp    %esi,%edi
8010057c:	75 e3                	jne    80100561 <consolewrite+0x2d>
8010057e:	83 ec 0c             	sub    $0xc,%esp
80100581:	68 20 ef 10 80       	push   $0x8010ef20
80100586:	e8 e1 3a 00 00       	call   8010406c <release>
8010058b:	58                   	pop    %eax
8010058c:	ff 75 08             	pushl  0x8(%ebp)
8010058f:	e8 80 10 00 00       	call   80101614 <ilock>
80100594:	89 d8                	mov    %ebx,%eax
80100596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100599:	5b                   	pop    %ebx
8010059a:	5e                   	pop    %esi
8010059b:	5f                   	pop    %edi
8010059c:	5d                   	pop    %ebp
8010059d:	c3                   	ret    
8010059e:	66 90                	xchg   %ax,%ax

801005a0 <printint>:
801005a0:	55                   	push   %ebp
801005a1:	89 e5                	mov    %esp,%ebp
801005a3:	57                   	push   %edi
801005a4:	56                   	push   %esi
801005a5:	53                   	push   %ebx
801005a6:	83 ec 2c             	sub    $0x2c,%esp
801005a9:	89 c6                	mov    %eax,%esi
801005ab:	89 d3                	mov    %edx,%ebx
801005ad:	85 c9                	test   %ecx,%ecx
801005af:	74 04                	je     801005b5 <printint+0x15>
801005b1:	85 c0                	test   %eax,%eax
801005b3:	78 63                	js     80100618 <printint+0x78>
801005b5:	89 f1                	mov    %esi,%ecx
801005b7:	31 c0                	xor    %eax,%eax
801005b9:	31 f6                	xor    %esi,%esi
801005bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
801005be:	66 90                	xchg   %ax,%ax
801005c0:	89 c8                	mov    %ecx,%eax
801005c2:	31 d2                	xor    %edx,%edx
801005c4:	f7 f3                	div    %ebx
801005c6:	89 f7                	mov    %esi,%edi
801005c8:	8d 76 01             	lea    0x1(%esi),%esi
801005cb:	8a 92 d0 6a 10 80    	mov    -0x7fef9530(%edx),%dl
801005d1:	88 55 d7             	mov    %dl,-0x29(%ebp)
801005d4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
801005d8:	89 ca                	mov    %ecx,%edx
801005da:	89 c1                	mov    %eax,%ecx
801005dc:	39 da                	cmp    %ebx,%edx
801005de:	73 e0                	jae    801005c0 <printint+0x20>
801005e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
801005e3:	85 c0                	test   %eax,%eax
801005e5:	74 07                	je     801005ee <printint+0x4e>
801005e7:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
801005ec:	89 f7                	mov    %esi,%edi
801005ee:	8d 75 d8             	lea    -0x28(%ebp),%esi
801005f1:	8d 5c 3d d8          	lea    -0x28(%ebp,%edi,1),%ebx
801005f5:	0f be 03             	movsbl (%ebx),%eax
801005f8:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801005fe:	85 d2                	test   %edx,%edx
80100600:	74 06                	je     80100608 <printint+0x68>
80100602:	fa                   	cli    
80100603:	eb fe                	jmp    80100603 <printint+0x63>
80100605:	8d 76 00             	lea    0x0(%esi),%esi
80100608:	e8 a3 fd ff ff       	call   801003b0 <consputc.part.0>
8010060d:	8d 43 ff             	lea    -0x1(%ebx),%eax
80100610:	39 f3                	cmp    %esi,%ebx
80100612:	74 0c                	je     80100620 <printint+0x80>
80100614:	89 c3                	mov    %eax,%ebx
80100616:	eb dd                	jmp    801005f5 <printint+0x55>
80100618:	89 c8                	mov    %ecx,%eax
8010061a:	f7 de                	neg    %esi
8010061c:	89 f1                	mov    %esi,%ecx
8010061e:	eb 99                	jmp    801005b9 <printint+0x19>
80100620:	83 c4 2c             	add    $0x2c,%esp
80100623:	5b                   	pop    %ebx
80100624:	5e                   	pop    %esi
80100625:	5f                   	pop    %edi
80100626:	5d                   	pop    %ebp
80100627:	c3                   	ret    

80100628 <cprintf>:
80100628:	55                   	push   %ebp
80100629:	89 e5                	mov    %esp,%ebp
8010062b:	57                   	push   %edi
8010062c:	56                   	push   %esi
8010062d:	53                   	push   %ebx
8010062e:	83 ec 1c             	sub    $0x1c,%esp
80100631:	8b 3d 54 ef 10 80    	mov    0x8010ef54,%edi
80100637:	8b 75 08             	mov    0x8(%ebp),%esi
8010063a:	85 ff                	test   %edi,%edi
8010063c:	0f 85 1e 01 00 00    	jne    80100760 <cprintf+0x138>
80100642:	85 f6                	test   %esi,%esi
80100644:	0f 84 bc 01 00 00    	je     80100806 <cprintf+0x1de>
8010064a:	0f b6 06             	movzbl (%esi),%eax
8010064d:	85 c0                	test   %eax,%eax
8010064f:	74 67                	je     801006b8 <cprintf+0x90>
80100651:	8d 55 0c             	lea    0xc(%ebp),%edx
80100654:	31 db                	xor    %ebx,%ebx
80100656:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80100659:	89 d7                	mov    %edx,%edi
8010065b:	83 f8 25             	cmp    $0x25,%eax
8010065e:	0f 85 c4 00 00 00    	jne    80100728 <cprintf+0x100>
80100664:	43                   	inc    %ebx
80100665:	0f b6 0c 1e          	movzbl (%esi,%ebx,1),%ecx
80100669:	85 c9                	test   %ecx,%ecx
8010066b:	74 40                	je     801006ad <cprintf+0x85>
8010066d:	83 f9 70             	cmp    $0x70,%ecx
80100670:	0f 84 8b 00 00 00    	je     80100701 <cprintf+0xd9>
80100676:	7f 48                	jg     801006c0 <cprintf+0x98>
80100678:	83 f9 25             	cmp    $0x25,%ecx
8010067b:	0f 84 b7 00 00 00    	je     80100738 <cprintf+0x110>
80100681:	83 f9 64             	cmp    $0x64,%ecx
80100684:	0f 85 0e 01 00 00    	jne    80100798 <cprintf+0x170>
8010068a:	8d 47 04             	lea    0x4(%edi),%eax
8010068d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100690:	8b 07                	mov    (%edi),%eax
80100692:	b9 01 00 00 00       	mov    $0x1,%ecx
80100697:	ba 0a 00 00 00       	mov    $0xa,%edx
8010069c:	e8 ff fe ff ff       	call   801005a0 <printint>
801006a1:	8b 7d e0             	mov    -0x20(%ebp),%edi
801006a4:	43                   	inc    %ebx
801006a5:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006a9:	85 c0                	test   %eax,%eax
801006ab:	75 ae                	jne    8010065b <cprintf+0x33>
801006ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801006b0:	85 ff                	test   %edi,%edi
801006b2:	0f 85 cb 00 00 00    	jne    80100783 <cprintf+0x15b>
801006b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801006bb:	5b                   	pop    %ebx
801006bc:	5e                   	pop    %esi
801006bd:	5f                   	pop    %edi
801006be:	5d                   	pop    %ebp
801006bf:	c3                   	ret    
801006c0:	83 f9 73             	cmp    $0x73,%ecx
801006c3:	75 33                	jne    801006f8 <cprintf+0xd0>
801006c5:	8d 47 04             	lea    0x4(%edi),%eax
801006c8:	8b 17                	mov    (%edi),%edx
801006ca:	85 d2                	test   %edx,%edx
801006cc:	0f 85 f6 00 00 00    	jne    801007c8 <cprintf+0x1a0>
801006d2:	b1 28                	mov    $0x28,%cl
801006d4:	bf b8 6a 10 80       	mov    $0x80106ab8,%edi
801006d9:	89 5d e0             	mov    %ebx,-0x20(%ebp)
801006dc:	89 fb                	mov    %edi,%ebx
801006de:	89 f7                	mov    %esi,%edi
801006e0:	89 c6                	mov    %eax,%esi
801006e2:	0f be c1             	movsbl %cl,%eax
801006e5:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801006eb:	85 d2                	test   %edx,%edx
801006ed:	0f 84 e8 00 00 00    	je     801007db <cprintf+0x1b3>
801006f3:	fa                   	cli    
801006f4:	eb fe                	jmp    801006f4 <cprintf+0xcc>
801006f6:	66 90                	xchg   %ax,%ax
801006f8:	83 f9 78             	cmp    $0x78,%ecx
801006fb:	0f 85 97 00 00 00    	jne    80100798 <cprintf+0x170>
80100701:	8d 47 04             	lea    0x4(%edi),%eax
80100704:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100707:	8b 07                	mov    (%edi),%eax
80100709:	31 c9                	xor    %ecx,%ecx
8010070b:	ba 10 00 00 00       	mov    $0x10,%edx
80100710:	e8 8b fe ff ff       	call   801005a0 <printint>
80100715:	8b 7d e0             	mov    -0x20(%ebp),%edi
80100718:	43                   	inc    %ebx
80100719:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
8010071d:	85 c0                	test   %eax,%eax
8010071f:	0f 85 36 ff ff ff    	jne    8010065b <cprintf+0x33>
80100725:	eb 86                	jmp    801006ad <cprintf+0x85>
80100727:	90                   	nop
80100728:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
8010072e:	85 c9                	test   %ecx,%ecx
80100730:	74 15                	je     80100747 <cprintf+0x11f>
80100732:	fa                   	cli    
80100733:	eb fe                	jmp    80100733 <cprintf+0x10b>
80100735:	8d 76 00             	lea    0x0(%esi),%esi
80100738:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
8010073e:	85 c9                	test   %ecx,%ecx
80100740:	75 7e                	jne    801007c0 <cprintf+0x198>
80100742:	b8 25 00 00 00       	mov    $0x25,%eax
80100747:	e8 64 fc ff ff       	call   801003b0 <consputc.part.0>
8010074c:	43                   	inc    %ebx
8010074d:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100751:	85 c0                	test   %eax,%eax
80100753:	0f 85 02 ff ff ff    	jne    8010065b <cprintf+0x33>
80100759:	e9 4f ff ff ff       	jmp    801006ad <cprintf+0x85>
8010075e:	66 90                	xchg   %ax,%ax
80100760:	83 ec 0c             	sub    $0xc,%esp
80100763:	68 20 ef 10 80       	push   $0x8010ef20
80100768:	e8 5f 39 00 00       	call   801040cc <acquire>
8010076d:	83 c4 10             	add    $0x10,%esp
80100770:	85 f6                	test   %esi,%esi
80100772:	0f 84 8e 00 00 00    	je     80100806 <cprintf+0x1de>
80100778:	0f b6 06             	movzbl (%esi),%eax
8010077b:	85 c0                	test   %eax,%eax
8010077d:	0f 85 ce fe ff ff    	jne    80100651 <cprintf+0x29>
80100783:	83 ec 0c             	sub    $0xc,%esp
80100786:	68 20 ef 10 80       	push   $0x8010ef20
8010078b:	e8 dc 38 00 00       	call   8010406c <release>
80100790:	83 c4 10             	add    $0x10,%esp
80100793:	e9 20 ff ff ff       	jmp    801006b8 <cprintf+0x90>
80100798:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010079e:	85 d2                	test   %edx,%edx
801007a0:	75 22                	jne    801007c4 <cprintf+0x19c>
801007a2:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801007a5:	b8 25 00 00 00       	mov    $0x25,%eax
801007aa:	e8 01 fc ff ff       	call   801003b0 <consputc.part.0>
801007af:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
801007b4:	85 c0                	test   %eax,%eax
801007b6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801007b9:	74 3f                	je     801007fa <cprintf+0x1d2>
801007bb:	fa                   	cli    
801007bc:	eb fe                	jmp    801007bc <cprintf+0x194>
801007be:	66 90                	xchg   %ax,%ax
801007c0:	fa                   	cli    
801007c1:	eb fe                	jmp    801007c1 <cprintf+0x199>
801007c3:	90                   	nop
801007c4:	fa                   	cli    
801007c5:	eb fe                	jmp    801007c5 <cprintf+0x19d>
801007c7:	90                   	nop
801007c8:	89 d7                	mov    %edx,%edi
801007ca:	8a 0a                	mov    (%edx),%cl
801007cc:	84 c9                	test   %cl,%cl
801007ce:	0f 85 05 ff ff ff    	jne    801006d9 <cprintf+0xb1>
801007d4:	89 c7                	mov    %eax,%edi
801007d6:	e9 c9 fe ff ff       	jmp    801006a4 <cprintf+0x7c>
801007db:	e8 d0 fb ff ff       	call   801003b0 <consputc.part.0>
801007e0:	43                   	inc    %ebx
801007e1:	0f be 03             	movsbl (%ebx),%eax
801007e4:	84 c0                	test   %al,%al
801007e6:	0f 85 f9 fe ff ff    	jne    801006e5 <cprintf+0xbd>
801007ec:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801007ef:	89 f0                	mov    %esi,%eax
801007f1:	89 fe                	mov    %edi,%esi
801007f3:	89 c7                	mov    %eax,%edi
801007f5:	e9 aa fe ff ff       	jmp    801006a4 <cprintf+0x7c>
801007fa:	89 c8                	mov    %ecx,%eax
801007fc:	e8 af fb ff ff       	call   801003b0 <consputc.part.0>
80100801:	e9 9e fe ff ff       	jmp    801006a4 <cprintf+0x7c>
80100806:	83 ec 0c             	sub    $0xc,%esp
80100809:	68 bf 6a 10 80       	push   $0x80106abf
8010080e:	e8 25 fb ff ff       	call   80100338 <panic>
80100813:	90                   	nop

80100814 <consoleintr>:
80100814:	55                   	push   %ebp
80100815:	89 e5                	mov    %esp,%ebp
80100817:	57                   	push   %edi
80100818:	56                   	push   %esi
80100819:	53                   	push   %ebx
8010081a:	83 ec 28             	sub    $0x28,%esp
8010081d:	8b 7d 08             	mov    0x8(%ebp),%edi
80100820:	68 20 ef 10 80       	push   $0x8010ef20
80100825:	e8 a2 38 00 00       	call   801040cc <acquire>
8010082a:	83 c4 10             	add    $0x10,%esp
8010082d:	31 f6                	xor    %esi,%esi
8010082f:	eb 1a                	jmp    8010084b <consoleintr+0x37>
80100831:	8d 76 00             	lea    0x0(%esi),%esi
80100834:	83 f8 08             	cmp    $0x8,%eax
80100837:	0f 84 e7 00 00 00    	je     80100924 <consoleintr+0x110>
8010083d:	83 f8 10             	cmp    $0x10,%eax
80100840:	0f 85 39 01 00 00    	jne    8010097f <consoleintr+0x16b>
80100846:	be 01 00 00 00       	mov    $0x1,%esi
8010084b:	ff d7                	call   *%edi
8010084d:	85 c0                	test   %eax,%eax
8010084f:	0f 88 f3 00 00 00    	js     80100948 <consoleintr+0x134>
80100855:	83 f8 15             	cmp    $0x15,%eax
80100858:	0f 84 8d 00 00 00    	je     801008eb <consoleintr+0xd7>
8010085e:	7e d4                	jle    80100834 <consoleintr+0x20>
80100860:	83 f8 7f             	cmp    $0x7f,%eax
80100863:	0f 84 bb 00 00 00    	je     80100924 <consoleintr+0x110>
80100869:	8b 1d 08 ef 10 80    	mov    0x8010ef08,%ebx
8010086f:	89 da                	mov    %ebx,%edx
80100871:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
80100877:	83 fa 7f             	cmp    $0x7f,%edx
8010087a:	77 cf                	ja     8010084b <consoleintr+0x37>
8010087c:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
80100882:	89 da                	mov    %ebx,%edx
80100884:	83 e2 7f             	and    $0x7f,%edx
80100887:	43                   	inc    %ebx
80100888:	89 1d 08 ef 10 80    	mov    %ebx,0x8010ef08
8010088e:	88 82 80 ee 10 80    	mov    %al,-0x7fef1180(%edx)
80100894:	85 c9                	test   %ecx,%ecx
80100896:	0f 85 3d 01 00 00    	jne    801009d9 <consoleintr+0x1c5>
8010089c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010089f:	e8 0c fb ff ff       	call   801003b0 <consputc.part.0>
801008a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801008a7:	8b 0d 08 ef 10 80    	mov    0x8010ef08,%ecx
801008ad:	83 f8 0a             	cmp    $0xa,%eax
801008b0:	74 14                	je     801008c6 <consoleintr+0xb2>
801008b2:	83 f8 04             	cmp    $0x4,%eax
801008b5:	74 0f                	je     801008c6 <consoleintr+0xb2>
801008b7:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801008bc:	8d 90 80 00 00 00    	lea    0x80(%eax),%edx
801008c2:	39 ca                	cmp    %ecx,%edx
801008c4:	75 85                	jne    8010084b <consoleintr+0x37>
801008c6:	89 0d 04 ef 10 80    	mov    %ecx,0x8010ef04
801008cc:	83 ec 0c             	sub    $0xc,%esp
801008cf:	68 00 ef 10 80       	push   $0x8010ef00
801008d4:	e8 a7 33 00 00       	call   80103c80 <wakeup>
801008d9:	83 c4 10             	add    $0x10,%esp
801008dc:	e9 6a ff ff ff       	jmp    8010084b <consoleintr+0x37>
801008e1:	b8 00 01 00 00       	mov    $0x100,%eax
801008e6:	e8 c5 fa ff ff       	call   801003b0 <consputc.part.0>
801008eb:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801008f0:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801008f6:	0f 84 4f ff ff ff    	je     8010084b <consoleintr+0x37>
801008fc:	48                   	dec    %eax
801008fd:	89 c2                	mov    %eax,%edx
801008ff:	83 e2 7f             	and    $0x7f,%edx
80100902:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
80100909:	0f 84 3c ff ff ff    	je     8010084b <consoleintr+0x37>
8010090f:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
80100914:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010091a:	85 d2                	test   %edx,%edx
8010091c:	74 c3                	je     801008e1 <consoleintr+0xcd>
8010091e:	fa                   	cli    
8010091f:	eb fe                	jmp    8010091f <consoleintr+0x10b>
80100921:	8d 76 00             	lea    0x0(%esi),%esi
80100924:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100929:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
8010092f:	0f 84 16 ff ff ff    	je     8010084b <consoleintr+0x37>
80100935:	48                   	dec    %eax
80100936:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
8010093b:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
80100940:	85 c0                	test   %eax,%eax
80100942:	74 20                	je     80100964 <consoleintr+0x150>
80100944:	fa                   	cli    
80100945:	eb fe                	jmp    80100945 <consoleintr+0x131>
80100947:	90                   	nop
80100948:	83 ec 0c             	sub    $0xc,%esp
8010094b:	68 20 ef 10 80       	push   $0x8010ef20
80100950:	e8 17 37 00 00       	call   8010406c <release>
80100955:	83 c4 10             	add    $0x10,%esp
80100958:	85 f6                	test   %esi,%esi
8010095a:	75 17                	jne    80100973 <consoleintr+0x15f>
8010095c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010095f:	5b                   	pop    %ebx
80100960:	5e                   	pop    %esi
80100961:	5f                   	pop    %edi
80100962:	5d                   	pop    %ebp
80100963:	c3                   	ret    
80100964:	b8 00 01 00 00       	mov    $0x100,%eax
80100969:	e8 42 fa ff ff       	call   801003b0 <consputc.part.0>
8010096e:	e9 d8 fe ff ff       	jmp    8010084b <consoleintr+0x37>
80100973:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100976:	5b                   	pop    %ebx
80100977:	5e                   	pop    %esi
80100978:	5f                   	pop    %edi
80100979:	5d                   	pop    %ebp
8010097a:	e9 d5 33 00 00       	jmp    80103d54 <procdump>
8010097f:	85 c0                	test   %eax,%eax
80100981:	0f 84 c4 fe ff ff    	je     8010084b <consoleintr+0x37>
80100987:	8b 1d 08 ef 10 80    	mov    0x8010ef08,%ebx
8010098d:	89 da                	mov    %ebx,%edx
8010098f:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
80100995:	83 fa 7f             	cmp    $0x7f,%edx
80100998:	0f 87 ad fe ff ff    	ja     8010084b <consoleintr+0x37>
8010099e:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801009a4:	89 da                	mov    %ebx,%edx
801009a6:	83 e2 7f             	and    $0x7f,%edx
801009a9:	43                   	inc    %ebx
801009aa:	83 f8 0d             	cmp    $0xd,%eax
801009ad:	0f 85 d5 fe ff ff    	jne    80100888 <consoleintr+0x74>
801009b3:	89 1d 08 ef 10 80    	mov    %ebx,0x8010ef08
801009b9:	c6 82 80 ee 10 80 0a 	movb   $0xa,-0x7fef1180(%edx)
801009c0:	85 c9                	test   %ecx,%ecx
801009c2:	75 15                	jne    801009d9 <consoleintr+0x1c5>
801009c4:	b8 0a 00 00 00       	mov    $0xa,%eax
801009c9:	e8 e2 f9 ff ff       	call   801003b0 <consputc.part.0>
801009ce:	8b 0d 08 ef 10 80    	mov    0x8010ef08,%ecx
801009d4:	e9 ed fe ff ff       	jmp    801008c6 <consoleintr+0xb2>
801009d9:	fa                   	cli    
801009da:	eb fe                	jmp    801009da <consoleintr+0x1c6>

801009dc <consoleinit>:
801009dc:	55                   	push   %ebp
801009dd:	89 e5                	mov    %esp,%ebp
801009df:	83 ec 10             	sub    $0x10,%esp
801009e2:	68 c8 6a 10 80       	push   $0x80106ac8
801009e7:	68 20 ef 10 80       	push   $0x8010ef20
801009ec:	e8 1b 35 00 00       	call   80103f0c <initlock>
801009f1:	c7 05 0c f9 10 80 34 	movl   $0x80100534,0x8010f90c
801009f8:	05 10 80 
801009fb:	c7 05 08 f9 10 80 48 	movl   $0x80100248,0x8010f908
80100a02:	02 10 80 
80100a05:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
80100a0c:	00 00 00 
80100a0f:	58                   	pop    %eax
80100a10:	5a                   	pop    %edx
80100a11:	6a 00                	push   $0x0
80100a13:	6a 01                	push   $0x1
80100a15:	e8 ea 17 00 00       	call   80102204 <ioapicenable>
80100a1a:	83 c4 10             	add    $0x10,%esp
80100a1d:	c9                   	leave  
80100a1e:	c3                   	ret    
80100a1f:	90                   	nop

80100a20 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a20:	55                   	push   %ebp
80100a21:	89 e5                	mov    %esp,%ebp
80100a23:	57                   	push   %edi
80100a24:	56                   	push   %esi
80100a25:	53                   	push   %ebx
80100a26:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a2c:	e8 df 2a 00 00       	call   80103510 <myproc>
80100a31:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
80100a37:	e8 90 1f 00 00       	call   801029cc <begin_op>

  if((ip = namei(path)) == 0){
80100a3c:	83 ec 0c             	sub    $0xc,%esp
80100a3f:	ff 75 08             	pushl  0x8(%ebp)
80100a42:	e8 59 14 00 00       	call   80101ea0 <namei>
80100a47:	83 c4 10             	add    $0x10,%esp
80100a4a:	85 c0                	test   %eax,%eax
80100a4c:	0f 84 10 03 00 00    	je     80100d62 <exec+0x342>
80100a52:	89 c7                	mov    %eax,%edi
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a54:	83 ec 0c             	sub    $0xc,%esp
80100a57:	50                   	push   %eax
80100a58:	e8 b7 0b 00 00       	call   80101614 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a5d:	6a 34                	push   $0x34
80100a5f:	6a 00                	push   $0x0
80100a61:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a67:	50                   	push   %eax
80100a68:	57                   	push   %edi
80100a69:	e8 76 0e 00 00       	call   801018e4 <readi>
80100a6e:	83 c4 20             	add    $0x20,%esp
80100a71:	83 f8 34             	cmp    $0x34,%eax
80100a74:	0f 85 f9 00 00 00    	jne    80100b73 <exec+0x153>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a7a:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a81:	45 4c 46 
80100a84:	0f 85 e9 00 00 00    	jne    80100b73 <exec+0x153>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a8a:	e8 c9 5c 00 00       	call   80106758 <setupkvm>
80100a8f:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a95:	85 c0                	test   %eax,%eax
80100a97:	0f 84 d6 00 00 00    	je     80100b73 <exec+0x153>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a9d:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100aa3:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aaa:	00 
80100aab:	0f 84 81 02 00 00    	je     80100d32 <exec+0x312>
  sz = 0;
80100ab1:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100ab8:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100abb:	31 db                	xor    %ebx,%ebx
80100abd:	e9 84 00 00 00       	jmp    80100b46 <exec+0x126>
80100ac2:	66 90                	xchg   %ax,%ax
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ac4:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acb:	75 6a                	jne    80100b37 <exec+0x117>
      continue;
    if(ph.memsz < ph.filesz)
80100acd:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad3:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ad9:	0f 82 83 00 00 00    	jb     80100b62 <exec+0x142>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100adf:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae5:	72 7b                	jb     80100b62 <exec+0x142>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100ae7:	51                   	push   %ecx
80100ae8:	50                   	push   %eax
80100ae9:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100aef:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100af5:	e8 d2 5a 00 00       	call   801065cc <allocuvm>
80100afa:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b00:	83 c4 10             	add    $0x10,%esp
80100b03:	85 c0                	test   %eax,%eax
80100b05:	74 5b                	je     80100b62 <exec+0x142>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b07:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0d:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b12:	75 4e                	jne    80100b62 <exec+0x142>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b14:	83 ec 0c             	sub    $0xc,%esp
80100b17:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1d:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b23:	57                   	push   %edi
80100b24:	50                   	push   %eax
80100b25:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b2b:	e8 d8 59 00 00       	call   80106508 <loaduvm>
80100b30:	83 c4 20             	add    $0x20,%esp
80100b33:	85 c0                	test   %eax,%eax
80100b35:	78 2b                	js     80100b62 <exec+0x142>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b37:	43                   	inc    %ebx
80100b38:	83 c6 20             	add    $0x20,%esi
80100b3b:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b42:	39 d8                	cmp    %ebx,%eax
80100b44:	7e 4e                	jle    80100b94 <exec+0x174>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b46:	6a 20                	push   $0x20
80100b48:	56                   	push   %esi
80100b49:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	57                   	push   %edi
80100b51:	e8 8e 0d 00 00       	call   801018e4 <readi>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	83 f8 20             	cmp    $0x20,%eax
80100b5c:	0f 84 62 ff ff ff    	je     80100ac4 <exec+0xa4>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b62:	83 ec 0c             	sub    $0xc,%esp
80100b65:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b6b:	e8 78 5b 00 00       	call   801066e8 <freevm>
  if(ip){
80100b70:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80100b73:	83 ec 0c             	sub    $0xc,%esp
80100b76:	57                   	push   %edi
80100b77:	e8 ec 0c 00 00       	call   80101868 <iunlockput>
    end_op();
80100b7c:	e8 b3 1e 00 00       	call   80102a34 <end_op>
80100b81:	83 c4 10             	add    $0x10,%esp
    return -1;
80100b84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return -1;
}
80100b89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b8c:	5b                   	pop    %ebx
80100b8d:	5e                   	pop    %esi
80100b8e:	5f                   	pop    %edi
80100b8f:	5d                   	pop    %ebp
80100b90:	c3                   	ret    
80100b91:	8d 76 00             	lea    0x0(%esi),%esi
  sz = PGROUNDUP(sz);
80100b94:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b9a:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100ba0:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100ba6:	8d 9e 00 20 00 00    	lea    0x2000(%esi),%ebx
  iunlockput(ip);
80100bac:	83 ec 0c             	sub    $0xc,%esp
80100baf:	57                   	push   %edi
80100bb0:	e8 b3 0c 00 00       	call   80101868 <iunlockput>
  end_op();
80100bb5:	e8 7a 1e 00 00       	call   80102a34 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100bba:	83 c4 0c             	add    $0xc,%esp
80100bbd:	53                   	push   %ebx
80100bbe:	56                   	push   %esi
80100bbf:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bc5:	56                   	push   %esi
80100bc6:	e8 01 5a 00 00       	call   801065cc <allocuvm>
80100bcb:	89 c7                	mov    %eax,%edi
80100bcd:	83 c4 10             	add    $0x10,%esp
80100bd0:	85 c0                	test   %eax,%eax
80100bd2:	74 7e                	je     80100c52 <exec+0x232>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bd4:	83 ec 08             	sub    $0x8,%esp
80100bd7:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bdd:	50                   	push   %eax
80100bde:	56                   	push   %esi
80100bdf:	e8 04 5c 00 00       	call   801067e8 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100be4:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be7:	8b 10                	mov    (%eax),%edx
80100be9:	83 c4 10             	add    $0x10,%esp
  sp = sz;
80100bec:	89 fb                	mov    %edi,%ebx
  for(argc = 0; argv[argc]; argc++) {
80100bee:	85 d2                	test   %edx,%edx
80100bf0:	0f 84 48 01 00 00    	je     80100d3e <exec+0x31e>
80100bf6:	31 f6                	xor    %esi,%esi
80100bf8:	89 bd f0 fe ff ff    	mov    %edi,-0x110(%ebp)
80100bfe:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100c01:	eb 1f                	jmp    80100c22 <exec+0x202>
80100c03:	90                   	nop
    ustack[3+argc] = sp;
80100c04:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100c0a:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c11:	8d 46 01             	lea    0x1(%esi),%eax
80100c14:	8b 14 87             	mov    (%edi,%eax,4),%edx
80100c17:	85 d2                	test   %edx,%edx
80100c19:	74 4d                	je     80100c68 <exec+0x248>
    if(argc >= MAXARG)
80100c1b:	83 f8 20             	cmp    $0x20,%eax
80100c1e:	74 32                	je     80100c52 <exec+0x232>
80100c20:	89 c6                	mov    %eax,%esi
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c22:	83 ec 0c             	sub    $0xc,%esp
80100c25:	52                   	push   %edx
80100c26:	e8 dd 36 00 00       	call   80104308 <strlen>
80100c2b:	29 c3                	sub    %eax,%ebx
80100c2d:	4b                   	dec    %ebx
80100c2e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c31:	5a                   	pop    %edx
80100c32:	ff 34 b7             	pushl  (%edi,%esi,4)
80100c35:	e8 ce 36 00 00       	call   80104308 <strlen>
80100c3a:	40                   	inc    %eax
80100c3b:	50                   	push   %eax
80100c3c:	ff 34 b7             	pushl  (%edi,%esi,4)
80100c3f:	53                   	push   %ebx
80100c40:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c46:	e8 41 5d 00 00       	call   8010698c <copyout>
80100c4b:	83 c4 20             	add    $0x20,%esp
80100c4e:	85 c0                	test   %eax,%eax
80100c50:	79 b2                	jns    80100c04 <exec+0x1e4>
    freevm(pgdir);
80100c52:	83 ec 0c             	sub    $0xc,%esp
80100c55:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c5b:	e8 88 5a 00 00       	call   801066e8 <freevm>
80100c60:	83 c4 10             	add    $0x10,%esp
80100c63:	e9 1c ff ff ff       	jmp    80100b84 <exec+0x164>
  ustack[3+argc] = 0;
80100c68:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c6e:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100c74:	8d 46 04             	lea    0x4(%esi),%eax
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c77:	8d 14 b5 08 00 00 00 	lea    0x8(,%esi,4),%edx
  sp -= (3+argc+1) * 4;
80100c7e:	8d 72 0c             	lea    0xc(%edx),%esi
  ustack[3+argc] = 0;
80100c81:	c7 84 85 58 ff ff ff 	movl   $0x0,-0xa8(%ebp,%eax,4)
80100c88:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100c8c:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c93:	ff ff ff 
  ustack[1] = argc;
80100c96:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100c9c:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca2:	89 d8                	mov    %ebx,%eax
80100ca4:	29 d0                	sub    %edx,%eax
80100ca6:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  sp -= (3+argc+1) * 4;
80100cac:	29 f3                	sub    %esi,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cae:	56                   	push   %esi
80100caf:	51                   	push   %ecx
80100cb0:	53                   	push   %ebx
80100cb1:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100cb7:	e8 d0 5c 00 00       	call   8010698c <copyout>
80100cbc:	83 c4 10             	add    $0x10,%esp
80100cbf:	85 c0                	test   %eax,%eax
80100cc1:	78 8f                	js     80100c52 <exec+0x232>
  for(last=s=path; *s; s++)
80100cc3:	8b 45 08             	mov    0x8(%ebp),%eax
80100cc6:	8a 00                	mov    (%eax),%al
80100cc8:	8b 55 08             	mov    0x8(%ebp),%edx
80100ccb:	84 c0                	test   %al,%al
80100ccd:	74 12                	je     80100ce1 <exec+0x2c1>
80100ccf:	89 d1                	mov    %edx,%ecx
80100cd1:	8d 76 00             	lea    0x0(%esi),%esi
      last = s+1;
80100cd4:	41                   	inc    %ecx
    if(*s == '/')
80100cd5:	3c 2f                	cmp    $0x2f,%al
80100cd7:	75 02                	jne    80100cdb <exec+0x2bb>
      last = s+1;
80100cd9:	89 ca                	mov    %ecx,%edx
  for(last=s=path; *s; s++)
80100cdb:	8a 01                	mov    (%ecx),%al
80100cdd:	84 c0                	test   %al,%al
80100cdf:	75 f3                	jne    80100cd4 <exec+0x2b4>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100ce1:	50                   	push   %eax
80100ce2:	6a 10                	push   $0x10
80100ce4:	52                   	push   %edx
80100ce5:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100ceb:	8d 46 6c             	lea    0x6c(%esi),%eax
80100cee:	50                   	push   %eax
80100cef:	e8 e0 35 00 00       	call   801042d4 <safestrcpy>
  oldpgdir = curproc->pgdir;
80100cf4:	89 f0                	mov    %esi,%eax
80100cf6:	8b 76 04             	mov    0x4(%esi),%esi
  curproc->pgdir = pgdir;
80100cf9:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100cff:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
80100d02:	89 38                	mov    %edi,(%eax)
  curproc->tf->eip = elf.entry;  // main
80100d04:	89 c1                	mov    %eax,%ecx
80100d06:	8b 40 18             	mov    0x18(%eax),%eax
80100d09:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d0f:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d12:	8b 41 18             	mov    0x18(%ecx),%eax
80100d15:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d18:	89 0c 24             	mov    %ecx,(%esp)
80100d1b:	e8 78 56 00 00       	call   80106398 <switchuvm>
  freevm(oldpgdir);
80100d20:	89 34 24             	mov    %esi,(%esp)
80100d23:	e8 c0 59 00 00       	call   801066e8 <freevm>
  return 0;
80100d28:	83 c4 10             	add    $0x10,%esp
80100d2b:	31 c0                	xor    %eax,%eax
80100d2d:	e9 57 fe ff ff       	jmp    80100b89 <exec+0x169>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d32:	bb 00 20 00 00       	mov    $0x2000,%ebx
80100d37:	31 f6                	xor    %esi,%esi
80100d39:	e9 6e fe ff ff       	jmp    80100bac <exec+0x18c>
  for(argc = 0; argv[argc]; argc++) {
80100d3e:	be 10 00 00 00       	mov    $0x10,%esi
80100d43:	ba 04 00 00 00       	mov    $0x4,%edx
80100d48:	b8 03 00 00 00       	mov    $0x3,%eax
80100d4d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100d54:	00 00 00 
80100d57:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100d5d:	e9 1f ff ff ff       	jmp    80100c81 <exec+0x261>
    end_op();
80100d62:	e8 cd 1c 00 00       	call   80102a34 <end_op>
    cprintf("exec: fail\n");
80100d67:	83 ec 0c             	sub    $0xc,%esp
80100d6a:	68 e1 6a 10 80       	push   $0x80106ae1
80100d6f:	e8 b4 f8 ff ff       	call   80100628 <cprintf>
    return -1;
80100d74:	83 c4 10             	add    $0x10,%esp
80100d77:	e9 08 fe ff ff       	jmp    80100b84 <exec+0x164>

80100d7c <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d7c:	55                   	push   %ebp
80100d7d:	89 e5                	mov    %esp,%ebp
80100d7f:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d82:	68 ed 6a 10 80       	push   $0x80106aed
80100d87:	68 60 ef 10 80       	push   $0x8010ef60
80100d8c:	e8 7b 31 00 00       	call   80103f0c <initlock>
}
80100d91:	83 c4 10             	add    $0x10,%esp
80100d94:	c9                   	leave  
80100d95:	c3                   	ret    
80100d96:	66 90                	xchg   %ax,%ax

80100d98 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d98:	55                   	push   %ebp
80100d99:	89 e5                	mov    %esp,%ebp
80100d9b:	53                   	push   %ebx
80100d9c:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d9f:	68 60 ef 10 80       	push   $0x8010ef60
80100da4:	e8 23 33 00 00       	call   801040cc <acquire>
80100da9:	83 c4 10             	add    $0x10,%esp
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100dac:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
80100db1:	eb 0c                	jmp    80100dbf <filealloc+0x27>
80100db3:	90                   	nop
80100db4:	83 c3 18             	add    $0x18,%ebx
80100db7:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100dbd:	74 25                	je     80100de4 <filealloc+0x4c>
    if(f->ref == 0){
80100dbf:	8b 43 04             	mov    0x4(%ebx),%eax
80100dc2:	85 c0                	test   %eax,%eax
80100dc4:	75 ee                	jne    80100db4 <filealloc+0x1c>
      f->ref = 1;
80100dc6:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dcd:	83 ec 0c             	sub    $0xc,%esp
80100dd0:	68 60 ef 10 80       	push   $0x8010ef60
80100dd5:	e8 92 32 00 00       	call   8010406c <release>
      return f;
80100dda:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100ddd:	89 d8                	mov    %ebx,%eax
80100ddf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de2:	c9                   	leave  
80100de3:	c3                   	ret    
  release(&ftable.lock);
80100de4:	83 ec 0c             	sub    $0xc,%esp
80100de7:	68 60 ef 10 80       	push   $0x8010ef60
80100dec:	e8 7b 32 00 00       	call   8010406c <release>
  return 0;
80100df1:	83 c4 10             	add    $0x10,%esp
80100df4:	31 db                	xor    %ebx,%ebx
}
80100df6:	89 d8                	mov    %ebx,%eax
80100df8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dfb:	c9                   	leave  
80100dfc:	c3                   	ret    
80100dfd:	8d 76 00             	lea    0x0(%esi),%esi

80100e00 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	53                   	push   %ebx
80100e04:	83 ec 10             	sub    $0x10,%esp
80100e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e0a:	68 60 ef 10 80       	push   $0x8010ef60
80100e0f:	e8 b8 32 00 00       	call   801040cc <acquire>
  if(f->ref < 1)
80100e14:	8b 43 04             	mov    0x4(%ebx),%eax
80100e17:	83 c4 10             	add    $0x10,%esp
80100e1a:	85 c0                	test   %eax,%eax
80100e1c:	7e 18                	jle    80100e36 <filedup+0x36>
    panic("filedup");
  f->ref++;
80100e1e:	40                   	inc    %eax
80100e1f:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e22:	83 ec 0c             	sub    $0xc,%esp
80100e25:	68 60 ef 10 80       	push   $0x8010ef60
80100e2a:	e8 3d 32 00 00       	call   8010406c <release>
  return f;
}
80100e2f:	89 d8                	mov    %ebx,%eax
80100e31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e34:	c9                   	leave  
80100e35:	c3                   	ret    
    panic("filedup");
80100e36:	83 ec 0c             	sub    $0xc,%esp
80100e39:	68 f4 6a 10 80       	push   $0x80106af4
80100e3e:	e8 f5 f4 ff ff       	call   80100338 <panic>
80100e43:	90                   	nop

80100e44 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e44:	55                   	push   %ebp
80100e45:	89 e5                	mov    %esp,%ebp
80100e47:	57                   	push   %edi
80100e48:	56                   	push   %esi
80100e49:	53                   	push   %ebx
80100e4a:	83 ec 28             	sub    $0x28,%esp
80100e4d:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e50:	68 60 ef 10 80       	push   $0x8010ef60
80100e55:	e8 72 32 00 00       	call   801040cc <acquire>
  if(f->ref < 1)
80100e5a:	8b 57 04             	mov    0x4(%edi),%edx
80100e5d:	83 c4 10             	add    $0x10,%esp
80100e60:	85 d2                	test   %edx,%edx
80100e62:	0f 8e 8d 00 00 00    	jle    80100ef5 <fileclose+0xb1>
    panic("fileclose");
  if(--f->ref > 0){
80100e68:	4a                   	dec    %edx
80100e69:	89 57 04             	mov    %edx,0x4(%edi)
80100e6c:	75 3a                	jne    80100ea8 <fileclose+0x64>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e6e:	8b 1f                	mov    (%edi),%ebx
80100e70:	8a 47 09             	mov    0x9(%edi),%al
80100e73:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e76:	8b 77 0c             	mov    0xc(%edi),%esi
80100e79:	8b 47 10             	mov    0x10(%edi),%eax
80100e7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
80100e7f:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  release(&ftable.lock);
80100e85:	83 ec 0c             	sub    $0xc,%esp
80100e88:	68 60 ef 10 80       	push   $0x8010ef60
80100e8d:	e8 da 31 00 00       	call   8010406c <release>

  if(ff.type == FD_PIPE)
80100e92:	83 c4 10             	add    $0x10,%esp
80100e95:	83 fb 01             	cmp    $0x1,%ebx
80100e98:	74 42                	je     80100edc <fileclose+0x98>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e9a:	83 fb 02             	cmp    $0x2,%ebx
80100e9d:	74 1d                	je     80100ebc <fileclose+0x78>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ea2:	5b                   	pop    %ebx
80100ea3:	5e                   	pop    %esi
80100ea4:	5f                   	pop    %edi
80100ea5:	5d                   	pop    %ebp
80100ea6:	c3                   	ret    
80100ea7:	90                   	nop
    release(&ftable.lock);
80100ea8:	c7 45 08 60 ef 10 80 	movl   $0x8010ef60,0x8(%ebp)
}
80100eaf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb2:	5b                   	pop    %ebx
80100eb3:	5e                   	pop    %esi
80100eb4:	5f                   	pop    %edi
80100eb5:	5d                   	pop    %ebp
    release(&ftable.lock);
80100eb6:	e9 b1 31 00 00       	jmp    8010406c <release>
80100ebb:	90                   	nop
    begin_op();
80100ebc:	e8 0b 1b 00 00       	call   801029cc <begin_op>
    iput(ff.ip);
80100ec1:	83 ec 0c             	sub    $0xc,%esp
80100ec4:	ff 75 e0             	pushl  -0x20(%ebp)
80100ec7:	e8 54 08 00 00       	call   80101720 <iput>
    end_op();
80100ecc:	83 c4 10             	add    $0x10,%esp
}
80100ecf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed2:	5b                   	pop    %ebx
80100ed3:	5e                   	pop    %esi
80100ed4:	5f                   	pop    %edi
80100ed5:	5d                   	pop    %ebp
    end_op();
80100ed6:	e9 59 1b 00 00       	jmp    80102a34 <end_op>
80100edb:	90                   	nop
    pipeclose(ff.pipe, ff.writable);
80100edc:	83 ec 08             	sub    $0x8,%esp
80100edf:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80100ee3:	50                   	push   %eax
80100ee4:	56                   	push   %esi
80100ee5:	e8 ea 21 00 00       	call   801030d4 <pipeclose>
80100eea:	83 c4 10             	add    $0x10,%esp
}
80100eed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef0:	5b                   	pop    %ebx
80100ef1:	5e                   	pop    %esi
80100ef2:	5f                   	pop    %edi
80100ef3:	5d                   	pop    %ebp
80100ef4:	c3                   	ret    
    panic("fileclose");
80100ef5:	83 ec 0c             	sub    $0xc,%esp
80100ef8:	68 fc 6a 10 80       	push   $0x80106afc
80100efd:	e8 36 f4 ff ff       	call   80100338 <panic>
80100f02:	66 90                	xchg   %ax,%ax

80100f04 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f04:	55                   	push   %ebp
80100f05:	89 e5                	mov    %esp,%ebp
80100f07:	53                   	push   %ebx
80100f08:	53                   	push   %ebx
80100f09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f0c:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0f:	75 2b                	jne    80100f3c <filestat+0x38>
    ilock(f->ip);
80100f11:	83 ec 0c             	sub    $0xc,%esp
80100f14:	ff 73 10             	pushl  0x10(%ebx)
80100f17:	e8 f8 06 00 00       	call   80101614 <ilock>
    stati(f->ip, st);
80100f1c:	58                   	pop    %eax
80100f1d:	5a                   	pop    %edx
80100f1e:	ff 75 0c             	pushl  0xc(%ebp)
80100f21:	ff 73 10             	pushl  0x10(%ebx)
80100f24:	e8 8f 09 00 00       	call   801018b8 <stati>
    iunlock(f->ip);
80100f29:	59                   	pop    %ecx
80100f2a:	ff 73 10             	pushl  0x10(%ebx)
80100f2d:	e8 aa 07 00 00       	call   801016dc <iunlock>
    return 0;
80100f32:	83 c4 10             	add    $0x10,%esp
80100f35:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f3a:	c9                   	leave  
80100f3b:	c3                   	ret    
  return -1;
80100f3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f44:	c9                   	leave  
80100f45:	c3                   	ret    
80100f46:	66 90                	xchg   %ax,%ax

80100f48 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f48:	55                   	push   %ebp
80100f49:	89 e5                	mov    %esp,%ebp
80100f4b:	57                   	push   %edi
80100f4c:	56                   	push   %esi
80100f4d:	53                   	push   %ebx
80100f4e:	83 ec 1c             	sub    $0x1c,%esp
80100f51:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f54:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f57:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f5a:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f5e:	74 60                	je     80100fc0 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f60:	8b 03                	mov    (%ebx),%eax
80100f62:	83 f8 01             	cmp    $0x1,%eax
80100f65:	74 45                	je     80100fac <fileread+0x64>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f67:	83 f8 02             	cmp    $0x2,%eax
80100f6a:	75 5b                	jne    80100fc7 <fileread+0x7f>
    ilock(f->ip);
80100f6c:	83 ec 0c             	sub    $0xc,%esp
80100f6f:	ff 73 10             	pushl  0x10(%ebx)
80100f72:	e8 9d 06 00 00       	call   80101614 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f77:	57                   	push   %edi
80100f78:	ff 73 14             	pushl  0x14(%ebx)
80100f7b:	56                   	push   %esi
80100f7c:	ff 73 10             	pushl  0x10(%ebx)
80100f7f:	e8 60 09 00 00       	call   801018e4 <readi>
80100f84:	83 c4 20             	add    $0x20,%esp
80100f87:	85 c0                	test   %eax,%eax
80100f89:	7e 03                	jle    80100f8e <fileread+0x46>
      f->off += r;
80100f8b:	01 43 14             	add    %eax,0x14(%ebx)
80100f8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    iunlock(f->ip);
80100f91:	83 ec 0c             	sub    $0xc,%esp
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 40 07 00 00       	call   801016dc <iunlock>
    return r;
80100f9c:	83 c4 10             	add    $0x10,%esp
80100f9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }
  panic("fileread");
}
80100fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa5:	5b                   	pop    %ebx
80100fa6:	5e                   	pop    %esi
80100fa7:	5f                   	pop    %edi
80100fa8:	5d                   	pop    %ebp
80100fa9:	c3                   	ret    
80100faa:	66 90                	xchg   %ax,%ax
    return piperead(f->pipe, addr, n);
80100fac:	8b 43 0c             	mov    0xc(%ebx),%eax
80100faf:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb5:	5b                   	pop    %ebx
80100fb6:	5e                   	pop    %esi
80100fb7:	5f                   	pop    %edi
80100fb8:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fb9:	e9 b6 22 00 00       	jmp    80103274 <piperead>
80100fbe:	66 90                	xchg   %ax,%ax
    return -1;
80100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fc5:	eb db                	jmp    80100fa2 <fileread+0x5a>
  panic("fileread");
80100fc7:	83 ec 0c             	sub    $0xc,%esp
80100fca:	68 06 6b 10 80       	push   $0x80106b06
80100fcf:	e8 64 f3 ff ff       	call   80100338 <panic>

80100fd4 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd4:	55                   	push   %ebp
80100fd5:	89 e5                	mov    %esp,%ebp
80100fd7:	57                   	push   %edi
80100fd8:	56                   	push   %esi
80100fd9:	53                   	push   %ebx
80100fda:	83 ec 1c             	sub    $0x1c,%esp
80100fdd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fe0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100ff0:	0f 84 b3 00 00 00    	je     801010a9 <filewrite+0xd5>
    return -1;
  if(f->type == FD_PIPE)
80100ff6:	8b 03                	mov    (%ebx),%eax
80100ff8:	83 f8 01             	cmp    $0x1,%eax
80100ffb:	0f 84 b7 00 00 00    	je     801010b8 <filewrite+0xe4>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80101001:	83 f8 02             	cmp    $0x2,%eax
80101004:	0f 85 c0 00 00 00    	jne    801010ca <filewrite+0xf6>
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
8010100a:	31 f6                	xor    %esi,%esi
    while(i < n){
8010100c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010100f:	85 c0                	test   %eax,%eax
80101011:	7f 2c                	jg     8010103f <filewrite+0x6b>
80101013:	e9 8c 00 00 00       	jmp    801010a4 <filewrite+0xd0>
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101018:	01 43 14             	add    %eax,0x14(%ebx)
8010101b:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
8010101e:	83 ec 0c             	sub    $0xc,%esp
80101021:	ff 73 10             	pushl  0x10(%ebx)
80101024:	e8 b3 06 00 00       	call   801016dc <iunlock>
      end_op();
80101029:	e8 06 1a 00 00       	call   80102a34 <end_op>

      if(r < 0)
        break;
      if(r != n1)
8010102e:	83 c4 10             	add    $0x10,%esp
80101031:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101034:	39 c7                	cmp    %eax,%edi
80101036:	75 5f                	jne    80101097 <filewrite+0xc3>
        panic("short filewrite");
      i += r;
80101038:	01 fe                	add    %edi,%esi
    while(i < n){
8010103a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010103d:	7e 65                	jle    801010a4 <filewrite+0xd0>
      int n1 = n - i;
8010103f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101042:	29 f7                	sub    %esi,%edi
      if(n1 > max)
80101044:	81 ff 00 06 00 00    	cmp    $0x600,%edi
8010104a:	7e 05                	jle    80101051 <filewrite+0x7d>
8010104c:	bf 00 06 00 00       	mov    $0x600,%edi
      begin_op();
80101051:	e8 76 19 00 00       	call   801029cc <begin_op>
      ilock(f->ip);
80101056:	83 ec 0c             	sub    $0xc,%esp
80101059:	ff 73 10             	pushl  0x10(%ebx)
8010105c:	e8 b3 05 00 00       	call   80101614 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101061:	57                   	push   %edi
80101062:	ff 73 14             	pushl  0x14(%ebx)
80101065:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101068:	01 f0                	add    %esi,%eax
8010106a:	50                   	push   %eax
8010106b:	ff 73 10             	pushl  0x10(%ebx)
8010106e:	e8 71 09 00 00       	call   801019e4 <writei>
80101073:	83 c4 20             	add    $0x20,%esp
80101076:	85 c0                	test   %eax,%eax
80101078:	7f 9e                	jg     80101018 <filewrite+0x44>
8010107a:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
8010107d:	83 ec 0c             	sub    $0xc,%esp
80101080:	ff 73 10             	pushl  0x10(%ebx)
80101083:	e8 54 06 00 00       	call   801016dc <iunlock>
      end_op();
80101088:	e8 a7 19 00 00       	call   80102a34 <end_op>
      if(r < 0)
8010108d:	83 c4 10             	add    $0x10,%esp
80101090:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101093:	85 c0                	test   %eax,%eax
80101095:	75 0d                	jne    801010a4 <filewrite+0xd0>
        panic("short filewrite");
80101097:	83 ec 0c             	sub    $0xc,%esp
8010109a:	68 0f 6b 10 80       	push   $0x80106b0f
8010109f:	e8 94 f2 ff ff       	call   80100338 <panic>
    }
    return i == n ? n : -1;
801010a4:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801010a7:	74 05                	je     801010ae <filewrite+0xda>
    return -1;
801010a9:	be ff ff ff ff       	mov    $0xffffffff,%esi
  }
  panic("filewrite");
}
801010ae:	89 f0                	mov    %esi,%eax
801010b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b3:	5b                   	pop    %ebx
801010b4:	5e                   	pop    %esi
801010b5:	5f                   	pop    %edi
801010b6:	5d                   	pop    %ebp
801010b7:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
801010b8:	8b 43 0c             	mov    0xc(%ebx),%eax
801010bb:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c1:	5b                   	pop    %ebx
801010c2:	5e                   	pop    %esi
801010c3:	5f                   	pop    %edi
801010c4:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010c5:	e9 a2 20 00 00       	jmp    8010316c <pipewrite>
  panic("filewrite");
801010ca:	83 ec 0c             	sub    $0xc,%esp
801010cd:	68 15 6b 10 80       	push   $0x80106b15
801010d2:	e8 61 f2 ff ff       	call   80100338 <panic>
801010d7:	90                   	nop

801010d8 <balloc>:
801010d8:	55                   	push   %ebp
801010d9:	89 e5                	mov    %esp,%ebp
801010db:	57                   	push   %edi
801010dc:	56                   	push   %esi
801010dd:	53                   	push   %ebx
801010de:	83 ec 1c             	sub    $0x1c,%esp
801010e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010e4:	8b 0d b4 15 11 80    	mov    0x801115b4,%ecx
801010ea:	85 c9                	test   %ecx,%ecx
801010ec:	74 7f                	je     8010116d <balloc+0x95>
801010ee:	31 ff                	xor    %edi,%edi
801010f0:	83 ec 08             	sub    $0x8,%esp
801010f3:	89 f8                	mov    %edi,%eax
801010f5:	c1 f8 0c             	sar    $0xc,%eax
801010f8:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801010fe:	50                   	push   %eax
801010ff:	ff 75 dc             	pushl  -0x24(%ebp)
80101102:	e8 ad ef ff ff       	call   801000b4 <bread>
80101107:	89 c3                	mov    %eax,%ebx
80101109:	a1 b4 15 11 80       	mov    0x801115b4,%eax
8010110e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101111:	89 fe                	mov    %edi,%esi
80101113:	83 c4 10             	add    $0x10,%esp
80101116:	31 c0                	xor    %eax,%eax
80101118:	89 7d d8             	mov    %edi,-0x28(%ebp)
8010111b:	eb 2c                	jmp    80101149 <balloc+0x71>
8010111d:	8d 76 00             	lea    0x0(%esi),%esi
80101120:	89 c1                	mov    %eax,%ecx
80101122:	83 e1 07             	and    $0x7,%ecx
80101125:	ba 01 00 00 00       	mov    $0x1,%edx
8010112a:	d3 e2                	shl    %cl,%edx
8010112c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010112f:	89 c1                	mov    %eax,%ecx
80101131:	c1 f9 03             	sar    $0x3,%ecx
80101134:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101139:	89 fa                	mov    %edi,%edx
8010113b:	85 7d e4             	test   %edi,-0x1c(%ebp)
8010113e:	74 3c                	je     8010117c <balloc+0xa4>
80101140:	40                   	inc    %eax
80101141:	46                   	inc    %esi
80101142:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101147:	74 07                	je     80101150 <balloc+0x78>
80101149:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010114c:	39 fe                	cmp    %edi,%esi
8010114e:	72 d0                	jb     80101120 <balloc+0x48>
80101150:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101153:	83 ec 0c             	sub    $0xc,%esp
80101156:	53                   	push   %ebx
80101157:	e8 60 f0 ff ff       	call   801001bc <brelse>
8010115c:	81 c7 00 10 00 00    	add    $0x1000,%edi
80101162:	83 c4 10             	add    $0x10,%esp
80101165:	3b 3d b4 15 11 80    	cmp    0x801115b4,%edi
8010116b:	72 83                	jb     801010f0 <balloc+0x18>
8010116d:	83 ec 0c             	sub    $0xc,%esp
80101170:	68 1f 6b 10 80       	push   $0x80106b1f
80101175:	e8 be f1 ff ff       	call   80100338 <panic>
8010117a:	66 90                	xchg   %ax,%ax
8010117c:	0b 55 e4             	or     -0x1c(%ebp),%edx
8010117f:	88 54 0b 5c          	mov    %dl,0x5c(%ebx,%ecx,1)
80101183:	83 ec 0c             	sub    $0xc,%esp
80101186:	53                   	push   %ebx
80101187:	e8 fc 19 00 00       	call   80102b88 <log_write>
8010118c:	89 1c 24             	mov    %ebx,(%esp)
8010118f:	e8 28 f0 ff ff       	call   801001bc <brelse>
80101194:	58                   	pop    %eax
80101195:	5a                   	pop    %edx
80101196:	56                   	push   %esi
80101197:	ff 75 dc             	pushl  -0x24(%ebp)
8010119a:	e8 15 ef ff ff       	call   801000b4 <bread>
8010119f:	89 c3                	mov    %eax,%ebx
801011a1:	83 c4 0c             	add    $0xc,%esp
801011a4:	68 00 02 00 00       	push   $0x200
801011a9:	6a 00                	push   $0x0
801011ab:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ae:	50                   	push   %eax
801011af:	e8 d8 2f 00 00       	call   8010418c <memset>
801011b4:	89 1c 24             	mov    %ebx,(%esp)
801011b7:	e8 cc 19 00 00       	call   80102b88 <log_write>
801011bc:	89 1c 24             	mov    %ebx,(%esp)
801011bf:	e8 f8 ef ff ff       	call   801001bc <brelse>
801011c4:	89 f0                	mov    %esi,%eax
801011c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011c9:	5b                   	pop    %ebx
801011ca:	5e                   	pop    %esi
801011cb:	5f                   	pop    %edi
801011cc:	5d                   	pop    %ebp
801011cd:	c3                   	ret    
801011ce:	66 90                	xchg   %ax,%ax

801011d0 <iget>:
801011d0:	55                   	push   %ebp
801011d1:	89 e5                	mov    %esp,%ebp
801011d3:	57                   	push   %edi
801011d4:	56                   	push   %esi
801011d5:	53                   	push   %ebx
801011d6:	83 ec 28             	sub    $0x28,%esp
801011d9:	89 c6                	mov    %eax,%esi
801011db:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801011de:	68 60 f9 10 80       	push   $0x8010f960
801011e3:	e8 e4 2e 00 00       	call   801040cc <acquire>
801011e8:	83 c4 10             	add    $0x10,%esp
801011eb:	31 ff                	xor    %edi,%edi
801011ed:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
801011f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801011f5:	eb 13                	jmp    8010120a <iget+0x3a>
801011f7:	90                   	nop
801011f8:	39 33                	cmp    %esi,(%ebx)
801011fa:	74 64                	je     80101260 <iget+0x90>
801011fc:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101202:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101208:	74 22                	je     8010122c <iget+0x5c>
8010120a:	8b 43 08             	mov    0x8(%ebx),%eax
8010120d:	85 c0                	test   %eax,%eax
8010120f:	7f e7                	jg     801011f8 <iget+0x28>
80101211:	85 ff                	test   %edi,%edi
80101213:	75 e7                	jne    801011fc <iget+0x2c>
80101215:	85 c0                	test   %eax,%eax
80101217:	75 6c                	jne    80101285 <iget+0xb5>
80101219:	89 df                	mov    %ebx,%edi
8010121b:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101221:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101227:	75 e1                	jne    8010120a <iget+0x3a>
80101229:	8d 76 00             	lea    0x0(%esi),%esi
8010122c:	85 ff                	test   %edi,%edi
8010122e:	74 73                	je     801012a3 <iget+0xd3>
80101230:	89 37                	mov    %esi,(%edi)
80101232:	89 57 04             	mov    %edx,0x4(%edi)
80101235:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%edi)
8010123c:	c7 47 4c 00 00 00 00 	movl   $0x0,0x4c(%edi)
80101243:	83 ec 0c             	sub    $0xc,%esp
80101246:	68 60 f9 10 80       	push   $0x8010f960
8010124b:	e8 1c 2e 00 00       	call   8010406c <release>
80101250:	83 c4 10             	add    $0x10,%esp
80101253:	89 f8                	mov    %edi,%eax
80101255:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101258:	5b                   	pop    %ebx
80101259:	5e                   	pop    %esi
8010125a:	5f                   	pop    %edi
8010125b:	5d                   	pop    %ebp
8010125c:	c3                   	ret    
8010125d:	8d 76 00             	lea    0x0(%esi),%esi
80101260:	39 53 04             	cmp    %edx,0x4(%ebx)
80101263:	75 97                	jne    801011fc <iget+0x2c>
80101265:	40                   	inc    %eax
80101266:	89 43 08             	mov    %eax,0x8(%ebx)
80101269:	83 ec 0c             	sub    $0xc,%esp
8010126c:	68 60 f9 10 80       	push   $0x8010f960
80101271:	e8 f6 2d 00 00       	call   8010406c <release>
80101276:	83 c4 10             	add    $0x10,%esp
80101279:	89 df                	mov    %ebx,%edi
8010127b:	89 f8                	mov    %edi,%eax
8010127d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101280:	5b                   	pop    %ebx
80101281:	5e                   	pop    %esi
80101282:	5f                   	pop    %edi
80101283:	5d                   	pop    %ebp
80101284:	c3                   	ret    
80101285:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010128b:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101291:	74 10                	je     801012a3 <iget+0xd3>
80101293:	8b 43 08             	mov    0x8(%ebx),%eax
80101296:	85 c0                	test   %eax,%eax
80101298:	0f 8f 5a ff ff ff    	jg     801011f8 <iget+0x28>
8010129e:	e9 72 ff ff ff       	jmp    80101215 <iget+0x45>
801012a3:	83 ec 0c             	sub    $0xc,%esp
801012a6:	68 35 6b 10 80       	push   $0x80106b35
801012ab:	e8 88 f0 ff ff       	call   80100338 <panic>

801012b0 <bfree>:
801012b0:	55                   	push   %ebp
801012b1:	89 e5                	mov    %esp,%ebp
801012b3:	56                   	push   %esi
801012b4:	53                   	push   %ebx
801012b5:	89 c1                	mov    %eax,%ecx
801012b7:	89 d3                	mov    %edx,%ebx
801012b9:	83 ec 08             	sub    $0x8,%esp
801012bc:	89 d0                	mov    %edx,%eax
801012be:	c1 e8 0c             	shr    $0xc,%eax
801012c1:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801012c7:	50                   	push   %eax
801012c8:	51                   	push   %ecx
801012c9:	e8 e6 ed ff ff       	call   801000b4 <bread>
801012ce:	89 c6                	mov    %eax,%esi
801012d0:	89 d9                	mov    %ebx,%ecx
801012d2:	83 e1 07             	and    $0x7,%ecx
801012d5:	b8 01 00 00 00       	mov    $0x1,%eax
801012da:	d3 e0                	shl    %cl,%eax
801012dc:	c1 fb 03             	sar    $0x3,%ebx
801012df:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801012e5:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
801012ea:	83 c4 10             	add    $0x10,%esp
801012ed:	85 c1                	test   %eax,%ecx
801012ef:	74 23                	je     80101314 <bfree+0x64>
801012f1:	f7 d0                	not    %eax
801012f3:	21 c8                	and    %ecx,%eax
801012f5:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
801012f9:	83 ec 0c             	sub    $0xc,%esp
801012fc:	56                   	push   %esi
801012fd:	e8 86 18 00 00       	call   80102b88 <log_write>
80101302:	89 34 24             	mov    %esi,(%esp)
80101305:	e8 b2 ee ff ff       	call   801001bc <brelse>
8010130a:	83 c4 10             	add    $0x10,%esp
8010130d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101310:	5b                   	pop    %ebx
80101311:	5e                   	pop    %esi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	83 ec 0c             	sub    $0xc,%esp
80101317:	68 45 6b 10 80       	push   $0x80106b45
8010131c:	e8 17 f0 ff ff       	call   80100338 <panic>
80101321:	8d 76 00             	lea    0x0(%esi),%esi

80101324 <bmap>:
80101324:	55                   	push   %ebp
80101325:	89 e5                	mov    %esp,%ebp
80101327:	57                   	push   %edi
80101328:	56                   	push   %esi
80101329:	53                   	push   %ebx
8010132a:	83 ec 1c             	sub    $0x1c,%esp
8010132d:	89 c6                	mov    %eax,%esi
8010132f:	83 fa 0b             	cmp    $0xb,%edx
80101332:	76 7c                	jbe    801013b0 <bmap+0x8c>
80101334:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101337:	83 fb 7f             	cmp    $0x7f,%ebx
8010133a:	0f 87 8e 00 00 00    	ja     801013ce <bmap+0xaa>
80101340:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101346:	85 c0                	test   %eax,%eax
80101348:	74 56                	je     801013a0 <bmap+0x7c>
8010134a:	83 ec 08             	sub    $0x8,%esp
8010134d:	50                   	push   %eax
8010134e:	ff 36                	pushl  (%esi)
80101350:	e8 5f ed ff ff       	call   801000b4 <bread>
80101355:	89 c7                	mov    %eax,%edi
80101357:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
8010135b:	8b 03                	mov    (%ebx),%eax
8010135d:	83 c4 10             	add    $0x10,%esp
80101360:	85 c0                	test   %eax,%eax
80101362:	74 1c                	je     80101380 <bmap+0x5c>
80101364:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101367:	83 ec 0c             	sub    $0xc,%esp
8010136a:	57                   	push   %edi
8010136b:	e8 4c ee ff ff       	call   801001bc <brelse>
80101370:	83 c4 10             	add    $0x10,%esp
80101373:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101376:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101379:	5b                   	pop    %ebx
8010137a:	5e                   	pop    %esi
8010137b:	5f                   	pop    %edi
8010137c:	5d                   	pop    %ebp
8010137d:	c3                   	ret    
8010137e:	66 90                	xchg   %ax,%ax
80101380:	8b 06                	mov    (%esi),%eax
80101382:	e8 51 fd ff ff       	call   801010d8 <balloc>
80101387:	89 03                	mov    %eax,(%ebx)
80101389:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010138c:	83 ec 0c             	sub    $0xc,%esp
8010138f:	57                   	push   %edi
80101390:	e8 f3 17 00 00       	call   80102b88 <log_write>
80101395:	83 c4 10             	add    $0x10,%esp
80101398:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010139b:	eb c7                	jmp    80101364 <bmap+0x40>
8010139d:	8d 76 00             	lea    0x0(%esi),%esi
801013a0:	8b 06                	mov    (%esi),%eax
801013a2:	e8 31 fd ff ff       	call   801010d8 <balloc>
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	eb 9b                	jmp    8010134a <bmap+0x26>
801013af:	90                   	nop
801013b0:	8d 5a 14             	lea    0x14(%edx),%ebx
801013b3:	8b 44 98 0c          	mov    0xc(%eax,%ebx,4),%eax
801013b7:	85 c0                	test   %eax,%eax
801013b9:	75 bb                	jne    80101376 <bmap+0x52>
801013bb:	8b 06                	mov    (%esi),%eax
801013bd:	e8 16 fd ff ff       	call   801010d8 <balloc>
801013c2:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
801013c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013c9:	5b                   	pop    %ebx
801013ca:	5e                   	pop    %esi
801013cb:	5f                   	pop    %edi
801013cc:	5d                   	pop    %ebp
801013cd:	c3                   	ret    
801013ce:	83 ec 0c             	sub    $0xc,%esp
801013d1:	68 58 6b 10 80       	push   $0x80106b58
801013d6:	e8 5d ef ff ff       	call   80100338 <panic>
801013db:	90                   	nop

801013dc <readsb>:
801013dc:	55                   	push   %ebp
801013dd:	89 e5                	mov    %esp,%ebp
801013df:	56                   	push   %esi
801013e0:	53                   	push   %ebx
801013e1:	8b 75 0c             	mov    0xc(%ebp),%esi
801013e4:	83 ec 08             	sub    $0x8,%esp
801013e7:	6a 01                	push   $0x1
801013e9:	ff 75 08             	pushl  0x8(%ebp)
801013ec:	e8 c3 ec ff ff       	call   801000b4 <bread>
801013f1:	89 c3                	mov    %eax,%ebx
801013f3:	83 c4 0c             	add    $0xc,%esp
801013f6:	6a 1c                	push   $0x1c
801013f8:	8d 40 5c             	lea    0x5c(%eax),%eax
801013fb:	50                   	push   %eax
801013fc:	56                   	push   %esi
801013fd:	e8 06 2e 00 00       	call   80104208 <memmove>
80101402:	83 c4 10             	add    $0x10,%esp
80101405:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101408:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010140b:	5b                   	pop    %ebx
8010140c:	5e                   	pop    %esi
8010140d:	5d                   	pop    %ebp
8010140e:	e9 a9 ed ff ff       	jmp    801001bc <brelse>
80101413:	90                   	nop

80101414 <iinit>:
80101414:	55                   	push   %ebp
80101415:	89 e5                	mov    %esp,%ebp
80101417:	53                   	push   %ebx
80101418:	83 ec 0c             	sub    $0xc,%esp
8010141b:	68 6b 6b 10 80       	push   $0x80106b6b
80101420:	68 60 f9 10 80       	push   $0x8010f960
80101425:	e8 e2 2a 00 00       	call   80103f0c <initlock>
8010142a:	bb a0 f9 10 80       	mov    $0x8010f9a0,%ebx
8010142f:	83 c4 10             	add    $0x10,%esp
80101432:	66 90                	xchg   %ax,%ax
80101434:	83 ec 08             	sub    $0x8,%esp
80101437:	68 72 6b 10 80       	push   $0x80106b72
8010143c:	53                   	push   %ebx
8010143d:	e8 be 29 00 00       	call   80103e00 <initsleeplock>
80101442:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101448:	83 c4 10             	add    $0x10,%esp
8010144b:	81 fb c0 15 11 80    	cmp    $0x801115c0,%ebx
80101451:	75 e1                	jne    80101434 <iinit+0x20>
80101453:	83 ec 08             	sub    $0x8,%esp
80101456:	6a 01                	push   $0x1
80101458:	ff 75 08             	pushl  0x8(%ebp)
8010145b:	e8 54 ec ff ff       	call   801000b4 <bread>
80101460:	89 c3                	mov    %eax,%ebx
80101462:	83 c4 0c             	add    $0xc,%esp
80101465:	6a 1c                	push   $0x1c
80101467:	8d 40 5c             	lea    0x5c(%eax),%eax
8010146a:	50                   	push   %eax
8010146b:	68 b4 15 11 80       	push   $0x801115b4
80101470:	e8 93 2d 00 00       	call   80104208 <memmove>
80101475:	89 1c 24             	mov    %ebx,(%esp)
80101478:	e8 3f ed ff ff       	call   801001bc <brelse>
8010147d:	ff 35 cc 15 11 80    	pushl  0x801115cc
80101483:	ff 35 c8 15 11 80    	pushl  0x801115c8
80101489:	ff 35 c4 15 11 80    	pushl  0x801115c4
8010148f:	ff 35 c0 15 11 80    	pushl  0x801115c0
80101495:	ff 35 bc 15 11 80    	pushl  0x801115bc
8010149b:	ff 35 b8 15 11 80    	pushl  0x801115b8
801014a1:	ff 35 b4 15 11 80    	pushl  0x801115b4
801014a7:	68 d8 6b 10 80       	push   $0x80106bd8
801014ac:	e8 77 f1 ff ff       	call   80100628 <cprintf>
801014b1:	83 c4 30             	add    $0x30,%esp
801014b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014b7:	c9                   	leave  
801014b8:	c3                   	ret    
801014b9:	8d 76 00             	lea    0x0(%esi),%esi

801014bc <ialloc>:
801014bc:	55                   	push   %ebp
801014bd:	89 e5                	mov    %esp,%ebp
801014bf:	57                   	push   %edi
801014c0:	56                   	push   %esi
801014c1:	53                   	push   %ebx
801014c2:	83 ec 1c             	sub    $0x1c,%esp
801014c5:	8b 75 08             	mov    0x8(%ebp),%esi
801014c8:	8b 45 0c             	mov    0xc(%ebp),%eax
801014cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801014ce:	83 3d bc 15 11 80 01 	cmpl   $0x1,0x801115bc
801014d5:	0f 86 84 00 00 00    	jbe    8010155f <ialloc+0xa3>
801014db:	bf 01 00 00 00       	mov    $0x1,%edi
801014e0:	eb 17                	jmp    801014f9 <ialloc+0x3d>
801014e2:	66 90                	xchg   %ax,%ax
801014e4:	83 ec 0c             	sub    $0xc,%esp
801014e7:	53                   	push   %ebx
801014e8:	e8 cf ec ff ff       	call   801001bc <brelse>
801014ed:	47                   	inc    %edi
801014ee:	83 c4 10             	add    $0x10,%esp
801014f1:	3b 3d bc 15 11 80    	cmp    0x801115bc,%edi
801014f7:	73 66                	jae    8010155f <ialloc+0xa3>
801014f9:	83 ec 08             	sub    $0x8,%esp
801014fc:	89 f8                	mov    %edi,%eax
801014fe:	c1 e8 03             	shr    $0x3,%eax
80101501:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101507:	50                   	push   %eax
80101508:	56                   	push   %esi
80101509:	e8 a6 eb ff ff       	call   801000b4 <bread>
8010150e:	89 c3                	mov    %eax,%ebx
80101510:	89 f8                	mov    %edi,%eax
80101512:	83 e0 07             	and    $0x7,%eax
80101515:	c1 e0 06             	shl    $0x6,%eax
80101518:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101523:	75 bf                	jne    801014e4 <ialloc+0x28>
80101525:	50                   	push   %eax
80101526:	6a 40                	push   $0x40
80101528:	6a 00                	push   $0x0
8010152a:	51                   	push   %ecx
8010152b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010152e:	e8 59 2c 00 00       	call   8010418c <memset>
80101533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101536:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101539:	66 89 01             	mov    %ax,(%ecx)
8010153c:	89 1c 24             	mov    %ebx,(%esp)
8010153f:	e8 44 16 00 00       	call   80102b88 <log_write>
80101544:	89 1c 24             	mov    %ebx,(%esp)
80101547:	e8 70 ec ff ff       	call   801001bc <brelse>
8010154c:	83 c4 10             	add    $0x10,%esp
8010154f:	89 fa                	mov    %edi,%edx
80101551:	89 f0                	mov    %esi,%eax
80101553:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101556:	5b                   	pop    %ebx
80101557:	5e                   	pop    %esi
80101558:	5f                   	pop    %edi
80101559:	5d                   	pop    %ebp
8010155a:	e9 71 fc ff ff       	jmp    801011d0 <iget>
8010155f:	83 ec 0c             	sub    $0xc,%esp
80101562:	68 78 6b 10 80       	push   $0x80106b78
80101567:	e8 cc ed ff ff       	call   80100338 <panic>

8010156c <iupdate>:
8010156c:	55                   	push   %ebp
8010156d:	89 e5                	mov    %esp,%ebp
8010156f:	56                   	push   %esi
80101570:	53                   	push   %ebx
80101571:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101574:	83 ec 08             	sub    $0x8,%esp
80101577:	8b 43 04             	mov    0x4(%ebx),%eax
8010157a:	c1 e8 03             	shr    $0x3,%eax
8010157d:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101583:	50                   	push   %eax
80101584:	ff 33                	pushl  (%ebx)
80101586:	e8 29 eb ff ff       	call   801000b4 <bread>
8010158b:	89 c6                	mov    %eax,%esi
8010158d:	8b 43 04             	mov    0x4(%ebx),%eax
80101590:	83 e0 07             	and    $0x7,%eax
80101593:	c1 e0 06             	shl    $0x6,%eax
80101596:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
8010159a:	8b 53 50             	mov    0x50(%ebx),%edx
8010159d:	66 89 10             	mov    %dx,(%eax)
801015a0:	66 8b 53 52          	mov    0x52(%ebx),%dx
801015a4:	66 89 50 02          	mov    %dx,0x2(%eax)
801015a8:	8b 53 54             	mov    0x54(%ebx),%edx
801015ab:	66 89 50 04          	mov    %dx,0x4(%eax)
801015af:	66 8b 53 56          	mov    0x56(%ebx),%dx
801015b3:	66 89 50 06          	mov    %dx,0x6(%eax)
801015b7:	8b 53 58             	mov    0x58(%ebx),%edx
801015ba:	89 50 08             	mov    %edx,0x8(%eax)
801015bd:	83 c4 0c             	add    $0xc,%esp
801015c0:	6a 34                	push   $0x34
801015c2:	83 c3 5c             	add    $0x5c,%ebx
801015c5:	53                   	push   %ebx
801015c6:	83 c0 0c             	add    $0xc,%eax
801015c9:	50                   	push   %eax
801015ca:	e8 39 2c 00 00       	call   80104208 <memmove>
801015cf:	89 34 24             	mov    %esi,(%esp)
801015d2:	e8 b1 15 00 00       	call   80102b88 <log_write>
801015d7:	83 c4 10             	add    $0x10,%esp
801015da:	89 75 08             	mov    %esi,0x8(%ebp)
801015dd:	8d 65 f8             	lea    -0x8(%ebp),%esp
801015e0:	5b                   	pop    %ebx
801015e1:	5e                   	pop    %esi
801015e2:	5d                   	pop    %ebp
801015e3:	e9 d4 eb ff ff       	jmp    801001bc <brelse>

801015e8 <idup>:
801015e8:	55                   	push   %ebp
801015e9:	89 e5                	mov    %esp,%ebp
801015eb:	53                   	push   %ebx
801015ec:	83 ec 10             	sub    $0x10,%esp
801015ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015f2:	68 60 f9 10 80       	push   $0x8010f960
801015f7:	e8 d0 2a 00 00       	call   801040cc <acquire>
801015fc:	ff 43 08             	incl   0x8(%ebx)
801015ff:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101606:	e8 61 2a 00 00       	call   8010406c <release>
8010160b:	89 d8                	mov    %ebx,%eax
8010160d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101610:	c9                   	leave  
80101611:	c3                   	ret    
80101612:	66 90                	xchg   %ax,%ax

80101614 <ilock>:
80101614:	55                   	push   %ebp
80101615:	89 e5                	mov    %esp,%ebp
80101617:	56                   	push   %esi
80101618:	53                   	push   %ebx
80101619:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010161c:	85 db                	test   %ebx,%ebx
8010161e:	0f 84 a9 00 00 00    	je     801016cd <ilock+0xb9>
80101624:	8b 53 08             	mov    0x8(%ebx),%edx
80101627:	85 d2                	test   %edx,%edx
80101629:	0f 8e 9e 00 00 00    	jle    801016cd <ilock+0xb9>
8010162f:	83 ec 0c             	sub    $0xc,%esp
80101632:	8d 43 0c             	lea    0xc(%ebx),%eax
80101635:	50                   	push   %eax
80101636:	e8 f9 27 00 00       	call   80103e34 <acquiresleep>
8010163b:	83 c4 10             	add    $0x10,%esp
8010163e:	8b 43 4c             	mov    0x4c(%ebx),%eax
80101641:	85 c0                	test   %eax,%eax
80101643:	74 07                	je     8010164c <ilock+0x38>
80101645:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101648:	5b                   	pop    %ebx
80101649:	5e                   	pop    %esi
8010164a:	5d                   	pop    %ebp
8010164b:	c3                   	ret    
8010164c:	83 ec 08             	sub    $0x8,%esp
8010164f:	8b 43 04             	mov    0x4(%ebx),%eax
80101652:	c1 e8 03             	shr    $0x3,%eax
80101655:	03 05 c8 15 11 80    	add    0x801115c8,%eax
8010165b:	50                   	push   %eax
8010165c:	ff 33                	pushl  (%ebx)
8010165e:	e8 51 ea ff ff       	call   801000b4 <bread>
80101663:	89 c6                	mov    %eax,%esi
80101665:	8b 43 04             	mov    0x4(%ebx),%eax
80101668:	83 e0 07             	and    $0x7,%eax
8010166b:	c1 e0 06             	shl    $0x6,%eax
8010166e:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101672:	8b 10                	mov    (%eax),%edx
80101674:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101678:	66 8b 50 02          	mov    0x2(%eax),%dx
8010167c:	66 89 53 52          	mov    %dx,0x52(%ebx)
80101680:	8b 50 04             	mov    0x4(%eax),%edx
80101683:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101687:	66 8b 50 06          	mov    0x6(%eax),%dx
8010168b:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010168f:	8b 50 08             	mov    0x8(%eax),%edx
80101692:	89 53 58             	mov    %edx,0x58(%ebx)
80101695:	83 c4 0c             	add    $0xc,%esp
80101698:	6a 34                	push   $0x34
8010169a:	83 c0 0c             	add    $0xc,%eax
8010169d:	50                   	push   %eax
8010169e:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016a1:	50                   	push   %eax
801016a2:	e8 61 2b 00 00       	call   80104208 <memmove>
801016a7:	89 34 24             	mov    %esi,(%esp)
801016aa:	e8 0d eb ff ff       	call   801001bc <brelse>
801016af:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801016b6:	83 c4 10             	add    $0x10,%esp
801016b9:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
801016be:	75 85                	jne    80101645 <ilock+0x31>
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	68 90 6b 10 80       	push   $0x80106b90
801016c8:	e8 6b ec ff ff       	call   80100338 <panic>
801016cd:	83 ec 0c             	sub    $0xc,%esp
801016d0:	68 8a 6b 10 80       	push   $0x80106b8a
801016d5:	e8 5e ec ff ff       	call   80100338 <panic>
801016da:	66 90                	xchg   %ax,%ax

801016dc <iunlock>:
801016dc:	55                   	push   %ebp
801016dd:	89 e5                	mov    %esp,%ebp
801016df:	56                   	push   %esi
801016e0:	53                   	push   %ebx
801016e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016e4:	85 db                	test   %ebx,%ebx
801016e6:	74 28                	je     80101710 <iunlock+0x34>
801016e8:	8d 73 0c             	lea    0xc(%ebx),%esi
801016eb:	83 ec 0c             	sub    $0xc,%esp
801016ee:	56                   	push   %esi
801016ef:	e8 d0 27 00 00       	call   80103ec4 <holdingsleep>
801016f4:	83 c4 10             	add    $0x10,%esp
801016f7:	85 c0                	test   %eax,%eax
801016f9:	74 15                	je     80101710 <iunlock+0x34>
801016fb:	8b 43 08             	mov    0x8(%ebx),%eax
801016fe:	85 c0                	test   %eax,%eax
80101700:	7e 0e                	jle    80101710 <iunlock+0x34>
80101702:	89 75 08             	mov    %esi,0x8(%ebp)
80101705:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101708:	5b                   	pop    %ebx
80101709:	5e                   	pop    %esi
8010170a:	5d                   	pop    %ebp
8010170b:	e9 78 27 00 00       	jmp    80103e88 <releasesleep>
80101710:	83 ec 0c             	sub    $0xc,%esp
80101713:	68 9f 6b 10 80       	push   $0x80106b9f
80101718:	e8 1b ec ff ff       	call   80100338 <panic>
8010171d:	8d 76 00             	lea    0x0(%esi),%esi

80101720 <iput>:
80101720:	55                   	push   %ebp
80101721:	89 e5                	mov    %esp,%ebp
80101723:	57                   	push   %edi
80101724:	56                   	push   %esi
80101725:	53                   	push   %ebx
80101726:	83 ec 28             	sub    $0x28,%esp
80101729:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010172c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010172f:	57                   	push   %edi
80101730:	e8 ff 26 00 00       	call   80103e34 <acquiresleep>
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010173b:	85 c0                	test   %eax,%eax
8010173d:	74 07                	je     80101746 <iput+0x26>
8010173f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101744:	74 2e                	je     80101774 <iput+0x54>
80101746:	83 ec 0c             	sub    $0xc,%esp
80101749:	57                   	push   %edi
8010174a:	e8 39 27 00 00       	call   80103e88 <releasesleep>
8010174f:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101756:	e8 71 29 00 00       	call   801040cc <acquire>
8010175b:	ff 4b 08             	decl   0x8(%ebx)
8010175e:	83 c4 10             	add    $0x10,%esp
80101761:	c7 45 08 60 f9 10 80 	movl   $0x8010f960,0x8(%ebp)
80101768:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010176b:	5b                   	pop    %ebx
8010176c:	5e                   	pop    %esi
8010176d:	5f                   	pop    %edi
8010176e:	5d                   	pop    %ebp
8010176f:	e9 f8 28 00 00       	jmp    8010406c <release>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 60 f9 10 80       	push   $0x8010f960
8010177c:	e8 4b 29 00 00       	call   801040cc <acquire>
80101781:	8b 73 08             	mov    0x8(%ebx),%esi
80101784:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010178b:	e8 dc 28 00 00       	call   8010406c <release>
80101790:	83 c4 10             	add    $0x10,%esp
80101793:	4e                   	dec    %esi
80101794:	75 b0                	jne    80101746 <iput+0x26>
80101796:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101799:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
8010179f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801017a2:	89 df                	mov    %ebx,%edi
801017a4:	89 cb                	mov    %ecx,%ebx
801017a6:	eb 07                	jmp    801017af <iput+0x8f>
801017a8:	83 c6 04             	add    $0x4,%esi
801017ab:	39 de                	cmp    %ebx,%esi
801017ad:	74 15                	je     801017c4 <iput+0xa4>
801017af:	8b 16                	mov    (%esi),%edx
801017b1:	85 d2                	test   %edx,%edx
801017b3:	74 f3                	je     801017a8 <iput+0x88>
801017b5:	8b 07                	mov    (%edi),%eax
801017b7:	e8 f4 fa ff ff       	call   801012b0 <bfree>
801017bc:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801017c2:	eb e4                	jmp    801017a8 <iput+0x88>
801017c4:	89 fb                	mov    %edi,%ebx
801017c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801017c9:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801017cf:	85 c0                	test   %eax,%eax
801017d1:	75 2d                	jne    80101800 <iput+0xe0>
801017d3:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801017da:	83 ec 0c             	sub    $0xc,%esp
801017dd:	53                   	push   %ebx
801017de:	e8 89 fd ff ff       	call   8010156c <iupdate>
801017e3:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
801017e9:	89 1c 24             	mov    %ebx,(%esp)
801017ec:	e8 7b fd ff ff       	call   8010156c <iupdate>
801017f1:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801017f8:	83 c4 10             	add    $0x10,%esp
801017fb:	e9 46 ff ff ff       	jmp    80101746 <iput+0x26>
80101800:	83 ec 08             	sub    $0x8,%esp
80101803:	50                   	push   %eax
80101804:	ff 33                	pushl  (%ebx)
80101806:	e8 a9 e8 ff ff       	call   801000b4 <bread>
8010180b:	8d 70 5c             	lea    0x5c(%eax),%esi
8010180e:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010181a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010181d:	89 cf                	mov    %ecx,%edi
8010181f:	eb 0a                	jmp    8010182b <iput+0x10b>
80101821:	8d 76 00             	lea    0x0(%esi),%esi
80101824:	83 c6 04             	add    $0x4,%esi
80101827:	39 fe                	cmp    %edi,%esi
80101829:	74 0f                	je     8010183a <iput+0x11a>
8010182b:	8b 16                	mov    (%esi),%edx
8010182d:	85 d2                	test   %edx,%edx
8010182f:	74 f3                	je     80101824 <iput+0x104>
80101831:	8b 03                	mov    (%ebx),%eax
80101833:	e8 78 fa ff ff       	call   801012b0 <bfree>
80101838:	eb ea                	jmp    80101824 <iput+0x104>
8010183a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010183d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101840:	83 ec 0c             	sub    $0xc,%esp
80101843:	50                   	push   %eax
80101844:	e8 73 e9 ff ff       	call   801001bc <brelse>
80101849:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
8010184f:	8b 03                	mov    (%ebx),%eax
80101851:	e8 5a fa ff ff       	call   801012b0 <bfree>
80101856:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
8010185d:	00 00 00 
80101860:	83 c4 10             	add    $0x10,%esp
80101863:	e9 6b ff ff ff       	jmp    801017d3 <iput+0xb3>

80101868 <iunlockput>:
80101868:	55                   	push   %ebp
80101869:	89 e5                	mov    %esp,%ebp
8010186b:	56                   	push   %esi
8010186c:	53                   	push   %ebx
8010186d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101870:	85 db                	test   %ebx,%ebx
80101872:	74 34                	je     801018a8 <iunlockput+0x40>
80101874:	8d 73 0c             	lea    0xc(%ebx),%esi
80101877:	83 ec 0c             	sub    $0xc,%esp
8010187a:	56                   	push   %esi
8010187b:	e8 44 26 00 00       	call   80103ec4 <holdingsleep>
80101880:	83 c4 10             	add    $0x10,%esp
80101883:	85 c0                	test   %eax,%eax
80101885:	74 21                	je     801018a8 <iunlockput+0x40>
80101887:	8b 43 08             	mov    0x8(%ebx),%eax
8010188a:	85 c0                	test   %eax,%eax
8010188c:	7e 1a                	jle    801018a8 <iunlockput+0x40>
8010188e:	83 ec 0c             	sub    $0xc,%esp
80101891:	56                   	push   %esi
80101892:	e8 f1 25 00 00       	call   80103e88 <releasesleep>
80101897:	83 c4 10             	add    $0x10,%esp
8010189a:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010189d:	8d 65 f8             	lea    -0x8(%ebp),%esp
801018a0:	5b                   	pop    %ebx
801018a1:	5e                   	pop    %esi
801018a2:	5d                   	pop    %ebp
801018a3:	e9 78 fe ff ff       	jmp    80101720 <iput>
801018a8:	83 ec 0c             	sub    $0xc,%esp
801018ab:	68 9f 6b 10 80       	push   $0x80106b9f
801018b0:	e8 83 ea ff ff       	call   80100338 <panic>
801018b5:	8d 76 00             	lea    0x0(%esi),%esi

801018b8 <stati>:
801018b8:	55                   	push   %ebp
801018b9:	89 e5                	mov    %esp,%ebp
801018bb:	8b 55 08             	mov    0x8(%ebp),%edx
801018be:	8b 45 0c             	mov    0xc(%ebp),%eax
801018c1:	8b 0a                	mov    (%edx),%ecx
801018c3:	89 48 04             	mov    %ecx,0x4(%eax)
801018c6:	8b 4a 04             	mov    0x4(%edx),%ecx
801018c9:	89 48 08             	mov    %ecx,0x8(%eax)
801018cc:	8b 4a 50             	mov    0x50(%edx),%ecx
801018cf:	66 89 08             	mov    %cx,(%eax)
801018d2:	66 8b 4a 56          	mov    0x56(%edx),%cx
801018d6:	66 89 48 0c          	mov    %cx,0xc(%eax)
801018da:	8b 52 58             	mov    0x58(%edx),%edx
801018dd:	89 50 10             	mov    %edx,0x10(%eax)
801018e0:	5d                   	pop    %ebp
801018e1:	c3                   	ret    
801018e2:	66 90                	xchg   %ax,%ax

801018e4 <readi>:
801018e4:	55                   	push   %ebp
801018e5:	89 e5                	mov    %esp,%ebp
801018e7:	57                   	push   %edi
801018e8:	56                   	push   %esi
801018e9:	53                   	push   %ebx
801018ea:	83 ec 1c             	sub    $0x1c,%esp
801018ed:	8b 45 08             	mov    0x8(%ebp),%eax
801018f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
801018f3:	8b 75 0c             	mov    0xc(%ebp),%esi
801018f6:	89 75 e0             	mov    %esi,-0x20(%ebp)
801018f9:	8b 7d 10             	mov    0x10(%ebp),%edi
801018fc:	8b 75 14             	mov    0x14(%ebp),%esi
801018ff:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80101902:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101907:	0f 84 af 00 00 00    	je     801019bc <readi+0xd8>
8010190d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101910:	8b 50 58             	mov    0x58(%eax),%edx
80101913:	39 fa                	cmp    %edi,%edx
80101915:	0f 82 c2 00 00 00    	jb     801019dd <readi+0xf9>
8010191b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010191e:	31 c0                	xor    %eax,%eax
80101920:	01 f9                	add    %edi,%ecx
80101922:	0f 92 c0             	setb   %al
80101925:	89 c3                	mov    %eax,%ebx
80101927:	0f 82 b0 00 00 00    	jb     801019dd <readi+0xf9>
8010192d:	39 ca                	cmp    %ecx,%edx
8010192f:	72 7f                	jb     801019b0 <readi+0xcc>
80101931:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101934:	85 f6                	test   %esi,%esi
80101936:	74 6a                	je     801019a2 <readi+0xbe>
80101938:	89 de                	mov    %ebx,%esi
8010193a:	66 90                	xchg   %ax,%ax
8010193c:	89 fa                	mov    %edi,%edx
8010193e:	c1 ea 09             	shr    $0x9,%edx
80101941:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101944:	89 d8                	mov    %ebx,%eax
80101946:	e8 d9 f9 ff ff       	call   80101324 <bmap>
8010194b:	83 ec 08             	sub    $0x8,%esp
8010194e:	50                   	push   %eax
8010194f:	ff 33                	pushl  (%ebx)
80101951:	e8 5e e7 ff ff       	call   801000b4 <bread>
80101956:	89 c2                	mov    %eax,%edx
80101958:	89 f8                	mov    %edi,%eax
8010195a:	25 ff 01 00 00       	and    $0x1ff,%eax
8010195f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101962:	29 f1                	sub    %esi,%ecx
80101964:	bb 00 02 00 00       	mov    $0x200,%ebx
80101969:	29 c3                	sub    %eax,%ebx
8010196b:	83 c4 10             	add    $0x10,%esp
8010196e:	39 d9                	cmp    %ebx,%ecx
80101970:	73 02                	jae    80101974 <readi+0x90>
80101972:	89 cb                	mov    %ecx,%ebx
80101974:	51                   	push   %ecx
80101975:	53                   	push   %ebx
80101976:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
8010197a:	89 55 dc             	mov    %edx,-0x24(%ebp)
8010197d:	50                   	push   %eax
8010197e:	ff 75 e0             	pushl  -0x20(%ebp)
80101981:	e8 82 28 00 00       	call   80104208 <memmove>
80101986:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101989:	89 14 24             	mov    %edx,(%esp)
8010198c:	e8 2b e8 ff ff       	call   801001bc <brelse>
80101991:	01 de                	add    %ebx,%esi
80101993:	01 df                	add    %ebx,%edi
80101995:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101998:	83 c4 10             	add    $0x10,%esp
8010199b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010199e:	39 c6                	cmp    %eax,%esi
801019a0:	72 9a                	jb     8010193c <readi+0x58>
801019a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019a8:	5b                   	pop    %ebx
801019a9:	5e                   	pop    %esi
801019aa:	5f                   	pop    %edi
801019ab:	5d                   	pop    %ebp
801019ac:	c3                   	ret    
801019ad:	8d 76 00             	lea    0x0(%esi),%esi
801019b0:	29 fa                	sub    %edi,%edx
801019b2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019b5:	e9 77 ff ff ff       	jmp    80101931 <readi+0x4d>
801019ba:	66 90                	xchg   %ax,%ax
801019bc:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019c0:	66 83 f8 09          	cmp    $0x9,%ax
801019c4:	77 17                	ja     801019dd <readi+0xf9>
801019c6:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
801019cd:	85 c0                	test   %eax,%eax
801019cf:	74 0c                	je     801019dd <readi+0xf9>
801019d1:	89 75 10             	mov    %esi,0x10(%ebp)
801019d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d7:	5b                   	pop    %ebx
801019d8:	5e                   	pop    %esi
801019d9:	5f                   	pop    %edi
801019da:	5d                   	pop    %ebp
801019db:	ff e0                	jmp    *%eax
801019dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801019e2:	eb c1                	jmp    801019a5 <readi+0xc1>

801019e4 <writei>:
801019e4:	55                   	push   %ebp
801019e5:	89 e5                	mov    %esp,%ebp
801019e7:	57                   	push   %edi
801019e8:	56                   	push   %esi
801019e9:	53                   	push   %ebx
801019ea:	83 ec 1c             	sub    $0x1c,%esp
801019ed:	8b 45 08             	mov    0x8(%ebp),%eax
801019f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019f3:	8b 75 0c             	mov    0xc(%ebp),%esi
801019f6:	89 75 dc             	mov    %esi,-0x24(%ebp)
801019f9:	8b 7d 10             	mov    0x10(%ebp),%edi
801019fc:	8b 75 14             	mov    0x14(%ebp),%esi
801019ff:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80101a02:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a07:	0f 84 b7 00 00 00    	je     80101ac4 <writei+0xe0>
80101a0d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a10:	39 78 58             	cmp    %edi,0x58(%eax)
80101a13:	0f 82 e0 00 00 00    	jb     80101af9 <writei+0x115>
80101a19:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a1c:	89 f2                	mov    %esi,%edx
80101a1e:	31 c0                	xor    %eax,%eax
80101a20:	01 fa                	add    %edi,%edx
80101a22:	0f 92 c0             	setb   %al
80101a25:	0f 82 ce 00 00 00    	jb     80101af9 <writei+0x115>
80101a2b:	81 fa 00 18 01 00    	cmp    $0x11800,%edx
80101a31:	0f 87 c2 00 00 00    	ja     80101af9 <writei+0x115>
80101a37:	85 f6                	test   %esi,%esi
80101a39:	74 7c                	je     80101ab7 <writei+0xd3>
80101a3b:	89 c6                	mov    %eax,%esi
80101a3d:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a40:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101a43:	89 da                	mov    %ebx,%edx
80101a45:	c1 ea 09             	shr    $0x9,%edx
80101a48:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a4b:	89 f8                	mov    %edi,%eax
80101a4d:	e8 d2 f8 ff ff       	call   80101324 <bmap>
80101a52:	83 ec 08             	sub    $0x8,%esp
80101a55:	50                   	push   %eax
80101a56:	ff 37                	pushl  (%edi)
80101a58:	e8 57 e6 ff ff       	call   801000b4 <bread>
80101a5d:	89 c7                	mov    %eax,%edi
80101a5f:	89 d8                	mov    %ebx,%eax
80101a61:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a66:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101a69:	29 f1                	sub    %esi,%ecx
80101a6b:	bb 00 02 00 00       	mov    $0x200,%ebx
80101a70:	29 c3                	sub    %eax,%ebx
80101a72:	83 c4 10             	add    $0x10,%esp
80101a75:	39 d9                	cmp    %ebx,%ecx
80101a77:	73 02                	jae    80101a7b <writei+0x97>
80101a79:	89 cb                	mov    %ecx,%ebx
80101a7b:	52                   	push   %edx
80101a7c:	53                   	push   %ebx
80101a7d:	ff 75 dc             	pushl  -0x24(%ebp)
80101a80:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101a84:	50                   	push   %eax
80101a85:	e8 7e 27 00 00       	call   80104208 <memmove>
80101a8a:	89 3c 24             	mov    %edi,(%esp)
80101a8d:	e8 f6 10 00 00       	call   80102b88 <log_write>
80101a92:	89 3c 24             	mov    %edi,(%esp)
80101a95:	e8 22 e7 ff ff       	call   801001bc <brelse>
80101a9a:	01 de                	add    %ebx,%esi
80101a9c:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a9f:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101aa2:	83 c4 10             	add    $0x10,%esp
80101aa5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aa8:	39 c6                	cmp    %eax,%esi
80101aaa:	72 94                	jb     80101a40 <writei+0x5c>
80101aac:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aaf:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101ab2:	39 78 58             	cmp    %edi,0x58(%eax)
80101ab5:	72 31                	jb     80101ae8 <writei+0x104>
80101ab7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101abd:	5b                   	pop    %ebx
80101abe:	5e                   	pop    %esi
80101abf:	5f                   	pop    %edi
80101ac0:	5d                   	pop    %ebp
80101ac1:	c3                   	ret    
80101ac2:	66 90                	xchg   %ax,%ax
80101ac4:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101ac8:	66 83 f8 09          	cmp    $0x9,%ax
80101acc:	77 2b                	ja     80101af9 <writei+0x115>
80101ace:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
80101ad5:	85 c0                	test   %eax,%eax
80101ad7:	74 20                	je     80101af9 <writei+0x115>
80101ad9:	89 75 10             	mov    %esi,0x10(%ebp)
80101adc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101adf:	5b                   	pop    %ebx
80101ae0:	5e                   	pop    %esi
80101ae1:	5f                   	pop    %edi
80101ae2:	5d                   	pop    %ebp
80101ae3:	ff e0                	jmp    *%eax
80101ae5:	8d 76 00             	lea    0x0(%esi),%esi
80101ae8:	89 78 58             	mov    %edi,0x58(%eax)
80101aeb:	83 ec 0c             	sub    $0xc,%esp
80101aee:	50                   	push   %eax
80101aef:	e8 78 fa ff ff       	call   8010156c <iupdate>
80101af4:	83 c4 10             	add    $0x10,%esp
80101af7:	eb be                	jmp    80101ab7 <writei+0xd3>
80101af9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101afe:	eb ba                	jmp    80101aba <writei+0xd6>

80101b00 <namecmp>:
80101b00:	55                   	push   %ebp
80101b01:	89 e5                	mov    %esp,%ebp
80101b03:	83 ec 0c             	sub    $0xc,%esp
80101b06:	6a 0e                	push   $0xe
80101b08:	ff 75 0c             	pushl  0xc(%ebp)
80101b0b:	ff 75 08             	pushl  0x8(%ebp)
80101b0e:	e8 41 27 00 00       	call   80104254 <strncmp>
80101b13:	c9                   	leave  
80101b14:	c3                   	ret    
80101b15:	8d 76 00             	lea    0x0(%esi),%esi

80101b18 <dirlookup>:
80101b18:	55                   	push   %ebp
80101b19:	89 e5                	mov    %esp,%ebp
80101b1b:	57                   	push   %edi
80101b1c:	56                   	push   %esi
80101b1d:	53                   	push   %ebx
80101b1e:	83 ec 1c             	sub    $0x1c,%esp
80101b21:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b24:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b29:	75 7d                	jne    80101ba8 <dirlookup+0x90>
80101b2b:	8b 4b 58             	mov    0x58(%ebx),%ecx
80101b2e:	85 c9                	test   %ecx,%ecx
80101b30:	74 3d                	je     80101b6f <dirlookup+0x57>
80101b32:	31 ff                	xor    %edi,%edi
80101b34:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b37:	90                   	nop
80101b38:	6a 10                	push   $0x10
80101b3a:	57                   	push   %edi
80101b3b:	56                   	push   %esi
80101b3c:	53                   	push   %ebx
80101b3d:	e8 a2 fd ff ff       	call   801018e4 <readi>
80101b42:	83 c4 10             	add    $0x10,%esp
80101b45:	83 f8 10             	cmp    $0x10,%eax
80101b48:	75 51                	jne    80101b9b <dirlookup+0x83>
80101b4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101b4f:	74 16                	je     80101b67 <dirlookup+0x4f>
80101b51:	52                   	push   %edx
80101b52:	6a 0e                	push   $0xe
80101b54:	8d 45 da             	lea    -0x26(%ebp),%eax
80101b57:	50                   	push   %eax
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	e8 f4 26 00 00       	call   80104254 <strncmp>
80101b60:	83 c4 10             	add    $0x10,%esp
80101b63:	85 c0                	test   %eax,%eax
80101b65:	74 15                	je     80101b7c <dirlookup+0x64>
80101b67:	83 c7 10             	add    $0x10,%edi
80101b6a:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101b6d:	72 c9                	jb     80101b38 <dirlookup+0x20>
80101b6f:	31 c0                	xor    %eax,%eax
80101b71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b74:	5b                   	pop    %ebx
80101b75:	5e                   	pop    %esi
80101b76:	5f                   	pop    %edi
80101b77:	5d                   	pop    %ebp
80101b78:	c3                   	ret    
80101b79:	8d 76 00             	lea    0x0(%esi),%esi
80101b7c:	8b 45 10             	mov    0x10(%ebp),%eax
80101b7f:	85 c0                	test   %eax,%eax
80101b81:	74 05                	je     80101b88 <dirlookup+0x70>
80101b83:	8b 45 10             	mov    0x10(%ebp),%eax
80101b86:	89 38                	mov    %edi,(%eax)
80101b88:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101b8c:	8b 03                	mov    (%ebx),%eax
80101b8e:	e8 3d f6 ff ff       	call   801011d0 <iget>
80101b93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b96:	5b                   	pop    %ebx
80101b97:	5e                   	pop    %esi
80101b98:	5f                   	pop    %edi
80101b99:	5d                   	pop    %ebp
80101b9a:	c3                   	ret    
80101b9b:	83 ec 0c             	sub    $0xc,%esp
80101b9e:	68 b9 6b 10 80       	push   $0x80106bb9
80101ba3:	e8 90 e7 ff ff       	call   80100338 <panic>
80101ba8:	83 ec 0c             	sub    $0xc,%esp
80101bab:	68 a7 6b 10 80       	push   $0x80106ba7
80101bb0:	e8 83 e7 ff ff       	call   80100338 <panic>
80101bb5:	8d 76 00             	lea    0x0(%esi),%esi

80101bb8 <namex>:
80101bb8:	55                   	push   %ebp
80101bb9:	89 e5                	mov    %esp,%ebp
80101bbb:	57                   	push   %edi
80101bbc:	56                   	push   %esi
80101bbd:	53                   	push   %ebx
80101bbe:	83 ec 1c             	sub    $0x1c,%esp
80101bc1:	89 c3                	mov    %eax,%ebx
80101bc3:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101bc6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101bc9:	80 38 2f             	cmpb   $0x2f,(%eax)
80101bcc:	0f 84 42 01 00 00    	je     80101d14 <namex+0x15c>
80101bd2:	e8 39 19 00 00       	call   80103510 <myproc>
80101bd7:	8b 70 68             	mov    0x68(%eax),%esi
80101bda:	83 ec 0c             	sub    $0xc,%esp
80101bdd:	68 60 f9 10 80       	push   $0x8010f960
80101be2:	e8 e5 24 00 00       	call   801040cc <acquire>
80101be7:	ff 46 08             	incl   0x8(%esi)
80101bea:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101bf1:	e8 76 24 00 00       	call   8010406c <release>
80101bf6:	83 c4 10             	add    $0x10,%esp
80101bf9:	eb 02                	jmp    80101bfd <namex+0x45>
80101bfb:	90                   	nop
80101bfc:	43                   	inc    %ebx
80101bfd:	8a 03                	mov    (%ebx),%al
80101bff:	3c 2f                	cmp    $0x2f,%al
80101c01:	74 f9                	je     80101bfc <namex+0x44>
80101c03:	84 c0                	test   %al,%al
80101c05:	0f 84 ed 00 00 00    	je     80101cf8 <namex+0x140>
80101c0b:	8a 03                	mov    (%ebx),%al
80101c0d:	89 df                	mov    %ebx,%edi
80101c0f:	3c 2f                	cmp    $0x2f,%al
80101c11:	75 0c                	jne    80101c1f <namex+0x67>
80101c13:	e9 f5 00 00 00       	jmp    80101d0d <namex+0x155>
80101c18:	47                   	inc    %edi
80101c19:	8a 07                	mov    (%edi),%al
80101c1b:	3c 2f                	cmp    $0x2f,%al
80101c1d:	74 04                	je     80101c23 <namex+0x6b>
80101c1f:	84 c0                	test   %al,%al
80101c21:	75 f5                	jne    80101c18 <namex+0x60>
80101c23:	89 f8                	mov    %edi,%eax
80101c25:	29 d8                	sub    %ebx,%eax
80101c27:	83 f8 0d             	cmp    $0xd,%eax
80101c2a:	0f 8e a4 00 00 00    	jle    80101cd4 <namex+0x11c>
80101c30:	51                   	push   %ecx
80101c31:	6a 0e                	push   $0xe
80101c33:	53                   	push   %ebx
80101c34:	ff 75 e4             	pushl  -0x1c(%ebp)
80101c37:	e8 cc 25 00 00       	call   80104208 <memmove>
80101c3c:	83 c4 10             	add    $0x10,%esp
80101c3f:	89 fb                	mov    %edi,%ebx
80101c41:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101c44:	75 08                	jne    80101c4e <namex+0x96>
80101c46:	66 90                	xchg   %ax,%ax
80101c48:	43                   	inc    %ebx
80101c49:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101c4c:	74 fa                	je     80101c48 <namex+0x90>
80101c4e:	83 ec 0c             	sub    $0xc,%esp
80101c51:	56                   	push   %esi
80101c52:	e8 bd f9 ff ff       	call   80101614 <ilock>
80101c57:	83 c4 10             	add    $0x10,%esp
80101c5a:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101c5f:	0f 85 c5 00 00 00    	jne    80101d2a <namex+0x172>
80101c65:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101c68:	85 c0                	test   %eax,%eax
80101c6a:	74 09                	je     80101c75 <namex+0xbd>
80101c6c:	80 3b 00             	cmpb   $0x0,(%ebx)
80101c6f:	0f 84 2c 01 00 00    	je     80101da1 <namex+0x1e9>
80101c75:	50                   	push   %eax
80101c76:	6a 00                	push   $0x0
80101c78:	ff 75 e4             	pushl  -0x1c(%ebp)
80101c7b:	56                   	push   %esi
80101c7c:	e8 97 fe ff ff       	call   80101b18 <dirlookup>
80101c81:	89 c7                	mov    %eax,%edi
80101c83:	8d 56 0c             	lea    0xc(%esi),%edx
80101c86:	83 c4 10             	add    $0x10,%esp
80101c89:	85 c0                	test   %eax,%eax
80101c8b:	0f 84 db 00 00 00    	je     80101d6c <namex+0x1b4>
80101c91:	83 ec 0c             	sub    $0xc,%esp
80101c94:	52                   	push   %edx
80101c95:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c98:	e8 27 22 00 00       	call   80103ec4 <holdingsleep>
80101c9d:	83 c4 10             	add    $0x10,%esp
80101ca0:	85 c0                	test   %eax,%eax
80101ca2:	0f 84 39 01 00 00    	je     80101de1 <namex+0x229>
80101ca8:	8b 46 08             	mov    0x8(%esi),%eax
80101cab:	85 c0                	test   %eax,%eax
80101cad:	0f 8e 2e 01 00 00    	jle    80101de1 <namex+0x229>
80101cb3:	83 ec 0c             	sub    $0xc,%esp
80101cb6:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101cb9:	52                   	push   %edx
80101cba:	e8 c9 21 00 00       	call   80103e88 <releasesleep>
80101cbf:	89 34 24             	mov    %esi,(%esp)
80101cc2:	e8 59 fa ff ff       	call   80101720 <iput>
80101cc7:	83 c4 10             	add    $0x10,%esp
80101cca:	89 fe                	mov    %edi,%esi
80101ccc:	e9 2c ff ff ff       	jmp    80101bfd <namex+0x45>
80101cd1:	8d 76 00             	lea    0x0(%esi),%esi
80101cd4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101cd7:	8d 14 01             	lea    (%ecx,%eax,1),%edx
80101cda:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101cdd:	52                   	push   %edx
80101cde:	50                   	push   %eax
80101cdf:	53                   	push   %ebx
80101ce0:	ff 75 e4             	pushl  -0x1c(%ebp)
80101ce3:	e8 20 25 00 00       	call   80104208 <memmove>
80101ce8:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ceb:	c6 02 00             	movb   $0x0,(%edx)
80101cee:	83 c4 10             	add    $0x10,%esp
80101cf1:	89 fb                	mov    %edi,%ebx
80101cf3:	e9 49 ff ff ff       	jmp    80101c41 <namex+0x89>
80101cf8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80101cfb:	85 db                	test   %ebx,%ebx
80101cfd:	0f 85 ce 00 00 00    	jne    80101dd1 <namex+0x219>
80101d03:	89 f0                	mov    %esi,%eax
80101d05:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d08:	5b                   	pop    %ebx
80101d09:	5e                   	pop    %esi
80101d0a:	5f                   	pop    %edi
80101d0b:	5d                   	pop    %ebp
80101d0c:	c3                   	ret    
80101d0d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d10:	31 c0                	xor    %eax,%eax
80101d12:	eb c6                	jmp    80101cda <namex+0x122>
80101d14:	ba 01 00 00 00       	mov    $0x1,%edx
80101d19:	b8 01 00 00 00       	mov    $0x1,%eax
80101d1e:	e8 ad f4 ff ff       	call   801011d0 <iget>
80101d23:	89 c6                	mov    %eax,%esi
80101d25:	e9 d3 fe ff ff       	jmp    80101bfd <namex+0x45>
80101d2a:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101d2d:	83 ec 0c             	sub    $0xc,%esp
80101d30:	53                   	push   %ebx
80101d31:	e8 8e 21 00 00       	call   80103ec4 <holdingsleep>
80101d36:	83 c4 10             	add    $0x10,%esp
80101d39:	85 c0                	test   %eax,%eax
80101d3b:	0f 84 a0 00 00 00    	je     80101de1 <namex+0x229>
80101d41:	8b 56 08             	mov    0x8(%esi),%edx
80101d44:	85 d2                	test   %edx,%edx
80101d46:	0f 8e 95 00 00 00    	jle    80101de1 <namex+0x229>
80101d4c:	83 ec 0c             	sub    $0xc,%esp
80101d4f:	53                   	push   %ebx
80101d50:	e8 33 21 00 00       	call   80103e88 <releasesleep>
80101d55:	89 34 24             	mov    %esi,(%esp)
80101d58:	e8 c3 f9 ff ff       	call   80101720 <iput>
80101d5d:	83 c4 10             	add    $0x10,%esp
80101d60:	31 f6                	xor    %esi,%esi
80101d62:	89 f0                	mov    %esi,%eax
80101d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d67:	5b                   	pop    %ebx
80101d68:	5e                   	pop    %esi
80101d69:	5f                   	pop    %edi
80101d6a:	5d                   	pop    %ebp
80101d6b:	c3                   	ret    
80101d6c:	83 ec 0c             	sub    $0xc,%esp
80101d6f:	52                   	push   %edx
80101d70:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d73:	e8 4c 21 00 00       	call   80103ec4 <holdingsleep>
80101d78:	83 c4 10             	add    $0x10,%esp
80101d7b:	85 c0                	test   %eax,%eax
80101d7d:	74 62                	je     80101de1 <namex+0x229>
80101d7f:	8b 46 08             	mov    0x8(%esi),%eax
80101d82:	85 c0                	test   %eax,%eax
80101d84:	7e 5b                	jle    80101de1 <namex+0x229>
80101d86:	83 ec 0c             	sub    $0xc,%esp
80101d89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d8c:	52                   	push   %edx
80101d8d:	e8 f6 20 00 00       	call   80103e88 <releasesleep>
80101d92:	89 34 24             	mov    %esi,(%esp)
80101d95:	e8 86 f9 ff ff       	call   80101720 <iput>
80101d9a:	83 c4 10             	add    $0x10,%esp
80101d9d:	31 f6                	xor    %esi,%esi
80101d9f:	eb c1                	jmp    80101d62 <namex+0x1aa>
80101da1:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101da4:	83 ec 0c             	sub    $0xc,%esp
80101da7:	53                   	push   %ebx
80101da8:	e8 17 21 00 00       	call   80103ec4 <holdingsleep>
80101dad:	83 c4 10             	add    $0x10,%esp
80101db0:	85 c0                	test   %eax,%eax
80101db2:	74 2d                	je     80101de1 <namex+0x229>
80101db4:	8b 46 08             	mov    0x8(%esi),%eax
80101db7:	85 c0                	test   %eax,%eax
80101db9:	7e 26                	jle    80101de1 <namex+0x229>
80101dbb:	83 ec 0c             	sub    $0xc,%esp
80101dbe:	53                   	push   %ebx
80101dbf:	e8 c4 20 00 00       	call   80103e88 <releasesleep>
80101dc4:	83 c4 10             	add    $0x10,%esp
80101dc7:	89 f0                	mov    %esi,%eax
80101dc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dcc:	5b                   	pop    %ebx
80101dcd:	5e                   	pop    %esi
80101dce:	5f                   	pop    %edi
80101dcf:	5d                   	pop    %ebp
80101dd0:	c3                   	ret    
80101dd1:	83 ec 0c             	sub    $0xc,%esp
80101dd4:	56                   	push   %esi
80101dd5:	e8 46 f9 ff ff       	call   80101720 <iput>
80101dda:	83 c4 10             	add    $0x10,%esp
80101ddd:	31 f6                	xor    %esi,%esi
80101ddf:	eb 81                	jmp    80101d62 <namex+0x1aa>
80101de1:	83 ec 0c             	sub    $0xc,%esp
80101de4:	68 9f 6b 10 80       	push   $0x80106b9f
80101de9:	e8 4a e5 ff ff       	call   80100338 <panic>
80101dee:	66 90                	xchg   %ax,%ax

80101df0 <dirlink>:
80101df0:	55                   	push   %ebp
80101df1:	89 e5                	mov    %esp,%ebp
80101df3:	57                   	push   %edi
80101df4:	56                   	push   %esi
80101df5:	53                   	push   %ebx
80101df6:	83 ec 20             	sub    $0x20,%esp
80101df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dfc:	6a 00                	push   $0x0
80101dfe:	ff 75 0c             	pushl  0xc(%ebp)
80101e01:	53                   	push   %ebx
80101e02:	e8 11 fd ff ff       	call   80101b18 <dirlookup>
80101e07:	83 c4 10             	add    $0x10,%esp
80101e0a:	85 c0                	test   %eax,%eax
80101e0c:	75 65                	jne    80101e73 <dirlink+0x83>
80101e0e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e11:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e14:	85 ff                	test   %edi,%edi
80101e16:	74 29                	je     80101e41 <dirlink+0x51>
80101e18:	31 ff                	xor    %edi,%edi
80101e1a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e1d:	eb 09                	jmp    80101e28 <dirlink+0x38>
80101e1f:	90                   	nop
80101e20:	83 c7 10             	add    $0x10,%edi
80101e23:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e26:	73 19                	jae    80101e41 <dirlink+0x51>
80101e28:	6a 10                	push   $0x10
80101e2a:	57                   	push   %edi
80101e2b:	56                   	push   %esi
80101e2c:	53                   	push   %ebx
80101e2d:	e8 b2 fa ff ff       	call   801018e4 <readi>
80101e32:	83 c4 10             	add    $0x10,%esp
80101e35:	83 f8 10             	cmp    $0x10,%eax
80101e38:	75 4c                	jne    80101e86 <dirlink+0x96>
80101e3a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e3f:	75 df                	jne    80101e20 <dirlink+0x30>
80101e41:	50                   	push   %eax
80101e42:	6a 0e                	push   $0xe
80101e44:	ff 75 0c             	pushl  0xc(%ebp)
80101e47:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e4a:	50                   	push   %eax
80101e4b:	e8 3c 24 00 00       	call   8010428c <strncpy>
80101e50:	8b 45 10             	mov    0x10(%ebp),%eax
80101e53:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e57:	6a 10                	push   $0x10
80101e59:	57                   	push   %edi
80101e5a:	56                   	push   %esi
80101e5b:	53                   	push   %ebx
80101e5c:	e8 83 fb ff ff       	call   801019e4 <writei>
80101e61:	83 c4 20             	add    $0x20,%esp
80101e64:	83 f8 10             	cmp    $0x10,%eax
80101e67:	75 2a                	jne    80101e93 <dirlink+0xa3>
80101e69:	31 c0                	xor    %eax,%eax
80101e6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e6e:	5b                   	pop    %ebx
80101e6f:	5e                   	pop    %esi
80101e70:	5f                   	pop    %edi
80101e71:	5d                   	pop    %ebp
80101e72:	c3                   	ret    
80101e73:	83 ec 0c             	sub    $0xc,%esp
80101e76:	50                   	push   %eax
80101e77:	e8 a4 f8 ff ff       	call   80101720 <iput>
80101e7c:	83 c4 10             	add    $0x10,%esp
80101e7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e84:	eb e5                	jmp    80101e6b <dirlink+0x7b>
80101e86:	83 ec 0c             	sub    $0xc,%esp
80101e89:	68 c8 6b 10 80       	push   $0x80106bc8
80101e8e:	e8 a5 e4 ff ff       	call   80100338 <panic>
80101e93:	83 ec 0c             	sub    $0xc,%esp
80101e96:	68 b6 71 10 80       	push   $0x801071b6
80101e9b:	e8 98 e4 ff ff       	call   80100338 <panic>

80101ea0 <namei>:
80101ea0:	55                   	push   %ebp
80101ea1:	89 e5                	mov    %esp,%ebp
80101ea3:	83 ec 18             	sub    $0x18,%esp
80101ea6:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ea9:	31 d2                	xor    %edx,%edx
80101eab:	8b 45 08             	mov    0x8(%ebp),%eax
80101eae:	e8 05 fd ff ff       	call   80101bb8 <namex>
80101eb3:	c9                   	leave  
80101eb4:	c3                   	ret    
80101eb5:	8d 76 00             	lea    0x0(%esi),%esi

80101eb8 <nameiparent>:
80101eb8:	55                   	push   %ebp
80101eb9:	89 e5                	mov    %esp,%ebp
80101ebb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebe:	ba 01 00 00 00       	mov    $0x1,%edx
80101ec3:	8b 45 08             	mov    0x8(%ebp),%eax
80101ec6:	5d                   	pop    %ebp
80101ec7:	e9 ec fc ff ff       	jmp    80101bb8 <namex>

80101ecc <idestart>:
80101ecc:	55                   	push   %ebp
80101ecd:	89 e5                	mov    %esp,%ebp
80101ecf:	57                   	push   %edi
80101ed0:	56                   	push   %esi
80101ed1:	53                   	push   %ebx
80101ed2:	83 ec 0c             	sub    $0xc,%esp
80101ed5:	85 c0                	test   %eax,%eax
80101ed7:	0f 84 99 00 00 00    	je     80101f76 <idestart+0xaa>
80101edd:	89 c3                	mov    %eax,%ebx
80101edf:	8b 70 08             	mov    0x8(%eax),%esi
80101ee2:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
80101ee8:	77 7f                	ja     80101f69 <idestart+0x9d>
80101eea:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101eef:	90                   	nop
80101ef0:	89 ca                	mov    %ecx,%edx
80101ef2:	ec                   	in     (%dx),%al
80101ef3:	83 e0 c0             	and    $0xffffffc0,%eax
80101ef6:	3c 40                	cmp    $0x40,%al
80101ef8:	75 f6                	jne    80101ef0 <idestart+0x24>
80101efa:	31 ff                	xor    %edi,%edi
80101efc:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f01:	89 f8                	mov    %edi,%eax
80101f03:	ee                   	out    %al,(%dx)
80101f04:	b0 01                	mov    $0x1,%al
80101f06:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0b:	ee                   	out    %al,(%dx)
80101f0c:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f11:	89 f0                	mov    %esi,%eax
80101f13:	ee                   	out    %al,(%dx)
80101f14:	89 f0                	mov    %esi,%eax
80101f16:	c1 f8 08             	sar    $0x8,%eax
80101f19:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f1e:	ee                   	out    %al,(%dx)
80101f1f:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f24:	89 f8                	mov    %edi,%eax
80101f26:	ee                   	out    %al,(%dx)
80101f27:	8a 43 04             	mov    0x4(%ebx),%al
80101f2a:	c1 e0 04             	shl    $0x4,%eax
80101f2d:	83 e0 10             	and    $0x10,%eax
80101f30:	83 c8 e0             	or     $0xffffffe0,%eax
80101f33:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f38:	ee                   	out    %al,(%dx)
80101f39:	f6 03 04             	testb  $0x4,(%ebx)
80101f3c:	75 0e                	jne    80101f4c <idestart+0x80>
80101f3e:	b0 20                	mov    $0x20,%al
80101f40:	89 ca                	mov    %ecx,%edx
80101f42:	ee                   	out    %al,(%dx)
80101f43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f46:	5b                   	pop    %ebx
80101f47:	5e                   	pop    %esi
80101f48:	5f                   	pop    %edi
80101f49:	5d                   	pop    %ebp
80101f4a:	c3                   	ret    
80101f4b:	90                   	nop
80101f4c:	b0 30                	mov    $0x30,%al
80101f4e:	89 ca                	mov    %ecx,%edx
80101f50:	ee                   	out    %al,(%dx)
80101f51:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101f54:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f59:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f5e:	fc                   	cld    
80101f5f:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f64:	5b                   	pop    %ebx
80101f65:	5e                   	pop    %esi
80101f66:	5f                   	pop    %edi
80101f67:	5d                   	pop    %ebp
80101f68:	c3                   	ret    
80101f69:	83 ec 0c             	sub    $0xc,%esp
80101f6c:	68 34 6c 10 80       	push   $0x80106c34
80101f71:	e8 c2 e3 ff ff       	call   80100338 <panic>
80101f76:	83 ec 0c             	sub    $0xc,%esp
80101f79:	68 2b 6c 10 80       	push   $0x80106c2b
80101f7e:	e8 b5 e3 ff ff       	call   80100338 <panic>
80101f83:	90                   	nop

80101f84 <ideinit>:
80101f84:	55                   	push   %ebp
80101f85:	89 e5                	mov    %esp,%ebp
80101f87:	83 ec 10             	sub    $0x10,%esp
80101f8a:	68 46 6c 10 80       	push   $0x80106c46
80101f8f:	68 00 16 11 80       	push   $0x80111600
80101f94:	e8 73 1f 00 00       	call   80103f0c <initlock>
80101f99:	58                   	pop    %eax
80101f9a:	5a                   	pop    %edx
80101f9b:	a1 84 17 11 80       	mov    0x80111784,%eax
80101fa0:	48                   	dec    %eax
80101fa1:	50                   	push   %eax
80101fa2:	6a 0e                	push   $0xe
80101fa4:	e8 5b 02 00 00       	call   80102204 <ioapicenable>
80101fa9:	83 c4 10             	add    $0x10,%esp
80101fac:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101fb1:	8d 76 00             	lea    0x0(%esi),%esi
80101fb4:	89 ca                	mov    %ecx,%edx
80101fb6:	ec                   	in     (%dx),%al
80101fb7:	83 e0 c0             	and    $0xffffffc0,%eax
80101fba:	3c 40                	cmp    $0x40,%al
80101fbc:	75 f6                	jne    80101fb4 <ideinit+0x30>
80101fbe:	b0 f0                	mov    $0xf0,%al
80101fc0:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fc5:	ee                   	out    %al,(%dx)
80101fc6:	89 ca                	mov    %ecx,%edx
80101fc8:	ec                   	in     (%dx),%al
80101fc9:	84 c0                	test   %al,%al
80101fcb:	75 13                	jne    80101fe0 <ideinit+0x5c>
80101fcd:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101fd2:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fd7:	90                   	nop
80101fd8:	49                   	dec    %ecx
80101fd9:	74 0f                	je     80101fea <ideinit+0x66>
80101fdb:	ec                   	in     (%dx),%al
80101fdc:	84 c0                	test   %al,%al
80101fde:	74 f8                	je     80101fd8 <ideinit+0x54>
80101fe0:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80101fe7:	00 00 00 
80101fea:	b0 e0                	mov    $0xe0,%al
80101fec:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101ff1:	ee                   	out    %al,(%dx)
80101ff2:	c9                   	leave  
80101ff3:	c3                   	ret    

80101ff4 <ideintr>:
80101ff4:	55                   	push   %ebp
80101ff5:	89 e5                	mov    %esp,%ebp
80101ff7:	57                   	push   %edi
80101ff8:	56                   	push   %esi
80101ff9:	53                   	push   %ebx
80101ffa:	83 ec 18             	sub    $0x18,%esp
80101ffd:	68 00 16 11 80       	push   $0x80111600
80102002:	e8 c5 20 00 00       	call   801040cc <acquire>
80102007:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
8010200d:	83 c4 10             	add    $0x10,%esp
80102010:	85 db                	test   %ebx,%ebx
80102012:	74 5b                	je     8010206f <ideintr+0x7b>
80102014:	8b 43 58             	mov    0x58(%ebx),%eax
80102017:	a3 e4 15 11 80       	mov    %eax,0x801115e4
8010201c:	8b 33                	mov    (%ebx),%esi
8010201e:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102024:	75 27                	jne    8010204d <ideintr+0x59>
80102026:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010202b:	90                   	nop
8010202c:	ec                   	in     (%dx),%al
8010202d:	88 c1                	mov    %al,%cl
8010202f:	83 e1 c0             	and    $0xffffffc0,%ecx
80102032:	80 f9 40             	cmp    $0x40,%cl
80102035:	75 f5                	jne    8010202c <ideintr+0x38>
80102037:	a8 21                	test   $0x21,%al
80102039:	75 12                	jne    8010204d <ideintr+0x59>
8010203b:	8d 7b 5c             	lea    0x5c(%ebx),%edi
8010203e:	b9 80 00 00 00       	mov    $0x80,%ecx
80102043:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102048:	fc                   	cld    
80102049:	f3 6d                	rep insl (%dx),%es:(%edi)
8010204b:	8b 33                	mov    (%ebx),%esi
8010204d:	83 e6 fb             	and    $0xfffffffb,%esi
80102050:	83 ce 02             	or     $0x2,%esi
80102053:	89 33                	mov    %esi,(%ebx)
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	53                   	push   %ebx
80102059:	e8 22 1c 00 00       	call   80103c80 <wakeup>
8010205e:	a1 e4 15 11 80       	mov    0x801115e4,%eax
80102063:	83 c4 10             	add    $0x10,%esp
80102066:	85 c0                	test   %eax,%eax
80102068:	74 05                	je     8010206f <ideintr+0x7b>
8010206a:	e8 5d fe ff ff       	call   80101ecc <idestart>
8010206f:	83 ec 0c             	sub    $0xc,%esp
80102072:	68 00 16 11 80       	push   $0x80111600
80102077:	e8 f0 1f 00 00       	call   8010406c <release>
8010207c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010207f:	5b                   	pop    %ebx
80102080:	5e                   	pop    %esi
80102081:	5f                   	pop    %edi
80102082:	5d                   	pop    %ebp
80102083:	c3                   	ret    

80102084 <iderw>:
80102084:	55                   	push   %ebp
80102085:	89 e5                	mov    %esp,%ebp
80102087:	53                   	push   %ebx
80102088:	83 ec 10             	sub    $0x10,%esp
8010208b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010208e:	8d 43 0c             	lea    0xc(%ebx),%eax
80102091:	50                   	push   %eax
80102092:	e8 2d 1e 00 00       	call   80103ec4 <holdingsleep>
80102097:	83 c4 10             	add    $0x10,%esp
8010209a:	85 c0                	test   %eax,%eax
8010209c:	0f 84 b7 00 00 00    	je     80102159 <iderw+0xd5>
801020a2:	8b 03                	mov    (%ebx),%eax
801020a4:	83 e0 06             	and    $0x6,%eax
801020a7:	83 f8 02             	cmp    $0x2,%eax
801020aa:	0f 84 9c 00 00 00    	je     8010214c <iderw+0xc8>
801020b0:	8b 53 04             	mov    0x4(%ebx),%edx
801020b3:	85 d2                	test   %edx,%edx
801020b5:	74 09                	je     801020c0 <iderw+0x3c>
801020b7:	a1 e0 15 11 80       	mov    0x801115e0,%eax
801020bc:	85 c0                	test   %eax,%eax
801020be:	74 7f                	je     8010213f <iderw+0xbb>
801020c0:	83 ec 0c             	sub    $0xc,%esp
801020c3:	68 00 16 11 80       	push   $0x80111600
801020c8:	e8 ff 1f 00 00       	call   801040cc <acquire>
801020cd:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801020d4:	a1 e4 15 11 80       	mov    0x801115e4,%eax
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 c0                	test   %eax,%eax
801020de:	74 58                	je     80102138 <iderw+0xb4>
801020e0:	89 c2                	mov    %eax,%edx
801020e2:	8b 40 58             	mov    0x58(%eax),%eax
801020e5:	85 c0                	test   %eax,%eax
801020e7:	75 f7                	jne    801020e0 <iderw+0x5c>
801020e9:	83 c2 58             	add    $0x58,%edx
801020ec:	89 1a                	mov    %ebx,(%edx)
801020ee:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
801020f4:	74 36                	je     8010212c <iderw+0xa8>
801020f6:	8b 03                	mov    (%ebx),%eax
801020f8:	83 e0 06             	and    $0x6,%eax
801020fb:	83 f8 02             	cmp    $0x2,%eax
801020fe:	74 1b                	je     8010211b <iderw+0x97>
80102100:	83 ec 08             	sub    $0x8,%esp
80102103:	68 00 16 11 80       	push   $0x80111600
80102108:	53                   	push   %ebx
80102109:	e8 b6 1a 00 00       	call   80103bc4 <sleep>
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 c4 10             	add    $0x10,%esp
80102116:	83 f8 02             	cmp    $0x2,%eax
80102119:	75 e5                	jne    80102100 <iderw+0x7c>
8010211b:	c7 45 08 00 16 11 80 	movl   $0x80111600,0x8(%ebp)
80102122:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102125:	c9                   	leave  
80102126:	e9 41 1f 00 00       	jmp    8010406c <release>
8010212b:	90                   	nop
8010212c:	89 d8                	mov    %ebx,%eax
8010212e:	e8 99 fd ff ff       	call   80101ecc <idestart>
80102133:	eb c1                	jmp    801020f6 <iderw+0x72>
80102135:	8d 76 00             	lea    0x0(%esi),%esi
80102138:	ba e4 15 11 80       	mov    $0x801115e4,%edx
8010213d:	eb ad                	jmp    801020ec <iderw+0x68>
8010213f:	83 ec 0c             	sub    $0xc,%esp
80102142:	68 75 6c 10 80       	push   $0x80106c75
80102147:	e8 ec e1 ff ff       	call   80100338 <panic>
8010214c:	83 ec 0c             	sub    $0xc,%esp
8010214f:	68 60 6c 10 80       	push   $0x80106c60
80102154:	e8 df e1 ff ff       	call   80100338 <panic>
80102159:	83 ec 0c             	sub    $0xc,%esp
8010215c:	68 4a 6c 10 80       	push   $0x80106c4a
80102161:	e8 d2 e1 ff ff       	call   80100338 <panic>
80102166:	66 90                	xchg   %ax,%ax

80102168 <ioapicinit>:
80102168:	55                   	push   %ebp
80102169:	89 e5                	mov    %esp,%ebp
8010216b:	56                   	push   %esi
8010216c:	53                   	push   %ebx
8010216d:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
80102174:	00 c0 fe 
80102177:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010217e:	00 00 00 
80102181:	8b 15 34 16 11 80    	mov    0x80111634,%edx
80102187:	8b 72 10             	mov    0x10(%edx),%esi
8010218a:	c1 ee 10             	shr    $0x10,%esi
8010218d:	89 f0                	mov    %esi,%eax
8010218f:	0f b6 f0             	movzbl %al,%esi
80102192:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102198:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
8010219e:	8b 43 10             	mov    0x10(%ebx),%eax
801021a1:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
801021a8:	c1 e8 18             	shr    $0x18,%eax
801021ab:	39 c2                	cmp    %eax,%edx
801021ad:	74 16                	je     801021c5 <ioapicinit+0x5d>
801021af:	83 ec 0c             	sub    $0xc,%esp
801021b2:	68 94 6c 10 80       	push   $0x80106c94
801021b7:	e8 6c e4 ff ff       	call   80100628 <cprintf>
801021bc:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021c2:	83 c4 10             	add    $0x10,%esp
801021c5:	ba 10 00 00 00       	mov    $0x10,%edx
801021ca:	31 c0                	xor    %eax,%eax
801021cc:	8d 48 20             	lea    0x20(%eax),%ecx
801021cf:	81 c9 00 00 01 00    	or     $0x10000,%ecx
801021d5:	89 13                	mov    %edx,(%ebx)
801021d7:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021dd:	89 4b 10             	mov    %ecx,0x10(%ebx)
801021e0:	8d 4a 01             	lea    0x1(%edx),%ecx
801021e3:	89 0b                	mov    %ecx,(%ebx)
801021e5:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021eb:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
801021f2:	40                   	inc    %eax
801021f3:	83 c2 02             	add    $0x2,%edx
801021f6:	39 c6                	cmp    %eax,%esi
801021f8:	7d d2                	jge    801021cc <ioapicinit+0x64>
801021fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801021fd:	5b                   	pop    %ebx
801021fe:	5e                   	pop    %esi
801021ff:	5d                   	pop    %ebp
80102200:	c3                   	ret    
80102201:	8d 76 00             	lea    0x0(%esi),%esi

80102204 <ioapicenable>:
80102204:	55                   	push   %ebp
80102205:	89 e5                	mov    %esp,%ebp
80102207:	8b 45 08             	mov    0x8(%ebp),%eax
8010220a:	8d 50 20             	lea    0x20(%eax),%edx
8010220d:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102211:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102217:	89 01                	mov    %eax,(%ecx)
80102219:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010221f:	89 51 10             	mov    %edx,0x10(%ecx)
80102222:	8b 55 0c             	mov    0xc(%ebp),%edx
80102225:	c1 e2 18             	shl    $0x18,%edx
80102228:	40                   	inc    %eax
80102229:	89 01                	mov    %eax,(%ecx)
8010222b:	a1 34 16 11 80       	mov    0x80111634,%eax
80102230:	89 50 10             	mov    %edx,0x10(%eax)
80102233:	5d                   	pop    %ebp
80102234:	c3                   	ret    
80102235:	66 90                	xchg   %ax,%ax
80102237:	90                   	nop

80102238 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102238:	55                   	push   %ebp
80102239:	89 e5                	mov    %esp,%ebp
8010223b:	53                   	push   %ebx
8010223c:	53                   	push   %ebx
8010223d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
80102240:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102246:	75 70                	jne    801022b8 <kfree+0x80>
80102248:	81 fb d0 59 11 80    	cmp    $0x801159d0,%ebx
8010224e:	72 68                	jb     801022b8 <kfree+0x80>
80102250:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102256:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
8010225b:	77 5b                	ja     801022b8 <kfree+0x80>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
8010225d:	52                   	push   %edx
8010225e:	68 00 10 00 00       	push   $0x1000
80102263:	6a 01                	push   $0x1
80102265:	53                   	push   %ebx
80102266:	e8 21 1f 00 00       	call   8010418c <memset>

  if(kmem.use_lock)
8010226b:	83 c4 10             	add    $0x10,%esp
8010226e:	8b 0d 74 16 11 80    	mov    0x80111674,%ecx
80102274:	85 c9                	test   %ecx,%ecx
80102276:	75 1c                	jne    80102294 <kfree+0x5c>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102278:	a1 78 16 11 80       	mov    0x80111678,%eax
8010227d:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
8010227f:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
  if(kmem.use_lock)
80102285:	a1 74 16 11 80       	mov    0x80111674,%eax
8010228a:	85 c0                	test   %eax,%eax
8010228c:	75 1a                	jne    801022a8 <kfree+0x70>
    release(&kmem.lock);
}
8010228e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102291:	c9                   	leave  
80102292:	c3                   	ret    
80102293:	90                   	nop
    acquire(&kmem.lock);
80102294:	83 ec 0c             	sub    $0xc,%esp
80102297:	68 40 16 11 80       	push   $0x80111640
8010229c:	e8 2b 1e 00 00       	call   801040cc <acquire>
801022a1:	83 c4 10             	add    $0x10,%esp
801022a4:	eb d2                	jmp    80102278 <kfree+0x40>
801022a6:	66 90                	xchg   %ax,%ax
    release(&kmem.lock);
801022a8:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
}
801022af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801022b2:	c9                   	leave  
    release(&kmem.lock);
801022b3:	e9 b4 1d 00 00       	jmp    8010406c <release>
    panic("kfree");
801022b8:	83 ec 0c             	sub    $0xc,%esp
801022bb:	68 c6 6c 10 80       	push   $0x80106cc6
801022c0:	e8 73 e0 ff ff       	call   80100338 <panic>
801022c5:	8d 76 00             	lea    0x0(%esi),%esi

801022c8 <freerange>:
{
801022c8:	55                   	push   %ebp
801022c9:	89 e5                	mov    %esp,%ebp
801022cb:	56                   	push   %esi
801022cc:	53                   	push   %ebx
801022cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801022d0:	8b 45 08             	mov    0x8(%ebp),%eax
801022d3:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801022d9:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801022df:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801022e5:	39 de                	cmp    %ebx,%esi
801022e7:	72 1f                	jb     80102308 <freerange+0x40>
801022e9:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
801022ec:	83 ec 0c             	sub    $0xc,%esp
801022ef:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801022f5:	50                   	push   %eax
801022f6:	e8 3d ff ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801022fb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102301:	83 c4 10             	add    $0x10,%esp
80102304:	39 de                	cmp    %ebx,%esi
80102306:	73 e4                	jae    801022ec <freerange+0x24>
}
80102308:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010230b:	5b                   	pop    %ebx
8010230c:	5e                   	pop    %esi
8010230d:	5d                   	pop    %ebp
8010230e:	c3                   	ret    
8010230f:	90                   	nop

80102310 <kinit2>:
{
80102310:	55                   	push   %ebp
80102311:	89 e5                	mov    %esp,%ebp
80102313:	56                   	push   %esi
80102314:	53                   	push   %ebx
80102315:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
80102318:	8b 45 08             	mov    0x8(%ebp),%eax
8010231b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102321:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102327:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010232d:	39 de                	cmp    %ebx,%esi
8010232f:	72 1f                	jb     80102350 <kinit2+0x40>
80102331:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
80102334:	83 ec 0c             	sub    $0xc,%esp
80102337:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010233d:	50                   	push   %eax
8010233e:	e8 f5 fe ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102343:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102349:	83 c4 10             	add    $0x10,%esp
8010234c:	39 de                	cmp    %ebx,%esi
8010234e:	73 e4                	jae    80102334 <kinit2+0x24>
  kmem.use_lock = 1;
80102350:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
80102357:	00 00 00 
}
8010235a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010235d:	5b                   	pop    %ebx
8010235e:	5e                   	pop    %esi
8010235f:	5d                   	pop    %ebp
80102360:	c3                   	ret    
80102361:	8d 76 00             	lea    0x0(%esi),%esi

80102364 <kinit1>:
{
80102364:	55                   	push   %ebp
80102365:	89 e5                	mov    %esp,%ebp
80102367:	56                   	push   %esi
80102368:	53                   	push   %ebx
80102369:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
8010236c:	83 ec 08             	sub    $0x8,%esp
8010236f:	68 cc 6c 10 80       	push   $0x80106ccc
80102374:	68 40 16 11 80       	push   $0x80111640
80102379:	e8 8e 1b 00 00       	call   80103f0c <initlock>
  kmem.use_lock = 0;
8010237e:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
80102385:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
80102388:	8b 45 08             	mov    0x8(%ebp),%eax
8010238b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102391:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102397:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 de                	cmp    %ebx,%esi
801023a2:	72 1c                	jb     801023c0 <kinit1+0x5c>
    kfree(p);
801023a4:	83 ec 0c             	sub    $0xc,%esp
801023a7:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023ad:	50                   	push   %eax
801023ae:	e8 85 fe ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023b9:	83 c4 10             	add    $0x10,%esp
801023bc:	39 de                	cmp    %ebx,%esi
801023be:	73 e4                	jae    801023a4 <kinit1+0x40>
}
801023c0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023c3:	5b                   	pop    %ebx
801023c4:	5e                   	pop    %esi
801023c5:	5d                   	pop    %ebp
801023c6:	c3                   	ret    
801023c7:	90                   	nop

801023c8 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
801023c8:	a1 74 16 11 80       	mov    0x80111674,%eax
801023cd:	85 c0                	test   %eax,%eax
801023cf:	75 17                	jne    801023e8 <kalloc+0x20>
    acquire(&kmem.lock);
  r = kmem.freelist;
801023d1:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(r)
801023d6:	85 c0                	test   %eax,%eax
801023d8:	74 0a                	je     801023e4 <kalloc+0x1c>
    kmem.freelist = r->next;
801023da:	8b 10                	mov    (%eax),%edx
801023dc:	89 15 78 16 11 80    	mov    %edx,0x80111678
  if(kmem.use_lock)
801023e2:	c3                   	ret    
801023e3:	90                   	nop
    release(&kmem.lock);
  return (char*)r;
}
801023e4:	c3                   	ret    
801023e5:	8d 76 00             	lea    0x0(%esi),%esi
{
801023e8:	55                   	push   %ebp
801023e9:	89 e5                	mov    %esp,%ebp
801023eb:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
801023ee:	68 40 16 11 80       	push   $0x80111640
801023f3:	e8 d4 1c 00 00       	call   801040cc <acquire>
  r = kmem.freelist;
801023f8:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(r)
801023fd:	83 c4 10             	add    $0x10,%esp
  if(kmem.use_lock)
80102400:	8b 15 74 16 11 80    	mov    0x80111674,%edx
  if(r)
80102406:	85 c0                	test   %eax,%eax
80102408:	74 08                	je     80102412 <kalloc+0x4a>
    kmem.freelist = r->next;
8010240a:	8b 08                	mov    (%eax),%ecx
8010240c:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
  if(kmem.use_lock)
80102412:	85 d2                	test   %edx,%edx
80102414:	74 16                	je     8010242c <kalloc+0x64>
80102416:	89 45 f4             	mov    %eax,-0xc(%ebp)
    release(&kmem.lock);
80102419:	83 ec 0c             	sub    $0xc,%esp
8010241c:	68 40 16 11 80       	push   $0x80111640
80102421:	e8 46 1c 00 00       	call   8010406c <release>
80102426:	83 c4 10             	add    $0x10,%esp
80102429:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010242c:	c9                   	leave  
8010242d:	c3                   	ret    
8010242e:	66 90                	xchg   %ax,%ax

80102430 <kbdgetc>:
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102430:	ba 64 00 00 00       	mov    $0x64,%edx
80102435:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102436:	a8 01                	test   $0x1,%al
80102438:	0f 84 aa 00 00 00    	je     801024e8 <kbdgetc+0xb8>
{
8010243e:	55                   	push   %ebp
8010243f:	89 e5                	mov    %esp,%ebp
80102441:	53                   	push   %ebx
80102442:	ba 60 00 00 00       	mov    $0x60,%edx
80102447:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102448:	0f b6 d8             	movzbl %al,%ebx

  if(data == 0xE0){
    shift |= E0ESC;
8010244b:	8b 0d 7c 16 11 80    	mov    0x8011167c,%ecx
  if(data == 0xE0){
80102451:	3c e0                	cmp    $0xe0,%al
80102453:	74 5b                	je     801024b0 <kbdgetc+0x80>
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102455:	89 ca                	mov    %ecx,%edx
80102457:	83 e2 40             	and    $0x40,%edx
  } else if(data & 0x80){
8010245a:	84 c0                	test   %al,%al
8010245c:	78 66                	js     801024c4 <kbdgetc+0x94>
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010245e:	85 d2                	test   %edx,%edx
80102460:	74 09                	je     8010246b <kbdgetc+0x3b>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102462:	83 c8 80             	or     $0xffffff80,%eax
80102465:	0f b6 d8             	movzbl %al,%ebx
    shift &= ~E0ESC;
80102468:	83 e1 bf             	and    $0xffffffbf,%ecx
  }

  shift |= shiftcode[data];
8010246b:	0f b6 93 00 6e 10 80 	movzbl -0x7fef9200(%ebx),%edx
80102472:	09 ca                	or     %ecx,%edx
  shift ^= togglecode[data];
80102474:	0f b6 83 00 6d 10 80 	movzbl -0x7fef9300(%ebx),%eax
8010247b:	31 c2                	xor    %eax,%edx
8010247d:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  c = charcode[shift & (CTL | SHIFT)][data];
80102483:	89 d0                	mov    %edx,%eax
80102485:	83 e0 03             	and    $0x3,%eax
80102488:	8b 04 85 e0 6c 10 80 	mov    -0x7fef9320(,%eax,4),%eax
8010248f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
  if(shift & CAPSLOCK){
80102493:	83 e2 08             	and    $0x8,%edx
80102496:	74 13                	je     801024ab <kbdgetc+0x7b>
    if('a' <= c && c <= 'z')
80102498:	8d 50 9f             	lea    -0x61(%eax),%edx
8010249b:	83 fa 19             	cmp    $0x19,%edx
8010249e:	76 40                	jbe    801024e0 <kbdgetc+0xb0>
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801024a0:	8d 50 bf             	lea    -0x41(%eax),%edx
801024a3:	83 fa 19             	cmp    $0x19,%edx
801024a6:	77 03                	ja     801024ab <kbdgetc+0x7b>
      c += 'a' - 'A';
801024a8:	83 c0 20             	add    $0x20,%eax
  }
  return c;
}
801024ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ae:	c9                   	leave  
801024af:	c3                   	ret    
    shift |= E0ESC;
801024b0:	89 c8                	mov    %ecx,%eax
801024b2:	83 c8 40             	or     $0x40,%eax
    shift &= ~(shiftcode[data] | E0ESC);
801024b5:	a3 7c 16 11 80       	mov    %eax,0x8011167c
    return 0;
801024ba:	31 c0                	xor    %eax,%eax
}
801024bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bf:	c9                   	leave  
801024c0:	c3                   	ret    
801024c1:	8d 76 00             	lea    0x0(%esi),%esi
    data = (shift & E0ESC ? data : data & 0x7F);
801024c4:	85 d2                	test   %edx,%edx
801024c6:	75 05                	jne    801024cd <kbdgetc+0x9d>
801024c8:	89 c3                	mov    %eax,%ebx
801024ca:	83 e3 7f             	and    $0x7f,%ebx
    shift &= ~(shiftcode[data] | E0ESC);
801024cd:	8a 83 00 6e 10 80    	mov    -0x7fef9200(%ebx),%al
801024d3:	83 c8 40             	or     $0x40,%eax
801024d6:	0f b6 c0             	movzbl %al,%eax
801024d9:	f7 d0                	not    %eax
801024db:	21 c8                	and    %ecx,%eax
    return 0;
801024dd:	eb d6                	jmp    801024b5 <kbdgetc+0x85>
801024df:	90                   	nop
      c += 'A' - 'a';
801024e0:	83 e8 20             	sub    $0x20,%eax
}
801024e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024e6:	c9                   	leave  
801024e7:	c3                   	ret    
    return -1;
801024e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801024ed:	c3                   	ret    
801024ee:	66 90                	xchg   %ax,%ax

801024f0 <kbdintr>:

void
kbdintr(void)
{
801024f0:	55                   	push   %ebp
801024f1:	89 e5                	mov    %esp,%ebp
801024f3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801024f6:	68 30 24 10 80       	push   $0x80102430
801024fb:	e8 14 e3 ff ff       	call   80100814 <consoleintr>
}
80102500:	83 c4 10             	add    $0x10,%esp
80102503:	c9                   	leave  
80102504:	c3                   	ret    
80102505:	66 90                	xchg   %ax,%ax
80102507:	90                   	nop

80102508 <lapicinit>:
80102508:	a1 80 16 11 80       	mov    0x80111680,%eax
8010250d:	85 c0                	test   %eax,%eax
8010250f:	0f 84 c3 00 00 00    	je     801025d8 <lapicinit+0xd0>
80102515:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
8010251c:	01 00 00 
8010251f:	8b 50 20             	mov    0x20(%eax),%edx
80102522:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102529:	00 00 00 
8010252c:	8b 50 20             	mov    0x20(%eax),%edx
8010252f:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102536:	00 02 00 
80102539:	8b 50 20             	mov    0x20(%eax),%edx
8010253c:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
80102543:	96 98 00 
80102546:	8b 50 20             	mov    0x20(%eax),%edx
80102549:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102550:	00 01 00 
80102553:	8b 50 20             	mov    0x20(%eax),%edx
80102556:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
8010255d:	00 01 00 
80102560:	8b 50 20             	mov    0x20(%eax),%edx
80102563:	8b 50 30             	mov    0x30(%eax),%edx
80102566:	c1 ea 10             	shr    $0x10,%edx
80102569:	81 e2 fc 00 00 00    	and    $0xfc,%edx
8010256f:	75 6b                	jne    801025dc <lapicinit+0xd4>
80102571:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102578:	00 00 00 
8010257b:	8b 50 20             	mov    0x20(%eax),%edx
8010257e:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102585:	00 00 00 
80102588:	8b 50 20             	mov    0x20(%eax),%edx
8010258b:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102592:	00 00 00 
80102595:	8b 50 20             	mov    0x20(%eax),%edx
80102598:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
8010259f:	00 00 00 
801025a2:	8b 50 20             	mov    0x20(%eax),%edx
801025a5:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801025ac:	00 00 00 
801025af:	8b 50 20             	mov    0x20(%eax),%edx
801025b2:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801025b9:	85 08 00 
801025bc:	8b 50 20             	mov    0x20(%eax),%edx
801025bf:	90                   	nop
801025c0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801025c6:	80 e6 10             	and    $0x10,%dh
801025c9:	75 f5                	jne    801025c0 <lapicinit+0xb8>
801025cb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801025d2:	00 00 00 
801025d5:	8b 40 20             	mov    0x20(%eax),%eax
801025d8:	c3                   	ret    
801025d9:	8d 76 00             	lea    0x0(%esi),%esi
801025dc:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801025e3:	00 01 00 
801025e6:	8b 50 20             	mov    0x20(%eax),%edx
801025e9:	eb 86                	jmp    80102571 <lapicinit+0x69>
801025eb:	90                   	nop

801025ec <lapicid>:
801025ec:	a1 80 16 11 80       	mov    0x80111680,%eax
801025f1:	85 c0                	test   %eax,%eax
801025f3:	74 07                	je     801025fc <lapicid+0x10>
801025f5:	8b 40 20             	mov    0x20(%eax),%eax
801025f8:	c1 e8 18             	shr    $0x18,%eax
801025fb:	c3                   	ret    
801025fc:	31 c0                	xor    %eax,%eax
801025fe:	c3                   	ret    
801025ff:	90                   	nop

80102600 <lapiceoi>:
80102600:	a1 80 16 11 80       	mov    0x80111680,%eax
80102605:	85 c0                	test   %eax,%eax
80102607:	74 0d                	je     80102616 <lapiceoi+0x16>
80102609:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102610:	00 00 00 
80102613:	8b 40 20             	mov    0x20(%eax),%eax
80102616:	c3                   	ret    
80102617:	90                   	nop

80102618 <microdelay>:
80102618:	c3                   	ret    
80102619:	8d 76 00             	lea    0x0(%esi),%esi

8010261c <lapicstartap>:
8010261c:	55                   	push   %ebp
8010261d:	89 e5                	mov    %esp,%ebp
8010261f:	53                   	push   %ebx
80102620:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102623:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102626:	b0 0f                	mov    $0xf,%al
80102628:	ba 70 00 00 00       	mov    $0x70,%edx
8010262d:	ee                   	out    %al,(%dx)
8010262e:	b0 0a                	mov    $0xa,%al
80102630:	ba 71 00 00 00       	mov    $0x71,%edx
80102635:	ee                   	out    %al,(%dx)
80102636:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
8010263d:	00 00 
8010263f:	89 c8                	mov    %ecx,%eax
80102641:	c1 e8 04             	shr    $0x4,%eax
80102644:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010264a:	a1 80 16 11 80       	mov    0x80111680,%eax
8010264f:	c1 e3 18             	shl    $0x18,%ebx
80102652:	89 da                	mov    %ebx,%edx
80102654:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
8010265a:	8b 58 20             	mov    0x20(%eax),%ebx
8010265d:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102664:	c5 00 00 
80102667:	8b 58 20             	mov    0x20(%eax),%ebx
8010266a:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102671:	85 00 00 
80102674:	8b 58 20             	mov    0x20(%eax),%ebx
80102677:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010267d:	8b 58 20             	mov    0x20(%eax),%ebx
80102680:	c1 e9 0c             	shr    $0xc,%ecx
80102683:	80 cd 06             	or     $0x6,%ch
80102686:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010268c:	8b 58 20             	mov    0x20(%eax),%ebx
8010268f:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
80102695:	8b 50 20             	mov    0x20(%eax),%edx
80102698:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010269e:	8b 40 20             	mov    0x20(%eax),%eax
801026a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026a4:	c9                   	leave  
801026a5:	c3                   	ret    
801026a6:	66 90                	xchg   %ax,%ax

801026a8 <cmostime>:
801026a8:	55                   	push   %ebp
801026a9:	89 e5                	mov    %esp,%ebp
801026ab:	57                   	push   %edi
801026ac:	56                   	push   %esi
801026ad:	53                   	push   %ebx
801026ae:	83 ec 4c             	sub    $0x4c,%esp
801026b1:	b0 0b                	mov    $0xb,%al
801026b3:	ba 70 00 00 00       	mov    $0x70,%edx
801026b8:	ee                   	out    %al,(%dx)
801026b9:	ba 71 00 00 00       	mov    $0x71,%edx
801026be:	ec                   	in     (%dx),%al
801026bf:	83 e0 04             	and    $0x4,%eax
801026c2:	89 c6                	mov    %eax,%esi
801026c4:	bb 70 00 00 00       	mov    $0x70,%ebx
801026c9:	8d 76 00             	lea    0x0(%esi),%esi
801026cc:	31 c0                	xor    %eax,%eax
801026ce:	89 da                	mov    %ebx,%edx
801026d0:	ee                   	out    %al,(%dx)
801026d1:	bf 71 00 00 00       	mov    $0x71,%edi
801026d6:	89 fa                	mov    %edi,%edx
801026d8:	ec                   	in     (%dx),%al
801026d9:	88 45 b7             	mov    %al,-0x49(%ebp)
801026dc:	b0 02                	mov    $0x2,%al
801026de:	89 da                	mov    %ebx,%edx
801026e0:	ee                   	out    %al,(%dx)
801026e1:	89 fa                	mov    %edi,%edx
801026e3:	ec                   	in     (%dx),%al
801026e4:	88 45 b6             	mov    %al,-0x4a(%ebp)
801026e7:	b0 04                	mov    $0x4,%al
801026e9:	89 da                	mov    %ebx,%edx
801026eb:	ee                   	out    %al,(%dx)
801026ec:	89 fa                	mov    %edi,%edx
801026ee:	ec                   	in     (%dx),%al
801026ef:	88 45 b5             	mov    %al,-0x4b(%ebp)
801026f2:	b0 07                	mov    $0x7,%al
801026f4:	89 da                	mov    %ebx,%edx
801026f6:	ee                   	out    %al,(%dx)
801026f7:	89 fa                	mov    %edi,%edx
801026f9:	ec                   	in     (%dx),%al
801026fa:	88 45 b4             	mov    %al,-0x4c(%ebp)
801026fd:	b0 08                	mov    $0x8,%al
801026ff:	89 da                	mov    %ebx,%edx
80102701:	ee                   	out    %al,(%dx)
80102702:	89 fa                	mov    %edi,%edx
80102704:	ec                   	in     (%dx),%al
80102705:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102708:	b0 09                	mov    $0x9,%al
8010270a:	89 da                	mov    %ebx,%edx
8010270c:	ee                   	out    %al,(%dx)
8010270d:	89 fa                	mov    %edi,%edx
8010270f:	ec                   	in     (%dx),%al
80102710:	0f b6 c8             	movzbl %al,%ecx
80102713:	b0 0a                	mov    $0xa,%al
80102715:	89 da                	mov    %ebx,%edx
80102717:	ee                   	out    %al,(%dx)
80102718:	89 fa                	mov    %edi,%edx
8010271a:	ec                   	in     (%dx),%al
8010271b:	84 c0                	test   %al,%al
8010271d:	78 ad                	js     801026cc <cmostime+0x24>
8010271f:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102723:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102726:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
8010272a:	89 45 bc             	mov    %eax,-0x44(%ebp)
8010272d:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102731:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102734:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102738:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010273b:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
8010273f:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102742:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80102745:	31 c0                	xor    %eax,%eax
80102747:	89 da                	mov    %ebx,%edx
80102749:	ee                   	out    %al,(%dx)
8010274a:	89 fa                	mov    %edi,%edx
8010274c:	ec                   	in     (%dx),%al
8010274d:	0f b6 c0             	movzbl %al,%eax
80102750:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102753:	b0 02                	mov    $0x2,%al
80102755:	89 da                	mov    %ebx,%edx
80102757:	ee                   	out    %al,(%dx)
80102758:	89 fa                	mov    %edi,%edx
8010275a:	ec                   	in     (%dx),%al
8010275b:	0f b6 c0             	movzbl %al,%eax
8010275e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102761:	b0 04                	mov    $0x4,%al
80102763:	89 da                	mov    %ebx,%edx
80102765:	ee                   	out    %al,(%dx)
80102766:	89 fa                	mov    %edi,%edx
80102768:	ec                   	in     (%dx),%al
80102769:	0f b6 c0             	movzbl %al,%eax
8010276c:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010276f:	b0 07                	mov    $0x7,%al
80102771:	89 da                	mov    %ebx,%edx
80102773:	ee                   	out    %al,(%dx)
80102774:	89 fa                	mov    %edi,%edx
80102776:	ec                   	in     (%dx),%al
80102777:	0f b6 c0             	movzbl %al,%eax
8010277a:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010277d:	b0 08                	mov    $0x8,%al
8010277f:	89 da                	mov    %ebx,%edx
80102781:	ee                   	out    %al,(%dx)
80102782:	89 fa                	mov    %edi,%edx
80102784:	ec                   	in     (%dx),%al
80102785:	0f b6 c0             	movzbl %al,%eax
80102788:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010278b:	b0 09                	mov    $0x9,%al
8010278d:	89 da                	mov    %ebx,%edx
8010278f:	ee                   	out    %al,(%dx)
80102790:	89 fa                	mov    %edi,%edx
80102792:	ec                   	in     (%dx),%al
80102793:	0f b6 c0             	movzbl %al,%eax
80102796:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102799:	50                   	push   %eax
8010279a:	6a 18                	push   $0x18
8010279c:	8d 45 d0             	lea    -0x30(%ebp),%eax
8010279f:	50                   	push   %eax
801027a0:	8d 45 b8             	lea    -0x48(%ebp),%eax
801027a3:	50                   	push   %eax
801027a4:	e8 27 1a 00 00       	call   801041d0 <memcmp>
801027a9:	83 c4 10             	add    $0x10,%esp
801027ac:	85 c0                	test   %eax,%eax
801027ae:	0f 85 18 ff ff ff    	jne    801026cc <cmostime+0x24>
801027b4:	89 f0                	mov    %esi,%eax
801027b6:	84 c0                	test   %al,%al
801027b8:	75 7e                	jne    80102838 <cmostime+0x190>
801027ba:	8b 55 b8             	mov    -0x48(%ebp),%edx
801027bd:	89 d0                	mov    %edx,%eax
801027bf:	c1 e8 04             	shr    $0x4,%eax
801027c2:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027c5:	01 c0                	add    %eax,%eax
801027c7:	83 e2 0f             	and    $0xf,%edx
801027ca:	01 d0                	add    %edx,%eax
801027cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
801027cf:	8b 55 bc             	mov    -0x44(%ebp),%edx
801027d2:	89 d0                	mov    %edx,%eax
801027d4:	c1 e8 04             	shr    $0x4,%eax
801027d7:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027da:	01 c0                	add    %eax,%eax
801027dc:	83 e2 0f             	and    $0xf,%edx
801027df:	01 d0                	add    %edx,%eax
801027e1:	89 45 bc             	mov    %eax,-0x44(%ebp)
801027e4:	8b 55 c0             	mov    -0x40(%ebp),%edx
801027e7:	89 d0                	mov    %edx,%eax
801027e9:	c1 e8 04             	shr    $0x4,%eax
801027ec:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027ef:	01 c0                	add    %eax,%eax
801027f1:	83 e2 0f             	and    $0xf,%edx
801027f4:	01 d0                	add    %edx,%eax
801027f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801027f9:	8b 55 c4             	mov    -0x3c(%ebp),%edx
801027fc:	89 d0                	mov    %edx,%eax
801027fe:	c1 e8 04             	shr    $0x4,%eax
80102801:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102804:	01 c0                	add    %eax,%eax
80102806:	83 e2 0f             	and    $0xf,%edx
80102809:	01 d0                	add    %edx,%eax
8010280b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010280e:	8b 55 c8             	mov    -0x38(%ebp),%edx
80102811:	89 d0                	mov    %edx,%eax
80102813:	c1 e8 04             	shr    $0x4,%eax
80102816:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102819:	01 c0                	add    %eax,%eax
8010281b:	83 e2 0f             	and    $0xf,%edx
8010281e:	01 d0                	add    %edx,%eax
80102820:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102823:	8b 55 cc             	mov    -0x34(%ebp),%edx
80102826:	89 d0                	mov    %edx,%eax
80102828:	c1 e8 04             	shr    $0x4,%eax
8010282b:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010282e:	01 c0                	add    %eax,%eax
80102830:	83 e2 0f             	and    $0xf,%edx
80102833:	01 d0                	add    %edx,%eax
80102835:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102838:	b9 06 00 00 00       	mov    $0x6,%ecx
8010283d:	8b 7d 08             	mov    0x8(%ebp),%edi
80102840:	8d 75 b8             	lea    -0x48(%ebp),%esi
80102843:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80102845:	8b 45 08             	mov    0x8(%ebp),%eax
80102848:	81 40 14 d0 07 00 00 	addl   $0x7d0,0x14(%eax)
8010284f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102852:	5b                   	pop    %ebx
80102853:	5e                   	pop    %esi
80102854:	5f                   	pop    %edi
80102855:	5d                   	pop    %ebp
80102856:	c3                   	ret    
80102857:	90                   	nop

80102858 <install_trans>:
80102858:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
8010285e:	85 c9                	test   %ecx,%ecx
80102860:	7e 7e                	jle    801028e0 <install_trans+0x88>
80102862:	55                   	push   %ebp
80102863:	89 e5                	mov    %esp,%ebp
80102865:	57                   	push   %edi
80102866:	56                   	push   %esi
80102867:	53                   	push   %ebx
80102868:	83 ec 0c             	sub    $0xc,%esp
8010286b:	31 ff                	xor    %edi,%edi
8010286d:	8d 76 00             	lea    0x0(%esi),%esi
80102870:	83 ec 08             	sub    $0x8,%esp
80102873:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102878:	01 f8                	add    %edi,%eax
8010287a:	40                   	inc    %eax
8010287b:	50                   	push   %eax
8010287c:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102882:	e8 2d d8 ff ff       	call   801000b4 <bread>
80102887:	89 c6                	mov    %eax,%esi
80102889:	58                   	pop    %eax
8010288a:	5a                   	pop    %edx
8010288b:	ff 34 bd ec 16 11 80 	pushl  -0x7feee914(,%edi,4)
80102892:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102898:	e8 17 d8 ff ff       	call   801000b4 <bread>
8010289d:	89 c3                	mov    %eax,%ebx
8010289f:	83 c4 0c             	add    $0xc,%esp
801028a2:	68 00 02 00 00       	push   $0x200
801028a7:	8d 46 5c             	lea    0x5c(%esi),%eax
801028aa:	50                   	push   %eax
801028ab:	8d 43 5c             	lea    0x5c(%ebx),%eax
801028ae:	50                   	push   %eax
801028af:	e8 54 19 00 00       	call   80104208 <memmove>
801028b4:	89 1c 24             	mov    %ebx,(%esp)
801028b7:	e8 c8 d8 ff ff       	call   80100184 <bwrite>
801028bc:	89 34 24             	mov    %esi,(%esp)
801028bf:	e8 f8 d8 ff ff       	call   801001bc <brelse>
801028c4:	89 1c 24             	mov    %ebx,(%esp)
801028c7:	e8 f0 d8 ff ff       	call   801001bc <brelse>
801028cc:	47                   	inc    %edi
801028cd:	83 c4 10             	add    $0x10,%esp
801028d0:	39 3d e8 16 11 80    	cmp    %edi,0x801116e8
801028d6:	7f 98                	jg     80102870 <install_trans+0x18>
801028d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801028db:	5b                   	pop    %ebx
801028dc:	5e                   	pop    %esi
801028dd:	5f                   	pop    %edi
801028de:	5d                   	pop    %ebp
801028df:	c3                   	ret    
801028e0:	c3                   	ret    
801028e1:	8d 76 00             	lea    0x0(%esi),%esi

801028e4 <write_head>:
801028e4:	55                   	push   %ebp
801028e5:	89 e5                	mov    %esp,%ebp
801028e7:	53                   	push   %ebx
801028e8:	83 ec 0c             	sub    $0xc,%esp
801028eb:	ff 35 d4 16 11 80    	pushl  0x801116d4
801028f1:	ff 35 e4 16 11 80    	pushl  0x801116e4
801028f7:	e8 b8 d7 ff ff       	call   801000b4 <bread>
801028fc:	89 c3                	mov    %eax,%ebx
801028fe:	a1 e8 16 11 80       	mov    0x801116e8,%eax
80102903:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102906:	83 c4 10             	add    $0x10,%esp
80102909:	85 c0                	test   %eax,%eax
8010290b:	7e 13                	jle    80102920 <write_head+0x3c>
8010290d:	31 d2                	xor    %edx,%edx
8010290f:	90                   	nop
80102910:	8b 0c 95 ec 16 11 80 	mov    -0x7feee914(,%edx,4),%ecx
80102917:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
8010291b:	42                   	inc    %edx
8010291c:	39 d0                	cmp    %edx,%eax
8010291e:	75 f0                	jne    80102910 <write_head+0x2c>
80102920:	83 ec 0c             	sub    $0xc,%esp
80102923:	53                   	push   %ebx
80102924:	e8 5b d8 ff ff       	call   80100184 <bwrite>
80102929:	89 1c 24             	mov    %ebx,(%esp)
8010292c:	e8 8b d8 ff ff       	call   801001bc <brelse>
80102931:	83 c4 10             	add    $0x10,%esp
80102934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102937:	c9                   	leave  
80102938:	c3                   	ret    
80102939:	8d 76 00             	lea    0x0(%esi),%esi

8010293c <initlog>:
8010293c:	55                   	push   %ebp
8010293d:	89 e5                	mov    %esp,%ebp
8010293f:	53                   	push   %ebx
80102940:	83 ec 2c             	sub    $0x2c,%esp
80102943:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102946:	68 00 6f 10 80       	push   $0x80106f00
8010294b:	68 a0 16 11 80       	push   $0x801116a0
80102950:	e8 b7 15 00 00       	call   80103f0c <initlock>
80102955:	58                   	pop    %eax
80102956:	5a                   	pop    %edx
80102957:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010295a:	50                   	push   %eax
8010295b:	53                   	push   %ebx
8010295c:	e8 7b ea ff ff       	call   801013dc <readsb>
80102961:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102964:	a3 d4 16 11 80       	mov    %eax,0x801116d4
80102969:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010296c:	89 15 d8 16 11 80    	mov    %edx,0x801116d8
80102972:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
80102978:	59                   	pop    %ecx
80102979:	5a                   	pop    %edx
8010297a:	50                   	push   %eax
8010297b:	53                   	push   %ebx
8010297c:	e8 33 d7 ff ff       	call   801000b4 <bread>
80102981:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102984:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
8010298a:	83 c4 10             	add    $0x10,%esp
8010298d:	85 db                	test   %ebx,%ebx
8010298f:	7e 13                	jle    801029a4 <initlog+0x68>
80102991:	31 d2                	xor    %edx,%edx
80102993:	90                   	nop
80102994:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102998:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
8010299f:	42                   	inc    %edx
801029a0:	39 d3                	cmp    %edx,%ebx
801029a2:	75 f0                	jne    80102994 <initlog+0x58>
801029a4:	83 ec 0c             	sub    $0xc,%esp
801029a7:	50                   	push   %eax
801029a8:	e8 0f d8 ff ff       	call   801001bc <brelse>
801029ad:	e8 a6 fe ff ff       	call   80102858 <install_trans>
801029b2:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
801029b9:	00 00 00 
801029bc:	e8 23 ff ff ff       	call   801028e4 <write_head>
801029c1:	83 c4 10             	add    $0x10,%esp
801029c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801029c7:	c9                   	leave  
801029c8:	c3                   	ret    
801029c9:	8d 76 00             	lea    0x0(%esi),%esi

801029cc <begin_op>:
801029cc:	55                   	push   %ebp
801029cd:	89 e5                	mov    %esp,%ebp
801029cf:	83 ec 14             	sub    $0x14,%esp
801029d2:	68 a0 16 11 80       	push   $0x801116a0
801029d7:	e8 f0 16 00 00       	call   801040cc <acquire>
801029dc:	83 c4 10             	add    $0x10,%esp
801029df:	eb 18                	jmp    801029f9 <begin_op+0x2d>
801029e1:	8d 76 00             	lea    0x0(%esi),%esi
801029e4:	83 ec 08             	sub    $0x8,%esp
801029e7:	68 a0 16 11 80       	push   $0x801116a0
801029ec:	68 a0 16 11 80       	push   $0x801116a0
801029f1:	e8 ce 11 00 00       	call   80103bc4 <sleep>
801029f6:	83 c4 10             	add    $0x10,%esp
801029f9:	a1 e0 16 11 80       	mov    0x801116e0,%eax
801029fe:	85 c0                	test   %eax,%eax
80102a00:	75 e2                	jne    801029e4 <begin_op+0x18>
80102a02:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102a07:	8d 50 01             	lea    0x1(%eax),%edx
80102a0a:	8d 44 80 05          	lea    0x5(%eax,%eax,4),%eax
80102a0e:	01 c0                	add    %eax,%eax
80102a10:	03 05 e8 16 11 80    	add    0x801116e8,%eax
80102a16:	83 f8 1e             	cmp    $0x1e,%eax
80102a19:	7f c9                	jg     801029e4 <begin_op+0x18>
80102a1b:	89 15 dc 16 11 80    	mov    %edx,0x801116dc
80102a21:	83 ec 0c             	sub    $0xc,%esp
80102a24:	68 a0 16 11 80       	push   $0x801116a0
80102a29:	e8 3e 16 00 00       	call   8010406c <release>
80102a2e:	83 c4 10             	add    $0x10,%esp
80102a31:	c9                   	leave  
80102a32:	c3                   	ret    
80102a33:	90                   	nop

80102a34 <end_op>:
80102a34:	55                   	push   %ebp
80102a35:	89 e5                	mov    %esp,%ebp
80102a37:	57                   	push   %edi
80102a38:	56                   	push   %esi
80102a39:	53                   	push   %ebx
80102a3a:	83 ec 18             	sub    $0x18,%esp
80102a3d:	68 a0 16 11 80       	push   $0x801116a0
80102a42:	e8 85 16 00 00       	call   801040cc <acquire>
80102a47:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102a4c:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102a4f:	89 1d dc 16 11 80    	mov    %ebx,0x801116dc
80102a55:	83 c4 10             	add    $0x10,%esp
80102a58:	8b 35 e0 16 11 80    	mov    0x801116e0,%esi
80102a5e:	85 f6                	test   %esi,%esi
80102a60:	0f 85 12 01 00 00    	jne    80102b78 <end_op+0x144>
80102a66:	85 db                	test   %ebx,%ebx
80102a68:	0f 85 e6 00 00 00    	jne    80102b54 <end_op+0x120>
80102a6e:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
80102a75:	00 00 00 
80102a78:	83 ec 0c             	sub    $0xc,%esp
80102a7b:	68 a0 16 11 80       	push   $0x801116a0
80102a80:	e8 e7 15 00 00       	call   8010406c <release>
80102a85:	83 c4 10             	add    $0x10,%esp
80102a88:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102a8e:	85 c9                	test   %ecx,%ecx
80102a90:	7f 3a                	jg     80102acc <end_op+0x98>
80102a92:	83 ec 0c             	sub    $0xc,%esp
80102a95:	68 a0 16 11 80       	push   $0x801116a0
80102a9a:	e8 2d 16 00 00       	call   801040cc <acquire>
80102a9f:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80102aa6:	00 00 00 
80102aa9:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102ab0:	e8 cb 11 00 00       	call   80103c80 <wakeup>
80102ab5:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102abc:	e8 ab 15 00 00       	call   8010406c <release>
80102ac1:	83 c4 10             	add    $0x10,%esp
80102ac4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ac7:	5b                   	pop    %ebx
80102ac8:	5e                   	pop    %esi
80102ac9:	5f                   	pop    %edi
80102aca:	5d                   	pop    %ebp
80102acb:	c3                   	ret    
80102acc:	83 ec 08             	sub    $0x8,%esp
80102acf:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102ad4:	01 d8                	add    %ebx,%eax
80102ad6:	40                   	inc    %eax
80102ad7:	50                   	push   %eax
80102ad8:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102ade:	e8 d1 d5 ff ff       	call   801000b4 <bread>
80102ae3:	89 c6                	mov    %eax,%esi
80102ae5:	58                   	pop    %eax
80102ae6:	5a                   	pop    %edx
80102ae7:	ff 34 9d ec 16 11 80 	pushl  -0x7feee914(,%ebx,4)
80102aee:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102af4:	e8 bb d5 ff ff       	call   801000b4 <bread>
80102af9:	89 c7                	mov    %eax,%edi
80102afb:	83 c4 0c             	add    $0xc,%esp
80102afe:	68 00 02 00 00       	push   $0x200
80102b03:	8d 40 5c             	lea    0x5c(%eax),%eax
80102b06:	50                   	push   %eax
80102b07:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b0a:	50                   	push   %eax
80102b0b:	e8 f8 16 00 00       	call   80104208 <memmove>
80102b10:	89 34 24             	mov    %esi,(%esp)
80102b13:	e8 6c d6 ff ff       	call   80100184 <bwrite>
80102b18:	89 3c 24             	mov    %edi,(%esp)
80102b1b:	e8 9c d6 ff ff       	call   801001bc <brelse>
80102b20:	89 34 24             	mov    %esi,(%esp)
80102b23:	e8 94 d6 ff ff       	call   801001bc <brelse>
80102b28:	43                   	inc    %ebx
80102b29:	83 c4 10             	add    $0x10,%esp
80102b2c:	3b 1d e8 16 11 80    	cmp    0x801116e8,%ebx
80102b32:	7c 98                	jl     80102acc <end_op+0x98>
80102b34:	e8 ab fd ff ff       	call   801028e4 <write_head>
80102b39:	e8 1a fd ff ff       	call   80102858 <install_trans>
80102b3e:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102b45:	00 00 00 
80102b48:	e8 97 fd ff ff       	call   801028e4 <write_head>
80102b4d:	e9 40 ff ff ff       	jmp    80102a92 <end_op+0x5e>
80102b52:	66 90                	xchg   %ax,%ax
80102b54:	83 ec 0c             	sub    $0xc,%esp
80102b57:	68 a0 16 11 80       	push   $0x801116a0
80102b5c:	e8 1f 11 00 00       	call   80103c80 <wakeup>
80102b61:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102b68:	e8 ff 14 00 00       	call   8010406c <release>
80102b6d:	83 c4 10             	add    $0x10,%esp
80102b70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b73:	5b                   	pop    %ebx
80102b74:	5e                   	pop    %esi
80102b75:	5f                   	pop    %edi
80102b76:	5d                   	pop    %ebp
80102b77:	c3                   	ret    
80102b78:	83 ec 0c             	sub    $0xc,%esp
80102b7b:	68 04 6f 10 80       	push   $0x80106f04
80102b80:	e8 b3 d7 ff ff       	call   80100338 <panic>
80102b85:	8d 76 00             	lea    0x0(%esi),%esi

80102b88 <log_write>:
80102b88:	55                   	push   %ebp
80102b89:	89 e5                	mov    %esp,%ebp
80102b8b:	53                   	push   %ebx
80102b8c:	52                   	push   %edx
80102b8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b90:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102b96:	83 fa 1d             	cmp    $0x1d,%edx
80102b99:	7f 71                	jg     80102c0c <log_write+0x84>
80102b9b:	a1 d8 16 11 80       	mov    0x801116d8,%eax
80102ba0:	48                   	dec    %eax
80102ba1:	39 c2                	cmp    %eax,%edx
80102ba3:	7d 67                	jge    80102c0c <log_write+0x84>
80102ba5:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102baa:	85 c0                	test   %eax,%eax
80102bac:	7e 6b                	jle    80102c19 <log_write+0x91>
80102bae:	83 ec 0c             	sub    $0xc,%esp
80102bb1:	68 a0 16 11 80       	push   $0x801116a0
80102bb6:	e8 11 15 00 00       	call   801040cc <acquire>
80102bbb:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102bc1:	83 c4 10             	add    $0x10,%esp
80102bc4:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102bc7:	31 c0                	xor    %eax,%eax
80102bc9:	85 d2                	test   %edx,%edx
80102bcb:	7f 08                	jg     80102bd5 <log_write+0x4d>
80102bcd:	eb 0f                	jmp    80102bde <log_write+0x56>
80102bcf:	90                   	nop
80102bd0:	40                   	inc    %eax
80102bd1:	39 c2                	cmp    %eax,%edx
80102bd3:	74 27                	je     80102bfc <log_write+0x74>
80102bd5:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
80102bdc:	75 f2                	jne    80102bd0 <log_write+0x48>
80102bde:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
80102be5:	39 c2                	cmp    %eax,%edx
80102be7:	74 1a                	je     80102c03 <log_write+0x7b>
80102be9:	83 0b 04             	orl    $0x4,(%ebx)
80102bec:	c7 45 08 a0 16 11 80 	movl   $0x801116a0,0x8(%ebp)
80102bf3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bf6:	c9                   	leave  
80102bf7:	e9 70 14 00 00       	jmp    8010406c <release>
80102bfc:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102c03:	42                   	inc    %edx
80102c04:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
80102c0a:	eb dd                	jmp    80102be9 <log_write+0x61>
80102c0c:	83 ec 0c             	sub    $0xc,%esp
80102c0f:	68 13 6f 10 80       	push   $0x80106f13
80102c14:	e8 1f d7 ff ff       	call   80100338 <panic>
80102c19:	83 ec 0c             	sub    $0xc,%esp
80102c1c:	68 29 6f 10 80       	push   $0x80106f29
80102c21:	e8 12 d7 ff ff       	call   80100338 <panic>
80102c26:	66 90                	xchg   %ax,%ax

80102c28 <mpmain>:
80102c28:	55                   	push   %ebp
80102c29:	89 e5                	mov    %esp,%ebp
80102c2b:	53                   	push   %ebx
80102c2c:	50                   	push   %eax
80102c2d:	e8 aa 08 00 00       	call   801034dc <cpuid>
80102c32:	89 c3                	mov    %eax,%ebx
80102c34:	e8 a3 08 00 00       	call   801034dc <cpuid>
80102c39:	52                   	push   %edx
80102c3a:	53                   	push   %ebx
80102c3b:	50                   	push   %eax
80102c3c:	68 44 6f 10 80       	push   $0x80106f44
80102c41:	e8 e2 d9 ff ff       	call   80100628 <cprintf>
80102c46:	e8 e5 26 00 00       	call   80105330 <idtinit>
80102c4b:	e8 28 08 00 00       	call   80103478 <mycpu>
80102c50:	89 c2                	mov    %eax,%edx
80102c52:	b8 01 00 00 00       	mov    $0x1,%eax
80102c57:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102c5e:	e8 31 0b 00 00       	call   80103794 <scheduler>
80102c63:	90                   	nop

80102c64 <mpenter>:
80102c64:	55                   	push   %ebp
80102c65:	89 e5                	mov    %esp,%ebp
80102c67:	83 ec 08             	sub    $0x8,%esp
80102c6a:	e8 19 37 00 00       	call   80106388 <switchkvm>
80102c6f:	e8 90 36 00 00       	call   80106304 <seginit>
80102c74:	e8 8f f8 ff ff       	call   80102508 <lapicinit>
80102c79:	e8 aa ff ff ff       	call   80102c28 <mpmain>
80102c7e:	66 90                	xchg   %ax,%ax

80102c80 <main>:
80102c80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102c84:	83 e4 f0             	and    $0xfffffff0,%esp
80102c87:	ff 71 fc             	pushl  -0x4(%ecx)
80102c8a:	55                   	push   %ebp
80102c8b:	89 e5                	mov    %esp,%ebp
80102c8d:	53                   	push   %ebx
80102c8e:	51                   	push   %ecx
80102c8f:	83 ec 08             	sub    $0x8,%esp
80102c92:	68 00 00 40 80       	push   $0x80400000
80102c97:	68 d0 59 11 80       	push   $0x801159d0
80102c9c:	e8 c3 f6 ff ff       	call   80102364 <kinit1>
80102ca1:	e8 26 3b 00 00       	call   801067cc <kvmalloc>
80102ca6:	e8 61 01 00 00       	call   80102e0c <mpinit>
80102cab:	e8 58 f8 ff ff       	call   80102508 <lapicinit>
80102cb0:	e8 4f 36 00 00       	call   80106304 <seginit>
80102cb5:	e8 1a 03 00 00       	call   80102fd4 <picinit>
80102cba:	e8 a9 f4 ff ff       	call   80102168 <ioapicinit>
80102cbf:	e8 18 dd ff ff       	call   801009dc <consoleinit>
80102cc4:	e8 0b 29 00 00       	call   801055d4 <uartinit>
80102cc9:	e8 8e 07 00 00       	call   8010345c <pinit>
80102cce:	e8 f1 25 00 00       	call   801052c4 <tvinit>
80102cd3:	e8 5c d3 ff ff       	call   80100034 <binit>
80102cd8:	e8 9f e0 ff ff       	call   80100d7c <fileinit>
80102cdd:	e8 a2 f2 ff ff       	call   80101f84 <ideinit>
80102ce2:	83 c4 0c             	add    $0xc,%esp
80102ce5:	68 8a 00 00 00       	push   $0x8a
80102cea:	68 8c a4 10 80       	push   $0x8010a48c
80102cef:	68 00 70 00 80       	push   $0x80007000
80102cf4:	e8 0f 15 00 00       	call   80104208 <memmove>
80102cf9:	8b 15 84 17 11 80    	mov    0x80111784,%edx
80102cff:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d02:	01 c0                	add    %eax,%eax
80102d04:	01 d0                	add    %edx,%eax
80102d06:	c1 e0 04             	shl    $0x4,%eax
80102d09:	05 a0 17 11 80       	add    $0x801117a0,%eax
80102d0e:	83 c4 10             	add    $0x10,%esp
80102d11:	3d a0 17 11 80       	cmp    $0x801117a0,%eax
80102d16:	76 74                	jbe    80102d8c <main+0x10c>
80102d18:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
80102d1d:	eb 20                	jmp    80102d3f <main+0xbf>
80102d1f:	90                   	nop
80102d20:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102d26:	8b 15 84 17 11 80    	mov    0x80111784,%edx
80102d2c:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d2f:	01 c0                	add    %eax,%eax
80102d31:	01 d0                	add    %edx,%eax
80102d33:	c1 e0 04             	shl    $0x4,%eax
80102d36:	05 a0 17 11 80       	add    $0x801117a0,%eax
80102d3b:	39 c3                	cmp    %eax,%ebx
80102d3d:	73 4d                	jae    80102d8c <main+0x10c>
80102d3f:	e8 34 07 00 00       	call   80103478 <mycpu>
80102d44:	39 c3                	cmp    %eax,%ebx
80102d46:	74 d8                	je     80102d20 <main+0xa0>
80102d48:	e8 7b f6 ff ff       	call   801023c8 <kalloc>
80102d4d:	05 00 10 00 00       	add    $0x1000,%eax
80102d52:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102d57:	c7 05 f8 6f 00 80 64 	movl   $0x80102c64,0x80006ff8
80102d5e:	2c 10 80 
80102d61:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102d68:	90 10 00 
80102d6b:	83 ec 08             	sub    $0x8,%esp
80102d6e:	68 00 70 00 00       	push   $0x7000
80102d73:	0f b6 03             	movzbl (%ebx),%eax
80102d76:	50                   	push   %eax
80102d77:	e8 a0 f8 ff ff       	call   8010261c <lapicstartap>
80102d7c:	83 c4 10             	add    $0x10,%esp
80102d7f:	90                   	nop
80102d80:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102d86:	85 c0                	test   %eax,%eax
80102d88:	74 f6                	je     80102d80 <main+0x100>
80102d8a:	eb 94                	jmp    80102d20 <main+0xa0>
80102d8c:	83 ec 08             	sub    $0x8,%esp
80102d8f:	68 00 00 00 8e       	push   $0x8e000000
80102d94:	68 00 00 40 80       	push   $0x80400000
80102d99:	e8 72 f5 ff ff       	call   80102310 <kinit2>
80102d9e:	e8 91 07 00 00       	call   80103534 <userinit>
80102da3:	e8 80 fe ff ff       	call   80102c28 <mpmain>

80102da8 <mpsearch1>:
80102da8:	55                   	push   %ebp
80102da9:	89 e5                	mov    %esp,%ebp
80102dab:	57                   	push   %edi
80102dac:	56                   	push   %esi
80102dad:	53                   	push   %ebx
80102dae:	83 ec 0c             	sub    $0xc,%esp
80102db1:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102db7:	8d 9c 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%ebx
80102dbe:	39 de                	cmp    %ebx,%esi
80102dc0:	72 0b                	jb     80102dcd <mpsearch1+0x25>
80102dc2:	eb 3c                	jmp    80102e00 <mpsearch1+0x58>
80102dc4:	8d 7e 10             	lea    0x10(%esi),%edi
80102dc7:	89 fe                	mov    %edi,%esi
80102dc9:	39 df                	cmp    %ebx,%edi
80102dcb:	73 33                	jae    80102e00 <mpsearch1+0x58>
80102dcd:	50                   	push   %eax
80102dce:	6a 04                	push   $0x4
80102dd0:	68 58 6f 10 80       	push   $0x80106f58
80102dd5:	56                   	push   %esi
80102dd6:	e8 f5 13 00 00       	call   801041d0 <memcmp>
80102ddb:	83 c4 10             	add    $0x10,%esp
80102dde:	85 c0                	test   %eax,%eax
80102de0:	75 e2                	jne    80102dc4 <mpsearch1+0x1c>
80102de2:	89 f2                	mov    %esi,%edx
80102de4:	8d 7e 10             	lea    0x10(%esi),%edi
80102de7:	90                   	nop
80102de8:	0f b6 0a             	movzbl (%edx),%ecx
80102deb:	01 c8                	add    %ecx,%eax
80102ded:	42                   	inc    %edx
80102dee:	39 fa                	cmp    %edi,%edx
80102df0:	75 f6                	jne    80102de8 <mpsearch1+0x40>
80102df2:	84 c0                	test   %al,%al
80102df4:	75 d1                	jne    80102dc7 <mpsearch1+0x1f>
80102df6:	89 f0                	mov    %esi,%eax
80102df8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dfb:	5b                   	pop    %ebx
80102dfc:	5e                   	pop    %esi
80102dfd:	5f                   	pop    %edi
80102dfe:	5d                   	pop    %ebp
80102dff:	c3                   	ret    
80102e00:	31 f6                	xor    %esi,%esi
80102e02:	89 f0                	mov    %esi,%eax
80102e04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e07:	5b                   	pop    %ebx
80102e08:	5e                   	pop    %esi
80102e09:	5f                   	pop    %edi
80102e0a:	5d                   	pop    %ebp
80102e0b:	c3                   	ret    

80102e0c <mpinit>:
80102e0c:	55                   	push   %ebp
80102e0d:	89 e5                	mov    %esp,%ebp
80102e0f:	57                   	push   %edi
80102e10:	56                   	push   %esi
80102e11:	53                   	push   %ebx
80102e12:	83 ec 1c             	sub    $0x1c,%esp
80102e15:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102e1c:	c1 e0 08             	shl    $0x8,%eax
80102e1f:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102e26:	09 d0                	or     %edx,%eax
80102e28:	c1 e0 04             	shl    $0x4,%eax
80102e2b:	75 1b                	jne    80102e48 <mpinit+0x3c>
80102e2d:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102e34:	c1 e0 08             	shl    $0x8,%eax
80102e37:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102e3e:	09 d0                	or     %edx,%eax
80102e40:	c1 e0 0a             	shl    $0xa,%eax
80102e43:	2d 00 04 00 00       	sub    $0x400,%eax
80102e48:	ba 00 04 00 00       	mov    $0x400,%edx
80102e4d:	e8 56 ff ff ff       	call   80102da8 <mpsearch1>
80102e52:	89 c3                	mov    %eax,%ebx
80102e54:	85 c0                	test   %eax,%eax
80102e56:	0f 84 28 01 00 00    	je     80102f84 <mpinit+0x178>
80102e5c:	8b 73 04             	mov    0x4(%ebx),%esi
80102e5f:	85 f6                	test   %esi,%esi
80102e61:	0f 84 0d 01 00 00    	je     80102f74 <mpinit+0x168>
80102e67:	8d be 00 00 00 80    	lea    -0x80000000(%esi),%edi
80102e6d:	50                   	push   %eax
80102e6e:	6a 04                	push   $0x4
80102e70:	68 5d 6f 10 80       	push   $0x80106f5d
80102e75:	57                   	push   %edi
80102e76:	e8 55 13 00 00       	call   801041d0 <memcmp>
80102e7b:	83 c4 10             	add    $0x10,%esp
80102e7e:	85 c0                	test   %eax,%eax
80102e80:	0f 85 ee 00 00 00    	jne    80102f74 <mpinit+0x168>
80102e86:	8a 86 06 00 00 80    	mov    -0x7ffffffa(%esi),%al
80102e8c:	3c 01                	cmp    $0x1,%al
80102e8e:	74 08                	je     80102e98 <mpinit+0x8c>
80102e90:	3c 04                	cmp    $0x4,%al
80102e92:	0f 85 dc 00 00 00    	jne    80102f74 <mpinit+0x168>
80102e98:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80102e9f:	66 85 d2             	test   %dx,%dx
80102ea2:	74 1f                	je     80102ec3 <mpinit+0xb7>
80102ea4:	89 f8                	mov    %edi,%eax
80102ea6:	8d 0c 17             	lea    (%edi,%edx,1),%ecx
80102ea9:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102eac:	31 d2                	xor    %edx,%edx
80102eae:	66 90                	xchg   %ax,%ax
80102eb0:	0f b6 08             	movzbl (%eax),%ecx
80102eb3:	01 ca                	add    %ecx,%edx
80102eb5:	40                   	inc    %eax
80102eb6:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
80102eb9:	75 f5                	jne    80102eb0 <mpinit+0xa4>
80102ebb:	84 d2                	test   %dl,%dl
80102ebd:	0f 85 b1 00 00 00    	jne    80102f74 <mpinit+0x168>
80102ec3:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
80102ec9:	a3 80 16 11 80       	mov    %eax,0x80111680
80102ece:	8d 96 2c 00 00 80    	lea    -0x7fffffd4(%esi),%edx
80102ed4:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
80102edb:	01 f9                	add    %edi,%ecx
80102edd:	be 01 00 00 00       	mov    $0x1,%esi
80102ee2:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80102ee5:	8d 76 00             	lea    0x0(%esi),%esi
80102ee8:	39 ca                	cmp    %ecx,%edx
80102eea:	73 13                	jae    80102eff <mpinit+0xf3>
80102eec:	8a 02                	mov    (%edx),%al
80102eee:	3c 02                	cmp    $0x2,%al
80102ef0:	74 46                	je     80102f38 <mpinit+0x12c>
80102ef2:	77 38                	ja     80102f2c <mpinit+0x120>
80102ef4:	84 c0                	test   %al,%al
80102ef6:	74 50                	je     80102f48 <mpinit+0x13c>
80102ef8:	83 c2 08             	add    $0x8,%edx
80102efb:	39 ca                	cmp    %ecx,%edx
80102efd:	72 ed                	jb     80102eec <mpinit+0xe0>
80102eff:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80102f02:	85 f6                	test   %esi,%esi
80102f04:	0f 84 bd 00 00 00    	je     80102fc7 <mpinit+0x1bb>
80102f0a:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
80102f0e:	74 12                	je     80102f22 <mpinit+0x116>
80102f10:	b0 70                	mov    $0x70,%al
80102f12:	ba 22 00 00 00       	mov    $0x22,%edx
80102f17:	ee                   	out    %al,(%dx)
80102f18:	ba 23 00 00 00       	mov    $0x23,%edx
80102f1d:	ec                   	in     (%dx),%al
80102f1e:	83 c8 01             	or     $0x1,%eax
80102f21:	ee                   	out    %al,(%dx)
80102f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f25:	5b                   	pop    %ebx
80102f26:	5e                   	pop    %esi
80102f27:	5f                   	pop    %edi
80102f28:	5d                   	pop    %ebp
80102f29:	c3                   	ret    
80102f2a:	66 90                	xchg   %ax,%ax
80102f2c:	83 e8 03             	sub    $0x3,%eax
80102f2f:	3c 01                	cmp    $0x1,%al
80102f31:	76 c5                	jbe    80102ef8 <mpinit+0xec>
80102f33:	31 f6                	xor    %esi,%esi
80102f35:	eb b1                	jmp    80102ee8 <mpinit+0xdc>
80102f37:	90                   	nop
80102f38:	8a 42 01             	mov    0x1(%edx),%al
80102f3b:	a2 80 17 11 80       	mov    %al,0x80111780
80102f40:	83 c2 08             	add    $0x8,%edx
80102f43:	eb a3                	jmp    80102ee8 <mpinit+0xdc>
80102f45:	8d 76 00             	lea    0x0(%esi),%esi
80102f48:	a1 84 17 11 80       	mov    0x80111784,%eax
80102f4d:	83 f8 07             	cmp    $0x7,%eax
80102f50:	7f 19                	jg     80102f6b <mpinit+0x15f>
80102f52:	8d 3c 80             	lea    (%eax,%eax,4),%edi
80102f55:	01 ff                	add    %edi,%edi
80102f57:	01 c7                	add    %eax,%edi
80102f59:	c1 e7 04             	shl    $0x4,%edi
80102f5c:	8a 5a 01             	mov    0x1(%edx),%bl
80102f5f:	88 9f a0 17 11 80    	mov    %bl,-0x7feee860(%edi)
80102f65:	40                   	inc    %eax
80102f66:	a3 84 17 11 80       	mov    %eax,0x80111784
80102f6b:	83 c2 14             	add    $0x14,%edx
80102f6e:	e9 75 ff ff ff       	jmp    80102ee8 <mpinit+0xdc>
80102f73:	90                   	nop
80102f74:	83 ec 0c             	sub    $0xc,%esp
80102f77:	68 62 6f 10 80       	push   $0x80106f62
80102f7c:	e8 b7 d3 ff ff       	call   80100338 <panic>
80102f81:	8d 76 00             	lea    0x0(%esi),%esi
80102f84:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
80102f89:	eb 0e                	jmp    80102f99 <mpinit+0x18d>
80102f8b:	90                   	nop
80102f8c:	8d 73 10             	lea    0x10(%ebx),%esi
80102f8f:	89 f3                	mov    %esi,%ebx
80102f91:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
80102f97:	74 db                	je     80102f74 <mpinit+0x168>
80102f99:	52                   	push   %edx
80102f9a:	6a 04                	push   $0x4
80102f9c:	68 58 6f 10 80       	push   $0x80106f58
80102fa1:	53                   	push   %ebx
80102fa2:	e8 29 12 00 00       	call   801041d0 <memcmp>
80102fa7:	83 c4 10             	add    $0x10,%esp
80102faa:	85 c0                	test   %eax,%eax
80102fac:	75 de                	jne    80102f8c <mpinit+0x180>
80102fae:	89 da                	mov    %ebx,%edx
80102fb0:	8d 73 10             	lea    0x10(%ebx),%esi
80102fb3:	90                   	nop
80102fb4:	0f b6 0a             	movzbl (%edx),%ecx
80102fb7:	01 c8                	add    %ecx,%eax
80102fb9:	42                   	inc    %edx
80102fba:	39 f2                	cmp    %esi,%edx
80102fbc:	75 f6                	jne    80102fb4 <mpinit+0x1a8>
80102fbe:	84 c0                	test   %al,%al
80102fc0:	75 cd                	jne    80102f8f <mpinit+0x183>
80102fc2:	e9 95 fe ff ff       	jmp    80102e5c <mpinit+0x50>
80102fc7:	83 ec 0c             	sub    $0xc,%esp
80102fca:	68 7c 6f 10 80       	push   $0x80106f7c
80102fcf:	e8 64 d3 ff ff       	call   80100338 <panic>

80102fd4 <picinit>:
80102fd4:	b0 ff                	mov    $0xff,%al
80102fd6:	ba 21 00 00 00       	mov    $0x21,%edx
80102fdb:	ee                   	out    %al,(%dx)
80102fdc:	ba a1 00 00 00       	mov    $0xa1,%edx
80102fe1:	ee                   	out    %al,(%dx)
80102fe2:	c3                   	ret    
80102fe3:	90                   	nop

80102fe4 <pipealloc>:
80102fe4:	55                   	push   %ebp
80102fe5:	89 e5                	mov    %esp,%ebp
80102fe7:	57                   	push   %edi
80102fe8:	56                   	push   %esi
80102fe9:	53                   	push   %ebx
80102fea:	83 ec 0c             	sub    $0xc,%esp
80102fed:	8b 75 08             	mov    0x8(%ebp),%esi
80102ff0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80102ff3:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80102ff9:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102fff:	e8 94 dd ff ff       	call   80100d98 <filealloc>
80103004:	89 06                	mov    %eax,(%esi)
80103006:	85 c0                	test   %eax,%eax
80103008:	0f 84 a5 00 00 00    	je     801030b3 <pipealloc+0xcf>
8010300e:	e8 85 dd ff ff       	call   80100d98 <filealloc>
80103013:	89 07                	mov    %eax,(%edi)
80103015:	85 c0                	test   %eax,%eax
80103017:	0f 84 84 00 00 00    	je     801030a1 <pipealloc+0xbd>
8010301d:	e8 a6 f3 ff ff       	call   801023c8 <kalloc>
80103022:	89 c3                	mov    %eax,%ebx
80103024:	85 c0                	test   %eax,%eax
80103026:	0f 84 a0 00 00 00    	je     801030cc <pipealloc+0xe8>
8010302c:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103033:	00 00 00 
80103036:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010303d:	00 00 00 
80103040:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103047:	00 00 00 
8010304a:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103051:	00 00 00 
80103054:	83 ec 08             	sub    $0x8,%esp
80103057:	68 9b 6f 10 80       	push   $0x80106f9b
8010305c:	50                   	push   %eax
8010305d:	e8 aa 0e 00 00       	call   80103f0c <initlock>
80103062:	8b 06                	mov    (%esi),%eax
80103064:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010306a:	8b 06                	mov    (%esi),%eax
8010306c:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103070:	8b 06                	mov    (%esi),%eax
80103072:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103076:	8b 06                	mov    (%esi),%eax
80103078:	89 58 0c             	mov    %ebx,0xc(%eax)
8010307b:	8b 07                	mov    (%edi),%eax
8010307d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103083:	8b 07                	mov    (%edi),%eax
80103085:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103089:	8b 07                	mov    (%edi),%eax
8010308b:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010308f:	8b 07                	mov    (%edi),%eax
80103091:	89 58 0c             	mov    %ebx,0xc(%eax)
80103094:	83 c4 10             	add    $0x10,%esp
80103097:	31 c0                	xor    %eax,%eax
80103099:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010309c:	5b                   	pop    %ebx
8010309d:	5e                   	pop    %esi
8010309e:	5f                   	pop    %edi
8010309f:	5d                   	pop    %ebp
801030a0:	c3                   	ret    
801030a1:	8b 06                	mov    (%esi),%eax
801030a3:	85 c0                	test   %eax,%eax
801030a5:	74 1e                	je     801030c5 <pipealloc+0xe1>
801030a7:	83 ec 0c             	sub    $0xc,%esp
801030aa:	50                   	push   %eax
801030ab:	e8 94 dd ff ff       	call   80100e44 <fileclose>
801030b0:	83 c4 10             	add    $0x10,%esp
801030b3:	8b 07                	mov    (%edi),%eax
801030b5:	85 c0                	test   %eax,%eax
801030b7:	74 0c                	je     801030c5 <pipealloc+0xe1>
801030b9:	83 ec 0c             	sub    $0xc,%esp
801030bc:	50                   	push   %eax
801030bd:	e8 82 dd ff ff       	call   80100e44 <fileclose>
801030c2:	83 c4 10             	add    $0x10,%esp
801030c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801030ca:	eb cd                	jmp    80103099 <pipealloc+0xb5>
801030cc:	8b 06                	mov    (%esi),%eax
801030ce:	85 c0                	test   %eax,%eax
801030d0:	75 d5                	jne    801030a7 <pipealloc+0xc3>
801030d2:	eb df                	jmp    801030b3 <pipealloc+0xcf>

801030d4 <pipeclose>:
801030d4:	55                   	push   %ebp
801030d5:	89 e5                	mov    %esp,%ebp
801030d7:	56                   	push   %esi
801030d8:	53                   	push   %ebx
801030d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801030dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801030df:	83 ec 0c             	sub    $0xc,%esp
801030e2:	53                   	push   %ebx
801030e3:	e8 e4 0f 00 00       	call   801040cc <acquire>
801030e8:	83 c4 10             	add    $0x10,%esp
801030eb:	85 f6                	test   %esi,%esi
801030ed:	74 5d                	je     8010314c <pipeclose+0x78>
801030ef:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801030f6:	00 00 00 
801030f9:	83 ec 0c             	sub    $0xc,%esp
801030fc:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103102:	50                   	push   %eax
80103103:	e8 78 0b 00 00       	call   80103c80 <wakeup>
80103108:	83 c4 10             	add    $0x10,%esp
8010310b:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103111:	85 d2                	test   %edx,%edx
80103113:	75 0a                	jne    8010311f <pipeclose+0x4b>
80103115:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
8010311b:	85 c0                	test   %eax,%eax
8010311d:	74 11                	je     80103130 <pipeclose+0x5c>
8010311f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103122:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103125:	5b                   	pop    %ebx
80103126:	5e                   	pop    %esi
80103127:	5d                   	pop    %ebp
80103128:	e9 3f 0f 00 00       	jmp    8010406c <release>
8010312d:	8d 76 00             	lea    0x0(%esi),%esi
80103130:	83 ec 0c             	sub    $0xc,%esp
80103133:	53                   	push   %ebx
80103134:	e8 33 0f 00 00       	call   8010406c <release>
80103139:	83 c4 10             	add    $0x10,%esp
8010313c:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010313f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103142:	5b                   	pop    %ebx
80103143:	5e                   	pop    %esi
80103144:	5d                   	pop    %ebp
80103145:	e9 ee f0 ff ff       	jmp    80102238 <kfree>
8010314a:	66 90                	xchg   %ax,%ax
8010314c:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103153:	00 00 00 
80103156:	83 ec 0c             	sub    $0xc,%esp
80103159:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010315f:	50                   	push   %eax
80103160:	e8 1b 0b 00 00       	call   80103c80 <wakeup>
80103165:	83 c4 10             	add    $0x10,%esp
80103168:	eb a1                	jmp    8010310b <pipeclose+0x37>
8010316a:	66 90                	xchg   %ax,%ax

8010316c <pipewrite>:
8010316c:	55                   	push   %ebp
8010316d:	89 e5                	mov    %esp,%ebp
8010316f:	57                   	push   %edi
80103170:	56                   	push   %esi
80103171:	53                   	push   %ebx
80103172:	83 ec 28             	sub    $0x28,%esp
80103175:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103178:	8b 7d 10             	mov    0x10(%ebp),%edi
8010317b:	53                   	push   %ebx
8010317c:	e8 4b 0f 00 00       	call   801040cc <acquire>
80103181:	83 c4 10             	add    $0x10,%esp
80103184:	85 ff                	test   %edi,%edi
80103186:	0f 8e c2 00 00 00    	jle    8010324e <pipewrite+0xe2>
8010318c:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103192:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103195:	8d 34 39             	lea    (%ecx,%edi,1),%esi
80103198:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010319b:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801031a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031a4:	89 7d 10             	mov    %edi,0x10(%ebp)
801031a7:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801031ad:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
801031b3:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
801031b9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
801031bc:	0f 85 aa 00 00 00    	jne    8010326c <pipewrite+0x100>
801031c2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801031c5:	eb 37                	jmp    801031fe <pipewrite+0x92>
801031c7:	90                   	nop
801031c8:	e8 43 03 00 00       	call   80103510 <myproc>
801031cd:	8b 48 24             	mov    0x24(%eax),%ecx
801031d0:	85 c9                	test   %ecx,%ecx
801031d2:	75 34                	jne    80103208 <pipewrite+0x9c>
801031d4:	83 ec 0c             	sub    $0xc,%esp
801031d7:	56                   	push   %esi
801031d8:	e8 a3 0a 00 00       	call   80103c80 <wakeup>
801031dd:	58                   	pop    %eax
801031de:	5a                   	pop    %edx
801031df:	53                   	push   %ebx
801031e0:	57                   	push   %edi
801031e1:	e8 de 09 00 00       	call   80103bc4 <sleep>
801031e6:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801031ec:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801031f2:	05 00 02 00 00       	add    $0x200,%eax
801031f7:	83 c4 10             	add    $0x10,%esp
801031fa:	39 c2                	cmp    %eax,%edx
801031fc:	75 26                	jne    80103224 <pipewrite+0xb8>
801031fe:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103204:	85 c0                	test   %eax,%eax
80103206:	75 c0                	jne    801031c8 <pipewrite+0x5c>
80103208:	83 ec 0c             	sub    $0xc,%esp
8010320b:	53                   	push   %ebx
8010320c:	e8 5b 0e 00 00       	call   8010406c <release>
80103211:	83 c4 10             	add    $0x10,%esp
80103214:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103219:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010321c:	5b                   	pop    %ebx
8010321d:	5e                   	pop    %esi
8010321e:	5f                   	pop    %edi
8010321f:	5d                   	pop    %ebp
80103220:	c3                   	ret    
80103221:	8d 76 00             	lea    0x0(%esi),%esi
80103224:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103227:	8d 42 01             	lea    0x1(%edx),%eax
8010322a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010322d:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103233:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103239:	8a 01                	mov    (%ecx),%al
8010323b:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
8010323f:	41                   	inc    %ecx
80103240:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103243:	39 c1                	cmp    %eax,%ecx
80103245:	0f 85 5c ff ff ff    	jne    801031a7 <pipewrite+0x3b>
8010324b:	8b 7d 10             	mov    0x10(%ebp),%edi
8010324e:	83 ec 0c             	sub    $0xc,%esp
80103251:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103257:	50                   	push   %eax
80103258:	e8 23 0a 00 00       	call   80103c80 <wakeup>
8010325d:	89 1c 24             	mov    %ebx,(%esp)
80103260:	e8 07 0e 00 00       	call   8010406c <release>
80103265:	83 c4 10             	add    $0x10,%esp
80103268:	89 f8                	mov    %edi,%eax
8010326a:	eb ad                	jmp    80103219 <pipewrite+0xad>
8010326c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010326f:	eb b6                	jmp    80103227 <pipewrite+0xbb>
80103271:	8d 76 00             	lea    0x0(%esi),%esi

80103274 <piperead>:
80103274:	55                   	push   %ebp
80103275:	89 e5                	mov    %esp,%ebp
80103277:	57                   	push   %edi
80103278:	56                   	push   %esi
80103279:	53                   	push   %ebx
8010327a:	83 ec 18             	sub    $0x18,%esp
8010327d:	8b 75 08             	mov    0x8(%ebp),%esi
80103280:	8b 7d 0c             	mov    0xc(%ebp),%edi
80103283:	56                   	push   %esi
80103284:	e8 43 0e 00 00       	call   801040cc <acquire>
80103289:	83 c4 10             	add    $0x10,%esp
8010328c:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103292:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103298:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
8010329e:	74 2f                	je     801032cf <piperead+0x5b>
801032a0:	eb 37                	jmp    801032d9 <piperead+0x65>
801032a2:	66 90                	xchg   %ax,%ax
801032a4:	e8 67 02 00 00       	call   80103510 <myproc>
801032a9:	8b 48 24             	mov    0x24(%eax),%ecx
801032ac:	85 c9                	test   %ecx,%ecx
801032ae:	0f 85 80 00 00 00    	jne    80103334 <piperead+0xc0>
801032b4:	83 ec 08             	sub    $0x8,%esp
801032b7:	56                   	push   %esi
801032b8:	53                   	push   %ebx
801032b9:	e8 06 09 00 00       	call   80103bc4 <sleep>
801032be:	83 c4 10             	add    $0x10,%esp
801032c1:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
801032c7:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
801032cd:	75 0a                	jne    801032d9 <piperead+0x65>
801032cf:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
801032d5:	85 c0                	test   %eax,%eax
801032d7:	75 cb                	jne    801032a4 <piperead+0x30>
801032d9:	31 db                	xor    %ebx,%ebx
801032db:	8b 55 10             	mov    0x10(%ebp),%edx
801032de:	85 d2                	test   %edx,%edx
801032e0:	7f 1d                	jg     801032ff <piperead+0x8b>
801032e2:	eb 29                	jmp    8010330d <piperead+0x99>
801032e4:	8d 48 01             	lea    0x1(%eax),%ecx
801032e7:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
801032ed:	25 ff 01 00 00       	and    $0x1ff,%eax
801032f2:	8a 44 06 34          	mov    0x34(%esi,%eax,1),%al
801032f6:	88 04 1f             	mov    %al,(%edi,%ebx,1)
801032f9:	43                   	inc    %ebx
801032fa:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801032fd:	74 0e                	je     8010330d <piperead+0x99>
801032ff:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103305:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010330b:	75 d7                	jne    801032e4 <piperead+0x70>
8010330d:	83 ec 0c             	sub    $0xc,%esp
80103310:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103316:	50                   	push   %eax
80103317:	e8 64 09 00 00       	call   80103c80 <wakeup>
8010331c:	89 34 24             	mov    %esi,(%esp)
8010331f:	e8 48 0d 00 00       	call   8010406c <release>
80103324:	83 c4 10             	add    $0x10,%esp
80103327:	89 d8                	mov    %ebx,%eax
80103329:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010332c:	5b                   	pop    %ebx
8010332d:	5e                   	pop    %esi
8010332e:	5f                   	pop    %edi
8010332f:	5d                   	pop    %ebp
80103330:	c3                   	ret    
80103331:	8d 76 00             	lea    0x0(%esi),%esi
80103334:	83 ec 0c             	sub    $0xc,%esp
80103337:	56                   	push   %esi
80103338:	e8 2f 0d 00 00       	call   8010406c <release>
8010333d:	83 c4 10             	add    $0x10,%esp
80103340:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103345:	89 d8                	mov    %ebx,%eax
80103347:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010334a:	5b                   	pop    %ebx
8010334b:	5e                   	pop    %esi
8010334c:	5f                   	pop    %edi
8010334d:	5d                   	pop    %ebp
8010334e:	c3                   	ret    
8010334f:	90                   	nop

80103350 <allocproc>:
80103350:	55                   	push   %ebp
80103351:	89 e5                	mov    %esp,%ebp
80103353:	53                   	push   %ebx
80103354:	83 ec 10             	sub    $0x10,%esp
80103357:	68 20 1d 11 80       	push   $0x80111d20
8010335c:	e8 6b 0d 00 00       	call   801040cc <acquire>
80103361:	83 c4 10             	add    $0x10,%esp
80103364:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103369:	eb 0f                	jmp    8010337a <allocproc+0x2a>
8010336b:	90                   	nop
8010336c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103372:	81 fb 54 41 11 80    	cmp    $0x80114154,%ebx
80103378:	74 76                	je     801033f0 <allocproc+0xa0>
8010337a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
8010337d:	85 c9                	test   %ecx,%ecx
8010337f:	75 eb                	jne    8010336c <allocproc+0x1c>
80103381:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103388:	a1 04 a0 10 80       	mov    0x8010a004,%eax
8010338d:	8d 50 01             	lea    0x1(%eax),%edx
80103390:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
80103396:	89 43 10             	mov    %eax,0x10(%ebx)
80103399:	83 ec 0c             	sub    $0xc,%esp
8010339c:	68 20 1d 11 80       	push   $0x80111d20
801033a1:	e8 c6 0c 00 00       	call   8010406c <release>
801033a6:	e8 1d f0 ff ff       	call   801023c8 <kalloc>
801033ab:	89 43 08             	mov    %eax,0x8(%ebx)
801033ae:	83 c4 10             	add    $0x10,%esp
801033b1:	85 c0                	test   %eax,%eax
801033b3:	74 54                	je     80103409 <allocproc+0xb9>
801033b5:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801033bb:	89 53 18             	mov    %edx,0x18(%ebx)
801033be:	c7 80 b0 0f 00 00 b7 	movl   $0x801052b7,0xfb0(%eax)
801033c5:	52 10 80 
801033c8:	05 9c 0f 00 00       	add    $0xf9c,%eax
801033cd:	89 43 1c             	mov    %eax,0x1c(%ebx)
801033d0:	52                   	push   %edx
801033d1:	6a 14                	push   $0x14
801033d3:	6a 00                	push   $0x0
801033d5:	50                   	push   %eax
801033d6:	e8 b1 0d 00 00       	call   8010418c <memset>
801033db:	8b 43 1c             	mov    0x1c(%ebx),%eax
801033de:	c7 40 10 14 34 10 80 	movl   $0x80103414,0x10(%eax)
801033e5:	83 c4 10             	add    $0x10,%esp
801033e8:	89 d8                	mov    %ebx,%eax
801033ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801033ed:	c9                   	leave  
801033ee:	c3                   	ret    
801033ef:	90                   	nop
801033f0:	83 ec 0c             	sub    $0xc,%esp
801033f3:	68 20 1d 11 80       	push   $0x80111d20
801033f8:	e8 6f 0c 00 00       	call   8010406c <release>
801033fd:	83 c4 10             	add    $0x10,%esp
80103400:	31 db                	xor    %ebx,%ebx
80103402:	89 d8                	mov    %ebx,%eax
80103404:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103407:	c9                   	leave  
80103408:	c3                   	ret    
80103409:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103410:	31 db                	xor    %ebx,%ebx
80103412:	eb ee                	jmp    80103402 <allocproc+0xb2>

80103414 <forkret>:
80103414:	55                   	push   %ebp
80103415:	89 e5                	mov    %esp,%ebp
80103417:	83 ec 14             	sub    $0x14,%esp
8010341a:	68 20 1d 11 80       	push   $0x80111d20
8010341f:	e8 48 0c 00 00       	call   8010406c <release>
80103424:	83 c4 10             	add    $0x10,%esp
80103427:	a1 00 a0 10 80       	mov    0x8010a000,%eax
8010342c:	85 c0                	test   %eax,%eax
8010342e:	75 04                	jne    80103434 <forkret+0x20>
80103430:	c9                   	leave  
80103431:	c3                   	ret    
80103432:	66 90                	xchg   %ax,%ax
80103434:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010343b:	00 00 00 
8010343e:	83 ec 0c             	sub    $0xc,%esp
80103441:	6a 01                	push   $0x1
80103443:	e8 cc df ff ff       	call   80101414 <iinit>
80103448:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010344f:	e8 e8 f4 ff ff       	call   8010293c <initlog>
80103454:	83 c4 10             	add    $0x10,%esp
80103457:	c9                   	leave  
80103458:	c3                   	ret    
80103459:	8d 76 00             	lea    0x0(%esi),%esi

8010345c <pinit>:
8010345c:	55                   	push   %ebp
8010345d:	89 e5                	mov    %esp,%ebp
8010345f:	83 ec 10             	sub    $0x10,%esp
80103462:	68 a0 6f 10 80       	push   $0x80106fa0
80103467:	68 20 1d 11 80       	push   $0x80111d20
8010346c:	e8 9b 0a 00 00       	call   80103f0c <initlock>
80103471:	83 c4 10             	add    $0x10,%esp
80103474:	c9                   	leave  
80103475:	c3                   	ret    
80103476:	66 90                	xchg   %ax,%ax

80103478 <mycpu>:
80103478:	55                   	push   %ebp
80103479:	89 e5                	mov    %esp,%ebp
8010347b:	56                   	push   %esi
8010347c:	53                   	push   %ebx
8010347d:	9c                   	pushf  
8010347e:	58                   	pop    %eax
8010347f:	f6 c4 02             	test   $0x2,%ah
80103482:	75 4b                	jne    801034cf <mycpu+0x57>
80103484:	e8 63 f1 ff ff       	call   801025ec <lapicid>
80103489:	89 c1                	mov    %eax,%ecx
8010348b:	8b 1d 84 17 11 80    	mov    0x80111784,%ebx
80103491:	85 db                	test   %ebx,%ebx
80103493:	7e 2d                	jle    801034c2 <mycpu+0x4a>
80103495:	31 d2                	xor    %edx,%edx
80103497:	eb 08                	jmp    801034a1 <mycpu+0x29>
80103499:	8d 76 00             	lea    0x0(%esi),%esi
8010349c:	42                   	inc    %edx
8010349d:	39 da                	cmp    %ebx,%edx
8010349f:	74 21                	je     801034c2 <mycpu+0x4a>
801034a1:	8d 04 92             	lea    (%edx,%edx,4),%eax
801034a4:	01 c0                	add    %eax,%eax
801034a6:	01 d0                	add    %edx,%eax
801034a8:	c1 e0 04             	shl    $0x4,%eax
801034ab:	0f b6 b0 a0 17 11 80 	movzbl -0x7feee860(%eax),%esi
801034b2:	39 ce                	cmp    %ecx,%esi
801034b4:	75 e6                	jne    8010349c <mycpu+0x24>
801034b6:	05 a0 17 11 80       	add    $0x801117a0,%eax
801034bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034be:	5b                   	pop    %ebx
801034bf:	5e                   	pop    %esi
801034c0:	5d                   	pop    %ebp
801034c1:	c3                   	ret    
801034c2:	83 ec 0c             	sub    $0xc,%esp
801034c5:	68 a7 6f 10 80       	push   $0x80106fa7
801034ca:	e8 69 ce ff ff       	call   80100338 <panic>
801034cf:	83 ec 0c             	sub    $0xc,%esp
801034d2:	68 84 70 10 80       	push   $0x80107084
801034d7:	e8 5c ce ff ff       	call   80100338 <panic>

801034dc <cpuid>:
801034dc:	55                   	push   %ebp
801034dd:	89 e5                	mov    %esp,%ebp
801034df:	83 ec 08             	sub    $0x8,%esp
801034e2:	e8 91 ff ff ff       	call   80103478 <mycpu>
801034e7:	2d a0 17 11 80       	sub    $0x801117a0,%eax
801034ec:	c1 f8 04             	sar    $0x4,%eax
801034ef:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
801034f2:	89 ca                	mov    %ecx,%edx
801034f4:	c1 e2 05             	shl    $0x5,%edx
801034f7:	29 ca                	sub    %ecx,%edx
801034f9:	8d 14 90             	lea    (%eax,%edx,4),%edx
801034fc:	8d 0c d0             	lea    (%eax,%edx,8),%ecx
801034ff:	89 ca                	mov    %ecx,%edx
80103501:	c1 e2 0f             	shl    $0xf,%edx
80103504:	29 ca                	sub    %ecx,%edx
80103506:	8d 04 90             	lea    (%eax,%edx,4),%eax
80103509:	f7 d8                	neg    %eax
8010350b:	c9                   	leave  
8010350c:	c3                   	ret    
8010350d:	8d 76 00             	lea    0x0(%esi),%esi

80103510 <myproc>:
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	53                   	push   %ebx
80103514:	50                   	push   %eax
80103515:	e8 6e 0a 00 00       	call   80103f88 <pushcli>
8010351a:	e8 59 ff ff ff       	call   80103478 <mycpu>
8010351f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103525:	e8 aa 0a 00 00       	call   80103fd4 <popcli>
8010352a:	89 d8                	mov    %ebx,%eax
8010352c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010352f:	c9                   	leave  
80103530:	c3                   	ret    
80103531:	8d 76 00             	lea    0x0(%esi),%esi

80103534 <userinit>:
80103534:	55                   	push   %ebp
80103535:	89 e5                	mov    %esp,%ebp
80103537:	53                   	push   %ebx
80103538:	51                   	push   %ecx
80103539:	e8 12 fe ff ff       	call   80103350 <allocproc>
8010353e:	89 c3                	mov    %eax,%ebx
80103540:	a3 54 41 11 80       	mov    %eax,0x80114154
80103545:	e8 0e 32 00 00       	call   80106758 <setupkvm>
8010354a:	89 43 04             	mov    %eax,0x4(%ebx)
8010354d:	85 c0                	test   %eax,%eax
8010354f:	0f 84 b3 00 00 00    	je     80103608 <userinit+0xd4>
80103555:	52                   	push   %edx
80103556:	68 2c 00 00 00       	push   $0x2c
8010355b:	68 60 a4 10 80       	push   $0x8010a460
80103560:	50                   	push   %eax
80103561:	e8 2e 2f 00 00       	call   80106494 <inituvm>
80103566:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
8010356c:	83 c4 0c             	add    $0xc,%esp
8010356f:	6a 4c                	push   $0x4c
80103571:	6a 00                	push   $0x0
80103573:	ff 73 18             	pushl  0x18(%ebx)
80103576:	e8 11 0c 00 00       	call   8010418c <memset>
8010357b:	8b 43 18             	mov    0x18(%ebx),%eax
8010357e:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
80103584:	8b 43 18             	mov    0x18(%ebx),%eax
80103587:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
8010358d:	8b 43 18             	mov    0x18(%ebx),%eax
80103590:	8b 50 2c             	mov    0x2c(%eax),%edx
80103593:	66 89 50 28          	mov    %dx,0x28(%eax)
80103597:	8b 43 18             	mov    0x18(%ebx),%eax
8010359a:	8b 50 2c             	mov    0x2c(%eax),%edx
8010359d:	66 89 50 48          	mov    %dx,0x48(%eax)
801035a1:	8b 43 18             	mov    0x18(%ebx),%eax
801035a4:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
801035ab:	8b 43 18             	mov    0x18(%ebx),%eax
801035ae:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
801035b5:	8b 43 18             	mov    0x18(%ebx),%eax
801035b8:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
801035bf:	83 c4 0c             	add    $0xc,%esp
801035c2:	6a 10                	push   $0x10
801035c4:	68 d0 6f 10 80       	push   $0x80106fd0
801035c9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801035cc:	50                   	push   %eax
801035cd:	e8 02 0d 00 00       	call   801042d4 <safestrcpy>
801035d2:	c7 04 24 d9 6f 10 80 	movl   $0x80106fd9,(%esp)
801035d9:	e8 c2 e8 ff ff       	call   80101ea0 <namei>
801035de:	89 43 68             	mov    %eax,0x68(%ebx)
801035e1:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801035e8:	e8 df 0a 00 00       	call   801040cc <acquire>
801035ed:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801035f4:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801035fb:	e8 6c 0a 00 00       	call   8010406c <release>
80103600:	83 c4 10             	add    $0x10,%esp
80103603:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103606:	c9                   	leave  
80103607:	c3                   	ret    
80103608:	83 ec 0c             	sub    $0xc,%esp
8010360b:	68 b7 6f 10 80       	push   $0x80106fb7
80103610:	e8 23 cd ff ff       	call   80100338 <panic>
80103615:	8d 76 00             	lea    0x0(%esi),%esi

80103618 <growproc>:
80103618:	55                   	push   %ebp
80103619:	89 e5                	mov    %esp,%ebp
8010361b:	56                   	push   %esi
8010361c:	53                   	push   %ebx
8010361d:	8b 75 08             	mov    0x8(%ebp),%esi
80103620:	e8 63 09 00 00       	call   80103f88 <pushcli>
80103625:	e8 4e fe ff ff       	call   80103478 <mycpu>
8010362a:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103630:	e8 9f 09 00 00       	call   80103fd4 <popcli>
80103635:	8b 03                	mov    (%ebx),%eax
80103637:	85 f6                	test   %esi,%esi
80103639:	7f 19                	jg     80103654 <growproc+0x3c>
8010363b:	75 33                	jne    80103670 <growproc+0x58>
8010363d:	89 03                	mov    %eax,(%ebx)
8010363f:	83 ec 0c             	sub    $0xc,%esp
80103642:	53                   	push   %ebx
80103643:	e8 50 2d 00 00       	call   80106398 <switchuvm>
80103648:	83 c4 10             	add    $0x10,%esp
8010364b:	31 c0                	xor    %eax,%eax
8010364d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103650:	5b                   	pop    %ebx
80103651:	5e                   	pop    %esi
80103652:	5d                   	pop    %ebp
80103653:	c3                   	ret    
80103654:	51                   	push   %ecx
80103655:	01 c6                	add    %eax,%esi
80103657:	56                   	push   %esi
80103658:	50                   	push   %eax
80103659:	ff 73 04             	pushl  0x4(%ebx)
8010365c:	e8 6b 2f 00 00       	call   801065cc <allocuvm>
80103661:	83 c4 10             	add    $0x10,%esp
80103664:	85 c0                	test   %eax,%eax
80103666:	75 d5                	jne    8010363d <growproc+0x25>
80103668:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010366d:	eb de                	jmp    8010364d <growproc+0x35>
8010366f:	90                   	nop
80103670:	52                   	push   %edx
80103671:	01 c6                	add    %eax,%esi
80103673:	56                   	push   %esi
80103674:	50                   	push   %eax
80103675:	ff 73 04             	pushl  0x4(%ebx)
80103678:	e8 4f 30 00 00       	call   801066cc <deallocuvm>
8010367d:	83 c4 10             	add    $0x10,%esp
80103680:	85 c0                	test   %eax,%eax
80103682:	75 b9                	jne    8010363d <growproc+0x25>
80103684:	eb e2                	jmp    80103668 <growproc+0x50>
80103686:	66 90                	xchg   %ax,%ax

80103688 <fork>:
80103688:	55                   	push   %ebp
80103689:	89 e5                	mov    %esp,%ebp
8010368b:	57                   	push   %edi
8010368c:	56                   	push   %esi
8010368d:	53                   	push   %ebx
8010368e:	83 ec 1c             	sub    $0x1c,%esp
80103691:	e8 f2 08 00 00       	call   80103f88 <pushcli>
80103696:	e8 dd fd ff ff       	call   80103478 <mycpu>
8010369b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801036a1:	e8 2e 09 00 00       	call   80103fd4 <popcli>
801036a6:	e8 a5 fc ff ff       	call   80103350 <allocproc>
801036ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801036ae:	85 c0                	test   %eax,%eax
801036b0:	0f 84 d4 00 00 00    	je     8010378a <fork+0x102>
801036b6:	89 c7                	mov    %eax,%edi
801036b8:	83 ec 08             	sub    $0x8,%esp
801036bb:	ff 33                	pushl  (%ebx)
801036bd:	ff 73 04             	pushl  0x4(%ebx)
801036c0:	e8 6b 31 00 00       	call   80106830 <copyuvm>
801036c5:	89 47 04             	mov    %eax,0x4(%edi)
801036c8:	83 c4 10             	add    $0x10,%esp
801036cb:	85 c0                	test   %eax,%eax
801036cd:	0f 84 98 00 00 00    	je     8010376b <fork+0xe3>
801036d3:	8b 03                	mov    (%ebx),%eax
801036d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801036d8:	89 01                	mov    %eax,(%ecx)
801036da:	89 c8                	mov    %ecx,%eax
801036dc:	89 59 14             	mov    %ebx,0x14(%ecx)
801036df:	8b 73 18             	mov    0x18(%ebx),%esi
801036e2:	8b 79 18             	mov    0x18(%ecx),%edi
801036e5:	b9 13 00 00 00       	mov    $0x13,%ecx
801036ea:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801036ec:	8b 40 18             	mov    0x18(%eax),%eax
801036ef:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801036f6:	31 f6                	xor    %esi,%esi
801036f8:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801036fc:	85 c0                	test   %eax,%eax
801036fe:	74 13                	je     80103713 <fork+0x8b>
80103700:	83 ec 0c             	sub    $0xc,%esp
80103703:	50                   	push   %eax
80103704:	e8 f7 d6 ff ff       	call   80100e00 <filedup>
80103709:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010370c:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103710:	83 c4 10             	add    $0x10,%esp
80103713:	46                   	inc    %esi
80103714:	83 fe 10             	cmp    $0x10,%esi
80103717:	75 df                	jne    801036f8 <fork+0x70>
80103719:	83 ec 0c             	sub    $0xc,%esp
8010371c:	ff 73 68             	pushl  0x68(%ebx)
8010371f:	e8 c4 de ff ff       	call   801015e8 <idup>
80103724:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103727:	89 47 68             	mov    %eax,0x68(%edi)
8010372a:	83 c4 0c             	add    $0xc,%esp
8010372d:	6a 10                	push   $0x10
8010372f:	83 c3 6c             	add    $0x6c,%ebx
80103732:	53                   	push   %ebx
80103733:	8d 47 6c             	lea    0x6c(%edi),%eax
80103736:	50                   	push   %eax
80103737:	e8 98 0b 00 00       	call   801042d4 <safestrcpy>
8010373c:	8b 5f 10             	mov    0x10(%edi),%ebx
8010373f:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103746:	e8 81 09 00 00       	call   801040cc <acquire>
8010374b:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103752:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103759:	e8 0e 09 00 00       	call   8010406c <release>
8010375e:	83 c4 10             	add    $0x10,%esp
80103761:	89 d8                	mov    %ebx,%eax
80103763:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103766:	5b                   	pop    %ebx
80103767:	5e                   	pop    %esi
80103768:	5f                   	pop    %edi
80103769:	5d                   	pop    %ebp
8010376a:	c3                   	ret    
8010376b:	83 ec 0c             	sub    $0xc,%esp
8010376e:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103771:	ff 73 08             	pushl  0x8(%ebx)
80103774:	e8 bf ea ff ff       	call   80102238 <kfree>
80103779:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103780:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103787:	83 c4 10             	add    $0x10,%esp
8010378a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010378f:	eb d0                	jmp    80103761 <fork+0xd9>
80103791:	8d 76 00             	lea    0x0(%esi),%esi

80103794 <scheduler>:
80103794:	55                   	push   %ebp
80103795:	89 e5                	mov    %esp,%ebp
80103797:	57                   	push   %edi
80103798:	56                   	push   %esi
80103799:	53                   	push   %ebx
8010379a:	83 ec 1c             	sub    $0x1c,%esp
8010379d:	e8 d6 fc ff ff       	call   80103478 <mycpu>
801037a2:	89 c3                	mov    %eax,%ebx
801037a4:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801037ab:	00 00 00 
801037ae:	8d 40 04             	lea    0x4(%eax),%eax
801037b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801037b4:	fb                   	sti    
801037b5:	83 ec 0c             	sub    $0xc,%esp
801037b8:	68 20 1d 11 80       	push   $0x80111d20
801037bd:	e8 0a 09 00 00       	call   801040cc <acquire>
801037c2:	83 c4 10             	add    $0x10,%esp
801037c5:	bf 54 1d 11 80       	mov    $0x80111d54,%edi
801037ca:	66 90                	xchg   %ax,%ax
801037cc:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
801037d0:	0f 85 8a 00 00 00    	jne    80103860 <scheduler+0xcc>
801037d6:	8b 15 60 41 11 80    	mov    0x80114160,%edx
801037dc:	89 d1                	mov    %edx,%ecx
801037de:	2b 4f 7c             	sub    0x7c(%edi),%ecx
801037e1:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
801037e7:	7e 0d                	jle    801037f6 <scheduler+0x62>
801037e9:	c7 87 84 00 00 00 00 	movl   $0x0,0x84(%edi)
801037f0:	00 00 00 
801037f3:	89 57 7c             	mov    %edx,0x7c(%edi)
801037f6:	8b 97 80 00 00 00    	mov    0x80(%edi),%edx
801037fc:	85 d2                	test   %edx,%edx
801037fe:	7e 0d                	jle    8010380d <scheduler+0x79>
80103800:	8d 14 92             	lea    (%edx,%edx,4),%edx
80103803:	01 d2                	add    %edx,%edx
80103805:	39 97 84 00 00 00    	cmp    %edx,0x84(%edi)
8010380b:	7d 53                	jge    80103860 <scheduler+0xcc>
8010380d:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
80103813:	83 ec 0c             	sub    $0xc,%esp
80103816:	57                   	push   %edi
80103817:	e8 7c 2b 00 00       	call   80106398 <switchuvm>
8010381c:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
80103823:	8b 35 60 41 11 80    	mov    0x80114160,%esi
80103829:	58                   	pop    %eax
8010382a:	5a                   	pop    %edx
8010382b:	ff 77 1c             	pushl  0x1c(%edi)
8010382e:	ff 75 e4             	pushl  -0x1c(%ebp)
80103831:	e8 eb 0a 00 00       	call   80104321 <swtch>
80103836:	e8 4d 2b 00 00       	call   80106388 <switchkvm>
8010383b:	83 c4 10             	add    $0x10,%esp
8010383e:	8b 8f 80 00 00 00    	mov    0x80(%edi),%ecx
80103844:	85 c9                	test   %ecx,%ecx
80103846:	7e 0e                	jle    80103856 <scheduler+0xc2>
80103848:	8b 15 60 41 11 80    	mov    0x80114160,%edx
8010384e:	29 f2                	sub    %esi,%edx
80103850:	01 97 84 00 00 00    	add    %edx,0x84(%edi)
80103856:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
8010385d:	00 00 00 
80103860:	81 c7 90 00 00 00    	add    $0x90,%edi
80103866:	81 ff 54 41 11 80    	cmp    $0x80114154,%edi
8010386c:	0f 85 5a ff ff ff    	jne    801037cc <scheduler+0x38>
80103872:	83 ec 0c             	sub    $0xc,%esp
80103875:	68 20 1d 11 80       	push   $0x80111d20
8010387a:	e8 ed 07 00 00       	call   8010406c <release>
8010387f:	83 c4 10             	add    $0x10,%esp
80103882:	e9 2d ff ff ff       	jmp    801037b4 <scheduler+0x20>
80103887:	90                   	nop

80103888 <sched>:
80103888:	55                   	push   %ebp
80103889:	89 e5                	mov    %esp,%ebp
8010388b:	56                   	push   %esi
8010388c:	53                   	push   %ebx
8010388d:	e8 f6 06 00 00       	call   80103f88 <pushcli>
80103892:	e8 e1 fb ff ff       	call   80103478 <mycpu>
80103897:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010389d:	e8 32 07 00 00       	call   80103fd4 <popcli>
801038a2:	83 ec 0c             	sub    $0xc,%esp
801038a5:	68 20 1d 11 80       	push   $0x80111d20
801038aa:	e8 7d 07 00 00       	call   8010402c <holding>
801038af:	83 c4 10             	add    $0x10,%esp
801038b2:	85 c0                	test   %eax,%eax
801038b4:	74 4f                	je     80103905 <sched+0x7d>
801038b6:	e8 bd fb ff ff       	call   80103478 <mycpu>
801038bb:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
801038c2:	75 68                	jne    8010392c <sched+0xa4>
801038c4:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
801038c8:	74 55                	je     8010391f <sched+0x97>
801038ca:	9c                   	pushf  
801038cb:	58                   	pop    %eax
801038cc:	f6 c4 02             	test   $0x2,%ah
801038cf:	75 41                	jne    80103912 <sched+0x8a>
801038d1:	e8 a2 fb ff ff       	call   80103478 <mycpu>
801038d6:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
801038dc:	e8 97 fb ff ff       	call   80103478 <mycpu>
801038e1:	83 ec 08             	sub    $0x8,%esp
801038e4:	ff 70 04             	pushl  0x4(%eax)
801038e7:	83 c3 1c             	add    $0x1c,%ebx
801038ea:	53                   	push   %ebx
801038eb:	e8 31 0a 00 00       	call   80104321 <swtch>
801038f0:	e8 83 fb ff ff       	call   80103478 <mycpu>
801038f5:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
801038fb:	83 c4 10             	add    $0x10,%esp
801038fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103901:	5b                   	pop    %ebx
80103902:	5e                   	pop    %esi
80103903:	5d                   	pop    %ebp
80103904:	c3                   	ret    
80103905:	83 ec 0c             	sub    $0xc,%esp
80103908:	68 db 6f 10 80       	push   $0x80106fdb
8010390d:	e8 26 ca ff ff       	call   80100338 <panic>
80103912:	83 ec 0c             	sub    $0xc,%esp
80103915:	68 07 70 10 80       	push   $0x80107007
8010391a:	e8 19 ca ff ff       	call   80100338 <panic>
8010391f:	83 ec 0c             	sub    $0xc,%esp
80103922:	68 f9 6f 10 80       	push   $0x80106ff9
80103927:	e8 0c ca ff ff       	call   80100338 <panic>
8010392c:	83 ec 0c             	sub    $0xc,%esp
8010392f:	68 ed 6f 10 80       	push   $0x80106fed
80103934:	e8 ff c9 ff ff       	call   80100338 <panic>
80103939:	8d 76 00             	lea    0x0(%esi),%esi

8010393c <exit>:
8010393c:	55                   	push   %ebp
8010393d:	89 e5                	mov    %esp,%ebp
8010393f:	57                   	push   %edi
80103940:	56                   	push   %esi
80103941:	53                   	push   %ebx
80103942:	83 ec 0c             	sub    $0xc,%esp
80103945:	e8 c6 fb ff ff       	call   80103510 <myproc>
8010394a:	39 05 54 41 11 80    	cmp    %eax,0x80114154
80103950:	0f 84 f3 00 00 00    	je     80103a49 <exit+0x10d>
80103956:	89 c3                	mov    %eax,%ebx
80103958:	8d 70 28             	lea    0x28(%eax),%esi
8010395b:	8d 78 68             	lea    0x68(%eax),%edi
8010395e:	66 90                	xchg   %ax,%ax
80103960:	8b 06                	mov    (%esi),%eax
80103962:	85 c0                	test   %eax,%eax
80103964:	74 12                	je     80103978 <exit+0x3c>
80103966:	83 ec 0c             	sub    $0xc,%esp
80103969:	50                   	push   %eax
8010396a:	e8 d5 d4 ff ff       	call   80100e44 <fileclose>
8010396f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103975:	83 c4 10             	add    $0x10,%esp
80103978:	83 c6 04             	add    $0x4,%esi
8010397b:	39 f7                	cmp    %esi,%edi
8010397d:	75 e1                	jne    80103960 <exit+0x24>
8010397f:	e8 48 f0 ff ff       	call   801029cc <begin_op>
80103984:	83 ec 0c             	sub    $0xc,%esp
80103987:	ff 73 68             	pushl  0x68(%ebx)
8010398a:	e8 91 dd ff ff       	call   80101720 <iput>
8010398f:	e8 a0 f0 ff ff       	call   80102a34 <end_op>
80103994:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
8010399b:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801039a2:	e8 25 07 00 00       	call   801040cc <acquire>
801039a7:	8b 53 14             	mov    0x14(%ebx),%edx
801039aa:	83 c4 10             	add    $0x10,%esp
801039ad:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801039b2:	eb 0c                	jmp    801039c0 <exit+0x84>
801039b4:	05 90 00 00 00       	add    $0x90,%eax
801039b9:	3d 54 41 11 80       	cmp    $0x80114154,%eax
801039be:	74 1e                	je     801039de <exit+0xa2>
801039c0:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801039c4:	75 ee                	jne    801039b4 <exit+0x78>
801039c6:	3b 50 20             	cmp    0x20(%eax),%edx
801039c9:	75 e9                	jne    801039b4 <exit+0x78>
801039cb:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801039d2:	05 90 00 00 00       	add    $0x90,%eax
801039d7:	3d 54 41 11 80       	cmp    $0x80114154,%eax
801039dc:	75 e2                	jne    801039c0 <exit+0x84>
801039de:	8b 0d 54 41 11 80    	mov    0x80114154,%ecx
801039e4:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
801039e9:	eb 0f                	jmp    801039fa <exit+0xbe>
801039eb:	90                   	nop
801039ec:	81 c2 90 00 00 00    	add    $0x90,%edx
801039f2:	81 fa 54 41 11 80    	cmp    $0x80114154,%edx
801039f8:	74 36                	je     80103a30 <exit+0xf4>
801039fa:	39 5a 14             	cmp    %ebx,0x14(%edx)
801039fd:	75 ed                	jne    801039ec <exit+0xb0>
801039ff:	89 4a 14             	mov    %ecx,0x14(%edx)
80103a02:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103a06:	75 e4                	jne    801039ec <exit+0xb0>
80103a08:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103a0d:	eb 0d                	jmp    80103a1c <exit+0xe0>
80103a0f:	90                   	nop
80103a10:	05 90 00 00 00       	add    $0x90,%eax
80103a15:	3d 54 41 11 80       	cmp    $0x80114154,%eax
80103a1a:	74 d0                	je     801039ec <exit+0xb0>
80103a1c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103a20:	75 ee                	jne    80103a10 <exit+0xd4>
80103a22:	3b 48 20             	cmp    0x20(%eax),%ecx
80103a25:	75 e9                	jne    80103a10 <exit+0xd4>
80103a27:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103a2e:	eb e0                	jmp    80103a10 <exit+0xd4>
80103a30:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
80103a37:	e8 4c fe ff ff       	call   80103888 <sched>
80103a3c:	83 ec 0c             	sub    $0xc,%esp
80103a3f:	68 28 70 10 80       	push   $0x80107028
80103a44:	e8 ef c8 ff ff       	call   80100338 <panic>
80103a49:	83 ec 0c             	sub    $0xc,%esp
80103a4c:	68 1b 70 10 80       	push   $0x8010701b
80103a51:	e8 e2 c8 ff ff       	call   80100338 <panic>
80103a56:	66 90                	xchg   %ax,%ax

80103a58 <wait>:
80103a58:	55                   	push   %ebp
80103a59:	89 e5                	mov    %esp,%ebp
80103a5b:	56                   	push   %esi
80103a5c:	53                   	push   %ebx
80103a5d:	e8 26 05 00 00       	call   80103f88 <pushcli>
80103a62:	e8 11 fa ff ff       	call   80103478 <mycpu>
80103a67:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103a6d:	e8 62 05 00 00       	call   80103fd4 <popcli>
80103a72:	83 ec 0c             	sub    $0xc,%esp
80103a75:	68 20 1d 11 80       	push   $0x80111d20
80103a7a:	e8 4d 06 00 00       	call   801040cc <acquire>
80103a7f:	83 c4 10             	add    $0x10,%esp
80103a82:	31 c0                	xor    %eax,%eax
80103a84:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103a89:	eb 0f                	jmp    80103a9a <wait+0x42>
80103a8b:	90                   	nop
80103a8c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103a92:	81 fb 54 41 11 80    	cmp    $0x80114154,%ebx
80103a98:	74 1e                	je     80103ab8 <wait+0x60>
80103a9a:	39 73 14             	cmp    %esi,0x14(%ebx)
80103a9d:	75 ed                	jne    80103a8c <wait+0x34>
80103a9f:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103aa3:	74 5b                	je     80103b00 <wait+0xa8>
80103aa5:	b8 01 00 00 00       	mov    $0x1,%eax
80103aaa:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103ab0:	81 fb 54 41 11 80    	cmp    $0x80114154,%ebx
80103ab6:	75 e2                	jne    80103a9a <wait+0x42>
80103ab8:	85 c0                	test   %eax,%eax
80103aba:	0f 84 96 00 00 00    	je     80103b56 <wait+0xfe>
80103ac0:	8b 46 24             	mov    0x24(%esi),%eax
80103ac3:	85 c0                	test   %eax,%eax
80103ac5:	0f 85 8b 00 00 00    	jne    80103b56 <wait+0xfe>
80103acb:	e8 b8 04 00 00       	call   80103f88 <pushcli>
80103ad0:	e8 a3 f9 ff ff       	call   80103478 <mycpu>
80103ad5:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103adb:	e8 f4 04 00 00       	call   80103fd4 <popcli>
80103ae0:	85 db                	test   %ebx,%ebx
80103ae2:	0f 84 85 00 00 00    	je     80103b6d <wait+0x115>
80103ae8:	89 73 20             	mov    %esi,0x20(%ebx)
80103aeb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103af2:	e8 91 fd ff ff       	call   80103888 <sched>
80103af7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103afe:	eb 82                	jmp    80103a82 <wait+0x2a>
80103b00:	8b 73 10             	mov    0x10(%ebx),%esi
80103b03:	83 ec 0c             	sub    $0xc,%esp
80103b06:	ff 73 08             	pushl  0x8(%ebx)
80103b09:	e8 2a e7 ff ff       	call   80102238 <kfree>
80103b0e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103b15:	5a                   	pop    %edx
80103b16:	ff 73 04             	pushl  0x4(%ebx)
80103b19:	e8 ca 2b 00 00       	call   801066e8 <freevm>
80103b1e:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103b25:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103b2c:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103b30:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103b37:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103b3e:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103b45:	e8 22 05 00 00       	call   8010406c <release>
80103b4a:	83 c4 10             	add    $0x10,%esp
80103b4d:	89 f0                	mov    %esi,%eax
80103b4f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b52:	5b                   	pop    %ebx
80103b53:	5e                   	pop    %esi
80103b54:	5d                   	pop    %ebp
80103b55:	c3                   	ret    
80103b56:	83 ec 0c             	sub    $0xc,%esp
80103b59:	68 20 1d 11 80       	push   $0x80111d20
80103b5e:	e8 09 05 00 00       	call   8010406c <release>
80103b63:	83 c4 10             	add    $0x10,%esp
80103b66:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103b6b:	eb e0                	jmp    80103b4d <wait+0xf5>
80103b6d:	83 ec 0c             	sub    $0xc,%esp
80103b70:	68 34 70 10 80       	push   $0x80107034
80103b75:	e8 be c7 ff ff       	call   80100338 <panic>
80103b7a:	66 90                	xchg   %ax,%ax

80103b7c <yield>:
80103b7c:	55                   	push   %ebp
80103b7d:	89 e5                	mov    %esp,%ebp
80103b7f:	53                   	push   %ebx
80103b80:	83 ec 10             	sub    $0x10,%esp
80103b83:	68 20 1d 11 80       	push   $0x80111d20
80103b88:	e8 3f 05 00 00       	call   801040cc <acquire>
80103b8d:	e8 f6 03 00 00       	call   80103f88 <pushcli>
80103b92:	e8 e1 f8 ff ff       	call   80103478 <mycpu>
80103b97:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103b9d:	e8 32 04 00 00       	call   80103fd4 <popcli>
80103ba2:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103ba9:	e8 da fc ff ff       	call   80103888 <sched>
80103bae:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103bb5:	e8 b2 04 00 00       	call   8010406c <release>
80103bba:	83 c4 10             	add    $0x10,%esp
80103bbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103bc0:	c9                   	leave  
80103bc1:	c3                   	ret    
80103bc2:	66 90                	xchg   %ax,%ax

80103bc4 <sleep>:
80103bc4:	55                   	push   %ebp
80103bc5:	89 e5                	mov    %esp,%ebp
80103bc7:	57                   	push   %edi
80103bc8:	56                   	push   %esi
80103bc9:	53                   	push   %ebx
80103bca:	83 ec 0c             	sub    $0xc,%esp
80103bcd:	8b 7d 08             	mov    0x8(%ebp),%edi
80103bd0:	8b 75 0c             	mov    0xc(%ebp),%esi
80103bd3:	e8 b0 03 00 00       	call   80103f88 <pushcli>
80103bd8:	e8 9b f8 ff ff       	call   80103478 <mycpu>
80103bdd:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103be3:	e8 ec 03 00 00       	call   80103fd4 <popcli>
80103be8:	85 db                	test   %ebx,%ebx
80103bea:	0f 84 83 00 00 00    	je     80103c73 <sleep+0xaf>
80103bf0:	85 f6                	test   %esi,%esi
80103bf2:	74 72                	je     80103c66 <sleep+0xa2>
80103bf4:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
80103bfa:	74 4c                	je     80103c48 <sleep+0x84>
80103bfc:	83 ec 0c             	sub    $0xc,%esp
80103bff:	68 20 1d 11 80       	push   $0x80111d20
80103c04:	e8 c3 04 00 00       	call   801040cc <acquire>
80103c09:	89 34 24             	mov    %esi,(%esp)
80103c0c:	e8 5b 04 00 00       	call   8010406c <release>
80103c11:	89 7b 20             	mov    %edi,0x20(%ebx)
80103c14:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103c1b:	e8 68 fc ff ff       	call   80103888 <sched>
80103c20:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103c27:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103c2e:	e8 39 04 00 00       	call   8010406c <release>
80103c33:	83 c4 10             	add    $0x10,%esp
80103c36:	89 75 08             	mov    %esi,0x8(%ebp)
80103c39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103c3c:	5b                   	pop    %ebx
80103c3d:	5e                   	pop    %esi
80103c3e:	5f                   	pop    %edi
80103c3f:	5d                   	pop    %ebp
80103c40:	e9 87 04 00 00       	jmp    801040cc <acquire>
80103c45:	8d 76 00             	lea    0x0(%esi),%esi
80103c48:	89 7b 20             	mov    %edi,0x20(%ebx)
80103c4b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103c52:	e8 31 fc ff ff       	call   80103888 <sched>
80103c57:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103c5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103c61:	5b                   	pop    %ebx
80103c62:	5e                   	pop    %esi
80103c63:	5f                   	pop    %edi
80103c64:	5d                   	pop    %ebp
80103c65:	c3                   	ret    
80103c66:	83 ec 0c             	sub    $0xc,%esp
80103c69:	68 3a 70 10 80       	push   $0x8010703a
80103c6e:	e8 c5 c6 ff ff       	call   80100338 <panic>
80103c73:	83 ec 0c             	sub    $0xc,%esp
80103c76:	68 34 70 10 80       	push   $0x80107034
80103c7b:	e8 b8 c6 ff ff       	call   80100338 <panic>

80103c80 <wakeup>:
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	53                   	push   %ebx
80103c84:	83 ec 10             	sub    $0x10,%esp
80103c87:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c8a:	68 20 1d 11 80       	push   $0x80111d20
80103c8f:	e8 38 04 00 00       	call   801040cc <acquire>
80103c94:	83 c4 10             	add    $0x10,%esp
80103c97:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103c9c:	eb 0e                	jmp    80103cac <wakeup+0x2c>
80103c9e:	66 90                	xchg   %ax,%ax
80103ca0:	05 90 00 00 00       	add    $0x90,%eax
80103ca5:	3d 54 41 11 80       	cmp    $0x80114154,%eax
80103caa:	74 1e                	je     80103cca <wakeup+0x4a>
80103cac:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cb0:	75 ee                	jne    80103ca0 <wakeup+0x20>
80103cb2:	3b 58 20             	cmp    0x20(%eax),%ebx
80103cb5:	75 e9                	jne    80103ca0 <wakeup+0x20>
80103cb7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cbe:	05 90 00 00 00       	add    $0x90,%eax
80103cc3:	3d 54 41 11 80       	cmp    $0x80114154,%eax
80103cc8:	75 e2                	jne    80103cac <wakeup+0x2c>
80103cca:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
80103cd1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cd4:	c9                   	leave  
80103cd5:	e9 92 03 00 00       	jmp    8010406c <release>
80103cda:	66 90                	xchg   %ax,%ax

80103cdc <kill>:
80103cdc:	55                   	push   %ebp
80103cdd:	89 e5                	mov    %esp,%ebp
80103cdf:	53                   	push   %ebx
80103ce0:	83 ec 10             	sub    $0x10,%esp
80103ce3:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103ce6:	68 20 1d 11 80       	push   $0x80111d20
80103ceb:	e8 dc 03 00 00       	call   801040cc <acquire>
80103cf0:	83 c4 10             	add    $0x10,%esp
80103cf3:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103cf8:	eb 0e                	jmp    80103d08 <kill+0x2c>
80103cfa:	66 90                	xchg   %ax,%ax
80103cfc:	05 90 00 00 00       	add    $0x90,%eax
80103d01:	3d 54 41 11 80       	cmp    $0x80114154,%eax
80103d06:	74 30                	je     80103d38 <kill+0x5c>
80103d08:	39 58 10             	cmp    %ebx,0x10(%eax)
80103d0b:	75 ef                	jne    80103cfc <kill+0x20>
80103d0d:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80103d14:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d18:	75 07                	jne    80103d21 <kill+0x45>
80103d1a:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d21:	83 ec 0c             	sub    $0xc,%esp
80103d24:	68 20 1d 11 80       	push   $0x80111d20
80103d29:	e8 3e 03 00 00       	call   8010406c <release>
80103d2e:	83 c4 10             	add    $0x10,%esp
80103d31:	31 c0                	xor    %eax,%eax
80103d33:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d36:	c9                   	leave  
80103d37:	c3                   	ret    
80103d38:	83 ec 0c             	sub    $0xc,%esp
80103d3b:	68 20 1d 11 80       	push   $0x80111d20
80103d40:	e8 27 03 00 00       	call   8010406c <release>
80103d45:	83 c4 10             	add    $0x10,%esp
80103d48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103d4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d50:	c9                   	leave  
80103d51:	c3                   	ret    
80103d52:	66 90                	xchg   %ax,%ax

80103d54 <procdump>:
80103d54:	55                   	push   %ebp
80103d55:	89 e5                	mov    %esp,%ebp
80103d57:	57                   	push   %edi
80103d58:	56                   	push   %esi
80103d59:	53                   	push   %ebx
80103d5a:	83 ec 3c             	sub    $0x3c,%esp
80103d5d:	bb c0 1d 11 80       	mov    $0x80111dc0,%ebx
80103d62:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103d65:	eb 42                	jmp    80103da9 <procdump+0x55>
80103d67:	90                   	nop
80103d68:	8b 04 85 ac 70 10 80 	mov    -0x7fef8f54(,%eax,4),%eax
80103d6f:	85 c0                	test   %eax,%eax
80103d71:	74 42                	je     80103db5 <procdump+0x61>
80103d73:	53                   	push   %ebx
80103d74:	50                   	push   %eax
80103d75:	ff 73 a4             	pushl  -0x5c(%ebx)
80103d78:	68 4f 70 10 80       	push   $0x8010704f
80103d7d:	e8 a6 c8 ff ff       	call   80100628 <cprintf>
80103d82:	83 c4 10             	add    $0x10,%esp
80103d85:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80103d89:	74 31                	je     80103dbc <procdump+0x68>
80103d8b:	83 ec 0c             	sub    $0xc,%esp
80103d8e:	68 2b 74 10 80       	push   $0x8010742b
80103d93:	e8 90 c8 ff ff       	call   80100628 <cprintf>
80103d98:	83 c4 10             	add    $0x10,%esp
80103d9b:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103da1:	81 fb c0 41 11 80    	cmp    $0x801141c0,%ebx
80103da7:	74 4f                	je     80103df8 <procdump+0xa4>
80103da9:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103dac:	85 c0                	test   %eax,%eax
80103dae:	74 eb                	je     80103d9b <procdump+0x47>
80103db0:	83 f8 05             	cmp    $0x5,%eax
80103db3:	76 b3                	jbe    80103d68 <procdump+0x14>
80103db5:	b8 4b 70 10 80       	mov    $0x8010704b,%eax
80103dba:	eb b7                	jmp    80103d73 <procdump+0x1f>
80103dbc:	83 ec 08             	sub    $0x8,%esp
80103dbf:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103dc2:	50                   	push   %eax
80103dc3:	8b 43 b0             	mov    -0x50(%ebx),%eax
80103dc6:	8b 40 0c             	mov    0xc(%eax),%eax
80103dc9:	83 c0 08             	add    $0x8,%eax
80103dcc:	50                   	push   %eax
80103dcd:	e8 56 01 00 00       	call   80103f28 <getcallerpcs>
80103dd2:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103dd5:	83 c4 10             	add    $0x10,%esp
80103dd8:	8b 17                	mov    (%edi),%edx
80103dda:	85 d2                	test   %edx,%edx
80103ddc:	74 ad                	je     80103d8b <procdump+0x37>
80103dde:	83 ec 08             	sub    $0x8,%esp
80103de1:	52                   	push   %edx
80103de2:	68 a1 6a 10 80       	push   $0x80106aa1
80103de7:	e8 3c c8 ff ff       	call   80100628 <cprintf>
80103dec:	83 c7 04             	add    $0x4,%edi
80103def:	83 c4 10             	add    $0x10,%esp
80103df2:	39 f7                	cmp    %esi,%edi
80103df4:	75 e2                	jne    80103dd8 <procdump+0x84>
80103df6:	eb 93                	jmp    80103d8b <procdump+0x37>
80103df8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dfb:	5b                   	pop    %ebx
80103dfc:	5e                   	pop    %esi
80103dfd:	5f                   	pop    %edi
80103dfe:	5d                   	pop    %ebp
80103dff:	c3                   	ret    

80103e00 <initsleeplock>:
80103e00:	55                   	push   %ebp
80103e01:	89 e5                	mov    %esp,%ebp
80103e03:	53                   	push   %ebx
80103e04:	83 ec 0c             	sub    $0xc,%esp
80103e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e0a:	68 c4 70 10 80       	push   $0x801070c4
80103e0f:	8d 43 04             	lea    0x4(%ebx),%eax
80103e12:	50                   	push   %eax
80103e13:	e8 f4 00 00 00       	call   80103f0c <initlock>
80103e18:	8b 45 0c             	mov    0xc(%ebp),%eax
80103e1b:	89 43 38             	mov    %eax,0x38(%ebx)
80103e1e:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103e24:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103e2b:	83 c4 10             	add    $0x10,%esp
80103e2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e31:	c9                   	leave  
80103e32:	c3                   	ret    
80103e33:	90                   	nop

80103e34 <acquiresleep>:
80103e34:	55                   	push   %ebp
80103e35:	89 e5                	mov    %esp,%ebp
80103e37:	56                   	push   %esi
80103e38:	53                   	push   %ebx
80103e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e3c:	8d 73 04             	lea    0x4(%ebx),%esi
80103e3f:	83 ec 0c             	sub    $0xc,%esp
80103e42:	56                   	push   %esi
80103e43:	e8 84 02 00 00       	call   801040cc <acquire>
80103e48:	83 c4 10             	add    $0x10,%esp
80103e4b:	8b 13                	mov    (%ebx),%edx
80103e4d:	85 d2                	test   %edx,%edx
80103e4f:	74 16                	je     80103e67 <acquiresleep+0x33>
80103e51:	8d 76 00             	lea    0x0(%esi),%esi
80103e54:	83 ec 08             	sub    $0x8,%esp
80103e57:	56                   	push   %esi
80103e58:	53                   	push   %ebx
80103e59:	e8 66 fd ff ff       	call   80103bc4 <sleep>
80103e5e:	83 c4 10             	add    $0x10,%esp
80103e61:	8b 03                	mov    (%ebx),%eax
80103e63:	85 c0                	test   %eax,%eax
80103e65:	75 ed                	jne    80103e54 <acquiresleep+0x20>
80103e67:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80103e6d:	e8 9e f6 ff ff       	call   80103510 <myproc>
80103e72:	8b 40 10             	mov    0x10(%eax),%eax
80103e75:	89 43 3c             	mov    %eax,0x3c(%ebx)
80103e78:	89 75 08             	mov    %esi,0x8(%ebp)
80103e7b:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e7e:	5b                   	pop    %ebx
80103e7f:	5e                   	pop    %esi
80103e80:	5d                   	pop    %ebp
80103e81:	e9 e6 01 00 00       	jmp    8010406c <release>
80103e86:	66 90                	xchg   %ax,%ax

80103e88 <releasesleep>:
80103e88:	55                   	push   %ebp
80103e89:	89 e5                	mov    %esp,%ebp
80103e8b:	56                   	push   %esi
80103e8c:	53                   	push   %ebx
80103e8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e90:	8d 73 04             	lea    0x4(%ebx),%esi
80103e93:	83 ec 0c             	sub    $0xc,%esp
80103e96:	56                   	push   %esi
80103e97:	e8 30 02 00 00       	call   801040cc <acquire>
80103e9c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103ea2:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103ea9:	89 1c 24             	mov    %ebx,(%esp)
80103eac:	e8 cf fd ff ff       	call   80103c80 <wakeup>
80103eb1:	83 c4 10             	add    $0x10,%esp
80103eb4:	89 75 08             	mov    %esi,0x8(%ebp)
80103eb7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eba:	5b                   	pop    %ebx
80103ebb:	5e                   	pop    %esi
80103ebc:	5d                   	pop    %ebp
80103ebd:	e9 aa 01 00 00       	jmp    8010406c <release>
80103ec2:	66 90                	xchg   %ax,%ax

80103ec4 <holdingsleep>:
80103ec4:	55                   	push   %ebp
80103ec5:	89 e5                	mov    %esp,%ebp
80103ec7:	56                   	push   %esi
80103ec8:	53                   	push   %ebx
80103ec9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103ecc:	8d 73 04             	lea    0x4(%ebx),%esi
80103ecf:	83 ec 0c             	sub    $0xc,%esp
80103ed2:	56                   	push   %esi
80103ed3:	e8 f4 01 00 00       	call   801040cc <acquire>
80103ed8:	83 c4 10             	add    $0x10,%esp
80103edb:	8b 03                	mov    (%ebx),%eax
80103edd:	85 c0                	test   %eax,%eax
80103edf:	75 17                	jne    80103ef8 <holdingsleep+0x34>
80103ee1:	31 db                	xor    %ebx,%ebx
80103ee3:	83 ec 0c             	sub    $0xc,%esp
80103ee6:	56                   	push   %esi
80103ee7:	e8 80 01 00 00       	call   8010406c <release>
80103eec:	89 d8                	mov    %ebx,%eax
80103eee:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ef1:	5b                   	pop    %ebx
80103ef2:	5e                   	pop    %esi
80103ef3:	5d                   	pop    %ebp
80103ef4:	c3                   	ret    
80103ef5:	8d 76 00             	lea    0x0(%esi),%esi
80103ef8:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103efb:	e8 10 f6 ff ff       	call   80103510 <myproc>
80103f00:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f03:	0f 94 c3             	sete   %bl
80103f06:	0f b6 db             	movzbl %bl,%ebx
80103f09:	eb d8                	jmp    80103ee3 <holdingsleep+0x1f>
80103f0b:	90                   	nop

80103f0c <initlock>:
80103f0c:	55                   	push   %ebp
80103f0d:	89 e5                	mov    %esp,%ebp
80103f0f:	8b 45 08             	mov    0x8(%ebp),%eax
80103f12:	8b 55 0c             	mov    0xc(%ebp),%edx
80103f15:	89 50 04             	mov    %edx,0x4(%eax)
80103f18:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103f1e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103f25:	5d                   	pop    %ebp
80103f26:	c3                   	ret    
80103f27:	90                   	nop

80103f28 <getcallerpcs>:
80103f28:	55                   	push   %ebp
80103f29:	89 e5                	mov    %esp,%ebp
80103f2b:	53                   	push   %ebx
80103f2c:	8b 45 08             	mov    0x8(%ebp),%eax
80103f2f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103f32:	8d 50 f8             	lea    -0x8(%eax),%edx
80103f35:	05 f8 ff ff 7f       	add    $0x7ffffff8,%eax
80103f3a:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
80103f3f:	b8 00 00 00 00       	mov    $0x0,%eax
80103f44:	76 10                	jbe    80103f56 <getcallerpcs+0x2e>
80103f46:	eb 24                	jmp    80103f6c <getcallerpcs+0x44>
80103f48:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103f4e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103f54:	77 16                	ja     80103f6c <getcallerpcs+0x44>
80103f56:	8b 5a 04             	mov    0x4(%edx),%ebx
80103f59:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80103f5c:	8b 12                	mov    (%edx),%edx
80103f5e:	40                   	inc    %eax
80103f5f:	83 f8 0a             	cmp    $0xa,%eax
80103f62:	75 e4                	jne    80103f48 <getcallerpcs+0x20>
80103f64:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f67:	c9                   	leave  
80103f68:	c3                   	ret    
80103f69:	8d 76 00             	lea    0x0(%esi),%esi
80103f6c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
80103f6f:	8d 51 28             	lea    0x28(%ecx),%edx
80103f72:	66 90                	xchg   %ax,%ax
80103f74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103f7a:	83 c0 04             	add    $0x4,%eax
80103f7d:	39 d0                	cmp    %edx,%eax
80103f7f:	75 f3                	jne    80103f74 <getcallerpcs+0x4c>
80103f81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f84:	c9                   	leave  
80103f85:	c3                   	ret    
80103f86:	66 90                	xchg   %ax,%ax

80103f88 <pushcli>:
80103f88:	55                   	push   %ebp
80103f89:	89 e5                	mov    %esp,%ebp
80103f8b:	53                   	push   %ebx
80103f8c:	50                   	push   %eax
80103f8d:	9c                   	pushf  
80103f8e:	5b                   	pop    %ebx
80103f8f:	fa                   	cli    
80103f90:	e8 e3 f4 ff ff       	call   80103478 <mycpu>
80103f95:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80103f9b:	85 d2                	test   %edx,%edx
80103f9d:	74 11                	je     80103fb0 <pushcli+0x28>
80103f9f:	e8 d4 f4 ff ff       	call   80103478 <mycpu>
80103fa4:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
80103faa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fad:	c9                   	leave  
80103fae:	c3                   	ret    
80103faf:	90                   	nop
80103fb0:	e8 c3 f4 ff ff       	call   80103478 <mycpu>
80103fb5:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103fbb:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103fc1:	e8 b2 f4 ff ff       	call   80103478 <mycpu>
80103fc6:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
80103fcc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fcf:	c9                   	leave  
80103fd0:	c3                   	ret    
80103fd1:	8d 76 00             	lea    0x0(%esi),%esi

80103fd4 <popcli>:
80103fd4:	55                   	push   %ebp
80103fd5:	89 e5                	mov    %esp,%ebp
80103fd7:	83 ec 08             	sub    $0x8,%esp
80103fda:	9c                   	pushf  
80103fdb:	58                   	pop    %eax
80103fdc:	f6 c4 02             	test   $0x2,%ah
80103fdf:	75 31                	jne    80104012 <popcli+0x3e>
80103fe1:	e8 92 f4 ff ff       	call   80103478 <mycpu>
80103fe6:	ff 88 a4 00 00 00    	decl   0xa4(%eax)
80103fec:	78 31                	js     8010401f <popcli+0x4b>
80103fee:	e8 85 f4 ff ff       	call   80103478 <mycpu>
80103ff3:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80103ff9:	85 d2                	test   %edx,%edx
80103ffb:	74 03                	je     80104000 <popcli+0x2c>
80103ffd:	c9                   	leave  
80103ffe:	c3                   	ret    
80103fff:	90                   	nop
80104000:	e8 73 f4 ff ff       	call   80103478 <mycpu>
80104005:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010400b:	85 c0                	test   %eax,%eax
8010400d:	74 ee                	je     80103ffd <popcli+0x29>
8010400f:	fb                   	sti    
80104010:	c9                   	leave  
80104011:	c3                   	ret    
80104012:	83 ec 0c             	sub    $0xc,%esp
80104015:	68 cf 70 10 80       	push   $0x801070cf
8010401a:	e8 19 c3 ff ff       	call   80100338 <panic>
8010401f:	83 ec 0c             	sub    $0xc,%esp
80104022:	68 e6 70 10 80       	push   $0x801070e6
80104027:	e8 0c c3 ff ff       	call   80100338 <panic>

8010402c <holding>:
8010402c:	55                   	push   %ebp
8010402d:	89 e5                	mov    %esp,%ebp
8010402f:	53                   	push   %ebx
80104030:	50                   	push   %eax
80104031:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104034:	e8 4f ff ff ff       	call   80103f88 <pushcli>
80104039:	8b 13                	mov    (%ebx),%edx
8010403b:	85 d2                	test   %edx,%edx
8010403d:	75 11                	jne    80104050 <holding+0x24>
8010403f:	31 db                	xor    %ebx,%ebx
80104041:	e8 8e ff ff ff       	call   80103fd4 <popcli>
80104046:	89 d8                	mov    %ebx,%eax
80104048:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010404b:	c9                   	leave  
8010404c:	c3                   	ret    
8010404d:	8d 76 00             	lea    0x0(%esi),%esi
80104050:	8b 5b 08             	mov    0x8(%ebx),%ebx
80104053:	e8 20 f4 ff ff       	call   80103478 <mycpu>
80104058:	39 c3                	cmp    %eax,%ebx
8010405a:	0f 94 c3             	sete   %bl
8010405d:	0f b6 db             	movzbl %bl,%ebx
80104060:	e8 6f ff ff ff       	call   80103fd4 <popcli>
80104065:	89 d8                	mov    %ebx,%eax
80104067:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010406a:	c9                   	leave  
8010406b:	c3                   	ret    

8010406c <release>:
8010406c:	55                   	push   %ebp
8010406d:	89 e5                	mov    %esp,%ebp
8010406f:	56                   	push   %esi
80104070:	53                   	push   %ebx
80104071:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104074:	e8 0f ff ff ff       	call   80103f88 <pushcli>
80104079:	8b 03                	mov    (%ebx),%eax
8010407b:	85 c0                	test   %eax,%eax
8010407d:	75 15                	jne    80104094 <release+0x28>
8010407f:	e8 50 ff ff ff       	call   80103fd4 <popcli>
80104084:	83 ec 0c             	sub    $0xc,%esp
80104087:	68 ed 70 10 80       	push   $0x801070ed
8010408c:	e8 a7 c2 ff ff       	call   80100338 <panic>
80104091:	8d 76 00             	lea    0x0(%esi),%esi
80104094:	8b 73 08             	mov    0x8(%ebx),%esi
80104097:	e8 dc f3 ff ff       	call   80103478 <mycpu>
8010409c:	39 c6                	cmp    %eax,%esi
8010409e:	75 df                	jne    8010407f <release+0x13>
801040a0:	e8 2f ff ff ff       	call   80103fd4 <popcli>
801040a5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801040ac:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801040b3:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801040b8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801040be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040c1:	5b                   	pop    %ebx
801040c2:	5e                   	pop    %esi
801040c3:	5d                   	pop    %ebp
801040c4:	e9 0b ff ff ff       	jmp    80103fd4 <popcli>
801040c9:	8d 76 00             	lea    0x0(%esi),%esi

801040cc <acquire>:
801040cc:	55                   	push   %ebp
801040cd:	89 e5                	mov    %esp,%ebp
801040cf:	53                   	push   %ebx
801040d0:	50                   	push   %eax
801040d1:	e8 b2 fe ff ff       	call   80103f88 <pushcli>
801040d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040d9:	e8 aa fe ff ff       	call   80103f88 <pushcli>
801040de:	8b 13                	mov    (%ebx),%edx
801040e0:	85 d2                	test   %edx,%edx
801040e2:	0f 85 80 00 00 00    	jne    80104168 <acquire+0x9c>
801040e8:	e8 e7 fe ff ff       	call   80103fd4 <popcli>
801040ed:	b9 01 00 00 00       	mov    $0x1,%ecx
801040f2:	66 90                	xchg   %ax,%ax
801040f4:	8b 55 08             	mov    0x8(%ebp),%edx
801040f7:	89 c8                	mov    %ecx,%eax
801040f9:	f0 87 02             	lock xchg %eax,(%edx)
801040fc:	85 c0                	test   %eax,%eax
801040fe:	75 f4                	jne    801040f4 <acquire+0x28>
80104100:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104105:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104108:	e8 6b f3 ff ff       	call   80103478 <mycpu>
8010410d:	89 43 08             	mov    %eax,0x8(%ebx)
80104110:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104113:	8d 85 00 00 00 80    	lea    -0x80000000(%ebp),%eax
80104119:	31 d2                	xor    %edx,%edx
8010411b:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
80104120:	77 2a                	ja     8010414c <acquire+0x80>
80104122:	89 e8                	mov    %ebp,%eax
80104124:	eb 10                	jmp    80104136 <acquire+0x6a>
80104126:	66 90                	xchg   %ax,%ax
80104128:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010412e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104134:	77 16                	ja     8010414c <acquire+0x80>
80104136:	8b 58 04             	mov    0x4(%eax),%ebx
80104139:	89 5c 91 0c          	mov    %ebx,0xc(%ecx,%edx,4)
8010413d:	8b 00                	mov    (%eax),%eax
8010413f:	42                   	inc    %edx
80104140:	83 fa 0a             	cmp    $0xa,%edx
80104143:	75 e3                	jne    80104128 <acquire+0x5c>
80104145:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104148:	c9                   	leave  
80104149:	c3                   	ret    
8010414a:	66 90                	xchg   %ax,%ax
8010414c:	8d 44 91 0c          	lea    0xc(%ecx,%edx,4),%eax
80104150:	8d 51 34             	lea    0x34(%ecx),%edx
80104153:	90                   	nop
80104154:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010415a:	83 c0 04             	add    $0x4,%eax
8010415d:	39 c2                	cmp    %eax,%edx
8010415f:	75 f3                	jne    80104154 <acquire+0x88>
80104161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104164:	c9                   	leave  
80104165:	c3                   	ret    
80104166:	66 90                	xchg   %ax,%ax
80104168:	8b 5b 08             	mov    0x8(%ebx),%ebx
8010416b:	e8 08 f3 ff ff       	call   80103478 <mycpu>
80104170:	39 c3                	cmp    %eax,%ebx
80104172:	0f 85 70 ff ff ff    	jne    801040e8 <acquire+0x1c>
80104178:	e8 57 fe ff ff       	call   80103fd4 <popcli>
8010417d:	83 ec 0c             	sub    $0xc,%esp
80104180:	68 f5 70 10 80       	push   $0x801070f5
80104185:	e8 ae c1 ff ff       	call   80100338 <panic>
8010418a:	66 90                	xchg   %ax,%ax

8010418c <memset>:
8010418c:	55                   	push   %ebp
8010418d:	89 e5                	mov    %esp,%ebp
8010418f:	57                   	push   %edi
80104190:	8b 55 08             	mov    0x8(%ebp),%edx
80104193:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104196:	89 d0                	mov    %edx,%eax
80104198:	09 c8                	or     %ecx,%eax
8010419a:	a8 03                	test   $0x3,%al
8010419c:	75 22                	jne    801041c0 <memset+0x34>
8010419e:	c1 e9 02             	shr    $0x2,%ecx
801041a1:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801041a5:	89 f8                	mov    %edi,%eax
801041a7:	c1 e0 08             	shl    $0x8,%eax
801041aa:	01 f8                	add    %edi,%eax
801041ac:	89 c7                	mov    %eax,%edi
801041ae:	c1 e7 10             	shl    $0x10,%edi
801041b1:	01 f8                	add    %edi,%eax
801041b3:	89 d7                	mov    %edx,%edi
801041b5:	fc                   	cld    
801041b6:	f3 ab                	rep stos %eax,%es:(%edi)
801041b8:	89 d0                	mov    %edx,%eax
801041ba:	8b 7d fc             	mov    -0x4(%ebp),%edi
801041bd:	c9                   	leave  
801041be:	c3                   	ret    
801041bf:	90                   	nop
801041c0:	89 d7                	mov    %edx,%edi
801041c2:	8b 45 0c             	mov    0xc(%ebp),%eax
801041c5:	fc                   	cld    
801041c6:	f3 aa                	rep stos %al,%es:(%edi)
801041c8:	89 d0                	mov    %edx,%eax
801041ca:	8b 7d fc             	mov    -0x4(%ebp),%edi
801041cd:	c9                   	leave  
801041ce:	c3                   	ret    
801041cf:	90                   	nop

801041d0 <memcmp>:
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	56                   	push   %esi
801041d4:	53                   	push   %ebx
801041d5:	8b 55 08             	mov    0x8(%ebp),%edx
801041d8:	8b 45 0c             	mov    0xc(%ebp),%eax
801041db:	8b 75 10             	mov    0x10(%ebp),%esi
801041de:	85 f6                	test   %esi,%esi
801041e0:	74 1e                	je     80104200 <memcmp+0x30>
801041e2:	01 c6                	add    %eax,%esi
801041e4:	eb 08                	jmp    801041ee <memcmp+0x1e>
801041e6:	66 90                	xchg   %ax,%ax
801041e8:	42                   	inc    %edx
801041e9:	40                   	inc    %eax
801041ea:	39 f0                	cmp    %esi,%eax
801041ec:	74 12                	je     80104200 <memcmp+0x30>
801041ee:	8a 0a                	mov    (%edx),%cl
801041f0:	0f b6 18             	movzbl (%eax),%ebx
801041f3:	38 d9                	cmp    %bl,%cl
801041f5:	74 f1                	je     801041e8 <memcmp+0x18>
801041f7:	0f b6 c1             	movzbl %cl,%eax
801041fa:	29 d8                	sub    %ebx,%eax
801041fc:	5b                   	pop    %ebx
801041fd:	5e                   	pop    %esi
801041fe:	5d                   	pop    %ebp
801041ff:	c3                   	ret    
80104200:	31 c0                	xor    %eax,%eax
80104202:	5b                   	pop    %ebx
80104203:	5e                   	pop    %esi
80104204:	5d                   	pop    %ebp
80104205:	c3                   	ret    
80104206:	66 90                	xchg   %ax,%ax

80104208 <memmove>:
80104208:	55                   	push   %ebp
80104209:	89 e5                	mov    %esp,%ebp
8010420b:	57                   	push   %edi
8010420c:	56                   	push   %esi
8010420d:	8b 55 08             	mov    0x8(%ebp),%edx
80104210:	8b 75 0c             	mov    0xc(%ebp),%esi
80104213:	8b 45 10             	mov    0x10(%ebp),%eax
80104216:	39 d6                	cmp    %edx,%esi
80104218:	73 22                	jae    8010423c <memmove+0x34>
8010421a:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
8010421d:	39 ca                	cmp    %ecx,%edx
8010421f:	73 1b                	jae    8010423c <memmove+0x34>
80104221:	85 c0                	test   %eax,%eax
80104223:	74 0e                	je     80104233 <memmove+0x2b>
80104225:	48                   	dec    %eax
80104226:	66 90                	xchg   %ax,%ax
80104228:	8a 0c 06             	mov    (%esi,%eax,1),%cl
8010422b:	88 0c 02             	mov    %cl,(%edx,%eax,1)
8010422e:	83 e8 01             	sub    $0x1,%eax
80104231:	73 f5                	jae    80104228 <memmove+0x20>
80104233:	89 d0                	mov    %edx,%eax
80104235:	5e                   	pop    %esi
80104236:	5f                   	pop    %edi
80104237:	5d                   	pop    %ebp
80104238:	c3                   	ret    
80104239:	8d 76 00             	lea    0x0(%esi),%esi
8010423c:	85 c0                	test   %eax,%eax
8010423e:	74 f3                	je     80104233 <memmove+0x2b>
80104240:	01 f0                	add    %esi,%eax
80104242:	89 d7                	mov    %edx,%edi
80104244:	a4                   	movsb  %ds:(%esi),%es:(%edi)
80104245:	39 c6                	cmp    %eax,%esi
80104247:	75 fb                	jne    80104244 <memmove+0x3c>
80104249:	89 d0                	mov    %edx,%eax
8010424b:	5e                   	pop    %esi
8010424c:	5f                   	pop    %edi
8010424d:	5d                   	pop    %ebp
8010424e:	c3                   	ret    
8010424f:	90                   	nop

80104250 <memcpy>:
80104250:	eb b6                	jmp    80104208 <memmove>
80104252:	66 90                	xchg   %ax,%ax

80104254 <strncmp>:
80104254:	55                   	push   %ebp
80104255:	89 e5                	mov    %esp,%ebp
80104257:	53                   	push   %ebx
80104258:	8b 45 08             	mov    0x8(%ebp),%eax
8010425b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010425e:	8b 55 10             	mov    0x10(%ebp),%edx
80104261:	85 d2                	test   %edx,%edx
80104263:	75 0c                	jne    80104271 <strncmp+0x1d>
80104265:	eb 1d                	jmp    80104284 <strncmp+0x30>
80104267:	90                   	nop
80104268:	3a 19                	cmp    (%ecx),%bl
8010426a:	75 0b                	jne    80104277 <strncmp+0x23>
8010426c:	40                   	inc    %eax
8010426d:	41                   	inc    %ecx
8010426e:	4a                   	dec    %edx
8010426f:	74 13                	je     80104284 <strncmp+0x30>
80104271:	8a 18                	mov    (%eax),%bl
80104273:	84 db                	test   %bl,%bl
80104275:	75 f1                	jne    80104268 <strncmp+0x14>
80104277:	0f b6 00             	movzbl (%eax),%eax
8010427a:	0f b6 11             	movzbl (%ecx),%edx
8010427d:	29 d0                	sub    %edx,%eax
8010427f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104282:	c9                   	leave  
80104283:	c3                   	ret    
80104284:	31 c0                	xor    %eax,%eax
80104286:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104289:	c9                   	leave  
8010428a:	c3                   	ret    
8010428b:	90                   	nop

8010428c <strncpy>:
8010428c:	55                   	push   %ebp
8010428d:	89 e5                	mov    %esp,%ebp
8010428f:	56                   	push   %esi
80104290:	53                   	push   %ebx
80104291:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104294:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104297:	8b 55 08             	mov    0x8(%ebp),%edx
8010429a:	eb 0c                	jmp    801042a8 <strncpy+0x1c>
8010429c:	43                   	inc    %ebx
8010429d:	42                   	inc    %edx
8010429e:	8a 43 ff             	mov    -0x1(%ebx),%al
801042a1:	88 42 ff             	mov    %al,-0x1(%edx)
801042a4:	84 c0                	test   %al,%al
801042a6:	74 10                	je     801042b8 <strncpy+0x2c>
801042a8:	89 ce                	mov    %ecx,%esi
801042aa:	49                   	dec    %ecx
801042ab:	85 f6                	test   %esi,%esi
801042ad:	7f ed                	jg     8010429c <strncpy+0x10>
801042af:	8b 45 08             	mov    0x8(%ebp),%eax
801042b2:	5b                   	pop    %ebx
801042b3:	5e                   	pop    %esi
801042b4:	5d                   	pop    %ebp
801042b5:	c3                   	ret    
801042b6:	66 90                	xchg   %ax,%ax
801042b8:	8d 5c 32 ff          	lea    -0x1(%edx,%esi,1),%ebx
801042bc:	85 c9                	test   %ecx,%ecx
801042be:	74 ef                	je     801042af <strncpy+0x23>
801042c0:	42                   	inc    %edx
801042c1:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
801042c5:	89 d9                	mov    %ebx,%ecx
801042c7:	29 d1                	sub    %edx,%ecx
801042c9:	85 c9                	test   %ecx,%ecx
801042cb:	7f f3                	jg     801042c0 <strncpy+0x34>
801042cd:	8b 45 08             	mov    0x8(%ebp),%eax
801042d0:	5b                   	pop    %ebx
801042d1:	5e                   	pop    %esi
801042d2:	5d                   	pop    %ebp
801042d3:	c3                   	ret    

801042d4 <safestrcpy>:
801042d4:	55                   	push   %ebp
801042d5:	89 e5                	mov    %esp,%ebp
801042d7:	56                   	push   %esi
801042d8:	53                   	push   %ebx
801042d9:	8b 45 08             	mov    0x8(%ebp),%eax
801042dc:	8b 55 0c             	mov    0xc(%ebp),%edx
801042df:	8b 4d 10             	mov    0x10(%ebp),%ecx
801042e2:	85 c9                	test   %ecx,%ecx
801042e4:	7e 1d                	jle    80104303 <safestrcpy+0x2f>
801042e6:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801042ea:	89 c1                	mov    %eax,%ecx
801042ec:	eb 0e                	jmp    801042fc <safestrcpy+0x28>
801042ee:	66 90                	xchg   %ax,%ax
801042f0:	42                   	inc    %edx
801042f1:	41                   	inc    %ecx
801042f2:	8a 5a ff             	mov    -0x1(%edx),%bl
801042f5:	88 59 ff             	mov    %bl,-0x1(%ecx)
801042f8:	84 db                	test   %bl,%bl
801042fa:	74 04                	je     80104300 <safestrcpy+0x2c>
801042fc:	39 f2                	cmp    %esi,%edx
801042fe:	75 f0                	jne    801042f0 <safestrcpy+0x1c>
80104300:	c6 01 00             	movb   $0x0,(%ecx)
80104303:	5b                   	pop    %ebx
80104304:	5e                   	pop    %esi
80104305:	5d                   	pop    %ebp
80104306:	c3                   	ret    
80104307:	90                   	nop

80104308 <strlen>:
80104308:	55                   	push   %ebp
80104309:	89 e5                	mov    %esp,%ebp
8010430b:	8b 55 08             	mov    0x8(%ebp),%edx
8010430e:	31 c0                	xor    %eax,%eax
80104310:	80 3a 00             	cmpb   $0x0,(%edx)
80104313:	74 0a                	je     8010431f <strlen+0x17>
80104315:	8d 76 00             	lea    0x0(%esi),%esi
80104318:	40                   	inc    %eax
80104319:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
8010431d:	75 f9                	jne    80104318 <strlen+0x10>
8010431f:	5d                   	pop    %ebp
80104320:	c3                   	ret    

80104321 <swtch>:
80104321:	8b 44 24 04          	mov    0x4(%esp),%eax
80104325:	8b 54 24 08          	mov    0x8(%esp),%edx
80104329:	55                   	push   %ebp
8010432a:	53                   	push   %ebx
8010432b:	56                   	push   %esi
8010432c:	57                   	push   %edi
8010432d:	89 20                	mov    %esp,(%eax)
8010432f:	89 d4                	mov    %edx,%esp
80104331:	5f                   	pop    %edi
80104332:	5e                   	pop    %esi
80104333:	5b                   	pop    %ebx
80104334:	5d                   	pop    %ebp
80104335:	c3                   	ret    
80104336:	66 90                	xchg   %ax,%ax

80104338 <fetchint>:
80104338:	55                   	push   %ebp
80104339:	89 e5                	mov    %esp,%ebp
8010433b:	53                   	push   %ebx
8010433c:	50                   	push   %eax
8010433d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104340:	e8 cb f1 ff ff       	call   80103510 <myproc>
80104345:	8b 00                	mov    (%eax),%eax
80104347:	39 c3                	cmp    %eax,%ebx
80104349:	73 15                	jae    80104360 <fetchint+0x28>
8010434b:	8d 53 04             	lea    0x4(%ebx),%edx
8010434e:	39 d0                	cmp    %edx,%eax
80104350:	72 0e                	jb     80104360 <fetchint+0x28>
80104352:	8b 13                	mov    (%ebx),%edx
80104354:	8b 45 0c             	mov    0xc(%ebp),%eax
80104357:	89 10                	mov    %edx,(%eax)
80104359:	31 c0                	xor    %eax,%eax
8010435b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010435e:	c9                   	leave  
8010435f:	c3                   	ret    
80104360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104365:	eb f4                	jmp    8010435b <fetchint+0x23>
80104367:	90                   	nop

80104368 <fetchstr>:
80104368:	55                   	push   %ebp
80104369:	89 e5                	mov    %esp,%ebp
8010436b:	53                   	push   %ebx
8010436c:	50                   	push   %eax
8010436d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104370:	e8 9b f1 ff ff       	call   80103510 <myproc>
80104375:	3b 18                	cmp    (%eax),%ebx
80104377:	73 23                	jae    8010439c <fetchstr+0x34>
80104379:	8b 55 0c             	mov    0xc(%ebp),%edx
8010437c:	89 1a                	mov    %ebx,(%edx)
8010437e:	8b 10                	mov    (%eax),%edx
80104380:	39 d3                	cmp    %edx,%ebx
80104382:	73 18                	jae    8010439c <fetchstr+0x34>
80104384:	89 d8                	mov    %ebx,%eax
80104386:	eb 05                	jmp    8010438d <fetchstr+0x25>
80104388:	40                   	inc    %eax
80104389:	39 d0                	cmp    %edx,%eax
8010438b:	73 0f                	jae    8010439c <fetchstr+0x34>
8010438d:	80 38 00             	cmpb   $0x0,(%eax)
80104390:	75 f6                	jne    80104388 <fetchstr+0x20>
80104392:	29 d8                	sub    %ebx,%eax
80104394:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104397:	c9                   	leave  
80104398:	c3                   	ret    
80104399:	8d 76 00             	lea    0x0(%esi),%esi
8010439c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043a4:	c9                   	leave  
801043a5:	c3                   	ret    
801043a6:	66 90                	xchg   %ax,%ax

801043a8 <argint>:
801043a8:	55                   	push   %ebp
801043a9:	89 e5                	mov    %esp,%ebp
801043ab:	56                   	push   %esi
801043ac:	53                   	push   %ebx
801043ad:	e8 5e f1 ff ff       	call   80103510 <myproc>
801043b2:	8b 40 18             	mov    0x18(%eax),%eax
801043b5:	8b 40 44             	mov    0x44(%eax),%eax
801043b8:	8b 55 08             	mov    0x8(%ebp),%edx
801043bb:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801043be:	8d 73 04             	lea    0x4(%ebx),%esi
801043c1:	e8 4a f1 ff ff       	call   80103510 <myproc>
801043c6:	8b 00                	mov    (%eax),%eax
801043c8:	39 c6                	cmp    %eax,%esi
801043ca:	73 18                	jae    801043e4 <argint+0x3c>
801043cc:	8d 53 08             	lea    0x8(%ebx),%edx
801043cf:	39 d0                	cmp    %edx,%eax
801043d1:	72 11                	jb     801043e4 <argint+0x3c>
801043d3:	8b 53 04             	mov    0x4(%ebx),%edx
801043d6:	8b 45 0c             	mov    0xc(%ebp),%eax
801043d9:	89 10                	mov    %edx,(%eax)
801043db:	31 c0                	xor    %eax,%eax
801043dd:	5b                   	pop    %ebx
801043de:	5e                   	pop    %esi
801043df:	5d                   	pop    %ebp
801043e0:	c3                   	ret    
801043e1:	8d 76 00             	lea    0x0(%esi),%esi
801043e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043e9:	eb f2                	jmp    801043dd <argint+0x35>
801043eb:	90                   	nop

801043ec <argptr>:
801043ec:	55                   	push   %ebp
801043ed:	89 e5                	mov    %esp,%ebp
801043ef:	57                   	push   %edi
801043f0:	56                   	push   %esi
801043f1:	53                   	push   %ebx
801043f2:	83 ec 0c             	sub    $0xc,%esp
801043f5:	e8 16 f1 ff ff       	call   80103510 <myproc>
801043fa:	89 c6                	mov    %eax,%esi
801043fc:	e8 0f f1 ff ff       	call   80103510 <myproc>
80104401:	8b 40 18             	mov    0x18(%eax),%eax
80104404:	8b 40 44             	mov    0x44(%eax),%eax
80104407:	8b 55 08             	mov    0x8(%ebp),%edx
8010440a:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
8010440d:	8d 7b 04             	lea    0x4(%ebx),%edi
80104410:	e8 fb f0 ff ff       	call   80103510 <myproc>
80104415:	8b 00                	mov    (%eax),%eax
80104417:	39 c7                	cmp    %eax,%edi
80104419:	73 31                	jae    8010444c <argptr+0x60>
8010441b:	8d 4b 08             	lea    0x8(%ebx),%ecx
8010441e:	39 c8                	cmp    %ecx,%eax
80104420:	72 2a                	jb     8010444c <argptr+0x60>
80104422:	8b 43 04             	mov    0x4(%ebx),%eax
80104425:	8b 55 10             	mov    0x10(%ebp),%edx
80104428:	85 d2                	test   %edx,%edx
8010442a:	78 20                	js     8010444c <argptr+0x60>
8010442c:	8b 16                	mov    (%esi),%edx
8010442e:	39 d0                	cmp    %edx,%eax
80104430:	73 1a                	jae    8010444c <argptr+0x60>
80104432:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104435:	01 c3                	add    %eax,%ebx
80104437:	39 da                	cmp    %ebx,%edx
80104439:	72 11                	jb     8010444c <argptr+0x60>
8010443b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010443e:	89 02                	mov    %eax,(%edx)
80104440:	31 c0                	xor    %eax,%eax
80104442:	83 c4 0c             	add    $0xc,%esp
80104445:	5b                   	pop    %ebx
80104446:	5e                   	pop    %esi
80104447:	5f                   	pop    %edi
80104448:	5d                   	pop    %ebp
80104449:	c3                   	ret    
8010444a:	66 90                	xchg   %ax,%ax
8010444c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104451:	eb ef                	jmp    80104442 <argptr+0x56>
80104453:	90                   	nop

80104454 <argstr>:
80104454:	55                   	push   %ebp
80104455:	89 e5                	mov    %esp,%ebp
80104457:	56                   	push   %esi
80104458:	53                   	push   %ebx
80104459:	e8 b2 f0 ff ff       	call   80103510 <myproc>
8010445e:	8b 40 18             	mov    0x18(%eax),%eax
80104461:	8b 40 44             	mov    0x44(%eax),%eax
80104464:	8b 55 08             	mov    0x8(%ebp),%edx
80104467:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
8010446a:	8d 73 04             	lea    0x4(%ebx),%esi
8010446d:	e8 9e f0 ff ff       	call   80103510 <myproc>
80104472:	8b 00                	mov    (%eax),%eax
80104474:	39 c6                	cmp    %eax,%esi
80104476:	73 34                	jae    801044ac <argstr+0x58>
80104478:	8d 53 08             	lea    0x8(%ebx),%edx
8010447b:	39 d0                	cmp    %edx,%eax
8010447d:	72 2d                	jb     801044ac <argstr+0x58>
8010447f:	8b 5b 04             	mov    0x4(%ebx),%ebx
80104482:	e8 89 f0 ff ff       	call   80103510 <myproc>
80104487:	3b 18                	cmp    (%eax),%ebx
80104489:	73 21                	jae    801044ac <argstr+0x58>
8010448b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010448e:	89 1a                	mov    %ebx,(%edx)
80104490:	8b 10                	mov    (%eax),%edx
80104492:	39 d3                	cmp    %edx,%ebx
80104494:	73 16                	jae    801044ac <argstr+0x58>
80104496:	89 d8                	mov    %ebx,%eax
80104498:	eb 07                	jmp    801044a1 <argstr+0x4d>
8010449a:	66 90                	xchg   %ax,%ax
8010449c:	40                   	inc    %eax
8010449d:	39 d0                	cmp    %edx,%eax
8010449f:	73 0b                	jae    801044ac <argstr+0x58>
801044a1:	80 38 00             	cmpb   $0x0,(%eax)
801044a4:	75 f6                	jne    8010449c <argstr+0x48>
801044a6:	29 d8                	sub    %ebx,%eax
801044a8:	5b                   	pop    %ebx
801044a9:	5e                   	pop    %esi
801044aa:	5d                   	pop    %ebp
801044ab:	c3                   	ret    
801044ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801044b1:	5b                   	pop    %ebx
801044b2:	5e                   	pop    %esi
801044b3:	5d                   	pop    %ebp
801044b4:	c3                   	ret    
801044b5:	8d 76 00             	lea    0x0(%esi),%esi

801044b8 <syscall>:
801044b8:	55                   	push   %ebp
801044b9:	89 e5                	mov    %esp,%ebp
801044bb:	53                   	push   %ebx
801044bc:	50                   	push   %eax
801044bd:	e8 4e f0 ff ff       	call   80103510 <myproc>
801044c2:	89 c3                	mov    %eax,%ebx
801044c4:	8b 40 18             	mov    0x18(%eax),%eax
801044c7:	8b 40 1c             	mov    0x1c(%eax),%eax
801044ca:	8d 50 ff             	lea    -0x1(%eax),%edx
801044cd:	83 fa 1a             	cmp    $0x1a,%edx
801044d0:	77 1a                	ja     801044ec <syscall+0x34>
801044d2:	8b 14 85 20 71 10 80 	mov    -0x7fef8ee0(,%eax,4),%edx
801044d9:	85 d2                	test   %edx,%edx
801044db:	74 0f                	je     801044ec <syscall+0x34>
801044dd:	ff d2                	call   *%edx
801044df:	89 c2                	mov    %eax,%edx
801044e1:	8b 43 18             	mov    0x18(%ebx),%eax
801044e4:	89 50 1c             	mov    %edx,0x1c(%eax)
801044e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044ea:	c9                   	leave  
801044eb:	c3                   	ret    
801044ec:	50                   	push   %eax
801044ed:	8d 43 6c             	lea    0x6c(%ebx),%eax
801044f0:	50                   	push   %eax
801044f1:	ff 73 10             	pushl  0x10(%ebx)
801044f4:	68 fd 70 10 80       	push   $0x801070fd
801044f9:	e8 2a c1 ff ff       	call   80100628 <cprintf>
801044fe:	8b 43 18             	mov    0x18(%ebx),%eax
80104501:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104508:	83 c4 10             	add    $0x10,%esp
8010450b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010450e:	c9                   	leave  
8010450f:	c3                   	ret    

80104510 <create>:
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	57                   	push   %edi
80104514:	56                   	push   %esi
80104515:	53                   	push   %ebx
80104516:	83 ec 34             	sub    $0x34,%esp
80104519:	89 55 d4             	mov    %edx,-0x2c(%ebp)
8010451c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
8010451f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104522:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80104525:	8d 7d da             	lea    -0x26(%ebp),%edi
80104528:	57                   	push   %edi
80104529:	50                   	push   %eax
8010452a:	e8 89 d9 ff ff       	call   80101eb8 <nameiparent>
8010452f:	83 c4 10             	add    $0x10,%esp
80104532:	85 c0                	test   %eax,%eax
80104534:	74 5a                	je     80104590 <create+0x80>
80104536:	89 c3                	mov    %eax,%ebx
80104538:	83 ec 0c             	sub    $0xc,%esp
8010453b:	50                   	push   %eax
8010453c:	e8 d3 d0 ff ff       	call   80101614 <ilock>
80104541:	83 c4 0c             	add    $0xc,%esp
80104544:	6a 00                	push   $0x0
80104546:	57                   	push   %edi
80104547:	53                   	push   %ebx
80104548:	e8 cb d5 ff ff       	call   80101b18 <dirlookup>
8010454d:	89 c6                	mov    %eax,%esi
8010454f:	83 c4 10             	add    $0x10,%esp
80104552:	85 c0                	test   %eax,%eax
80104554:	74 46                	je     8010459c <create+0x8c>
80104556:	83 ec 0c             	sub    $0xc,%esp
80104559:	53                   	push   %ebx
8010455a:	e8 09 d3 ff ff       	call   80101868 <iunlockput>
8010455f:	89 34 24             	mov    %esi,(%esp)
80104562:	e8 ad d0 ff ff       	call   80101614 <ilock>
80104567:	83 c4 10             	add    $0x10,%esp
8010456a:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
8010456f:	75 13                	jne    80104584 <create+0x74>
80104571:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104576:	75 0c                	jne    80104584 <create+0x74>
80104578:	89 f0                	mov    %esi,%eax
8010457a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010457d:	5b                   	pop    %ebx
8010457e:	5e                   	pop    %esi
8010457f:	5f                   	pop    %edi
80104580:	5d                   	pop    %ebp
80104581:	c3                   	ret    
80104582:	66 90                	xchg   %ax,%ax
80104584:	83 ec 0c             	sub    $0xc,%esp
80104587:	56                   	push   %esi
80104588:	e8 db d2 ff ff       	call   80101868 <iunlockput>
8010458d:	83 c4 10             	add    $0x10,%esp
80104590:	31 f6                	xor    %esi,%esi
80104592:	89 f0                	mov    %esi,%eax
80104594:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104597:	5b                   	pop    %ebx
80104598:	5e                   	pop    %esi
80104599:	5f                   	pop    %edi
8010459a:	5d                   	pop    %ebp
8010459b:	c3                   	ret    
8010459c:	83 ec 08             	sub    $0x8,%esp
8010459f:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
801045a3:	50                   	push   %eax
801045a4:	ff 33                	pushl  (%ebx)
801045a6:	e8 11 cf ff ff       	call   801014bc <ialloc>
801045ab:	89 c6                	mov    %eax,%esi
801045ad:	83 c4 10             	add    $0x10,%esp
801045b0:	85 c0                	test   %eax,%eax
801045b2:	0f 84 ad 00 00 00    	je     80104665 <create+0x155>
801045b8:	83 ec 0c             	sub    $0xc,%esp
801045bb:	50                   	push   %eax
801045bc:	e8 53 d0 ff ff       	call   80101614 <ilock>
801045c1:	8b 45 d0             	mov    -0x30(%ebp),%eax
801045c4:	66 89 46 52          	mov    %ax,0x52(%esi)
801045c8:	8b 45 cc             	mov    -0x34(%ebp),%eax
801045cb:	66 89 46 54          	mov    %ax,0x54(%esi)
801045cf:	66 c7 46 56 01 00    	movw   $0x1,0x56(%esi)
801045d5:	89 34 24             	mov    %esi,(%esp)
801045d8:	e8 8f cf ff ff       	call   8010156c <iupdate>
801045dd:	83 c4 10             	add    $0x10,%esp
801045e0:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801045e5:	74 29                	je     80104610 <create+0x100>
801045e7:	50                   	push   %eax
801045e8:	ff 76 04             	pushl  0x4(%esi)
801045eb:	57                   	push   %edi
801045ec:	53                   	push   %ebx
801045ed:	e8 fe d7 ff ff       	call   80101df0 <dirlink>
801045f2:	83 c4 10             	add    $0x10,%esp
801045f5:	85 c0                	test   %eax,%eax
801045f7:	78 5f                	js     80104658 <create+0x148>
801045f9:	83 ec 0c             	sub    $0xc,%esp
801045fc:	53                   	push   %ebx
801045fd:	e8 66 d2 ff ff       	call   80101868 <iunlockput>
80104602:	83 c4 10             	add    $0x10,%esp
80104605:	89 f0                	mov    %esi,%eax
80104607:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010460a:	5b                   	pop    %ebx
8010460b:	5e                   	pop    %esi
8010460c:	5f                   	pop    %edi
8010460d:	5d                   	pop    %ebp
8010460e:	c3                   	ret    
8010460f:	90                   	nop
80104610:	66 ff 43 56          	incw   0x56(%ebx)
80104614:	83 ec 0c             	sub    $0xc,%esp
80104617:	53                   	push   %ebx
80104618:	e8 4f cf ff ff       	call   8010156c <iupdate>
8010461d:	83 c4 0c             	add    $0xc,%esp
80104620:	ff 76 04             	pushl  0x4(%esi)
80104623:	68 ac 71 10 80       	push   $0x801071ac
80104628:	56                   	push   %esi
80104629:	e8 c2 d7 ff ff       	call   80101df0 <dirlink>
8010462e:	83 c4 10             	add    $0x10,%esp
80104631:	85 c0                	test   %eax,%eax
80104633:	78 16                	js     8010464b <create+0x13b>
80104635:	52                   	push   %edx
80104636:	ff 73 04             	pushl  0x4(%ebx)
80104639:	68 ab 71 10 80       	push   $0x801071ab
8010463e:	56                   	push   %esi
8010463f:	e8 ac d7 ff ff       	call   80101df0 <dirlink>
80104644:	83 c4 10             	add    $0x10,%esp
80104647:	85 c0                	test   %eax,%eax
80104649:	79 9c                	jns    801045e7 <create+0xd7>
8010464b:	83 ec 0c             	sub    $0xc,%esp
8010464e:	68 9f 71 10 80       	push   $0x8010719f
80104653:	e8 e0 bc ff ff       	call   80100338 <panic>
80104658:	83 ec 0c             	sub    $0xc,%esp
8010465b:	68 ae 71 10 80       	push   $0x801071ae
80104660:	e8 d3 bc ff ff       	call   80100338 <panic>
80104665:	83 ec 0c             	sub    $0xc,%esp
80104668:	68 90 71 10 80       	push   $0x80107190
8010466d:	e8 c6 bc ff ff       	call   80100338 <panic>
80104672:	66 90                	xchg   %ax,%ax

80104674 <sys_dup>:
80104674:	55                   	push   %ebp
80104675:	89 e5                	mov    %esp,%ebp
80104677:	56                   	push   %esi
80104678:	53                   	push   %ebx
80104679:	83 ec 18             	sub    $0x18,%esp
8010467c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010467f:	50                   	push   %eax
80104680:	6a 00                	push   $0x0
80104682:	e8 21 fd ff ff       	call   801043a8 <argint>
80104687:	83 c4 10             	add    $0x10,%esp
8010468a:	85 c0                	test   %eax,%eax
8010468c:	78 2c                	js     801046ba <sys_dup+0x46>
8010468e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104692:	77 26                	ja     801046ba <sys_dup+0x46>
80104694:	e8 77 ee ff ff       	call   80103510 <myproc>
80104699:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010469c:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
801046a0:	85 f6                	test   %esi,%esi
801046a2:	74 16                	je     801046ba <sys_dup+0x46>
801046a4:	e8 67 ee ff ff       	call   80103510 <myproc>
801046a9:	31 db                	xor    %ebx,%ebx
801046ab:	90                   	nop
801046ac:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801046b0:	85 d2                	test   %edx,%edx
801046b2:	74 14                	je     801046c8 <sys_dup+0x54>
801046b4:	43                   	inc    %ebx
801046b5:	83 fb 10             	cmp    $0x10,%ebx
801046b8:	75 f2                	jne    801046ac <sys_dup+0x38>
801046ba:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801046bf:	89 d8                	mov    %ebx,%eax
801046c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046c4:	5b                   	pop    %ebx
801046c5:	5e                   	pop    %esi
801046c6:	5d                   	pop    %ebp
801046c7:	c3                   	ret    
801046c8:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
801046cc:	83 ec 0c             	sub    $0xc,%esp
801046cf:	56                   	push   %esi
801046d0:	e8 2b c7 ff ff       	call   80100e00 <filedup>
801046d5:	83 c4 10             	add    $0x10,%esp
801046d8:	89 d8                	mov    %ebx,%eax
801046da:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046dd:	5b                   	pop    %ebx
801046de:	5e                   	pop    %esi
801046df:	5d                   	pop    %ebp
801046e0:	c3                   	ret    
801046e1:	8d 76 00             	lea    0x0(%esi),%esi

801046e4 <sys_read>:
801046e4:	55                   	push   %ebp
801046e5:	89 e5                	mov    %esp,%ebp
801046e7:	56                   	push   %esi
801046e8:	53                   	push   %ebx
801046e9:	83 ec 18             	sub    $0x18,%esp
801046ec:	8d 5d f4             	lea    -0xc(%ebp),%ebx
801046ef:	53                   	push   %ebx
801046f0:	6a 00                	push   $0x0
801046f2:	e8 b1 fc ff ff       	call   801043a8 <argint>
801046f7:	83 c4 10             	add    $0x10,%esp
801046fa:	85 c0                	test   %eax,%eax
801046fc:	78 56                	js     80104754 <sys_read+0x70>
801046fe:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104702:	77 50                	ja     80104754 <sys_read+0x70>
80104704:	e8 07 ee ff ff       	call   80103510 <myproc>
80104709:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010470c:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104710:	85 f6                	test   %esi,%esi
80104712:	74 40                	je     80104754 <sys_read+0x70>
80104714:	83 ec 08             	sub    $0x8,%esp
80104717:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010471a:	50                   	push   %eax
8010471b:	6a 02                	push   $0x2
8010471d:	e8 86 fc ff ff       	call   801043a8 <argint>
80104722:	83 c4 10             	add    $0x10,%esp
80104725:	85 c0                	test   %eax,%eax
80104727:	78 2b                	js     80104754 <sys_read+0x70>
80104729:	52                   	push   %edx
8010472a:	ff 75 f0             	pushl  -0x10(%ebp)
8010472d:	53                   	push   %ebx
8010472e:	6a 01                	push   $0x1
80104730:	e8 b7 fc ff ff       	call   801043ec <argptr>
80104735:	83 c4 10             	add    $0x10,%esp
80104738:	85 c0                	test   %eax,%eax
8010473a:	78 18                	js     80104754 <sys_read+0x70>
8010473c:	50                   	push   %eax
8010473d:	ff 75 f0             	pushl  -0x10(%ebp)
80104740:	ff 75 f4             	pushl  -0xc(%ebp)
80104743:	56                   	push   %esi
80104744:	e8 ff c7 ff ff       	call   80100f48 <fileread>
80104749:	83 c4 10             	add    $0x10,%esp
8010474c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010474f:	5b                   	pop    %ebx
80104750:	5e                   	pop    %esi
80104751:	5d                   	pop    %ebp
80104752:	c3                   	ret    
80104753:	90                   	nop
80104754:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104759:	eb f1                	jmp    8010474c <sys_read+0x68>
8010475b:	90                   	nop

8010475c <sys_write>:
8010475c:	55                   	push   %ebp
8010475d:	89 e5                	mov    %esp,%ebp
8010475f:	56                   	push   %esi
80104760:	53                   	push   %ebx
80104761:	83 ec 18             	sub    $0x18,%esp
80104764:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104767:	53                   	push   %ebx
80104768:	6a 00                	push   $0x0
8010476a:	e8 39 fc ff ff       	call   801043a8 <argint>
8010476f:	83 c4 10             	add    $0x10,%esp
80104772:	85 c0                	test   %eax,%eax
80104774:	78 56                	js     801047cc <sys_write+0x70>
80104776:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010477a:	77 50                	ja     801047cc <sys_write+0x70>
8010477c:	e8 8f ed ff ff       	call   80103510 <myproc>
80104781:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104784:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104788:	85 f6                	test   %esi,%esi
8010478a:	74 40                	je     801047cc <sys_write+0x70>
8010478c:	83 ec 08             	sub    $0x8,%esp
8010478f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104792:	50                   	push   %eax
80104793:	6a 02                	push   $0x2
80104795:	e8 0e fc ff ff       	call   801043a8 <argint>
8010479a:	83 c4 10             	add    $0x10,%esp
8010479d:	85 c0                	test   %eax,%eax
8010479f:	78 2b                	js     801047cc <sys_write+0x70>
801047a1:	52                   	push   %edx
801047a2:	ff 75 f0             	pushl  -0x10(%ebp)
801047a5:	53                   	push   %ebx
801047a6:	6a 01                	push   $0x1
801047a8:	e8 3f fc ff ff       	call   801043ec <argptr>
801047ad:	83 c4 10             	add    $0x10,%esp
801047b0:	85 c0                	test   %eax,%eax
801047b2:	78 18                	js     801047cc <sys_write+0x70>
801047b4:	50                   	push   %eax
801047b5:	ff 75 f0             	pushl  -0x10(%ebp)
801047b8:	ff 75 f4             	pushl  -0xc(%ebp)
801047bb:	56                   	push   %esi
801047bc:	e8 13 c8 ff ff       	call   80100fd4 <filewrite>
801047c1:	83 c4 10             	add    $0x10,%esp
801047c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047c7:	5b                   	pop    %ebx
801047c8:	5e                   	pop    %esi
801047c9:	5d                   	pop    %ebp
801047ca:	c3                   	ret    
801047cb:	90                   	nop
801047cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047d1:	eb f1                	jmp    801047c4 <sys_write+0x68>
801047d3:	90                   	nop

801047d4 <sys_close>:
801047d4:	55                   	push   %ebp
801047d5:	89 e5                	mov    %esp,%ebp
801047d7:	56                   	push   %esi
801047d8:	53                   	push   %ebx
801047d9:	83 ec 18             	sub    $0x18,%esp
801047dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047df:	50                   	push   %eax
801047e0:	6a 00                	push   $0x0
801047e2:	e8 c1 fb ff ff       	call   801043a8 <argint>
801047e7:	83 c4 10             	add    $0x10,%esp
801047ea:	85 c0                	test   %eax,%eax
801047ec:	78 3e                	js     8010482c <sys_close+0x58>
801047ee:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801047f2:	77 38                	ja     8010482c <sys_close+0x58>
801047f4:	e8 17 ed ff ff       	call   80103510 <myproc>
801047f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801047fc:	8d 5a 08             	lea    0x8(%edx),%ebx
801047ff:	8b 74 98 08          	mov    0x8(%eax,%ebx,4),%esi
80104803:	85 f6                	test   %esi,%esi
80104805:	74 25                	je     8010482c <sys_close+0x58>
80104807:	e8 04 ed ff ff       	call   80103510 <myproc>
8010480c:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
80104813:	00 
80104814:	83 ec 0c             	sub    $0xc,%esp
80104817:	56                   	push   %esi
80104818:	e8 27 c6 ff ff       	call   80100e44 <fileclose>
8010481d:	83 c4 10             	add    $0x10,%esp
80104820:	31 c0                	xor    %eax,%eax
80104822:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104825:	5b                   	pop    %ebx
80104826:	5e                   	pop    %esi
80104827:	5d                   	pop    %ebp
80104828:	c3                   	ret    
80104829:	8d 76 00             	lea    0x0(%esi),%esi
8010482c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104831:	eb ef                	jmp    80104822 <sys_close+0x4e>
80104833:	90                   	nop

80104834 <sys_fstat>:
80104834:	55                   	push   %ebp
80104835:	89 e5                	mov    %esp,%ebp
80104837:	56                   	push   %esi
80104838:	53                   	push   %ebx
80104839:	83 ec 18             	sub    $0x18,%esp
8010483c:	8d 5d f4             	lea    -0xc(%ebp),%ebx
8010483f:	53                   	push   %ebx
80104840:	6a 00                	push   $0x0
80104842:	e8 61 fb ff ff       	call   801043a8 <argint>
80104847:	83 c4 10             	add    $0x10,%esp
8010484a:	85 c0                	test   %eax,%eax
8010484c:	78 3e                	js     8010488c <sys_fstat+0x58>
8010484e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104852:	77 38                	ja     8010488c <sys_fstat+0x58>
80104854:	e8 b7 ec ff ff       	call   80103510 <myproc>
80104859:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010485c:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104860:	85 f6                	test   %esi,%esi
80104862:	74 28                	je     8010488c <sys_fstat+0x58>
80104864:	50                   	push   %eax
80104865:	6a 14                	push   $0x14
80104867:	53                   	push   %ebx
80104868:	6a 01                	push   $0x1
8010486a:	e8 7d fb ff ff       	call   801043ec <argptr>
8010486f:	83 c4 10             	add    $0x10,%esp
80104872:	85 c0                	test   %eax,%eax
80104874:	78 16                	js     8010488c <sys_fstat+0x58>
80104876:	83 ec 08             	sub    $0x8,%esp
80104879:	ff 75 f4             	pushl  -0xc(%ebp)
8010487c:	56                   	push   %esi
8010487d:	e8 82 c6 ff ff       	call   80100f04 <filestat>
80104882:	83 c4 10             	add    $0x10,%esp
80104885:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104888:	5b                   	pop    %ebx
80104889:	5e                   	pop    %esi
8010488a:	5d                   	pop    %ebp
8010488b:	c3                   	ret    
8010488c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104891:	eb f2                	jmp    80104885 <sys_fstat+0x51>
80104893:	90                   	nop

80104894 <sys_link>:
80104894:	55                   	push   %ebp
80104895:	89 e5                	mov    %esp,%ebp
80104897:	57                   	push   %edi
80104898:	56                   	push   %esi
80104899:	53                   	push   %ebx
8010489a:	83 ec 34             	sub    $0x34,%esp
8010489d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801048a0:	50                   	push   %eax
801048a1:	6a 00                	push   $0x0
801048a3:	e8 ac fb ff ff       	call   80104454 <argstr>
801048a8:	83 c4 10             	add    $0x10,%esp
801048ab:	85 c0                	test   %eax,%eax
801048ad:	0f 88 f2 00 00 00    	js     801049a5 <sys_link+0x111>
801048b3:	83 ec 08             	sub    $0x8,%esp
801048b6:	8d 45 d0             	lea    -0x30(%ebp),%eax
801048b9:	50                   	push   %eax
801048ba:	6a 01                	push   $0x1
801048bc:	e8 93 fb ff ff       	call   80104454 <argstr>
801048c1:	83 c4 10             	add    $0x10,%esp
801048c4:	85 c0                	test   %eax,%eax
801048c6:	0f 88 d9 00 00 00    	js     801049a5 <sys_link+0x111>
801048cc:	e8 fb e0 ff ff       	call   801029cc <begin_op>
801048d1:	83 ec 0c             	sub    $0xc,%esp
801048d4:	ff 75 d4             	pushl  -0x2c(%ebp)
801048d7:	e8 c4 d5 ff ff       	call   80101ea0 <namei>
801048dc:	89 c3                	mov    %eax,%ebx
801048de:	83 c4 10             	add    $0x10,%esp
801048e1:	85 c0                	test   %eax,%eax
801048e3:	0f 84 d6 00 00 00    	je     801049bf <sys_link+0x12b>
801048e9:	83 ec 0c             	sub    $0xc,%esp
801048ec:	50                   	push   %eax
801048ed:	e8 22 cd ff ff       	call   80101614 <ilock>
801048f2:	83 c4 10             	add    $0x10,%esp
801048f5:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801048fa:	0f 84 ac 00 00 00    	je     801049ac <sys_link+0x118>
80104900:	66 ff 43 56          	incw   0x56(%ebx)
80104904:	83 ec 0c             	sub    $0xc,%esp
80104907:	53                   	push   %ebx
80104908:	e8 5f cc ff ff       	call   8010156c <iupdate>
8010490d:	89 1c 24             	mov    %ebx,(%esp)
80104910:	e8 c7 cd ff ff       	call   801016dc <iunlock>
80104915:	5a                   	pop    %edx
80104916:	59                   	pop    %ecx
80104917:	8d 7d da             	lea    -0x26(%ebp),%edi
8010491a:	57                   	push   %edi
8010491b:	ff 75 d0             	pushl  -0x30(%ebp)
8010491e:	e8 95 d5 ff ff       	call   80101eb8 <nameiparent>
80104923:	89 c6                	mov    %eax,%esi
80104925:	83 c4 10             	add    $0x10,%esp
80104928:	85 c0                	test   %eax,%eax
8010492a:	74 54                	je     80104980 <sys_link+0xec>
8010492c:	83 ec 0c             	sub    $0xc,%esp
8010492f:	50                   	push   %eax
80104930:	e8 df cc ff ff       	call   80101614 <ilock>
80104935:	83 c4 10             	add    $0x10,%esp
80104938:	8b 03                	mov    (%ebx),%eax
8010493a:	39 06                	cmp    %eax,(%esi)
8010493c:	75 36                	jne    80104974 <sys_link+0xe0>
8010493e:	50                   	push   %eax
8010493f:	ff 73 04             	pushl  0x4(%ebx)
80104942:	57                   	push   %edi
80104943:	56                   	push   %esi
80104944:	e8 a7 d4 ff ff       	call   80101df0 <dirlink>
80104949:	83 c4 10             	add    $0x10,%esp
8010494c:	85 c0                	test   %eax,%eax
8010494e:	78 24                	js     80104974 <sys_link+0xe0>
80104950:	83 ec 0c             	sub    $0xc,%esp
80104953:	56                   	push   %esi
80104954:	e8 0f cf ff ff       	call   80101868 <iunlockput>
80104959:	89 1c 24             	mov    %ebx,(%esp)
8010495c:	e8 bf cd ff ff       	call   80101720 <iput>
80104961:	e8 ce e0 ff ff       	call   80102a34 <end_op>
80104966:	83 c4 10             	add    $0x10,%esp
80104969:	31 c0                	xor    %eax,%eax
8010496b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010496e:	5b                   	pop    %ebx
8010496f:	5e                   	pop    %esi
80104970:	5f                   	pop    %edi
80104971:	5d                   	pop    %ebp
80104972:	c3                   	ret    
80104973:	90                   	nop
80104974:	83 ec 0c             	sub    $0xc,%esp
80104977:	56                   	push   %esi
80104978:	e8 eb ce ff ff       	call   80101868 <iunlockput>
8010497d:	83 c4 10             	add    $0x10,%esp
80104980:	83 ec 0c             	sub    $0xc,%esp
80104983:	53                   	push   %ebx
80104984:	e8 8b cc ff ff       	call   80101614 <ilock>
80104989:	66 ff 4b 56          	decw   0x56(%ebx)
8010498d:	89 1c 24             	mov    %ebx,(%esp)
80104990:	e8 d7 cb ff ff       	call   8010156c <iupdate>
80104995:	89 1c 24             	mov    %ebx,(%esp)
80104998:	e8 cb ce ff ff       	call   80101868 <iunlockput>
8010499d:	e8 92 e0 ff ff       	call   80102a34 <end_op>
801049a2:	83 c4 10             	add    $0x10,%esp
801049a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049aa:	eb bf                	jmp    8010496b <sys_link+0xd7>
801049ac:	83 ec 0c             	sub    $0xc,%esp
801049af:	53                   	push   %ebx
801049b0:	e8 b3 ce ff ff       	call   80101868 <iunlockput>
801049b5:	e8 7a e0 ff ff       	call   80102a34 <end_op>
801049ba:	83 c4 10             	add    $0x10,%esp
801049bd:	eb e6                	jmp    801049a5 <sys_link+0x111>
801049bf:	e8 70 e0 ff ff       	call   80102a34 <end_op>
801049c4:	eb df                	jmp    801049a5 <sys_link+0x111>
801049c6:	66 90                	xchg   %ax,%ax

801049c8 <sys_unlink>:
801049c8:	55                   	push   %ebp
801049c9:	89 e5                	mov    %esp,%ebp
801049cb:	57                   	push   %edi
801049cc:	56                   	push   %esi
801049cd:	53                   	push   %ebx
801049ce:	83 ec 54             	sub    $0x54,%esp
801049d1:	8d 45 c0             	lea    -0x40(%ebp),%eax
801049d4:	50                   	push   %eax
801049d5:	6a 00                	push   $0x0
801049d7:	e8 78 fa ff ff       	call   80104454 <argstr>
801049dc:	83 c4 10             	add    $0x10,%esp
801049df:	85 c0                	test   %eax,%eax
801049e1:	0f 88 50 01 00 00    	js     80104b37 <sys_unlink+0x16f>
801049e7:	e8 e0 df ff ff       	call   801029cc <begin_op>
801049ec:	83 ec 08             	sub    $0x8,%esp
801049ef:	8d 5d ca             	lea    -0x36(%ebp),%ebx
801049f2:	53                   	push   %ebx
801049f3:	ff 75 c0             	pushl  -0x40(%ebp)
801049f6:	e8 bd d4 ff ff       	call   80101eb8 <nameiparent>
801049fb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
801049fe:	83 c4 10             	add    $0x10,%esp
80104a01:	85 c0                	test   %eax,%eax
80104a03:	0f 84 4f 01 00 00    	je     80104b58 <sys_unlink+0x190>
80104a09:	83 ec 0c             	sub    $0xc,%esp
80104a0c:	8b 7d b4             	mov    -0x4c(%ebp),%edi
80104a0f:	57                   	push   %edi
80104a10:	e8 ff cb ff ff       	call   80101614 <ilock>
80104a15:	59                   	pop    %ecx
80104a16:	5e                   	pop    %esi
80104a17:	68 ac 71 10 80       	push   $0x801071ac
80104a1c:	53                   	push   %ebx
80104a1d:	e8 de d0 ff ff       	call   80101b00 <namecmp>
80104a22:	83 c4 10             	add    $0x10,%esp
80104a25:	85 c0                	test   %eax,%eax
80104a27:	0f 84 f7 00 00 00    	je     80104b24 <sys_unlink+0x15c>
80104a2d:	83 ec 08             	sub    $0x8,%esp
80104a30:	68 ab 71 10 80       	push   $0x801071ab
80104a35:	53                   	push   %ebx
80104a36:	e8 c5 d0 ff ff       	call   80101b00 <namecmp>
80104a3b:	83 c4 10             	add    $0x10,%esp
80104a3e:	85 c0                	test   %eax,%eax
80104a40:	0f 84 de 00 00 00    	je     80104b24 <sys_unlink+0x15c>
80104a46:	52                   	push   %edx
80104a47:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104a4a:	50                   	push   %eax
80104a4b:	53                   	push   %ebx
80104a4c:	57                   	push   %edi
80104a4d:	e8 c6 d0 ff ff       	call   80101b18 <dirlookup>
80104a52:	89 c3                	mov    %eax,%ebx
80104a54:	83 c4 10             	add    $0x10,%esp
80104a57:	85 c0                	test   %eax,%eax
80104a59:	0f 84 c5 00 00 00    	je     80104b24 <sys_unlink+0x15c>
80104a5f:	83 ec 0c             	sub    $0xc,%esp
80104a62:	50                   	push   %eax
80104a63:	e8 ac cb ff ff       	call   80101614 <ilock>
80104a68:	83 c4 10             	add    $0x10,%esp
80104a6b:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104a70:	0f 8e 03 01 00 00    	jle    80104b79 <sys_unlink+0x1b1>
80104a76:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a7b:	74 67                	je     80104ae4 <sys_unlink+0x11c>
80104a7d:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104a80:	50                   	push   %eax
80104a81:	6a 10                	push   $0x10
80104a83:	6a 00                	push   $0x0
80104a85:	57                   	push   %edi
80104a86:	e8 01 f7 ff ff       	call   8010418c <memset>
80104a8b:	6a 10                	push   $0x10
80104a8d:	ff 75 c4             	pushl  -0x3c(%ebp)
80104a90:	57                   	push   %edi
80104a91:	ff 75 b4             	pushl  -0x4c(%ebp)
80104a94:	e8 4b cf ff ff       	call   801019e4 <writei>
80104a99:	83 c4 20             	add    $0x20,%esp
80104a9c:	83 f8 10             	cmp    $0x10,%eax
80104a9f:	0f 85 c7 00 00 00    	jne    80104b6c <sys_unlink+0x1a4>
80104aa5:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104aaa:	0f 84 90 00 00 00    	je     80104b40 <sys_unlink+0x178>
80104ab0:	83 ec 0c             	sub    $0xc,%esp
80104ab3:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ab6:	e8 ad cd ff ff       	call   80101868 <iunlockput>
80104abb:	66 ff 4b 56          	decw   0x56(%ebx)
80104abf:	89 1c 24             	mov    %ebx,(%esp)
80104ac2:	e8 a5 ca ff ff       	call   8010156c <iupdate>
80104ac7:	89 1c 24             	mov    %ebx,(%esp)
80104aca:	e8 99 cd ff ff       	call   80101868 <iunlockput>
80104acf:	e8 60 df ff ff       	call   80102a34 <end_op>
80104ad4:	83 c4 10             	add    $0x10,%esp
80104ad7:	31 c0                	xor    %eax,%eax
80104ad9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104adc:	5b                   	pop    %ebx
80104add:	5e                   	pop    %esi
80104ade:	5f                   	pop    %edi
80104adf:	5d                   	pop    %ebp
80104ae0:	c3                   	ret    
80104ae1:	8d 76 00             	lea    0x0(%esi),%esi
80104ae4:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104ae8:	76 93                	jbe    80104a7d <sys_unlink+0xb5>
80104aea:	be 20 00 00 00       	mov    $0x20,%esi
80104aef:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104af2:	eb 08                	jmp    80104afc <sys_unlink+0x134>
80104af4:	83 c6 10             	add    $0x10,%esi
80104af7:	3b 73 58             	cmp    0x58(%ebx),%esi
80104afa:	73 84                	jae    80104a80 <sys_unlink+0xb8>
80104afc:	6a 10                	push   $0x10
80104afe:	56                   	push   %esi
80104aff:	57                   	push   %edi
80104b00:	53                   	push   %ebx
80104b01:	e8 de cd ff ff       	call   801018e4 <readi>
80104b06:	83 c4 10             	add    $0x10,%esp
80104b09:	83 f8 10             	cmp    $0x10,%eax
80104b0c:	75 51                	jne    80104b5f <sys_unlink+0x197>
80104b0e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104b13:	74 df                	je     80104af4 <sys_unlink+0x12c>
80104b15:	83 ec 0c             	sub    $0xc,%esp
80104b18:	53                   	push   %ebx
80104b19:	e8 4a cd ff ff       	call   80101868 <iunlockput>
80104b1e:	83 c4 10             	add    $0x10,%esp
80104b21:	8d 76 00             	lea    0x0(%esi),%esi
80104b24:	83 ec 0c             	sub    $0xc,%esp
80104b27:	ff 75 b4             	pushl  -0x4c(%ebp)
80104b2a:	e8 39 cd ff ff       	call   80101868 <iunlockput>
80104b2f:	e8 00 df ff ff       	call   80102a34 <end_op>
80104b34:	83 c4 10             	add    $0x10,%esp
80104b37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b3c:	eb 9b                	jmp    80104ad9 <sys_unlink+0x111>
80104b3e:	66 90                	xchg   %ax,%ax
80104b40:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104b43:	66 ff 48 56          	decw   0x56(%eax)
80104b47:	83 ec 0c             	sub    $0xc,%esp
80104b4a:	50                   	push   %eax
80104b4b:	e8 1c ca ff ff       	call   8010156c <iupdate>
80104b50:	83 c4 10             	add    $0x10,%esp
80104b53:	e9 58 ff ff ff       	jmp    80104ab0 <sys_unlink+0xe8>
80104b58:	e8 d7 de ff ff       	call   80102a34 <end_op>
80104b5d:	eb d8                	jmp    80104b37 <sys_unlink+0x16f>
80104b5f:	83 ec 0c             	sub    $0xc,%esp
80104b62:	68 d0 71 10 80       	push   $0x801071d0
80104b67:	e8 cc b7 ff ff       	call   80100338 <panic>
80104b6c:	83 ec 0c             	sub    $0xc,%esp
80104b6f:	68 e2 71 10 80       	push   $0x801071e2
80104b74:	e8 bf b7 ff ff       	call   80100338 <panic>
80104b79:	83 ec 0c             	sub    $0xc,%esp
80104b7c:	68 be 71 10 80       	push   $0x801071be
80104b81:	e8 b2 b7 ff ff       	call   80100338 <panic>
80104b86:	66 90                	xchg   %ax,%ax

80104b88 <sys_open>:
80104b88:	55                   	push   %ebp
80104b89:	89 e5                	mov    %esp,%ebp
80104b8b:	57                   	push   %edi
80104b8c:	56                   	push   %esi
80104b8d:	53                   	push   %ebx
80104b8e:	83 ec 24             	sub    $0x24,%esp
80104b91:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104b94:	50                   	push   %eax
80104b95:	6a 00                	push   $0x0
80104b97:	e8 b8 f8 ff ff       	call   80104454 <argstr>
80104b9c:	83 c4 10             	add    $0x10,%esp
80104b9f:	85 c0                	test   %eax,%eax
80104ba1:	0f 88 88 00 00 00    	js     80104c2f <sys_open+0xa7>
80104ba7:	83 ec 08             	sub    $0x8,%esp
80104baa:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104bad:	50                   	push   %eax
80104bae:	6a 01                	push   $0x1
80104bb0:	e8 f3 f7 ff ff       	call   801043a8 <argint>
80104bb5:	83 c4 10             	add    $0x10,%esp
80104bb8:	85 c0                	test   %eax,%eax
80104bba:	78 73                	js     80104c2f <sys_open+0xa7>
80104bbc:	e8 0b de ff ff       	call   801029cc <begin_op>
80104bc1:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104bc5:	75 71                	jne    80104c38 <sys_open+0xb0>
80104bc7:	83 ec 0c             	sub    $0xc,%esp
80104bca:	ff 75 e0             	pushl  -0x20(%ebp)
80104bcd:	e8 ce d2 ff ff       	call   80101ea0 <namei>
80104bd2:	89 c6                	mov    %eax,%esi
80104bd4:	83 c4 10             	add    $0x10,%esp
80104bd7:	85 c0                	test   %eax,%eax
80104bd9:	74 7a                	je     80104c55 <sys_open+0xcd>
80104bdb:	83 ec 0c             	sub    $0xc,%esp
80104bde:	50                   	push   %eax
80104bdf:	e8 30 ca ff ff       	call   80101614 <ilock>
80104be4:	83 c4 10             	add    $0x10,%esp
80104be7:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104bec:	0f 84 ae 00 00 00    	je     80104ca0 <sys_open+0x118>
80104bf2:	e8 a1 c1 ff ff       	call   80100d98 <filealloc>
80104bf7:	89 c7                	mov    %eax,%edi
80104bf9:	85 c0                	test   %eax,%eax
80104bfb:	74 21                	je     80104c1e <sys_open+0x96>
80104bfd:	e8 0e e9 ff ff       	call   80103510 <myproc>
80104c02:	31 db                	xor    %ebx,%ebx
80104c04:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104c08:	85 d2                	test   %edx,%edx
80104c0a:	74 50                	je     80104c5c <sys_open+0xd4>
80104c0c:	43                   	inc    %ebx
80104c0d:	83 fb 10             	cmp    $0x10,%ebx
80104c10:	75 f2                	jne    80104c04 <sys_open+0x7c>
80104c12:	83 ec 0c             	sub    $0xc,%esp
80104c15:	57                   	push   %edi
80104c16:	e8 29 c2 ff ff       	call   80100e44 <fileclose>
80104c1b:	83 c4 10             	add    $0x10,%esp
80104c1e:	83 ec 0c             	sub    $0xc,%esp
80104c21:	56                   	push   %esi
80104c22:	e8 41 cc ff ff       	call   80101868 <iunlockput>
80104c27:	e8 08 de ff ff       	call   80102a34 <end_op>
80104c2c:	83 c4 10             	add    $0x10,%esp
80104c2f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c34:	eb 5f                	jmp    80104c95 <sys_open+0x10d>
80104c36:	66 90                	xchg   %ax,%ax
80104c38:	83 ec 0c             	sub    $0xc,%esp
80104c3b:	6a 00                	push   $0x0
80104c3d:	31 c9                	xor    %ecx,%ecx
80104c3f:	ba 02 00 00 00       	mov    $0x2,%edx
80104c44:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104c47:	e8 c4 f8 ff ff       	call   80104510 <create>
80104c4c:	89 c6                	mov    %eax,%esi
80104c4e:	83 c4 10             	add    $0x10,%esp
80104c51:	85 c0                	test   %eax,%eax
80104c53:	75 9d                	jne    80104bf2 <sys_open+0x6a>
80104c55:	e8 da dd ff ff       	call   80102a34 <end_op>
80104c5a:	eb d3                	jmp    80104c2f <sys_open+0xa7>
80104c5c:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	56                   	push   %esi
80104c64:	e8 73 ca ff ff       	call   801016dc <iunlock>
80104c69:	e8 c6 dd ff ff       	call   80102a34 <end_op>
80104c6e:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80104c74:	89 77 10             	mov    %esi,0x10(%edi)
80104c77:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
80104c7e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104c81:	89 d0                	mov    %edx,%eax
80104c83:	f7 d0                	not    %eax
80104c85:	83 e0 01             	and    $0x1,%eax
80104c88:	88 47 08             	mov    %al,0x8(%edi)
80104c8b:	83 c4 10             	add    $0x10,%esp
80104c8e:	83 e2 03             	and    $0x3,%edx
80104c91:	0f 95 47 09          	setne  0x9(%edi)
80104c95:	89 d8                	mov    %ebx,%eax
80104c97:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c9a:	5b                   	pop    %ebx
80104c9b:	5e                   	pop    %esi
80104c9c:	5f                   	pop    %edi
80104c9d:	5d                   	pop    %ebp
80104c9e:	c3                   	ret    
80104c9f:	90                   	nop
80104ca0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104ca3:	85 c9                	test   %ecx,%ecx
80104ca5:	0f 84 47 ff ff ff    	je     80104bf2 <sys_open+0x6a>
80104cab:	e9 6e ff ff ff       	jmp    80104c1e <sys_open+0x96>

80104cb0 <sys_mkdir>:
80104cb0:	55                   	push   %ebp
80104cb1:	89 e5                	mov    %esp,%ebp
80104cb3:	83 ec 18             	sub    $0x18,%esp
80104cb6:	e8 11 dd ff ff       	call   801029cc <begin_op>
80104cbb:	83 ec 08             	sub    $0x8,%esp
80104cbe:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cc1:	50                   	push   %eax
80104cc2:	6a 00                	push   $0x0
80104cc4:	e8 8b f7 ff ff       	call   80104454 <argstr>
80104cc9:	83 c4 10             	add    $0x10,%esp
80104ccc:	85 c0                	test   %eax,%eax
80104cce:	78 30                	js     80104d00 <sys_mkdir+0x50>
80104cd0:	83 ec 0c             	sub    $0xc,%esp
80104cd3:	6a 00                	push   $0x0
80104cd5:	31 c9                	xor    %ecx,%ecx
80104cd7:	ba 01 00 00 00       	mov    $0x1,%edx
80104cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cdf:	e8 2c f8 ff ff       	call   80104510 <create>
80104ce4:	83 c4 10             	add    $0x10,%esp
80104ce7:	85 c0                	test   %eax,%eax
80104ce9:	74 15                	je     80104d00 <sys_mkdir+0x50>
80104ceb:	83 ec 0c             	sub    $0xc,%esp
80104cee:	50                   	push   %eax
80104cef:	e8 74 cb ff ff       	call   80101868 <iunlockput>
80104cf4:	e8 3b dd ff ff       	call   80102a34 <end_op>
80104cf9:	83 c4 10             	add    $0x10,%esp
80104cfc:	31 c0                	xor    %eax,%eax
80104cfe:	c9                   	leave  
80104cff:	c3                   	ret    
80104d00:	e8 2f dd ff ff       	call   80102a34 <end_op>
80104d05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d0a:	c9                   	leave  
80104d0b:	c3                   	ret    

80104d0c <sys_mknod>:
80104d0c:	55                   	push   %ebp
80104d0d:	89 e5                	mov    %esp,%ebp
80104d0f:	83 ec 18             	sub    $0x18,%esp
80104d12:	e8 b5 dc ff ff       	call   801029cc <begin_op>
80104d17:	83 ec 08             	sub    $0x8,%esp
80104d1a:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104d1d:	50                   	push   %eax
80104d1e:	6a 00                	push   $0x0
80104d20:	e8 2f f7 ff ff       	call   80104454 <argstr>
80104d25:	83 c4 10             	add    $0x10,%esp
80104d28:	85 c0                	test   %eax,%eax
80104d2a:	78 60                	js     80104d8c <sys_mknod+0x80>
80104d2c:	83 ec 08             	sub    $0x8,%esp
80104d2f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d32:	50                   	push   %eax
80104d33:	6a 01                	push   $0x1
80104d35:	e8 6e f6 ff ff       	call   801043a8 <argint>
80104d3a:	83 c4 10             	add    $0x10,%esp
80104d3d:	85 c0                	test   %eax,%eax
80104d3f:	78 4b                	js     80104d8c <sys_mknod+0x80>
80104d41:	83 ec 08             	sub    $0x8,%esp
80104d44:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d47:	50                   	push   %eax
80104d48:	6a 02                	push   $0x2
80104d4a:	e8 59 f6 ff ff       	call   801043a8 <argint>
80104d4f:	83 c4 10             	add    $0x10,%esp
80104d52:	85 c0                	test   %eax,%eax
80104d54:	78 36                	js     80104d8c <sys_mknod+0x80>
80104d56:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104d5a:	83 ec 0c             	sub    $0xc,%esp
80104d5d:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
80104d61:	50                   	push   %eax
80104d62:	ba 03 00 00 00       	mov    $0x3,%edx
80104d67:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104d6a:	e8 a1 f7 ff ff       	call   80104510 <create>
80104d6f:	83 c4 10             	add    $0x10,%esp
80104d72:	85 c0                	test   %eax,%eax
80104d74:	74 16                	je     80104d8c <sys_mknod+0x80>
80104d76:	83 ec 0c             	sub    $0xc,%esp
80104d79:	50                   	push   %eax
80104d7a:	e8 e9 ca ff ff       	call   80101868 <iunlockput>
80104d7f:	e8 b0 dc ff ff       	call   80102a34 <end_op>
80104d84:	83 c4 10             	add    $0x10,%esp
80104d87:	31 c0                	xor    %eax,%eax
80104d89:	c9                   	leave  
80104d8a:	c3                   	ret    
80104d8b:	90                   	nop
80104d8c:	e8 a3 dc ff ff       	call   80102a34 <end_op>
80104d91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d96:	c9                   	leave  
80104d97:	c3                   	ret    

80104d98 <sys_chdir>:
80104d98:	55                   	push   %ebp
80104d99:	89 e5                	mov    %esp,%ebp
80104d9b:	56                   	push   %esi
80104d9c:	53                   	push   %ebx
80104d9d:	83 ec 10             	sub    $0x10,%esp
80104da0:	e8 6b e7 ff ff       	call   80103510 <myproc>
80104da5:	89 c6                	mov    %eax,%esi
80104da7:	e8 20 dc ff ff       	call   801029cc <begin_op>
80104dac:	83 ec 08             	sub    $0x8,%esp
80104daf:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104db2:	50                   	push   %eax
80104db3:	6a 00                	push   $0x0
80104db5:	e8 9a f6 ff ff       	call   80104454 <argstr>
80104dba:	83 c4 10             	add    $0x10,%esp
80104dbd:	85 c0                	test   %eax,%eax
80104dbf:	78 67                	js     80104e28 <sys_chdir+0x90>
80104dc1:	83 ec 0c             	sub    $0xc,%esp
80104dc4:	ff 75 f4             	pushl  -0xc(%ebp)
80104dc7:	e8 d4 d0 ff ff       	call   80101ea0 <namei>
80104dcc:	89 c3                	mov    %eax,%ebx
80104dce:	83 c4 10             	add    $0x10,%esp
80104dd1:	85 c0                	test   %eax,%eax
80104dd3:	74 53                	je     80104e28 <sys_chdir+0x90>
80104dd5:	83 ec 0c             	sub    $0xc,%esp
80104dd8:	50                   	push   %eax
80104dd9:	e8 36 c8 ff ff       	call   80101614 <ilock>
80104dde:	83 c4 10             	add    $0x10,%esp
80104de1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104de6:	75 28                	jne    80104e10 <sys_chdir+0x78>
80104de8:	83 ec 0c             	sub    $0xc,%esp
80104deb:	53                   	push   %ebx
80104dec:	e8 eb c8 ff ff       	call   801016dc <iunlock>
80104df1:	58                   	pop    %eax
80104df2:	ff 76 68             	pushl  0x68(%esi)
80104df5:	e8 26 c9 ff ff       	call   80101720 <iput>
80104dfa:	e8 35 dc ff ff       	call   80102a34 <end_op>
80104dff:	89 5e 68             	mov    %ebx,0x68(%esi)
80104e02:	83 c4 10             	add    $0x10,%esp
80104e05:	31 c0                	xor    %eax,%eax
80104e07:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e0a:	5b                   	pop    %ebx
80104e0b:	5e                   	pop    %esi
80104e0c:	5d                   	pop    %ebp
80104e0d:	c3                   	ret    
80104e0e:	66 90                	xchg   %ax,%ax
80104e10:	83 ec 0c             	sub    $0xc,%esp
80104e13:	53                   	push   %ebx
80104e14:	e8 4f ca ff ff       	call   80101868 <iunlockput>
80104e19:	e8 16 dc ff ff       	call   80102a34 <end_op>
80104e1e:	83 c4 10             	add    $0x10,%esp
80104e21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e26:	eb df                	jmp    80104e07 <sys_chdir+0x6f>
80104e28:	e8 07 dc ff ff       	call   80102a34 <end_op>
80104e2d:	eb f2                	jmp    80104e21 <sys_chdir+0x89>
80104e2f:	90                   	nop

80104e30 <sys_exec>:
80104e30:	55                   	push   %ebp
80104e31:	89 e5                	mov    %esp,%ebp
80104e33:	57                   	push   %edi
80104e34:	56                   	push   %esi
80104e35:	53                   	push   %ebx
80104e36:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80104e3c:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80104e42:	50                   	push   %eax
80104e43:	6a 00                	push   $0x0
80104e45:	e8 0a f6 ff ff       	call   80104454 <argstr>
80104e4a:	83 c4 10             	add    $0x10,%esp
80104e4d:	85 c0                	test   %eax,%eax
80104e4f:	78 79                	js     80104eca <sys_exec+0x9a>
80104e51:	83 ec 08             	sub    $0x8,%esp
80104e54:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80104e5a:	50                   	push   %eax
80104e5b:	6a 01                	push   $0x1
80104e5d:	e8 46 f5 ff ff       	call   801043a8 <argint>
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	85 c0                	test   %eax,%eax
80104e67:	78 61                	js     80104eca <sys_exec+0x9a>
80104e69:	50                   	push   %eax
80104e6a:	68 80 00 00 00       	push   $0x80
80104e6f:	6a 00                	push   $0x0
80104e71:	8d bd 68 ff ff ff    	lea    -0x98(%ebp),%edi
80104e77:	57                   	push   %edi
80104e78:	e8 0f f3 ff ff       	call   8010418c <memset>
80104e7d:	83 c4 10             	add    $0x10,%esp
80104e80:	31 db                	xor    %ebx,%ebx
80104e82:	31 f6                	xor    %esi,%esi
80104e84:	83 ec 08             	sub    $0x8,%esp
80104e87:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104e8d:	50                   	push   %eax
80104e8e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80104e94:	01 d8                	add    %ebx,%eax
80104e96:	50                   	push   %eax
80104e97:	e8 9c f4 ff ff       	call   80104338 <fetchint>
80104e9c:	83 c4 10             	add    $0x10,%esp
80104e9f:	85 c0                	test   %eax,%eax
80104ea1:	78 27                	js     80104eca <sys_exec+0x9a>
80104ea3:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80104ea9:	85 c0                	test   %eax,%eax
80104eab:	74 2b                	je     80104ed8 <sys_exec+0xa8>
80104ead:	83 ec 08             	sub    $0x8,%esp
80104eb0:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
80104eb3:	52                   	push   %edx
80104eb4:	50                   	push   %eax
80104eb5:	e8 ae f4 ff ff       	call   80104368 <fetchstr>
80104eba:	83 c4 10             	add    $0x10,%esp
80104ebd:	85 c0                	test   %eax,%eax
80104ebf:	78 09                	js     80104eca <sys_exec+0x9a>
80104ec1:	46                   	inc    %esi
80104ec2:	83 c3 04             	add    $0x4,%ebx
80104ec5:	83 fe 20             	cmp    $0x20,%esi
80104ec8:	75 ba                	jne    80104e84 <sys_exec+0x54>
80104eca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ecf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ed2:	5b                   	pop    %ebx
80104ed3:	5e                   	pop    %esi
80104ed4:	5f                   	pop    %edi
80104ed5:	5d                   	pop    %ebp
80104ed6:	c3                   	ret    
80104ed7:	90                   	nop
80104ed8:	c7 84 b5 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%esi,4)
80104edf:	00 00 00 00 
80104ee3:	83 ec 08             	sub    $0x8,%esp
80104ee6:	57                   	push   %edi
80104ee7:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
80104eed:	e8 2e bb ff ff       	call   80100a20 <exec>
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ef8:	5b                   	pop    %ebx
80104ef9:	5e                   	pop    %esi
80104efa:	5f                   	pop    %edi
80104efb:	5d                   	pop    %ebp
80104efc:	c3                   	ret    
80104efd:	8d 76 00             	lea    0x0(%esi),%esi

80104f00 <sys_pipe>:
80104f00:	55                   	push   %ebp
80104f01:	89 e5                	mov    %esp,%ebp
80104f03:	57                   	push   %edi
80104f04:	56                   	push   %esi
80104f05:	53                   	push   %ebx
80104f06:	83 ec 20             	sub    $0x20,%esp
80104f09:	6a 08                	push   $0x8
80104f0b:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104f0e:	50                   	push   %eax
80104f0f:	6a 00                	push   $0x0
80104f11:	e8 d6 f4 ff ff       	call   801043ec <argptr>
80104f16:	83 c4 10             	add    $0x10,%esp
80104f19:	85 c0                	test   %eax,%eax
80104f1b:	78 7d                	js     80104f9a <sys_pipe+0x9a>
80104f1d:	83 ec 08             	sub    $0x8,%esp
80104f20:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104f23:	50                   	push   %eax
80104f24:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104f27:	50                   	push   %eax
80104f28:	e8 b7 e0 ff ff       	call   80102fe4 <pipealloc>
80104f2d:	83 c4 10             	add    $0x10,%esp
80104f30:	85 c0                	test   %eax,%eax
80104f32:	78 66                	js     80104f9a <sys_pipe+0x9a>
80104f34:	8b 7d e0             	mov    -0x20(%ebp),%edi
80104f37:	e8 d4 e5 ff ff       	call   80103510 <myproc>
80104f3c:	31 db                	xor    %ebx,%ebx
80104f3e:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80104f42:	85 f6                	test   %esi,%esi
80104f44:	74 10                	je     80104f56 <sys_pipe+0x56>
80104f46:	66 90                	xchg   %ax,%ax
80104f48:	43                   	inc    %ebx
80104f49:	83 fb 10             	cmp    $0x10,%ebx
80104f4c:	74 35                	je     80104f83 <sys_pipe+0x83>
80104f4e:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80104f52:	85 f6                	test   %esi,%esi
80104f54:	75 f2                	jne    80104f48 <sys_pipe+0x48>
80104f56:	8d 73 08             	lea    0x8(%ebx),%esi
80104f59:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80104f5d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80104f60:	e8 ab e5 ff ff       	call   80103510 <myproc>
80104f65:	31 d2                	xor    %edx,%edx
80104f67:	90                   	nop
80104f68:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80104f6c:	85 c9                	test   %ecx,%ecx
80104f6e:	74 34                	je     80104fa4 <sys_pipe+0xa4>
80104f70:	42                   	inc    %edx
80104f71:	83 fa 10             	cmp    $0x10,%edx
80104f74:	75 f2                	jne    80104f68 <sys_pipe+0x68>
80104f76:	e8 95 e5 ff ff       	call   80103510 <myproc>
80104f7b:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80104f82:	00 
80104f83:	83 ec 0c             	sub    $0xc,%esp
80104f86:	ff 75 e0             	pushl  -0x20(%ebp)
80104f89:	e8 b6 be ff ff       	call   80100e44 <fileclose>
80104f8e:	58                   	pop    %eax
80104f8f:	ff 75 e4             	pushl  -0x1c(%ebp)
80104f92:	e8 ad be ff ff       	call   80100e44 <fileclose>
80104f97:	83 c4 10             	add    $0x10,%esp
80104f9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f9f:	eb 14                	jmp    80104fb5 <sys_pipe+0xb5>
80104fa1:	8d 76 00             	lea    0x0(%esi),%esi
80104fa4:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80104fa8:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104fab:	89 18                	mov    %ebx,(%eax)
80104fad:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104fb0:	89 50 04             	mov    %edx,0x4(%eax)
80104fb3:	31 c0                	xor    %eax,%eax
80104fb5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fb8:	5b                   	pop    %ebx
80104fb9:	5e                   	pop    %esi
80104fba:	5f                   	pop    %edi
80104fbb:	5d                   	pop    %ebp
80104fbc:	c3                   	ret    
80104fbd:	66 90                	xchg   %ax,%ax
80104fbf:	90                   	nop

80104fc0 <sys_fork>:
80104fc0:	e9 c3 e6 ff ff       	jmp    80103688 <fork>
80104fc5:	8d 76 00             	lea    0x0(%esi),%esi

80104fc8 <sys_exit>:
80104fc8:	55                   	push   %ebp
80104fc9:	89 e5                	mov    %esp,%ebp
80104fcb:	83 ec 08             	sub    $0x8,%esp
80104fce:	e8 69 e9 ff ff       	call   8010393c <exit>
80104fd3:	31 c0                	xor    %eax,%eax
80104fd5:	c9                   	leave  
80104fd6:	c3                   	ret    
80104fd7:	90                   	nop

80104fd8 <sys_wait>:
80104fd8:	e9 7b ea ff ff       	jmp    80103a58 <wait>
80104fdd:	8d 76 00             	lea    0x0(%esi),%esi

80104fe0 <sys_kill>:
80104fe0:	55                   	push   %ebp
80104fe1:	89 e5                	mov    %esp,%ebp
80104fe3:	83 ec 20             	sub    $0x20,%esp
80104fe6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fe9:	50                   	push   %eax
80104fea:	6a 00                	push   $0x0
80104fec:	e8 b7 f3 ff ff       	call   801043a8 <argint>
80104ff1:	83 c4 10             	add    $0x10,%esp
80104ff4:	85 c0                	test   %eax,%eax
80104ff6:	78 10                	js     80105008 <sys_kill+0x28>
80104ff8:	83 ec 0c             	sub    $0xc,%esp
80104ffb:	ff 75 f4             	pushl  -0xc(%ebp)
80104ffe:	e8 d9 ec ff ff       	call   80103cdc <kill>
80105003:	83 c4 10             	add    $0x10,%esp
80105006:	c9                   	leave  
80105007:	c3                   	ret    
80105008:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010500d:	c9                   	leave  
8010500e:	c3                   	ret    
8010500f:	90                   	nop

80105010 <sys_getpid>:
80105010:	55                   	push   %ebp
80105011:	89 e5                	mov    %esp,%ebp
80105013:	83 ec 08             	sub    $0x8,%esp
80105016:	e8 f5 e4 ff ff       	call   80103510 <myproc>
8010501b:	8b 40 10             	mov    0x10(%eax),%eax
8010501e:	c9                   	leave  
8010501f:	c3                   	ret    

80105020 <sys_sbrk>:
80105020:	55                   	push   %ebp
80105021:	89 e5                	mov    %esp,%ebp
80105023:	53                   	push   %ebx
80105024:	83 ec 1c             	sub    $0x1c,%esp
80105027:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010502a:	50                   	push   %eax
8010502b:	6a 00                	push   $0x0
8010502d:	e8 76 f3 ff ff       	call   801043a8 <argint>
80105032:	83 c4 10             	add    $0x10,%esp
80105035:	85 c0                	test   %eax,%eax
80105037:	78 23                	js     8010505c <sys_sbrk+0x3c>
80105039:	e8 d2 e4 ff ff       	call   80103510 <myproc>
8010503e:	8b 18                	mov    (%eax),%ebx
80105040:	83 ec 0c             	sub    $0xc,%esp
80105043:	ff 75 f4             	pushl  -0xc(%ebp)
80105046:	e8 cd e5 ff ff       	call   80103618 <growproc>
8010504b:	83 c4 10             	add    $0x10,%esp
8010504e:	85 c0                	test   %eax,%eax
80105050:	78 0a                	js     8010505c <sys_sbrk+0x3c>
80105052:	89 d8                	mov    %ebx,%eax
80105054:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105057:	c9                   	leave  
80105058:	c3                   	ret    
80105059:	8d 76 00             	lea    0x0(%esi),%esi
8010505c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105061:	eb ef                	jmp    80105052 <sys_sbrk+0x32>
80105063:	90                   	nop

80105064 <sys_sleep>:
80105064:	55                   	push   %ebp
80105065:	89 e5                	mov    %esp,%ebp
80105067:	53                   	push   %ebx
80105068:	83 ec 1c             	sub    $0x1c,%esp
8010506b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010506e:	50                   	push   %eax
8010506f:	6a 00                	push   $0x0
80105071:	e8 32 f3 ff ff       	call   801043a8 <argint>
80105076:	83 c4 10             	add    $0x10,%esp
80105079:	85 c0                	test   %eax,%eax
8010507b:	78 5c                	js     801050d9 <sys_sleep+0x75>
8010507d:	83 ec 0c             	sub    $0xc,%esp
80105080:	68 80 41 11 80       	push   $0x80114180
80105085:	e8 42 f0 ff ff       	call   801040cc <acquire>
8010508a:	8b 1d 60 41 11 80    	mov    0x80114160,%ebx
80105090:	83 c4 10             	add    $0x10,%esp
80105093:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105096:	85 d2                	test   %edx,%edx
80105098:	75 23                	jne    801050bd <sys_sleep+0x59>
8010509a:	eb 48                	jmp    801050e4 <sys_sleep+0x80>
8010509c:	83 ec 08             	sub    $0x8,%esp
8010509f:	68 80 41 11 80       	push   $0x80114180
801050a4:	68 60 41 11 80       	push   $0x80114160
801050a9:	e8 16 eb ff ff       	call   80103bc4 <sleep>
801050ae:	a1 60 41 11 80       	mov    0x80114160,%eax
801050b3:	29 d8                	sub    %ebx,%eax
801050b5:	83 c4 10             	add    $0x10,%esp
801050b8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801050bb:	73 27                	jae    801050e4 <sys_sleep+0x80>
801050bd:	e8 4e e4 ff ff       	call   80103510 <myproc>
801050c2:	8b 40 24             	mov    0x24(%eax),%eax
801050c5:	85 c0                	test   %eax,%eax
801050c7:	74 d3                	je     8010509c <sys_sleep+0x38>
801050c9:	83 ec 0c             	sub    $0xc,%esp
801050cc:	68 80 41 11 80       	push   $0x80114180
801050d1:	e8 96 ef ff ff       	call   8010406c <release>
801050d6:	83 c4 10             	add    $0x10,%esp
801050d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801050e1:	c9                   	leave  
801050e2:	c3                   	ret    
801050e3:	90                   	nop
801050e4:	83 ec 0c             	sub    $0xc,%esp
801050e7:	68 80 41 11 80       	push   $0x80114180
801050ec:	e8 7b ef ff ff       	call   8010406c <release>
801050f1:	83 c4 10             	add    $0x10,%esp
801050f4:	31 c0                	xor    %eax,%eax
801050f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801050f9:	c9                   	leave  
801050fa:	c3                   	ret    
801050fb:	90                   	nop

801050fc <sys_uptime>:
801050fc:	55                   	push   %ebp
801050fd:	89 e5                	mov    %esp,%ebp
801050ff:	53                   	push   %ebx
80105100:	83 ec 10             	sub    $0x10,%esp
80105103:	68 80 41 11 80       	push   $0x80114180
80105108:	e8 bf ef ff ff       	call   801040cc <acquire>
8010510d:	8b 1d 60 41 11 80    	mov    0x80114160,%ebx
80105113:	c7 04 24 80 41 11 80 	movl   $0x80114180,(%esp)
8010511a:	e8 4d ef ff ff       	call   8010406c <release>
8010511f:	89 d8                	mov    %ebx,%eax
80105121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105124:	c9                   	leave  
80105125:	c3                   	ret    
80105126:	66 90                	xchg   %ax,%ax

80105128 <sys_cpu_limit>:
80105128:	55                   	push   %ebp
80105129:	89 e5                	mov    %esp,%ebp
8010512b:	53                   	push   %ebx
8010512c:	83 ec 1c             	sub    $0x1c,%esp
8010512f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105132:	50                   	push   %eax
80105133:	6a 00                	push   $0x0
80105135:	e8 6e f2 ff ff       	call   801043a8 <argint>
8010513a:	83 c4 10             	add    $0x10,%esp
8010513d:	85 c0                	test   %eax,%eax
8010513f:	78 3b                	js     8010517c <sys_cpu_limit+0x54>
80105141:	83 7d f4 64          	cmpl   $0x64,-0xc(%ebp)
80105145:	77 35                	ja     8010517c <sys_cpu_limit+0x54>
80105147:	e8 c4 e3 ff ff       	call   80103510 <myproc>
8010514c:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010514f:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
80105155:	e8 b6 e3 ff ff       	call   80103510 <myproc>
8010515a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
80105161:	00 00 00 
80105164:	8b 1d 60 41 11 80    	mov    0x80114160,%ebx
8010516a:	e8 a1 e3 ff ff       	call   80103510 <myproc>
8010516f:	89 58 7c             	mov    %ebx,0x7c(%eax)
80105172:	31 c0                	xor    %eax,%eax
80105174:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105177:	c9                   	leave  
80105178:	c3                   	ret    
80105179:	8d 76 00             	lea    0x0(%esi),%esi
8010517c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105181:	eb f1                	jmp    80105174 <sys_cpu_limit+0x4c>
80105183:	90                   	nop

80105184 <sys_set_mem_limit>:
80105184:	55                   	push   %ebp
80105185:	89 e5                	mov    %esp,%ebp
80105187:	53                   	push   %ebx
80105188:	83 ec 14             	sub    $0x14,%esp
8010518b:	e8 80 e3 ff ff       	call   80103510 <myproc>
80105190:	89 c3                	mov    %eax,%ebx
80105192:	83 ec 08             	sub    $0x8,%esp
80105195:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105198:	50                   	push   %eax
80105199:	6a 00                	push   $0x0
8010519b:	e8 08 f2 ff ff       	call   801043a8 <argint>
801051a0:	83 c4 10             	add    $0x10,%esp
801051a3:	85 c0                	test   %eax,%eax
801051a5:	78 10                	js     801051b7 <sys_set_mem_limit+0x33>
801051a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051aa:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
801051b0:	31 c0                	xor    %eax,%eax
801051b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801051b5:	c9                   	leave  
801051b6:	c3                   	ret    
801051b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051bc:	eb f4                	jmp    801051b2 <sys_set_mem_limit+0x2e>
801051be:	66 90                	xchg   %ax,%ax

801051c0 <sys_get_mem_limit>:
801051c0:	55                   	push   %ebp
801051c1:	89 e5                	mov    %esp,%ebp
801051c3:	83 ec 08             	sub    $0x8,%esp
801051c6:	e8 45 e3 ff ff       	call   80103510 <myproc>
801051cb:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
801051d1:	c9                   	leave  
801051d2:	c3                   	ret    
801051d3:	90                   	nop

801051d4 <sys_increase_mem_limit>:
801051d4:	55                   	push   %ebp
801051d5:	89 e5                	mov    %esp,%ebp
801051d7:	53                   	push   %ebx
801051d8:	83 ec 14             	sub    $0x14,%esp
801051db:	e8 30 e3 ff ff       	call   80103510 <myproc>
801051e0:	89 c3                	mov    %eax,%ebx
801051e2:	83 ec 08             	sub    $0x8,%esp
801051e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051e8:	50                   	push   %eax
801051e9:	6a 00                	push   $0x0
801051eb:	e8 b8 f1 ff ff       	call   801043a8 <argint>
801051f0:	83 c4 10             	add    $0x10,%esp
801051f3:	85 c0                	test   %eax,%eax
801051f5:	78 10                	js     80105207 <sys_increase_mem_limit+0x33>
801051f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051fa:	01 83 88 00 00 00    	add    %eax,0x88(%ebx)
80105200:	31 c0                	xor    %eax,%eax
80105202:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105205:	c9                   	leave  
80105206:	c3                   	ret    
80105207:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010520c:	eb f4                	jmp    80105202 <sys_increase_mem_limit+0x2e>
8010520e:	66 90                	xchg   %ax,%ax

80105210 <sys_increase_mem_usage>:
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	56                   	push   %esi
80105214:	53                   	push   %ebx
80105215:	83 ec 10             	sub    $0x10,%esp
80105218:	e8 f3 e2 ff ff       	call   80103510 <myproc>
8010521d:	89 c3                	mov    %eax,%ebx
8010521f:	83 ec 08             	sub    $0x8,%esp
80105222:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105225:	50                   	push   %eax
80105226:	6a 00                	push   $0x0
80105228:	e8 7b f1 ff ff       	call   801043a8 <argint>
8010522d:	83 c4 10             	add    $0x10,%esp
80105230:	85 c0                	test   %eax,%eax
80105232:	78 50                	js     80105284 <sys_increase_mem_usage+0x74>
80105234:	8d 73 6c             	lea    0x6c(%ebx),%esi
80105237:	51                   	push   %ecx
80105238:	6a 02                	push   $0x2
8010523a:	68 f1 71 10 80       	push   $0x801071f1
8010523f:	56                   	push   %esi
80105240:	e8 8b ef ff ff       	call   801041d0 <memcmp>
80105245:	83 c4 10             	add    $0x10,%esp
80105248:	85 c0                	test   %eax,%eax
8010524a:	74 24                	je     80105270 <sys_increase_mem_usage+0x60>
8010524c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010524f:	01 83 8c 00 00 00    	add    %eax,0x8c(%ebx)
80105255:	52                   	push   %edx
80105256:	56                   	push   %esi
80105257:	50                   	push   %eax
80105258:	68 1c 72 10 80       	push   $0x8010721c
8010525d:	e8 c6 b3 ff ff       	call   80100628 <cprintf>
80105262:	83 c4 10             	add    $0x10,%esp
80105265:	31 c0                	xor    %eax,%eax
80105267:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010526a:	5b                   	pop    %ebx
8010526b:	5e                   	pop    %esi
8010526c:	5d                   	pop    %ebp
8010526d:	c3                   	ret    
8010526e:	66 90                	xchg   %ax,%ax
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	68 f4 71 10 80       	push   $0x801071f4
80105278:	e8 ab b3 ff ff       	call   80100628 <cprintf>
8010527d:	83 c4 10             	add    $0x10,%esp
80105280:	eb e3                	jmp    80105265 <sys_increase_mem_usage+0x55>
80105282:	66 90                	xchg   %ax,%ax
80105284:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105289:	eb dc                	jmp    80105267 <sys_increase_mem_usage+0x57>
8010528b:	90                   	nop

8010528c <sys_get_mem_usage>:
8010528c:	55                   	push   %ebp
8010528d:	89 e5                	mov    %esp,%ebp
8010528f:	83 ec 08             	sub    $0x8,%esp
80105292:	e8 79 e2 ff ff       	call   80103510 <myproc>
80105297:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010529d:	c9                   	leave  
8010529e:	c3                   	ret    

8010529f <alltraps>:
8010529f:	1e                   	push   %ds
801052a0:	06                   	push   %es
801052a1:	0f a0                	push   %fs
801052a3:	0f a8                	push   %gs
801052a5:	60                   	pusha  
801052a6:	66 b8 10 00          	mov    $0x10,%ax
801052aa:	8e d8                	mov    %eax,%ds
801052ac:	8e c0                	mov    %eax,%es
801052ae:	54                   	push   %esp
801052af:	e8 a0 00 00 00       	call   80105354 <trap>
801052b4:	83 c4 04             	add    $0x4,%esp

801052b7 <trapret>:
801052b7:	61                   	popa   
801052b8:	0f a9                	pop    %gs
801052ba:	0f a1                	pop    %fs
801052bc:	07                   	pop    %es
801052bd:	1f                   	pop    %ds
801052be:	83 c4 08             	add    $0x8,%esp
801052c1:	cf                   	iret   
801052c2:	66 90                	xchg   %ax,%ax

801052c4 <tvinit>:
801052c4:	55                   	push   %ebp
801052c5:	89 e5                	mov    %esp,%ebp
801052c7:	83 ec 08             	sub    $0x8,%esp
801052ca:	31 c0                	xor    %eax,%eax
801052cc:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801052d3:	66 89 14 c5 c0 41 11 	mov    %dx,-0x7feebe40(,%eax,8)
801052da:	80 
801052db:	c7 04 c5 c2 41 11 80 	movl   $0x8e000008,-0x7feebe3e(,%eax,8)
801052e2:	08 00 00 8e 
801052e6:	c1 ea 10             	shr    $0x10,%edx
801052e9:	66 89 14 c5 c6 41 11 	mov    %dx,-0x7feebe3a(,%eax,8)
801052f0:	80 
801052f1:	40                   	inc    %eax
801052f2:	3d 00 01 00 00       	cmp    $0x100,%eax
801052f7:	75 d3                	jne    801052cc <tvinit+0x8>
801052f9:	a1 08 a1 10 80       	mov    0x8010a108,%eax
801052fe:	66 a3 c0 43 11 80    	mov    %ax,0x801143c0
80105304:	c7 05 c2 43 11 80 08 	movl   $0xef000008,0x801143c2
8010530b:	00 00 ef 
8010530e:	c1 e8 10             	shr    $0x10,%eax
80105311:	66 a3 c6 43 11 80    	mov    %ax,0x801143c6
80105317:	83 ec 08             	sub    $0x8,%esp
8010531a:	68 4c 72 10 80       	push   $0x8010724c
8010531f:	68 80 41 11 80       	push   $0x80114180
80105324:	e8 e3 eb ff ff       	call   80103f0c <initlock>
80105329:	83 c4 10             	add    $0x10,%esp
8010532c:	c9                   	leave  
8010532d:	c3                   	ret    
8010532e:	66 90                	xchg   %ax,%ax

80105330 <idtinit>:
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	83 ec 10             	sub    $0x10,%esp
80105336:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
8010533c:	b8 c0 41 11 80       	mov    $0x801141c0,%eax
80105341:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105345:	c1 e8 10             	shr    $0x10,%eax
80105348:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010534c:	8d 45 fa             	lea    -0x6(%ebp),%eax
8010534f:	0f 01 18             	lidtl  (%eax)
80105352:	c9                   	leave  
80105353:	c3                   	ret    

80105354 <trap>:
80105354:	55                   	push   %ebp
80105355:	89 e5                	mov    %esp,%ebp
80105357:	57                   	push   %edi
80105358:	56                   	push   %esi
80105359:	53                   	push   %ebx
8010535a:	83 ec 1c             	sub    $0x1c,%esp
8010535d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105360:	8b 43 30             	mov    0x30(%ebx),%eax
80105363:	83 f8 40             	cmp    $0x40,%eax
80105366:	0f 84 4c 01 00 00    	je     801054b8 <trap+0x164>
8010536c:	83 e8 20             	sub    $0x20,%eax
8010536f:	83 f8 1f             	cmp    $0x1f,%eax
80105372:	77 7c                	ja     801053f0 <trap+0x9c>
80105374:	ff 24 85 f4 72 10 80 	jmp    *-0x7fef8d0c(,%eax,4)
8010537b:	90                   	nop
8010537c:	e8 73 cc ff ff       	call   80101ff4 <ideintr>
80105381:	e8 7a d2 ff ff       	call   80102600 <lapiceoi>
80105386:	e8 85 e1 ff ff       	call   80103510 <myproc>
8010538b:	85 c0                	test   %eax,%eax
8010538d:	74 1c                	je     801053ab <trap+0x57>
8010538f:	e8 7c e1 ff ff       	call   80103510 <myproc>
80105394:	8b 50 24             	mov    0x24(%eax),%edx
80105397:	85 d2                	test   %edx,%edx
80105399:	74 10                	je     801053ab <trap+0x57>
8010539b:	8b 43 3c             	mov    0x3c(%ebx),%eax
8010539e:	83 e0 03             	and    $0x3,%eax
801053a1:	66 83 f8 03          	cmp    $0x3,%ax
801053a5:	0f 84 c1 01 00 00    	je     8010556c <trap+0x218>
801053ab:	e8 60 e1 ff ff       	call   80103510 <myproc>
801053b0:	85 c0                	test   %eax,%eax
801053b2:	74 0f                	je     801053c3 <trap+0x6f>
801053b4:	e8 57 e1 ff ff       	call   80103510 <myproc>
801053b9:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801053bd:	0f 84 ad 00 00 00    	je     80105470 <trap+0x11c>
801053c3:	e8 48 e1 ff ff       	call   80103510 <myproc>
801053c8:	85 c0                	test   %eax,%eax
801053ca:	74 1c                	je     801053e8 <trap+0x94>
801053cc:	e8 3f e1 ff ff       	call   80103510 <myproc>
801053d1:	8b 40 24             	mov    0x24(%eax),%eax
801053d4:	85 c0                	test   %eax,%eax
801053d6:	74 10                	je     801053e8 <trap+0x94>
801053d8:	8b 43 3c             	mov    0x3c(%ebx),%eax
801053db:	83 e0 03             	and    $0x3,%eax
801053de:	66 83 f8 03          	cmp    $0x3,%ax
801053e2:	0f 84 fd 00 00 00    	je     801054e5 <trap+0x191>
801053e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053eb:	5b                   	pop    %ebx
801053ec:	5e                   	pop    %esi
801053ed:	5f                   	pop    %edi
801053ee:	5d                   	pop    %ebp
801053ef:	c3                   	ret    
801053f0:	e8 1b e1 ff ff       	call   80103510 <myproc>
801053f5:	8b 7b 38             	mov    0x38(%ebx),%edi
801053f8:	85 c0                	test   %eax,%eax
801053fa:	0f 84 82 01 00 00    	je     80105582 <trap+0x22e>
80105400:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105404:	0f 84 78 01 00 00    	je     80105582 <trap+0x22e>
8010540a:	0f 20 d1             	mov    %cr2,%ecx
8010540d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105410:	e8 c7 e0 ff ff       	call   801034dc <cpuid>
80105415:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105418:	8b 43 34             	mov    0x34(%ebx),%eax
8010541b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010541e:	8b 73 30             	mov    0x30(%ebx),%esi
80105421:	e8 ea e0 ff ff       	call   80103510 <myproc>
80105426:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105429:	e8 e2 e0 ff ff       	call   80103510 <myproc>
8010542e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105431:	51                   	push   %ecx
80105432:	57                   	push   %edi
80105433:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105436:	52                   	push   %edx
80105437:	ff 75 e4             	pushl  -0x1c(%ebp)
8010543a:	56                   	push   %esi
8010543b:	8b 75 e0             	mov    -0x20(%ebp),%esi
8010543e:	83 c6 6c             	add    $0x6c,%esi
80105441:	56                   	push   %esi
80105442:	ff 70 10             	pushl  0x10(%eax)
80105445:	68 b0 72 10 80       	push   $0x801072b0
8010544a:	e8 d9 b1 ff ff       	call   80100628 <cprintf>
8010544f:	83 c4 20             	add    $0x20,%esp
80105452:	e8 b9 e0 ff ff       	call   80103510 <myproc>
80105457:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010545e:	e8 ad e0 ff ff       	call   80103510 <myproc>
80105463:	85 c0                	test   %eax,%eax
80105465:	0f 85 24 ff ff ff    	jne    8010538f <trap+0x3b>
8010546b:	e9 3b ff ff ff       	jmp    801053ab <trap+0x57>
80105470:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105474:	0f 85 49 ff ff ff    	jne    801053c3 <trap+0x6f>
8010547a:	e8 fd e6 ff ff       	call   80103b7c <yield>
8010547f:	e9 3f ff ff ff       	jmp    801053c3 <trap+0x6f>
80105484:	8b 7b 38             	mov    0x38(%ebx),%edi
80105487:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
8010548b:	e8 4c e0 ff ff       	call   801034dc <cpuid>
80105490:	57                   	push   %edi
80105491:	56                   	push   %esi
80105492:	50                   	push   %eax
80105493:	68 58 72 10 80       	push   $0x80107258
80105498:	e8 8b b1 ff ff       	call   80100628 <cprintf>
8010549d:	e8 5e d1 ff ff       	call   80102600 <lapiceoi>
801054a2:	83 c4 10             	add    $0x10,%esp
801054a5:	e8 66 e0 ff ff       	call   80103510 <myproc>
801054aa:	85 c0                	test   %eax,%eax
801054ac:	0f 85 dd fe ff ff    	jne    8010538f <trap+0x3b>
801054b2:	e9 f4 fe ff ff       	jmp    801053ab <trap+0x57>
801054b7:	90                   	nop
801054b8:	e8 53 e0 ff ff       	call   80103510 <myproc>
801054bd:	8b 70 24             	mov    0x24(%eax),%esi
801054c0:	85 f6                	test   %esi,%esi
801054c2:	0f 85 b0 00 00 00    	jne    80105578 <trap+0x224>
801054c8:	e8 43 e0 ff ff       	call   80103510 <myproc>
801054cd:	89 58 18             	mov    %ebx,0x18(%eax)
801054d0:	e8 e3 ef ff ff       	call   801044b8 <syscall>
801054d5:	e8 36 e0 ff ff       	call   80103510 <myproc>
801054da:	8b 48 24             	mov    0x24(%eax),%ecx
801054dd:	85 c9                	test   %ecx,%ecx
801054df:	0f 84 03 ff ff ff    	je     801053e8 <trap+0x94>
801054e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054e8:	5b                   	pop    %ebx
801054e9:	5e                   	pop    %esi
801054ea:	5f                   	pop    %edi
801054eb:	5d                   	pop    %ebp
801054ec:	e9 4b e4 ff ff       	jmp    8010393c <exit>
801054f1:	8d 76 00             	lea    0x0(%esi),%esi
801054f4:	e8 f3 01 00 00       	call   801056ec <uartintr>
801054f9:	e8 02 d1 ff ff       	call   80102600 <lapiceoi>
801054fe:	e8 0d e0 ff ff       	call   80103510 <myproc>
80105503:	85 c0                	test   %eax,%eax
80105505:	0f 85 84 fe ff ff    	jne    8010538f <trap+0x3b>
8010550b:	e9 9b fe ff ff       	jmp    801053ab <trap+0x57>
80105510:	e8 db cf ff ff       	call   801024f0 <kbdintr>
80105515:	e8 e6 d0 ff ff       	call   80102600 <lapiceoi>
8010551a:	e8 f1 df ff ff       	call   80103510 <myproc>
8010551f:	85 c0                	test   %eax,%eax
80105521:	0f 85 68 fe ff ff    	jne    8010538f <trap+0x3b>
80105527:	e9 7f fe ff ff       	jmp    801053ab <trap+0x57>
8010552c:	e8 ab df ff ff       	call   801034dc <cpuid>
80105531:	85 c0                	test   %eax,%eax
80105533:	0f 85 48 fe ff ff    	jne    80105381 <trap+0x2d>
80105539:	83 ec 0c             	sub    $0xc,%esp
8010553c:	68 80 41 11 80       	push   $0x80114180
80105541:	e8 86 eb ff ff       	call   801040cc <acquire>
80105546:	ff 05 60 41 11 80    	incl   0x80114160
8010554c:	c7 04 24 60 41 11 80 	movl   $0x80114160,(%esp)
80105553:	e8 28 e7 ff ff       	call   80103c80 <wakeup>
80105558:	c7 04 24 80 41 11 80 	movl   $0x80114180,(%esp)
8010555f:	e8 08 eb ff ff       	call   8010406c <release>
80105564:	83 c4 10             	add    $0x10,%esp
80105567:	e9 15 fe ff ff       	jmp    80105381 <trap+0x2d>
8010556c:	e8 cb e3 ff ff       	call   8010393c <exit>
80105571:	e9 35 fe ff ff       	jmp    801053ab <trap+0x57>
80105576:	66 90                	xchg   %ax,%ax
80105578:	e8 bf e3 ff ff       	call   8010393c <exit>
8010557d:	e9 46 ff ff ff       	jmp    801054c8 <trap+0x174>
80105582:	0f 20 d6             	mov    %cr2,%esi
80105585:	e8 52 df ff ff       	call   801034dc <cpuid>
8010558a:	83 ec 0c             	sub    $0xc,%esp
8010558d:	56                   	push   %esi
8010558e:	57                   	push   %edi
8010558f:	50                   	push   %eax
80105590:	ff 73 30             	pushl  0x30(%ebx)
80105593:	68 7c 72 10 80       	push   $0x8010727c
80105598:	e8 8b b0 ff ff       	call   80100628 <cprintf>
8010559d:	83 c4 14             	add    $0x14,%esp
801055a0:	68 51 72 10 80       	push   $0x80107251
801055a5:	e8 8e ad ff ff       	call   80100338 <panic>
801055aa:	66 90                	xchg   %ax,%ax

801055ac <uartgetc>:
801055ac:	a1 c0 49 11 80       	mov    0x801149c0,%eax
801055b1:	85 c0                	test   %eax,%eax
801055b3:	74 17                	je     801055cc <uartgetc+0x20>
801055b5:	ba fd 03 00 00       	mov    $0x3fd,%edx
801055ba:	ec                   	in     (%dx),%al
801055bb:	a8 01                	test   $0x1,%al
801055bd:	74 0d                	je     801055cc <uartgetc+0x20>
801055bf:	ba f8 03 00 00       	mov    $0x3f8,%edx
801055c4:	ec                   	in     (%dx),%al
801055c5:	0f b6 c0             	movzbl %al,%eax
801055c8:	c3                   	ret    
801055c9:	8d 76 00             	lea    0x0(%esi),%esi
801055cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055d1:	c3                   	ret    
801055d2:	66 90                	xchg   %ax,%ax

801055d4 <uartinit>:
801055d4:	55                   	push   %ebp
801055d5:	89 e5                	mov    %esp,%ebp
801055d7:	57                   	push   %edi
801055d8:	56                   	push   %esi
801055d9:	53                   	push   %ebx
801055da:	83 ec 1c             	sub    $0x1c,%esp
801055dd:	bf fa 03 00 00       	mov    $0x3fa,%edi
801055e2:	31 c0                	xor    %eax,%eax
801055e4:	89 fa                	mov    %edi,%edx
801055e6:	ee                   	out    %al,(%dx)
801055e7:	bb fb 03 00 00       	mov    $0x3fb,%ebx
801055ec:	b0 80                	mov    $0x80,%al
801055ee:	89 da                	mov    %ebx,%edx
801055f0:	ee                   	out    %al,(%dx)
801055f1:	be f8 03 00 00       	mov    $0x3f8,%esi
801055f6:	b0 0c                	mov    $0xc,%al
801055f8:	89 f2                	mov    %esi,%edx
801055fa:	ee                   	out    %al,(%dx)
801055fb:	b9 f9 03 00 00       	mov    $0x3f9,%ecx
80105600:	31 c0                	xor    %eax,%eax
80105602:	89 ca                	mov    %ecx,%edx
80105604:	ee                   	out    %al,(%dx)
80105605:	b0 03                	mov    $0x3,%al
80105607:	89 da                	mov    %ebx,%edx
80105609:	ee                   	out    %al,(%dx)
8010560a:	ba fc 03 00 00       	mov    $0x3fc,%edx
8010560f:	31 c0                	xor    %eax,%eax
80105611:	ee                   	out    %al,(%dx)
80105612:	b0 01                	mov    $0x1,%al
80105614:	89 ca                	mov    %ecx,%edx
80105616:	ee                   	out    %al,(%dx)
80105617:	ba fd 03 00 00       	mov    $0x3fd,%edx
8010561c:	ec                   	in     (%dx),%al
8010561d:	fe c0                	inc    %al
8010561f:	74 71                	je     80105692 <uartinit+0xbe>
80105621:	c7 05 c0 49 11 80 01 	movl   $0x1,0x801149c0
80105628:	00 00 00 
8010562b:	89 fa                	mov    %edi,%edx
8010562d:	ec                   	in     (%dx),%al
8010562e:	89 f2                	mov    %esi,%edx
80105630:	ec                   	in     (%dx),%al
80105631:	83 ec 08             	sub    $0x8,%esp
80105634:	6a 00                	push   $0x0
80105636:	6a 04                	push   $0x4
80105638:	e8 c7 cb ff ff       	call   80102204 <ioapicenable>
8010563d:	83 c4 10             	add    $0x10,%esp
80105640:	bf 74 73 10 80       	mov    $0x80107374,%edi
80105645:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
80105649:	be fd 03 00 00       	mov    $0x3fd,%esi
8010564e:	66 90                	xchg   %ax,%ax
80105650:	a1 c0 49 11 80       	mov    0x801149c0,%eax
80105655:	85 c0                	test   %eax,%eax
80105657:	74 2f                	je     80105688 <uartinit+0xb4>
80105659:	89 f2                	mov    %esi,%edx
8010565b:	ec                   	in     (%dx),%al
8010565c:	a8 20                	test   $0x20,%al
8010565e:	75 1f                	jne    8010567f <uartinit+0xab>
80105660:	bb 80 00 00 00       	mov    $0x80,%ebx
80105665:	8d 76 00             	lea    0x0(%esi),%esi
80105668:	83 ec 0c             	sub    $0xc,%esp
8010566b:	6a 0a                	push   $0xa
8010566d:	e8 a6 cf ff ff       	call   80102618 <microdelay>
80105672:	83 c4 10             	add    $0x10,%esp
80105675:	4b                   	dec    %ebx
80105676:	74 07                	je     8010567f <uartinit+0xab>
80105678:	89 f2                	mov    %esi,%edx
8010567a:	ec                   	in     (%dx),%al
8010567b:	a8 20                	test   $0x20,%al
8010567d:	74 e9                	je     80105668 <uartinit+0x94>
8010567f:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105684:	8a 45 e7             	mov    -0x19(%ebp),%al
80105687:	ee                   	out    %al,(%dx)
80105688:	47                   	inc    %edi
80105689:	8a 07                	mov    (%edi),%al
8010568b:	88 45 e7             	mov    %al,-0x19(%ebp)
8010568e:	84 c0                	test   %al,%al
80105690:	75 be                	jne    80105650 <uartinit+0x7c>
80105692:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105695:	5b                   	pop    %ebx
80105696:	5e                   	pop    %esi
80105697:	5f                   	pop    %edi
80105698:	5d                   	pop    %ebp
80105699:	c3                   	ret    
8010569a:	66 90                	xchg   %ax,%ax

8010569c <uartputc>:
8010569c:	a1 c0 49 11 80       	mov    0x801149c0,%eax
801056a1:	85 c0                	test   %eax,%eax
801056a3:	74 43                	je     801056e8 <uartputc+0x4c>
801056a5:	55                   	push   %ebp
801056a6:	89 e5                	mov    %esp,%ebp
801056a8:	56                   	push   %esi
801056a9:	53                   	push   %ebx
801056aa:	ba fd 03 00 00       	mov    $0x3fd,%edx
801056af:	ec                   	in     (%dx),%al
801056b0:	a8 20                	test   $0x20,%al
801056b2:	75 23                	jne    801056d7 <uartputc+0x3b>
801056b4:	bb 80 00 00 00       	mov    $0x80,%ebx
801056b9:	be fd 03 00 00       	mov    $0x3fd,%esi
801056be:	66 90                	xchg   %ax,%ax
801056c0:	83 ec 0c             	sub    $0xc,%esp
801056c3:	6a 0a                	push   $0xa
801056c5:	e8 4e cf ff ff       	call   80102618 <microdelay>
801056ca:	83 c4 10             	add    $0x10,%esp
801056cd:	4b                   	dec    %ebx
801056ce:	74 07                	je     801056d7 <uartputc+0x3b>
801056d0:	89 f2                	mov    %esi,%edx
801056d2:	ec                   	in     (%dx),%al
801056d3:	a8 20                	test   $0x20,%al
801056d5:	74 e9                	je     801056c0 <uartputc+0x24>
801056d7:	8b 45 08             	mov    0x8(%ebp),%eax
801056da:	ba f8 03 00 00       	mov    $0x3f8,%edx
801056df:	ee                   	out    %al,(%dx)
801056e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801056e3:	5b                   	pop    %ebx
801056e4:	5e                   	pop    %esi
801056e5:	5d                   	pop    %ebp
801056e6:	c3                   	ret    
801056e7:	90                   	nop
801056e8:	c3                   	ret    
801056e9:	8d 76 00             	lea    0x0(%esi),%esi

801056ec <uartintr>:
801056ec:	55                   	push   %ebp
801056ed:	89 e5                	mov    %esp,%ebp
801056ef:	83 ec 14             	sub    $0x14,%esp
801056f2:	68 ac 55 10 80       	push   $0x801055ac
801056f7:	e8 18 b1 ff ff       	call   80100814 <consoleintr>
801056fc:	83 c4 10             	add    $0x10,%esp
801056ff:	c9                   	leave  
80105700:	c3                   	ret    

80105701 <vector0>:
80105701:	6a 00                	push   $0x0
80105703:	6a 00                	push   $0x0
80105705:	e9 95 fb ff ff       	jmp    8010529f <alltraps>

8010570a <vector1>:
8010570a:	6a 00                	push   $0x0
8010570c:	6a 01                	push   $0x1
8010570e:	e9 8c fb ff ff       	jmp    8010529f <alltraps>

80105713 <vector2>:
80105713:	6a 00                	push   $0x0
80105715:	6a 02                	push   $0x2
80105717:	e9 83 fb ff ff       	jmp    8010529f <alltraps>

8010571c <vector3>:
8010571c:	6a 00                	push   $0x0
8010571e:	6a 03                	push   $0x3
80105720:	e9 7a fb ff ff       	jmp    8010529f <alltraps>

80105725 <vector4>:
80105725:	6a 00                	push   $0x0
80105727:	6a 04                	push   $0x4
80105729:	e9 71 fb ff ff       	jmp    8010529f <alltraps>

8010572e <vector5>:
8010572e:	6a 00                	push   $0x0
80105730:	6a 05                	push   $0x5
80105732:	e9 68 fb ff ff       	jmp    8010529f <alltraps>

80105737 <vector6>:
80105737:	6a 00                	push   $0x0
80105739:	6a 06                	push   $0x6
8010573b:	e9 5f fb ff ff       	jmp    8010529f <alltraps>

80105740 <vector7>:
80105740:	6a 00                	push   $0x0
80105742:	6a 07                	push   $0x7
80105744:	e9 56 fb ff ff       	jmp    8010529f <alltraps>

80105749 <vector8>:
80105749:	6a 08                	push   $0x8
8010574b:	e9 4f fb ff ff       	jmp    8010529f <alltraps>

80105750 <vector9>:
80105750:	6a 00                	push   $0x0
80105752:	6a 09                	push   $0x9
80105754:	e9 46 fb ff ff       	jmp    8010529f <alltraps>

80105759 <vector10>:
80105759:	6a 0a                	push   $0xa
8010575b:	e9 3f fb ff ff       	jmp    8010529f <alltraps>

80105760 <vector11>:
80105760:	6a 0b                	push   $0xb
80105762:	e9 38 fb ff ff       	jmp    8010529f <alltraps>

80105767 <vector12>:
80105767:	6a 0c                	push   $0xc
80105769:	e9 31 fb ff ff       	jmp    8010529f <alltraps>

8010576e <vector13>:
8010576e:	6a 0d                	push   $0xd
80105770:	e9 2a fb ff ff       	jmp    8010529f <alltraps>

80105775 <vector14>:
80105775:	6a 0e                	push   $0xe
80105777:	e9 23 fb ff ff       	jmp    8010529f <alltraps>

8010577c <vector15>:
8010577c:	6a 00                	push   $0x0
8010577e:	6a 0f                	push   $0xf
80105780:	e9 1a fb ff ff       	jmp    8010529f <alltraps>

80105785 <vector16>:
80105785:	6a 00                	push   $0x0
80105787:	6a 10                	push   $0x10
80105789:	e9 11 fb ff ff       	jmp    8010529f <alltraps>

8010578e <vector17>:
8010578e:	6a 11                	push   $0x11
80105790:	e9 0a fb ff ff       	jmp    8010529f <alltraps>

80105795 <vector18>:
80105795:	6a 00                	push   $0x0
80105797:	6a 12                	push   $0x12
80105799:	e9 01 fb ff ff       	jmp    8010529f <alltraps>

8010579e <vector19>:
8010579e:	6a 00                	push   $0x0
801057a0:	6a 13                	push   $0x13
801057a2:	e9 f8 fa ff ff       	jmp    8010529f <alltraps>

801057a7 <vector20>:
801057a7:	6a 00                	push   $0x0
801057a9:	6a 14                	push   $0x14
801057ab:	e9 ef fa ff ff       	jmp    8010529f <alltraps>

801057b0 <vector21>:
801057b0:	6a 00                	push   $0x0
801057b2:	6a 15                	push   $0x15
801057b4:	e9 e6 fa ff ff       	jmp    8010529f <alltraps>

801057b9 <vector22>:
801057b9:	6a 00                	push   $0x0
801057bb:	6a 16                	push   $0x16
801057bd:	e9 dd fa ff ff       	jmp    8010529f <alltraps>

801057c2 <vector23>:
801057c2:	6a 00                	push   $0x0
801057c4:	6a 17                	push   $0x17
801057c6:	e9 d4 fa ff ff       	jmp    8010529f <alltraps>

801057cb <vector24>:
801057cb:	6a 00                	push   $0x0
801057cd:	6a 18                	push   $0x18
801057cf:	e9 cb fa ff ff       	jmp    8010529f <alltraps>

801057d4 <vector25>:
801057d4:	6a 00                	push   $0x0
801057d6:	6a 19                	push   $0x19
801057d8:	e9 c2 fa ff ff       	jmp    8010529f <alltraps>

801057dd <vector26>:
801057dd:	6a 00                	push   $0x0
801057df:	6a 1a                	push   $0x1a
801057e1:	e9 b9 fa ff ff       	jmp    8010529f <alltraps>

801057e6 <vector27>:
801057e6:	6a 00                	push   $0x0
801057e8:	6a 1b                	push   $0x1b
801057ea:	e9 b0 fa ff ff       	jmp    8010529f <alltraps>

801057ef <vector28>:
801057ef:	6a 00                	push   $0x0
801057f1:	6a 1c                	push   $0x1c
801057f3:	e9 a7 fa ff ff       	jmp    8010529f <alltraps>

801057f8 <vector29>:
801057f8:	6a 00                	push   $0x0
801057fa:	6a 1d                	push   $0x1d
801057fc:	e9 9e fa ff ff       	jmp    8010529f <alltraps>

80105801 <vector30>:
80105801:	6a 00                	push   $0x0
80105803:	6a 1e                	push   $0x1e
80105805:	e9 95 fa ff ff       	jmp    8010529f <alltraps>

8010580a <vector31>:
8010580a:	6a 00                	push   $0x0
8010580c:	6a 1f                	push   $0x1f
8010580e:	e9 8c fa ff ff       	jmp    8010529f <alltraps>

80105813 <vector32>:
80105813:	6a 00                	push   $0x0
80105815:	6a 20                	push   $0x20
80105817:	e9 83 fa ff ff       	jmp    8010529f <alltraps>

8010581c <vector33>:
8010581c:	6a 00                	push   $0x0
8010581e:	6a 21                	push   $0x21
80105820:	e9 7a fa ff ff       	jmp    8010529f <alltraps>

80105825 <vector34>:
80105825:	6a 00                	push   $0x0
80105827:	6a 22                	push   $0x22
80105829:	e9 71 fa ff ff       	jmp    8010529f <alltraps>

8010582e <vector35>:
8010582e:	6a 00                	push   $0x0
80105830:	6a 23                	push   $0x23
80105832:	e9 68 fa ff ff       	jmp    8010529f <alltraps>

80105837 <vector36>:
80105837:	6a 00                	push   $0x0
80105839:	6a 24                	push   $0x24
8010583b:	e9 5f fa ff ff       	jmp    8010529f <alltraps>

80105840 <vector37>:
80105840:	6a 00                	push   $0x0
80105842:	6a 25                	push   $0x25
80105844:	e9 56 fa ff ff       	jmp    8010529f <alltraps>

80105849 <vector38>:
80105849:	6a 00                	push   $0x0
8010584b:	6a 26                	push   $0x26
8010584d:	e9 4d fa ff ff       	jmp    8010529f <alltraps>

80105852 <vector39>:
80105852:	6a 00                	push   $0x0
80105854:	6a 27                	push   $0x27
80105856:	e9 44 fa ff ff       	jmp    8010529f <alltraps>

8010585b <vector40>:
8010585b:	6a 00                	push   $0x0
8010585d:	6a 28                	push   $0x28
8010585f:	e9 3b fa ff ff       	jmp    8010529f <alltraps>

80105864 <vector41>:
80105864:	6a 00                	push   $0x0
80105866:	6a 29                	push   $0x29
80105868:	e9 32 fa ff ff       	jmp    8010529f <alltraps>

8010586d <vector42>:
8010586d:	6a 00                	push   $0x0
8010586f:	6a 2a                	push   $0x2a
80105871:	e9 29 fa ff ff       	jmp    8010529f <alltraps>

80105876 <vector43>:
80105876:	6a 00                	push   $0x0
80105878:	6a 2b                	push   $0x2b
8010587a:	e9 20 fa ff ff       	jmp    8010529f <alltraps>

8010587f <vector44>:
8010587f:	6a 00                	push   $0x0
80105881:	6a 2c                	push   $0x2c
80105883:	e9 17 fa ff ff       	jmp    8010529f <alltraps>

80105888 <vector45>:
80105888:	6a 00                	push   $0x0
8010588a:	6a 2d                	push   $0x2d
8010588c:	e9 0e fa ff ff       	jmp    8010529f <alltraps>

80105891 <vector46>:
80105891:	6a 00                	push   $0x0
80105893:	6a 2e                	push   $0x2e
80105895:	e9 05 fa ff ff       	jmp    8010529f <alltraps>

8010589a <vector47>:
8010589a:	6a 00                	push   $0x0
8010589c:	6a 2f                	push   $0x2f
8010589e:	e9 fc f9 ff ff       	jmp    8010529f <alltraps>

801058a3 <vector48>:
801058a3:	6a 00                	push   $0x0
801058a5:	6a 30                	push   $0x30
801058a7:	e9 f3 f9 ff ff       	jmp    8010529f <alltraps>

801058ac <vector49>:
801058ac:	6a 00                	push   $0x0
801058ae:	6a 31                	push   $0x31
801058b0:	e9 ea f9 ff ff       	jmp    8010529f <alltraps>

801058b5 <vector50>:
801058b5:	6a 00                	push   $0x0
801058b7:	6a 32                	push   $0x32
801058b9:	e9 e1 f9 ff ff       	jmp    8010529f <alltraps>

801058be <vector51>:
801058be:	6a 00                	push   $0x0
801058c0:	6a 33                	push   $0x33
801058c2:	e9 d8 f9 ff ff       	jmp    8010529f <alltraps>

801058c7 <vector52>:
801058c7:	6a 00                	push   $0x0
801058c9:	6a 34                	push   $0x34
801058cb:	e9 cf f9 ff ff       	jmp    8010529f <alltraps>

801058d0 <vector53>:
801058d0:	6a 00                	push   $0x0
801058d2:	6a 35                	push   $0x35
801058d4:	e9 c6 f9 ff ff       	jmp    8010529f <alltraps>

801058d9 <vector54>:
801058d9:	6a 00                	push   $0x0
801058db:	6a 36                	push   $0x36
801058dd:	e9 bd f9 ff ff       	jmp    8010529f <alltraps>

801058e2 <vector55>:
801058e2:	6a 00                	push   $0x0
801058e4:	6a 37                	push   $0x37
801058e6:	e9 b4 f9 ff ff       	jmp    8010529f <alltraps>

801058eb <vector56>:
801058eb:	6a 00                	push   $0x0
801058ed:	6a 38                	push   $0x38
801058ef:	e9 ab f9 ff ff       	jmp    8010529f <alltraps>

801058f4 <vector57>:
801058f4:	6a 00                	push   $0x0
801058f6:	6a 39                	push   $0x39
801058f8:	e9 a2 f9 ff ff       	jmp    8010529f <alltraps>

801058fd <vector58>:
801058fd:	6a 00                	push   $0x0
801058ff:	6a 3a                	push   $0x3a
80105901:	e9 99 f9 ff ff       	jmp    8010529f <alltraps>

80105906 <vector59>:
80105906:	6a 00                	push   $0x0
80105908:	6a 3b                	push   $0x3b
8010590a:	e9 90 f9 ff ff       	jmp    8010529f <alltraps>

8010590f <vector60>:
8010590f:	6a 00                	push   $0x0
80105911:	6a 3c                	push   $0x3c
80105913:	e9 87 f9 ff ff       	jmp    8010529f <alltraps>

80105918 <vector61>:
80105918:	6a 00                	push   $0x0
8010591a:	6a 3d                	push   $0x3d
8010591c:	e9 7e f9 ff ff       	jmp    8010529f <alltraps>

80105921 <vector62>:
80105921:	6a 00                	push   $0x0
80105923:	6a 3e                	push   $0x3e
80105925:	e9 75 f9 ff ff       	jmp    8010529f <alltraps>

8010592a <vector63>:
8010592a:	6a 00                	push   $0x0
8010592c:	6a 3f                	push   $0x3f
8010592e:	e9 6c f9 ff ff       	jmp    8010529f <alltraps>

80105933 <vector64>:
80105933:	6a 00                	push   $0x0
80105935:	6a 40                	push   $0x40
80105937:	e9 63 f9 ff ff       	jmp    8010529f <alltraps>

8010593c <vector65>:
8010593c:	6a 00                	push   $0x0
8010593e:	6a 41                	push   $0x41
80105940:	e9 5a f9 ff ff       	jmp    8010529f <alltraps>

80105945 <vector66>:
80105945:	6a 00                	push   $0x0
80105947:	6a 42                	push   $0x42
80105949:	e9 51 f9 ff ff       	jmp    8010529f <alltraps>

8010594e <vector67>:
8010594e:	6a 00                	push   $0x0
80105950:	6a 43                	push   $0x43
80105952:	e9 48 f9 ff ff       	jmp    8010529f <alltraps>

80105957 <vector68>:
80105957:	6a 00                	push   $0x0
80105959:	6a 44                	push   $0x44
8010595b:	e9 3f f9 ff ff       	jmp    8010529f <alltraps>

80105960 <vector69>:
80105960:	6a 00                	push   $0x0
80105962:	6a 45                	push   $0x45
80105964:	e9 36 f9 ff ff       	jmp    8010529f <alltraps>

80105969 <vector70>:
80105969:	6a 00                	push   $0x0
8010596b:	6a 46                	push   $0x46
8010596d:	e9 2d f9 ff ff       	jmp    8010529f <alltraps>

80105972 <vector71>:
80105972:	6a 00                	push   $0x0
80105974:	6a 47                	push   $0x47
80105976:	e9 24 f9 ff ff       	jmp    8010529f <alltraps>

8010597b <vector72>:
8010597b:	6a 00                	push   $0x0
8010597d:	6a 48                	push   $0x48
8010597f:	e9 1b f9 ff ff       	jmp    8010529f <alltraps>

80105984 <vector73>:
80105984:	6a 00                	push   $0x0
80105986:	6a 49                	push   $0x49
80105988:	e9 12 f9 ff ff       	jmp    8010529f <alltraps>

8010598d <vector74>:
8010598d:	6a 00                	push   $0x0
8010598f:	6a 4a                	push   $0x4a
80105991:	e9 09 f9 ff ff       	jmp    8010529f <alltraps>

80105996 <vector75>:
80105996:	6a 00                	push   $0x0
80105998:	6a 4b                	push   $0x4b
8010599a:	e9 00 f9 ff ff       	jmp    8010529f <alltraps>

8010599f <vector76>:
8010599f:	6a 00                	push   $0x0
801059a1:	6a 4c                	push   $0x4c
801059a3:	e9 f7 f8 ff ff       	jmp    8010529f <alltraps>

801059a8 <vector77>:
801059a8:	6a 00                	push   $0x0
801059aa:	6a 4d                	push   $0x4d
801059ac:	e9 ee f8 ff ff       	jmp    8010529f <alltraps>

801059b1 <vector78>:
801059b1:	6a 00                	push   $0x0
801059b3:	6a 4e                	push   $0x4e
801059b5:	e9 e5 f8 ff ff       	jmp    8010529f <alltraps>

801059ba <vector79>:
801059ba:	6a 00                	push   $0x0
801059bc:	6a 4f                	push   $0x4f
801059be:	e9 dc f8 ff ff       	jmp    8010529f <alltraps>

801059c3 <vector80>:
801059c3:	6a 00                	push   $0x0
801059c5:	6a 50                	push   $0x50
801059c7:	e9 d3 f8 ff ff       	jmp    8010529f <alltraps>

801059cc <vector81>:
801059cc:	6a 00                	push   $0x0
801059ce:	6a 51                	push   $0x51
801059d0:	e9 ca f8 ff ff       	jmp    8010529f <alltraps>

801059d5 <vector82>:
801059d5:	6a 00                	push   $0x0
801059d7:	6a 52                	push   $0x52
801059d9:	e9 c1 f8 ff ff       	jmp    8010529f <alltraps>

801059de <vector83>:
801059de:	6a 00                	push   $0x0
801059e0:	6a 53                	push   $0x53
801059e2:	e9 b8 f8 ff ff       	jmp    8010529f <alltraps>

801059e7 <vector84>:
801059e7:	6a 00                	push   $0x0
801059e9:	6a 54                	push   $0x54
801059eb:	e9 af f8 ff ff       	jmp    8010529f <alltraps>

801059f0 <vector85>:
801059f0:	6a 00                	push   $0x0
801059f2:	6a 55                	push   $0x55
801059f4:	e9 a6 f8 ff ff       	jmp    8010529f <alltraps>

801059f9 <vector86>:
801059f9:	6a 00                	push   $0x0
801059fb:	6a 56                	push   $0x56
801059fd:	e9 9d f8 ff ff       	jmp    8010529f <alltraps>

80105a02 <vector87>:
80105a02:	6a 00                	push   $0x0
80105a04:	6a 57                	push   $0x57
80105a06:	e9 94 f8 ff ff       	jmp    8010529f <alltraps>

80105a0b <vector88>:
80105a0b:	6a 00                	push   $0x0
80105a0d:	6a 58                	push   $0x58
80105a0f:	e9 8b f8 ff ff       	jmp    8010529f <alltraps>

80105a14 <vector89>:
80105a14:	6a 00                	push   $0x0
80105a16:	6a 59                	push   $0x59
80105a18:	e9 82 f8 ff ff       	jmp    8010529f <alltraps>

80105a1d <vector90>:
80105a1d:	6a 00                	push   $0x0
80105a1f:	6a 5a                	push   $0x5a
80105a21:	e9 79 f8 ff ff       	jmp    8010529f <alltraps>

80105a26 <vector91>:
80105a26:	6a 00                	push   $0x0
80105a28:	6a 5b                	push   $0x5b
80105a2a:	e9 70 f8 ff ff       	jmp    8010529f <alltraps>

80105a2f <vector92>:
80105a2f:	6a 00                	push   $0x0
80105a31:	6a 5c                	push   $0x5c
80105a33:	e9 67 f8 ff ff       	jmp    8010529f <alltraps>

80105a38 <vector93>:
80105a38:	6a 00                	push   $0x0
80105a3a:	6a 5d                	push   $0x5d
80105a3c:	e9 5e f8 ff ff       	jmp    8010529f <alltraps>

80105a41 <vector94>:
80105a41:	6a 00                	push   $0x0
80105a43:	6a 5e                	push   $0x5e
80105a45:	e9 55 f8 ff ff       	jmp    8010529f <alltraps>

80105a4a <vector95>:
80105a4a:	6a 00                	push   $0x0
80105a4c:	6a 5f                	push   $0x5f
80105a4e:	e9 4c f8 ff ff       	jmp    8010529f <alltraps>

80105a53 <vector96>:
80105a53:	6a 00                	push   $0x0
80105a55:	6a 60                	push   $0x60
80105a57:	e9 43 f8 ff ff       	jmp    8010529f <alltraps>

80105a5c <vector97>:
80105a5c:	6a 00                	push   $0x0
80105a5e:	6a 61                	push   $0x61
80105a60:	e9 3a f8 ff ff       	jmp    8010529f <alltraps>

80105a65 <vector98>:
80105a65:	6a 00                	push   $0x0
80105a67:	6a 62                	push   $0x62
80105a69:	e9 31 f8 ff ff       	jmp    8010529f <alltraps>

80105a6e <vector99>:
80105a6e:	6a 00                	push   $0x0
80105a70:	6a 63                	push   $0x63
80105a72:	e9 28 f8 ff ff       	jmp    8010529f <alltraps>

80105a77 <vector100>:
80105a77:	6a 00                	push   $0x0
80105a79:	6a 64                	push   $0x64
80105a7b:	e9 1f f8 ff ff       	jmp    8010529f <alltraps>

80105a80 <vector101>:
80105a80:	6a 00                	push   $0x0
80105a82:	6a 65                	push   $0x65
80105a84:	e9 16 f8 ff ff       	jmp    8010529f <alltraps>

80105a89 <vector102>:
80105a89:	6a 00                	push   $0x0
80105a8b:	6a 66                	push   $0x66
80105a8d:	e9 0d f8 ff ff       	jmp    8010529f <alltraps>

80105a92 <vector103>:
80105a92:	6a 00                	push   $0x0
80105a94:	6a 67                	push   $0x67
80105a96:	e9 04 f8 ff ff       	jmp    8010529f <alltraps>

80105a9b <vector104>:
80105a9b:	6a 00                	push   $0x0
80105a9d:	6a 68                	push   $0x68
80105a9f:	e9 fb f7 ff ff       	jmp    8010529f <alltraps>

80105aa4 <vector105>:
80105aa4:	6a 00                	push   $0x0
80105aa6:	6a 69                	push   $0x69
80105aa8:	e9 f2 f7 ff ff       	jmp    8010529f <alltraps>

80105aad <vector106>:
80105aad:	6a 00                	push   $0x0
80105aaf:	6a 6a                	push   $0x6a
80105ab1:	e9 e9 f7 ff ff       	jmp    8010529f <alltraps>

80105ab6 <vector107>:
80105ab6:	6a 00                	push   $0x0
80105ab8:	6a 6b                	push   $0x6b
80105aba:	e9 e0 f7 ff ff       	jmp    8010529f <alltraps>

80105abf <vector108>:
80105abf:	6a 00                	push   $0x0
80105ac1:	6a 6c                	push   $0x6c
80105ac3:	e9 d7 f7 ff ff       	jmp    8010529f <alltraps>

80105ac8 <vector109>:
80105ac8:	6a 00                	push   $0x0
80105aca:	6a 6d                	push   $0x6d
80105acc:	e9 ce f7 ff ff       	jmp    8010529f <alltraps>

80105ad1 <vector110>:
80105ad1:	6a 00                	push   $0x0
80105ad3:	6a 6e                	push   $0x6e
80105ad5:	e9 c5 f7 ff ff       	jmp    8010529f <alltraps>

80105ada <vector111>:
80105ada:	6a 00                	push   $0x0
80105adc:	6a 6f                	push   $0x6f
80105ade:	e9 bc f7 ff ff       	jmp    8010529f <alltraps>

80105ae3 <vector112>:
80105ae3:	6a 00                	push   $0x0
80105ae5:	6a 70                	push   $0x70
80105ae7:	e9 b3 f7 ff ff       	jmp    8010529f <alltraps>

80105aec <vector113>:
80105aec:	6a 00                	push   $0x0
80105aee:	6a 71                	push   $0x71
80105af0:	e9 aa f7 ff ff       	jmp    8010529f <alltraps>

80105af5 <vector114>:
80105af5:	6a 00                	push   $0x0
80105af7:	6a 72                	push   $0x72
80105af9:	e9 a1 f7 ff ff       	jmp    8010529f <alltraps>

80105afe <vector115>:
80105afe:	6a 00                	push   $0x0
80105b00:	6a 73                	push   $0x73
80105b02:	e9 98 f7 ff ff       	jmp    8010529f <alltraps>

80105b07 <vector116>:
80105b07:	6a 00                	push   $0x0
80105b09:	6a 74                	push   $0x74
80105b0b:	e9 8f f7 ff ff       	jmp    8010529f <alltraps>

80105b10 <vector117>:
80105b10:	6a 00                	push   $0x0
80105b12:	6a 75                	push   $0x75
80105b14:	e9 86 f7 ff ff       	jmp    8010529f <alltraps>

80105b19 <vector118>:
80105b19:	6a 00                	push   $0x0
80105b1b:	6a 76                	push   $0x76
80105b1d:	e9 7d f7 ff ff       	jmp    8010529f <alltraps>

80105b22 <vector119>:
80105b22:	6a 00                	push   $0x0
80105b24:	6a 77                	push   $0x77
80105b26:	e9 74 f7 ff ff       	jmp    8010529f <alltraps>

80105b2b <vector120>:
80105b2b:	6a 00                	push   $0x0
80105b2d:	6a 78                	push   $0x78
80105b2f:	e9 6b f7 ff ff       	jmp    8010529f <alltraps>

80105b34 <vector121>:
80105b34:	6a 00                	push   $0x0
80105b36:	6a 79                	push   $0x79
80105b38:	e9 62 f7 ff ff       	jmp    8010529f <alltraps>

80105b3d <vector122>:
80105b3d:	6a 00                	push   $0x0
80105b3f:	6a 7a                	push   $0x7a
80105b41:	e9 59 f7 ff ff       	jmp    8010529f <alltraps>

80105b46 <vector123>:
80105b46:	6a 00                	push   $0x0
80105b48:	6a 7b                	push   $0x7b
80105b4a:	e9 50 f7 ff ff       	jmp    8010529f <alltraps>

80105b4f <vector124>:
80105b4f:	6a 00                	push   $0x0
80105b51:	6a 7c                	push   $0x7c
80105b53:	e9 47 f7 ff ff       	jmp    8010529f <alltraps>

80105b58 <vector125>:
80105b58:	6a 00                	push   $0x0
80105b5a:	6a 7d                	push   $0x7d
80105b5c:	e9 3e f7 ff ff       	jmp    8010529f <alltraps>

80105b61 <vector126>:
80105b61:	6a 00                	push   $0x0
80105b63:	6a 7e                	push   $0x7e
80105b65:	e9 35 f7 ff ff       	jmp    8010529f <alltraps>

80105b6a <vector127>:
80105b6a:	6a 00                	push   $0x0
80105b6c:	6a 7f                	push   $0x7f
80105b6e:	e9 2c f7 ff ff       	jmp    8010529f <alltraps>

80105b73 <vector128>:
80105b73:	6a 00                	push   $0x0
80105b75:	68 80 00 00 00       	push   $0x80
80105b7a:	e9 20 f7 ff ff       	jmp    8010529f <alltraps>

80105b7f <vector129>:
80105b7f:	6a 00                	push   $0x0
80105b81:	68 81 00 00 00       	push   $0x81
80105b86:	e9 14 f7 ff ff       	jmp    8010529f <alltraps>

80105b8b <vector130>:
80105b8b:	6a 00                	push   $0x0
80105b8d:	68 82 00 00 00       	push   $0x82
80105b92:	e9 08 f7 ff ff       	jmp    8010529f <alltraps>

80105b97 <vector131>:
80105b97:	6a 00                	push   $0x0
80105b99:	68 83 00 00 00       	push   $0x83
80105b9e:	e9 fc f6 ff ff       	jmp    8010529f <alltraps>

80105ba3 <vector132>:
80105ba3:	6a 00                	push   $0x0
80105ba5:	68 84 00 00 00       	push   $0x84
80105baa:	e9 f0 f6 ff ff       	jmp    8010529f <alltraps>

80105baf <vector133>:
80105baf:	6a 00                	push   $0x0
80105bb1:	68 85 00 00 00       	push   $0x85
80105bb6:	e9 e4 f6 ff ff       	jmp    8010529f <alltraps>

80105bbb <vector134>:
80105bbb:	6a 00                	push   $0x0
80105bbd:	68 86 00 00 00       	push   $0x86
80105bc2:	e9 d8 f6 ff ff       	jmp    8010529f <alltraps>

80105bc7 <vector135>:
80105bc7:	6a 00                	push   $0x0
80105bc9:	68 87 00 00 00       	push   $0x87
80105bce:	e9 cc f6 ff ff       	jmp    8010529f <alltraps>

80105bd3 <vector136>:
80105bd3:	6a 00                	push   $0x0
80105bd5:	68 88 00 00 00       	push   $0x88
80105bda:	e9 c0 f6 ff ff       	jmp    8010529f <alltraps>

80105bdf <vector137>:
80105bdf:	6a 00                	push   $0x0
80105be1:	68 89 00 00 00       	push   $0x89
80105be6:	e9 b4 f6 ff ff       	jmp    8010529f <alltraps>

80105beb <vector138>:
80105beb:	6a 00                	push   $0x0
80105bed:	68 8a 00 00 00       	push   $0x8a
80105bf2:	e9 a8 f6 ff ff       	jmp    8010529f <alltraps>

80105bf7 <vector139>:
80105bf7:	6a 00                	push   $0x0
80105bf9:	68 8b 00 00 00       	push   $0x8b
80105bfe:	e9 9c f6 ff ff       	jmp    8010529f <alltraps>

80105c03 <vector140>:
80105c03:	6a 00                	push   $0x0
80105c05:	68 8c 00 00 00       	push   $0x8c
80105c0a:	e9 90 f6 ff ff       	jmp    8010529f <alltraps>

80105c0f <vector141>:
80105c0f:	6a 00                	push   $0x0
80105c11:	68 8d 00 00 00       	push   $0x8d
80105c16:	e9 84 f6 ff ff       	jmp    8010529f <alltraps>

80105c1b <vector142>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	68 8e 00 00 00       	push   $0x8e
80105c22:	e9 78 f6 ff ff       	jmp    8010529f <alltraps>

80105c27 <vector143>:
80105c27:	6a 00                	push   $0x0
80105c29:	68 8f 00 00 00       	push   $0x8f
80105c2e:	e9 6c f6 ff ff       	jmp    8010529f <alltraps>

80105c33 <vector144>:
80105c33:	6a 00                	push   $0x0
80105c35:	68 90 00 00 00       	push   $0x90
80105c3a:	e9 60 f6 ff ff       	jmp    8010529f <alltraps>

80105c3f <vector145>:
80105c3f:	6a 00                	push   $0x0
80105c41:	68 91 00 00 00       	push   $0x91
80105c46:	e9 54 f6 ff ff       	jmp    8010529f <alltraps>

80105c4b <vector146>:
80105c4b:	6a 00                	push   $0x0
80105c4d:	68 92 00 00 00       	push   $0x92
80105c52:	e9 48 f6 ff ff       	jmp    8010529f <alltraps>

80105c57 <vector147>:
80105c57:	6a 00                	push   $0x0
80105c59:	68 93 00 00 00       	push   $0x93
80105c5e:	e9 3c f6 ff ff       	jmp    8010529f <alltraps>

80105c63 <vector148>:
80105c63:	6a 00                	push   $0x0
80105c65:	68 94 00 00 00       	push   $0x94
80105c6a:	e9 30 f6 ff ff       	jmp    8010529f <alltraps>

80105c6f <vector149>:
80105c6f:	6a 00                	push   $0x0
80105c71:	68 95 00 00 00       	push   $0x95
80105c76:	e9 24 f6 ff ff       	jmp    8010529f <alltraps>

80105c7b <vector150>:
80105c7b:	6a 00                	push   $0x0
80105c7d:	68 96 00 00 00       	push   $0x96
80105c82:	e9 18 f6 ff ff       	jmp    8010529f <alltraps>

80105c87 <vector151>:
80105c87:	6a 00                	push   $0x0
80105c89:	68 97 00 00 00       	push   $0x97
80105c8e:	e9 0c f6 ff ff       	jmp    8010529f <alltraps>

80105c93 <vector152>:
80105c93:	6a 00                	push   $0x0
80105c95:	68 98 00 00 00       	push   $0x98
80105c9a:	e9 00 f6 ff ff       	jmp    8010529f <alltraps>

80105c9f <vector153>:
80105c9f:	6a 00                	push   $0x0
80105ca1:	68 99 00 00 00       	push   $0x99
80105ca6:	e9 f4 f5 ff ff       	jmp    8010529f <alltraps>

80105cab <vector154>:
80105cab:	6a 00                	push   $0x0
80105cad:	68 9a 00 00 00       	push   $0x9a
80105cb2:	e9 e8 f5 ff ff       	jmp    8010529f <alltraps>

80105cb7 <vector155>:
80105cb7:	6a 00                	push   $0x0
80105cb9:	68 9b 00 00 00       	push   $0x9b
80105cbe:	e9 dc f5 ff ff       	jmp    8010529f <alltraps>

80105cc3 <vector156>:
80105cc3:	6a 00                	push   $0x0
80105cc5:	68 9c 00 00 00       	push   $0x9c
80105cca:	e9 d0 f5 ff ff       	jmp    8010529f <alltraps>

80105ccf <vector157>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	68 9d 00 00 00       	push   $0x9d
80105cd6:	e9 c4 f5 ff ff       	jmp    8010529f <alltraps>

80105cdb <vector158>:
80105cdb:	6a 00                	push   $0x0
80105cdd:	68 9e 00 00 00       	push   $0x9e
80105ce2:	e9 b8 f5 ff ff       	jmp    8010529f <alltraps>

80105ce7 <vector159>:
80105ce7:	6a 00                	push   $0x0
80105ce9:	68 9f 00 00 00       	push   $0x9f
80105cee:	e9 ac f5 ff ff       	jmp    8010529f <alltraps>

80105cf3 <vector160>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	68 a0 00 00 00       	push   $0xa0
80105cfa:	e9 a0 f5 ff ff       	jmp    8010529f <alltraps>

80105cff <vector161>:
80105cff:	6a 00                	push   $0x0
80105d01:	68 a1 00 00 00       	push   $0xa1
80105d06:	e9 94 f5 ff ff       	jmp    8010529f <alltraps>

80105d0b <vector162>:
80105d0b:	6a 00                	push   $0x0
80105d0d:	68 a2 00 00 00       	push   $0xa2
80105d12:	e9 88 f5 ff ff       	jmp    8010529f <alltraps>

80105d17 <vector163>:
80105d17:	6a 00                	push   $0x0
80105d19:	68 a3 00 00 00       	push   $0xa3
80105d1e:	e9 7c f5 ff ff       	jmp    8010529f <alltraps>

80105d23 <vector164>:
80105d23:	6a 00                	push   $0x0
80105d25:	68 a4 00 00 00       	push   $0xa4
80105d2a:	e9 70 f5 ff ff       	jmp    8010529f <alltraps>

80105d2f <vector165>:
80105d2f:	6a 00                	push   $0x0
80105d31:	68 a5 00 00 00       	push   $0xa5
80105d36:	e9 64 f5 ff ff       	jmp    8010529f <alltraps>

80105d3b <vector166>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	68 a6 00 00 00       	push   $0xa6
80105d42:	e9 58 f5 ff ff       	jmp    8010529f <alltraps>

80105d47 <vector167>:
80105d47:	6a 00                	push   $0x0
80105d49:	68 a7 00 00 00       	push   $0xa7
80105d4e:	e9 4c f5 ff ff       	jmp    8010529f <alltraps>

80105d53 <vector168>:
80105d53:	6a 00                	push   $0x0
80105d55:	68 a8 00 00 00       	push   $0xa8
80105d5a:	e9 40 f5 ff ff       	jmp    8010529f <alltraps>

80105d5f <vector169>:
80105d5f:	6a 00                	push   $0x0
80105d61:	68 a9 00 00 00       	push   $0xa9
80105d66:	e9 34 f5 ff ff       	jmp    8010529f <alltraps>

80105d6b <vector170>:
80105d6b:	6a 00                	push   $0x0
80105d6d:	68 aa 00 00 00       	push   $0xaa
80105d72:	e9 28 f5 ff ff       	jmp    8010529f <alltraps>

80105d77 <vector171>:
80105d77:	6a 00                	push   $0x0
80105d79:	68 ab 00 00 00       	push   $0xab
80105d7e:	e9 1c f5 ff ff       	jmp    8010529f <alltraps>

80105d83 <vector172>:
80105d83:	6a 00                	push   $0x0
80105d85:	68 ac 00 00 00       	push   $0xac
80105d8a:	e9 10 f5 ff ff       	jmp    8010529f <alltraps>

80105d8f <vector173>:
80105d8f:	6a 00                	push   $0x0
80105d91:	68 ad 00 00 00       	push   $0xad
80105d96:	e9 04 f5 ff ff       	jmp    8010529f <alltraps>

80105d9b <vector174>:
80105d9b:	6a 00                	push   $0x0
80105d9d:	68 ae 00 00 00       	push   $0xae
80105da2:	e9 f8 f4 ff ff       	jmp    8010529f <alltraps>

80105da7 <vector175>:
80105da7:	6a 00                	push   $0x0
80105da9:	68 af 00 00 00       	push   $0xaf
80105dae:	e9 ec f4 ff ff       	jmp    8010529f <alltraps>

80105db3 <vector176>:
80105db3:	6a 00                	push   $0x0
80105db5:	68 b0 00 00 00       	push   $0xb0
80105dba:	e9 e0 f4 ff ff       	jmp    8010529f <alltraps>

80105dbf <vector177>:
80105dbf:	6a 00                	push   $0x0
80105dc1:	68 b1 00 00 00       	push   $0xb1
80105dc6:	e9 d4 f4 ff ff       	jmp    8010529f <alltraps>

80105dcb <vector178>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	68 b2 00 00 00       	push   $0xb2
80105dd2:	e9 c8 f4 ff ff       	jmp    8010529f <alltraps>

80105dd7 <vector179>:
80105dd7:	6a 00                	push   $0x0
80105dd9:	68 b3 00 00 00       	push   $0xb3
80105dde:	e9 bc f4 ff ff       	jmp    8010529f <alltraps>

80105de3 <vector180>:
80105de3:	6a 00                	push   $0x0
80105de5:	68 b4 00 00 00       	push   $0xb4
80105dea:	e9 b0 f4 ff ff       	jmp    8010529f <alltraps>

80105def <vector181>:
80105def:	6a 00                	push   $0x0
80105df1:	68 b5 00 00 00       	push   $0xb5
80105df6:	e9 a4 f4 ff ff       	jmp    8010529f <alltraps>

80105dfb <vector182>:
80105dfb:	6a 00                	push   $0x0
80105dfd:	68 b6 00 00 00       	push   $0xb6
80105e02:	e9 98 f4 ff ff       	jmp    8010529f <alltraps>

80105e07 <vector183>:
80105e07:	6a 00                	push   $0x0
80105e09:	68 b7 00 00 00       	push   $0xb7
80105e0e:	e9 8c f4 ff ff       	jmp    8010529f <alltraps>

80105e13 <vector184>:
80105e13:	6a 00                	push   $0x0
80105e15:	68 b8 00 00 00       	push   $0xb8
80105e1a:	e9 80 f4 ff ff       	jmp    8010529f <alltraps>

80105e1f <vector185>:
80105e1f:	6a 00                	push   $0x0
80105e21:	68 b9 00 00 00       	push   $0xb9
80105e26:	e9 74 f4 ff ff       	jmp    8010529f <alltraps>

80105e2b <vector186>:
80105e2b:	6a 00                	push   $0x0
80105e2d:	68 ba 00 00 00       	push   $0xba
80105e32:	e9 68 f4 ff ff       	jmp    8010529f <alltraps>

80105e37 <vector187>:
80105e37:	6a 00                	push   $0x0
80105e39:	68 bb 00 00 00       	push   $0xbb
80105e3e:	e9 5c f4 ff ff       	jmp    8010529f <alltraps>

80105e43 <vector188>:
80105e43:	6a 00                	push   $0x0
80105e45:	68 bc 00 00 00       	push   $0xbc
80105e4a:	e9 50 f4 ff ff       	jmp    8010529f <alltraps>

80105e4f <vector189>:
80105e4f:	6a 00                	push   $0x0
80105e51:	68 bd 00 00 00       	push   $0xbd
80105e56:	e9 44 f4 ff ff       	jmp    8010529f <alltraps>

80105e5b <vector190>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	68 be 00 00 00       	push   $0xbe
80105e62:	e9 38 f4 ff ff       	jmp    8010529f <alltraps>

80105e67 <vector191>:
80105e67:	6a 00                	push   $0x0
80105e69:	68 bf 00 00 00       	push   $0xbf
80105e6e:	e9 2c f4 ff ff       	jmp    8010529f <alltraps>

80105e73 <vector192>:
80105e73:	6a 00                	push   $0x0
80105e75:	68 c0 00 00 00       	push   $0xc0
80105e7a:	e9 20 f4 ff ff       	jmp    8010529f <alltraps>

80105e7f <vector193>:
80105e7f:	6a 00                	push   $0x0
80105e81:	68 c1 00 00 00       	push   $0xc1
80105e86:	e9 14 f4 ff ff       	jmp    8010529f <alltraps>

80105e8b <vector194>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	68 c2 00 00 00       	push   $0xc2
80105e92:	e9 08 f4 ff ff       	jmp    8010529f <alltraps>

80105e97 <vector195>:
80105e97:	6a 00                	push   $0x0
80105e99:	68 c3 00 00 00       	push   $0xc3
80105e9e:	e9 fc f3 ff ff       	jmp    8010529f <alltraps>

80105ea3 <vector196>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	68 c4 00 00 00       	push   $0xc4
80105eaa:	e9 f0 f3 ff ff       	jmp    8010529f <alltraps>

80105eaf <vector197>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	68 c5 00 00 00       	push   $0xc5
80105eb6:	e9 e4 f3 ff ff       	jmp    8010529f <alltraps>

80105ebb <vector198>:
80105ebb:	6a 00                	push   $0x0
80105ebd:	68 c6 00 00 00       	push   $0xc6
80105ec2:	e9 d8 f3 ff ff       	jmp    8010529f <alltraps>

80105ec7 <vector199>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	68 c7 00 00 00       	push   $0xc7
80105ece:	e9 cc f3 ff ff       	jmp    8010529f <alltraps>

80105ed3 <vector200>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	68 c8 00 00 00       	push   $0xc8
80105eda:	e9 c0 f3 ff ff       	jmp    8010529f <alltraps>

80105edf <vector201>:
80105edf:	6a 00                	push   $0x0
80105ee1:	68 c9 00 00 00       	push   $0xc9
80105ee6:	e9 b4 f3 ff ff       	jmp    8010529f <alltraps>

80105eeb <vector202>:
80105eeb:	6a 00                	push   $0x0
80105eed:	68 ca 00 00 00       	push   $0xca
80105ef2:	e9 a8 f3 ff ff       	jmp    8010529f <alltraps>

80105ef7 <vector203>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	68 cb 00 00 00       	push   $0xcb
80105efe:	e9 9c f3 ff ff       	jmp    8010529f <alltraps>

80105f03 <vector204>:
80105f03:	6a 00                	push   $0x0
80105f05:	68 cc 00 00 00       	push   $0xcc
80105f0a:	e9 90 f3 ff ff       	jmp    8010529f <alltraps>

80105f0f <vector205>:
80105f0f:	6a 00                	push   $0x0
80105f11:	68 cd 00 00 00       	push   $0xcd
80105f16:	e9 84 f3 ff ff       	jmp    8010529f <alltraps>

80105f1b <vector206>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	68 ce 00 00 00       	push   $0xce
80105f22:	e9 78 f3 ff ff       	jmp    8010529f <alltraps>

80105f27 <vector207>:
80105f27:	6a 00                	push   $0x0
80105f29:	68 cf 00 00 00       	push   $0xcf
80105f2e:	e9 6c f3 ff ff       	jmp    8010529f <alltraps>

80105f33 <vector208>:
80105f33:	6a 00                	push   $0x0
80105f35:	68 d0 00 00 00       	push   $0xd0
80105f3a:	e9 60 f3 ff ff       	jmp    8010529f <alltraps>

80105f3f <vector209>:
80105f3f:	6a 00                	push   $0x0
80105f41:	68 d1 00 00 00       	push   $0xd1
80105f46:	e9 54 f3 ff ff       	jmp    8010529f <alltraps>

80105f4b <vector210>:
80105f4b:	6a 00                	push   $0x0
80105f4d:	68 d2 00 00 00       	push   $0xd2
80105f52:	e9 48 f3 ff ff       	jmp    8010529f <alltraps>

80105f57 <vector211>:
80105f57:	6a 00                	push   $0x0
80105f59:	68 d3 00 00 00       	push   $0xd3
80105f5e:	e9 3c f3 ff ff       	jmp    8010529f <alltraps>

80105f63 <vector212>:
80105f63:	6a 00                	push   $0x0
80105f65:	68 d4 00 00 00       	push   $0xd4
80105f6a:	e9 30 f3 ff ff       	jmp    8010529f <alltraps>

80105f6f <vector213>:
80105f6f:	6a 00                	push   $0x0
80105f71:	68 d5 00 00 00       	push   $0xd5
80105f76:	e9 24 f3 ff ff       	jmp    8010529f <alltraps>

80105f7b <vector214>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	68 d6 00 00 00       	push   $0xd6
80105f82:	e9 18 f3 ff ff       	jmp    8010529f <alltraps>

80105f87 <vector215>:
80105f87:	6a 00                	push   $0x0
80105f89:	68 d7 00 00 00       	push   $0xd7
80105f8e:	e9 0c f3 ff ff       	jmp    8010529f <alltraps>

80105f93 <vector216>:
80105f93:	6a 00                	push   $0x0
80105f95:	68 d8 00 00 00       	push   $0xd8
80105f9a:	e9 00 f3 ff ff       	jmp    8010529f <alltraps>

80105f9f <vector217>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	68 d9 00 00 00       	push   $0xd9
80105fa6:	e9 f4 f2 ff ff       	jmp    8010529f <alltraps>

80105fab <vector218>:
80105fab:	6a 00                	push   $0x0
80105fad:	68 da 00 00 00       	push   $0xda
80105fb2:	e9 e8 f2 ff ff       	jmp    8010529f <alltraps>

80105fb7 <vector219>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	68 db 00 00 00       	push   $0xdb
80105fbe:	e9 dc f2 ff ff       	jmp    8010529f <alltraps>

80105fc3 <vector220>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	68 dc 00 00 00       	push   $0xdc
80105fca:	e9 d0 f2 ff ff       	jmp    8010529f <alltraps>

80105fcf <vector221>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	68 dd 00 00 00       	push   $0xdd
80105fd6:	e9 c4 f2 ff ff       	jmp    8010529f <alltraps>

80105fdb <vector222>:
80105fdb:	6a 00                	push   $0x0
80105fdd:	68 de 00 00 00       	push   $0xde
80105fe2:	e9 b8 f2 ff ff       	jmp    8010529f <alltraps>

80105fe7 <vector223>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	68 df 00 00 00       	push   $0xdf
80105fee:	e9 ac f2 ff ff       	jmp    8010529f <alltraps>

80105ff3 <vector224>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	68 e0 00 00 00       	push   $0xe0
80105ffa:	e9 a0 f2 ff ff       	jmp    8010529f <alltraps>

80105fff <vector225>:
80105fff:	6a 00                	push   $0x0
80106001:	68 e1 00 00 00       	push   $0xe1
80106006:	e9 94 f2 ff ff       	jmp    8010529f <alltraps>

8010600b <vector226>:
8010600b:	6a 00                	push   $0x0
8010600d:	68 e2 00 00 00       	push   $0xe2
80106012:	e9 88 f2 ff ff       	jmp    8010529f <alltraps>

80106017 <vector227>:
80106017:	6a 00                	push   $0x0
80106019:	68 e3 00 00 00       	push   $0xe3
8010601e:	e9 7c f2 ff ff       	jmp    8010529f <alltraps>

80106023 <vector228>:
80106023:	6a 00                	push   $0x0
80106025:	68 e4 00 00 00       	push   $0xe4
8010602a:	e9 70 f2 ff ff       	jmp    8010529f <alltraps>

8010602f <vector229>:
8010602f:	6a 00                	push   $0x0
80106031:	68 e5 00 00 00       	push   $0xe5
80106036:	e9 64 f2 ff ff       	jmp    8010529f <alltraps>

8010603b <vector230>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 e6 00 00 00       	push   $0xe6
80106042:	e9 58 f2 ff ff       	jmp    8010529f <alltraps>

80106047 <vector231>:
80106047:	6a 00                	push   $0x0
80106049:	68 e7 00 00 00       	push   $0xe7
8010604e:	e9 4c f2 ff ff       	jmp    8010529f <alltraps>

80106053 <vector232>:
80106053:	6a 00                	push   $0x0
80106055:	68 e8 00 00 00       	push   $0xe8
8010605a:	e9 40 f2 ff ff       	jmp    8010529f <alltraps>

8010605f <vector233>:
8010605f:	6a 00                	push   $0x0
80106061:	68 e9 00 00 00       	push   $0xe9
80106066:	e9 34 f2 ff ff       	jmp    8010529f <alltraps>

8010606b <vector234>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 ea 00 00 00       	push   $0xea
80106072:	e9 28 f2 ff ff       	jmp    8010529f <alltraps>

80106077 <vector235>:
80106077:	6a 00                	push   $0x0
80106079:	68 eb 00 00 00       	push   $0xeb
8010607e:	e9 1c f2 ff ff       	jmp    8010529f <alltraps>

80106083 <vector236>:
80106083:	6a 00                	push   $0x0
80106085:	68 ec 00 00 00       	push   $0xec
8010608a:	e9 10 f2 ff ff       	jmp    8010529f <alltraps>

8010608f <vector237>:
8010608f:	6a 00                	push   $0x0
80106091:	68 ed 00 00 00       	push   $0xed
80106096:	e9 04 f2 ff ff       	jmp    8010529f <alltraps>

8010609b <vector238>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 ee 00 00 00       	push   $0xee
801060a2:	e9 f8 f1 ff ff       	jmp    8010529f <alltraps>

801060a7 <vector239>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 ef 00 00 00       	push   $0xef
801060ae:	e9 ec f1 ff ff       	jmp    8010529f <alltraps>

801060b3 <vector240>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 f0 00 00 00       	push   $0xf0
801060ba:	e9 e0 f1 ff ff       	jmp    8010529f <alltraps>

801060bf <vector241>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 f1 00 00 00       	push   $0xf1
801060c6:	e9 d4 f1 ff ff       	jmp    8010529f <alltraps>

801060cb <vector242>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 f2 00 00 00       	push   $0xf2
801060d2:	e9 c8 f1 ff ff       	jmp    8010529f <alltraps>

801060d7 <vector243>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 f3 00 00 00       	push   $0xf3
801060de:	e9 bc f1 ff ff       	jmp    8010529f <alltraps>

801060e3 <vector244>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 f4 00 00 00       	push   $0xf4
801060ea:	e9 b0 f1 ff ff       	jmp    8010529f <alltraps>

801060ef <vector245>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 f5 00 00 00       	push   $0xf5
801060f6:	e9 a4 f1 ff ff       	jmp    8010529f <alltraps>

801060fb <vector246>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 f6 00 00 00       	push   $0xf6
80106102:	e9 98 f1 ff ff       	jmp    8010529f <alltraps>

80106107 <vector247>:
80106107:	6a 00                	push   $0x0
80106109:	68 f7 00 00 00       	push   $0xf7
8010610e:	e9 8c f1 ff ff       	jmp    8010529f <alltraps>

80106113 <vector248>:
80106113:	6a 00                	push   $0x0
80106115:	68 f8 00 00 00       	push   $0xf8
8010611a:	e9 80 f1 ff ff       	jmp    8010529f <alltraps>

8010611f <vector249>:
8010611f:	6a 00                	push   $0x0
80106121:	68 f9 00 00 00       	push   $0xf9
80106126:	e9 74 f1 ff ff       	jmp    8010529f <alltraps>

8010612b <vector250>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 fa 00 00 00       	push   $0xfa
80106132:	e9 68 f1 ff ff       	jmp    8010529f <alltraps>

80106137 <vector251>:
80106137:	6a 00                	push   $0x0
80106139:	68 fb 00 00 00       	push   $0xfb
8010613e:	e9 5c f1 ff ff       	jmp    8010529f <alltraps>

80106143 <vector252>:
80106143:	6a 00                	push   $0x0
80106145:	68 fc 00 00 00       	push   $0xfc
8010614a:	e9 50 f1 ff ff       	jmp    8010529f <alltraps>

8010614f <vector253>:
8010614f:	6a 00                	push   $0x0
80106151:	68 fd 00 00 00       	push   $0xfd
80106156:	e9 44 f1 ff ff       	jmp    8010529f <alltraps>

8010615b <vector254>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 fe 00 00 00       	push   $0xfe
80106162:	e9 38 f1 ff ff       	jmp    8010529f <alltraps>

80106167 <vector255>:
80106167:	6a 00                	push   $0x0
80106169:	68 ff 00 00 00       	push   $0xff
8010616e:	e9 2c f1 ff ff       	jmp    8010529f <alltraps>
80106173:	90                   	nop

80106174 <deallocuvm.part.0>:
80106174:	55                   	push   %ebp
80106175:	89 e5                	mov    %esp,%ebp
80106177:	57                   	push   %edi
80106178:	56                   	push   %esi
80106179:	53                   	push   %ebx
8010617a:	83 ec 1c             	sub    $0x1c,%esp
8010617d:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106183:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106189:	39 d3                	cmp    %edx,%ebx
8010618b:	73 50                	jae    801061dd <deallocuvm.part.0+0x69>
8010618d:	89 c6                	mov    %eax,%esi
8010618f:	89 d7                	mov    %edx,%edi
80106191:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80106194:	eb 0c                	jmp    801061a2 <deallocuvm.part.0+0x2e>
80106196:	66 90                	xchg   %ax,%ax
80106198:	42                   	inc    %edx
80106199:	89 d3                	mov    %edx,%ebx
8010619b:	c1 e3 16             	shl    $0x16,%ebx
8010619e:	39 fb                	cmp    %edi,%ebx
801061a0:	73 38                	jae    801061da <deallocuvm.part.0+0x66>
801061a2:	89 da                	mov    %ebx,%edx
801061a4:	c1 ea 16             	shr    $0x16,%edx
801061a7:	8b 04 96             	mov    (%esi,%edx,4),%eax
801061aa:	a8 01                	test   $0x1,%al
801061ac:	74 ea                	je     80106198 <deallocuvm.part.0+0x24>
801061ae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801061b3:	89 d9                	mov    %ebx,%ecx
801061b5:	c1 e9 0a             	shr    $0xa,%ecx
801061b8:	81 e1 fc 0f 00 00    	and    $0xffc,%ecx
801061be:	8d 84 08 00 00 00 80 	lea    -0x80000000(%eax,%ecx,1),%eax
801061c5:	85 c0                	test   %eax,%eax
801061c7:	74 cf                	je     80106198 <deallocuvm.part.0+0x24>
801061c9:	8b 10                	mov    (%eax),%edx
801061cb:	f6 c2 01             	test   $0x1,%dl
801061ce:	75 18                	jne    801061e8 <deallocuvm.part.0+0x74>
801061d0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801061d6:	39 fb                	cmp    %edi,%ebx
801061d8:	72 c8                	jb     801061a2 <deallocuvm.part.0+0x2e>
801061da:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801061dd:	89 c8                	mov    %ecx,%eax
801061df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061e2:	5b                   	pop    %ebx
801061e3:	5e                   	pop    %esi
801061e4:	5f                   	pop    %edi
801061e5:	5d                   	pop    %ebp
801061e6:	c3                   	ret    
801061e7:	90                   	nop
801061e8:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801061ee:	74 26                	je     80106216 <deallocuvm.part.0+0xa2>
801061f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801061f3:	83 ec 0c             	sub    $0xc,%esp
801061f6:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801061fc:	52                   	push   %edx
801061fd:	e8 36 c0 ff ff       	call   80102238 <kfree>
80106202:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106205:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010620b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106211:	83 c4 10             	add    $0x10,%esp
80106214:	eb 88                	jmp    8010619e <deallocuvm.part.0+0x2a>
80106216:	83 ec 0c             	sub    $0xc,%esp
80106219:	68 c6 6c 10 80       	push   $0x80106cc6
8010621e:	e8 15 a1 ff ff       	call   80100338 <panic>
80106223:	90                   	nop

80106224 <mappages>:
80106224:	55                   	push   %ebp
80106225:	89 e5                	mov    %esp,%ebp
80106227:	57                   	push   %edi
80106228:	56                   	push   %esi
80106229:	53                   	push   %ebx
8010622a:	83 ec 1c             	sub    $0x1c,%esp
8010622d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106230:	89 d3                	mov    %edx,%ebx
80106232:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106238:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010623c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106241:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106244:	8b 45 08             	mov    0x8(%ebp),%eax
80106247:	29 d8                	sub    %ebx,%eax
80106249:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010624c:	eb 3b                	jmp    80106289 <mappages+0x65>
8010624e:	66 90                	xchg   %ax,%ax
80106250:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106255:	89 da                	mov    %ebx,%edx
80106257:	c1 ea 0a             	shr    $0xa,%edx
8010625a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106260:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
80106267:	85 c0                	test   %eax,%eax
80106269:	74 71                	je     801062dc <mappages+0xb8>
8010626b:	f6 00 01             	testb  $0x1,(%eax)
8010626e:	0f 85 82 00 00 00    	jne    801062f6 <mappages+0xd2>
80106274:	0b 75 0c             	or     0xc(%ebp),%esi
80106277:	83 ce 01             	or     $0x1,%esi
8010627a:	89 30                	mov    %esi,(%eax)
8010627c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010627f:	39 c3                	cmp    %eax,%ebx
80106281:	74 69                	je     801062ec <mappages+0xc8>
80106283:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106289:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010628c:	8d 34 03             	lea    (%ebx,%eax,1),%esi
8010628f:	89 d8                	mov    %ebx,%eax
80106291:	c1 e8 16             	shr    $0x16,%eax
80106294:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80106297:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
8010629a:	8b 07                	mov    (%edi),%eax
8010629c:	a8 01                	test   $0x1,%al
8010629e:	75 b0                	jne    80106250 <mappages+0x2c>
801062a0:	e8 23 c1 ff ff       	call   801023c8 <kalloc>
801062a5:	89 c2                	mov    %eax,%edx
801062a7:	85 c0                	test   %eax,%eax
801062a9:	74 31                	je     801062dc <mappages+0xb8>
801062ab:	50                   	push   %eax
801062ac:	68 00 10 00 00       	push   $0x1000
801062b1:	6a 00                	push   $0x0
801062b3:	52                   	push   %edx
801062b4:	89 55 d8             	mov    %edx,-0x28(%ebp)
801062b7:	e8 d0 de ff ff       	call   8010418c <memset>
801062bc:	8b 55 d8             	mov    -0x28(%ebp),%edx
801062bf:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
801062c5:	83 c8 07             	or     $0x7,%eax
801062c8:	89 07                	mov    %eax,(%edi)
801062ca:	89 d8                	mov    %ebx,%eax
801062cc:	c1 e8 0a             	shr    $0xa,%eax
801062cf:	25 fc 0f 00 00       	and    $0xffc,%eax
801062d4:	01 d0                	add    %edx,%eax
801062d6:	83 c4 10             	add    $0x10,%esp
801062d9:	eb 90                	jmp    8010626b <mappages+0x47>
801062db:	90                   	nop
801062dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801062e4:	5b                   	pop    %ebx
801062e5:	5e                   	pop    %esi
801062e6:	5f                   	pop    %edi
801062e7:	5d                   	pop    %ebp
801062e8:	c3                   	ret    
801062e9:	8d 76 00             	lea    0x0(%esi),%esi
801062ec:	31 c0                	xor    %eax,%eax
801062ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801062f1:	5b                   	pop    %ebx
801062f2:	5e                   	pop    %esi
801062f3:	5f                   	pop    %edi
801062f4:	5d                   	pop    %ebp
801062f5:	c3                   	ret    
801062f6:	83 ec 0c             	sub    $0xc,%esp
801062f9:	68 7c 73 10 80       	push   $0x8010737c
801062fe:	e8 35 a0 ff ff       	call   80100338 <panic>
80106303:	90                   	nop

80106304 <seginit>:
80106304:	55                   	push   %ebp
80106305:	89 e5                	mov    %esp,%ebp
80106307:	83 ec 18             	sub    $0x18,%esp
8010630a:	e8 cd d1 ff ff       	call   801034dc <cpuid>
8010630f:	8d 14 80             	lea    (%eax,%eax,4),%edx
80106312:	01 d2                	add    %edx,%edx
80106314:	01 d0                	add    %edx,%eax
80106316:	c1 e0 04             	shl    $0x4,%eax
80106319:	c7 80 18 18 11 80 ff 	movl   $0xffff,-0x7feee7e8(%eax)
80106320:	ff 00 00 
80106323:	c7 80 1c 18 11 80 00 	movl   $0xcf9a00,-0x7feee7e4(%eax)
8010632a:	9a cf 00 
8010632d:	c7 80 20 18 11 80 ff 	movl   $0xffff,-0x7feee7e0(%eax)
80106334:	ff 00 00 
80106337:	c7 80 24 18 11 80 00 	movl   $0xcf9200,-0x7feee7dc(%eax)
8010633e:	92 cf 00 
80106341:	c7 80 28 18 11 80 ff 	movl   $0xffff,-0x7feee7d8(%eax)
80106348:	ff 00 00 
8010634b:	c7 80 2c 18 11 80 00 	movl   $0xcffa00,-0x7feee7d4(%eax)
80106352:	fa cf 00 
80106355:	c7 80 30 18 11 80 ff 	movl   $0xffff,-0x7feee7d0(%eax)
8010635c:	ff 00 00 
8010635f:	c7 80 34 18 11 80 00 	movl   $0xcff200,-0x7feee7cc(%eax)
80106366:	f2 cf 00 
80106369:	05 10 18 11 80       	add    $0x80111810,%eax
8010636e:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
80106374:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106378:	c1 e8 10             	shr    $0x10,%eax
8010637b:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010637f:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106382:	0f 01 10             	lgdtl  (%eax)
80106385:	c9                   	leave  
80106386:	c3                   	ret    
80106387:	90                   	nop

80106388 <switchkvm>:
80106388:	a1 c4 49 11 80       	mov    0x801149c4,%eax
8010638d:	05 00 00 00 80       	add    $0x80000000,%eax
80106392:	0f 22 d8             	mov    %eax,%cr3
80106395:	c3                   	ret    
80106396:	66 90                	xchg   %ax,%ax

80106398 <switchuvm>:
80106398:	55                   	push   %ebp
80106399:	89 e5                	mov    %esp,%ebp
8010639b:	57                   	push   %edi
8010639c:	56                   	push   %esi
8010639d:	53                   	push   %ebx
8010639e:	83 ec 1c             	sub    $0x1c,%esp
801063a1:	8b 75 08             	mov    0x8(%ebp),%esi
801063a4:	85 f6                	test   %esi,%esi
801063a6:	0f 84 bf 00 00 00    	je     8010646b <switchuvm+0xd3>
801063ac:	8b 56 08             	mov    0x8(%esi),%edx
801063af:	85 d2                	test   %edx,%edx
801063b1:	0f 84 ce 00 00 00    	je     80106485 <switchuvm+0xed>
801063b7:	8b 46 04             	mov    0x4(%esi),%eax
801063ba:	85 c0                	test   %eax,%eax
801063bc:	0f 84 b6 00 00 00    	je     80106478 <switchuvm+0xe0>
801063c2:	e8 c1 db ff ff       	call   80103f88 <pushcli>
801063c7:	e8 ac d0 ff ff       	call   80103478 <mycpu>
801063cc:	89 c3                	mov    %eax,%ebx
801063ce:	e8 a5 d0 ff ff       	call   80103478 <mycpu>
801063d3:	89 c7                	mov    %eax,%edi
801063d5:	e8 9e d0 ff ff       	call   80103478 <mycpu>
801063da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801063dd:	e8 96 d0 ff ff       	call   80103478 <mycpu>
801063e2:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
801063e9:	67 00 
801063eb:	83 c7 08             	add    $0x8,%edi
801063ee:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801063f5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801063f8:	83 c1 08             	add    $0x8,%ecx
801063fb:	c1 e9 10             	shr    $0x10,%ecx
801063fe:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106404:	66 c7 83 9d 00 00 00 	movw   $0x4099,0x9d(%ebx)
8010640b:	99 40 
8010640d:	83 c0 08             	add    $0x8,%eax
80106410:	c1 e8 18             	shr    $0x18,%eax
80106413:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106419:	e8 5a d0 ff ff       	call   80103478 <mycpu>
8010641e:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106425:	e8 4e d0 ff ff       	call   80103478 <mycpu>
8010642a:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
80106430:	8b 5e 08             	mov    0x8(%esi),%ebx
80106433:	e8 40 d0 ff ff       	call   80103478 <mycpu>
80106438:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010643e:	89 58 0c             	mov    %ebx,0xc(%eax)
80106441:	e8 32 d0 ff ff       	call   80103478 <mycpu>
80106446:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
8010644c:	b8 28 00 00 00       	mov    $0x28,%eax
80106451:	0f 00 d8             	ltr    %ax
80106454:	8b 46 04             	mov    0x4(%esi),%eax
80106457:	05 00 00 00 80       	add    $0x80000000,%eax
8010645c:	0f 22 d8             	mov    %eax,%cr3
8010645f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106462:	5b                   	pop    %ebx
80106463:	5e                   	pop    %esi
80106464:	5f                   	pop    %edi
80106465:	5d                   	pop    %ebp
80106466:	e9 69 db ff ff       	jmp    80103fd4 <popcli>
8010646b:	83 ec 0c             	sub    $0xc,%esp
8010646e:	68 82 73 10 80       	push   $0x80107382
80106473:	e8 c0 9e ff ff       	call   80100338 <panic>
80106478:	83 ec 0c             	sub    $0xc,%esp
8010647b:	68 ad 73 10 80       	push   $0x801073ad
80106480:	e8 b3 9e ff ff       	call   80100338 <panic>
80106485:	83 ec 0c             	sub    $0xc,%esp
80106488:	68 98 73 10 80       	push   $0x80107398
8010648d:	e8 a6 9e ff ff       	call   80100338 <panic>
80106492:	66 90                	xchg   %ax,%ax

80106494 <inituvm>:
80106494:	55                   	push   %ebp
80106495:	89 e5                	mov    %esp,%ebp
80106497:	57                   	push   %edi
80106498:	56                   	push   %esi
80106499:	53                   	push   %ebx
8010649a:	83 ec 1c             	sub    $0x1c,%esp
8010649d:	8b 45 08             	mov    0x8(%ebp),%eax
801064a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801064a3:	8b 7d 0c             	mov    0xc(%ebp),%edi
801064a6:	8b 75 10             	mov    0x10(%ebp),%esi
801064a9:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801064af:	77 47                	ja     801064f8 <inituvm+0x64>
801064b1:	e8 12 bf ff ff       	call   801023c8 <kalloc>
801064b6:	89 c3                	mov    %eax,%ebx
801064b8:	50                   	push   %eax
801064b9:	68 00 10 00 00       	push   $0x1000
801064be:	6a 00                	push   $0x0
801064c0:	53                   	push   %ebx
801064c1:	e8 c6 dc ff ff       	call   8010418c <memset>
801064c6:	5a                   	pop    %edx
801064c7:	59                   	pop    %ecx
801064c8:	6a 06                	push   $0x6
801064ca:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801064d0:	50                   	push   %eax
801064d1:	b9 00 10 00 00       	mov    $0x1000,%ecx
801064d6:	31 d2                	xor    %edx,%edx
801064d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801064db:	e8 44 fd ff ff       	call   80106224 <mappages>
801064e0:	83 c4 10             	add    $0x10,%esp
801064e3:	89 75 10             	mov    %esi,0x10(%ebp)
801064e6:	89 7d 0c             	mov    %edi,0xc(%ebp)
801064e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801064ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801064ef:	5b                   	pop    %ebx
801064f0:	5e                   	pop    %esi
801064f1:	5f                   	pop    %edi
801064f2:	5d                   	pop    %ebp
801064f3:	e9 10 dd ff ff       	jmp    80104208 <memmove>
801064f8:	83 ec 0c             	sub    $0xc,%esp
801064fb:	68 c1 73 10 80       	push   $0x801073c1
80106500:	e8 33 9e ff ff       	call   80100338 <panic>
80106505:	8d 76 00             	lea    0x0(%esi),%esi

80106508 <loaduvm>:
80106508:	55                   	push   %ebp
80106509:	89 e5                	mov    %esp,%ebp
8010650b:	57                   	push   %edi
8010650c:	56                   	push   %esi
8010650d:	53                   	push   %ebx
8010650e:	83 ec 0c             	sub    $0xc,%esp
80106511:	8b 7d 18             	mov    0x18(%ebp),%edi
80106514:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80106517:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
8010651d:	0f 85 9a 00 00 00    	jne    801065bd <loaduvm+0xb5>
80106523:	85 ff                	test   %edi,%edi
80106525:	74 7c                	je     801065a3 <loaduvm+0x9b>
80106527:	90                   	nop
80106528:	8b 45 0c             	mov    0xc(%ebp),%eax
8010652b:	01 d8                	add    %ebx,%eax
8010652d:	89 c2                	mov    %eax,%edx
8010652f:	c1 ea 16             	shr    $0x16,%edx
80106532:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106535:	8b 14 91             	mov    (%ecx,%edx,4),%edx
80106538:	f6 c2 01             	test   $0x1,%dl
8010653b:	75 0f                	jne    8010654c <loaduvm+0x44>
8010653d:	83 ec 0c             	sub    $0xc,%esp
80106540:	68 db 73 10 80       	push   $0x801073db
80106545:	e8 ee 9d ff ff       	call   80100338 <panic>
8010654a:	66 90                	xchg   %ax,%ax
8010654c:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106552:	c1 e8 0a             	shr    $0xa,%eax
80106555:	25 fc 0f 00 00       	and    $0xffc,%eax
8010655a:	8d 8c 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%ecx
80106561:	85 c9                	test   %ecx,%ecx
80106563:	74 d8                	je     8010653d <loaduvm+0x35>
80106565:	89 fe                	mov    %edi,%esi
80106567:	29 de                	sub    %ebx,%esi
80106569:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
8010656f:	76 05                	jbe    80106576 <loaduvm+0x6e>
80106571:	be 00 10 00 00       	mov    $0x1000,%esi
80106576:	56                   	push   %esi
80106577:	8b 45 14             	mov    0x14(%ebp),%eax
8010657a:	01 d8                	add    %ebx,%eax
8010657c:	50                   	push   %eax
8010657d:	8b 01                	mov    (%ecx),%eax
8010657f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106584:	05 00 00 00 80       	add    $0x80000000,%eax
80106589:	50                   	push   %eax
8010658a:	ff 75 10             	pushl  0x10(%ebp)
8010658d:	e8 52 b3 ff ff       	call   801018e4 <readi>
80106592:	83 c4 10             	add    $0x10,%esp
80106595:	39 f0                	cmp    %esi,%eax
80106597:	75 17                	jne    801065b0 <loaduvm+0xa8>
80106599:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010659f:	39 fb                	cmp    %edi,%ebx
801065a1:	72 85                	jb     80106528 <loaduvm+0x20>
801065a3:	31 c0                	xor    %eax,%eax
801065a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065a8:	5b                   	pop    %ebx
801065a9:	5e                   	pop    %esi
801065aa:	5f                   	pop    %edi
801065ab:	5d                   	pop    %ebp
801065ac:	c3                   	ret    
801065ad:	8d 76 00             	lea    0x0(%esi),%esi
801065b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801065b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065b8:	5b                   	pop    %ebx
801065b9:	5e                   	pop    %esi
801065ba:	5f                   	pop    %edi
801065bb:	5d                   	pop    %ebp
801065bc:	c3                   	ret    
801065bd:	83 ec 0c             	sub    $0xc,%esp
801065c0:	68 7c 74 10 80       	push   $0x8010747c
801065c5:	e8 6e 9d ff ff       	call   80100338 <panic>
801065ca:	66 90                	xchg   %ax,%ax

801065cc <allocuvm>:
801065cc:	55                   	push   %ebp
801065cd:	89 e5                	mov    %esp,%ebp
801065cf:	57                   	push   %edi
801065d0:	56                   	push   %esi
801065d1:	53                   	push   %ebx
801065d2:	83 ec 1c             	sub    $0x1c,%esp
801065d5:	8b 75 10             	mov    0x10(%ebp),%esi
801065d8:	85 f6                	test   %esi,%esi
801065da:	0f 88 8a 00 00 00    	js     8010666a <allocuvm+0x9e>
801065e0:	89 f2                	mov    %esi,%edx
801065e2:	3b 75 0c             	cmp    0xc(%ebp),%esi
801065e5:	0f 82 8d 00 00 00    	jb     80106678 <allocuvm+0xac>
801065eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801065ee:	05 ff 0f 00 00       	add    $0xfff,%eax
801065f3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801065f8:	89 c7                	mov    %eax,%edi
801065fa:	39 f0                	cmp    %esi,%eax
801065fc:	73 7d                	jae    8010667b <allocuvm+0xaf>
801065fe:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80106601:	eb 3a                	jmp    8010663d <allocuvm+0x71>
80106603:	90                   	nop
80106604:	50                   	push   %eax
80106605:	68 00 10 00 00       	push   $0x1000
8010660a:	6a 00                	push   $0x0
8010660c:	53                   	push   %ebx
8010660d:	e8 7a db ff ff       	call   8010418c <memset>
80106612:	5a                   	pop    %edx
80106613:	59                   	pop    %ecx
80106614:	6a 06                	push   $0x6
80106616:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010661c:	50                   	push   %eax
8010661d:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106622:	89 fa                	mov    %edi,%edx
80106624:	8b 45 08             	mov    0x8(%ebp),%eax
80106627:	e8 f8 fb ff ff       	call   80106224 <mappages>
8010662c:	83 c4 10             	add    $0x10,%esp
8010662f:	85 c0                	test   %eax,%eax
80106631:	78 55                	js     80106688 <allocuvm+0xbc>
80106633:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106639:	39 f7                	cmp    %esi,%edi
8010663b:	73 7f                	jae    801066bc <allocuvm+0xf0>
8010663d:	e8 86 bd ff ff       	call   801023c8 <kalloc>
80106642:	89 c3                	mov    %eax,%ebx
80106644:	85 c0                	test   %eax,%eax
80106646:	75 bc                	jne    80106604 <allocuvm+0x38>
80106648:	83 ec 0c             	sub    $0xc,%esp
8010664b:	68 f9 73 10 80       	push   $0x801073f9
80106650:	e8 d3 9f ff ff       	call   80100628 <cprintf>
80106655:	83 c4 10             	add    $0x10,%esp
80106658:	3b 75 0c             	cmp    0xc(%ebp),%esi
8010665b:	74 0d                	je     8010666a <allocuvm+0x9e>
8010665d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106660:	89 f2                	mov    %esi,%edx
80106662:	8b 45 08             	mov    0x8(%ebp),%eax
80106665:	e8 0a fb ff ff       	call   80106174 <deallocuvm.part.0>
8010666a:	31 d2                	xor    %edx,%edx
8010666c:	89 d0                	mov    %edx,%eax
8010666e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106671:	5b                   	pop    %ebx
80106672:	5e                   	pop    %esi
80106673:	5f                   	pop    %edi
80106674:	5d                   	pop    %ebp
80106675:	c3                   	ret    
80106676:	66 90                	xchg   %ax,%ax
80106678:	8b 55 0c             	mov    0xc(%ebp),%edx
8010667b:	89 d0                	mov    %edx,%eax
8010667d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106680:	5b                   	pop    %ebx
80106681:	5e                   	pop    %esi
80106682:	5f                   	pop    %edi
80106683:	5d                   	pop    %ebp
80106684:	c3                   	ret    
80106685:	8d 76 00             	lea    0x0(%esi),%esi
80106688:	83 ec 0c             	sub    $0xc,%esp
8010668b:	68 11 74 10 80       	push   $0x80107411
80106690:	e8 93 9f ff ff       	call   80100628 <cprintf>
80106695:	83 c4 10             	add    $0x10,%esp
80106698:	3b 75 0c             	cmp    0xc(%ebp),%esi
8010669b:	74 0d                	je     801066aa <allocuvm+0xde>
8010669d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801066a0:	89 f2                	mov    %esi,%edx
801066a2:	8b 45 08             	mov    0x8(%ebp),%eax
801066a5:	e8 ca fa ff ff       	call   80106174 <deallocuvm.part.0>
801066aa:	83 ec 0c             	sub    $0xc,%esp
801066ad:	53                   	push   %ebx
801066ae:	e8 85 bb ff ff       	call   80102238 <kfree>
801066b3:	83 c4 10             	add    $0x10,%esp
801066b6:	31 d2                	xor    %edx,%edx
801066b8:	eb b2                	jmp    8010666c <allocuvm+0xa0>
801066ba:	66 90                	xchg   %ax,%ax
801066bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801066bf:	89 d0                	mov    %edx,%eax
801066c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066c4:	5b                   	pop    %ebx
801066c5:	5e                   	pop    %esi
801066c6:	5f                   	pop    %edi
801066c7:	5d                   	pop    %ebp
801066c8:	c3                   	ret    
801066c9:	8d 76 00             	lea    0x0(%esi),%esi

801066cc <deallocuvm>:
801066cc:	55                   	push   %ebp
801066cd:	89 e5                	mov    %esp,%ebp
801066cf:	8b 45 08             	mov    0x8(%ebp),%eax
801066d2:	8b 55 0c             	mov    0xc(%ebp),%edx
801066d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801066d8:	39 d1                	cmp    %edx,%ecx
801066da:	73 08                	jae    801066e4 <deallocuvm+0x18>
801066dc:	5d                   	pop    %ebp
801066dd:	e9 92 fa ff ff       	jmp    80106174 <deallocuvm.part.0>
801066e2:	66 90                	xchg   %ax,%ax
801066e4:	89 d0                	mov    %edx,%eax
801066e6:	5d                   	pop    %ebp
801066e7:	c3                   	ret    

801066e8 <freevm>:
801066e8:	55                   	push   %ebp
801066e9:	89 e5                	mov    %esp,%ebp
801066eb:	57                   	push   %edi
801066ec:	56                   	push   %esi
801066ed:	53                   	push   %ebx
801066ee:	83 ec 0c             	sub    $0xc,%esp
801066f1:	8b 75 08             	mov    0x8(%ebp),%esi
801066f4:	85 f6                	test   %esi,%esi
801066f6:	74 51                	je     80106749 <freevm+0x61>
801066f8:	31 c9                	xor    %ecx,%ecx
801066fa:	ba 00 00 00 80       	mov    $0x80000000,%edx
801066ff:	89 f0                	mov    %esi,%eax
80106701:	e8 6e fa ff ff       	call   80106174 <deallocuvm.part.0>
80106706:	89 f3                	mov    %esi,%ebx
80106708:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
8010670e:	eb 07                	jmp    80106717 <freevm+0x2f>
80106710:	83 c3 04             	add    $0x4,%ebx
80106713:	39 fb                	cmp    %edi,%ebx
80106715:	74 23                	je     8010673a <freevm+0x52>
80106717:	8b 03                	mov    (%ebx),%eax
80106719:	a8 01                	test   $0x1,%al
8010671b:	74 f3                	je     80106710 <freevm+0x28>
8010671d:	83 ec 0c             	sub    $0xc,%esp
80106720:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106725:	05 00 00 00 80       	add    $0x80000000,%eax
8010672a:	50                   	push   %eax
8010672b:	e8 08 bb ff ff       	call   80102238 <kfree>
80106730:	83 c4 10             	add    $0x10,%esp
80106733:	83 c3 04             	add    $0x4,%ebx
80106736:	39 fb                	cmp    %edi,%ebx
80106738:	75 dd                	jne    80106717 <freevm+0x2f>
8010673a:	89 75 08             	mov    %esi,0x8(%ebp)
8010673d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106740:	5b                   	pop    %ebx
80106741:	5e                   	pop    %esi
80106742:	5f                   	pop    %edi
80106743:	5d                   	pop    %ebp
80106744:	e9 ef ba ff ff       	jmp    80102238 <kfree>
80106749:	83 ec 0c             	sub    $0xc,%esp
8010674c:	68 2d 74 10 80       	push   $0x8010742d
80106751:	e8 e2 9b ff ff       	call   80100338 <panic>
80106756:	66 90                	xchg   %ax,%ax

80106758 <setupkvm>:
80106758:	55                   	push   %ebp
80106759:	89 e5                	mov    %esp,%ebp
8010675b:	56                   	push   %esi
8010675c:	53                   	push   %ebx
8010675d:	e8 66 bc ff ff       	call   801023c8 <kalloc>
80106762:	85 c0                	test   %eax,%eax
80106764:	74 5a                	je     801067c0 <setupkvm+0x68>
80106766:	89 c6                	mov    %eax,%esi
80106768:	50                   	push   %eax
80106769:	68 00 10 00 00       	push   $0x1000
8010676e:	6a 00                	push   $0x0
80106770:	56                   	push   %esi
80106771:	e8 16 da ff ff       	call   8010418c <memset>
80106776:	83 c4 10             	add    $0x10,%esp
80106779:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
8010677e:	8b 43 04             	mov    0x4(%ebx),%eax
80106781:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106784:	29 c1                	sub    %eax,%ecx
80106786:	8b 13                	mov    (%ebx),%edx
80106788:	83 ec 08             	sub    $0x8,%esp
8010678b:	ff 73 0c             	pushl  0xc(%ebx)
8010678e:	50                   	push   %eax
8010678f:	89 f0                	mov    %esi,%eax
80106791:	e8 8e fa ff ff       	call   80106224 <mappages>
80106796:	83 c4 10             	add    $0x10,%esp
80106799:	85 c0                	test   %eax,%eax
8010679b:	78 17                	js     801067b4 <setupkvm+0x5c>
8010679d:	83 c3 10             	add    $0x10,%ebx
801067a0:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801067a6:	75 d6                	jne    8010677e <setupkvm+0x26>
801067a8:	89 f0                	mov    %esi,%eax
801067aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801067ad:	5b                   	pop    %ebx
801067ae:	5e                   	pop    %esi
801067af:	5d                   	pop    %ebp
801067b0:	c3                   	ret    
801067b1:	8d 76 00             	lea    0x0(%esi),%esi
801067b4:	83 ec 0c             	sub    $0xc,%esp
801067b7:	56                   	push   %esi
801067b8:	e8 2b ff ff ff       	call   801066e8 <freevm>
801067bd:	83 c4 10             	add    $0x10,%esp
801067c0:	31 f6                	xor    %esi,%esi
801067c2:	89 f0                	mov    %esi,%eax
801067c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801067c7:	5b                   	pop    %ebx
801067c8:	5e                   	pop    %esi
801067c9:	5d                   	pop    %ebp
801067ca:	c3                   	ret    
801067cb:	90                   	nop

801067cc <kvmalloc>:
801067cc:	55                   	push   %ebp
801067cd:	89 e5                	mov    %esp,%ebp
801067cf:	83 ec 08             	sub    $0x8,%esp
801067d2:	e8 81 ff ff ff       	call   80106758 <setupkvm>
801067d7:	a3 c4 49 11 80       	mov    %eax,0x801149c4
801067dc:	05 00 00 00 80       	add    $0x80000000,%eax
801067e1:	0f 22 d8             	mov    %eax,%cr3
801067e4:	c9                   	leave  
801067e5:	c3                   	ret    
801067e6:	66 90                	xchg   %ax,%ax

801067e8 <clearpteu>:
801067e8:	55                   	push   %ebp
801067e9:	89 e5                	mov    %esp,%ebp
801067eb:	83 ec 08             	sub    $0x8,%esp
801067ee:	8b 55 0c             	mov    0xc(%ebp),%edx
801067f1:	c1 ea 16             	shr    $0x16,%edx
801067f4:	8b 45 08             	mov    0x8(%ebp),%eax
801067f7:	8b 04 90             	mov    (%eax,%edx,4),%eax
801067fa:	a8 01                	test   $0x1,%al
801067fc:	75 0e                	jne    8010680c <clearpteu+0x24>
801067fe:	83 ec 0c             	sub    $0xc,%esp
80106801:	68 3e 74 10 80       	push   $0x8010743e
80106806:	e8 2d 9b ff ff       	call   80100338 <panic>
8010680b:	90                   	nop
8010680c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106811:	89 c2                	mov    %eax,%edx
80106813:	8b 45 0c             	mov    0xc(%ebp),%eax
80106816:	c1 e8 0a             	shr    $0xa,%eax
80106819:	25 fc 0f 00 00       	and    $0xffc,%eax
8010681e:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
80106825:	85 c0                	test   %eax,%eax
80106827:	74 d5                	je     801067fe <clearpteu+0x16>
80106829:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010682c:	c9                   	leave  
8010682d:	c3                   	ret    
8010682e:	66 90                	xchg   %ax,%ax

80106830 <copyuvm>:
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	57                   	push   %edi
80106834:	56                   	push   %esi
80106835:	53                   	push   %ebx
80106836:	83 ec 1c             	sub    $0x1c,%esp
80106839:	e8 1a ff ff ff       	call   80106758 <setupkvm>
8010683e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106841:	85 c0                	test   %eax,%eax
80106843:	0f 84 d5 00 00 00    	je     8010691e <copyuvm+0xee>
80106849:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010684c:	85 db                	test   %ebx,%ebx
8010684e:	0f 84 a5 00 00 00    	je     801068f9 <copyuvm+0xc9>
80106854:	31 ff                	xor    %edi,%edi
80106856:	66 90                	xchg   %ax,%ax
80106858:	89 f8                	mov    %edi,%eax
8010685a:	c1 e8 16             	shr    $0x16,%eax
8010685d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106860:	8b 04 81             	mov    (%ecx,%eax,4),%eax
80106863:	a8 01                	test   $0x1,%al
80106865:	75 0d                	jne    80106874 <copyuvm+0x44>
80106867:	83 ec 0c             	sub    $0xc,%esp
8010686a:	68 48 74 10 80       	push   $0x80107448
8010686f:	e8 c4 9a ff ff       	call   80100338 <panic>
80106874:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106879:	89 fa                	mov    %edi,%edx
8010687b:	c1 ea 0a             	shr    $0xa,%edx
8010687e:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106884:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
8010688b:	85 c0                	test   %eax,%eax
8010688d:	74 d8                	je     80106867 <copyuvm+0x37>
8010688f:	8b 18                	mov    (%eax),%ebx
80106891:	f6 c3 01             	test   $0x1,%bl
80106894:	0f 84 96 00 00 00    	je     80106930 <copyuvm+0x100>
8010689a:	89 d8                	mov    %ebx,%eax
8010689c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801068a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068a4:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
801068aa:	e8 19 bb ff ff       	call   801023c8 <kalloc>
801068af:	89 c6                	mov    %eax,%esi
801068b1:	85 c0                	test   %eax,%eax
801068b3:	74 5b                	je     80106910 <copyuvm+0xe0>
801068b5:	50                   	push   %eax
801068b6:	68 00 10 00 00       	push   $0x1000
801068bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068be:	05 00 00 00 80       	add    $0x80000000,%eax
801068c3:	50                   	push   %eax
801068c4:	56                   	push   %esi
801068c5:	e8 3e d9 ff ff       	call   80104208 <memmove>
801068ca:	5a                   	pop    %edx
801068cb:	59                   	pop    %ecx
801068cc:	53                   	push   %ebx
801068cd:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801068d3:	50                   	push   %eax
801068d4:	b9 00 10 00 00       	mov    $0x1000,%ecx
801068d9:	89 fa                	mov    %edi,%edx
801068db:	8b 45 e0             	mov    -0x20(%ebp),%eax
801068de:	e8 41 f9 ff ff       	call   80106224 <mappages>
801068e3:	83 c4 10             	add    $0x10,%esp
801068e6:	85 c0                	test   %eax,%eax
801068e8:	78 1a                	js     80106904 <copyuvm+0xd4>
801068ea:	81 c7 00 10 00 00    	add    $0x1000,%edi
801068f0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801068f3:	0f 82 5f ff ff ff    	jb     80106858 <copyuvm+0x28>
801068f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
801068fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068ff:	5b                   	pop    %ebx
80106900:	5e                   	pop    %esi
80106901:	5f                   	pop    %edi
80106902:	5d                   	pop    %ebp
80106903:	c3                   	ret    
80106904:	83 ec 0c             	sub    $0xc,%esp
80106907:	56                   	push   %esi
80106908:	e8 2b b9 ff ff       	call   80102238 <kfree>
8010690d:	83 c4 10             	add    $0x10,%esp
80106910:	83 ec 0c             	sub    $0xc,%esp
80106913:	ff 75 e0             	pushl  -0x20(%ebp)
80106916:	e8 cd fd ff ff       	call   801066e8 <freevm>
8010691b:	83 c4 10             	add    $0x10,%esp
8010691e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106925:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106928:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010692b:	5b                   	pop    %ebx
8010692c:	5e                   	pop    %esi
8010692d:	5f                   	pop    %edi
8010692e:	5d                   	pop    %ebp
8010692f:	c3                   	ret    
80106930:	83 ec 0c             	sub    $0xc,%esp
80106933:	68 62 74 10 80       	push   $0x80107462
80106938:	e8 fb 99 ff ff       	call   80100338 <panic>
8010693d:	8d 76 00             	lea    0x0(%esi),%esi

80106940 <uva2ka>:
80106940:	55                   	push   %ebp
80106941:	89 e5                	mov    %esp,%ebp
80106943:	8b 55 0c             	mov    0xc(%ebp),%edx
80106946:	c1 ea 16             	shr    $0x16,%edx
80106949:	8b 45 08             	mov    0x8(%ebp),%eax
8010694c:	8b 04 90             	mov    (%eax,%edx,4),%eax
8010694f:	a8 01                	test   $0x1,%al
80106951:	0f 84 f3 00 00 00    	je     80106a4a <uva2ka.cold>
80106957:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010695c:	89 c2                	mov    %eax,%edx
8010695e:	8b 45 0c             	mov    0xc(%ebp),%eax
80106961:	c1 e8 0c             	shr    $0xc,%eax
80106964:	25 ff 03 00 00       	and    $0x3ff,%eax
80106969:	8b 84 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%eax
80106970:	89 c2                	mov    %eax,%edx
80106972:	83 e2 05             	and    $0x5,%edx
80106975:	83 fa 05             	cmp    $0x5,%edx
80106978:	75 0e                	jne    80106988 <uva2ka+0x48>
8010697a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010697f:	05 00 00 00 80       	add    $0x80000000,%eax
80106984:	5d                   	pop    %ebp
80106985:	c3                   	ret    
80106986:	66 90                	xchg   %ax,%ax
80106988:	31 c0                	xor    %eax,%eax
8010698a:	5d                   	pop    %ebp
8010698b:	c3                   	ret    

8010698c <copyout>:
8010698c:	55                   	push   %ebp
8010698d:	89 e5                	mov    %esp,%ebp
8010698f:	57                   	push   %edi
80106990:	56                   	push   %esi
80106991:	53                   	push   %ebx
80106992:	83 ec 0c             	sub    $0xc,%esp
80106995:	8b 45 0c             	mov    0xc(%ebp),%eax
80106998:	8b 7d 10             	mov    0x10(%ebp),%edi
8010699b:	8b 4d 14             	mov    0x14(%ebp),%ecx
8010699e:	85 c9                	test   %ecx,%ecx
801069a0:	0f 84 9a 00 00 00    	je     80106a40 <copyout+0xb4>
801069a6:	89 fe                	mov    %edi,%esi
801069a8:	eb 45                	jmp    801069ef <copyout+0x63>
801069aa:	66 90                	xchg   %ax,%ax
801069ac:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801069b2:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
801069b8:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
801069be:	74 71                	je     80106a31 <copyout+0xa5>
801069c0:	89 fb                	mov    %edi,%ebx
801069c2:	29 c3                	sub    %eax,%ebx
801069c4:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069ca:	39 5d 14             	cmp    %ebx,0x14(%ebp)
801069cd:	73 03                	jae    801069d2 <copyout+0x46>
801069cf:	8b 5d 14             	mov    0x14(%ebp),%ebx
801069d2:	52                   	push   %edx
801069d3:	53                   	push   %ebx
801069d4:	56                   	push   %esi
801069d5:	29 f8                	sub    %edi,%eax
801069d7:	01 c1                	add    %eax,%ecx
801069d9:	51                   	push   %ecx
801069da:	e8 29 d8 ff ff       	call   80104208 <memmove>
801069df:	01 de                	add    %ebx,%esi
801069e1:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
801069e7:	83 c4 10             	add    $0x10,%esp
801069ea:	29 5d 14             	sub    %ebx,0x14(%ebp)
801069ed:	74 51                	je     80106a40 <copyout+0xb4>
801069ef:	89 c7                	mov    %eax,%edi
801069f1:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
801069f7:	89 c1                	mov    %eax,%ecx
801069f9:	c1 e9 16             	shr    $0x16,%ecx
801069fc:	8b 55 08             	mov    0x8(%ebp),%edx
801069ff:	8b 0c 8a             	mov    (%edx,%ecx,4),%ecx
80106a02:	f6 c1 01             	test   $0x1,%cl
80106a05:	0f 84 46 00 00 00    	je     80106a51 <copyout.cold>
80106a0b:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
80106a11:	89 fb                	mov    %edi,%ebx
80106a13:	c1 eb 0c             	shr    $0xc,%ebx
80106a16:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
80106a1c:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
80106a23:	89 d9                	mov    %ebx,%ecx
80106a25:	83 e1 05             	and    $0x5,%ecx
80106a28:	83 f9 05             	cmp    $0x5,%ecx
80106a2b:	0f 84 7b ff ff ff    	je     801069ac <copyout+0x20>
80106a31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106a36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a39:	5b                   	pop    %ebx
80106a3a:	5e                   	pop    %esi
80106a3b:	5f                   	pop    %edi
80106a3c:	5d                   	pop    %ebp
80106a3d:	c3                   	ret    
80106a3e:	66 90                	xchg   %ax,%ax
80106a40:	31 c0                	xor    %eax,%eax
80106a42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a45:	5b                   	pop    %ebx
80106a46:	5e                   	pop    %esi
80106a47:	5f                   	pop    %edi
80106a48:	5d                   	pop    %ebp
80106a49:	c3                   	ret    

80106a4a <uva2ka.cold>:
80106a4a:	a1 00 00 00 00       	mov    0x0,%eax
80106a4f:	0f 0b                	ud2    

80106a51 <copyout.cold>:
80106a51:	a1 00 00 00 00       	mov    0x0,%eax
80106a56:	0f 0b                	ud2    
