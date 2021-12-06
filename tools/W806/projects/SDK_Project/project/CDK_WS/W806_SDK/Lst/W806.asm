
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 18 06 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	68 27 01 08 9c 27 01 08 d0 05 01 08 d0 05 01 08     h'...'..........
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104b0:	34 27 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     4'..............
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 00 27 01 08 d0 05 01 08 d0 05 01 08     .....'..........
 80104f0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x20001160	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x8014d2c	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x20000160	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x20000160	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x20001948	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0001504 	bsr      	0x8012f5c	// 8012f5c <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0001558 	bsr      	0x8013008	// 8013008 <board_init>
#endif

    jbsr    main
 801055c:	e0000fd8 	bsr      	0x801250c	// 801250c <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	20001160 	.long	0x20001160
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	08014d2c 	.long	0x08014d2c
 801057c:	20000100 	.long	0x20000100
 8010580:	20000160 	.long	0x20000160
 8010584:	20000160 	.long	0x20000160
 8010588:	20001948 	.long	0x20001948

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001360	// 80105d8 <ADC_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e00014e0 	bsr      	0x8012f8c	// 8012f8c <trap_c>

080105d0 <ADC_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001360 	.long	0x20001360
 80105d8:	20001360 	.long	0x20001360

080105dc <cpu_yeild>:
 *
 ********************************************************************/
.global cpu_yeild
.type   cpu_yeild, %function
cpu_yeild:
    lrw    r0, VIC_TSPDR
 80105dc:	1106      	lrw      	r0, 0xe000ec08	// 8010674 <tspend_handler+0x5c>
    bgeni  r1, 0
 80105de:	ea010001 	movi      	r1, 1
    stw    r1, (r0)
 80105e2:	b020      	st.w      	r1, (r0, 0x0)
    rts
 80105e4:	783c      	jmp      	r15

080105e6 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 80105e6:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 80105ea:	1184      	lrw      	r4, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 80105ec:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 80105ee:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 80105f2:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 80105f4:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 80105f8:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 80105fa:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 80105fe:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010602:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010606:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010608:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 801060c:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801060e:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010612:	1412      	addi      	r14, r14, 72

    rte
 8010614:	c0004020 	rte

08010618 <tspend_handler>:
 *
 ********************************************************************/
.global tspend_handler
.type   tspend_handler, %function
tspend_handler:
    subi     sp, 196
 8010618:	1531      	subi      	r14, r14, 196
    stm      r0-r13, (sp)
 801061a:	d40e1c2d 	stm      	r0-r13, (r14)
    stw      r15, (sp, 56)
 801061e:	ddee200e 	st.w      	r15, (r14, 0x38)
    addi     r0, sp, 60
 8010622:	180f      	addi      	r0, r14, 60
    stm      r16-r31, (r0)
 8010624:	d6001c2f 	stm      	r16-r31, (r0)
    addi     r0, 64
 8010628:	203f      	addi      	r0, 64
    fstms    vr0-vr15, (r0)
 801062a:	f5e03400 	fstms      	fr0-fr15, (r0)
    mfcr     r1, epsr
 801062e:	c0026021 	mfcr      	r1, cr<2, 0>
    stw      r1, (r0, 64)
 8010632:	b030      	st.w      	r1, (r0, 0x40)
    mfcr     r1, epc
 8010634:	c0046021 	mfcr      	r1, cr<4, 0>
    stw      r1, (r0, 68)
 8010638:	b031      	st.w      	r1, (r0, 0x44)

    lrw      r2, pxCurrentTCB
 801063a:	1050      	lrw      	r2, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r3, (r2)
 801063c:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 801063e:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010642:	e0002113 	bsr      	0x8014868	// 8014868 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 8010646:	108d      	lrw      	r4, 0x20001364	// 8010678 <tspend_handler+0x60>
    ld.w     r4, (r4)
 8010648:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 801064a:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 801064e:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010650:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 8010654:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 8010656:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 801065a:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 801065e:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010662:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010664:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 8010668:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801066a:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 801066e:	1412      	addi      	r14, r14, 72

    rte
 8010670:	c0004020 	rte
 8010674:	e000ec08 	.long	0xe000ec08
 8010678:	20001364 	.long	0x20001364

0801067c <__fixunsdfsi>:
 801067c:	14d2      	push      	r4-r5, r15
 801067e:	3200      	movi      	r2, 0
 8010680:	ea2341e0 	movih      	r3, 16864
 8010684:	6d03      	mov      	r4, r0
 8010686:	6d47      	mov      	r5, r1
 8010688:	e00006a2 	bsr      	0x80113cc	// 80113cc <__gedf2>
 801068c:	e9a00007 	bhsz      	r0, 0x801069a	// 801069a <__fixunsdfsi+0x1e>
 8010690:	6c13      	mov      	r0, r4
 8010692:	6c57      	mov      	r1, r5
 8010694:	e000070c 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8010698:	1492      	pop      	r4-r5, r15
 801069a:	3200      	movi      	r2, 0
 801069c:	ea2341e0 	movih      	r3, 16864
 80106a0:	6c13      	mov      	r0, r4
 80106a2:	6c57      	mov      	r1, r5
 80106a4:	e00004ae 	bsr      	0x8011000	// 8011000 <__subdf3>
 80106a8:	e0000702 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 80106ac:	ea238000 	movih      	r3, 32768
 80106b0:	600c      	addu      	r0, r3
 80106b2:	1492      	pop      	r4-r5, r15

080106b4 <__udivdi3>:
 80106b4:	14c5      	push      	r4-r8
 80106b6:	6f4b      	mov      	r13, r2
 80106b8:	6d4f      	mov      	r5, r3
 80106ba:	6d03      	mov      	r4, r0
 80106bc:	6f07      	mov      	r12, r1
 80106be:	e9230054 	bnez      	r3, 0x8010766	// 8010766 <__udivdi3+0xb2>
 80106c2:	6484      	cmphs      	r1, r2
 80106c4:	0870      	bt      	0x80107a4	// 80107a4 <__udivdi3+0xf0>
 80106c6:	eb02ffff 	cmphsi      	r2, 65536
 80106ca:	0cc4      	bf      	0x8010852	// 8010852 <__udivdi3+0x19e>
 80106cc:	c6e05023 	bmaski      	r3, 24
 80106d0:	648c      	cmphs      	r3, r2
 80106d2:	3518      	movi      	r5, 24
 80106d4:	3310      	movi      	r3, 16
 80106d6:	c4a30c40 	inct      	r5, r3, 0
 80106da:	01dc      	lrw      	r6, 0x8014924	// 80109e4 <__udivdi3+0x330>
 80106dc:	c4a24043 	lsr      	r3, r2, r5
 80106e0:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 80106e4:	614c      	addu      	r5, r3
 80106e6:	3320      	movi      	r3, 32
 80106e8:	60d6      	subu      	r3, r5
 80106ea:	e903000c 	bez      	r3, 0x8010702	// 8010702 <__udivdi3+0x4e>
 80106ee:	c462402d 	lsl      	r13, r2, r3
 80106f2:	c4a04045 	lsr      	r5, r0, r5
 80106f6:	c4614022 	lsl      	r2, r1, r3
 80106fa:	c445242c 	or      	r12, r5, r2
 80106fe:	c4604024 	lsl      	r4, r0, r3
 8010702:	c60d4841 	lsri      	r1, r13, 16
 8010706:	c42c8022 	divu      	r2, r12, r1
 801070a:	c4228423 	mult      	r3, r2, r1
 801070e:	630e      	subu      	r12, r3
 8010710:	c60c4823 	lsli      	r3, r12, 16
 8010714:	c40d55e5 	zext      	r5, r13, 15, 0
 8010718:	c604484c 	lsri      	r12, r4, 16
 801071c:	c4458420 	mult      	r0, r5, r2
 8010720:	6f0c      	or      	r12, r3
 8010722:	6430      	cmphs      	r12, r0
 8010724:	0808      	bt      	0x8010734	// 8010734 <__udivdi3+0x80>
 8010726:	6334      	addu      	r12, r13
 8010728:	6770      	cmphs      	r12, r13
 801072a:	5a63      	subi      	r3, r2, 1
 801072c:	0c03      	bf      	0x8010732	// 8010732 <__udivdi3+0x7e>
 801072e:	6430      	cmphs      	r12, r0
 8010730:	0d56      	bf      	0x80109dc	// 80109dc <__udivdi3+0x328>
 8010732:	6c8f      	mov      	r2, r3
 8010734:	6302      	subu      	r12, r0
 8010736:	c42c8020 	divu      	r0, r12, r1
 801073a:	7c40      	mult      	r1, r0
 801073c:	6306      	subu      	r12, r1
 801073e:	c60c482c 	lsli      	r12, r12, 16
 8010742:	c40455e4 	zext      	r4, r4, 15, 0
 8010746:	7d40      	mult      	r5, r0
 8010748:	6d30      	or      	r4, r12
 801074a:	6550      	cmphs      	r4, r5
 801074c:	6c43      	mov      	r1, r0
 801074e:	0808      	bt      	0x801075e	// 801075e <__udivdi3+0xaa>
 8010750:	6134      	addu      	r4, r13
 8010752:	6750      	cmphs      	r4, r13
 8010754:	5863      	subi      	r3, r0, 1
 8010756:	0d21      	bf      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 8010758:	6550      	cmphs      	r4, r5
 801075a:	091f      	bt      	0x8010998	// 8010998 <__udivdi3+0x2e4>
 801075c:	2901      	subi      	r1, 2
 801075e:	4210      	lsli      	r0, r2, 16
 8010760:	6c04      	or      	r0, r1
 8010762:	3100      	movi      	r1, 0
 8010764:	1485      	pop      	r4-r8
 8010766:	64c4      	cmphs      	r1, r3
 8010768:	0c6b      	bf      	0x801083e	// 801083e <__udivdi3+0x18a>
 801076a:	eb03ffff 	cmphsi      	r3, 65536
 801076e:	0c6b      	bf      	0x8010844	// 8010844 <__udivdi3+0x190>
 8010770:	c6e0502c 	bmaski      	r12, 24
 8010774:	64f0      	cmphs      	r12, r3
 8010776:	ea0d0018 	movi      	r13, 24
 801077a:	ea0c0010 	movi      	r12, 16
 801077e:	c58d0c20 	incf      	r12, r13, 0
 8010782:	0386      	lrw      	r4, 0x8014924	// 80109e4 <__udivdi3+0x330>
 8010784:	c583404d 	lsr      	r13, r3, r12
 8010788:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 801078c:	6370      	addu      	r13, r12
 801078e:	3520      	movi      	r5, 32
 8010790:	6176      	subu      	r5, r13
 8010792:	e925006c 	bnez      	r5, 0x801086a	// 801086a <__udivdi3+0x1b6>
 8010796:	644c      	cmphs      	r3, r1
 8010798:	0d0d      	bf      	0x80109b2	// 80109b2 <__udivdi3+0x2fe>
 801079a:	6480      	cmphs      	r0, r2
 801079c:	c4000500 	mvc      	r0
 80107a0:	6c57      	mov      	r1, r5
 80107a2:	1485      	pop      	r4-r8
 80107a4:	e9220006 	bnez      	r2, 0x80107b0	// 80107b0 <__udivdi3+0xfc>
 80107a8:	ea0d0001 	movi      	r13, 1
 80107ac:	c44d802d 	divu      	r13, r13, r2
 80107b0:	eb0dffff 	cmphsi      	r13, 65536
 80107b4:	0c55      	bf      	0x801085e	// 801085e <__udivdi3+0x1aa>
 80107b6:	c6e05023 	bmaski      	r3, 24
 80107ba:	674c      	cmphs      	r3, r13
 80107bc:	3518      	movi      	r5, 24
 80107be:	3310      	movi      	r3, 16
 80107c0:	c4a30c40 	inct      	r5, r3, 0
 80107c4:	0357      	lrw      	r2, 0x8014924	// 80109e4 <__udivdi3+0x330>
 80107c6:	c4ad4043 	lsr      	r3, r13, r5
 80107ca:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 80107ce:	614c      	addu      	r5, r3
 80107d0:	3620      	movi      	r6, 32
 80107d2:	6196      	subu      	r6, r5
 80107d4:	e926009f 	bnez      	r6, 0x8010912	// 8010912 <__udivdi3+0x25e>
 80107d8:	c5a10082 	subu      	r2, r1, r13
 80107dc:	c60d4846 	lsri      	r6, r13, 16
 80107e0:	c40d55e5 	zext      	r5, r13, 15, 0
 80107e4:	3101      	movi      	r1, 1
 80107e6:	c4c2802c 	divu      	r12, r2, r6
 80107ea:	c4cc8423 	mult      	r3, r12, r6
 80107ee:	608e      	subu      	r2, r3
 80107f0:	4250      	lsli      	r2, r2, 16
 80107f2:	4c70      	lsri      	r3, r4, 16
 80107f4:	c4ac8420 	mult      	r0, r12, r5
 80107f8:	6cc8      	or      	r3, r2
 80107fa:	640c      	cmphs      	r3, r0
 80107fc:	0809      	bt      	0x801080e	// 801080e <__udivdi3+0x15a>
 80107fe:	60f4      	addu      	r3, r13
 8010800:	674c      	cmphs      	r3, r13
 8010802:	e44c1000 	subi      	r2, r12, 1
 8010806:	0c03      	bf      	0x801080c	// 801080c <__udivdi3+0x158>
 8010808:	640c      	cmphs      	r3, r0
 801080a:	0ce5      	bf      	0x80109d4	// 80109d4 <__udivdi3+0x320>
 801080c:	6f0b      	mov      	r12, r2
 801080e:	60c2      	subu      	r3, r0
 8010810:	c4c38020 	divu      	r0, r3, r6
 8010814:	7d80      	mult      	r6, r0
 8010816:	60da      	subu      	r3, r6
 8010818:	4370      	lsli      	r3, r3, 16
 801081a:	c40455e4 	zext      	r4, r4, 15, 0
 801081e:	7d40      	mult      	r5, r0
 8010820:	6cd0      	or      	r3, r4
 8010822:	654c      	cmphs      	r3, r5
 8010824:	6c83      	mov      	r2, r0
 8010826:	0808      	bt      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010828:	60f4      	addu      	r3, r13
 801082a:	674c      	cmphs      	r3, r13
 801082c:	2800      	subi      	r0, 1
 801082e:	0cb3      	bf      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010830:	654c      	cmphs      	r3, r5
 8010832:	08b1      	bt      	0x8010994	// 8010994 <__udivdi3+0x2e0>
 8010834:	2a01      	subi      	r2, 2
 8010836:	c60c4820 	lsli      	r0, r12, 16
 801083a:	6c08      	or      	r0, r2
 801083c:	1485      	pop      	r4-r8
 801083e:	3100      	movi      	r1, 0
 8010840:	6c07      	mov      	r0, r1
 8010842:	1485      	pop      	r4-r8
 8010844:	eb0300ff 	cmphsi      	r3, 256
 8010848:	c400050d 	mvc      	r13
 801084c:	c46d482c 	lsli      	r12, r13, 3
 8010850:	0799      	br      	0x8010782	// 8010782 <__udivdi3+0xce>
 8010852:	eb0200ff 	cmphsi      	r2, 256
 8010856:	3308      	movi      	r3, 8
 8010858:	c4a30c40 	inct      	r5, r3, 0
 801085c:	073f      	br      	0x80106da	// 80106da <__udivdi3+0x26>
 801085e:	eb0d00ff 	cmphsi      	r13, 256
 8010862:	3308      	movi      	r3, 8
 8010864:	c4a30c40 	inct      	r5, r3, 0
 8010868:	07ae      	br      	0x80107c4	// 80107c4 <__udivdi3+0x110>
 801086a:	c5a24046 	lsr      	r6, r2, r13
 801086e:	70d4      	lsl      	r3, r5
 8010870:	6d8c      	or      	r6, r3
 8010872:	c5a14044 	lsr      	r4, r1, r13
 8010876:	4ef0      	lsri      	r7, r6, 16
 8010878:	c4e48023 	divu      	r3, r4, r7
 801087c:	c4a1402c 	lsl      	r12, r1, r5
 8010880:	c5a04041 	lsr      	r1, r0, r13
 8010884:	c4e3842d 	mult      	r13, r3, r7
 8010888:	6c70      	or      	r1, r12
 801088a:	6136      	subu      	r4, r13
 801088c:	c40655ec 	zext      	r12, r6, 15, 0
 8010890:	4490      	lsli      	r4, r4, 16
 8010892:	c601484d 	lsri      	r13, r1, 16
 8010896:	c46c8428 	mult      	r8, r12, r3
 801089a:	6f50      	or      	r13, r4
 801089c:	6634      	cmphs      	r13, r8
 801089e:	7094      	lsl      	r2, r5
 80108a0:	0806      	bt      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80108a2:	6358      	addu      	r13, r6
 80108a4:	65b4      	cmphs      	r13, r6
 80108a6:	5b83      	subi      	r4, r3, 1
 80108a8:	088d      	bt      	0x80109c2	// 80109c2 <__udivdi3+0x30e>
 80108aa:	6cd3      	mov      	r3, r4
 80108ac:	6362      	subu      	r13, r8
 80108ae:	c4ed8024 	divu      	r4, r13, r7
 80108b2:	7dd0      	mult      	r7, r4
 80108b4:	635e      	subu      	r13, r7
 80108b6:	c60d482d 	lsli      	r13, r13, 16
 80108ba:	c48c8427 	mult      	r7, r12, r4
 80108be:	c40155ec 	zext      	r12, r1, 15, 0
 80108c2:	6f34      	or      	r12, r13
 80108c4:	65f0      	cmphs      	r12, r7
 80108c6:	0806      	bt      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80108c8:	6318      	addu      	r12, r6
 80108ca:	65b0      	cmphs      	r12, r6
 80108cc:	5c23      	subi      	r1, r4, 1
 80108ce:	0875      	bt      	0x80109b8	// 80109b8 <__udivdi3+0x304>
 80108d0:	6d07      	mov      	r4, r1
 80108d2:	4370      	lsli      	r3, r3, 16
 80108d4:	6cd0      	or      	r3, r4
 80108d6:	c40355e1 	zext      	r1, r3, 15, 0
 80108da:	c40255e4 	zext      	r4, r2, 15, 0
 80108de:	c603484d 	lsri      	r13, r3, 16
 80108e2:	4a50      	lsri      	r2, r2, 16
 80108e4:	c4818426 	mult      	r6, r1, r4
 80108e8:	7d34      	mult      	r4, r13
 80108ea:	7c48      	mult      	r1, r2
 80108ec:	7f48      	mult      	r13, r2
 80108ee:	6050      	addu      	r1, r4
 80108f0:	4e50      	lsri      	r2, r6, 16
 80108f2:	6084      	addu      	r2, r1
 80108f4:	6508      	cmphs      	r2, r4
 80108f6:	631e      	subu      	r12, r7
 80108f8:	0804      	bt      	0x8010900	// 8010900 <__udivdi3+0x24c>
 80108fa:	ea210001 	movih      	r1, 1
 80108fe:	6344      	addu      	r13, r1
 8010900:	4a30      	lsri      	r1, r2, 16
 8010902:	6344      	addu      	r13, r1
 8010904:	6770      	cmphs      	r12, r13
 8010906:	0c53      	bf      	0x80109ac	// 80109ac <__udivdi3+0x2f8>
 8010908:	6772      	cmpne      	r12, r13
 801090a:	0c49      	bf      	0x801099c	// 801099c <__udivdi3+0x2e8>
 801090c:	6c0f      	mov      	r0, r3
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	7358      	lsl      	r13, r6
 8010914:	c4a1404c 	lsr      	r12, r1, r5
 8010918:	c4c14022 	lsl      	r2, r1, r6
 801091c:	c4c04024 	lsl      	r4, r0, r6
 8010920:	c60d4846 	lsri      	r6, r13, 16
 8010924:	c4a04045 	lsr      	r5, r0, r5
 8010928:	c4cc8020 	divu      	r0, r12, r6
 801092c:	c4c08421 	mult      	r1, r0, r6
 8010930:	c4452423 	or      	r3, r5, r2
 8010934:	6306      	subu      	r12, r1
 8010936:	c40d55e5 	zext      	r5, r13, 15, 0
 801093a:	c60c482c 	lsli      	r12, r12, 16
 801093e:	4b30      	lsri      	r1, r3, 16
 8010940:	c4058422 	mult      	r2, r5, r0
 8010944:	6c70      	or      	r1, r12
 8010946:	6484      	cmphs      	r1, r2
 8010948:	080a      	bt      	0x801095c	// 801095c <__udivdi3+0x2a8>
 801094a:	6074      	addu      	r1, r13
 801094c:	6744      	cmphs      	r1, r13
 801094e:	e5801000 	subi      	r12, r0, 1
 8010952:	0c3f      	bf      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010954:	6484      	cmphs      	r1, r2
 8010956:	083d      	bt      	0x80109d0	// 80109d0 <__udivdi3+0x31c>
 8010958:	2801      	subi      	r0, 2
 801095a:	6074      	addu      	r1, r13
 801095c:	604a      	subu      	r1, r2
 801095e:	c4c1802c 	divu      	r12, r1, r6
 8010962:	c4cc8422 	mult      	r2, r12, r6
 8010966:	5949      	subu      	r2, r1, r2
 8010968:	4250      	lsli      	r2, r2, 16
 801096a:	c40355e3 	zext      	r3, r3, 15, 0
 801096e:	c5858421 	mult      	r1, r5, r12
 8010972:	6c8c      	or      	r2, r3
 8010974:	6448      	cmphs      	r2, r1
 8010976:	080b      	bt      	0x801098c	// 801098c <__udivdi3+0x2d8>
 8010978:	60b4      	addu      	r2, r13
 801097a:	6748      	cmphs      	r2, r13
 801097c:	e46c1000 	subi      	r3, r12, 1
 8010980:	0c26      	bf      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010982:	6448      	cmphs      	r2, r1
 8010984:	0824      	bt      	0x80109cc	// 80109cc <__udivdi3+0x318>
 8010986:	e58c1001 	subi      	r12, r12, 2
 801098a:	60b4      	addu      	r2, r13
 801098c:	6086      	subu      	r2, r1
 801098e:	4030      	lsli      	r1, r0, 16
 8010990:	6c70      	or      	r1, r12
 8010992:	072a      	br      	0x80107e6	// 80107e6 <__udivdi3+0x132>
 8010994:	6c83      	mov      	r2, r0
 8010996:	0750      	br      	0x8010836	// 8010836 <__udivdi3+0x182>
 8010998:	6c4f      	mov      	r1, r3
 801099a:	06e2      	br      	0x801075e	// 801075e <__udivdi3+0xaa>
 801099c:	4250      	lsli      	r2, r2, 16
 801099e:	c40655e6 	zext      	r6, r6, 15, 0
 80109a2:	c4a04021 	lsl      	r1, r0, r5
 80109a6:	6098      	addu      	r2, r6
 80109a8:	6484      	cmphs      	r1, r2
 80109aa:	0bb1      	bt      	0x801090c	// 801090c <__udivdi3+0x258>
 80109ac:	5b03      	subi      	r0, r3, 1
 80109ae:	3100      	movi      	r1, 0
 80109b0:	1485      	pop      	r4-r8
 80109b2:	6c57      	mov      	r1, r5
 80109b4:	3001      	movi      	r0, 1
 80109b6:	1485      	pop      	r4-r8
 80109b8:	65f0      	cmphs      	r12, r7
 80109ba:	0b8b      	bt      	0x80108d0	// 80108d0 <__udivdi3+0x21c>
 80109bc:	2c01      	subi      	r4, 2
 80109be:	6318      	addu      	r12, r6
 80109c0:	0789      	br      	0x80108d2	// 80108d2 <__udivdi3+0x21e>
 80109c2:	6634      	cmphs      	r13, r8
 80109c4:	0b73      	bt      	0x80108aa	// 80108aa <__udivdi3+0x1f6>
 80109c6:	2b01      	subi      	r3, 2
 80109c8:	6358      	addu      	r13, r6
 80109ca:	0771      	br      	0x80108ac	// 80108ac <__udivdi3+0x1f8>
 80109cc:	6f0f      	mov      	r12, r3
 80109ce:	07df      	br      	0x801098c	// 801098c <__udivdi3+0x2d8>
 80109d0:	6c33      	mov      	r0, r12
 80109d2:	07c5      	br      	0x801095c	// 801095c <__udivdi3+0x2a8>
 80109d4:	e58c1001 	subi      	r12, r12, 2
 80109d8:	60f4      	addu      	r3, r13
 80109da:	071a      	br      	0x801080e	// 801080e <__udivdi3+0x15a>
 80109dc:	2a01      	subi      	r2, 2
 80109de:	6334      	addu      	r12, r13
 80109e0:	06aa      	br      	0x8010734	// 8010734 <__udivdi3+0x80>
 80109e2:	0000      	.short	0x0000
 80109e4:	08014924 	.long	0x08014924

080109e8 <__umoddi3>:
 80109e8:	14c6      	push      	r4-r9
 80109ea:	6d4b      	mov      	r5, r2
 80109ec:	6f4f      	mov      	r13, r3
 80109ee:	6d83      	mov      	r6, r0
 80109f0:	6f07      	mov      	r12, r1
 80109f2:	e923004a 	bnez      	r3, 0x8010a86	// 8010a86 <__umoddi3+0x9e>
 80109f6:	6484      	cmphs      	r1, r2
 80109f8:	086b      	bt      	0x8010ace	// 8010ace <__umoddi3+0xe6>
 80109fa:	eb02ffff 	cmphsi      	r2, 65536
 80109fe:	0cc0      	bf      	0x8010b7e	// 8010b7e <__umoddi3+0x196>
 8010a00:	c6e05023 	bmaski      	r3, 24
 8010a04:	648c      	cmphs      	r3, r2
 8010a06:	ea0d0018 	movi      	r13, 24
 8010a0a:	3310      	movi      	r3, 16
 8010a0c:	c5a30c40 	inct      	r13, r3, 0
 8010a10:	0281      	lrw      	r4, 0x8014924	// 8010d08 <__umoddi3+0x320>
 8010a12:	c5a24043 	lsr      	r3, r2, r13
 8010a16:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a1a:	634c      	addu      	r13, r3
 8010a1c:	3420      	movi      	r4, 32
 8010a1e:	6136      	subu      	r4, r13
 8010a20:	e904000b 	bez      	r4, 0x8010a36	// 8010a36 <__umoddi3+0x4e>
 8010a24:	7050      	lsl      	r1, r4
 8010a26:	c5a0404d 	lsr      	r13, r0, r13
 8010a2a:	c4824025 	lsl      	r5, r2, r4
 8010a2e:	c42d242c 	or      	r12, r13, r1
 8010a32:	c4804026 	lsl      	r6, r0, r4
 8010a36:	c605484d 	lsri      	r13, r5, 16
 8010a3a:	c5ac8021 	divu      	r1, r12, r13
 8010a3e:	c5a18422 	mult      	r2, r1, r13
 8010a42:	c40555e0 	zext      	r0, r5, 15, 0
 8010a46:	c44c0082 	subu      	r2, r12, r2
 8010a4a:	c4208423 	mult      	r3, r0, r1
 8010a4e:	4250      	lsli      	r2, r2, 16
 8010a50:	4e30      	lsri      	r1, r6, 16
 8010a52:	6c48      	or      	r1, r2
 8010a54:	64c4      	cmphs      	r1, r3
 8010a56:	0808      	bt      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a58:	6054      	addu      	r1, r5
 8010a5a:	6544      	cmphs      	r1, r5
 8010a5c:	0c05      	bf      	0x8010a66	// 8010a66 <__umoddi3+0x7e>
 8010a5e:	5954      	addu      	r2, r1, r5
 8010a60:	64c4      	cmphs      	r1, r3
 8010a62:	c4220c20 	incf      	r1, r2, 0
 8010a66:	604e      	subu      	r1, r3
 8010a68:	c5a18023 	divu      	r3, r1, r13
 8010a6c:	7f4c      	mult      	r13, r3
 8010a6e:	6076      	subu      	r1, r13
 8010a70:	7c0c      	mult      	r0, r3
 8010a72:	4130      	lsli      	r1, r1, 16
 8010a74:	c40655e3 	zext      	r3, r6, 15, 0
 8010a78:	6cc4      	or      	r3, r1
 8010a7a:	640c      	cmphs      	r3, r0
 8010a7c:	0c69      	bf      	0x8010b4e	// 8010b4e <__umoddi3+0x166>
 8010a7e:	5b01      	subu      	r0, r3, r0
 8010a80:	7011      	lsr      	r0, r4
 8010a82:	3100      	movi      	r1, 0
 8010a84:	1486      	pop      	r4-r9
 8010a86:	64c4      	cmphs      	r1, r3
 8010a88:	0ffe      	bf      	0x8010a84	// 8010a84 <__umoddi3+0x9c>
 8010a8a:	eb03ffff 	cmphsi      	r3, 65536
 8010a8e:	0c6b      	bf      	0x8010b64	// 8010b64 <__umoddi3+0x17c>
 8010a90:	c6e0502d 	bmaski      	r13, 24
 8010a94:	64f4      	cmphs      	r13, r3
 8010a96:	3518      	movi      	r5, 24
 8010a98:	ea0d0010 	movi      	r13, 16
 8010a9c:	c5a50c20 	incf      	r13, r5, 0
 8010aa0:	03a5      	lrw      	r5, 0x8014924	// 8010d08 <__umoddi3+0x320>
 8010aa2:	c5a34044 	lsr      	r4, r3, r13
 8010aa6:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010aaa:	6174      	addu      	r5, r13
 8010aac:	3420      	movi      	r4, 32
 8010aae:	6116      	subu      	r4, r5
 8010ab0:	e924006d 	bnez      	r4, 0x8010b8a	// 8010b8a <__umoddi3+0x1a2>
 8010ab4:	644c      	cmphs      	r3, r1
 8010ab6:	0c03      	bf      	0x8010abc	// 8010abc <__umoddi3+0xd4>
 8010ab8:	6480      	cmphs      	r0, r2
 8010aba:	0d20      	bf      	0x8010cfa	// 8010cfa <__umoddi3+0x312>
 8010abc:	5889      	subu      	r4, r0, r2
 8010abe:	6500      	cmphs      	r0, r4
 8010ac0:	c461008c 	subu      	r12, r1, r3
 8010ac4:	6443      	mvcv      	r1
 8010ac6:	6306      	subu      	r12, r1
 8010ac8:	6c13      	mov      	r0, r4
 8010aca:	6c73      	mov      	r1, r12
 8010acc:	1486      	pop      	r4-r9
 8010ace:	e9220005 	bnez      	r2, 0x8010ad8	// 8010ad8 <__umoddi3+0xf0>
 8010ad2:	3501      	movi      	r5, 1
 8010ad4:	c4458025 	divu      	r5, r5, r2
 8010ad8:	eb05ffff 	cmphsi      	r5, 65536
 8010adc:	0c4b      	bf      	0x8010b72	// 8010b72 <__umoddi3+0x18a>
 8010ade:	c6e05023 	bmaski      	r3, 24
 8010ae2:	654c      	cmphs      	r3, r5
 8010ae4:	ea0d0018 	movi      	r13, 24
 8010ae8:	3310      	movi      	r3, 16
 8010aea:	c5a30c40 	inct      	r13, r3, 0
 8010aee:	0358      	lrw      	r2, 0x8014924	// 8010d08 <__umoddi3+0x320>
 8010af0:	c5a54043 	lsr      	r3, r5, r13
 8010af4:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010af8:	634c      	addu      	r13, r3
 8010afa:	3420      	movi      	r4, 32
 8010afc:	6136      	subu      	r4, r13
 8010afe:	e92400af 	bnez      	r4, 0x8010c5c	// 8010c5c <__umoddi3+0x274>
 8010b02:	c4a1008c 	subu      	r12, r1, r5
 8010b06:	4df0      	lsri      	r7, r5, 16
 8010b08:	c40555e2 	zext      	r2, r5, 15, 0
 8010b0c:	c4ec8021 	divu      	r1, r12, r7
 8010b10:	c4e18423 	mult      	r3, r1, r7
 8010b14:	630e      	subu      	r12, r3
 8010b16:	c60c482c 	lsli      	r12, r12, 16
 8010b1a:	c4418423 	mult      	r3, r1, r2
 8010b1e:	4e30      	lsri      	r1, r6, 16
 8010b20:	6c70      	or      	r1, r12
 8010b22:	64c4      	cmphs      	r1, r3
 8010b24:	0808      	bt      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b26:	6054      	addu      	r1, r5
 8010b28:	6544      	cmphs      	r1, r5
 8010b2a:	0c05      	bf      	0x8010b34	// 8010b34 <__umoddi3+0x14c>
 8010b2c:	5914      	addu      	r0, r1, r5
 8010b2e:	64c4      	cmphs      	r1, r3
 8010b30:	c4200c20 	incf      	r1, r0, 0
 8010b34:	604e      	subu      	r1, r3
 8010b36:	c4e18020 	divu      	r0, r1, r7
 8010b3a:	7dc0      	mult      	r7, r0
 8010b3c:	605e      	subu      	r1, r7
 8010b3e:	4130      	lsli      	r1, r1, 16
 8010b40:	c40655e6 	zext      	r6, r6, 15, 0
 8010b44:	7c08      	mult      	r0, r2
 8010b46:	c4c12423 	or      	r3, r1, r6
 8010b4a:	640c      	cmphs      	r3, r0
 8010b4c:	0808      	bt      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b4e:	60d4      	addu      	r3, r5
 8010b50:	654c      	cmphs      	r3, r5
 8010b52:	0c05      	bf      	0x8010b5c	// 8010b5c <__umoddi3+0x174>
 8010b54:	614c      	addu      	r5, r3
 8010b56:	640c      	cmphs      	r3, r0
 8010b58:	c4650c20 	incf      	r3, r5, 0
 8010b5c:	5b01      	subu      	r0, r3, r0
 8010b5e:	7011      	lsr      	r0, r4
 8010b60:	3100      	movi      	r1, 0
 8010b62:	1486      	pop      	r4-r9
 8010b64:	eb0300ff 	cmphsi      	r3, 256
 8010b68:	c4000505 	mvc      	r5
 8010b6c:	c465482d 	lsli      	r13, r5, 3
 8010b70:	0798      	br      	0x8010aa0	// 8010aa0 <__umoddi3+0xb8>
 8010b72:	eb0500ff 	cmphsi      	r5, 256
 8010b76:	3308      	movi      	r3, 8
 8010b78:	c5a30c40 	inct      	r13, r3, 0
 8010b7c:	07b9      	br      	0x8010aee	// 8010aee <__umoddi3+0x106>
 8010b7e:	eb0200ff 	cmphsi      	r2, 256
 8010b82:	3308      	movi      	r3, 8
 8010b84:	c5a30c40 	inct      	r13, r3, 0
 8010b88:	0744      	br      	0x8010a10	// 8010a10 <__umoddi3+0x28>
 8010b8a:	70d0      	lsl      	r3, r4
 8010b8c:	c4a24047 	lsr      	r7, r2, r5
 8010b90:	6dcc      	or      	r7, r3
 8010b92:	c4a14046 	lsr      	r6, r1, r5
 8010b96:	c481402c 	lsl      	r12, r1, r4
 8010b9a:	c4a04041 	lsr      	r1, r0, r5
 8010b9e:	6c70      	or      	r1, r12
 8010ba0:	c607484c 	lsri      	r12, r7, 16
 8010ba4:	c5868028 	divu      	r8, r6, r12
 8010ba8:	c4824023 	lsl      	r3, r2, r4
 8010bac:	c5888422 	mult      	r2, r8, r12
 8010bb0:	618a      	subu      	r6, r2
 8010bb2:	c40755ed 	zext      	r13, r7, 15, 0
 8010bb6:	46d0      	lsli      	r6, r6, 16
 8010bb8:	4950      	lsri      	r2, r1, 16
 8010bba:	c50d8429 	mult      	r9, r13, r8
 8010bbe:	6c98      	or      	r2, r6
 8010bc0:	6648      	cmphs      	r2, r9
 8010bc2:	7010      	lsl      	r0, r4
 8010bc4:	0807      	bt      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010bc6:	609c      	addu      	r2, r7
 8010bc8:	65c8      	cmphs      	r2, r7
 8010bca:	e4c81000 	subi      	r6, r8, 1
 8010bce:	088a      	bt      	0x8010ce2	// 8010ce2 <__umoddi3+0x2fa>
 8010bd0:	6e1b      	mov      	r8, r6
 8010bd2:	60a6      	subu      	r2, r9
 8010bd4:	c5828026 	divu      	r6, r2, r12
 8010bd8:	7f18      	mult      	r12, r6
 8010bda:	60b2      	subu      	r2, r12
 8010bdc:	4250      	lsli      	r2, r2, 16
 8010bde:	c40155e1 	zext      	r1, r1, 15, 0
 8010be2:	7f58      	mult      	r13, r6
 8010be4:	6c48      	or      	r1, r2
 8010be6:	6744      	cmphs      	r1, r13
 8010be8:	0806      	bt      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010bea:	605c      	addu      	r1, r7
 8010bec:	65c4      	cmphs      	r1, r7
 8010bee:	5e43      	subi      	r2, r6, 1
 8010bf0:	0874      	bt      	0x8010cd8	// 8010cd8 <__umoddi3+0x2f0>
 8010bf2:	6d8b      	mov      	r6, r2
 8010bf4:	c6084822 	lsli      	r2, r8, 16
 8010bf8:	6c98      	or      	r2, r6
 8010bfa:	c40255e8 	zext      	r8, r2, 15, 0
 8010bfe:	c603484c 	lsri      	r12, r3, 16
 8010c02:	4a50      	lsri      	r2, r2, 16
 8010c04:	c5a1008d 	subu      	r13, r1, r13
 8010c08:	c40355e1 	zext      	r1, r3, 15, 0
 8010c0c:	c4288426 	mult      	r6, r8, r1
 8010c10:	7c48      	mult      	r1, r2
 8010c12:	7e30      	mult      	r8, r12
 8010c14:	7cb0      	mult      	r2, r12
 8010c16:	6204      	addu      	r8, r1
 8010c18:	c606484c 	lsri      	r12, r6, 16
 8010c1c:	6320      	addu      	r12, r8
 8010c1e:	6470      	cmphs      	r12, r1
 8010c20:	0804      	bt      	0x8010c28	// 8010c28 <__umoddi3+0x240>
 8010c22:	ea210001 	movih      	r1, 1
 8010c26:	6084      	addu      	r2, r1
 8010c28:	c60c4841 	lsri      	r1, r12, 16
 8010c2c:	6048      	addu      	r1, r2
 8010c2e:	6474      	cmphs      	r13, r1
 8010c30:	c60c482c 	lsli      	r12, r12, 16
 8010c34:	c40655e6 	zext      	r6, r6, 15, 0
 8010c38:	6318      	addu      	r12, r6
 8010c3a:	0c46      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010c3c:	6476      	cmpne      	r13, r1
 8010c3e:	0c60      	bf      	0x8010cfe	// 8010cfe <__umoddi3+0x316>
 8010c40:	c42d0081 	subu      	r1, r13, r1
 8010c44:	6cf3      	mov      	r3, r12
 8010c46:	586d      	subu      	r3, r0, r3
 8010c48:	64c0      	cmphs      	r0, r3
 8010c4a:	6743      	mvcv      	r13
 8010c4c:	6076      	subu      	r1, r13
 8010c4e:	c4a14025 	lsl      	r5, r1, r5
 8010c52:	c4834040 	lsr      	r0, r3, r4
 8010c56:	6c14      	or      	r0, r5
 8010c58:	7051      	lsr      	r1, r4
 8010c5a:	1486      	pop      	r4-r9
 8010c5c:	7150      	lsl      	r5, r4
 8010c5e:	c5a14048 	lsr      	r8, r1, r13
 8010c62:	4df0      	lsri      	r7, r5, 16
 8010c64:	c5a0404d 	lsr      	r13, r0, r13
 8010c68:	7050      	lsl      	r1, r4
 8010c6a:	6c74      	or      	r1, r13
 8010c6c:	c4e8802d 	divu      	r13, r8, r7
 8010c70:	c4ed8423 	mult      	r3, r13, r7
 8010c74:	c40555e2 	zext      	r2, r5, 15, 0
 8010c78:	620e      	subu      	r8, r3
 8010c7a:	c5a2842c 	mult      	r12, r2, r13
 8010c7e:	c6084828 	lsli      	r8, r8, 16
 8010c82:	c601484d 	lsri      	r13, r1, 16
 8010c86:	6f60      	or      	r13, r8
 8010c88:	6734      	cmphs      	r13, r12
 8010c8a:	c4804026 	lsl      	r6, r0, r4
 8010c8e:	0804      	bt      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010c90:	6354      	addu      	r13, r5
 8010c92:	6574      	cmphs      	r13, r5
 8010c94:	082d      	bt      	0x8010cee	// 8010cee <__umoddi3+0x306>
 8010c96:	6372      	subu      	r13, r12
 8010c98:	c4ed8023 	divu      	r3, r13, r7
 8010c9c:	c4e3842c 	mult      	r12, r3, r7
 8010ca0:	6372      	subu      	r13, r12
 8010ca2:	c60d482c 	lsli      	r12, r13, 16
 8010ca6:	c40155e1 	zext      	r1, r1, 15, 0
 8010caa:	7cc8      	mult      	r3, r2
 8010cac:	6f04      	or      	r12, r1
 8010cae:	64f0      	cmphs      	r12, r3
 8010cb0:	0809      	bt      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb2:	6314      	addu      	r12, r5
 8010cb4:	6570      	cmphs      	r12, r5
 8010cb6:	0c06      	bf      	0x8010cc2	// 8010cc2 <__umoddi3+0x2da>
 8010cb8:	c4ac0021 	addu      	r1, r12, r5
 8010cbc:	64f0      	cmphs      	r12, r3
 8010cbe:	c5810c20 	incf      	r12, r1, 0
 8010cc2:	630e      	subu      	r12, r3
 8010cc4:	0724      	br      	0x8010b0c	// 8010b0c <__umoddi3+0x124>
 8010cc6:	c46c0083 	subu      	r3, r12, r3
 8010cca:	64f0      	cmphs      	r12, r3
 8010ccc:	605e      	subu      	r1, r7
 8010cce:	65c3      	mvcv      	r7
 8010cd0:	605e      	subu      	r1, r7
 8010cd2:	c42d0081 	subu      	r1, r13, r1
 8010cd6:	07b8      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010cd8:	6744      	cmphs      	r1, r13
 8010cda:	0b8c      	bt      	0x8010bf2	// 8010bf2 <__umoddi3+0x20a>
 8010cdc:	2e01      	subi      	r6, 2
 8010cde:	605c      	addu      	r1, r7
 8010ce0:	078a      	br      	0x8010bf4	// 8010bf4 <__umoddi3+0x20c>
 8010ce2:	6648      	cmphs      	r2, r9
 8010ce4:	0b76      	bt      	0x8010bd0	// 8010bd0 <__umoddi3+0x1e8>
 8010ce6:	e5081001 	subi      	r8, r8, 2
 8010cea:	609c      	addu      	r2, r7
 8010cec:	0773      	br      	0x8010bd2	// 8010bd2 <__umoddi3+0x1ea>
 8010cee:	c4ad0023 	addu      	r3, r13, r5
 8010cf2:	6734      	cmphs      	r13, r12
 8010cf4:	c5a30c20 	incf      	r13, r3, 0
 8010cf8:	07cf      	br      	0x8010c96	// 8010c96 <__umoddi3+0x2ae>
 8010cfa:	6d03      	mov      	r4, r0
 8010cfc:	06e6      	br      	0x8010ac8	// 8010ac8 <__umoddi3+0xe0>
 8010cfe:	6700      	cmphs      	r0, r12
 8010d00:	0fe3      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2de>
 8010d02:	6cf3      	mov      	r3, r12
 8010d04:	3100      	movi      	r1, 0
 8010d06:	07a0      	br      	0x8010c46	// 8010c46 <__umoddi3+0x25e>
 8010d08:	08014924 	.long	0x08014924

08010d0c <_fpadd_parts>:
 8010d0c:	14c8      	push      	r4-r11
 8010d0e:	1423      	subi      	r14, r14, 12
 8010d10:	9060      	ld.w      	r3, (r0, 0x0)
 8010d12:	3501      	movi      	r5, 1
 8010d14:	64d4      	cmphs      	r5, r3
 8010d16:	0871      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010d18:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d1c:	6714      	cmphs      	r5, r12
 8010d1e:	086f      	bt      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d20:	3b44      	cmpnei      	r3, 4
 8010d22:	0cef      	bf      	0x8010f00	// 8010f00 <_fpadd_parts+0x1f4>
 8010d24:	eb4c0004 	cmpnei      	r12, 4
 8010d28:	0c6a      	bf      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d2a:	eb4c0002 	cmpnei      	r12, 2
 8010d2e:	0cc7      	bf      	0x8010ebc	// 8010ebc <_fpadd_parts+0x1b0>
 8010d30:	3b42      	cmpnei      	r3, 2
 8010d32:	0c65      	bf      	0x8010dfc	// 8010dfc <_fpadd_parts+0xf0>
 8010d34:	9062      	ld.w      	r3, (r0, 0x8)
 8010d36:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d3a:	c583008d 	subu      	r13, r3, r12
 8010d3e:	c40d0208 	abs      	r8, r13
 8010d42:	eb28003f 	cmplti      	r8, 64
 8010d46:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d48:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d4a:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d4c:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d4e:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d52:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d56:	0856      	bt      	0x8010e02	// 8010e02 <_fpadd_parts+0xf6>
 8010d58:	64f1      	cmplt      	r12, r3
 8010d5a:	0cc9      	bf      	0x8010eec	// 8010eec <_fpadd_parts+0x1e0>
 8010d5c:	ea0a0000 	movi      	r10, 0
 8010d60:	ea0b0000 	movi      	r11, 0
 8010d64:	9001      	ld.w      	r0, (r0, 0x4)
 8010d66:	9121      	ld.w      	r1, (r1, 0x4)
 8010d68:	6442      	cmpne      	r0, r1
 8010d6a:	0c82      	bf      	0x8010e6e	// 8010e6e <_fpadd_parts+0x162>
 8010d6c:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d70:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010d74:	e90000b8 	bez      	r0, 0x8010ee4	// 8010ee4 <_fpadd_parts+0x1d8>
 8010d78:	6730      	cmphs      	r12, r12
 8010d7a:	c58a010c 	subc      	r12, r10, r12
 8010d7e:	c5ab010d 	subc      	r13, r11, r13
 8010d82:	e98d00c9 	blz      	r13, 0x8010f14	// 8010f14 <_fpadd_parts+0x208>
 8010d86:	3100      	movi      	r1, 0
 8010d88:	b221      	st.w      	r1, (r2, 0x4)
 8010d8a:	b262      	st.w      	r3, (r2, 0x8)
 8010d8c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010d90:	dda22004 	st.w      	r13, (r2, 0x10)
 8010d94:	6c33      	mov      	r0, r12
 8010d96:	6c77      	mov      	r1, r13
 8010d98:	3840      	cmpnei      	r0, 0
 8010d9a:	c4210c81 	decf      	r1, r1, 1
 8010d9e:	2800      	subi      	r0, 1
 8010da0:	c7605023 	bmaski      	r3, 28
 8010da4:	644c      	cmphs      	r3, r1
 8010da6:	0c71      	bf      	0x8010e88	// 8010e88 <_fpadd_parts+0x17c>
 8010da8:	64c6      	cmpne      	r1, r3
 8010daa:	0d0d      	bf      	0x8010fc4	// 8010fc4 <_fpadd_parts+0x2b8>
 8010dac:	9262      	ld.w      	r3, (r2, 0x8)
 8010dae:	3600      	movi      	r6, 0
 8010db0:	3700      	movi      	r7, 0
 8010db2:	ea0a0000 	movi      	r10, 0
 8010db6:	2b00      	subi      	r3, 1
 8010db8:	2e00      	subi      	r6, 1
 8010dba:	2f00      	subi      	r7, 1
 8010dbc:	c7605028 	bmaski      	r8, 28
 8010dc0:	e54a1001 	subi      	r10, r10, 2
 8010dc4:	0403      	br      	0x8010dca	// 8010dca <_fpadd_parts+0xbe>
 8010dc6:	6606      	cmpne      	r1, r8
 8010dc8:	0c8b      	bf      	0x8010ede	// 8010ede <_fpadd_parts+0x1d2>
 8010dca:	6511      	cmplt      	r4, r4
 8010dcc:	c58c0044 	addc      	r4, r12, r12
 8010dd0:	c5ad0045 	addc      	r5, r13, r13
 8010dd4:	6401      	cmplt      	r0, r0
 8010dd6:	c4c40040 	addc      	r0, r4, r6
 8010dda:	c4e50041 	addc      	r1, r5, r7
 8010dde:	6460      	cmphs      	r8, r1
 8010de0:	6e4f      	mov      	r9, r3
 8010de2:	6f13      	mov      	r12, r4
 8010de4:	6f57      	mov      	r13, r5
 8010de6:	2b00      	subi      	r3, 1
 8010de8:	0bef      	bt      	0x8010dc6	// 8010dc6 <_fpadd_parts+0xba>
 8010dea:	3303      	movi      	r3, 3
 8010dec:	b283      	st.w      	r4, (r2, 0xc)
 8010dee:	b2a4      	st.w      	r5, (r2, 0x10)
 8010df0:	dd222002 	st.w      	r9, (r2, 0x8)
 8010df4:	b260      	st.w      	r3, (r2, 0x0)
 8010df6:	6c0b      	mov      	r0, r2
 8010df8:	1403      	addi      	r14, r14, 12
 8010dfa:	1488      	pop      	r4-r11
 8010dfc:	6c07      	mov      	r0, r1
 8010dfe:	1403      	addi      	r14, r14, 12
 8010e00:	1488      	pop      	r4-r11
 8010e02:	e96d009a 	blsz      	r13, 0x8010f36	// 8010f36 <_fpadd_parts+0x22a>
 8010e06:	ea0d001f 	movi      	r13, 31
 8010e0a:	c42b4826 	lsli      	r6, r11, 1
 8010e0e:	6362      	subu      	r13, r8
 8010e10:	e588101f 	subi      	r12, r8, 32
 8010e14:	c5a6402d 	lsl      	r13, r6, r13
 8010e18:	c50a4046 	lsr      	r6, r10, r8
 8010e1c:	c7ec2880 	btsti      	r12, 31
 8010e20:	c58b4049 	lsr      	r9, r11, r12
 8010e24:	3400      	movi      	r4, 0
 8010e26:	6db4      	or      	r6, r13
 8010e28:	c4c90c20 	incf      	r6, r9, 0
 8010e2c:	6f53      	mov      	r13, r4
 8010e2e:	c5854029 	lsl      	r9, r5, r12
 8010e32:	c505402c 	lsl      	r12, r5, r8
 8010e36:	c50b4047 	lsr      	r7, r11, r8
 8010e3a:	c5a90c20 	incf      	r13, r9, 0
 8010e3e:	c5840c20 	incf      	r12, r4, 0
 8010e42:	c4e40c20 	incf      	r7, r4, 0
 8010e46:	eb4c0000 	cmpnei      	r12, 0
 8010e4a:	c5ad0c81 	decf      	r13, r13, 1
 8010e4e:	e58c1000 	subi      	r12, r12, 1
 8010e52:	6b28      	and      	r12, r10
 8010e54:	6b6c      	and      	r13, r11
 8010e56:	6f34      	or      	r12, r13
 8010e58:	eb4c0000 	cmpnei      	r12, 0
 8010e5c:	9001      	ld.w      	r0, (r0, 0x4)
 8010e5e:	9121      	ld.w      	r1, (r1, 0x4)
 8010e60:	c400050a 	mvc      	r10
 8010e64:	6442      	cmpne      	r0, r1
 8010e66:	6ed3      	mov      	r11, r4
 8010e68:	6e98      	or      	r10, r6
 8010e6a:	6edc      	or      	r11, r7
 8010e6c:	0b80      	bt      	0x8010d6c	// 8010d6c <_fpadd_parts+0x60>
 8010e6e:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e72:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010e76:	6731      	cmplt      	r12, r12
 8010e78:	6329      	addc      	r12, r10
 8010e7a:	636d      	addc      	r13, r11
 8010e7c:	b201      	st.w      	r0, (r2, 0x4)
 8010e7e:	b262      	st.w      	r3, (r2, 0x8)
 8010e80:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e84:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e88:	3303      	movi      	r3, 3
 8010e8a:	b260      	st.w      	r3, (r2, 0x0)
 8010e8c:	c7805023 	bmaski      	r3, 29
 8010e90:	674c      	cmphs      	r3, r13
 8010e92:	0812      	bt      	0x8010eb6	// 8010eb6 <_fpadd_parts+0x1aa>
 8010e94:	c7ed4823 	lsli      	r3, r13, 31
 8010e98:	c42c4840 	lsri      	r0, r12, 1
 8010e9c:	6c0c      	or      	r0, r3
 8010e9e:	c42d4841 	lsri      	r1, r13, 1
 8010ea2:	9262      	ld.w      	r3, (r2, 0x8)
 8010ea4:	e48c2001 	andi      	r4, r12, 1
 8010ea8:	3500      	movi      	r5, 0
 8010eaa:	6c10      	or      	r0, r4
 8010eac:	6c54      	or      	r1, r5
 8010eae:	2300      	addi      	r3, 1
 8010eb0:	b203      	st.w      	r0, (r2, 0xc)
 8010eb2:	b224      	st.w      	r1, (r2, 0x10)
 8010eb4:	b262      	st.w      	r3, (r2, 0x8)
 8010eb6:	6c0b      	mov      	r0, r2
 8010eb8:	1403      	addi      	r14, r14, 12
 8010eba:	1488      	pop      	r4-r11
 8010ebc:	3b42      	cmpnei      	r3, 2
 8010ebe:	0b9d      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010ec0:	b260      	st.w      	r3, (r2, 0x0)
 8010ec2:	9061      	ld.w      	r3, (r0, 0x4)
 8010ec4:	b261      	st.w      	r3, (r2, 0x4)
 8010ec6:	9062      	ld.w      	r3, (r0, 0x8)
 8010ec8:	b262      	st.w      	r3, (r2, 0x8)
 8010eca:	9063      	ld.w      	r3, (r0, 0xc)
 8010ecc:	b263      	st.w      	r3, (r2, 0xc)
 8010ece:	9064      	ld.w      	r3, (r0, 0x10)
 8010ed0:	9121      	ld.w      	r1, (r1, 0x4)
 8010ed2:	b264      	st.w      	r3, (r2, 0x10)
 8010ed4:	9061      	ld.w      	r3, (r0, 0x4)
 8010ed6:	68c4      	and      	r3, r1
 8010ed8:	b261      	st.w      	r3, (r2, 0x4)
 8010eda:	6c0b      	mov      	r0, r2
 8010edc:	078e      	br      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010ede:	6428      	cmphs      	r10, r0
 8010ee0:	0b75      	bt      	0x8010dca	// 8010dca <_fpadd_parts+0xbe>
 8010ee2:	0784      	br      	0x8010dea	// 8010dea <_fpadd_parts+0xde>
 8010ee4:	6730      	cmphs      	r12, r12
 8010ee6:	632b      	subc      	r12, r10
 8010ee8:	636f      	subc      	r13, r11
 8010eea:	074c      	br      	0x8010d82	// 8010d82 <_fpadd_parts+0x76>
 8010eec:	6cf3      	mov      	r3, r12
 8010eee:	ea0d0000 	movi      	r13, 0
 8010ef2:	ea0c0000 	movi      	r12, 0
 8010ef6:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010efa:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010efe:	0733      	br      	0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010f00:	eb4c0004 	cmpnei      	r12, 4
 8010f04:	0b7a      	bt      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010f06:	9041      	ld.w      	r2, (r0, 0x4)
 8010f08:	9161      	ld.w      	r3, (r1, 0x4)
 8010f0a:	64ca      	cmpne      	r2, r3
 8010f0c:	124b      	lrw      	r2, 0x8014910	// 8011038 <__subdf3+0x38>
 8010f0e:	c4020c40 	inct      	r0, r2, 0
 8010f12:	0773      	br      	0x8010df8	// 8010df8 <_fpadd_parts+0xec>
 8010f14:	ea0a0000 	movi      	r10, 0
 8010f18:	ea0b0000 	movi      	r11, 0
 8010f1c:	3101      	movi      	r1, 1
 8010f1e:	6730      	cmphs      	r12, r12
 8010f20:	c58a010c 	subc      	r12, r10, r12
 8010f24:	c5ab010d 	subc      	r13, r11, r13
 8010f28:	b221      	st.w      	r1, (r2, 0x4)
 8010f2a:	b262      	st.w      	r3, (r2, 0x8)
 8010f2c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f30:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f34:	0730      	br      	0x8010d94	// 8010d94 <_fpadd_parts+0x88>
 8010f36:	e90dff17 	bez      	r13, 0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010f3a:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f3c:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f3e:	ea0d001f 	movi      	r13, 31
 8010f42:	47c1      	lsli      	r6, r7, 1
 8010f44:	6362      	subu      	r13, r8
 8010f46:	c5a6402d 	lsl      	r13, r6, r13
 8010f4a:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f4e:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f52:	e588101f 	subi      	r12, r8, 32
 8010f56:	c50d4046 	lsr      	r6, r13, r8
 8010f5a:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f5e:	c7ec2880 	btsti      	r12, 31
 8010f62:	3400      	movi      	r4, 0
 8010f64:	c5874049 	lsr      	r9, r7, r12
 8010f68:	6db4      	or      	r6, r13
 8010f6a:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f6e:	c4c90c20 	incf      	r6, r9, 0
 8010f72:	c50d4047 	lsr      	r7, r13, r8
 8010f76:	c5854029 	lsl      	r9, r5, r12
 8010f7a:	6f53      	mov      	r13, r4
 8010f7c:	c505402c 	lsl      	r12, r5, r8
 8010f80:	c5a90c20 	incf      	r13, r9, 0
 8010f84:	c5840c20 	incf      	r12, r4, 0
 8010f88:	c4e40c20 	incf      	r7, r4, 0
 8010f8c:	60e0      	addu      	r3, r8
 8010f8e:	eb4c0000 	cmpnei      	r12, 0
 8010f92:	c5ad0c81 	decf      	r13, r13, 1
 8010f96:	e58c1000 	subi      	r12, r12, 1
 8010f9a:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010f9e:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fa2:	6a30      	and      	r8, r12
 8010fa4:	6a74      	and      	r9, r13
 8010fa6:	6f23      	mov      	r12, r8
 8010fa8:	6f67      	mov      	r13, r9
 8010faa:	6f34      	or      	r12, r13
 8010fac:	eb4c0000 	cmpnei      	r12, 0
 8010fb0:	c400050c 	mvc      	r12
 8010fb4:	6f53      	mov      	r13, r4
 8010fb6:	c5862424 	or      	r4, r6, r12
 8010fba:	c5a72425 	or      	r5, r7, r13
 8010fbe:	b880      	st.w      	r4, (r14, 0x0)
 8010fc0:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fc2:	06d1      	br      	0x8010d64	// 8010d64 <_fpadd_parts+0x58>
 8010fc4:	3300      	movi      	r3, 0
 8010fc6:	2b01      	subi      	r3, 2
 8010fc8:	640c      	cmphs      	r3, r0
 8010fca:	0af1      	bt      	0x8010dac	// 8010dac <_fpadd_parts+0xa0>
 8010fcc:	075e      	br      	0x8010e88	// 8010e88 <_fpadd_parts+0x17c>
	...

08010fd0 <__adddf3>:
 8010fd0:	14d2      	push      	r4-r5, r15
 8010fd2:	1433      	subi      	r14, r14, 76
 8010fd4:	b800      	st.w      	r0, (r14, 0x0)
 8010fd6:	b821      	st.w      	r1, (r14, 0x4)
 8010fd8:	6c3b      	mov      	r0, r14
 8010fda:	6d47      	mov      	r5, r1
 8010fdc:	1904      	addi      	r1, r14, 16
 8010fde:	b863      	st.w      	r3, (r14, 0xc)
 8010fe0:	b842      	st.w      	r2, (r14, 0x8)
 8010fe2:	e00003b7 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8010fe6:	1909      	addi      	r1, r14, 36
 8010fe8:	1802      	addi      	r0, r14, 8
 8010fea:	e00003b3 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8010fee:	1a0e      	addi      	r2, r14, 56
 8010ff0:	1909      	addi      	r1, r14, 36
 8010ff2:	1804      	addi      	r0, r14, 16
 8010ff4:	e3fffe8c 	bsr      	0x8010d0c	// 8010d0c <_fpadd_parts>
 8010ff8:	e00002e4 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8010ffc:	1413      	addi      	r14, r14, 76
 8010ffe:	1492      	pop      	r4-r5, r15

08011000 <__subdf3>:
 8011000:	14d2      	push      	r4-r5, r15
 8011002:	1433      	subi      	r14, r14, 76
 8011004:	b800      	st.w      	r0, (r14, 0x0)
 8011006:	b821      	st.w      	r1, (r14, 0x4)
 8011008:	6c3b      	mov      	r0, r14
 801100a:	6d47      	mov      	r5, r1
 801100c:	1904      	addi      	r1, r14, 16
 801100e:	b842      	st.w      	r2, (r14, 0x8)
 8011010:	b863      	st.w      	r3, (r14, 0xc)
 8011012:	e000039f 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011016:	1909      	addi      	r1, r14, 36
 8011018:	1802      	addi      	r0, r14, 8
 801101a:	e000039b 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801101e:	986a      	ld.w      	r3, (r14, 0x28)
 8011020:	e4634001 	xori      	r3, r3, 1
 8011024:	1a0e      	addi      	r2, r14, 56
 8011026:	1909      	addi      	r1, r14, 36
 8011028:	1804      	addi      	r0, r14, 16
 801102a:	b86a      	st.w      	r3, (r14, 0x28)
 801102c:	e3fffe70 	bsr      	0x8010d0c	// 8010d0c <_fpadd_parts>
 8011030:	e00002c8 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011034:	1413      	addi      	r14, r14, 76
 8011036:	1492      	pop      	r4-r5, r15
 8011038:	08014910 	.long	0x08014910

0801103c <__muldf3>:
 801103c:	14d8      	push      	r4-r11, r15
 801103e:	1436      	subi      	r14, r14, 88
 8011040:	b803      	st.w      	r0, (r14, 0xc)
 8011042:	b824      	st.w      	r1, (r14, 0x10)
 8011044:	1803      	addi      	r0, r14, 12
 8011046:	1907      	addi      	r1, r14, 28
 8011048:	b866      	st.w      	r3, (r14, 0x18)
 801104a:	b845      	st.w      	r2, (r14, 0x14)
 801104c:	e0000382 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011050:	190c      	addi      	r1, r14, 48
 8011052:	1805      	addi      	r0, r14, 20
 8011054:	e000037e 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011058:	9867      	ld.w      	r3, (r14, 0x1c)
 801105a:	3b01      	cmphsi      	r3, 2
 801105c:	0ca4      	bf      	0x80111a4	// 80111a4 <__muldf3+0x168>
 801105e:	984c      	ld.w      	r2, (r14, 0x30)
 8011060:	3a01      	cmphsi      	r2, 2
 8011062:	0c94      	bf      	0x801118a	// 801118a <__muldf3+0x14e>
 8011064:	3b44      	cmpnei      	r3, 4
 8011066:	0c9d      	bf      	0x80111a0	// 80111a0 <__muldf3+0x164>
 8011068:	3a44      	cmpnei      	r2, 4
 801106a:	0c8e      	bf      	0x8011186	// 8011186 <__muldf3+0x14a>
 801106c:	3b42      	cmpnei      	r3, 2
 801106e:	0c9b      	bf      	0x80111a4	// 80111a4 <__muldf3+0x168>
 8011070:	3a42      	cmpnei      	r2, 2
 8011072:	0c8c      	bf      	0x801118a	// 801118a <__muldf3+0x14e>
 8011074:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 8011078:	d90e200a 	ld.w      	r8, (r14, 0x28)
 801107c:	3300      	movi      	r3, 0
 801107e:	6c33      	mov      	r0, r12
 8011080:	6ca3      	mov      	r2, r8
 8011082:	6c4f      	mov      	r1, r3
 8011084:	dd8e2002 	st.w      	r12, (r14, 0x8)
 8011088:	d96e2010 	ld.w      	r11, (r14, 0x40)
 801108c:	e0000274 	bsr      	0x8011574	// 8011574 <__muldi3>
 8011090:	3300      	movi      	r3, 0
 8011092:	6ca3      	mov      	r2, r8
 8011094:	6d83      	mov      	r6, r0
 8011096:	6dc7      	mov      	r7, r1
 8011098:	6c4f      	mov      	r1, r3
 801109a:	6c2f      	mov      	r0, r11
 801109c:	e000026c 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110a0:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110a4:	3300      	movi      	r3, 0
 80110a6:	6e03      	mov      	r8, r0
 80110a8:	6e47      	mov      	r9, r1
 80110aa:	6caf      	mov      	r2, r11
 80110ac:	6c4f      	mov      	r1, r3
 80110ae:	6c2b      	mov      	r0, r10
 80110b0:	e0000262 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110b4:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110b8:	3300      	movi      	r3, 0
 80110ba:	b800      	st.w      	r0, (r14, 0x0)
 80110bc:	b821      	st.w      	r1, (r14, 0x4)
 80110be:	6cb3      	mov      	r2, r12
 80110c0:	6c2b      	mov      	r0, r10
 80110c2:	6c4f      	mov      	r1, r3
 80110c4:	e0000258 	bsr      	0x8011574	// 8011574 <__muldi3>
 80110c8:	6401      	cmplt      	r0, r0
 80110ca:	6021      	addc      	r0, r8
 80110cc:	6065      	addc      	r1, r9
 80110ce:	6644      	cmphs      	r1, r9
 80110d0:	0c80      	bf      	0x80111d0	// 80111d0 <__muldf3+0x194>
 80110d2:	6466      	cmpne      	r9, r1
 80110d4:	0c7c      	bf      	0x80111cc	// 80111cc <__muldf3+0x190>
 80110d6:	ea080000 	movi      	r8, 0
 80110da:	ea090000 	movi      	r9, 0
 80110de:	3200      	movi      	r2, 0
 80110e0:	6cc3      	mov      	r3, r0
 80110e2:	6489      	cmplt      	r2, r2
 80110e4:	6099      	addc      	r2, r6
 80110e6:	60dd      	addc      	r3, r7
 80110e8:	65cc      	cmphs      	r3, r7
 80110ea:	0c6a      	bf      	0x80111be	// 80111be <__muldf3+0x182>
 80110ec:	64de      	cmpne      	r7, r3
 80110ee:	0c66      	bf      	0x80111ba	// 80111ba <__muldf3+0x17e>
 80110f0:	6f07      	mov      	r12, r1
 80110f2:	ea0d0000 	movi      	r13, 0
 80110f6:	9800      	ld.w      	r0, (r14, 0x0)
 80110f8:	9821      	ld.w      	r1, (r14, 0x4)
 80110fa:	6401      	cmplt      	r0, r0
 80110fc:	6031      	addc      	r0, r12
 80110fe:	6075      	addc      	r1, r13
 8011100:	6621      	cmplt      	r8, r8
 8011102:	6201      	addc      	r8, r0
 8011104:	6245      	addc      	r9, r1
 8011106:	980e      	ld.w      	r0, (r14, 0x38)
 8011108:	9829      	ld.w      	r1, (r14, 0x24)
 801110a:	6040      	addu      	r1, r0
 801110c:	590e      	addi      	r0, r1, 4
 801110e:	b813      	st.w      	r0, (r14, 0x4c)
 8011110:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011114:	980d      	ld.w      	r0, (r14, 0x34)
 8011116:	6432      	cmpne      	r12, r0
 8011118:	c780502a 	bmaski      	r10, 29
 801111c:	c4000500 	mvc      	r0
 8011120:	6668      	cmphs      	r10, r9
 8011122:	b812      	st.w      	r0, (r14, 0x48)
 8011124:	086f      	bt      	0x8011202	// 8011202 <__muldf3+0x1c6>
 8011126:	2104      	addi      	r1, 5
 8011128:	ea0c0000 	movi      	r12, 0
 801112c:	ea2d8000 	movih      	r13, 32768
 8011130:	e4082001 	andi      	r0, r8, 1
 8011134:	6ec7      	mov      	r11, r1
 8011136:	e900000a 	bez      	r0, 0x801114a	// 801114a <__muldf3+0x10e>
 801113a:	431f      	lsli      	r0, r3, 31
 801113c:	4a81      	lsri      	r4, r2, 1
 801113e:	6d00      	or      	r4, r0
 8011140:	4ba1      	lsri      	r5, r3, 1
 8011142:	c5842422 	or      	r2, r4, r12
 8011146:	c5a52423 	or      	r3, r5, r13
 801114a:	c4294840 	lsri      	r0, r9, 1
 801114e:	6428      	cmphs      	r10, r0
 8011150:	c7e94827 	lsli      	r7, r9, 31
 8011154:	c4284846 	lsri      	r6, r8, 1
 8011158:	c4c72428 	or      	r8, r7, r6
 801115c:	6e43      	mov      	r9, r0
 801115e:	2100      	addi      	r1, 1
 8011160:	0fe8      	bf      	0x8011130	// 8011130 <__muldf3+0xf4>
 8011162:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 8011166:	e42820ff 	andi      	r1, r8, 255
 801116a:	eb410080 	cmpnei      	r1, 128
 801116e:	0c36      	bf      	0x80111da	// 80111da <__muldf3+0x19e>
 8011170:	3303      	movi      	r3, 3
 8011172:	dd0e2014 	st.w      	r8, (r14, 0x50)
 8011176:	dd2e2015 	st.w      	r9, (r14, 0x54)
 801117a:	b871      	st.w      	r3, (r14, 0x44)
 801117c:	1811      	addi      	r0, r14, 68
 801117e:	e0000221 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011182:	1416      	addi      	r14, r14, 88
 8011184:	1498      	pop      	r4-r11, r15
 8011186:	3b42      	cmpnei      	r3, 2
 8011188:	0c3b      	bf      	0x80111fe	// 80111fe <__muldf3+0x1c2>
 801118a:	986d      	ld.w      	r3, (r14, 0x34)
 801118c:	9848      	ld.w      	r2, (r14, 0x20)
 801118e:	64ca      	cmpne      	r2, r3
 8011190:	c4000503 	mvc      	r3
 8011194:	180c      	addi      	r0, r14, 48
 8011196:	b86d      	st.w      	r3, (r14, 0x34)
 8011198:	e0000214 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801119c:	1416      	addi      	r14, r14, 88
 801119e:	1498      	pop      	r4-r11, r15
 80111a0:	3a42      	cmpnei      	r2, 2
 80111a2:	0c2e      	bf      	0x80111fe	// 80111fe <__muldf3+0x1c2>
 80111a4:	9848      	ld.w      	r2, (r14, 0x20)
 80111a6:	986d      	ld.w      	r3, (r14, 0x34)
 80111a8:	64ca      	cmpne      	r2, r3
 80111aa:	c4000503 	mvc      	r3
 80111ae:	1807      	addi      	r0, r14, 28
 80111b0:	b868      	st.w      	r3, (r14, 0x20)
 80111b2:	e0000207 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 80111b6:	1416      	addi      	r14, r14, 88
 80111b8:	1498      	pop      	r4-r11, r15
 80111ba:	6588      	cmphs      	r2, r6
 80111bc:	0b9a      	bt      	0x80110f0	// 80110f0 <__muldf3+0xb4>
 80111be:	e5080000 	addi      	r8, r8, 1
 80111c2:	eb480000 	cmpnei      	r8, 0
 80111c6:	c5290c21 	incf      	r9, r9, 1
 80111ca:	0793      	br      	0x80110f0	// 80110f0 <__muldf3+0xb4>
 80111cc:	6600      	cmphs      	r0, r8
 80111ce:	0b84      	bt      	0x80110d6	// 80110d6 <__muldf3+0x9a>
 80111d0:	ea080000 	movi      	r8, 0
 80111d4:	ea090001 	movi      	r9, 1
 80111d8:	0783      	br      	0x80110de	// 80110de <__muldf3+0xa2>
 80111da:	e4282100 	andi      	r1, r8, 256
 80111de:	e921ffc9 	bnez      	r1, 0x8011170	// 8011170 <__muldf3+0x134>
 80111e2:	6c8c      	or      	r2, r3
 80111e4:	e902ffc6 	bez      	r2, 0x8011170	// 8011170 <__muldf3+0x134>
 80111e8:	3280      	movi      	r2, 128
 80111ea:	3300      	movi      	r3, 0
 80111ec:	3100      	movi      	r1, 0
 80111ee:	6489      	cmplt      	r2, r2
 80111f0:	60a1      	addc      	r2, r8
 80111f2:	60e5      	addc      	r3, r9
 80111f4:	29ff      	subi      	r1, 256
 80111f6:	c4222028 	and      	r8, r2, r1
 80111fa:	6e4f      	mov      	r9, r3
 80111fc:	07ba      	br      	0x8011170	// 8011170 <__muldf3+0x134>
 80111fe:	100f      	lrw      	r0, 0x8014910	// 8011238 <__muldf3+0x1fc>
 8011200:	07bf      	br      	0x801117e	// 801117e <__muldf3+0x142>
 8011202:	c760502c 	bmaski      	r12, 28
 8011206:	6670      	cmphs      	r12, r9
 8011208:	0faf      	bf      	0x8011166	// 8011166 <__muldf3+0x12a>
 801120a:	2102      	addi      	r1, 3
 801120c:	3401      	movi      	r4, 1
 801120e:	3500      	movi      	r5, 0
 8011210:	6da3      	mov      	r6, r8
 8011212:	6de7      	mov      	r7, r9
 8011214:	6c07      	mov      	r0, r1
 8011216:	6621      	cmplt      	r8, r8
 8011218:	6219      	addc      	r8, r6
 801121a:	625d      	addc      	r9, r7
 801121c:	e9a30004 	bhsz      	r3, 0x8011224	// 8011224 <__muldf3+0x1e8>
 8011220:	6e10      	or      	r8, r4
 8011222:	6e54      	or      	r9, r5
 8011224:	6d8b      	mov      	r6, r2
 8011226:	6dcf      	mov      	r7, r3
 8011228:	6489      	cmplt      	r2, r2
 801122a:	6099      	addc      	r2, r6
 801122c:	60dd      	addc      	r3, r7
 801122e:	6670      	cmphs      	r12, r9
 8011230:	2900      	subi      	r1, 1
 8011232:	0bef      	bt      	0x8011210	// 8011210 <__muldf3+0x1d4>
 8011234:	b813      	st.w      	r0, (r14, 0x4c)
 8011236:	0798      	br      	0x8011166	// 8011166 <__muldf3+0x12a>
 8011238:	08014910 	.long	0x08014910

0801123c <__divdf3>:
 801123c:	14d6      	push      	r4-r9, r15
 801123e:	142e      	subi      	r14, r14, 56
 8011240:	b800      	st.w      	r0, (r14, 0x0)
 8011242:	b821      	st.w      	r1, (r14, 0x4)
 8011244:	6c3b      	mov      	r0, r14
 8011246:	1904      	addi      	r1, r14, 16
 8011248:	b863      	st.w      	r3, (r14, 0xc)
 801124a:	b842      	st.w      	r2, (r14, 0x8)
 801124c:	e0000282 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011250:	1909      	addi      	r1, r14, 36
 8011252:	1802      	addi      	r0, r14, 8
 8011254:	e000027e 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011258:	9864      	ld.w      	r3, (r14, 0x10)
 801125a:	3b01      	cmphsi      	r3, 2
 801125c:	0c51      	bf      	0x80112fe	// 80112fe <__divdf3+0xc2>
 801125e:	9829      	ld.w      	r1, (r14, 0x24)
 8011260:	3201      	movi      	r2, 1
 8011262:	6448      	cmphs      	r2, r1
 8011264:	0873      	bt      	0x801134a	// 801134a <__divdf3+0x10e>
 8011266:	9845      	ld.w      	r2, (r14, 0x14)
 8011268:	980a      	ld.w      	r0, (r14, 0x28)
 801126a:	3b44      	cmpnei      	r3, 4
 801126c:	6c81      	xor      	r2, r0
 801126e:	b845      	st.w      	r2, (r14, 0x14)
 8011270:	0c4c      	bf      	0x8011308	// 8011308 <__divdf3+0xcc>
 8011272:	3b42      	cmpnei      	r3, 2
 8011274:	0c4a      	bf      	0x8011308	// 8011308 <__divdf3+0xcc>
 8011276:	3944      	cmpnei      	r1, 4
 8011278:	0c4c      	bf      	0x8011310	// 8011310 <__divdf3+0xd4>
 801127a:	3942      	cmpnei      	r1, 2
 801127c:	0c63      	bf      	0x8011342	// 8011342 <__divdf3+0x106>
 801127e:	9807      	ld.w      	r0, (r14, 0x1c)
 8011280:	9828      	ld.w      	r1, (r14, 0x20)
 8011282:	98cc      	ld.w      	r6, (r14, 0x30)
 8011284:	98ed      	ld.w      	r7, (r14, 0x34)
 8011286:	9866      	ld.w      	r3, (r14, 0x18)
 8011288:	984b      	ld.w      	r2, (r14, 0x2c)
 801128a:	65c4      	cmphs      	r1, r7
 801128c:	60ca      	subu      	r3, r2
 801128e:	b866      	st.w      	r3, (r14, 0x18)
 8011290:	0c05      	bf      	0x801129a	// 801129a <__divdf3+0x5e>
 8011292:	645e      	cmpne      	r7, r1
 8011294:	080a      	bt      	0x80112a8	// 80112a8 <__divdf3+0x6c>
 8011296:	6580      	cmphs      	r0, r6
 8011298:	0808      	bt      	0x80112a8	// 80112a8 <__divdf3+0x6c>
 801129a:	6f03      	mov      	r12, r0
 801129c:	6f47      	mov      	r13, r1
 801129e:	2b00      	subi      	r3, 1
 80112a0:	6401      	cmplt      	r0, r0
 80112a2:	6031      	addc      	r0, r12
 80112a4:	6075      	addc      	r1, r13
 80112a6:	b866      	st.w      	r3, (r14, 0x18)
 80112a8:	ea0c003d 	movi      	r12, 61
 80112ac:	3400      	movi      	r4, 0
 80112ae:	3500      	movi      	r5, 0
 80112b0:	3200      	movi      	r2, 0
 80112b2:	ea231000 	movih      	r3, 4096
 80112b6:	65c4      	cmphs      	r1, r7
 80112b8:	0c0a      	bf      	0x80112cc	// 80112cc <__divdf3+0x90>
 80112ba:	645e      	cmpne      	r7, r1
 80112bc:	0803      	bt      	0x80112c2	// 80112c2 <__divdf3+0x86>
 80112be:	6580      	cmphs      	r0, r6
 80112c0:	0c06      	bf      	0x80112cc	// 80112cc <__divdf3+0x90>
 80112c2:	6d08      	or      	r4, r2
 80112c4:	6d4c      	or      	r5, r3
 80112c6:	6400      	cmphs      	r0, r0
 80112c8:	601b      	subc      	r0, r6
 80112ca:	605f      	subc      	r1, r7
 80112cc:	c7e34829 	lsli      	r9, r3, 31
 80112d0:	c4224848 	lsri      	r8, r2, 1
 80112d4:	c423484d 	lsri      	r13, r3, 1
 80112d8:	c5092422 	or      	r2, r9, r8
 80112dc:	e58c1000 	subi      	r12, r12, 1
 80112e0:	6e03      	mov      	r8, r0
 80112e2:	6e47      	mov      	r9, r1
 80112e4:	6cf7      	mov      	r3, r13
 80112e6:	6401      	cmplt      	r0, r0
 80112e8:	6021      	addc      	r0, r8
 80112ea:	6065      	addc      	r1, r9
 80112ec:	e92cffe5 	bnez      	r12, 0x80112b6	// 80112b6 <__divdf3+0x7a>
 80112f0:	e46420ff 	andi      	r3, r4, 255
 80112f4:	eb430080 	cmpnei      	r3, 128
 80112f8:	0c13      	bf      	0x801131e	// 801131e <__divdf3+0xe2>
 80112fa:	b887      	st.w      	r4, (r14, 0x1c)
 80112fc:	b8a8      	st.w      	r5, (r14, 0x20)
 80112fe:	1804      	addi      	r0, r14, 16
 8011300:	e0000160 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011304:	140e      	addi      	r14, r14, 56
 8011306:	1496      	pop      	r4-r9, r15
 8011308:	644e      	cmpne      	r3, r1
 801130a:	0bfa      	bt      	0x80112fe	// 80112fe <__divdf3+0xc2>
 801130c:	1011      	lrw      	r0, 0x8014910	// 8011350 <__divdf3+0x114>
 801130e:	07f9      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 8011310:	3300      	movi      	r3, 0
 8011312:	3400      	movi      	r4, 0
 8011314:	b867      	st.w      	r3, (r14, 0x1c)
 8011316:	b888      	st.w      	r4, (r14, 0x20)
 8011318:	b866      	st.w      	r3, (r14, 0x18)
 801131a:	1804      	addi      	r0, r14, 16
 801131c:	07f2      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801131e:	e4642100 	andi      	r3, r4, 256
 8011322:	e923ffec 	bnez      	r3, 0x80112fa	// 80112fa <__divdf3+0xbe>
 8011326:	6c04      	or      	r0, r1
 8011328:	e900ffe9 	bez      	r0, 0x80112fa	// 80112fa <__divdf3+0xbe>
 801132c:	3280      	movi      	r2, 128
 801132e:	3300      	movi      	r3, 0
 8011330:	3100      	movi      	r1, 0
 8011332:	6489      	cmplt      	r2, r2
 8011334:	6091      	addc      	r2, r4
 8011336:	60d5      	addc      	r3, r5
 8011338:	29ff      	subi      	r1, 256
 801133a:	c4222024 	and      	r4, r2, r1
 801133e:	6d4f      	mov      	r5, r3
 8011340:	07dd      	br      	0x80112fa	// 80112fa <__divdf3+0xbe>
 8011342:	3304      	movi      	r3, 4
 8011344:	b864      	st.w      	r3, (r14, 0x10)
 8011346:	1804      	addi      	r0, r14, 16
 8011348:	07dc      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801134a:	1809      	addi      	r0, r14, 36
 801134c:	07da      	br      	0x8011300	// 8011300 <__divdf3+0xc4>
 801134e:	0000      	.short	0x0000
 8011350:	08014910 	.long	0x08014910

08011354 <__nedf2>:
 8011354:	14d2      	push      	r4-r5, r15
 8011356:	142e      	subi      	r14, r14, 56
 8011358:	b800      	st.w      	r0, (r14, 0x0)
 801135a:	b821      	st.w      	r1, (r14, 0x4)
 801135c:	6c3b      	mov      	r0, r14
 801135e:	6d47      	mov      	r5, r1
 8011360:	1904      	addi      	r1, r14, 16
 8011362:	b863      	st.w      	r3, (r14, 0xc)
 8011364:	b842      	st.w      	r2, (r14, 0x8)
 8011366:	e00001f5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801136a:	1802      	addi      	r0, r14, 8
 801136c:	1909      	addi      	r1, r14, 36
 801136e:	e00001f1 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011372:	9864      	ld.w      	r3, (r14, 0x10)
 8011374:	3001      	movi      	r0, 1
 8011376:	64c0      	cmphs      	r0, r3
 8011378:	0808      	bt      	0x8011388	// 8011388 <__nedf2+0x34>
 801137a:	9869      	ld.w      	r3, (r14, 0x24)
 801137c:	64c0      	cmphs      	r0, r3
 801137e:	0805      	bt      	0x8011388	// 8011388 <__nedf2+0x34>
 8011380:	1909      	addi      	r1, r14, 36
 8011382:	1804      	addi      	r0, r14, 16
 8011384:	e0000258 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011388:	140e      	addi      	r14, r14, 56
 801138a:	1492      	pop      	r4-r5, r15

0801138c <__gtdf2>:
 801138c:	14d2      	push      	r4-r5, r15
 801138e:	142e      	subi      	r14, r14, 56
 8011390:	b800      	st.w      	r0, (r14, 0x0)
 8011392:	b821      	st.w      	r1, (r14, 0x4)
 8011394:	6c3b      	mov      	r0, r14
 8011396:	6d47      	mov      	r5, r1
 8011398:	1904      	addi      	r1, r14, 16
 801139a:	b842      	st.w      	r2, (r14, 0x8)
 801139c:	b863      	st.w      	r3, (r14, 0xc)
 801139e:	e00001d9 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113a2:	1909      	addi      	r1, r14, 36
 80113a4:	1802      	addi      	r0, r14, 8
 80113a6:	e00001d5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113aa:	9844      	ld.w      	r2, (r14, 0x10)
 80113ac:	3301      	movi      	r3, 1
 80113ae:	648c      	cmphs      	r3, r2
 80113b0:	080a      	bt      	0x80113c4	// 80113c4 <__gtdf2+0x38>
 80113b2:	9849      	ld.w      	r2, (r14, 0x24)
 80113b4:	648c      	cmphs      	r3, r2
 80113b6:	0807      	bt      	0x80113c4	// 80113c4 <__gtdf2+0x38>
 80113b8:	1909      	addi      	r1, r14, 36
 80113ba:	1804      	addi      	r0, r14, 16
 80113bc:	e000023c 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 80113c0:	140e      	addi      	r14, r14, 56
 80113c2:	1492      	pop      	r4-r5, r15
 80113c4:	3000      	movi      	r0, 0
 80113c6:	2800      	subi      	r0, 1
 80113c8:	140e      	addi      	r14, r14, 56
 80113ca:	1492      	pop      	r4-r5, r15

080113cc <__gedf2>:
 80113cc:	14d2      	push      	r4-r5, r15
 80113ce:	142e      	subi      	r14, r14, 56
 80113d0:	b800      	st.w      	r0, (r14, 0x0)
 80113d2:	b821      	st.w      	r1, (r14, 0x4)
 80113d4:	6c3b      	mov      	r0, r14
 80113d6:	6d47      	mov      	r5, r1
 80113d8:	1904      	addi      	r1, r14, 16
 80113da:	b842      	st.w      	r2, (r14, 0x8)
 80113dc:	b863      	st.w      	r3, (r14, 0xc)
 80113de:	e00001b9 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113e2:	1909      	addi      	r1, r14, 36
 80113e4:	1802      	addi      	r0, r14, 8
 80113e6:	e00001b5 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80113ea:	9844      	ld.w      	r2, (r14, 0x10)
 80113ec:	3301      	movi      	r3, 1
 80113ee:	648c      	cmphs      	r3, r2
 80113f0:	080a      	bt      	0x8011404	// 8011404 <__gedf2+0x38>
 80113f2:	9849      	ld.w      	r2, (r14, 0x24)
 80113f4:	648c      	cmphs      	r3, r2
 80113f6:	0807      	bt      	0x8011404	// 8011404 <__gedf2+0x38>
 80113f8:	1909      	addi      	r1, r14, 36
 80113fa:	1804      	addi      	r0, r14, 16
 80113fc:	e000021c 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011400:	140e      	addi      	r14, r14, 56
 8011402:	1492      	pop      	r4-r5, r15
 8011404:	3000      	movi      	r0, 0
 8011406:	2800      	subi      	r0, 1
 8011408:	140e      	addi      	r14, r14, 56
 801140a:	1492      	pop      	r4-r5, r15

0801140c <__ltdf2>:
 801140c:	14d2      	push      	r4-r5, r15
 801140e:	142e      	subi      	r14, r14, 56
 8011410:	b800      	st.w      	r0, (r14, 0x0)
 8011412:	b821      	st.w      	r1, (r14, 0x4)
 8011414:	6c3b      	mov      	r0, r14
 8011416:	6d47      	mov      	r5, r1
 8011418:	1904      	addi      	r1, r14, 16
 801141a:	b863      	st.w      	r3, (r14, 0xc)
 801141c:	b842      	st.w      	r2, (r14, 0x8)
 801141e:	e0000199 	bsr      	0x8011750	// 8011750 <__unpack_d>
 8011422:	1802      	addi      	r0, r14, 8
 8011424:	1909      	addi      	r1, r14, 36
 8011426:	e0000195 	bsr      	0x8011750	// 8011750 <__unpack_d>
 801142a:	9864      	ld.w      	r3, (r14, 0x10)
 801142c:	3001      	movi      	r0, 1
 801142e:	64c0      	cmphs      	r0, r3
 8011430:	0808      	bt      	0x8011440	// 8011440 <__ltdf2+0x34>
 8011432:	9869      	ld.w      	r3, (r14, 0x24)
 8011434:	64c0      	cmphs      	r0, r3
 8011436:	0805      	bt      	0x8011440	// 8011440 <__ltdf2+0x34>
 8011438:	1909      	addi      	r1, r14, 36
 801143a:	1804      	addi      	r0, r14, 16
 801143c:	e00001fc 	bsr      	0x8011834	// 8011834 <__fpcmp_parts_d>
 8011440:	140e      	addi      	r14, r14, 56
 8011442:	1492      	pop      	r4-r5, r15

08011444 <__floatsidf>:
 8011444:	14d0      	push      	r15
 8011446:	1425      	subi      	r14, r14, 20
 8011448:	3303      	movi      	r3, 3
 801144a:	b860      	st.w      	r3, (r14, 0x0)
 801144c:	487f      	lsri      	r3, r0, 31
 801144e:	b861      	st.w      	r3, (r14, 0x4)
 8011450:	e9200009 	bnez      	r0, 0x8011462	// 8011462 <__floatsidf+0x1e>
 8011454:	3302      	movi      	r3, 2
 8011456:	b860      	st.w      	r3, (r14, 0x0)
 8011458:	6c3b      	mov      	r0, r14
 801145a:	e00000b3 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801145e:	1405      	addi      	r14, r14, 20
 8011460:	1490      	pop      	r15
 8011462:	e9a00008 	bhsz      	r0, 0x8011472	// 8011472 <__floatsidf+0x2e>
 8011466:	ea238000 	movih      	r3, 32768
 801146a:	64c2      	cmpne      	r0, r3
 801146c:	0c1c      	bf      	0x80114a4	// 80114a4 <__floatsidf+0x60>
 801146e:	3300      	movi      	r3, 0
 8011470:	5b01      	subu      	r0, r3, r0
 8011472:	c4007c42 	ff1      	r2, r0
 8011476:	e422001c 	addi      	r1, r2, 29
 801147a:	ea0c001f 	movi      	r12, 31
 801147e:	2a02      	subi      	r2, 3
 8011480:	4861      	lsri      	r3, r0, 1
 8011482:	6306      	subu      	r12, r1
 8011484:	c440402d 	lsl      	r13, r0, r2
 8011488:	3adf      	btsti      	r2, 31
 801148a:	70f1      	lsr      	r3, r12
 801148c:	c46d0c20 	incf      	r3, r13, 0
 8011490:	7004      	lsl      	r0, r1
 8011492:	b864      	st.w      	r3, (r14, 0x10)
 8011494:	3300      	movi      	r3, 0
 8011496:	c4030c20 	incf      	r0, r3, 0
 801149a:	333c      	movi      	r3, 60
 801149c:	60c6      	subu      	r3, r1
 801149e:	b803      	st.w      	r0, (r14, 0xc)
 80114a0:	b862      	st.w      	r3, (r14, 0x8)
 80114a2:	07db      	br      	0x8011458	// 8011458 <__floatsidf+0x14>
 80114a4:	3000      	movi      	r0, 0
 80114a6:	ea21c1e0 	movih      	r1, 49632
 80114aa:	07da      	br      	0x801145e	// 801145e <__floatsidf+0x1a>

080114ac <__fixdfsi>:
 80114ac:	14d0      	push      	r15
 80114ae:	1427      	subi      	r14, r14, 28
 80114b0:	b800      	st.w      	r0, (r14, 0x0)
 80114b2:	b821      	st.w      	r1, (r14, 0x4)
 80114b4:	6c3b      	mov      	r0, r14
 80114b6:	1902      	addi      	r1, r14, 8
 80114b8:	e000014c 	bsr      	0x8011750	// 8011750 <__unpack_d>
 80114bc:	9862      	ld.w      	r3, (r14, 0x8)
 80114be:	3202      	movi      	r2, 2
 80114c0:	64c8      	cmphs      	r2, r3
 80114c2:	082a      	bt      	0x8011516	// 8011516 <__fixdfsi+0x6a>
 80114c4:	3b44      	cmpnei      	r3, 4
 80114c6:	0c06      	bf      	0x80114d2	// 80114d2 <__fixdfsi+0x26>
 80114c8:	9804      	ld.w      	r0, (r14, 0x10)
 80114ca:	e9800026 	blz      	r0, 0x8011516	// 8011516 <__fixdfsi+0x6a>
 80114ce:	383e      	cmplti      	r0, 31
 80114d0:	080a      	bt      	0x80114e4	// 80114e4 <__fixdfsi+0x38>
 80114d2:	9863      	ld.w      	r3, (r14, 0xc)
 80114d4:	3b40      	cmpnei      	r3, 0
 80114d6:	c4000500 	mvc      	r0
 80114da:	c7c05023 	bmaski      	r3, 31
 80114de:	600c      	addu      	r0, r3
 80114e0:	1407      	addi      	r14, r14, 28
 80114e2:	1490      	pop      	r15
 80114e4:	323c      	movi      	r2, 60
 80114e6:	5a21      	subu      	r1, r2, r0
 80114e8:	e581101f 	subi      	r12, r1, 32
 80114ec:	9866      	ld.w      	r3, (r14, 0x18)
 80114ee:	321f      	movi      	r2, 31
 80114f0:	c5834040 	lsr      	r0, r3, r12
 80114f4:	6086      	subu      	r2, r1
 80114f6:	4361      	lsli      	r3, r3, 1
 80114f8:	70c8      	lsl      	r3, r2
 80114fa:	9845      	ld.w      	r2, (r14, 0x14)
 80114fc:	7085      	lsr      	r2, r1
 80114fe:	6c8c      	or      	r2, r3
 8011500:	9863      	ld.w      	r3, (r14, 0xc)
 8011502:	c7ec2880 	btsti      	r12, 31
 8011506:	c4020c40 	inct      	r0, r2, 0
 801150a:	e903ffeb 	bez      	r3, 0x80114e0	// 80114e0 <__fixdfsi+0x34>
 801150e:	3300      	movi      	r3, 0
 8011510:	5b01      	subu      	r0, r3, r0
 8011512:	1407      	addi      	r14, r14, 28
 8011514:	1490      	pop      	r15
 8011516:	3000      	movi      	r0, 0
 8011518:	1407      	addi      	r14, r14, 28
 801151a:	1490      	pop      	r15

0801151c <__floatunsidf>:
 801151c:	14d1      	push      	r4, r15
 801151e:	1425      	subi      	r14, r14, 20
 8011520:	3100      	movi      	r1, 0
 8011522:	b821      	st.w      	r1, (r14, 0x4)
 8011524:	e9000020 	bez      	r0, 0x8011564	// 8011564 <__floatunsidf+0x48>
 8011528:	c4007c42 	ff1      	r2, r0
 801152c:	e582001c 	addi      	r12, r2, 29
 8011530:	3303      	movi      	r3, 3
 8011532:	ea0d001f 	movi      	r13, 31
 8011536:	2a02      	subi      	r2, 3
 8011538:	b860      	st.w      	r3, (r14, 0x0)
 801153a:	6372      	subu      	r13, r12
 801153c:	4861      	lsri      	r3, r0, 1
 801153e:	c4404024 	lsl      	r4, r0, r2
 8011542:	3adf      	btsti      	r2, 31
 8011544:	70f5      	lsr      	r3, r13
 8011546:	c4640c20 	incf      	r3, r4, 0
 801154a:	7030      	lsl      	r0, r12
 801154c:	c4010c20 	incf      	r0, r1, 0
 8011550:	b864      	st.w      	r3, (r14, 0x10)
 8011552:	333c      	movi      	r3, 60
 8011554:	b803      	st.w      	r0, (r14, 0xc)
 8011556:	60f2      	subu      	r3, r12
 8011558:	6c3b      	mov      	r0, r14
 801155a:	b862      	st.w      	r3, (r14, 0x8)
 801155c:	e0000032 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 8011560:	1405      	addi      	r14, r14, 20
 8011562:	1491      	pop      	r4, r15
 8011564:	3302      	movi      	r3, 2
 8011566:	6c3b      	mov      	r0, r14
 8011568:	b860      	st.w      	r3, (r14, 0x0)
 801156a:	e000002b 	bsr      	0x80115c0	// 80115c0 <__pack_d>
 801156e:	1405      	addi      	r14, r14, 20
 8011570:	1491      	pop      	r4, r15
	...

08011574 <__muldi3>:
 8011574:	14c3      	push      	r4-r6
 8011576:	c602484d 	lsri      	r13, r2, 16
 801157a:	c40055ec 	zext      	r12, r0, 15, 0
 801157e:	4890      	lsri      	r4, r0, 16
 8011580:	c40255e5 	zext      	r5, r2, 15, 0
 8011584:	c4ac8426 	mult      	r6, r12, r5
 8011588:	7d50      	mult      	r5, r4
 801158a:	7f34      	mult      	r12, r13
 801158c:	7d34      	mult      	r4, r13
 801158e:	c4ac002d 	addu      	r13, r12, r5
 8011592:	c606484c 	lsri      	r12, r6, 16
 8011596:	6334      	addu      	r12, r13
 8011598:	6570      	cmphs      	r12, r5
 801159a:	0804      	bt      	0x80115a2	// 80115a2 <__muldi3+0x2e>
 801159c:	ea2d0001 	movih      	r13, 1
 80115a0:	6134      	addu      	r4, r13
 80115a2:	c60c484d 	lsri      	r13, r12, 16
 80115a6:	7cc0      	mult      	r3, r0
 80115a8:	7c48      	mult      	r1, r2
 80115aa:	6134      	addu      	r4, r13
 80115ac:	c60c482c 	lsli      	r12, r12, 16
 80115b0:	c40655e6 	zext      	r6, r6, 15, 0
 80115b4:	604c      	addu      	r1, r3
 80115b6:	c4cc0020 	addu      	r0, r12, r6
 80115ba:	6050      	addu      	r1, r4
 80115bc:	1483      	pop      	r4-r6
	...

080115c0 <__pack_d>:
 80115c0:	14c5      	push      	r4-r8
 80115c2:	9020      	ld.w      	r1, (r0, 0x0)
 80115c4:	3901      	cmphsi      	r1, 2
 80115c6:	9043      	ld.w      	r2, (r0, 0xc)
 80115c8:	9064      	ld.w      	r3, (r0, 0x10)
 80115ca:	d9a02001 	ld.w      	r13, (r0, 0x4)
 80115ce:	0c47      	bf      	0x801165c	// 801165c <__pack_d+0x9c>
 80115d0:	3944      	cmpnei      	r1, 4
 80115d2:	0c40      	bf      	0x8011652	// 8011652 <__pack_d+0x92>
 80115d4:	3942      	cmpnei      	r1, 2
 80115d6:	0c28      	bf      	0x8011626	// 8011626 <__pack_d+0x66>
 80115d8:	c4622421 	or      	r1, r2, r3
 80115dc:	e9010025 	bez      	r1, 0x8011626	// 8011626 <__pack_d+0x66>
 80115e0:	9022      	ld.w      	r1, (r0, 0x8)
 80115e2:	ea0003fd 	movi      	r0, 1021
 80115e6:	6c02      	nor      	r0, r0
 80115e8:	6405      	cmplt      	r1, r0
 80115ea:	0855      	bt      	0x8011694	// 8011694 <__pack_d+0xd4>
 80115ec:	eb2103ff 	cmplti      	r1, 1024
 80115f0:	0c31      	bf      	0x8011652	// 8011652 <__pack_d+0x92>
 80115f2:	e40220ff 	andi      	r0, r2, 255
 80115f6:	eb400080 	cmpnei      	r0, 128
 80115fa:	0c43      	bf      	0x8011680	// 8011680 <__pack_d+0xc0>
 80115fc:	347f      	movi      	r4, 127
 80115fe:	3500      	movi      	r5, 0
 8011600:	6489      	cmplt      	r2, r2
 8011602:	6091      	addc      	r2, r4
 8011604:	60d5      	addc      	r3, r5
 8011606:	c7805020 	bmaski      	r0, 29
 801160a:	64c0      	cmphs      	r0, r3
 801160c:	0c19      	bf      	0x801163e	// 801163e <__pack_d+0x7e>
 801160e:	e58103fe 	addi      	r12, r1, 1023
 8011612:	4b28      	lsri      	r1, r3, 8
 8011614:	4398      	lsli      	r4, r3, 24
 8011616:	4a08      	lsri      	r0, r2, 8
 8011618:	c4015663 	zext      	r3, r1, 19, 0
 801161c:	6c4f      	mov      	r1, r3
 801161e:	6c10      	or      	r0, r4
 8011620:	e46c27ff 	andi      	r3, r12, 2047
 8011624:	0404      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011626:	3300      	movi      	r3, 0
 8011628:	3000      	movi      	r0, 0
 801162a:	3100      	movi      	r1, 0
 801162c:	3200      	movi      	r2, 0
 801162e:	c4415e60 	ins      	r2, r1, 19, 0
 8011632:	c4435d54 	ins      	r2, r3, 30, 20
 8011636:	c44d5c1f 	ins      	r2, r13, 31, 31
 801163a:	6c4b      	mov      	r1, r2
 801163c:	1485      	pop      	r4-r8
 801163e:	439f      	lsli      	r4, r3, 31
 8011640:	c422484c 	lsri      	r12, r2, 1
 8011644:	4b01      	lsri      	r0, r3, 1
 8011646:	c5842422 	or      	r2, r4, r12
 801164a:	6cc3      	mov      	r3, r0
 801164c:	e58103ff 	addi      	r12, r1, 1024
 8011650:	07e1      	br      	0x8011612	// 8011612 <__pack_d+0x52>
 8011652:	ea0307ff 	movi      	r3, 2047
 8011656:	3000      	movi      	r0, 0
 8011658:	3100      	movi      	r1, 0
 801165a:	07e9      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 801165c:	c703482c 	lsli      	r12, r3, 24
 8011660:	4a48      	lsri      	r2, r2, 8
 8011662:	c44c2420 	or      	r0, r12, r2
 8011666:	c5035741 	zext      	r1, r3, 26, 8
 801166a:	3200      	movi      	r2, 0
 801166c:	ea230008 	movih      	r3, 8
 8011670:	6c08      	or      	r0, r2
 8011672:	6c4c      	or      	r1, r3
 8011674:	c4015663 	zext      	r3, r1, 19, 0
 8011678:	6c4f      	mov      	r1, r3
 801167a:	ea0307ff 	movi      	r3, 2047
 801167e:	07d7      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011680:	e4022100 	andi      	r0, r2, 256
 8011684:	e900ffc1 	bez      	r0, 0x8011606	// 8011606 <__pack_d+0x46>
 8011688:	3480      	movi      	r4, 128
 801168a:	3500      	movi      	r5, 0
 801168c:	6489      	cmplt      	r2, r2
 801168e:	6091      	addc      	r2, r4
 8011690:	60d5      	addc      	r3, r5
 8011692:	07ba      	br      	0x8011606	// 8011606 <__pack_d+0x46>
 8011694:	5825      	subu      	r1, r0, r1
 8011696:	eb210038 	cmplti      	r1, 57
 801169a:	0fc6      	bf      	0x8011626	// 8011626 <__pack_d+0x66>
 801169c:	341f      	movi      	r4, 31
 801169e:	c423482c 	lsli      	r12, r3, 1
 80116a2:	6106      	subu      	r4, r1
 80116a4:	e401101f 	subi      	r0, r1, 32
 80116a8:	7310      	lsl      	r12, r4
 80116aa:	c4224046 	lsr      	r6, r2, r1
 80116ae:	38df      	btsti      	r0, 31
 80116b0:	c4034045 	lsr      	r5, r3, r0
 80116b4:	ea080000 	movi      	r8, 0
 80116b8:	6db0      	or      	r6, r12
 80116ba:	ea0c0001 	movi      	r12, 1
 80116be:	c4c50c20 	incf      	r6, r5, 0
 80116c2:	c40c4020 	lsl      	r0, r12, r0
 80116c6:	6d63      	mov      	r5, r8
 80116c8:	c42c4024 	lsl      	r4, r12, r1
 80116cc:	c4234047 	lsr      	r7, r3, r1
 80116d0:	c4a00c20 	incf      	r5, r0, 0
 80116d4:	c4880c20 	incf      	r4, r8, 0
 80116d8:	c4e80c20 	incf      	r7, r8, 0
 80116dc:	3c40      	cmpnei      	r4, 0
 80116de:	c4a50c81 	decf      	r5, r5, 1
 80116e2:	2c00      	subi      	r4, 1
 80116e4:	6890      	and      	r2, r4
 80116e6:	68d4      	and      	r3, r5
 80116e8:	6c8c      	or      	r2, r3
 80116ea:	3a40      	cmpnei      	r2, 0
 80116ec:	c4000502 	mvc      	r2
 80116f0:	6ce3      	mov      	r3, r8
 80116f2:	6d88      	or      	r6, r2
 80116f4:	6dcc      	or      	r7, r3
 80116f6:	e46620ff 	andi      	r3, r6, 255
 80116fa:	eb430080 	cmpnei      	r3, 128
 80116fe:	0814      	bt      	0x8011726	// 8011726 <__pack_d+0x166>
 8011700:	e4662100 	andi      	r3, r6, 256
 8011704:	e9230023 	bnez      	r3, 0x801174a	// 801174a <__pack_d+0x18a>
 8011708:	4758      	lsli      	r2, r7, 24
 801170a:	4f28      	lsri      	r1, r7, 8
 801170c:	4e08      	lsri      	r0, r6, 8
 801170e:	6c08      	or      	r0, r2
 8011710:	c4015662 	zext      	r2, r1, 19, 0
 8011714:	6c4b      	mov      	r1, r2
 8011716:	c7605022 	bmaski      	r2, 28
 801171a:	65c8      	cmphs      	r2, r7
 801171c:	0c02      	bf      	0x8011720	// 8011720 <__pack_d+0x160>
 801171e:	6f0f      	mov      	r12, r3
 8011720:	e46c2001 	andi      	r3, r12, 1
 8011724:	0784      	br      	0x801162c	// 801162c <__pack_d+0x6c>
 8011726:	327f      	movi      	r2, 127
 8011728:	3300      	movi      	r3, 0
 801172a:	6599      	cmplt      	r6, r6
 801172c:	6189      	addc      	r6, r2
 801172e:	61cd      	addc      	r7, r3
 8011730:	4778      	lsli      	r3, r7, 24
 8011732:	4f28      	lsri      	r1, r7, 8
 8011734:	4e08      	lsri      	r0, r6, 8
 8011736:	6c0c      	or      	r0, r3
 8011738:	c4015663 	zext      	r3, r1, 19, 0
 801173c:	6c4f      	mov      	r1, r3
 801173e:	c7605023 	bmaski      	r3, 28
 8011742:	65cc      	cmphs      	r3, r7
 8011744:	0fee      	bf      	0x8011720	// 8011720 <__pack_d+0x160>
 8011746:	6f23      	mov      	r12, r8
 8011748:	07ec      	br      	0x8011720	// 8011720 <__pack_d+0x160>
 801174a:	3280      	movi      	r2, 128
 801174c:	07ee      	br      	0x8011728	// 8011728 <__pack_d+0x168>
	...

08011750 <__unpack_d>:
 8011750:	1421      	subi      	r14, r14, 4
 8011752:	dd6e2000 	st.w      	r11, (r14, 0x0)
 8011756:	8863      	ld.h      	r3, (r0, 0x6)
 8011758:	8047      	ld.b      	r2, (r0, 0x7)
 801175a:	c48355c3 	zext      	r3, r3, 14, 4
 801175e:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011762:	4a47      	lsri      	r2, r2, 7
 8011764:	d9a02000 	ld.w      	r13, (r0, 0x0)
 8011768:	c40c566c 	zext      	r12, r12, 19, 0
 801176c:	b141      	st.w      	r2, (r1, 0x4)
 801176e:	e9230025 	bnez      	r3, 0x80117b8	// 80117b8 <__unpack_d+0x68>
 8011772:	c58d2423 	or      	r3, r13, r12
 8011776:	e903003c 	bez      	r3, 0x80117ee	// 80117ee <__unpack_d+0x9e>
 801177a:	c70d4840 	lsri      	r0, r13, 24
 801177e:	c50c4823 	lsli      	r3, r12, 8
 8011782:	6cc0      	or      	r3, r0
 8011784:	3003      	movi      	r0, 3
 8011786:	c50d4822 	lsli      	r2, r13, 8
 801178a:	b100      	st.w      	r0, (r1, 0x0)
 801178c:	c760502d 	bmaski      	r13, 28
 8011790:	ea0003fe 	movi      	r0, 1022
 8011794:	6c02      	nor      	r0, r0
 8011796:	6ecb      	mov      	r11, r2
 8011798:	6f0f      	mov      	r12, r3
 801179a:	6489      	cmplt      	r2, r2
 801179c:	60ad      	addc      	r2, r11
 801179e:	60f1      	addc      	r3, r12
 80117a0:	64f4      	cmphs      	r13, r3
 80117a2:	6f03      	mov      	r12, r0
 80117a4:	2800      	subi      	r0, 1
 80117a6:	0bf8      	bt      	0x8011796	// 8011796 <__unpack_d+0x46>
 80117a8:	dd812002 	st.w      	r12, (r1, 0x8)
 80117ac:	b143      	st.w      	r2, (r1, 0xc)
 80117ae:	b164      	st.w      	r3, (r1, 0x10)
 80117b0:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117b4:	1401      	addi      	r14, r14, 4
 80117b6:	783c      	jmp      	r15
 80117b8:	eb4307ff 	cmpnei      	r3, 2047
 80117bc:	0c1f      	bf      	0x80117fa	// 80117fa <__unpack_d+0xaa>
 80117be:	e46313fe 	subi      	r3, r3, 1023
 80117c2:	b162      	st.w      	r3, (r1, 0x8)
 80117c4:	3303      	movi      	r3, 3
 80117c6:	c70d4840 	lsri      	r0, r13, 24
 80117ca:	b160      	st.w      	r3, (r1, 0x0)
 80117cc:	c50c4823 	lsli      	r3, r12, 8
 80117d0:	c50d4822 	lsli      	r2, r13, 8
 80117d4:	6cc0      	or      	r3, r0
 80117d6:	ea0c0000 	movi      	r12, 0
 80117da:	ea2d1000 	movih      	r13, 4096
 80117de:	6cb0      	or      	r2, r12
 80117e0:	6cf4      	or      	r3, r13
 80117e2:	b143      	st.w      	r2, (r1, 0xc)
 80117e4:	b164      	st.w      	r3, (r1, 0x10)
 80117e6:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117ea:	1401      	addi      	r14, r14, 4
 80117ec:	783c      	jmp      	r15
 80117ee:	3302      	movi      	r3, 2
 80117f0:	b160      	st.w      	r3, (r1, 0x0)
 80117f2:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117f6:	1401      	addi      	r14, r14, 4
 80117f8:	783c      	jmp      	r15
 80117fa:	c58d2423 	or      	r3, r13, r12
 80117fe:	e9030018 	bez      	r3, 0x801182e	// 801182e <__unpack_d+0xde>
 8011802:	ea230008 	movih      	r3, 8
 8011806:	68f0      	and      	r3, r12
 8011808:	3b40      	cmpnei      	r3, 0
 801180a:	3201      	movi      	r2, 1
 801180c:	c4620c40 	inct      	r3, r2, 0
 8011810:	b160      	st.w      	r3, (r1, 0x0)
 8011812:	c50c482c 	lsli      	r12, r12, 8
 8011816:	c70d4843 	lsri      	r3, r13, 24
 801181a:	6f0c      	or      	r12, r3
 801181c:	c50d482d 	lsli      	r13, r13, 8
 8011820:	c76c282c 	bclri      	r12, r12, 27
 8011824:	dda12003 	st.w      	r13, (r1, 0xc)
 8011828:	dd812004 	st.w      	r12, (r1, 0x10)
 801182c:	07dd      	br      	0x80117e6	// 80117e6 <__unpack_d+0x96>
 801182e:	3304      	movi      	r3, 4
 8011830:	b160      	st.w      	r3, (r1, 0x0)
 8011832:	07da      	br      	0x80117e6	// 80117e6 <__unpack_d+0x96>

08011834 <__fpcmp_parts_d>:
 8011834:	9040      	ld.w      	r2, (r0, 0x0)
 8011836:	3301      	movi      	r3, 1
 8011838:	648c      	cmphs      	r3, r2
 801183a:	0830      	bt      	0x801189a	// 801189a <__fpcmp_parts_d+0x66>
 801183c:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011840:	670c      	cmphs      	r3, r12
 8011842:	082c      	bt      	0x801189a	// 801189a <__fpcmp_parts_d+0x66>
 8011844:	3a44      	cmpnei      	r2, 4
 8011846:	0c1f      	bf      	0x8011884	// 8011884 <__fpcmp_parts_d+0x50>
 8011848:	eb4c0004 	cmpnei      	r12, 4
 801184c:	0c14      	bf      	0x8011874	// 8011874 <__fpcmp_parts_d+0x40>
 801184e:	3a42      	cmpnei      	r2, 2
 8011850:	0c0f      	bf      	0x801186e	// 801186e <__fpcmp_parts_d+0x3a>
 8011852:	eb4c0002 	cmpnei      	r12, 2
 8011856:	0c1a      	bf      	0x801188a	// 801188a <__fpcmp_parts_d+0x56>
 8011858:	9041      	ld.w      	r2, (r0, 0x4)
 801185a:	d9812001 	ld.w      	r12, (r1, 0x4)
 801185e:	670a      	cmpne      	r2, r12
 8011860:	0c1f      	bf      	0x801189e	// 801189e <__fpcmp_parts_d+0x6a>
 8011862:	3000      	movi      	r0, 0
 8011864:	2800      	subi      	r0, 1
 8011866:	3a40      	cmpnei      	r2, 0
 8011868:	c4030c20 	incf      	r0, r3, 0
 801186c:	783c      	jmp      	r15
 801186e:	eb4c0002 	cmpnei      	r12, 2
 8011872:	0c2a      	bf      	0x80118c6	// 80118c6 <__fpcmp_parts_d+0x92>
 8011874:	9141      	ld.w      	r2, (r1, 0x4)
 8011876:	3300      	movi      	r3, 0
 8011878:	2b00      	subi      	r3, 1
 801187a:	3a40      	cmpnei      	r2, 0
 801187c:	3001      	movi      	r0, 1
 801187e:	c4030c20 	incf      	r0, r3, 0
 8011882:	783c      	jmp      	r15
 8011884:	eb4c0004 	cmpnei      	r12, 4
 8011888:	0c21      	bf      	0x80118ca	// 80118ca <__fpcmp_parts_d+0x96>
 801188a:	9061      	ld.w      	r3, (r0, 0x4)
 801188c:	3000      	movi      	r0, 0
 801188e:	3b40      	cmpnei      	r3, 0
 8011890:	2800      	subi      	r0, 1
 8011892:	3301      	movi      	r3, 1
 8011894:	c4030c20 	incf      	r0, r3, 0
 8011898:	783c      	jmp      	r15
 801189a:	6c0f      	mov      	r0, r3
 801189c:	783c      	jmp      	r15
 801189e:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80118a2:	d9812002 	ld.w      	r12, (r1, 0x8)
 80118a6:	6771      	cmplt      	r12, r13
 80118a8:	0bdd      	bt      	0x8011862	// 8011862 <__fpcmp_parts_d+0x2e>
 80118aa:	6735      	cmplt      	r13, r12
 80118ac:	0c13      	bf      	0x80118d2	// 80118d2 <__fpcmp_parts_d+0x9e>
 80118ae:	3000      	movi      	r0, 0
 80118b0:	2800      	subi      	r0, 1
 80118b2:	3a40      	cmpnei      	r2, 0
 80118b4:	c4030c40 	inct      	r0, r3, 0
 80118b8:	07da      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118ba:	644c      	cmphs      	r3, r1
 80118bc:	0fdd      	bf      	0x8011876	// 8011876 <__fpcmp_parts_d+0x42>
 80118be:	64c6      	cmpne      	r1, r3
 80118c0:	0803      	bt      	0x80118c6	// 80118c6 <__fpcmp_parts_d+0x92>
 80118c2:	6430      	cmphs      	r12, r0
 80118c4:	0fd9      	bf      	0x8011876	// 8011876 <__fpcmp_parts_d+0x42>
 80118c6:	3000      	movi      	r0, 0
 80118c8:	07d2      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118ca:	9161      	ld.w      	r3, (r1, 0x4)
 80118cc:	9001      	ld.w      	r0, (r0, 0x4)
 80118ce:	5b01      	subu      	r0, r3, r0
 80118d0:	07ce      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
 80118d2:	9064      	ld.w      	r3, (r0, 0x10)
 80118d4:	d9802003 	ld.w      	r12, (r0, 0xc)
 80118d8:	9103      	ld.w      	r0, (r1, 0xc)
 80118da:	9124      	ld.w      	r1, (r1, 0x10)
 80118dc:	64c4      	cmphs      	r1, r3
 80118de:	0c05      	bf      	0x80118e8	// 80118e8 <__fpcmp_parts_d+0xb4>
 80118e0:	644e      	cmpne      	r3, r1
 80118e2:	0bec      	bt      	0x80118ba	// 80118ba <__fpcmp_parts_d+0x86>
 80118e4:	6700      	cmphs      	r0, r12
 80118e6:	0bea      	bt      	0x80118ba	// 80118ba <__fpcmp_parts_d+0x86>
 80118e8:	3000      	movi      	r0, 0
 80118ea:	2800      	subi      	r0, 1
 80118ec:	3a40      	cmpnei      	r2, 0
 80118ee:	3301      	movi      	r3, 1
 80118f0:	c4030c20 	incf      	r0, r3, 0
 80118f4:	07bc      	br      	0x801186c	// 801186c <__fpcmp_parts_d+0x38>
	...

080118f8 <__GI_putchar>:
 80118f8:	14d0      	push      	r15
 80118fa:	1063      	lrw      	r3, 0x20000120	// 8011904 <__GI_putchar+0xc>
 80118fc:	9320      	ld.w      	r1, (r3, 0x0)
 80118fe:	e000003f 	bsr      	0x801197c	// 801197c <__GI_putc>
 8011902:	1490      	pop      	r15
 8011904:	20000120 	.long	0x20000120

08011908 <__GI_puts>:
 8011908:	14d1      	push      	r4, r15
 801190a:	1085      	lrw      	r4, 0x20000120	// 801191c <__GI_puts+0x14>
 801190c:	9420      	ld.w      	r1, (r4, 0x0)
 801190e:	e0000009 	bsr      	0x8011920	// 8011920 <__GI_fputs>
 8011912:	9420      	ld.w      	r1, (r4, 0x0)
 8011914:	300a      	movi      	r0, 10
 8011916:	e0001781 	bsr      	0x8014818	// 8014818 <fputc>
 801191a:	1491      	pop      	r4, r15
 801191c:	20000120 	.long	0x20000120

08011920 <__GI_fputs>:
 8011920:	14d5      	push      	r4-r8, r15
 8011922:	6d03      	mov      	r4, r0
 8011924:	6d87      	mov      	r6, r1
 8011926:	e9010018 	bez      	r1, 0x8011956	// 8011956 <__GI_fputs+0x36>
 801192a:	e5010017 	addi      	r8, r1, 24
 801192e:	6c23      	mov      	r0, r8
 8011930:	e0000020 	bsr      	0x8011970	// 8011970 <__GI_os_critical_enter>
 8011934:	8400      	ld.b      	r0, (r4, 0x0)
 8011936:	e9000014 	bez      	r0, 0x801195e	// 801195e <__GI_fputs+0x3e>
 801193a:	3500      	movi      	r5, 0
 801193c:	6dd7      	mov      	r7, r5
 801193e:	2f00      	subi      	r7, 1
 8011940:	0406      	br      	0x801194c	// 801194c <__GI_fputs+0x2c>
 8011942:	2400      	addi      	r4, 1
 8011944:	8400      	ld.b      	r0, (r4, 0x0)
 8011946:	2500      	addi      	r5, 1
 8011948:	e900000c 	bez      	r0, 0x8011960	// 8011960 <__GI_fputs+0x40>
 801194c:	6c5b      	mov      	r1, r6
 801194e:	e0001765 	bsr      	0x8014818	// 8014818 <fputc>
 8011952:	65c2      	cmpne      	r0, r7
 8011954:	0bf7      	bt      	0x8011942	// 8011942 <__GI_fputs+0x22>
 8011956:	3500      	movi      	r5, 0
 8011958:	2d00      	subi      	r5, 1
 801195a:	6c17      	mov      	r0, r5
 801195c:	1495      	pop      	r4-r8, r15
 801195e:	6d43      	mov      	r5, r0
 8011960:	6c23      	mov      	r0, r8
 8011962:	e0000009 	bsr      	0x8011974	// 8011974 <__GI_os_critical_exit>
 8011966:	6c17      	mov      	r0, r5
 8011968:	1495      	pop      	r4-r8, r15
	...

0801196c <__GI_os_critical_open>:
 801196c:	3000      	movi      	r0, 0
 801196e:	783c      	jmp      	r15

08011970 <__GI_os_critical_enter>:
 8011970:	3000      	movi      	r0, 0
 8011972:	783c      	jmp      	r15

08011974 <__GI_os_critical_exit>:
 8011974:	3000      	movi      	r0, 0
 8011976:	783c      	jmp      	r15

08011978 <__GI_os_critical_close>:
 8011978:	3000      	movi      	r0, 0
 801197a:	783c      	jmp      	r15

0801197c <__GI_putc>:
 801197c:	14d0      	push      	r15
 801197e:	e000174d 	bsr      	0x8014818	// 8014818 <fputc>
 8011982:	1490      	pop      	r15

08011984 <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011984:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011988:	e90c0044 	bez      	r12, 0x8011a10	// 8011a10 <HAL_GPIO_Init+0x8c>
 801198c:	3200      	movi      	r2, 0
	{
		ioposition = (0x01 << position);
 801198e:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 8011992:	ea96001f 	lrw      	r22, 0x8014a24	// 8011a0c <HAL_GPIO_Init+0x88>
 8011996:	0406      	br      	0x80119a2	// 80119a2 <HAL_GPIO_Init+0x1e>
			{
				SET_BIT(GPIOx->IE, ioposition);
			}
		}
		
		position++;
 8011998:	2200      	addi      	r2, 1
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 801199a:	c44c4043 	lsr      	r3, r12, r2
 801199e:	e9030039 	bez      	r3, 0x8011a10	// 8011a10 <HAL_GPIO_Init+0x8c>
		ioposition = (0x01 << position);
 80119a2:	c4544023 	lsl      	r3, r20, r2
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 80119a6:	c583202d 	and      	r13, r3, r12
		if (iocurrent == ioposition)
 80119aa:	674e      	cmpne      	r3, r13
 80119ac:	0bf6      	bt      	0x8011998	// 8011998 <HAL_GPIO_Init+0x14>
			switch (GPIO_Init->Mode)
 80119ae:	da612001 	ld.w      	r19, (r1, 0x4)
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 80119b2:	da402004 	ld.w      	r18, (r0, 0x10)
 80119b6:	c463248d 	nor      	r13, r3, r3
			switch (GPIO_Init->Mode)
 80119ba:	eb530002 	cmpnei      	r19, 2
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 80119be:	c5b22032 	and      	r18, r18, r13
 80119c2:	de402004 	st.w      	r18, (r0, 0x10)
			switch (GPIO_Init->Mode)
 80119c6:	0c44      	bf      	0x8011a4e	// 8011a4e <HAL_GPIO_Init+0xca>
 80119c8:	eb130002 	cmphsi      	r19, 3
 80119cc:	0823      	bt      	0x8011a12	// 8011a12 <HAL_GPIO_Init+0x8e>
 80119ce:	eb530001 	cmpnei      	r19, 1
 80119d2:	08a3      	bt      	0x8011b18	// 8011b18 <HAL_GPIO_Init+0x194>
 80119d4:	ea120000 	movi      	r18, 0
 80119d8:	e6521085 	subi      	r18, r18, 134
					CLEAR_BIT(GPIOx->DIR, ioposition);
 80119dc:	daa02002 	ld.w      	r21, (r0, 0x8)
 80119e0:	c6ad2035 	and      	r21, r13, r21
 80119e4:	dea02002 	st.w      	r21, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 80119e8:	daa12002 	ld.w      	r21, (r1, 0x8)
 80119ec:	eb550012 	cmpnei      	r21, 18
 80119f0:	0c1b      	bf      	0x8011a26	// 8011a26 <HAL_GPIO_Init+0xa2>
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 80119f2:	eb550013 	cmpnei      	r21, 19
 80119f6:	0c37      	bf      	0x8011a64	// 8011a64 <HAL_GPIO_Init+0xe0>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 80119f8:	eb550014 	cmpnei      	r21, 20
 80119fc:	0c91      	bf      	0x8011b1e	// 8011b1e <HAL_GPIO_Init+0x19a>
			switch (GPIO_Init->Mode)
 80119fe:	eb120004 	cmphsi      	r18, 5
 8011a02:	0821      	bt      	0x8011a44	// 8011a44 <HAL_GPIO_Init+0xc0>
 8011a04:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8011a08:	e8d20000 	jmp      	r18
 8011a0c:	08014a24 	.long	0x08014a24
	}
}
 8011a10:	783c      	jmp      	r15
			switch (GPIO_Init->Mode)
 8011a12:	e6531086 	subi      	r18, r19, 135
 8011a16:	eb120004 	cmphsi      	r18, 5
 8011a1a:	0fe1      	bf      	0x80119dc	// 80119dc <HAL_GPIO_Init+0x58>
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011a1c:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011a20:	eb550012 	cmpnei      	r21, 18
 8011a24:	0be7      	bt      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x6e>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011a26:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011a2a:	c6a32435 	or      	r21, r3, r21
 8011a2e:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011a32:	daa02007 	ld.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011a36:	eb120004 	cmphsi      	r18, 5
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011a3a:	c6ad2035 	and      	r21, r13, r21
 8011a3e:	dea02007 	st.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011a42:	0fe1      	bf      	0x8011a04	// 8011a04 <HAL_GPIO_Init+0x80>
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8011a44:	e6732080 	andi      	r19, r19, 128
 8011a48:	e913ffa8 	bez      	r19, 0x8011998	// 8011998 <HAL_GPIO_Init+0x14>
 8011a4c:	0423      	br      	0x8011a92	// 8011a92 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->DIR, ioposition);
 8011a4e:	da402002 	ld.w      	r18, (r0, 0x8)
 8011a52:	c6432432 	or      	r18, r3, r18
 8011a56:	de402002 	st.w      	r18, (r0, 0x8)
 8011a5a:	ea120000 	movi      	r18, 0
 8011a5e:	e6521084 	subi      	r18, r18, 133
					break;
 8011a62:	07c3      	br      	0x80119e8	// 80119e8 <HAL_GPIO_Init+0x64>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011a64:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011a68:	c6ad2035 	and      	r21, r13, r21
 8011a6c:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011a70:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011a74:	c6ad2035 	and      	r21, r13, r21
 8011a78:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011a7c:	07c1      	br      	0x80119fe	// 80119fe <HAL_GPIO_Init+0x7a>
					SET_BIT(GPIOx->IS, ioposition);
 8011a7e:	d9a02008 	ld.w      	r13, (r0, 0x20)
 8011a82:	6f4c      	or      	r13, r3
 8011a84:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IEV, ioposition);
 8011a88:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011a8c:	6f4c      	or      	r13, r3
 8011a8e:	dda0200a 	st.w      	r13, (r0, 0x28)
				SET_BIT(GPIOx->IE, ioposition);
 8011a92:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 8011a96:	6cf4      	or      	r3, r13
 8011a98:	b06b      	st.w      	r3, (r0, 0x2c)
 8011a9a:	077f      	br      	0x8011998	// 8011998 <HAL_GPIO_Init+0x14>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011a9c:	da402008 	ld.w      	r18, (r0, 0x20)
 8011aa0:	c64d202d 	and      	r13, r13, r18
 8011aa4:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8011aa8:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8011aac:	6f4c      	or      	r13, r3
 8011aae:	dda02009 	st.w      	r13, (r0, 0x24)
					break;
 8011ab2:	07f0      	br      	0x8011a92	// 8011a92 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011ab4:	da402008 	ld.w      	r18, (r0, 0x20)
 8011ab8:	c64d2032 	and      	r18, r13, r18
 8011abc:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011ac0:	da402009 	ld.w      	r18, (r0, 0x24)
 8011ac4:	c64d2032 	and      	r18, r13, r18
 8011ac8:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011acc:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011ad0:	c64d202d 	and      	r13, r13, r18
 8011ad4:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011ad8:	07dd      	br      	0x8011a92	// 8011a92 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011ada:	da402008 	ld.w      	r18, (r0, 0x20)
 8011ade:	c64d2032 	and      	r18, r13, r18
 8011ae2:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011ae6:	da402009 	ld.w      	r18, (r0, 0x24)
 8011aea:	c64d202d 	and      	r13, r13, r18
 8011aee:	dda02009 	st.w      	r13, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8011af2:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011af6:	6f4c      	or      	r13, r3
 8011af8:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011afc:	07cb      	br      	0x8011a92	// 8011a92 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->IS, ioposition);
 8011afe:	da402008 	ld.w      	r18, (r0, 0x20)
 8011b02:	c6432432 	or      	r18, r3, r18
 8011b06:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011b0a:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011b0e:	c64d202d 	and      	r13, r13, r18
 8011b12:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011b16:	07be      	br      	0x8011a92	// 8011a92 <HAL_GPIO_Init+0x10e>
 8011b18:	e6531086 	subi      	r18, r19, 135
 8011b1c:	0766      	br      	0x80119e8	// 80119e8 <HAL_GPIO_Init+0x64>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011b1e:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011b22:	c6a32435 	or      	r21, r3, r21
 8011b26:	dea02003 	st.w      	r21, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011b2a:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011b2e:	c6a32435 	or      	r21, r3, r21
 8011b32:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011b36:	0764      	br      	0x80119fe	// 80119fe <HAL_GPIO_Init+0x7a>

08011b38 <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011b38:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011b3c:	9061      	ld.w      	r3, (r0, 0x4)
 8011b3e:	6cc4      	or      	r3, r1
 8011b40:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011b42:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8011b44:	e9220008 	bnez      	r2, 0x8011b54	// 8011b54 <HAL_GPIO_WritePin+0x1c>
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011b48:	c4232041 	andn      	r1, r3, r1
 8011b4c:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011b4e:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011b52:	783c      	jmp      	r15
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011b54:	6c4c      	or      	r1, r3
 8011b56:	b020      	st.w      	r1, (r0, 0x0)
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011b58:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011b5c:	783c      	jmp      	r15
	...

08011b60 <HAL_InitTick>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b60:	ea234000 	movih      	r3, 16384
 8011b64:	e4630dff 	addi      	r3, r3, 3584
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
}


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011b68:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b6a:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011b6c:	748c      	zextb      	r2, r3
 8011b6e:	ea0301e0 	movi      	r3, 480
 8011b72:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011b76:	ea02f424 	movi      	r2, 62500
 8011b7a:	c4824902 	rotli      	r2, r2, 4
 8011b7e:	7cc8      	mult      	r3, r2
 8011b80:	ea0203e8 	movi      	r2, 1000
 8011b84:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011b88:	104f      	lrw      	r2, 0xe000e010	// 8011bc4 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011b8a:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011b8c:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b8e:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011b90:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011b92:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011b94:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011b96:	104d      	lrw      	r2, 0xe000e100	// 8011bc8 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011b98:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011b9c:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011ba0:	ea0dff00 	movi      	r13, 65280
 8011ba4:	6f76      	nor      	r13, r13
 8011ba6:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ba8:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011bac:	6cc4      	or      	r3, r1
 8011bae:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011bb2:	ea230200 	movih      	r3, 512
 8011bb6:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011bb8:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011bbc:	1064      	lrw      	r3, 0x20001864	// 8011bcc <HAL_InitTick+0x6c>
 8011bbe:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011bc2:	783c      	jmp      	r15
 8011bc4:	e000e010 	.long	0xe000e010
 8011bc8:	e000e100 	.long	0xe000e100
 8011bcc:	20001864 	.long	0x20001864

08011bd0 <SystemClock_Config>:
{
 8011bd0:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011bd2:	5867      	subi      	r3, r0, 2
 8011bd4:	eb0300ee 	cmphsi      	r3, 239
 8011bd8:	0826      	bt      	0x8011c24	// 8011c24 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011bda:	ea224000 	movih      	r2, 16384
 8011bde:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011be2:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011be6:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011be8:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011bea:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011bee:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011bf0:	330f      	movi      	r3, 15
 8011bf2:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011bf4:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011bf6:	ea22ff00 	movih      	r2, 65280
 8011bfa:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011bfc:	320c      	movi      	r2, 12
 8011bfe:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011c00:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011c02:	0c12      	bf      	0x8011c26	// 8011c26 <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011c04:	c4028022 	divu      	r2, r2, r0
 8011c08:	4250      	lsli      	r2, r2, 16
 8011c0a:	ea010300 	movi      	r1, 768
 8011c0e:	6c0c      	or      	r0, r3
 8011c10:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011c12:	ea234000 	movih      	r3, 16384
 8011c16:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011c1a:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011c1c:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011c1e:	3007      	movi      	r0, 7
 8011c20:	e3ffffa0 	bsr      	0x8011b60	// 8011b60 <HAL_InitTick>
}
 8011c24:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011c26:	4822      	lsri      	r1, r0, 2
 8011c28:	4128      	lsli      	r1, r1, 8
 8011c2a:	ea220001 	movih      	r2, 1
 8011c2e:	07f0      	br      	0x8011c0e	// 8011c0e <SystemClock_Config+0x3e>

08011c30 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011c30:	1043      	lrw      	r2, 0x20001860	// 8011c3c <HAL_IncTick+0xc>
 8011c32:	9260      	ld.w      	r3, (r2, 0x0)
 8011c34:	2300      	addi      	r3, 1
 8011c36:	b260      	st.w      	r3, (r2, 0x0)
}
 8011c38:	783c      	jmp      	r15
 8011c3a:	0000      	.short	0x0000
 8011c3c:	20001860 	.long	0x20001860

08011c40 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011c40:	1062      	lrw      	r3, 0x20001860	// 8011c48 <HAL_GetTick+0x8>
 8011c42:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011c44:	783c      	jmp      	r15
 8011c46:	0000      	.short	0x0000
 8011c48:	20001860 	.long	0x20001860

08011c4c <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011c4c:	14d2      	push      	r4-r5, r15
 8011c4e:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8011c50:	e3fffff8 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
 8011c54:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011c56:	e3fffff5 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
 8011c5a:	6012      	subu      	r0, r4
 8011c5c:	6540      	cmphs      	r0, r5
 8011c5e:	0ffc      	bf      	0x8011c56	// 8011c56 <HAL_Delay+0xa>
	{
	}
}
 8011c60:	1492      	pop      	r4-r5, r15
	...

08011c64 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011c64:	c4002822 	bclri      	r2, r0, 0
 8011c68:	3a81      	bclri      	r2, 1
 8011c6a:	106b      	lrw      	r3, 0xe000e100	// 8011c94 <HAL_NVIC_SetPriority+0x30>
 8011c6c:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c6e:	e4002003 	andi      	r0, r0, 3
 8011c72:	4003      	lsli      	r0, r0, 3
 8011c74:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c76:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c78:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011c7c:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c7e:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c82:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c86:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c8a:	6cc0      	or      	r3, r0
 8011c8c:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011c90:	783c      	jmp      	r15
 8011c92:	0000      	.short	0x0000
 8011c94:	e000e100 	.long	0xe000e100

08011c98 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011c98:	e440201f 	andi      	r2, r0, 31
 8011c9c:	3301      	movi      	r3, 1
 8011c9e:	c4a054c0 	zext      	r0, r0, 6, 5
 8011ca2:	70c8      	lsl      	r3, r2
 8011ca4:	4002      	lsli      	r0, r0, 2
 8011ca6:	1044      	lrw      	r2, 0xe000e100	// 8011cb4 <HAL_NVIC_EnableIRQ+0x1c>
 8011ca8:	6008      	addu      	r0, r2
 8011caa:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011cac:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011cb0:	783c      	jmp      	r15
 8011cb2:	0000      	.short	0x0000
 8011cb4:	e000e100 	.long	0xe000e100

08011cb8 <SPI_Receive_IT>:
}

static void SPI_Receive_IT(SPI_HandleTypeDef *hspi)
{
	uint32_t i = 0, data = 0;
	uint32_t fifo_count = __HAL_SPI_GET_RXFIFO(hspi) / 4;
 8011cb8:	9060      	ld.w      	r3, (r0, 0x0)
 8011cba:	da832006 	ld.w      	r20, (r3, 0x18)
 8011cbe:	c5145574 	zext      	r20, r20, 11, 8
	while (fifo_count > 0)
 8011cc2:	e9140026 	bez      	r20, 0x8011d0e	// 8011d0e <SPI_Receive_IT+0x56>
	{
		data = READ_REG(hspi->Instance->RXDATA);
 8011cc6:	ea0c0000 	movi      	r12, 0
 8011cca:	da63200c 	ld.w      	r19, (r3, 0x30)
		for (i = 0; i < 4; i++)
 8011cce:	ea0d0004 	movi      	r13, 4
 8011cd2:	6cf3      	mov      	r3, r12
		{
			if (i == hspi->RxXferCount)
 8011cd4:	904c      	ld.w      	r2, (r0, 0x30)
 8011cd6:	64ca      	cmpne      	r2, r3
 8011cd8:	0c0f      	bf      	0x8011cf6	// 8011cf6 <SPI_Receive_IT+0x3e>
			{
				break;
			}
			(hspi->pRxBuffPtr + hspi->RxXferSize - hspi->RxXferCount)[i] = (data >> (i * 8)) & 0xFF;
 8011cda:	902c      	ld.w      	r1, (r0, 0x30)
 8011cdc:	904b      	ld.w      	r2, (r0, 0x2c)
 8011cde:	6086      	subu      	r2, r1
 8011ce0:	902a      	ld.w      	r1, (r0, 0x28)
 8011ce2:	604c      	addu      	r1, r3
 8011ce4:	c5934052 	lsr      	r18, r19, r12
 8011ce8:	d4410032 	str.b      	r18, (r1, r2 << 0)
		for (i = 0; i < 4; i++)
 8011cec:	2300      	addi      	r3, 1
 8011cee:	e58c0007 	addi      	r12, r12, 8
 8011cf2:	e82dfff1 	bnezad      	r13, 0x8011cd4	// 8011cd4 <SPI_Receive_IT+0x1c>
		}
		hspi->RxXferCount -= i;
 8011cf6:	904c      	ld.w      	r2, (r0, 0x30)
 8011cf8:	5a6d      	subu      	r3, r2, r3
 8011cfa:	b06c      	st.w      	r3, (r0, 0x30)
		fifo_count--;
		if((hspi->RxXferCount == 0))
 8011cfc:	906c      	ld.w      	r3, (r0, 0x30)
		fifo_count--;
 8011cfe:	e6941000 	subi      	r20, r20, 1
		if((hspi->RxXferCount == 0))
 8011d02:	e9030006 	bez      	r3, 0x8011d0e	// 8011d0e <SPI_Receive_IT+0x56>
	while (fifo_count > 0)
 8011d06:	e9140004 	bez      	r20, 0x8011d0e	// 8011d0e <SPI_Receive_IT+0x56>
 8011d0a:	9060      	ld.w      	r3, (r0, 0x0)
 8011d0c:	07dd      	br      	0x8011cc6	// 8011cc6 <SPI_Receive_IT+0xe>
		{
			break;
		}
	}
}
 8011d0e:	783c      	jmp      	r15

08011d10 <HAL_SPI_Init>:
{
 8011d10:	14d1      	push      	r4, r15
 8011d12:	6d03      	mov      	r4, r0
	if (hspi == NULL)
 8011d14:	e9000026 	bez      	r0, 0x8011d60	// 8011d60 <HAL_SPI_Init+0x50>
	if (hspi->State == HAL_SPI_STATE_RESET)
 8011d18:	9070      	ld.w      	r3, (r0, 0x40)
 8011d1a:	e903001f 	bez      	r3, 0x8011d58	// 8011d58 <HAL_SPI_Init+0x48>
	hspi->State = HAL_SPI_STATE_BUSY;
 8011d1e:	3302      	movi      	r3, 2
 8011d20:	b470      	st.w      	r3, (r4, 0x40)
	__HAL_SPI_DISABLE_TXRX(hspi);
 8011d22:	9460      	ld.w      	r3, (r4, 0x0)
	WRITE_REG(hspi->Instance->SPI_CFG, (hspi->Init.Mode | hspi->Init.CLKPolarity | hspi->Init.CLKPhase | hspi->Init.FirstByte));
 8011d24:	9422      	ld.w      	r1, (r4, 0x8)
	__HAL_SPI_DISABLE_TXRX(hspi);
 8011d26:	9340      	ld.w      	r2, (r3, 0x0)
 8011d28:	3a93      	bclri      	r2, 19
 8011d2a:	3a94      	bclri      	r2, 20
 8011d2c:	b340      	st.w      	r2, (r3, 0x0)
	WRITE_REG(hspi->Instance->CH_CFG, (hspi->Init.NSS | SPI_CH_CFG_CLEARFIFOS));
 8011d2e:	9444      	ld.w      	r2, (r4, 0x10)
 8011d30:	3ab6      	bseti      	r2, 22
 8011d32:	b340      	st.w      	r2, (r3, 0x0)
	WRITE_REG(hspi->Instance->SPI_CFG, (hspi->Init.Mode | hspi->Init.CLKPolarity | hspi->Init.CLKPhase | hspi->Init.FirstByte));
 8011d34:	9441      	ld.w      	r2, (r4, 0x4)
 8011d36:	6c84      	or      	r2, r1
 8011d38:	9423      	ld.w      	r1, (r4, 0xc)
 8011d3a:	6c84      	or      	r2, r1
 8011d3c:	9426      	ld.w      	r1, (r4, 0x18)
 8011d3e:	6c84      	or      	r2, r1
 8011d40:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(hspi->Instance->CLK_CFG, hspi->Init.BaudRatePrescaler);
 8011d42:	9445      	ld.w      	r2, (r4, 0x14)
 8011d44:	b342      	st.w      	r2, (r3, 0x8)
	__HAL_SPI_SET_CS_HIGH(hspi);
 8011d46:	9340      	ld.w      	r2, (r3, 0x0)
 8011d48:	ec420004 	ori      	r2, r2, 4
 8011d4c:	b340      	st.w      	r2, (r3, 0x0)
	hspi->ErrorCode = HAL_SPI_ERROR_NONE;
 8011d4e:	3000      	movi      	r0, 0
	hspi->State     = HAL_SPI_STATE_READY;
 8011d50:	3301      	movi      	r3, 1
	hspi->ErrorCode = HAL_SPI_ERROR_NONE;
 8011d52:	b411      	st.w      	r0, (r4, 0x44)
	hspi->State     = HAL_SPI_STATE_READY;
 8011d54:	b470      	st.w      	r3, (r4, 0x40)
}
 8011d56:	1491      	pop      	r4, r15
		hspi->Lock = HAL_UNLOCKED;
 8011d58:	b06f      	st.w      	r3, (r0, 0x3c)
		HAL_SPI_MspInit(hspi);
 8011d5a:	e000045d 	bsr      	0x8012614	// 8012614 <HAL_SPI_MspInit>
 8011d5e:	07e0      	br      	0x8011d1e	// 8011d1e <HAL_SPI_Init+0xe>
		return HAL_ERROR;
 8011d60:	3001      	movi      	r0, 1
}
 8011d62:	1491      	pop      	r4, r15

08011d64 <HAL_SPI_Transmit>:
{
 8011d64:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011d68:	c4034831 	lsli      	r17, r3, 0
	__HAL_LOCK(hspi);
 8011d6c:	906f      	ld.w      	r3, (r0, 0x3c)
 8011d6e:	3b41      	cmpnei      	r3, 1
{
 8011d70:	6ec3      	mov      	r11, r0
	__HAL_LOCK(hspi);
 8011d72:	0804      	bt      	0x8011d7a	// 8011d7a <HAL_SPI_Transmit+0x16>
 8011d74:	3002      	movi      	r0, 2
}
 8011d76:	ebc00058 	pop      	r4-r11, r15, r16-r17
	__HAL_LOCK(hspi);
 8011d7a:	3301      	movi      	r3, 1
 8011d7c:	b06f      	st.w      	r3, (r0, 0x3c)
 8011d7e:	6d4b      	mov      	r5, r2
 8011d80:	6d07      	mov      	r4, r1
	tickstart = HAL_GetTick();
 8011d82:	e3ffff5f 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
	if (hspi->State != HAL_SPI_STATE_READY)
 8011d86:	d86b2010 	ld.w      	r3, (r11, 0x40)
 8011d8a:	3b41      	cmpnei      	r3, 1
	tickstart = HAL_GetTick();
 8011d8c:	6dc3      	mov      	r7, r0
 8011d8e:	daab2000 	ld.w      	r21, (r11, 0x0)
	if (hspi->State != HAL_SPI_STATE_READY)
 8011d92:	6c53      	mov      	r1, r4
 8011d94:	6c97      	mov      	r2, r5
 8011d96:	0c0f      	bf      	0x8011db4	// 8011db4 <HAL_SPI_Transmit+0x50>
		errorcode = HAL_BUSY;
 8011d98:	3002      	movi      	r0, 2
	__HAL_SPI_DISABLE_TX(hspi);
 8011d9a:	d8752000 	ld.w      	r3, (r21, 0x0)
 8011d9e:	3b93      	bclri      	r3, 19
 8011da0:	dc752000 	st.w      	r3, (r21, 0x0)
	hspi->State = HAL_SPI_STATE_READY;
 8011da4:	3301      	movi      	r3, 1
 8011da6:	dc6b2010 	st.w      	r3, (r11, 0x40)
	__HAL_UNLOCK(hspi);
 8011daa:	3300      	movi      	r3, 0
 8011dac:	dc6b200f 	st.w      	r3, (r11, 0x3c)
}
 8011db0:	ebc00058 	pop      	r4-r11, r15, r16-r17
	if ((pData == NULL) || (Size == 0U))
 8011db4:	e9040095 	bez      	r4, 0x8011ede	// 8011ede <HAL_SPI_Transmit+0x17a>
 8011db8:	e9050093 	bez      	r5, 0x8011ede	// 8011ede <HAL_SPI_Transmit+0x17a>
	__HAL_SPI_CLEAR_FIFO(hspi);
 8011dbc:	d8752000 	ld.w      	r3, (r21, 0x0)
 8011dc0:	3bb6      	bseti      	r3, 22
 8011dc2:	dc752000 	st.w      	r3, (r21, 0x0)
 8011dc6:	ea230040 	movih      	r3, 64
 8011dca:	d8952000 	ld.w      	r4, (r21, 0x0)
 8011dce:	690c      	and      	r4, r3
 8011dd0:	e924fffd 	bnez      	r4, 0x8011dca	// 8011dca <HAL_SPI_Transmit+0x66>
	__HAL_SPI_ENABLE_TX(hspi);
 8011dd4:	d8752000 	ld.w      	r3, (r21, 0x0)
 8011dd8:	3bb3      	bseti      	r3, 19
 8011dda:	dc752000 	st.w      	r3, (r21, 0x0)
	hspi->State       = HAL_SPI_STATE_BUSY_TX;
 8011dde:	3303      	movi      	r3, 3
 8011de0:	dc6b2010 	st.w      	r3, (r11, 0x40)
	block_cnt = Size / BLOCK_SIZE;
 8011de4:	ea031ff8 	movi      	r3, 8184
 8011de8:	c462802a 	divu      	r10, r2, r3
			tx_size = Size % BLOCK_SIZE;
 8011dec:	7ce8      	mult      	r3, r10
 8011dee:	5acd      	subu      	r6, r2, r3
			if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 8011df0:	ea090000 	movi      	r9, 0
	hspi->ErrorCode   = HAL_SPI_ERROR_NONE;
 8011df4:	dc8b2011 	st.w      	r4, (r11, 0x44)
	hspi->pRxBuffPtr  = (uint8_t *)NULL;
 8011df8:	dc8b200a 	st.w      	r4, (r11, 0x28)
	hspi->RxXferSize  = 0U;
 8011dfc:	dc8b200b 	st.w      	r4, (r11, 0x2c)
	hspi->RxXferCount = 0U;
 8011e00:	dc8b200c 	st.w      	r4, (r11, 0x30)
 8011e04:	c4c64830 	lsli      	r16, r6, 6
 8011e08:	6d47      	mov      	r5, r1
			fifo_count = (32 - __HAL_SPI_GET_TXFIFO(hspi)) / 4;
 8011e0a:	ea080020 	movi      	r8, 32
			if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 8011e0e:	e5291000 	subi      	r9, r9, 1
		if (tx_block_cnt < block_cnt)
 8011e12:	6690      	cmphs      	r4, r10
 8011e14:	ea220008 	movih      	r2, 8
 8011e18:	e44211ff 	subi      	r2, r2, 512
 8011e1c:	c4500c40 	inct      	r2, r16, 0
 8011e20:	ea031ff8 	movi      	r3, 8184
 8011e24:	6690      	cmphs      	r4, r10
 8011e26:	c4660c40 	inct      	r3, r6, 0
		hspi->TxXferCount = tx_size;
 8011e2a:	dc6b2009 	st.w      	r3, (r11, 0x24)
		hspi->TxXferSize  = tx_size;
 8011e2e:	dc6b2008 	st.w      	r3, (r11, 0x20)
		__HAL_SPI_SET_CLK_NUM(hspi, tx_size * 8);
 8011e32:	ea01ffff 	movi      	r1, 65535
 8011e36:	c6614901 	rotli      	r1, r1, 19
 8011e3a:	d8752000 	ld.w      	r3, (r21, 0x0)
 8011e3e:	68c4      	and      	r3, r1
 8011e40:	6cc8      	or      	r3, r2
		hspi->pTxBuffPtr  = (uint8_t *)(pData + (tx_block_cnt * BLOCK_SIZE));
 8011e42:	dcab2007 	st.w      	r5, (r11, 0x1c)
		__HAL_SPI_SET_CLK_NUM(hspi, tx_size * 8);
 8011e46:	dc752000 	st.w      	r3, (r21, 0x0)
		__HAL_SPI_SET_START(hspi);
 8011e4a:	d8752000 	ld.w      	r3, (r21, 0x0)
 8011e4e:	ec630001 	ori      	r3, r3, 1
 8011e52:	dc752000 	st.w      	r3, (r21, 0x0)
		while (hspi->TxXferCount > 0U)
 8011e56:	d86b2009 	ld.w      	r3, (r11, 0x24)
 8011e5a:	e9030044 	bez      	r3, 0x8011ee2	// 8011ee2 <HAL_SPI_Transmit+0x17e>
			fifo_count = (32 - __HAL_SPI_GET_TXFIFO(hspi)) / 4;
 8011e5e:	da952006 	ld.w      	r20, (r21, 0x18)
 8011e62:	e694203f 	andi      	r20, r20, 63
 8011e66:	c6880094 	subu      	r20, r8, r20
 8011e6a:	c4544854 	lsri      	r20, r20, 2
			while((fifo_count > 0) && (hspi->TxXferCount > 0))
 8011e6e:	e914004d 	bez      	r20, 0x8011f08	// 8011f08 <HAL_SPI_Transmit+0x1a4>
 8011e72:	d86b2009 	ld.w      	r3, (r11, 0x24)
 8011e76:	e9030049 	bez      	r3, 0x8011f08	// 8011f08 <HAL_SPI_Transmit+0x1a4>
 8011e7a:	da6b2007 	ld.w      	r19, (r11, 0x1c)
 8011e7e:	0429      	br      	0x8011ed0	// 8011ed0 <HAL_SPI_Transmit+0x16c>
				for (i = 0; i < hspi->TxXferCount; i++)
 8011e80:	3100      	movi      	r1, 0
 8011e82:	c4134820 	lsli      	r0, r19, 0
 8011e86:	6c87      	mov      	r2, r1
 8011e88:	c4014832 	lsli      	r18, r1, 0
 8011e8c:	ea0c0004 	movi      	r12, 4
					data |= (hspi->pTxBuffPtr[i] << (i * 8));
 8011e90:	8060      	ld.b      	r3, (r0, 0x0)
 8011e92:	70c4      	lsl      	r3, r1
 8011e94:	c4722432 	or      	r18, r18, r3
				for (i = 0; i < hspi->TxXferCount; i++)
 8011e98:	2200      	addi      	r2, 1
 8011e9a:	d86b2009 	ld.w      	r3, (r11, 0x24)
 8011e9e:	64c8      	cmphs      	r2, r3
 8011ea0:	0805      	bt      	0x8011eaa	// 8011eaa <HAL_SPI_Transmit+0x146>
 8011ea2:	2000      	addi      	r0, 1
 8011ea4:	2107      	addi      	r1, 8
					if (i == 4)
 8011ea6:	e82cfff5 	bnezad      	r12, 0x8011e90	// 8011e90 <HAL_SPI_Transmit+0x12c>
				hspi->TxXferCount -= i;
 8011eaa:	d86b2009 	ld.w      	r3, (r11, 0x24)
				hspi->pTxBuffPtr += sizeof(uint8_t) * i;
 8011eae:	c4530033 	addu      	r19, r19, r2
					fifo_count--;
 8011eb2:	e6941000 	subi      	r20, r20, 1
				hspi->TxXferCount -= i;
 8011eb6:	5b49      	subu      	r2, r3, r2
				hspi->pTxBuffPtr += sizeof(uint8_t) * i;
 8011eb8:	de6b2007 	st.w      	r19, (r11, 0x1c)
				hspi->TxXferCount -= i;
 8011ebc:	dc4b2009 	st.w      	r2, (r11, 0x24)
				WRITE_REG(hspi->Instance->TXDATA, data);
 8011ec0:	de552008 	st.w      	r18, (r21, 0x20)
			while((fifo_count > 0) && (hspi->TxXferCount > 0))
 8011ec4:	e9140022 	bez      	r20, 0x8011f08	// 8011f08 <HAL_SPI_Transmit+0x1a4>
 8011ec8:	d86b2009 	ld.w      	r3, (r11, 0x24)
 8011ecc:	e903001e 	bez      	r3, 0x8011f08	// 8011f08 <HAL_SPI_Transmit+0x1a4>
				for (i = 0; i < hspi->TxXferCount; i++)
 8011ed0:	d84b2009 	ld.w      	r2, (r11, 0x24)
 8011ed4:	e922ffd6 	bnez      	r2, 0x8011e80	// 8011e80 <HAL_SPI_Transmit+0x11c>
 8011ed8:	c4024832 	lsli      	r18, r2, 0
 8011edc:	07e7      	br      	0x8011eaa	// 8011eaa <HAL_SPI_Transmit+0x146>
		errorcode = HAL_ERROR;
 8011ede:	3001      	movi      	r0, 1
 8011ee0:	075d      	br      	0x8011d9a	// 8011d9a <HAL_SPI_Transmit+0x36>
		while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
 8011ee2:	d8752005 	ld.w      	r3, (r21, 0x14)
 8011ee6:	e4632040 	andi      	r3, r3, 64
 8011eea:	e923001b 	bnez      	r3, 0x8011f20	// 8011f20 <HAL_SPI_Transmit+0x1bc>
			if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 8011eee:	e3fffea9 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
 8011ef2:	601e      	subu      	r0, r7
 8011ef4:	c6200420 	cmphs      	r0, r17
 8011ef8:	daab2000 	ld.w      	r21, (r11, 0x0)
 8011efc:	0ff3      	bf      	0x8011ee2	// 8011ee2 <HAL_SPI_Transmit+0x17e>
 8011efe:	c5310480 	cmpne      	r17, r9
 8011f02:	0ff0      	bf      	0x8011ee2	// 8011ee2 <HAL_SPI_Transmit+0x17e>
				errorcode = HAL_TIMEOUT;
 8011f04:	3003      	movi      	r0, 3
 8011f06:	074a      	br      	0x8011d9a	// 8011d9a <HAL_SPI_Transmit+0x36>
			if ((((HAL_GetTick() - tickstart) >=  Timeout) && (Timeout != HAL_MAX_DELAY)) || (Timeout == 0U))
 8011f08:	e3fffe9c 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
 8011f0c:	601e      	subu      	r0, r7
 8011f0e:	c6200420 	cmphs      	r0, r17
 8011f12:	daab2000 	ld.w      	r21, (r11, 0x0)
 8011f16:	0fa0      	bf      	0x8011e56	// 8011e56 <HAL_SPI_Transmit+0xf2>
 8011f18:	c5310480 	cmpne      	r17, r9
 8011f1c:	0f9d      	bf      	0x8011e56	// 8011e56 <HAL_SPI_Transmit+0xf2>
 8011f1e:	07f3      	br      	0x8011f04	// 8011f04 <HAL_SPI_Transmit+0x1a0>
		__HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 8011f20:	d8752005 	ld.w      	r3, (r21, 0x14)
		tx_block_cnt++;
 8011f24:	2400      	addi      	r4, 1
		__HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 8011f26:	ec630040 	ori      	r3, r3, 64
	while (tx_block_cnt <= block_cnt)
 8011f2a:	6528      	cmphs      	r10, r4
		__HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
 8011f2c:	dc752005 	st.w      	r3, (r21, 0x14)
 8011f30:	ea031ff8 	movi      	r3, 8184
 8011f34:	614c      	addu      	r5, r3
	while (tx_block_cnt <= block_cnt)
 8011f36:	0b6e      	bt      	0x8011e12	// 8011e12 <HAL_SPI_Transmit+0xae>
	HAL_StatusTypeDef errorcode = HAL_OK;
 8011f38:	3000      	movi      	r0, 0
 8011f3a:	0730      	br      	0x8011d9a	// 8011d9a <HAL_SPI_Transmit+0x36>

08011f3c <HAL_SPI_TxRxCpltCallback>:
 8011f3c:	783c      	jmp      	r15
	...

08011f40 <HAL_SPI_IRQHandler>:
{
 8011f40:	14d4      	push      	r4-r7, r15
	uint32_t itmask = hspi->Instance->INT_MASK;
 8011f42:	9040      	ld.w      	r2, (r0, 0x0)
	if (hspi->Instance->CH_CFG & SPI_CH_CFG_TXON)
 8011f44:	ea210008 	movih      	r1, 8
	uint32_t itmask = hspi->Instance->INT_MASK;
 8011f48:	92c4      	ld.w      	r6, (r2, 0x10)
	uint32_t itflag = hspi->Instance->INT_SRC;
 8011f4a:	9285      	ld.w      	r4, (r2, 0x14)
	__HAL_SPI_CLEAR_FLAG(hspi, itflag);
 8011f4c:	9265      	ld.w      	r3, (r2, 0x14)
 8011f4e:	6cd0      	or      	r3, r4
 8011f50:	b265      	st.w      	r3, (r2, 0x14)
	if (hspi->Instance->CH_CFG & SPI_CH_CFG_TXON)
 8011f52:	9260      	ld.w      	r3, (r2, 0x0)
 8011f54:	68c4      	and      	r3, r1
{
 8011f56:	6d43      	mov      	r5, r0
	if (hspi->Instance->CH_CFG & SPI_CH_CFG_TXON)
 8011f58:	e9030016 	bez      	r3, 0x8011f84	// 8011f84 <HAL_SPI_IRQHandler+0x44>
		if (((itflag & SPI_INT_SRC_TXRDY) == SPI_INT_SRC_TXRDY) && ((itmask & SPI_INT_MASK_TXRDY) == RESET))
 8011f5c:	e4642001 	andi      	r3, r4, 1
 8011f60:	e9030006 	bez      	r3, 0x8011f6c	// 8011f6c <HAL_SPI_IRQHandler+0x2c>
 8011f64:	e4662001 	andi      	r3, r6, 1
 8011f68:	e903005c 	bez      	r3, 0x8012020	// 8012020 <HAL_SPI_IRQHandler+0xe0>
		if (((itflag & SPI_INT_SRC_DONE) == SPI_INT_SRC_DONE) && ((itmask & SPI_INT_MASK_DONE) == RESET))
 8011f6c:	e4642040 	andi      	r3, r4, 64
 8011f70:	e9030006 	bez      	r3, 0x8011f7c	// 8011f7c <HAL_SPI_IRQHandler+0x3c>
 8011f74:	e4662040 	andi      	r3, r6, 64
 8011f78:	e9030080 	bez      	r3, 0x8012078	// 8012078 <HAL_SPI_IRQHandler+0x138>
		if (((itflag & SPI_INT_SRC_TXUN) == SPI_INT_SRC_TXUN) && ((itmask & SPI_INT_MASK_TXUN) == RESET))
 8011f7c:	e4642004 	andi      	r3, r4, 4
 8011f80:	e9230025 	bnez      	r3, 0x8011fca	// 8011fca <HAL_SPI_IRQHandler+0x8a>
	if (hspi->Instance->CH_CFG & SPI_CH_CFG_RXON)
 8011f84:	9260      	ld.w      	r3, (r2, 0x0)
 8011f86:	ea220010 	movih      	r2, 16
 8011f8a:	68c8      	and      	r3, r2
 8011f8c:	e903001e 	bez      	r3, 0x8011fc8	// 8011fc8 <HAL_SPI_IRQHandler+0x88>
		if (((itflag & SPI_INT_SRC_RXRDY) == SPI_INT_SRC_RXRDY) && ((itmask & SPI_INT_MASK_RXRDY) == RESET))
 8011f90:	e4642002 	andi      	r3, r4, 2
 8011f94:	e9030006 	bez      	r3, 0x8011fa0	// 8011fa0 <HAL_SPI_IRQHandler+0x60>
 8011f98:	e4662002 	andi      	r3, r6, 2
 8011f9c:	e9030020 	bez      	r3, 0x8011fdc	// 8011fdc <HAL_SPI_IRQHandler+0x9c>
		if (((itflag & SPI_INT_SRC_DONE) == SPI_INT_SRC_DONE) && ((itmask & SPI_INT_MASK_DONE) == RESET))
 8011fa0:	e4642040 	andi      	r3, r4, 64
 8011fa4:	e9030006 	bez      	r3, 0x8011fb0	// 8011fb0 <HAL_SPI_IRQHandler+0x70>
 8011fa8:	e4662040 	andi      	r3, r6, 64
 8011fac:	e903001c 	bez      	r3, 0x8011fe4	// 8011fe4 <HAL_SPI_IRQHandler+0xa4>
		if (((itflag & SPI_INT_SRC_RXOV) == SPI_INT_SRC_RXOV) && ((itmask & SPI_INT_MASK_RXOV) == RESET))
 8011fb0:	e4842020 	andi      	r4, r4, 32
 8011fb4:	e904000a 	bez      	r4, 0x8011fc8	// 8011fc8 <HAL_SPI_IRQHandler+0x88>
 8011fb8:	e4c62020 	andi      	r6, r6, 32
 8011fbc:	e9260006 	bnez      	r6, 0x8011fc8	// 8011fc8 <HAL_SPI_IRQHandler+0x88>
			SET_BIT(hspi->ErrorCode, HAL_SPI_ERROR_RXERR);
 8011fc0:	9571      	ld.w      	r3, (r5, 0x44)
 8011fc2:	ec630002 	ori      	r3, r3, 2
 8011fc6:	b571      	st.w      	r3, (r5, 0x44)
}
 8011fc8:	1494      	pop      	r4-r7, r15
		if (((itflag & SPI_INT_SRC_TXUN) == SPI_INT_SRC_TXUN) && ((itmask & SPI_INT_MASK_TXUN) == RESET))
 8011fca:	e4662004 	andi      	r3, r6, 4
 8011fce:	e923ffdb 	bnez      	r3, 0x8011f84	// 8011f84 <HAL_SPI_IRQHandler+0x44>
			SET_BIT(hspi->ErrorCode, HAL_SPI_ERROR_TXERR);
 8011fd2:	9571      	ld.w      	r3, (r5, 0x44)
 8011fd4:	ec630001 	ori      	r3, r3, 1
 8011fd8:	b571      	st.w      	r3, (r5, 0x44)
 8011fda:	07d5      	br      	0x8011f84	// 8011f84 <HAL_SPI_IRQHandler+0x44>
			SPI_Receive_IT(hspi);
 8011fdc:	6c17      	mov      	r0, r5
 8011fde:	e3fffe6d 	bsr      	0x8011cb8	// 8011cb8 <SPI_Receive_IT>
 8011fe2:	07df      	br      	0x8011fa0	// 8011fa0 <HAL_SPI_IRQHandler+0x60>

static void SPI_EndReceive_IT(SPI_HandleTypeDef *hspi)
{
	uint32_t len = 0;
	
	len = (hspi->RxXferCount > BLOCK_SIZE) ? BLOCK_SIZE : hspi->RxXferCount;
 8011fe4:	956c      	ld.w      	r3, (r5, 0x30)
 8011fe6:	eb031ff8 	cmphsi      	r3, 8185
 8011fea:	0883      	bt      	0x80120f0	// 80120f0 <HAL_SPI_IRQHandler+0x1b0>
 8011fec:	95ec      	ld.w      	r7, (r5, 0x30)
	if (len == 0)
 8011fee:	e92700ec 	bnez      	r7, 0x80121c6	// 80121c6 <HAL_SPI_IRQHandler+0x286>
			__HAL_SPI_SET_START(hspi);
		}
		else //if ((hspi->hdmatx->Init.Mode == DMA_MODE_NORMAL_SINGLE) || (hspi->hdmatx->Init.Mode == DMA_MODE_LINK_SINGLE))
	#endif
		{
			__HAL_SPI_DISABLE_IT(hspi, (SPI_INT_MASK_DONE | SPI_INT_MASK_RXRDY | SPI_INT_MASK_RXOV));
 8011ff2:	9540      	ld.w      	r2, (r5, 0x0)
 8011ff4:	9264      	ld.w      	r3, (r2, 0x10)
 8011ff6:	ec630062 	ori      	r3, r3, 98
 8011ffa:	b264      	st.w      	r3, (r2, 0x10)
			if (hspi->State == HAL_SPI_STATE_BUSY_RX)
 8011ffc:	9570      	ld.w      	r3, (r5, 0x40)
 8011ffe:	3b44      	cmpnei      	r3, 4
 8012000:	0ccc      	bf      	0x8012198	// 8012198 <HAL_SPI_IRQHandler+0x258>
			{
				__HAL_SPI_DISABLE_RX(hspi);
				hspi->State = HAL_SPI_STATE_READY;
				HAL_SPI_RxCpltCallback(hspi);
			}
			else if (hspi->State == HAL_SPI_STATE_BUSY_TX_RX)
 8012002:	9570      	ld.w      	r3, (r5, 0x40)
 8012004:	3b45      	cmpnei      	r3, 5
 8012006:	0bd5      	bt      	0x8011fb0	// 8011fb0 <HAL_SPI_IRQHandler+0x70>
			{
				__HAL_SPI_DISABLE_TX(hspi);
 8012008:	9260      	ld.w      	r3, (r2, 0x0)
 801200a:	3b93      	bclri      	r3, 19
 801200c:	b260      	st.w      	r3, (r2, 0x0)
				__HAL_SPI_DISABLE_RX(hspi);
 801200e:	9260      	ld.w      	r3, (r2, 0x0)
 8012010:	3b94      	bclri      	r3, 20
 8012012:	b260      	st.w      	r3, (r2, 0x0)
				hspi->State = HAL_SPI_STATE_READY;
 8012014:	3301      	movi      	r3, 1
 8012016:	b570      	st.w      	r3, (r5, 0x40)
				HAL_SPI_TxRxCpltCallback(hspi);
 8012018:	6c17      	mov      	r0, r5
 801201a:	e3ffff91 	bsr      	0x8011f3c	// 8011f3c <HAL_SPI_TxRxCpltCallback>
 801201e:	07c9      	br      	0x8011fb0	// 8011fb0 <HAL_SPI_IRQHandler+0x70>
	if (((hspi->TxXferSize - hspi->TxXferCount) % BLOCK_SIZE) == 0)
 8012020:	da402008 	ld.w      	r18, (r0, 0x20)
 8012024:	9029      	ld.w      	r1, (r0, 0x24)
 8012026:	c4320081 	subu      	r1, r18, r1
 801202a:	ea0c1ff8 	movi      	r12, 8184
 801202e:	c5818020 	divu      	r0, r1, r12
 8012032:	7c30      	mult      	r0, r12
 8012034:	6042      	subu      	r1, r0
 8012036:	e901ff9b 	bez      	r1, 0x8011f6c	// 8011f6c <HAL_SPI_IRQHandler+0x2c>
	for (i = 0; i < hspi->TxXferCount; i++)
 801203a:	9529      	ld.w      	r1, (r5, 0x24)
 801203c:	e90100c1 	bez      	r1, 0x80121be	// 80121be <HAL_SPI_IRQHandler+0x27e>
 8012040:	da852007 	ld.w      	r20, (r5, 0x1c)
 8012044:	6f4f      	mov      	r13, r3
 8012046:	6c4f      	mov      	r1, r3
 8012048:	ea0c0004 	movi      	r12, 4
		data |= ((hspi->pTxBuffPtr + hspi->TxXferSize - hspi->TxXferCount)[i] << (i * 8));
 801204c:	9509      	ld.w      	r0, (r5, 0x24)
 801204e:	c4340033 	addu      	r19, r20, r1
 8012052:	c4120080 	subu      	r0, r18, r0
 8012056:	d0130020 	ldr.b      	r0, (r19, r0 << 0)
 801205a:	700c      	lsl      	r0, r3
 801205c:	6f40      	or      	r13, r0
	for (i = 0; i < hspi->TxXferCount; i++)
 801205e:	2100      	addi      	r1, 1
 8012060:	9509      	ld.w      	r0, (r5, 0x24)
 8012062:	6404      	cmphs      	r1, r0
 8012064:	0804      	bt      	0x801206c	// 801206c <HAL_SPI_IRQHandler+0x12c>
 8012066:	2307      	addi      	r3, 8
		if (i == 4)
 8012068:	e82cfff2 	bnezad      	r12, 0x801204c	// 801204c <HAL_SPI_IRQHandler+0x10c>
	hspi->Instance->TXDATA = data;
 801206c:	dda22008 	st.w      	r13, (r2, 0x20)
	hspi->TxXferCount -= i;
 8012070:	9569      	ld.w      	r3, (r5, 0x24)
 8012072:	5b25      	subu      	r1, r3, r1
 8012074:	b529      	st.w      	r1, (r5, 0x24)
 8012076:	077b      	br      	0x8011f6c	// 8011f6c <HAL_SPI_IRQHandler+0x2c>
	len = (hspi->TxXferCount > BLOCK_SIZE) ? BLOCK_SIZE : hspi->TxXferCount;
 8012078:	9529      	ld.w      	r1, (r5, 0x24)
 801207a:	eb011ff8 	cmphsi      	r1, 8185
 801207e:	0c60      	bf      	0x801213e	// 801213e <HAL_SPI_IRQHandler+0x1fe>
 8012080:	ea200008 	movih      	r0, 8
 8012084:	e40011ff 	subi      	r0, r0, 512
 8012088:	ea071ff8 	movi      	r7, 8184
		__HAL_SPI_SET_CLK_NUM(hspi, (len * 8));
 801208c:	9220      	ld.w      	r1, (r2, 0x0)
 801208e:	ea0cffff 	movi      	r12, 65535
 8012092:	c66c490c 	rotli      	r12, r12, 19
 8012096:	6870      	and      	r1, r12
 8012098:	6c40      	or      	r1, r0
 801209a:	b220      	st.w      	r1, (r2, 0x0)
		if ((hspi->Instance->MODE_CFG & SPI_MODE_CFG_TXDMA) == SPI_MODE_CFG_TXDMA)
 801209c:	9203      	ld.w      	r0, (r2, 0xc)
 801209e:	e4002001 	andi      	r0, r0, 1
 80120a2:	e920006c 	bnez      	r0, 0x801217a	// 801217a <HAL_SPI_IRQHandler+0x23a>
			for (i = 0; i < hspi->TxXferCount; i++)
 80120a6:	9529      	ld.w      	r1, (r5, 0x24)
 80120a8:	e901008d 	bez      	r1, 0x80121c2	// 80121c2 <HAL_SPI_IRQHandler+0x282>
 80120ac:	da852008 	ld.w      	r20, (r5, 0x20)
 80120b0:	da652007 	ld.w      	r19, (r5, 0x1c)
 80120b4:	6c43      	mov      	r1, r0
 80120b6:	ea0d0004 	movi      	r13, 4
				data |= ((hspi->pTxBuffPtr + hspi->TxXferSize - hspi->TxXferCount)[i] << (i * 8));
 80120ba:	d9852009 	ld.w      	r12, (r5, 0x24)
 80120be:	c4330032 	addu      	r18, r19, r1
 80120c2:	c594008c 	subu      	r12, r20, r12
 80120c6:	d192002c 	ldr.b      	r12, (r18, r12 << 0)
 80120ca:	7300      	lsl      	r12, r0
 80120cc:	6cf0      	or      	r3, r12
			for (i = 0; i < hspi->TxXferCount; i++)
 80120ce:	2100      	addi      	r1, 1
 80120d0:	d9852009 	ld.w      	r12, (r5, 0x24)
 80120d4:	6704      	cmphs      	r1, r12
 80120d6:	0804      	bt      	0x80120de	// 80120de <HAL_SPI_IRQHandler+0x19e>
 80120d8:	2007      	addi      	r0, 8
				if (i == 4)
 80120da:	e82dfff0 	bnezad      	r13, 0x80120ba	// 80120ba <HAL_SPI_IRQHandler+0x17a>
			hspi->Instance->TXDATA = data;
 80120de:	b268      	st.w      	r3, (r2, 0x20)
			hspi->TxXferCount -= i;
 80120e0:	9569      	ld.w      	r3, (r5, 0x24)
 80120e2:	5b25      	subu      	r1, r3, r1
 80120e4:	b529      	st.w      	r1, (r5, 0x24)
		__HAL_SPI_SET_START(hspi);
 80120e6:	9260      	ld.w      	r3, (r2, 0x0)
 80120e8:	ec630001 	ori      	r3, r3, 1
 80120ec:	b260      	st.w      	r3, (r2, 0x0)
 80120ee:	0747      	br      	0x8011f7c	// 8011f7c <HAL_SPI_IRQHandler+0x3c>
	len = (hspi->RxXferCount > BLOCK_SIZE) ? BLOCK_SIZE : hspi->RxXferCount;
 80120f0:	ea220008 	movih      	r2, 8
 80120f4:	e44211ff 	subi      	r2, r2, 512
 80120f8:	ea071ff8 	movi      	r7, 8184
			}
		}
	}
	else
	{
		__HAL_SPI_SET_CLK_NUM(hspi, len * 8);
 80120fc:	9520      	ld.w      	r1, (r5, 0x0)
 80120fe:	ea00ffff 	movi      	r0, 65535
 8012102:	c6604900 	rotli      	r0, r0, 19
 8012106:	9160      	ld.w      	r3, (r1, 0x0)
 8012108:	68c0      	and      	r3, r0
 801210a:	6cc8      	or      	r3, r2
 801210c:	b160      	st.w      	r3, (r1, 0x0)
		if ((hspi->Instance->MODE_CFG & SPI_MODE_CFG_RXDMA) == SPI_MODE_CFG_RXDMA)
 801210e:	9163      	ld.w      	r3, (r1, 0xc)
 8012110:	e4632002 	andi      	r3, r3, 2
 8012114:	e903002f 	bez      	r3, 0x8012172	// 8012172 <HAL_SPI_IRQHandler+0x232>
		{
			HAL_DMA_Start_IT(hspi->hdmarx, 
							(uint32_t)&(hspi->Instance->RXDATA),
							(uint32_t)(hspi->pRxBuffPtr + (hspi->RxXferSize - hspi->RxXferCount)), 
 8012118:	956c      	ld.w      	r3, (r5, 0x30)
 801211a:	954b      	ld.w      	r2, (r5, 0x2c)
 801211c:	950a      	ld.w      	r0, (r5, 0x28)
 801211e:	608e      	subu      	r2, r3
			HAL_DMA_Start_IT(hspi->hdmarx, 
 8012120:	6080      	addu      	r2, r0
 8012122:	74dd      	zexth      	r3, r7
 8012124:	212f      	addi      	r1, 48
 8012126:	950e      	ld.w      	r0, (r5, 0x38)
 8012128:	e0000150 	bsr      	0x80123c8	// 80123c8 <HAL_DMA_Start_IT>
							len);
			hspi->RxXferCount -= len;
 801212c:	956c      	ld.w      	r3, (r5, 0x30)
 801212e:	5bfd      	subu      	r7, r3, r7
 8012130:	b5ec      	st.w      	r7, (r5, 0x30)
		}
		else
		{
			SPI_Receive_IT(hspi);
		}
		__HAL_SPI_SET_START(hspi);
 8012132:	9540      	ld.w      	r2, (r5, 0x0)
 8012134:	9260      	ld.w      	r3, (r2, 0x0)
 8012136:	ec630001 	ori      	r3, r3, 1
 801213a:	b260      	st.w      	r3, (r2, 0x0)
 801213c:	073a      	br      	0x8011fb0	// 8011fb0 <HAL_SPI_IRQHandler+0x70>
	len = (hspi->TxXferCount > BLOCK_SIZE) ? BLOCK_SIZE : hspi->TxXferCount;
 801213e:	95e9      	ld.w      	r7, (r5, 0x24)
	if (len == 0)
 8012140:	e9270045 	bnez      	r7, 0x80121ca	// 80121ca <HAL_SPI_IRQHandler+0x28a>
			__HAL_SPI_DISABLE_IT(hspi, (SPI_INT_MASK_DONE | SPI_INT_MASK_TXRDY | SPI_INT_MASK_TXUN));
 8012144:	9264      	ld.w      	r3, (r2, 0x10)
 8012146:	ec630045 	ori      	r3, r3, 69
 801214a:	b264      	st.w      	r3, (r2, 0x10)
			if (hspi->State == HAL_SPI_STATE_BUSY_TX)
 801214c:	9570      	ld.w      	r3, (r5, 0x40)
 801214e:	3b43      	cmpnei      	r3, 3
 8012150:	0c2d      	bf      	0x80121aa	// 80121aa <HAL_SPI_IRQHandler+0x26a>
			else if (hspi->State == HAL_SPI_STATE_BUSY_TX_RX)
 8012152:	9570      	ld.w      	r3, (r5, 0x40)
 8012154:	3b45      	cmpnei      	r3, 5
 8012156:	0b13      	bt      	0x8011f7c	// 8011f7c <HAL_SPI_IRQHandler+0x3c>
				__HAL_SPI_DISABLE_TX(hspi);
 8012158:	9260      	ld.w      	r3, (r2, 0x0)
 801215a:	3b93      	bclri      	r3, 19
 801215c:	b260      	st.w      	r3, (r2, 0x0)
				__HAL_SPI_DISABLE_RX(hspi);
 801215e:	9260      	ld.w      	r3, (r2, 0x0)
 8012160:	3b94      	bclri      	r3, 20
 8012162:	b260      	st.w      	r3, (r2, 0x0)
				hspi->State = HAL_SPI_STATE_READY;
 8012164:	3301      	movi      	r3, 1
 8012166:	b570      	st.w      	r3, (r5, 0x40)
				HAL_SPI_TxRxCpltCallback(hspi);
 8012168:	6c17      	mov      	r0, r5
 801216a:	e3fffee9 	bsr      	0x8011f3c	// 8011f3c <HAL_SPI_TxRxCpltCallback>
 801216e:	9540      	ld.w      	r2, (r5, 0x0)
 8012170:	0706      	br      	0x8011f7c	// 8011f7c <HAL_SPI_IRQHandler+0x3c>
			SPI_Receive_IT(hspi);
 8012172:	6c17      	mov      	r0, r5
 8012174:	e3fffda2 	bsr      	0x8011cb8	// 8011cb8 <SPI_Receive_IT>
 8012178:	07dd      	br      	0x8012132	// 8012132 <HAL_SPI_IRQHandler+0x1f2>
							(uint32_t)(hspi->pTxBuffPtr + (hspi->TxXferSize - hspi->TxXferCount)), 
 801217a:	9569      	ld.w      	r3, (r5, 0x24)
 801217c:	9528      	ld.w      	r1, (r5, 0x20)
 801217e:	9507      	ld.w      	r0, (r5, 0x1c)
 8012180:	604e      	subu      	r1, r3
			HAL_DMA_Start_IT(hspi->hdmatx, 
 8012182:	221f      	addi      	r2, 32
 8012184:	74dd      	zexth      	r3, r7
 8012186:	6040      	addu      	r1, r0
 8012188:	950d      	ld.w      	r0, (r5, 0x34)
 801218a:	e000011f 	bsr      	0x80123c8	// 80123c8 <HAL_DMA_Start_IT>
			hspi->TxXferCount -= len;
 801218e:	9569      	ld.w      	r3, (r5, 0x24)
 8012190:	5bfd      	subu      	r7, r3, r7
 8012192:	b5e9      	st.w      	r7, (r5, 0x24)
 8012194:	9540      	ld.w      	r2, (r5, 0x0)
 8012196:	07a8      	br      	0x80120e6	// 80120e6 <HAL_SPI_IRQHandler+0x1a6>
				__HAL_SPI_DISABLE_RX(hspi);
 8012198:	9260      	ld.w      	r3, (r2, 0x0)
 801219a:	3b94      	bclri      	r3, 20
 801219c:	b260      	st.w      	r3, (r2, 0x0)
				hspi->State = HAL_SPI_STATE_READY;
 801219e:	3301      	movi      	r3, 1
 80121a0:	b570      	st.w      	r3, (r5, 0x40)
				HAL_SPI_RxCpltCallback(hspi);
 80121a2:	6c17      	mov      	r0, r5
 80121a4:	e000022a 	bsr      	0x80125f8	// 80125f8 <HAL_SPI_RxCpltCallback>
 80121a8:	0704      	br      	0x8011fb0	// 8011fb0 <HAL_SPI_IRQHandler+0x70>
				__HAL_SPI_DISABLE_TX(hspi);
 80121aa:	9260      	ld.w      	r3, (r2, 0x0)
 80121ac:	3b93      	bclri      	r3, 19
 80121ae:	b260      	st.w      	r3, (r2, 0x0)
				hspi->State = HAL_SPI_STATE_READY;
 80121b0:	3301      	movi      	r3, 1
 80121b2:	b570      	st.w      	r3, (r5, 0x40)
				HAL_SPI_TxCpltCallback(hspi);
 80121b4:	6c17      	mov      	r0, r5
 80121b6:	e0000215 	bsr      	0x80125e0	// 80125e0 <HAL_SPI_TxCpltCallback>
 80121ba:	9540      	ld.w      	r2, (r5, 0x0)
 80121bc:	06e0      	br      	0x8011f7c	// 8011f7c <HAL_SPI_IRQHandler+0x3c>
	for (i = 0; i < hspi->TxXferCount; i++)
 80121be:	6f47      	mov      	r13, r1
 80121c0:	0756      	br      	0x801206c	// 801206c <HAL_SPI_IRQHandler+0x12c>
			for (i = 0; i < hspi->TxXferCount; i++)
 80121c2:	6cc7      	mov      	r3, r1
 80121c4:	078d      	br      	0x80120de	// 80120de <HAL_SPI_IRQHandler+0x19e>
 80121c6:	4746      	lsli      	r2, r7, 6
 80121c8:	079a      	br      	0x80120fc	// 80120fc <HAL_SPI_IRQHandler+0x1bc>
 80121ca:	4706      	lsli      	r0, r7, 6
 80121cc:	0760      	br      	0x801208c	// 801208c <HAL_SPI_IRQHandler+0x14c>
	...

080121d0 <DMA_SetConfig>:
{
	assert_param(IS_DMA_SRC_ADDR(SrcAddress));
	assert_param(IS_DMA_DEST_ADDR(DstAddress));
	assert_param(IS_DMA_LENGTH(hdma->Init.DataAlignment, DataLength));
	
	hdma->DmaBaseAddress->IF = ((DMA_IF_TRANSFER_DONE | DMA_IF_BURST_DONE) << (hdma->ChannelIndex * 2));
 80121d0:	d980200f 	ld.w      	r12, (r0, 0x3c)
 80121d4:	da40200e 	ld.w      	r18, (r0, 0x38)
 80121d8:	6330      	addu      	r12, r12
 80121da:	ea0d0003 	movi      	r13, 3
 80121de:	c58d402c 	lsl      	r12, r13, r12
 80121e2:	dd922001 	st.w      	r12, (r18, 0x4)
	
	if (hdma->Init.Mode == DMA_MODE_NORMAL_SINGLE)
 80121e6:	d9802005 	ld.w      	r12, (r0, 0x14)
 80121ea:	e90c0034 	bez      	r12, 0x8012252	// 8012252 <DMA_SetConfig+0x82>
	{
		hdma->Instance->SA = SrcAddress;
		hdma->Instance->DA = DstAddress;
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
	}
	else if (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR)
 80121ee:	eb4c0001 	cmpnei      	r12, 1
 80121f2:	0c3d      	bf      	0x801226c	// 801226c <DMA_SetConfig+0x9c>
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
	}
	else
	{
		assert_param(IS_DMA_LINK_LENGTH(DataLength));
		hdma->LinkDesc[0].Control |= ((DataLength / 2) << 7);
 80121f4:	d9802011 	ld.w      	r12, (r0, 0x44)
 80121f8:	c4234852 	lsri      	r18, r3, 1
 80121fc:	d9ac2001 	ld.w      	r13, (r12, 0x4)
 8012200:	c4f24833 	lsli      	r19, r18, 7
 8012204:	c66d242d 	or      	r13, r13, r19
 8012208:	ddac2001 	st.w      	r13, (r12, 0x4)
		hdma->LinkDesc[0].Valid = (1 << 31);
		hdma->LinkDesc[0].SrcAddr = SrcAddress;
		hdma->LinkDesc[0].DestAddr = DstAddress;
		
		hdma->LinkDesc[1].Control |= ((DataLength - (DataLength / 2)) << 7);
 801220c:	e5ac0013 	addi      	r13, r12, 20
 8012210:	c6430083 	subu      	r3, r3, r18
 8012214:	da8d2001 	ld.w      	r20, (r13, 0x4)
 8012218:	4367      	lsli      	r3, r3, 7
		hdma->LinkDesc[0].Valid = (1 << 31);
 801221a:	ea338000 	movih      	r19, 32768
		hdma->LinkDesc[1].Control |= ((DataLength - (DataLength / 2)) << 7);
 801221e:	c6832423 	or      	r3, r3, r20
		hdma->LinkDesc[0].Valid = (1 << 31);
 8012222:	de6c2000 	st.w      	r19, (r12, 0x0)
		hdma->LinkDesc[0].SrcAddr = SrcAddress;
 8012226:	dc2c2002 	st.w      	r1, (r12, 0x8)
		hdma->LinkDesc[0].DestAddr = DstAddress;
 801222a:	dc4c2003 	st.w      	r2, (r12, 0xc)
		hdma->LinkDesc[1].Control |= ((DataLength - (DataLength / 2)) << 7);
 801222e:	dc6d2001 	st.w      	r3, (r13, 0x4)
		hdma->LinkDesc[1].Valid = (1 << 31);
		if (hdma->Init.SrcInc == DMA_SINC_ENABLE)
 8012232:	9063      	ld.w      	r3, (r0, 0xc)
 8012234:	3b42      	cmpnei      	r3, 2
		hdma->LinkDesc[1].Valid = (1 << 31);
 8012236:	de6c2005 	st.w      	r19, (r12, 0x14)
		if (hdma->Init.SrcInc == DMA_SINC_ENABLE)
 801223a:	0c46      	bf      	0x80122c6	// 80122c6 <DMA_SetConfig+0xf6>
		{
			hdma->LinkDesc[1].SrcAddr = SrcAddress + (DataLength / 2);
		}
		else
		{
			hdma->LinkDesc[1].SrcAddr = SrcAddress;
 801223c:	dc2d2002 	st.w      	r1, (r13, 0x8)
		}
		
		if (hdma->Init.DestInc == DMA_DINC_ENABLE)
 8012240:	9062      	ld.w      	r3, (r0, 0x8)
 8012242:	3b48      	cmpnei      	r3, 8
 8012244:	0c3c      	bf      	0x80122bc	// 80122bc <DMA_SetConfig+0xec>
		{
			hdma->LinkDesc[1].DestAddr = DstAddress + (DataLength / 2);
		}
		else
		{
			hdma->LinkDesc[1].DestAddr = DstAddress;
 8012246:	dc4d2003 	st.w      	r2, (r13, 0xc)
		}
		WRITE_REG(hdma->Instance->LA, (uint32_t)(hdma->LinkDesc));
 801224a:	9060      	ld.w      	r3, (r0, 0x0)
 801224c:	dd832009 	st.w      	r12, (r3, 0x24)
	}
}
 8012250:	783c      	jmp      	r15
		hdma->Instance->SA = SrcAddress;
 8012252:	9000      	ld.w      	r0, (r0, 0x0)
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
 8012254:	4368      	lsli      	r3, r3, 8
		hdma->Instance->SA = SrcAddress;
 8012256:	b020      	st.w      	r1, (r0, 0x0)
		hdma->Instance->DA = DstAddress;
 8012258:	b041      	st.w      	r2, (r0, 0x4)
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
 801225a:	9047      	ld.w      	r2, (r0, 0x1c)
 801225c:	ea01ffff 	movi      	r1, 65535
 8012260:	c7014901 	rotli      	r1, r1, 24
 8012264:	6884      	and      	r2, r1
 8012266:	6cc8      	or      	r3, r2
 8012268:	b067      	st.w      	r3, (r0, 0x1c)
}
 801226a:	783c      	jmp      	r15
		hdma->Instance->SA = SrcAddress;
 801226c:	d9802000 	ld.w      	r12, (r0, 0x0)
 8012270:	dc2c2000 	st.w      	r1, (r12, 0x0)
		hdma->Instance->DA = DstAddress;
 8012274:	dc4c2001 	st.w      	r2, (r12, 0x4)
		hdma->Instance->SWA = SrcAddress;
 8012278:	dc2c2002 	st.w      	r1, (r12, 0x8)
		hdma->Instance->DWA = DstAddress;
 801227c:	dc4c2003 	st.w      	r2, (r12, 0xc)
		hdma->Instance->WLEN = 0;
 8012280:	3200      	movi      	r2, 0
 8012282:	dc4c2004 	st.w      	r2, (r12, 0x10)
		if (hdma->Init.SrcInc == DMA_SINC_CIRCULAR)
 8012286:	9043      	ld.w      	r2, (r0, 0xc)
 8012288:	3a46      	cmpnei      	r2, 6
 801228a:	0c23      	bf      	0x80122d0	// 80122d0 <DMA_SetConfig+0x100>
		if (hdma->Init.DestInc == DMA_DINC_CIRCULAR)
 801228c:	9042      	ld.w      	r2, (r0, 0x8)
 801228e:	3a58      	cmpnei      	r2, 24
 8012290:	0809      	bt      	0x80122a2	// 80122a2 <DMA_SetConfig+0xd2>
			MODIFY_REG(hdma->Instance->WLEN, DMA_WLEN_D_Msk, (DataLength << DMA_WLEN_D_Pos));
 8012292:	d84c2004 	ld.w      	r2, (r12, 0x10)
 8012296:	c40255e2 	zext      	r2, r2, 15, 0
 801229a:	4330      	lsli      	r1, r3, 16
 801229c:	6c84      	or      	r2, r1
 801229e:	dc4c2004 	st.w      	r2, (r12, 0x10)
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
 80122a2:	d84c2007 	ld.w      	r2, (r12, 0x1c)
 80122a6:	ea01ffff 	movi      	r1, 65535
 80122aa:	c7014901 	rotli      	r1, r1, 24
		hdma->offset = DataLength;
 80122ae:	b072      	st.w      	r3, (r0, 0x48)
		MODIFY_REG(hdma->Instance->CR2, DMA_CR2_LEN, (DataLength << DMA_CR2_LEN_Pos));
 80122b0:	6884      	and      	r2, r1
 80122b2:	4368      	lsli      	r3, r3, 8
 80122b4:	6cc8      	or      	r3, r2
 80122b6:	dc6c2007 	st.w      	r3, (r12, 0x1c)
}
 80122ba:	783c      	jmp      	r15
			hdma->LinkDesc[1].DestAddr = DstAddress + (DataLength / 2);
 80122bc:	c4520022 	addu      	r2, r18, r2
 80122c0:	dc4d2003 	st.w      	r2, (r13, 0xc)
 80122c4:	07c3      	br      	0x801224a	// 801224a <DMA_SetConfig+0x7a>
			hdma->LinkDesc[1].SrcAddr = SrcAddress + (DataLength / 2);
 80122c6:	c4320021 	addu      	r1, r18, r1
 80122ca:	dc2d2002 	st.w      	r1, (r13, 0x8)
 80122ce:	07b9      	br      	0x8012240	// 8012240 <DMA_SetConfig+0x70>
			MODIFY_REG(hdma->Instance->WLEN, DMA_WLEN_S_Msk, (DataLength << DMA_WLEN_S_Pos));
 80122d0:	d84c2004 	ld.w      	r2, (r12, 0x10)
 80122d4:	ea21ffff 	movih      	r1, 65535
 80122d8:	6884      	and      	r2, r1
 80122da:	6c8c      	or      	r2, r3
 80122dc:	dc4c2004 	st.w      	r2, (r12, 0x10)
 80122e0:	07d6      	br      	0x801228c	// 801228c <DMA_SetConfig+0xbc>
	...

080122e4 <HAL_DMA_Init>:
	if (hdma == NULL)
 80122e4:	e900006e 	bez      	r0, 0x80123c0	// 80123c0 <HAL_DMA_Init+0xdc>
	hdma->ChannelIndex = (((uint32_t)hdma->Instance - (uint32_t)DMA_Channel0) / ((uint32_t)DMA_Channel1 - (uint32_t)DMA_Channel0));
 80122e8:	9060      	ld.w      	r3, (r0, 0x0)
 80122ea:	1157      	lrw      	r2, 0xbffff7f0	// 80123c4 <HAL_DMA_Init+0xe0>
 80122ec:	608c      	addu      	r2, r3
 80122ee:	ea0c0030 	movi      	r12, 48
 80122f2:	c5828022 	divu      	r2, r2, r12
 80122f6:	b04f      	st.w      	r2, (r0, 0x3c)
	hdma->State = HAL_DMA_STATE_BUSY;
 80122f8:	3202      	movi      	r2, 2
 80122fa:	b049      	st.w      	r2, (r0, 0x24)
	hdma->DmaBaseAddress = DMA;
 80122fc:	ea214000 	movih      	r1, 16384
 8012300:	e42107ff 	addi      	r1, r1, 2048
	CLEAR_REG(hdma->Instance->CR2);
 8012304:	3200      	movi      	r2, 0
	hdma->DmaBaseAddress = DMA;
 8012306:	b02e      	st.w      	r1, (r0, 0x38)
	CLEAR_REG(hdma->Instance->CR2);
 8012308:	b347      	st.w      	r2, (r3, 0x1c)
	CLEAR_REG(hdma->Instance->MODE);
 801230a:	b346      	st.w      	r2, (r3, 0x18)
	WRITE_REG(hdma->Instance->MODE, hdma->Init.Direction);
 801230c:	9041      	ld.w      	r2, (r0, 0x4)
	if ((hdma->Init.Direction == DMA_PERIPH_TO_MEMORY) || (hdma->Init.Direction == DMA_MEMORY_TO_PERIPH))
 801230e:	3a41      	cmpnei      	r2, 1
	WRITE_REG(hdma->Instance->MODE, hdma->Init.Direction);
 8012310:	b346      	st.w      	r2, (r3, 0x18)
	if ((hdma->Init.Direction == DMA_PERIPH_TO_MEMORY) || (hdma->Init.Direction == DMA_MEMORY_TO_PERIPH))
 8012312:	0c0e      	bf      	0x801232e	// 801232e <HAL_DMA_Init+0x4a>
	if ((hdma->Init.Mode == DMA_MODE_NORMAL_SINGLE) || (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR))
 8012314:	9045      	ld.w      	r2, (r0, 0x14)
 8012316:	3a01      	cmphsi      	r2, 2
 8012318:	0c26      	bf      	0x8012364	// 8012364 <HAL_DMA_Init+0x80>
	else if ((hdma->Init.Mode == DMA_MODE_LINK_SINGLE) || (hdma->Init.Mode == DMA_MODE_LINK_CIRCULAR))
 801231a:	5a27      	subi      	r1, r2, 2
 801231c:	3901      	cmphsi      	r1, 2
 801231e:	0c32      	bf      	0x8012382	// 8012382 <HAL_DMA_Init+0x9e>
	hdma->ErrorCode = HAL_DMA_ERROR_NONE;
 8012320:	3300      	movi      	r3, 0
	hdma->State = HAL_DMA_STATE_READY;
 8012322:	3201      	movi      	r2, 1
	hdma->ErrorCode = HAL_DMA_ERROR_NONE;
 8012324:	b070      	st.w      	r3, (r0, 0x40)
	hdma->State = HAL_DMA_STATE_READY;
 8012326:	b049      	st.w      	r2, (r0, 0x24)
	hdma->Lock = HAL_UNLOCKED;
 8012328:	b068      	st.w      	r3, (r0, 0x20)
	return HAL_OK;
 801232a:	6c0f      	mov      	r0, r3
}
 801232c:	783c      	jmp      	r15
		MODIFY_REG(hdma->Instance->MODE, DMA_MODE_CH, hdma->Init.RequestSourceSel);
 801232e:	ea0d0000 	movi      	r13, 0
 8012332:	9346      	ld.w      	r2, (r3, 0x18)
 8012334:	e5ad103c 	subi      	r13, r13, 61
 8012338:	d9802006 	ld.w      	r12, (r0, 0x18)
 801233c:	68b4      	and      	r2, r13
 801233e:	6cb0      	or      	r2, r12
		if ((hdma->Init.RequestSourceSel == DMA_REQUEST_SOURCE_UART_RX) || (hdma->Init.RequestSourceSel == DMA_REQUEST_SOURCE_UART_TX))
 8012340:	c44c282c 	bclri      	r12, r12, 2
		MODIFY_REG(hdma->Instance->MODE, DMA_MODE_CH, hdma->Init.RequestSourceSel);
 8012344:	b346      	st.w      	r2, (r3, 0x18)
		if ((hdma->Init.RequestSourceSel == DMA_REQUEST_SOURCE_UART_RX) || (hdma->Init.RequestSourceSel == DMA_REQUEST_SOURCE_UART_TX))
 8012346:	e92cffe7 	bnez      	r12, 0x8012314	// 8012314 <HAL_DMA_Init+0x30>
			MODIFY_REG(hdma->DmaBaseAddress->REQCH, DMA_REQCH_UART, hdma->Init.RequestUartSel);
 801234a:	ea0c0000 	movi      	r12, 0
 801234e:	9142      	ld.w      	r2, (r1, 0x8)
 8012350:	e58c1007 	subi      	r12, r12, 8
 8012354:	68b0      	and      	r2, r12
 8012356:	d9802007 	ld.w      	r12, (r0, 0x1c)
 801235a:	6cb0      	or      	r2, r12
 801235c:	b142      	st.w      	r2, (r1, 0x8)
	if ((hdma->Init.Mode == DMA_MODE_NORMAL_SINGLE) || (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR))
 801235e:	9045      	ld.w      	r2, (r0, 0x14)
 8012360:	3a01      	cmphsi      	r2, 2
 8012362:	0bdc      	bt      	0x801231a	// 801231a <HAL_DMA_Init+0x36>
		WRITE_REG(hdma->Instance->CR2, (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc));
 8012364:	d9802002 	ld.w      	r12, (r0, 0x8)
 8012368:	9024      	ld.w      	r1, (r0, 0x10)
 801236a:	6c70      	or      	r1, r12
		if (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR)
 801236c:	3a41      	cmpnei      	r2, 1
		WRITE_REG(hdma->Instance->CR2, (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc));
 801236e:	d9802003 	ld.w      	r12, (r0, 0xc)
 8012372:	6c70      	or      	r1, r12
 8012374:	b327      	st.w      	r1, (r3, 0x1c)
		if (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR)
 8012376:	0bd5      	bt      	0x8012320	// 8012320 <HAL_DMA_Init+0x3c>
			SET_BIT(hdma->Instance->CR2, DMA_CR2_AUTORELOAD);
 8012378:	9347      	ld.w      	r2, (r3, 0x1c)
 801237a:	ec420001 	ori      	r2, r2, 1
 801237e:	b347      	st.w      	r2, (r3, 0x1c)
 8012380:	07d0      	br      	0x8012320	// 8012320 <HAL_DMA_Init+0x3c>
		SET_BIT(hdma->Instance->MODE, (DMA_MODE_LNM | DMA_MODE_LINK));
 8012382:	9326      	ld.w      	r1, (r3, 0x18)
 8012384:	ec210042 	ori      	r1, r1, 66
		temp = (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc) >> 1;
 8012388:	d9802002 	ld.w      	r12, (r0, 0x8)
		SET_BIT(hdma->Instance->MODE, (DMA_MODE_LNM | DMA_MODE_LINK));
 801238c:	b326      	st.w      	r1, (r3, 0x18)
		temp = (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc) >> 1;
 801238e:	9024      	ld.w      	r1, (r0, 0x10)
 8012390:	6c70      	or      	r1, r12
 8012392:	d9802003 	ld.w      	r12, (r0, 0xc)
		desc = hdma->LinkDesc;
 8012396:	9071      	ld.w      	r3, (r0, 0x44)
		temp = (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc) >> 1;
 8012398:	6c70      	or      	r1, r12
		desc[0].Valid = 0;
 801239a:	ea0d0000 	movi      	r13, 0
		desc[0].Next = (DMA_LinkDescriptor *)&desc[1];
 801239e:	e5830013 	addi      	r12, r3, 20
		temp = (hdma->Init.DataAlignment | hdma->Init.DestInc | hdma->Init.SrcInc) >> 1;
 80123a2:	4921      	lsri      	r1, r1, 1
			desc[1].Next = (DMA_LinkDescriptor *)&desc[0];
 80123a4:	3a43      	cmpnei      	r2, 3
		desc[0].Valid = 0;
 80123a6:	dda32000 	st.w      	r13, (r3, 0x0)
		desc[0].Control = temp;
 80123aa:	b321      	st.w      	r1, (r3, 0x4)
		desc[0].Next = (DMA_LinkDescriptor *)&desc[1];
 80123ac:	dd832004 	st.w      	r12, (r3, 0x10)
		desc[1].Valid = 0;
 80123b0:	dda32005 	st.w      	r13, (r3, 0x14)
		desc[1].Control = temp;
 80123b4:	b326      	st.w      	r1, (r3, 0x18)
			desc[1].Next = (DMA_LinkDescriptor *)&desc[0];
 80123b6:	c46d0c40 	inct      	r3, r13, 0
 80123ba:	dc6c2004 	st.w      	r3, (r12, 0x10)
 80123be:	07b1      	br      	0x8012320	// 8012320 <HAL_DMA_Init+0x3c>
		return HAL_ERROR;
 80123c0:	3001      	movi      	r0, 1
}
 80123c2:	783c      	jmp      	r15
 80123c4:	bffff7f0 	.long	0xbffff7f0

080123c8 <HAL_DMA_Start_IT>:
{
 80123c8:	14d2      	push      	r4-r5, r15
 80123ca:	6d43      	mov      	r5, r0
	__HAL_LOCK(hdma);
 80123cc:	9008      	ld.w      	r0, (r0, 0x20)
 80123ce:	3841      	cmpnei      	r0, 1
 80123d0:	0c0a      	bf      	0x80123e4	// 80123e4 <HAL_DMA_Start_IT+0x1c>
 80123d2:	3001      	movi      	r0, 1
 80123d4:	b508      	st.w      	r0, (r5, 0x20)
	if (HAL_DMA_STATE_READY == hdma->State)
 80123d6:	9509      	ld.w      	r0, (r5, 0x24)
 80123d8:	3841      	cmpnei      	r0, 1
 80123da:	0c07      	bf      	0x80123e8	// 80123e8 <HAL_DMA_Start_IT+0x20>
		__HAL_UNLOCK(hdma);
 80123dc:	3300      	movi      	r3, 0
		status = HAL_BUSY;
 80123de:	3002      	movi      	r0, 2
		__HAL_UNLOCK(hdma);
 80123e0:	b568      	st.w      	r3, (r5, 0x20)
}
 80123e2:	1492      	pop      	r4-r5, r15
	__HAL_LOCK(hdma);
 80123e4:	3002      	movi      	r0, 2
}
 80123e6:	1492      	pop      	r4-r5, r15
		hdma->State = HAL_DMA_STATE_BUSY;
 80123e8:	3002      	movi      	r0, 2
 80123ea:	b509      	st.w      	r0, (r5, 0x24)
		hdma->ErrorCode = HAL_DMA_ERROR_NONE;
 80123ec:	3000      	movi      	r0, 0
 80123ee:	b510      	st.w      	r0, (r5, 0x40)
		__HAL_DMA_DISABLE(hdma);
 80123f0:	9500      	ld.w      	r0, (r5, 0x0)
 80123f2:	d9802005 	ld.w      	r12, (r0, 0x14)
 80123f6:	ed8c0002 	ori      	r12, r12, 2
 80123fa:	dd802005 	st.w      	r12, (r0, 0x14)
 80123fe:	9085      	ld.w      	r4, (r0, 0x14)
 8012400:	e4842001 	andi      	r4, r4, 1
 8012404:	e924fffd 	bnez      	r4, 0x80123fe	// 80123fe <HAL_DMA_Start_IT+0x36>
		DMA_SetConfig(hdma, SrcAddress, DstAddress, DataLength);
 8012408:	6c17      	mov      	r0, r5
 801240a:	e3fffee3 	bsr      	0x80121d0	// 80121d0 <DMA_SetConfig>
		__HAL_DMA_ENABLE_IT(hdma, (DMA_FLAG_TF_DONE << (hdma->ChannelIndex * 2)));
 801240e:	956f      	ld.w      	r3, (r5, 0x3c)
 8012410:	952e      	ld.w      	r1, (r5, 0x38)
 8012412:	5b4c      	addu      	r2, r3, r3
 8012414:	3302      	movi      	r3, 2
 8012416:	9100      	ld.w      	r0, (r1, 0x0)
 8012418:	70c8      	lsl      	r3, r2
 801241a:	c4602043 	andn      	r3, r0, r3
		__HAL_DMA_ENABLE(hdma);
 801241e:	9540      	ld.w      	r2, (r5, 0x0)
		__HAL_DMA_ENABLE_IT(hdma, (DMA_FLAG_TF_DONE << (hdma->ChannelIndex * 2)));
 8012420:	b160      	st.w      	r3, (r1, 0x0)
		__HAL_DMA_ENABLE(hdma);
 8012422:	9265      	ld.w      	r3, (r2, 0x14)
 8012424:	ec630001 	ori      	r3, r3, 1
	HAL_StatusTypeDef status = HAL_OK;
 8012428:	6c13      	mov      	r0, r4
		__HAL_DMA_ENABLE(hdma);
 801242a:	b265      	st.w      	r3, (r2, 0x14)
}
 801242c:	1492      	pop      	r4-r5, r15
	...

08012430 <HAL_DMA_IRQHandler>:
{
 8012430:	14d2      	push      	r4-r5, r15
	uint32_t source_it = hdma->DmaBaseAddress->IM;
 8012432:	902e      	ld.w      	r1, (r0, 0x38)
	uint32_t flag = DMA_FLAG_TF_DONE << (hdma->ChannelIndex * 2);
 8012434:	908f      	ld.w      	r4, (r0, 0x3c)
 8012436:	3302      	movi      	r3, 2
 8012438:	6110      	addu      	r4, r4
 801243a:	c4834024 	lsl      	r4, r3, r4
	uint32_t source_it = hdma->DmaBaseAddress->IM;
 801243e:	9140      	ld.w      	r2, (r1, 0x0)
	if ((__HAL_DMA_GET_FLAG(hdma, flag) != RESET) && ((source_it & flag) == RESET))
 8012440:	9161      	ld.w      	r3, (r1, 0x4)
 8012442:	68d0      	and      	r3, r4
{
 8012444:	6d43      	mov      	r5, r0
	if ((__HAL_DMA_GET_FLAG(hdma, flag) != RESET) && ((source_it & flag) == RESET))
 8012446:	e9030013 	bez      	r3, 0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
 801244a:	6890      	and      	r2, r4
 801244c:	e9220010 	bnez      	r2, 0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
		if (hdma->Init.Mode == DMA_MODE_NORMAL_SINGLE)
 8012450:	9065      	ld.w      	r3, (r0, 0x14)
 8012452:	e9230011 	bnez      	r3, 0x8012474	// 8012474 <HAL_DMA_IRQHandler+0x44>
			__HAL_DMA_DISABLE_IT(hdma, flag);
 8012456:	9140      	ld.w      	r2, (r1, 0x0)
 8012458:	6c90      	or      	r2, r4
 801245a:	b140      	st.w      	r2, (r1, 0x0)
			__HAL_UNLOCK(hdma);
 801245c:	b068      	st.w      	r3, (r0, 0x20)
			if (hdma->XferCpltCallback != NULL)
 801245e:	906c      	ld.w      	r3, (r0, 0x30)
			hdma->State = HAL_DMA_STATE_READY;
 8012460:	3201      	movi      	r2, 1
 8012462:	b049      	st.w      	r2, (r0, 0x24)
			if (hdma->XferCpltCallback != NULL)
 8012464:	e9030004 	bez      	r3, 0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
					hdma->XferCpltCallback(hdma);
 8012468:	7bcd      	jsr      	r3
 801246a:	952e      	ld.w      	r1, (r5, 0x38)
	__HAL_DMA_CLEAR_FLAG(hdma, flag);
 801246c:	9161      	ld.w      	r3, (r1, 0x4)
 801246e:	6d0c      	or      	r4, r3
 8012470:	b181      	st.w      	r4, (r1, 0x4)
}
 8012472:	1492      	pop      	r4-r5, r15
		else if (hdma->Init.Mode == DMA_MODE_NORMAL_CIRCULAR)
 8012474:	3b41      	cmpnei      	r3, 1
 8012476:	0c10      	bf      	0x8012496	// 8012496 <HAL_DMA_IRQHandler+0x66>
		else if ((hdma->Init.Mode == DMA_MODE_LINK_SINGLE) || (hdma->Init.Mode == DMA_MODE_LINK_CIRCULAR))
 8012478:	5b47      	subi      	r2, r3, 2
 801247a:	3a01      	cmphsi      	r2, 2
 801247c:	0bf8      	bt      	0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
			if (hdma->LinkDesc[0].Valid == 0)
 801247e:	9051      	ld.w      	r2, (r0, 0x44)
 8012480:	d9822000 	ld.w      	r12, (r2, 0x0)
 8012484:	e92c002f 	bnez      	r12, 0x80124e2	// 80124e2 <HAL_DMA_IRQHandler+0xb2>
				hdma->LinkDesc[0].Valid = (1 << 31);
 8012488:	ea238000 	movih      	r3, 32768
 801248c:	b260      	st.w      	r3, (r2, 0x0)
				if (hdma->XferHalfCpltCallback != NULL)
 801248e:	906b      	ld.w      	r3, (r0, 0x2c)
 8012490:	e923ffec 	bnez      	r3, 0x8012468	// 8012468 <HAL_DMA_IRQHandler+0x38>
 8012494:	07ec      	br      	0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
			uint32_t cur_len = (hdma->Instance->CR2 & DMA_CR2_LEN_Msk) >> DMA_CR2_LEN_Pos;
 8012496:	9040      	ld.w      	r2, (r0, 0x0)
			if ((cur_len + hdma->offset) > 0xFFFF)
 8012498:	9012      	ld.w      	r0, (r0, 0x48)
			uint32_t cur_len = (hdma->Instance->CR2 & DMA_CR2_LEN_Msk) >> DMA_CR2_LEN_Pos;
 801249a:	9267      	ld.w      	r3, (r2, 0x1c)
 801249c:	c50356e3 	zext      	r3, r3, 23, 8
			if ((cur_len + hdma->offset) > 0xFFFF)
 80124a0:	60c0      	addu      	r3, r0
 80124a2:	ea0cffff 	movi      	r12, 65535
 80124a6:	64f0      	cmphs      	r12, r3
 80124a8:	080f      	bt      	0x80124c6	// 80124c6 <HAL_DMA_IRQHandler+0x96>
				__HAL_DMA_DISABLE(hdma);
 80124aa:	9265      	ld.w      	r3, (r2, 0x14)
 80124ac:	ec630002 	ori      	r3, r3, 2
 80124b0:	b265      	st.w      	r3, (r2, 0x14)
 80124b2:	9265      	ld.w      	r3, (r2, 0x14)
 80124b4:	e4632001 	andi      	r3, r3, 1
 80124b8:	e923fffd 	bnez      	r3, 0x80124b2	// 80124b2 <HAL_DMA_IRQHandler+0x82>
				__HAL_DMA_ENABLE(hdma);
 80124bc:	9265      	ld.w      	r3, (r2, 0x14)
 80124be:	ec630001 	ori      	r3, r3, 1
 80124c2:	b265      	st.w      	r3, (r2, 0x14)
 80124c4:	6cc3      	mov      	r3, r0
			MODIFY_REG(hdma->Instance->CR2, (uint32_t)(DMA_CR2_LEN_Msk), 
 80124c6:	9207      	ld.w      	r0, (r2, 0x1c)
 80124c8:	ea0cffff 	movi      	r12, 65535
 80124cc:	c70c490c 	rotli      	r12, r12, 24
 80124d0:	6830      	and      	r0, r12
 80124d2:	4368      	lsli      	r3, r3, 8
 80124d4:	6cc0      	or      	r3, r0
 80124d6:	b267      	st.w      	r3, (r2, 0x1c)
			if (hdma->XferCpltCallback != NULL)
 80124d8:	956c      	ld.w      	r3, (r5, 0x30)
 80124da:	e903ffc9 	bez      	r3, 0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
					hdma->XferCpltCallback(hdma);
 80124de:	6c17      	mov      	r0, r5
 80124e0:	07c4      	br      	0x8012468	// 8012468 <HAL_DMA_IRQHandler+0x38>
			else if (hdma->LinkDesc[1].Valid == 0)
 80124e2:	9205      	ld.w      	r0, (r2, 0x14)
 80124e4:	e920ffc4 	bnez      	r0, 0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
				if (hdma->Init.Mode == DMA_MODE_LINK_SINGLE)
 80124e8:	3b42      	cmpnei      	r3, 2
 80124ea:	0c0a      	bf      	0x80124fe	// 80124fe <HAL_DMA_IRQHandler+0xce>
				hdma->LinkDesc[1].Valid = (1 << 31);
 80124ec:	ea238000 	movih      	r3, 32768
 80124f0:	b265      	st.w      	r3, (r2, 0x14)
				__HAL_UNLOCK(hdma);
 80124f2:	3300      	movi      	r3, 0
 80124f4:	b568      	st.w      	r3, (r5, 0x20)
				if (hdma->XferCpltCallback != NULL)
 80124f6:	956c      	ld.w      	r3, (r5, 0x30)
 80124f8:	e923fff3 	bnez      	r3, 0x80124de	// 80124de <HAL_DMA_IRQHandler+0xae>
 80124fc:	07b8      	br      	0x801246c	// 801246c <HAL_DMA_IRQHandler+0x3c>
					__HAL_DMA_DISABLE_IT(hdma, flag);
 80124fe:	9160      	ld.w      	r3, (r1, 0x0)
 8012500:	6cd0      	or      	r3, r4
 8012502:	b160      	st.w      	r3, (r1, 0x0)
					hdma->State = HAL_DMA_STATE_READY;
 8012504:	3301      	movi      	r3, 1
 8012506:	b569      	st.w      	r3, (r5, 0x24)
 8012508:	07f2      	br      	0x80124ec	// 80124ec <HAL_DMA_IRQHandler+0xbc>
	...

0801250c <main>:
#define data_len (10000)
uint8_t tx_data[data_len] = {0};
uint8_t rx_data[data_len] = {0};

int main(void)
{
 801250c:	14d2      	push      	r4-r5, r15

	
	SystemClock_Config(CPU_CLK_240M);
 801250e:	3002      	movi      	r0, 2
 8012510:	e3fffb60 	bsr      	0x8011bd0	// 8011bd0 <SystemClock_Config>
	printf("enter main\r\n");
 8012514:	1111      	lrw      	r0, 0x8014a50	// 80125d8 <main+0xcc>
 8012516:	e3fff9f9 	bsr      	0x8011908	// 8011908 <__GI_puts>
	LCD_GPIO_Init();
 801251a:	e000015b 	bsr      	0x80127d0	// 80127d0 <LCD_GPIO_Init>
	}
}

static void DMA_Init(void)
{
	__HAL_RCC_DMA_CLK_ENABLE();
 801251e:	ea224000 	movih      	r2, 16384
 8012522:	e4420dff 	addi      	r2, r2, 3584
 8012526:	3500      	movi      	r5, 0
 8012528:	9260      	ld.w      	r3, (r2, 0x0)
 801252a:	ec630100 	ori      	r3, r3, 256
 801252e:	b260      	st.w      	r3, (r2, 0x0)
	
	HAL_NVIC_SetPriority(DMA_Channel0_IRQn, 0);
 8012530:	6c57      	mov      	r1, r5
 8012532:	3004      	movi      	r0, 4
 8012534:	e3fffb98 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(DMA_Channel0_IRQn);
 8012538:	3004      	movi      	r0, 4
 801253a:	e3fffbaf 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
	
	HAL_NVIC_SetPriority(DMA_Channel1_IRQn, 0);
 801253e:	6c57      	mov      	r1, r5
 8012540:	3005      	movi      	r0, 5
	hspi.Instance = SPI;
 8012542:	1187      	lrw      	r4, 0x20001900	// 80125dc <main+0xd0>
	HAL_NVIC_SetPriority(DMA_Channel1_IRQn, 0);
 8012544:	e3fffb90 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(DMA_Channel1_IRQn);
 8012548:	3005      	movi      	r0, 5
 801254a:	e3fffba7 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
	hspi.Instance = SPI;
 801254e:	ea234001 	movih      	r3, 16385
 8012552:	3baa      	bseti      	r3, 10
 8012554:	b460      	st.w      	r3, (r4, 0x0)
	hspi.Init.Mode = SPI_MODE_MASTER;
 8012556:	3304      	movi      	r3, 4
 8012558:	b461      	st.w      	r3, (r4, 0x4)
	if (HAL_SPI_Init(&hspi) != HAL_OK)
 801255a:	6c13      	mov      	r0, r4
	hspi.Init.NSS = SPI_NSS_SOFT;
 801255c:	3302      	movi      	r3, 2
	hspi.Init.CLKPolarity = SPI_POLARITY_LOW;
 801255e:	b4a2      	st.w      	r5, (r4, 0x8)
	hspi.Init.CLKPhase = SPI_PHASE_1EDGE;
 8012560:	b4a3      	st.w      	r5, (r4, 0xc)
	hspi.Init.NSS = SPI_NSS_SOFT;
 8012562:	b464      	st.w      	r3, (r4, 0x10)
	hspi.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
 8012564:	b4a5      	st.w      	r5, (r4, 0x14)
	hspi.Init.FirstByte = SPI_LITTLEENDIAN;
 8012566:	b4a6      	st.w      	r5, (r4, 0x18)
	if (HAL_SPI_Init(&hspi) != HAL_OK)
 8012568:	e3fffbd4 	bsr      	0x8011d10	// 8011d10 <HAL_SPI_Init>
 801256c:	e9000003 	bez      	r0, 0x8012572	// 8012572 <main+0x66>
 8012570:	0400      	br      	0x8012570	// 8012570 <main+0x64>
	__HAL_SPI_SET_CS_LOW(&hspi);
 8012572:	9440      	ld.w      	r2, (r4, 0x0)
 8012574:	9260      	ld.w      	r3, (r2, 0x0)
 8012576:	3b82      	bclri      	r3, 2
 8012578:	b260      	st.w      	r3, (r2, 0x0)
	LCD_Init();//LCD初始化
 801257a:	e00001bd 	bsr      	0x80128f4	// 80128f4 <LCD_Init>
		for(int i=0;i<40;i++)
 801257e:	3400      	movi      	r4, 0
			Draw_Circle(64,40,i,LGRAY);
 8012580:	7550      	zextb      	r5, r4
 8012582:	ea03c618 	movi      	r3, 50712
 8012586:	6c97      	mov      	r2, r5
 8012588:	3128      	movi      	r1, 40
 801258a:	3040      	movi      	r0, 64
 801258c:	e000044c 	bsr      	0x8012e24	// 8012e24 <Draw_Circle>
			Draw_Circle(64,120,i,BLUE);
 8012590:	331f      	movi      	r3, 31
 8012592:	6c97      	mov      	r2, r5
 8012594:	3178      	movi      	r1, 120
 8012596:	3040      	movi      	r0, 64
 8012598:	e0000446 	bsr      	0x8012e24	// 8012e24 <Draw_Circle>
		for(int i=0;i<40;i++)
 801259c:	2400      	addi      	r4, 1
			HAL_Delay(10);
 801259e:	300a      	movi      	r0, 10
 80125a0:	e3fffb56 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		for(int i=0;i<40;i++)
 80125a4:	eb440028 	cmpnei      	r4, 40
 80125a8:	0bec      	bt      	0x8012580	// 8012580 <main+0x74>
			Draw_Circle(64,40,i,WHITE);
 80125aa:	7550      	zextb      	r5, r4
 80125ac:	ea03ffff 	movi      	r3, 65535
 80125b0:	6c97      	mov      	r2, r5
 80125b2:	3128      	movi      	r1, 40
 80125b4:	3040      	movi      	r0, 64
 80125b6:	e0000437 	bsr      	0x8012e24	// 8012e24 <Draw_Circle>
			Draw_Circle(64,120,i,WHITE);
 80125ba:	ea03ffff 	movi      	r3, 65535
 80125be:	6c97      	mov      	r2, r5
 80125c0:	3178      	movi      	r1, 120
 80125c2:	3040      	movi      	r0, 64
 80125c4:	e0000430 	bsr      	0x8012e24	// 8012e24 <Draw_Circle>
		for(int i=40;i>0;i--)
 80125c8:	2c00      	subi      	r4, 1
			HAL_Delay(10);
 80125ca:	300a      	movi      	r0, 10
 80125cc:	e3fffb40 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		for(int i=40;i>0;i--)
 80125d0:	e924ffed 	bnez      	r4, 0x80125aa	// 80125aa <main+0x9e>
 80125d4:	07d5      	br      	0x801257e	// 801257e <main+0x72>
 80125d6:	0000      	.short	0x0000
 80125d8:	08014a50 	.long	0x08014a50
 80125dc:	20001900 	.long	0x20001900

080125e0 <HAL_SPI_TxCpltCallback>:
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
 80125e0:	14d0      	push      	r15
	__HAL_SPI_SET_CS_HIGH(hspi);
 80125e2:	9040      	ld.w      	r2, (r0, 0x0)
	printf("tx cplt\r\n");
 80125e4:	1004      	lrw      	r0, 0x8014a44	// 80125f4 <HAL_SPI_TxCpltCallback+0x14>
	__HAL_SPI_SET_CS_HIGH(hspi);
 80125e6:	9260      	ld.w      	r3, (r2, 0x0)
 80125e8:	ec630004 	ori      	r3, r3, 4
 80125ec:	b260      	st.w      	r3, (r2, 0x0)
	printf("tx cplt\r\n");
 80125ee:	e3fff98d 	bsr      	0x8011908	// 8011908 <__GI_puts>
}
 80125f2:	1490      	pop      	r15
 80125f4:	08014a44 	.long	0x08014a44

080125f8 <HAL_SPI_RxCpltCallback>:

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi)
{
 80125f8:	14d0      	push      	r15
	__HAL_SPI_SET_CS_HIGH(hspi);
 80125fa:	9040      	ld.w      	r2, (r0, 0x0)
	printf("rx cplt\r\n");
 80125fc:	1004      	lrw      	r0, 0x8014a38	// 801260c <HAL_SPI_RxCpltCallback+0x14>
	__HAL_SPI_SET_CS_HIGH(hspi);
 80125fe:	9260      	ld.w      	r3, (r2, 0x0)
 8012600:	ec630004 	ori      	r3, r3, 4
 8012604:	b260      	st.w      	r3, (r2, 0x0)
	printf("rx cplt\r\n");
 8012606:	e3fff981 	bsr      	0x8011908	// 8011908 <__GI_puts>
}
 801260a:	1490      	pop      	r15
 801260c:	08014a38 	.long	0x08014a38

08012610 <Error_Handler>:

void Error_Handler(void)
{
 8012610:	0400      	br      	0x8012610	// 8012610 <Error_Handler>
	...

08012614 <HAL_SPI_MspInit>:
{

}

void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{
 8012614:	14d1      	push      	r4, r15
	__HAL_RCC_SPI_CLK_ENABLE();
 8012616:	ea224000 	movih      	r2, 16384
 801261a:	e4420dff 	addi      	r2, r2, 3584
{
 801261e:	6d03      	mov      	r4, r0
	__HAL_RCC_SPI_CLK_ENABLE();
 8012620:	9260      	ld.w      	r3, (r2, 0x0)
 8012622:	ec630080 	ori      	r3, r3, 128
 8012626:	b260      	st.w      	r3, (r2, 0x0)
	__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4);
 8012628:	1173      	lrw      	r3, 0x40011400	// 80126f4 <HAL_SPI_MspInit+0xe0>
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, GPIO_PIN_2);
	__HAL_AFIO_REMAP_SPI_MISO(GPIOB, GPIO_PIN_3);
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, GPIO_PIN_5);
	
	hdma_spi_tx.Instance = DMA_Channel0;
 801262a:	1114      	lrw      	r0, 0x200018b4	// 80126f8 <HAL_SPI_MspInit+0xe4>
	__HAL_RCC_SPI_CLK_ENABLE();
 801262c:	3100      	movi      	r1, 0
	__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4);
 801262e:	9344      	ld.w      	r2, (r3, 0x10)
 8012630:	ec420010 	ori      	r2, r2, 16
 8012634:	b344      	st.w      	r2, (r3, 0x10)
 8012636:	9345      	ld.w      	r2, (r3, 0x14)
 8012638:	3a84      	bclri      	r2, 4
 801263a:	b345      	st.w      	r2, (r3, 0x14)
 801263c:	9346      	ld.w      	r2, (r3, 0x18)
 801263e:	3a84      	bclri      	r2, 4
 8012640:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, GPIO_PIN_2);
 8012642:	9344      	ld.w      	r2, (r3, 0x10)
 8012644:	ec420004 	ori      	r2, r2, 4
 8012648:	b344      	st.w      	r2, (r3, 0x10)
 801264a:	9345      	ld.w      	r2, (r3, 0x14)
 801264c:	3a82      	bclri      	r2, 2
 801264e:	b345      	st.w      	r2, (r3, 0x14)
 8012650:	9346      	ld.w      	r2, (r3, 0x18)
 8012652:	ec420004 	ori      	r2, r2, 4
 8012656:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_MISO(GPIOB, GPIO_PIN_3);
 8012658:	9344      	ld.w      	r2, (r3, 0x10)
 801265a:	ec420008 	ori      	r2, r2, 8
 801265e:	b344      	st.w      	r2, (r3, 0x10)
 8012660:	9345      	ld.w      	r2, (r3, 0x14)
 8012662:	3a83      	bclri      	r2, 3
 8012664:	b345      	st.w      	r2, (r3, 0x14)
 8012666:	9346      	ld.w      	r2, (r3, 0x18)
 8012668:	ec420008 	ori      	r2, r2, 8
 801266c:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, GPIO_PIN_5);
 801266e:	9344      	ld.w      	r2, (r3, 0x10)
 8012670:	ec420020 	ori      	r2, r2, 32
 8012674:	b344      	st.w      	r2, (r3, 0x10)
 8012676:	9345      	ld.w      	r2, (r3, 0x14)
 8012678:	3a85      	bclri      	r2, 5
 801267a:	b345      	st.w      	r2, (r3, 0x14)
 801267c:	9346      	ld.w      	r2, (r3, 0x18)
 801267e:	3a85      	bclri      	r2, 5
 8012680:	b346      	st.w      	r2, (r3, 0x18)
	hdma_spi_tx.Instance = DMA_Channel0;
 8012682:	ea234000 	movih      	r3, 16384
 8012686:	e463080f 	addi      	r3, r3, 2064
 801268a:	b060      	st.w      	r3, (r0, 0x0)
	hdma_spi_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;
 801268c:	3301      	movi      	r3, 1
 801268e:	b061      	st.w      	r3, (r0, 0x4)
	hdma_spi_tx.Init.DestInc = DMA_DINC_DISABLE;
	hdma_spi_tx.Init.SrcInc = DMA_SINC_ENABLE;
 8012690:	3302      	movi      	r3, 2
 8012692:	b063      	st.w      	r3, (r0, 0xc)
	hdma_spi_tx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 8012694:	3320      	movi      	r3, 32
 8012696:	b064      	st.w      	r3, (r0, 0x10)
	hdma_spi_tx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
	hdma_spi_tx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_TX;
 8012698:	3314      	movi      	r3, 20
	hdma_spi_tx.Init.DestInc = DMA_DINC_DISABLE;
 801269a:	b022      	st.w      	r1, (r0, 0x8)
	hdma_spi_tx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
 801269c:	b025      	st.w      	r1, (r0, 0x14)
	hdma_spi_tx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_TX;
 801269e:	b066      	st.w      	r3, (r0, 0x18)
	
	
	
	__HAL_LINKDMA(hspi, hdmatx, hdma_spi_tx);
 80126a0:	b40d      	st.w      	r0, (r4, 0x34)
 80126a2:	b08a      	st.w      	r4, (r0, 0x28)
	if (HAL_DMA_Init(&hdma_spi_tx) != HAL_OK)
 80126a4:	e3fffe20 	bsr      	0x80122e4	// 80122e4 <HAL_DMA_Init>
 80126a8:	e9200023 	bnez      	r0, 0x80126ee	// 80126ee <HAL_SPI_MspInit+0xda>
	{
		Error_Handler();
	}
	
	hdma_spi_rx.Instance = DMA_Channel1;
 80126ac:	1014      	lrw      	r0, 0x20001868	// 80126fc <HAL_SPI_MspInit+0xe8>
 80126ae:	ea234000 	movih      	r3, 16384
 80126b2:	e463083f 	addi      	r3, r3, 2112
 80126b6:	b060      	st.w      	r3, (r0, 0x0)
	hdma_spi_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
 80126b8:	3301      	movi      	r3, 1
 80126ba:	b061      	st.w      	r3, (r0, 0x4)
	hdma_spi_rx.Init.DestInc = DMA_DINC_ENABLE;
 80126bc:	3308      	movi      	r3, 8
 80126be:	b062      	st.w      	r3, (r0, 0x8)
	hdma_spi_rx.Init.SrcInc = DMA_SINC_DISABLE;
 80126c0:	3300      	movi      	r3, 0
 80126c2:	b063      	st.w      	r3, (r0, 0xc)
	hdma_spi_rx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 80126c4:	3220      	movi      	r2, 32
	hdma_spi_rx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
 80126c6:	b065      	st.w      	r3, (r0, 0x14)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
	
	__HAL_LINKDMA(hspi, hdmarx, hdma_spi_rx);
 80126c8:	b40e      	st.w      	r0, (r4, 0x38)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
 80126ca:	3310      	movi      	r3, 16
	hdma_spi_rx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 80126cc:	b044      	st.w      	r2, (r0, 0x10)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
 80126ce:	b066      	st.w      	r3, (r0, 0x18)
	__HAL_LINKDMA(hspi, hdmarx, hdma_spi_rx);
 80126d0:	b08a      	st.w      	r4, (r0, 0x28)
	if (HAL_DMA_Init(&hdma_spi_rx) != HAL_OK)
 80126d2:	e3fffe09 	bsr      	0x80122e4	// 80122e4 <HAL_DMA_Init>
 80126d6:	e9000004 	bez      	r0, 0x80126de	// 80126de <HAL_SPI_MspInit+0xca>
	{
		Error_Handler();
 80126da:	e3ffff9b 	bsr      	0x8012610	// 8012610 <Error_Handler>
	}
	
	 
	 
	HAL_NVIC_SetPriority(SPI_LS_IRQn, 1);
 80126de:	3101      	movi      	r1, 1
 80126e0:	300c      	movi      	r0, 12
 80126e2:	e3fffac1 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(SPI_LS_IRQn);
 80126e6:	300c      	movi      	r0, 12
 80126e8:	e3fffad8 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
}
 80126ec:	1491      	pop      	r4, r15
		Error_Handler();
 80126ee:	e3ffff91 	bsr      	0x8012610	// 8012610 <Error_Handler>
 80126f2:	07dd      	br      	0x80126ac	// 80126ac <HAL_SPI_MspInit+0x98>
 80126f4:	40011400 	.long	0x40011400
 80126f8:	200018b4 	.long	0x200018b4
 80126fc:	20001868 	.long	0x20001868

08012700 <CORET_IRQHandler>:
extern DMA_HandleTypeDef hdma_spi_tx;
extern DMA_HandleTypeDef hdma_spi_rx;

#define readl(addr) ({unsigned int __v = (*(volatile unsigned int *) (addr)); __v;})
__attribute__((isr)) void CORET_IRQHandler(void)
{
 8012700:	1460      	nie
 8012702:	1462      	ipush
 8012704:	142e      	subi      	r14, r14, 56
 8012706:	d64e1c2d 	stm      	r18-r31, (r14)
 801270a:	1428      	subi      	r14, r14, 32
 801270c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012710:	14d0      	push      	r15
	readl(0xE000E010);
 8012712:	1068      	lrw      	r3, 0xe000e000	// 8012730 <CORET_IRQHandler+0x30>
 8012714:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8012716:	e3fffa8d 	bsr      	0x8011c30	// 8011c30 <HAL_IncTick>
}
 801271a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801271e:	1401      	addi      	r14, r14, 4
 8012720:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012724:	1408      	addi      	r14, r14, 32
 8012726:	d24e1c2d 	ldm      	r18-r31, (r14)
 801272a:	140e      	addi      	r14, r14, 56
 801272c:	1463      	ipop
 801272e:	1461      	nir
 8012730:	e000e000 	.long	0xe000e000

08012734 <SPI_LS_IRQHandler>:

__attribute__((isr)) void SPI_LS_IRQHandler(void)
{
 8012734:	1460      	nie
 8012736:	1462      	ipush
 8012738:	142e      	subi      	r14, r14, 56
 801273a:	d64e1c2d 	stm      	r18-r31, (r14)
 801273e:	1428      	subi      	r14, r14, 32
 8012740:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012744:	14d0      	push      	r15
	HAL_SPI_IRQHandler(&hspi);
 8012746:	1008      	lrw      	r0, 0x20001900	// 8012764 <SPI_LS_IRQHandler+0x30>
 8012748:	e3fffbfc 	bsr      	0x8011f40	// 8011f40 <HAL_SPI_IRQHandler>
}
 801274c:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012750:	1401      	addi      	r14, r14, 4
 8012752:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012756:	1408      	addi      	r14, r14, 32
 8012758:	d24e1c2d 	ldm      	r18-r31, (r14)
 801275c:	140e      	addi      	r14, r14, 56
 801275e:	1463      	ipop
 8012760:	1461      	nir
 8012762:	0000      	.short	0x0000
 8012764:	20001900 	.long	0x20001900

08012768 <DMA_Channel0_IRQHandler>:

__attribute__((isr)) void DMA_Channel0_IRQHandler(void)
{
 8012768:	1460      	nie
 801276a:	1462      	ipush
 801276c:	142e      	subi      	r14, r14, 56
 801276e:	d64e1c2d 	stm      	r18-r31, (r14)
 8012772:	1428      	subi      	r14, r14, 32
 8012774:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012778:	14d0      	push      	r15
	HAL_DMA_IRQHandler(&hdma_spi_tx);
 801277a:	1008      	lrw      	r0, 0x200018b4	// 8012798 <DMA_Channel0_IRQHandler+0x30>
 801277c:	e3fffe5a 	bsr      	0x8012430	// 8012430 <HAL_DMA_IRQHandler>
}
 8012780:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012784:	1401      	addi      	r14, r14, 4
 8012786:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801278a:	1408      	addi      	r14, r14, 32
 801278c:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012790:	140e      	addi      	r14, r14, 56
 8012792:	1463      	ipop
 8012794:	1461      	nir
 8012796:	0000      	.short	0x0000
 8012798:	200018b4 	.long	0x200018b4

0801279c <DMA_Channel1_IRQHandler>:

__attribute__((isr)) void DMA_Channel1_IRQHandler(void)
{
 801279c:	1460      	nie
 801279e:	1462      	ipush
 80127a0:	142e      	subi      	r14, r14, 56
 80127a2:	d64e1c2d 	stm      	r18-r31, (r14)
 80127a6:	1428      	subi      	r14, r14, 32
 80127a8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80127ac:	14d0      	push      	r15
	HAL_DMA_IRQHandler(&hdma_spi_rx);
 80127ae:	1008      	lrw      	r0, 0x20001868	// 80127cc <DMA_Channel1_IRQHandler+0x30>
 80127b0:	e3fffe40 	bsr      	0x8012430	// 8012430 <HAL_DMA_IRQHandler>
 80127b4:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80127b8:	1401      	addi      	r14, r14, 4
 80127ba:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80127be:	1408      	addi      	r14, r14, 32
 80127c0:	d24e1c2d 	ldm      	r18-r31, (r14)
 80127c4:	140e      	addi      	r14, r14, 56
 80127c6:	1463      	ipop
 80127c8:	1461      	nir
 80127ca:	0000      	.short	0x0000
 80127cc:	20001868 	.long	0x20001868

080127d0 <LCD_GPIO_Init>:
#include "lcd_init.h"
#include "spi.h"


void LCD_GPIO_Init(void)
{
 80127d0:	14d1      	push      	r4, r15
 80127d2:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	__HAL_RCC_GPIO_CLK_ENABLE();
 80127d4:	ea224000 	movih      	r2, 16384
 80127d8:	e4420dff 	addi      	r2, r2, 3584
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 80127dc:	3400      	movi      	r4, 0
 80127de:	b880      	st.w      	r4, (r14, 0x0)
 80127e0:	b881      	st.w      	r4, (r14, 0x4)
 80127e2:	b882      	st.w      	r4, (r14, 0x8)
	__HAL_RCC_GPIO_CLK_ENABLE();
 80127e4:	9260      	ld.w      	r3, (r2, 0x0)
 80127e6:	ec630800 	ori      	r3, r3, 2048
 80127ea:	b260      	st.w      	r3, (r2, 0x0)

	
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_6;
 80127ec:	3343      	movi      	r3, 67
 80127ee:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 80127f0:	3302      	movi      	r3, 2
 80127f2:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80127f4:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80127f6:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80127f8:	1007      	lrw      	r0, 0x40011400	// 8012814 <LCD_GPIO_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80127fa:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80127fc:	e3fff8c4 	bsr      	0x8011984	// 8011984 <HAL_GPIO_Init>
	
	
	HAL_NVIC_SetPriority(GPIOB_IRQn,0);
 8012800:	6c53      	mov      	r1, r4
 8012802:	300f      	movi      	r0, 15
 8012804:	e3fffa30 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 8012808:	300f      	movi      	r0, 15
 801280a:	e3fffa47 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
}
 801280e:	1403      	addi      	r14, r14, 12
 8012810:	1491      	pop      	r4, r15
 8012812:	0000      	.short	0x0000
 8012814:	40011400 	.long	0x40011400

08012818 <LCD_WR_DATA>:
      函数说明：LCD写入数据
      入口数据：dat 写入的数据
      返回值：  无
******************************************************************************/
void LCD_WR_DATA(uint16_t dat)
{
 8012818:	14d0      	push      	r15
 801281a:	1421      	subi      	r14, r14, 4
	//LCD_Writ_Bus(dat>>8);
	//LCD_Writ_Bus(dat);
	
	
	uint8_t data[2];
	data[0] = dat>>8;
 801281c:	4868      	lsri      	r3, r0, 8
 801281e:	dc6e0000 	st.b      	r3, (r14, 0x0)
	data[1] = dat;
 8012822:	dc0e0001 	st.b      	r0, (r14, 0x1)
		
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012826:	3364      	movi      	r3, 100
 8012828:	3202      	movi      	r2, 2
 801282a:	6c7b      	mov      	r1, r14
 801282c:	1003      	lrw      	r0, 0x20001900	// 8012838 <LCD_WR_DATA+0x20>
 801282e:	e3fffa9b 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	
	
}
 8012832:	1401      	addi      	r14, r14, 4
 8012834:	1490      	pop      	r15
 8012836:	0000      	.short	0x0000
 8012838:	20001900 	.long	0x20001900

0801283c <LCD_WR_REG>:
      函数说明：LCD写入命令
      入口数据：dat 写入的命令
      返回值：  无
******************************************************************************/
void LCD_WR_REG(uint8_t dat)
{
 801283c:	14d1      	push      	r4, r15
 801283e:	1421      	subi      	r14, r14, 4
 8012840:	6d03      	mov      	r4, r0
	LCD_DC_Clr();//写命令
 8012842:	3200      	movi      	r2, 0
 8012844:	3140      	movi      	r1, 64
 8012846:	100a      	lrw      	r0, 0x40011400	// 801286c <LCD_WR_REG+0x30>
 8012848:	e3fff978 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 801284c:	3364      	movi      	r3, 100
 801284e:	e42e0002 	addi      	r1, r14, 3
 8012852:	3201      	movi      	r2, 1
 8012854:	1007      	lrw      	r0, 0x20001900	// 8012870 <LCD_WR_REG+0x34>
	uint8_t data = dat;
 8012856:	dc8e0003 	st.b      	r4, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 801285a:	e3fffa85 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_Writ_Bus(dat);
	LCD_DC_Set();//写数据
 801285e:	3201      	movi      	r2, 1
 8012860:	3140      	movi      	r1, 64
 8012862:	1003      	lrw      	r0, 0x40011400	// 801286c <LCD_WR_REG+0x30>
 8012864:	e3fff96a 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
}
 8012868:	1401      	addi      	r14, r14, 4
 801286a:	1491      	pop      	r4, r15
 801286c:	40011400 	.long	0x40011400
 8012870:	20001900 	.long	0x20001900

08012874 <LCD_Address_Set>:
      入口数据：x1,x2 设置列的起始和结束地址
                y1,y2 设置行的起始和结束地址
      返回值：  无
******************************************************************************/
void LCD_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2)
{
 8012874:	14d4      	push      	r4-r7, r15
 8012876:	1421      	subi      	r14, r14, 4
 8012878:	6d03      	mov      	r4, r0
	if(USE_HORIZONTAL==0)           //测试对了
	{
		LCD_WR_REG(0x2a);//列地址设置
 801287a:	302a      	movi      	r0, 42
{
 801287c:	6d87      	mov      	r6, r1
 801287e:	6dcb      	mov      	r7, r2
 8012880:	6d4f      	mov      	r5, r3
		LCD_WR_REG(0x2a);//列地址设置
 8012882:	e3ffffdd 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	data[0] = dat>>8;
 8012886:	4c68      	lsri      	r3, r4, 8
	data[1] = dat;
 8012888:	dc8e0001 	st.b      	r4, (r14, 0x1)
	data[0] = dat>>8;
 801288c:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012890:	6c7b      	mov      	r1, r14
 8012892:	1098      	lrw      	r4, 0x20001900	// 80128f0 <LCD_Address_Set+0x7c>
 8012894:	3364      	movi      	r3, 100
 8012896:	3202      	movi      	r2, 2
 8012898:	6c13      	mov      	r0, r4
 801289a:	e3fffa65 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	data[0] = dat>>8;
 801289e:	4f68      	lsri      	r3, r7, 8
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128a0:	6c7b      	mov      	r1, r14
	data[0] = dat>>8;
 80128a2:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128a6:	3202      	movi      	r2, 2
 80128a8:	3364      	movi      	r3, 100
 80128aa:	6c13      	mov      	r0, r4
	data[1] = dat;
 80128ac:	dcee0001 	st.b      	r7, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128b0:	e3fffa5a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
		LCD_WR_DATA(x1);
		LCD_WR_DATA(x2);
		LCD_WR_REG(0x2b);//行地址设置
 80128b4:	302b      	movi      	r0, 43
 80128b6:	e3ffffc3 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	data[0] = dat>>8;
 80128ba:	4e68      	lsri      	r3, r6, 8
 80128bc:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128c0:	6c7b      	mov      	r1, r14
 80128c2:	3364      	movi      	r3, 100
 80128c4:	3202      	movi      	r2, 2
 80128c6:	6c13      	mov      	r0, r4
	data[1] = dat;
 80128c8:	dcce0001 	st.b      	r6, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128cc:	e3fffa4c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	data[0] = dat>>8;
 80128d0:	4d68      	lsri      	r3, r5, 8
 80128d2:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128d6:	3202      	movi      	r2, 2
 80128d8:	3364      	movi      	r3, 100
 80128da:	6c7b      	mov      	r1, r14
 80128dc:	6c13      	mov      	r0, r4
	data[1] = dat;
 80128de:	dcae0001 	st.b      	r5, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128e2:	e3fffa41 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//储存器写
 80128e6:	302c      	movi      	r0, 44
 80128e8:	e3ffffaa 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
		LCD_WR_REG(0x2b);//行地址设置
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//储存器写
	}
}
 80128ec:	1401      	addi      	r14, r14, 4
 80128ee:	1494      	pop      	r4-r7, r15
 80128f0:	20001900 	.long	0x20001900

080128f4 <LCD_Init>:

void LCD_Init(void)
{
 80128f4:	ebe00058 	push      	r4-r11, r15, r16-r17
 80128f8:	1421      	subi      	r14, r14, 4
	
	LCD_RES_Clr();//复位
 80128fa:	3200      	movi      	r2, 0
 80128fc:	3101      	movi      	r1, 1
 80128fe:	ea800148 	lrw      	r0, 0x40011400	// 8012e1c <LCD_Init+0x528>
 8012902:	e3fff91b 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_Delay(100);
 8012906:	3064      	movi      	r0, 100
 8012908:	e3fff9a2 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	LCD_RES_Set();
 801290c:	3201      	movi      	r2, 1
 801290e:	6c4b      	mov      	r1, r2
 8012910:	ea800143 	lrw      	r0, 0x40011400	// 8012e1c <LCD_Init+0x528>
 8012914:	e3fff912 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_Delay(100);
 8012918:	3064      	movi      	r0, 100
 801291a:	e3fff999 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	
	LCD_BLK_Set();//打开背光
 801291e:	3201      	movi      	r2, 1
 8012920:	3102      	movi      	r1, 2
 8012922:	ea80013f 	lrw      	r0, 0x40011400	// 8012e1c <LCD_Init+0x528>
 8012926:	e3fff909 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
    HAL_Delay(100);
 801292a:	3064      	movi      	r0, 100
 801292c:	e3fff990 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	
	LCD_WR_REG(0x11); //Sleep out
 8012930:	3011      	movi      	r0, 17
 8012932:	e3ffff85 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_Delay(120); //Delay 120ms
 8012936:	3078      	movi      	r0, 120
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012938:	ea84013a 	lrw      	r4, 0x20001900	// 8012e20 <LCD_Init+0x52c>
	HAL_Delay(120); //Delay 120ms
 801293c:	e3fff988 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	//------------------------------------ST7735S Frame rate-------------------------------------------------//
	LCD_WR_REG(0xB1); //Frame rate 80Hz
 8012940:	30b1      	movi      	r0, 177
 8012942:	e3ffff7d 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012946:	3602      	movi      	r6, 2
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012948:	e42e0002 	addi      	r1, r14, 3
 801294c:	3364      	movi      	r3, 100
 801294e:	3201      	movi      	r2, 1
 8012950:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012952:	3735      	movi      	r7, 53
 8012954:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012958:	e3fffa06 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 801295c:	e42e0002 	addi      	r1, r14, 3
 8012960:	3364      	movi      	r3, 100
 8012962:	3201      	movi      	r2, 1
 8012964:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012966:	3536      	movi      	r5, 54
 8012968:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 801296c:	e3fff9fc 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012970:	e42e0002 	addi      	r1, r14, 3
 8012974:	3364      	movi      	r3, 100
 8012976:	3201      	movi      	r2, 1
 8012978:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 801297a:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 801297e:	e3fff9f3 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	LCD_WR_REG(0xB2); //Frame rate 80Hz
 8012982:	30b2      	movi      	r0, 178
 8012984:	e3ffff5c 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012988:	e42e0002 	addi      	r1, r14, 3
 801298c:	3364      	movi      	r3, 100
 801298e:	3201      	movi      	r2, 1
 8012990:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012992:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012996:	e3fff9e7 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 801299a:	e42e0002 	addi      	r1, r14, 3
 801299e:	3364      	movi      	r3, 100
 80129a0:	3201      	movi      	r2, 1
 80129a2:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129a4:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129a8:	e3fff9de 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129ac:	e42e0002 	addi      	r1, r14, 3
 80129b0:	3364      	movi      	r3, 100
 80129b2:	3201      	movi      	r2, 1
 80129b4:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129b6:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129ba:	e3fff9d5 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	LCD_WR_REG(0xB3); //Frame rate 80Hz
 80129be:	30b3      	movi      	r0, 179
 80129c0:	e3ffff3e 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129c4:	e42e0002 	addi      	r1, r14, 3
 80129c8:	3364      	movi      	r3, 100
 80129ca:	3201      	movi      	r2, 1
 80129cc:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129ce:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129d2:	e3fff9c9 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129d6:	e42e0002 	addi      	r1, r14, 3
 80129da:	3364      	movi      	r3, 100
 80129dc:	3201      	movi      	r2, 1
 80129de:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129e0:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129e4:	e3fff9c0 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129e8:	e42e0002 	addi      	r1, r14, 3
 80129ec:	3364      	movi      	r3, 100
 80129ee:	3201      	movi      	r2, 1
 80129f0:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129f2:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129f6:	e3fff9b7 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129fa:	e42e0002 	addi      	r1, r14, 3
 80129fe:	3364      	movi      	r3, 100
 8012a00:	3201      	movi      	r2, 1
 8012a02:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a04:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a08:	e3fff9ae 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a0c:	e42e0002 	addi      	r1, r14, 3
 8012a10:	3364      	movi      	r3, 100
 8012a12:	3201      	movi      	r2, 1
 8012a14:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a16:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a1a:	e3fff9a5 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a1e:	e42e0002 	addi      	r1, r14, 3
 8012a22:	3364      	movi      	r3, 100
 8012a24:	3201      	movi      	r2, 1
 8012a26:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a28:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a2c:	e3fff99c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x36);
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	//------------------------------------End ST7735S Frame rate-------------------------------------------//
	LCD_WR_REG(0xB4); //Dot inversion
 8012a30:	30b4      	movi      	r0, 180
 8012a32:	e3ffff05 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012a36:	3503      	movi      	r5, 3
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a38:	e42e0002 	addi      	r1, r14, 3
 8012a3c:	3364      	movi      	r3, 100
 8012a3e:	3201      	movi      	r2, 1
 8012a40:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a42:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a46:	e3fff98f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	//------------------------------------ST7735S Power Sequence-----------------------------------------//
	LCD_WR_REG(0xC0);
 8012a4a:	30c0      	movi      	r0, 192
 8012a4c:	e3fffef8 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012a50:	3300      	movi      	r3, 0
 8012a52:	2b5d      	subi      	r3, 94
 8012a54:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a58:	e42e0002 	addi      	r1, r14, 3
 8012a5c:	3364      	movi      	r3, 100
 8012a5e:	3201      	movi      	r2, 1
 8012a60:	6c13      	mov      	r0, r4
 8012a62:	e3fff981 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a66:	e42e0002 	addi      	r1, r14, 3
 8012a6a:	3364      	movi      	r3, 100
 8012a6c:	3201      	movi      	r2, 1
 8012a6e:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a70:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a74:	e3fff978 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012a78:	3300      	movi      	r3, 0
 8012a7a:	2b7b      	subi      	r3, 124
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a7c:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012a80:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a84:	3201      	movi      	r2, 1
 8012a86:	3364      	movi      	r3, 100
 8012a88:	6c13      	mov      	r0, r4
 8012a8a:	e3fff96d 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0xA2);
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x84);
	LCD_WR_REG(0xC1);
 8012a8e:	30c1      	movi      	r0, 193
 8012a90:	e3fffed6 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012a94:	3300      	movi      	r3, 0
 8012a96:	2b3a      	subi      	r3, 59
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a98:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012a9c:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012aa0:	3201      	movi      	r2, 1
 8012aa2:	3364      	movi      	r3, 100
 8012aa4:	6c13      	mov      	r0, r4
 8012aa6:	e3fff95f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0xC5);
	LCD_WR_REG(0xC2);
 8012aaa:	30c2      	movi      	r0, 194
 8012aac:	e3fffec8 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012ab0:	330d      	movi      	r3, 13
 8012ab2:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ab6:	e42e0002 	addi      	r1, r14, 3
 8012aba:	3364      	movi      	r3, 100
 8012abc:	3201      	movi      	r2, 1
 8012abe:	6c13      	mov      	r0, r4
 8012ac0:	e3fff952 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012ac4:	ea080000 	movi      	r8, 0
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ac8:	e42e0002 	addi      	r1, r14, 3
 8012acc:	3364      	movi      	r3, 100
 8012ace:	3201      	movi      	r2, 1
 8012ad0:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012ad2:	dd0e0003 	st.b      	r8, (r14, 0x3)
 8012ad6:	3600      	movi      	r6, 0
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ad8:	e3fff946 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x0D);
	LCD_WR_DATA8(0x00);
	LCD_WR_REG(0xC3);
 8012adc:	30c3      	movi      	r0, 195
 8012ade:	e3fffeaf 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012ae2:	2e72      	subi      	r6, 115
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ae4:	e42e0002 	addi      	r1, r14, 3
 8012ae8:	3364      	movi      	r3, 100
 8012aea:	3201      	movi      	r2, 1
 8012aec:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012aee:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012af2:	e3fff939 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012af6:	332a      	movi      	r3, 42
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012af8:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012afc:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b00:	3201      	movi      	r2, 1
 8012b02:	3364      	movi      	r3, 100
 8012b04:	6c13      	mov      	r0, r4
 8012b06:	e3fff92f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x8D);
	LCD_WR_DATA8(0x2A);
	LCD_WR_REG(0xC4);
 8012b0a:	30c4      	movi      	r0, 196
 8012b0c:	e3fffe98 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b10:	e42e0002 	addi      	r1, r14, 3
 8012b14:	3364      	movi      	r3, 100
 8012b16:	3201      	movi      	r2, 1
 8012b18:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b1a:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b1e:	e3fff923 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012b22:	3300      	movi      	r3, 0
 8012b24:	2b11      	subi      	r3, 18
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b26:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012b2a:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b2e:	3201      	movi      	r2, 1
 8012b30:	3364      	movi      	r3, 100
 8012b32:	6c13      	mov      	r0, r4
 8012b34:	e3fff918 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x8D);
	LCD_WR_DATA8(0xEE);
	//---------------------------------End ST7735S Power Sequence---------------------------------------//
	LCD_WR_REG(0xC5); //VCOM
 8012b38:	30c5      	movi      	r0, 197
 8012b3a:	e3fffe81 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b3e:	e42e0002 	addi      	r1, r14, 3
 8012b42:	3364      	movi      	r3, 100
 8012b44:	3201      	movi      	r2, 1
 8012b46:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b48:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b4c:	e3fff90c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	
	LCD_WR_REG(0x3a); //Set Color Format
 8012b50:	303a      	movi      	r0, 58
 8012b52:	e3fffe75 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012b56:	ea090005 	movi      	r9, 5
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b5a:	e42e0002 	addi      	r1, r14, 3
 8012b5e:	3364      	movi      	r3, 100
 8012b60:	3201      	movi      	r2, 1
 8012b62:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b64:	dd2e0003 	st.b      	r9, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b68:	e3fff8fe 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x05);
	
	LCD_WR_REG(0x36);   //屏幕扫描方式设置  模组驱动芯片为上参考
 8012b6c:	3036      	movi      	r0, 54
 8012b6e:	e3fffe67 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b72:	e42e0002 	addi      	r1, r14, 3
 8012b76:	3364      	movi      	r3, 100
 8012b78:	3201      	movi      	r2, 1
 8012b7a:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b7c:	dd0e0003 	st.b      	r8, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b80:	e3fff8f2 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	if(USE_HORIZONTAL==0)LCD_WR_DATA8(0x08&data);      //              	   垂直方向从上到下 水平从左到右
	else if(USE_HORIZONTAL==1)LCD_WR_DATA8(0xC8&data); //行列地址方式      	 垂直方向从上到下 水平从左到右
	else if(USE_HORIZONTAL==2)LCD_WR_DATA8(0x78&data); //列地址方式 行列交换 垂直方向从下到上 水平从左到右
	else LCD_WR_DATA8(0xA8&data);                      //行地址方式 行列交换 垂直方向从上到下 水平从左到右         
	//------------------------------------ST7735S Gamma Sequence-----------------------------------------//
	LCD_WR_REG(0XE0);
 8012b84:	30e0      	movi      	r0, 224
 8012b86:	e3fffe5b 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	uint8_t data = dat;
 8012b8a:	ea110012 	movi      	r17, 18
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b8e:	e42e0002 	addi      	r1, r14, 3
 8012b92:	3364      	movi      	r3, 100
 8012b94:	3201      	movi      	r2, 1
 8012b96:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b98:	ea10001c 	movi      	r16, 28
 8012b9c:	de2e0003 	st.b      	r17, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ba0:	e3fff8e2 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012ba4:	e42e0002 	addi      	r1, r14, 3
 8012ba8:	3364      	movi      	r3, 100
 8012baa:	3201      	movi      	r2, 1
 8012bac:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012bae:	3710      	movi      	r7, 16
 8012bb0:	de0e0003 	st.b      	r16, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bb4:	e3fff8d8 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012bb8:	e42e0002 	addi      	r1, r14, 3
 8012bbc:	3364      	movi      	r3, 100
 8012bbe:	3201      	movi      	r2, 1
 8012bc0:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012bc2:	ea0b0018 	movi      	r11, 24
 8012bc6:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bca:	e3fff8cd 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012bce:	e42e0002 	addi      	r1, r14, 3
 8012bd2:	3364      	movi      	r3, 100
 8012bd4:	3201      	movi      	r2, 1
 8012bd6:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012bd8:	dd6e0003 	st.b      	r11, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bdc:	e3fff8c4 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012be0:	3333      	movi      	r3, 51
 8012be2:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012be6:	e42e0002 	addi      	r1, r14, 3
 8012bea:	3364      	movi      	r3, 100
 8012bec:	3201      	movi      	r2, 1
 8012bee:	6c13      	mov      	r0, r4
 8012bf0:	e3fff8ba 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012bf4:	332c      	movi      	r3, 44
 8012bf6:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bfa:	e42e0002 	addi      	r1, r14, 3
 8012bfe:	3364      	movi      	r3, 100
 8012c00:	3201      	movi      	r2, 1
 8012c02:	6c13      	mov      	r0, r4
 8012c04:	e3fff8b0 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c08:	3325      	movi      	r3, 37
 8012c0a:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c0e:	e42e0002 	addi      	r1, r14, 3
 8012c12:	3364      	movi      	r3, 100
 8012c14:	3201      	movi      	r2, 1
 8012c16:	6c13      	mov      	r0, r4
 8012c18:	e3fff8a6 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c1c:	3628      	movi      	r6, 40
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c1e:	e42e0002 	addi      	r1, r14, 3
 8012c22:	3364      	movi      	r3, 100
 8012c24:	3201      	movi      	r2, 1
 8012c26:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c28:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c2c:	e3fff89c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c30:	e42e0002 	addi      	r1, r14, 3
 8012c34:	3364      	movi      	r3, 100
 8012c36:	3201      	movi      	r2, 1
 8012c38:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c3a:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c3e:	e3fff893 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c42:	3327      	movi      	r3, 39
 8012c44:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c48:	e42e0002 	addi      	r1, r14, 3
 8012c4c:	3364      	movi      	r3, 100
 8012c4e:	3201      	movi      	r2, 1
 8012c50:	6c13      	mov      	r0, r4
 8012c52:	e3fff889 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c56:	ea0a002f 	movi      	r10, 47
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c5a:	e42e0002 	addi      	r1, r14, 3
 8012c5e:	3364      	movi      	r3, 100
 8012c60:	3201      	movi      	r2, 1
 8012c62:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c64:	dd4e0003 	st.b      	r10, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c68:	e3fff87e 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c6c:	333c      	movi      	r3, 60
 8012c6e:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c72:	e42e0002 	addi      	r1, r14, 3
 8012c76:	3364      	movi      	r3, 100
 8012c78:	3201      	movi      	r2, 1
 8012c7a:	6c13      	mov      	r0, r4
 8012c7c:	e3fff874 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c80:	e42e0002 	addi      	r1, r14, 3
 8012c84:	3364      	movi      	r3, 100
 8012c86:	3201      	movi      	r2, 1
 8012c88:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c8a:	dd0e0003 	st.b      	r8, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c8e:	e3fff86b 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c92:	e42e0002 	addi      	r1, r14, 3
 8012c96:	3364      	movi      	r3, 100
 8012c98:	3201      	movi      	r2, 1
 8012c9a:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c9c:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ca0:	e3fff862 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012ca4:	e42e0002 	addi      	r1, r14, 3
 8012ca8:	3364      	movi      	r3, 100
 8012caa:	3201      	movi      	r2, 1
 8012cac:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cae:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cb2:	e3fff859 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012cb6:	e42e0002 	addi      	r1, r14, 3
 8012cba:	3364      	movi      	r3, 100
 8012cbc:	3201      	movi      	r2, 1
 8012cbe:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cc0:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cc4:	e3fff850 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x3C);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x10);
	LCD_WR_REG(0XE1);
 8012cc8:	30e1      	movi      	r0, 225
 8012cca:	e3fffdb9 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cce:	e42e0002 	addi      	r1, r14, 3
 8012cd2:	3364      	movi      	r3, 100
 8012cd4:	3201      	movi      	r2, 1
 8012cd6:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cd8:	de2e0003 	st.b      	r17, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cdc:	e3fff844 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012ce0:	e42e0002 	addi      	r1, r14, 3
 8012ce4:	3364      	movi      	r3, 100
 8012ce6:	3201      	movi      	r2, 1
 8012ce8:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cea:	de0e0003 	st.b      	r16, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cee:	e3fff83b 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012cf2:	e42e0002 	addi      	r1, r14, 3
 8012cf6:	3364      	movi      	r3, 100
 8012cf8:	3201      	movi      	r2, 1
 8012cfa:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cfc:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d00:	e3fff832 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d04:	e42e0002 	addi      	r1, r14, 3
 8012d08:	3364      	movi      	r3, 100
 8012d0a:	3201      	movi      	r2, 1
 8012d0c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d0e:	dd6e0003 	st.b      	r11, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d12:	e3fff829 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012d16:	332d      	movi      	r3, 45
 8012d18:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d1c:	e42e0002 	addi      	r1, r14, 3
 8012d20:	3364      	movi      	r3, 100
 8012d22:	3201      	movi      	r2, 1
 8012d24:	6c13      	mov      	r0, r4
 8012d26:	e3fff81f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d2a:	e42e0002 	addi      	r1, r14, 3
 8012d2e:	3364      	movi      	r3, 100
 8012d30:	3201      	movi      	r2, 1
 8012d32:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d34:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d38:	e3fff816 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012d3c:	3323      	movi      	r3, 35
 8012d3e:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d42:	e42e0002 	addi      	r1, r14, 3
 8012d46:	3364      	movi      	r3, 100
 8012d48:	3201      	movi      	r2, 1
 8012d4a:	6c13      	mov      	r0, r4
 8012d4c:	e3fff80c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d50:	e42e0002 	addi      	r1, r14, 3
 8012d54:	3364      	movi      	r3, 100
 8012d56:	3201      	movi      	r2, 1
 8012d58:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d5a:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d5e:	e3fff803 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d62:	e42e0002 	addi      	r1, r14, 3
 8012d66:	3364      	movi      	r3, 100
 8012d68:	3201      	movi      	r2, 1
 8012d6a:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d6c:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d70:	e3fff7fa 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012d74:	3326      	movi      	r3, 38
 8012d76:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d7a:	e42e0002 	addi      	r1, r14, 3
 8012d7e:	3364      	movi      	r3, 100
 8012d80:	3201      	movi      	r2, 1
 8012d82:	6c13      	mov      	r0, r4
 8012d84:	e3fff7f0 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d88:	e42e0002 	addi      	r1, r14, 3
 8012d8c:	3364      	movi      	r3, 100
 8012d8e:	3201      	movi      	r2, 1
 8012d90:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d92:	dd4e0003 	st.b      	r10, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d96:	e3fff7e7 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012d9a:	333b      	movi      	r3, 59
 8012d9c:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012da0:	e42e0002 	addi      	r1, r14, 3
 8012da4:	3364      	movi      	r3, 100
 8012da6:	3201      	movi      	r2, 1
 8012da8:	6c13      	mov      	r0, r4
 8012daa:	e3fff7dd 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012dae:	e42e0002 	addi      	r1, r14, 3
 8012db2:	3364      	movi      	r3, 100
 8012db4:	3201      	movi      	r2, 1
 8012db6:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012db8:	dd0e0003 	st.b      	r8, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012dbc:	e3fff7d4 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012dc0:	e42e0002 	addi      	r1, r14, 3
 8012dc4:	3364      	movi      	r3, 100
 8012dc6:	3201      	movi      	r2, 1
 8012dc8:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012dca:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012dce:	e3fff7cb 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012dd2:	e42e0002 	addi      	r1, r14, 3
 8012dd6:	3364      	movi      	r3, 100
 8012dd8:	3201      	movi      	r2, 1
 8012dda:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012ddc:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012de0:	e3fff7c2 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012de4:	e42e0002 	addi      	r1, r14, 3
 8012de8:	3364      	movi      	r3, 100
 8012dea:	3201      	movi      	r2, 1
 8012dec:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012dee:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012df2:	e3fff7b9 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x10);
	
	//------------------------------------End ST7735S Gamma Sequence-----------------------------------------//
	LCD_WR_REG(0x3A); //65k mode
 8012df6:	303a      	movi      	r0, 58
 8012df8:	e3fffd22 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012dfc:	3364      	movi      	r3, 100
 8012dfe:	3201      	movi      	r2, 1
 8012e00:	e42e0002 	addi      	r1, r14, 3
 8012e04:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e06:	dd2e0003 	st.b      	r9, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e0a:	e3fff7ad 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x05);
	LCD_WR_REG(0x29); //Display on 
 8012e0e:	3029      	movi      	r0, 41
 8012e10:	e3fffd16 	bsr      	0x801283c	// 801283c <LCD_WR_REG>
}
 8012e14:	1401      	addi      	r14, r14, 4
 8012e16:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012e1a:	0000      	.short	0x0000
 8012e1c:	40011400 	.long	0x40011400
 8012e20:	20001900 	.long	0x20001900

08012e24 <Draw_Circle>:
                r       半径
                color   圆的颜色
      返回值：  无
******************************************************************************/
void Draw_Circle(uint16_t x0,uint16_t y0,uint8_t r,uint16_t color)
{
 8012e24:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012e28:	1422      	subi      	r14, r14, 8
 8012e2a:	6d8f      	mov      	r6, r3
	int a,b;
	a=0;b=r;	  
 8012e2c:	3500      	movi      	r5, 0
 8012e2e:	c4429023 	mulsh      	r3, r2, r2
{
 8012e32:	6e83      	mov      	r10, r0
 8012e34:	6e47      	mov      	r9, r1
	a=0;b=r;	  
 8012e36:	6dcb      	mov      	r7, r2
 8012e38:	b861      	st.w      	r3, (r14, 0x4)
 8012e3a:	6ed7      	mov      	r11, r5
	while(a<=b)
	{
		LCD_DrawPoint(x0-b,y0-a,color);             //3           
 8012e3c:	751d      	zexth      	r4, r7
 8012e3e:	c48a0088 	subu      	r8, r10, r4
 8012e42:	c4a90030 	addu      	r16, r9, r5
 8012e46:	c41055f0 	zext      	r16, r16, 15, 0
 8012e4a:	7621      	zexth      	r8, r8
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012e4c:	c4104823 	lsli      	r3, r16, 0
 8012e50:	c4104821 	lsli      	r1, r16, 0
 8012e54:	6ca3      	mov      	r2, r8
 8012e56:	6c23      	mov      	r0, r8
		LCD_DrawPoint(x0+b,y0-a,color);             //0           
 8012e58:	c5440031 	addu      	r17, r4, r10
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012e5c:	e3fffd0c 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
		LCD_DrawPoint(x0+b,y0-a,color);             //0           
 8012e60:	c41155f1 	zext      	r17, r17, 15, 0
	LCD_WR_DATA(color);
 8012e64:	6c1b      	mov      	r0, r6
 8012e66:	e3fffcd9 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012e6a:	c4104823 	lsli      	r3, r16, 0
 8012e6e:	c4114822 	lsli      	r2, r17, 0
 8012e72:	c4104821 	lsli      	r1, r16, 0
 8012e76:	c4114820 	lsli      	r0, r17, 0
 8012e7a:	e3fffcfd 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
	LCD_WR_DATA(color);
 8012e7e:	6c1b      	mov      	r0, r6
 8012e80:	e3fffccc 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
		LCD_DrawPoint(x0-a,y0+b,color);             //1                
 8012e84:	c4aa0030 	addu      	r16, r10, r5
 8012e88:	c524002c 	addu      	r12, r4, r9
 8012e8c:	7731      	zexth      	r12, r12
 8012e8e:	c41055f0 	zext      	r16, r16, 15, 0
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012e92:	6cf3      	mov      	r3, r12
 8012e94:	6c73      	mov      	r1, r12
 8012e96:	c4104822 	lsli      	r2, r16, 0
 8012e9a:	c4104820 	lsli      	r0, r16, 0
		LCD_DrawPoint(x0-a,y0-b,color);             //2             
 8012e9e:	c4890084 	subu      	r4, r9, r4
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ea2:	dd8e2000 	st.w      	r12, (r14, 0x0)
		LCD_DrawPoint(x0-a,y0-b,color);             //2             
 8012ea6:	7511      	zexth      	r4, r4
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ea8:	e3fffce6 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
	LCD_WR_DATA(color);
 8012eac:	6c1b      	mov      	r0, r6
 8012eae:	e3fffcb5 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012eb2:	c4104822 	lsli      	r2, r16, 0
 8012eb6:	6cd3      	mov      	r3, r4
 8012eb8:	6c53      	mov      	r1, r4
 8012eba:	c4104820 	lsli      	r0, r16, 0
		LCD_DrawPoint(x0+b,y0+a,color);             //4               
 8012ebe:	c4a90090 	subu      	r16, r9, r5
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ec2:	e3fffcd9 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
		LCD_DrawPoint(x0+b,y0+a,color);             //4               
 8012ec6:	c41055f0 	zext      	r16, r16, 15, 0
	LCD_WR_DATA(color);
 8012eca:	6c1b      	mov      	r0, r6
 8012ecc:	e3fffca6 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ed0:	c4114822 	lsli      	r2, r17, 0
 8012ed4:	c4104823 	lsli      	r3, r16, 0
 8012ed8:	c4104821 	lsli      	r1, r16, 0
 8012edc:	c4114820 	lsli      	r0, r17, 0
		LCD_DrawPoint(x0+a,y0-b,color);             //5
 8012ee0:	c4aa0091 	subu      	r17, r10, r5
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ee4:	e3fffcc8 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
		LCD_DrawPoint(x0+a,y0-b,color);             //5
 8012ee8:	c41155f1 	zext      	r17, r17, 15, 0
	LCD_WR_DATA(color);
 8012eec:	6c1b      	mov      	r0, r6
 8012eee:	e3fffc95 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012ef2:	6cd3      	mov      	r3, r4
 8012ef4:	c4114822 	lsli      	r2, r17, 0
 8012ef8:	6c53      	mov      	r1, r4
 8012efa:	c4114820 	lsli      	r0, r17, 0
 8012efe:	e3fffcbb 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
	LCD_WR_DATA(color);
 8012f02:	6c1b      	mov      	r0, r6
 8012f04:	e3fffc8a 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012f08:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8012f0c:	6cf3      	mov      	r3, r12
 8012f0e:	6c73      	mov      	r1, r12
 8012f10:	c4114822 	lsli      	r2, r17, 0
 8012f14:	c4114820 	lsli      	r0, r17, 0
 8012f18:	e3fffcae 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
	LCD_WR_DATA(color);
 8012f1c:	6c1b      	mov      	r0, r6
 8012f1e:	e3fffc7d 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
	LCD_Address_Set(x,y,x,y);//设置光标位置 
 8012f22:	c4104823 	lsli      	r3, r16, 0
 8012f26:	6ca3      	mov      	r2, r8
 8012f28:	c4104821 	lsli      	r1, r16, 0
 8012f2c:	6c23      	mov      	r0, r8
 8012f2e:	e3fffca3 	bsr      	0x8012874	// 8012874 <LCD_Address_Set>
	LCD_WR_DATA(color);
 8012f32:	6c1b      	mov      	r0, r6
 8012f34:	e3fffc72 	bsr      	0x8012818	// 8012818 <LCD_WR_DATA>
		LCD_DrawPoint(x0+a,y0+b,color);             //6 
		LCD_DrawPoint(x0-b,y0+a,color);             //7
		a++;
 8012f38:	e56b0000 	addi      	r11, r11, 1
		if((a*a+b*b)>(r*r))//判断要画的点是否过远
 8012f3c:	c4e78423 	mult      	r3, r7, r7
 8012f40:	f96b8443 	mula.32.l      	r3, r11, r11
		{
			b--;
 8012f44:	9841      	ld.w      	r2, (r14, 0x4)
 8012f46:	64c9      	cmplt      	r2, r3
 8012f48:	c4e70d01 	dect      	r7, r7, 1
	while(a<=b)
 8012f4c:	66dd      	cmplt      	r7, r11
 8012f4e:	2d00      	subi      	r5, 1
 8012f50:	7555      	zexth      	r5, r5
 8012f52:	0f75      	bf      	0x8012e3c	// 8012e3c <Draw_Circle+0x18>
		}
	}
}
 8012f54:	1402      	addi      	r14, r14, 8
 8012f56:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

08012f5c <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8012f5c:	106a      	lrw      	r3, 0x20000000	// 8012f84 <SystemInit+0x28>
 8012f5e:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8012f62:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8012f66:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8012f6a:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8012f6e:	1047      	lrw      	r2, 0xe000e100	// 8012f88 <SystemInit+0x2c>
 8012f70:	3300      	movi      	r3, 0
 8012f72:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8012f76:	2b00      	subi      	r3, 1
 8012f78:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8012f7c:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8012f80:	783c      	jmp      	r15
 8012f82:	0000      	.short	0x0000
 8012f84:	20000000 	.long	0x20000000
 8012f88:	e000e100 	.long	0xe000e100

08012f8c <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8012f8c:	14d4      	push      	r4-r7, r15
 8012f8e:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8012f90:	c0006021 	mfcr      	r1, cr<0, 0>
 8012f94:	4930      	lsri      	r1, r1, 16
 8012f96:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8012f98:	1018      	lrw      	r0, 0x8014a5c	// 8012ff8 <trap_c+0x6c>
 8012f9a:	e0000c4d 	bsr      	0x8014834	// 8014834 <wm_printf>
    printf("\n");
 8012f9e:	300a      	movi      	r0, 10
 8012fa0:	e3fff4ac 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8012fa4:	9540      	ld.w      	r2, (r5, 0x0)
 8012fa6:	3100      	movi      	r1, 0
 8012fa8:	1015      	lrw      	r0, 0x8014a70	// 8012ffc <trap_c+0x70>
 8012faa:	e0000c45 	bsr      	0x8014834	// 8014834 <wm_printf>
    for (i = 0; i < 16; i++) {
 8012fae:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8012fb0:	10f3      	lrw      	r7, 0x8014a70	// 8012ffc <trap_c+0x70>

        if ((i % 5) == 4) {
 8012fb2:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8012fb4:	2400      	addi      	r4, 1
 8012fb6:	3c50      	cmpnei      	r4, 16
 8012fb8:	0c13      	bf      	0x8012fde	// 8012fde <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8012fba:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8012fbe:	6c53      	mov      	r1, r4
 8012fc0:	6c1f      	mov      	r0, r7
 8012fc2:	e0000c39 	bsr      	0x8014834	// 8014834 <wm_printf>
        if ((i % 5) == 4) {
 8012fc6:	c4c48043 	divs      	r3, r4, r6
 8012fca:	7cd8      	mult      	r3, r6
 8012fcc:	5c6d      	subu      	r3, r4, r3
 8012fce:	3b44      	cmpnei      	r3, 4
 8012fd0:	0bf2      	bt      	0x8012fb4	// 8012fb4 <trap_c+0x28>
            printf("\n");
 8012fd2:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8012fd4:	2400      	addi      	r4, 1
            printf("\n");
 8012fd6:	e3fff491 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8012fda:	3c50      	cmpnei      	r4, 16
 8012fdc:	0bef      	bt      	0x8012fba	// 8012fba <trap_c+0x2e>
        }
    }

    printf("\n");
 8012fde:	300a      	movi      	r0, 10
 8012fe0:	e3fff48c 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8012fe4:	9530      	ld.w      	r1, (r5, 0x40)
 8012fe6:	1007      	lrw      	r0, 0x8014a7c	// 8013000 <trap_c+0x74>
 8012fe8:	e0000c26 	bsr      	0x8014834	// 8014834 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8012fec:	9531      	ld.w      	r1, (r5, 0x44)
 8012fee:	1006      	lrw      	r0, 0x8014a88	// 8013004 <trap_c+0x78>
 8012ff0:	e0000c22 	bsr      	0x8014834	// 8014834 <wm_printf>
 8012ff4:	0400      	br      	0x8012ff4	// 8012ff4 <trap_c+0x68>
 8012ff6:	0000      	.short	0x0000
 8012ff8:	08014a5c 	.long	0x08014a5c
 8012ffc:	08014a70 	.long	0x08014a70
 8013000:	08014a7c 	.long	0x08014a7c
 8013004:	08014a88 	.long	0x08014a88

08013008 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013008:	106a      	lrw      	r3, 0xe000e100	// 8013030 <board_init+0x28>
 801300a:	ea210001 	movih      	r1, 1
 801300e:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013012:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8013016:	1068      	lrw      	r3, 0x40010600	// 8013034 <board_init+0x2c>
 8013018:	ea21000b 	movih      	r1, 11
 801301c:	2113      	addi      	r1, 20
 801301e:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013020:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8013022:	31c3      	movi      	r1, 195
 8013024:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8013026:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8013028:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 801302a:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 801302c:	783c      	jmp      	r15
 801302e:	0000      	.short	0x0000
 8013030:	e000e100 	.long	0xe000e100
 8013034:	40010600 	.long	0x40010600

08013038 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8013038:	1044      	lrw      	r2, 0x40010600	// 8013048 <_out_uart+0x10>
 801303a:	9267      	ld.w      	r3, (r2, 0x1c)
 801303c:	e463203f 	andi      	r3, r3, 63
 8013040:	3b1f      	cmphsi      	r3, 32
 8013042:	0bfc      	bt      	0x801303a	// 801303a <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8013044:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 8013046:	783c      	jmp      	r15
 8013048:	40010600 	.long	0x40010600

0801304c <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 801304c:	783c      	jmp      	r15
	...

08013050 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 8013050:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013054:	6e4f      	mov      	r9, r3
 8013056:	da0e200e 	ld.w      	r16, (r14, 0x38)
 801305a:	986b      	ld.w      	r3, (r14, 0x2c)
 801305c:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8013060:	e4702003 	andi      	r3, r16, 3
{
 8013064:	6dc3      	mov      	r7, r0
 8013066:	6e07      	mov      	r8, r1
 8013068:	6e8b      	mov      	r10, r2
 801306a:	98ac      	ld.w      	r5, (r14, 0x30)
 801306c:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8013070:	e9230010 	bnez      	r3, 0x8013090	// 8013090 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8013074:	66d4      	cmphs      	r5, r11
 8013076:	080d      	bt      	0x8013090	// 8013090 <_out_rev+0x40>
 8013078:	c4ab0086 	subu      	r6, r11, r5
 801307c:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 801307e:	5a82      	addi      	r4, r2, 1
 8013080:	6ce7      	mov      	r3, r9
 8013082:	6c63      	mov      	r1, r8
 8013084:	3020      	movi      	r0, 32
 8013086:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8013088:	6592      	cmpne      	r4, r6
 801308a:	6c93      	mov      	r2, r4
 801308c:	0bf9      	bt      	0x801307e	// 801307e <_out_rev+0x2e>
 801308e:	0402      	br      	0x8013092	// 8013092 <_out_rev+0x42>
 8013090:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 8013092:	e905002a 	bez      	r5, 0x80130e6	// 80130e6 <_out_rev+0x96>
 8013096:	5dc3      	subi      	r6, r5, 1
 8013098:	c4114823 	lsli      	r3, r17, 0
 801309c:	60d8      	addu      	r3, r6
 801309e:	6d8f      	mov      	r6, r3
 80130a0:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 80130a2:	e6240000 	addi      	r17, r4, 1
 80130a6:	6c93      	mov      	r2, r4
 80130a8:	8600      	ld.b      	r0, (r6, 0x0)
 80130aa:	6ce7      	mov      	r3, r9
 80130ac:	6c63      	mov      	r1, r8
 80130ae:	c4114824 	lsli      	r4, r17, 0
 80130b2:	7bdd      	jsr      	r7
  while (len) {
 80130b4:	6552      	cmpne      	r4, r5
 80130b6:	2e00      	subi      	r6, 1
 80130b8:	0bf5      	bt      	0x80130a2	// 80130a2 <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 80130ba:	e6102002 	andi      	r16, r16, 2
 80130be:	e9100011 	bez      	r16, 0x80130e0	// 80130e0 <_out_rev+0x90>
    while (idx - start_idx < width) {
 80130c2:	c5450083 	subu      	r3, r5, r10
 80130c6:	66cc      	cmphs      	r3, r11
 80130c8:	080c      	bt      	0x80130e0	// 80130e0 <_out_rev+0x90>
 80130ca:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 80130cc:	2500      	addi      	r5, 1
 80130ce:	6ce7      	mov      	r3, r9
 80130d0:	6c63      	mov      	r1, r8
 80130d2:	3020      	movi      	r0, 32
 80130d4:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 80130d6:	c5450083 	subu      	r3, r5, r10
 80130da:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 80130dc:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 80130de:	0ff7      	bf      	0x80130cc	// 80130cc <_out_rev+0x7c>
    }
  }

  return idx;
}
 80130e0:	6c17      	mov      	r0, r5
 80130e2:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 80130e6:	6d53      	mov      	r5, r4
 80130e8:	07e9      	br      	0x80130ba	// 80130ba <_out_rev+0x6a>
	...

080130ec <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 80130ec:	14d1      	push      	r4, r15
 80130ee:	1424      	subi      	r14, r14, 16
 80130f0:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 80130f4:	da8e200c 	ld.w      	r20, (r14, 0x30)
 80130f8:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 80130fc:	e5b42002 	andi      	r13, r20, 2
{
 8013100:	dace2006 	ld.w      	r22, (r14, 0x18)
 8013104:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013108:	da6e200a 	ld.w      	r19, (r14, 0x28)
 801310c:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8013110:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8013114:	e92d0039 	bnez      	r13, 0x8013186	// 8013186 <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013118:	e9320071 	bnez      	r18, 0x80131fa	// 80131fa <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801311c:	c66c0420 	cmphs      	r12, r19
 8013120:	0833      	bt      	0x8013186	// 8013186 <_ntoa_format+0x9a>
 8013122:	eb0c001f 	cmphsi      	r12, 32
 8013126:	e7142001 	andi      	r24, r20, 1
 801312a:	082e      	bt      	0x8013186	// 8013186 <_ntoa_format+0x9a>
 801312c:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013130:	ea150030 	movi      	r21, 48
 8013134:	0406      	br      	0x8013140	// 8013140 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013136:	eb4c0020 	cmpnei      	r12, 32
 801313a:	e5ad0000 	addi      	r13, r13, 1
 801313e:	0c08      	bf      	0x801314e	// 801314e <_ntoa_format+0x62>
      buf[len++] = '0';
 8013140:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013144:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 8013148:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801314c:	0ff5      	bf      	0x8013136	// 8013136 <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801314e:	e918001c 	bez      	r24, 0x8013186	// 8013186 <_ntoa_format+0x9a>
 8013152:	c64c0420 	cmphs      	r12, r18
 8013156:	0818      	bt      	0x8013186	// 8013186 <_ntoa_format+0x9a>
 8013158:	ea0d001f 	movi      	r13, 31
 801315c:	6734      	cmphs      	r13, r12
 801315e:	0c62      	bf      	0x8013222	// 8013222 <_ntoa_format+0x136>
 8013160:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013164:	ea150030 	movi      	r21, 48
 8013168:	0406      	br      	0x8013174	// 8013174 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801316a:	eb4c0020 	cmpnei      	r12, 32
 801316e:	e5ad0000 	addi      	r13, r13, 1
 8013172:	0c58      	bf      	0x8013222	// 8013222 <_ntoa_format+0x136>
      buf[len++] = '0';
 8013174:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013178:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 801317c:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013180:	0bf5      	bt      	0x801316a	// 801316a <_ntoa_format+0x7e>
      buf[len++] = '0';
 8013182:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8013186:	e5b42010 	andi      	r13, r20, 16
 801318a:	e90d0019 	bez      	r13, 0x80131bc	// 80131bc <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 801318e:	e5b42400 	andi      	r13, r20, 1024
 8013192:	e92d0004 	bnez      	r13, 0x801319a	// 801319a <_ntoa_format+0xae>
 8013196:	e92c004e 	bnez      	r12, 0x8013232	// 8013232 <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801319a:	c4194824 	lsli      	r4, r25, 0
 801319e:	3c50      	cmpnei      	r4, 16
 80131a0:	0c74      	bf      	0x8013288	// 8013288 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80131a2:	c4194824 	lsli      	r4, r25, 0
 80131a6:	3c42      	cmpnei      	r4, 2
 80131a8:	0c7e      	bf      	0x80132a4	// 80132a4 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 80131aa:	eb0c001f 	cmphsi      	r12, 32
 80131ae:	081a      	bt      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
      buf[len++] = '0';
 80131b0:	ea0d0030 	movi      	r13, 48
 80131b4:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80131b8:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 80131bc:	eb0c001f 	cmphsi      	r12, 32
 80131c0:	0811      	bt      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
    if (negative) {
 80131c2:	e9370048 	bnez      	r23, 0x8013252	// 8013252 <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 80131c6:	e5b42004 	andi      	r13, r20, 4
 80131ca:	e92d0056 	bnez      	r13, 0x8013276	// 8013276 <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 80131ce:	e5b42008 	andi      	r13, r20, 8
 80131d2:	e90d0008 	bez      	r13, 0x80131e2	// 80131e2 <_ntoa_format+0xf6>
      buf[len++] = ' ';
 80131d6:	ea0d0020 	movi      	r13, 32
 80131da:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80131de:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80131e2:	de8e2003 	st.w      	r20, (r14, 0xc)
 80131e6:	de4e2002 	st.w      	r18, (r14, 0x8)
 80131ea:	dd8e2001 	st.w      	r12, (r14, 0x4)
 80131ee:	dece2000 	st.w      	r22, (r14, 0x0)
 80131f2:	e3ffff2f 	bsr      	0x8013050	// 8013050 <_out_rev>
}
 80131f6:	1404      	addi      	r14, r14, 16
 80131f8:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80131fa:	e7142001 	andi      	r24, r20, 1
 80131fe:	e9180031 	bez      	r24, 0x8013260	// 8013260 <_ntoa_format+0x174>
 8013202:	e9370037 	bnez      	r23, 0x8013270	// 8013270 <_ntoa_format+0x184>
 8013206:	e5b4200c 	andi      	r13, r20, 12
 801320a:	e92d0033 	bnez      	r13, 0x8013270	// 8013270 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801320e:	c66c0420 	cmphs      	r12, r19
 8013212:	0ba0      	bt      	0x8013152	// 8013152 <_ntoa_format+0x66>
 8013214:	ea0d001f 	movi      	r13, 31
 8013218:	6734      	cmphs      	r13, r12
 801321a:	0b89      	bt      	0x801312c	// 801312c <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801321c:	c64c0420 	cmphs      	r12, r18
 8013220:	0bb3      	bt      	0x8013186	// 8013186 <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8013222:	e5b42010 	andi      	r13, r20, 16
 8013226:	e90dffde 	bez      	r13, 0x80131e2	// 80131e2 <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 801322a:	e5b42400 	andi      	r13, r20, 1024
 801322e:	e92dffb6 	bnez      	r13, 0x801319a	// 801319a <_ntoa_format+0xae>
 8013232:	c5930480 	cmpne      	r19, r12
 8013236:	0c04      	bf      	0x801323e	// 801323e <_ntoa_format+0x152>
 8013238:	c64c0480 	cmpne      	r12, r18
 801323c:	0baf      	bt      	0x801319a	// 801319a <_ntoa_format+0xae>
      len--;
 801323e:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 8013242:	e90d0046 	bez      	r13, 0x80132ce	// 80132ce <_ntoa_format+0x1e2>
 8013246:	c4194824 	lsli      	r4, r25, 0
 801324a:	3c50      	cmpnei      	r4, 16
 801324c:	0c1c      	bf      	0x8013284	// 8013284 <_ntoa_format+0x198>
 801324e:	6f37      	mov      	r12, r13
 8013250:	07a9      	br      	0x80131a2	// 80131a2 <_ntoa_format+0xb6>
      buf[len++] = '-';
 8013252:	ea0d002d 	movi      	r13, 45
 8013256:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801325a:	e58c0000 	addi      	r12, r12, 1
 801325e:	07c2      	br      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013260:	c66c0420 	cmphs      	r12, r19
 8013264:	0b91      	bt      	0x8013186	// 8013186 <_ntoa_format+0x9a>
 8013266:	ea0d001f 	movi      	r13, 31
 801326a:	6734      	cmphs      	r13, r12
 801326c:	0b60      	bt      	0x801312c	// 801312c <_ntoa_format+0x40>
 801326e:	078c      	br      	0x8013186	// 8013186 <_ntoa_format+0x9a>
      width--;
 8013270:	e6521000 	subi      	r18, r18, 1
 8013274:	07cd      	br      	0x801320e	// 801320e <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8013276:	ea0d002b 	movi      	r13, 43
 801327a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801327e:	e58c0000 	addi      	r12, r12, 1
 8013282:	07b0      	br      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
        len--;
 8013284:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013288:	e5b42020 	andi      	r13, r20, 32
 801328c:	e92d0016 	bnez      	r13, 0x80132b8	// 80132b8 <_ntoa_format+0x1cc>
 8013290:	eb0c001f 	cmphsi      	r12, 32
 8013294:	0ba7      	bt      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8013296:	ea0d0078 	movi      	r13, 120
 801329a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801329e:	e58c0000 	addi      	r12, r12, 1
 80132a2:	0784      	br      	0x80131aa	// 80131aa <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80132a4:	eb0c001f 	cmphsi      	r12, 32
 80132a8:	0b9d      	bt      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
      buf[len++] = 'b';
 80132aa:	ea0d0062 	movi      	r13, 98
 80132ae:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80132b2:	e58c0000 	addi      	r12, r12, 1
 80132b6:	077a      	br      	0x80131aa	// 80131aa <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80132b8:	ea0d001f 	movi      	r13, 31
 80132bc:	6734      	cmphs      	r13, r12
 80132be:	0f92      	bf      	0x80131e2	// 80131e2 <_ntoa_format+0xf6>
      buf[len++] = 'X';
 80132c0:	ea0d0058 	movi      	r13, 88
 80132c4:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80132c8:	e58c0000 	addi      	r12, r12, 1
 80132cc:	076f      	br      	0x80131aa	// 80131aa <_ntoa_format+0xbe>
 80132ce:	6f37      	mov      	r12, r13
 80132d0:	0765      	br      	0x801319a	// 801319a <_ntoa_format+0xae>
	...

080132d4 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 80132d4:	14d3      	push      	r4-r6, r15
 80132d6:	142f      	subi      	r14, r14, 60
 80132d8:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 80132dc:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 80132e0:	6d77      	mov      	r5, r13
 80132e2:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 80132e6:	da8e2015 	ld.w      	r20, (r14, 0x54)
 80132ea:	6db7      	mov      	r6, r13
 80132ec:	db0e2018 	ld.w      	r24, (r14, 0x60)
 80132f0:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 80132f4:	e92c000a 	bnez      	r12, 0x8013308	// 8013308 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 80132f8:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 80132fc:	e7182400 	andi      	r24, r24, 1024
 8013300:	e9380043 	bnez      	r24, 0x8013386	// 8013386 <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8013304:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013308:	e5b82020 	andi      	r13, r24, 32
 801330c:	eb4d0000 	cmpnei      	r13, 0
 8013310:	ea170041 	movi      	r23, 65
 8013314:	ea0d0061 	movi      	r13, 97
 8013318:	c6ed0c20 	incf      	r23, r13, 0
 801331c:	e72e001b 	addi      	r25, r14, 28
 8013320:	c4194832 	lsli      	r18, r25, 0
 8013324:	ea150000 	movi      	r21, 0
 8013328:	e6f71009 	subi      	r23, r23, 10
 801332c:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8013330:	c68c802d 	divu      	r13, r12, r20
 8013334:	c68d8436 	mult      	r22, r13, r20
 8013338:	c6cc008c 	subu      	r12, r12, r22
 801333c:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801333e:	eb0c0009 	cmphsi      	r12, 10
 8013342:	e6b50000 	addi      	r21, r21, 1
 8013346:	081c      	bt      	0x801337e	// 801337e <_ntoa_long+0xaa>
 8013348:	e58c002f 	addi      	r12, r12, 48
 801334c:	7730      	zextb      	r12, r12
 801334e:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 8013352:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013354:	e90d0006 	bez      	r13, 0x8013360	// 8013360 <_ntoa_long+0x8c>
 8013358:	e6520000 	addi      	r18, r18, 1
 801335c:	e833ffea 	bnezad      	r19, 0x8013330	// 8013330 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013360:	df0e2006 	st.w      	r24, (r14, 0x18)
 8013364:	b8c5      	st.w      	r6, (r14, 0x14)
 8013366:	b8a4      	st.w      	r5, (r14, 0x10)
 8013368:	de8e2003 	st.w      	r20, (r14, 0xc)
 801336c:	b882      	st.w      	r4, (r14, 0x8)
 801336e:	deae2001 	st.w      	r21, (r14, 0x4)
 8013372:	df2e2000 	st.w      	r25, (r14, 0x0)
 8013376:	e3fffebb 	bsr      	0x80130ec	// 80130ec <_ntoa_format>
}
 801337a:	140f      	addi      	r14, r14, 60
 801337c:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801337e:	c6ec002c 	addu      	r12, r12, r23
 8013382:	7730      	zextb      	r12, r12
 8013384:	07e5      	br      	0x801334e	// 801334e <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8013386:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 801338a:	c40c4835 	lsli      	r21, r12, 0
 801338e:	e72e001b 	addi      	r25, r14, 28
 8013392:	07e7      	br      	0x8013360	// 8013360 <_ntoa_long+0x8c>

08013394 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013394:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013398:	1435      	subi      	r14, r14, 84
 801339a:	c4034831 	lsli      	r17, r3, 0
 801339e:	d96e2020 	ld.w      	r11, (r14, 0x80)
 80133a2:	9965      	ld.w      	r3, (r14, 0x94)
 80133a4:	da0e2021 	ld.w      	r16, (r14, 0x84)
 80133a8:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 80133aa:	c60b2424 	or      	r4, r11, r16
{
 80133ae:	9966      	ld.w      	r3, (r14, 0x98)
 80133b0:	b86c      	st.w      	r3, (r14, 0x30)
 80133b2:	d86e0088 	ld.b      	r3, (r14, 0x88)
 80133b6:	b807      	st.w      	r0, (r14, 0x1c)
 80133b8:	b828      	st.w      	r1, (r14, 0x20)
 80133ba:	b849      	st.w      	r2, (r14, 0x24)
 80133bc:	99c3      	ld.w      	r6, (r14, 0x8c)
 80133be:	99e4      	ld.w      	r7, (r14, 0x90)
 80133c0:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 80133c4:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 80133c6:	e9240009 	bnez      	r4, 0x80133d8	// 80133d8 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 80133ca:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 80133ce:	c48a2823 	bclri      	r3, r10, 4
 80133d2:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 80133d4:	e9220033 	bnez      	r2, 0x801343a	// 801343a <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80133d8:	e46a2020 	andi      	r3, r10, 32
 80133dc:	3b40      	cmpnei      	r3, 0
 80133de:	ea080041 	movi      	r8, 65
 80133e2:	3361      	movi      	r3, 97
 80133e4:	c5030c20 	incf      	r8, r3, 0
 80133e8:	e52e0033 	addi      	r9, r14, 52
 80133ec:	6d67      	mov      	r5, r9
 80133ee:	3400      	movi      	r4, 0
 80133f0:	e5081009 	subi      	r8, r8, 10
 80133f4:	0415      	br      	0x801341e	// 801341e <_ntoa_long_long+0x8a>
 80133f6:	202f      	addi      	r0, 48
 80133f8:	7400      	zextb      	r0, r0
 80133fa:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 80133fc:	c4104821 	lsli      	r1, r16, 0
 8013400:	6c2f      	mov      	r0, r11
 8013402:	6c9b      	mov      	r2, r6
 8013404:	6cdf      	mov      	r3, r7
 8013406:	e3ffe957 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 801340a:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801340e:	6c40      	or      	r1, r0
      value /= base;
 8013410:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013412:	e9010016 	bez      	r1, 0x801343e	// 801343e <_ntoa_long_long+0xaa>
 8013416:	eb440020 	cmpnei      	r4, 32
 801341a:	2500      	addi      	r5, 1
 801341c:	0c11      	bf      	0x801343e	// 801343e <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 801341e:	6c9b      	mov      	r2, r6
 8013420:	6cdf      	mov      	r3, r7
 8013422:	6c2f      	mov      	r0, r11
 8013424:	c4104821 	lsli      	r1, r16, 0
 8013428:	e3ffeae0 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 801342c:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801342e:	3809      	cmphsi      	r0, 10
 8013430:	2400      	addi      	r4, 1
 8013432:	0fe2      	bf      	0x80133f6	// 80133f6 <_ntoa_long_long+0x62>
 8013434:	6020      	addu      	r0, r8
 8013436:	7400      	zextb      	r0, r0
 8013438:	07e1      	br      	0x80133fa	// 80133fa <_ntoa_long_long+0x66>
 801343a:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 801343e:	986c      	ld.w      	r3, (r14, 0x30)
 8013440:	b865      	st.w      	r3, (r14, 0x14)
 8013442:	986b      	ld.w      	r3, (r14, 0x2c)
 8013444:	b864      	st.w      	r3, (r14, 0x10)
 8013446:	986a      	ld.w      	r3, (r14, 0x28)
 8013448:	b862      	st.w      	r3, (r14, 0x8)
 801344a:	dd4e2006 	st.w      	r10, (r14, 0x18)
 801344e:	b8c3      	st.w      	r6, (r14, 0xc)
 8013450:	b881      	st.w      	r4, (r14, 0x4)
 8013452:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8013456:	c4114823 	lsli      	r3, r17, 0
 801345a:	9849      	ld.w      	r2, (r14, 0x24)
 801345c:	9828      	ld.w      	r1, (r14, 0x20)
 801345e:	9807      	ld.w      	r0, (r14, 0x1c)
 8013460:	e3fffe46 	bsr      	0x80130ec	// 80130ec <_ntoa_format>
}
 8013464:	1415      	addi      	r14, r14, 84
 8013466:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

0801346c <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 801346c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013470:	1435      	subi      	r14, r14, 84
 8013472:	6ecf      	mov      	r11, r3
 8013474:	9962      	ld.w      	r3, (r14, 0x88)
 8013476:	6e4f      	mov      	r9, r3
 8013478:	9963      	ld.w      	r3, (r14, 0x8c)
 801347a:	9980      	ld.w      	r4, (r14, 0x80)
 801347c:	99a1      	ld.w      	r5, (r14, 0x84)
 801347e:	b865      	st.w      	r3, (r14, 0x14)
 8013480:	9964      	ld.w      	r3, (r14, 0x90)
 8013482:	6d83      	mov      	r6, r0
 8013484:	6dc7      	mov      	r7, r1
 8013486:	6e8b      	mov      	r10, r2
 8013488:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 801348a:	6c93      	mov      	r2, r4
 801348c:	6cd7      	mov      	r3, r5
 801348e:	6c13      	mov      	r0, r4
 8013490:	6c57      	mov      	r1, r5
 8013492:	e3ffef61 	bsr      	0x8011354	// 8011354 <__nedf2>
 8013496:	e920010c 	bnez      	r0, 0x80136ae	// 80136ae <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 801349a:	3200      	movi      	r2, 0
 801349c:	ea23fff0 	movih      	r3, 65520
 80134a0:	2a00      	subi      	r2, 1
 80134a2:	2b00      	subi      	r3, 1
 80134a4:	6c13      	mov      	r0, r4
 80134a6:	9921      	ld.w      	r1, (r14, 0x84)
 80134a8:	e3ffefb2 	bsr      	0x801140c	// 801140c <__ltdf2>
 80134ac:	e980011b 	blz      	r0, 0x80136e2	// 80136e2 <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 80134b0:	3200      	movi      	r2, 0
 80134b2:	ea237ff0 	movih      	r3, 32752
 80134b6:	2a00      	subi      	r2, 1
 80134b8:	2b00      	subi      	r3, 1
 80134ba:	6c13      	mov      	r0, r4
 80134bc:	9921      	ld.w      	r1, (r14, 0x84)
 80134be:	e3ffef67 	bsr      	0x801138c	// 801138c <__gtdf2>
 80134c2:	e960001d 	blsz      	r0, 0x80134fc	// 80134fc <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 80134c6:	9806      	ld.w      	r0, (r14, 0x18)
 80134c8:	e4402004 	andi      	r2, r0, 4
 80134cc:	3a40      	cmpnei      	r2, 0
 80134ce:	0137      	lrw      	r1, 0x8014c7c	// 80137ec <_ftoa+0x380>
 80134d0:	0177      	lrw      	r3, 0x8014c74	// 80137f0 <_ftoa+0x384>
 80134d2:	c4610c20 	incf      	r3, r1, 0
 80134d6:	3a40      	cmpnei      	r2, 0
 80134d8:	3103      	movi      	r1, 3
 80134da:	3204      	movi      	r2, 4
 80134dc:	c4410c20 	incf      	r2, r1, 0
 80134e0:	9825      	ld.w      	r1, (r14, 0x14)
 80134e2:	b803      	st.w      	r0, (r14, 0xc)
 80134e4:	b822      	st.w      	r1, (r14, 0x8)
 80134e6:	b841      	st.w      	r2, (r14, 0x4)
 80134e8:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80134ea:	6cef      	mov      	r3, r11
 80134ec:	6cab      	mov      	r2, r10
 80134ee:	6c5f      	mov      	r1, r7
 80134f0:	6c1b      	mov      	r0, r6
 80134f2:	e3fffdaf 	bsr      	0x8013050	// 8013050 <_out_rev>
}
 80134f6:	1415      	addi      	r14, r14, 84
 80134f8:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 80134fc:	3200      	movi      	r2, 0
 80134fe:	0261      	lrw      	r3, 0x41cdcd65	// 80137f4 <_ftoa+0x388>
 8013500:	6c13      	mov      	r0, r4
 8013502:	9921      	ld.w      	r1, (r14, 0x84)
 8013504:	e3ffef44 	bsr      	0x801138c	// 801138c <__gtdf2>
 8013508:	e94000dc 	bhz      	r0, 0x80136c0	// 80136c0 <_ftoa+0x254>
 801350c:	3200      	movi      	r2, 0
 801350e:	0264      	lrw      	r3, 0xc1cdcd65	// 80137f8 <_ftoa+0x38c>
 8013510:	6c13      	mov      	r0, r4
 8013512:	9921      	ld.w      	r1, (r14, 0x84)
 8013514:	e3ffef7c 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013518:	e98000d4 	blz      	r0, 0x80136c0	// 80136c0 <_ftoa+0x254>
  if (value < 0) {
 801351c:	3200      	movi      	r2, 0
 801351e:	6ccb      	mov      	r3, r2
 8013520:	6c13      	mov      	r0, r4
 8013522:	9921      	ld.w      	r1, (r14, 0x84)
 8013524:	e3ffef74 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013528:	e98001b0 	blz      	r0, 0x8013888	// 8013888 <_ftoa+0x41c>
  bool negative = false;
 801352c:	3300      	movi      	r3, 0
 801352e:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8013530:	9866      	ld.w      	r3, (r14, 0x18)
 8013532:	e5a32400 	andi      	r13, r3, 1024
 8013536:	e92d0136 	bnez      	r13, 0x80137a2	// 80137a2 <_ftoa+0x336>
 801353a:	026e      	lrw      	r3, 0x412e8480	// 80137fc <_ftoa+0x390>
 801353c:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8013540:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013542:	ea080006 	movi      	r8, 6
 8013546:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 801354a:	6c57      	mov      	r1, r5
 801354c:	6c13      	mov      	r0, r4
 801354e:	de8e200b 	st.w      	r20, (r14, 0x2c)
 8013552:	ddae200a 	st.w      	r13, (r14, 0x28)
 8013556:	e3ffefab 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 801355a:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 801355c:	e3ffef74 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013560:	6c83      	mov      	r2, r0
 8013562:	6cc7      	mov      	r3, r1
 8013564:	6c13      	mov      	r0, r4
 8013566:	6c57      	mov      	r1, r5
 8013568:	e3ffed4c 	bsr      	0x8011000	// 8011000 <__subdf3>
 801356c:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013570:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013574:	6cb3      	mov      	r2, r12
 8013576:	9868      	ld.w      	r3, (r14, 0x20)
 8013578:	e3ffed62 	bsr      	0x801103c	// 801103c <__muldf3>
 801357c:	c4014831 	lsli      	r17, r1, 0
 8013580:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 8013584:	e3ffe87c 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 8013588:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 801358a:	e3ffefc9 	bsr      	0x801151c	// 801151c <__floatunsidf>
 801358e:	6c83      	mov      	r2, r0
 8013590:	6cc7      	mov      	r3, r1
 8013592:	c4104820 	lsli      	r0, r16, 0
 8013596:	c4114821 	lsli      	r1, r17, 0
 801359a:	e3ffed33 	bsr      	0x8011000	// 8011000 <__subdf3>
  if (diff > 0.5) {
 801359e:	3200      	movi      	r2, 0
 80135a0:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 80135a4:	c4004830 	lsli      	r16, r0, 0
 80135a8:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 80135ac:	e3ffeef0 	bsr      	0x801138c	// 801138c <__gtdf2>
 80135b0:	da4e2009 	ld.w      	r18, (r14, 0x24)
 80135b4:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 80135b8:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 80135bc:	e96000d3 	blsz      	r0, 0x8013762	// 8013762 <_ftoa+0x2f6>
    ++frac;
 80135c0:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 80135c4:	c4124820 	lsli      	r0, r18, 0
 80135c8:	de8e2009 	st.w      	r20, (r14, 0x24)
 80135cc:	c40d4831 	lsli      	r17, r13, 0
 80135d0:	c4124830 	lsli      	r16, r18, 0
 80135d4:	e3ffefa4 	bsr      	0x801151c	// 801151c <__floatunsidf>
 80135d8:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80135dc:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80135e0:	6cf7      	mov      	r3, r13
 80135e2:	6cb3      	mov      	r2, r12
 80135e4:	e3ffeef4 	bsr      	0x80113cc	// 80113cc <__gedf2>
 80135e8:	c4104832 	lsli      	r18, r16, 0
 80135ec:	c411482d 	lsli      	r13, r17, 0
 80135f0:	da8e2009 	ld.w      	r20, (r14, 0x24)
 80135f4:	e9a0011f 	bhsz      	r0, 0x8013832	// 8013832 <_ftoa+0x3c6>
  if (prec == 0U) {
 80135f8:	e928007e 	bnez      	r8, 0x80136f4	// 80136f4 <_ftoa+0x288>
    diff = value - (double)whole;
 80135fc:	6c27      	mov      	r0, r9
 80135fe:	c4144831 	lsli      	r17, r20, 0
 8013602:	c40d4830 	lsli      	r16, r13, 0
 8013606:	e3ffef1f 	bsr      	0x8011444	// 8011444 <__floatsidf>
 801360a:	6c83      	mov      	r2, r0
 801360c:	6cc7      	mov      	r3, r1
 801360e:	6c13      	mov      	r0, r4
 8013610:	6c57      	mov      	r1, r5
 8013612:	e3ffecf7 	bsr      	0x8011000	// 8011000 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013616:	6ca3      	mov      	r2, r8
 8013618:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 801361c:	6d03      	mov      	r4, r0
 801361e:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013620:	e3ffeef6 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013624:	c410482d 	lsli      	r13, r16, 0
 8013628:	c4114834 	lsli      	r20, r17, 0
 801362c:	e98000f5 	blz      	r0, 0x8013816	// 8013816 <_ftoa+0x3aa>
 8013630:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8013634:	3b40      	cmpnei      	r3, 0
 8013636:	c4690c20 	incf      	r3, r9, 0
 801363a:	c4690c41 	inct      	r3, r9, 1
 801363e:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013640:	eb4d0020 	cmpnei      	r13, 32
 8013644:	0c81      	bf      	0x8013746	// 8013746 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8013646:	300a      	movi      	r0, 10
 8013648:	c4098043 	divs      	r3, r9, r0
 801364c:	6d27      	mov      	r4, r9
 801364e:	c4038421 	mult      	r1, r3, r0
 8013652:	5c25      	subu      	r1, r4, r1
 8013654:	212f      	addi      	r1, 48
 8013656:	e44d0000 	addi      	r2, r13, 1
 801365a:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 801365e:	e9030013 	bez      	r3, 0x8013684	// 8013684 <_ftoa+0x218>
 8013662:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013666:	eb420020 	cmpnei      	r2, 32
 801366a:	0c6e      	bf      	0x8013746	// 8013746 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 801366c:	c4038041 	divs      	r1, r3, r0
 8013670:	c401842d 	mult      	r13, r1, r0
 8013674:	60f6      	subu      	r3, r13
 8013676:	232f      	addi      	r3, 48
 8013678:	d40c8003 	stbi.b      	r3, (r12)
 801367c:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 801367e:	6cc7      	mov      	r3, r1
 8013680:	e921fff3 	bnez      	r1, 0x8013666	// 8013666 <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8013684:	9866      	ld.w      	r3, (r14, 0x18)
 8013686:	e4632003 	andi      	r3, r3, 3
 801368a:	3b41      	cmpnei      	r3, 1
 801368c:	0cda      	bf      	0x8013840	// 8013840 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 801368e:	eb420020 	cmpnei      	r2, 32
 8013692:	0d27      	bf      	0x80138e0	// 80138e0 <_ftoa+0x474>
    if (negative) {
 8013694:	986c      	ld.w      	r3, (r14, 0x30)
 8013696:	e92300bb 	bnez      	r3, 0x801380c	// 801380c <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 801369a:	9866      	ld.w      	r3, (r14, 0x18)
 801369c:	e4632004 	andi      	r3, r3, 4
 80136a0:	e9030116 	bez      	r3, 0x80138cc	// 80138cc <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80136a4:	312b      	movi      	r1, 43
 80136a6:	5a62      	addi      	r3, r2, 1
 80136a8:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80136ac:	0453      	br      	0x8013752	// 8013752 <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 80136ae:	9866      	ld.w      	r3, (r14, 0x18)
 80136b0:	b863      	st.w      	r3, (r14, 0xc)
 80136b2:	9865      	ld.w      	r3, (r14, 0x14)
 80136b4:	b862      	st.w      	r3, (r14, 0x8)
 80136b6:	3303      	movi      	r3, 3
 80136b8:	b861      	st.w      	r3, (r14, 0x4)
 80136ba:	1272      	lrw      	r3, 0x8014c80	// 8013800 <_ftoa+0x394>
 80136bc:	b860      	st.w      	r3, (r14, 0x0)
 80136be:	0716      	br      	0x80134ea	// 80134ea <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 80136c0:	9866      	ld.w      	r3, (r14, 0x18)
 80136c2:	b864      	st.w      	r3, (r14, 0x10)
 80136c4:	9865      	ld.w      	r3, (r14, 0x14)
 80136c6:	b863      	st.w      	r3, (r14, 0xc)
 80136c8:	dd2e2002 	st.w      	r9, (r14, 0x8)
 80136cc:	b880      	st.w      	r4, (r14, 0x0)
 80136ce:	b8a1      	st.w      	r5, (r14, 0x4)
 80136d0:	6cef      	mov      	r3, r11
 80136d2:	6cab      	mov      	r2, r10
 80136d4:	6c5f      	mov      	r1, r7
 80136d6:	6c1b      	mov      	r0, r6
 80136d8:	e0000116 	bsr      	0x8013904	// 8013904 <_etoa>
}
 80136dc:	1415      	addi      	r14, r14, 84
 80136de:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 80136e2:	9866      	ld.w      	r3, (r14, 0x18)
 80136e4:	b863      	st.w      	r3, (r14, 0xc)
 80136e6:	9865      	ld.w      	r3, (r14, 0x14)
 80136e8:	b862      	st.w      	r3, (r14, 0x8)
 80136ea:	3304      	movi      	r3, 4
 80136ec:	b861      	st.w      	r3, (r14, 0x4)
 80136ee:	1266      	lrw      	r3, 0x8014c84	// 8013804 <_ftoa+0x398>
 80136f0:	b860      	st.w      	r3, (r14, 0x0)
 80136f2:	06fc      	br      	0x80134ea	// 80134ea <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80136f4:	eb4d0020 	cmpnei      	r13, 32
 80136f8:	0c27      	bf      	0x8013746	// 8013746 <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 80136fa:	300a      	movi      	r0, 10
 80136fc:	c4128023 	divu      	r3, r18, r0
 8013700:	c4038421 	mult      	r1, r3, r0
 8013704:	c4320092 	subu      	r18, r18, r1
 8013708:	e652002f 	addi      	r18, r18, 48
      --count;
 801370c:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8013710:	e44d0000 	addi      	r2, r13, 1
 8013714:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 8013718:	e90300c3 	bez      	r3, 0x801389e	// 801389e <_ftoa+0x432>
 801371c:	c454002d 	addu      	r13, r20, r2
 8013720:	0410      	br      	0x8013740	// 8013740 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 8013722:	c4038021 	divu      	r1, r3, r0
 8013726:	c4018432 	mult      	r18, r1, r0
 801372a:	c6430083 	subu      	r3, r3, r18
 801372e:	232f      	addi      	r3, 48
 8013730:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 8013734:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8013738:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 801373a:	6cc7      	mov      	r3, r1
 801373c:	e90100b1 	bez      	r1, 0x801389e	// 801389e <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013740:	eb420020 	cmpnei      	r2, 32
 8013744:	0bef      	bt      	0x8013722	// 8013722 <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8013746:	9866      	ld.w      	r3, (r14, 0x18)
 8013748:	e4632003 	andi      	r3, r3, 3
 801374c:	3b41      	cmpnei      	r3, 1
 801374e:	0c78      	bf      	0x801383e	// 801383e <_ftoa+0x3d2>
 8013750:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013752:	9846      	ld.w      	r2, (r14, 0x18)
 8013754:	b843      	st.w      	r2, (r14, 0xc)
 8013756:	9845      	ld.w      	r2, (r14, 0x14)
 8013758:	b842      	st.w      	r2, (r14, 0x8)
 801375a:	b861      	st.w      	r3, (r14, 0x4)
 801375c:	de8e2000 	st.w      	r20, (r14, 0x0)
 8013760:	06c5      	br      	0x80134ea	// 80134ea <_ftoa+0x7e>
  else if (diff < 0.5) {
 8013762:	3200      	movi      	r2, 0
 8013764:	ea233fe0 	movih      	r3, 16352
 8013768:	c4104820 	lsli      	r0, r16, 0
 801376c:	c4114821 	lsli      	r1, r17, 0
 8013770:	de8e200a 	st.w      	r20, (r14, 0x28)
 8013774:	de4e2009 	st.w      	r18, (r14, 0x24)
 8013778:	ddae2007 	st.w      	r13, (r14, 0x1c)
 801377c:	e3ffee48 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013780:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8013784:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8013788:	da8e200a 	ld.w      	r20, (r14, 0x28)
 801378c:	e980ff36 	blz      	r0, 0x80135f8	// 80135f8 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 8013790:	e9120006 	bez      	r18, 0x801379c	// 801379c <_ftoa+0x330>
 8013794:	e4722001 	andi      	r3, r18, 1
 8013798:	e903ff30 	bez      	r3, 0x80135f8	// 80135f8 <_ftoa+0x18c>
    ++frac;
 801379c:	e6520000 	addi      	r18, r18, 1
 80137a0:	072c      	br      	0x80135f8	// 80135f8 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80137a2:	6ce7      	mov      	r3, r9
 80137a4:	3b09      	cmphsi      	r3, 10
 80137a6:	0c9f      	bf      	0x80138e4	// 80138e4 <_ftoa+0x478>
    buf[len++] = '0';
 80137a8:	e68e0033 	addi      	r20, r14, 52
 80137ac:	3030      	movi      	r0, 48
 80137ae:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 80137b2:	e5091000 	subi      	r8, r9, 1
 80137b6:	e44e0034 	addi      	r2, r14, 53
 80137ba:	e4291008 	subi      	r1, r9, 9
 80137be:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 80137c2:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80137c4:	6476      	cmpne      	r13, r1
 80137c6:	0c09      	bf      	0x80137d8	// 80137d8 <_ftoa+0x36c>
    buf[len++] = '0';
 80137c8:	e5ad0000 	addi      	r13, r13, 1
 80137cc:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 80137d0:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80137d4:	e823fff8 	bnezad      	r3, 0x80137c4	// 80137c4 <_ftoa+0x358>
 80137d8:	104c      	lrw      	r2, 0x8014c8c	// 8013808 <_ftoa+0x39c>
 80137da:	c4684823 	lsli      	r3, r8, 3
 80137de:	60c8      	addu      	r3, r2
 80137e0:	9340      	ld.w      	r2, (r3, 0x0)
 80137e2:	9361      	ld.w      	r3, (r3, 0x4)
 80137e4:	b847      	st.w      	r2, (r14, 0x1c)
 80137e6:	b868      	st.w      	r3, (r14, 0x20)
 80137e8:	06b1      	br      	0x801354a	// 801354a <_ftoa+0xde>
 80137ea:	0000      	.short	0x0000
 80137ec:	08014c7c 	.long	0x08014c7c
 80137f0:	08014c74 	.long	0x08014c74
 80137f4:	41cdcd65 	.long	0x41cdcd65
 80137f8:	c1cdcd65 	.long	0xc1cdcd65
 80137fc:	412e8480 	.long	0x412e8480
 8013800:	08014c80 	.long	0x08014c80
 8013804:	08014c84 	.long	0x08014c84
 8013808:	08014c8c 	.long	0x08014c8c
      buf[len++] = '-';
 801380c:	312d      	movi      	r1, 45
 801380e:	5a62      	addi      	r3, r2, 1
 8013810:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8013814:	079f      	br      	0x8013752	// 8013752 <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013816:	6ca3      	mov      	r2, r8
 8013818:	ea233fe0 	movih      	r3, 16352
 801381c:	6c13      	mov      	r0, r4
 801381e:	6c57      	mov      	r1, r5
 8013820:	e3ffedb6 	bsr      	0x801138c	// 801138c <__gtdf2>
 8013824:	c410482d 	lsli      	r13, r16, 0
 8013828:	c4114834 	lsli      	r20, r17, 0
 801382c:	e960ff0a 	blsz      	r0, 0x8013640	// 8013640 <_ftoa+0x1d4>
 8013830:	0700      	br      	0x8013630	// 8013630 <_ftoa+0x1c4>
      ++whole;
 8013832:	6ce7      	mov      	r3, r9
 8013834:	2300      	addi      	r3, 1
 8013836:	6e4f      	mov      	r9, r3
      frac = 0;
 8013838:	ea120000 	movi      	r18, 0
 801383c:	06de      	br      	0x80135f8	// 80135f8 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801383e:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013840:	9865      	ld.w      	r3, (r14, 0x14)
 8013842:	e903ff26 	bez      	r3, 0x801368e	// 801368e <_ftoa+0x222>
 8013846:	986c      	ld.w      	r3, (r14, 0x30)
 8013848:	e9230007 	bnez      	r3, 0x8013856	// 8013856 <_ftoa+0x3ea>
 801384c:	9866      	ld.w      	r3, (r14, 0x18)
 801384e:	e463200c 	andi      	r3, r3, 12
 8013852:	e9030005 	bez      	r3, 0x801385c	// 801385c <_ftoa+0x3f0>
      width--;
 8013856:	9865      	ld.w      	r3, (r14, 0x14)
 8013858:	2b00      	subi      	r3, 1
 801385a:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801385c:	9865      	ld.w      	r3, (r14, 0x14)
 801385e:	64c8      	cmphs      	r2, r3
 8013860:	0b17      	bt      	0x801368e	// 801368e <_ftoa+0x222>
 8013862:	eb420020 	cmpnei      	r2, 32
 8013866:	0c3d      	bf      	0x80138e0	// 80138e0 <_ftoa+0x474>
 8013868:	c4540021 	addu      	r1, r20, r2
 801386c:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 801386e:	3230      	movi      	r2, 48
 8013870:	0405      	br      	0x801387a	// 801387a <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8013872:	eb430020 	cmpnei      	r3, 32
 8013876:	2100      	addi      	r1, 1
 8013878:	0f6d      	bf      	0x8013752	// 8013752 <_ftoa+0x2e6>
      buf[len++] = '0';
 801387a:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801387c:	9805      	ld.w      	r0, (r14, 0x14)
 801387e:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8013880:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8013882:	0bf8      	bt      	0x8013872	// 8013872 <_ftoa+0x406>
      buf[len++] = '0';
 8013884:	9845      	ld.w      	r2, (r14, 0x14)
 8013886:	0704      	br      	0x801368e	// 801368e <_ftoa+0x222>
    value = 0 - value;
 8013888:	6c93      	mov      	r2, r4
 801388a:	9961      	ld.w      	r3, (r14, 0x84)
 801388c:	3000      	movi      	r0, 0
 801388e:	3100      	movi      	r1, 0
 8013890:	e3ffebb8 	bsr      	0x8011000	// 8011000 <__subdf3>
    negative = true;
 8013894:	3301      	movi      	r3, 1
    value = 0 - value;
 8013896:	6d03      	mov      	r4, r0
 8013898:	6d47      	mov      	r5, r1
    negative = true;
 801389a:	b86c      	st.w      	r3, (r14, 0x30)
 801389c:	064a      	br      	0x8013530	// 8013530 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801389e:	eb420020 	cmpnei      	r2, 32
 80138a2:	0f52      	bf      	0x8013746	// 8013746 <_ftoa+0x2da>
 80138a4:	e90c000e 	bez      	r12, 0x80138c0	// 80138c0 <_ftoa+0x454>
 80138a8:	c4540023 	addu      	r3, r20, r2
 80138ac:	6308      	addu      	r12, r2
      buf[len++] = '0';
 80138ae:	3130      	movi      	r1, 48
 80138b0:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 80138b2:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 80138b6:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 80138b8:	0f47      	bf      	0x8013746	// 8013746 <_ftoa+0x2da>
 80138ba:	670a      	cmpne      	r2, r12
 80138bc:	2300      	addi      	r3, 1
 80138be:	0bf9      	bt      	0x80138b0	// 80138b0 <_ftoa+0x444>
      buf[len++] = '.';
 80138c0:	332e      	movi      	r3, 46
 80138c2:	e5a20000 	addi      	r13, r2, 1
 80138c6:	d4540023 	str.b      	r3, (r20, r2 << 0)
 80138ca:	06bb      	br      	0x8013640	// 8013640 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 80138cc:	9866      	ld.w      	r3, (r14, 0x18)
 80138ce:	e4632008 	andi      	r3, r3, 8
 80138d2:	e9030007 	bez      	r3, 0x80138e0	// 80138e0 <_ftoa+0x474>
      buf[len++] = ' ';
 80138d6:	3120      	movi      	r1, 32
 80138d8:	5a62      	addi      	r3, r2, 1
 80138da:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80138de:	073a      	br      	0x8013752	// 8013752 <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 80138e0:	6ccb      	mov      	r3, r2
 80138e2:	0738      	br      	0x8013752	// 8013752 <_ftoa+0x2e6>
 80138e4:	1047      	lrw      	r2, 0x8014c8c	// 8013900 <_ftoa+0x494>
 80138e6:	4363      	lsli      	r3, r3, 3
 80138e8:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80138ea:	6e27      	mov      	r8, r9
 80138ec:	9340      	ld.w      	r2, (r3, 0x0)
 80138ee:	9361      	ld.w      	r3, (r3, 0x4)
 80138f0:	b847      	st.w      	r2, (r14, 0x1c)
 80138f2:	b868      	st.w      	r3, (r14, 0x20)
 80138f4:	ea0d0000 	movi      	r13, 0
 80138f8:	e68e0033 	addi      	r20, r14, 52
 80138fc:	0627      	br      	0x801354a	// 801354a <_ftoa+0xde>
 80138fe:	0000      	.short	0x0000
 8013900:	08014c8c 	.long	0x08014c8c

08013904 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013904:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013908:	1434      	subi      	r14, r14, 80
 801390a:	6e0f      	mov      	r8, r3
 801390c:	9961      	ld.w      	r3, (r14, 0x84)
 801390e:	b867      	st.w      	r3, (r14, 0x1c)
 8013910:	9962      	ld.w      	r3, (r14, 0x88)
 8013912:	98bf      	ld.w      	r5, (r14, 0x7c)
 8013914:	9980      	ld.w      	r4, (r14, 0x80)
 8013916:	b868      	st.w      	r3, (r14, 0x20)
 8013918:	9963      	ld.w      	r3, (r14, 0x8c)
 801391a:	b866      	st.w      	r3, (r14, 0x18)
 801391c:	6d83      	mov      	r6, r0
 801391e:	6dc7      	mov      	r7, r1
 8013920:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8013922:	6cd3      	mov      	r3, r4
 8013924:	6c97      	mov      	r2, r5
 8013926:	6c17      	mov      	r0, r5
 8013928:	6c53      	mov      	r1, r4
 801392a:	e3ffed15 	bsr      	0x8011354	// 8011354 <__nedf2>
 801392e:	6e43      	mov      	r9, r0
 8013930:	e92001d7 	bnez      	r0, 0x8013cde	// 8013cde <_etoa+0x3da>
 8013934:	3200      	movi      	r2, 0
 8013936:	ea237ff0 	movih      	r3, 32752
 801393a:	2a00      	subi      	r2, 1
 801393c:	2b00      	subi      	r3, 1
 801393e:	6c17      	mov      	r0, r5
 8013940:	6c53      	mov      	r1, r4
 8013942:	e3ffed25 	bsr      	0x801138c	// 801138c <__gtdf2>
 8013946:	e94001cc 	bhz      	r0, 0x8013cde	// 8013cde <_etoa+0x3da>
 801394a:	3200      	movi      	r2, 0
 801394c:	ea23fff0 	movih      	r3, 65520
 8013950:	2a00      	subi      	r2, 1
 8013952:	2b00      	subi      	r3, 1
 8013954:	6c17      	mov      	r0, r5
 8013956:	6c53      	mov      	r1, r4
 8013958:	e3ffed5a 	bsr      	0x801140c	// 801140c <__ltdf2>
 801395c:	e98001c1 	blz      	r0, 0x8013cde	// 8013cde <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 8013960:	6ca7      	mov      	r2, r9
 8013962:	6ce7      	mov      	r3, r9
 8013964:	6c17      	mov      	r0, r5
 8013966:	6c53      	mov      	r1, r4
 8013968:	e3ffed52 	bsr      	0x801140c	// 801140c <__ltdf2>
    value = -value;
 801396c:	6e97      	mov      	r10, r5
  if (negative) {
 801396e:	e9800208 	blz      	r0, 0x8013d7e	// 8013d7e <_etoa+0x47a>
 8013972:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 8013974:	9866      	ld.w      	r3, (r14, 0x18)
 8013976:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801397a:	3b40      	cmpnei      	r3, 0
 801397c:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 801397e:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8013980:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013984:	3306      	movi      	r3, 6
 8013986:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801398a:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801398e:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8013990:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8013994:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8013998:	e3ffed56 	bsr      	0x8011444	// 8011444 <__floatsidf>
 801399c:	0145      	lrw      	r2, 0x509f79fb	// 8013d04 <_etoa+0x400>
 801399e:	0164      	lrw      	r3, 0x3fd34413	// 8013d08 <_etoa+0x404>
 80139a0:	e3ffeb4e 	bsr      	0x801103c	// 801103c <__muldf3>
 80139a4:	0145      	lrw      	r2, 0x8b60c8b3	// 8013d0c <_etoa+0x408>
 80139a6:	0164      	lrw      	r3, 0x3fc68a28	// 8013d10 <_etoa+0x40c>
 80139a8:	e3ffeb14 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80139ac:	d98e200a 	ld.w      	r12, (r14, 0x28)
 80139b0:	da6e2009 	ld.w      	r19, (r14, 0x24)
 80139b4:	c40c4836 	lsli      	r22, r12, 0
 80139b8:	c4135677 	zext      	r23, r19, 19, 0
 80139bc:	ea140000 	movi      	r20, 0
 80139c0:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80139c4:	c4004831 	lsli      	r17, r0, 0
 80139c8:	c4014830 	lsli      	r16, r1, 0
 80139cc:	3200      	movi      	r2, 0
 80139ce:	c6962420 	or      	r0, r22, r20
 80139d2:	c6b72421 	or      	r1, r23, r21
 80139d6:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80139da:	dd8e2012 	st.w      	r12, (r14, 0x48)
 80139de:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80139e2:	de8e200f 	st.w      	r20, (r14, 0x3c)
 80139e6:	deae2010 	st.w      	r21, (r14, 0x40)
 80139ea:	e3ffeb0b 	bsr      	0x8011000	// 8011000 <__subdf3>
 80139ee:	0155      	lrw      	r2, 0x636f4361	// 8013d14 <_etoa+0x410>
 80139f0:	0175      	lrw      	r3, 0x3fd287a7	// 8013d18 <_etoa+0x414>
 80139f2:	e3ffeb25 	bsr      	0x801103c	// 801103c <__muldf3>
 80139f6:	6c83      	mov      	r2, r0
 80139f8:	6cc7      	mov      	r3, r1
 80139fa:	c4114820 	lsli      	r0, r17, 0
 80139fe:	c4104821 	lsli      	r1, r16, 0
 8013a02:	e3ffeae7 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a06:	e3ffed53 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8013a0a:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8013a0c:	e3ffed1c 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013a10:	015c      	lrw      	r2, 0x979a371	// 8013d1c <_etoa+0x418>
 8013a12:	017b      	lrw      	r3, 0x400a934f	// 8013d20 <_etoa+0x41c>
 8013a14:	c4004831 	lsli      	r17, r0, 0
 8013a18:	c4014830 	lsli      	r16, r1, 0
 8013a1c:	e3ffeb10 	bsr      	0x801103c	// 801103c <__muldf3>
 8013a20:	3200      	movi      	r2, 0
 8013a22:	ea233fe0 	movih      	r3, 16352
 8013a26:	e3ffead5 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a2a:	e3ffed41 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8013a2e:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8013a30:	0242      	lrw      	r2, 0xbbb55516	// 8013d24 <_etoa+0x420>
 8013a32:	0261      	lrw      	r3, 0x40026bb1	// 8013d28 <_etoa+0x424>
 8013a34:	c4114820 	lsli      	r0, r17, 0
 8013a38:	c4104821 	lsli      	r1, r16, 0
 8013a3c:	e3ffeb00 	bsr      	0x801103c	// 801103c <__muldf3>
 8013a40:	c4004831 	lsli      	r17, r0, 0
 8013a44:	980a      	ld.w      	r0, (r14, 0x28)
 8013a46:	c4014830 	lsli      	r16, r1, 0
 8013a4a:	e3ffecfd 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013a4e:	0247      	lrw      	r2, 0xfefa39ef	// 8013d2c <_etoa+0x428>
 8013a50:	0267      	lrw      	r3, 0x3fe62e42	// 8013d30 <_etoa+0x42c>
 8013a52:	e3ffeaf5 	bsr      	0x801103c	// 801103c <__muldf3>
 8013a56:	6c83      	mov      	r2, r0
 8013a58:	6cc7      	mov      	r3, r1
 8013a5a:	c4114820 	lsli      	r0, r17, 0
 8013a5e:	c4104821 	lsli      	r1, r16, 0
 8013a62:	e3ffeacf 	bsr      	0x8011000	// 8011000 <__subdf3>
  const double z2 = z * z;
 8013a66:	6c83      	mov      	r2, r0
 8013a68:	6cc7      	mov      	r3, r1
 8013a6a:	b80c      	st.w      	r0, (r14, 0x30)
 8013a6c:	b82b      	st.w      	r1, (r14, 0x2c)
 8013a6e:	e3ffeae7 	bsr      	0x801103c	// 801103c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013a72:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8013a76:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8013a7a:	c4124822 	lsli      	r2, r18, 0
 8013a7e:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8013a80:	c4004831 	lsli      	r17, r0, 0
 8013a84:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013a88:	c4124820 	lsli      	r0, r18, 0
 8013a8c:	6c77      	mov      	r1, r13
 8013a8e:	de4e200e 	st.w      	r18, (r14, 0x38)
 8013a92:	ddae200d 	st.w      	r13, (r14, 0x34)
 8013a96:	e3ffea9d 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a9a:	b80c      	st.w      	r0, (r14, 0x30)
 8013a9c:	b82b      	st.w      	r1, (r14, 0x2c)
 8013a9e:	3200      	movi      	r2, 0
 8013aa0:	ea23402c 	movih      	r3, 16428
 8013aa4:	c4114820 	lsli      	r0, r17, 0
 8013aa8:	c4104821 	lsli      	r1, r16, 0
 8013aac:	e3ffebc8 	bsr      	0x801123c	// 801123c <__divdf3>
 8013ab0:	3200      	movi      	r2, 0
 8013ab2:	ea234024 	movih      	r3, 16420
 8013ab6:	e3ffea8d 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013aba:	6c83      	mov      	r2, r0
 8013abc:	6cc7      	mov      	r3, r1
 8013abe:	c4114820 	lsli      	r0, r17, 0
 8013ac2:	c4104821 	lsli      	r1, r16, 0
 8013ac6:	e3ffebbb 	bsr      	0x801123c	// 801123c <__divdf3>
 8013aca:	3200      	movi      	r2, 0
 8013acc:	ea234018 	movih      	r3, 16408
 8013ad0:	e3ffea80 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013ad4:	6c83      	mov      	r2, r0
 8013ad6:	6cc7      	mov      	r3, r1
 8013ad8:	c4114820 	lsli      	r0, r17, 0
 8013adc:	c4104821 	lsli      	r1, r16, 0
 8013ae0:	e3ffebae 	bsr      	0x801123c	// 801123c <__divdf3>
 8013ae4:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8013ae8:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8013aec:	c4124822 	lsli      	r2, r18, 0
 8013af0:	6cf7      	mov      	r3, r13
 8013af2:	c4004831 	lsli      	r17, r0, 0
 8013af6:	c4014830 	lsli      	r16, r1, 0
 8013afa:	3000      	movi      	r0, 0
 8013afc:	ea214000 	movih      	r1, 16384
 8013b00:	e3ffea80 	bsr      	0x8011000	// 8011000 <__subdf3>
 8013b04:	6c83      	mov      	r2, r0
 8013b06:	6cc7      	mov      	r3, r1
 8013b08:	c4114820 	lsli      	r0, r17, 0
 8013b0c:	c4104821 	lsli      	r1, r16, 0
 8013b10:	e3ffea60 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013b14:	daee200c 	ld.w      	r23, (r14, 0x30)
 8013b18:	dace200b 	ld.w      	r22, (r14, 0x2c)
 8013b1c:	6c83      	mov      	r2, r0
 8013b1e:	6cc7      	mov      	r3, r1
 8013b20:	c4174820 	lsli      	r0, r23, 0
 8013b24:	c4164821 	lsli      	r1, r22, 0
 8013b28:	e3ffeb8a 	bsr      	0x801123c	// 801123c <__divdf3>
 8013b2c:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8013b30:	daae2010 	ld.w      	r21, (r14, 0x40)
 8013b34:	c4144822 	lsli      	r2, r20, 0
 8013b38:	c4154823 	lsli      	r3, r21, 0
 8013b3c:	e3ffea4a 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8013b40:	984a      	ld.w      	r2, (r14, 0x28)
 8013b42:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013b46:	4374      	lsli      	r3, r3, 20
 8013b48:	3200      	movi      	r2, 0
 8013b4a:	e3ffea79 	bsr      	0x801103c	// 801103c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 8013b4e:	d98e2012 	ld.w      	r12, (r14, 0x48)
 8013b52:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8013b56:	6c83      	mov      	r2, r0
 8013b58:	c4004830 	lsli      	r16, r0, 0
 8013b5c:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013b5e:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 8013b62:	6c33      	mov      	r0, r12
 8013b64:	c4134821 	lsli      	r1, r19, 0
 8013b68:	e3ffec52 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013b6c:	c4104832 	lsli      	r18, r16, 0
 8013b70:	e9a00012 	bhsz      	r0, 0x8013b94	// 8013b94 <_etoa+0x290>
    expval--;
 8013b74:	9869      	ld.w      	r3, (r14, 0x24)
 8013b76:	2b00      	subi      	r3, 1
 8013b78:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8013b7a:	c4114821 	lsli      	r1, r17, 0
 8013b7e:	3200      	movi      	r2, 0
 8013b80:	ea234024 	movih      	r3, 16420
 8013b84:	c4104820 	lsli      	r0, r16, 0
 8013b88:	e3ffeb5a 	bsr      	0x801123c	// 801123c <__divdf3>
 8013b8c:	c4004832 	lsli      	r18, r0, 0
 8013b90:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8013b94:	9849      	ld.w      	r2, (r14, 0x24)
 8013b96:	e4620062 	addi      	r3, r2, 99
 8013b9a:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8013b9e:	9866      	ld.w      	r3, (r14, 0x18)
 8013ba0:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8013ba4:	c4000510 	mvc      	r16
 8013ba8:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8013bac:	e9030027 	bez      	r3, 0x8013bfa	// 8013bfa <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8013bb0:	1341      	lrw      	r2, 0xeb1c432d	// 8013d34 <_etoa+0x430>
 8013bb2:	1362      	lrw      	r3, 0x3f1a36e2	// 8013d38 <_etoa+0x434>
 8013bb4:	6c2b      	mov      	r0, r10
 8013bb6:	6c67      	mov      	r1, r9
 8013bb8:	de4e200a 	st.w      	r18, (r14, 0x28)
 8013bbc:	e3ffec08 	bsr      	0x80113cc	// 80113cc <__gedf2>
 8013bc0:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8013bc4:	e98000cd 	blz      	r0, 0x8013d5e	// 8013d5e <_etoa+0x45a>
 8013bc8:	3200      	movi      	r2, 0
 8013bca:	127d      	lrw      	r3, 0x412e8480	// 8013d3c <_etoa+0x438>
 8013bcc:	6c2b      	mov      	r0, r10
 8013bce:	6c67      	mov      	r1, r9
 8013bd0:	e3ffec1e 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013bd4:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8013bd8:	e9a000c3 	bhsz      	r0, 0x8013d5e	// 8013d5e <_etoa+0x45a>
      if ((int)prec > expval) {
 8013bdc:	9849      	ld.w      	r2, (r14, 0x24)
 8013bde:	9867      	ld.w      	r3, (r14, 0x1c)
 8013be0:	64c9      	cmplt      	r2, r3
 8013be2:	0cd4      	bf      	0x8013d8a	// 8013d8a <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8013be4:	60ca      	subu      	r3, r2
 8013be6:	2b00      	subi      	r3, 1
 8013be8:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8013bea:	9866      	ld.w      	r3, (r14, 0x18)
 8013bec:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8013bf0:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8013bf4:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 8013bf6:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8013bfa:	9848      	ld.w      	r2, (r14, 0x20)
 8013bfc:	c602008c 	subu      	r12, r2, r16
 8013c00:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8013c04:	9846      	ld.w      	r2, (r14, 0x18)
 8013c06:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8013c0a:	3300      	movi      	r3, 0
 8013c0c:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8013c10:	b84a      	st.w      	r2, (r14, 0x28)
 8013c12:	e9020006 	bez      	r2, 0x8013c1e	// 8013c1e <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8013c16:	eb500000 	cmpnei      	r16, 0
 8013c1a:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8013c1e:	9869      	ld.w      	r3, (r14, 0x24)
 8013c20:	e9230090 	bnez      	r3, 0x8013d40	// 8013d40 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8013c24:	3200      	movi      	r2, 0
 8013c26:	6ccb      	mov      	r3, r2
 8013c28:	6c17      	mov      	r0, r5
 8013c2a:	6c53      	mov      	r1, r4
 8013c2c:	c40c4831 	lsli      	r17, r12, 0
 8013c30:	e3ffebee 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013c34:	c411482c 	lsli      	r12, r17, 0
 8013c38:	e980009e 	blz      	r0, 0x8013d74	// 8013d74 <_etoa+0x470>
 8013c3c:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8013c40:	98a7      	ld.w      	r5, (r14, 0x1c)
 8013c42:	c5712823 	bclri      	r3, r17, 11
 8013c46:	b864      	st.w      	r3, (r14, 0x10)
 8013c48:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8013c4c:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8013c50:	b8a2      	st.w      	r5, (r14, 0x8)
 8013c52:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8013c56:	6ce3      	mov      	r3, r8
 8013c58:	6caf      	mov      	r2, r11
 8013c5a:	6c5f      	mov      	r1, r7
 8013c5c:	6c1b      	mov      	r0, r6
 8013c5e:	e3fffc07 	bsr      	0x801346c	// 801346c <_ftoa>
 8013c62:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8013c64:	6e57      	mov      	r9, r5
 8013c66:	e925004b 	bnez      	r5, 0x8013cfc	// 8013cfc <_etoa+0x3f8>
 8013c6a:	e9100049 	bez      	r16, 0x8013cfc	// 8013cfc <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8013c6e:	e4712020 	andi      	r3, r17, 32
 8013c72:	3b40      	cmpnei      	r3, 0
 8013c74:	6c83      	mov      	r2, r0
 8013c76:	ea0c0065 	movi      	r12, 101
 8013c7a:	58a2      	addi      	r5, r0, 1
 8013c7c:	3045      	movi      	r0, 69
 8013c7e:	c40c0c20 	incf      	r0, r12, 0
 8013c82:	6ce3      	mov      	r3, r8
 8013c84:	6c5f      	mov      	r1, r7
 8013c86:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8013c88:	3305      	movi      	r3, 5
 8013c8a:	9849      	ld.w      	r2, (r14, 0x24)
 8013c8c:	b865      	st.w      	r3, (r14, 0x14)
 8013c8e:	330a      	movi      	r3, 10
 8013c90:	b862      	st.w      	r3, (r14, 0x8)
 8013c92:	4a7f      	lsri      	r3, r2, 31
 8013c94:	b861      	st.w      	r3, (r14, 0x4)
 8013c96:	e6101000 	subi      	r16, r16, 1
 8013c9a:	c4020203 	abs      	r3, r2
 8013c9e:	b860      	st.w      	r3, (r14, 0x0)
 8013ca0:	de0e2004 	st.w      	r16, (r14, 0x10)
 8013ca4:	6ce3      	mov      	r3, r8
 8013ca6:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8013caa:	6c97      	mov      	r2, r5
 8013cac:	6c5f      	mov      	r1, r7
 8013cae:	6c1b      	mov      	r0, r6
 8013cb0:	e3fffb12 	bsr      	0x80132d4	// 80132d4 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8013cb4:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8013cb6:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8013cb8:	e9030022 	bez      	r3, 0x8013cfc	// 8013cfc <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8013cbc:	c5600083 	subu      	r3, r0, r11
 8013cc0:	98a8      	ld.w      	r5, (r14, 0x20)
 8013cc2:	654c      	cmphs      	r3, r5
 8013cc4:	081c      	bt      	0x8013cfc	// 8013cfc <_etoa+0x3f8>
 8013cc6:	6c83      	mov      	r2, r0
 8013cc8:	2400      	addi      	r4, 1
 8013cca:	6ce3      	mov      	r3, r8
 8013ccc:	6c5f      	mov      	r1, r7
 8013cce:	3020      	movi      	r0, 32
 8013cd0:	7bd9      	jsr      	r6
 8013cd2:	c5640083 	subu      	r3, r4, r11
 8013cd6:	654c      	cmphs      	r3, r5
 8013cd8:	6c93      	mov      	r2, r4
 8013cda:	0ff7      	bf      	0x8013cc8	// 8013cc8 <_etoa+0x3c4>
 8013cdc:	0410      	br      	0x8013cfc	// 8013cfc <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8013cde:	9866      	ld.w      	r3, (r14, 0x18)
 8013ce0:	b864      	st.w      	r3, (r14, 0x10)
 8013ce2:	9868      	ld.w      	r3, (r14, 0x20)
 8013ce4:	b863      	st.w      	r3, (r14, 0xc)
 8013ce6:	9867      	ld.w      	r3, (r14, 0x1c)
 8013ce8:	b862      	st.w      	r3, (r14, 0x8)
 8013cea:	b881      	st.w      	r4, (r14, 0x4)
 8013cec:	b8a0      	st.w      	r5, (r14, 0x0)
 8013cee:	6ce3      	mov      	r3, r8
 8013cf0:	6caf      	mov      	r2, r11
 8013cf2:	6c5f      	mov      	r1, r7
 8013cf4:	6c1b      	mov      	r0, r6
 8013cf6:	e3fffbbb 	bsr      	0x801346c	// 801346c <_ftoa>
 8013cfa:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8013cfc:	6c13      	mov      	r0, r4
 8013cfe:	1414      	addi      	r14, r14, 80
 8013d00:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8013d04:	509f79fb 	.long	0x509f79fb
 8013d08:	3fd34413 	.long	0x3fd34413
 8013d0c:	8b60c8b3 	.long	0x8b60c8b3
 8013d10:	3fc68a28 	.long	0x3fc68a28
 8013d14:	636f4361 	.long	0x636f4361
 8013d18:	3fd287a7 	.long	0x3fd287a7
 8013d1c:	0979a371 	.long	0x0979a371
 8013d20:	400a934f 	.long	0x400a934f
 8013d24:	bbb55516 	.long	0xbbb55516
 8013d28:	40026bb1 	.long	0x40026bb1
 8013d2c:	fefa39ef 	.long	0xfefa39ef
 8013d30:	3fe62e42 	.long	0x3fe62e42
 8013d34:	eb1c432d 	.long	0xeb1c432d
 8013d38:	3f1a36e2 	.long	0x3f1a36e2
 8013d3c:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8013d40:	6c2b      	mov      	r0, r10
 8013d42:	6c67      	mov      	r1, r9
 8013d44:	c4124822 	lsli      	r2, r18, 0
 8013d48:	c4114823 	lsli      	r3, r17, 0
 8013d4c:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8013d50:	e3ffea76 	bsr      	0x801123c	// 801123c <__divdf3>
 8013d54:	6e83      	mov      	r10, r0
 8013d56:	6e47      	mov      	r9, r1
 8013d58:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8013d5c:	0764      	br      	0x8013c24	// 8013c24 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8013d5e:	9847      	ld.w      	r2, (r14, 0x1c)
 8013d60:	e902ff4d 	bez      	r2, 0x8013bfa	// 8013bfa <_etoa+0x2f6>
        --prec;
 8013d64:	9873      	ld.w      	r3, (r14, 0x4c)
 8013d66:	3b40      	cmpnei      	r3, 0
 8013d68:	c4620c20 	incf      	r3, r2, 0
 8013d6c:	c4620d01 	dect      	r3, r2, 1
 8013d70:	b867      	st.w      	r3, (r14, 0x1c)
 8013d72:	0744      	br      	0x8013bfa	// 8013bfa <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8013d74:	ea238000 	movih      	r3, 32768
 8013d78:	60e4      	addu      	r3, r9
 8013d7a:	6e4f      	mov      	r9, r3
 8013d7c:	0760      	br      	0x8013c3c	// 8013c3c <_etoa+0x338>
    value = -value;
 8013d7e:	ea238000 	movih      	r3, 32768
 8013d82:	c4640029 	addu      	r9, r4, r3
 8013d86:	e800fdf7 	br      	0x8013974	// 8013974 <_etoa+0x70>
      if ((int)prec > expval) {
 8013d8a:	3300      	movi      	r3, 0
 8013d8c:	072e      	br      	0x8013be8	// 8013be8 <_etoa+0x2e4>
	...

08013d90 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8013d90:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013d94:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8013d96:	3940      	cmpnei      	r1, 0
 8013d98:	10cf      	lrw      	r6, 0x801304c	// 8013dd4 <_vsnprintf+0x44>
{
 8013d9a:	6e07      	mov      	r8, r1
 8013d9c:	6dcb      	mov      	r7, r2
 8013d9e:	6d4f      	mov      	r5, r3
 8013da0:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 8013da2:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8013da6:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8013daa:	ea89000c 	lrw      	r9, 0x8014a94	// 8013dd8 <_vsnprintf+0x48>
  while (*format)
 8013dae:	8500      	ld.b      	r0, (r5, 0x0)
 8013db0:	e900006f 	bez      	r0, 0x8013e8e	// 8013e8e <_vsnprintf+0xfe>
    if (*format != '%') {
 8013db4:	eb400025 	cmpnei      	r0, 37
 8013db8:	0860      	bt      	0x8013e78	// 8013e78 <_vsnprintf+0xe8>
      format++;
 8013dba:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8013dbc:	3100      	movi      	r1, 0
      switch (*format) {
 8013dbe:	8200      	ld.b      	r0, (r2, 0x0)
 8013dc0:	e460101f 	subi      	r3, r0, 32
 8013dc4:	74cc      	zextb      	r3, r3
 8013dc6:	3b10      	cmphsi      	r3, 17
 8013dc8:	6d4b      	mov      	r5, r2
 8013dca:	081d      	bt      	0x8013e04	// 8013e04 <_vsnprintf+0x74>
 8013dcc:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8013dd0:	780c      	jmp      	r3
 8013dd2:	0000      	.short	0x0000
 8013dd4:	0801304c 	.long	0x0801304c
 8013dd8:	08014a94 	.long	0x08014a94
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8013ddc:	ec210001 	ori      	r1, r1, 1
 8013de0:	2200      	addi      	r2, 1
 8013de2:	07ee      	br      	0x8013dbe	// 8013dbe <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8013de4:	ec210008 	ori      	r1, r1, 8
 8013de8:	2200      	addi      	r2, 1
 8013dea:	07ea      	br      	0x8013dbe	// 8013dbe <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8013dec:	ec210010 	ori      	r1, r1, 16
 8013df0:	2200      	addi      	r2, 1
 8013df2:	07e6      	br      	0x8013dbe	// 8013dbe <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 8013df4:	ec210004 	ori      	r1, r1, 4
 8013df8:	2200      	addi      	r2, 1
 8013dfa:	07e2      	br      	0x8013dbe	// 8013dbe <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8013dfc:	ec210002 	ori      	r1, r1, 2
 8013e00:	2200      	addi      	r2, 1
 8013e02:	07de      	br      	0x8013dbe	// 8013dbe <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8013e04:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8013e08:	74cc      	zextb      	r3, r3
 8013e0a:	3b09      	cmphsi      	r3, 10
 8013e0c:	0c5b      	bf      	0x8013ec2	// 8013ec2 <_vsnprintf+0x132>
    else if (*format == '*') {
 8013e0e:	eb40002a 	cmpnei      	r0, 42
 8013e12:	e84003c3 	bf      	0x8014598	// 8014598 <_vsnprintf+0x808>
    width = 0U;
 8013e16:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 8013e1a:	eb40002e 	cmpnei      	r0, 46
 8013e1e:	0c65      	bf      	0x8013ee8	// 8013ee8 <_vsnprintf+0x158>
    precision = 0U;
 8013e20:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8013e24:	e4601067 	subi      	r3, r0, 104
 8013e28:	74cc      	zextb      	r3, r3
 8013e2a:	3b12      	cmphsi      	r3, 19
 8013e2c:	080c      	bt      	0x8013e44	// 8013e44 <_vsnprintf+0xb4>
 8013e2e:	1043      	lrw      	r2, 0x8014ad8	// 8013e38 <_vsnprintf+0xa8>
 8013e30:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8013e34:	780c      	jmp      	r3
 8013e36:	0000      	.short	0x0000
 8013e38:	08014ad8 	.long	0x08014ad8
 8013e3c:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8013e3e:	ec210100 	ori      	r1, r1, 256
        format++;
 8013e42:	2500      	addi      	r5, 1
    switch (*format) {
 8013e44:	e4601024 	subi      	r3, r0, 37
 8013e48:	74cc      	zextb      	r3, r3
 8013e4a:	eb030053 	cmphsi      	r3, 84
 8013e4e:	0815      	bt      	0x8013e78	// 8013e78 <_vsnprintf+0xe8>
 8013e50:	1042      	lrw      	r2, 0x8014b24	// 8013e58 <_vsnprintf+0xc8>
 8013e52:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8013e56:	780c      	jmp      	r3
 8013e58:	08014b24 	.long	0x08014b24
        if (*format == 'l') {
 8013e5c:	8501      	ld.b      	r0, (r5, 0x1)
 8013e5e:	eb40006c 	cmpnei      	r0, 108
 8013e62:	e84003ac 	bf      	0x80145ba	// 80145ba <_vsnprintf+0x82a>
    switch (*format) {
 8013e66:	e4601024 	subi      	r3, r0, 37
 8013e6a:	74cc      	zextb      	r3, r3
 8013e6c:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8013e70:	ec210100 	ori      	r1, r1, 256
        format++;
 8013e74:	2500      	addi      	r5, 1
    switch (*format) {
 8013e76:	0fed      	bf      	0x8013e50	// 8013e50 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8013e78:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8013e7a:	6caf      	mov      	r2, r11
 8013e7c:	6cdf      	mov      	r3, r7
 8013e7e:	6c63      	mov      	r1, r8
 8013e80:	7bd9      	jsr      	r6
  while (*format)
 8013e82:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8013e84:	e54b0000 	addi      	r10, r11, 1
 8013e88:	6eeb      	mov      	r11, r10
  while (*format)
 8013e8a:	e920ff95 	bnez      	r0, 0x8013db4	// 8013db4 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8013e8e:	65ec      	cmphs      	r11, r7
 8013e90:	e8400381 	bf      	0x8014592	// 8014592 <_vsnprintf+0x802>
 8013e94:	5f43      	subi      	r2, r7, 1
 8013e96:	6cdf      	mov      	r3, r7
 8013e98:	6c63      	mov      	r1, r8
 8013e9a:	3000      	movi      	r0, 0
 8013e9c:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8013e9e:	6c2f      	mov      	r0, r11
 8013ea0:	1416      	addi      	r14, r14, 88
 8013ea2:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 8013ea6:	8501      	ld.b      	r0, (r5, 0x1)
 8013ea8:	eb400068 	cmpnei      	r0, 104
 8013eac:	e8400381 	bf      	0x80145ae	// 80145ae <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8013eb0:	ec210080 	ori      	r1, r1, 128
        format++;
 8013eb4:	2500      	addi      	r5, 1
 8013eb6:	07c7      	br      	0x8013e44	// 8013e44 <_vsnprintf+0xb4>
 8013eb8:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8013eba:	ec210200 	ori      	r1, r1, 512
        format++;
 8013ebe:	2500      	addi      	r5, 1
        break;
 8013ec0:	07c2      	br      	0x8013e44	// 8013e44 <_vsnprintf+0xb4>
 8013ec2:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013ec6:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8013eca:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013ecc:	2500      	addi      	r5, 1
 8013ece:	f9b18440 	mula.32.l      	r0, r17, r13
 8013ed2:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 8013ed6:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8013ed8:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8013edc:	74cc      	zextb      	r3, r3
 8013ede:	64c8      	cmphs      	r2, r3
 8013ee0:	0bf6      	bt      	0x8013ecc	// 8013ecc <_vsnprintf+0x13c>
    if (*format == '.') {
 8013ee2:	eb40002e 	cmpnei      	r0, 46
 8013ee6:	0b9d      	bt      	0x8013e20	// 8013e20 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8013ee8:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8013eea:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8013eee:	74cc      	zextb      	r3, r3
 8013ef0:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8013ef2:	ec210400 	ori      	r1, r1, 1024
      format++;
 8013ef6:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 8013ef8:	0813      	bt      	0x8013f1e	// 8013f1e <_vsnprintf+0x18e>
 8013efa:	6d4b      	mov      	r5, r2
 8013efc:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013f00:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8013f04:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013f06:	2500      	addi      	r5, 1
 8013f08:	fa4a8440 	mula.32.l      	r0, r10, r18
 8013f0c:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8013f10:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8013f12:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8013f16:	74cc      	zextb      	r3, r3
 8013f18:	64c8      	cmphs      	r2, r3
 8013f1a:	0bf6      	bt      	0x8013f06	// 8013f06 <_vsnprintf+0x176>
 8013f1c:	0784      	br      	0x8013e24	// 8013e24 <_vsnprintf+0x94>
      else if (*format == '*') {
 8013f1e:	eb40002a 	cmpnei      	r0, 42
 8013f22:	e84003e2 	bf      	0x80146e6	// 80146e6 <_vsnprintf+0x956>
      format++;
 8013f26:	6d4b      	mov      	r5, r2
 8013f28:	077c      	br      	0x8013e20	// 8013e20 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8013f2a:	5c6e      	addi      	r3, r4, 4
 8013f2c:	3000      	movi      	r0, 0
 8013f2e:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013f32:	b869      	st.w      	r3, (r14, 0x24)
 8013f34:	6d03      	mov      	r4, r0
            h = bit / 100;
 8013f36:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8013f3a:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8013f3e:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8013f42:	ea15002e 	movi      	r21, 46
 8013f46:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8013f4a:	c4164043 	lsr      	r3, r22, r0
 8013f4e:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8013f50:	c6838022 	divu      	r2, r3, r20
 8013f54:	7748      	zextb      	r13, r2
            if (h)
 8013f56:	e90d0306 	bez      	r13, 0x8014562	// 8014562 <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8013f5a:	c6828422 	mult      	r2, r2, r20
 8013f5e:	60ca      	subu      	r3, r2
 8013f60:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8013f62:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8013f66:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8013f6a:	e5840000 	addi      	r12, r4, 1
 8013f6e:	e5ad002f 	addi      	r13, r13, 48
 8013f72:	7730      	zextb      	r12, r12
 8013f74:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8013f78:	e92202fe 	bnez      	r2, 0x8014574	// 8014574 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8013f7c:	1a0c      	addi      	r2, r14, 48
 8013f7e:	2401      	addi      	r4, 2
 8013f80:	7510      	zextb      	r4, r4
 8013f82:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8013f86:	c6638022 	divu      	r2, r3, r19
 8013f8a:	c6628422 	mult      	r2, r2, r19
 8013f8e:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8013f90:	1a0c      	addi      	r2, r14, 48
 8013f92:	e5840000 	addi      	r12, r4, 1
 8013f96:	232f      	addi      	r3, 48
 8013f98:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8013f9c:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8013f9e:	2401      	addi      	r4, 2
 8013fa0:	7510      	zextb      	r4, r4
 8013fa2:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8013fa6:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8013fa8:	e832ffd1 	bnezad      	r18, 0x8013f4a	// 8013f4a <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8013fac:	e46e002e 	addi      	r3, r14, 47
 8013fb0:	3200      	movi      	r2, 0
 8013fb2:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8013fb6:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8013fb8:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8013fbc:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8013fbe:	3a40      	cmpnei      	r2, 0
 8013fc0:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8013fc4:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8013fc6:	6c83      	mov      	r2, r0
 8013fc8:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8013fcc:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8013fd0:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8013fd2:	b86b      	st.w      	r3, (r14, 0x2c)
 8013fd4:	e9230333 	bnez      	r3, 0x801463a	// 801463a <_vsnprintf+0x8aa>
          while (l++ < width) {
 8013fd8:	c6220420 	cmphs      	r2, r17
 8013fdc:	6ccb      	mov      	r3, r2
 8013fde:	2300      	addi      	r3, 1
 8013fe0:	e86003ff 	bt      	0x80147de	// 80147de <_vsnprintf+0xa4e>
 8013fe4:	c5710023 	addu      	r3, r17, r11
 8013fe8:	5b89      	subu      	r4, r3, r2
 8013fea:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013fec:	e56b0000 	addi      	r11, r11, 1
 8013ff0:	6cdf      	mov      	r3, r7
 8013ff2:	6c63      	mov      	r1, r8
 8013ff4:	3020      	movi      	r0, 32
 8013ff6:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013ff8:	66d2      	cmpne      	r4, r11
 8013ffa:	6caf      	mov      	r2, r11
 8013ffc:	0bf8      	bt      	0x8013fec	// 8013fec <_vsnprintf+0x25c>
 8013ffe:	e4710000 	addi      	r3, r17, 1
 8014002:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014004:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014008:	e9000030 	bez      	r0, 0x8014068	// 8014068 <_vsnprintf+0x2d8>
 801400c:	6caf      	mov      	r2, r11
 801400e:	e60e002f 	addi      	r16, r14, 48
 8014012:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014016:	0402      	br      	0x801401a	// 801401a <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8014018:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801401a:	e90b0007 	bez      	r11, 0x8014028	// 8014028 <_vsnprintf+0x298>
 801401e:	e46a1000 	subi      	r3, r10, 1
 8014022:	e90a034a 	bez      	r10, 0x80146b6	// 80146b6 <_vsnprintf+0x926>
 8014026:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014028:	e6100000 	addi      	r16, r16, 1
 801402c:	6cdf      	mov      	r3, r7
 801402e:	6c63      	mov      	r1, r8
 8014030:	5a82      	addi      	r4, r2, 1
 8014032:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014034:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014038:	e920fff0 	bnez      	r0, 0x8014018	// 8014018 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 801403c:	986b      	ld.w      	r3, (r14, 0x2c)
 801403e:	e90302a5 	bez      	r3, 0x8014588	// 8014588 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014042:	9868      	ld.w      	r3, (r14, 0x20)
 8014044:	c6230420 	cmphs      	r3, r17
 8014048:	e86002a0 	bt      	0x8014588	// 8014588 <_vsnprintf+0x7f8>
 801404c:	c4910020 	addu      	r0, r17, r4
 8014050:	c460008a 	subu      	r10, r0, r3
 8014054:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014056:	e5620000 	addi      	r11, r2, 1
 801405a:	6cdf      	mov      	r3, r7
 801405c:	6c63      	mov      	r1, r8
 801405e:	3020      	movi      	r0, 32
 8014060:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014062:	66ea      	cmpne      	r10, r11
 8014064:	6caf      	mov      	r2, r11
 8014066:	0bf8      	bt      	0x8014056	// 8014056 <_vsnprintf+0x2c6>
        format++;
 8014068:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801406a:	9889      	ld.w      	r4, (r14, 0x24)
 801406c:	06a1      	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 801406e:	da042000 	ld.w      	r16, (r4, 0x0)
 8014072:	5c6e      	addi      	r3, r4, 4
 8014074:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8014076:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 801407a:	3300      	movi      	r3, 0
 801407c:	2b00      	subi      	r3, 1
 801407e:	eb4a0000 	cmpnei      	r10, 0
 8014082:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8014086:	c4104824 	lsli      	r4, r16, 0
 801408a:	e9200006 	bnez      	r0, 0x8014096	// 8014096 <_vsnprintf+0x306>
 801408e:	0408      	br      	0x801409e	// 801409e <_vsnprintf+0x30e>
 8014090:	2b00      	subi      	r3, 1
 8014092:	e9030006 	bez      	r3, 0x801409e	// 801409e <_vsnprintf+0x30e>
 8014096:	2400      	addi      	r4, 1
 8014098:	8440      	ld.b      	r2, (r4, 0x0)
 801409a:	e922fffb 	bnez      	r2, 0x8014090	// 8014090 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 801409e:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 80140a2:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 80140a6:	f944cd23 	min.u32      	r3, r4, r10
 80140aa:	3a40      	cmpnei      	r2, 0
 80140ac:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 80140b0:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 80140b4:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 80140b6:	b86a      	st.w      	r3, (r14, 0x28)
 80140b8:	e9230287 	bnez      	r3, 0x80145c6	// 80145c6 <_vsnprintf+0x836>
          while (l++ < width) {
 80140bc:	c6240420 	cmphs      	r4, r17
 80140c0:	5c62      	addi      	r3, r4, 1
 80140c2:	e860039c 	bt      	0x80147fa	// 80147fa <_vsnprintf+0xa6a>
 80140c6:	c5710023 	addu      	r3, r17, r11
 80140ca:	5b91      	subu      	r4, r3, r4
 80140cc:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80140ce:	e5620000 	addi      	r11, r2, 1
 80140d2:	6cdf      	mov      	r3, r7
 80140d4:	6c63      	mov      	r1, r8
 80140d6:	3020      	movi      	r0, 32
 80140d8:	7bd9      	jsr      	r6
          while (l++ < width) {
 80140da:	66d2      	cmpne      	r4, r11
 80140dc:	6caf      	mov      	r2, r11
 80140de:	0bf8      	bt      	0x80140ce	// 80140ce <_vsnprintf+0x33e>
 80140e0:	c40b4832 	lsli      	r18, r11, 0
 80140e4:	e4910000 	addi      	r4, r17, 1
 80140e8:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80140ec:	e9000391 	bez      	r0, 0x801480e	// 801480e <_vsnprintf+0xa7e>
 80140f0:	b88b      	st.w      	r4, (r14, 0x2c)
 80140f2:	c4124822 	lsli      	r2, r18, 0
 80140f6:	d96e2009 	ld.w      	r11, (r14, 0x24)
 80140fa:	0402      	br      	0x80140fe	// 80140fe <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 80140fc:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80140fe:	e90b0007 	bez      	r11, 0x801410c	// 801410c <_vsnprintf+0x37c>
 8014102:	e46a1000 	subi      	r3, r10, 1
 8014106:	e90a02d2 	bez      	r10, 0x80146aa	// 80146aa <_vsnprintf+0x91a>
 801410a:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 801410c:	e6100000 	addi      	r16, r16, 1
 8014110:	6cdf      	mov      	r3, r7
 8014112:	6c63      	mov      	r1, r8
 8014114:	5a82      	addi      	r4, r2, 1
 8014116:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014118:	d8100000 	ld.b      	r0, (r16, 0x0)
 801411c:	e920fff0 	bnez      	r0, 0x80140fc	// 80140fc <_vsnprintf+0x36c>
 8014120:	6ed3      	mov      	r11, r4
 8014122:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8014124:	986a      	ld.w      	r3, (r14, 0x28)
 8014126:	e9030012 	bez      	r3, 0x801414a	// 801414a <_vsnprintf+0x3ba>
          while (l++ < width) {
 801412a:	c6240420 	cmphs      	r4, r17
 801412e:	080e      	bt      	0x801414a	// 801414a <_vsnprintf+0x3ba>
 8014130:	c5710020 	addu      	r0, r17, r11
 8014134:	5891      	subu      	r4, r0, r4
 8014136:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014138:	e56b0000 	addi      	r11, r11, 1
 801413c:	6cdf      	mov      	r3, r7
 801413e:	6c63      	mov      	r1, r8
 8014140:	3020      	movi      	r0, 32
 8014142:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014144:	66d2      	cmpne      	r4, r11
 8014146:	6caf      	mov      	r2, r11
 8014148:	0bf8      	bt      	0x8014138	// 8014138 <_vsnprintf+0x3a8>
        format++;
 801414a:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 801414c:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 801414e:	0630      	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014150:	3308      	movi      	r3, 8
 8014152:	b864      	st.w      	r3, (r14, 0x10)
 8014154:	3310      	movi      	r3, 16
 8014156:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8014158:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 801415c:	3300      	movi      	r3, 0
 801415e:	b825      	st.w      	r1, (r14, 0x14)
 8014160:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014164:	b861      	st.w      	r3, (r14, 0x4)
 8014166:	9460      	ld.w      	r3, (r4, 0x0)
 8014168:	b860      	st.w      	r3, (r14, 0x0)
 801416a:	6caf      	mov      	r2, r11
 801416c:	6cdf      	mov      	r3, r7
 801416e:	6c63      	mov      	r1, r8
 8014170:	6c1b      	mov      	r0, r6
 8014172:	e6040003 	addi      	r16, r4, 4
 8014176:	e3fff8af 	bsr      	0x80132d4	// 80132d4 <_ntoa_long>
 801417a:	6ec3      	mov      	r11, r0
        format++;
 801417c:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 801417e:	c4104824 	lsli      	r4, r16, 0
        break;
 8014182:	0616      	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8014184:	e4212002 	andi      	r1, r1, 2
 8014188:	e9210227 	bnez      	r1, 0x80145d6	// 80145d6 <_vsnprintf+0x846>
          while (l++ < width) {
 801418c:	3301      	movi      	r3, 1
 801418e:	c6230420 	cmphs      	r3, r17
 8014192:	e860032f 	bt      	0x80147f0	// 80147f0 <_vsnprintf+0xa60>
 8014196:	e60b1000 	subi      	r16, r11, 1
 801419a:	c6300030 	addu      	r16, r16, r17
 801419e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80141a0:	e5420000 	addi      	r10, r2, 1
 80141a4:	6cdf      	mov      	r3, r7
 80141a6:	6c63      	mov      	r1, r8
 80141a8:	3020      	movi      	r0, 32
 80141aa:	7bd9      	jsr      	r6
          while (l++ < width) {
 80141ac:	c5500480 	cmpne      	r16, r10
 80141b0:	6cab      	mov      	r2, r10
 80141b2:	0bf7      	bt      	0x80141a0	// 80141a0 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80141b4:	8400      	ld.b      	r0, (r4, 0x0)
 80141b6:	e6040003 	addi      	r16, r4, 4
 80141ba:	6cdf      	mov      	r3, r7
 80141bc:	6cab      	mov      	r2, r10
 80141be:	6c63      	mov      	r1, r8
 80141c0:	e56a0000 	addi      	r11, r10, 1
 80141c4:	7bd9      	jsr      	r6
 80141c6:	c4104824 	lsli      	r4, r16, 0
        format++;
 80141ca:	2500      	addi      	r5, 1
        break;
 80141cc:	e800fdf1 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 80141d0:	eb400078 	cmpnei      	r0, 120
 80141d4:	e8400277 	bf      	0x80146c2	// 80146c2 <_vsnprintf+0x932>
 80141d8:	eb400058 	cmpnei      	r0, 88
 80141dc:	e8400275 	bf      	0x80146c6	// 80146c6 <_vsnprintf+0x936>
        else if (*format == 'o') {
 80141e0:	eb40006f 	cmpnei      	r0, 111
 80141e4:	e8400232 	bf      	0x8014648	// 8014648 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 80141e8:	eb400062 	cmpnei      	r0, 98
 80141ec:	e84002d5 	bf      	0x8014796	// 8014796 <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 80141f0:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80141f4:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 80141f8:	e8600232 	bt      	0x801465c	// 801465c <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 80141fc:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8014200:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8014202:	e9010236 	bez      	r1, 0x801466e	// 801466e <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8014206:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8014208:	eb400069 	cmpnei      	r0, 105
 801420c:	e8400231 	bf      	0x801466e	// 801466e <_vsnprintf+0x8de>
 8014210:	eb400064 	cmpnei      	r0, 100
 8014214:	e840022d 	bf      	0x801466e	// 801466e <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8014218:	e4232200 	andi      	r1, r3, 512
 801421c:	e9210276 	bnez      	r1, 0x8014708	// 8014708 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8014220:	e4032100 	andi      	r0, r3, 256
 8014224:	e92002a2 	bnez      	r0, 0x8014768	// 8014768 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014228:	e4232040 	andi      	r1, r3, 64
 801422c:	e92102cf 	bnez      	r1, 0x80147ca	// 80147ca <_vsnprintf+0xa3a>
 8014230:	e4232080 	andi      	r1, r3, 128
 8014234:	e92102b3 	bnez      	r1, 0x801479a	// 801479a <_vsnprintf+0xa0a>
 8014238:	9420      	ld.w      	r1, (r4, 0x0)
 801423a:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 801423c:	b865      	st.w      	r3, (r14, 0x14)
 801423e:	3300      	movi      	r3, 0
 8014240:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014244:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014248:	b842      	st.w      	r2, (r14, 0x8)
 801424a:	b861      	st.w      	r3, (r14, 0x4)
 801424c:	b820      	st.w      	r1, (r14, 0x0)
 801424e:	6caf      	mov      	r2, r11
 8014250:	6cdf      	mov      	r3, r7
 8014252:	6c63      	mov      	r1, r8
 8014254:	6c1b      	mov      	r0, r6
 8014256:	e3fff83f 	bsr      	0x80132d4	// 80132d4 <_ntoa_long>
 801425a:	6ec3      	mov      	r11, r0
        format++;
 801425c:	2500      	addi      	r5, 1
 801425e:	e800fda8 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014262:	eb400046 	cmpnei      	r0, 70
 8014266:	e840023c 	bf      	0x80146de	// 80146de <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801426a:	b824      	st.w      	r1, (r14, 0x10)
 801426c:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014270:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014274:	e6040007 	addi      	r16, r4, 8
 8014278:	9460      	ld.w      	r3, (r4, 0x0)
 801427a:	9481      	ld.w      	r4, (r4, 0x4)
 801427c:	b860      	st.w      	r3, (r14, 0x0)
 801427e:	b881      	st.w      	r4, (r14, 0x4)
 8014280:	6caf      	mov      	r2, r11
 8014282:	6cdf      	mov      	r3, r7
 8014284:	6c63      	mov      	r1, r8
 8014286:	6c1b      	mov      	r0, r6
 8014288:	e3fff8f2 	bsr      	0x801346c	// 801346c <_ftoa>
 801428c:	6ec3      	mov      	r11, r0
        format++;
 801428e:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014290:	c4104824 	lsli      	r4, r16, 0
        break;
 8014294:	e800fd8d 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8014298:	6caf      	mov      	r2, r11
 801429a:	e54b0000 	addi      	r10, r11, 1
 801429e:	6cdf      	mov      	r3, r7
 80142a0:	6c63      	mov      	r1, r8
 80142a2:	3025      	movi      	r0, 37
 80142a4:	7bd9      	jsr      	r6
        format++;
 80142a6:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 80142a8:	6eeb      	mov      	r11, r10
        break;
 80142aa:	e800fd82 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 80142ae:	5c6e      	addi      	r3, r4, 4
 80142b0:	dac42000 	ld.w      	r22, (r4, 0x0)
 80142b4:	b869      	st.w      	r3, (r14, 0x24)
 80142b6:	e716000f 	addi      	r24, r22, 16
 80142ba:	3400      	movi      	r4, 0
                if (h > 9)
 80142bc:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 80142c0:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 80142c4:	ea0c0000 	movi      	r12, 0
 80142c8:	da562000 	ld.w      	r18, (r22, 0x0)
 80142cc:	6c33      	mov      	r0, r12
 80142ce:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 80142d2:	c5924043 	lsr      	r3, r18, r12
 80142d6:	74cc      	zextb      	r3, r3
                h = m >> 4;
 80142d8:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 80142da:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 80142de:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 80142e2:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 80142e6:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 80142ea:	092e      	bt      	0x8014546	// 8014546 <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 80142ec:	e6ae002f 	addi      	r21, r14, 48
 80142f0:	2236      	addi      	r2, 55
 80142f2:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 80142f6:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 80142fa:	e4930000 	addi      	r4, r19, 1
 80142fe:	7510      	zextb      	r4, r4
                if (l > 9)
 8014300:	091e      	bt      	0x801453c	// 801453c <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8014302:	1a0c      	addi      	r2, r14, 48
 8014304:	2336      	addi      	r3, 55
 8014306:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 801430a:	e4602001 	andi      	r3, r0, 1
 801430e:	e9030007 	bez      	r3, 0x801431c	// 801431c <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8014312:	1a0c      	addi      	r2, r14, 48
 8014314:	5c62      	addi      	r3, r4, 1
 8014316:	d4820037 	str.b      	r23, (r2, r4 << 0)
 801431a:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 801431c:	2000      	addi      	r0, 1
 801431e:	7400      	zextb      	r0, r0
 8014320:	e58c0007 	addi      	r12, r12, 8
 8014324:	e82dffd7 	bnezad      	r13, 0x80142d2	// 80142d2 <_vsnprintf+0x542>
            inuint++;
 8014328:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 801432c:	c6d80480 	cmpne      	r24, r22
 8014330:	0bca      	bt      	0x80142c4	// 80142c4 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8014332:	e46e002e 	addi      	r3, r14, 47
 8014336:	3200      	movi      	r2, 0
 8014338:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 801433c:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 801433e:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014342:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014344:	3a40      	cmpnei      	r2, 0
 8014346:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 801434a:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 801434c:	6c83      	mov      	r2, r0
 801434e:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014352:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014356:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014358:	b86b      	st.w      	r3, (r14, 0x2c)
 801435a:	e923015a 	bnez      	r3, 0x801460e	// 801460e <_vsnprintf+0x87e>
          while (l++ < width) {
 801435e:	c6220420 	cmphs      	r2, r17
 8014362:	6ccb      	mov      	r3, r2
 8014364:	2300      	addi      	r3, 1
 8014366:	e8600239 	bt      	0x80147d8	// 80147d8 <_vsnprintf+0xa48>
 801436a:	c5710023 	addu      	r3, r17, r11
 801436e:	5b89      	subu      	r4, r3, r2
 8014370:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014372:	e56b0000 	addi      	r11, r11, 1
 8014376:	6cdf      	mov      	r3, r7
 8014378:	6c63      	mov      	r1, r8
 801437a:	3020      	movi      	r0, 32
 801437c:	7bd9      	jsr      	r6
          while (l++ < width) {
 801437e:	66d2      	cmpne      	r4, r11
 8014380:	6caf      	mov      	r2, r11
 8014382:	0bf8      	bt      	0x8014372	// 8014372 <_vsnprintf+0x5e2>
 8014384:	e4710000 	addi      	r3, r17, 1
 8014388:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801438a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801438e:	e900fe6d 	bez      	r0, 0x8014068	// 8014068 <_vsnprintf+0x2d8>
 8014392:	6caf      	mov      	r2, r11
 8014394:	e60e002f 	addi      	r16, r14, 48
 8014398:	d96e200a 	ld.w      	r11, (r14, 0x28)
 801439c:	0402      	br      	0x80143a0	// 80143a0 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 801439e:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80143a0:	e90b0007 	bez      	r11, 0x80143ae	// 80143ae <_vsnprintf+0x61e>
 80143a4:	e46a1000 	subi      	r3, r10, 1
 80143a8:	e90a0185 	bez      	r10, 0x80146b2	// 80146b2 <_vsnprintf+0x922>
 80143ac:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 80143ae:	e6100000 	addi      	r16, r16, 1
 80143b2:	6cdf      	mov      	r3, r7
 80143b4:	6c63      	mov      	r1, r8
 80143b6:	5a82      	addi      	r4, r2, 1
 80143b8:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80143ba:	d8100000 	ld.b      	r0, (r16, 0x0)
 80143be:	e920fff0 	bnez      	r0, 0x801439e	// 801439e <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 80143c2:	986b      	ld.w      	r3, (r14, 0x2c)
 80143c4:	e90300e2 	bez      	r3, 0x8014588	// 8014588 <_vsnprintf+0x7f8>
          while (l++ < width) {
 80143c8:	9868      	ld.w      	r3, (r14, 0x20)
 80143ca:	c6230420 	cmphs      	r3, r17
 80143ce:	08dd      	bt      	0x8014588	// 8014588 <_vsnprintf+0x7f8>
 80143d0:	c4910020 	addu      	r0, r17, r4
 80143d4:	c460008a 	subu      	r10, r0, r3
 80143d8:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 80143da:	e5620000 	addi      	r11, r2, 1
 80143de:	6cdf      	mov      	r3, r7
 80143e0:	6c63      	mov      	r1, r8
 80143e2:	3020      	movi      	r0, 32
 80143e4:	7bd9      	jsr      	r6
          while (l++ < width) {
 80143e6:	66ea      	cmpne      	r10, r11
 80143e8:	6caf      	mov      	r2, r11
 80143ea:	0bf8      	bt      	0x80143da	// 80143da <_vsnprintf+0x64a>
        format++;
 80143ec:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80143ee:	9889      	ld.w      	r4, (r14, 0x24)
 80143f0:	e800fcdf 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 80143f4:	5c6e      	addi      	r3, r4, 4
 80143f6:	b869      	st.w      	r3, (r14, 0x24)
 80143f8:	da642000 	ld.w      	r19, (r4, 0x0)
 80143fc:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 80143fe:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8014402:	ea15002d 	movi      	r21, 45
 8014406:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 801440a:	d8730000 	ld.b      	r3, (r19, 0x0)
 801440e:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8014410:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8014414:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8014418:	089d      	bt      	0x8014552	// 8014552 <_vsnprintf+0x7c2>
        if (lbit > 9)
 801441a:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 801441e:	2036      	addi      	r0, 55
 8014420:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014422:	089d      	bt      	0x801455c	// 801455c <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8014424:	2336      	addi      	r3, 55
 8014426:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8014428:	dea20002 	st.b      	r21, (r2, 0x2)
 801442c:	e6730000 	addi      	r19, r19, 1
 8014430:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8014432:	e832ffec 	bnezad      	r18, 0x801440a	// 801440a <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 8014436:	3300      	movi      	r3, 0
 8014438:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 801443c:	e4612400 	andi      	r3, r1, 1024
 8014440:	b86a      	st.w      	r3, (r14, 0x28)
 8014442:	e90300f3 	bez      	r3, 0x8014628	// 8014628 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 8014446:	ea100011 	movi      	r16, 17
 801444a:	fa0acd23 	min.u32      	r3, r10, r16
 801444e:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014450:	e4612002 	andi      	r3, r1, 2
 8014454:	b86b      	st.w      	r3, (r14, 0x2c)
 8014456:	e92300e2 	bnez      	r3, 0x801461a	// 801461a <_vsnprintf+0x88a>
          while (l++ < width) {
 801445a:	9848      	ld.w      	r2, (r14, 0x20)
 801445c:	c6220420 	cmphs      	r2, r17
 8014460:	6ccb      	mov      	r3, r2
 8014462:	2300      	addi      	r3, 1
 8014464:	09c9      	bt      	0x80147f6	// 80147f6 <_vsnprintf+0xa66>
 8014466:	c5710023 	addu      	r3, r17, r11
 801446a:	c4430090 	subu      	r16, r3, r2
 801446e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014470:	e56b0000 	addi      	r11, r11, 1
 8014474:	6cdf      	mov      	r3, r7
 8014476:	6c63      	mov      	r1, r8
 8014478:	3020      	movi      	r0, 32
 801447a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801447c:	c60b0480 	cmpne      	r11, r16
 8014480:	6caf      	mov      	r2, r11
 8014482:	0bf7      	bt      	0x8014470	// 8014470 <_vsnprintf+0x6e0>
 8014484:	e4710000 	addi      	r3, r17, 1
 8014488:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801448a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801448e:	e900fded 	bez      	r0, 0x8014068	// 8014068 <_vsnprintf+0x2d8>
 8014492:	6caf      	mov      	r2, r11
 8014494:	1c0c      	addi      	r4, r14, 48
 8014496:	d96e200a 	ld.w      	r11, (r14, 0x28)
 801449a:	0403      	br      	0x80144a0	// 80144a0 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 801449c:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80144a0:	e90b0007 	bez      	r11, 0x80144ae	// 80144ae <_vsnprintf+0x71e>
 80144a4:	e46a1000 	subi      	r3, r10, 1
 80144a8:	e90a010a 	bez      	r10, 0x80146bc	// 80146bc <_vsnprintf+0x92c>
 80144ac:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 80144ae:	2400      	addi      	r4, 1
 80144b0:	6cdf      	mov      	r3, r7
 80144b2:	6c63      	mov      	r1, r8
 80144b4:	e6020000 	addi      	r16, r2, 1
 80144b8:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80144ba:	8400      	ld.b      	r0, (r4, 0x0)
 80144bc:	e920fff0 	bnez      	r0, 0x801449c	// 801449c <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 80144c0:	986b      	ld.w      	r3, (r14, 0x2c)
 80144c2:	e90300b6 	bez      	r3, 0x801462e	// 801462e <_vsnprintf+0x89e>
          while (l++ < width) {
 80144c6:	9868      	ld.w      	r3, (r14, 0x20)
 80144c8:	c6230420 	cmphs      	r3, r17
 80144cc:	08b1      	bt      	0x801462e	// 801462e <_vsnprintf+0x89e>
 80144ce:	c6110020 	addu      	r0, r17, r16
 80144d2:	588d      	subu      	r4, r0, r3
 80144d4:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 80144d8:	e5620000 	addi      	r11, r2, 1
 80144dc:	6cdf      	mov      	r3, r7
 80144de:	6c63      	mov      	r1, r8
 80144e0:	3020      	movi      	r0, 32
 80144e2:	7bd9      	jsr      	r6
          while (l++ < width) {
 80144e4:	652e      	cmpne      	r11, r4
 80144e6:	6caf      	mov      	r2, r11
 80144e8:	0bf8      	bt      	0x80144d8	// 80144d8 <_vsnprintf+0x748>
        format++;
 80144ea:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80144ec:	9889      	ld.w      	r4, (r14, 0x24)
 80144ee:	e800fc60 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 80144f2:	e46020df 	andi      	r3, r0, 223
 80144f6:	eb430047 	cmpnei      	r3, 71
 80144fa:	0805      	bt      	0x8014504	// 8014504 <_vsnprintf+0x774>
 80144fc:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8014500:	e40020fd 	andi      	r0, r0, 253
 8014504:	eb400045 	cmpnei      	r0, 69
 8014508:	0803      	bt      	0x801450e	// 801450e <_vsnprintf+0x77e>
 801450a:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801450e:	b824      	st.w      	r1, (r14, 0x10)
 8014510:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014514:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014518:	e6040007 	addi      	r16, r4, 8
 801451c:	9460      	ld.w      	r3, (r4, 0x0)
 801451e:	9481      	ld.w      	r4, (r4, 0x4)
 8014520:	b860      	st.w      	r3, (r14, 0x0)
 8014522:	b881      	st.w      	r4, (r14, 0x4)
 8014524:	6caf      	mov      	r2, r11
 8014526:	6cdf      	mov      	r3, r7
 8014528:	6c63      	mov      	r1, r8
 801452a:	6c1b      	mov      	r0, r6
 801452c:	e3fff9ec 	bsr      	0x8013904	// 8013904 <_etoa>
 8014530:	6ec3      	mov      	r11, r0
        format++;
 8014532:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014534:	c4104824 	lsli      	r4, r16, 0
        break;
 8014538:	e800fc3b 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 801453c:	1a0c      	addi      	r2, r14, 48
 801453e:	232f      	addi      	r3, 48
 8014540:	d6620023 	str.b      	r3, (r2, r19 << 0)
 8014544:	06e3      	br      	0x801430a	// 801430a <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 8014546:	e6ae002f 	addi      	r21, r14, 48
 801454a:	222f      	addi      	r2, 48
 801454c:	d4950022 	str.b      	r2, (r21, r4 << 0)
 8014550:	06d3      	br      	0x80142f6	// 80142f6 <_vsnprintf+0x566>
        if (lbit > 9)
 8014552:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 8014556:	202f      	addi      	r0, 48
 8014558:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 801455a:	0f65      	bf      	0x8014424	// 8014424 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 801455c:	232f      	addi      	r3, 48
 801455e:	a261      	st.b      	r3, (r2, 0x1)
 8014560:	0764      	br      	0x8014428	// 8014428 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 8014562:	c6828422 	mult      	r2, r2, r20
 8014566:	60ca      	subu      	r3, r2
 8014568:	74cc      	zextb      	r3, r3
 801456a:	c6638022 	divu      	r2, r3, r19
            if (m)
 801456e:	e902fd0c 	bez      	r2, 0x8013f86	// 8013f86 <_vsnprintf+0x1f6>
 8014572:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 8014574:	e5ae002f 	addi      	r13, r14, 48
 8014578:	e48c0000 	addi      	r4, r12, 1
 801457c:	222f      	addi      	r2, 48
 801457e:	7510      	zextb      	r4, r4
 8014580:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 8014584:	e800fd01 	br      	0x8013f86	// 8013f86 <_vsnprintf+0x1f6>
          while (l++ < width) {
 8014588:	6ed3      	mov      	r11, r4
        format++;
 801458a:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801458c:	9889      	ld.w      	r4, (r14, 0x24)
 801458e:	e800fc10 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
 8014592:	6caf      	mov      	r2, r11
 8014594:	e800fc81 	br      	0x8013e96	// 8013e96 <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8014598:	9400      	ld.w      	r0, (r4, 0x0)
 801459a:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 801459c:	e98000af 	blz      	r0, 0x80146fa	// 80146fa <_vsnprintf+0x96a>
        width = (unsigned int)w;
 80145a0:	c4004831 	lsli      	r17, r0, 0
 80145a4:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 80145a6:	6d0f      	mov      	r4, r3
      format++;
 80145a8:	5aa2      	addi      	r5, r2, 1
 80145aa:	e800fc38 	br      	0x8013e1a	// 8013e1a <_vsnprintf+0x8a>
 80145ae:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 80145b0:	ec2100c0 	ori      	r1, r1, 192
          format++;
 80145b4:	2501      	addi      	r5, 2
 80145b6:	e800fc47 	br      	0x8013e44	// 8013e44 <_vsnprintf+0xb4>
 80145ba:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 80145bc:	ec210300 	ori      	r1, r1, 768
          format++;
 80145c0:	2501      	addi      	r5, 2
 80145c2:	e800fc41 	br      	0x8013e44	// 8013e44 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80145c6:	e900fdb2 	bez      	r0, 0x801412a	// 801412a <_vsnprintf+0x39a>
 80145ca:	6caf      	mov      	r2, r11
 80145cc:	b88b      	st.w      	r4, (r14, 0x2c)
 80145ce:	d96e2009 	ld.w      	r11, (r14, 0x24)
 80145d2:	e800fd96 	br      	0x80140fe	// 80140fe <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80145d6:	6cdf      	mov      	r3, r7
 80145d8:	6caf      	mov      	r2, r11
 80145da:	6c63      	mov      	r1, r8
 80145dc:	8400      	ld.b      	r0, (r4, 0x0)
 80145de:	7bd9      	jsr      	r6
          while (l++ < width) {
 80145e0:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80145e4:	e6040003 	addi      	r16, r4, 4
 80145e8:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 80145ec:	0cfc      	bf      	0x80147e4	// 80147e4 <_vsnprintf+0xa54>
 80145ee:	c571002b 	addu      	r11, r17, r11
 80145f2:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 80145f4:	5a82      	addi      	r4, r2, 1
 80145f6:	6cdf      	mov      	r3, r7
 80145f8:	6c63      	mov      	r1, r8
 80145fa:	3020      	movi      	r0, 32
 80145fc:	7bd9      	jsr      	r6
          while (l++ < width) {
 80145fe:	652e      	cmpne      	r11, r4
 8014600:	6c93      	mov      	r2, r4
 8014602:	0bf9      	bt      	0x80145f4	// 80145f4 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014604:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014608:	2500      	addi      	r5, 1
 801460a:	e800fbd2 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801460e:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014612:	e920fec0 	bnez      	r0, 0x8014392	// 8014392 <_vsnprintf+0x602>
 8014616:	6d2f      	mov      	r4, r11
 8014618:	06d8      	br      	0x80143c8	// 80143c8 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801461a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801461e:	e920ff3a 	bnez      	r0, 0x8014492	// 8014492 <_vsnprintf+0x702>
 8014622:	c40b4830 	lsli      	r16, r11, 0
 8014626:	0750      	br      	0x80144c6	// 80144c6 <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8014628:	3311      	movi      	r3, 17
 801462a:	b868      	st.w      	r3, (r14, 0x20)
 801462c:	0712      	br      	0x8014450	// 8014450 <_vsnprintf+0x6c0>
          while (l++ < width) {
 801462e:	c410482b 	lsli      	r11, r16, 0
        format++;
 8014632:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014634:	9889      	ld.w      	r4, (r14, 0x24)
 8014636:	e800fbbc 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801463a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801463e:	e920fce7 	bnez      	r0, 0x801400c	// 801400c <_vsnprintf+0x27c>
 8014642:	6d2f      	mov      	r4, r11
 8014644:	e800fcff 	br      	0x8014042	// 8014042 <_vsnprintf+0x2b2>
          base =  8U;
 8014648:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 801464a:	c4412823 	bclri      	r3, r1, 2
 801464e:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8014650:	e4212400 	andi      	r1, r1, 1024
 8014654:	e901fdda 	bez      	r1, 0x8014208	// 8014208 <_vsnprintf+0x478>
 8014658:	e800fdd7 	br      	0x8014206	// 8014206 <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 801465c:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014660:	6c4f      	mov      	r1, r3
          base = 10U;
 8014662:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 8014664:	0bf3      	bt      	0x801464a	// 801464a <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 8014666:	e4232400 	andi      	r1, r3, 1024
 801466a:	e921fdce 	bnez      	r1, 0x8014206	// 8014206 <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 801466e:	e4232200 	andi      	r1, r3, 512
 8014672:	e9210066 	bnez      	r1, 0x801473e	// 801473e <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 8014676:	e4032100 	andi      	r0, r3, 256
 801467a:	e9200099 	bnez      	r0, 0x80147ac	// 80147ac <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801467e:	e4232040 	andi      	r1, r3, 64
 8014682:	e92100a8 	bnez      	r1, 0x80147d2	// 80147d2 <_vsnprintf+0xa42>
 8014686:	e4232080 	andi      	r1, r3, 128
 801468a:	e921008c 	bnez      	r1, 0x80147a2	// 80147a2 <_vsnprintf+0xa12>
 801468e:	9420      	ld.w      	r1, (r4, 0x0)
 8014690:	491f      	lsri      	r0, r1, 31
 8014692:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014694:	b865      	st.w      	r3, (r14, 0x14)
 8014696:	de2e2004 	st.w      	r17, (r14, 0x10)
 801469a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801469e:	b842      	st.w      	r2, (r14, 0x8)
 80146a0:	b801      	st.w      	r0, (r14, 0x4)
 80146a2:	c4010201 	abs      	r1, r1
 80146a6:	e800fdd3 	br      	0x801424c	// 801424c <_vsnprintf+0x4bc>
 80146aa:	988b      	ld.w      	r4, (r14, 0x2c)
 80146ac:	6ecb      	mov      	r11, r2
 80146ae:	e800fd3b 	br      	0x8014124	// 8014124 <_vsnprintf+0x394>
 80146b2:	6d0b      	mov      	r4, r2
 80146b4:	0687      	br      	0x80143c2	// 80143c2 <_vsnprintf+0x632>
 80146b6:	6d0b      	mov      	r4, r2
 80146b8:	e800fcc2 	br      	0x801403c	// 801403c <_vsnprintf+0x2ac>
 80146bc:	c4024830 	lsli      	r16, r2, 0
 80146c0:	0700      	br      	0x80144c0	// 80144c0 <_vsnprintf+0x730>
          base = 16U;
 80146c2:	3210      	movi      	r2, 16
 80146c4:	07c3      	br      	0x801464a	// 801464a <_vsnprintf+0x8ba>
 80146c6:	c4412823 	bclri      	r3, r1, 2
 80146ca:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80146cc:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80146d0:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 80146d4:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 80146d6:	e921fd98 	bnez      	r1, 0x8014206	// 8014206 <_vsnprintf+0x476>
 80146da:	e800fd9f 	br      	0x8014218	// 8014218 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80146de:	ec210020 	ori      	r1, r1, 32
 80146e2:	e800fdc4 	br      	0x801426a	// 801426a <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 80146e6:	d9a42000 	ld.w      	r13, (r4, 0x0)
 80146ea:	3300      	movi      	r3, 0
 80146ec:	8502      	ld.b      	r0, (r5, 0x2)
 80146ee:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 80146f2:	2403      	addi      	r4, 4
        format++;
 80146f4:	2501      	addi      	r5, 2
 80146f6:	e800fb97 	br      	0x8013e24	// 8013e24 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 80146fa:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 80146fe:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 8014702:	c40c0091 	subu      	r17, r12, r0
 8014706:	074f      	br      	0x80145a4	// 80145a4 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8014708:	b867      	st.w      	r3, (r14, 0x1c)
 801470a:	3300      	movi      	r3, 0
 801470c:	de2e2006 	st.w      	r17, (r14, 0x18)
 8014710:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8014714:	b843      	st.w      	r2, (r14, 0xc)
 8014716:	b864      	st.w      	r3, (r14, 0x10)
 8014718:	b862      	st.w      	r3, (r14, 0x8)
 801471a:	e6040007 	addi      	r16, r4, 8
 801471e:	9460      	ld.w      	r3, (r4, 0x0)
 8014720:	9481      	ld.w      	r4, (r4, 0x4)
 8014722:	b860      	st.w      	r3, (r14, 0x0)
 8014724:	b881      	st.w      	r4, (r14, 0x4)
 8014726:	6caf      	mov      	r2, r11
 8014728:	6cdf      	mov      	r3, r7
 801472a:	6c63      	mov      	r1, r8
 801472c:	6c1b      	mov      	r0, r6
 801472e:	e3fff633 	bsr      	0x8013394	// 8013394 <_ntoa_long_long>
 8014732:	6ec3      	mov      	r11, r0
 8014734:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014738:	2500      	addi      	r5, 1
 801473a:	e800fb3a 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 801473e:	9421      	ld.w      	r1, (r4, 0x4)
 8014740:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014742:	b867      	st.w      	r3, (r14, 0x1c)
 8014744:	3300      	movi      	r3, 0
 8014746:	b864      	st.w      	r3, (r14, 0x10)
 8014748:	497f      	lsri      	r3, r1, 31
 801474a:	b843      	st.w      	r2, (r14, 0xc)
 801474c:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 801474e:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014752:	de2e2006 	st.w      	r17, (r14, 0x18)
 8014756:	dd4e2005 	st.w      	r10, (r14, 0x14)
 801475a:	6c83      	mov      	r2, r0
 801475c:	6cc7      	mov      	r3, r1
 801475e:	e9810053 	blz      	r1, 0x8014804	// 8014804 <_vsnprintf+0xa74>
 8014762:	b840      	st.w      	r2, (r14, 0x0)
 8014764:	b861      	st.w      	r3, (r14, 0x4)
 8014766:	07e0      	br      	0x8014726	// 8014726 <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 8014768:	b865      	st.w      	r3, (r14, 0x14)
 801476a:	de2e2004 	st.w      	r17, (r14, 0x10)
 801476e:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014772:	b842      	st.w      	r2, (r14, 0x8)
 8014774:	b821      	st.w      	r1, (r14, 0x4)
 8014776:	9460      	ld.w      	r3, (r4, 0x0)
 8014778:	e6040003 	addi      	r16, r4, 4
 801477c:	b860      	st.w      	r3, (r14, 0x0)
 801477e:	6caf      	mov      	r2, r11
 8014780:	6cdf      	mov      	r3, r7
 8014782:	6c63      	mov      	r1, r8
 8014784:	6c1b      	mov      	r0, r6
 8014786:	e3fff5a7 	bsr      	0x80132d4	// 80132d4 <_ntoa_long>
 801478a:	6ec3      	mov      	r11, r0
 801478c:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014790:	2500      	addi      	r5, 1
 8014792:	e800fb0e 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
          base =  2U;
 8014796:	3202      	movi      	r2, 2
 8014798:	0759      	br      	0x801464a	// 801464a <_vsnprintf+0x8ba>
 801479a:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 801479c:	2403      	addi      	r4, 4
 801479e:	e800fd4f 	br      	0x801423c	// 801423c <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80147a2:	d8245000 	ld.hs      	r1, (r4, 0x0)
 80147a6:	491f      	lsri      	r0, r1, 31
 80147a8:	2403      	addi      	r4, 4
 80147aa:	0775      	br      	0x8014694	// 8014694 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 80147ac:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80147ae:	b865      	st.w      	r3, (r14, 0x14)
 80147b0:	497f      	lsri      	r3, r1, 31
 80147b2:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 80147b6:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80147ba:	de2e2004 	st.w      	r17, (r14, 0x10)
 80147be:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80147c2:	b842      	st.w      	r2, (r14, 0x8)
 80147c4:	b861      	st.w      	r3, (r14, 0x4)
 80147c6:	b820      	st.w      	r1, (r14, 0x0)
 80147c8:	07db      	br      	0x801477e	// 801477e <_vsnprintf+0x9ee>
 80147ca:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80147cc:	2403      	addi      	r4, 4
 80147ce:	e800fd37 	br      	0x801423c	// 801423c <_vsnprintf+0x4ac>
 80147d2:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80147d4:	2403      	addi      	r4, 4
 80147d6:	075f      	br      	0x8014694	// 8014694 <_vsnprintf+0x904>
          while (l++ < width) {
 80147d8:	b868      	st.w      	r3, (r14, 0x20)
 80147da:	e800fdd8 	br      	0x801438a	// 801438a <_vsnprintf+0x5fa>
          while (l++ < width) {
 80147de:	b868      	st.w      	r3, (r14, 0x20)
 80147e0:	e800fc12 	br      	0x8014004	// 8014004 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80147e4:	c4104824 	lsli      	r4, r16, 0
 80147e8:	6eeb      	mov      	r11, r10
        format++;
 80147ea:	2500      	addi      	r5, 1
 80147ec:	e800fae1 	br      	0x8013dae	// 8013dae <_vsnprintf+0x1e>
          while (l++ < width) {
 80147f0:	6eaf      	mov      	r10, r11
 80147f2:	e800fce1 	br      	0x80141b4	// 80141b4 <_vsnprintf+0x424>
          while (l++ < width) {
 80147f6:	b868      	st.w      	r3, (r14, 0x20)
 80147f8:	0649      	br      	0x801448a	// 801448a <_vsnprintf+0x6fa>
          while (l++ < width) {
 80147fa:	6d0f      	mov      	r4, r3
 80147fc:	c40b4832 	lsli      	r18, r11, 0
 8014800:	e800fc76 	br      	0x80140ec	// 80140ec <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014804:	3000      	movi      	r0, 0
 8014806:	3100      	movi      	r1, 0
 8014808:	f840c462 	sub.64      	r2, r0, r2
 801480c:	07ab      	br      	0x8014762	// 8014762 <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801480e:	c412482b 	lsli      	r11, r18, 0
 8014812:	e800fc9c 	br      	0x801414a	// 801414a <_vsnprintf+0x3ba>
	...

08014818 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8014818:	1046      	lrw      	r2, 0x40010600	// 8014830 <fputc+0x18>
 801481a:	9267      	ld.w      	r3, (r2, 0x1c)
 801481c:	e463203f 	andi      	r3, r3, 63
 8014820:	3b1f      	cmphsi      	r3, 32
 8014822:	0bfc      	bt      	0x801481a	// 801481a <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8014824:	e40020ff 	andi      	r0, r0, 255
 8014828:	b208      	st.w      	r0, (r2, 0x20)
}
 801482a:	3000      	movi      	r0, 0
 801482c:	783c      	jmp      	r15
 801482e:	0000      	.short	0x0000
 8014830:	40010600 	.long	0x40010600

08014834 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 8014834:	1424      	subi      	r14, r14, 16
 8014836:	b863      	st.w      	r3, (r14, 0xc)
 8014838:	b842      	st.w      	r2, (r14, 0x8)
 801483a:	b821      	st.w      	r1, (r14, 0x4)
 801483c:	b800      	st.w      	r0, (r14, 0x0)
 801483e:	14d0      	push      	r15
 8014840:	1421      	subi      	r14, r14, 4
 8014842:	9862      	ld.w      	r3, (r14, 0x8)
 8014844:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 8014846:	1b03      	addi      	r3, r14, 12
 8014848:	b860      	st.w      	r3, (r14, 0x0)
 801484a:	6ccb      	mov      	r3, r2
 801484c:	3200      	movi      	r2, 0
 801484e:	2a00      	subi      	r2, 1
 8014850:	6c4f      	mov      	r1, r3
 8014852:	1005      	lrw      	r0, 0x8013038	// 8014864 <wm_printf+0x30>
 8014854:	e3fffa9e 	bsr      	0x8013d90	// 8013d90 <_vsnprintf>
	va_end(args);

	return length;
}
 8014858:	1401      	addi      	r14, r14, 4
 801485a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801485e:	1405      	addi      	r14, r14, 20
 8014860:	783c      	jmp      	r15
 8014862:	0000      	.short	0x0000
 8014864:	08013038 	.long	0x08013038

08014868 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 8014868:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 801486a:	1160      	lrw      	r3, 0x20001854	// 80148e8 <vTaskSwitchContext+0x80>
 801486c:	9360      	ld.w      	r3, (r3, 0x0)
 801486e:	e9230034 	bnez      	r3, 0x80148d6	// 80148d6 <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 8014872:	105f      	lrw      	r2, 0x2000185c	// 80148ec <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8014874:	ea8d001f 	lrw      	r13, 0x20001858	// 80148f0 <vTaskSwitchContext+0x88>
 8014878:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 801487a:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 801487c:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8014880:	c4238420 	mult      	r0, r3, r1
 8014884:	105c      	lrw      	r2, 0x20001368	// 80148f4 <vTaskSwitchContext+0x8c>
 8014886:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 801488a:	e900000a 	bez      	r0, 0x801489e	// 801489e <vTaskSwitchContext+0x36>
 801488e:	0411      	br      	0x80148b0	// 80148b0 <vTaskSwitchContext+0x48>
 8014890:	2b00      	subi      	r3, 1
 8014892:	c4238420 	mult      	r0, r3, r1
 8014896:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 801489a:	e920000b 	bnez      	r0, 0x80148b0	// 80148b0 <vTaskSwitchContext+0x48>
 801489e:	e923fff9 	bnez      	r3, 0x8014890	// 8014890 <vTaskSwitchContext+0x28>
 80148a2:	ea020be7 	movi      	r2, 3047
 80148a6:	1035      	lrw      	r1, 0x8014cdc	// 80148f8 <vTaskSwitchContext+0x90>
 80148a8:	1015      	lrw      	r0, 0x8014d18	// 80148fc <vTaskSwitchContext+0x94>
 80148aa:	e3ffffc5 	bsr      	0x8014834	// 8014834 <wm_printf>
 80148ae:	0400      	br      	0x80148ae	// 80148ae <vTaskSwitchContext+0x46>
 80148b0:	3014      	movi      	r0, 20
 80148b2:	7c0c      	mult      	r0, r3
 80148b4:	c402002c 	addu      	r12, r2, r0
 80148b8:	2007      	addi      	r0, 8
 80148ba:	d82c2001 	ld.w      	r1, (r12, 0x4)
 80148be:	6080      	addu      	r2, r0
 80148c0:	9121      	ld.w      	r1, (r1, 0x4)
 80148c2:	6486      	cmpne      	r1, r2
 80148c4:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80148c8:	0c0b      	bf      	0x80148de	// 80148de <vTaskSwitchContext+0x76>
 80148ca:	104e      	lrw      	r2, 0x20001364	// 8014900 <vTaskSwitchContext+0x98>
 80148cc:	9123      	ld.w      	r1, (r1, 0xc)
 80148ce:	b220      	st.w      	r1, (r2, 0x0)
 80148d0:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 80148d4:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 80148d6:	1066      	lrw      	r3, 0x2000185c	// 80148ec <vTaskSwitchContext+0x84>
 80148d8:	3201      	movi      	r2, 1
 80148da:	b340      	st.w      	r2, (r3, 0x0)
}
 80148dc:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80148de:	9121      	ld.w      	r1, (r1, 0x4)
 80148e0:	dc2c2001 	st.w      	r1, (r12, 0x4)
 80148e4:	07f3      	br      	0x80148ca	// 80148ca <vTaskSwitchContext+0x62>
 80148e6:	0000      	.short	0x0000
 80148e8:	20001854 	.long	0x20001854
 80148ec:	2000185c 	.long	0x2000185c
 80148f0:	20001858 	.long	0x20001858
 80148f4:	20001368 	.long	0x20001368
 80148f8:	08014cdc 	.long	0x08014cdc
 80148fc:	08014d18 	.long	0x08014d18
 8014900:	20001364 	.long	0x20001364
	...
