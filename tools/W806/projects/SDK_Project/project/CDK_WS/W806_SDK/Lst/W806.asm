
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
 8010490:	ec 27 01 08 20 28 01 08 d0 05 01 08 d0 05 01 08     .'.. (..........
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104b0:	b8 27 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     .'..............
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 84 27 01 08 d0 05 01 08 d0 05 01 08     .....'..........
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
 8010524:	1035      	lrw      	r1, 0x8014cbc	// 8010578 <__exit+0x18>
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
 8010554:	e00014c8 	bsr      	0x8012ee4	// 8012ee4 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e000151c 	bsr      	0x8012f90	// 8012f90 <board_init>
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
 8010578:	08014cbc 	.long	0x08014cbc
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
 80105cc:	e00014a4 	bsr      	0x8012f14	// 8012f14 <trap_c>

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
 8010642:	e00020d7 	bsr      	0x80147f0	// 80147f0 <vTaskSwitchContext>

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
 80106da:	01dc      	lrw      	r6, 0x80148a4	// 80109e4 <__udivdi3+0x330>
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
 8010782:	0386      	lrw      	r4, 0x80148a4	// 80109e4 <__udivdi3+0x330>
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
 80107c4:	0357      	lrw      	r2, 0x80148a4	// 80109e4 <__udivdi3+0x330>
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
 80109e4:	080148a4 	.long	0x080148a4

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
 8010a10:	0281      	lrw      	r4, 0x80148a4	// 8010d08 <__umoddi3+0x320>
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
 8010aa0:	03a5      	lrw      	r5, 0x80148a4	// 8010d08 <__umoddi3+0x320>
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
 8010aee:	0358      	lrw      	r2, 0x80148a4	// 8010d08 <__umoddi3+0x320>
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
 8010d08:	080148a4 	.long	0x080148a4

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
 8010f0c:	124b      	lrw      	r2, 0x8014890	// 8011038 <__subdf3+0x38>
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
 8011038:	08014890 	.long	0x08014890

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
 80111fe:	100f      	lrw      	r0, 0x8014890	// 8011238 <__muldf3+0x1fc>
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
 8011238:	08014890 	.long	0x08014890

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
 801130c:	1011      	lrw      	r0, 0x8014890	// 8011350 <__divdf3+0x114>
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
 8011350:	08014890 	.long	0x08014890

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
 8011916:	e0001745 	bsr      	0x80147a0	// 80147a0 <fputc>
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
 801194e:	e0001729 	bsr      	0x80147a0	// 80147a0 <fputc>
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
 801197e:	e0001711 	bsr      	0x80147a0	// 80147a0 <fputc>
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
 8011992:	ea96001f 	lrw      	r22, 0x80149a4	// 8011a0c <HAL_GPIO_Init+0x88>
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
 8011a0c:	080149a4 	.long	0x080149a4
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
 8011d5a:	e000049f 	bsr      	0x8012698	// 8012698 <HAL_SPI_MspInit>
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
 80121a4:	e000026c 	bsr      	0x801267c	// 801267c <HAL_SPI_RxCpltCallback>
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
 80121b6:	e0000257 	bsr      	0x8012664	// 8012664 <HAL_SPI_TxCpltCallback>
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
 801250c:	14d3      	push      	r4-r6, r15
 801250e:	1421      	subi      	r14, r14, 4

	
	SystemClock_Config(CPU_CLK_240M);
 8012510:	3002      	movi      	r0, 2
 8012512:	e3fffb5f 	bsr      	0x8011bd0	// 8011bd0 <SystemClock_Config>
	printf("enter main\r\n");
 8012516:	1211      	lrw      	r0, 0x80149d0	// 8012658 <main+0x14c>
 8012518:	e3fff9f8 	bsr      	0x8011908	// 8011908 <__GI_puts>
	LCD_GPIO_Init();
 801251c:	e000019c 	bsr      	0x8012854	// 8012854 <LCD_GPIO_Init>
	}
}

static void DMA_Init(void)
{
	__HAL_RCC_DMA_CLK_ENABLE();
 8012520:	ea224000 	movih      	r2, 16384
 8012524:	e4420dff 	addi      	r2, r2, 3584
 8012528:	3500      	movi      	r5, 0
 801252a:	9260      	ld.w      	r3, (r2, 0x0)
 801252c:	ec630100 	ori      	r3, r3, 256
 8012530:	b260      	st.w      	r3, (r2, 0x0)
	
	HAL_NVIC_SetPriority(DMA_Channel0_IRQn, 0);
 8012532:	6c57      	mov      	r1, r5
 8012534:	3004      	movi      	r0, 4
 8012536:	e3fffb97 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(DMA_Channel0_IRQn);
 801253a:	3004      	movi      	r0, 4
 801253c:	e3fffbae 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
	
	HAL_NVIC_SetPriority(DMA_Channel1_IRQn, 0);
 8012540:	6c57      	mov      	r1, r5
 8012542:	3005      	movi      	r0, 5
	hspi.Instance = SPI;
 8012544:	1286      	lrw      	r4, 0x20001900	// 801265c <main+0x150>
	HAL_NVIC_SetPriority(DMA_Channel1_IRQn, 0);
 8012546:	e3fffb8f 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(DMA_Channel1_IRQn);
 801254a:	3005      	movi      	r0, 5
 801254c:	e3fffba6 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
	hspi.Instance = SPI;
 8012550:	ea234001 	movih      	r3, 16385
 8012554:	3baa      	bseti      	r3, 10
 8012556:	b460      	st.w      	r3, (r4, 0x0)
	hspi.Init.Mode = SPI_MODE_MASTER;
 8012558:	3304      	movi      	r3, 4
 801255a:	b461      	st.w      	r3, (r4, 0x4)
	if (HAL_SPI_Init(&hspi) != HAL_OK)
 801255c:	6c13      	mov      	r0, r4
	hspi.Init.NSS = SPI_NSS_SOFT;
 801255e:	3302      	movi      	r3, 2
	hspi.Init.CLKPolarity = SPI_POLARITY_LOW;
 8012560:	b4a2      	st.w      	r5, (r4, 0x8)
	hspi.Init.CLKPhase = SPI_PHASE_1EDGE;
 8012562:	b4a3      	st.w      	r5, (r4, 0xc)
	hspi.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
 8012564:	b4a5      	st.w      	r5, (r4, 0x14)
	hspi.Init.FirstByte = SPI_LITTLEENDIAN;
 8012566:	b4a6      	st.w      	r5, (r4, 0x18)
	hspi.Init.NSS = SPI_NSS_SOFT;
 8012568:	b464      	st.w      	r3, (r4, 0x10)
	if (HAL_SPI_Init(&hspi) != HAL_OK)
 801256a:	e3fffbd3 	bsr      	0x8011d10	// 8011d10 <HAL_SPI_Init>
 801256e:	6d43      	mov      	r5, r0
 8012570:	e9000003 	bez      	r0, 0x8012576	// 8012576 <main+0x6a>
 8012574:	0400      	br      	0x8012574	// 8012574 <main+0x68>
	__HAL_SPI_SET_CS_LOW(&hspi);
 8012576:	9440      	ld.w      	r2, (r4, 0x0)
		printf("time %dms \r\n",end - start);
 8012578:	11da      	lrw      	r6, 0x80149dc	// 8012660 <main+0x154>
	__HAL_SPI_SET_CS_LOW(&hspi);
 801257a:	9260      	ld.w      	r3, (r2, 0x0)
 801257c:	3b82      	bclri      	r3, 2
 801257e:	b260      	st.w      	r3, (r2, 0x0)
	LCD_Init();//LCD初始化
 8012580:	e00001fc 	bsr      	0x8012978	// 8012978 <LCD_Init>
		uint32_t start = HAL_GetTick();
 8012584:	e3fffb5e 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
		LCD_Fill(0,0,LCD_W,LCD_H,WHITE);
 8012588:	3100      	movi      	r1, 0
 801258a:	ea03ffff 	movi      	r3, 65535
 801258e:	b860      	st.w      	r3, (r14, 0x0)
 8012590:	3280      	movi      	r2, 128
 8012592:	33a0      	movi      	r3, 160
		uint32_t start = HAL_GetTick();
 8012594:	6d03      	mov      	r4, r0
		LCD_Fill(0,0,LCD_W,LCD_H,WHITE);
 8012596:	6c07      	mov      	r0, r1
 8012598:	e0000488 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		uint32_t end = HAL_GetTick();
 801259c:	e3fffb52 	bsr      	0x8011c40	// 8011c40 <HAL_GetTick>
		printf("time %dms \r\n",end - start);
 80125a0:	5831      	subu      	r1, r0, r4
 80125a2:	6c1b      	mov      	r0, r6
 80125a4:	e000110c 	bsr      	0x80147bc	// 80147bc <wm_printf>
		LCD_Fill(0,0,LCD_W,LCD_H,BLACK);
 80125a8:	3100      	movi      	r1, 0
 80125aa:	6c07      	mov      	r0, r1
 80125ac:	33a0      	movi      	r3, 160
 80125ae:	3280      	movi      	r2, 128
 80125b0:	b8a0      	st.w      	r5, (r14, 0x0)
 80125b2:	e000047b 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 80125b6:	ea0003e8 	movi      	r0, 1000
 80125ba:	e3fffb49 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,BLUE);
 80125be:	3100      	movi      	r1, 0
 80125c0:	331f      	movi      	r3, 31
 80125c2:	6c07      	mov      	r0, r1
 80125c4:	b860      	st.w      	r3, (r14, 0x0)
 80125c6:	3280      	movi      	r2, 128
 80125c8:	33a0      	movi      	r3, 160
 80125ca:	e000046f 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 80125ce:	ea0003e8 	movi      	r0, 1000
 80125d2:	e3fffb3d 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,BRED);
 80125d6:	ea04f81f 	movi      	r4, 63519
 80125da:	3100      	movi      	r1, 0
 80125dc:	6c07      	mov      	r0, r1
 80125de:	33a0      	movi      	r3, 160
 80125e0:	3280      	movi      	r2, 128
 80125e2:	b880      	st.w      	r4, (r14, 0x0)
 80125e4:	e0000462 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 80125e8:	ea0003e8 	movi      	r0, 1000
 80125ec:	e3fffb30 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,GRED);
 80125f0:	3100      	movi      	r1, 0
 80125f2:	ea03ffe0 	movi      	r3, 65504
 80125f6:	6c07      	mov      	r0, r1
 80125f8:	b860      	st.w      	r3, (r14, 0x0)
 80125fa:	3280      	movi      	r2, 128
 80125fc:	33a0      	movi      	r3, 160
 80125fe:	e0000455 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 8012602:	ea0003e8 	movi      	r0, 1000
 8012606:	e3fffb23 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,GBLUE);
 801260a:	3100      	movi      	r1, 0
 801260c:	ea0307ff 	movi      	r3, 2047
 8012610:	6c07      	mov      	r0, r1
 8012612:	b860      	st.w      	r3, (r14, 0x0)
 8012614:	3280      	movi      	r2, 128
 8012616:	33a0      	movi      	r3, 160
 8012618:	e0000448 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 801261c:	ea0003e8 	movi      	r0, 1000
 8012620:	e3fffb16 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,MAGENTA);
 8012624:	3100      	movi      	r1, 0
 8012626:	6c07      	mov      	r0, r1
 8012628:	33a0      	movi      	r3, 160
 801262a:	3280      	movi      	r2, 128
 801262c:	b880      	st.w      	r4, (r14, 0x0)
 801262e:	e000043d 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 8012632:	ea0003e8 	movi      	r0, 1000
 8012636:	e3fffb0b 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
		LCD_Fill(0,0,LCD_W,LCD_H,GREEN);
 801263a:	3100      	movi      	r1, 0
 801263c:	ea0307e0 	movi      	r3, 2016
 8012640:	b860      	st.w      	r3, (r14, 0x0)
 8012642:	6c07      	mov      	r0, r1
 8012644:	33a0      	movi      	r3, 160
 8012646:	3280      	movi      	r2, 128
 8012648:	e0000430 	bsr      	0x8012ea8	// 8012ea8 <LCD_Fill>
		HAL_Delay(1000);
 801264c:	ea0003e8 	movi      	r0, 1000
 8012650:	e3fffafe 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
 8012654:	0798      	br      	0x8012584	// 8012584 <main+0x78>
 8012656:	0000      	.short	0x0000
 8012658:	080149d0 	.long	0x080149d0
 801265c:	20001900 	.long	0x20001900
 8012660:	080149dc 	.long	0x080149dc

08012664 <HAL_SPI_TxCpltCallback>:
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
 8012664:	14d0      	push      	r15
	__HAL_SPI_SET_CS_HIGH(hspi);
 8012666:	9040      	ld.w      	r2, (r0, 0x0)
	printf("tx cplt\r\n");
 8012668:	1004      	lrw      	r0, 0x80149c4	// 8012678 <HAL_SPI_TxCpltCallback+0x14>
	__HAL_SPI_SET_CS_HIGH(hspi);
 801266a:	9260      	ld.w      	r3, (r2, 0x0)
 801266c:	ec630004 	ori      	r3, r3, 4
 8012670:	b260      	st.w      	r3, (r2, 0x0)
	printf("tx cplt\r\n");
 8012672:	e3fff94b 	bsr      	0x8011908	// 8011908 <__GI_puts>
}
 8012676:	1490      	pop      	r15
 8012678:	080149c4 	.long	0x080149c4

0801267c <HAL_SPI_RxCpltCallback>:

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi)
{
 801267c:	14d0      	push      	r15
	__HAL_SPI_SET_CS_HIGH(hspi);
 801267e:	9040      	ld.w      	r2, (r0, 0x0)
	printf("rx cplt\r\n");
 8012680:	1004      	lrw      	r0, 0x80149b8	// 8012690 <HAL_SPI_RxCpltCallback+0x14>
	__HAL_SPI_SET_CS_HIGH(hspi);
 8012682:	9260      	ld.w      	r3, (r2, 0x0)
 8012684:	ec630004 	ori      	r3, r3, 4
 8012688:	b260      	st.w      	r3, (r2, 0x0)
	printf("rx cplt\r\n");
 801268a:	e3fff93f 	bsr      	0x8011908	// 8011908 <__GI_puts>
}
 801268e:	1490      	pop      	r15
 8012690:	080149b8 	.long	0x080149b8

08012694 <Error_Handler>:

void Error_Handler(void)
{
 8012694:	0400      	br      	0x8012694	// 8012694 <Error_Handler>
	...

08012698 <HAL_SPI_MspInit>:
{

}

void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{
 8012698:	14d1      	push      	r4, r15
	__HAL_RCC_SPI_CLK_ENABLE();
 801269a:	ea224000 	movih      	r2, 16384
 801269e:	e4420dff 	addi      	r2, r2, 3584
{
 80126a2:	6d03      	mov      	r4, r0
	__HAL_RCC_SPI_CLK_ENABLE();
 80126a4:	9260      	ld.w      	r3, (r2, 0x0)
 80126a6:	ec630080 	ori      	r3, r3, 128
 80126aa:	b260      	st.w      	r3, (r2, 0x0)
	__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4);
 80126ac:	1173      	lrw      	r3, 0x40011400	// 8012778 <HAL_SPI_MspInit+0xe0>
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, GPIO_PIN_2);
	__HAL_AFIO_REMAP_SPI_MISO(GPIOB, GPIO_PIN_3);
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, GPIO_PIN_5);
	
	hdma_spi_tx.Instance = DMA_Channel0;
 80126ae:	1114      	lrw      	r0, 0x200018b4	// 801277c <HAL_SPI_MspInit+0xe4>
	__HAL_RCC_SPI_CLK_ENABLE();
 80126b0:	3100      	movi      	r1, 0
	__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4);
 80126b2:	9344      	ld.w      	r2, (r3, 0x10)
 80126b4:	ec420010 	ori      	r2, r2, 16
 80126b8:	b344      	st.w      	r2, (r3, 0x10)
 80126ba:	9345      	ld.w      	r2, (r3, 0x14)
 80126bc:	3a84      	bclri      	r2, 4
 80126be:	b345      	st.w      	r2, (r3, 0x14)
 80126c0:	9346      	ld.w      	r2, (r3, 0x18)
 80126c2:	3a84      	bclri      	r2, 4
 80126c4:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, GPIO_PIN_2);
 80126c6:	9344      	ld.w      	r2, (r3, 0x10)
 80126c8:	ec420004 	ori      	r2, r2, 4
 80126cc:	b344      	st.w      	r2, (r3, 0x10)
 80126ce:	9345      	ld.w      	r2, (r3, 0x14)
 80126d0:	3a82      	bclri      	r2, 2
 80126d2:	b345      	st.w      	r2, (r3, 0x14)
 80126d4:	9346      	ld.w      	r2, (r3, 0x18)
 80126d6:	ec420004 	ori      	r2, r2, 4
 80126da:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_MISO(GPIOB, GPIO_PIN_3);
 80126dc:	9344      	ld.w      	r2, (r3, 0x10)
 80126de:	ec420008 	ori      	r2, r2, 8
 80126e2:	b344      	st.w      	r2, (r3, 0x10)
 80126e4:	9345      	ld.w      	r2, (r3, 0x14)
 80126e6:	3a83      	bclri      	r2, 3
 80126e8:	b345      	st.w      	r2, (r3, 0x14)
 80126ea:	9346      	ld.w      	r2, (r3, 0x18)
 80126ec:	ec420008 	ori      	r2, r2, 8
 80126f0:	b346      	st.w      	r2, (r3, 0x18)
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, GPIO_PIN_5);
 80126f2:	9344      	ld.w      	r2, (r3, 0x10)
 80126f4:	ec420020 	ori      	r2, r2, 32
 80126f8:	b344      	st.w      	r2, (r3, 0x10)
 80126fa:	9345      	ld.w      	r2, (r3, 0x14)
 80126fc:	3a85      	bclri      	r2, 5
 80126fe:	b345      	st.w      	r2, (r3, 0x14)
 8012700:	9346      	ld.w      	r2, (r3, 0x18)
 8012702:	3a85      	bclri      	r2, 5
 8012704:	b346      	st.w      	r2, (r3, 0x18)
	hdma_spi_tx.Instance = DMA_Channel0;
 8012706:	ea234000 	movih      	r3, 16384
 801270a:	e463080f 	addi      	r3, r3, 2064
 801270e:	b060      	st.w      	r3, (r0, 0x0)
	hdma_spi_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;
 8012710:	3301      	movi      	r3, 1
 8012712:	b061      	st.w      	r3, (r0, 0x4)
	hdma_spi_tx.Init.DestInc = DMA_DINC_DISABLE;
	hdma_spi_tx.Init.SrcInc = DMA_SINC_ENABLE;
 8012714:	3302      	movi      	r3, 2
 8012716:	b063      	st.w      	r3, (r0, 0xc)
	hdma_spi_tx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 8012718:	3320      	movi      	r3, 32
 801271a:	b064      	st.w      	r3, (r0, 0x10)
	hdma_spi_tx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
	hdma_spi_tx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_TX;
 801271c:	3314      	movi      	r3, 20
	hdma_spi_tx.Init.DestInc = DMA_DINC_DISABLE;
 801271e:	b022      	st.w      	r1, (r0, 0x8)
	hdma_spi_tx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
 8012720:	b025      	st.w      	r1, (r0, 0x14)
	hdma_spi_tx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_TX;
 8012722:	b066      	st.w      	r3, (r0, 0x18)
	
	
	
	__HAL_LINKDMA(hspi, hdmatx, hdma_spi_tx);
 8012724:	b40d      	st.w      	r0, (r4, 0x34)
 8012726:	b08a      	st.w      	r4, (r0, 0x28)
	if (HAL_DMA_Init(&hdma_spi_tx) != HAL_OK)
 8012728:	e3fffdde 	bsr      	0x80122e4	// 80122e4 <HAL_DMA_Init>
 801272c:	e9200023 	bnez      	r0, 0x8012772	// 8012772 <HAL_SPI_MspInit+0xda>
	{
		Error_Handler();
	}
	
	hdma_spi_rx.Instance = DMA_Channel1;
 8012730:	1014      	lrw      	r0, 0x20001868	// 8012780 <HAL_SPI_MspInit+0xe8>
 8012732:	ea234000 	movih      	r3, 16384
 8012736:	e463083f 	addi      	r3, r3, 2112
 801273a:	b060      	st.w      	r3, (r0, 0x0)
	hdma_spi_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
 801273c:	3301      	movi      	r3, 1
 801273e:	b061      	st.w      	r3, (r0, 0x4)
	hdma_spi_rx.Init.DestInc = DMA_DINC_ENABLE;
 8012740:	3308      	movi      	r3, 8
 8012742:	b062      	st.w      	r3, (r0, 0x8)
	hdma_spi_rx.Init.SrcInc = DMA_SINC_DISABLE;
 8012744:	3300      	movi      	r3, 0
 8012746:	b063      	st.w      	r3, (r0, 0xc)
	hdma_spi_rx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 8012748:	3220      	movi      	r2, 32
	hdma_spi_rx.Init.Mode = DMA_MODE_NORMAL_SINGLE;
 801274a:	b065      	st.w      	r3, (r0, 0x14)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
	
	__HAL_LINKDMA(hspi, hdmarx, hdma_spi_rx);
 801274c:	b40e      	st.w      	r0, (r4, 0x38)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
 801274e:	3310      	movi      	r3, 16
	hdma_spi_rx.Init.DataAlignment = DMA_DATAALIGN_HALFWORD;
 8012750:	b044      	st.w      	r2, (r0, 0x10)
	hdma_spi_rx.Init.RequestSourceSel = DMA_REQUEST_SOURCE_SPI_RX;
 8012752:	b066      	st.w      	r3, (r0, 0x18)
	__HAL_LINKDMA(hspi, hdmarx, hdma_spi_rx);
 8012754:	b08a      	st.w      	r4, (r0, 0x28)
	if (HAL_DMA_Init(&hdma_spi_rx) != HAL_OK)
 8012756:	e3fffdc7 	bsr      	0x80122e4	// 80122e4 <HAL_DMA_Init>
 801275a:	e9000004 	bez      	r0, 0x8012762	// 8012762 <HAL_SPI_MspInit+0xca>
	{
		Error_Handler();
 801275e:	e3ffff9b 	bsr      	0x8012694	// 8012694 <Error_Handler>
	}
	
	 
	 
	HAL_NVIC_SetPriority(SPI_LS_IRQn, 1);
 8012762:	3101      	movi      	r1, 1
 8012764:	300c      	movi      	r0, 12
 8012766:	e3fffa7f 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(SPI_LS_IRQn);
 801276a:	300c      	movi      	r0, 12
 801276c:	e3fffa96 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
}
 8012770:	1491      	pop      	r4, r15
		Error_Handler();
 8012772:	e3ffff91 	bsr      	0x8012694	// 8012694 <Error_Handler>
 8012776:	07dd      	br      	0x8012730	// 8012730 <HAL_SPI_MspInit+0x98>
 8012778:	40011400 	.long	0x40011400
 801277c:	200018b4 	.long	0x200018b4
 8012780:	20001868 	.long	0x20001868

08012784 <CORET_IRQHandler>:
extern DMA_HandleTypeDef hdma_spi_tx;
extern DMA_HandleTypeDef hdma_spi_rx;

#define readl(addr) ({unsigned int __v = (*(volatile unsigned int *) (addr)); __v;})
__attribute__((isr)) void CORET_IRQHandler(void)
{
 8012784:	1460      	nie
 8012786:	1462      	ipush
 8012788:	142e      	subi      	r14, r14, 56
 801278a:	d64e1c2d 	stm      	r18-r31, (r14)
 801278e:	1428      	subi      	r14, r14, 32
 8012790:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012794:	14d0      	push      	r15
	readl(0xE000E010);
 8012796:	1068      	lrw      	r3, 0xe000e000	// 80127b4 <CORET_IRQHandler+0x30>
 8012798:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 801279a:	e3fffa4b 	bsr      	0x8011c30	// 8011c30 <HAL_IncTick>
}
 801279e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80127a2:	1401      	addi      	r14, r14, 4
 80127a4:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80127a8:	1408      	addi      	r14, r14, 32
 80127aa:	d24e1c2d 	ldm      	r18-r31, (r14)
 80127ae:	140e      	addi      	r14, r14, 56
 80127b0:	1463      	ipop
 80127b2:	1461      	nir
 80127b4:	e000e000 	.long	0xe000e000

080127b8 <SPI_LS_IRQHandler>:

__attribute__((isr)) void SPI_LS_IRQHandler(void)
{
 80127b8:	1460      	nie
 80127ba:	1462      	ipush
 80127bc:	142e      	subi      	r14, r14, 56
 80127be:	d64e1c2d 	stm      	r18-r31, (r14)
 80127c2:	1428      	subi      	r14, r14, 32
 80127c4:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80127c8:	14d0      	push      	r15
	HAL_SPI_IRQHandler(&hspi);
 80127ca:	1008      	lrw      	r0, 0x20001900	// 80127e8 <SPI_LS_IRQHandler+0x30>
 80127cc:	e3fffbba 	bsr      	0x8011f40	// 8011f40 <HAL_SPI_IRQHandler>
}
 80127d0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80127d4:	1401      	addi      	r14, r14, 4
 80127d6:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80127da:	1408      	addi      	r14, r14, 32
 80127dc:	d24e1c2d 	ldm      	r18-r31, (r14)
 80127e0:	140e      	addi      	r14, r14, 56
 80127e2:	1463      	ipop
 80127e4:	1461      	nir
 80127e6:	0000      	.short	0x0000
 80127e8:	20001900 	.long	0x20001900

080127ec <DMA_Channel0_IRQHandler>:

__attribute__((isr)) void DMA_Channel0_IRQHandler(void)
{
 80127ec:	1460      	nie
 80127ee:	1462      	ipush
 80127f0:	142e      	subi      	r14, r14, 56
 80127f2:	d64e1c2d 	stm      	r18-r31, (r14)
 80127f6:	1428      	subi      	r14, r14, 32
 80127f8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80127fc:	14d0      	push      	r15
	HAL_DMA_IRQHandler(&hdma_spi_tx);
 80127fe:	1008      	lrw      	r0, 0x200018b4	// 801281c <DMA_Channel0_IRQHandler+0x30>
 8012800:	e3fffe18 	bsr      	0x8012430	// 8012430 <HAL_DMA_IRQHandler>
}
 8012804:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012808:	1401      	addi      	r14, r14, 4
 801280a:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801280e:	1408      	addi      	r14, r14, 32
 8012810:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012814:	140e      	addi      	r14, r14, 56
 8012816:	1463      	ipop
 8012818:	1461      	nir
 801281a:	0000      	.short	0x0000
 801281c:	200018b4 	.long	0x200018b4

08012820 <DMA_Channel1_IRQHandler>:

__attribute__((isr)) void DMA_Channel1_IRQHandler(void)
{
 8012820:	1460      	nie
 8012822:	1462      	ipush
 8012824:	142e      	subi      	r14, r14, 56
 8012826:	d64e1c2d 	stm      	r18-r31, (r14)
 801282a:	1428      	subi      	r14, r14, 32
 801282c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012830:	14d0      	push      	r15
	HAL_DMA_IRQHandler(&hdma_spi_rx);
 8012832:	1008      	lrw      	r0, 0x20001868	// 8012850 <DMA_Channel1_IRQHandler+0x30>
 8012834:	e3fffdfe 	bsr      	0x8012430	// 8012430 <HAL_DMA_IRQHandler>
 8012838:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801283c:	1401      	addi      	r14, r14, 4
 801283e:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012842:	1408      	addi      	r14, r14, 32
 8012844:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012848:	140e      	addi      	r14, r14, 56
 801284a:	1463      	ipop
 801284c:	1461      	nir
 801284e:	0000      	.short	0x0000
 8012850:	20001868 	.long	0x20001868

08012854 <LCD_GPIO_Init>:
#include "lcd_init.h"
#include "spi.h"


void LCD_GPIO_Init(void)
{
 8012854:	14d1      	push      	r4, r15
 8012856:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	__HAL_RCC_GPIO_CLK_ENABLE();
 8012858:	ea224000 	movih      	r2, 16384
 801285c:	e4420dff 	addi      	r2, r2, 3584
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8012860:	3400      	movi      	r4, 0
 8012862:	b880      	st.w      	r4, (r14, 0x0)
 8012864:	b881      	st.w      	r4, (r14, 0x4)
 8012866:	b882      	st.w      	r4, (r14, 0x8)
	__HAL_RCC_GPIO_CLK_ENABLE();
 8012868:	9260      	ld.w      	r3, (r2, 0x0)
 801286a:	ec630800 	ori      	r3, r3, 2048
 801286e:	b260      	st.w      	r3, (r2, 0x0)

	
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_6;
 8012870:	3343      	movi      	r3, 67
 8012872:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8012874:	3302      	movi      	r3, 2
 8012876:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8012878:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 801287a:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 801287c:	1007      	lrw      	r0, 0x40011400	// 8012898 <LCD_GPIO_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 801287e:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8012880:	e3fff882 	bsr      	0x8011984	// 8011984 <HAL_GPIO_Init>
	
	
	HAL_NVIC_SetPriority(GPIOB_IRQn,0);
 8012884:	6c53      	mov      	r1, r4
 8012886:	300f      	movi      	r0, 15
 8012888:	e3fff9ee 	bsr      	0x8011c64	// 8011c64 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 801288c:	300f      	movi      	r0, 15
 801288e:	e3fffa05 	bsr      	0x8011c98	// 8011c98 <HAL_NVIC_EnableIRQ>
}
 8012892:	1403      	addi      	r14, r14, 12
 8012894:	1491      	pop      	r4, r15
 8012896:	0000      	.short	0x0000
 8012898:	40011400 	.long	0x40011400

0801289c <LCD_WR_DATA>:
      函数说明：LCD写入数据
      入口数据：dat 写入的数据
      返回值：  无
******************************************************************************/
void LCD_WR_DATA(uint16_t dat)
{
 801289c:	14d0      	push      	r15
 801289e:	1421      	subi      	r14, r14, 4
	//LCD_Writ_Bus(dat>>8);
	//LCD_Writ_Bus(dat);
	
	
	uint8_t data[2];
	data[0] = dat>>8;
 80128a0:	4868      	lsri      	r3, r0, 8
 80128a2:	dc6e0000 	st.b      	r3, (r14, 0x0)
	data[1] = dat;
 80128a6:	dc0e0001 	st.b      	r0, (r14, 0x1)
		
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 80128aa:	3364      	movi      	r3, 100
 80128ac:	3202      	movi      	r2, 2
 80128ae:	6c7b      	mov      	r1, r14
 80128b0:	1003      	lrw      	r0, 0x20001900	// 80128bc <LCD_WR_DATA+0x20>
 80128b2:	e3fffa59 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	
	
}
 80128b6:	1401      	addi      	r14, r14, 4
 80128b8:	1490      	pop      	r15
 80128ba:	0000      	.short	0x0000
 80128bc:	20001900 	.long	0x20001900

080128c0 <LCD_WR_REG>:
      函数说明：LCD写入命令
      入口数据：dat 写入的命令
      返回值：  无
******************************************************************************/
void LCD_WR_REG(uint8_t dat)
{
 80128c0:	14d1      	push      	r4, r15
 80128c2:	1421      	subi      	r14, r14, 4
 80128c4:	6d03      	mov      	r4, r0
	LCD_DC_Clr();//写命令
 80128c6:	3200      	movi      	r2, 0
 80128c8:	3140      	movi      	r1, 64
 80128ca:	100a      	lrw      	r0, 0x40011400	// 80128f0 <LCD_WR_REG+0x30>
 80128cc:	e3fff936 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80128d0:	3364      	movi      	r3, 100
 80128d2:	e42e0002 	addi      	r1, r14, 3
 80128d6:	3201      	movi      	r2, 1
 80128d8:	1007      	lrw      	r0, 0x20001900	// 80128f4 <LCD_WR_REG+0x34>
	uint8_t data = dat;
 80128da:	dc8e0003 	st.b      	r4, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80128de:	e3fffa43 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_Writ_Bus(dat);
	LCD_DC_Set();//写数据
 80128e2:	3201      	movi      	r2, 1
 80128e4:	3140      	movi      	r1, 64
 80128e6:	1003      	lrw      	r0, 0x40011400	// 80128f0 <LCD_WR_REG+0x30>
 80128e8:	e3fff928 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
}
 80128ec:	1401      	addi      	r14, r14, 4
 80128ee:	1491      	pop      	r4, r15
 80128f0:	40011400 	.long	0x40011400
 80128f4:	20001900 	.long	0x20001900

080128f8 <LCD_Address_Set>:
      入口数据：x1,x2 设置列的起始和结束地址
                y1,y2 设置行的起始和结束地址
      返回值：  无
******************************************************************************/
void LCD_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2)
{
 80128f8:	14d4      	push      	r4-r7, r15
 80128fa:	1421      	subi      	r14, r14, 4
 80128fc:	6d03      	mov      	r4, r0
	if(USE_HORIZONTAL==0)           //测试对了
	{
		LCD_WR_REG(0x2a);//列地址设置
 80128fe:	302a      	movi      	r0, 42
{
 8012900:	6d87      	mov      	r6, r1
 8012902:	6dcb      	mov      	r7, r2
 8012904:	6d4f      	mov      	r5, r3
		LCD_WR_REG(0x2a);//列地址设置
 8012906:	e3ffffdd 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	data[0] = dat>>8;
 801290a:	4c68      	lsri      	r3, r4, 8
	data[1] = dat;
 801290c:	dc8e0001 	st.b      	r4, (r14, 0x1)
	data[0] = dat>>8;
 8012910:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012914:	6c7b      	mov      	r1, r14
 8012916:	1098      	lrw      	r4, 0x20001900	// 8012974 <LCD_Address_Set+0x7c>
 8012918:	3364      	movi      	r3, 100
 801291a:	3202      	movi      	r2, 2
 801291c:	6c13      	mov      	r0, r4
 801291e:	e3fffa23 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	data[0] = dat>>8;
 8012922:	4f68      	lsri      	r3, r7, 8
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012924:	6c7b      	mov      	r1, r14
	data[0] = dat>>8;
 8012926:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 801292a:	3202      	movi      	r2, 2
 801292c:	3364      	movi      	r3, 100
 801292e:	6c13      	mov      	r0, r4
	data[1] = dat;
 8012930:	dcee0001 	st.b      	r7, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012934:	e3fffa18 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
		LCD_WR_DATA(x1);
		LCD_WR_DATA(x2);
		LCD_WR_REG(0x2b);//行地址设置
 8012938:	302b      	movi      	r0, 43
 801293a:	e3ffffc3 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	data[0] = dat>>8;
 801293e:	4e68      	lsri      	r3, r6, 8
 8012940:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012944:	6c7b      	mov      	r1, r14
 8012946:	3364      	movi      	r3, 100
 8012948:	3202      	movi      	r2, 2
 801294a:	6c13      	mov      	r0, r4
	data[1] = dat;
 801294c:	dcce0001 	st.b      	r6, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012950:	e3fffa0a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	data[0] = dat>>8;
 8012954:	4d68      	lsri      	r3, r5, 8
 8012956:	dc6e0000 	st.b      	r3, (r14, 0x0)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 801295a:	3202      	movi      	r2, 2
 801295c:	3364      	movi      	r3, 100
 801295e:	6c7b      	mov      	r1, r14
 8012960:	6c13      	mov      	r0, r4
	data[1] = dat;
 8012962:	dcae0001 	st.b      	r5, (r14, 0x1)
	HAL_SPI_Transmit(&hspi,(uint8_t *)data,2,100);
 8012966:	e3fff9ff 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//储存器写
 801296a:	302c      	movi      	r0, 44
 801296c:	e3ffffaa 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
		LCD_WR_REG(0x2b);//行地址设置
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//储存器写
	}
}
 8012970:	1401      	addi      	r14, r14, 4
 8012972:	1494      	pop      	r4-r7, r15
 8012974:	20001900 	.long	0x20001900

08012978 <LCD_Init>:

void LCD_Init(void)
{
 8012978:	ebe00058 	push      	r4-r11, r15, r16-r17
 801297c:	1421      	subi      	r14, r14, 4
	
	LCD_RES_Clr();//复位
 801297e:	3200      	movi      	r2, 0
 8012980:	3101      	movi      	r1, 1
 8012982:	ea800148 	lrw      	r0, 0x40011400	// 8012ea0 <LCD_Init+0x528>
 8012986:	e3fff8d9 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_Delay(100);
 801298a:	3064      	movi      	r0, 100
 801298c:	e3fff960 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	LCD_RES_Set();
 8012990:	3201      	movi      	r2, 1
 8012992:	6c4b      	mov      	r1, r2
 8012994:	ea800143 	lrw      	r0, 0x40011400	// 8012ea0 <LCD_Init+0x528>
 8012998:	e3fff8d0 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
	HAL_Delay(100);
 801299c:	3064      	movi      	r0, 100
 801299e:	e3fff957 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	
	LCD_BLK_Set();//打开背光
 80129a2:	3201      	movi      	r2, 1
 80129a4:	3102      	movi      	r1, 2
 80129a6:	ea80013f 	lrw      	r0, 0x40011400	// 8012ea0 <LCD_Init+0x528>
 80129aa:	e3fff8c7 	bsr      	0x8011b38	// 8011b38 <HAL_GPIO_WritePin>
    HAL_Delay(100);
 80129ae:	3064      	movi      	r0, 100
 80129b0:	e3fff94e 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	
	LCD_WR_REG(0x11); //Sleep out
 80129b4:	3011      	movi      	r0, 17
 80129b6:	e3ffff85 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_Delay(120); //Delay 120ms
 80129ba:	3078      	movi      	r0, 120
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129bc:	ea84013a 	lrw      	r4, 0x20001900	// 8012ea4 <LCD_Init+0x52c>
	HAL_Delay(120); //Delay 120ms
 80129c0:	e3fff946 	bsr      	0x8011c4c	// 8011c4c <HAL_Delay>
	//------------------------------------ST7735S Frame rate-------------------------------------------------//
	LCD_WR_REG(0xB1); //Frame rate 80Hz
 80129c4:	30b1      	movi      	r0, 177
 80129c6:	e3ffff7d 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 80129ca:	3602      	movi      	r6, 2
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129cc:	e42e0002 	addi      	r1, r14, 3
 80129d0:	3364      	movi      	r3, 100
 80129d2:	3201      	movi      	r2, 1
 80129d4:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129d6:	3735      	movi      	r7, 53
 80129d8:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129dc:	e3fff9c4 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129e0:	e42e0002 	addi      	r1, r14, 3
 80129e4:	3364      	movi      	r3, 100
 80129e6:	3201      	movi      	r2, 1
 80129e8:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129ea:	3536      	movi      	r5, 54
 80129ec:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 80129f0:	e3fff9ba 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 80129f4:	e42e0002 	addi      	r1, r14, 3
 80129f8:	3364      	movi      	r3, 100
 80129fa:	3201      	movi      	r2, 1
 80129fc:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 80129fe:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a02:	e3fff9b1 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	LCD_WR_REG(0xB2); //Frame rate 80Hz
 8012a06:	30b2      	movi      	r0, 178
 8012a08:	e3ffff5c 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a0c:	e42e0002 	addi      	r1, r14, 3
 8012a10:	3364      	movi      	r3, 100
 8012a12:	3201      	movi      	r2, 1
 8012a14:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a16:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a1a:	e3fff9a5 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a1e:	e42e0002 	addi      	r1, r14, 3
 8012a22:	3364      	movi      	r3, 100
 8012a24:	3201      	movi      	r2, 1
 8012a26:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a28:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a2c:	e3fff99c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a30:	e42e0002 	addi      	r1, r14, 3
 8012a34:	3364      	movi      	r3, 100
 8012a36:	3201      	movi      	r2, 1
 8012a38:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a3a:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a3e:	e3fff993 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	LCD_WR_REG(0xB3); //Frame rate 80Hz
 8012a42:	30b3      	movi      	r0, 179
 8012a44:	e3ffff3e 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a48:	e42e0002 	addi      	r1, r14, 3
 8012a4c:	3364      	movi      	r3, 100
 8012a4e:	3201      	movi      	r2, 1
 8012a50:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a52:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a56:	e3fff987 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a5a:	e42e0002 	addi      	r1, r14, 3
 8012a5e:	3364      	movi      	r3, 100
 8012a60:	3201      	movi      	r2, 1
 8012a62:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a64:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a68:	e3fff97e 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a6c:	e42e0002 	addi      	r1, r14, 3
 8012a70:	3364      	movi      	r3, 100
 8012a72:	3201      	movi      	r2, 1
 8012a74:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a76:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a7a:	e3fff975 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a7e:	e42e0002 	addi      	r1, r14, 3
 8012a82:	3364      	movi      	r3, 100
 8012a84:	3201      	movi      	r2, 1
 8012a86:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a88:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a8c:	e3fff96c 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012a90:	e42e0002 	addi      	r1, r14, 3
 8012a94:	3364      	movi      	r3, 100
 8012a96:	3201      	movi      	r2, 1
 8012a98:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012a9a:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012a9e:	e3fff963 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012aa2:	e42e0002 	addi      	r1, r14, 3
 8012aa6:	3364      	movi      	r3, 100
 8012aa8:	3201      	movi      	r2, 1
 8012aaa:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012aac:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ab0:	e3fff95a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x36);
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x35);
	LCD_WR_DATA8(0x36);
	//------------------------------------End ST7735S Frame rate-------------------------------------------//
	LCD_WR_REG(0xB4); //Dot inversion
 8012ab4:	30b4      	movi      	r0, 180
 8012ab6:	e3ffff05 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012aba:	3503      	movi      	r5, 3
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012abc:	e42e0002 	addi      	r1, r14, 3
 8012ac0:	3364      	movi      	r3, 100
 8012ac2:	3201      	movi      	r2, 1
 8012ac4:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012ac6:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012aca:	e3fff94d 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	//------------------------------------ST7735S Power Sequence-----------------------------------------//
	LCD_WR_REG(0xC0);
 8012ace:	30c0      	movi      	r0, 192
 8012ad0:	e3fffef8 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012ad4:	3300      	movi      	r3, 0
 8012ad6:	2b5d      	subi      	r3, 94
 8012ad8:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012adc:	e42e0002 	addi      	r1, r14, 3
 8012ae0:	3364      	movi      	r3, 100
 8012ae2:	3201      	movi      	r2, 1
 8012ae4:	6c13      	mov      	r0, r4
 8012ae6:	e3fff93f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012aea:	e42e0002 	addi      	r1, r14, 3
 8012aee:	3364      	movi      	r3, 100
 8012af0:	3201      	movi      	r2, 1
 8012af2:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012af4:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012af8:	e3fff936 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012afc:	3300      	movi      	r3, 0
 8012afe:	2b7b      	subi      	r3, 124
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b00:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012b04:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b08:	3201      	movi      	r2, 1
 8012b0a:	3364      	movi      	r3, 100
 8012b0c:	6c13      	mov      	r0, r4
 8012b0e:	e3fff92b 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0xA2);
	LCD_WR_DATA8(0x02);
	LCD_WR_DATA8(0x84);
	LCD_WR_REG(0xC1);
 8012b12:	30c1      	movi      	r0, 193
 8012b14:	e3fffed6 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012b18:	3300      	movi      	r3, 0
 8012b1a:	2b3a      	subi      	r3, 59
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b1c:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012b20:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b24:	3201      	movi      	r2, 1
 8012b26:	3364      	movi      	r3, 100
 8012b28:	6c13      	mov      	r0, r4
 8012b2a:	e3fff91d 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0xC5);
	LCD_WR_REG(0xC2);
 8012b2e:	30c2      	movi      	r0, 194
 8012b30:	e3fffec8 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012b34:	330d      	movi      	r3, 13
 8012b36:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b3a:	e42e0002 	addi      	r1, r14, 3
 8012b3e:	3364      	movi      	r3, 100
 8012b40:	3201      	movi      	r2, 1
 8012b42:	6c13      	mov      	r0, r4
 8012b44:	e3fff910 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012b48:	ea080000 	movi      	r8, 0
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b4c:	e42e0002 	addi      	r1, r14, 3
 8012b50:	3364      	movi      	r3, 100
 8012b52:	3201      	movi      	r2, 1
 8012b54:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b56:	dd0e0003 	st.b      	r8, (r14, 0x3)
 8012b5a:	3600      	movi      	r6, 0
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b5c:	e3fff904 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x0D);
	LCD_WR_DATA8(0x00);
	LCD_WR_REG(0xC3);
 8012b60:	30c3      	movi      	r0, 195
 8012b62:	e3fffeaf 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012b66:	2e72      	subi      	r6, 115
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b68:	e42e0002 	addi      	r1, r14, 3
 8012b6c:	3364      	movi      	r3, 100
 8012b6e:	3201      	movi      	r2, 1
 8012b70:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b72:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b76:	e3fff8f7 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012b7a:	332a      	movi      	r3, 42
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b7c:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012b80:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b84:	3201      	movi      	r2, 1
 8012b86:	3364      	movi      	r3, 100
 8012b88:	6c13      	mov      	r0, r4
 8012b8a:	e3fff8ed 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x8D);
	LCD_WR_DATA8(0x2A);
	LCD_WR_REG(0xC4);
 8012b8e:	30c4      	movi      	r0, 196
 8012b90:	e3fffe98 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012b94:	e42e0002 	addi      	r1, r14, 3
 8012b98:	3364      	movi      	r3, 100
 8012b9a:	3201      	movi      	r2, 1
 8012b9c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012b9e:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ba2:	e3fff8e1 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012ba6:	3300      	movi      	r3, 0
 8012ba8:	2b11      	subi      	r3, 18
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012baa:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012bae:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bb2:	3201      	movi      	r2, 1
 8012bb4:	3364      	movi      	r3, 100
 8012bb6:	6c13      	mov      	r0, r4
 8012bb8:	e3fff8d6 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x8D);
	LCD_WR_DATA8(0xEE);
	//---------------------------------End ST7735S Power Sequence---------------------------------------//
	LCD_WR_REG(0xC5); //VCOM
 8012bbc:	30c5      	movi      	r0, 197
 8012bbe:	e3fffe81 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bc2:	e42e0002 	addi      	r1, r14, 3
 8012bc6:	3364      	movi      	r3, 100
 8012bc8:	3201      	movi      	r2, 1
 8012bca:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012bcc:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bd0:	e3fff8ca 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	
	LCD_WR_REG(0x3a); //Set Color Format
 8012bd4:	303a      	movi      	r0, 58
 8012bd6:	e3fffe75 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012bda:	ea090005 	movi      	r9, 5
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bde:	e42e0002 	addi      	r1, r14, 3
 8012be2:	3364      	movi      	r3, 100
 8012be4:	3201      	movi      	r2, 1
 8012be6:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012be8:	dd2e0003 	st.b      	r9, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bec:	e3fff8bc 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x05);
	
	LCD_WR_REG(0x36);   //屏幕扫描方式设置  模组驱动芯片为上参考
 8012bf0:	3036      	movi      	r0, 54
 8012bf2:	e3fffe67 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012bf6:	3308      	movi      	r3, 8
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012bf8:	e42e0002 	addi      	r1, r14, 3
	uint8_t data = dat;
 8012bfc:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c00:	3201      	movi      	r2, 1
 8012c02:	3364      	movi      	r3, 100
 8012c04:	6c13      	mov      	r0, r4
 8012c06:	e3fff8af 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	if(USE_HORIZONTAL==0)LCD_WR_DATA8(0x08);      //              	   垂直方向从上到下 水平从左到右
	else if(USE_HORIZONTAL==1)LCD_WR_DATA8(0xC8); //行列地址方式      	 垂直方向从上到下 水平从左到右
	else if(USE_HORIZONTAL==2)LCD_WR_DATA8(0x78); //列地址方式 行列交换 垂直方向从下到上 水平从左到右
	else LCD_WR_DATA8(0xA8);                      //行地址方式 行列交换 垂直方向从上到下 水平从左到右         
	//------------------------------------ST7735S Gamma Sequence-----------------------------------------//
	LCD_WR_REG(0XE0);
 8012c0a:	30e0      	movi      	r0, 224
 8012c0c:	e3fffe5a 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	uint8_t data = dat;
 8012c10:	ea110012 	movi      	r17, 18
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c14:	e42e0002 	addi      	r1, r14, 3
 8012c18:	3364      	movi      	r3, 100
 8012c1a:	3201      	movi      	r2, 1
 8012c1c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c1e:	ea10001c 	movi      	r16, 28
 8012c22:	de2e0003 	st.b      	r17, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c26:	e3fff89f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c2a:	e42e0002 	addi      	r1, r14, 3
 8012c2e:	3364      	movi      	r3, 100
 8012c30:	3201      	movi      	r2, 1
 8012c32:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c34:	3710      	movi      	r7, 16
 8012c36:	de0e0003 	st.b      	r16, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c3a:	e3fff895 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c3e:	e42e0002 	addi      	r1, r14, 3
 8012c42:	3364      	movi      	r3, 100
 8012c44:	3201      	movi      	r2, 1
 8012c46:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c48:	ea0b0018 	movi      	r11, 24
 8012c4c:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c50:	e3fff88a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012c54:	e42e0002 	addi      	r1, r14, 3
 8012c58:	3364      	movi      	r3, 100
 8012c5a:	3201      	movi      	r2, 1
 8012c5c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012c5e:	dd6e0003 	st.b      	r11, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c62:	e3fff881 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c66:	3333      	movi      	r3, 51
 8012c68:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c6c:	e42e0002 	addi      	r1, r14, 3
 8012c70:	3364      	movi      	r3, 100
 8012c72:	3201      	movi      	r2, 1
 8012c74:	6c13      	mov      	r0, r4
 8012c76:	e3fff877 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c7a:	332c      	movi      	r3, 44
 8012c7c:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c80:	e42e0002 	addi      	r1, r14, 3
 8012c84:	3364      	movi      	r3, 100
 8012c86:	3201      	movi      	r2, 1
 8012c88:	6c13      	mov      	r0, r4
 8012c8a:	e3fff86d 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012c8e:	3325      	movi      	r3, 37
 8012c90:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012c94:	e42e0002 	addi      	r1, r14, 3
 8012c98:	3364      	movi      	r3, 100
 8012c9a:	3201      	movi      	r2, 1
 8012c9c:	6c13      	mov      	r0, r4
 8012c9e:	e3fff863 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012ca2:	3628      	movi      	r6, 40
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ca4:	e42e0002 	addi      	r1, r14, 3
 8012ca8:	3364      	movi      	r3, 100
 8012caa:	3201      	movi      	r2, 1
 8012cac:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cae:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cb2:	e3fff859 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012cb6:	e42e0002 	addi      	r1, r14, 3
 8012cba:	3364      	movi      	r3, 100
 8012cbc:	3201      	movi      	r2, 1
 8012cbe:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cc0:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cc4:	e3fff850 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012cc8:	3327      	movi      	r3, 39
 8012cca:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cce:	e42e0002 	addi      	r1, r14, 3
 8012cd2:	3364      	movi      	r3, 100
 8012cd4:	3201      	movi      	r2, 1
 8012cd6:	6c13      	mov      	r0, r4
 8012cd8:	e3fff846 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012cdc:	ea0a002f 	movi      	r10, 47
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012ce0:	e42e0002 	addi      	r1, r14, 3
 8012ce4:	3364      	movi      	r3, 100
 8012ce6:	3201      	movi      	r2, 1
 8012ce8:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012cea:	dd4e0003 	st.b      	r10, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cee:	e3fff83b 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012cf2:	333c      	movi      	r3, 60
 8012cf4:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012cf8:	e42e0002 	addi      	r1, r14, 3
 8012cfc:	3364      	movi      	r3, 100
 8012cfe:	3201      	movi      	r2, 1
 8012d00:	6c13      	mov      	r0, r4
 8012d02:	e3fff831 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d06:	e42e0002 	addi      	r1, r14, 3
 8012d0a:	3364      	movi      	r3, 100
 8012d0c:	3201      	movi      	r2, 1
 8012d0e:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d10:	dd0e0003 	st.b      	r8, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d14:	e3fff828 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d18:	e42e0002 	addi      	r1, r14, 3
 8012d1c:	3364      	movi      	r3, 100
 8012d1e:	3201      	movi      	r2, 1
 8012d20:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d22:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d26:	e3fff81f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d2a:	e42e0002 	addi      	r1, r14, 3
 8012d2e:	3364      	movi      	r3, 100
 8012d30:	3201      	movi      	r2, 1
 8012d32:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d34:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d38:	e3fff816 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d3c:	e42e0002 	addi      	r1, r14, 3
 8012d40:	3364      	movi      	r3, 100
 8012d42:	3201      	movi      	r2, 1
 8012d44:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d46:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d4a:	e3fff80d 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x3C);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x10);
	LCD_WR_REG(0XE1);
 8012d4e:	30e1      	movi      	r0, 225
 8012d50:	e3fffdb8 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d54:	e42e0002 	addi      	r1, r14, 3
 8012d58:	3364      	movi      	r3, 100
 8012d5a:	3201      	movi      	r2, 1
 8012d5c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d5e:	de2e0003 	st.b      	r17, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d62:	e3fff801 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d66:	e42e0002 	addi      	r1, r14, 3
 8012d6a:	3364      	movi      	r3, 100
 8012d6c:	3201      	movi      	r2, 1
 8012d6e:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d70:	de0e0003 	st.b      	r16, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d74:	e3fff7f8 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d78:	e42e0002 	addi      	r1, r14, 3
 8012d7c:	3364      	movi      	r3, 100
 8012d7e:	3201      	movi      	r2, 1
 8012d80:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d82:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d86:	e3fff7ef 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012d8a:	e42e0002 	addi      	r1, r14, 3
 8012d8e:	3364      	movi      	r3, 100
 8012d90:	3201      	movi      	r2, 1
 8012d92:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012d94:	dd6e0003 	st.b      	r11, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012d98:	e3fff7e6 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012d9c:	332d      	movi      	r3, 45
 8012d9e:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012da2:	e42e0002 	addi      	r1, r14, 3
 8012da6:	3364      	movi      	r3, 100
 8012da8:	3201      	movi      	r2, 1
 8012daa:	6c13      	mov      	r0, r4
 8012dac:	e3fff7dc 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012db0:	e42e0002 	addi      	r1, r14, 3
 8012db4:	3364      	movi      	r3, 100
 8012db6:	3201      	movi      	r2, 1
 8012db8:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012dba:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012dbe:	e3fff7d3 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012dc2:	3323      	movi      	r3, 35
 8012dc4:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012dc8:	e42e0002 	addi      	r1, r14, 3
 8012dcc:	3364      	movi      	r3, 100
 8012dce:	3201      	movi      	r2, 1
 8012dd0:	6c13      	mov      	r0, r4
 8012dd2:	e3fff7c9 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012dd6:	e42e0002 	addi      	r1, r14, 3
 8012dda:	3364      	movi      	r3, 100
 8012ddc:	3201      	movi      	r2, 1
 8012dde:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012de0:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012de4:	e3fff7c0 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012de8:	e42e0002 	addi      	r1, r14, 3
 8012dec:	3364      	movi      	r3, 100
 8012dee:	3201      	movi      	r2, 1
 8012df0:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012df2:	dcce0003 	st.b      	r6, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012df6:	e3fff7b7 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012dfa:	3326      	movi      	r3, 38
 8012dfc:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e00:	e42e0002 	addi      	r1, r14, 3
 8012e04:	3364      	movi      	r3, 100
 8012e06:	3201      	movi      	r2, 1
 8012e08:	6c13      	mov      	r0, r4
 8012e0a:	e3fff7ad 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012e0e:	e42e0002 	addi      	r1, r14, 3
 8012e12:	3364      	movi      	r3, 100
 8012e14:	3201      	movi      	r2, 1
 8012e16:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e18:	dd4e0003 	st.b      	r10, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e1c:	e3fff7a4 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	uint8_t data = dat;
 8012e20:	333b      	movi      	r3, 59
 8012e22:	dc6e0003 	st.b      	r3, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e26:	e42e0002 	addi      	r1, r14, 3
 8012e2a:	3364      	movi      	r3, 100
 8012e2c:	3201      	movi      	r2, 1
 8012e2e:	6c13      	mov      	r0, r4
 8012e30:	e3fff79a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012e34:	e42e0002 	addi      	r1, r14, 3
 8012e38:	3364      	movi      	r3, 100
 8012e3a:	3201      	movi      	r2, 1
 8012e3c:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e3e:	dd0e0003 	st.b      	r8, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e42:	e3fff791 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012e46:	e42e0002 	addi      	r1, r14, 3
 8012e4a:	3364      	movi      	r3, 100
 8012e4c:	3201      	movi      	r2, 1
 8012e4e:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e50:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e54:	e3fff788 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012e58:	e42e0002 	addi      	r1, r14, 3
 8012e5c:	3364      	movi      	r3, 100
 8012e5e:	3201      	movi      	r2, 1
 8012e60:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e62:	dcae0003 	st.b      	r5, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e66:	e3fff77f 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
 8012e6a:	e42e0002 	addi      	r1, r14, 3
 8012e6e:	3364      	movi      	r3, 100
 8012e70:	3201      	movi      	r2, 1
 8012e72:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e74:	dcee0003 	st.b      	r7, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e78:	e3fff776 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x03);
	LCD_WR_DATA8(0x10);
	
	//------------------------------------End ST7735S Gamma Sequence-----------------------------------------//
	LCD_WR_REG(0x3A); //65k mode
 8012e7c:	303a      	movi      	r0, 58
 8012e7e:	e3fffd21 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e82:	3364      	movi      	r3, 100
 8012e84:	3201      	movi      	r2, 1
 8012e86:	e42e0002 	addi      	r1, r14, 3
 8012e8a:	6c13      	mov      	r0, r4
	uint8_t data = dat;
 8012e8c:	dd2e0003 	st.b      	r9, (r14, 0x3)
	HAL_SPI_Transmit(&hspi, &data, 1,100);
 8012e90:	e3fff76a 	bsr      	0x8011d64	// 8011d64 <HAL_SPI_Transmit>
	LCD_WR_DATA8(0x05);
	LCD_WR_REG(0x29); //Display on 
 8012e94:	3029      	movi      	r0, 41
 8012e96:	e3fffd15 	bsr      	0x80128c0	// 80128c0 <LCD_WR_REG>
}
 8012e9a:	1401      	addi      	r14, r14, 4
 8012e9c:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012ea0:	40011400 	.long	0x40011400
 8012ea4:	20001900 	.long	0x20001900

08012ea8 <LCD_Fill>:
                xend,yend   终止坐标
								color       要填充的颜色
      返回值：  无
******************************************************************************/
void LCD_Fill(uint16_t xsta,uint16_t ysta,uint16_t xend,uint16_t yend,uint16_t color)
{          
 8012ea8:	14d6      	push      	r4-r9, r15
 8012eaa:	6e4f      	mov      	r9, r3
 8012eac:	6d4b      	mov      	r5, r2
	uint16_t i,j; 
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//设置显示范围
 8012eae:	2b00      	subi      	r3, 1
 8012eb0:	2a00      	subi      	r2, 1
{          
 8012eb2:	6dc7      	mov      	r7, r1
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//设置显示范围
 8012eb4:	74cd      	zexth      	r3, r3
 8012eb6:	7489      	zexth      	r2, r2
{          
 8012eb8:	6e03      	mov      	r8, r0
 8012eba:	d8ce100e 	ld.h      	r6, (r14, 0x1c)
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//设置显示范围
 8012ebe:	e3fffd1d 	bsr      	0x80128f8	// 80128f8 <LCD_Address_Set>
	for(i=ysta;i<yend;i++)
 8012ec2:	665c      	cmphs      	r7, r9
 8012ec4:	080f      	bt      	0x8012ee2	// 8012ee2 <LCD_Fill+0x3a>
	{													   	 	
		for(j=xsta;j<xend;j++)
 8012ec6:	6560      	cmphs      	r8, r5
 8012ec8:	0809      	bt      	0x8012eda	// 8012eda <LCD_Fill+0x32>
 8012eca:	6d23      	mov      	r4, r8
 8012ecc:	2400      	addi      	r4, 1
		{
			LCD_WR_DATA(color);
 8012ece:	6c1b      	mov      	r0, r6
		for(j=xsta;j<xend;j++)
 8012ed0:	7511      	zexth      	r4, r4
			LCD_WR_DATA(color);
 8012ed2:	e3fffce5 	bsr      	0x801289c	// 801289c <LCD_WR_DATA>
		for(j=xsta;j<xend;j++)
 8012ed6:	6516      	cmpne      	r5, r4
 8012ed8:	0bfa      	bt      	0x8012ecc	// 8012ecc <LCD_Fill+0x24>
	for(i=ysta;i<yend;i++)
 8012eda:	2700      	addi      	r7, 1
 8012edc:	75dd      	zexth      	r7, r7
 8012ede:	65e6      	cmpne      	r9, r7
 8012ee0:	0bf3      	bt      	0x8012ec6	// 8012ec6 <LCD_Fill+0x1e>
		}
	} 					  	    
}
 8012ee2:	1496      	pop      	r4-r9, r15

08012ee4 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8012ee4:	106a      	lrw      	r3, 0x20000000	// 8012f0c <SystemInit+0x28>
 8012ee6:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8012eea:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8012eee:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8012ef2:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8012ef6:	1047      	lrw      	r2, 0xe000e100	// 8012f10 <SystemInit+0x2c>
 8012ef8:	3300      	movi      	r3, 0
 8012efa:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8012efe:	2b00      	subi      	r3, 1
 8012f00:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8012f04:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8012f08:	783c      	jmp      	r15
 8012f0a:	0000      	.short	0x0000
 8012f0c:	20000000 	.long	0x20000000
 8012f10:	e000e100 	.long	0xe000e100

08012f14 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8012f14:	14d4      	push      	r4-r7, r15
 8012f16:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8012f18:	c0006021 	mfcr      	r1, cr<0, 0>
 8012f1c:	4930      	lsri      	r1, r1, 16
 8012f1e:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8012f20:	1018      	lrw      	r0, 0x80149ec	// 8012f80 <trap_c+0x6c>
 8012f22:	e0000c4d 	bsr      	0x80147bc	// 80147bc <wm_printf>
    printf("\n");
 8012f26:	300a      	movi      	r0, 10
 8012f28:	e3fff4e8 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8012f2c:	9540      	ld.w      	r2, (r5, 0x0)
 8012f2e:	3100      	movi      	r1, 0
 8012f30:	1015      	lrw      	r0, 0x8014a00	// 8012f84 <trap_c+0x70>
 8012f32:	e0000c45 	bsr      	0x80147bc	// 80147bc <wm_printf>
    for (i = 0; i < 16; i++) {
 8012f36:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8012f38:	10f3      	lrw      	r7, 0x8014a00	// 8012f84 <trap_c+0x70>

        if ((i % 5) == 4) {
 8012f3a:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8012f3c:	2400      	addi      	r4, 1
 8012f3e:	3c50      	cmpnei      	r4, 16
 8012f40:	0c13      	bf      	0x8012f66	// 8012f66 <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8012f42:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8012f46:	6c53      	mov      	r1, r4
 8012f48:	6c1f      	mov      	r0, r7
 8012f4a:	e0000c39 	bsr      	0x80147bc	// 80147bc <wm_printf>
        if ((i % 5) == 4) {
 8012f4e:	c4c48043 	divs      	r3, r4, r6
 8012f52:	7cd8      	mult      	r3, r6
 8012f54:	5c6d      	subu      	r3, r4, r3
 8012f56:	3b44      	cmpnei      	r3, 4
 8012f58:	0bf2      	bt      	0x8012f3c	// 8012f3c <trap_c+0x28>
            printf("\n");
 8012f5a:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8012f5c:	2400      	addi      	r4, 1
            printf("\n");
 8012f5e:	e3fff4cd 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8012f62:	3c50      	cmpnei      	r4, 16
 8012f64:	0bef      	bt      	0x8012f42	// 8012f42 <trap_c+0x2e>
        }
    }

    printf("\n");
 8012f66:	300a      	movi      	r0, 10
 8012f68:	e3fff4c8 	bsr      	0x80118f8	// 80118f8 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8012f6c:	9530      	ld.w      	r1, (r5, 0x40)
 8012f6e:	1007      	lrw      	r0, 0x8014a0c	// 8012f88 <trap_c+0x74>
 8012f70:	e0000c26 	bsr      	0x80147bc	// 80147bc <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8012f74:	9531      	ld.w      	r1, (r5, 0x44)
 8012f76:	1006      	lrw      	r0, 0x8014a18	// 8012f8c <trap_c+0x78>
 8012f78:	e0000c22 	bsr      	0x80147bc	// 80147bc <wm_printf>
 8012f7c:	0400      	br      	0x8012f7c	// 8012f7c <trap_c+0x68>
 8012f7e:	0000      	.short	0x0000
 8012f80:	080149ec 	.long	0x080149ec
 8012f84:	08014a00 	.long	0x08014a00
 8012f88:	08014a0c 	.long	0x08014a0c
 8012f8c:	08014a18 	.long	0x08014a18

08012f90 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012f90:	106a      	lrw      	r3, 0xe000e100	// 8012fb8 <board_init+0x28>
 8012f92:	ea210001 	movih      	r1, 1
 8012f96:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012f9a:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8012f9e:	1068      	lrw      	r3, 0x40010600	// 8012fbc <board_init+0x2c>
 8012fa0:	ea21000b 	movih      	r1, 11
 8012fa4:	2113      	addi      	r1, 20
 8012fa6:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012fa8:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8012faa:	31c3      	movi      	r1, 195
 8012fac:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8012fae:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8012fb0:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 8012fb2:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 8012fb4:	783c      	jmp      	r15
 8012fb6:	0000      	.short	0x0000
 8012fb8:	e000e100 	.long	0xe000e100
 8012fbc:	40010600 	.long	0x40010600

08012fc0 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8012fc0:	1044      	lrw      	r2, 0x40010600	// 8012fd0 <_out_uart+0x10>
 8012fc2:	9267      	ld.w      	r3, (r2, 0x1c)
 8012fc4:	e463203f 	andi      	r3, r3, 63
 8012fc8:	3b1f      	cmphsi      	r3, 32
 8012fca:	0bfc      	bt      	0x8012fc2	// 8012fc2 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8012fcc:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 8012fce:	783c      	jmp      	r15
 8012fd0:	40010600 	.long	0x40010600

08012fd4 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 8012fd4:	783c      	jmp      	r15
	...

08012fd8 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 8012fd8:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012fdc:	6e4f      	mov      	r9, r3
 8012fde:	da0e200e 	ld.w      	r16, (r14, 0x38)
 8012fe2:	986b      	ld.w      	r3, (r14, 0x2c)
 8012fe4:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8012fe8:	e4702003 	andi      	r3, r16, 3
{
 8012fec:	6dc3      	mov      	r7, r0
 8012fee:	6e07      	mov      	r8, r1
 8012ff0:	6e8b      	mov      	r10, r2
 8012ff2:	98ac      	ld.w      	r5, (r14, 0x30)
 8012ff4:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8012ff8:	e9230010 	bnez      	r3, 0x8013018	// 8013018 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8012ffc:	66d4      	cmphs      	r5, r11
 8012ffe:	080d      	bt      	0x8013018	// 8013018 <_out_rev+0x40>
 8013000:	c4ab0086 	subu      	r6, r11, r5
 8013004:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 8013006:	5a82      	addi      	r4, r2, 1
 8013008:	6ce7      	mov      	r3, r9
 801300a:	6c63      	mov      	r1, r8
 801300c:	3020      	movi      	r0, 32
 801300e:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8013010:	6592      	cmpne      	r4, r6
 8013012:	6c93      	mov      	r2, r4
 8013014:	0bf9      	bt      	0x8013006	// 8013006 <_out_rev+0x2e>
 8013016:	0402      	br      	0x801301a	// 801301a <_out_rev+0x42>
 8013018:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 801301a:	e905002a 	bez      	r5, 0x801306e	// 801306e <_out_rev+0x96>
 801301e:	5dc3      	subi      	r6, r5, 1
 8013020:	c4114823 	lsli      	r3, r17, 0
 8013024:	60d8      	addu      	r3, r6
 8013026:	6d8f      	mov      	r6, r3
 8013028:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 801302a:	e6240000 	addi      	r17, r4, 1
 801302e:	6c93      	mov      	r2, r4
 8013030:	8600      	ld.b      	r0, (r6, 0x0)
 8013032:	6ce7      	mov      	r3, r9
 8013034:	6c63      	mov      	r1, r8
 8013036:	c4114824 	lsli      	r4, r17, 0
 801303a:	7bdd      	jsr      	r7
  while (len) {
 801303c:	6552      	cmpne      	r4, r5
 801303e:	2e00      	subi      	r6, 1
 8013040:	0bf5      	bt      	0x801302a	// 801302a <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8013042:	e6102002 	andi      	r16, r16, 2
 8013046:	e9100011 	bez      	r16, 0x8013068	// 8013068 <_out_rev+0x90>
    while (idx - start_idx < width) {
 801304a:	c5450083 	subu      	r3, r5, r10
 801304e:	66cc      	cmphs      	r3, r11
 8013050:	080c      	bt      	0x8013068	// 8013068 <_out_rev+0x90>
 8013052:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8013054:	2500      	addi      	r5, 1
 8013056:	6ce7      	mov      	r3, r9
 8013058:	6c63      	mov      	r1, r8
 801305a:	3020      	movi      	r0, 32
 801305c:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 801305e:	c5450083 	subu      	r3, r5, r10
 8013062:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8013064:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8013066:	0ff7      	bf      	0x8013054	// 8013054 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8013068:	6c17      	mov      	r0, r5
 801306a:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 801306e:	6d53      	mov      	r5, r4
 8013070:	07e9      	br      	0x8013042	// 8013042 <_out_rev+0x6a>
	...

08013074 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013074:	14d1      	push      	r4, r15
 8013076:	1424      	subi      	r14, r14, 16
 8013078:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 801307c:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8013080:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8013084:	e5b42002 	andi      	r13, r20, 2
{
 8013088:	dace2006 	ld.w      	r22, (r14, 0x18)
 801308c:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013090:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8013094:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8013098:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 801309c:	e92d0039 	bnez      	r13, 0x801310e	// 801310e <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80130a0:	e9320071 	bnez      	r18, 0x8013182	// 8013182 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130a4:	c66c0420 	cmphs      	r12, r19
 80130a8:	0833      	bt      	0x801310e	// 801310e <_ntoa_format+0x9a>
 80130aa:	eb0c001f 	cmphsi      	r12, 32
 80130ae:	e7142001 	andi      	r24, r20, 1
 80130b2:	082e      	bt      	0x801310e	// 801310e <_ntoa_format+0x9a>
 80130b4:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 80130b8:	ea150030 	movi      	r21, 48
 80130bc:	0406      	br      	0x80130c8	// 80130c8 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130be:	eb4c0020 	cmpnei      	r12, 32
 80130c2:	e5ad0000 	addi      	r13, r13, 1
 80130c6:	0c08      	bf      	0x80130d6	// 80130d6 <_ntoa_format+0x62>
      buf[len++] = '0';
 80130c8:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130cc:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 80130d0:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130d4:	0ff5      	bf      	0x80130be	// 80130be <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130d6:	e918001c 	bez      	r24, 0x801310e	// 801310e <_ntoa_format+0x9a>
 80130da:	c64c0420 	cmphs      	r12, r18
 80130de:	0818      	bt      	0x801310e	// 801310e <_ntoa_format+0x9a>
 80130e0:	ea0d001f 	movi      	r13, 31
 80130e4:	6734      	cmphs      	r13, r12
 80130e6:	0c62      	bf      	0x80131aa	// 80131aa <_ntoa_format+0x136>
 80130e8:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 80130ec:	ea150030 	movi      	r21, 48
 80130f0:	0406      	br      	0x80130fc	// 80130fc <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80130f2:	eb4c0020 	cmpnei      	r12, 32
 80130f6:	e5ad0000 	addi      	r13, r13, 1
 80130fa:	0c58      	bf      	0x80131aa	// 80131aa <_ntoa_format+0x136>
      buf[len++] = '0';
 80130fc:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013100:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8013104:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013108:	0bf5      	bt      	0x80130f2	// 80130f2 <_ntoa_format+0x7e>
      buf[len++] = '0';
 801310a:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 801310e:	e5b42010 	andi      	r13, r20, 16
 8013112:	e90d0019 	bez      	r13, 0x8013144	// 8013144 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013116:	e5b42400 	andi      	r13, r20, 1024
 801311a:	e92d0004 	bnez      	r13, 0x8013122	// 8013122 <_ntoa_format+0xae>
 801311e:	e92c004e 	bnez      	r12, 0x80131ba	// 80131ba <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013122:	c4194824 	lsli      	r4, r25, 0
 8013126:	3c50      	cmpnei      	r4, 16
 8013128:	0c74      	bf      	0x8013210	// 8013210 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801312a:	c4194824 	lsli      	r4, r25, 0
 801312e:	3c42      	cmpnei      	r4, 2
 8013130:	0c7e      	bf      	0x801322c	// 801322c <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013132:	eb0c001f 	cmphsi      	r12, 32
 8013136:	081a      	bt      	0x801316a	// 801316a <_ntoa_format+0xf6>
      buf[len++] = '0';
 8013138:	ea0d0030 	movi      	r13, 48
 801313c:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013140:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013144:	eb0c001f 	cmphsi      	r12, 32
 8013148:	0811      	bt      	0x801316a	// 801316a <_ntoa_format+0xf6>
    if (negative) {
 801314a:	e9370048 	bnez      	r23, 0x80131da	// 80131da <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 801314e:	e5b42004 	andi      	r13, r20, 4
 8013152:	e92d0056 	bnez      	r13, 0x80131fe	// 80131fe <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8013156:	e5b42008 	andi      	r13, r20, 8
 801315a:	e90d0008 	bez      	r13, 0x801316a	// 801316a <_ntoa_format+0xf6>
      buf[len++] = ' ';
 801315e:	ea0d0020 	movi      	r13, 32
 8013162:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013166:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801316a:	de8e2003 	st.w      	r20, (r14, 0xc)
 801316e:	de4e2002 	st.w      	r18, (r14, 0x8)
 8013172:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8013176:	dece2000 	st.w      	r22, (r14, 0x0)
 801317a:	e3ffff2f 	bsr      	0x8012fd8	// 8012fd8 <_out_rev>
}
 801317e:	1404      	addi      	r14, r14, 16
 8013180:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013182:	e7142001 	andi      	r24, r20, 1
 8013186:	e9180031 	bez      	r24, 0x80131e8	// 80131e8 <_ntoa_format+0x174>
 801318a:	e9370037 	bnez      	r23, 0x80131f8	// 80131f8 <_ntoa_format+0x184>
 801318e:	e5b4200c 	andi      	r13, r20, 12
 8013192:	e92d0033 	bnez      	r13, 0x80131f8	// 80131f8 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013196:	c66c0420 	cmphs      	r12, r19
 801319a:	0ba0      	bt      	0x80130da	// 80130da <_ntoa_format+0x66>
 801319c:	ea0d001f 	movi      	r13, 31
 80131a0:	6734      	cmphs      	r13, r12
 80131a2:	0b89      	bt      	0x80130b4	// 80130b4 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80131a4:	c64c0420 	cmphs      	r12, r18
 80131a8:	0bb3      	bt      	0x801310e	// 801310e <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 80131aa:	e5b42010 	andi      	r13, r20, 16
 80131ae:	e90dffde 	bez      	r13, 0x801316a	// 801316a <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 80131b2:	e5b42400 	andi      	r13, r20, 1024
 80131b6:	e92dffb6 	bnez      	r13, 0x8013122	// 8013122 <_ntoa_format+0xae>
 80131ba:	c5930480 	cmpne      	r19, r12
 80131be:	0c04      	bf      	0x80131c6	// 80131c6 <_ntoa_format+0x152>
 80131c0:	c64c0480 	cmpne      	r12, r18
 80131c4:	0baf      	bt      	0x8013122	// 8013122 <_ntoa_format+0xae>
      len--;
 80131c6:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 80131ca:	e90d0046 	bez      	r13, 0x8013256	// 8013256 <_ntoa_format+0x1e2>
 80131ce:	c4194824 	lsli      	r4, r25, 0
 80131d2:	3c50      	cmpnei      	r4, 16
 80131d4:	0c1c      	bf      	0x801320c	// 801320c <_ntoa_format+0x198>
 80131d6:	6f37      	mov      	r12, r13
 80131d8:	07a9      	br      	0x801312a	// 801312a <_ntoa_format+0xb6>
      buf[len++] = '-';
 80131da:	ea0d002d 	movi      	r13, 45
 80131de:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80131e2:	e58c0000 	addi      	r12, r12, 1
 80131e6:	07c2      	br      	0x801316a	// 801316a <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80131e8:	c66c0420 	cmphs      	r12, r19
 80131ec:	0b91      	bt      	0x801310e	// 801310e <_ntoa_format+0x9a>
 80131ee:	ea0d001f 	movi      	r13, 31
 80131f2:	6734      	cmphs      	r13, r12
 80131f4:	0b60      	bt      	0x80130b4	// 80130b4 <_ntoa_format+0x40>
 80131f6:	078c      	br      	0x801310e	// 801310e <_ntoa_format+0x9a>
      width--;
 80131f8:	e6521000 	subi      	r18, r18, 1
 80131fc:	07cd      	br      	0x8013196	// 8013196 <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80131fe:	ea0d002b 	movi      	r13, 43
 8013202:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013206:	e58c0000 	addi      	r12, r12, 1
 801320a:	07b0      	br      	0x801316a	// 801316a <_ntoa_format+0xf6>
        len--;
 801320c:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013210:	e5b42020 	andi      	r13, r20, 32
 8013214:	e92d0016 	bnez      	r13, 0x8013240	// 8013240 <_ntoa_format+0x1cc>
 8013218:	eb0c001f 	cmphsi      	r12, 32
 801321c:	0ba7      	bt      	0x801316a	// 801316a <_ntoa_format+0xf6>
      buf[len++] = 'x';
 801321e:	ea0d0078 	movi      	r13, 120
 8013222:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013226:	e58c0000 	addi      	r12, r12, 1
 801322a:	0784      	br      	0x8013132	// 8013132 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801322c:	eb0c001f 	cmphsi      	r12, 32
 8013230:	0b9d      	bt      	0x801316a	// 801316a <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8013232:	ea0d0062 	movi      	r13, 98
 8013236:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801323a:	e58c0000 	addi      	r12, r12, 1
 801323e:	077a      	br      	0x8013132	// 8013132 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013240:	ea0d001f 	movi      	r13, 31
 8013244:	6734      	cmphs      	r13, r12
 8013246:	0f92      	bf      	0x801316a	// 801316a <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8013248:	ea0d0058 	movi      	r13, 88
 801324c:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013250:	e58c0000 	addi      	r12, r12, 1
 8013254:	076f      	br      	0x8013132	// 8013132 <_ntoa_format+0xbe>
 8013256:	6f37      	mov      	r12, r13
 8013258:	0765      	br      	0x8013122	// 8013122 <_ntoa_format+0xae>
	...

0801325c <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 801325c:	14d3      	push      	r4-r6, r15
 801325e:	142f      	subi      	r14, r14, 60
 8013260:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8013264:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8013268:	6d77      	mov      	r5, r13
 801326a:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 801326e:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8013272:	6db7      	mov      	r6, r13
 8013274:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8013278:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 801327c:	e92c000a 	bnez      	r12, 0x8013290	// 8013290 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8013280:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013284:	e7182400 	andi      	r24, r24, 1024
 8013288:	e9380043 	bnez      	r24, 0x801330e	// 801330e <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 801328c:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013290:	e5b82020 	andi      	r13, r24, 32
 8013294:	eb4d0000 	cmpnei      	r13, 0
 8013298:	ea170041 	movi      	r23, 65
 801329c:	ea0d0061 	movi      	r13, 97
 80132a0:	c6ed0c20 	incf      	r23, r13, 0
 80132a4:	e72e001b 	addi      	r25, r14, 28
 80132a8:	c4194832 	lsli      	r18, r25, 0
 80132ac:	ea150000 	movi      	r21, 0
 80132b0:	e6f71009 	subi      	r23, r23, 10
 80132b4:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 80132b8:	c68c802d 	divu      	r13, r12, r20
 80132bc:	c68d8436 	mult      	r22, r13, r20
 80132c0:	c6cc008c 	subu      	r12, r12, r22
 80132c4:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80132c6:	eb0c0009 	cmphsi      	r12, 10
 80132ca:	e6b50000 	addi      	r21, r21, 1
 80132ce:	081c      	bt      	0x8013306	// 8013306 <_ntoa_long+0xaa>
 80132d0:	e58c002f 	addi      	r12, r12, 48
 80132d4:	7730      	zextb      	r12, r12
 80132d6:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 80132da:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80132dc:	e90d0006 	bez      	r13, 0x80132e8	// 80132e8 <_ntoa_long+0x8c>
 80132e0:	e6520000 	addi      	r18, r18, 1
 80132e4:	e833ffea 	bnezad      	r19, 0x80132b8	// 80132b8 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80132e8:	df0e2006 	st.w      	r24, (r14, 0x18)
 80132ec:	b8c5      	st.w      	r6, (r14, 0x14)
 80132ee:	b8a4      	st.w      	r5, (r14, 0x10)
 80132f0:	de8e2003 	st.w      	r20, (r14, 0xc)
 80132f4:	b882      	st.w      	r4, (r14, 0x8)
 80132f6:	deae2001 	st.w      	r21, (r14, 0x4)
 80132fa:	df2e2000 	st.w      	r25, (r14, 0x0)
 80132fe:	e3fffebb 	bsr      	0x8013074	// 8013074 <_ntoa_format>
}
 8013302:	140f      	addi      	r14, r14, 60
 8013304:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013306:	c6ec002c 	addu      	r12, r12, r23
 801330a:	7730      	zextb      	r12, r12
 801330c:	07e5      	br      	0x80132d6	// 80132d6 <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 801330e:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8013312:	c40c4835 	lsli      	r21, r12, 0
 8013316:	e72e001b 	addi      	r25, r14, 28
 801331a:	07e7      	br      	0x80132e8	// 80132e8 <_ntoa_long+0x8c>

0801331c <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 801331c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013320:	1435      	subi      	r14, r14, 84
 8013322:	c4034831 	lsli      	r17, r3, 0
 8013326:	d96e2020 	ld.w      	r11, (r14, 0x80)
 801332a:	9965      	ld.w      	r3, (r14, 0x94)
 801332c:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8013330:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013332:	c60b2424 	or      	r4, r11, r16
{
 8013336:	9966      	ld.w      	r3, (r14, 0x98)
 8013338:	b86c      	st.w      	r3, (r14, 0x30)
 801333a:	d86e0088 	ld.b      	r3, (r14, 0x88)
 801333e:	b807      	st.w      	r0, (r14, 0x1c)
 8013340:	b828      	st.w      	r1, (r14, 0x20)
 8013342:	b849      	st.w      	r2, (r14, 0x24)
 8013344:	99c3      	ld.w      	r6, (r14, 0x8c)
 8013346:	99e4      	ld.w      	r7, (r14, 0x90)
 8013348:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 801334c:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 801334e:	e9240009 	bnez      	r4, 0x8013360	// 8013360 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013352:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8013356:	c48a2823 	bclri      	r3, r10, 4
 801335a:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 801335c:	e9220033 	bnez      	r2, 0x80133c2	// 80133c2 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013360:	e46a2020 	andi      	r3, r10, 32
 8013364:	3b40      	cmpnei      	r3, 0
 8013366:	ea080041 	movi      	r8, 65
 801336a:	3361      	movi      	r3, 97
 801336c:	c5030c20 	incf      	r8, r3, 0
 8013370:	e52e0033 	addi      	r9, r14, 52
 8013374:	6d67      	mov      	r5, r9
 8013376:	3400      	movi      	r4, 0
 8013378:	e5081009 	subi      	r8, r8, 10
 801337c:	0415      	br      	0x80133a6	// 80133a6 <_ntoa_long_long+0x8a>
 801337e:	202f      	addi      	r0, 48
 8013380:	7400      	zextb      	r0, r0
 8013382:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8013384:	c4104821 	lsli      	r1, r16, 0
 8013388:	6c2f      	mov      	r0, r11
 801338a:	6c9b      	mov      	r2, r6
 801338c:	6cdf      	mov      	r3, r7
 801338e:	e3ffe993 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8013392:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013396:	6c40      	or      	r1, r0
      value /= base;
 8013398:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801339a:	e9010016 	bez      	r1, 0x80133c6	// 80133c6 <_ntoa_long_long+0xaa>
 801339e:	eb440020 	cmpnei      	r4, 32
 80133a2:	2500      	addi      	r5, 1
 80133a4:	0c11      	bf      	0x80133c6	// 80133c6 <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 80133a6:	6c9b      	mov      	r2, r6
 80133a8:	6cdf      	mov      	r3, r7
 80133aa:	6c2f      	mov      	r0, r11
 80133ac:	c4104821 	lsli      	r1, r16, 0
 80133b0:	e3ffeb1c 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 80133b4:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80133b6:	3809      	cmphsi      	r0, 10
 80133b8:	2400      	addi      	r4, 1
 80133ba:	0fe2      	bf      	0x801337e	// 801337e <_ntoa_long_long+0x62>
 80133bc:	6020      	addu      	r0, r8
 80133be:	7400      	zextb      	r0, r0
 80133c0:	07e1      	br      	0x8013382	// 8013382 <_ntoa_long_long+0x66>
 80133c2:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80133c6:	986c      	ld.w      	r3, (r14, 0x30)
 80133c8:	b865      	st.w      	r3, (r14, 0x14)
 80133ca:	986b      	ld.w      	r3, (r14, 0x2c)
 80133cc:	b864      	st.w      	r3, (r14, 0x10)
 80133ce:	986a      	ld.w      	r3, (r14, 0x28)
 80133d0:	b862      	st.w      	r3, (r14, 0x8)
 80133d2:	dd4e2006 	st.w      	r10, (r14, 0x18)
 80133d6:	b8c3      	st.w      	r6, (r14, 0xc)
 80133d8:	b881      	st.w      	r4, (r14, 0x4)
 80133da:	dd2e2000 	st.w      	r9, (r14, 0x0)
 80133de:	c4114823 	lsli      	r3, r17, 0
 80133e2:	9849      	ld.w      	r2, (r14, 0x24)
 80133e4:	9828      	ld.w      	r1, (r14, 0x20)
 80133e6:	9807      	ld.w      	r0, (r14, 0x1c)
 80133e8:	e3fffe46 	bsr      	0x8013074	// 8013074 <_ntoa_format>
}
 80133ec:	1415      	addi      	r14, r14, 84
 80133ee:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

080133f4 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80133f4:	ebe00058 	push      	r4-r11, r15, r16-r17
 80133f8:	1435      	subi      	r14, r14, 84
 80133fa:	6ecf      	mov      	r11, r3
 80133fc:	9962      	ld.w      	r3, (r14, 0x88)
 80133fe:	6e4f      	mov      	r9, r3
 8013400:	9963      	ld.w      	r3, (r14, 0x8c)
 8013402:	9980      	ld.w      	r4, (r14, 0x80)
 8013404:	99a1      	ld.w      	r5, (r14, 0x84)
 8013406:	b865      	st.w      	r3, (r14, 0x14)
 8013408:	9964      	ld.w      	r3, (r14, 0x90)
 801340a:	6d83      	mov      	r6, r0
 801340c:	6dc7      	mov      	r7, r1
 801340e:	6e8b      	mov      	r10, r2
 8013410:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8013412:	6c93      	mov      	r2, r4
 8013414:	6cd7      	mov      	r3, r5
 8013416:	6c13      	mov      	r0, r4
 8013418:	6c57      	mov      	r1, r5
 801341a:	e3ffef9d 	bsr      	0x8011354	// 8011354 <__nedf2>
 801341e:	e920010c 	bnez      	r0, 0x8013636	// 8013636 <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8013422:	3200      	movi      	r2, 0
 8013424:	ea23fff0 	movih      	r3, 65520
 8013428:	2a00      	subi      	r2, 1
 801342a:	2b00      	subi      	r3, 1
 801342c:	6c13      	mov      	r0, r4
 801342e:	9921      	ld.w      	r1, (r14, 0x84)
 8013430:	e3ffefee 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013434:	e980011b 	blz      	r0, 0x801366a	// 801366a <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8013438:	3200      	movi      	r2, 0
 801343a:	ea237ff0 	movih      	r3, 32752
 801343e:	2a00      	subi      	r2, 1
 8013440:	2b00      	subi      	r3, 1
 8013442:	6c13      	mov      	r0, r4
 8013444:	9921      	ld.w      	r1, (r14, 0x84)
 8013446:	e3ffefa3 	bsr      	0x801138c	// 801138c <__gtdf2>
 801344a:	e960001d 	blsz      	r0, 0x8013484	// 8013484 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 801344e:	9806      	ld.w      	r0, (r14, 0x18)
 8013450:	e4402004 	andi      	r2, r0, 4
 8013454:	3a40      	cmpnei      	r2, 0
 8013456:	0137      	lrw      	r1, 0x8014c0c	// 8013774 <_ftoa+0x380>
 8013458:	0177      	lrw      	r3, 0x8014c04	// 8013778 <_ftoa+0x384>
 801345a:	c4610c20 	incf      	r3, r1, 0
 801345e:	3a40      	cmpnei      	r2, 0
 8013460:	3103      	movi      	r1, 3
 8013462:	3204      	movi      	r2, 4
 8013464:	c4410c20 	incf      	r2, r1, 0
 8013468:	9825      	ld.w      	r1, (r14, 0x14)
 801346a:	b803      	st.w      	r0, (r14, 0xc)
 801346c:	b822      	st.w      	r1, (r14, 0x8)
 801346e:	b841      	st.w      	r2, (r14, 0x4)
 8013470:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013472:	6cef      	mov      	r3, r11
 8013474:	6cab      	mov      	r2, r10
 8013476:	6c5f      	mov      	r1, r7
 8013478:	6c1b      	mov      	r0, r6
 801347a:	e3fffdaf 	bsr      	0x8012fd8	// 8012fd8 <_out_rev>
}
 801347e:	1415      	addi      	r14, r14, 84
 8013480:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8013484:	3200      	movi      	r2, 0
 8013486:	0261      	lrw      	r3, 0x41cdcd65	// 801377c <_ftoa+0x388>
 8013488:	6c13      	mov      	r0, r4
 801348a:	9921      	ld.w      	r1, (r14, 0x84)
 801348c:	e3ffef80 	bsr      	0x801138c	// 801138c <__gtdf2>
 8013490:	e94000dc 	bhz      	r0, 0x8013648	// 8013648 <_ftoa+0x254>
 8013494:	3200      	movi      	r2, 0
 8013496:	0264      	lrw      	r3, 0xc1cdcd65	// 8013780 <_ftoa+0x38c>
 8013498:	6c13      	mov      	r0, r4
 801349a:	9921      	ld.w      	r1, (r14, 0x84)
 801349c:	e3ffefb8 	bsr      	0x801140c	// 801140c <__ltdf2>
 80134a0:	e98000d4 	blz      	r0, 0x8013648	// 8013648 <_ftoa+0x254>
  if (value < 0) {
 80134a4:	3200      	movi      	r2, 0
 80134a6:	6ccb      	mov      	r3, r2
 80134a8:	6c13      	mov      	r0, r4
 80134aa:	9921      	ld.w      	r1, (r14, 0x84)
 80134ac:	e3ffefb0 	bsr      	0x801140c	// 801140c <__ltdf2>
 80134b0:	e98001b0 	blz      	r0, 0x8013810	// 8013810 <_ftoa+0x41c>
  bool negative = false;
 80134b4:	3300      	movi      	r3, 0
 80134b6:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 80134b8:	9866      	ld.w      	r3, (r14, 0x18)
 80134ba:	e5a32400 	andi      	r13, r3, 1024
 80134be:	e92d0136 	bnez      	r13, 0x801372a	// 801372a <_ftoa+0x336>
 80134c2:	026e      	lrw      	r3, 0x412e8480	// 8013784 <_ftoa+0x390>
 80134c4:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80134c8:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80134ca:	ea080006 	movi      	r8, 6
 80134ce:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 80134d2:	6c57      	mov      	r1, r5
 80134d4:	6c13      	mov      	r0, r4
 80134d6:	de8e200b 	st.w      	r20, (r14, 0x2c)
 80134da:	ddae200a 	st.w      	r13, (r14, 0x28)
 80134de:	e3ffefe7 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 80134e2:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 80134e4:	e3ffefb0 	bsr      	0x8011444	// 8011444 <__floatsidf>
 80134e8:	6c83      	mov      	r2, r0
 80134ea:	6cc7      	mov      	r3, r1
 80134ec:	6c13      	mov      	r0, r4
 80134ee:	6c57      	mov      	r1, r5
 80134f0:	e3ffed88 	bsr      	0x8011000	// 8011000 <__subdf3>
 80134f4:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80134f8:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80134fc:	6cb3      	mov      	r2, r12
 80134fe:	9868      	ld.w      	r3, (r14, 0x20)
 8013500:	e3ffed9e 	bsr      	0x801103c	// 801103c <__muldf3>
 8013504:	c4014831 	lsli      	r17, r1, 0
 8013508:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 801350c:	e3ffe8b8 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 8013510:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8013512:	e3fff005 	bsr      	0x801151c	// 801151c <__floatunsidf>
 8013516:	6c83      	mov      	r2, r0
 8013518:	6cc7      	mov      	r3, r1
 801351a:	c4104820 	lsli      	r0, r16, 0
 801351e:	c4114821 	lsli      	r1, r17, 0
 8013522:	e3ffed6f 	bsr      	0x8011000	// 8011000 <__subdf3>
  if (diff > 0.5) {
 8013526:	3200      	movi      	r2, 0
 8013528:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 801352c:	c4004830 	lsli      	r16, r0, 0
 8013530:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8013534:	e3ffef2c 	bsr      	0x801138c	// 801138c <__gtdf2>
 8013538:	da4e2009 	ld.w      	r18, (r14, 0x24)
 801353c:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8013540:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8013544:	e96000d3 	blsz      	r0, 0x80136ea	// 80136ea <_ftoa+0x2f6>
    ++frac;
 8013548:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 801354c:	c4124820 	lsli      	r0, r18, 0
 8013550:	de8e2009 	st.w      	r20, (r14, 0x24)
 8013554:	c40d4831 	lsli      	r17, r13, 0
 8013558:	c4124830 	lsli      	r16, r18, 0
 801355c:	e3ffefe0 	bsr      	0x801151c	// 801151c <__floatunsidf>
 8013560:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013564:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013568:	6cf7      	mov      	r3, r13
 801356a:	6cb3      	mov      	r2, r12
 801356c:	e3ffef30 	bsr      	0x80113cc	// 80113cc <__gedf2>
 8013570:	c4104832 	lsli      	r18, r16, 0
 8013574:	c411482d 	lsli      	r13, r17, 0
 8013578:	da8e2009 	ld.w      	r20, (r14, 0x24)
 801357c:	e9a0011f 	bhsz      	r0, 0x80137ba	// 80137ba <_ftoa+0x3c6>
  if (prec == 0U) {
 8013580:	e928007e 	bnez      	r8, 0x801367c	// 801367c <_ftoa+0x288>
    diff = value - (double)whole;
 8013584:	6c27      	mov      	r0, r9
 8013586:	c4144831 	lsli      	r17, r20, 0
 801358a:	c40d4830 	lsli      	r16, r13, 0
 801358e:	e3ffef5b 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013592:	6c83      	mov      	r2, r0
 8013594:	6cc7      	mov      	r3, r1
 8013596:	6c13      	mov      	r0, r4
 8013598:	6c57      	mov      	r1, r5
 801359a:	e3ffed33 	bsr      	0x8011000	// 8011000 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801359e:	6ca3      	mov      	r2, r8
 80135a0:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 80135a4:	6d03      	mov      	r4, r0
 80135a6:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80135a8:	e3ffef32 	bsr      	0x801140c	// 801140c <__ltdf2>
 80135ac:	c410482d 	lsli      	r13, r16, 0
 80135b0:	c4114834 	lsli      	r20, r17, 0
 80135b4:	e98000f5 	blz      	r0, 0x801379e	// 801379e <_ftoa+0x3aa>
 80135b8:	e4692001 	andi      	r3, r9, 1
      ++whole;
 80135bc:	3b40      	cmpnei      	r3, 0
 80135be:	c4690c20 	incf      	r3, r9, 0
 80135c2:	c4690c41 	inct      	r3, r9, 1
 80135c6:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80135c8:	eb4d0020 	cmpnei      	r13, 32
 80135cc:	0c81      	bf      	0x80136ce	// 80136ce <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80135ce:	300a      	movi      	r0, 10
 80135d0:	c4098043 	divs      	r3, r9, r0
 80135d4:	6d27      	mov      	r4, r9
 80135d6:	c4038421 	mult      	r1, r3, r0
 80135da:	5c25      	subu      	r1, r4, r1
 80135dc:	212f      	addi      	r1, 48
 80135de:	e44d0000 	addi      	r2, r13, 1
 80135e2:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 80135e6:	e9030013 	bez      	r3, 0x801360c	// 801360c <_ftoa+0x218>
 80135ea:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80135ee:	eb420020 	cmpnei      	r2, 32
 80135f2:	0c6e      	bf      	0x80136ce	// 80136ce <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80135f4:	c4038041 	divs      	r1, r3, r0
 80135f8:	c401842d 	mult      	r13, r1, r0
 80135fc:	60f6      	subu      	r3, r13
 80135fe:	232f      	addi      	r3, 48
 8013600:	d40c8003 	stbi.b      	r3, (r12)
 8013604:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 8013606:	6cc7      	mov      	r3, r1
 8013608:	e921fff3 	bnez      	r1, 0x80135ee	// 80135ee <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801360c:	9866      	ld.w      	r3, (r14, 0x18)
 801360e:	e4632003 	andi      	r3, r3, 3
 8013612:	3b41      	cmpnei      	r3, 1
 8013614:	0cda      	bf      	0x80137c8	// 80137c8 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013616:	eb420020 	cmpnei      	r2, 32
 801361a:	0d27      	bf      	0x8013868	// 8013868 <_ftoa+0x474>
    if (negative) {
 801361c:	986c      	ld.w      	r3, (r14, 0x30)
 801361e:	e92300bb 	bnez      	r3, 0x8013794	// 8013794 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8013622:	9866      	ld.w      	r3, (r14, 0x18)
 8013624:	e4632004 	andi      	r3, r3, 4
 8013628:	e9030116 	bez      	r3, 0x8013854	// 8013854 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 801362c:	312b      	movi      	r1, 43
 801362e:	5a62      	addi      	r3, r2, 1
 8013630:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8013634:	0453      	br      	0x80136da	// 80136da <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8013636:	9866      	ld.w      	r3, (r14, 0x18)
 8013638:	b863      	st.w      	r3, (r14, 0xc)
 801363a:	9865      	ld.w      	r3, (r14, 0x14)
 801363c:	b862      	st.w      	r3, (r14, 0x8)
 801363e:	3303      	movi      	r3, 3
 8013640:	b861      	st.w      	r3, (r14, 0x4)
 8013642:	1272      	lrw      	r3, 0x8014c10	// 8013788 <_ftoa+0x394>
 8013644:	b860      	st.w      	r3, (r14, 0x0)
 8013646:	0716      	br      	0x8013472	// 8013472 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8013648:	9866      	ld.w      	r3, (r14, 0x18)
 801364a:	b864      	st.w      	r3, (r14, 0x10)
 801364c:	9865      	ld.w      	r3, (r14, 0x14)
 801364e:	b863      	st.w      	r3, (r14, 0xc)
 8013650:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8013654:	b880      	st.w      	r4, (r14, 0x0)
 8013656:	b8a1      	st.w      	r5, (r14, 0x4)
 8013658:	6cef      	mov      	r3, r11
 801365a:	6cab      	mov      	r2, r10
 801365c:	6c5f      	mov      	r1, r7
 801365e:	6c1b      	mov      	r0, r6
 8013660:	e0000116 	bsr      	0x801388c	// 801388c <_etoa>
}
 8013664:	1415      	addi      	r14, r14, 84
 8013666:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 801366a:	9866      	ld.w      	r3, (r14, 0x18)
 801366c:	b863      	st.w      	r3, (r14, 0xc)
 801366e:	9865      	ld.w      	r3, (r14, 0x14)
 8013670:	b862      	st.w      	r3, (r14, 0x8)
 8013672:	3304      	movi      	r3, 4
 8013674:	b861      	st.w      	r3, (r14, 0x4)
 8013676:	1266      	lrw      	r3, 0x8014c14	// 801378c <_ftoa+0x398>
 8013678:	b860      	st.w      	r3, (r14, 0x0)
 801367a:	06fc      	br      	0x8013472	// 8013472 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 801367c:	eb4d0020 	cmpnei      	r13, 32
 8013680:	0c27      	bf      	0x80136ce	// 80136ce <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 8013682:	300a      	movi      	r0, 10
 8013684:	c4128023 	divu      	r3, r18, r0
 8013688:	c4038421 	mult      	r1, r3, r0
 801368c:	c4320092 	subu      	r18, r18, r1
 8013690:	e652002f 	addi      	r18, r18, 48
      --count;
 8013694:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8013698:	e44d0000 	addi      	r2, r13, 1
 801369c:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 80136a0:	e90300c3 	bez      	r3, 0x8013826	// 8013826 <_ftoa+0x432>
 80136a4:	c454002d 	addu      	r13, r20, r2
 80136a8:	0410      	br      	0x80136c8	// 80136c8 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 80136aa:	c4038021 	divu      	r1, r3, r0
 80136ae:	c4018432 	mult      	r18, r1, r0
 80136b2:	c6430083 	subu      	r3, r3, r18
 80136b6:	232f      	addi      	r3, 48
 80136b8:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 80136bc:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 80136c0:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 80136c2:	6cc7      	mov      	r3, r1
 80136c4:	e90100b1 	bez      	r1, 0x8013826	// 8013826 <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80136c8:	eb420020 	cmpnei      	r2, 32
 80136cc:	0bef      	bt      	0x80136aa	// 80136aa <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80136ce:	9866      	ld.w      	r3, (r14, 0x18)
 80136d0:	e4632003 	andi      	r3, r3, 3
 80136d4:	3b41      	cmpnei      	r3, 1
 80136d6:	0c78      	bf      	0x80137c6	// 80137c6 <_ftoa+0x3d2>
 80136d8:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80136da:	9846      	ld.w      	r2, (r14, 0x18)
 80136dc:	b843      	st.w      	r2, (r14, 0xc)
 80136de:	9845      	ld.w      	r2, (r14, 0x14)
 80136e0:	b842      	st.w      	r2, (r14, 0x8)
 80136e2:	b861      	st.w      	r3, (r14, 0x4)
 80136e4:	de8e2000 	st.w      	r20, (r14, 0x0)
 80136e8:	06c5      	br      	0x8013472	// 8013472 <_ftoa+0x7e>
  else if (diff < 0.5) {
 80136ea:	3200      	movi      	r2, 0
 80136ec:	ea233fe0 	movih      	r3, 16352
 80136f0:	c4104820 	lsli      	r0, r16, 0
 80136f4:	c4114821 	lsli      	r1, r17, 0
 80136f8:	de8e200a 	st.w      	r20, (r14, 0x28)
 80136fc:	de4e2009 	st.w      	r18, (r14, 0x24)
 8013700:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8013704:	e3ffee84 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013708:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 801370c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8013710:	da8e200a 	ld.w      	r20, (r14, 0x28)
 8013714:	e980ff36 	blz      	r0, 0x8013580	// 8013580 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 8013718:	e9120006 	bez      	r18, 0x8013724	// 8013724 <_ftoa+0x330>
 801371c:	e4722001 	andi      	r3, r18, 1
 8013720:	e903ff30 	bez      	r3, 0x8013580	// 8013580 <_ftoa+0x18c>
    ++frac;
 8013724:	e6520000 	addi      	r18, r18, 1
 8013728:	072c      	br      	0x8013580	// 8013580 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801372a:	6ce7      	mov      	r3, r9
 801372c:	3b09      	cmphsi      	r3, 10
 801372e:	0c9f      	bf      	0x801386c	// 801386c <_ftoa+0x478>
    buf[len++] = '0';
 8013730:	e68e0033 	addi      	r20, r14, 52
 8013734:	3030      	movi      	r0, 48
 8013736:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801373a:	e5091000 	subi      	r8, r9, 1
 801373e:	e44e0034 	addi      	r2, r14, 53
 8013742:	e4291008 	subi      	r1, r9, 9
 8013746:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 801374a:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801374c:	6476      	cmpne      	r13, r1
 801374e:	0c09      	bf      	0x8013760	// 8013760 <_ftoa+0x36c>
    buf[len++] = '0';
 8013750:	e5ad0000 	addi      	r13, r13, 1
 8013754:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 8013758:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801375c:	e823fff8 	bnezad      	r3, 0x801374c	// 801374c <_ftoa+0x358>
 8013760:	104c      	lrw      	r2, 0x8014c1c	// 8013790 <_ftoa+0x39c>
 8013762:	c4684823 	lsli      	r3, r8, 3
 8013766:	60c8      	addu      	r3, r2
 8013768:	9340      	ld.w      	r2, (r3, 0x0)
 801376a:	9361      	ld.w      	r3, (r3, 0x4)
 801376c:	b847      	st.w      	r2, (r14, 0x1c)
 801376e:	b868      	st.w      	r3, (r14, 0x20)
 8013770:	06b1      	br      	0x80134d2	// 80134d2 <_ftoa+0xde>
 8013772:	0000      	.short	0x0000
 8013774:	08014c0c 	.long	0x08014c0c
 8013778:	08014c04 	.long	0x08014c04
 801377c:	41cdcd65 	.long	0x41cdcd65
 8013780:	c1cdcd65 	.long	0xc1cdcd65
 8013784:	412e8480 	.long	0x412e8480
 8013788:	08014c10 	.long	0x08014c10
 801378c:	08014c14 	.long	0x08014c14
 8013790:	08014c1c 	.long	0x08014c1c
      buf[len++] = '-';
 8013794:	312d      	movi      	r1, 45
 8013796:	5a62      	addi      	r3, r2, 1
 8013798:	d4540021 	str.b      	r1, (r20, r2 << 0)
 801379c:	079f      	br      	0x80136da	// 80136da <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801379e:	6ca3      	mov      	r2, r8
 80137a0:	ea233fe0 	movih      	r3, 16352
 80137a4:	6c13      	mov      	r0, r4
 80137a6:	6c57      	mov      	r1, r5
 80137a8:	e3ffedf2 	bsr      	0x801138c	// 801138c <__gtdf2>
 80137ac:	c410482d 	lsli      	r13, r16, 0
 80137b0:	c4114834 	lsli      	r20, r17, 0
 80137b4:	e960ff0a 	blsz      	r0, 0x80135c8	// 80135c8 <_ftoa+0x1d4>
 80137b8:	0700      	br      	0x80135b8	// 80135b8 <_ftoa+0x1c4>
      ++whole;
 80137ba:	6ce7      	mov      	r3, r9
 80137bc:	2300      	addi      	r3, 1
 80137be:	6e4f      	mov      	r9, r3
      frac = 0;
 80137c0:	ea120000 	movi      	r18, 0
 80137c4:	06de      	br      	0x8013580	// 8013580 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80137c6:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80137c8:	9865      	ld.w      	r3, (r14, 0x14)
 80137ca:	e903ff26 	bez      	r3, 0x8013616	// 8013616 <_ftoa+0x222>
 80137ce:	986c      	ld.w      	r3, (r14, 0x30)
 80137d0:	e9230007 	bnez      	r3, 0x80137de	// 80137de <_ftoa+0x3ea>
 80137d4:	9866      	ld.w      	r3, (r14, 0x18)
 80137d6:	e463200c 	andi      	r3, r3, 12
 80137da:	e9030005 	bez      	r3, 0x80137e4	// 80137e4 <_ftoa+0x3f0>
      width--;
 80137de:	9865      	ld.w      	r3, (r14, 0x14)
 80137e0:	2b00      	subi      	r3, 1
 80137e2:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80137e4:	9865      	ld.w      	r3, (r14, 0x14)
 80137e6:	64c8      	cmphs      	r2, r3
 80137e8:	0b17      	bt      	0x8013616	// 8013616 <_ftoa+0x222>
 80137ea:	eb420020 	cmpnei      	r2, 32
 80137ee:	0c3d      	bf      	0x8013868	// 8013868 <_ftoa+0x474>
 80137f0:	c4540021 	addu      	r1, r20, r2
 80137f4:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 80137f6:	3230      	movi      	r2, 48
 80137f8:	0405      	br      	0x8013802	// 8013802 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80137fa:	eb430020 	cmpnei      	r3, 32
 80137fe:	2100      	addi      	r1, 1
 8013800:	0f6d      	bf      	0x80136da	// 80136da <_ftoa+0x2e6>
      buf[len++] = '0';
 8013802:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8013804:	9805      	ld.w      	r0, (r14, 0x14)
 8013806:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8013808:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801380a:	0bf8      	bt      	0x80137fa	// 80137fa <_ftoa+0x406>
      buf[len++] = '0';
 801380c:	9845      	ld.w      	r2, (r14, 0x14)
 801380e:	0704      	br      	0x8013616	// 8013616 <_ftoa+0x222>
    value = 0 - value;
 8013810:	6c93      	mov      	r2, r4
 8013812:	9961      	ld.w      	r3, (r14, 0x84)
 8013814:	3000      	movi      	r0, 0
 8013816:	3100      	movi      	r1, 0
 8013818:	e3ffebf4 	bsr      	0x8011000	// 8011000 <__subdf3>
    negative = true;
 801381c:	3301      	movi      	r3, 1
    value = 0 - value;
 801381e:	6d03      	mov      	r4, r0
 8013820:	6d47      	mov      	r5, r1
    negative = true;
 8013822:	b86c      	st.w      	r3, (r14, 0x30)
 8013824:	064a      	br      	0x80134b8	// 80134b8 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8013826:	eb420020 	cmpnei      	r2, 32
 801382a:	0f52      	bf      	0x80136ce	// 80136ce <_ftoa+0x2da>
 801382c:	e90c000e 	bez      	r12, 0x8013848	// 8013848 <_ftoa+0x454>
 8013830:	c4540023 	addu      	r3, r20, r2
 8013834:	6308      	addu      	r12, r2
      buf[len++] = '0';
 8013836:	3130      	movi      	r1, 48
 8013838:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801383a:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 801383e:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8013840:	0f47      	bf      	0x80136ce	// 80136ce <_ftoa+0x2da>
 8013842:	670a      	cmpne      	r2, r12
 8013844:	2300      	addi      	r3, 1
 8013846:	0bf9      	bt      	0x8013838	// 8013838 <_ftoa+0x444>
      buf[len++] = '.';
 8013848:	332e      	movi      	r3, 46
 801384a:	e5a20000 	addi      	r13, r2, 1
 801384e:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8013852:	06bb      	br      	0x80135c8	// 80135c8 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8013854:	9866      	ld.w      	r3, (r14, 0x18)
 8013856:	e4632008 	andi      	r3, r3, 8
 801385a:	e9030007 	bez      	r3, 0x8013868	// 8013868 <_ftoa+0x474>
      buf[len++] = ' ';
 801385e:	3120      	movi      	r1, 32
 8013860:	5a62      	addi      	r3, r2, 1
 8013862:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8013866:	073a      	br      	0x80136da	// 80136da <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 8013868:	6ccb      	mov      	r3, r2
 801386a:	0738      	br      	0x80136da	// 80136da <_ftoa+0x2e6>
 801386c:	1047      	lrw      	r2, 0x8014c1c	// 8013888 <_ftoa+0x494>
 801386e:	4363      	lsli      	r3, r3, 3
 8013870:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8013872:	6e27      	mov      	r8, r9
 8013874:	9340      	ld.w      	r2, (r3, 0x0)
 8013876:	9361      	ld.w      	r3, (r3, 0x4)
 8013878:	b847      	st.w      	r2, (r14, 0x1c)
 801387a:	b868      	st.w      	r3, (r14, 0x20)
 801387c:	ea0d0000 	movi      	r13, 0
 8013880:	e68e0033 	addi      	r20, r14, 52
 8013884:	0627      	br      	0x80134d2	// 80134d2 <_ftoa+0xde>
 8013886:	0000      	.short	0x0000
 8013888:	08014c1c 	.long	0x08014c1c

0801388c <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 801388c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013890:	1434      	subi      	r14, r14, 80
 8013892:	6e0f      	mov      	r8, r3
 8013894:	9961      	ld.w      	r3, (r14, 0x84)
 8013896:	b867      	st.w      	r3, (r14, 0x1c)
 8013898:	9962      	ld.w      	r3, (r14, 0x88)
 801389a:	98bf      	ld.w      	r5, (r14, 0x7c)
 801389c:	9980      	ld.w      	r4, (r14, 0x80)
 801389e:	b868      	st.w      	r3, (r14, 0x20)
 80138a0:	9963      	ld.w      	r3, (r14, 0x8c)
 80138a2:	b866      	st.w      	r3, (r14, 0x18)
 80138a4:	6d83      	mov      	r6, r0
 80138a6:	6dc7      	mov      	r7, r1
 80138a8:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 80138aa:	6cd3      	mov      	r3, r4
 80138ac:	6c97      	mov      	r2, r5
 80138ae:	6c17      	mov      	r0, r5
 80138b0:	6c53      	mov      	r1, r4
 80138b2:	e3ffed51 	bsr      	0x8011354	// 8011354 <__nedf2>
 80138b6:	6e43      	mov      	r9, r0
 80138b8:	e92001d7 	bnez      	r0, 0x8013c66	// 8013c66 <_etoa+0x3da>
 80138bc:	3200      	movi      	r2, 0
 80138be:	ea237ff0 	movih      	r3, 32752
 80138c2:	2a00      	subi      	r2, 1
 80138c4:	2b00      	subi      	r3, 1
 80138c6:	6c17      	mov      	r0, r5
 80138c8:	6c53      	mov      	r1, r4
 80138ca:	e3ffed61 	bsr      	0x801138c	// 801138c <__gtdf2>
 80138ce:	e94001cc 	bhz      	r0, 0x8013c66	// 8013c66 <_etoa+0x3da>
 80138d2:	3200      	movi      	r2, 0
 80138d4:	ea23fff0 	movih      	r3, 65520
 80138d8:	2a00      	subi      	r2, 1
 80138da:	2b00      	subi      	r3, 1
 80138dc:	6c17      	mov      	r0, r5
 80138de:	6c53      	mov      	r1, r4
 80138e0:	e3ffed96 	bsr      	0x801140c	// 801140c <__ltdf2>
 80138e4:	e98001c1 	blz      	r0, 0x8013c66	// 8013c66 <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 80138e8:	6ca7      	mov      	r2, r9
 80138ea:	6ce7      	mov      	r3, r9
 80138ec:	6c17      	mov      	r0, r5
 80138ee:	6c53      	mov      	r1, r4
 80138f0:	e3ffed8e 	bsr      	0x801140c	// 801140c <__ltdf2>
    value = -value;
 80138f4:	6e97      	mov      	r10, r5
  if (negative) {
 80138f6:	e9800208 	blz      	r0, 0x8013d06	// 8013d06 <_etoa+0x47a>
 80138fa:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 80138fc:	9866      	ld.w      	r3, (r14, 0x18)
 80138fe:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013902:	3b40      	cmpnei      	r3, 0
 8013904:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 8013906:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8013908:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801390c:	3306      	movi      	r3, 6
 801390e:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8013912:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013916:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8013918:	dd4e200a 	st.w      	r10, (r14, 0x28)
 801391c:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8013920:	e3ffed92 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013924:	0145      	lrw      	r2, 0x509f79fb	// 8013c8c <_etoa+0x400>
 8013926:	0164      	lrw      	r3, 0x3fd34413	// 8013c90 <_etoa+0x404>
 8013928:	e3ffeb8a 	bsr      	0x801103c	// 801103c <__muldf3>
 801392c:	0145      	lrw      	r2, 0x8b60c8b3	// 8013c94 <_etoa+0x408>
 801392e:	0164      	lrw      	r3, 0x3fc68a28	// 8013c98 <_etoa+0x40c>
 8013930:	e3ffeb50 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8013934:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8013938:	da6e2009 	ld.w      	r19, (r14, 0x24)
 801393c:	c40c4836 	lsli      	r22, r12, 0
 8013940:	c4135677 	zext      	r23, r19, 19, 0
 8013944:	ea140000 	movi      	r20, 0
 8013948:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801394c:	c4004831 	lsli      	r17, r0, 0
 8013950:	c4014830 	lsli      	r16, r1, 0
 8013954:	3200      	movi      	r2, 0
 8013956:	c6962420 	or      	r0, r22, r20
 801395a:	c6b72421 	or      	r1, r23, r21
 801395e:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8013962:	dd8e2012 	st.w      	r12, (r14, 0x48)
 8013966:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801396a:	de8e200f 	st.w      	r20, (r14, 0x3c)
 801396e:	deae2010 	st.w      	r21, (r14, 0x40)
 8013972:	e3ffeb47 	bsr      	0x8011000	// 8011000 <__subdf3>
 8013976:	0155      	lrw      	r2, 0x636f4361	// 8013c9c <_etoa+0x410>
 8013978:	0175      	lrw      	r3, 0x3fd287a7	// 8013ca0 <_etoa+0x414>
 801397a:	e3ffeb61 	bsr      	0x801103c	// 801103c <__muldf3>
 801397e:	6c83      	mov      	r2, r0
 8013980:	6cc7      	mov      	r3, r1
 8013982:	c4114820 	lsli      	r0, r17, 0
 8013986:	c4104821 	lsli      	r1, r16, 0
 801398a:	e3ffeb23 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 801398e:	e3ffed8f 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 8013992:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8013994:	e3ffed58 	bsr      	0x8011444	// 8011444 <__floatsidf>
 8013998:	015c      	lrw      	r2, 0x979a371	// 8013ca4 <_etoa+0x418>
 801399a:	017b      	lrw      	r3, 0x400a934f	// 8013ca8 <_etoa+0x41c>
 801399c:	c4004831 	lsli      	r17, r0, 0
 80139a0:	c4014830 	lsli      	r16, r1, 0
 80139a4:	e3ffeb4c 	bsr      	0x801103c	// 801103c <__muldf3>
 80139a8:	3200      	movi      	r2, 0
 80139aa:	ea233fe0 	movih      	r3, 16352
 80139ae:	e3ffeb11 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 80139b2:	e3ffed7d 	bsr      	0x80114ac	// 80114ac <__fixdfsi>
 80139b6:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 80139b8:	0242      	lrw      	r2, 0xbbb55516	// 8013cac <_etoa+0x420>
 80139ba:	0261      	lrw      	r3, 0x40026bb1	// 8013cb0 <_etoa+0x424>
 80139bc:	c4114820 	lsli      	r0, r17, 0
 80139c0:	c4104821 	lsli      	r1, r16, 0
 80139c4:	e3ffeb3c 	bsr      	0x801103c	// 801103c <__muldf3>
 80139c8:	c4004831 	lsli      	r17, r0, 0
 80139cc:	980a      	ld.w      	r0, (r14, 0x28)
 80139ce:	c4014830 	lsli      	r16, r1, 0
 80139d2:	e3ffed39 	bsr      	0x8011444	// 8011444 <__floatsidf>
 80139d6:	0247      	lrw      	r2, 0xfefa39ef	// 8013cb4 <_etoa+0x428>
 80139d8:	0267      	lrw      	r3, 0x3fe62e42	// 8013cb8 <_etoa+0x42c>
 80139da:	e3ffeb31 	bsr      	0x801103c	// 801103c <__muldf3>
 80139de:	6c83      	mov      	r2, r0
 80139e0:	6cc7      	mov      	r3, r1
 80139e2:	c4114820 	lsli      	r0, r17, 0
 80139e6:	c4104821 	lsli      	r1, r16, 0
 80139ea:	e3ffeb0b 	bsr      	0x8011000	// 8011000 <__subdf3>
  const double z2 = z * z;
 80139ee:	6c83      	mov      	r2, r0
 80139f0:	6cc7      	mov      	r3, r1
 80139f2:	b80c      	st.w      	r0, (r14, 0x30)
 80139f4:	b82b      	st.w      	r1, (r14, 0x2c)
 80139f6:	e3ffeb23 	bsr      	0x801103c	// 801103c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80139fa:	da4e200c 	ld.w      	r18, (r14, 0x30)
 80139fe:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8013a02:	c4124822 	lsli      	r2, r18, 0
 8013a06:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8013a08:	c4004831 	lsli      	r17, r0, 0
 8013a0c:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013a10:	c4124820 	lsli      	r0, r18, 0
 8013a14:	6c77      	mov      	r1, r13
 8013a16:	de4e200e 	st.w      	r18, (r14, 0x38)
 8013a1a:	ddae200d 	st.w      	r13, (r14, 0x34)
 8013a1e:	e3ffead9 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a22:	b80c      	st.w      	r0, (r14, 0x30)
 8013a24:	b82b      	st.w      	r1, (r14, 0x2c)
 8013a26:	3200      	movi      	r2, 0
 8013a28:	ea23402c 	movih      	r3, 16428
 8013a2c:	c4114820 	lsli      	r0, r17, 0
 8013a30:	c4104821 	lsli      	r1, r16, 0
 8013a34:	e3ffec04 	bsr      	0x801123c	// 801123c <__divdf3>
 8013a38:	3200      	movi      	r2, 0
 8013a3a:	ea234024 	movih      	r3, 16420
 8013a3e:	e3ffeac9 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a42:	6c83      	mov      	r2, r0
 8013a44:	6cc7      	mov      	r3, r1
 8013a46:	c4114820 	lsli      	r0, r17, 0
 8013a4a:	c4104821 	lsli      	r1, r16, 0
 8013a4e:	e3ffebf7 	bsr      	0x801123c	// 801123c <__divdf3>
 8013a52:	3200      	movi      	r2, 0
 8013a54:	ea234018 	movih      	r3, 16408
 8013a58:	e3ffeabc 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a5c:	6c83      	mov      	r2, r0
 8013a5e:	6cc7      	mov      	r3, r1
 8013a60:	c4114820 	lsli      	r0, r17, 0
 8013a64:	c4104821 	lsli      	r1, r16, 0
 8013a68:	e3ffebea 	bsr      	0x801123c	// 801123c <__divdf3>
 8013a6c:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8013a70:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8013a74:	c4124822 	lsli      	r2, r18, 0
 8013a78:	6cf7      	mov      	r3, r13
 8013a7a:	c4004831 	lsli      	r17, r0, 0
 8013a7e:	c4014830 	lsli      	r16, r1, 0
 8013a82:	3000      	movi      	r0, 0
 8013a84:	ea214000 	movih      	r1, 16384
 8013a88:	e3ffeabc 	bsr      	0x8011000	// 8011000 <__subdf3>
 8013a8c:	6c83      	mov      	r2, r0
 8013a8e:	6cc7      	mov      	r3, r1
 8013a90:	c4114820 	lsli      	r0, r17, 0
 8013a94:	c4104821 	lsli      	r1, r16, 0
 8013a98:	e3ffea9c 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
 8013a9c:	daee200c 	ld.w      	r23, (r14, 0x30)
 8013aa0:	dace200b 	ld.w      	r22, (r14, 0x2c)
 8013aa4:	6c83      	mov      	r2, r0
 8013aa6:	6cc7      	mov      	r3, r1
 8013aa8:	c4174820 	lsli      	r0, r23, 0
 8013aac:	c4164821 	lsli      	r1, r22, 0
 8013ab0:	e3ffebc6 	bsr      	0x801123c	// 801123c <__divdf3>
 8013ab4:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8013ab8:	daae2010 	ld.w      	r21, (r14, 0x40)
 8013abc:	c4144822 	lsli      	r2, r20, 0
 8013ac0:	c4154823 	lsli      	r3, r21, 0
 8013ac4:	e3ffea86 	bsr      	0x8010fd0	// 8010fd0 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8013ac8:	984a      	ld.w      	r2, (r14, 0x28)
 8013aca:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013ace:	4374      	lsli      	r3, r3, 20
 8013ad0:	3200      	movi      	r2, 0
 8013ad2:	e3ffeab5 	bsr      	0x801103c	// 801103c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 8013ad6:	d98e2012 	ld.w      	r12, (r14, 0x48)
 8013ada:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8013ade:	6c83      	mov      	r2, r0
 8013ae0:	c4004830 	lsli      	r16, r0, 0
 8013ae4:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8013ae6:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 8013aea:	6c33      	mov      	r0, r12
 8013aec:	c4134821 	lsli      	r1, r19, 0
 8013af0:	e3ffec8e 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013af4:	c4104832 	lsli      	r18, r16, 0
 8013af8:	e9a00012 	bhsz      	r0, 0x8013b1c	// 8013b1c <_etoa+0x290>
    expval--;
 8013afc:	9869      	ld.w      	r3, (r14, 0x24)
 8013afe:	2b00      	subi      	r3, 1
 8013b00:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8013b02:	c4114821 	lsli      	r1, r17, 0
 8013b06:	3200      	movi      	r2, 0
 8013b08:	ea234024 	movih      	r3, 16420
 8013b0c:	c4104820 	lsli      	r0, r16, 0
 8013b10:	e3ffeb96 	bsr      	0x801123c	// 801123c <__divdf3>
 8013b14:	c4004832 	lsli      	r18, r0, 0
 8013b18:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8013b1c:	9849      	ld.w      	r2, (r14, 0x24)
 8013b1e:	e4620062 	addi      	r3, r2, 99
 8013b22:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8013b26:	9866      	ld.w      	r3, (r14, 0x18)
 8013b28:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8013b2c:	c4000510 	mvc      	r16
 8013b30:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8013b34:	e9030027 	bez      	r3, 0x8013b82	// 8013b82 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8013b38:	1341      	lrw      	r2, 0xeb1c432d	// 8013cbc <_etoa+0x430>
 8013b3a:	1362      	lrw      	r3, 0x3f1a36e2	// 8013cc0 <_etoa+0x434>
 8013b3c:	6c2b      	mov      	r0, r10
 8013b3e:	6c67      	mov      	r1, r9
 8013b40:	de4e200a 	st.w      	r18, (r14, 0x28)
 8013b44:	e3ffec44 	bsr      	0x80113cc	// 80113cc <__gedf2>
 8013b48:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8013b4c:	e98000cd 	blz      	r0, 0x8013ce6	// 8013ce6 <_etoa+0x45a>
 8013b50:	3200      	movi      	r2, 0
 8013b52:	127d      	lrw      	r3, 0x412e8480	// 8013cc4 <_etoa+0x438>
 8013b54:	6c2b      	mov      	r0, r10
 8013b56:	6c67      	mov      	r1, r9
 8013b58:	e3ffec5a 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013b5c:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8013b60:	e9a000c3 	bhsz      	r0, 0x8013ce6	// 8013ce6 <_etoa+0x45a>
      if ((int)prec > expval) {
 8013b64:	9849      	ld.w      	r2, (r14, 0x24)
 8013b66:	9867      	ld.w      	r3, (r14, 0x1c)
 8013b68:	64c9      	cmplt      	r2, r3
 8013b6a:	0cd4      	bf      	0x8013d12	// 8013d12 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8013b6c:	60ca      	subu      	r3, r2
 8013b6e:	2b00      	subi      	r3, 1
 8013b70:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8013b72:	9866      	ld.w      	r3, (r14, 0x18)
 8013b74:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8013b78:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8013b7c:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 8013b7e:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8013b82:	9848      	ld.w      	r2, (r14, 0x20)
 8013b84:	c602008c 	subu      	r12, r2, r16
 8013b88:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8013b8c:	9846      	ld.w      	r2, (r14, 0x18)
 8013b8e:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8013b92:	3300      	movi      	r3, 0
 8013b94:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8013b98:	b84a      	st.w      	r2, (r14, 0x28)
 8013b9a:	e9020006 	bez      	r2, 0x8013ba6	// 8013ba6 <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8013b9e:	eb500000 	cmpnei      	r16, 0
 8013ba2:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8013ba6:	9869      	ld.w      	r3, (r14, 0x24)
 8013ba8:	e9230090 	bnez      	r3, 0x8013cc8	// 8013cc8 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8013bac:	3200      	movi      	r2, 0
 8013bae:	6ccb      	mov      	r3, r2
 8013bb0:	6c17      	mov      	r0, r5
 8013bb2:	6c53      	mov      	r1, r4
 8013bb4:	c40c4831 	lsli      	r17, r12, 0
 8013bb8:	e3ffec2a 	bsr      	0x801140c	// 801140c <__ltdf2>
 8013bbc:	c411482c 	lsli      	r12, r17, 0
 8013bc0:	e980009e 	blz      	r0, 0x8013cfc	// 8013cfc <_etoa+0x470>
 8013bc4:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8013bc8:	98a7      	ld.w      	r5, (r14, 0x1c)
 8013bca:	c5712823 	bclri      	r3, r17, 11
 8013bce:	b864      	st.w      	r3, (r14, 0x10)
 8013bd0:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8013bd4:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8013bd8:	b8a2      	st.w      	r5, (r14, 0x8)
 8013bda:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8013bde:	6ce3      	mov      	r3, r8
 8013be0:	6caf      	mov      	r2, r11
 8013be2:	6c5f      	mov      	r1, r7
 8013be4:	6c1b      	mov      	r0, r6
 8013be6:	e3fffc07 	bsr      	0x80133f4	// 80133f4 <_ftoa>
 8013bea:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8013bec:	6e57      	mov      	r9, r5
 8013bee:	e925004b 	bnez      	r5, 0x8013c84	// 8013c84 <_etoa+0x3f8>
 8013bf2:	e9100049 	bez      	r16, 0x8013c84	// 8013c84 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8013bf6:	e4712020 	andi      	r3, r17, 32
 8013bfa:	3b40      	cmpnei      	r3, 0
 8013bfc:	6c83      	mov      	r2, r0
 8013bfe:	ea0c0065 	movi      	r12, 101
 8013c02:	58a2      	addi      	r5, r0, 1
 8013c04:	3045      	movi      	r0, 69
 8013c06:	c40c0c20 	incf      	r0, r12, 0
 8013c0a:	6ce3      	mov      	r3, r8
 8013c0c:	6c5f      	mov      	r1, r7
 8013c0e:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8013c10:	3305      	movi      	r3, 5
 8013c12:	9849      	ld.w      	r2, (r14, 0x24)
 8013c14:	b865      	st.w      	r3, (r14, 0x14)
 8013c16:	330a      	movi      	r3, 10
 8013c18:	b862      	st.w      	r3, (r14, 0x8)
 8013c1a:	4a7f      	lsri      	r3, r2, 31
 8013c1c:	b861      	st.w      	r3, (r14, 0x4)
 8013c1e:	e6101000 	subi      	r16, r16, 1
 8013c22:	c4020203 	abs      	r3, r2
 8013c26:	b860      	st.w      	r3, (r14, 0x0)
 8013c28:	de0e2004 	st.w      	r16, (r14, 0x10)
 8013c2c:	6ce3      	mov      	r3, r8
 8013c2e:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8013c32:	6c97      	mov      	r2, r5
 8013c34:	6c5f      	mov      	r1, r7
 8013c36:	6c1b      	mov      	r0, r6
 8013c38:	e3fffb12 	bsr      	0x801325c	// 801325c <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8013c3c:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8013c3e:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8013c40:	e9030022 	bez      	r3, 0x8013c84	// 8013c84 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8013c44:	c5600083 	subu      	r3, r0, r11
 8013c48:	98a8      	ld.w      	r5, (r14, 0x20)
 8013c4a:	654c      	cmphs      	r3, r5
 8013c4c:	081c      	bt      	0x8013c84	// 8013c84 <_etoa+0x3f8>
 8013c4e:	6c83      	mov      	r2, r0
 8013c50:	2400      	addi      	r4, 1
 8013c52:	6ce3      	mov      	r3, r8
 8013c54:	6c5f      	mov      	r1, r7
 8013c56:	3020      	movi      	r0, 32
 8013c58:	7bd9      	jsr      	r6
 8013c5a:	c5640083 	subu      	r3, r4, r11
 8013c5e:	654c      	cmphs      	r3, r5
 8013c60:	6c93      	mov      	r2, r4
 8013c62:	0ff7      	bf      	0x8013c50	// 8013c50 <_etoa+0x3c4>
 8013c64:	0410      	br      	0x8013c84	// 8013c84 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8013c66:	9866      	ld.w      	r3, (r14, 0x18)
 8013c68:	b864      	st.w      	r3, (r14, 0x10)
 8013c6a:	9868      	ld.w      	r3, (r14, 0x20)
 8013c6c:	b863      	st.w      	r3, (r14, 0xc)
 8013c6e:	9867      	ld.w      	r3, (r14, 0x1c)
 8013c70:	b862      	st.w      	r3, (r14, 0x8)
 8013c72:	b881      	st.w      	r4, (r14, 0x4)
 8013c74:	b8a0      	st.w      	r5, (r14, 0x0)
 8013c76:	6ce3      	mov      	r3, r8
 8013c78:	6caf      	mov      	r2, r11
 8013c7a:	6c5f      	mov      	r1, r7
 8013c7c:	6c1b      	mov      	r0, r6
 8013c7e:	e3fffbbb 	bsr      	0x80133f4	// 80133f4 <_ftoa>
 8013c82:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8013c84:	6c13      	mov      	r0, r4
 8013c86:	1414      	addi      	r14, r14, 80
 8013c88:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8013c8c:	509f79fb 	.long	0x509f79fb
 8013c90:	3fd34413 	.long	0x3fd34413
 8013c94:	8b60c8b3 	.long	0x8b60c8b3
 8013c98:	3fc68a28 	.long	0x3fc68a28
 8013c9c:	636f4361 	.long	0x636f4361
 8013ca0:	3fd287a7 	.long	0x3fd287a7
 8013ca4:	0979a371 	.long	0x0979a371
 8013ca8:	400a934f 	.long	0x400a934f
 8013cac:	bbb55516 	.long	0xbbb55516
 8013cb0:	40026bb1 	.long	0x40026bb1
 8013cb4:	fefa39ef 	.long	0xfefa39ef
 8013cb8:	3fe62e42 	.long	0x3fe62e42
 8013cbc:	eb1c432d 	.long	0xeb1c432d
 8013cc0:	3f1a36e2 	.long	0x3f1a36e2
 8013cc4:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8013cc8:	6c2b      	mov      	r0, r10
 8013cca:	6c67      	mov      	r1, r9
 8013ccc:	c4124822 	lsli      	r2, r18, 0
 8013cd0:	c4114823 	lsli      	r3, r17, 0
 8013cd4:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8013cd8:	e3ffeab2 	bsr      	0x801123c	// 801123c <__divdf3>
 8013cdc:	6e83      	mov      	r10, r0
 8013cde:	6e47      	mov      	r9, r1
 8013ce0:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8013ce4:	0764      	br      	0x8013bac	// 8013bac <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8013ce6:	9847      	ld.w      	r2, (r14, 0x1c)
 8013ce8:	e902ff4d 	bez      	r2, 0x8013b82	// 8013b82 <_etoa+0x2f6>
        --prec;
 8013cec:	9873      	ld.w      	r3, (r14, 0x4c)
 8013cee:	3b40      	cmpnei      	r3, 0
 8013cf0:	c4620c20 	incf      	r3, r2, 0
 8013cf4:	c4620d01 	dect      	r3, r2, 1
 8013cf8:	b867      	st.w      	r3, (r14, 0x1c)
 8013cfa:	0744      	br      	0x8013b82	// 8013b82 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8013cfc:	ea238000 	movih      	r3, 32768
 8013d00:	60e4      	addu      	r3, r9
 8013d02:	6e4f      	mov      	r9, r3
 8013d04:	0760      	br      	0x8013bc4	// 8013bc4 <_etoa+0x338>
    value = -value;
 8013d06:	ea238000 	movih      	r3, 32768
 8013d0a:	c4640029 	addu      	r9, r4, r3
 8013d0e:	e800fdf7 	br      	0x80138fc	// 80138fc <_etoa+0x70>
      if ((int)prec > expval) {
 8013d12:	3300      	movi      	r3, 0
 8013d14:	072e      	br      	0x8013b70	// 8013b70 <_etoa+0x2e4>
	...

08013d18 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8013d18:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013d1c:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8013d1e:	3940      	cmpnei      	r1, 0
 8013d20:	10cf      	lrw      	r6, 0x8012fd4	// 8013d5c <_vsnprintf+0x44>
{
 8013d22:	6e07      	mov      	r8, r1
 8013d24:	6dcb      	mov      	r7, r2
 8013d26:	6d4f      	mov      	r5, r3
 8013d28:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 8013d2a:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8013d2e:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8013d32:	ea89000c 	lrw      	r9, 0x8014a24	// 8013d60 <_vsnprintf+0x48>
  while (*format)
 8013d36:	8500      	ld.b      	r0, (r5, 0x0)
 8013d38:	e900006f 	bez      	r0, 0x8013e16	// 8013e16 <_vsnprintf+0xfe>
    if (*format != '%') {
 8013d3c:	eb400025 	cmpnei      	r0, 37
 8013d40:	0860      	bt      	0x8013e00	// 8013e00 <_vsnprintf+0xe8>
      format++;
 8013d42:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8013d44:	3100      	movi      	r1, 0
      switch (*format) {
 8013d46:	8200      	ld.b      	r0, (r2, 0x0)
 8013d48:	e460101f 	subi      	r3, r0, 32
 8013d4c:	74cc      	zextb      	r3, r3
 8013d4e:	3b10      	cmphsi      	r3, 17
 8013d50:	6d4b      	mov      	r5, r2
 8013d52:	081d      	bt      	0x8013d8c	// 8013d8c <_vsnprintf+0x74>
 8013d54:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8013d58:	780c      	jmp      	r3
 8013d5a:	0000      	.short	0x0000
 8013d5c:	08012fd4 	.long	0x08012fd4
 8013d60:	08014a24 	.long	0x08014a24
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8013d64:	ec210001 	ori      	r1, r1, 1
 8013d68:	2200      	addi      	r2, 1
 8013d6a:	07ee      	br      	0x8013d46	// 8013d46 <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8013d6c:	ec210008 	ori      	r1, r1, 8
 8013d70:	2200      	addi      	r2, 1
 8013d72:	07ea      	br      	0x8013d46	// 8013d46 <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8013d74:	ec210010 	ori      	r1, r1, 16
 8013d78:	2200      	addi      	r2, 1
 8013d7a:	07e6      	br      	0x8013d46	// 8013d46 <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 8013d7c:	ec210004 	ori      	r1, r1, 4
 8013d80:	2200      	addi      	r2, 1
 8013d82:	07e2      	br      	0x8013d46	// 8013d46 <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8013d84:	ec210002 	ori      	r1, r1, 2
 8013d88:	2200      	addi      	r2, 1
 8013d8a:	07de      	br      	0x8013d46	// 8013d46 <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8013d8c:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8013d90:	74cc      	zextb      	r3, r3
 8013d92:	3b09      	cmphsi      	r3, 10
 8013d94:	0c5b      	bf      	0x8013e4a	// 8013e4a <_vsnprintf+0x132>
    else if (*format == '*') {
 8013d96:	eb40002a 	cmpnei      	r0, 42
 8013d9a:	e84003c3 	bf      	0x8014520	// 8014520 <_vsnprintf+0x808>
    width = 0U;
 8013d9e:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 8013da2:	eb40002e 	cmpnei      	r0, 46
 8013da6:	0c65      	bf      	0x8013e70	// 8013e70 <_vsnprintf+0x158>
    precision = 0U;
 8013da8:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8013dac:	e4601067 	subi      	r3, r0, 104
 8013db0:	74cc      	zextb      	r3, r3
 8013db2:	3b12      	cmphsi      	r3, 19
 8013db4:	080c      	bt      	0x8013dcc	// 8013dcc <_vsnprintf+0xb4>
 8013db6:	1043      	lrw      	r2, 0x8014a68	// 8013dc0 <_vsnprintf+0xa8>
 8013db8:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8013dbc:	780c      	jmp      	r3
 8013dbe:	0000      	.short	0x0000
 8013dc0:	08014a68 	.long	0x08014a68
 8013dc4:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8013dc6:	ec210100 	ori      	r1, r1, 256
        format++;
 8013dca:	2500      	addi      	r5, 1
    switch (*format) {
 8013dcc:	e4601024 	subi      	r3, r0, 37
 8013dd0:	74cc      	zextb      	r3, r3
 8013dd2:	eb030053 	cmphsi      	r3, 84
 8013dd6:	0815      	bt      	0x8013e00	// 8013e00 <_vsnprintf+0xe8>
 8013dd8:	1042      	lrw      	r2, 0x8014ab4	// 8013de0 <_vsnprintf+0xc8>
 8013dda:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8013dde:	780c      	jmp      	r3
 8013de0:	08014ab4 	.long	0x08014ab4
        if (*format == 'l') {
 8013de4:	8501      	ld.b      	r0, (r5, 0x1)
 8013de6:	eb40006c 	cmpnei      	r0, 108
 8013dea:	e84003ac 	bf      	0x8014542	// 8014542 <_vsnprintf+0x82a>
    switch (*format) {
 8013dee:	e4601024 	subi      	r3, r0, 37
 8013df2:	74cc      	zextb      	r3, r3
 8013df4:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8013df8:	ec210100 	ori      	r1, r1, 256
        format++;
 8013dfc:	2500      	addi      	r5, 1
    switch (*format) {
 8013dfe:	0fed      	bf      	0x8013dd8	// 8013dd8 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8013e00:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8013e02:	6caf      	mov      	r2, r11
 8013e04:	6cdf      	mov      	r3, r7
 8013e06:	6c63      	mov      	r1, r8
 8013e08:	7bd9      	jsr      	r6
  while (*format)
 8013e0a:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8013e0c:	e54b0000 	addi      	r10, r11, 1
 8013e10:	6eeb      	mov      	r11, r10
  while (*format)
 8013e12:	e920ff95 	bnez      	r0, 0x8013d3c	// 8013d3c <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8013e16:	65ec      	cmphs      	r11, r7
 8013e18:	e8400381 	bf      	0x801451a	// 801451a <_vsnprintf+0x802>
 8013e1c:	5f43      	subi      	r2, r7, 1
 8013e1e:	6cdf      	mov      	r3, r7
 8013e20:	6c63      	mov      	r1, r8
 8013e22:	3000      	movi      	r0, 0
 8013e24:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8013e26:	6c2f      	mov      	r0, r11
 8013e28:	1416      	addi      	r14, r14, 88
 8013e2a:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 8013e2e:	8501      	ld.b      	r0, (r5, 0x1)
 8013e30:	eb400068 	cmpnei      	r0, 104
 8013e34:	e8400381 	bf      	0x8014536	// 8014536 <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8013e38:	ec210080 	ori      	r1, r1, 128
        format++;
 8013e3c:	2500      	addi      	r5, 1
 8013e3e:	07c7      	br      	0x8013dcc	// 8013dcc <_vsnprintf+0xb4>
 8013e40:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8013e42:	ec210200 	ori      	r1, r1, 512
        format++;
 8013e46:	2500      	addi      	r5, 1
        break;
 8013e48:	07c2      	br      	0x8013dcc	// 8013dcc <_vsnprintf+0xb4>
 8013e4a:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013e4e:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8013e52:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013e54:	2500      	addi      	r5, 1
 8013e56:	f9b18440 	mula.32.l      	r0, r17, r13
 8013e5a:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 8013e5e:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8013e60:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8013e64:	74cc      	zextb      	r3, r3
 8013e66:	64c8      	cmphs      	r2, r3
 8013e68:	0bf6      	bt      	0x8013e54	// 8013e54 <_vsnprintf+0x13c>
    if (*format == '.') {
 8013e6a:	eb40002e 	cmpnei      	r0, 46
 8013e6e:	0b9d      	bt      	0x8013da8	// 8013da8 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8013e70:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8013e72:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8013e76:	74cc      	zextb      	r3, r3
 8013e78:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8013e7a:	ec210400 	ori      	r1, r1, 1024
      format++;
 8013e7e:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 8013e80:	0813      	bt      	0x8013ea6	// 8013ea6 <_vsnprintf+0x18e>
 8013e82:	6d4b      	mov      	r5, r2
 8013e84:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013e88:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8013e8c:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013e8e:	2500      	addi      	r5, 1
 8013e90:	fa4a8440 	mula.32.l      	r0, r10, r18
 8013e94:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8013e98:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8013e9a:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8013e9e:	74cc      	zextb      	r3, r3
 8013ea0:	64c8      	cmphs      	r2, r3
 8013ea2:	0bf6      	bt      	0x8013e8e	// 8013e8e <_vsnprintf+0x176>
 8013ea4:	0784      	br      	0x8013dac	// 8013dac <_vsnprintf+0x94>
      else if (*format == '*') {
 8013ea6:	eb40002a 	cmpnei      	r0, 42
 8013eaa:	e84003e2 	bf      	0x801466e	// 801466e <_vsnprintf+0x956>
      format++;
 8013eae:	6d4b      	mov      	r5, r2
 8013eb0:	077c      	br      	0x8013da8	// 8013da8 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8013eb2:	5c6e      	addi      	r3, r4, 4
 8013eb4:	3000      	movi      	r0, 0
 8013eb6:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013eba:	b869      	st.w      	r3, (r14, 0x24)
 8013ebc:	6d03      	mov      	r4, r0
            h = bit / 100;
 8013ebe:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8013ec2:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8013ec6:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8013eca:	ea15002e 	movi      	r21, 46
 8013ece:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8013ed2:	c4164043 	lsr      	r3, r22, r0
 8013ed6:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8013ed8:	c6838022 	divu      	r2, r3, r20
 8013edc:	7748      	zextb      	r13, r2
            if (h)
 8013ede:	e90d0306 	bez      	r13, 0x80144ea	// 80144ea <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8013ee2:	c6828422 	mult      	r2, r2, r20
 8013ee6:	60ca      	subu      	r3, r2
 8013ee8:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8013eea:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8013eee:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8013ef2:	e5840000 	addi      	r12, r4, 1
 8013ef6:	e5ad002f 	addi      	r13, r13, 48
 8013efa:	7730      	zextb      	r12, r12
 8013efc:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8013f00:	e92202fe 	bnez      	r2, 0x80144fc	// 80144fc <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8013f04:	1a0c      	addi      	r2, r14, 48
 8013f06:	2401      	addi      	r4, 2
 8013f08:	7510      	zextb      	r4, r4
 8013f0a:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8013f0e:	c6638022 	divu      	r2, r3, r19
 8013f12:	c6628422 	mult      	r2, r2, r19
 8013f16:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8013f18:	1a0c      	addi      	r2, r14, 48
 8013f1a:	e5840000 	addi      	r12, r4, 1
 8013f1e:	232f      	addi      	r3, 48
 8013f20:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8013f24:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8013f26:	2401      	addi      	r4, 2
 8013f28:	7510      	zextb      	r4, r4
 8013f2a:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8013f2e:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8013f30:	e832ffd1 	bnezad      	r18, 0x8013ed2	// 8013ed2 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8013f34:	e46e002e 	addi      	r3, r14, 47
 8013f38:	3200      	movi      	r2, 0
 8013f3a:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8013f3e:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8013f40:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8013f44:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8013f46:	3a40      	cmpnei      	r2, 0
 8013f48:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8013f4c:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8013f4e:	6c83      	mov      	r2, r0
 8013f50:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8013f54:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8013f58:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8013f5a:	b86b      	st.w      	r3, (r14, 0x2c)
 8013f5c:	e9230333 	bnez      	r3, 0x80145c2	// 80145c2 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8013f60:	c6220420 	cmphs      	r2, r17
 8013f64:	6ccb      	mov      	r3, r2
 8013f66:	2300      	addi      	r3, 1
 8013f68:	e86003ff 	bt      	0x8014766	// 8014766 <_vsnprintf+0xa4e>
 8013f6c:	c5710023 	addu      	r3, r17, r11
 8013f70:	5b89      	subu      	r4, r3, r2
 8013f72:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013f74:	e56b0000 	addi      	r11, r11, 1
 8013f78:	6cdf      	mov      	r3, r7
 8013f7a:	6c63      	mov      	r1, r8
 8013f7c:	3020      	movi      	r0, 32
 8013f7e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013f80:	66d2      	cmpne      	r4, r11
 8013f82:	6caf      	mov      	r2, r11
 8013f84:	0bf8      	bt      	0x8013f74	// 8013f74 <_vsnprintf+0x25c>
 8013f86:	e4710000 	addi      	r3, r17, 1
 8013f8a:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013f8c:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013f90:	e9000030 	bez      	r0, 0x8013ff0	// 8013ff0 <_vsnprintf+0x2d8>
 8013f94:	6caf      	mov      	r2, r11
 8013f96:	e60e002f 	addi      	r16, r14, 48
 8013f9a:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013f9e:	0402      	br      	0x8013fa2	// 8013fa2 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8013fa0:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013fa2:	e90b0007 	bez      	r11, 0x8013fb0	// 8013fb0 <_vsnprintf+0x298>
 8013fa6:	e46a1000 	subi      	r3, r10, 1
 8013faa:	e90a034a 	bez      	r10, 0x801463e	// 801463e <_vsnprintf+0x926>
 8013fae:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8013fb0:	e6100000 	addi      	r16, r16, 1
 8013fb4:	6cdf      	mov      	r3, r7
 8013fb6:	6c63      	mov      	r1, r8
 8013fb8:	5a82      	addi      	r4, r2, 1
 8013fba:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013fbc:	d8100000 	ld.b      	r0, (r16, 0x0)
 8013fc0:	e920fff0 	bnez      	r0, 0x8013fa0	// 8013fa0 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 8013fc4:	986b      	ld.w      	r3, (r14, 0x2c)
 8013fc6:	e90302a5 	bez      	r3, 0x8014510	// 8014510 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8013fca:	9868      	ld.w      	r3, (r14, 0x20)
 8013fcc:	c6230420 	cmphs      	r3, r17
 8013fd0:	e86002a0 	bt      	0x8014510	// 8014510 <_vsnprintf+0x7f8>
 8013fd4:	c4910020 	addu      	r0, r17, r4
 8013fd8:	c460008a 	subu      	r10, r0, r3
 8013fdc:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8013fde:	e5620000 	addi      	r11, r2, 1
 8013fe2:	6cdf      	mov      	r3, r7
 8013fe4:	6c63      	mov      	r1, r8
 8013fe6:	3020      	movi      	r0, 32
 8013fe8:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013fea:	66ea      	cmpne      	r10, r11
 8013fec:	6caf      	mov      	r2, r11
 8013fee:	0bf8      	bt      	0x8013fde	// 8013fde <_vsnprintf+0x2c6>
        format++;
 8013ff0:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013ff2:	9889      	ld.w      	r4, (r14, 0x24)
 8013ff4:	06a1      	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8013ff6:	da042000 	ld.w      	r16, (r4, 0x0)
 8013ffa:	5c6e      	addi      	r3, r4, 4
 8013ffc:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8013ffe:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8014002:	3300      	movi      	r3, 0
 8014004:	2b00      	subi      	r3, 1
 8014006:	eb4a0000 	cmpnei      	r10, 0
 801400a:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 801400e:	c4104824 	lsli      	r4, r16, 0
 8014012:	e9200006 	bnez      	r0, 0x801401e	// 801401e <_vsnprintf+0x306>
 8014016:	0408      	br      	0x8014026	// 8014026 <_vsnprintf+0x30e>
 8014018:	2b00      	subi      	r3, 1
 801401a:	e9030006 	bez      	r3, 0x8014026	// 8014026 <_vsnprintf+0x30e>
 801401e:	2400      	addi      	r4, 1
 8014020:	8440      	ld.b      	r2, (r4, 0x0)
 8014022:	e922fffb 	bnez      	r2, 0x8014018	// 8014018 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8014026:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 801402a:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 801402e:	f944cd23 	min.u32      	r3, r4, r10
 8014032:	3a40      	cmpnei      	r2, 0
 8014034:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014038:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 801403c:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 801403e:	b86a      	st.w      	r3, (r14, 0x28)
 8014040:	e9230287 	bnez      	r3, 0x801454e	// 801454e <_vsnprintf+0x836>
          while (l++ < width) {
 8014044:	c6240420 	cmphs      	r4, r17
 8014048:	5c62      	addi      	r3, r4, 1
 801404a:	e860039c 	bt      	0x8014782	// 8014782 <_vsnprintf+0xa6a>
 801404e:	c5710023 	addu      	r3, r17, r11
 8014052:	5b91      	subu      	r4, r3, r4
 8014054:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014056:	e5620000 	addi      	r11, r2, 1
 801405a:	6cdf      	mov      	r3, r7
 801405c:	6c63      	mov      	r1, r8
 801405e:	3020      	movi      	r0, 32
 8014060:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014062:	66d2      	cmpne      	r4, r11
 8014064:	6caf      	mov      	r2, r11
 8014066:	0bf8      	bt      	0x8014056	// 8014056 <_vsnprintf+0x33e>
 8014068:	c40b4832 	lsli      	r18, r11, 0
 801406c:	e4910000 	addi      	r4, r17, 1
 8014070:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014074:	e9000391 	bez      	r0, 0x8014796	// 8014796 <_vsnprintf+0xa7e>
 8014078:	b88b      	st.w      	r4, (r14, 0x2c)
 801407a:	c4124822 	lsli      	r2, r18, 0
 801407e:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8014082:	0402      	br      	0x8014086	// 8014086 <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8014084:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014086:	e90b0007 	bez      	r11, 0x8014094	// 8014094 <_vsnprintf+0x37c>
 801408a:	e46a1000 	subi      	r3, r10, 1
 801408e:	e90a02d2 	bez      	r10, 0x8014632	// 8014632 <_vsnprintf+0x91a>
 8014092:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8014094:	e6100000 	addi      	r16, r16, 1
 8014098:	6cdf      	mov      	r3, r7
 801409a:	6c63      	mov      	r1, r8
 801409c:	5a82      	addi      	r4, r2, 1
 801409e:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80140a0:	d8100000 	ld.b      	r0, (r16, 0x0)
 80140a4:	e920fff0 	bnez      	r0, 0x8014084	// 8014084 <_vsnprintf+0x36c>
 80140a8:	6ed3      	mov      	r11, r4
 80140aa:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 80140ac:	986a      	ld.w      	r3, (r14, 0x28)
 80140ae:	e9030012 	bez      	r3, 0x80140d2	// 80140d2 <_vsnprintf+0x3ba>
          while (l++ < width) {
 80140b2:	c6240420 	cmphs      	r4, r17
 80140b6:	080e      	bt      	0x80140d2	// 80140d2 <_vsnprintf+0x3ba>
 80140b8:	c5710020 	addu      	r0, r17, r11
 80140bc:	5891      	subu      	r4, r0, r4
 80140be:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80140c0:	e56b0000 	addi      	r11, r11, 1
 80140c4:	6cdf      	mov      	r3, r7
 80140c6:	6c63      	mov      	r1, r8
 80140c8:	3020      	movi      	r0, 32
 80140ca:	7bd9      	jsr      	r6
          while (l++ < width) {
 80140cc:	66d2      	cmpne      	r4, r11
 80140ce:	6caf      	mov      	r2, r11
 80140d0:	0bf8      	bt      	0x80140c0	// 80140c0 <_vsnprintf+0x3a8>
        format++;
 80140d2:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 80140d4:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 80140d6:	0630      	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80140d8:	3308      	movi      	r3, 8
 80140da:	b864      	st.w      	r3, (r14, 0x10)
 80140dc:	3310      	movi      	r3, 16
 80140de:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 80140e0:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80140e4:	3300      	movi      	r3, 0
 80140e6:	b825      	st.w      	r1, (r14, 0x14)
 80140e8:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80140ec:	b861      	st.w      	r3, (r14, 0x4)
 80140ee:	9460      	ld.w      	r3, (r4, 0x0)
 80140f0:	b860      	st.w      	r3, (r14, 0x0)
 80140f2:	6caf      	mov      	r2, r11
 80140f4:	6cdf      	mov      	r3, r7
 80140f6:	6c63      	mov      	r1, r8
 80140f8:	6c1b      	mov      	r0, r6
 80140fa:	e6040003 	addi      	r16, r4, 4
 80140fe:	e3fff8af 	bsr      	0x801325c	// 801325c <_ntoa_long>
 8014102:	6ec3      	mov      	r11, r0
        format++;
 8014104:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014106:	c4104824 	lsli      	r4, r16, 0
        break;
 801410a:	0616      	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 801410c:	e4212002 	andi      	r1, r1, 2
 8014110:	e9210227 	bnez      	r1, 0x801455e	// 801455e <_vsnprintf+0x846>
          while (l++ < width) {
 8014114:	3301      	movi      	r3, 1
 8014116:	c6230420 	cmphs      	r3, r17
 801411a:	e860032f 	bt      	0x8014778	// 8014778 <_vsnprintf+0xa60>
 801411e:	e60b1000 	subi      	r16, r11, 1
 8014122:	c6300030 	addu      	r16, r16, r17
 8014126:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014128:	e5420000 	addi      	r10, r2, 1
 801412c:	6cdf      	mov      	r3, r7
 801412e:	6c63      	mov      	r1, r8
 8014130:	3020      	movi      	r0, 32
 8014132:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014134:	c5500480 	cmpne      	r16, r10
 8014138:	6cab      	mov      	r2, r10
 801413a:	0bf7      	bt      	0x8014128	// 8014128 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801413c:	8400      	ld.b      	r0, (r4, 0x0)
 801413e:	e6040003 	addi      	r16, r4, 4
 8014142:	6cdf      	mov      	r3, r7
 8014144:	6cab      	mov      	r2, r10
 8014146:	6c63      	mov      	r1, r8
 8014148:	e56a0000 	addi      	r11, r10, 1
 801414c:	7bd9      	jsr      	r6
 801414e:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014152:	2500      	addi      	r5, 1
        break;
 8014154:	e800fdf1 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8014158:	eb400078 	cmpnei      	r0, 120
 801415c:	e8400277 	bf      	0x801464a	// 801464a <_vsnprintf+0x932>
 8014160:	eb400058 	cmpnei      	r0, 88
 8014164:	e8400275 	bf      	0x801464e	// 801464e <_vsnprintf+0x936>
        else if (*format == 'o') {
 8014168:	eb40006f 	cmpnei      	r0, 111
 801416c:	e8400232 	bf      	0x80145d0	// 80145d0 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8014170:	eb400062 	cmpnei      	r0, 98
 8014174:	e84002d5 	bf      	0x801471e	// 801471e <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8014178:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 801417c:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8014180:	e8600232 	bt      	0x80145e4	// 80145e4 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8014184:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8014188:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 801418a:	e9010236 	bez      	r1, 0x80145f6	// 80145f6 <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 801418e:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8014190:	eb400069 	cmpnei      	r0, 105
 8014194:	e8400231 	bf      	0x80145f6	// 80145f6 <_vsnprintf+0x8de>
 8014198:	eb400064 	cmpnei      	r0, 100
 801419c:	e840022d 	bf      	0x80145f6	// 80145f6 <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 80141a0:	e4232200 	andi      	r1, r3, 512
 80141a4:	e9210276 	bnez      	r1, 0x8014690	// 8014690 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 80141a8:	e4032100 	andi      	r0, r3, 256
 80141ac:	e92002a2 	bnez      	r0, 0x80146f0	// 80146f0 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80141b0:	e4232040 	andi      	r1, r3, 64
 80141b4:	e92102cf 	bnez      	r1, 0x8014752	// 8014752 <_vsnprintf+0xa3a>
 80141b8:	e4232080 	andi      	r1, r3, 128
 80141bc:	e92102b3 	bnez      	r1, 0x8014722	// 8014722 <_vsnprintf+0xa0a>
 80141c0:	9420      	ld.w      	r1, (r4, 0x0)
 80141c2:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 80141c4:	b865      	st.w      	r3, (r14, 0x14)
 80141c6:	3300      	movi      	r3, 0
 80141c8:	de2e2004 	st.w      	r17, (r14, 0x10)
 80141cc:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80141d0:	b842      	st.w      	r2, (r14, 0x8)
 80141d2:	b861      	st.w      	r3, (r14, 0x4)
 80141d4:	b820      	st.w      	r1, (r14, 0x0)
 80141d6:	6caf      	mov      	r2, r11
 80141d8:	6cdf      	mov      	r3, r7
 80141da:	6c63      	mov      	r1, r8
 80141dc:	6c1b      	mov      	r0, r6
 80141de:	e3fff83f 	bsr      	0x801325c	// 801325c <_ntoa_long>
 80141e2:	6ec3      	mov      	r11, r0
        format++;
 80141e4:	2500      	addi      	r5, 1
 80141e6:	e800fda8 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80141ea:	eb400046 	cmpnei      	r0, 70
 80141ee:	e840023c 	bf      	0x8014666	// 8014666 <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80141f2:	b824      	st.w      	r1, (r14, 0x10)
 80141f4:	de2e2003 	st.w      	r17, (r14, 0xc)
 80141f8:	dd4e2002 	st.w      	r10, (r14, 0x8)
 80141fc:	e6040007 	addi      	r16, r4, 8
 8014200:	9460      	ld.w      	r3, (r4, 0x0)
 8014202:	9481      	ld.w      	r4, (r4, 0x4)
 8014204:	b860      	st.w      	r3, (r14, 0x0)
 8014206:	b881      	st.w      	r4, (r14, 0x4)
 8014208:	6caf      	mov      	r2, r11
 801420a:	6cdf      	mov      	r3, r7
 801420c:	6c63      	mov      	r1, r8
 801420e:	6c1b      	mov      	r0, r6
 8014210:	e3fff8f2 	bsr      	0x80133f4	// 80133f4 <_ftoa>
 8014214:	6ec3      	mov      	r11, r0
        format++;
 8014216:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014218:	c4104824 	lsli      	r4, r16, 0
        break;
 801421c:	e800fd8d 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8014220:	6caf      	mov      	r2, r11
 8014222:	e54b0000 	addi      	r10, r11, 1
 8014226:	6cdf      	mov      	r3, r7
 8014228:	6c63      	mov      	r1, r8
 801422a:	3025      	movi      	r0, 37
 801422c:	7bd9      	jsr      	r6
        format++;
 801422e:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8014230:	6eeb      	mov      	r11, r10
        break;
 8014232:	e800fd82 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8014236:	5c6e      	addi      	r3, r4, 4
 8014238:	dac42000 	ld.w      	r22, (r4, 0x0)
 801423c:	b869      	st.w      	r3, (r14, 0x24)
 801423e:	e716000f 	addi      	r24, r22, 16
 8014242:	3400      	movi      	r4, 0
                if (h > 9)
 8014244:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8014248:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 801424c:	ea0c0000 	movi      	r12, 0
 8014250:	da562000 	ld.w      	r18, (r22, 0x0)
 8014254:	6c33      	mov      	r0, r12
 8014256:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 801425a:	c5924043 	lsr      	r3, r18, r12
 801425e:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8014260:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8014262:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8014266:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 801426a:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 801426e:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8014272:	092e      	bt      	0x80144ce	// 80144ce <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8014274:	e6ae002f 	addi      	r21, r14, 48
 8014278:	2236      	addi      	r2, 55
 801427a:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 801427e:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8014282:	e4930000 	addi      	r4, r19, 1
 8014286:	7510      	zextb      	r4, r4
                if (l > 9)
 8014288:	091e      	bt      	0x80144c4	// 80144c4 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 801428a:	1a0c      	addi      	r2, r14, 48
 801428c:	2336      	addi      	r3, 55
 801428e:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8014292:	e4602001 	andi      	r3, r0, 1
 8014296:	e9030007 	bez      	r3, 0x80142a4	// 80142a4 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 801429a:	1a0c      	addi      	r2, r14, 48
 801429c:	5c62      	addi      	r3, r4, 1
 801429e:	d4820037 	str.b      	r23, (r2, r4 << 0)
 80142a2:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 80142a4:	2000      	addi      	r0, 1
 80142a6:	7400      	zextb      	r0, r0
 80142a8:	e58c0007 	addi      	r12, r12, 8
 80142ac:	e82dffd7 	bnezad      	r13, 0x801425a	// 801425a <_vsnprintf+0x542>
            inuint++;
 80142b0:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 80142b4:	c6d80480 	cmpne      	r24, r22
 80142b8:	0bca      	bt      	0x801424c	// 801424c <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 80142ba:	e46e002e 	addi      	r3, r14, 47
 80142be:	3200      	movi      	r2, 0
 80142c0:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 80142c4:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 80142c6:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 80142ca:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 80142cc:	3a40      	cmpnei      	r2, 0
 80142ce:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 80142d2:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 80142d4:	6c83      	mov      	r2, r0
 80142d6:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 80142da:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 80142de:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80142e0:	b86b      	st.w      	r3, (r14, 0x2c)
 80142e2:	e923015a 	bnez      	r3, 0x8014596	// 8014596 <_vsnprintf+0x87e>
          while (l++ < width) {
 80142e6:	c6220420 	cmphs      	r2, r17
 80142ea:	6ccb      	mov      	r3, r2
 80142ec:	2300      	addi      	r3, 1
 80142ee:	e8600239 	bt      	0x8014760	// 8014760 <_vsnprintf+0xa48>
 80142f2:	c5710023 	addu      	r3, r17, r11
 80142f6:	5b89      	subu      	r4, r3, r2
 80142f8:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80142fa:	e56b0000 	addi      	r11, r11, 1
 80142fe:	6cdf      	mov      	r3, r7
 8014300:	6c63      	mov      	r1, r8
 8014302:	3020      	movi      	r0, 32
 8014304:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014306:	66d2      	cmpne      	r4, r11
 8014308:	6caf      	mov      	r2, r11
 801430a:	0bf8      	bt      	0x80142fa	// 80142fa <_vsnprintf+0x5e2>
 801430c:	e4710000 	addi      	r3, r17, 1
 8014310:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014312:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014316:	e900fe6d 	bez      	r0, 0x8013ff0	// 8013ff0 <_vsnprintf+0x2d8>
 801431a:	6caf      	mov      	r2, r11
 801431c:	e60e002f 	addi      	r16, r14, 48
 8014320:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014324:	0402      	br      	0x8014328	// 8014328 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8014326:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014328:	e90b0007 	bez      	r11, 0x8014336	// 8014336 <_vsnprintf+0x61e>
 801432c:	e46a1000 	subi      	r3, r10, 1
 8014330:	e90a0185 	bez      	r10, 0x801463a	// 801463a <_vsnprintf+0x922>
 8014334:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014336:	e6100000 	addi      	r16, r16, 1
 801433a:	6cdf      	mov      	r3, r7
 801433c:	6c63      	mov      	r1, r8
 801433e:	5a82      	addi      	r4, r2, 1
 8014340:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014342:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014346:	e920fff0 	bnez      	r0, 0x8014326	// 8014326 <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 801434a:	986b      	ld.w      	r3, (r14, 0x2c)
 801434c:	e90300e2 	bez      	r3, 0x8014510	// 8014510 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014350:	9868      	ld.w      	r3, (r14, 0x20)
 8014352:	c6230420 	cmphs      	r3, r17
 8014356:	08dd      	bt      	0x8014510	// 8014510 <_vsnprintf+0x7f8>
 8014358:	c4910020 	addu      	r0, r17, r4
 801435c:	c460008a 	subu      	r10, r0, r3
 8014360:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014362:	e5620000 	addi      	r11, r2, 1
 8014366:	6cdf      	mov      	r3, r7
 8014368:	6c63      	mov      	r1, r8
 801436a:	3020      	movi      	r0, 32
 801436c:	7bd9      	jsr      	r6
          while (l++ < width) {
 801436e:	66ea      	cmpne      	r10, r11
 8014370:	6caf      	mov      	r2, r11
 8014372:	0bf8      	bt      	0x8014362	// 8014362 <_vsnprintf+0x64a>
        format++;
 8014374:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014376:	9889      	ld.w      	r4, (r14, 0x24)
 8014378:	e800fcdf 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 801437c:	5c6e      	addi      	r3, r4, 4
 801437e:	b869      	st.w      	r3, (r14, 0x24)
 8014380:	da642000 	ld.w      	r19, (r4, 0x0)
 8014384:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8014386:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 801438a:	ea15002d 	movi      	r21, 45
 801438e:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8014392:	d8730000 	ld.b      	r3, (r19, 0x0)
 8014396:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8014398:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 801439c:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 80143a0:	089d      	bt      	0x80144da	// 80144da <_vsnprintf+0x7c2>
        if (lbit > 9)
 80143a2:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 80143a6:	2036      	addi      	r0, 55
 80143a8:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80143aa:	089d      	bt      	0x80144e4	// 80144e4 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80143ac:	2336      	addi      	r3, 55
 80143ae:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 80143b0:	dea20002 	st.b      	r21, (r2, 0x2)
 80143b4:	e6730000 	addi      	r19, r19, 1
 80143b8:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 80143ba:	e832ffec 	bnezad      	r18, 0x8014392	// 8014392 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 80143be:	3300      	movi      	r3, 0
 80143c0:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 80143c4:	e4612400 	andi      	r3, r1, 1024
 80143c8:	b86a      	st.w      	r3, (r14, 0x28)
 80143ca:	e90300f3 	bez      	r3, 0x80145b0	// 80145b0 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 80143ce:	ea100011 	movi      	r16, 17
 80143d2:	fa0acd23 	min.u32      	r3, r10, r16
 80143d6:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80143d8:	e4612002 	andi      	r3, r1, 2
 80143dc:	b86b      	st.w      	r3, (r14, 0x2c)
 80143de:	e92300e2 	bnez      	r3, 0x80145a2	// 80145a2 <_vsnprintf+0x88a>
          while (l++ < width) {
 80143e2:	9848      	ld.w      	r2, (r14, 0x20)
 80143e4:	c6220420 	cmphs      	r2, r17
 80143e8:	6ccb      	mov      	r3, r2
 80143ea:	2300      	addi      	r3, 1
 80143ec:	09c9      	bt      	0x801477e	// 801477e <_vsnprintf+0xa66>
 80143ee:	c5710023 	addu      	r3, r17, r11
 80143f2:	c4430090 	subu      	r16, r3, r2
 80143f6:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80143f8:	e56b0000 	addi      	r11, r11, 1
 80143fc:	6cdf      	mov      	r3, r7
 80143fe:	6c63      	mov      	r1, r8
 8014400:	3020      	movi      	r0, 32
 8014402:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014404:	c60b0480 	cmpne      	r11, r16
 8014408:	6caf      	mov      	r2, r11
 801440a:	0bf7      	bt      	0x80143f8	// 80143f8 <_vsnprintf+0x6e0>
 801440c:	e4710000 	addi      	r3, r17, 1
 8014410:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014412:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014416:	e900fded 	bez      	r0, 0x8013ff0	// 8013ff0 <_vsnprintf+0x2d8>
 801441a:	6caf      	mov      	r2, r11
 801441c:	1c0c      	addi      	r4, r14, 48
 801441e:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014422:	0403      	br      	0x8014428	// 8014428 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8014424:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014428:	e90b0007 	bez      	r11, 0x8014436	// 8014436 <_vsnprintf+0x71e>
 801442c:	e46a1000 	subi      	r3, r10, 1
 8014430:	e90a010a 	bez      	r10, 0x8014644	// 8014644 <_vsnprintf+0x92c>
 8014434:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014436:	2400      	addi      	r4, 1
 8014438:	6cdf      	mov      	r3, r7
 801443a:	6c63      	mov      	r1, r8
 801443c:	e6020000 	addi      	r16, r2, 1
 8014440:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014442:	8400      	ld.b      	r0, (r4, 0x0)
 8014444:	e920fff0 	bnez      	r0, 0x8014424	// 8014424 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8014448:	986b      	ld.w      	r3, (r14, 0x2c)
 801444a:	e90300b6 	bez      	r3, 0x80145b6	// 80145b6 <_vsnprintf+0x89e>
          while (l++ < width) {
 801444e:	9868      	ld.w      	r3, (r14, 0x20)
 8014450:	c6230420 	cmphs      	r3, r17
 8014454:	08b1      	bt      	0x80145b6	// 80145b6 <_vsnprintf+0x89e>
 8014456:	c6110020 	addu      	r0, r17, r16
 801445a:	588d      	subu      	r4, r0, r3
 801445c:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8014460:	e5620000 	addi      	r11, r2, 1
 8014464:	6cdf      	mov      	r3, r7
 8014466:	6c63      	mov      	r1, r8
 8014468:	3020      	movi      	r0, 32
 801446a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801446c:	652e      	cmpne      	r11, r4
 801446e:	6caf      	mov      	r2, r11
 8014470:	0bf8      	bt      	0x8014460	// 8014460 <_vsnprintf+0x748>
        format++;
 8014472:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014474:	9889      	ld.w      	r4, (r14, 0x24)
 8014476:	e800fc60 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 801447a:	e46020df 	andi      	r3, r0, 223
 801447e:	eb430047 	cmpnei      	r3, 71
 8014482:	0805      	bt      	0x801448c	// 801448c <_vsnprintf+0x774>
 8014484:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8014488:	e40020fd 	andi      	r0, r0, 253
 801448c:	eb400045 	cmpnei      	r0, 69
 8014490:	0803      	bt      	0x8014496	// 8014496 <_vsnprintf+0x77e>
 8014492:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014496:	b824      	st.w      	r1, (r14, 0x10)
 8014498:	de2e2003 	st.w      	r17, (r14, 0xc)
 801449c:	dd4e2002 	st.w      	r10, (r14, 0x8)
 80144a0:	e6040007 	addi      	r16, r4, 8
 80144a4:	9460      	ld.w      	r3, (r4, 0x0)
 80144a6:	9481      	ld.w      	r4, (r4, 0x4)
 80144a8:	b860      	st.w      	r3, (r14, 0x0)
 80144aa:	b881      	st.w      	r4, (r14, 0x4)
 80144ac:	6caf      	mov      	r2, r11
 80144ae:	6cdf      	mov      	r3, r7
 80144b0:	6c63      	mov      	r1, r8
 80144b2:	6c1b      	mov      	r0, r6
 80144b4:	e3fff9ec 	bsr      	0x801388c	// 801388c <_etoa>
 80144b8:	6ec3      	mov      	r11, r0
        format++;
 80144ba:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80144bc:	c4104824 	lsli      	r4, r16, 0
        break;
 80144c0:	e800fc3b 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 80144c4:	1a0c      	addi      	r2, r14, 48
 80144c6:	232f      	addi      	r3, 48
 80144c8:	d6620023 	str.b      	r3, (r2, r19 << 0)
 80144cc:	06e3      	br      	0x8014292	// 8014292 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 80144ce:	e6ae002f 	addi      	r21, r14, 48
 80144d2:	222f      	addi      	r2, 48
 80144d4:	d4950022 	str.b      	r2, (r21, r4 << 0)
 80144d8:	06d3      	br      	0x801427e	// 801427e <_vsnprintf+0x566>
        if (lbit > 9)
 80144da:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 80144de:	202f      	addi      	r0, 48
 80144e0:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80144e2:	0f65      	bf      	0x80143ac	// 80143ac <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 80144e4:	232f      	addi      	r3, 48
 80144e6:	a261      	st.b      	r3, (r2, 0x1)
 80144e8:	0764      	br      	0x80143b0	// 80143b0 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 80144ea:	c6828422 	mult      	r2, r2, r20
 80144ee:	60ca      	subu      	r3, r2
 80144f0:	74cc      	zextb      	r3, r3
 80144f2:	c6638022 	divu      	r2, r3, r19
            if (m)
 80144f6:	e902fd0c 	bez      	r2, 0x8013f0e	// 8013f0e <_vsnprintf+0x1f6>
 80144fa:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 80144fc:	e5ae002f 	addi      	r13, r14, 48
 8014500:	e48c0000 	addi      	r4, r12, 1
 8014504:	222f      	addi      	r2, 48
 8014506:	7510      	zextb      	r4, r4
 8014508:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 801450c:	e800fd01 	br      	0x8013f0e	// 8013f0e <_vsnprintf+0x1f6>
          while (l++ < width) {
 8014510:	6ed3      	mov      	r11, r4
        format++;
 8014512:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014514:	9889      	ld.w      	r4, (r14, 0x24)
 8014516:	e800fc10 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
 801451a:	6caf      	mov      	r2, r11
 801451c:	e800fc81 	br      	0x8013e1e	// 8013e1e <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8014520:	9400      	ld.w      	r0, (r4, 0x0)
 8014522:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8014524:	e98000af 	blz      	r0, 0x8014682	// 8014682 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 8014528:	c4004831 	lsli      	r17, r0, 0
 801452c:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 801452e:	6d0f      	mov      	r4, r3
      format++;
 8014530:	5aa2      	addi      	r5, r2, 1
 8014532:	e800fc38 	br      	0x8013da2	// 8013da2 <_vsnprintf+0x8a>
 8014536:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 8014538:	ec2100c0 	ori      	r1, r1, 192
          format++;
 801453c:	2501      	addi      	r5, 2
 801453e:	e800fc47 	br      	0x8013dcc	// 8013dcc <_vsnprintf+0xb4>
 8014542:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8014544:	ec210300 	ori      	r1, r1, 768
          format++;
 8014548:	2501      	addi      	r5, 2
 801454a:	e800fc41 	br      	0x8013dcc	// 8013dcc <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801454e:	e900fdb2 	bez      	r0, 0x80140b2	// 80140b2 <_vsnprintf+0x39a>
 8014552:	6caf      	mov      	r2, r11
 8014554:	b88b      	st.w      	r4, (r14, 0x2c)
 8014556:	d96e2009 	ld.w      	r11, (r14, 0x24)
 801455a:	e800fd96 	br      	0x8014086	// 8014086 <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801455e:	6cdf      	mov      	r3, r7
 8014560:	6caf      	mov      	r2, r11
 8014562:	6c63      	mov      	r1, r8
 8014564:	8400      	ld.b      	r0, (r4, 0x0)
 8014566:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014568:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801456c:	e6040003 	addi      	r16, r4, 4
 8014570:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8014574:	0cfc      	bf      	0x801476c	// 801476c <_vsnprintf+0xa54>
 8014576:	c571002b 	addu      	r11, r17, r11
 801457a:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 801457c:	5a82      	addi      	r4, r2, 1
 801457e:	6cdf      	mov      	r3, r7
 8014580:	6c63      	mov      	r1, r8
 8014582:	3020      	movi      	r0, 32
 8014584:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014586:	652e      	cmpne      	r11, r4
 8014588:	6c93      	mov      	r2, r4
 801458a:	0bf9      	bt      	0x801457c	// 801457c <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801458c:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014590:	2500      	addi      	r5, 1
 8014592:	e800fbd2 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014596:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801459a:	e920fec0 	bnez      	r0, 0x801431a	// 801431a <_vsnprintf+0x602>
 801459e:	6d2f      	mov      	r4, r11
 80145a0:	06d8      	br      	0x8014350	// 8014350 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80145a2:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80145a6:	e920ff3a 	bnez      	r0, 0x801441a	// 801441a <_vsnprintf+0x702>
 80145aa:	c40b4830 	lsli      	r16, r11, 0
 80145ae:	0750      	br      	0x801444e	// 801444e <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 80145b0:	3311      	movi      	r3, 17
 80145b2:	b868      	st.w      	r3, (r14, 0x20)
 80145b4:	0712      	br      	0x80143d8	// 80143d8 <_vsnprintf+0x6c0>
          while (l++ < width) {
 80145b6:	c410482b 	lsli      	r11, r16, 0
        format++;
 80145ba:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80145bc:	9889      	ld.w      	r4, (r14, 0x24)
 80145be:	e800fbbc 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80145c2:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80145c6:	e920fce7 	bnez      	r0, 0x8013f94	// 8013f94 <_vsnprintf+0x27c>
 80145ca:	6d2f      	mov      	r4, r11
 80145cc:	e800fcff 	br      	0x8013fca	// 8013fca <_vsnprintf+0x2b2>
          base =  8U;
 80145d0:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80145d2:	c4412823 	bclri      	r3, r1, 2
 80145d6:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80145d8:	e4212400 	andi      	r1, r1, 1024
 80145dc:	e901fdda 	bez      	r1, 0x8014190	// 8014190 <_vsnprintf+0x478>
 80145e0:	e800fdd7 	br      	0x801418e	// 801418e <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 80145e4:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80145e8:	6c4f      	mov      	r1, r3
          base = 10U;
 80145ea:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 80145ec:	0bf3      	bt      	0x80145d2	// 80145d2 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 80145ee:	e4232400 	andi      	r1, r3, 1024
 80145f2:	e921fdce 	bnez      	r1, 0x801418e	// 801418e <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 80145f6:	e4232200 	andi      	r1, r3, 512
 80145fa:	e9210066 	bnez      	r1, 0x80146c6	// 80146c6 <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 80145fe:	e4032100 	andi      	r0, r3, 256
 8014602:	e9200099 	bnez      	r0, 0x8014734	// 8014734 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8014606:	e4232040 	andi      	r1, r3, 64
 801460a:	e92100a8 	bnez      	r1, 0x801475a	// 801475a <_vsnprintf+0xa42>
 801460e:	e4232080 	andi      	r1, r3, 128
 8014612:	e921008c 	bnez      	r1, 0x801472a	// 801472a <_vsnprintf+0xa12>
 8014616:	9420      	ld.w      	r1, (r4, 0x0)
 8014618:	491f      	lsri      	r0, r1, 31
 801461a:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801461c:	b865      	st.w      	r3, (r14, 0x14)
 801461e:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014622:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014626:	b842      	st.w      	r2, (r14, 0x8)
 8014628:	b801      	st.w      	r0, (r14, 0x4)
 801462a:	c4010201 	abs      	r1, r1
 801462e:	e800fdd3 	br      	0x80141d4	// 80141d4 <_vsnprintf+0x4bc>
 8014632:	988b      	ld.w      	r4, (r14, 0x2c)
 8014634:	6ecb      	mov      	r11, r2
 8014636:	e800fd3b 	br      	0x80140ac	// 80140ac <_vsnprintf+0x394>
 801463a:	6d0b      	mov      	r4, r2
 801463c:	0687      	br      	0x801434a	// 801434a <_vsnprintf+0x632>
 801463e:	6d0b      	mov      	r4, r2
 8014640:	e800fcc2 	br      	0x8013fc4	// 8013fc4 <_vsnprintf+0x2ac>
 8014644:	c4024830 	lsli      	r16, r2, 0
 8014648:	0700      	br      	0x8014448	// 8014448 <_vsnprintf+0x730>
          base = 16U;
 801464a:	3210      	movi      	r2, 16
 801464c:	07c3      	br      	0x80145d2	// 80145d2 <_vsnprintf+0x8ba>
 801464e:	c4412823 	bclri      	r3, r1, 2
 8014652:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8014654:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8014658:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 801465c:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 801465e:	e921fd98 	bnez      	r1, 0x801418e	// 801418e <_vsnprintf+0x476>
 8014662:	e800fd9f 	br      	0x80141a0	// 80141a0 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014666:	ec210020 	ori      	r1, r1, 32
 801466a:	e800fdc4 	br      	0x80141f2	// 80141f2 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 801466e:	d9a42000 	ld.w      	r13, (r4, 0x0)
 8014672:	3300      	movi      	r3, 0
 8014674:	8502      	ld.b      	r0, (r5, 0x2)
 8014676:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 801467a:	2403      	addi      	r4, 4
        format++;
 801467c:	2501      	addi      	r5, 2
 801467e:	e800fb97 	br      	0x8013dac	// 8013dac <_vsnprintf+0x94>
        width = (unsigned int)-w;
 8014682:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 8014686:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 801468a:	c40c0091 	subu      	r17, r12, r0
 801468e:	074f      	br      	0x801452c	// 801452c <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8014690:	b867      	st.w      	r3, (r14, 0x1c)
 8014692:	3300      	movi      	r3, 0
 8014694:	de2e2006 	st.w      	r17, (r14, 0x18)
 8014698:	dd4e2005 	st.w      	r10, (r14, 0x14)
 801469c:	b843      	st.w      	r2, (r14, 0xc)
 801469e:	b864      	st.w      	r3, (r14, 0x10)
 80146a0:	b862      	st.w      	r3, (r14, 0x8)
 80146a2:	e6040007 	addi      	r16, r4, 8
 80146a6:	9460      	ld.w      	r3, (r4, 0x0)
 80146a8:	9481      	ld.w      	r4, (r4, 0x4)
 80146aa:	b860      	st.w      	r3, (r14, 0x0)
 80146ac:	b881      	st.w      	r4, (r14, 0x4)
 80146ae:	6caf      	mov      	r2, r11
 80146b0:	6cdf      	mov      	r3, r7
 80146b2:	6c63      	mov      	r1, r8
 80146b4:	6c1b      	mov      	r0, r6
 80146b6:	e3fff633 	bsr      	0x801331c	// 801331c <_ntoa_long_long>
 80146ba:	6ec3      	mov      	r11, r0
 80146bc:	c4104824 	lsli      	r4, r16, 0
        format++;
 80146c0:	2500      	addi      	r5, 1
 80146c2:	e800fb3a 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 80146c6:	9421      	ld.w      	r1, (r4, 0x4)
 80146c8:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80146ca:	b867      	st.w      	r3, (r14, 0x1c)
 80146cc:	3300      	movi      	r3, 0
 80146ce:	b864      	st.w      	r3, (r14, 0x10)
 80146d0:	497f      	lsri      	r3, r1, 31
 80146d2:	b843      	st.w      	r2, (r14, 0xc)
 80146d4:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80146d6:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80146da:	de2e2006 	st.w      	r17, (r14, 0x18)
 80146de:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80146e2:	6c83      	mov      	r2, r0
 80146e4:	6cc7      	mov      	r3, r1
 80146e6:	e9810053 	blz      	r1, 0x801478c	// 801478c <_vsnprintf+0xa74>
 80146ea:	b840      	st.w      	r2, (r14, 0x0)
 80146ec:	b861      	st.w      	r3, (r14, 0x4)
 80146ee:	07e0      	br      	0x80146ae	// 80146ae <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80146f0:	b865      	st.w      	r3, (r14, 0x14)
 80146f2:	de2e2004 	st.w      	r17, (r14, 0x10)
 80146f6:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80146fa:	b842      	st.w      	r2, (r14, 0x8)
 80146fc:	b821      	st.w      	r1, (r14, 0x4)
 80146fe:	9460      	ld.w      	r3, (r4, 0x0)
 8014700:	e6040003 	addi      	r16, r4, 4
 8014704:	b860      	st.w      	r3, (r14, 0x0)
 8014706:	6caf      	mov      	r2, r11
 8014708:	6cdf      	mov      	r3, r7
 801470a:	6c63      	mov      	r1, r8
 801470c:	6c1b      	mov      	r0, r6
 801470e:	e3fff5a7 	bsr      	0x801325c	// 801325c <_ntoa_long>
 8014712:	6ec3      	mov      	r11, r0
 8014714:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014718:	2500      	addi      	r5, 1
 801471a:	e800fb0e 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
          base =  2U;
 801471e:	3202      	movi      	r2, 2
 8014720:	0759      	br      	0x80145d2	// 80145d2 <_vsnprintf+0x8ba>
 8014722:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014724:	2403      	addi      	r4, 4
 8014726:	e800fd4f 	br      	0x80141c4	// 80141c4 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801472a:	d8245000 	ld.hs      	r1, (r4, 0x0)
 801472e:	491f      	lsri      	r0, r1, 31
 8014730:	2403      	addi      	r4, 4
 8014732:	0775      	br      	0x801461c	// 801461c <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8014734:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014736:	b865      	st.w      	r3, (r14, 0x14)
 8014738:	497f      	lsri      	r3, r1, 31
 801473a:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 801473e:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8014742:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014746:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801474a:	b842      	st.w      	r2, (r14, 0x8)
 801474c:	b861      	st.w      	r3, (r14, 0x4)
 801474e:	b820      	st.w      	r1, (r14, 0x0)
 8014750:	07db      	br      	0x8014706	// 8014706 <_vsnprintf+0x9ee>
 8014752:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014754:	2403      	addi      	r4, 4
 8014756:	e800fd37 	br      	0x80141c4	// 80141c4 <_vsnprintf+0x4ac>
 801475a:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801475c:	2403      	addi      	r4, 4
 801475e:	075f      	br      	0x801461c	// 801461c <_vsnprintf+0x904>
          while (l++ < width) {
 8014760:	b868      	st.w      	r3, (r14, 0x20)
 8014762:	e800fdd8 	br      	0x8014312	// 8014312 <_vsnprintf+0x5fa>
          while (l++ < width) {
 8014766:	b868      	st.w      	r3, (r14, 0x20)
 8014768:	e800fc12 	br      	0x8013f8c	// 8013f8c <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801476c:	c4104824 	lsli      	r4, r16, 0
 8014770:	6eeb      	mov      	r11, r10
        format++;
 8014772:	2500      	addi      	r5, 1
 8014774:	e800fae1 	br      	0x8013d36	// 8013d36 <_vsnprintf+0x1e>
          while (l++ < width) {
 8014778:	6eaf      	mov      	r10, r11
 801477a:	e800fce1 	br      	0x801413c	// 801413c <_vsnprintf+0x424>
          while (l++ < width) {
 801477e:	b868      	st.w      	r3, (r14, 0x20)
 8014780:	0649      	br      	0x8014412	// 8014412 <_vsnprintf+0x6fa>
          while (l++ < width) {
 8014782:	6d0f      	mov      	r4, r3
 8014784:	c40b4832 	lsli      	r18, r11, 0
 8014788:	e800fc76 	br      	0x8014074	// 8014074 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801478c:	3000      	movi      	r0, 0
 801478e:	3100      	movi      	r1, 0
 8014790:	f840c462 	sub.64      	r2, r0, r2
 8014794:	07ab      	br      	0x80146ea	// 80146ea <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014796:	c412482b 	lsli      	r11, r18, 0
 801479a:	e800fc9c 	br      	0x80140d2	// 80140d2 <_vsnprintf+0x3ba>
	...

080147a0 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80147a0:	1046      	lrw      	r2, 0x40010600	// 80147b8 <fputc+0x18>
 80147a2:	9267      	ld.w      	r3, (r2, 0x1c)
 80147a4:	e463203f 	andi      	r3, r3, 63
 80147a8:	3b1f      	cmphsi      	r3, 32
 80147aa:	0bfc      	bt      	0x80147a2	// 80147a2 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80147ac:	e40020ff 	andi      	r0, r0, 255
 80147b0:	b208      	st.w      	r0, (r2, 0x20)
}
 80147b2:	3000      	movi      	r0, 0
 80147b4:	783c      	jmp      	r15
 80147b6:	0000      	.short	0x0000
 80147b8:	40010600 	.long	0x40010600

080147bc <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 80147bc:	1424      	subi      	r14, r14, 16
 80147be:	b863      	st.w      	r3, (r14, 0xc)
 80147c0:	b842      	st.w      	r2, (r14, 0x8)
 80147c2:	b821      	st.w      	r1, (r14, 0x4)
 80147c4:	b800      	st.w      	r0, (r14, 0x0)
 80147c6:	14d0      	push      	r15
 80147c8:	1421      	subi      	r14, r14, 4
 80147ca:	9862      	ld.w      	r3, (r14, 0x8)
 80147cc:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80147ce:	1b03      	addi      	r3, r14, 12
 80147d0:	b860      	st.w      	r3, (r14, 0x0)
 80147d2:	6ccb      	mov      	r3, r2
 80147d4:	3200      	movi      	r2, 0
 80147d6:	2a00      	subi      	r2, 1
 80147d8:	6c4f      	mov      	r1, r3
 80147da:	1005      	lrw      	r0, 0x8012fc0	// 80147ec <wm_printf+0x30>
 80147dc:	e3fffa9e 	bsr      	0x8013d18	// 8013d18 <_vsnprintf>
	va_end(args);

	return length;
}
 80147e0:	1401      	addi      	r14, r14, 4
 80147e2:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80147e6:	1405      	addi      	r14, r14, 20
 80147e8:	783c      	jmp      	r15
 80147ea:	0000      	.short	0x0000
 80147ec:	08012fc0 	.long	0x08012fc0

080147f0 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 80147f0:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 80147f2:	1160      	lrw      	r3, 0x20001854	// 8014870 <vTaskSwitchContext+0x80>
 80147f4:	9360      	ld.w      	r3, (r3, 0x0)
 80147f6:	e9230034 	bnez      	r3, 0x801485e	// 801485e <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 80147fa:	105f      	lrw      	r2, 0x2000185c	// 8014874 <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 80147fc:	ea8d001f 	lrw      	r13, 0x20001858	// 8014878 <vTaskSwitchContext+0x88>
 8014800:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 8014802:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8014804:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8014808:	c4238420 	mult      	r0, r3, r1
 801480c:	105c      	lrw      	r2, 0x20001368	// 801487c <vTaskSwitchContext+0x8c>
 801480e:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8014812:	e900000a 	bez      	r0, 0x8014826	// 8014826 <vTaskSwitchContext+0x36>
 8014816:	0411      	br      	0x8014838	// 8014838 <vTaskSwitchContext+0x48>
 8014818:	2b00      	subi      	r3, 1
 801481a:	c4238420 	mult      	r0, r3, r1
 801481e:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8014822:	e920000b 	bnez      	r0, 0x8014838	// 8014838 <vTaskSwitchContext+0x48>
 8014826:	e923fff9 	bnez      	r3, 0x8014818	// 8014818 <vTaskSwitchContext+0x28>
 801482a:	ea020be7 	movi      	r2, 3047
 801482e:	1035      	lrw      	r1, 0x8014c6c	// 8014880 <vTaskSwitchContext+0x90>
 8014830:	1015      	lrw      	r0, 0x8014ca8	// 8014884 <vTaskSwitchContext+0x94>
 8014832:	e3ffffc5 	bsr      	0x80147bc	// 80147bc <wm_printf>
 8014836:	0400      	br      	0x8014836	// 8014836 <vTaskSwitchContext+0x46>
 8014838:	3014      	movi      	r0, 20
 801483a:	7c0c      	mult      	r0, r3
 801483c:	c402002c 	addu      	r12, r2, r0
 8014840:	2007      	addi      	r0, 8
 8014842:	d82c2001 	ld.w      	r1, (r12, 0x4)
 8014846:	6080      	addu      	r2, r0
 8014848:	9121      	ld.w      	r1, (r1, 0x4)
 801484a:	6486      	cmpne      	r1, r2
 801484c:	dc2c2001 	st.w      	r1, (r12, 0x4)
 8014850:	0c0b      	bf      	0x8014866	// 8014866 <vTaskSwitchContext+0x76>
 8014852:	104e      	lrw      	r2, 0x20001364	// 8014888 <vTaskSwitchContext+0x98>
 8014854:	9123      	ld.w      	r1, (r1, 0xc)
 8014856:	b220      	st.w      	r1, (r2, 0x0)
 8014858:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 801485c:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 801485e:	1066      	lrw      	r3, 0x2000185c	// 8014874 <vTaskSwitchContext+0x84>
 8014860:	3201      	movi      	r2, 1
 8014862:	b340      	st.w      	r2, (r3, 0x0)
}
 8014864:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8014866:	9121      	ld.w      	r1, (r1, 0x4)
 8014868:	dc2c2001 	st.w      	r1, (r12, 0x4)
 801486c:	07f3      	br      	0x8014852	// 8014852 <vTaskSwitchContext+0x62>
 801486e:	0000      	.short	0x0000
 8014870:	20001854 	.long	0x20001854
 8014874:	2000185c 	.long	0x2000185c
 8014878:	20001858 	.long	0x20001858
 801487c:	20001368 	.long	0x20001368
 8014880:	08014c6c 	.long	0x08014c6c
 8014884:	08014ca8 	.long	0x08014ca8
 8014888:	20001364 	.long	0x20001364
 801488c:	00000000 	.long	0x00000000
