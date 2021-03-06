
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	ea00001e 	b	8080 <reset>
    8004:	e59ff014 	ldr	pc, [pc, #20]	; 8020 <UndefAddr>
    8008:	e59ff014 	ldr	pc, [pc, #20]	; 8024 <SWIAddr>
    800c:	e59ff014 	ldr	pc, [pc, #20]	; 8028 <PAbortAddr>
    8010:	e59ff014 	ldr	pc, [pc, #20]	; 802c <DAbortAddr>
    8014:	e59ff014 	ldr	pc, [pc, #20]	; 8030 <ReservedAddr>
    8018:	e59ff014 	ldr	pc, [pc, #20]	; 8034 <IRQAddr>
    801c:	e59ff014 	ldr	pc, [pc, #20]	; 8038 <FIQAddr>

00008020 <UndefAddr>:
    8020:	00008eec 	andeq	r8, r0, ip, ror #29

00008024 <SWIAddr>:
    8024:	00008ef0 	strdeq	r8, [r0], -r0

00008028 <PAbortAddr>:
    8028:	00008f00 	andeq	r8, r0, r0, lsl #30

0000802c <DAbortAddr>:
    802c:	00008f04 	andeq	r8, r0, r4, lsl #30

00008030 <ReservedAddr>:
    8030:	00000000 	andeq	r0, r0, r0

00008034 <IRQAddr>:
    8034:	00008f08 	andeq	r8, r0, r8, lsl #30

00008038 <FIQAddr>:
    8038:	00008f0c 	andeq	r8, r0, ip, lsl #30
    803c:	e1a00000 	nop			; (mov r0, r0)

00008040 <_ns_start>:
    8040:	e59ff018 	ldr	pc, [pc, #24]	; 8060 <ns_Reset>
    8044:	e59ff018 	ldr	pc, [pc, #24]	; 8064 <ns_UndefAddr>
    8048:	e59ff018 	ldr	pc, [pc, #24]	; 8068 <ns_SWIAddr>
    804c:	e59ff018 	ldr	pc, [pc, #24]	; 806c <ns_PAbortAddr>
    8050:	e59ff018 	ldr	pc, [pc, #24]	; 8070 <ns_DAbortAddr>
    8054:	e59ff018 	ldr	pc, [pc, #24]	; 8074 <ns_ReservedAddr>
    8058:	e59ff018 	ldr	pc, [pc, #24]	; 8078 <ns_IRQAddr>
    805c:	e59ff018 	ldr	pc, [pc, #24]	; 807c <ns_FIQAddr>

00008060 <ns_Reset>:
    8060:	00008f10 	andeq	r8, r0, r0, lsl pc

00008064 <ns_UndefAddr>:
    8064:	00008f20 	andeq	r8, r0, r0, lsr #30

00008068 <ns_SWIAddr>:
    8068:	00008f30 	andeq	r8, r0, r0, lsr pc

0000806c <ns_PAbortAddr>:
    806c:	00008f40 	andeq	r8, r0, r0, asr #30

00008070 <ns_DAbortAddr>:
    8070:	00008f50 	andeq	r8, r0, r0, asr pc

00008074 <ns_ReservedAddr>:
    8074:	00000000 	andeq	r0, r0, r0

00008078 <ns_IRQAddr>:
    8078:	00008f60 	andeq	r8, r0, r0, ror #30

0000807c <ns_FIQAddr>:
    807c:	00008f70 	andeq	r8, r0, r0, ror pc

00008080 <reset>:
    8080:	e59f00f4 	ldr	r0, [pc, #244]	; 817c <Init_clock+0x40>
    8084:	f1020016 	cps	#22
    8088:	e59fd0ec 	ldr	sp, [pc, #236]	; 817c <Init_clock+0x40>
    808c:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
    8090:	e240d000 	sub	sp, r0, #0
    8094:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8098:	e240d040 	sub	sp, r0, #64	; 0x40
    809c:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
    80a0:	e240d080 	sub	sp, r0, #128	; 0x80
    80a4:	e321f0db 	msr	CPSR_c, #219	; 0xdb
    80a8:	e240d0c0 	sub	sp, r0, #192	; 0xc0
    80ac:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    80b0:	e240dc01 	sub	sp, r0, #256	; 0x100
    80b4:	eb00025f 	bl	8a38 <bootmain>

000080b8 <CPU_SVC32_MODE>:
    80b8:	e10f0000 	mrs	r0, CPSR
    80bc:	e3c0001f 	bic	r0, r0, #31
    80c0:	e38000d3 	orr	r0, r0, #211	; 0xd3
    80c4:	e129f000 	msr	CPSR_fc, r0
    80c8:	e12fff1e 	bx	lr

000080cc <Disable_MMU_L1cache>:
    80cc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
    80d0:	e3c00a02 	bic	r0, r0, #8192	; 0x2000
    80d4:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
    80d8:	e3c00004 	bic	r0, r0, #4
    80dc:	e3c00001 	bic	r0, r0, #1
    80e0:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
    80e4:	e12fff1e 	bx	lr

000080e8 <Init_aips>:
    80e8:	e59f0090 	ldr	r0, [pc, #144]	; 8180 <Init_clock+0x44>
    80ec:	e59f1090 	ldr	r1, [pc, #144]	; 8184 <Init_clock+0x48>
    80f0:	e5801000 	str	r1, [r0]
    80f4:	e5801004 	str	r1, [r0, #4]
    80f8:	e3a01000 	mov	r1, #0
    80fc:	e5801040 	str	r1, [r0, #64]	; 0x40
    8100:	e5801044 	str	r1, [r0, #68]	; 0x44
    8104:	e5801048 	str	r1, [r0, #72]	; 0x48
    8108:	e580104c 	str	r1, [r0, #76]	; 0x4c
    810c:	e5801050 	str	r1, [r0, #80]	; 0x50
    8110:	e59f0070 	ldr	r0, [pc, #112]	; 8188 <Init_clock+0x4c>
    8114:	e59f1068 	ldr	r1, [pc, #104]	; 8184 <Init_clock+0x48>
    8118:	e5801000 	str	r1, [r0]
    811c:	e5801004 	str	r1, [r0, #4]
    8120:	e3a01000 	mov	r1, #0
    8124:	e5801040 	str	r1, [r0, #64]	; 0x40
    8128:	e5801044 	str	r1, [r0, #68]	; 0x44
    812c:	e5801048 	str	r1, [r0, #72]	; 0x48
    8130:	e580104c 	str	r1, [r0, #76]	; 0x4c
    8134:	e5801050 	str	r1, [r0, #80]	; 0x50
    8138:	e12fff1e 	bx	lr

0000813c <Init_clock>:
    813c:	e59f0048 	ldr	r0, [pc, #72]	; 818c <Init_clock+0x50>
    8140:	e59f1048 	ldr	r1, [pc, #72]	; 8190 <Init_clock+0x54>
    8144:	e5801068 	str	r1, [r0, #104]	; 0x68
    8148:	e59f1044 	ldr	r1, [pc, #68]	; 8194 <Init_clock+0x58>
    814c:	e580106c 	str	r1, [r0, #108]	; 0x6c
    8150:	e59f1040 	ldr	r1, [pc, #64]	; 8198 <Init_clock+0x5c>
    8154:	e5801070 	str	r1, [r0, #112]	; 0x70
    8158:	e59f103c 	ldr	r1, [pc, #60]	; 819c <Init_clock+0x60>
    815c:	e5801074 	str	r1, [r0, #116]	; 0x74
    8160:	e59f1038 	ldr	r1, [pc, #56]	; 81a0 <Init_clock+0x64>
    8164:	e5801078 	str	r1, [r0, #120]	; 0x78
    8168:	e59f1034 	ldr	r1, [pc, #52]	; 81a4 <Init_clock+0x68>
    816c:	e580107c 	str	r1, [r0, #124]	; 0x7c
    8170:	e3a01fff 	mov	r1, #1020	; 0x3fc
    8174:	e5801080 	str	r1, [r0, #128]	; 0x80
    8178:	e12fff1e 	bx	lr
    817c:	00080000 	andeq	r0, r8, r0
    8180:	0207c000 	andeq	ip, r7, #0
    8184:	77777777 			; <UNDEFINED> instruction: 0x77777777
    8188:	0217c000 	andseq	ip, r7, #0
    818c:	020c4000 	andeq	r4, ip, #0
    8190:	00c0003f 	sbceq	r0, r0, pc, lsr r0
    8194:	0030fc00 	eorseq	pc, r0, r0, lsl #24
    8198:	0fffc000 	svceq	0x00ffc000
    819c:	3ff00000 	svccc	0x00f00000	; IMB
    81a0:	00fff300 	rscseq	pc, pc, r0, lsl #6
    81a4:	0f0000c3 	svceq	0x000000c3
    81a8:	e1a00000 	nop			; (mov r0, r0)
    81ac:	e1a00000 	nop			; (mov r0, r0)
    81b0:	e1a00000 	nop			; (mov r0, r0)
    81b4:	e1a00000 	nop			; (mov r0, r0)
    81b8:	e1a00000 	nop			; (mov r0, r0)
    81bc:	e1a00000 	nop			; (mov r0, r0)

000081c0 <uart_lcr>:
    81c0:	e92d4800 	push	{fp, lr}
    81c4:	e28db004 	add	fp, sp, #4
    81c8:	e59f000c 	ldr	r0, [pc, #12]	; 81dc <uart_lcr+0x1c>
    81cc:	eb0002ff 	bl	8dd0 <GET32>
    81d0:	e1a03000 	mov	r3, r0
    81d4:	e1a00003 	mov	r0, r3
    81d8:	e8bd8800 	pop	{fp, pc}
    81dc:	20215054 	eorcs	r5, r1, r4, asr r0

000081e0 <uart_recv>:
    81e0:	e92d4800 	push	{fp, lr}
    81e4:	e28db004 	add	fp, sp, #4
    81e8:	e59f0030 	ldr	r0, [pc, #48]	; 8220 <uart_recv+0x40>
    81ec:	eb0002f7 	bl	8dd0 <GET32>
    81f0:	e1a03000 	mov	r3, r0
    81f4:	e2033001 	and	r3, r3, #1
    81f8:	e3530000 	cmp	r3, #0
    81fc:	0a000000 	beq	8204 <uart_recv+0x24>
    8200:	ea000000 	b	8208 <uart_recv+0x28>
    8204:	eafffff7 	b	81e8 <uart_recv+0x8>
    8208:	e59f0014 	ldr	r0, [pc, #20]	; 8224 <uart_recv+0x44>
    820c:	eb0002ef 	bl	8dd0 <GET32>
    8210:	e1a03000 	mov	r3, r0
    8214:	e6ef3073 	uxtb	r3, r3
    8218:	e1a00003 	mov	r0, r3
    821c:	e8bd8800 	pop	{fp, pc}
    8220:	20215054 	eorcs	r5, r1, r4, asr r0
    8224:	20215040 	eorcs	r5, r1, r0, asr #32

00008228 <uart_send>:
    8228:	e92d4800 	push	{fp, lr}
    822c:	e28db004 	add	fp, sp, #4
    8230:	e24dd008 	sub	sp, sp, #8
    8234:	e50b0008 	str	r0, [fp, #-8]
    8238:	e59f002c 	ldr	r0, [pc, #44]	; 826c <uart_send+0x44>
    823c:	eb0002e3 	bl	8dd0 <GET32>
    8240:	e1a03000 	mov	r3, r0
    8244:	e2033020 	and	r3, r3, #32
    8248:	e3530000 	cmp	r3, #0
    824c:	0a000000 	beq	8254 <uart_send+0x2c>
    8250:	ea000000 	b	8258 <uart_send+0x30>
    8254:	eafffff7 	b	8238 <uart_send+0x10>
    8258:	e59f0010 	ldr	r0, [pc, #16]	; 8270 <uart_send+0x48>
    825c:	e51b1008 	ldr	r1, [fp, #-8]
    8260:	eb0002d4 	bl	8db8 <PUT32>
    8264:	e24bd004 	sub	sp, fp, #4
    8268:	e8bd8800 	pop	{fp, pc}
    826c:	20215054 	eorcs	r5, r1, r4, asr r0
    8270:	20215040 	eorcs	r5, r1, r0, asr #32

00008274 <uart_flush>:
    8274:	e92d4800 	push	{fp, lr}
    8278:	e28db004 	add	fp, sp, #4
    827c:	e59f001c 	ldr	r0, [pc, #28]	; 82a0 <uart_flush+0x2c>
    8280:	eb0002d2 	bl	8dd0 <GET32>
    8284:	e1a03000 	mov	r3, r0
    8288:	e2033c01 	and	r3, r3, #256	; 0x100
    828c:	e3530000 	cmp	r3, #0
    8290:	1a000000 	bne	8298 <uart_flush+0x24>
    8294:	ea000000 	b	829c <uart_flush+0x28>
    8298:	eafffff7 	b	827c <uart_flush+0x8>
    829c:	e8bd8800 	pop	{fp, pc}
    82a0:	20215054 	eorcs	r5, r1, r4, asr r0

000082a4 <hexstring>:
    82a4:	e92d4800 	push	{fp, lr}
    82a8:	e28db004 	add	fp, sp, #4
    82ac:	e24dd008 	sub	sp, sp, #8
    82b0:	e50b0008 	str	r0, [fp, #-8]
    82b4:	e51b0008 	ldr	r0, [fp, #-8]
    82b8:	eb000005 	bl	82d4 <hexstrings>
    82bc:	e3a0000d 	mov	r0, #13
    82c0:	ebffffd8 	bl	8228 <uart_send>
    82c4:	e3a0000a 	mov	r0, #10
    82c8:	ebffffd6 	bl	8228 <uart_send>
    82cc:	e24bd004 	sub	sp, fp, #4
    82d0:	e8bd8800 	pop	{fp, pc}

000082d4 <hexstrings>:
    82d4:	e92d4800 	push	{fp, lr}
    82d8:	e28db004 	add	fp, sp, #4
    82dc:	e24dd010 	sub	sp, sp, #16
    82e0:	e50b0010 	str	r0, [fp, #-16]
    82e4:	e3a03020 	mov	r3, #32
    82e8:	e50b3008 	str	r3, [fp, #-8]
    82ec:	e51b3008 	ldr	r3, [fp, #-8]
    82f0:	e2433004 	sub	r3, r3, #4
    82f4:	e50b3008 	str	r3, [fp, #-8]
    82f8:	e51b3008 	ldr	r3, [fp, #-8]
    82fc:	e51b2010 	ldr	r2, [fp, #-16]
    8300:	e1a03332 	lsr	r3, r2, r3
    8304:	e203300f 	and	r3, r3, #15
    8308:	e50b300c 	str	r3, [fp, #-12]
    830c:	e51b300c 	ldr	r3, [fp, #-12]
    8310:	e3530009 	cmp	r3, #9
    8314:	9a000003 	bls	8328 <hexstrings+0x54>
    8318:	e51b300c 	ldr	r3, [fp, #-12]
    831c:	e2833037 	add	r3, r3, #55	; 0x37
    8320:	e50b300c 	str	r3, [fp, #-12]
    8324:	ea000002 	b	8334 <hexstrings+0x60>
    8328:	e51b300c 	ldr	r3, [fp, #-12]
    832c:	e2833030 	add	r3, r3, #48	; 0x30
    8330:	e50b300c 	str	r3, [fp, #-12]
    8334:	e51b000c 	ldr	r0, [fp, #-12]
    8338:	ebffffba 	bl	8228 <uart_send>
    833c:	e51b3008 	ldr	r3, [fp, #-8]
    8340:	e3530000 	cmp	r3, #0
    8344:	1a000000 	bne	834c <hexstrings+0x78>
    8348:	ea000000 	b	8350 <hexstrings+0x7c>
    834c:	eaffffe6 	b	82ec <hexstrings+0x18>
    8350:	e3a00020 	mov	r0, #32
    8354:	ebffffb3 	bl	8228 <uart_send>
    8358:	e24bd004 	sub	sp, fp, #4
    835c:	e8bd8800 	pop	{fp, pc}

00008360 <uart_init>:
    8360:	e92d4800 	push	{fp, lr}
    8364:	e28db004 	add	fp, sp, #4
    8368:	e24dd008 	sub	sp, sp, #8
    836c:	e59f0130 	ldr	r0, [pc, #304]	; 84a4 <uart_init+0x144>
    8370:	e3a01001 	mov	r1, #1
    8374:	eb00028f 	bl	8db8 <PUT32>
    8378:	e59f0128 	ldr	r0, [pc, #296]	; 84a8 <uart_init+0x148>
    837c:	e3a01000 	mov	r1, #0
    8380:	eb00028c 	bl	8db8 <PUT32>
    8384:	e59f0120 	ldr	r0, [pc, #288]	; 84ac <uart_init+0x14c>
    8388:	e3a01000 	mov	r1, #0
    838c:	eb000289 	bl	8db8 <PUT32>
    8390:	e59f0118 	ldr	r0, [pc, #280]	; 84b0 <uart_init+0x150>
    8394:	e3a01003 	mov	r1, #3
    8398:	eb000286 	bl	8db8 <PUT32>
    839c:	e59f0110 	ldr	r0, [pc, #272]	; 84b4 <uart_init+0x154>
    83a0:	e3a01000 	mov	r1, #0
    83a4:	eb000283 	bl	8db8 <PUT32>
    83a8:	e59f00f8 	ldr	r0, [pc, #248]	; 84a8 <uart_init+0x148>
    83ac:	e3a01000 	mov	r1, #0
    83b0:	eb000280 	bl	8db8 <PUT32>
    83b4:	e59f00fc 	ldr	r0, [pc, #252]	; 84b8 <uart_init+0x158>
    83b8:	e3a010c6 	mov	r1, #198	; 0xc6
    83bc:	eb00027d 	bl	8db8 <PUT32>
    83c0:	e59f00f4 	ldr	r0, [pc, #244]	; 84bc <uart_init+0x15c>
    83c4:	e59f10f4 	ldr	r1, [pc, #244]	; 84c0 <uart_init+0x160>
    83c8:	eb00027a 	bl	8db8 <PUT32>
    83cc:	e59f00f0 	ldr	r0, [pc, #240]	; 84c4 <uart_init+0x164>
    83d0:	eb00027e 	bl	8dd0 <GET32>
    83d4:	e50b0008 	str	r0, [fp, #-8]
    83d8:	e51b3008 	ldr	r3, [fp, #-8]
    83dc:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
    83e0:	e50b3008 	str	r3, [fp, #-8]
    83e4:	e51b3008 	ldr	r3, [fp, #-8]
    83e8:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    83ec:	e50b3008 	str	r3, [fp, #-8]
    83f0:	e51b3008 	ldr	r3, [fp, #-8]
    83f4:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
    83f8:	e50b3008 	str	r3, [fp, #-8]
    83fc:	e51b3008 	ldr	r3, [fp, #-8]
    8400:	e3833801 	orr	r3, r3, #65536	; 0x10000
    8404:	e50b3008 	str	r3, [fp, #-8]
    8408:	e59f00b4 	ldr	r0, [pc, #180]	; 84c4 <uart_init+0x164>
    840c:	e51b1008 	ldr	r1, [fp, #-8]
    8410:	eb000268 	bl	8db8 <PUT32>
    8414:	e59f00ac 	ldr	r0, [pc, #172]	; 84c8 <uart_init+0x168>
    8418:	e3a01000 	mov	r1, #0
    841c:	eb000265 	bl	8db8 <PUT32>
    8420:	e3a03000 	mov	r3, #0
    8424:	e50b3008 	str	r3, [fp, #-8]
    8428:	ea000004 	b	8440 <uart_init+0xe0>
    842c:	e51b0008 	ldr	r0, [fp, #-8]
    8430:	eb00026b 	bl	8de4 <dummy>
    8434:	e51b3008 	ldr	r3, [fp, #-8]
    8438:	e2833001 	add	r3, r3, #1
    843c:	e50b3008 	str	r3, [fp, #-8]
    8440:	e51b3008 	ldr	r3, [fp, #-8]
    8444:	e3530095 	cmp	r3, #149	; 0x95
    8448:	9afffff7 	bls	842c <uart_init+0xcc>
    844c:	e59f0078 	ldr	r0, [pc, #120]	; 84cc <uart_init+0x16c>
    8450:	e3a01903 	mov	r1, #49152	; 0xc000
    8454:	eb000257 	bl	8db8 <PUT32>
    8458:	e3a03000 	mov	r3, #0
    845c:	e50b3008 	str	r3, [fp, #-8]
    8460:	ea000004 	b	8478 <uart_init+0x118>
    8464:	e51b0008 	ldr	r0, [fp, #-8]
    8468:	eb00025d 	bl	8de4 <dummy>
    846c:	e51b3008 	ldr	r3, [fp, #-8]
    8470:	e2833001 	add	r3, r3, #1
    8474:	e50b3008 	str	r3, [fp, #-8]
    8478:	e51b3008 	ldr	r3, [fp, #-8]
    847c:	e3530095 	cmp	r3, #149	; 0x95
    8480:	9afffff7 	bls	8464 <uart_init+0x104>
    8484:	e59f0040 	ldr	r0, [pc, #64]	; 84cc <uart_init+0x16c>
    8488:	e3a01000 	mov	r1, #0
    848c:	eb000249 	bl	8db8 <PUT32>
    8490:	e59f0014 	ldr	r0, [pc, #20]	; 84ac <uart_init+0x14c>
    8494:	e3a01003 	mov	r1, #3
    8498:	eb000246 	bl	8db8 <PUT32>
    849c:	e24bd004 	sub	sp, fp, #4
    84a0:	e8bd8800 	pop	{fp, pc}
    84a4:	20215004 	eorcs	r5, r1, r4
    84a8:	20215044 	eorcs	r5, r1, r4, asr #32
    84ac:	20215060 	eorcs	r5, r1, r0, rrx
    84b0:	2021504c 	eorcs	r5, r1, ip, asr #32
    84b4:	20215050 	eorcs	r5, r1, r0, asr r0
    84b8:	20215048 	eorcs	r5, r1, r8, asr #32
    84bc:	20215068 	eorcs	r5, r1, r8, rrx
    84c0:	0000010e 	andeq	r0, r0, lr, lsl #2
    84c4:	20200004 	eorcs	r0, r0, r4
    84c8:	20200094 	mlacs	r0, r4, r0, r0
    84cc:	20200098 	mlacs	r0, r8, r0, r0

000084d0 <uprint>:
    84d0:	e92d4800 	push	{fp, lr}
    84d4:	e28db004 	add	fp, sp, #4
    84d8:	e24dd010 	sub	sp, sp, #16
    84dc:	e50b0010 	str	r0, [fp, #-16]
    84e0:	e3a03000 	mov	r3, #0
    84e4:	e50b3008 	str	r3, [fp, #-8]
    84e8:	ea000010 	b	8530 <uprint+0x60>
    84ec:	e51b3008 	ldr	r3, [fp, #-8]
    84f0:	e51b2010 	ldr	r2, [fp, #-16]
    84f4:	e0823003 	add	r3, r2, r3
    84f8:	e5d33000 	ldrb	r3, [r3]
    84fc:	e353000a 	cmp	r3, #10
    8500:	1a000001 	bne	850c <uprint+0x3c>
    8504:	e3a0000d 	mov	r0, #13
    8508:	ebffff46 	bl	8228 <uart_send>
    850c:	e51b3008 	ldr	r3, [fp, #-8]
    8510:	e51b2010 	ldr	r2, [fp, #-16]
    8514:	e0823003 	add	r3, r2, r3
    8518:	e5d33000 	ldrb	r3, [r3]
    851c:	e1a00003 	mov	r0, r3
    8520:	ebffff40 	bl	8228 <uart_send>
    8524:	e51b3008 	ldr	r3, [fp, #-8]
    8528:	e2833001 	add	r3, r3, #1
    852c:	e50b3008 	str	r3, [fp, #-8]
    8530:	e51b3008 	ldr	r3, [fp, #-8]
    8534:	e51b2010 	ldr	r2, [fp, #-16]
    8538:	e0823003 	add	r3, r2, r3
    853c:	e5d33000 	ldrb	r3, [r3]
    8540:	e3530000 	cmp	r3, #0
    8544:	1affffe8 	bne	84ec <uprint+0x1c>
    8548:	e24bd004 	sub	sp, fp, #4
    854c:	e8bd8800 	pop	{fp, pc}

00008550 <printint>:
    8550:	e92d4810 	push	{r4, fp, lr}
    8554:	e28db008 	add	fp, sp, #8
    8558:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    855c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8560:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    8564:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    8568:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    856c:	e3530000 	cmp	r3, #0
    8570:	0a00000a 	beq	85a0 <printint+0x50>
    8574:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8578:	e1a03fa3 	lsr	r3, r3, #31
    857c:	e6ef3073 	uxtb	r3, r3
    8580:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8584:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8588:	e3530000 	cmp	r3, #0
    858c:	0a000003 	beq	85a0 <printint+0x50>
    8590:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8594:	e2633000 	rsb	r3, r3, #0
    8598:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    859c:	ea000001 	b	85a8 <printint+0x58>
    85a0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    85a4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    85a8:	e3a03000 	mov	r3, #0
    85ac:	e50b3010 	str	r3, [fp, #-16]
    85b0:	e51b4010 	ldr	r4, [fp, #-16]
    85b4:	e2843001 	add	r3, r4, #1
    85b8:	e50b3010 	str	r3, [fp, #-16]
    85bc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85c0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    85c4:	e1a00002 	mov	r0, r2
    85c8:	e1a01003 	mov	r1, r3
    85cc:	eb0001a6 	bl	8c6c <__aeabi_uidivmod>
    85d0:	e1a03001 	mov	r3, r1
    85d4:	e59f20b0 	ldr	r2, [pc, #176]	; 868c <printint+0x13c>
    85d8:	e7d22003 	ldrb	r2, [r2, r3]
    85dc:	e3e03017 	mvn	r3, #23
    85e0:	e24b000c 	sub	r0, fp, #12
    85e4:	e0801004 	add	r1, r0, r4
    85e8:	e0813003 	add	r3, r1, r3
    85ec:	e5c32000 	strb	r2, [r3]
    85f0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85f4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    85f8:	e1a01003 	mov	r1, r3
    85fc:	eb00015d 	bl	8b78 <__aeabi_uidiv>
    8600:	e1a03000 	mov	r3, r0
    8604:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8608:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    860c:	e3530000 	cmp	r3, #0
    8610:	1affffe6 	bne	85b0 <printint+0x60>
    8614:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8618:	e3530000 	cmp	r3, #0
    861c:	0a000009 	beq	8648 <printint+0xf8>
    8620:	e51b3010 	ldr	r3, [fp, #-16]
    8624:	e2832001 	add	r2, r3, #1
    8628:	e50b2010 	str	r2, [fp, #-16]
    862c:	e3e02017 	mvn	r2, #23
    8630:	e24b100c 	sub	r1, fp, #12
    8634:	e0813003 	add	r3, r1, r3
    8638:	e0833002 	add	r3, r3, r2
    863c:	e3a0202d 	mov	r2, #45	; 0x2d
    8640:	e5c32000 	strb	r2, [r3]
    8644:	ea000008 	b	866c <printint+0x11c>
    8648:	ea000007 	b	866c <printint+0x11c>
    864c:	e3e03017 	mvn	r3, #23
    8650:	e51b2010 	ldr	r2, [fp, #-16]
    8654:	e24b000c 	sub	r0, fp, #12
    8658:	e0802002 	add	r2, r0, r2
    865c:	e0823003 	add	r3, r2, r3
    8660:	e5d33000 	ldrb	r3, [r3]
    8664:	e1a00003 	mov	r0, r3
    8668:	ebfffeee 	bl	8228 <uart_send>
    866c:	e51b3010 	ldr	r3, [fp, #-16]
    8670:	e2433001 	sub	r3, r3, #1
    8674:	e50b3010 	str	r3, [fp, #-16]
    8678:	e51b3010 	ldr	r3, [fp, #-16]
    867c:	e3530000 	cmp	r3, #0
    8680:	aafffff1 	bge	864c <printint+0xfc>
    8684:	e24bd008 	sub	sp, fp, #8
    8688:	e8bd8810 	pop	{r4, fp, pc}
    868c:	000091fc 	strdeq	r9, [r0], -ip

00008690 <cprintf>:
    8690:	e92d000f 	push	{r0, r1, r2, r3}
    8694:	e92d4800 	push	{fp, lr}
    8698:	e28db004 	add	fp, sp, #4
    869c:	e24dd010 	sub	sp, sp, #16
    86a0:	e28b3008 	add	r3, fp, #8
    86a4:	e50b300c 	str	r3, [fp, #-12]
    86a8:	e3a03000 	mov	r3, #0
    86ac:	e50b3008 	str	r3, [fp, #-8]
    86b0:	ea000066 	b	8850 <cprintf+0x1c0>
    86b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86b8:	e3530025 	cmp	r3, #37	; 0x25
    86bc:	0a000008 	beq	86e4 <cprintf+0x54>
    86c0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86c4:	e353000a 	cmp	r3, #10
    86c8:	1a000001 	bne	86d4 <cprintf+0x44>
    86cc:	e3a0000d 	mov	r0, #13
    86d0:	ebfffed4 	bl	8228 <uart_send>
    86d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86d8:	e1a00003 	mov	r0, r3
    86dc:	ebfffed1 	bl	8228 <uart_send>
    86e0:	ea000057 	b	8844 <cprintf+0x1b4>
    86e4:	e59b2004 	ldr	r2, [fp, #4]
    86e8:	e51b3008 	ldr	r3, [fp, #-8]
    86ec:	e2833001 	add	r3, r3, #1
    86f0:	e50b3008 	str	r3, [fp, #-8]
    86f4:	e51b3008 	ldr	r3, [fp, #-8]
    86f8:	e0823003 	add	r3, r2, r3
    86fc:	e5d33000 	ldrb	r3, [r3]
    8700:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8704:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8708:	e3530000 	cmp	r3, #0
    870c:	1a000000 	bne	8714 <cprintf+0x84>
    8710:	ea000056 	b	8870 <cprintf+0x1e0>
    8714:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8718:	e3530064 	cmp	r3, #100	; 0x64
    871c:	0a00000d 	beq	8758 <cprintf+0xc8>
    8720:	e3530064 	cmp	r3, #100	; 0x64
    8724:	ca000004 	bgt	873c <cprintf+0xac>
    8728:	e3530025 	cmp	r3, #37	; 0x25
    872c:	0a00003b 	beq	8820 <cprintf+0x190>
    8730:	e3530063 	cmp	r3, #99	; 0x63
    8734:	0a000019 	beq	87a0 <cprintf+0x110>
    8738:	ea00003b 	b	882c <cprintf+0x19c>
    873c:	e3530073 	cmp	r3, #115	; 0x73
    8740:	0a00001e 	beq	87c0 <cprintf+0x130>
    8744:	e3530078 	cmp	r3, #120	; 0x78
    8748:	0a00000b 	beq	877c <cprintf+0xec>
    874c:	e3530070 	cmp	r3, #112	; 0x70
    8750:	0a000009 	beq	877c <cprintf+0xec>
    8754:	ea000034 	b	882c <cprintf+0x19c>
    8758:	e51b300c 	ldr	r3, [fp, #-12]
    875c:	e2832004 	add	r2, r3, #4
    8760:	e50b200c 	str	r2, [fp, #-12]
    8764:	e5933000 	ldr	r3, [r3]
    8768:	e1a00003 	mov	r0, r3
    876c:	e3a0100a 	mov	r1, #10
    8770:	e3a02001 	mov	r2, #1
    8774:	ebffff75 	bl	8550 <printint>
    8778:	ea000031 	b	8844 <cprintf+0x1b4>
    877c:	e51b300c 	ldr	r3, [fp, #-12]
    8780:	e2832004 	add	r2, r3, #4
    8784:	e50b200c 	str	r2, [fp, #-12]
    8788:	e5933000 	ldr	r3, [r3]
    878c:	e1a00003 	mov	r0, r3
    8790:	e3a01010 	mov	r1, #16
    8794:	e3a02000 	mov	r2, #0
    8798:	ebffff6c 	bl	8550 <printint>
    879c:	ea000028 	b	8844 <cprintf+0x1b4>
    87a0:	e51b300c 	ldr	r3, [fp, #-12]
    87a4:	e2832004 	add	r2, r3, #4
    87a8:	e50b200c 	str	r2, [fp, #-12]
    87ac:	e5933000 	ldr	r3, [r3]
    87b0:	e6ef3073 	uxtb	r3, r3
    87b4:	e1a00003 	mov	r0, r3
    87b8:	ebfffe9a 	bl	8228 <uart_send>
    87bc:	ea000020 	b	8844 <cprintf+0x1b4>
    87c0:	e51b300c 	ldr	r3, [fp, #-12]
    87c4:	e2832004 	add	r2, r3, #4
    87c8:	e50b200c 	str	r2, [fp, #-12]
    87cc:	e5933000 	ldr	r3, [r3]
    87d0:	e50b3010 	str	r3, [fp, #-16]
    87d4:	e51b3010 	ldr	r3, [fp, #-16]
    87d8:	e3530000 	cmp	r3, #0
    87dc:	1a000002 	bne	87ec <cprintf+0x15c>
    87e0:	e59f3098 	ldr	r3, [pc, #152]	; 8880 <cprintf+0x1f0>
    87e4:	e50b3010 	str	r3, [fp, #-16]
    87e8:	ea000007 	b	880c <cprintf+0x17c>
    87ec:	ea000006 	b	880c <cprintf+0x17c>
    87f0:	e51b3010 	ldr	r3, [fp, #-16]
    87f4:	e5d33000 	ldrb	r3, [r3]
    87f8:	e1a00003 	mov	r0, r3
    87fc:	ebfffe89 	bl	8228 <uart_send>
    8800:	e51b3010 	ldr	r3, [fp, #-16]
    8804:	e2833001 	add	r3, r3, #1
    8808:	e50b3010 	str	r3, [fp, #-16]
    880c:	e51b3010 	ldr	r3, [fp, #-16]
    8810:	e5d33000 	ldrb	r3, [r3]
    8814:	e3530000 	cmp	r3, #0
    8818:	1afffff4 	bne	87f0 <cprintf+0x160>
    881c:	ea000008 	b	8844 <cprintf+0x1b4>
    8820:	e3a00025 	mov	r0, #37	; 0x25
    8824:	ebfffe7f 	bl	8228 <uart_send>
    8828:	ea000005 	b	8844 <cprintf+0x1b4>
    882c:	e3a00025 	mov	r0, #37	; 0x25
    8830:	ebfffe7c 	bl	8228 <uart_send>
    8834:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8838:	e1a00003 	mov	r0, r3
    883c:	ebfffe79 	bl	8228 <uart_send>
    8840:	e1a00000 	nop			; (mov r0, r0)
    8844:	e51b3008 	ldr	r3, [fp, #-8]
    8848:	e2833001 	add	r3, r3, #1
    884c:	e50b3008 	str	r3, [fp, #-8]
    8850:	e59b2004 	ldr	r2, [fp, #4]
    8854:	e51b3008 	ldr	r3, [fp, #-8]
    8858:	e0823003 	add	r3, r2, r3
    885c:	e5d33000 	ldrb	r3, [r3]
    8860:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8864:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8868:	e3530000 	cmp	r3, #0
    886c:	1affff90 	bne	86b4 <cprintf+0x24>
    8870:	e24bd004 	sub	sp, fp, #4
    8874:	e8bd4800 	pop	{fp, lr}
    8878:	e28dd010 	add	sp, sp, #16
    887c:	e12fff1e 	bx	lr
    8880:	00008fa0 	andeq	r8, r0, r0, lsr #31

00008884 <secure_swi>:
    8884:	e92d4800 	push	{fp, lr}
    8888:	e28db004 	add	fp, sp, #4
    888c:	e59f0004 	ldr	r0, [pc, #4]	; 8898 <secure_swi+0x14>
    8890:	ebffff7e 	bl	8690 <cprintf>
    8894:	e8bd8800 	pop	{fp, pc}
    8898:	00008fa8 	andeq	r8, r0, r8, lsr #31

0000889c <ns_reset>:
    889c:	e92d4800 	push	{fp, lr}
    88a0:	e28db004 	add	fp, sp, #4
    88a4:	e59f0004 	ldr	r0, [pc, #4]	; 88b0 <ns_reset+0x14>
    88a8:	ebffff78 	bl	8690 <cprintf>
    88ac:	e8bd8800 	pop	{fp, pc}
    88b0:	00008fc8 	andeq	r8, r0, r8, asr #31

000088b4 <ns_undef>:
    88b4:	e92d4800 	push	{fp, lr}
    88b8:	e28db004 	add	fp, sp, #4
    88bc:	e59f0004 	ldr	r0, [pc, #4]	; 88c8 <ns_undef+0x14>
    88c0:	ebffff72 	bl	8690 <cprintf>
    88c4:	e8bd8800 	pop	{fp, pc}
    88c8:	00008fec 	andeq	r8, r0, ip, ror #31

000088cc <ns_swi>:
    88cc:	e92d4800 	push	{fp, lr}
    88d0:	e28db004 	add	fp, sp, #4
    88d4:	e59f0004 	ldr	r0, [pc, #4]	; 88e0 <ns_swi+0x14>
    88d8:	ebffff6c 	bl	8690 <cprintf>
    88dc:	e8bd8800 	pop	{fp, pc}
    88e0:	00009010 	andeq	r9, r0, r0, lsl r0

000088e4 <ns_pa>:
    88e4:	e92d4800 	push	{fp, lr}
    88e8:	e28db004 	add	fp, sp, #4
    88ec:	e59f0004 	ldr	r0, [pc, #4]	; 88f8 <ns_pa+0x14>
    88f0:	ebffff66 	bl	8690 <cprintf>
    88f4:	e8bd8800 	pop	{fp, pc}
    88f8:	00009030 	andeq	r9, r0, r0, lsr r0

000088fc <ns_da>:
    88fc:	e92d4800 	push	{fp, lr}
    8900:	e28db004 	add	fp, sp, #4
    8904:	e59f0004 	ldr	r0, [pc, #4]	; 8910 <ns_da+0x14>
    8908:	ebffff60 	bl	8690 <cprintf>
    890c:	e8bd8800 	pop	{fp, pc}
    8910:	00009010 	andeq	r9, r0, r0, lsl r0

00008914 <ns_irq>:
    8914:	e92d4800 	push	{fp, lr}
    8918:	e28db004 	add	fp, sp, #4
    891c:	e59f0004 	ldr	r0, [pc, #4]	; 8928 <ns_irq+0x14>
    8920:	ebffff5a 	bl	8690 <cprintf>
    8924:	e8bd8800 	pop	{fp, pc}
    8928:	00009050 	andeq	r9, r0, r0, asr r0

0000892c <ns_fiq>:
    892c:	e92d4800 	push	{fp, lr}
    8930:	e28db004 	add	fp, sp, #4
    8934:	e59f0004 	ldr	r0, [pc, #4]	; 8940 <ns_fiq+0x14>
    8938:	ebffff54 	bl	8690 <cprintf>
    893c:	e8bd8800 	pop	{fp, pc}
    8940:	00009070 	andeq	r9, r0, r0, ror r0

00008944 <smc_print>:
    8944:	e92d4800 	push	{fp, lr}
    8948:	e28db004 	add	fp, sp, #4
    894c:	e24dd010 	sub	sp, sp, #16
    8950:	e50b0008 	str	r0, [fp, #-8]
    8954:	e50b100c 	str	r1, [fp, #-12]
    8958:	e50b2010 	str	r2, [fp, #-16]
    895c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8960:	e59f0048 	ldr	r0, [pc, #72]	; 89b0 <smc_print+0x6c>
    8964:	e51b1008 	ldr	r1, [fp, #-8]
    8968:	ebffff48 	bl	8690 <cprintf>
    896c:	e59f0040 	ldr	r0, [pc, #64]	; 89b4 <smc_print+0x70>
    8970:	e51b100c 	ldr	r1, [fp, #-12]
    8974:	ebffff45 	bl	8690 <cprintf>
    8978:	e59f0038 	ldr	r0, [pc, #56]	; 89b8 <smc_print+0x74>
    897c:	e51b1010 	ldr	r1, [fp, #-16]
    8980:	ebffff42 	bl	8690 <cprintf>
    8984:	e59f0030 	ldr	r0, [pc, #48]	; 89bc <smc_print+0x78>
    8988:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    898c:	ebffff3f 	bl	8690 <cprintf>
    8990:	e59f0028 	ldr	r0, [pc, #40]	; 89c0 <smc_print+0x7c>
    8994:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    8998:	ebffff3c 	bl	8690 <cprintf>
    899c:	e59f0020 	ldr	r0, [pc, #32]	; 89c4 <smc_print+0x80>
    89a0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    89a4:	ebffff39 	bl	8690 <cprintf>
    89a8:	e24bd004 	sub	sp, fp, #4
    89ac:	e8bd8800 	pop	{fp, pc}
    89b0:	00009090 	muleq	r0, r0, r0
    89b4:	000090a0 	andeq	r9, r0, r0, lsr #1
    89b8:	000090b0 	strheq	r9, [r0], -r0
    89bc:	000090c0 	andeq	r9, r0, r0, asr #1
    89c0:	000090d0 	ldrdeq	r9, [r0], -r0
    89c4:	000090e0 	andeq	r9, r0, r0, ror #1

000089c8 <Normal_World>:
    89c8:	e92d4800 	push	{fp, lr}
    89cc:	e28db004 	add	fp, sp, #4
    89d0:	e24dd008 	sub	sp, sp, #8
    89d4:	e59f004c 	ldr	r0, [pc, #76]	; 8a28 <Normal_World+0x60>
    89d8:	eb0000fc 	bl	8dd0 <GET32>
    89dc:	e1a03000 	mov	r3, r0
    89e0:	e50b3008 	str	r3, [fp, #-8]
    89e4:	e59f0040 	ldr	r0, [pc, #64]	; 8a2c <Normal_World+0x64>
    89e8:	e51b1008 	ldr	r1, [fp, #-8]
    89ec:	e51b2008 	ldr	r2, [fp, #-8]
    89f0:	ebffff26 	bl	8690 <cprintf>
    89f4:	e59f0034 	ldr	r0, [pc, #52]	; 8a30 <Normal_World+0x68>
    89f8:	ebffff24 	bl	8690 <cprintf>
    89fc:	ef000000 	svc	0x00000000
    8a00:	e59f002c 	ldr	r0, [pc, #44]	; 8a34 <Normal_World+0x6c>
    8a04:	ebffff21 	bl	8690 <cprintf>
    8a08:	e3a000c8 	mov	r0, #200	; 0xc8
    8a0c:	e3a010c9 	mov	r1, #201	; 0xc9
    8a10:	e3a020ca 	mov	r2, #202	; 0xca
    8a14:	e3a030cb 	mov	r3, #203	; 0xcb
    8a18:	e3a040cc 	mov	r4, #204	; 0xcc
    8a1c:	e3a050cd 	mov	r5, #205	; 0xcd
    8a20:	e1600075 	smc	5
    8a24:	eaffffea 	b	89d4 <Normal_World+0xc>
    8a28:	20003004 	andcs	r3, r0, r4
    8a2c:	000090f0 	strdeq	r9, [r0], -r0
    8a30:	00009110 	andeq	r9, r0, r0, lsl r1
    8a34:	00009124 	andeq	r9, r0, r4, lsr #2

00008a38 <bootmain>:
    8a38:	e92d4800 	push	{fp, lr}
    8a3c:	e28db004 	add	fp, sp, #4
    8a40:	e24dde1a 	sub	sp, sp, #416	; 0x1a0
    8a44:	ebfffe45 	bl	8360 <uart_init>
    8a48:	e3a03064 	mov	r3, #100	; 0x64
    8a4c:	e50b300c 	str	r3, [fp, #-12]
    8a50:	e3a03000 	mov	r3, #0
    8a54:	e50b3008 	str	r3, [fp, #-8]
    8a58:	ea00000a 	b	8a88 <bootmain+0x50>
    8a5c:	e51b2008 	ldr	r2, [fp, #-8]
    8a60:	e59f30e4 	ldr	r3, [pc, #228]	; 8b4c <bootmain+0x114>
    8a64:	e1a02102 	lsl	r2, r2, #2
    8a68:	e24b1004 	sub	r1, fp, #4
    8a6c:	e0812002 	add	r2, r1, r2
    8a70:	e0823003 	add	r3, r2, r3
    8a74:	e3a02c01 	mov	r2, #256	; 0x100
    8a78:	e5832000 	str	r2, [r3]
    8a7c:	e51b3008 	ldr	r3, [fp, #-8]
    8a80:	e2833001 	add	r3, r3, #1
    8a84:	e50b3008 	str	r3, [fp, #-8]
    8a88:	e51b2008 	ldr	r2, [fp, #-8]
    8a8c:	e51b300c 	ldr	r3, [fp, #-12]
    8a90:	e1520003 	cmp	r2, r3
    8a94:	bafffff0 	blt	8a5c <bootmain+0x24>
    8a98:	e59f00b0 	ldr	r0, [pc, #176]	; 8b50 <bootmain+0x118>
    8a9c:	ebfffe8b 	bl	84d0 <uprint>
    8aa0:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    8aa4:	e1a00003 	mov	r0, r3
    8aa8:	ebfffdfd 	bl	82a4 <hexstring>
    8aac:	e59f00a0 	ldr	r0, [pc, #160]	; 8b54 <bootmain+0x11c>
    8ab0:	ebfffe86 	bl	84d0 <uprint>
    8ab4:	e59f009c 	ldr	r0, [pc, #156]	; 8b58 <bootmain+0x120>
    8ab8:	ebfffe84 	bl	84d0 <uprint>
    8abc:	e59f0098 	ldr	r0, [pc, #152]	; 8b5c <bootmain+0x124>
    8ac0:	eb000097 	bl	8d24 <monitorInit>
    8ac4:	e59f0094 	ldr	r0, [pc, #148]	; 8b60 <bootmain+0x128>
    8ac8:	ebfffe80 	bl	84d0 <uprint>
    8acc:	e3a03000 	mov	r3, #0
    8ad0:	e50b3008 	str	r3, [fp, #-8]
    8ad4:	ea000018 	b	8b3c <bootmain+0x104>
    8ad8:	e59f0084 	ldr	r0, [pc, #132]	; 8b64 <bootmain+0x12c>
    8adc:	ebfffeeb 	bl	8690 <cprintf>
    8ae0:	e59f0080 	ldr	r0, [pc, #128]	; 8b68 <bootmain+0x130>
    8ae4:	eb0000b9 	bl	8dd0 <GET32>
    8ae8:	e1a03000 	mov	r3, r0
    8aec:	e50b3010 	str	r3, [fp, #-16]
    8af0:	e3a00064 	mov	r0, #100	; 0x64
    8af4:	e3a01065 	mov	r1, #101	; 0x65
    8af8:	e3a02066 	mov	r2, #102	; 0x66
    8afc:	e3a03067 	mov	r3, #103	; 0x67
    8b00:	e3a04068 	mov	r4, #104	; 0x68
    8b04:	e3a05069 	mov	r5, #105	; 0x69
    8b08:	e1600076 	smc	6
    8b0c:	e59f0058 	ldr	r0, [pc, #88]	; 8b6c <bootmain+0x134>
    8b10:	e51b1010 	ldr	r1, [fp, #-16]
    8b14:	e51b2010 	ldr	r2, [fp, #-16]
    8b18:	ebfffedc 	bl	8690 <cprintf>
    8b1c:	e59f004c 	ldr	r0, [pc, #76]	; 8b70 <bootmain+0x138>
    8b20:	ebfffeda 	bl	8690 <cprintf>
    8b24:	ef000000 	svc	0x00000000
    8b28:	e59f0044 	ldr	r0, [pc, #68]	; 8b74 <bootmain+0x13c>
    8b2c:	ebfffed7 	bl	8690 <cprintf>
    8b30:	e51b3008 	ldr	r3, [fp, #-8]
    8b34:	e2833001 	add	r3, r3, #1
    8b38:	e50b3008 	str	r3, [fp, #-8]
    8b3c:	e51b3008 	ldr	r3, [fp, #-8]
    8b40:	e3530009 	cmp	r3, #9
    8b44:	daffffe3 	ble	8ad8 <bootmain+0xa0>
    8b48:	eafffffe 	b	8b48 <bootmain+0x110>
    8b4c:	fffffe64 			; <UNDEFINED> instruction: 0xfffffe64
    8b50:	00009138 	andeq	r9, r0, r8, lsr r1
    8b54:	0000915c 	andeq	r9, r0, ip, asr r1
    8b58:	00009170 	andeq	r9, r0, r0, ror r1
    8b5c:	000089c8 	andeq	r8, r0, r8, asr #19
    8b60:	00009180 	andeq	r9, r0, r0, lsl #3
    8b64:	000091a0 	andeq	r9, r0, r0, lsr #3
    8b68:	20003004 	andcs	r3, r0, r4
    8b6c:	000091bc 			; <UNDEFINED> instruction: 0x000091bc
    8b70:	000091d4 	ldrdeq	r9, [r0], -r4
    8b74:	000091e8 	andeq	r9, r0, r8, ror #3

00008b78 <__aeabi_uidiv>:
    8b78:	e2512001 	subs	r2, r1, #1
    8b7c:	012fff1e 	bxeq	lr
    8b80:	3a000036 	bcc	8c60 <__aeabi_uidiv+0xe8>
    8b84:	e1500001 	cmp	r0, r1
    8b88:	9a000022 	bls	8c18 <__aeabi_uidiv+0xa0>
    8b8c:	e1110002 	tst	r1, r2
    8b90:	0a000023 	beq	8c24 <__aeabi_uidiv+0xac>
    8b94:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    8b98:	01a01181 	lsleq	r1, r1, #3
    8b9c:	03a03008 	moveq	r3, #8
    8ba0:	13a03001 	movne	r3, #1
    8ba4:	e3510201 	cmp	r1, #268435456	; 0x10000000
    8ba8:	31510000 	cmpcc	r1, r0
    8bac:	31a01201 	lslcc	r1, r1, #4
    8bb0:	31a03203 	lslcc	r3, r3, #4
    8bb4:	3afffffa 	bcc	8ba4 <__aeabi_uidiv+0x2c>
    8bb8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    8bbc:	31510000 	cmpcc	r1, r0
    8bc0:	31a01081 	lslcc	r1, r1, #1
    8bc4:	31a03083 	lslcc	r3, r3, #1
    8bc8:	3afffffa 	bcc	8bb8 <__aeabi_uidiv+0x40>
    8bcc:	e3a02000 	mov	r2, #0
    8bd0:	e1500001 	cmp	r0, r1
    8bd4:	20400001 	subcs	r0, r0, r1
    8bd8:	21822003 	orrcs	r2, r2, r3
    8bdc:	e15000a1 	cmp	r0, r1, lsr #1
    8be0:	204000a1 	subcs	r0, r0, r1, lsr #1
    8be4:	218220a3 	orrcs	r2, r2, r3, lsr #1
    8be8:	e1500121 	cmp	r0, r1, lsr #2
    8bec:	20400121 	subcs	r0, r0, r1, lsr #2
    8bf0:	21822123 	orrcs	r2, r2, r3, lsr #2
    8bf4:	e15001a1 	cmp	r0, r1, lsr #3
    8bf8:	204001a1 	subcs	r0, r0, r1, lsr #3
    8bfc:	218221a3 	orrcs	r2, r2, r3, lsr #3
    8c00:	e3500000 	cmp	r0, #0
    8c04:	11b03223 	lsrsne	r3, r3, #4
    8c08:	11a01221 	lsrne	r1, r1, #4
    8c0c:	1affffef 	bne	8bd0 <__aeabi_uidiv+0x58>
    8c10:	e1a00002 	mov	r0, r2
    8c14:	e12fff1e 	bx	lr
    8c18:	03a00001 	moveq	r0, #1
    8c1c:	13a00000 	movne	r0, #0
    8c20:	e12fff1e 	bx	lr
    8c24:	e3510801 	cmp	r1, #65536	; 0x10000
    8c28:	21a01821 	lsrcs	r1, r1, #16
    8c2c:	23a02010 	movcs	r2, #16
    8c30:	33a02000 	movcc	r2, #0
    8c34:	e3510c01 	cmp	r1, #256	; 0x100
    8c38:	21a01421 	lsrcs	r1, r1, #8
    8c3c:	22822008 	addcs	r2, r2, #8
    8c40:	e3510010 	cmp	r1, #16
    8c44:	21a01221 	lsrcs	r1, r1, #4
    8c48:	22822004 	addcs	r2, r2, #4
    8c4c:	e3510004 	cmp	r1, #4
    8c50:	82822003 	addhi	r2, r2, #3
    8c54:	908220a1 	addls	r2, r2, r1, lsr #1
    8c58:	e1a00230 	lsr	r0, r0, r2
    8c5c:	e12fff1e 	bx	lr
    8c60:	e3500000 	cmp	r0, #0
    8c64:	13e00000 	mvnne	r0, #0
    8c68:	ea000007 	b	8c8c <__aeabi_idiv0>

00008c6c <__aeabi_uidivmod>:
    8c6c:	e3510000 	cmp	r1, #0
    8c70:	0afffffa 	beq	8c60 <__aeabi_uidiv+0xe8>
    8c74:	e92d4003 	push	{r0, r1, lr}
    8c78:	ebffffbe 	bl	8b78 <__aeabi_uidiv>
    8c7c:	e8bd4006 	pop	{r1, r2, lr}
    8c80:	e0030092 	mul	r3, r2, r0
    8c84:	e0411003 	sub	r1, r1, r3
    8c88:	e12fff1e 	bx	lr

00008c8c <__aeabi_idiv0>:
    8c8c:	e12fff1e 	bx	lr

Disassembly of section .init:

00008ca0 <monitor>:
    8ca0:	e1a00000 	nop			; (mov r0, r0)
    8ca4:	e1a00000 	nop			; (mov r0, r0)
    8ca8:	ea000004 	b	8cc0 <SMC_Handler>
    8cac:	e1a00000 	nop			; (mov r0, r0)
    8cb0:	e1a00000 	nop			; (mov r0, r0)
    8cb4:	e1a00000 	nop			; (mov r0, r0)
    8cb8:	e1a00000 	nop			; (mov r0, r0)
    8cbc:	e1a00000 	nop			; (mov r0, r0)

00008cc0 <SMC_Handler>:
    8cc0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8cc4:	ebffff1e 	bl	8944 <smc_print>
    8cc8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8ccc:	e92d000f 	push	{r0, r1, r2, r3}
    8cd0:	ee110f11 	mrc	15, 0, r0, cr1, cr1, {0}
    8cd4:	e3100001 	tst	r0, #1
    8cd8:	e2200001 	eor	r0, r0, #1
    8cdc:	ee010f11 	mcr	15, 0, r0, cr1, cr1, {0}
    8ce0:	059f0298 	ldreq	r0, [pc, #664]	; 8f80 <ns_FIQHandler+0x10>
    8ce4:	159f0298 	ldrne	r0, [pc, #664]	; 8f84 <ns_FIQHandler+0x14>
    8ce8:	e5902000 	ldr	r2, [r0]
    8cec:	059f1290 	ldreq	r1, [pc, #656]	; 8f84 <ns_FIQHandler+0x14>
    8cf0:	159f1288 	ldrne	r1, [pc, #648]	; 8f80 <ns_FIQHandler+0x10>
    8cf4:	e5913000 	ldr	r3, [r1]
    8cf8:	e9221ff0 	stmdb	r2!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8cfc:	e14f4000 	mrs	r4, SPSR
    8d00:	e9224010 	stmdb	r2!, {r4, lr}
    8d04:	e5802000 	str	r2, [r0]
    8d08:	e8b34001 	ldm	r3!, {r0, lr}
    8d0c:	e16ff000 	msr	SPSR_fsxc, r0
    8d10:	e8b31ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8d14:	e5813000 	str	r3, [r1]
    8d18:	f57ff01f 	clrex
    8d1c:	e8bd000f 	pop	{r0, r1, r2, r3}
    8d20:	e1b0f00e 	movs	pc, lr

00008d24 <monitorInit>:
    8d24:	e59f125c 	ldr	r1, [pc, #604]	; 8f88 <ns_FIQHandler+0x18>
    8d28:	e5810000 	str	r0, [r1]
    8d2c:	e59f0258 	ldr	r0, [pc, #600]	; 8f8c <ns_FIQHandler+0x1c>
    8d30:	ee0c0f30 	mcr	15, 0, r0, cr12, cr0, {1}
    8d34:	e59f0254 	ldr	r0, [pc, #596]	; 8f90 <ns_FIQHandler+0x20>
    8d38:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
    8d3c:	e59f0250 	ldr	r0, [pc, #592]	; 8f94 <ns_FIQHandler+0x24>
    8d40:	e9201ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8d44:	e10f1000 	mrs	r1, CPSR
    8d48:	e9204002 	stmdb	r0!, {r1, lr}
    8d4c:	f1020016 	cps	#22
    8d50:	e59f1228 	ldr	r1, [pc, #552]	; 8f80 <ns_FIQHandler+0x10>
    8d54:	e5810000 	str	r0, [r1]
    8d58:	e59f0224 	ldr	r0, [pc, #548]	; 8f84 <ns_FIQHandler+0x14>
    8d5c:	e59f1234 	ldr	r1, [pc, #564]	; 8f98 <ns_FIQHandler+0x28>
    8d60:	e5801000 	str	r1, [r0]
    8d64:	e59fe17c 	ldr	lr, [pc, #380]	; 8ee8 <ns_image>
    8d68:	e36ff013 	msr	SPSR_fsxc, #19
    8d6c:	ee114f11 	mrc	15, 0, r4, cr1, cr1, {0}
    8d70:	e3844001 	orr	r4, r4, #1
    8d74:	ee014f11 	mcr	15, 0, r4, cr1, cr1, {0}
    8d78:	e59f021c 	ldr	r0, [pc, #540]	; 8f9c <ns_FIQHandler+0x2c>
    8d7c:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
    8d80:	e3a00000 	mov	r0, #0
    8d84:	e3a01000 	mov	r1, #0
    8d88:	e3a02000 	mov	r2, #0
    8d8c:	e3a03000 	mov	r3, #0
    8d90:	e3a04000 	mov	r4, #0
    8d94:	e3a05000 	mov	r5, #0
    8d98:	e3a06000 	mov	r6, #0
    8d9c:	e3a07000 	mov	r7, #0
    8da0:	e3a08000 	mov	r8, #0
    8da4:	e3a09000 	mov	r9, #0
    8da8:	e3a0a000 	mov	sl, #0
    8dac:	e3a0b000 	mov	fp, #0
    8db0:	e3a0c000 	mov	ip, #0
    8db4:	e1b0f00e 	movs	pc, lr

00008db8 <PUT32>:
    8db8:	e5801000 	str	r1, [r0]
    8dbc:	e12fff1e 	bx	lr

00008dc0 <PUT16>:
    8dc0:	e1c010b0 	strh	r1, [r0]
    8dc4:	e12fff1e 	bx	lr

00008dc8 <PUT8>:
    8dc8:	e5c01000 	strb	r1, [r0]
    8dcc:	e12fff1e 	bx	lr

00008dd0 <GET32>:
    8dd0:	e5900000 	ldr	r0, [r0]
    8dd4:	e12fff1e 	bx	lr

00008dd8 <GETPC>:
    8dd8:	e1a0000e 	mov	r0, lr
    8ddc:	e12fff1e 	bx	lr

00008de0 <BRANCHTO>:
    8de0:	e12fff10 	bx	r0

00008de4 <dummy>:
    8de4:	e12fff1e 	bx	lr

00008de8 <NS_STACK_BASE>:
	...

00008e64 <NS_STACK_LIMIT>:
	...

00008ee0 <NS_STACK_SP>:
    8ee0:	00000000 	andeq	r0, r0, r0

00008ee4 <S_STACK_SP>:
    8ee4:	00000000 	andeq	r0, r0, r0

00008ee8 <ns_image>:
    8ee8:	00000000 	andeq	r0, r0, r0

00008eec <UndefHandler>:
    8eec:	eafffffe 	b	8eec <UndefHandler>

00008ef0 <SWIHandler>:
    8ef0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8ef4:	ebfffe62 	bl	8884 <secure_swi>
    8ef8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8efc:	e1a0f00e 	mov	pc, lr

00008f00 <PAbortHandler>:
    8f00:	eafffffe 	b	8f00 <PAbortHandler>

00008f04 <DAbortHandler>:
    8f04:	eafffffe 	b	8f04 <DAbortHandler>

00008f08 <IRQHandler>:
    8f08:	eafffffe 	b	8f08 <IRQHandler>

00008f0c <FIQHandler>:
    8f0c:	eafffffe 	b	8f0c <FIQHandler>

00008f10 <ns_ResetHandler>:
    8f10:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f14:	ebfffe60 	bl	889c <ns_reset>
    8f18:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f1c:	e1a0f00e 	mov	pc, lr

00008f20 <ns_UndefHandler>:
    8f20:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f24:	ebfffe62 	bl	88b4 <ns_undef>
    8f28:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f2c:	e1a0f00e 	mov	pc, lr

00008f30 <ns_SWIHandler>:
    8f30:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f34:	ebfffe64 	bl	88cc <ns_swi>
    8f38:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f3c:	e1a0f00e 	mov	pc, lr

00008f40 <ns_PAbortHandler>:
    8f40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f44:	ebfffe66 	bl	88e4 <ns_pa>
    8f48:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f4c:	e1a0f00e 	mov	pc, lr

00008f50 <ns_DAbortHandler>:
    8f50:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f54:	ebfffe68 	bl	88fc <ns_da>
    8f58:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f5c:	e1a0f00e 	mov	pc, lr

00008f60 <ns_IRQHandler>:
    8f60:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f64:	ebfffe6a 	bl	8914 <ns_irq>
    8f68:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f6c:	e1a0f00e 	mov	pc, lr

00008f70 <ns_FIQHandler>:
    8f70:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f74:	ebfffe6c 	bl	892c <ns_fiq>
    8f78:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    8f7c:	e1a0f00e 	mov	pc, lr
    8f80:	00008ee4 	andeq	r8, r0, r4, ror #29
    8f84:	00008ee0 	andeq	r8, r0, r0, ror #29
    8f88:	00008ee8 	andeq	r8, r0, r8, ror #29
    8f8c:	00008ca0 	andeq	r8, r0, r0, lsr #25
    8f90:	00008000 	andeq	r8, r0, r0
    8f94:	00008ee0 	andeq	r8, r0, r0, ror #29
    8f98:	00008e64 	andeq	r8, r0, r4, ror #28
    8f9c:	00008040 	andeq	r8, r0, r0, asr #32

Disassembly of section .rodata:

00008fa0 <.rodata>:
    8fa0:	6c756e28 	ldclvs	14, cr6, [r5], #-160	; 0xffffff60
    8fa4:	0000296c 	andeq	r2, r0, ip, ror #18
    8fa8:	53206e49 	teqpl	r0, #1168	; 0x490
    8fac:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    8fb0:	6f572065 	svcvs	0x00572065
    8fb4:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8fb8:	57532073 			; <UNDEFINED> instruction: 0x57532073
    8fbc:	61482049 	cmpvs	r8, r9, asr #32
    8fc0:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    8fc4:	00000a72 	andeq	r0, r0, r2, ror sl
    8fc8:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8fcc:	616d726f 	cmnvs	sp, pc, ror #4
    8fd0:	6f57206c 	svcvs	0x0057206c
    8fd4:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8fd8:	65722073 	ldrbvs	r2, [r2, #-115]!	; 0xffffff8d
    8fdc:	20746573 	rsbscs	r6, r4, r3, ror r5
    8fe0:	646e6148 	strbtvs	r6, [lr], #-328	; 0xfffffeb8
    8fe4:	0a72656c 	beq	1ca259c <RESV_AREA+0x1c1259c>
    8fe8:	00000000 	andeq	r0, r0, r0
    8fec:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    8ff0:	616d726f 	cmnvs	sp, pc, ror #4
    8ff4:	6f57206c 	svcvs	0x0057206c
    8ff8:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    8ffc:	6e552073 	mrcvs	0, 2, r2, cr5, cr3, {3}
    9000:	20666564 	rsbcs	r6, r6, r4, ror #10
    9004:	646e6148 	strbtvs	r6, [lr], #-328	; 0xfffffeb8
    9008:	0a72656c 	beq	1ca25c0 <RESV_AREA+0x1c125c0>
    900c:	00000000 	andeq	r0, r0, r0
    9010:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    9014:	616d726f 	cmnvs	sp, pc, ror #4
    9018:	6f57206c 	svcvs	0x0057206c
    901c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    9020:	57532073 			; <UNDEFINED> instruction: 0x57532073
    9024:	61482049 	cmpvs	r8, r9, asr #32
    9028:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    902c:	00000a72 	andeq	r0, r0, r2, ror sl
    9030:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    9034:	616d726f 	cmnvs	sp, pc, ror #4
    9038:	6f57206c 	svcvs	0x0057206c
    903c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    9040:	41502073 	cmpmi	r0, r3, ror r0
    9044:	6e614820 	cdpvs	8, 6, cr4, cr1, cr0, {1}
    9048:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
    904c:	0000000a 	andeq	r0, r0, sl
    9050:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    9054:	616d726f 	cmnvs	sp, pc, ror #4
    9058:	6f57206c 	svcvs	0x0057206c
    905c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    9060:	52492073 	subpl	r2, r9, #115	; 0x73
    9064:	61482051 	qdaddvs	r2, r1, r8
    9068:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    906c:	00000a72 	andeq	r0, r0, r2, ror sl
    9070:	4e206e49 	cdpmi	14, 2, cr6, cr0, cr9, {2}
    9074:	616d726f 	cmnvs	sp, pc, ror #4
    9078:	6f57206c 	svcvs	0x0057206c
    907c:	27646c72 			; <UNDEFINED> instruction: 0x27646c72
    9080:	49462073 	stmdbmi	r6, {r0, r1, r4, r5, r6, sp}^
    9084:	61482051 	qdaddvs	r2, r1, r8
    9088:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
    908c:	00000a72 	andeq	r0, r0, r2, ror sl
    9090:	20434d53 	subcs	r4, r3, r3, asr sp
    9094:	76203052 			; <UNDEFINED> instruction: 0x76203052
    9098:	3a206c61 	bcc	824224 <RESV_AREA+0x794224>
    909c:	000a7825 	andeq	r7, sl, r5, lsr #16
    90a0:	20434d53 	subcs	r4, r3, r3, asr sp
    90a4:	76203152 			; <UNDEFINED> instruction: 0x76203152
    90a8:	3a206c61 	bcc	824234 <RESV_AREA+0x794234>
    90ac:	000a7825 	andeq	r7, sl, r5, lsr #16
    90b0:	20434d53 	subcs	r4, r3, r3, asr sp
    90b4:	76203252 			; <UNDEFINED> instruction: 0x76203252
    90b8:	3a206c61 	bcc	824244 <RESV_AREA+0x794244>
    90bc:	000a7825 	andeq	r7, sl, r5, lsr #16
    90c0:	20434d53 	subcs	r4, r3, r3, asr sp
    90c4:	76203352 			; <UNDEFINED> instruction: 0x76203352
    90c8:	3a206c61 	bcc	824254 <RESV_AREA+0x794254>
    90cc:	000a7825 	andeq	r7, sl, r5, lsr #16
    90d0:	20434d53 	subcs	r4, r3, r3, asr sp
    90d4:	76203452 			; <UNDEFINED> instruction: 0x76203452
    90d8:	3a206c61 	bcc	824264 <RESV_AREA+0x794264>
    90dc:	000a7825 	andeq	r7, sl, r5, lsr #16
    90e0:	20434d53 	subcs	r4, r3, r3, asr sp
    90e4:	76203552 			; <UNDEFINED> instruction: 0x76203552
    90e8:	3a206c61 	bcc	824274 <RESV_AREA+0x794274>
    90ec:	000a7825 	andeq	r7, sl, r5, lsr #16
    90f0:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    90f4:	7266206f 	rsbvc	r2, r6, #111	; 0x6f
    90f8:	4e206d6f 	cdpmi	13, 2, cr6, cr0, cr15, {3}
    90fc:	616d726f 	cmnvs	sp, pc, ror #4
    9100:	6f77206c 	svcvs	0x0077206c
    9104:	3a646c72 	bcc	19242d4 <RESV_AREA+0x18942d4>
    9108:	20642520 	rsbcs	r2, r4, r0, lsr #10
    910c:	000a7825 	andeq	r7, sl, r5, lsr #16
    9110:	6f666542 	svcvs	0x00666542
    9114:	4e206572 	mcrmi	5, 1, r6, cr0, cr2, {3}
    9118:	616d726f 	cmnvs	sp, pc, ror #4
    911c:	5753206c 	ldrbpl	r2, [r3, -ip, rrx]
    9120:	00000a49 	andeq	r0, r0, r9, asr #20
    9124:	65746641 	ldrbvs	r6, [r4, #-1601]!	; 0xfffff9bf
    9128:	6f4e2072 	svcvs	0x004e2072
    912c:	6c616d72 	stclvs	13, cr6, [r1], #-456	; 0xfffffe38
    9130:	49575320 	ldmdbmi	r7, {r5, r8, r9, ip, lr}^
    9134:	0000000a 	andeq	r0, r0, sl
    9138:	2a2a0a0a 	bcs	a8b968 <RESV_AREA+0x9fb968>
    913c:	2a2a2a2a 	bcs	a939ec <RESV_AREA+0xa039ec>
    9140:	2a2a2a2a 	bcs	a939f0 <RESV_AREA+0xa039f0>
    9144:	20707845 	rsbscs	r7, r0, r5, asr #16
    9148:	72617453 	rsbvc	r7, r1, #1392508928	; 0x53000000
    914c:	2a2a2a74 	bcs	a93b24 <RESV_AREA+0xa03b24>
    9150:	2a2a2a2a 	bcs	a93a00 <RESV_AREA+0xa03a00>
    9154:	2a2a2a2a 	bcs	a93a04 <RESV_AREA+0xa03a04>
    9158:	0000000a 	andeq	r0, r0, sl
    915c:	74736554 	ldrbtvc	r6, [r3], #-1364	; 0xfffffaac
    9160:	75725420 	ldrbvc	r5, [r2, #-1056]!	; 0xfffffbe0
    9164:	6f5a7473 	svcvs	0x005a7473
    9168:	7620656e 	strtvc	r6, [r0], -lr, ror #10
    916c:	00000a32 	andeq	r0, r0, r2, lsr sl
    9170:	6c6c6548 	cfstr64vs	mvdx6, [ip], #-288	; 0xfffffee0
    9174:	6f57206f 	svcvs	0x0057206f
    9178:	0a646c72 	beq	1924348 <RESV_AREA+0x1894348>
    917c:	00000000 	andeq	r0, r0, r0
    9180:	74736e49 	ldrbtvc	r6, [r3], #-3657	; 0xfffff1b7
    9184:	206c6c61 	rsbcs	r6, ip, r1, ror #24
    9188:	696e6f4d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, r9, sl, fp, sp, lr}^
    918c:	20726f74 	rsbscs	r6, r2, r4, ror pc
    9190:	63637553 	cmnvs	r3, #348127232	; 0x14c00000
    9194:	66737365 	ldrbtvs	r7, [r3], -r5, ror #6
    9198:	796c6c75 	stmdbvc	ip!, {r0, r2, r4, r5, r6, sl, fp, sp, lr}^
    919c:	0000000a 	andeq	r0, r0, sl
    91a0:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    91a4:	7266206f 	rsbvc	r2, r6, #111	; 0x6f
    91a8:	53206d6f 	teqpl	r0, #7104	; 0x1bc0
    91ac:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    91b0:	6f772065 	svcvs	0x00772065
    91b4:	0a646c72 	beq	1924384 <RESV_AREA+0x1894384>
    91b8:	00000000 	andeq	r0, r0, r0
    91bc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
    91c0:	206e6920 	rsbcs	r6, lr, r0, lsr #18
    91c4:	75636573 	strbvc	r6, [r3, #-1395]!	; 0xfffffa8d
    91c8:	203a6572 	eorscs	r6, sl, r2, ror r5
    91cc:	25206425 	strcs	r6, [r0, #-1061]!	; 0xfffffbdb
    91d0:	00000a78 	andeq	r0, r0, r8, ror sl
    91d4:	6f666542 	svcvs	0x00666542
    91d8:	53206572 	teqpl	r0, #478150656	; 0x1c800000
    91dc:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    91e0:	57532065 	ldrbpl	r2, [r3, -r5, rrx]
    91e4:	00000a49 	andeq	r0, r0, r9, asr #20
    91e8:	65746641 	ldrbvs	r6, [r4, #-1601]!	; 0xfffff9bf
    91ec:	65532072 	ldrbvs	r2, [r3, #-114]	; 0xffffff8e
    91f0:	65727563 	ldrbvs	r7, [r2, #-1379]!	; 0xfffffa9d
    91f4:	49575320 	ldmdbmi	r7, {r5, r8, r9, ip, lr}^
    91f8:	0000000a 	andeq	r0, r0, sl

Disassembly of section .data:

000091fc <digits.3684>:
    91fc:	33323130 	teqcc	r2, #48, 2
    9200:	37363534 			; <UNDEFINED> instruction: 0x37363534
    9204:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    9208:	66656463 	strbtvs	r6, [r5], -r3, ror #8
    920c:	00000000 	andeq	r0, r0, r0

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003341 	andeq	r3, r0, r1, asr #6
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000029 	andeq	r0, r0, r9, lsr #32
  10:	4d524105 	ldfmie	f4, [r2, #-20]	; 0xffffffec
  14:	36373131 			; <UNDEFINED> instruction: 0x36373131
  18:	2d465a4a 	vstrcs	s11, [r6, #-296]	; 0xfffffed8
  1c:	07060053 	smlsdeq	r6, r3, r0, r0
  20:	01090108 	tsteq	r9, r8, lsl #2
  24:	01140412 	tsteq	r4, r2, lsl r4
  28:	03170115 	tsteq	r7, #1073741829	; 0x40000005
  2c:	011a0118 	tsteq	sl, r8, lsl r1
  30:	01440122 	cmpeq	r4, r2, lsr #2

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <RESV_AREA+0x1040d24>
   4:	6f532820 	svcvs	0x00532820
   8:	65637275 	strbvs	r7, [r3, #-629]!	; 0xfffffd8b
   c:	43207972 	teqmi	r0, #1867776	; 0x1c8000
  10:	4265646f 	rsbmi	r6, r5, #1862270976	; 0x6f000000
  14:	68636e65 	stmdavs	r3!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
  18:	74694c20 	strbtvc	r4, [r9], #-3104	; 0xfffff3e0
  1c:	30322065 	eorscc	r2, r2, r5, rrx
  20:	312e3331 	teqcc	lr, r1, lsr r3
  24:	34322d31 	ldrtcc	r2, [r2], #-3377	; 0xfffff2cf
  28:	2e342029 	cdpcs	0, 3, cr2, cr4, cr9, {1}
  2c:	00312e38 	eorseq	r2, r1, r8, lsr lr

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c010001 	stcvc	0, cr0, [r1], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008b78 	andeq	r8, r0, r8, ror fp
  1c:	000000f4 	strdeq	r0, [r0], -r4

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000000dd 	ldrdeq	r0, [r0], -sp
   4:	009e0002 	addseq	r0, lr, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	2f010000 	svccs	0x00010000
  1c:	2f74706f 	svccs	0x0074706f
  20:	61636f6c 	cmnvs	r3, ip, ror #30
  24:	61762f6c 	cmnvs	r6, ip, ror #30
  28:	616d2f72 	smcvs	54002	; 0xd2f2
  2c:	726f7063 	rsbvc	r7, pc, #99	; 0x63
  30:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
  34:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
  38:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
  3c:	706d5f74 	rsbvc	r5, sp, r4, ror pc
  40:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  44:	6f70645f 	svcvs	0x0070645f
  48:	5f737472 	svcpl	0x00737472
  4c:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
  50:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
  54:	6f6e2d6d 	svcvs	0x006e2d6d
  58:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
  5c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
  60:	2f636367 	svccs	0x00636367
  64:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
  68:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
  6c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
  70:	63672d69 	cmnvs	r7, #6720	; 0x1a40
  74:	6f772f63 	svcvs	0x00772f63
  78:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
  7c:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
  80:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
  84:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
  88:	2f636367 	svccs	0x00636367
  8c:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
  90:	612f6769 	teqvs	pc, r9, ror #14
  94:	00006d72 	andeq	r6, r0, r2, ror sp
  98:	3162696c 	cmncc	r2, ip, ror #18
  9c:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  a0:	00532e73 	subseq	r2, r3, r3, ror lr
  a4:	00000001 	andeq	r0, r0, r1
  a8:	78020500 	stmdavc	r2, {r8, sl}
  ac:	0300008b 	movweq	r0, #139	; 0x8b
  b0:	300107cc 	andcc	r0, r1, ip, asr #15
  b4:	2f2f2f2f 	svccs	0x002f2f2f
  b8:	7cfe032f 	ldclvc	3, cr0, [lr], #188	; 0xbc
  bc:	0386032e 	orreq	r0, r6, #-1207959552	; 0xb8000000
  c0:	2f013e02 	svccs	0x00013e02
  c4:	032f2f31 	teqeq	pc, #49, 30	; 0xc4
  c8:	032e7db7 	teqeq	lr, #11712	; 0x2dc0
  cc:	900802cd 	andls	r0, r8, sp, asr #5
  d0:	1603322f 	strne	r3, [r3], -pc, lsr #4
  d4:	2f2f2f66 	svccs	0x002f2f66
  d8:	2f2f2f2f 	svccs	0x002f2f2f
  dc:	01000202 	tsteq	r0, r2, lsl #4
  e0:	0000b401 	andeq	fp, r0, r1, lsl #8
  e4:	9e000200 	cdpls	2, 0, cr0, cr0, cr0, {0}
  e8:	02000000 	andeq	r0, r0, #0
  ec:	0d0efb01 	vstreq	d15, [lr, #-4]
  f0:	01010100 	mrseq	r0, (UNDEF: 17)
  f4:	00000001 	andeq	r0, r0, r1
  f8:	01000001 	tsteq	r0, r1
  fc:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
 100:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
 104:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
 108:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff8c <RESV_AREA+0xfff6ff8c>
 10c:	6f706361 	svcvs	0x00706361
 110:	2f737472 	svccs	0x00737472
 114:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 118:	6f5f2f64 	svcvs	0x005f2f64
 11c:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff64 <RESV_AREA+0xfff6ff64>
 120:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
 124:	70645f73 	rsbvc	r5, r4, r3, ror pc
 128:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 12c:	6f72635f 	svcvs	0x0072635f
 130:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
 134:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 138:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 13c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 140:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
 144:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 148:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 14c:	61652d65 	cmnvs	r5, r5, ror #26
 150:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
 154:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
 158:	2f6b726f 	svccs	0x006b726f
 15c:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 160:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
 164:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
 168:	63636762 	cmnvs	r3, #25690112	; 0x1880000
 16c:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
 170:	2f676966 	svccs	0x00676966
 174:	006d7261 	rsbeq	r7, sp, r1, ror #4
 178:	62696c00 	rsbvs	r6, r9, #0, 24
 17c:	6e756631 	mrcvs	6, 3, r6, cr5, cr1, {1}
 180:	532e7363 	teqpl	lr, #-1946157055	; 0x8c000001
 184:	00000100 	andeq	r0, r0, r0, lsl #2
 188:	02050000 	andeq	r0, r5, #0
 18c:	00008c8c 	andeq	r8, r0, ip, lsl #25
 190:	010a9303 	tsteq	sl, r3, lsl #6
 194:	01000202 	tsteq	r0, r2, lsl #4
 198:	Address 0x00000198 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000127 	andeq	r0, r0, r7, lsr #2
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000000 	andeq	r0, r0, r0
  10:	00008b78 	andeq	r8, r0, r8, ror fp
  14:	00008c8c 	andeq	r8, r0, ip, lsl #25
  18:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  1c:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  20:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  24:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; fffffea8 <RESV_AREA+0xfff6fea8>
  28:	6f706361 	svcvs	0x00706361
  2c:	2f737472 	svccs	0x00737472
  30:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  34:	6f5f2f64 	svcvs	0x005f2f64
  38:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; fffffe80 <RESV_AREA+0xfff6fe80>
  3c:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  40:	70645f73 	rsbvc	r5, r4, r3, ror pc
  44:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  48:	6f72635f 	svcvs	0x0072635f
  4c:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  50:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  54:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  58:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  5c:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  60:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  64:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  68:	61652d65 	cmnvs	r5, r5, ror #26
  6c:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  70:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  74:	2f6b726f 	svccs	0x006b726f
  78:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
  7c:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
  80:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
  84:	63636762 	cmnvs	r3, #25690112	; 0x1880000
  88:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
  8c:	2f676966 	svccs	0x00676966
  90:	2f6d7261 	svccs	0x006d7261
  94:	3162696c 	cmncc	r2, ip, ror #18
  98:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  9c:	00532e73 	subseq	r2, r3, r3, ror lr
  a0:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  a4:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  a8:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  ac:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff30 <RESV_AREA+0xfff6ff30>
  b0:	6f706361 	svcvs	0x00706361
  b4:	2f737472 	svccs	0x00737472
  b8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  bc:	6f5f2f64 	svcvs	0x005f2f64
  c0:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff08 <RESV_AREA+0xfff6ff08>
  c4:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  c8:	70645f73 	rsbvc	r5, r4, r3, ror pc
  cc:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  d0:	6f72635f 	svcvs	0x0072635f
  d4:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  d8:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  dc:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  e0:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  e4:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  e8:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  ec:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  f0:	61652d65 	cmnvs	r5, r5, ror #26
  f4:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  f8:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  fc:	2f6b726f 	svccs	0x006b726f
 100:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 104:	72612f64 	rsbvc	r2, r1, #100, 30	; 0x190
 108:	6f6e2d6d 	svcvs	0x006e2d6d
 10c:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 110:	2f696261 	svccs	0x00696261
 114:	6762696c 	strbvs	r6, [r2, -ip, ror #18]!
 118:	47006363 	strmi	r6, [r0, -r3, ror #6]
 11c:	4120554e 	teqmi	r0, lr, asr #10
 120:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 124:	312e3332 	teqcc	lr, r2, lsr r3
 128:	27800100 	strcs	r0, [r0, r0, lsl #2]
 12c:	02000001 	andeq	r0, r0, #1
 130:	00001400 	andeq	r1, r0, r0, lsl #8
 134:	e1010400 	tst	r1, r0, lsl #8
 138:	8c000000 	stchi	0, cr0, [r0], {-0}
 13c:	9000008c 	andls	r0, r0, ip, lsl #1
 140:	2f00008c 	svccs	0x0000008c
 144:	2f74706f 	svccs	0x0074706f
 148:	61636f6c 	cmnvs	r3, ip, ror #30
 14c:	61762f6c 	cmnvs	r6, ip, ror #30
 150:	616d2f72 	smcvs	54002	; 0xd2f2
 154:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 158:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 15c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 160:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 164:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 168:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 16c:	6f70645f 	svcvs	0x0070645f
 170:	5f737472 	svcpl	0x00737472
 174:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 178:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 17c:	6f6e2d6d 	svcvs	0x006e2d6d
 180:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 184:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 188:	2f636367 	svccs	0x00636367
 18c:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 190:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 194:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 198:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 19c:	6f772f63 	svcvs	0x00772f63
 1a0:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
 1a4:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
 1a8:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
 1ac:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 1b0:	2f636367 	svccs	0x00636367
 1b4:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 1b8:	612f6769 	teqvs	pc, r9, ror #14
 1bc:	6c2f6d72 	stcvs	13, cr6, [pc], #-456	; fffffffc <RESV_AREA+0xfff6fffc>
 1c0:	66316269 	ldrtvs	r6, [r1], -r9, ror #4
 1c4:	73636e75 	cmnvc	r3, #1872	; 0x750
 1c8:	2f00532e 	svccs	0x0000532e
 1cc:	2f74706f 	svccs	0x0074706f
 1d0:	61636f6c 	cmnvs	r3, ip, ror #30
 1d4:	61762f6c 	cmnvs	r6, ip, ror #30
 1d8:	616d2f72 	smcvs	54002	; 0xd2f2
 1dc:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 1e0:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 1e4:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 1e8:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 1ec:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 1f0:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 1f4:	6f70645f 	svcvs	0x0070645f
 1f8:	5f737472 	svcpl	0x00737472
 1fc:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 200:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 204:	6f6e2d6d 	svcvs	0x006e2d6d
 208:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 20c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 210:	2f636367 	svccs	0x00636367
 214:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 218:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 21c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 220:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 224:	6f772f63 	svcvs	0x00772f63
 228:	622f6b72 	eorvs	r6, pc, #116736	; 0x1c800
 22c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 230:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 234:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 238:	61652d65 	cmnvs	r5, r5, ror #26
 23c:	6c2f6962 	stcvs	9, cr6, [pc], #-392	; bc <I_Bit+0x3c>
 240:	63676269 	cmnvs	r7, #-1879048186	; 0x90000006
 244:	4e470063 	cdpmi	0, 4, cr0, cr7, cr3, {3}
 248:	53412055 	movtpl	r2, #4181	; 0x1055
 24c:	322e3220 	eorcc	r3, lr, #32, 4
 250:	00312e33 	eorseq	r2, r1, r3, lsr lr
 254:	Address 0x00000254 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <RESV_AREA+0x170c14>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	10001101 	andne	r1, r0, r1, lsl #2
  18:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
  1c:	1b080301 	blne	200c28 <RESV_AREA+0x170c28>
  20:	13082508 	movwne	r2, #34056	; 0x8508
  24:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008b78 	andeq	r8, r0, r8, ror fp
  14:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	012b0002 	teqeq	fp, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008c8c 	andeq	r8, r0, ip, lsl #25
  34:	00000004 	andeq	r0, r0, r4
	...
