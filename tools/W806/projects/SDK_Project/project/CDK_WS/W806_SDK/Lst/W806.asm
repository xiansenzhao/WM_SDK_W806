
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
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 10 31 01 08     .............1..
 80104b0:	d0 05 01 08 d0 05 01 08 70 30 01 08 90 30 01 08     ........p0...0..
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 3c 30 01 08 d0 05 01 08 d0 05 01 08     ....<0..........
 80104f0:	d0 05 01 08 d0 05 01 08 d0 30 01 08 d0 05 01 08     .........0......

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
 8010506:	1019      	lrw      	r0, 0x2000197c	// 8010568 <__exit+0x8>
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
 8010524:	1035      	lrw      	r1, 0x801589c	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x2000097c	// 8010580 <__exit+0x20>

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
 801053e:	1032      	lrw      	r1, 0x2000097c	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x20003310	// 8010588 <__exit+0x28>

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
 8010554:	e00019c8 	bsr      	0x80138e4	// 80138e4 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0001a1c 	bsr      	0x8013990	// 8013990 <board_init>
#endif

    jbsr    main
 801055c:	e0001376 	bsr      	0x8012c48	// 8012c48 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	2000197c 	.long	0x2000197c
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	0801589c 	.long	0x0801589c
 801057c:	20000100 	.long	0x20000100
 8010580:	2000097c 	.long	0x2000097c
 8010584:	2000097c 	.long	0x2000097c
 8010588:	20003310 	.long	0x20003310

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
 8010598:	ea8d000f 	lrw      	r13, 0x20001b7c	// 80105d4 <BLE_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001b7c	// 80105d8 <BLE_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001b7c	// 80105d4 <BLE_IRQHandler+0x4>
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
 80105cc:	e00019a4 	bsr      	0x8013914	// 8013914 <trap_c>

080105d0 <BLE_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001b7c 	.long	0x20001b7c
 80105d8:	20001b7c 	.long	0x20001b7c

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
 80105ea:	1184      	lrw      	r4, 0x20002d14	// 8010678 <tspend_handler+0x60>
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
 801063a:	1050      	lrw      	r2, 0x20002d14	// 8010678 <tspend_handler+0x60>
    ld.w     r3, (r2)
 801063c:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 801063e:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010642:	e00025ef 	bsr      	0x8015220	// 8015220 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 8010646:	108d      	lrw      	r4, 0x20002d14	// 8010678 <tspend_handler+0x60>
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
 8010678:	20002d14 	.long	0x20002d14

0801067c <__fixunsdfsi>:
 801067c:	14d2      	push      	r4-r5, r15
 801067e:	3200      	movi      	r2, 0
 8010680:	ea2341e0 	movih      	r3, 16864
 8010684:	6d03      	mov      	r4, r0
 8010686:	6d47      	mov      	r5, r1
 8010688:	e00006b8 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 801068c:	e9a00007 	bhsz      	r0, 0x801069a	// 801069a <__fixunsdfsi+0x1e>
 8010690:	6c13      	mov      	r0, r4
 8010692:	6c57      	mov      	r1, r5
 8010694:	e0000722 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8010698:	1492      	pop      	r4-r5, r15
 801069a:	3200      	movi      	r2, 0
 801069c:	ea2341e0 	movih      	r3, 16864
 80106a0:	6c13      	mov      	r0, r4
 80106a2:	6c57      	mov      	r1, r5
 80106a4:	e00004c4 	bsr      	0x801102c	// 801102c <__subdf3>
 80106a8:	e0000718 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
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
 80106da:	01dc      	lrw      	r6, 0x80152d4	// 80109e4 <__udivdi3+0x330>
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
 8010782:	0386      	lrw      	r4, 0x80152d4	// 80109e4 <__udivdi3+0x330>
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
 80107c4:	0357      	lrw      	r2, 0x80152d4	// 80109e4 <__udivdi3+0x330>
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
 80109e4:	080152d4 	.long	0x080152d4

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
 8010a10:	0281      	lrw      	r4, 0x80152d4	// 8010d08 <__umoddi3+0x320>
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
 8010aa0:	03a5      	lrw      	r5, 0x80152d4	// 8010d08 <__umoddi3+0x320>
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
 8010aee:	0358      	lrw      	r2, 0x80152d4	// 8010d08 <__umoddi3+0x320>
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
 8010d08:	080152d4 	.long	0x080152d4

08010d0c <__extendsfdf2>:
 8010d0c:	14d0      	push      	r15
 8010d0e:	1426      	subi      	r14, r14, 24
 8010d10:	1902      	addi      	r1, r14, 8
 8010d12:	1801      	addi      	r0, r14, 4
 8010d14:	f40e2410 	fsts      	fr0, (r14, 0x4)
 8010d18:	e000049c 	bsr      	0x8011650	// 8011650 <__unpack_f>
 8010d1c:	9865      	ld.w      	r3, (r14, 0x14)
 8010d1e:	9824      	ld.w      	r1, (r14, 0x10)
 8010d20:	6f07      	mov      	r12, r1
 8010d22:	4b42      	lsri      	r2, r3, 2
 8010d24:	b840      	st.w      	r2, (r14, 0x0)
 8010d26:	9823      	ld.w      	r1, (r14, 0xc)
 8010d28:	437e      	lsli      	r3, r3, 30
 8010d2a:	6cb3      	mov      	r2, r12
 8010d2c:	9802      	ld.w      	r0, (r14, 0x8)
 8010d2e:	e000040d 	bsr      	0x8011548	// 8011548 <__make_dp>
 8010d32:	1406      	addi      	r14, r14, 24
 8010d34:	1490      	pop      	r15
	...

08010d38 <_fpadd_parts>:
 8010d38:	14c8      	push      	r4-r11
 8010d3a:	1423      	subi      	r14, r14, 12
 8010d3c:	9060      	ld.w      	r3, (r0, 0x0)
 8010d3e:	3501      	movi      	r5, 1
 8010d40:	64d4      	cmphs      	r5, r3
 8010d42:	0871      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010d44:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d48:	6714      	cmphs      	r5, r12
 8010d4a:	086f      	bt      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d4c:	3b44      	cmpnei      	r3, 4
 8010d4e:	0cef      	bf      	0x8010f2c	// 8010f2c <_fpadd_parts+0x1f4>
 8010d50:	eb4c0004 	cmpnei      	r12, 4
 8010d54:	0c6a      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d56:	eb4c0002 	cmpnei      	r12, 2
 8010d5a:	0cc7      	bf      	0x8010ee8	// 8010ee8 <_fpadd_parts+0x1b0>
 8010d5c:	3b42      	cmpnei      	r3, 2
 8010d5e:	0c65      	bf      	0x8010e28	// 8010e28 <_fpadd_parts+0xf0>
 8010d60:	9062      	ld.w      	r3, (r0, 0x8)
 8010d62:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d66:	c583008d 	subu      	r13, r3, r12
 8010d6a:	c40d0208 	abs      	r8, r13
 8010d6e:	eb28003f 	cmplti      	r8, 64
 8010d72:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d74:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d76:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d78:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d7a:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d7e:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d82:	0856      	bt      	0x8010e2e	// 8010e2e <_fpadd_parts+0xf6>
 8010d84:	64f1      	cmplt      	r12, r3
 8010d86:	0cc9      	bf      	0x8010f18	// 8010f18 <_fpadd_parts+0x1e0>
 8010d88:	ea0a0000 	movi      	r10, 0
 8010d8c:	ea0b0000 	movi      	r11, 0
 8010d90:	9001      	ld.w      	r0, (r0, 0x4)
 8010d92:	9121      	ld.w      	r1, (r1, 0x4)
 8010d94:	6442      	cmpne      	r0, r1
 8010d96:	0c82      	bf      	0x8010e9a	// 8010e9a <_fpadd_parts+0x162>
 8010d98:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d9c:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010da0:	e90000b8 	bez      	r0, 0x8010f10	// 8010f10 <_fpadd_parts+0x1d8>
 8010da4:	6730      	cmphs      	r12, r12
 8010da6:	c58a010c 	subc      	r12, r10, r12
 8010daa:	c5ab010d 	subc      	r13, r11, r13
 8010dae:	e98d00c9 	blz      	r13, 0x8010f40	// 8010f40 <_fpadd_parts+0x208>
 8010db2:	3100      	movi      	r1, 0
 8010db4:	b221      	st.w      	r1, (r2, 0x4)
 8010db6:	b262      	st.w      	r3, (r2, 0x8)
 8010db8:	dd822003 	st.w      	r12, (r2, 0xc)
 8010dbc:	dda22004 	st.w      	r13, (r2, 0x10)
 8010dc0:	6c33      	mov      	r0, r12
 8010dc2:	6c77      	mov      	r1, r13
 8010dc4:	3840      	cmpnei      	r0, 0
 8010dc6:	c4210c81 	decf      	r1, r1, 1
 8010dca:	2800      	subi      	r0, 1
 8010dcc:	c7605023 	bmaski      	r3, 28
 8010dd0:	644c      	cmphs      	r3, r1
 8010dd2:	0c71      	bf      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
 8010dd4:	64c6      	cmpne      	r1, r3
 8010dd6:	0d0d      	bf      	0x8010ff0	// 8010ff0 <_fpadd_parts+0x2b8>
 8010dd8:	9262      	ld.w      	r3, (r2, 0x8)
 8010dda:	3600      	movi      	r6, 0
 8010ddc:	3700      	movi      	r7, 0
 8010dde:	ea0a0000 	movi      	r10, 0
 8010de2:	2b00      	subi      	r3, 1
 8010de4:	2e00      	subi      	r6, 1
 8010de6:	2f00      	subi      	r7, 1
 8010de8:	c7605028 	bmaski      	r8, 28
 8010dec:	e54a1001 	subi      	r10, r10, 2
 8010df0:	0403      	br      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010df2:	6606      	cmpne      	r1, r8
 8010df4:	0c8b      	bf      	0x8010f0a	// 8010f0a <_fpadd_parts+0x1d2>
 8010df6:	6511      	cmplt      	r4, r4
 8010df8:	c58c0044 	addc      	r4, r12, r12
 8010dfc:	c5ad0045 	addc      	r5, r13, r13
 8010e00:	6401      	cmplt      	r0, r0
 8010e02:	c4c40040 	addc      	r0, r4, r6
 8010e06:	c4e50041 	addc      	r1, r5, r7
 8010e0a:	6460      	cmphs      	r8, r1
 8010e0c:	6e4f      	mov      	r9, r3
 8010e0e:	6f13      	mov      	r12, r4
 8010e10:	6f57      	mov      	r13, r5
 8010e12:	2b00      	subi      	r3, 1
 8010e14:	0bef      	bt      	0x8010df2	// 8010df2 <_fpadd_parts+0xba>
 8010e16:	3303      	movi      	r3, 3
 8010e18:	b283      	st.w      	r4, (r2, 0xc)
 8010e1a:	b2a4      	st.w      	r5, (r2, 0x10)
 8010e1c:	dd222002 	st.w      	r9, (r2, 0x8)
 8010e20:	b260      	st.w      	r3, (r2, 0x0)
 8010e22:	6c0b      	mov      	r0, r2
 8010e24:	1403      	addi      	r14, r14, 12
 8010e26:	1488      	pop      	r4-r11
 8010e28:	6c07      	mov      	r0, r1
 8010e2a:	1403      	addi      	r14, r14, 12
 8010e2c:	1488      	pop      	r4-r11
 8010e2e:	e96d009a 	blsz      	r13, 0x8010f62	// 8010f62 <_fpadd_parts+0x22a>
 8010e32:	ea0d001f 	movi      	r13, 31
 8010e36:	c42b4826 	lsli      	r6, r11, 1
 8010e3a:	6362      	subu      	r13, r8
 8010e3c:	e588101f 	subi      	r12, r8, 32
 8010e40:	c5a6402d 	lsl      	r13, r6, r13
 8010e44:	c50a4046 	lsr      	r6, r10, r8
 8010e48:	c7ec2880 	btsti      	r12, 31
 8010e4c:	c58b4049 	lsr      	r9, r11, r12
 8010e50:	3400      	movi      	r4, 0
 8010e52:	6db4      	or      	r6, r13
 8010e54:	c4c90c20 	incf      	r6, r9, 0
 8010e58:	6f53      	mov      	r13, r4
 8010e5a:	c5854029 	lsl      	r9, r5, r12
 8010e5e:	c505402c 	lsl      	r12, r5, r8
 8010e62:	c50b4047 	lsr      	r7, r11, r8
 8010e66:	c5a90c20 	incf      	r13, r9, 0
 8010e6a:	c5840c20 	incf      	r12, r4, 0
 8010e6e:	c4e40c20 	incf      	r7, r4, 0
 8010e72:	eb4c0000 	cmpnei      	r12, 0
 8010e76:	c5ad0c81 	decf      	r13, r13, 1
 8010e7a:	e58c1000 	subi      	r12, r12, 1
 8010e7e:	6b28      	and      	r12, r10
 8010e80:	6b6c      	and      	r13, r11
 8010e82:	6f34      	or      	r12, r13
 8010e84:	eb4c0000 	cmpnei      	r12, 0
 8010e88:	9001      	ld.w      	r0, (r0, 0x4)
 8010e8a:	9121      	ld.w      	r1, (r1, 0x4)
 8010e8c:	c400050a 	mvc      	r10
 8010e90:	6442      	cmpne      	r0, r1
 8010e92:	6ed3      	mov      	r11, r4
 8010e94:	6e98      	or      	r10, r6
 8010e96:	6edc      	or      	r11, r7
 8010e98:	0b80      	bt      	0x8010d98	// 8010d98 <_fpadd_parts+0x60>
 8010e9a:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e9e:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ea2:	6731      	cmplt      	r12, r12
 8010ea4:	6329      	addc      	r12, r10
 8010ea6:	636d      	addc      	r13, r11
 8010ea8:	b201      	st.w      	r0, (r2, 0x4)
 8010eaa:	b262      	st.w      	r3, (r2, 0x8)
 8010eac:	dd822003 	st.w      	r12, (r2, 0xc)
 8010eb0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010eb4:	3303      	movi      	r3, 3
 8010eb6:	b260      	st.w      	r3, (r2, 0x0)
 8010eb8:	c7805023 	bmaski      	r3, 29
 8010ebc:	674c      	cmphs      	r3, r13
 8010ebe:	0812      	bt      	0x8010ee2	// 8010ee2 <_fpadd_parts+0x1aa>
 8010ec0:	c7ed4823 	lsli      	r3, r13, 31
 8010ec4:	c42c4840 	lsri      	r0, r12, 1
 8010ec8:	6c0c      	or      	r0, r3
 8010eca:	c42d4841 	lsri      	r1, r13, 1
 8010ece:	9262      	ld.w      	r3, (r2, 0x8)
 8010ed0:	e48c2001 	andi      	r4, r12, 1
 8010ed4:	3500      	movi      	r5, 0
 8010ed6:	6c10      	or      	r0, r4
 8010ed8:	6c54      	or      	r1, r5
 8010eda:	2300      	addi      	r3, 1
 8010edc:	b203      	st.w      	r0, (r2, 0xc)
 8010ede:	b224      	st.w      	r1, (r2, 0x10)
 8010ee0:	b262      	st.w      	r3, (r2, 0x8)
 8010ee2:	6c0b      	mov      	r0, r2
 8010ee4:	1403      	addi      	r14, r14, 12
 8010ee6:	1488      	pop      	r4-r11
 8010ee8:	3b42      	cmpnei      	r3, 2
 8010eea:	0b9d      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010eec:	b260      	st.w      	r3, (r2, 0x0)
 8010eee:	9061      	ld.w      	r3, (r0, 0x4)
 8010ef0:	b261      	st.w      	r3, (r2, 0x4)
 8010ef2:	9062      	ld.w      	r3, (r0, 0x8)
 8010ef4:	b262      	st.w      	r3, (r2, 0x8)
 8010ef6:	9063      	ld.w      	r3, (r0, 0xc)
 8010ef8:	b263      	st.w      	r3, (r2, 0xc)
 8010efa:	9064      	ld.w      	r3, (r0, 0x10)
 8010efc:	9121      	ld.w      	r1, (r1, 0x4)
 8010efe:	b264      	st.w      	r3, (r2, 0x10)
 8010f00:	9061      	ld.w      	r3, (r0, 0x4)
 8010f02:	68c4      	and      	r3, r1
 8010f04:	b261      	st.w      	r3, (r2, 0x4)
 8010f06:	6c0b      	mov      	r0, r2
 8010f08:	078e      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f0a:	6428      	cmphs      	r10, r0
 8010f0c:	0b75      	bt      	0x8010df6	// 8010df6 <_fpadd_parts+0xbe>
 8010f0e:	0784      	br      	0x8010e16	// 8010e16 <_fpadd_parts+0xde>
 8010f10:	6730      	cmphs      	r12, r12
 8010f12:	632b      	subc      	r12, r10
 8010f14:	636f      	subc      	r13, r11
 8010f16:	074c      	br      	0x8010dae	// 8010dae <_fpadd_parts+0x76>
 8010f18:	6cf3      	mov      	r3, r12
 8010f1a:	ea0d0000 	movi      	r13, 0
 8010f1e:	ea0c0000 	movi      	r12, 0
 8010f22:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010f26:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010f2a:	0733      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f2c:	eb4c0004 	cmpnei      	r12, 4
 8010f30:	0b7a      	bt      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f32:	9041      	ld.w      	r2, (r0, 0x4)
 8010f34:	9161      	ld.w      	r3, (r1, 0x4)
 8010f36:	64ca      	cmpne      	r2, r3
 8010f38:	124b      	lrw      	r2, 0x80152c0	// 8011064 <__subdf3+0x38>
 8010f3a:	c4020c40 	inct      	r0, r2, 0
 8010f3e:	0773      	br      	0x8010e24	// 8010e24 <_fpadd_parts+0xec>
 8010f40:	ea0a0000 	movi      	r10, 0
 8010f44:	ea0b0000 	movi      	r11, 0
 8010f48:	3101      	movi      	r1, 1
 8010f4a:	6730      	cmphs      	r12, r12
 8010f4c:	c58a010c 	subc      	r12, r10, r12
 8010f50:	c5ab010d 	subc      	r13, r11, r13
 8010f54:	b221      	st.w      	r1, (r2, 0x4)
 8010f56:	b262      	st.w      	r3, (r2, 0x8)
 8010f58:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f5c:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f60:	0730      	br      	0x8010dc0	// 8010dc0 <_fpadd_parts+0x88>
 8010f62:	e90dff17 	bez      	r13, 0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010f66:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f68:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f6a:	ea0d001f 	movi      	r13, 31
 8010f6e:	47c1      	lsli      	r6, r7, 1
 8010f70:	6362      	subu      	r13, r8
 8010f72:	c5a6402d 	lsl      	r13, r6, r13
 8010f76:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f7a:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f7e:	e588101f 	subi      	r12, r8, 32
 8010f82:	c50d4046 	lsr      	r6, r13, r8
 8010f86:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f8a:	c7ec2880 	btsti      	r12, 31
 8010f8e:	3400      	movi      	r4, 0
 8010f90:	c5874049 	lsr      	r9, r7, r12
 8010f94:	6db4      	or      	r6, r13
 8010f96:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f9a:	c4c90c20 	incf      	r6, r9, 0
 8010f9e:	c50d4047 	lsr      	r7, r13, r8
 8010fa2:	c5854029 	lsl      	r9, r5, r12
 8010fa6:	6f53      	mov      	r13, r4
 8010fa8:	c505402c 	lsl      	r12, r5, r8
 8010fac:	c5a90c20 	incf      	r13, r9, 0
 8010fb0:	c5840c20 	incf      	r12, r4, 0
 8010fb4:	c4e40c20 	incf      	r7, r4, 0
 8010fb8:	60e0      	addu      	r3, r8
 8010fba:	eb4c0000 	cmpnei      	r12, 0
 8010fbe:	c5ad0c81 	decf      	r13, r13, 1
 8010fc2:	e58c1000 	subi      	r12, r12, 1
 8010fc6:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010fca:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fce:	6a30      	and      	r8, r12
 8010fd0:	6a74      	and      	r9, r13
 8010fd2:	6f23      	mov      	r12, r8
 8010fd4:	6f67      	mov      	r13, r9
 8010fd6:	6f34      	or      	r12, r13
 8010fd8:	eb4c0000 	cmpnei      	r12, 0
 8010fdc:	c400050c 	mvc      	r12
 8010fe0:	6f53      	mov      	r13, r4
 8010fe2:	c5862424 	or      	r4, r6, r12
 8010fe6:	c5a72425 	or      	r5, r7, r13
 8010fea:	b880      	st.w      	r4, (r14, 0x0)
 8010fec:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fee:	06d1      	br      	0x8010d90	// 8010d90 <_fpadd_parts+0x58>
 8010ff0:	3300      	movi      	r3, 0
 8010ff2:	2b01      	subi      	r3, 2
 8010ff4:	640c      	cmphs      	r3, r0
 8010ff6:	0af1      	bt      	0x8010dd8	// 8010dd8 <_fpadd_parts+0xa0>
 8010ff8:	075e      	br      	0x8010eb4	// 8010eb4 <_fpadd_parts+0x17c>
	...

08010ffc <__adddf3>:
 8010ffc:	14d2      	push      	r4-r5, r15
 8010ffe:	1433      	subi      	r14, r14, 76
 8011000:	b800      	st.w      	r0, (r14, 0x0)
 8011002:	b821      	st.w      	r1, (r14, 0x4)
 8011004:	6c3b      	mov      	r0, r14
 8011006:	6d47      	mov      	r5, r1
 8011008:	1904      	addi      	r1, r14, 16
 801100a:	b863      	st.w      	r3, (r14, 0xc)
 801100c:	b842      	st.w      	r2, (r14, 0x8)
 801100e:	e0000433 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011012:	1909      	addi      	r1, r14, 36
 8011014:	1802      	addi      	r0, r14, 8
 8011016:	e000042f 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801101a:	1a0e      	addi      	r2, r14, 56
 801101c:	1909      	addi      	r1, r14, 36
 801101e:	1804      	addi      	r0, r14, 16
 8011020:	e3fffe8c 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 8011024:	e0000360 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011028:	1413      	addi      	r14, r14, 76
 801102a:	1492      	pop      	r4-r5, r15

0801102c <__subdf3>:
 801102c:	14d2      	push      	r4-r5, r15
 801102e:	1433      	subi      	r14, r14, 76
 8011030:	b800      	st.w      	r0, (r14, 0x0)
 8011032:	b821      	st.w      	r1, (r14, 0x4)
 8011034:	6c3b      	mov      	r0, r14
 8011036:	6d47      	mov      	r5, r1
 8011038:	1904      	addi      	r1, r14, 16
 801103a:	b842      	st.w      	r2, (r14, 0x8)
 801103c:	b863      	st.w      	r3, (r14, 0xc)
 801103e:	e000041b 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011042:	1909      	addi      	r1, r14, 36
 8011044:	1802      	addi      	r0, r14, 8
 8011046:	e0000417 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801104a:	986a      	ld.w      	r3, (r14, 0x28)
 801104c:	e4634001 	xori      	r3, r3, 1
 8011050:	1a0e      	addi      	r2, r14, 56
 8011052:	1909      	addi      	r1, r14, 36
 8011054:	1804      	addi      	r0, r14, 16
 8011056:	b86a      	st.w      	r3, (r14, 0x28)
 8011058:	e3fffe70 	bsr      	0x8010d38	// 8010d38 <_fpadd_parts>
 801105c:	e0000344 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011060:	1413      	addi      	r14, r14, 76
 8011062:	1492      	pop      	r4-r5, r15
 8011064:	080152c0 	.long	0x080152c0

08011068 <__muldf3>:
 8011068:	14d8      	push      	r4-r11, r15
 801106a:	1436      	subi      	r14, r14, 88
 801106c:	b803      	st.w      	r0, (r14, 0xc)
 801106e:	b824      	st.w      	r1, (r14, 0x10)
 8011070:	1803      	addi      	r0, r14, 12
 8011072:	1907      	addi      	r1, r14, 28
 8011074:	b866      	st.w      	r3, (r14, 0x18)
 8011076:	b845      	st.w      	r2, (r14, 0x14)
 8011078:	e00003fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801107c:	190c      	addi      	r1, r14, 48
 801107e:	1805      	addi      	r0, r14, 20
 8011080:	e00003fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011084:	9867      	ld.w      	r3, (r14, 0x1c)
 8011086:	3b01      	cmphsi      	r3, 2
 8011088:	0ca4      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801108a:	984c      	ld.w      	r2, (r14, 0x30)
 801108c:	3a01      	cmphsi      	r2, 2
 801108e:	0c94      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 8011090:	3b44      	cmpnei      	r3, 4
 8011092:	0c9d      	bf      	0x80111cc	// 80111cc <__muldf3+0x164>
 8011094:	3a44      	cmpnei      	r2, 4
 8011096:	0c8e      	bf      	0x80111b2	// 80111b2 <__muldf3+0x14a>
 8011098:	3b42      	cmpnei      	r3, 2
 801109a:	0c9b      	bf      	0x80111d0	// 80111d0 <__muldf3+0x168>
 801109c:	3a42      	cmpnei      	r2, 2
 801109e:	0c8c      	bf      	0x80111b6	// 80111b6 <__muldf3+0x14e>
 80110a0:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 80110a4:	d90e200a 	ld.w      	r8, (r14, 0x28)
 80110a8:	3300      	movi      	r3, 0
 80110aa:	6c33      	mov      	r0, r12
 80110ac:	6ca3      	mov      	r2, r8
 80110ae:	6c4f      	mov      	r1, r3
 80110b0:	dd8e2002 	st.w      	r12, (r14, 0x8)
 80110b4:	d96e2010 	ld.w      	r11, (r14, 0x40)
 80110b8:	e00002a6 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110bc:	3300      	movi      	r3, 0
 80110be:	6ca3      	mov      	r2, r8
 80110c0:	6d83      	mov      	r6, r0
 80110c2:	6dc7      	mov      	r7, r1
 80110c4:	6c4f      	mov      	r1, r3
 80110c6:	6c2f      	mov      	r0, r11
 80110c8:	e000029e 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110cc:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110d0:	3300      	movi      	r3, 0
 80110d2:	6e03      	mov      	r8, r0
 80110d4:	6e47      	mov      	r9, r1
 80110d6:	6caf      	mov      	r2, r11
 80110d8:	6c4f      	mov      	r1, r3
 80110da:	6c2b      	mov      	r0, r10
 80110dc:	e0000294 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110e0:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110e4:	3300      	movi      	r3, 0
 80110e6:	b800      	st.w      	r0, (r14, 0x0)
 80110e8:	b821      	st.w      	r1, (r14, 0x4)
 80110ea:	6cb3      	mov      	r2, r12
 80110ec:	6c2b      	mov      	r0, r10
 80110ee:	6c4f      	mov      	r1, r3
 80110f0:	e000028a 	bsr      	0x8011604	// 8011604 <__muldi3>
 80110f4:	6401      	cmplt      	r0, r0
 80110f6:	6021      	addc      	r0, r8
 80110f8:	6065      	addc      	r1, r9
 80110fa:	6644      	cmphs      	r1, r9
 80110fc:	0c80      	bf      	0x80111fc	// 80111fc <__muldf3+0x194>
 80110fe:	6466      	cmpne      	r9, r1
 8011100:	0c7c      	bf      	0x80111f8	// 80111f8 <__muldf3+0x190>
 8011102:	ea080000 	movi      	r8, 0
 8011106:	ea090000 	movi      	r9, 0
 801110a:	3200      	movi      	r2, 0
 801110c:	6cc3      	mov      	r3, r0
 801110e:	6489      	cmplt      	r2, r2
 8011110:	6099      	addc      	r2, r6
 8011112:	60dd      	addc      	r3, r7
 8011114:	65cc      	cmphs      	r3, r7
 8011116:	0c6a      	bf      	0x80111ea	// 80111ea <__muldf3+0x182>
 8011118:	64de      	cmpne      	r7, r3
 801111a:	0c66      	bf      	0x80111e6	// 80111e6 <__muldf3+0x17e>
 801111c:	6f07      	mov      	r12, r1
 801111e:	ea0d0000 	movi      	r13, 0
 8011122:	9800      	ld.w      	r0, (r14, 0x0)
 8011124:	9821      	ld.w      	r1, (r14, 0x4)
 8011126:	6401      	cmplt      	r0, r0
 8011128:	6031      	addc      	r0, r12
 801112a:	6075      	addc      	r1, r13
 801112c:	6621      	cmplt      	r8, r8
 801112e:	6201      	addc      	r8, r0
 8011130:	6245      	addc      	r9, r1
 8011132:	980e      	ld.w      	r0, (r14, 0x38)
 8011134:	9829      	ld.w      	r1, (r14, 0x24)
 8011136:	6040      	addu      	r1, r0
 8011138:	590e      	addi      	r0, r1, 4
 801113a:	b813      	st.w      	r0, (r14, 0x4c)
 801113c:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011140:	980d      	ld.w      	r0, (r14, 0x34)
 8011142:	6432      	cmpne      	r12, r0
 8011144:	c780502a 	bmaski      	r10, 29
 8011148:	c4000500 	mvc      	r0
 801114c:	6668      	cmphs      	r10, r9
 801114e:	b812      	st.w      	r0, (r14, 0x48)
 8011150:	086f      	bt      	0x801122e	// 801122e <__muldf3+0x1c6>
 8011152:	2104      	addi      	r1, 5
 8011154:	ea0c0000 	movi      	r12, 0
 8011158:	ea2d8000 	movih      	r13, 32768
 801115c:	e4082001 	andi      	r0, r8, 1
 8011160:	6ec7      	mov      	r11, r1
 8011162:	e900000a 	bez      	r0, 0x8011176	// 8011176 <__muldf3+0x10e>
 8011166:	431f      	lsli      	r0, r3, 31
 8011168:	4a81      	lsri      	r4, r2, 1
 801116a:	6d00      	or      	r4, r0
 801116c:	4ba1      	lsri      	r5, r3, 1
 801116e:	c5842422 	or      	r2, r4, r12
 8011172:	c5a52423 	or      	r3, r5, r13
 8011176:	c4294840 	lsri      	r0, r9, 1
 801117a:	6428      	cmphs      	r10, r0
 801117c:	c7e94827 	lsli      	r7, r9, 31
 8011180:	c4284846 	lsri      	r6, r8, 1
 8011184:	c4c72428 	or      	r8, r7, r6
 8011188:	6e43      	mov      	r9, r0
 801118a:	2100      	addi      	r1, 1
 801118c:	0fe8      	bf      	0x801115c	// 801115c <__muldf3+0xf4>
 801118e:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 8011192:	e42820ff 	andi      	r1, r8, 255
 8011196:	eb410080 	cmpnei      	r1, 128
 801119a:	0c36      	bf      	0x8011206	// 8011206 <__muldf3+0x19e>
 801119c:	3303      	movi      	r3, 3
 801119e:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80111a2:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80111a6:	b871      	st.w      	r3, (r14, 0x44)
 80111a8:	1811      	addi      	r0, r14, 68
 80111aa:	e000029d 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111ae:	1416      	addi      	r14, r14, 88
 80111b0:	1498      	pop      	r4-r11, r15
 80111b2:	3b42      	cmpnei      	r3, 2
 80111b4:	0c3b      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111b6:	986d      	ld.w      	r3, (r14, 0x34)
 80111b8:	9848      	ld.w      	r2, (r14, 0x20)
 80111ba:	64ca      	cmpne      	r2, r3
 80111bc:	c4000503 	mvc      	r3
 80111c0:	180c      	addi      	r0, r14, 48
 80111c2:	b86d      	st.w      	r3, (r14, 0x34)
 80111c4:	e0000290 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111c8:	1416      	addi      	r14, r14, 88
 80111ca:	1498      	pop      	r4-r11, r15
 80111cc:	3a42      	cmpnei      	r2, 2
 80111ce:	0c2e      	bf      	0x801122a	// 801122a <__muldf3+0x1c2>
 80111d0:	9848      	ld.w      	r2, (r14, 0x20)
 80111d2:	986d      	ld.w      	r3, (r14, 0x34)
 80111d4:	64ca      	cmpne      	r2, r3
 80111d6:	c4000503 	mvc      	r3
 80111da:	1807      	addi      	r0, r14, 28
 80111dc:	b868      	st.w      	r3, (r14, 0x20)
 80111de:	e0000283 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80111e2:	1416      	addi      	r14, r14, 88
 80111e4:	1498      	pop      	r4-r11, r15
 80111e6:	6588      	cmphs      	r2, r6
 80111e8:	0b9a      	bt      	0x801111c	// 801111c <__muldf3+0xb4>
 80111ea:	e5080000 	addi      	r8, r8, 1
 80111ee:	eb480000 	cmpnei      	r8, 0
 80111f2:	c5290c21 	incf      	r9, r9, 1
 80111f6:	0793      	br      	0x801111c	// 801111c <__muldf3+0xb4>
 80111f8:	6600      	cmphs      	r0, r8
 80111fa:	0b84      	bt      	0x8011102	// 8011102 <__muldf3+0x9a>
 80111fc:	ea080000 	movi      	r8, 0
 8011200:	ea090001 	movi      	r9, 1
 8011204:	0783      	br      	0x801110a	// 801110a <__muldf3+0xa2>
 8011206:	e4282100 	andi      	r1, r8, 256
 801120a:	e921ffc9 	bnez      	r1, 0x801119c	// 801119c <__muldf3+0x134>
 801120e:	6c8c      	or      	r2, r3
 8011210:	e902ffc6 	bez      	r2, 0x801119c	// 801119c <__muldf3+0x134>
 8011214:	3280      	movi      	r2, 128
 8011216:	3300      	movi      	r3, 0
 8011218:	3100      	movi      	r1, 0
 801121a:	6489      	cmplt      	r2, r2
 801121c:	60a1      	addc      	r2, r8
 801121e:	60e5      	addc      	r3, r9
 8011220:	29ff      	subi      	r1, 256
 8011222:	c4222028 	and      	r8, r2, r1
 8011226:	6e4f      	mov      	r9, r3
 8011228:	07ba      	br      	0x801119c	// 801119c <__muldf3+0x134>
 801122a:	100f      	lrw      	r0, 0x80152c0	// 8011264 <__muldf3+0x1fc>
 801122c:	07bf      	br      	0x80111aa	// 80111aa <__muldf3+0x142>
 801122e:	c760502c 	bmaski      	r12, 28
 8011232:	6670      	cmphs      	r12, r9
 8011234:	0faf      	bf      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011236:	2102      	addi      	r1, 3
 8011238:	3401      	movi      	r4, 1
 801123a:	3500      	movi      	r5, 0
 801123c:	6da3      	mov      	r6, r8
 801123e:	6de7      	mov      	r7, r9
 8011240:	6c07      	mov      	r0, r1
 8011242:	6621      	cmplt      	r8, r8
 8011244:	6219      	addc      	r8, r6
 8011246:	625d      	addc      	r9, r7
 8011248:	e9a30004 	bhsz      	r3, 0x8011250	// 8011250 <__muldf3+0x1e8>
 801124c:	6e10      	or      	r8, r4
 801124e:	6e54      	or      	r9, r5
 8011250:	6d8b      	mov      	r6, r2
 8011252:	6dcf      	mov      	r7, r3
 8011254:	6489      	cmplt      	r2, r2
 8011256:	6099      	addc      	r2, r6
 8011258:	60dd      	addc      	r3, r7
 801125a:	6670      	cmphs      	r12, r9
 801125c:	2900      	subi      	r1, 1
 801125e:	0bef      	bt      	0x801123c	// 801123c <__muldf3+0x1d4>
 8011260:	b813      	st.w      	r0, (r14, 0x4c)
 8011262:	0798      	br      	0x8011192	// 8011192 <__muldf3+0x12a>
 8011264:	080152c0 	.long	0x080152c0

08011268 <__divdf3>:
 8011268:	14d6      	push      	r4-r9, r15
 801126a:	142e      	subi      	r14, r14, 56
 801126c:	b800      	st.w      	r0, (r14, 0x0)
 801126e:	b821      	st.w      	r1, (r14, 0x4)
 8011270:	6c3b      	mov      	r0, r14
 8011272:	1904      	addi      	r1, r14, 16
 8011274:	b863      	st.w      	r3, (r14, 0xc)
 8011276:	b842      	st.w      	r2, (r14, 0x8)
 8011278:	e00002fe 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801127c:	1909      	addi      	r1, r14, 36
 801127e:	1802      	addi      	r0, r14, 8
 8011280:	e00002fa 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011284:	9864      	ld.w      	r3, (r14, 0x10)
 8011286:	3b01      	cmphsi      	r3, 2
 8011288:	0c51      	bf      	0x801132a	// 801132a <__divdf3+0xc2>
 801128a:	9829      	ld.w      	r1, (r14, 0x24)
 801128c:	3201      	movi      	r2, 1
 801128e:	6448      	cmphs      	r2, r1
 8011290:	0873      	bt      	0x8011376	// 8011376 <__divdf3+0x10e>
 8011292:	9845      	ld.w      	r2, (r14, 0x14)
 8011294:	980a      	ld.w      	r0, (r14, 0x28)
 8011296:	3b44      	cmpnei      	r3, 4
 8011298:	6c81      	xor      	r2, r0
 801129a:	b845      	st.w      	r2, (r14, 0x14)
 801129c:	0c4c      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 801129e:	3b42      	cmpnei      	r3, 2
 80112a0:	0c4a      	bf      	0x8011334	// 8011334 <__divdf3+0xcc>
 80112a2:	3944      	cmpnei      	r1, 4
 80112a4:	0c4c      	bf      	0x801133c	// 801133c <__divdf3+0xd4>
 80112a6:	3942      	cmpnei      	r1, 2
 80112a8:	0c63      	bf      	0x801136e	// 801136e <__divdf3+0x106>
 80112aa:	9807      	ld.w      	r0, (r14, 0x1c)
 80112ac:	9828      	ld.w      	r1, (r14, 0x20)
 80112ae:	98cc      	ld.w      	r6, (r14, 0x30)
 80112b0:	98ed      	ld.w      	r7, (r14, 0x34)
 80112b2:	9866      	ld.w      	r3, (r14, 0x18)
 80112b4:	984b      	ld.w      	r2, (r14, 0x2c)
 80112b6:	65c4      	cmphs      	r1, r7
 80112b8:	60ca      	subu      	r3, r2
 80112ba:	b866      	st.w      	r3, (r14, 0x18)
 80112bc:	0c05      	bf      	0x80112c6	// 80112c6 <__divdf3+0x5e>
 80112be:	645e      	cmpne      	r7, r1
 80112c0:	080a      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c2:	6580      	cmphs      	r0, r6
 80112c4:	0808      	bt      	0x80112d4	// 80112d4 <__divdf3+0x6c>
 80112c6:	6f03      	mov      	r12, r0
 80112c8:	6f47      	mov      	r13, r1
 80112ca:	2b00      	subi      	r3, 1
 80112cc:	6401      	cmplt      	r0, r0
 80112ce:	6031      	addc      	r0, r12
 80112d0:	6075      	addc      	r1, r13
 80112d2:	b866      	st.w      	r3, (r14, 0x18)
 80112d4:	ea0c003d 	movi      	r12, 61
 80112d8:	3400      	movi      	r4, 0
 80112da:	3500      	movi      	r5, 0
 80112dc:	3200      	movi      	r2, 0
 80112de:	ea231000 	movih      	r3, 4096
 80112e2:	65c4      	cmphs      	r1, r7
 80112e4:	0c0a      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112e6:	645e      	cmpne      	r7, r1
 80112e8:	0803      	bt      	0x80112ee	// 80112ee <__divdf3+0x86>
 80112ea:	6580      	cmphs      	r0, r6
 80112ec:	0c06      	bf      	0x80112f8	// 80112f8 <__divdf3+0x90>
 80112ee:	6d08      	or      	r4, r2
 80112f0:	6d4c      	or      	r5, r3
 80112f2:	6400      	cmphs      	r0, r0
 80112f4:	601b      	subc      	r0, r6
 80112f6:	605f      	subc      	r1, r7
 80112f8:	c7e34829 	lsli      	r9, r3, 31
 80112fc:	c4224848 	lsri      	r8, r2, 1
 8011300:	c423484d 	lsri      	r13, r3, 1
 8011304:	c5092422 	or      	r2, r9, r8
 8011308:	e58c1000 	subi      	r12, r12, 1
 801130c:	6e03      	mov      	r8, r0
 801130e:	6e47      	mov      	r9, r1
 8011310:	6cf7      	mov      	r3, r13
 8011312:	6401      	cmplt      	r0, r0
 8011314:	6021      	addc      	r0, r8
 8011316:	6065      	addc      	r1, r9
 8011318:	e92cffe5 	bnez      	r12, 0x80112e2	// 80112e2 <__divdf3+0x7a>
 801131c:	e46420ff 	andi      	r3, r4, 255
 8011320:	eb430080 	cmpnei      	r3, 128
 8011324:	0c13      	bf      	0x801134a	// 801134a <__divdf3+0xe2>
 8011326:	b887      	st.w      	r4, (r14, 0x1c)
 8011328:	b8a8      	st.w      	r5, (r14, 0x20)
 801132a:	1804      	addi      	r0, r14, 16
 801132c:	e00001dc 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 8011330:	140e      	addi      	r14, r14, 56
 8011332:	1496      	pop      	r4-r9, r15
 8011334:	644e      	cmpne      	r3, r1
 8011336:	0bfa      	bt      	0x801132a	// 801132a <__divdf3+0xc2>
 8011338:	1011      	lrw      	r0, 0x80152c0	// 801137c <__divdf3+0x114>
 801133a:	07f9      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801133c:	3300      	movi      	r3, 0
 801133e:	3400      	movi      	r4, 0
 8011340:	b867      	st.w      	r3, (r14, 0x1c)
 8011342:	b888      	st.w      	r4, (r14, 0x20)
 8011344:	b866      	st.w      	r3, (r14, 0x18)
 8011346:	1804      	addi      	r0, r14, 16
 8011348:	07f2      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801134a:	e4642100 	andi      	r3, r4, 256
 801134e:	e923ffec 	bnez      	r3, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011352:	6c04      	or      	r0, r1
 8011354:	e900ffe9 	bez      	r0, 0x8011326	// 8011326 <__divdf3+0xbe>
 8011358:	3280      	movi      	r2, 128
 801135a:	3300      	movi      	r3, 0
 801135c:	3100      	movi      	r1, 0
 801135e:	6489      	cmplt      	r2, r2
 8011360:	6091      	addc      	r2, r4
 8011362:	60d5      	addc      	r3, r5
 8011364:	29ff      	subi      	r1, 256
 8011366:	c4222024 	and      	r4, r2, r1
 801136a:	6d4f      	mov      	r5, r3
 801136c:	07dd      	br      	0x8011326	// 8011326 <__divdf3+0xbe>
 801136e:	3304      	movi      	r3, 4
 8011370:	b864      	st.w      	r3, (r14, 0x10)
 8011372:	1804      	addi      	r0, r14, 16
 8011374:	07dc      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 8011376:	1809      	addi      	r0, r14, 36
 8011378:	07da      	br      	0x801132c	// 801132c <__divdf3+0xc4>
 801137a:	0000      	.short	0x0000
 801137c:	080152c0 	.long	0x080152c0

08011380 <__nedf2>:
 8011380:	14d2      	push      	r4-r5, r15
 8011382:	142e      	subi      	r14, r14, 56
 8011384:	b800      	st.w      	r0, (r14, 0x0)
 8011386:	b821      	st.w      	r1, (r14, 0x4)
 8011388:	6c3b      	mov      	r0, r14
 801138a:	6d47      	mov      	r5, r1
 801138c:	1904      	addi      	r1, r14, 16
 801138e:	b863      	st.w      	r3, (r14, 0xc)
 8011390:	b842      	st.w      	r2, (r14, 0x8)
 8011392:	e0000271 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011396:	1802      	addi      	r0, r14, 8
 8011398:	1909      	addi      	r1, r14, 36
 801139a:	e000026d 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801139e:	9864      	ld.w      	r3, (r14, 0x10)
 80113a0:	3001      	movi      	r0, 1
 80113a2:	64c0      	cmphs      	r0, r3
 80113a4:	0808      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113a6:	9869      	ld.w      	r3, (r14, 0x24)
 80113a8:	64c0      	cmphs      	r0, r3
 80113aa:	0805      	bt      	0x80113b4	// 80113b4 <__nedf2+0x34>
 80113ac:	1909      	addi      	r1, r14, 36
 80113ae:	1804      	addi      	r0, r14, 16
 80113b0:	e00002d4 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113b4:	140e      	addi      	r14, r14, 56
 80113b6:	1492      	pop      	r4-r5, r15

080113b8 <__gtdf2>:
 80113b8:	14d2      	push      	r4-r5, r15
 80113ba:	142e      	subi      	r14, r14, 56
 80113bc:	b800      	st.w      	r0, (r14, 0x0)
 80113be:	b821      	st.w      	r1, (r14, 0x4)
 80113c0:	6c3b      	mov      	r0, r14
 80113c2:	6d47      	mov      	r5, r1
 80113c4:	1904      	addi      	r1, r14, 16
 80113c6:	b842      	st.w      	r2, (r14, 0x8)
 80113c8:	b863      	st.w      	r3, (r14, 0xc)
 80113ca:	e0000255 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113ce:	1909      	addi      	r1, r14, 36
 80113d0:	1802      	addi      	r0, r14, 8
 80113d2:	e0000251 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80113d6:	9844      	ld.w      	r2, (r14, 0x10)
 80113d8:	3301      	movi      	r3, 1
 80113da:	648c      	cmphs      	r3, r2
 80113dc:	080a      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113de:	9849      	ld.w      	r2, (r14, 0x24)
 80113e0:	648c      	cmphs      	r3, r2
 80113e2:	0807      	bt      	0x80113f0	// 80113f0 <__gtdf2+0x38>
 80113e4:	1909      	addi      	r1, r14, 36
 80113e6:	1804      	addi      	r0, r14, 16
 80113e8:	e00002b8 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 80113ec:	140e      	addi      	r14, r14, 56
 80113ee:	1492      	pop      	r4-r5, r15
 80113f0:	3000      	movi      	r0, 0
 80113f2:	2800      	subi      	r0, 1
 80113f4:	140e      	addi      	r14, r14, 56
 80113f6:	1492      	pop      	r4-r5, r15

080113f8 <__gedf2>:
 80113f8:	14d2      	push      	r4-r5, r15
 80113fa:	142e      	subi      	r14, r14, 56
 80113fc:	b800      	st.w      	r0, (r14, 0x0)
 80113fe:	b821      	st.w      	r1, (r14, 0x4)
 8011400:	6c3b      	mov      	r0, r14
 8011402:	6d47      	mov      	r5, r1
 8011404:	1904      	addi      	r1, r14, 16
 8011406:	b842      	st.w      	r2, (r14, 0x8)
 8011408:	b863      	st.w      	r3, (r14, 0xc)
 801140a:	e0000235 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801140e:	1909      	addi      	r1, r14, 36
 8011410:	1802      	addi      	r0, r14, 8
 8011412:	e0000231 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011416:	9844      	ld.w      	r2, (r14, 0x10)
 8011418:	3301      	movi      	r3, 1
 801141a:	648c      	cmphs      	r3, r2
 801141c:	080a      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 801141e:	9849      	ld.w      	r2, (r14, 0x24)
 8011420:	648c      	cmphs      	r3, r2
 8011422:	0807      	bt      	0x8011430	// 8011430 <__gedf2+0x38>
 8011424:	1909      	addi      	r1, r14, 36
 8011426:	1804      	addi      	r0, r14, 16
 8011428:	e0000298 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801142c:	140e      	addi      	r14, r14, 56
 801142e:	1492      	pop      	r4-r5, r15
 8011430:	3000      	movi      	r0, 0
 8011432:	2800      	subi      	r0, 1
 8011434:	140e      	addi      	r14, r14, 56
 8011436:	1492      	pop      	r4-r5, r15

08011438 <__ltdf2>:
 8011438:	14d2      	push      	r4-r5, r15
 801143a:	142e      	subi      	r14, r14, 56
 801143c:	b800      	st.w      	r0, (r14, 0x0)
 801143e:	b821      	st.w      	r1, (r14, 0x4)
 8011440:	6c3b      	mov      	r0, r14
 8011442:	6d47      	mov      	r5, r1
 8011444:	1904      	addi      	r1, r14, 16
 8011446:	b863      	st.w      	r3, (r14, 0xc)
 8011448:	b842      	st.w      	r2, (r14, 0x8)
 801144a:	e0000215 	bsr      	0x8011874	// 8011874 <__unpack_d>
 801144e:	1802      	addi      	r0, r14, 8
 8011450:	1909      	addi      	r1, r14, 36
 8011452:	e0000211 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011456:	9864      	ld.w      	r3, (r14, 0x10)
 8011458:	3001      	movi      	r0, 1
 801145a:	64c0      	cmphs      	r0, r3
 801145c:	0808      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 801145e:	9869      	ld.w      	r3, (r14, 0x24)
 8011460:	64c0      	cmphs      	r0, r3
 8011462:	0805      	bt      	0x801146c	// 801146c <__ltdf2+0x34>
 8011464:	1909      	addi      	r1, r14, 36
 8011466:	1804      	addi      	r0, r14, 16
 8011468:	e0000278 	bsr      	0x8011958	// 8011958 <__fpcmp_parts_d>
 801146c:	140e      	addi      	r14, r14, 56
 801146e:	1492      	pop      	r4-r5, r15

08011470 <__floatsidf>:
 8011470:	14d0      	push      	r15
 8011472:	1425      	subi      	r14, r14, 20
 8011474:	3303      	movi      	r3, 3
 8011476:	b860      	st.w      	r3, (r14, 0x0)
 8011478:	487f      	lsri      	r3, r0, 31
 801147a:	b861      	st.w      	r3, (r14, 0x4)
 801147c:	e9200009 	bnez      	r0, 0x801148e	// 801148e <__floatsidf+0x1e>
 8011480:	3302      	movi      	r3, 2
 8011482:	b860      	st.w      	r3, (r14, 0x0)
 8011484:	6c3b      	mov      	r0, r14
 8011486:	e000012f 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801148a:	1405      	addi      	r14, r14, 20
 801148c:	1490      	pop      	r15
 801148e:	e9a00008 	bhsz      	r0, 0x801149e	// 801149e <__floatsidf+0x2e>
 8011492:	ea238000 	movih      	r3, 32768
 8011496:	64c2      	cmpne      	r0, r3
 8011498:	0c1c      	bf      	0x80114d0	// 80114d0 <__floatsidf+0x60>
 801149a:	3300      	movi      	r3, 0
 801149c:	5b01      	subu      	r0, r3, r0
 801149e:	c4007c42 	ff1      	r2, r0
 80114a2:	e422001c 	addi      	r1, r2, 29
 80114a6:	ea0c001f 	movi      	r12, 31
 80114aa:	2a02      	subi      	r2, 3
 80114ac:	4861      	lsri      	r3, r0, 1
 80114ae:	6306      	subu      	r12, r1
 80114b0:	c440402d 	lsl      	r13, r0, r2
 80114b4:	3adf      	btsti      	r2, 31
 80114b6:	70f1      	lsr      	r3, r12
 80114b8:	c46d0c20 	incf      	r3, r13, 0
 80114bc:	7004      	lsl      	r0, r1
 80114be:	b864      	st.w      	r3, (r14, 0x10)
 80114c0:	3300      	movi      	r3, 0
 80114c2:	c4030c20 	incf      	r0, r3, 0
 80114c6:	333c      	movi      	r3, 60
 80114c8:	60c6      	subu      	r3, r1
 80114ca:	b803      	st.w      	r0, (r14, 0xc)
 80114cc:	b862      	st.w      	r3, (r14, 0x8)
 80114ce:	07db      	br      	0x8011484	// 8011484 <__floatsidf+0x14>
 80114d0:	3000      	movi      	r0, 0
 80114d2:	ea21c1e0 	movih      	r1, 49632
 80114d6:	07da      	br      	0x801148a	// 801148a <__floatsidf+0x1a>

080114d8 <__fixdfsi>:
 80114d8:	14d0      	push      	r15
 80114da:	1427      	subi      	r14, r14, 28
 80114dc:	b800      	st.w      	r0, (r14, 0x0)
 80114de:	b821      	st.w      	r1, (r14, 0x4)
 80114e0:	6c3b      	mov      	r0, r14
 80114e2:	1902      	addi      	r1, r14, 8
 80114e4:	e00001c8 	bsr      	0x8011874	// 8011874 <__unpack_d>
 80114e8:	9862      	ld.w      	r3, (r14, 0x8)
 80114ea:	3202      	movi      	r2, 2
 80114ec:	64c8      	cmphs      	r2, r3
 80114ee:	082a      	bt      	0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114f0:	3b44      	cmpnei      	r3, 4
 80114f2:	0c06      	bf      	0x80114fe	// 80114fe <__fixdfsi+0x26>
 80114f4:	9804      	ld.w      	r0, (r14, 0x10)
 80114f6:	e9800026 	blz      	r0, 0x8011542	// 8011542 <__fixdfsi+0x6a>
 80114fa:	383e      	cmplti      	r0, 31
 80114fc:	080a      	bt      	0x8011510	// 8011510 <__fixdfsi+0x38>
 80114fe:	9863      	ld.w      	r3, (r14, 0xc)
 8011500:	3b40      	cmpnei      	r3, 0
 8011502:	c4000500 	mvc      	r0
 8011506:	c7c05023 	bmaski      	r3, 31
 801150a:	600c      	addu      	r0, r3
 801150c:	1407      	addi      	r14, r14, 28
 801150e:	1490      	pop      	r15
 8011510:	323c      	movi      	r2, 60
 8011512:	5a21      	subu      	r1, r2, r0
 8011514:	e581101f 	subi      	r12, r1, 32
 8011518:	9866      	ld.w      	r3, (r14, 0x18)
 801151a:	321f      	movi      	r2, 31
 801151c:	c5834040 	lsr      	r0, r3, r12
 8011520:	6086      	subu      	r2, r1
 8011522:	4361      	lsli      	r3, r3, 1
 8011524:	70c8      	lsl      	r3, r2
 8011526:	9845      	ld.w      	r2, (r14, 0x14)
 8011528:	7085      	lsr      	r2, r1
 801152a:	6c8c      	or      	r2, r3
 801152c:	9863      	ld.w      	r3, (r14, 0xc)
 801152e:	c7ec2880 	btsti      	r12, 31
 8011532:	c4020c40 	inct      	r0, r2, 0
 8011536:	e903ffeb 	bez      	r3, 0x801150c	// 801150c <__fixdfsi+0x34>
 801153a:	3300      	movi      	r3, 0
 801153c:	5b01      	subu      	r0, r3, r0
 801153e:	1407      	addi      	r14, r14, 28
 8011540:	1490      	pop      	r15
 8011542:	3000      	movi      	r0, 0
 8011544:	1407      	addi      	r14, r14, 28
 8011546:	1490      	pop      	r15

08011548 <__make_dp>:
 8011548:	1421      	subi      	r14, r14, 4
 801154a:	14d0      	push      	r15
 801154c:	1425      	subi      	r14, r14, 20
 801154e:	b866      	st.w      	r3, (r14, 0x18)
 8011550:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8011554:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8011558:	b800      	st.w      	r0, (r14, 0x0)
 801155a:	6c3b      	mov      	r0, r14
 801155c:	b821      	st.w      	r1, (r14, 0x4)
 801155e:	b842      	st.w      	r2, (r14, 0x8)
 8011560:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8011564:	ddae2004 	st.w      	r13, (r14, 0x10)
 8011568:	e00000be 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 801156c:	1405      	addi      	r14, r14, 20
 801156e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011572:	1402      	addi      	r14, r14, 8
 8011574:	783c      	jmp      	r15
	...

08011578 <__truncdfsf2>:
 8011578:	14d0      	push      	r15
 801157a:	1427      	subi      	r14, r14, 28
 801157c:	b800      	st.w      	r0, (r14, 0x0)
 801157e:	b821      	st.w      	r1, (r14, 0x4)
 8011580:	6c3b      	mov      	r0, r14
 8011582:	1902      	addi      	r1, r14, 8
 8011584:	e0000178 	bsr      	0x8011874	// 8011874 <__unpack_d>
 8011588:	9845      	ld.w      	r2, (r14, 0x14)
 801158a:	4a3e      	lsri      	r1, r2, 30
 801158c:	9866      	ld.w      	r3, (r14, 0x18)
 801158e:	c40257a2 	zext      	r2, r2, 29, 0
 8011592:	4362      	lsli      	r3, r3, 2
 8011594:	6cc4      	or      	r3, r1
 8011596:	e9020004 	bez      	r2, 0x801159e	// 801159e <__truncdfsf2+0x26>
 801159a:	ec630001 	ori      	r3, r3, 1
 801159e:	9844      	ld.w      	r2, (r14, 0x10)
 80115a0:	9823      	ld.w      	r1, (r14, 0xc)
 80115a2:	9802      	ld.w      	r0, (r14, 0x8)
 80115a4:	e0000094 	bsr      	0x80116cc	// 80116cc <__make_fp>
 80115a8:	1407      	addi      	r14, r14, 28
 80115aa:	1490      	pop      	r15

080115ac <__floatunsidf>:
 80115ac:	14d1      	push      	r4, r15
 80115ae:	1425      	subi      	r14, r14, 20
 80115b0:	3100      	movi      	r1, 0
 80115b2:	b821      	st.w      	r1, (r14, 0x4)
 80115b4:	e9000020 	bez      	r0, 0x80115f4	// 80115f4 <__floatunsidf+0x48>
 80115b8:	c4007c42 	ff1      	r2, r0
 80115bc:	e582001c 	addi      	r12, r2, 29
 80115c0:	3303      	movi      	r3, 3
 80115c2:	ea0d001f 	movi      	r13, 31
 80115c6:	2a02      	subi      	r2, 3
 80115c8:	b860      	st.w      	r3, (r14, 0x0)
 80115ca:	6372      	subu      	r13, r12
 80115cc:	4861      	lsri      	r3, r0, 1
 80115ce:	c4404024 	lsl      	r4, r0, r2
 80115d2:	3adf      	btsti      	r2, 31
 80115d4:	70f5      	lsr      	r3, r13
 80115d6:	c4640c20 	incf      	r3, r4, 0
 80115da:	7030      	lsl      	r0, r12
 80115dc:	c4010c20 	incf      	r0, r1, 0
 80115e0:	b864      	st.w      	r3, (r14, 0x10)
 80115e2:	333c      	movi      	r3, 60
 80115e4:	b803      	st.w      	r0, (r14, 0xc)
 80115e6:	60f2      	subu      	r3, r12
 80115e8:	6c3b      	mov      	r0, r14
 80115ea:	b862      	st.w      	r3, (r14, 0x8)
 80115ec:	e000007c 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115f0:	1405      	addi      	r14, r14, 20
 80115f2:	1491      	pop      	r4, r15
 80115f4:	3302      	movi      	r3, 2
 80115f6:	6c3b      	mov      	r0, r14
 80115f8:	b860      	st.w      	r3, (r14, 0x0)
 80115fa:	e0000075 	bsr      	0x80116e4	// 80116e4 <__pack_d>
 80115fe:	1405      	addi      	r14, r14, 20
 8011600:	1491      	pop      	r4, r15
	...

08011604 <__muldi3>:
 8011604:	14c3      	push      	r4-r6
 8011606:	c602484d 	lsri      	r13, r2, 16
 801160a:	c40055ec 	zext      	r12, r0, 15, 0
 801160e:	4890      	lsri      	r4, r0, 16
 8011610:	c40255e5 	zext      	r5, r2, 15, 0
 8011614:	c4ac8426 	mult      	r6, r12, r5
 8011618:	7d50      	mult      	r5, r4
 801161a:	7f34      	mult      	r12, r13
 801161c:	7d34      	mult      	r4, r13
 801161e:	c4ac002d 	addu      	r13, r12, r5
 8011622:	c606484c 	lsri      	r12, r6, 16
 8011626:	6334      	addu      	r12, r13
 8011628:	6570      	cmphs      	r12, r5
 801162a:	0804      	bt      	0x8011632	// 8011632 <__muldi3+0x2e>
 801162c:	ea2d0001 	movih      	r13, 1
 8011630:	6134      	addu      	r4, r13
 8011632:	c60c484d 	lsri      	r13, r12, 16
 8011636:	7cc0      	mult      	r3, r0
 8011638:	7c48      	mult      	r1, r2
 801163a:	6134      	addu      	r4, r13
 801163c:	c60c482c 	lsli      	r12, r12, 16
 8011640:	c40655e6 	zext      	r6, r6, 15, 0
 8011644:	604c      	addu      	r1, r3
 8011646:	c4cc0020 	addu      	r0, r12, r6
 801164a:	6050      	addu      	r1, r4
 801164c:	1483      	pop      	r4-r6
	...

08011650 <__unpack_f>:
 8011650:	8841      	ld.h      	r2, (r0, 0x2)
 8011652:	9060      	ld.w      	r3, (r0, 0x0)
 8011654:	c4e255c2 	zext      	r2, r2, 14, 7
 8011658:	8003      	ld.b      	r0, (r0, 0x3)
 801165a:	4807      	lsri      	r0, r0, 7
 801165c:	c40356c3 	zext      	r3, r3, 22, 0
 8011660:	b101      	st.w      	r0, (r1, 0x4)
 8011662:	e9220013 	bnez      	r2, 0x8011688	// 8011688 <__unpack_f+0x38>
 8011666:	e903001c 	bez      	r3, 0x801169e	// 801169e <__unpack_f+0x4e>
 801166a:	3203      	movi      	r2, 3
 801166c:	b140      	st.w      	r2, (r1, 0x0)
 801166e:	3200      	movi      	r2, 0
 8011670:	4367      	lsli      	r3, r3, 7
 8011672:	2a7e      	subi      	r2, 127
 8011674:	c7a0502c 	bmaski      	r12, 30
 8011678:	60cc      	addu      	r3, r3
 801167a:	64f0      	cmphs      	r12, r3
 801167c:	6c0b      	mov      	r0, r2
 801167e:	2a00      	subi      	r2, 1
 8011680:	0bfc      	bt      	0x8011678	// 8011678 <__unpack_f+0x28>
 8011682:	b102      	st.w      	r0, (r1, 0x8)
 8011684:	b163      	st.w      	r3, (r1, 0xc)
 8011686:	783c      	jmp      	r15
 8011688:	eb4200ff 	cmpnei      	r2, 255
 801168c:	0c0c      	bf      	0x80116a4	// 80116a4 <__unpack_f+0x54>
 801168e:	2a7e      	subi      	r2, 127
 8011690:	4367      	lsli      	r3, r3, 7
 8011692:	b142      	st.w      	r2, (r1, 0x8)
 8011694:	3bbe      	bseti      	r3, 30
 8011696:	3203      	movi      	r2, 3
 8011698:	b140      	st.w      	r2, (r1, 0x0)
 801169a:	b163      	st.w      	r3, (r1, 0xc)
 801169c:	783c      	jmp      	r15
 801169e:	3302      	movi      	r3, 2
 80116a0:	b160      	st.w      	r3, (r1, 0x0)
 80116a2:	783c      	jmp      	r15
 80116a4:	e903000f 	bez      	r3, 0x80116c2	// 80116c2 <__unpack_f+0x72>
 80116a8:	ea220040 	movih      	r2, 64
 80116ac:	688c      	and      	r2, r3
 80116ae:	3a40      	cmpnei      	r2, 0
 80116b0:	3001      	movi      	r0, 1
 80116b2:	c4400c40 	inct      	r2, r0, 0
 80116b6:	b140      	st.w      	r2, (r1, 0x0)
 80116b8:	4367      	lsli      	r3, r3, 7
 80116ba:	1044      	lrw      	r2, 0xdfffff80	// 80116c8 <__unpack_f+0x78>
 80116bc:	68c8      	and      	r3, r2
 80116be:	b163      	st.w      	r3, (r1, 0xc)
 80116c0:	07ee      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c2:	3304      	movi      	r3, 4
 80116c4:	b160      	st.w      	r3, (r1, 0x0)
 80116c6:	07eb      	br      	0x801169c	// 801169c <__unpack_f+0x4c>
 80116c8:	dfffff80 	.long	0xdfffff80

080116cc <__make_fp>:
 80116cc:	14d0      	push      	r15
 80116ce:	1424      	subi      	r14, r14, 16
 80116d0:	b800      	st.w      	r0, (r14, 0x0)
 80116d2:	6c3b      	mov      	r0, r14
 80116d4:	b821      	st.w      	r1, (r14, 0x4)
 80116d6:	b842      	st.w      	r2, (r14, 0x8)
 80116d8:	b863      	st.w      	r3, (r14, 0xc)
 80116da:	e00001a1 	bsr      	0x8011a1c	// 8011a1c <__pack_f>
 80116de:	1404      	addi      	r14, r14, 16
 80116e0:	1490      	pop      	r15
	...

080116e4 <__pack_d>:
 80116e4:	14c5      	push      	r4-r8
 80116e6:	9020      	ld.w      	r1, (r0, 0x0)
 80116e8:	3901      	cmphsi      	r1, 2
 80116ea:	9043      	ld.w      	r2, (r0, 0xc)
 80116ec:	9064      	ld.w      	r3, (r0, 0x10)
 80116ee:	d9a02001 	ld.w      	r13, (r0, 0x4)
 80116f2:	0c47      	bf      	0x8011780	// 8011780 <__pack_d+0x9c>
 80116f4:	3944      	cmpnei      	r1, 4
 80116f6:	0c40      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 80116f8:	3942      	cmpnei      	r1, 2
 80116fa:	0c28      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80116fc:	c4622421 	or      	r1, r2, r3
 8011700:	e9010025 	bez      	r1, 0x801174a	// 801174a <__pack_d+0x66>
 8011704:	9022      	ld.w      	r1, (r0, 0x8)
 8011706:	ea0003fd 	movi      	r0, 1021
 801170a:	6c02      	nor      	r0, r0
 801170c:	6405      	cmplt      	r1, r0
 801170e:	0855      	bt      	0x80117b8	// 80117b8 <__pack_d+0xd4>
 8011710:	eb2103ff 	cmplti      	r1, 1024
 8011714:	0c31      	bf      	0x8011776	// 8011776 <__pack_d+0x92>
 8011716:	e40220ff 	andi      	r0, r2, 255
 801171a:	eb400080 	cmpnei      	r0, 128
 801171e:	0c43      	bf      	0x80117a4	// 80117a4 <__pack_d+0xc0>
 8011720:	347f      	movi      	r4, 127
 8011722:	3500      	movi      	r5, 0
 8011724:	6489      	cmplt      	r2, r2
 8011726:	6091      	addc      	r2, r4
 8011728:	60d5      	addc      	r3, r5
 801172a:	c7805020 	bmaski      	r0, 29
 801172e:	64c0      	cmphs      	r0, r3
 8011730:	0c19      	bf      	0x8011762	// 8011762 <__pack_d+0x7e>
 8011732:	e58103fe 	addi      	r12, r1, 1023
 8011736:	4b28      	lsri      	r1, r3, 8
 8011738:	4398      	lsli      	r4, r3, 24
 801173a:	4a08      	lsri      	r0, r2, 8
 801173c:	c4015663 	zext      	r3, r1, 19, 0
 8011740:	6c4f      	mov      	r1, r3
 8011742:	6c10      	or      	r0, r4
 8011744:	e46c27ff 	andi      	r3, r12, 2047
 8011748:	0404      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801174a:	3300      	movi      	r3, 0
 801174c:	3000      	movi      	r0, 0
 801174e:	3100      	movi      	r1, 0
 8011750:	3200      	movi      	r2, 0
 8011752:	c4415e60 	ins      	r2, r1, 19, 0
 8011756:	c4435d54 	ins      	r2, r3, 30, 20
 801175a:	c44d5c1f 	ins      	r2, r13, 31, 31
 801175e:	6c4b      	mov      	r1, r2
 8011760:	1485      	pop      	r4-r8
 8011762:	439f      	lsli      	r4, r3, 31
 8011764:	c422484c 	lsri      	r12, r2, 1
 8011768:	4b01      	lsri      	r0, r3, 1
 801176a:	c5842422 	or      	r2, r4, r12
 801176e:	6cc3      	mov      	r3, r0
 8011770:	e58103ff 	addi      	r12, r1, 1024
 8011774:	07e1      	br      	0x8011736	// 8011736 <__pack_d+0x52>
 8011776:	ea0307ff 	movi      	r3, 2047
 801177a:	3000      	movi      	r0, 0
 801177c:	3100      	movi      	r1, 0
 801177e:	07e9      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 8011780:	c703482c 	lsli      	r12, r3, 24
 8011784:	4a48      	lsri      	r2, r2, 8
 8011786:	c44c2420 	or      	r0, r12, r2
 801178a:	c5035741 	zext      	r1, r3, 26, 8
 801178e:	3200      	movi      	r2, 0
 8011790:	ea230008 	movih      	r3, 8
 8011794:	6c08      	or      	r0, r2
 8011796:	6c4c      	or      	r1, r3
 8011798:	c4015663 	zext      	r3, r1, 19, 0
 801179c:	6c4f      	mov      	r1, r3
 801179e:	ea0307ff 	movi      	r3, 2047
 80117a2:	07d7      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 80117a4:	e4022100 	andi      	r0, r2, 256
 80117a8:	e900ffc1 	bez      	r0, 0x801172a	// 801172a <__pack_d+0x46>
 80117ac:	3480      	movi      	r4, 128
 80117ae:	3500      	movi      	r5, 0
 80117b0:	6489      	cmplt      	r2, r2
 80117b2:	6091      	addc      	r2, r4
 80117b4:	60d5      	addc      	r3, r5
 80117b6:	07ba      	br      	0x801172a	// 801172a <__pack_d+0x46>
 80117b8:	5825      	subu      	r1, r0, r1
 80117ba:	eb210038 	cmplti      	r1, 57
 80117be:	0fc6      	bf      	0x801174a	// 801174a <__pack_d+0x66>
 80117c0:	341f      	movi      	r4, 31
 80117c2:	c423482c 	lsli      	r12, r3, 1
 80117c6:	6106      	subu      	r4, r1
 80117c8:	e401101f 	subi      	r0, r1, 32
 80117cc:	7310      	lsl      	r12, r4
 80117ce:	c4224046 	lsr      	r6, r2, r1
 80117d2:	38df      	btsti      	r0, 31
 80117d4:	c4034045 	lsr      	r5, r3, r0
 80117d8:	ea080000 	movi      	r8, 0
 80117dc:	6db0      	or      	r6, r12
 80117de:	ea0c0001 	movi      	r12, 1
 80117e2:	c4c50c20 	incf      	r6, r5, 0
 80117e6:	c40c4020 	lsl      	r0, r12, r0
 80117ea:	6d63      	mov      	r5, r8
 80117ec:	c42c4024 	lsl      	r4, r12, r1
 80117f0:	c4234047 	lsr      	r7, r3, r1
 80117f4:	c4a00c20 	incf      	r5, r0, 0
 80117f8:	c4880c20 	incf      	r4, r8, 0
 80117fc:	c4e80c20 	incf      	r7, r8, 0
 8011800:	3c40      	cmpnei      	r4, 0
 8011802:	c4a50c81 	decf      	r5, r5, 1
 8011806:	2c00      	subi      	r4, 1
 8011808:	6890      	and      	r2, r4
 801180a:	68d4      	and      	r3, r5
 801180c:	6c8c      	or      	r2, r3
 801180e:	3a40      	cmpnei      	r2, 0
 8011810:	c4000502 	mvc      	r2
 8011814:	6ce3      	mov      	r3, r8
 8011816:	6d88      	or      	r6, r2
 8011818:	6dcc      	or      	r7, r3
 801181a:	e46620ff 	andi      	r3, r6, 255
 801181e:	eb430080 	cmpnei      	r3, 128
 8011822:	0814      	bt      	0x801184a	// 801184a <__pack_d+0x166>
 8011824:	e4662100 	andi      	r3, r6, 256
 8011828:	e9230023 	bnez      	r3, 0x801186e	// 801186e <__pack_d+0x18a>
 801182c:	4758      	lsli      	r2, r7, 24
 801182e:	4f28      	lsri      	r1, r7, 8
 8011830:	4e08      	lsri      	r0, r6, 8
 8011832:	6c08      	or      	r0, r2
 8011834:	c4015662 	zext      	r2, r1, 19, 0
 8011838:	6c4b      	mov      	r1, r2
 801183a:	c7605022 	bmaski      	r2, 28
 801183e:	65c8      	cmphs      	r2, r7
 8011840:	0c02      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 8011842:	6f0f      	mov      	r12, r3
 8011844:	e46c2001 	andi      	r3, r12, 1
 8011848:	0784      	br      	0x8011750	// 8011750 <__pack_d+0x6c>
 801184a:	327f      	movi      	r2, 127
 801184c:	3300      	movi      	r3, 0
 801184e:	6599      	cmplt      	r6, r6
 8011850:	6189      	addc      	r6, r2
 8011852:	61cd      	addc      	r7, r3
 8011854:	4778      	lsli      	r3, r7, 24
 8011856:	4f28      	lsri      	r1, r7, 8
 8011858:	4e08      	lsri      	r0, r6, 8
 801185a:	6c0c      	or      	r0, r3
 801185c:	c4015663 	zext      	r3, r1, 19, 0
 8011860:	6c4f      	mov      	r1, r3
 8011862:	c7605023 	bmaski      	r3, 28
 8011866:	65cc      	cmphs      	r3, r7
 8011868:	0fee      	bf      	0x8011844	// 8011844 <__pack_d+0x160>
 801186a:	6f23      	mov      	r12, r8
 801186c:	07ec      	br      	0x8011844	// 8011844 <__pack_d+0x160>
 801186e:	3280      	movi      	r2, 128
 8011870:	07ee      	br      	0x801184c	// 801184c <__pack_d+0x168>
	...

08011874 <__unpack_d>:
 8011874:	1421      	subi      	r14, r14, 4
 8011876:	dd6e2000 	st.w      	r11, (r14, 0x0)
 801187a:	8863      	ld.h      	r3, (r0, 0x6)
 801187c:	8047      	ld.b      	r2, (r0, 0x7)
 801187e:	c48355c3 	zext      	r3, r3, 14, 4
 8011882:	d9802001 	ld.w      	r12, (r0, 0x4)
 8011886:	4a47      	lsri      	r2, r2, 7
 8011888:	d9a02000 	ld.w      	r13, (r0, 0x0)
 801188c:	c40c566c 	zext      	r12, r12, 19, 0
 8011890:	b141      	st.w      	r2, (r1, 0x4)
 8011892:	e9230025 	bnez      	r3, 0x80118dc	// 80118dc <__unpack_d+0x68>
 8011896:	c58d2423 	or      	r3, r13, r12
 801189a:	e903003c 	bez      	r3, 0x8011912	// 8011912 <__unpack_d+0x9e>
 801189e:	c70d4840 	lsri      	r0, r13, 24
 80118a2:	c50c4823 	lsli      	r3, r12, 8
 80118a6:	6cc0      	or      	r3, r0
 80118a8:	3003      	movi      	r0, 3
 80118aa:	c50d4822 	lsli      	r2, r13, 8
 80118ae:	b100      	st.w      	r0, (r1, 0x0)
 80118b0:	c760502d 	bmaski      	r13, 28
 80118b4:	ea0003fe 	movi      	r0, 1022
 80118b8:	6c02      	nor      	r0, r0
 80118ba:	6ecb      	mov      	r11, r2
 80118bc:	6f0f      	mov      	r12, r3
 80118be:	6489      	cmplt      	r2, r2
 80118c0:	60ad      	addc      	r2, r11
 80118c2:	60f1      	addc      	r3, r12
 80118c4:	64f4      	cmphs      	r13, r3
 80118c6:	6f03      	mov      	r12, r0
 80118c8:	2800      	subi      	r0, 1
 80118ca:	0bf8      	bt      	0x80118ba	// 80118ba <__unpack_d+0x46>
 80118cc:	dd812002 	st.w      	r12, (r1, 0x8)
 80118d0:	b143      	st.w      	r2, (r1, 0xc)
 80118d2:	b164      	st.w      	r3, (r1, 0x10)
 80118d4:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80118d8:	1401      	addi      	r14, r14, 4
 80118da:	783c      	jmp      	r15
 80118dc:	eb4307ff 	cmpnei      	r3, 2047
 80118e0:	0c1f      	bf      	0x801191e	// 801191e <__unpack_d+0xaa>
 80118e2:	e46313fe 	subi      	r3, r3, 1023
 80118e6:	b162      	st.w      	r3, (r1, 0x8)
 80118e8:	3303      	movi      	r3, 3
 80118ea:	c70d4840 	lsri      	r0, r13, 24
 80118ee:	b160      	st.w      	r3, (r1, 0x0)
 80118f0:	c50c4823 	lsli      	r3, r12, 8
 80118f4:	c50d4822 	lsli      	r2, r13, 8
 80118f8:	6cc0      	or      	r3, r0
 80118fa:	ea0c0000 	movi      	r12, 0
 80118fe:	ea2d1000 	movih      	r13, 4096
 8011902:	6cb0      	or      	r2, r12
 8011904:	6cf4      	or      	r3, r13
 8011906:	b143      	st.w      	r2, (r1, 0xc)
 8011908:	b164      	st.w      	r3, (r1, 0x10)
 801190a:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801190e:	1401      	addi      	r14, r14, 4
 8011910:	783c      	jmp      	r15
 8011912:	3302      	movi      	r3, 2
 8011914:	b160      	st.w      	r3, (r1, 0x0)
 8011916:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801191a:	1401      	addi      	r14, r14, 4
 801191c:	783c      	jmp      	r15
 801191e:	c58d2423 	or      	r3, r13, r12
 8011922:	e9030018 	bez      	r3, 0x8011952	// 8011952 <__unpack_d+0xde>
 8011926:	ea230008 	movih      	r3, 8
 801192a:	68f0      	and      	r3, r12
 801192c:	3b40      	cmpnei      	r3, 0
 801192e:	3201      	movi      	r2, 1
 8011930:	c4620c40 	inct      	r3, r2, 0
 8011934:	b160      	st.w      	r3, (r1, 0x0)
 8011936:	c50c482c 	lsli      	r12, r12, 8
 801193a:	c70d4843 	lsri      	r3, r13, 24
 801193e:	6f0c      	or      	r12, r3
 8011940:	c50d482d 	lsli      	r13, r13, 8
 8011944:	c76c282c 	bclri      	r12, r12, 27
 8011948:	dda12003 	st.w      	r13, (r1, 0xc)
 801194c:	dd812004 	st.w      	r12, (r1, 0x10)
 8011950:	07dd      	br      	0x801190a	// 801190a <__unpack_d+0x96>
 8011952:	3304      	movi      	r3, 4
 8011954:	b160      	st.w      	r3, (r1, 0x0)
 8011956:	07da      	br      	0x801190a	// 801190a <__unpack_d+0x96>

08011958 <__fpcmp_parts_d>:
 8011958:	9040      	ld.w      	r2, (r0, 0x0)
 801195a:	3301      	movi      	r3, 1
 801195c:	648c      	cmphs      	r3, r2
 801195e:	0830      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011960:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011964:	670c      	cmphs      	r3, r12
 8011966:	082c      	bt      	0x80119be	// 80119be <__fpcmp_parts_d+0x66>
 8011968:	3a44      	cmpnei      	r2, 4
 801196a:	0c1f      	bf      	0x80119a8	// 80119a8 <__fpcmp_parts_d+0x50>
 801196c:	eb4c0004 	cmpnei      	r12, 4
 8011970:	0c14      	bf      	0x8011998	// 8011998 <__fpcmp_parts_d+0x40>
 8011972:	3a42      	cmpnei      	r2, 2
 8011974:	0c0f      	bf      	0x8011992	// 8011992 <__fpcmp_parts_d+0x3a>
 8011976:	eb4c0002 	cmpnei      	r12, 2
 801197a:	0c1a      	bf      	0x80119ae	// 80119ae <__fpcmp_parts_d+0x56>
 801197c:	9041      	ld.w      	r2, (r0, 0x4)
 801197e:	d9812001 	ld.w      	r12, (r1, 0x4)
 8011982:	670a      	cmpne      	r2, r12
 8011984:	0c1f      	bf      	0x80119c2	// 80119c2 <__fpcmp_parts_d+0x6a>
 8011986:	3000      	movi      	r0, 0
 8011988:	2800      	subi      	r0, 1
 801198a:	3a40      	cmpnei      	r2, 0
 801198c:	c4030c20 	incf      	r0, r3, 0
 8011990:	783c      	jmp      	r15
 8011992:	eb4c0002 	cmpnei      	r12, 2
 8011996:	0c2a      	bf      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 8011998:	9141      	ld.w      	r2, (r1, 0x4)
 801199a:	3300      	movi      	r3, 0
 801199c:	2b00      	subi      	r3, 1
 801199e:	3a40      	cmpnei      	r2, 0
 80119a0:	3001      	movi      	r0, 1
 80119a2:	c4030c20 	incf      	r0, r3, 0
 80119a6:	783c      	jmp      	r15
 80119a8:	eb4c0004 	cmpnei      	r12, 4
 80119ac:	0c21      	bf      	0x80119ee	// 80119ee <__fpcmp_parts_d+0x96>
 80119ae:	9061      	ld.w      	r3, (r0, 0x4)
 80119b0:	3000      	movi      	r0, 0
 80119b2:	3b40      	cmpnei      	r3, 0
 80119b4:	2800      	subi      	r0, 1
 80119b6:	3301      	movi      	r3, 1
 80119b8:	c4030c20 	incf      	r0, r3, 0
 80119bc:	783c      	jmp      	r15
 80119be:	6c0f      	mov      	r0, r3
 80119c0:	783c      	jmp      	r15
 80119c2:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80119c6:	d9812002 	ld.w      	r12, (r1, 0x8)
 80119ca:	6771      	cmplt      	r12, r13
 80119cc:	0bdd      	bt      	0x8011986	// 8011986 <__fpcmp_parts_d+0x2e>
 80119ce:	6735      	cmplt      	r13, r12
 80119d0:	0c13      	bf      	0x80119f6	// 80119f6 <__fpcmp_parts_d+0x9e>
 80119d2:	3000      	movi      	r0, 0
 80119d4:	2800      	subi      	r0, 1
 80119d6:	3a40      	cmpnei      	r2, 0
 80119d8:	c4030c40 	inct      	r0, r3, 0
 80119dc:	07da      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119de:	644c      	cmphs      	r3, r1
 80119e0:	0fdd      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119e2:	64c6      	cmpne      	r1, r3
 80119e4:	0803      	bt      	0x80119ea	// 80119ea <__fpcmp_parts_d+0x92>
 80119e6:	6430      	cmphs      	r12, r0
 80119e8:	0fd9      	bf      	0x801199a	// 801199a <__fpcmp_parts_d+0x42>
 80119ea:	3000      	movi      	r0, 0
 80119ec:	07d2      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119ee:	9161      	ld.w      	r3, (r1, 0x4)
 80119f0:	9001      	ld.w      	r0, (r0, 0x4)
 80119f2:	5b01      	subu      	r0, r3, r0
 80119f4:	07ce      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
 80119f6:	9064      	ld.w      	r3, (r0, 0x10)
 80119f8:	d9802003 	ld.w      	r12, (r0, 0xc)
 80119fc:	9103      	ld.w      	r0, (r1, 0xc)
 80119fe:	9124      	ld.w      	r1, (r1, 0x10)
 8011a00:	64c4      	cmphs      	r1, r3
 8011a02:	0c05      	bf      	0x8011a0c	// 8011a0c <__fpcmp_parts_d+0xb4>
 8011a04:	644e      	cmpne      	r3, r1
 8011a06:	0bec      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a08:	6700      	cmphs      	r0, r12
 8011a0a:	0bea      	bt      	0x80119de	// 80119de <__fpcmp_parts_d+0x86>
 8011a0c:	3000      	movi      	r0, 0
 8011a0e:	2800      	subi      	r0, 1
 8011a10:	3a40      	cmpnei      	r2, 0
 8011a12:	3301      	movi      	r3, 1
 8011a14:	c4030c20 	incf      	r0, r3, 0
 8011a18:	07bc      	br      	0x8011990	// 8011990 <__fpcmp_parts_d+0x38>
	...

08011a1c <__pack_f>:
 8011a1c:	9040      	ld.w      	r2, (r0, 0x0)
 8011a1e:	3a01      	cmphsi      	r2, 2
 8011a20:	9063      	ld.w      	r3, (r0, 0xc)
 8011a22:	9021      	ld.w      	r1, (r0, 0x4)
 8011a24:	0c2b      	bf      	0x8011a7a	// 8011a7a <__pack_f+0x5e>
 8011a26:	3a44      	cmpnei      	r2, 4
 8011a28:	0c23      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a2a:	3a42      	cmpnei      	r2, 2
 8011a2c:	0c24      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a2e:	e9030021 	bez      	r3, 0x8011a70	// 8011a70 <__pack_f+0x54>
 8011a32:	9042      	ld.w      	r2, (r0, 0x8)
 8011a34:	3000      	movi      	r0, 0
 8011a36:	287d      	subi      	r0, 126
 8011a38:	6409      	cmplt      	r2, r0
 8011a3a:	082f      	bt      	0x8011a98	// 8011a98 <__pack_f+0x7c>
 8011a3c:	eb22007f 	cmplti      	r2, 128
 8011a40:	0c17      	bf      	0x8011a6e	// 8011a6e <__pack_f+0x52>
 8011a42:	e403207f 	andi      	r0, r3, 127
 8011a46:	eb400040 	cmpnei      	r0, 64
 8011a4a:	0c1e      	bf      	0x8011a86	// 8011a86 <__pack_f+0x6a>
 8011a4c:	233e      	addi      	r3, 63
 8011a4e:	e9830022 	blz      	r3, 0x8011a92	// 8011a92 <__pack_f+0x76>
 8011a52:	227e      	addi      	r2, 127
 8011a54:	c4e357a0 	zext      	r0, r3, 29, 7
 8011a58:	74c8      	zextb      	r3, r2
 8011a5a:	3200      	movi      	r2, 0
 8011a5c:	c4405ec0 	ins      	r2, r0, 22, 0
 8011a60:	c4435cf7 	ins      	r2, r3, 30, 23
 8011a64:	c4415c1f 	ins      	r2, r1, 31, 31
 8011a68:	f4021b60 	fmtvrl      	fr0, r2
 8011a6c:	783c      	jmp      	r15
 8011a6e:	33ff      	movi      	r3, 255
 8011a70:	3000      	movi      	r0, 0
 8011a72:	07f4      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a74:	3300      	movi      	r3, 0
 8011a76:	6c0f      	mov      	r0, r3
 8011a78:	07f1      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a7a:	c4e35783 	zext      	r3, r3, 28, 7
 8011a7e:	c6c32840 	bseti      	r0, r3, 22
 8011a82:	33ff      	movi      	r3, 255
 8011a84:	07eb      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011a86:	e4032080 	andi      	r0, r3, 128
 8011a8a:	e900ffe2 	bez      	r0, 0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a8e:	233f      	addi      	r3, 64
 8011a90:	07df      	br      	0x8011a4e	// 8011a4e <__pack_f+0x32>
 8011a92:	4b61      	lsri      	r3, r3, 1
 8011a94:	227f      	addi      	r2, 128
 8011a96:	07df      	br      	0x8011a54	// 8011a54 <__pack_f+0x38>
 8011a98:	5849      	subu      	r2, r0, r2
 8011a9a:	3a39      	cmplti      	r2, 26
 8011a9c:	0fec      	bf      	0x8011a74	// 8011a74 <__pack_f+0x58>
 8011a9e:	3001      	movi      	r0, 1
 8011aa0:	c443404c 	lsr      	r12, r3, r2
 8011aa4:	c4404022 	lsl      	r2, r0, r2
 8011aa8:	2a00      	subi      	r2, 1
 8011aaa:	68c8      	and      	r3, r2
 8011aac:	3b40      	cmpnei      	r3, 0
 8011aae:	c4000503 	mvc      	r3
 8011ab2:	6cf0      	or      	r3, r12
 8011ab4:	e443207f 	andi      	r2, r3, 127
 8011ab8:	eb420040 	cmpnei      	r2, 64
 8011abc:	080e      	bt      	0x8011ad8	// 8011ad8 <__pack_f+0xbc>
 8011abe:	e4432080 	andi      	r2, r3, 128
 8011ac2:	e9020003 	bez      	r2, 0x8011ac8	// 8011ac8 <__pack_f+0xac>
 8011ac6:	233f      	addi      	r3, 64
 8011ac8:	c7a05022 	bmaski      	r2, 30
 8011acc:	64c8      	cmphs      	r2, r3
 8011ace:	6483      	mvcv      	r2
 8011ad0:	c4e357a0 	zext      	r0, r3, 29, 7
 8011ad4:	74c8      	zextb      	r3, r2
 8011ad6:	07c2      	br      	0x8011a5a	// 8011a5a <__pack_f+0x3e>
 8011ad8:	233e      	addi      	r3, 63
 8011ada:	07f7      	br      	0x8011ac8	// 8011ac8 <__pack_f+0xac>

08011adc <__GI_putchar>:
 8011adc:	14d0      	push      	r15
 8011ade:	1063      	lrw      	r3, 0x20000120	// 8011ae8 <__GI_putchar+0xc>
 8011ae0:	9320      	ld.w      	r1, (r3, 0x0)
 8011ae2:	e000009f 	bsr      	0x8011c20	// 8011c20 <__GI_putc>
 8011ae6:	1490      	pop      	r15
 8011ae8:	20000120 	.long	0x20000120

08011aec <__GI_puts>:
 8011aec:	14d1      	push      	r4, r15
 8011aee:	1085      	lrw      	r4, 0x20000120	// 8011b00 <__GI_puts+0x14>
 8011af0:	9420      	ld.w      	r1, (r4, 0x0)
 8011af2:	e0000009 	bsr      	0x8011b04	// 8011b04 <__GI_fputs>
 8011af6:	9420      	ld.w      	r1, (r4, 0x0)
 8011af8:	300a      	movi      	r0, 10
 8011afa:	e0001b53 	bsr      	0x80151a0	// 80151a0 <fputc>
 8011afe:	1491      	pop      	r4, r15
 8011b00:	20000120 	.long	0x20000120

08011b04 <__GI_fputs>:
 8011b04:	14d5      	push      	r4-r8, r15
 8011b06:	6d03      	mov      	r4, r0
 8011b08:	6d87      	mov      	r6, r1
 8011b0a:	e9010018 	bez      	r1, 0x8011b3a	// 8011b3a <__GI_fputs+0x36>
 8011b0e:	e5010017 	addi      	r8, r1, 24
 8011b12:	6c23      	mov      	r0, r8
 8011b14:	e0000080 	bsr      	0x8011c14	// 8011c14 <__GI_os_critical_enter>
 8011b18:	8400      	ld.b      	r0, (r4, 0x0)
 8011b1a:	e9000014 	bez      	r0, 0x8011b42	// 8011b42 <__GI_fputs+0x3e>
 8011b1e:	3500      	movi      	r5, 0
 8011b20:	6dd7      	mov      	r7, r5
 8011b22:	2f00      	subi      	r7, 1
 8011b24:	0406      	br      	0x8011b30	// 8011b30 <__GI_fputs+0x2c>
 8011b26:	2400      	addi      	r4, 1
 8011b28:	8400      	ld.b      	r0, (r4, 0x0)
 8011b2a:	2500      	addi      	r5, 1
 8011b2c:	e900000c 	bez      	r0, 0x8011b44	// 8011b44 <__GI_fputs+0x40>
 8011b30:	6c5b      	mov      	r1, r6
 8011b32:	e0001b37 	bsr      	0x80151a0	// 80151a0 <fputc>
 8011b36:	65c2      	cmpne      	r0, r7
 8011b38:	0bf7      	bt      	0x8011b26	// 8011b26 <__GI_fputs+0x22>
 8011b3a:	3500      	movi      	r5, 0
 8011b3c:	2d00      	subi      	r5, 1
 8011b3e:	6c17      	mov      	r0, r5
 8011b40:	1495      	pop      	r4-r8, r15
 8011b42:	6d43      	mov      	r5, r0
 8011b44:	6c23      	mov      	r0, r8
 8011b46:	e0000069 	bsr      	0x8011c18	// 8011c18 <__GI_os_critical_exit>
 8011b4a:	6c17      	mov      	r0, r5
 8011b4c:	1495      	pop      	r4-r8, r15
	...

08011b50 <__strlen_fast>:
 8011b50:	6c43      	mov      	r1, r0
 8011b52:	e4002003 	andi      	r0, r0, 3
 8011b56:	e9000009 	bez      	r0, 0x8011b68	// 8011b68 <__strlen_fast+0x18>
 8011b5a:	3000      	movi      	r0, 0
 8011b5c:	8140      	ld.b      	r2, (r1, 0x0)
 8011b5e:	e9020017 	bez      	r2, 0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b62:	2100      	addi      	r1, 1
 8011b64:	2000      	addi      	r0, 1
 8011b66:	07fb      	br      	0x8011b5c	// 8011b5c <__strlen_fast+0xc>
 8011b68:	9140      	ld.w      	r2, (r1, 0x0)
 8011b6a:	680b      	tstnbz      	r2
 8011b6c:	0c04      	bf      	0x8011b74	// 8011b74 <__strlen_fast+0x24>
 8011b6e:	2103      	addi      	r1, 4
 8011b70:	2003      	addi      	r0, 4
 8011b72:	07fb      	br      	0x8011b68	// 8011b68 <__strlen_fast+0x18>
 8011b74:	c4027103 	xtrb3      	r3, r2
 8011b78:	0c0a      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b7a:	2000      	addi      	r0, 1
 8011b7c:	c4027083 	xtrb2      	r3, r2
 8011b80:	0c06      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b82:	2000      	addi      	r0, 1
 8011b84:	c4027043 	xtrb1      	r3, r2
 8011b88:	0c02      	bf      	0x8011b8c	// 8011b8c <__strlen_fast+0x3c>
 8011b8a:	2000      	addi      	r0, 1
 8011b8c:	783c      	jmp      	r15
	...

08011b90 <__memcpy_fast>:
 8011b90:	14c1      	push      	r4
 8011b92:	6f03      	mov      	r12, r0
 8011b94:	c401242d 	or      	r13, r1, r0
 8011b98:	e48d2003 	andi      	r4, r13, 3
 8011b9c:	e904000e 	bez      	r4, 0x8011bb8	// 8011bb8 <__memcpy_fast+0x28>
 8011ba0:	e902000b 	bez      	r2, 0x8011bb6	// 8011bb6 <__memcpy_fast+0x26>
 8011ba4:	8160      	ld.b      	r3, (r1, 0x0)
 8011ba6:	2100      	addi      	r1, 1
 8011ba8:	2a00      	subi      	r2, 1
 8011baa:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011bae:	e58c0000 	addi      	r12, r12, 1
 8011bb2:	e922fff9 	bnez      	r2, 0x8011ba4	// 8011ba4 <__memcpy_fast+0x14>
 8011bb6:	1481      	pop      	r4
 8011bb8:	3a2f      	cmplti      	r2, 16
 8011bba:	0815      	bt      	0x8011be4	// 8011be4 <__memcpy_fast+0x54>
 8011bbc:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8011bc0:	9161      	ld.w      	r3, (r1, 0x4)
 8011bc2:	9182      	ld.w      	r4, (r1, 0x8)
 8011bc4:	ddac2000 	st.w      	r13, (r12, 0x0)
 8011bc8:	d9a12003 	ld.w      	r13, (r1, 0xc)
 8011bcc:	dc6c2001 	st.w      	r3, (r12, 0x4)
 8011bd0:	dc8c2002 	st.w      	r4, (r12, 0x8)
 8011bd4:	ddac2003 	st.w      	r13, (r12, 0xc)
 8011bd8:	2a0f      	subi      	r2, 16
 8011bda:	210f      	addi      	r1, 16
 8011bdc:	e58c000f 	addi      	r12, r12, 16
 8011be0:	3a2f      	cmplti      	r2, 16
 8011be2:	0fed      	bf      	0x8011bbc	// 8011bbc <__memcpy_fast+0x2c>
 8011be4:	3a23      	cmplti      	r2, 4
 8011be6:	080a      	bt      	0x8011bfa	// 8011bfa <__memcpy_fast+0x6a>
 8011be8:	9160      	ld.w      	r3, (r1, 0x0)
 8011bea:	2a03      	subi      	r2, 4
 8011bec:	2103      	addi      	r1, 4
 8011bee:	dc6c2000 	st.w      	r3, (r12, 0x0)
 8011bf2:	e58c0003 	addi      	r12, r12, 4
 8011bf6:	3a23      	cmplti      	r2, 4
 8011bf8:	0ff8      	bf      	0x8011be8	// 8011be8 <__memcpy_fast+0x58>
 8011bfa:	e902ffde 	bez      	r2, 0x8011bb6	// 8011bb6 <__memcpy_fast+0x26>
 8011bfe:	8160      	ld.b      	r3, (r1, 0x0)
 8011c00:	2100      	addi      	r1, 1
 8011c02:	2a00      	subi      	r2, 1
 8011c04:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011c08:	e58c0000 	addi      	r12, r12, 1
 8011c0c:	07f7      	br      	0x8011bfa	// 8011bfa <__memcpy_fast+0x6a>
	...

08011c10 <__GI_os_critical_open>:
 8011c10:	3000      	movi      	r0, 0
 8011c12:	783c      	jmp      	r15

08011c14 <__GI_os_critical_enter>:
 8011c14:	3000      	movi      	r0, 0
 8011c16:	783c      	jmp      	r15

08011c18 <__GI_os_critical_exit>:
 8011c18:	3000      	movi      	r0, 0
 8011c1a:	783c      	jmp      	r15

08011c1c <__GI_os_critical_close>:
 8011c1c:	3000      	movi      	r0, 0
 8011c1e:	783c      	jmp      	r15

08011c20 <__GI_putc>:
 8011c20:	14d0      	push      	r15
 8011c22:	e0001abf 	bsr      	0x80151a0	// 80151a0 <fputc>
 8011c26:	1490      	pop      	r15

08011c28 <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011c28:	d9812000 	ld.w      	r12, (r1, 0x0)
 8011c2c:	e90c0044 	bez      	r12, 0x8011cb4	// 8011cb4 <HAL_GPIO_Init+0x8c>
 8011c30:	3200      	movi      	r2, 0
	{
		ioposition = (0x01 << position);
 8011c32:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 8011c36:	ea96001f 	lrw      	r22, 0x80153d4	// 8011cb0 <HAL_GPIO_Init+0x88>
 8011c3a:	0406      	br      	0x8011c46	// 8011c46 <HAL_GPIO_Init+0x1e>
			{
				SET_BIT(GPIOx->IE, ioposition);
			}
		}
		
		position++;
 8011c3c:	2200      	addi      	r2, 1
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011c3e:	c44c4043 	lsr      	r3, r12, r2
 8011c42:	e9030039 	bez      	r3, 0x8011cb4	// 8011cb4 <HAL_GPIO_Init+0x8c>
		ioposition = (0x01 << position);
 8011c46:	c4544023 	lsl      	r3, r20, r2
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8011c4a:	c583202d 	and      	r13, r3, r12
		if (iocurrent == ioposition)
 8011c4e:	674e      	cmpne      	r3, r13
 8011c50:	0bf6      	bt      	0x8011c3c	// 8011c3c <HAL_GPIO_Init+0x14>
			switch (GPIO_Init->Mode)
 8011c52:	da612001 	ld.w      	r19, (r1, 0x4)
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011c56:	da402004 	ld.w      	r18, (r0, 0x10)
 8011c5a:	c463248d 	nor      	r13, r3, r3
			switch (GPIO_Init->Mode)
 8011c5e:	eb530002 	cmpnei      	r19, 2
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011c62:	c5b22032 	and      	r18, r18, r13
 8011c66:	de402004 	st.w      	r18, (r0, 0x10)
			switch (GPIO_Init->Mode)
 8011c6a:	0c44      	bf      	0x8011cf2	// 8011cf2 <HAL_GPIO_Init+0xca>
 8011c6c:	eb130002 	cmphsi      	r19, 3
 8011c70:	0823      	bt      	0x8011cb6	// 8011cb6 <HAL_GPIO_Init+0x8e>
 8011c72:	eb530001 	cmpnei      	r19, 1
 8011c76:	08a3      	bt      	0x8011dbc	// 8011dbc <HAL_GPIO_Init+0x194>
 8011c78:	ea120000 	movi      	r18, 0
 8011c7c:	e6521085 	subi      	r18, r18, 134
					CLEAR_BIT(GPIOx->DIR, ioposition);
 8011c80:	daa02002 	ld.w      	r21, (r0, 0x8)
 8011c84:	c6ad2035 	and      	r21, r13, r21
 8011c88:	dea02002 	st.w      	r21, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011c8c:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011c90:	eb550012 	cmpnei      	r21, 18
 8011c94:	0c1b      	bf      	0x8011cca	// 8011cca <HAL_GPIO_Init+0xa2>
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 8011c96:	eb550013 	cmpnei      	r21, 19
 8011c9a:	0c37      	bf      	0x8011d08	// 8011d08 <HAL_GPIO_Init+0xe0>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8011c9c:	eb550014 	cmpnei      	r21, 20
 8011ca0:	0c91      	bf      	0x8011dc2	// 8011dc2 <HAL_GPIO_Init+0x19a>
			switch (GPIO_Init->Mode)
 8011ca2:	eb120004 	cmphsi      	r18, 5
 8011ca6:	0821      	bt      	0x8011ce8	// 8011ce8 <HAL_GPIO_Init+0xc0>
 8011ca8:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8011cac:	e8d20000 	jmp      	r18
 8011cb0:	080153d4 	.long	0x080153d4
	}
}
 8011cb4:	783c      	jmp      	r15
			switch (GPIO_Init->Mode)
 8011cb6:	e6531086 	subi      	r18, r19, 135
 8011cba:	eb120004 	cmphsi      	r18, 5
 8011cbe:	0fe1      	bf      	0x8011c80	// 8011c80 <HAL_GPIO_Init+0x58>
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011cc0:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011cc4:	eb550012 	cmpnei      	r21, 18
 8011cc8:	0be7      	bt      	0x8011c96	// 8011c96 <HAL_GPIO_Init+0x6e>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011cca:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011cce:	c6a32435 	or      	r21, r3, r21
 8011cd2:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011cd6:	daa02007 	ld.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011cda:	eb120004 	cmphsi      	r18, 5
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011cde:	c6ad2035 	and      	r21, r13, r21
 8011ce2:	dea02007 	st.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011ce6:	0fe1      	bf      	0x8011ca8	// 8011ca8 <HAL_GPIO_Init+0x80>
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8011ce8:	e6732080 	andi      	r19, r19, 128
 8011cec:	e913ffa8 	bez      	r19, 0x8011c3c	// 8011c3c <HAL_GPIO_Init+0x14>
 8011cf0:	0423      	br      	0x8011d36	// 8011d36 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->DIR, ioposition);
 8011cf2:	da402002 	ld.w      	r18, (r0, 0x8)
 8011cf6:	c6432432 	or      	r18, r3, r18
 8011cfa:	de402002 	st.w      	r18, (r0, 0x8)
 8011cfe:	ea120000 	movi      	r18, 0
 8011d02:	e6521084 	subi      	r18, r18, 133
					break;
 8011d06:	07c3      	br      	0x8011c8c	// 8011c8c <HAL_GPIO_Init+0x64>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d08:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011d0c:	c6ad2035 	and      	r21, r13, r21
 8011d10:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011d14:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011d18:	c6ad2035 	and      	r21, r13, r21
 8011d1c:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011d20:	07c1      	br      	0x8011ca2	// 8011ca2 <HAL_GPIO_Init+0x7a>
					SET_BIT(GPIOx->IS, ioposition);
 8011d22:	d9a02008 	ld.w      	r13, (r0, 0x20)
 8011d26:	6f4c      	or      	r13, r3
 8011d28:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IEV, ioposition);
 8011d2c:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011d30:	6f4c      	or      	r13, r3
 8011d32:	dda0200a 	st.w      	r13, (r0, 0x28)
				SET_BIT(GPIOx->IE, ioposition);
 8011d36:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 8011d3a:	6cf4      	or      	r3, r13
 8011d3c:	b06b      	st.w      	r3, (r0, 0x2c)
 8011d3e:	077f      	br      	0x8011c3c	// 8011c3c <HAL_GPIO_Init+0x14>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011d40:	da402008 	ld.w      	r18, (r0, 0x20)
 8011d44:	c64d202d 	and      	r13, r13, r18
 8011d48:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8011d4c:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8011d50:	6f4c      	or      	r13, r3
 8011d52:	dda02009 	st.w      	r13, (r0, 0x24)
					break;
 8011d56:	07f0      	br      	0x8011d36	// 8011d36 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011d58:	da402008 	ld.w      	r18, (r0, 0x20)
 8011d5c:	c64d2032 	and      	r18, r13, r18
 8011d60:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011d64:	da402009 	ld.w      	r18, (r0, 0x24)
 8011d68:	c64d2032 	and      	r18, r13, r18
 8011d6c:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011d70:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011d74:	c64d202d 	and      	r13, r13, r18
 8011d78:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011d7c:	07dd      	br      	0x8011d36	// 8011d36 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011d7e:	da402008 	ld.w      	r18, (r0, 0x20)
 8011d82:	c64d2032 	and      	r18, r13, r18
 8011d86:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011d8a:	da402009 	ld.w      	r18, (r0, 0x24)
 8011d8e:	c64d202d 	and      	r13, r13, r18
 8011d92:	dda02009 	st.w      	r13, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8011d96:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011d9a:	6f4c      	or      	r13, r3
 8011d9c:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011da0:	07cb      	br      	0x8011d36	// 8011d36 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->IS, ioposition);
 8011da2:	da402008 	ld.w      	r18, (r0, 0x20)
 8011da6:	c6432432 	or      	r18, r3, r18
 8011daa:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011dae:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011db2:	c64d202d 	and      	r13, r13, r18
 8011db6:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011dba:	07be      	br      	0x8011d36	// 8011d36 <HAL_GPIO_Init+0x10e>
 8011dbc:	e6531086 	subi      	r18, r19, 135
 8011dc0:	0766      	br      	0x8011c8c	// 8011c8c <HAL_GPIO_Init+0x64>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011dc2:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011dc6:	c6a32435 	or      	r21, r3, r21
 8011dca:	dea02003 	st.w      	r21, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011dce:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011dd2:	c6a32435 	or      	r21, r3, r21
 8011dd6:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011dda:	0764      	br      	0x8011ca2	// 8011ca2 <HAL_GPIO_Init+0x7a>

08011ddc <HAL_GPIO_ReadPin>:
{
	GPIO_PinState bitstatus;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));

	if ((GPIOx->DATA & GPIO_Pin) != GPIO_PIN_RESET)
 8011ddc:	9060      	ld.w      	r3, (r0, 0x0)
 8011dde:	684c      	and      	r1, r3
 8011de0:	3940      	cmpnei      	r1, 0
	else
	{
		bitstatus = GPIO_PIN_RESET;
	}
	return bitstatus;
}
 8011de2:	c4000500 	mvc      	r0
 8011de6:	783c      	jmp      	r15

08011de8 <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011de8:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011dec:	9061      	ld.w      	r3, (r0, 0x4)
 8011dee:	6cc4      	or      	r3, r1
 8011df0:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011df2:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8011df4:	e9220008 	bnez      	r2, 0x8011e04	// 8011e04 <HAL_GPIO_WritePin+0x1c>
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011df8:	c4232041 	andn      	r1, r3, r1
 8011dfc:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011dfe:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011e02:	783c      	jmp      	r15
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011e04:	6c4c      	or      	r1, r3
 8011e06:	b020      	st.w      	r1, (r0, 0x0)
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011e08:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011e0c:	783c      	jmp      	r15
	...

08011e10 <HAL_GPIO_EXTI_IRQHandler>:
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
}

void HAL_GPIO_EXTI_IRQHandler(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
 8011e10:	14d0      	push      	r15
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011e12:	906d      	ld.w      	r3, (r0, 0x34)
 8011e14:	68c4      	and      	r3, r1
{
 8011e16:	6c87      	mov      	r2, r1
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011e18:	e9230003 	bnez      	r3, 0x8011e1e	// 8011e1e <HAL_GPIO_EXTI_IRQHandler+0xe>
	{
		SET_BIT(GPIOx->IC, GPIO_Pin);
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
	}
}
 8011e1c:	1490      	pop      	r15
		SET_BIT(GPIOx->IC, GPIO_Pin);
 8011e1e:	906e      	ld.w      	r3, (r0, 0x38)
 8011e20:	6c8c      	or      	r2, r3
 8011e22:	b04e      	st.w      	r2, (r0, 0x38)
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
 8011e24:	e00009fa 	bsr      	0x8013218	// 8013218 <HAL_GPIO_EXTI_Callback>
}
 8011e28:	1490      	pop      	r15
	...

08011e2c <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e2c:	ea234000 	movih      	r3, 16384
 8011e30:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e34:	ea0101e0 	movi      	r1, 480
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e38:	9344      	ld.w      	r2, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e3a:	74c8      	zextb      	r3, r2
 8011e3c:	c4618043 	divs      	r3, r1, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011e40:	c50255ec 	zext      	r12, r2, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011e44:	c60256e2 	zext      	r2, r2, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e48:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011e4a:	c5818041 	divs      	r1, r1, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011e4e:	c4438023 	divu      	r3, r3, r2
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011e52:	b022      	st.w      	r1, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011e54:	b060      	st.w      	r3, (r0, 0x0)
}
 8011e56:	783c      	jmp      	r15

08011e58 <HAL_InitTick>:
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e58:	ea234000 	movih      	r3, 16384
 8011e5c:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011e60:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e62:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e64:	748c      	zextb      	r2, r3
 8011e66:	ea0301e0 	movi      	r3, 480
 8011e6a:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011e6e:	ea02f424 	movi      	r2, 62500
 8011e72:	c4824902 	rotli      	r2, r2, 4
 8011e76:	7cc8      	mult      	r3, r2
 8011e78:	ea0203e8 	movi      	r2, 1000
 8011e7c:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011e80:	104f      	lrw      	r2, 0xe000e010	// 8011ebc <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011e82:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011e84:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e86:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011e88:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011e8a:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011e8c:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e8e:	104d      	lrw      	r2, 0xe000e100	// 8011ec0 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011e90:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e94:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011e98:	ea0dff00 	movi      	r13, 65280
 8011e9c:	6f76      	nor      	r13, r13
 8011e9e:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ea0:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ea4:	6cc4      	or      	r3, r1
 8011ea6:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011eaa:	ea230200 	movih      	r3, 512
 8011eae:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011eb0:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011eb4:	1064      	lrw      	r3, 0x20003214	// 8011ec4 <HAL_InitTick+0x6c>
 8011eb6:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011eba:	783c      	jmp      	r15
 8011ebc:	e000e010 	.long	0xe000e010
 8011ec0:	e000e100 	.long	0xe000e100
 8011ec4:	20003214 	.long	0x20003214

08011ec8 <SystemClock_Config>:
{
 8011ec8:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011eca:	5867      	subi      	r3, r0, 2
 8011ecc:	eb0300ee 	cmphsi      	r3, 239
 8011ed0:	0826      	bt      	0x8011f1c	// 8011f1c <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011ed2:	ea224000 	movih      	r2, 16384
 8011ed6:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011eda:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011ede:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011ee0:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011ee2:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011ee6:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011ee8:	330f      	movi      	r3, 15
 8011eea:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011eec:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011eee:	ea22ff00 	movih      	r2, 65280
 8011ef2:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011ef4:	320c      	movi      	r2, 12
 8011ef6:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011ef8:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011efa:	0c12      	bf      	0x8011f1e	// 8011f1e <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011efc:	c4028022 	divu      	r2, r2, r0
 8011f00:	4250      	lsli      	r2, r2, 16
 8011f02:	ea010300 	movi      	r1, 768
 8011f06:	6c0c      	or      	r0, r3
 8011f08:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011f0a:	ea234000 	movih      	r3, 16384
 8011f0e:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011f12:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011f14:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011f16:	3007      	movi      	r0, 7
 8011f18:	e3ffffa0 	bsr      	0x8011e58	// 8011e58 <HAL_InitTick>
}
 8011f1c:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011f1e:	4822      	lsri      	r1, r0, 2
 8011f20:	4128      	lsli      	r1, r1, 8
 8011f22:	ea220001 	movih      	r2, 1
 8011f26:	07f0      	br      	0x8011f06	// 8011f06 <SystemClock_Config+0x3e>

08011f28 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011f28:	1043      	lrw      	r2, 0x20003210	// 8011f34 <HAL_IncTick+0xc>
 8011f2a:	9260      	ld.w      	r3, (r2, 0x0)
 8011f2c:	2300      	addi      	r3, 1
 8011f2e:	b260      	st.w      	r3, (r2, 0x0)
}
 8011f30:	783c      	jmp      	r15
 8011f32:	0000      	.short	0x0000
 8011f34:	20003210 	.long	0x20003210

08011f38 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011f38:	1062      	lrw      	r3, 0x20003210	// 8011f40 <HAL_GetTick+0x8>
 8011f3a:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011f3c:	783c      	jmp      	r15
 8011f3e:	0000      	.short	0x0000
 8011f40:	20003210 	.long	0x20003210

08011f44 <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011f44:	14d2      	push      	r4-r5, r15
 8011f46:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8011f48:	e3fffff8 	bsr      	0x8011f38	// 8011f38 <HAL_GetTick>
 8011f4c:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011f4e:	e3fffff5 	bsr      	0x8011f38	// 8011f38 <HAL_GetTick>
 8011f52:	6012      	subu      	r0, r4
 8011f54:	6540      	cmphs      	r0, r5
 8011f56:	0ffc      	bf      	0x8011f4e	// 8011f4e <HAL_Delay+0xa>
	{
	}
}
 8011f58:	1492      	pop      	r4-r5, r15
	...

08011f5c <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011f5c:	c4002822 	bclri      	r2, r0, 0
 8011f60:	3a81      	bclri      	r2, 1
 8011f62:	106b      	lrw      	r3, 0xe000e100	// 8011f8c <HAL_NVIC_SetPriority+0x30>
 8011f64:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011f66:	e4002003 	andi      	r0, r0, 3
 8011f6a:	4003      	lsli      	r0, r0, 3
 8011f6c:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011f6e:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011f70:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011f74:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011f76:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011f7a:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011f7e:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011f82:	6cc0      	or      	r3, r0
 8011f84:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011f88:	783c      	jmp      	r15
 8011f8a:	0000      	.short	0x0000
 8011f8c:	e000e100 	.long	0xe000e100

08011f90 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011f90:	e440201f 	andi      	r2, r0, 31
 8011f94:	3301      	movi      	r3, 1
 8011f96:	c4a054c0 	zext      	r0, r0, 6, 5
 8011f9a:	70c8      	lsl      	r3, r2
 8011f9c:	4002      	lsli      	r0, r0, 2
 8011f9e:	1044      	lrw      	r2, 0xe000e100	// 8011fac <HAL_NVIC_EnableIRQ+0x1c>
 8011fa0:	6008      	addu      	r0, r2
 8011fa2:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011fa4:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011fa8:	783c      	jmp      	r15
 8011faa:	0000      	.short	0x0000
 8011fac:	e000e100 	.long	0xe000e100

08011fb0 <HAL_Init>:
#include "wm_hal.h"

HAL_StatusTypeDef HAL_Init(void)
{
 8011fb0:	14d0      	push      	r15
	HAL_MspInit();
 8011fb2:	e00007a7 	bsr      	0x8012f00	// 8012f00 <HAL_MspInit>
	return HAL_OK;
}
 8011fb6:	3000      	movi      	r0, 0
 8011fb8:	1490      	pop      	r15
	...

08011fbc <HAL_TIM_Base_Init>:
#include "wm_tim.h"

HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim)
{
 8011fbc:	14d1      	push      	r4, r15
 8011fbe:	1423      	subi      	r14, r14, 12
 8011fc0:	6d03      	mov      	r4, r0
	uint32_t offset = 0;
	wm_sys_clk sysclk;
	
	if (htim == NULL)
 8011fc2:	e900003a 	bez      	r0, 0x8012036	// 8012036 <HAL_TIM_Base_Init+0x7a>
	
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	assert_param(IS_TIM_UNIT(htim->Init.unit));
	assert_param(IS_TIM_AUTORELOAD(htim->Init.AutoReload));
	
	if (htim->State == HAL_TIM_STATE_RESET)
 8011fc6:	9065      	ld.w      	r3, (r0, 0x14)
 8011fc8:	e9030033 	bez      	r3, 0x801202e	// 801202e <HAL_TIM_Base_Init+0x72>
	{
		htim->Lock = HAL_UNLOCKED;
		HAL_TIM_Base_MspInit(htim);
	}
	htim->State = HAL_TIM_STATE_BUSY;
 8011fcc:	3302      	movi      	r3, 2
 8011fce:	b465      	st.w      	r3, (r4, 0x14)
	
	SystemClock_Get(&sysclk);
 8011fd0:	6c3b      	mov      	r0, r14
 8011fd2:	e3ffff2d 	bsr      	0x8011e2c	// 8011e2c <SystemClock_Get>
	WRITE_REG(TIM->TMR_CONFIG, sysclk.apbclk-1);
 8011fd6:	9860      	ld.w      	r3, (r14, 0x0)
 8011fd8:	ea8d0019 	lrw      	r13, 0x40011800	// 801203c <HAL_TIM_Base_Init+0x80>
 8011fdc:	2b00      	subi      	r3, 1
 8011fde:	dc6d2000 	st.w      	r3, (r13, 0x0)
	offset = htim->Instance - TIM0;
 8011fe2:	9440      	ld.w      	r2, (r4, 0x0)
	MODIFY_REG(TIM->CR, (TIM_CR_TIM_MODE(offset) | TIM_CR_TIM_UNIT(offset)), 
 8011fe4:	3005      	movi      	r0, 5
 8011fe6:	7c08      	mult      	r0, r2
 8011fe8:	e6400000 	addi      	r18, r0, 1
 8011fec:	ea0c0001 	movi      	r12, 1
 8011ff0:	c64c4023 	lsl      	r3, r12, r18
 8011ff4:	c40c4033 	lsl      	r19, r12, r0
 8011ff8:	d82d2001 	ld.w      	r1, (r13, 0x4)
 8011ffc:	c6632423 	or      	r3, r3, r19
 8012000:	c4612043 	andn      	r3, r1, r3
 8012004:	9422      	ld.w      	r1, (r4, 0x8)
 8012006:	c6414021 	lsl      	r1, r1, r18
 801200a:	da442001 	ld.w      	r18, (r4, 0x4)
 801200e:	c4124020 	lsl      	r0, r18, r0
 8012012:	6c40      	or      	r1, r0
 8012014:	6cc4      	or      	r3, r1
 8012016:	dc6d2001 	st.w      	r3, (r13, 0x4)
				((htim->Init.AutoReload << TIM_CR_TIM_MODE_Pos(offset)) | (htim->Init.Unit << TIM_CR_TIM_UNIT_Pos(offset))));
					
	WRITE_REG(*(uint32_t *)(&(TIM->TIM0_PRD) + offset), htim->Init.Period);
 801201a:	4242      	lsli      	r2, r2, 2
 801201c:	1069      	lrw      	r3, 0x40011808	// 8012040 <HAL_TIM_Base_Init+0x84>
 801201e:	608c      	addu      	r2, r3
	htim->State = HAL_TIM_STATE_READY;
	
	return HAL_OK;
 8012020:	3000      	movi      	r0, 0
	WRITE_REG(*(uint32_t *)(&(TIM->TIM0_PRD) + offset), htim->Init.Period);
 8012022:	9463      	ld.w      	r3, (r4, 0xc)
 8012024:	b260      	st.w      	r3, (r2, 0x0)
	htim->State = HAL_TIM_STATE_READY;
 8012026:	dd842005 	st.w      	r12, (r4, 0x14)
}
 801202a:	1403      	addi      	r14, r14, 12
 801202c:	1491      	pop      	r4, r15
		htim->Lock = HAL_UNLOCKED;
 801202e:	b064      	st.w      	r3, (r0, 0x10)
		HAL_TIM_Base_MspInit(htim);
 8012030:	e000076a 	bsr      	0x8012f04	// 8012f04 <HAL_TIM_Base_MspInit>
 8012034:	07cc      	br      	0x8011fcc	// 8011fcc <HAL_TIM_Base_Init+0x10>
		return HAL_ERROR;
 8012036:	3001      	movi      	r0, 1
}
 8012038:	1403      	addi      	r14, r14, 12
 801203a:	1491      	pop      	r4, r15
 801203c:	40011800 	.long	0x40011800
 8012040:	40011808 	.long	0x40011808

08012044 <HAL_TIM_Base_Start_IT>:

HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim)
{
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	
	if (htim->State != HAL_TIM_STATE_READY)
 8012044:	9065      	ld.w      	r3, (r0, 0x14)
 8012046:	3b41      	cmpnei      	r3, 1
 8012048:	0c03      	bf      	0x801204e	// 801204e <HAL_TIM_Base_Start_IT+0xa>
	{
		return HAL_ERROR;
 801204a:	3001      	movi      	r0, 1
	htim->State = HAL_TIM_STATE_BUSY;
	__HAL_TIM_ENABLE_IT(htim);
	__HAL_TIM_ENABLE(htim);
	
	return HAL_OK;
}
 801204c:	783c      	jmp      	r15
	htim->State = HAL_TIM_STATE_BUSY;
 801204e:	3202      	movi      	r2, 2
 8012050:	b045      	st.w      	r2, (r0, 0x14)
	__HAL_TIM_ENABLE_IT(htim);
 8012052:	3105      	movi      	r1, 5
 8012054:	9040      	ld.w      	r2, (r0, 0x0)
 8012056:	ea8c000b 	lrw      	r12, 0x40011800	// 8012080 <HAL_TIM_Base_Start_IT+0x3c>
 801205a:	7c84      	mult      	r2, r1
 801205c:	5a2a      	addi      	r1, r2, 3
 801205e:	d9ac2001 	ld.w      	r13, (r12, 0x4)
 8012062:	c4234021 	lsl      	r1, r3, r1
 8012066:	6c74      	or      	r1, r13
 8012068:	dc2c2001 	st.w      	r1, (r12, 0x4)
	__HAL_TIM_ENABLE(htim);
 801206c:	2201      	addi      	r2, 2
 801206e:	d82c2001 	ld.w      	r1, (r12, 0x4)
 8012072:	70c8      	lsl      	r3, r2
 8012074:	6cc4      	or      	r3, r1
	return HAL_OK;
 8012076:	3000      	movi      	r0, 0
	__HAL_TIM_ENABLE(htim);
 8012078:	dc6c2001 	st.w      	r3, (r12, 0x4)
}
 801207c:	783c      	jmp      	r15
 801207e:	0000      	.short	0x0000
 8012080:	40011800 	.long	0x40011800

08012084 <HAL_TIM_IRQHandler>:
{
	UNUSED(htim);
}

void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim)
{
 8012084:	14d0      	push      	r15
	if (__HAL_TIM_GET_FLAG(htim) != RESET)
 8012086:	9060      	ld.w      	r3, (r0, 0x0)
 8012088:	3205      	movi      	r2, 5
 801208a:	7cc8      	mult      	r3, r2
 801208c:	ea8c000b 	lrw      	r12, 0x40011800	// 80120b8 <HAL_TIM_IRQHandler+0x34>
 8012090:	3201      	movi      	r2, 1
 8012092:	2303      	addi      	r3, 4
 8012094:	c4624023 	lsl      	r3, r2, r3
 8012098:	d82c2001 	ld.w      	r1, (r12, 0x4)
 801209c:	c4612022 	and      	r2, r1, r3
 80120a0:	648e      	cmpne      	r3, r2
 80120a2:	0c02      	bf      	0x80120a6	// 80120a6 <HAL_TIM_IRQHandler+0x22>
	{
		__HAL_TIM_CLEAR_IT(htim);
		HAL_TIM_Callback(htim);
	}
}
 80120a4:	1490      	pop      	r15
		__HAL_TIM_CLEAR_IT(htim);
 80120a6:	d84c2001 	ld.w      	r2, (r12, 0x4)
 80120aa:	6cc8      	or      	r3, r2
 80120ac:	dc6c2001 	st.w      	r3, (r12, 0x4)
		HAL_TIM_Callback(htim);
 80120b0:	e0000674 	bsr      	0x8012d98	// 8012d98 <HAL_TIM_Callback>
}
 80120b4:	1490      	pop      	r15
 80120b6:	0000      	.short	0x0000
 80120b8:	40011800 	.long	0x40011800

080120bc <__readByCMD.constprop.0>:
{
    int i = 0;
    int word = sz / 4;
    int byte = sz % 4;
    unsigned long addr_read;
	if (!(FLASH->FLASH_CR&0x1))/*non-QIO mode, only single line command can be used*/
 80120bc:	ea022000 	movi      	r2, 8192
 80120c0:	3abe      	bseti      	r2, 30
    int byte = sz % 4;
 80120c2:	e6412003 	andi      	r18, r1, 3
	if (!(FLASH->FLASH_CR&0x1))/*non-QIO mode, only single line command can be used*/
 80120c6:	9262      	ld.w      	r3, (r2, 0x8)
 80120c8:	e4632001 	andi      	r3, r3, 1
 80120cc:	e923001a 	bnez      	r3, 0x8012100	// 8012100 <__readByCMD.constprop.0+0x44>
        FLASH->CMD_INFO = 0x8000C003 | (((sz - 1) & 0x3FF) << 16);
        FLASH->ADDR = addr & 0x1FFFFFF;
        FLASH->CMD_START = FLASH_CMD_START_CMD;
        break;
    case 0x0B:
        if((FLASH->FLASH_CR & 0x2) == 0x2)
 80120d0:	9262      	ld.w      	r3, (r2, 0x8)
 80120d2:	e4632002 	andi      	r3, r3, 2
 80120d6:	e923004e 	bnez      	r3, 0x8012172	// 8012172 <__readByCMD.constprop.0+0xb6>
        {
            FLASH->CMD_INFO = 0xB400C00B | (((sz - 1) & 0x3FF) << 16);
        }
        else
        {
            FLASH->CMD_INFO = 0xBC00C00B | (((sz - 1) & 0x3FF) << 16);
 80120da:	5963      	subi      	r3, r1, 1
 80120dc:	ea2c03ff 	movih      	r12, 1023
 80120e0:	4370      	lsli      	r3, r3, 16
 80120e2:	68f0      	and      	r3, r12
 80120e4:	ea8c002b 	lrw      	r12, 0xbc00c00b	// 8012190 <__readByCMD.constprop.0+0xd4>
 80120e8:	6cf0      	or      	r3, r12
 80120ea:	b260      	st.w      	r3, (r2, 0x0)
        }
        FLASH->ADDR = addr & 0x1FFFFFF;
 80120ec:	ea032000 	movi      	r3, 8192
 80120f0:	3bbe      	bseti      	r3, 30
 80120f2:	c4005700 	zext      	r0, r0, 24, 0
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 80120f6:	ea020100 	movi      	r2, 256
        FLASH->ADDR = addr & 0x1FFFFFF;
 80120fa:	b304      	st.w      	r0, (r3, 0x10)
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 80120fc:	b341      	st.w      	r2, (r3, 0x4)
 80120fe:	0410      	br      	0x801211e	// 801211e <__readByCMD.constprop.0+0x62>
        FLASH->ADDR = addr & 0x1FFFFFF;
        FLASH->CMD_START = FLASH_CMD_START_CMD;
        break;

    case 0xEB:
        FLASH->CMD_INFO = 0xEC00C0EB | (((sz - 1) & 0x3FF) << 16);
 8012100:	5963      	subi      	r3, r1, 1
 8012102:	ea2c03ff 	movih      	r12, 1023
 8012106:	4370      	lsli      	r3, r3, 16
 8012108:	68f0      	and      	r3, r12
 801210a:	ea8c0023 	lrw      	r12, 0xec00c0eb	// 8012194 <__readByCMD.constprop.0+0xd8>
 801210e:	6cf0      	or      	r3, r12
 8012110:	b260      	st.w      	r3, (r2, 0x0)
        FLASH->ADDR = addr & 0x1FFFFFF;
 8012112:	c4005700 	zext      	r0, r0, 24, 0
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 8012116:	ea030100 	movi      	r3, 256
        FLASH->ADDR = addr & 0x1FFFFFF;
 801211a:	b204      	st.w      	r0, (r2, 0x10)
        FLASH->CMD_START = FLASH_CMD_START_CMD;
 801211c:	b261      	st.w      	r3, (r2, 0x4)
    int word = sz / 4;
 801211e:	4922      	lsri      	r1, r1, 2
    }

    //	printf("delay delay delay delay\n");
    //	dumpUint32("readByCMD RSA_BASE", RSA_BASE, sz/4);
    addr_read = RSA_BASE;
    for(i = 0; i < word; i ++)
 8012120:	e9010033 	bez      	r1, 0x8012186	// 8012186 <__readByCMD.constprop.0+0xca>
 8012124:	3000      	movi      	r0, 0
 8012126:	ea224000 	movih      	r2, 16384
 801212a:	ea8c001c 	lrw      	r12, 0x20001b80	// 8012198 <__readByCMD.constprop.0+0xdc>
 801212e:	ea23c000 	movih      	r3, 49152
 8012132:	60c8      	addu      	r3, r2
 8012134:	2000      	addi      	r0, 1
 8012136:	60f0      	addu      	r3, r12
 8012138:	6406      	cmpne      	r1, r0
    {
        M32(buf) = M32(addr_read);
 801213a:	d002880d 	ldbi.w      	r13, (r2)
 801213e:	dda32000 	st.w      	r13, (r3, 0x0)
    for(i = 0; i < word; i ++)
 8012142:	0bf6      	bt      	0x801212e	// 801212e <__readByCMD.constprop.0+0x72>
 8012144:	4122      	lsli      	r1, r1, 2
 8012146:	ea234000 	movih      	r3, 16384
 801214a:	6304      	addu      	r12, r1
 801214c:	604c      	addu      	r1, r3
        buf += 4;
        addr_read += 4;
    }

    if(byte > 0)
 801214e:	e9120010 	bez      	r18, 0x801216e	// 801216e <__readByCMD.constprop.0+0xb2>
    {
        M32(buf) = M32(addr_read);
 8012152:	9160      	ld.w      	r3, (r1, 0x0)
 8012154:	e6521000 	subi      	r18, r18, 1
 8012158:	dc6c2000 	st.w      	r3, (r12, 0x0)
        buf += 3;							//point last byte
        byte = 4 - byte;
        while(byte)
        {
            *buf = 0;
 801215c:	3200      	movi      	r2, 0
        buf += 3;							//point last byte
 801215e:	e46c0002 	addi      	r3, r12, 3
 8012162:	c64c002c 	addu      	r12, r12, r18
            *buf = 0;
 8012166:	a340      	st.b      	r2, (r3, 0x0)
            buf --;
 8012168:	2b00      	subi      	r3, 1
        while(byte)
 801216a:	670e      	cmpne      	r3, r12
 801216c:	0bfd      	bt      	0x8012166	// 8012166 <__readByCMD.constprop.0+0xaa>
            byte --;
        }
    }
    return 0;
}
 801216e:	3000      	movi      	r0, 0
 8012170:	783c      	jmp      	r15
            FLASH->CMD_INFO = 0xB400C00B | (((sz - 1) & 0x3FF) << 16);
 8012172:	5963      	subi      	r3, r1, 1
 8012174:	ea2c03ff 	movih      	r12, 1023
 8012178:	4370      	lsli      	r3, r3, 16
 801217a:	68f0      	and      	r3, r12
 801217c:	ea8c0008 	lrw      	r12, 0xb400c00b	// 801219c <__readByCMD.constprop.0+0xe0>
 8012180:	6cf0      	or      	r3, r12
 8012182:	b260      	st.w      	r3, (r2, 0x0)
 8012184:	07b4      	br      	0x80120ec	// 80120ec <__readByCMD.constprop.0+0x30>
    for(i = 0; i < word; i ++)
 8012186:	ea8c0005 	lrw      	r12, 0x20001b80	// 8012198 <__readByCMD.constprop.0+0xdc>
 801218a:	ea214000 	movih      	r1, 16384
 801218e:	07e0      	br      	0x801214e	// 801214e <__readByCMD.constprop.0+0x92>
 8012190:	bc00c00b 	.long	0xbc00c00b
 8012194:	ec00c0eb 	.long	0xec00c0eb
 8012198:	20001b80 	.long	0x20001b80
 801219c:	b400c00b 	.long	0xb400c00b

080121a0 <flashRead>:

static int flashRead(unsigned long addr, unsigned char *buf, unsigned long sz)
{
 80121a0:	14d7      	push      	r4-r10, r15
    int i = 0;
    int page_offset = addr & (INSIDE_FLS_PAGE_SIZE - 1);

    static char cache[INSIDE_FLS_PAGE_SIZE] = {0};
	
    flash_addr = addr & ~(INSIDE_FLS_PAGE_SIZE - 1);
 80121a2:	3300      	movi      	r3, 0
 80121a4:	2bff      	subi      	r3, 256
    int page_offset = addr & (INSIDE_FLS_PAGE_SIZE - 1);
 80121a6:	e52020ff 	andi      	r9, r0, 255
    flash_addr = addr & ~(INSIDE_FLS_PAGE_SIZE - 1);
 80121aa:	c4602027 	and      	r7, r0, r3
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 80121ae:	ea050100 	movi      	r5, 256
{
 80121b2:	6e0b      	mov      	r8, r2
 80121b4:	6d07      	mov      	r4, r1
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80121b6:	6c1f      	mov      	r0, r7
 80121b8:	ea010100 	movi      	r1, 256
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 80121bc:	6166      	subu      	r5, r9
    __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80121be:	e3ffff7f 	bsr      	0x80120bc	// 80120bc <__readByCMD.constprop.0>
    if (sz > INSIDE_FLS_PAGE_SIZE - page_offset)
 80121c2:	6614      	cmphs      	r5, r8
 80121c4:	0836      	bt      	0x8012230	// 8012230 <flashRead+0x90>
    {
        memcpy(buf, cache + page_offset, INSIDE_FLS_PAGE_SIZE - page_offset);
 80121c6:	11c1      	lrw      	r6, 0x20001b80	// 8012248 <flashRead+0xa8>
 80121c8:	6c97      	mov      	r2, r5
 80121ca:	6c13      	mov      	r0, r4
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
        flash_addr 	+= INSIDE_FLS_PAGE_SIZE;

        sz_pagenum = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) / INSIDE_FLS_PAGE_SIZE;
 80121cc:	6224      	addu      	r8, r9
        memcpy(buf, cache + page_offset, INSIDE_FLS_PAGE_SIZE - page_offset);
 80121ce:	c5260021 	addu      	r1, r6, r9
 80121d2:	e3fffcdf 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
        sz_pagenum = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) / INSIDE_FLS_PAGE_SIZE;
 80121d6:	e46810ff 	subi      	r3, r8, 256
 80121da:	4b68      	lsri      	r3, r3, 8
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
 80121dc:	6114      	addu      	r4, r5
        sz_remain = (sz - (INSIDE_FLS_PAGE_SIZE - page_offset)) % INSIDE_FLS_PAGE_SIZE;
 80121de:	e50820ff 	andi      	r8, r8, 255
        flash_addr 	+= INSIDE_FLS_PAGE_SIZE;
 80121e2:	e4a700ff 	addi      	r5, r7, 256
        for (i = 0; i < sz_pagenum; i++)
 80121e6:	e903002e 	bez      	r3, 0x8012242	// 8012242 <flashRead+0xa2>
 80121ea:	c503482a 	lsli      	r10, r3, 8
 80121ee:	c5440029 	addu      	r9, r4, r10
        {

            __readByCMD(0xEB, flash_addr, (unsigned char *)cache, INSIDE_FLS_PAGE_SIZE);
 80121f2:	ea010100 	movi      	r1, 256
 80121f6:	6c17      	mov      	r0, r5
 80121f8:	e3ffff62 	bsr      	0x80120bc	// 80120bc <__readByCMD.constprop.0>
            memcpy(buf, cache, INSIDE_FLS_PAGE_SIZE);
 80121fc:	6c13      	mov      	r0, r4
 80121fe:	ea020100 	movi      	r2, 256
 8012202:	6c5b      	mov      	r1, r6
            buf 		+= INSIDE_FLS_PAGE_SIZE;
 8012204:	24ff      	addi      	r4, 256
            memcpy(buf, cache, INSIDE_FLS_PAGE_SIZE);
 8012206:	e3fffcc5 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
        for (i = 0; i < sz_pagenum; i++)
 801220a:	6652      	cmpne      	r4, r9
            flash_addr 	+= INSIDE_FLS_PAGE_SIZE;
 801220c:	25ff      	addi      	r5, 256
        for (i = 0; i < sz_pagenum; i++)
 801220e:	0bf2      	bt      	0x80121f2	// 80121f2 <flashRead+0x52>
 8012210:	c5470025 	addu      	r5, r7, r10
 8012214:	25ff      	addi      	r5, 256
        }

        if (sz_remain)
 8012216:	e9080014 	bez      	r8, 0x801223e	// 801223e <flashRead+0x9e>
        {
            __readByCMD(0xEB, flash_addr, (unsigned char *)cache, sz_remain);
 801221a:	6c63      	mov      	r1, r8
 801221c:	6c17      	mov      	r0, r5
 801221e:	e3ffff4f 	bsr      	0x80120bc	// 80120bc <__readByCMD.constprop.0>
            memcpy(buf, cache, sz_remain);
 8012222:	6ca3      	mov      	r2, r8
 8012224:	1029      	lrw      	r1, 0x20001b80	// 8012248 <flashRead+0xa8>
 8012226:	6c27      	mov      	r0, r9
 8012228:	e3fffcb4 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
    {
        memcpy(buf, cache + page_offset, sz);
    }

    return 0;
}
 801222c:	3000      	movi      	r0, 0
 801222e:	1497      	pop      	r4-r10, r15
        memcpy(buf, cache + page_offset, sz);
 8012230:	1066      	lrw      	r3, 0x20001b80	// 8012248 <flashRead+0xa8>
 8012232:	6ca3      	mov      	r2, r8
 8012234:	c4690021 	addu      	r1, r9, r3
 8012238:	6c13      	mov      	r0, r4
 801223a:	e3fffcab 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
}
 801223e:	3000      	movi      	r0, 0
 8012240:	1497      	pop      	r4-r10, r15
        buf += INSIDE_FLS_PAGE_SIZE - page_offset;
 8012242:	6e53      	mov      	r9, r4
 8012244:	07e9      	br      	0x8012216	// 8012216 <flashRead+0x76>
 8012246:	0000      	.short	0x0000
 8012248:	20001b80 	.long	0x20001b80

0801224c <HAL_FLASH_Read>:
 * @retval         HAL_ERROR	    if read fail
 *
 * @note           None
 */
HAL_StatusTypeDef HAL_FLASH_Read(uint32_t addr, uint8_t *buf, uint32_t len)
{
 801224c:	14d2      	push      	r4-r5, r15
    FLASH->CMD_INFO = 0x2c09F;
 801224e:	ea032000 	movi      	r3, 8192
 8012252:	3bbe      	bseti      	r3, 30
 8012254:	ea0cc09f 	movi      	r12, 49311
 8012258:	c62c284c 	bseti      	r12, r12, 17
 801225c:	dd832000 	st.w      	r12, (r3, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 8012260:	ea0c0100 	movi      	r12, 256
 8012264:	dd832001 	st.w      	r12, (r3, 0x4)
    return M32(RSA_BASE);
 8012268:	ea234000 	movih      	r3, 16384
    FLASH->CMD_INFO = 0x2c09F;
 801226c:	3400      	movi      	r4, 0
    return M32(RSA_BASE);
 801226e:	9360      	ld.w      	r3, (r3, 0x0)
    density = ((read_first_value() & 0xFFFFFF) >> 16) & 0xFF;
 8012270:	4b70      	lsri      	r3, r3, 16
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 8012272:	e5831000 	subi      	r12, r3, 1
 8012276:	7730      	zextb      	r12, r12
 8012278:	eb0c0020 	cmphsi      	r12, 33
 801227c:	0815      	bt      	0x80122a6	// 80122a6 <HAL_FLASH_Read+0x5a>
        return (1 << density);
 801227e:	e46320ff 	andi      	r3, r3, 255
 8012282:	ea0c0001 	movi      	r12, 1
    int err;

    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 8012286:	c400574d 	zext      	r13, r0, 26, 0
        return (1 << density);
 801228a:	c46c4023 	lsl      	r3, r12, r3
    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 801228e:	64f4      	cmphs      	r13, r3
 8012290:	080b      	bt      	0x80122a6	// 80122a6 <HAL_FLASH_Read+0x5a>
 8012292:	e902000a 	bez      	r2, 0x80122a6	// 80122a6 <HAL_FLASH_Read+0x5a>
 8012296:	e9010008 	bez      	r1, 0x80122a6	// 80122a6 <HAL_FLASH_Read+0x5a>
    {
        return HAL_ERROR;
    }

    __HAL_LOCK(&pFlash);
 801229a:	10a8      	lrw      	r5, 0x20003218	// 80122b8 <HAL_FLASH_Read+0x6c>
 801229c:	9560      	ld.w      	r3, (r5, 0x0)
 801229e:	3b41      	cmpnei      	r3, 1
 80122a0:	0805      	bt      	0x80122aa	// 80122aa <HAL_FLASH_Read+0x5e>
 80122a2:	3002      	movi      	r0, 2
    flashRead(addr, buf, len);

    err = HAL_OK;
    __HAL_UNLOCK(&pFlash);
    return err;
}
 80122a4:	1492      	pop      	r4-r5, r15
        return HAL_ERROR;
 80122a6:	3001      	movi      	r0, 1
}
 80122a8:	1492      	pop      	r4-r5, r15
    __HAL_LOCK(&pFlash);
 80122aa:	dd852000 	st.w      	r12, (r5, 0x0)
    flashRead(addr, buf, len);
 80122ae:	e3ffff79 	bsr      	0x80121a0	// 80121a0 <flashRead>
    return err;
 80122b2:	6c13      	mov      	r0, r4
    __HAL_UNLOCK(&pFlash);
 80122b4:	b580      	st.w      	r4, (r5, 0x0)
}
 80122b6:	1492      	pop      	r4-r5, r15
 80122b8:	20003218 	.long	0x20003218

080122bc <HAL_FLASH_Write>:
 * @retval         HAL_ERROR	    	if argument is invalid
 *
 * @note           None
 */
HAL_StatusTypeDef HAL_FLASH_Write(uint32_t addr, uint8_t *buf, uint32_t len)
{
 80122bc:	ebe00058 	push      	r4-r11, r15, r16-r17
 80122c0:	1422      	subi      	r14, r14, 8
    FLASH->CMD_INFO = 0x2c09F;
 80122c2:	ea052000 	movi      	r5, 8192
 80122c6:	3dbe      	bseti      	r5, 30
 80122c8:	ea03c09f 	movi      	r3, 49311
 80122cc:	3bb1      	bseti      	r3, 17
 80122ce:	b560      	st.w      	r3, (r5, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80122d0:	ea060100 	movi      	r6, 256
    return M32(RSA_BASE);
 80122d4:	ea234000 	movih      	r3, 16384
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80122d8:	b5c1      	st.w      	r6, (r5, 0x4)
    return M32(RSA_BASE);
 80122da:	9360      	ld.w      	r3, (r3, 0x0)
    density = ((read_first_value() & 0xFFFFFF) >> 16) & 0xFF;
 80122dc:	4b70      	lsri      	r3, r3, 16
{
 80122de:	c4024830 	lsli      	r16, r2, 0
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 80122e2:	5b43      	subi      	r2, r3, 1
 80122e4:	7488      	zextb      	r2, r2
 80122e6:	eb020020 	cmphsi      	r2, 33
{
 80122ea:	c4014831 	lsli      	r17, r1, 0
    if (density && (density <= 0x21))  /*just limit to (1<<33UL) Byte*/
 80122ee:	0884      	bt      	0x80123f6	// 80123f6 <HAL_FLASH_Write+0x13a>
        return (1 << density);
 80122f0:	e44320ff 	andi      	r2, r3, 255
 80122f4:	3301      	movi      	r3, 1
    unsigned int secoff;
    unsigned int secremain;
    unsigned int i;
    unsigned int offaddr;

    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 80122f6:	c4005747 	zext      	r7, r0, 26, 0
        return (1 << density);
 80122fa:	c4434022 	lsl      	r2, r3, r2
    if (((addr & (INSIDE_FLS_BASE_ADDR - 1)) >=  getFlashDensity()) || (len == 0) || (buf == NULL))
 80122fe:	649c      	cmphs      	r7, r2
 8012300:	0877      	bt      	0x80123ee	// 80123ee <HAL_FLASH_Write+0x132>
 8012302:	e9100076 	bez      	r16, 0x80123ee	// 80123ee <HAL_FLASH_Write+0x132>
 8012306:	e9010074 	bez      	r1, 0x80123ee	// 80123ee <HAL_FLASH_Write+0x132>
    {
        return HAL_ERROR;
    }

    __HAL_LOCK(&pFlash);
 801230a:	ea8d0042 	lrw      	r13, 0x20003218	// 8012410 <HAL_FLASH_Write+0x154>
 801230e:	d84d2000 	ld.w      	r2, (r13, 0x0)
 8012312:	3a41      	cmpnei      	r2, 1
 8012314:	0c6c      	bf      	0x80123ec	// 80123ec <HAL_FLASH_Write+0x130>

    offaddr = addr & (INSIDE_FLS_BASE_ADDR - 1);			
    secpos = offaddr / INSIDE_FLS_SECTOR_SIZE;				
    secoff = (offaddr % INSIDE_FLS_SECTOR_SIZE);			
 8012316:	e4802fff 	andi      	r4, r0, 4095
    secremain = INSIDE_FLS_SECTOR_SIZE - secoff;    
 801231a:	ea0b1000 	movi      	r11, 4096
    __HAL_LOCK(&pFlash);
 801231e:	dc6d2000 	st.w      	r3, (r13, 0x0)
    secremain = INSIDE_FLS_SECTOR_SIZE - secoff;    
 8012322:	62d2      	subu      	r11, r4
 8012324:	ea03fffe 	movi      	r3, 65534
 8012328:	c5634903 	rotli      	r3, r3, 11
 801232c:	ea88003a 	lrw      	r8, 0x20001c80	// 8012414 <HAL_FLASH_Write+0x158>
 8012330:	fa0bcd2b 	min.u32      	r11, r11, r16
 8012334:	69cc      	and      	r7, r3
    {
        secremain = len;								
    }
    while (1)
    {
        flashRead(secpos * INSIDE_FLS_SECTOR_SIZE, cache, INSIDE_FLS_SECTOR_SIZE);
 8012336:	c4084832 	lsli      	r18, r8, 0
	FLASH->CMD_INFO = 0x6;
 801233a:	ea090006 	movi      	r9, 6
    FLASH->CMD_INFO = cmd | ((sz - 1) << 16);
 801233e:	ea8a0037 	lrw      	r10, 0x80ff9002	// 8012418 <HAL_FLASH_Write+0x15c>
        flashRead(secpos * INSIDE_FLS_SECTOR_SIZE, cache, INSIDE_FLS_SECTOR_SIZE);
 8012342:	c4124821 	lsli      	r1, r18, 0
 8012346:	ea021000 	movi      	r2, 4096
 801234a:	6c1f      	mov      	r0, r7
 801234c:	ddae2001 	st.w      	r13, (r14, 0x4)
 8012350:	de4e2000 	st.w      	r18, (r14, 0x0)
 8012354:	e3ffff26 	bsr      	0x80121a0	// 80121a0 <flashRead>
    FLASH->CMD_INFO = cmd;
 8012358:	ea238000 	movih      	r3, 32768
 801235c:	e463081f 	addi      	r3, r3, 2080
	FLASH->CMD_INFO = 0x6;
 8012360:	dd252000 	st.w      	r9, (r5, 0x0)
	FLASH->CMD_START = FLASH_CMD_START_CMD;
 8012364:	b5c1      	st.w      	r6, (r5, 0x4)
    FLASH->CMD_INFO = cmd;
 8012366:	b560      	st.w      	r3, (r5, 0x0)
    FLASH->ADDR = (addr & 0x1FFFFFF);
 8012368:	c4075703 	zext      	r3, r7, 24, 0
 801236c:	b564      	st.w      	r3, (r5, 0x10)

        eraseSector(secpos * INSIDE_FLS_SECTOR_SIZE);
        for (i = 0; i < secremain; i++) 
 801236e:	da4e2000 	ld.w      	r18, (r14, 0x0)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 8012372:	b5c1      	st.w      	r6, (r5, 0x4)
        for (i = 0; i < secremain; i++) 
 8012374:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8012378:	e90b000e 	bez      	r11, 0x8012394	// 8012394 <HAL_FLASH_Write+0xd8>
 801237c:	c4114823 	lsli      	r3, r17, 0
 8012380:	c4880022 	addu      	r2, r8, r4
 8012384:	c5710021 	addu      	r1, r17, r11
        {
            cache[i + secoff] = buf[i];
 8012388:	d0038000 	ldbi.b      	r0, (r3)
        for (i = 0; i < secremain; i++) 
 801238c:	644e      	cmpne      	r3, r1
            cache[i + secoff] = buf[i];
 801238e:	d4028000 	stbi.b      	r0, (r2)
        for (i = 0; i < secremain; i++) 
 8012392:	0bfb      	bt      	0x8012388	// 8012388 <HAL_FLASH_Write+0xcc>
 8012394:	e6670fff 	addi      	r19, r7, 4096
 8012398:	6f1f      	mov      	r12, r7
 801239a:	c4ec0082 	subu      	r2, r12, r7
 801239e:	60a0      	addu      	r2, r8
    base_addr = RSA_BASE;
 80123a0:	ea214000 	movih      	r1, 16384
 80123a4:	3340      	movi      	r3, 64
        M32(base_addr) = *((unsigned long *)buf);
 80123a6:	d0028800 	ldbi.w      	r0, (r2)
 80123aa:	d4018800 	stbi.w      	r0, (r1)
    while(size)
 80123ae:	e823fffc 	bnezad      	r3, 0x80123a6	// 80123a6 <HAL_FLASH_Write+0xea>
    FLASH->ADDR = (addr & 0x1FFFFFF);
 80123b2:	c40c5703 	zext      	r3, r12, 24, 0
 80123b6:	e58c00ff 	addi      	r12, r12, 256
        }
        for (i = 0; i < (INSIDE_FLS_SECTOR_SIZE / INSIDE_FLS_PAGE_SIZE); i++)
 80123ba:	c5930480 	cmpne      	r19, r12
	FLASH->CMD_INFO = 0x6;
 80123be:	dd252000 	st.w      	r9, (r5, 0x0)
	FLASH->CMD_START = FLASH_CMD_START_CMD;
 80123c2:	b5c1      	st.w      	r6, (r5, 0x4)
    FLASH->CMD_INFO = cmd | ((sz - 1) << 16);
 80123c4:	dd452000 	st.w      	r10, (r5, 0x0)
    FLASH->ADDR = (addr & 0x1FFFFFF);
 80123c8:	b564      	st.w      	r3, (r5, 0x10)
    FLASH->CMD_START = FLASH_CMD_START_CMD;
 80123ca:	b5c1      	st.w      	r6, (r5, 0x4)
        for (i = 0; i < (INSIDE_FLS_SECTOR_SIZE / INSIDE_FLS_PAGE_SIZE); i++)
 80123cc:	0be7      	bt      	0x801239a	// 801239a <HAL_FLASH_Write+0xde>
        {
            programPage(secpos * INSIDE_FLS_SECTOR_SIZE + i * INSIDE_FLS_PAGE_SIZE, INSIDE_FLS_PAGE_SIZE, &cache[i * INSIDE_FLS_PAGE_SIZE]);	
        }
        if(len == secremain)
 80123ce:	c5700480 	cmpne      	r16, r11
 80123d2:	0c17      	bf      	0x8012400	// 8012400 <HAL_FLASH_Write+0x144>
        else                    
        {
            secpos++;           
            secoff = 0;         
            buf += secremain;   
            len -= secremain;
 80123d4:	c5700090 	subu      	r16, r16, r11
            buf += secremain;   
 80123d8:	c5710031 	addu      	r17, r17, r11
 80123dc:	ea0b1000 	movi      	r11, 4096
 80123e0:	3400      	movi      	r4, 0
 80123e2:	f970cd2b 	min.u32      	r11, r16, r11
 80123e6:	c4134827 	lsli      	r7, r19, 0
 80123ea:	07ac      	br      	0x8012342	// 8012342 <HAL_FLASH_Write+0x86>
    __HAL_LOCK(&pFlash);
 80123ec:	3302      	movi      	r3, 2
        }
    }

    __HAL_UNLOCK(&pFlash);
    return HAL_OK;
}
 80123ee:	6c0f      	mov      	r0, r3
 80123f0:	1402      	addi      	r14, r14, 8
 80123f2:	ebc00058 	pop      	r4-r11, r15, r16-r17
        return HAL_ERROR;
 80123f6:	3301      	movi      	r3, 1
}
 80123f8:	6c0f      	mov      	r0, r3
 80123fa:	1402      	addi      	r14, r14, 8
 80123fc:	ebc00058 	pop      	r4-r11, r15, r16-r17
    __HAL_UNLOCK(&pFlash);
 8012400:	3300      	movi      	r3, 0
}
 8012402:	6c0f      	mov      	r0, r3
    __HAL_UNLOCK(&pFlash);
 8012404:	dc6d2000 	st.w      	r3, (r13, 0x0)
}
 8012408:	1402      	addi      	r14, r14, 8
 801240a:	ebc00058 	pop      	r4-r11, r15, r16-r17
 801240e:	0000      	.short	0x0000
 8012410:	20003218 	.long	0x20003218
 8012414:	20001c80 	.long	0x20001c80
 8012418:	80ff9002 	.long	0x80ff9002

0801241c <HAL_ADC_Init>:
	}
	return value;
}

HAL_StatusTypeDef HAL_ADC_Init(ADC_HandleTypeDef* hadc)
{
 801241c:	14d1      	push      	r4, r15
 801241e:	1423      	subi      	r14, r14, 12
 8012420:	6d03      	mov      	r4, r0
	uint32_t div;
	wm_sys_clk sysclk;
	
	if (hadc == NULL)
 8012422:	e9000064 	bez      	r0, 0x80124ea	// 80124ea <HAL_ADC_Init+0xce>
	
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	assert_param(IS_ADC_CHANNEL(hadc->Init.channel));
	assert_param(IS_ADC_FREQUENCY(hadc->Init.freq));
	
	hadc->Lock = HAL_UNLOCKED;
 8012426:	3300      	movi      	r3, 0
 8012428:	b065      	st.w      	r3, (r0, 0x14)
	
	HAL_ADC_MspInit(hadc);
 801242a:	e000057f 	bsr      	0x8012f28	// 8012f28 <HAL_ADC_MspInit>
	
	SystemClock_Get(&sysclk);
 801242e:	6c3b      	mov      	r0, r14
 8012430:	e3fffcfe 	bsr      	0x8011e2c	// 8011e2c <SystemClock_Get>
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8012434:	9860      	ld.w      	r3, (r14, 0x0)
 8012436:	ea00f424 	movi      	r0, 62500
 801243a:	c4804900 	rotli      	r0, r0, 4
 801243e:	7cc0      	mult      	r3, r0
 8012440:	9402      	ld.w      	r0, (r4, 0x8)
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8012442:	ea224000 	movih      	r2, 16384
 8012446:	e4420dff 	addi      	r2, r2, 3584
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 801244a:	c4038023 	divu      	r3, r3, r0
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 801244e:	4b61      	lsri      	r3, r3, 1
 8012450:	ea00ff00 	movi      	r0, 65280
 8012454:	9225      	ld.w      	r1, (r2, 0x14)
 8012456:	68c0      	and      	r3, r0
 8012458:	ea00ff00 	movi      	r0, 65280
 801245c:	6c02      	nor      	r0, r0
 801245e:	6840      	and      	r1, r0
 8012460:	6cc4      	or      	r3, r1
 8012462:	b265      	st.w      	r3, (r2, 0x14)
	SET_BIT(RCC->CLK_DIV, RCC_CLK_DIV_FREQ_EN);
 8012464:	9264      	ld.w      	r3, (r2, 0x10)
 8012466:	3bbf      	bseti      	r3, 31
 8012468:	b264      	st.w      	r3, (r2, 0x10)
	
	MODIFY_REG(hadc->Instance->ADC_CR, ADC_ADC_CR_DMAEN | ADC_ADC_CR_SWITCHTIME | ADC_ADC_CR_INITTIME, 
 801246a:	9440      	ld.w      	r2, (r4, 0x0)
 801246c:	1121      	lrw      	r1, 0xc00c00fc	// 80124f0 <HAL_ADC_Init+0xd4>
 801246e:	9264      	ld.w      	r3, (r2, 0x10)
 8012470:	68c4      	and      	r3, r1
 8012472:	1121      	lrw      	r1, 0x5005002	// 80124f4 <HAL_ADC_Init+0xd8>
 8012474:	6cc4      	or      	r3, r1
 8012476:	b264      	st.w      	r3, (r2, 0x10)
	(0x50 << ADC_ADC_CR_SWITCHTIME_Pos) | (0x50 << ADC_ADC_CR_INITTIME_Pos) | ADC_ADC_CR_ADCIE);
	
	MODIFY_REG(hadc->Instance->PGA_CR, ADC_PGA_CR_BPREF | ADC_PGA_CR_GAIN | ADC_PGA_CR_BP, ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN);
 8012478:	9262      	ld.w      	r3, (r2, 0x8)
 801247a:	ea0101ff 	movi      	r1, 511
 801247e:	6c46      	nor      	r1, r1
 8012480:	68c4      	and      	r3, r1
 8012482:	ec630003 	ori      	r3, r3, 3
 8012486:	b262      	st.w      	r3, (r2, 0x8)
	
	// 校验计算offset
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH | ADC_ANA_CR_PD, ADC_ANA_CR_RST | ADC_ANA_CR_LDOEN | ADC_ANA_CR_CH_OFFSET);
 8012488:	9261      	ld.w      	r3, (r2, 0x4)
 801248a:	ea010f07 	movi      	r1, 3847
 801248e:	6c46      	nor      	r1, r1
 8012490:	68c4      	and      	r3, r1
 8012492:	ec630e03 	ori      	r3, r3, 3587
 8012496:	b261      	st.w      	r3, (r2, 0x4)
 8012498:	3104      	movi      	r1, 4
	while (1)
	{
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
		{
			count++;
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 801249a:	3001      	movi      	r0, 1
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 801249c:	9265      	ld.w      	r3, (r2, 0x14)
 801249e:	e4632001 	andi      	r3, r3, 1
 80124a2:	e903fffd 	bez      	r3, 0x801249c	// 801249c <HAL_ADC_Init+0x80>
 80124a6:	2900      	subi      	r1, 1
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 80124a8:	b205      	st.w      	r0, (r2, 0x14)
			if(count == 4)
 80124aa:	e921fff9 	bnez      	r1, 0x801249c	// 801249c <HAL_ADC_Init+0x80>
	value = ADC->DR;
 80124ae:	ea234001 	movih      	r3, 16385
 80124b2:	3ba9      	bseti      	r3, 9
	if (value & 0x20000)
 80124b4:	ea210002 	movih      	r1, 2
	value = ADC->DR;
 80124b8:	9360      	ld.w      	r3, (r3, 0x0)
	if (value & 0x20000)
 80124ba:	684c      	and      	r1, r3
 80124bc:	e9210012 	bnez      	r1, 0x80124e0	// 80124e0 <HAL_ADC_Init+0xc4>
	value = value & 0x3FFFC;
 80124c0:	c6205021 	bmaski      	r1, 18
 80124c4:	2902      	subi      	r1, 3
 80124c6:	68c4      	and      	r3, r1
		value |= 0x20000;
 80124c8:	3bb1      	bseti      	r3, 17
	__HAL_ADC_DISABLE(hadc);
 80124ca:	3100      	movi      	r1, 0
	hadc->offset = _Get_Result();
 80124cc:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_ADC_DISABLE(hadc);
 80124ce:	2907      	subi      	r1, 8
 80124d0:	9261      	ld.w      	r3, (r2, 0x4)
 80124d2:	68c4      	and      	r3, r1
 80124d4:	ec630004 	ori      	r3, r3, 4
	return HAL_OK;
 80124d8:	3000      	movi      	r0, 0
	__HAL_ADC_DISABLE(hadc);
 80124da:	b261      	st.w      	r3, (r2, 0x4)
}
 80124dc:	1403      	addi      	r14, r14, 12
 80124de:	1491      	pop      	r4, r15
		value &= 0x1FFFF;
 80124e0:	c6005021 	bmaski      	r1, 17
 80124e4:	2902      	subi      	r1, 3
 80124e6:	68c4      	and      	r3, r1
 80124e8:	07f1      	br      	0x80124ca	// 80124ca <HAL_ADC_Init+0xae>
		return HAL_ERROR;
 80124ea:	3001      	movi      	r0, 1
}
 80124ec:	1403      	addi      	r14, r14, 12
 80124ee:	1491      	pop      	r4, r15
 80124f0:	c00c00fc 	.long	0xc00c00fc
 80124f4:	05005002 	.long	0x05005002

080124f8 <HAL_ADC_CompareCallback>:
}

__attribute__((weak)) void HAL_ADC_CompareCallback(ADC_HandleTypeDef* hadc)
{
	UNUSED(hadc);
}
 80124f8:	783c      	jmp      	r15
	...

080124fc <HAL_ADC_IRQHandler>:

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc)
{
 80124fc:	14d1      	push      	r4, r15
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 80124fe:	9060      	ld.w      	r3, (r0, 0x0)
{
 8012500:	6d03      	mov      	r4, r0
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 8012502:	9344      	ld.w      	r2, (r3, 0x10)
 8012504:	e4422002 	andi      	r2, r2, 2
 8012508:	e9020007 	bez      	r2, 0x8012516	// 8012516 <HAL_ADC_IRQHandler+0x1a>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_ADC))
 801250c:	9345      	ld.w      	r2, (r3, 0x14)
 801250e:	e4422001 	andi      	r2, r2, 1
 8012512:	e9220013 	bnez      	r2, 0x8012538	// 8012538 <HAL_ADC_IRQHandler+0x3c>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
			HAL_ADC_ConvCpltCallback(hadc);
		}
	}
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_CMPIE))
 8012516:	9344      	ld.w      	r2, (r3, 0x10)
 8012518:	e4422020 	andi      	r2, r2, 32
 801251c:	e9020007 	bez      	r2, 0x801252a	// 801252a <HAL_ADC_IRQHandler+0x2e>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_CMP))
 8012520:	9345      	ld.w      	r2, (r3, 0x14)
 8012522:	e4422002 	andi      	r2, r2, 2
 8012526:	e9220003 	bnez      	r2, 0x801252c	// 801252c <HAL_ADC_IRQHandler+0x30>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
			HAL_ADC_CompareCallback(hadc);
		}
	}
}
 801252a:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
 801252c:	3202      	movi      	r2, 2
 801252e:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_CompareCallback(hadc);
 8012530:	6c13      	mov      	r0, r4
 8012532:	e3ffffe3 	bsr      	0x80124f8	// 80124f8 <HAL_ADC_CompareCallback>
}
 8012536:	1491      	pop      	r4, r15
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8012538:	3201      	movi      	r2, 1
 801253a:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_ConvCpltCallback(hadc);
 801253c:	e0000648 	bsr      	0x80131cc	// 80131cc <HAL_ADC_ConvCpltCallback>
 8012540:	9460      	ld.w      	r3, (r4, 0x0)
 8012542:	07ea      	br      	0x8012516	// 8012516 <HAL_ADC_IRQHandler+0x1a>

08012544 <I2C_Start>:
		__NOP();
	}
}

static void I2C_Start(I2C_HandleTypeDef *hi2c)
{	
 8012544:	14d1      	push      	r4, r15
 8012546:	6d03      	mov      	r4, r0
	I2C_SCL_H(hi2c);
 8012548:	9021      	ld.w      	r1, (r0, 0x4)
 801254a:	3201      	movi      	r2, 1
 801254c:	9000      	ld.w      	r0, (r0, 0x0)
 801254e:	e3fffc4d 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	I2C_SDA_H(hi2c);
 8012552:	3201      	movi      	r2, 1
 8012554:	9423      	ld.w      	r1, (r4, 0xc)
 8012556:	9402      	ld.w      	r0, (r4, 0x8)
 8012558:	e3fffc48 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 801255c:	33e1      	movi      	r3, 225
  \brief   No Operation
  \details No Operation does nothing. This instruction can be used for code alignment purposes.
 */
__ALWAYS_STATIC_INLINE void __NOP(void)
{
    __ASM volatile("nop");
 801255e:	6c03      	mov      	r0, r0
 8012560:	e823ffff 	bnezad      	r3, 0x801255e	// 801255e <I2C_Start+0x1a>
	delay_us();
	
	I2C_SDA_L(hi2c);
 8012564:	3200      	movi      	r2, 0
 8012566:	9423      	ld.w      	r1, (r4, 0xc)
 8012568:	9402      	ld.w      	r0, (r4, 0x8)
 801256a:	e3fffc3f 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 801256e:	33e1      	movi      	r3, 225
 8012570:	6c03      	mov      	r0, r0
 8012572:	e823ffff 	bnezad      	r3, 0x8012570	// 8012570 <I2C_Start+0x2c>
	delay_us();
	
	I2C_SCL_L(hi2c);
 8012576:	3200      	movi      	r2, 0
 8012578:	9421      	ld.w      	r1, (r4, 0x4)
 801257a:	9400      	ld.w      	r0, (r4, 0x0)
 801257c:	e3fffc36 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012580:	33e1      	movi      	r3, 225
 8012582:	6c03      	mov      	r0, r0
 8012584:	e823ffff 	bnezad      	r3, 0x8012582	// 8012582 <I2C_Start+0x3e>
	delay_us();
}
 8012588:	1491      	pop      	r4, r15
	...

0801258c <I2C_Write_Byte>:

	return ack;
}

static void I2C_Write_Byte(I2C_HandleTypeDef *hi2c, uint8_t data)
{
 801258c:	14d3      	push      	r4-r6, r15
 801258e:	6d43      	mov      	r5, r0
 8012590:	6d07      	mov      	r4, r1
 8012592:	3608      	movi      	r6, 8
	int i;
	
	for (i = 0; i < 8; i ++)
	{
		if (data & 0x80)
 8012594:	74d2      	sextb      	r3, r4
 8012596:	e983001f 	blz      	r3, 0x80125d4	// 80125d4 <I2C_Write_Byte+0x48>
		{
			I2C_SDA_H(hi2c);
		}
		else
		{
			I2C_SDA_L(hi2c);
 801259a:	3200      	movi      	r2, 0
 801259c:	9523      	ld.w      	r1, (r5, 0xc)
 801259e:	9502      	ld.w      	r0, (r5, 0x8)
 80125a0:	e3fffc24 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
		}
		I2C_SCL_H(hi2c);
 80125a4:	3201      	movi      	r2, 1
 80125a6:	9521      	ld.w      	r1, (r5, 0x4)
 80125a8:	9500      	ld.w      	r0, (r5, 0x0)
 80125aa:	e3fffc1f 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80125ae:	33e1      	movi      	r3, 225
 80125b0:	6c03      	mov      	r0, r0
 80125b2:	e823ffff 	bnezad      	r3, 0x80125b0	// 80125b0 <I2C_Write_Byte+0x24>
		delay_us();
		I2C_SCL_L(hi2c);
 80125b6:	3200      	movi      	r2, 0
 80125b8:	9521      	ld.w      	r1, (r5, 0x4)
 80125ba:	9500      	ld.w      	r0, (r5, 0x0)
 80125bc:	e3fffc16 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80125c0:	33e1      	movi      	r3, 225
 80125c2:	6c03      	mov      	r0, r0
 80125c4:	e823ffff 	bnezad      	r3, 0x80125c2	// 80125c2 <I2C_Write_Byte+0x36>
		delay_us();
		data <<= 1;
 80125c8:	6110      	addu      	r4, r4
 80125ca:	2e00      	subi      	r6, 1
 80125cc:	7510      	zextb      	r4, r4
	for (i = 0; i < 8; i ++)
 80125ce:	e926ffe3 	bnez      	r6, 0x8012594	// 8012594 <I2C_Write_Byte+0x8>
	}
}
 80125d2:	1493      	pop      	r4-r6, r15
			I2C_SDA_H(hi2c);
 80125d4:	3201      	movi      	r2, 1
 80125d6:	9523      	ld.w      	r1, (r5, 0xc)
 80125d8:	9502      	ld.w      	r0, (r5, 0x8)
 80125da:	e3fffc07 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80125de:	07e3      	br      	0x80125a4	// 80125a4 <I2C_Write_Byte+0x18>

080125e0 <I2C_Stop>:
{
 80125e0:	14d1      	push      	r4, r15
 80125e2:	6d03      	mov      	r4, r0
	I2C_SDA_L(hi2c);
 80125e4:	9023      	ld.w      	r1, (r0, 0xc)
 80125e6:	3200      	movi      	r2, 0
 80125e8:	9002      	ld.w      	r0, (r0, 0x8)
 80125ea:	e3fffbff 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 80125ee:	3201      	movi      	r2, 1
 80125f0:	9421      	ld.w      	r1, (r4, 0x4)
 80125f2:	9400      	ld.w      	r0, (r4, 0x0)
 80125f4:	e3fffbfa 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80125f8:	33e1      	movi      	r3, 225
 80125fa:	6c03      	mov      	r0, r0
 80125fc:	e823ffff 	bnezad      	r3, 0x80125fa	// 80125fa <I2C_Stop+0x1a>
	I2C_SDA_H(hi2c);
 8012600:	3201      	movi      	r2, 1
 8012602:	9423      	ld.w      	r1, (r4, 0xc)
 8012604:	9402      	ld.w      	r0, (r4, 0x8)
 8012606:	e3fffbf1 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 801260a:	33e1      	movi      	r3, 225
 801260c:	6c03      	mov      	r0, r0
 801260e:	e823ffff 	bnezad      	r3, 0x801260c	// 801260c <I2C_Stop+0x2c>
}
 8012612:	1491      	pop      	r4, r15

08012614 <I2C_Wait_Ack>:
{
 8012614:	14d2      	push      	r4-r5, r15
	I2C_SDA_H(hi2c);
 8012616:	9023      	ld.w      	r1, (r0, 0xc)
{
 8012618:	6d03      	mov      	r4, r0
	I2C_SDA_H(hi2c);
 801261a:	3201      	movi      	r2, 1
 801261c:	9002      	ld.w      	r0, (r0, 0x8)
 801261e:	e3fffbe5 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012622:	33e1      	movi      	r3, 225
 8012624:	6c03      	mov      	r0, r0
 8012626:	e823ffff 	bnezad      	r3, 0x8012624	// 8012624 <I2C_Wait_Ack+0x10>
	I2C_SDA_IN(hi2c);
 801262a:	9442      	ld.w      	r2, (r4, 0x8)
 801262c:	9463      	ld.w      	r3, (r4, 0xc)
 801262e:	9222      	ld.w      	r1, (r2, 0x8)
 8012630:	c4612043 	andn      	r3, r1, r3
 8012634:	b262      	st.w      	r3, (r2, 0x8)
	I2C_SCL_H(hi2c);
 8012636:	9421      	ld.w      	r1, (r4, 0x4)
 8012638:	3201      	movi      	r2, 1
 801263a:	9400      	ld.w      	r0, (r4, 0x0)
 801263c:	e3fffbd6 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012640:	33e1      	movi      	r3, 225
 8012642:	6c03      	mov      	r0, r0
 8012644:	e823ffff 	bnezad      	r3, 0x8012642	// 8012642 <I2C_Wait_Ack+0x2e>
	ack = I2C_SDA_GET(hi2c);
 8012648:	9423      	ld.w      	r1, (r4, 0xc)
 801264a:	9402      	ld.w      	r0, (r4, 0x8)
 801264c:	e3fffbc8 	bsr      	0x8011ddc	// 8011ddc <HAL_GPIO_ReadPin>
 8012650:	7540      	zextb      	r5, r0
	I2C_SCL_L(hi2c);
 8012652:	3200      	movi      	r2, 0
 8012654:	9421      	ld.w      	r1, (r4, 0x4)
 8012656:	9400      	ld.w      	r0, (r4, 0x0)
 8012658:	e3fffbc8 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 801265c:	33e1      	movi      	r3, 225
 801265e:	6c03      	mov      	r0, r0
 8012660:	e823ffff 	bnezad      	r3, 0x801265e	// 801265e <I2C_Wait_Ack+0x4a>
	I2C_SDA_OUT(hi2c);
 8012664:	9442      	ld.w      	r2, (r4, 0x8)
 8012666:	9423      	ld.w      	r1, (r4, 0xc)
 8012668:	9262      	ld.w      	r3, (r2, 0x8)
 801266a:	6cc4      	or      	r3, r1
}
 801266c:	6c17      	mov      	r0, r5
	I2C_SDA_OUT(hi2c);
 801266e:	b262      	st.w      	r3, (r2, 0x8)
}
 8012670:	1492      	pop      	r4-r5, r15
	...

08012674 <HAL_I2C_Init>:

	return temp;
}

HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c)
{
 8012674:	14d3      	push      	r4-r6, r15
 8012676:	1423      	subi      	r14, r14, 12
 8012678:	6d03      	mov      	r4, r0
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	GPIO_InitStruct.Pin = hi2c->SCL_Pin;
 801267a:	9061      	ld.w      	r3, (r0, 0x4)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 801267c:	3602      	movi      	r6, 2
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 801267e:	3513      	movi      	r5, 19
	HAL_GPIO_Init(hi2c->SCL_Port, &GPIO_InitStruct);
 8012680:	6c7b      	mov      	r1, r14
 8012682:	9000      	ld.w      	r0, (r0, 0x0)
	GPIO_InitStruct.Pin = hi2c->SCL_Pin;
 8012684:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8012686:	b8c1      	st.w      	r6, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 8012688:	b8a2      	st.w      	r5, (r14, 0x8)
	HAL_GPIO_Init(hi2c->SCL_Port, &GPIO_InitStruct);
 801268a:	e3fffacf 	bsr      	0x8011c28	// 8011c28 <HAL_GPIO_Init>
	
	GPIO_InitStruct.Pin = hi2c->SDA_Pin;
 801268e:	9463      	ld.w      	r3, (r4, 0xc)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(hi2c->SDA_Port, &GPIO_InitStruct);
 8012690:	6c7b      	mov      	r1, r14
 8012692:	9402      	ld.w      	r0, (r4, 0x8)
	GPIO_InitStruct.Pin = hi2c->SDA_Pin;
 8012694:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8012696:	b8c1      	st.w      	r6, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 8012698:	b8a2      	st.w      	r5, (r14, 0x8)
	HAL_GPIO_Init(hi2c->SDA_Port, &GPIO_InitStruct);
 801269a:	e3fffac7 	bsr      	0x8011c28	// 8011c28 <HAL_GPIO_Init>
	
	HAL_GPIO_WritePin(hi2c->SCL_Port, hi2c->SCL_Pin, GPIO_PIN_SET);
 801269e:	9421      	ld.w      	r1, (r4, 0x4)
 80126a0:	9400      	ld.w      	r0, (r4, 0x0)
 80126a2:	3201      	movi      	r2, 1
 80126a4:	e3fffba2 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	HAL_GPIO_WritePin(hi2c->SDA_Port, hi2c->SDA_Pin, GPIO_PIN_SET);
 80126a8:	9402      	ld.w      	r0, (r4, 0x8)
 80126aa:	3201      	movi      	r2, 1
 80126ac:	9423      	ld.w      	r1, (r4, 0xc)
 80126ae:	e3fffb9d 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	
	return HAL_OK;
}
 80126b2:	3000      	movi      	r0, 0
 80126b4:	1403      	addi      	r14, r14, 12
 80126b6:	1493      	pop      	r4-r6, r15

080126b8 <HAL_I2C_Write>:
	
	return HAL_OK;
}

HAL_StatusTypeDef HAL_I2C_Write(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 80126b8:	14d5      	push      	r4-r8, r15
 80126ba:	6d43      	mov      	r5, r0
 80126bc:	6dc7      	mov      	r7, r1
 80126be:	6e0b      	mov      	r8, r2
 80126c0:	6d0f      	mov      	r4, r3
 80126c2:	d8ce100c 	ld.h      	r6, (r14, 0x18)
	uint32_t i, ret = HAL_ERROR;
	
	I2C_Start(hi2c);
 80126c6:	e3ffff3f 	bsr      	0x8012544	// 8012544 <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress & 0xFE));
 80126ca:	6c17      	mov      	r0, r5
 80126cc:	e42720fe 	andi      	r1, r7, 254
 80126d0:	e3ffff5e 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 80126d4:	6c17      	mov      	r0, r5
 80126d6:	e3ffff9f 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 80126da:	e9000008 	bez      	r0, 0x80126ea	// 80126ea <HAL_I2C_Write+0x32>
			goto OUT;
		}
	}
	ret = HAL_OK;
OUT:
	I2C_Stop(hi2c);
 80126de:	6c17      	mov      	r0, r5
	uint32_t i, ret = HAL_ERROR;
 80126e0:	3401      	movi      	r4, 1
	I2C_Stop(hi2c);
 80126e2:	e3ffff7f 	bsr      	0x80125e0	// 80125e0 <I2C_Stop>
	return ret;
}
 80126e6:	6c13      	mov      	r0, r4
 80126e8:	1495      	pop      	r4-r8, r15
	I2C_Write_Byte(hi2c, MemAddress);
 80126ea:	6c17      	mov      	r0, r5
 80126ec:	6c63      	mov      	r1, r8
 80126ee:	e3ffff4f 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 80126f2:	6c17      	mov      	r0, r5
 80126f4:	e3ffff90 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 80126f8:	e920fff3 	bnez      	r0, 0x80126de	// 80126de <HAL_I2C_Write+0x26>
	for (i = 0; i < Size; i++)
 80126fc:	e906000f 	bez      	r6, 0x801271a	// 801271a <HAL_I2C_Write+0x62>
 8012700:	6190      	addu      	r6, r4
		I2C_Write_Byte(hi2c, pData[i]);
 8012702:	6c17      	mov      	r0, r5
 8012704:	8420      	ld.b      	r1, (r4, 0x0)
 8012706:	e3ffff43 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
		if (I2C_Wait_Ack(hi2c))
 801270a:	6c17      	mov      	r0, r5
 801270c:	e3ffff84 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 8012710:	e920ffe7 	bnez      	r0, 0x80126de	// 80126de <HAL_I2C_Write+0x26>
 8012714:	2400      	addi      	r4, 1
	for (i = 0; i < Size; i++)
 8012716:	6592      	cmpne      	r4, r6
 8012718:	0bf5      	bt      	0x8012702	// 8012702 <HAL_I2C_Write+0x4a>
	I2C_Stop(hi2c);
 801271a:	6c17      	mov      	r0, r5
	ret = HAL_OK;
 801271c:	3400      	movi      	r4, 0
	I2C_Stop(hi2c);
 801271e:	e3ffff61 	bsr      	0x80125e0	// 80125e0 <I2C_Stop>
}
 8012722:	6c13      	mov      	r0, r4
 8012724:	1495      	pop      	r4-r8, r15
	...

08012728 <HAL_I2C_Read>:

HAL_StatusTypeDef HAL_I2C_Read(I2C_HandleTypeDef *hi2c, uint8_t DevAddress, uint8_t MemAddress, uint8_t *pData, uint16_t Size)
{
 8012728:	14d7      	push      	r4-r10, r15
 801272a:	6e03      	mov      	r8, r0
 801272c:	6d07      	mov      	r4, r1
 801272e:	6dcb      	mov      	r7, r2
 8012730:	6d4f      	mov      	r5, r3
 8012732:	d8ce1010 	ld.h      	r6, (r14, 0x20)
	uint32_t i, ret = HAL_ERROR;
	
	I2C_Start(hi2c);
 8012736:	e3ffff07 	bsr      	0x8012544	// 8012544 <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress & 0xFE));
 801273a:	6c23      	mov      	r0, r8
 801273c:	e42420fe 	andi      	r1, r4, 254
 8012740:	e3ffff26 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 8012744:	6c23      	mov      	r0, r8
 8012746:	e3ffff67 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 801274a:	e900000f 	bez      	r0, 0x8012768	// 8012768 <HAL_I2C_Read+0x40>
 801274e:	d8682002 	ld.w      	r3, (r8, 0x8)
 8012752:	d8482003 	ld.w      	r2, (r8, 0xc)
	uint32_t i, ret = HAL_ERROR;
 8012756:	3701      	movi      	r7, 1
			I2C_Ack(hi2c);
		}
	}
	ret = HAL_OK;
OUT:
	I2C_SDA_OUT(hi2c);
 8012758:	9322      	ld.w      	r1, (r3, 0x8)
 801275a:	6c84      	or      	r2, r1
	I2C_Stop(hi2c);
 801275c:	6c23      	mov      	r0, r8
	I2C_SDA_OUT(hi2c);
 801275e:	b342      	st.w      	r2, (r3, 0x8)
	I2C_Stop(hi2c);
 8012760:	e3ffff40 	bsr      	0x80125e0	// 80125e0 <I2C_Stop>
	return ret;
}
 8012764:	6c1f      	mov      	r0, r7
 8012766:	1497      	pop      	r4-r10, r15
	I2C_Write_Byte(hi2c, MemAddress);
 8012768:	6c23      	mov      	r0, r8
 801276a:	6c5f      	mov      	r1, r7
 801276c:	e3ffff10 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 8012770:	6c23      	mov      	r0, r8
 8012772:	e3ffff51 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 8012776:	e920ffec 	bnez      	r0, 0x801274e	// 801274e <HAL_I2C_Read+0x26>
	I2C_Start(hi2c);
 801277a:	6c23      	mov      	r0, r8
 801277c:	e3fffee4 	bsr      	0x8012544	// 8012544 <I2C_Start>
	I2C_Write_Byte(hi2c, (DevAddress | 0x01));
 8012780:	ec240001 	ori      	r1, r4, 1
 8012784:	6c23      	mov      	r0, r8
 8012786:	e3ffff03 	bsr      	0x801258c	// 801258c <I2C_Write_Byte>
	if (I2C_Wait_Ack(hi2c))
 801278a:	6c23      	mov      	r0, r8
 801278c:	e3ffff44 	bsr      	0x8012614	// 8012614 <I2C_Wait_Ack>
 8012790:	d8682002 	ld.w      	r3, (r8, 0x8)
 8012794:	e9200068 	bnez      	r0, 0x8012864	// 8012864 <HAL_I2C_Read+0x13c>
	I2C_SDA_IN(hi2c);
 8012798:	9322      	ld.w      	r1, (r3, 0x8)
 801279a:	d8482003 	ld.w      	r2, (r8, 0xc)
 801279e:	6849      	andn      	r1, r2
 80127a0:	b322      	st.w      	r1, (r3, 0x8)
	for (i = 0; i < Size; i++)
 80127a2:	6ddb      	mov      	r7, r6
 80127a4:	e906ffda 	bez      	r6, 0x8012758	// 8012758 <HAL_I2C_Read+0x30>
 80127a8:	5ee3      	subi      	r7, r6, 1
 80127aa:	6d03      	mov      	r4, r0
	uint8_t i, temp = 0;
 80127ac:	ea090000 	movi      	r9, 0
 80127b0:	ea0a0008 	movi      	r10, 8
		I2C_SCL_H(hi2c);
 80127b4:	3201      	movi      	r2, 1
 80127b6:	d8282001 	ld.w      	r1, (r8, 0x4)
 80127ba:	d8082000 	ld.w      	r0, (r8, 0x0)
 80127be:	e3fffb15 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80127c2:	33e1      	movi      	r3, 225
 80127c4:	6c03      	mov      	r0, r0
 80127c6:	e823ffff 	bnezad      	r3, 0x80127c4	// 80127c4 <HAL_I2C_Read+0x9c>
		temp <<= 1;
 80127ca:	6264      	addu      	r9, r9
		if (I2C_SDA_GET(hi2c))
 80127cc:	d8282003 	ld.w      	r1, (r8, 0xc)
 80127d0:	d8082002 	ld.w      	r0, (r8, 0x8)
		temp <<= 1;
 80127d4:	7664      	zextb      	r9, r9
		if (I2C_SDA_GET(hi2c))
 80127d6:	e3fffb03 	bsr      	0x8011ddc	// 8011ddc <HAL_GPIO_ReadPin>
 80127da:	e9000004 	bez      	r0, 0x80127e2	// 80127e2 <HAL_I2C_Read+0xba>
			temp |= 0x01;
 80127de:	ed290001 	ori      	r9, r9, 1
		I2C_SCL_L(hi2c);
 80127e2:	3200      	movi      	r2, 0
 80127e4:	d8282001 	ld.w      	r1, (r8, 0x4)
 80127e8:	d8082000 	ld.w      	r0, (r8, 0x0)
 80127ec:	e3fffafe 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 80127f0:	33e1      	movi      	r3, 225
 80127f2:	6c03      	mov      	r0, r0
 80127f4:	e823ffff 	bnezad      	r3, 0x80127f2	// 80127f2 <HAL_I2C_Read+0xca>
 80127f8:	e54a1000 	subi      	r10, r10, 1
 80127fc:	76a8      	zextb      	r10, r10
	for (i = 0; i < 8; i++)
 80127fe:	e92affdb 	bnez      	r10, 0x80127b4	// 80127b4 <HAL_I2C_Read+0x8c>
		pData[i] = I2C_Read_Byte(hi2c);
 8012802:	dd250000 	st.b      	r9, (r5, 0x0)
	I2C_SDA_OUT(hi2c);
 8012806:	d8082002 	ld.w      	r0, (r8, 0x8)
 801280a:	d8282003 	ld.w      	r1, (r8, 0xc)
 801280e:	9062      	ld.w      	r3, (r0, 0x8)
		if (i == (Size - 1))
 8012810:	65d2      	cmpne      	r4, r7
	I2C_SDA_OUT(hi2c);
 8012812:	6cc4      	or      	r3, r1
 8012814:	b062      	st.w      	r3, (r0, 0x8)
		if (i == (Size - 1))
 8012816:	0c2b      	bf      	0x801286c	// 801286c <HAL_I2C_Read+0x144>
	I2C_SDA_L(hi2c);
 8012818:	6cab      	mov      	r2, r10
 801281a:	e3fffae7 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 801281e:	3201      	movi      	r2, 1
 8012820:	d8282001 	ld.w      	r1, (r8, 0x4)
 8012824:	d8082000 	ld.w      	r0, (r8, 0x0)
 8012828:	e3fffae0 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 801282c:	33e1      	movi      	r3, 225
 801282e:	6c03      	mov      	r0, r0
 8012830:	e823ffff 	bnezad      	r3, 0x801282e	// 801282e <HAL_I2C_Read+0x106>
	I2C_SCL_L(hi2c);
 8012834:	3200      	movi      	r2, 0
 8012836:	d8282001 	ld.w      	r1, (r8, 0x4)
 801283a:	d8082000 	ld.w      	r0, (r8, 0x0)
 801283e:	e3fffad5 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012842:	33e1      	movi      	r3, 225
 8012844:	6c03      	mov      	r0, r0
 8012846:	e823ffff 	bnezad      	r3, 0x8012844	// 8012844 <HAL_I2C_Read+0x11c>
	I2C_SDA_IN(hi2c);
 801284a:	d8682002 	ld.w      	r3, (r8, 0x8)
	for (i = 0; i < Size; i++)
 801284e:	2400      	addi      	r4, 1
	I2C_SDA_IN(hi2c);
 8012850:	9322      	ld.w      	r1, (r3, 0x8)
 8012852:	d8482003 	ld.w      	r2, (r8, 0xc)
	for (i = 0; i < Size; i++)
 8012856:	6592      	cmpne      	r4, r6
	I2C_SDA_IN(hi2c);
 8012858:	6849      	andn      	r1, r2
 801285a:	b322      	st.w      	r1, (r3, 0x8)
 801285c:	2500      	addi      	r5, 1
	for (i = 0; i < Size; i++)
 801285e:	0ba7      	bt      	0x80127ac	// 80127ac <HAL_I2C_Read+0x84>
	ret = HAL_OK;
 8012860:	3700      	movi      	r7, 0
 8012862:	077b      	br      	0x8012758	// 8012758 <HAL_I2C_Read+0x30>
 8012864:	d8482003 	ld.w      	r2, (r8, 0xc)
	uint32_t i, ret = HAL_ERROR;
 8012868:	3701      	movi      	r7, 1
 801286a:	0777      	br      	0x8012758	// 8012758 <HAL_I2C_Read+0x30>
	I2C_SDA_H(hi2c);
 801286c:	3201      	movi      	r2, 1
 801286e:	e3fffabd 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
	I2C_SCL_H(hi2c);
 8012872:	3201      	movi      	r2, 1
 8012874:	d8282001 	ld.w      	r1, (r8, 0x4)
 8012878:	d8082000 	ld.w      	r0, (r8, 0x0)
 801287c:	e3fffab6 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012880:	33e1      	movi      	r3, 225
 8012882:	6c03      	mov      	r0, r0
 8012884:	e823ffff 	bnezad      	r3, 0x8012882	// 8012882 <HAL_I2C_Read+0x15a>
	I2C_SCL_L(hi2c);
 8012888:	3200      	movi      	r2, 0
 801288a:	d8282001 	ld.w      	r1, (r8, 0x4)
 801288e:	d8082000 	ld.w      	r0, (r8, 0x0)
 8012892:	e3fffaab 	bsr      	0x8011de8	// 8011de8 <HAL_GPIO_WritePin>
 8012896:	33e1      	movi      	r3, 225
 8012898:	6c03      	mov      	r0, r0
 801289a:	e823ffff 	bnezad      	r3, 0x8012898	// 8012898 <HAL_I2C_Read+0x170>
 801289e:	07d6      	br      	0x801284a	// 801284a <HAL_I2C_Read+0x122>

080128a0 <num2char>:
 * g：		整数位数
 * l：		小数位数
 * chr：	单位
 */
void num2char(uint8_t *str, double number, uint8_t g, uint8_t l, char *chr)
{
 80128a0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80128a4:	6d83      	mov      	r6, r0
 80128a6:	6e47      	mov      	r9, r1
 80128a8:	6d4b      	mov      	r5, r2
 80128aa:	6ecf      	mov      	r11, r3
 80128ac:	d90e200c 	ld.w      	r8, (r14, 0x30)
 80128b0:	d8ee002c 	ld.b      	r7, (r14, 0x2c)
	assert(str != NULL);
 80128b4:	e900006f 	bez      	r0, 0x8012992	// 8012992 <num2char+0xf2>
	assert(chr != NULL);
 80128b8:	e9080067 	bez      	r8, 0x8012986	// 8012986 <num2char+0xe6>
	
    uint8_t i;
    int temp = number/1;
 80128bc:	6c07      	mov      	r0, r1
 80128be:	6c4b      	mov      	r1, r2
 80128c0:	e3fff60c 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
    double t2 = 0.0;
    for (i = 1; i<=g; i++)
 80128c4:	e90b0025 	bez      	r11, 0x801290e	// 801290e <num2char+0x6e>
 80128c8:	3301      	movi      	r3, 1
    {
        if (temp==0)
            str[g-i] = table[0];
        else
            str[g-i] = table[temp%10];
 80128ca:	ea920036 	lrw      	r18, 0x8015490	// 80129a0 <num2char+0x100>
 80128ce:	310a      	movi      	r1, 10
            str[g-i] = table[0];
 80128d0:	ea0d0030 	movi      	r13, 48
 80128d4:	040b      	br      	0x80128ea	// 80128ea <num2char+0x4a>
 80128d6:	c46b0082 	subu      	r2, r11, r3
    for (i = 1; i<=g; i++)
 80128da:	2300      	addi      	r3, 1
 80128dc:	74cc      	zextb      	r3, r3
 80128de:	64ec      	cmphs      	r11, r3
            str[g-i] = table[0];
 80128e0:	d446002d 	str.b      	r13, (r6, r2 << 0)
        temp = temp/10;
 80128e4:	c4208040 	divs      	r0, r0, r1
    for (i = 1; i<=g; i++)
 80128e8:	0c13      	bf      	0x801290e	// 801290e <num2char+0x6e>
        if (temp==0)
 80128ea:	e900fff6 	bez      	r0, 0x80128d6	// 80128d6 <num2char+0x36>
            str[g-i] = table[temp%10];
 80128ee:	c46b008c 	subu      	r12, r11, r3
 80128f2:	c4208042 	divs      	r2, r0, r1
    for (i = 1; i<=g; i++)
 80128f6:	2300      	addi      	r3, 1
            str[g-i] = table[temp%10];
 80128f8:	7c84      	mult      	r2, r1
    for (i = 1; i<=g; i++)
 80128fa:	74cc      	zextb      	r3, r3
            str[g-i] = table[temp%10];
 80128fc:	5849      	subu      	r2, r0, r2
    for (i = 1; i<=g; i++)
 80128fe:	64ec      	cmphs      	r11, r3
            str[g-i] = table[temp%10];
 8012900:	d0520022 	ldr.b      	r2, (r18, r2 << 0)
 8012904:	d5860022 	str.b      	r2, (r6, r12 << 0)
        temp = temp/10;
 8012908:	c4208040 	divs      	r0, r0, r1
    for (i = 1; i<=g; i++)
 801290c:	0bef      	bt      	0x80128ea	// 80128ea <num2char+0x4a>
    }
	if(0 == l)
 801290e:	e9070031 	bez      	r7, 0x8012970	// 8012970 <num2char+0xd0>
		goto end;
    *(str+g) = '.';
 8012912:	332e      	movi      	r3, 46
 8012914:	d5660023 	str.b      	r3, (r6, r11 << 0)
 8012918:	3401      	movi      	r4, 1
 801291a:	ea8a0022 	lrw      	r10, 0x8015490	// 80129a0 <num2char+0x100>
    temp = 0;
    t2 = number;
    for(i=1; i<=l; i++)
    {
        temp = t2*10;
        str[g+i] = table[temp%10];
 801291e:	ea10000a 	movi      	r16, 10
        temp = t2*10;
 8012922:	ea234024 	movih      	r3, 16420
 8012926:	3200      	movi      	r2, 0
 8012928:	6c27      	mov      	r0, r9
 801292a:	6c57      	mov      	r1, r5
 801292c:	e3fff39e 	bsr      	0x8011068	// 8011068 <__muldf3>
 8012930:	6e43      	mov      	r9, r0
 8012932:	6d47      	mov      	r5, r1
 8012934:	e3fff5d2 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
        str[g+i] = table[temp%10];
 8012938:	c4860031 	addu      	r17, r6, r4
 801293c:	c6008043 	divs      	r3, r0, r16
    for(i=1; i<=l; i++)
 8012940:	2400      	addi      	r4, 1
        str[g+i] = table[temp%10];
 8012942:	c6038423 	mult      	r3, r3, r16
    for(i=1; i<=l; i++)
 8012946:	7510      	zextb      	r4, r4
        str[g+i] = table[temp%10];
 8012948:	600e      	subu      	r0, r3
    for(i=1; i<=l; i++)
 801294a:	651c      	cmphs      	r7, r4
        str[g+i] = table[temp%10];
 801294c:	d00a0023 	ldr.b      	r3, (r10, r0 << 0)
 8012950:	d5710023 	str.b      	r3, (r17, r11 << 0)
    for(i=1; i<=l; i++)
 8012954:	0be7      	bt      	0x8012922	// 8012922 <num2char+0x82>
        t2 = t2*10;
    }
	//加上单位
	memcpy(str+g+l+1,chr,strlen(chr)+1);
 8012956:	6c23      	mov      	r0, r8
 8012958:	2700      	addi      	r7, 1
 801295a:	e3fff8fb 	bsr      	0x8011b50	// 8011b50 <__strlen_fast>
 801295e:	62dc      	addu      	r11, r7
 8012960:	5842      	addi      	r2, r0, 1
 8012962:	6c63      	mov      	r1, r8
 8012964:	c5660020 	addu      	r0, r6, r11
 8012968:	e3fff914 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
	return ;
	end:
	//没有冒号
	memcpy(str+g+l,chr,strlen(chr)+1);
}
 801296c:	ebc00058 	pop      	r4-r11, r15, r16-r17
	memcpy(str+g+l,chr,strlen(chr)+1);
 8012970:	6c23      	mov      	r0, r8
 8012972:	e3fff8ef 	bsr      	0x8011b50	// 8011b50 <__strlen_fast>
 8012976:	5842      	addi      	r2, r0, 1
 8012978:	6c63      	mov      	r1, r8
 801297a:	c5660020 	addu      	r0, r6, r11
 801297e:	e3fff909 	bsr      	0x8011b90	// 8011b90 <__memcpy_fast>
}
 8012982:	ebc00058 	pop      	r4-r11, r15, r16-r17
	assert(chr != NULL);
 8012986:	1068      	lrw      	r3, 0x8015484	// 80129a4 <num2char+0x104>
 8012988:	1048      	lrw      	r2, 0x801540c	// 80129a8 <num2char+0x108>
 801298a:	3131      	movi      	r1, 49
 801298c:	1008      	lrw      	r0, 0x8015460	// 80129ac <num2char+0x10c>
 801298e:	e0001431 	bsr      	0x80151f0	// 80151f0 <__assert_fail>
	assert(str != NULL);
 8012992:	1068      	lrw      	r3, 0x8015454	// 80129b0 <num2char+0x110>
 8012994:	1045      	lrw      	r2, 0x801540c	// 80129a8 <num2char+0x108>
 8012996:	3130      	movi      	r1, 48
 8012998:	1005      	lrw      	r0, 0x8015460	// 80129ac <num2char+0x10c>
 801299a:	e000142b 	bsr      	0x80151f0	// 80151f0 <__assert_fail>
 801299e:	0000      	.short	0x0000
 80129a0:	08015490 	.long	0x08015490
 80129a4:	08015484 	.long	0x08015484
 80129a8:	0801540c 	.long	0x0801540c
 80129ac:	08015460 	.long	0x08015460
 80129b0:	08015454 	.long	0x08015454

080129b4 <time2string>:


void time2string(uint8_t *str, uint8_t Hour, uint8_t Min, uint8_t Sec)
{
 80129b4:	14d0      	push      	r15
	assert(str != NULL);
 80129b6:	e900006d 	bez      	r0, 0x8012a90	// 8012a90 <time2string+0xdc>
	assert(Hour <= 999);
	assert(Min <= 59);
 80129ba:	ea0c003b 	movi      	r12, 59
 80129be:	64b0      	cmphs      	r12, r2
 80129c0:	0c62      	bf      	0x8012a84	// 8012a84 <time2string+0xd0>
	assert(Sec <= 59);
 80129c2:	64f0      	cmphs      	r12, r3
 80129c4:	0c5a      	bf      	0x8012a78	// 8012a78 <time2string+0xc4>
 80129c6:	e5800001 	addi      	r12, r0, 2
 80129ca:	e6601000 	subi      	r19, r0, 1
    for (i = 1; i<=hour_len; i++)
    {
        if (temp==0)
            dst_str[hour_len-i] = table[0];
        else
            dst_str[hour_len-i] = table[temp%10];
 80129ce:	ea950034 	lrw      	r21, 0x8015490	// 8012a9c <time2string+0xe8>
 80129d2:	ea12000a 	movi      	r18, 10
            dst_str[hour_len-i] = table[0];
 80129d6:	ea140030 	movi      	r20, 48
        if (temp==0)
 80129da:	e9210035 	bnez      	r1, 0x8012a44	// 8012a44 <time2string+0x90>
            dst_str[hour_len-i] = table[0];
 80129de:	de8c0000 	st.b      	r20, (r12, 0x0)
 80129e2:	e58c1000 	subi      	r12, r12, 1
    for (i = 1; i<=hour_len; i++)
 80129e6:	c5930480 	cmpne      	r19, r12
        temp = temp/10;
 80129ea:	c6418041 	divs      	r1, r1, r18
    for (i = 1; i<=hour_len; i++)
 80129ee:	0bf6      	bt      	0x80129da	// 80129da <time2string+0x26>
    }
	
	dst_str+=3;
    *dst_str++ = ':';
 80129f0:	313a      	movi      	r1, 58
 80129f2:	a023      	st.b      	r1, (r0, 0x3)
	
	//Min
	temp = Min/1;
	for (i = 1; i<=min_len; i++)
    {
        if (temp==0)
 80129f4:	e9020033 	bez      	r2, 0x8012a5a	// 8012a5a <time2string+0xa6>
            dst_str[min_len-i] = table[0];
        else
            dst_str[min_len-i] = table[temp%10];
 80129f8:	c6428041 	divs      	r1, r2, r18
 80129fc:	ea8c0028 	lrw      	r12, 0x8015490	// 8012a9c <time2string+0xe8>
 8012a00:	c6418432 	mult      	r18, r1, r18
 8012a04:	c6420092 	subu      	r18, r2, r18
 8012a08:	d24c0022 	ldr.b      	r2, (r12, r18 << 0)
 8012a0c:	a045      	st.b      	r2, (r0, 0x5)
        if (temp==0)
 8012a0e:	e9010028 	bez      	r1, 0x8012a5e	// 8012a5e <time2string+0xaa>
            dst_str[min_len-i] = table[temp%10];
 8012a12:	d02c0022 	ldr.b      	r2, (r12, r1 << 0)
 8012a16:	a044      	st.b      	r2, (r0, 0x4)
        temp = temp/10;
    }
	dst_str+=2;
	
	//加1是因为":"占位了
    *dst_str++ = ':';
 8012a18:	323a      	movi      	r2, 58
 8012a1a:	a046      	st.b      	r2, (r0, 0x6)
	
	//Sec
	temp = Sec/1;
	for (i = 1; i<=sec_len; i++)
    {
        if (temp==0)
 8012a1c:	e9030027 	bez      	r3, 0x8012a6a	// 8012a6a <time2string+0xb6>
            dst_str[sec_len-i] = table[0];
        else
            dst_str[sec_len-i] = table[temp%10];
 8012a20:	320a      	movi      	r2, 10
 8012a22:	c4438041 	divs      	r1, r3, r2
 8012a26:	ea8c001e 	lrw      	r12, 0x8015490	// 8012a9c <time2string+0xe8>
 8012a2a:	7c84      	mult      	r2, r1
 8012a2c:	60ca      	subu      	r3, r2
 8012a2e:	d06c0023 	ldr.b      	r3, (r12, r3 << 0)
 8012a32:	a068      	st.b      	r3, (r0, 0x8)
        if (temp==0)
 8012a34:	e901001d 	bez      	r1, 0x8012a6e	// 8012a6e <time2string+0xba>
            dst_str[sec_len-i] = table[temp%10];
 8012a38:	d02c0023 	ldr.b      	r3, (r12, r1 << 0)
 8012a3c:	a067      	st.b      	r3, (r0, 0x7)
        temp = temp/10;
    }
	dst_str+=2;
	
	//加2是因为两个":"占位了
    *dst_str++ = '\0';
 8012a3e:	3300      	movi      	r3, 0
 8012a40:	a069      	st.b      	r3, (r0, 0x9)
}
 8012a42:	1490      	pop      	r15
            dst_str[hour_len-i] = table[temp%10];
 8012a44:	c641804d 	divs      	r13, r1, r18
 8012a48:	c64d842d 	mult      	r13, r13, r18
 8012a4c:	c5a1008d 	subu      	r13, r1, r13
 8012a50:	d1b5002d 	ldr.b      	r13, (r21, r13 << 0)
 8012a54:	ddac0000 	st.b      	r13, (r12, 0x0)
 8012a58:	07c5      	br      	0x80129e2	// 80129e2 <time2string+0x2e>
            dst_str[min_len-i] = table[0];
 8012a5a:	3230      	movi      	r2, 48
 8012a5c:	a045      	st.b      	r2, (r0, 0x5)
 8012a5e:	3230      	movi      	r2, 48
 8012a60:	a044      	st.b      	r2, (r0, 0x4)
    *dst_str++ = ':';
 8012a62:	323a      	movi      	r2, 58
 8012a64:	a046      	st.b      	r2, (r0, 0x6)
        if (temp==0)
 8012a66:	e923ffdd 	bnez      	r3, 0x8012a20	// 8012a20 <time2string+0x6c>
            dst_str[sec_len-i] = table[0];
 8012a6a:	3330      	movi      	r3, 48
 8012a6c:	a068      	st.b      	r3, (r0, 0x8)
 8012a6e:	3330      	movi      	r3, 48
 8012a70:	a067      	st.b      	r3, (r0, 0x7)
    *dst_str++ = '\0';
 8012a72:	3300      	movi      	r3, 0
 8012a74:	a069      	st.b      	r3, (r0, 0x9)
}
 8012a76:	1490      	pop      	r15
	assert(Sec <= 59);
 8012a78:	106a      	lrw      	r3, 0x80154a8	// 8012aa0 <time2string+0xec>
 8012a7a:	104b      	lrw      	r2, 0x8015418	// 8012aa4 <time2string+0xf0>
 8012a7c:	3157      	movi      	r1, 87
 8012a7e:	100b      	lrw      	r0, 0x8015460	// 8012aa8 <time2string+0xf4>
 8012a80:	e00013b8 	bsr      	0x80151f0	// 80151f0 <__assert_fail>
	assert(Min <= 59);
 8012a84:	106a      	lrw      	r3, 0x801549c	// 8012aac <time2string+0xf8>
 8012a86:	1048      	lrw      	r2, 0x8015418	// 8012aa4 <time2string+0xf0>
 8012a88:	3156      	movi      	r1, 86
 8012a8a:	1008      	lrw      	r0, 0x8015460	// 8012aa8 <time2string+0xf4>
 8012a8c:	e00013b2 	bsr      	0x80151f0	// 80151f0 <__assert_fail>
	assert(str != NULL);
 8012a90:	1068      	lrw      	r3, 0x8015454	// 8012ab0 <time2string+0xfc>
 8012a92:	1045      	lrw      	r2, 0x8015418	// 8012aa4 <time2string+0xf0>
 8012a94:	3154      	movi      	r1, 84
 8012a96:	1005      	lrw      	r0, 0x8015460	// 8012aa8 <time2string+0xf4>
 8012a98:	e00013ac 	bsr      	0x80151f0	// 80151f0 <__assert_fail>
 8012a9c:	08015490 	.long	0x08015490
 8012aa0:	080154a8 	.long	0x080154a8
 8012aa4:	08015418 	.long	0x08015418
 8012aa8:	08015460 	.long	0x08015460
 8012aac:	0801549c 	.long	0x0801549c
 8012ab0:	08015454 	.long	0x08015454

08012ab4 <Write_Flash>:
	}
	
}

void Write_Flash(INA226_VALUE *ina226_value)
{
 8012ab4:	14d1      	push      	r4, r15
	uint16_t state;
	state = HAL_FLASH_Write(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8012ab6:	e4200013 	addi      	r1, r0, 20
{
 8012aba:	6d03      	mov      	r4, r0
	state = HAL_FLASH_Write(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8012abc:	3208      	movi      	r2, 8
 8012abe:	ea200008 	movih      	r0, 8
 8012ac2:	e3fffbfd 	bsr      	0x80122bc	// 80122bc <HAL_FLASH_Write>
	if(state == HAL_ERROR)
 8012ac6:	7401      	zexth      	r0, r0
 8012ac8:	3841      	cmpnei      	r0, 1
 8012aca:	0c11      	bf      	0x8012aec	// 8012aec <Write_Flash+0x38>
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/ 
	state = HAL_FLASH_Write(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
 8012acc:	3204      	movi      	r2, 4
 8012ace:	e4240023 	addi      	r1, r4, 36
 8012ad2:	c6405020 	bmaski      	r0, 19
 8012ad6:	2014      	addi      	r0, 21
 8012ad8:	e3fffbf2 	bsr      	0x80122bc	// 80122bc <HAL_FLASH_Write>
	if(state == HAL_ERROR)
 8012adc:	7401      	zexth      	r0, r0
 8012ade:	3841      	cmpnei      	r0, 1
 8012ae0:	0c02      	bf      	0x8012ae4	// 8012ae4 <Write_Flash+0x30>
	{
		printf("write FLASH er...\r\n");
	}
}
 8012ae2:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8012ae4:	1004      	lrw      	r0, 0x80153f8	// 8012af4 <Write_Flash+0x40>
 8012ae6:	e3fff803 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 8012aea:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8012aec:	1002      	lrw      	r0, 0x80153f8	// 8012af4 <Write_Flash+0x40>
 8012aee:	e3fff7ff 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8012af2:	07ed      	br      	0x8012acc	// 8012acc <Write_Flash+0x18>
 8012af4:	080153f8 	.long	0x080153f8

08012af8 <Read_Flash>:


void Read_Flash(INA226_VALUE *ina226_value)
{
 8012af8:	14d1      	push      	r4, r15
	uint16_t state;
	state = HAL_FLASH_Read(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8012afa:	e4200013 	addi      	r1, r0, 20
{
 8012afe:	6d03      	mov      	r4, r0
	state = HAL_FLASH_Read(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
 8012b00:	3208      	movi      	r2, 8
 8012b02:	ea200008 	movih      	r0, 8
 8012b06:	e3fffba3 	bsr      	0x801224c	// 801224c <HAL_FLASH_Read>
	if(state == HAL_ERROR)
 8012b0a:	7401      	zexth      	r0, r0
 8012b0c:	3841      	cmpnei      	r0, 1
 8012b0e:	0c11      	bf      	0x8012b30	// 8012b30 <Read_Flash+0x38>
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/
	state = HAL_FLASH_Read(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
 8012b10:	3204      	movi      	r2, 4
 8012b12:	e4240023 	addi      	r1, r4, 36
 8012b16:	c6405020 	bmaski      	r0, 19
 8012b1a:	2014      	addi      	r0, 21
 8012b1c:	e3fffb98 	bsr      	0x801224c	// 801224c <HAL_FLASH_Read>
	if(state == HAL_ERROR)
 8012b20:	7401      	zexth      	r0, r0
 8012b22:	3841      	cmpnei      	r0, 1
 8012b24:	0c02      	bf      	0x8012b28	// 8012b28 <Read_Flash+0x30>
	{
		printf("write FLASH er...\r\n");
	}
}
 8012b26:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8012b28:	1004      	lrw      	r0, 0x80153f8	// 8012b38 <Read_Flash+0x40>
 8012b2a:	e3fff7e1 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 8012b2e:	1491      	pop      	r4, r15
		printf("write FLASH er...\r\n");
 8012b30:	1002      	lrw      	r0, 0x80153f8	// 8012b38 <Read_Flash+0x40>
 8012b32:	e3fff7dd 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 8012b36:	07ed      	br      	0x8012b10	// 8012b10 <Read_Flash+0x18>
 8012b38:	080153f8 	.long	0x080153f8

08012b3c <OLED_Show>:

void OLED_Show(INA226_VALUE *ina226_value)
{
 8012b3c:	14d3      	push      	r4-r6, r15
 8012b3e:	1421      	subi      	r14, r14, 4
 8012b40:	f40e2408 	fsts      	fr8, (r14, 0x0)
 8012b44:	142c      	subi      	r14, r14, 48
	uint8_t string[40] = {0};
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8012b46:	ea23447a 	movih      	r3, 17530
 8012b4a:	f4002000 	flds      	fr0, (r0, 0x0)
 8012b4e:	f4031b68 	fmtvrl      	fr8, r3
	uint8_t string[40] = {0};
 8012b52:	3400      	movi      	r4, 0
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8012b54:	f5000300 	fdivs      	fr0, fr0, fr8
{
 8012b58:	6d43      	mov      	r5, r0
	uint8_t string[40] = {0};
 8012b5a:	b882      	st.w      	r4, (r14, 0x8)
 8012b5c:	b883      	st.w      	r4, (r14, 0xc)
 8012b5e:	b884      	st.w      	r4, (r14, 0x10)
 8012b60:	b885      	st.w      	r4, (r14, 0x14)
 8012b62:	b886      	st.w      	r4, (r14, 0x18)
 8012b64:	b887      	st.w      	r4, (r14, 0x1c)
 8012b66:	b888      	st.w      	r4, (r14, 0x20)
 8012b68:	b889      	st.w      	r4, (r14, 0x24)
 8012b6a:	b88a      	st.w      	r4, (r14, 0x28)
 8012b6c:	b88b      	st.w      	r4, (r14, 0x2c)
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
 8012b6e:	e3fff0cf 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012b72:	6f47      	mov      	r13, r1
 8012b74:	3603      	movi      	r6, 3
 8012b76:	1170      	lrw      	r3, 0x80153e8	// 8012c34 <OLED_Show+0xf8>
 8012b78:	6cb7      	mov      	r2, r13
 8012b7a:	b861      	st.w      	r3, (r14, 0x4)
 8012b7c:	6c43      	mov      	r1, r0
 8012b7e:	b8c0      	st.w      	r6, (r14, 0x0)
 8012b80:	1802      	addi      	r0, r14, 8
 8012b82:	3302      	movi      	r3, 2
 8012b84:	e3fffe8e 	bsr      	0x80128a0	// 80128a0 <num2char>
	OLED_ShowString(0,0,string,16);
 8012b88:	1a02      	addi      	r2, r14, 8
 8012b8a:	3310      	movi      	r3, 16
 8012b8c:	6c53      	mov      	r1, r4
 8012b8e:	6c13      	mov      	r0, r4
 8012b90:	e0000552 	bsr      	0x8013634	// 8013634 <OLED_ShowString>
	
	num2char(string,ina226_value->Current/1000,1,3,"A");
 8012b94:	f4052020 	flds      	fr0, (r5, 0x8)
 8012b98:	f5000300 	fdivs      	fr0, fr0, fr8
 8012b9c:	e3fff0b8 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012ba0:	6f47      	mov      	r13, r1
 8012ba2:	1166      	lrw      	r3, 0x80153ec	// 8012c38 <OLED_Show+0xfc>
 8012ba4:	6cb7      	mov      	r2, r13
 8012ba6:	b861      	st.w      	r3, (r14, 0x4)
 8012ba8:	6c43      	mov      	r1, r0
 8012baa:	b8c0      	st.w      	r6, (r14, 0x0)
 8012bac:	1802      	addi      	r0, r14, 8
 8012bae:	3301      	movi      	r3, 1
 8012bb0:	e3fffe78 	bsr      	0x80128a0	// 80128a0 <num2char>
	//printf(" string:  %s %d  %d ",string,ina226_value->Current,ina226_value->Current/1000);
	OLED_ShowString(68,0,string,16);
 8012bb4:	1a02      	addi      	r2, r14, 8
 8012bb6:	3310      	movi      	r3, 16
 8012bb8:	6c53      	mov      	r1, r4
 8012bba:	3044      	movi      	r0, 68
 8012bbc:	e000053c 	bsr      	0x8013634	// 8013634 <OLED_ShowString>
	
	num2char(string,ina226_value->Power,2,3,"W");
 8012bc0:	f4052030 	flds      	fr0, (r5, 0xc)
 8012bc4:	e3fff0a4 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012bc8:	6f47      	mov      	r13, r1
 8012bca:	107d      	lrw      	r3, 0x80153f0	// 8012c3c <OLED_Show+0x100>
 8012bcc:	6cb7      	mov      	r2, r13
 8012bce:	b861      	st.w      	r3, (r14, 0x4)
 8012bd0:	6c43      	mov      	r1, r0
 8012bd2:	b8c0      	st.w      	r6, (r14, 0x0)
 8012bd4:	1802      	addi      	r0, r14, 8
 8012bd6:	3302      	movi      	r3, 2
 8012bd8:	e3fffe64 	bsr      	0x80128a0	// 80128a0 <num2char>
	OLED_ShowString(0,2,string,12);
 8012bdc:	1a02      	addi      	r2, r14, 8
 8012bde:	6c13      	mov      	r0, r4
 8012be0:	330c      	movi      	r3, 12
 8012be2:	3102      	movi      	r1, 2
 8012be4:	e0000528 	bsr      	0x8013634	// 8013634 <OLED_ShowString>
	
	
	time2string(string,INA226_Value.Time.Hour, INA226_Value.Time.Min, INA226_Value.Time.Sec);
 8012be8:	1036      	lrw      	r1, 0x2000321c	// 8012c40 <OLED_Show+0x104>
 8012bea:	1802      	addi      	r0, r14, 8
 8012bec:	817e      	ld.b      	r3, (r1, 0x1e)
 8012bee:	815d      	ld.b      	r2, (r1, 0x1d)
 8012bf0:	813c      	ld.b      	r1, (r1, 0x1c)
 8012bf2:	e3fffee1 	bsr      	0x80129b4	// 80129b4 <time2string>
	OLED_ShowString(0,3,string,12);
 8012bf6:	1a02      	addi      	r2, r14, 8
 8012bf8:	330c      	movi      	r3, 12
 8012bfa:	6c5b      	mov      	r1, r6
 8012bfc:	6c13      	mov      	r0, r4
 8012bfe:	e000051b 	bsr      	0x8013634	// 8013634 <OLED_ShowString>
	
	
	num2char(string,ina226_value->mAh,4,0,"mAh");
 8012c02:	f4052090 	flds      	fr0, (r5, 0x24)
 8012c06:	e3fff083 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012c0a:	6f47      	mov      	r13, r1
 8012c0c:	106e      	lrw      	r3, 0x80153f4	// 8012c44 <OLED_Show+0x108>
 8012c0e:	6cb7      	mov      	r2, r13
 8012c10:	b861      	st.w      	r3, (r14, 0x4)
 8012c12:	6c43      	mov      	r1, r0
 8012c14:	b880      	st.w      	r4, (r14, 0x0)
 8012c16:	1802      	addi      	r0, r14, 8
 8012c18:	3304      	movi      	r3, 4
 8012c1a:	e3fffe43 	bsr      	0x80128a0	// 80128a0 <num2char>
	//printf("%s ",string);
	OLED_ShowString(60,2,string,12);
 8012c1e:	330c      	movi      	r3, 12
 8012c20:	1a02      	addi      	r2, r14, 8
 8012c22:	3102      	movi      	r1, 2
 8012c24:	303c      	movi      	r0, 60
 8012c26:	e0000507 	bsr      	0x8013634	// 8013634 <OLED_ShowString>
	
}
 8012c2a:	140c      	addi      	r14, r14, 48
 8012c2c:	f40e2008 	flds      	fr8, (r14, 0x0)
 8012c30:	1401      	addi      	r14, r14, 4
 8012c32:	1493      	pop      	r4-r6, r15
 8012c34:	080153e8 	.long	0x080153e8
 8012c38:	080153ec 	.long	0x080153ec
 8012c3c:	080153f0 	.long	0x080153f0
 8012c40:	2000321c 	.long	0x2000321c
 8012c44:	080153f4 	.long	0x080153f4

08012c48 <main>:
{
 8012c48:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012c4c:	142c      	subi      	r14, r14, 48
	SystemClock_Config(CPU_CLK_240M);
 8012c4e:	3002      	movi      	r0, 2
 8012c50:	e3fff93c 	bsr      	0x8011ec8	// 8011ec8 <SystemClock_Config>
	printf("enter main\r\n");
 8012c54:	120b      	lrw      	r0, 0x8015424	// 8012d80 <main+0x138>
 8012c56:	e3fff74b 	bsr      	0x8011aec	// 8011aec <__GI_puts>
	HAL_Init();
 8012c5a:	e3fff9ab 	bsr      	0x8011fb0	// 8011fb0 <HAL_Init>
	Read_Flash(&INA226_Value);
 8012c5e:	120a      	lrw      	r0, 0x2000321c	// 8012d84 <main+0x13c>
 8012c60:	e3ffff4c 	bsr      	0x8012af8	// 8012af8 <Read_Flash>
	HAL_Delay(100);
 8012c64:	3064      	movi      	r0, 100
 8012c66:	e3fff96f 	bsr      	0x8011f44	// 8011f44 <HAL_Delay>
	GPIO_Init();
 8012c6a:	e00002b3 	bsr      	0x80131d0	// 80131d0 <GPIO_Init>
	OLED_Init();
 8012c6e:	e0000501 	bsr      	0x8013670	// 8013670 <OLED_Init>
	INA226_Init();
 8012c72:	e0000401 	bsr      	0x8013474	// 8013474 <INA226_Init>
	ADC_Init(ADC_4,1000);
 8012c76:	ea0103e8 	movi      	r1, 1000
 8012c7a:	3003      	movi      	r0, 3
 8012c7c:	e0000272 	bsr      	0x8013160	// 8013160 <ADC_Init>
	ADC_Init(ADC_VOL,1000);
 8012c80:	ea0103e8 	movi      	r1, 1000
 8012c84:	3005      	movi      	r0, 5
 8012c86:	e000026d 	bsr      	0x8013160	// 8013160 <ADC_Init>
	TIM_Init_Us(TIM0,100000);
 8012c8a:	ea0186a0 	movi      	r1, 34464
 8012c8e:	39b0      	bseti      	r1, 16
 8012c90:	3000      	movi      	r0, 0
 8012c92:	e0000615 	bsr      	0x80138bc	// 80138bc <TIM_Init_Us>
	HAL_TIM_Base_Start_IT(&htim[TIM0]);
 8012c96:	111d      	lrw      	r0, 0x20002c84	// 8012d88 <main+0x140>
 8012c98:	e3fff9d6 	bsr      	0x8012044	// 8012044 <HAL_TIM_Base_Start_IT>
 8012c9c:	ea03033e 	movi      	r3, 830
 8012ca0:	6c03      	mov      	r0, r0
 8012ca2:	e823ffff 	bnezad      	r3, 0x8012ca0	// 8012ca0 <main+0x58>
	OLED_Clear();
 8012ca6:	e00003ff 	bsr      	0x80134a4	// 80134a4 <OLED_Clear>
 8012caa:	1197      	lrw      	r4, 0x2000321c	// 8012d84 <main+0x13c>
			printf("%f %f  %f  %f  %f  %f mAh  %f mW\r\n",INA226_Value.Bus_V, INA226_Value.Shunt_V, INA226_Value.Current, INA226_Value.Power,INA226_Value.Power_All,INA226_Value.mAh,INA226_Value.Wh);
 8012cac:	1178      	lrw      	r3, 0x8015430	// 8012d8c <main+0x144>
 8012cae:	ea8a0039 	lrw      	r10, 0x20000160	// 8012d90 <main+0x148>
 8012cb2:	11b9      	lrw      	r5, 0x20002c81	// 8012d94 <main+0x14c>
		Get_INA226_All_Value(&INA226_Value);
 8012cb4:	6dd3      	mov      	r7, r4
			Show_Flage = 0;
 8012cb6:	3600      	movi      	r6, 0
			printf("%f %f  %f  %f  %f  %f mAh  %f mW\r\n",INA226_Value.Bus_V, INA226_Value.Shunt_V, INA226_Value.Current, INA226_Value.Power,INA226_Value.Power_All,INA226_Value.mAh,INA226_Value.Wh);
 8012cb8:	b86b      	st.w      	r3, (r14, 0x2c)
			INA226_Value.Power_All = 0;
 8012cba:	ea0b0000 	movi      	r11, 0
 8012cbe:	040a      	br      	0x8012cd2	// 8012cd2 <main+0x8a>
		if(1 == key_flag)
 8012cc0:	8560      	ld.b      	r3, (r5, 0x0)
 8012cc2:	3b41      	cmpnei      	r3, 1
 8012cc4:	0c4e      	bf      	0x8012d60	// 8012d60 <main+0x118>
		}else if(2 == key_flag)
 8012cc6:	8560      	ld.b      	r3, (r5, 0x0)
 8012cc8:	3b42      	cmpnei      	r3, 2
 8012cca:	0c58      	bf      	0x8012d7a	// 8012d7a <main+0x132>
		HAL_Delay(54);
 8012ccc:	3036      	movi      	r0, 54
 8012cce:	e3fff93b 	bsr      	0x8011f44	// 8011f44 <HAL_Delay>
		Get_INA226_All_Value(&INA226_Value);
 8012cd2:	6c1f      	mov      	r0, r7
 8012cd4:	e0000398 	bsr      	0x8013404	// 8013404 <Get_INA226_All_Value>
		if(1 == Show_Flage)
 8012cd8:	d86a0000 	ld.b      	r3, (r10, 0x0)
 8012cdc:	e903fff2 	bez      	r3, 0x8012cc0	// 8012cc0 <main+0x78>
			Write_Flash(&INA226_Value);
 8012ce0:	6c1f      	mov      	r0, r7
 8012ce2:	e3fffee9 	bsr      	0x8012ab4	// 8012ab4 <Write_Flash>
			OLED_Show(&INA226_Value);
 8012ce6:	6c1f      	mov      	r0, r7
 8012ce8:	e3ffff2a 	bsr      	0x8012b3c	// 8012b3c <OLED_Show>
			Show_Flage = 0;
 8012cec:	dcca0000 	st.b      	r6, (r10, 0x0)
			printf("%f %f  %f  %f  %f  %f mAh  %f mW\r\n",INA226_Value.Bus_V, INA226_Value.Shunt_V, INA226_Value.Current, INA226_Value.Power,INA226_Value.Power_All,INA226_Value.mAh,INA226_Value.Wh);
 8012cf0:	f4042010 	flds      	fr0, (r4, 0x4)
 8012cf4:	e3fff00c 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012cf8:	f4042000 	flds      	fr0, (r4, 0x0)
 8012cfc:	6e43      	mov      	r9, r0
 8012cfe:	c4014830 	lsli      	r16, r1, 0
 8012d02:	e3fff005 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d06:	f40420a0 	flds      	fr0, (r4, 0x28)
 8012d0a:	6e03      	mov      	r8, r0
 8012d0c:	c4014831 	lsli      	r17, r1, 0
 8012d10:	e3ffeffe 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d14:	f4042090 	flds      	fr0, (r4, 0x24)
 8012d18:	b809      	st.w      	r0, (r14, 0x24)
 8012d1a:	b82a      	st.w      	r1, (r14, 0x28)
 8012d1c:	e3ffeff8 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d20:	f4042080 	flds      	fr0, (r4, 0x20)
 8012d24:	b807      	st.w      	r0, (r14, 0x1c)
 8012d26:	b828      	st.w      	r1, (r14, 0x20)
 8012d28:	e3ffeff2 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d2c:	f4042030 	flds      	fr0, (r4, 0xc)
 8012d30:	b805      	st.w      	r0, (r14, 0x14)
 8012d32:	b826      	st.w      	r1, (r14, 0x18)
 8012d34:	e3ffefec 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d38:	f4042020 	flds      	fr0, (r4, 0x8)
 8012d3c:	b803      	st.w      	r0, (r14, 0xc)
 8012d3e:	b824      	st.w      	r1, (r14, 0x10)
 8012d40:	e3ffefe6 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 8012d44:	b801      	st.w      	r0, (r14, 0x4)
 8012d46:	b822      	st.w      	r1, (r14, 0x8)
 8012d48:	6ce7      	mov      	r3, r9
 8012d4a:	de0e2000 	st.w      	r16, (r14, 0x0)
 8012d4e:	6c63      	mov      	r1, r8
 8012d50:	c4114822 	lsli      	r2, r17, 0
 8012d54:	980b      	ld.w      	r0, (r14, 0x2c)
 8012d56:	e0001233 	bsr      	0x80151bc	// 80151bc <wm_printf>
		if(1 == key_flag)
 8012d5a:	8560      	ld.b      	r3, (r5, 0x0)
 8012d5c:	3b41      	cmpnei      	r3, 1
 8012d5e:	0bb4      	bt      	0x8012cc6	// 8012cc6 <main+0x7e>
			INA226_Value.Time.All_Sec = 0;
 8012d60:	3200      	movi      	r2, 0
 8012d62:	3300      	movi      	r3, 0
 8012d64:	b445      	st.w      	r2, (r4, 0x14)
 8012d66:	b466      	st.w      	r3, (r4, 0x18)
			INA226_Value.Time.Hour = 0;
 8012d68:	a4dc      	st.b      	r6, (r4, 0x1c)
			INA226_Value.Time.Min = 0;
 8012d6a:	a4dd      	st.b      	r6, (r4, 0x1d)
			INA226_Value.Time.Sec = 0;
 8012d6c:	a4de      	st.b      	r6, (r4, 0x1e)
			INA226_Value.Power_All = 0;
 8012d6e:	dd642008 	st.w      	r11, (r4, 0x20)
			INA226_Value.mAh = 0;
 8012d72:	dd642009 	st.w      	r11, (r4, 0x24)
			key_flag = 0;
 8012d76:	a5c0      	st.b      	r6, (r5, 0x0)
 8012d78:	07aa      	br      	0x8012ccc	// 8012ccc <main+0x84>
			key_flag = 0;
 8012d7a:	a5c0      	st.b      	r6, (r5, 0x0)
 8012d7c:	07a8      	br      	0x8012ccc	// 8012ccc <main+0x84>
 8012d7e:	0000      	.short	0x0000
 8012d80:	08015424 	.long	0x08015424
 8012d84:	2000321c 	.long	0x2000321c
 8012d88:	20002c84 	.long	0x20002c84
 8012d8c:	08015430 	.long	0x08015430
 8012d90:	20000160 	.long	0x20000160
 8012d94:	20002c81 	.long	0x20002c81

08012d98 <HAL_TIM_Callback>:



//可以理解成定时器服务函数
void HAL_TIM_Callback(TIM_HandleTypeDef *htim)
{
 8012d98:	1426      	subi      	r14, r14, 24
 8012d9a:	b880      	st.w      	r4, (r14, 0x0)
 8012d9c:	b8a1      	st.w      	r5, (r14, 0x4)
 8012d9e:	b8c2      	st.w      	r6, (r14, 0x8)
 8012da0:	dd0e2003 	st.w      	r8, (r14, 0xc)
 8012da4:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8012da8:	ddee2005 	st.w      	r15, (r14, 0x14)

	//static int8_t adc_num = 1;
	//static bool adc_flage = 1;
	static uint8_t time_num = 0;
	
	if (htim->Instance == TIM1)
 8012dac:	90a0      	ld.w      	r5, (r0, 0x0)
 8012dae:	3d41      	cmpnei      	r5, 1
 8012db0:	0c70      	bf      	0x8012e90	// 8012e90 <HAL_TIM_Callback+0xf8>
		INA226_Value.Time.All_Sec++;
		INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
		INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
		INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
	}
	else if (htim->Instance == TIM0)
 8012db2:	e9250033 	bnez      	r5, 0x8012e18	// 8012e18 <HAL_TIM_Callback+0x80>
	{	
		time_num++;
 8012db6:	12cf      	lrw      	r6, 0x20002c80	// 8012ef0 <HAL_TIM_Callback+0x158>
		
		if(time_num >= 10)
 8012db8:	3209      	movi      	r2, 9
		time_num++;
 8012dba:	8660      	ld.b      	r3, (r6, 0x0)
 8012dbc:	2300      	addi      	r3, 1
 8012dbe:	74cc      	zextb      	r3, r3
		if(time_num >= 10)
 8012dc0:	64c8      	cmphs      	r2, r3
		time_num++;
 8012dc2:	a660      	st.b      	r3, (r6, 0x0)
		if(time_num >= 10)
 8012dc4:	0c35      	bf      	0x8012e2e	// 8012e2e <HAL_TIM_Callback+0x96>
 8012dc6:	128c      	lrw      	r4, 0x2000321c	// 8012ef4 <HAL_TIM_Callback+0x15c>
			INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
			INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
			INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
			time_num = 0;
		}
		if(INA226_Value.Current > 1)
 8012dc8:	ea233f80 	movih      	r3, 16256
 8012dcc:	f4042021 	flds      	fr1, (r4, 0x8)
 8012dd0:	f4031b60 	fmtvrl      	fr0, r3
 8012dd4:	f42001a0 	fcmplts      	fr0, fr1
 8012dd8:	0c20      	bf      	0x8012e18	// 8012e18 <HAL_TIM_Callback+0x80>
		{//计算时间
		
			//INA226_Value.Power_All += INA226_Value.Power;
			
			INA226_Value.mAh = INA226_Value.Current/ (3600*10) + INA226_Value.mAh;
 8012dda:	1268      	lrw      	r3, 0x470ca000	// 8012ef8 <HAL_TIM_Callback+0x160>
 8012ddc:	f4031b63 	fmtvrl      	fr3, r3
 8012de0:	f4042090 	flds      	fr0, (r4, 0x24)
 8012de4:	f4610302 	fdivs      	fr2, fr1, fr3
 8012de8:	f4020002 	fadds      	fr2, fr2, fr0
			
			INA226_Value.Wh += (INA226_Value.Current / 1000) * (INA226_Value.Bus_V / 1000) / (3600*10);
 8012dec:	ea23447a 	movih      	r3, 17530
			INA226_Value.mAh = INA226_Value.Current/ (3600*10) + INA226_Value.mAh;
 8012df0:	f4042492 	fsts      	fr2, (r4, 0x24)
			INA226_Value.Wh += (INA226_Value.Current / 1000) * (INA226_Value.Bus_V / 1000) / (3600*10);
 8012df4:	f4042000 	flds      	fr0, (r4, 0x0)
 8012df8:	f4031b62 	fmtvrl      	fr2, r3
 8012dfc:	f4410301 	fdivs      	fr1, fr1, fr2
 8012e00:	f4400300 	fdivs      	fr0, fr0, fr2
 8012e04:	f4200200 	fmuls      	fr0, fr0, fr1
 8012e08:	f4600300 	fdivs      	fr0, fr0, fr3
 8012e0c:	f40420a1 	flds      	fr1, (r4, 0x28)
 8012e10:	f4200000 	fadds      	fr0, fr0, fr1
 8012e14:	f40424a0 	fsts      	fr0, (r4, 0x28)
		}
	}

	
}
 8012e18:	d9ee2005 	ld.w      	r15, (r14, 0x14)
 8012e1c:	d92e2004 	ld.w      	r9, (r14, 0x10)
 8012e20:	d90e2003 	ld.w      	r8, (r14, 0xc)
 8012e24:	98c2      	ld.w      	r6, (r14, 0x8)
 8012e26:	98a1      	ld.w      	r5, (r14, 0x4)
 8012e28:	9880      	ld.w      	r4, (r14, 0x0)
 8012e2a:	1406      	addi      	r14, r14, 24
 8012e2c:	783c      	jmp      	r15
			INA226_Value.Time.All_Sec++;
 8012e2e:	1192      	lrw      	r4, 0x2000321c	// 8012ef4 <HAL_TIM_Callback+0x15c>
			Show_Flage = 1;
 8012e30:	1173      	lrw      	r3, 0x20000160	// 8012efc <HAL_TIM_Callback+0x164>
 8012e32:	3201      	movi      	r2, 1
			INA226_Value.Time.All_Sec++;
 8012e34:	d9042005 	ld.w      	r8, (r4, 0x14)
 8012e38:	d9242006 	ld.w      	r9, (r4, 0x18)
 8012e3c:	e5080000 	addi      	r8, r8, 1
 8012e40:	eb480000 	cmpnei      	r8, 0
 8012e44:	c5290c21 	incf      	r9, r9, 1
			Show_Flage = 1;
 8012e48:	a340      	st.b      	r2, (r3, 0x0)
			INA226_Value.Time.All_Sec++;
 8012e4a:	dd042005 	st.w      	r8, (r4, 0x14)
 8012e4e:	dd242006 	st.w      	r9, (r4, 0x18)
			INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
 8012e52:	ea020e10 	movi      	r2, 3600
 8012e56:	3300      	movi      	r3, 0
 8012e58:	6c23      	mov      	r0, r8
 8012e5a:	6c67      	mov      	r1, r9
 8012e5c:	e3ffec2c 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012e60:	a41c      	st.b      	r0, (r4, 0x1c)
			INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
 8012e62:	ea020e10 	movi      	r2, 3600
 8012e66:	3300      	movi      	r3, 0
 8012e68:	6c23      	mov      	r0, r8
 8012e6a:	6c67      	mov      	r1, r9
 8012e6c:	e3ffedbe 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8012e70:	323c      	movi      	r2, 60
 8012e72:	3300      	movi      	r3, 0
 8012e74:	6e03      	mov      	r8, r0
 8012e76:	6e47      	mov      	r9, r1
 8012e78:	e3ffec1e 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012e7c:	a41d      	st.b      	r0, (r4, 0x1d)
			INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
 8012e7e:	323c      	movi      	r2, 60
 8012e80:	3300      	movi      	r3, 0
 8012e82:	6c23      	mov      	r0, r8
 8012e84:	6c67      	mov      	r1, r9
 8012e86:	e3ffedb1 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8012e8a:	a41e      	st.b      	r0, (r4, 0x1e)
			time_num = 0;
 8012e8c:	a6a0      	st.b      	r5, (r6, 0x0)
 8012e8e:	079d      	br      	0x8012dc8	// 8012dc8 <HAL_TIM_Callback+0x30>
		INA226_Value.Time.All_Sec++;
 8012e90:	1099      	lrw      	r4, 0x2000321c	// 8012ef4 <HAL_TIM_Callback+0x15c>
		Show_Flage = 1;
 8012e92:	107b      	lrw      	r3, 0x20000160	// 8012efc <HAL_TIM_Callback+0x164>
		INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
 8012e94:	ea020e10 	movi      	r2, 3600
		INA226_Value.Time.All_Sec++;
 8012e98:	d9042005 	ld.w      	r8, (r4, 0x14)
 8012e9c:	d9242006 	ld.w      	r9, (r4, 0x18)
 8012ea0:	e5080000 	addi      	r8, r8, 1
 8012ea4:	eb480000 	cmpnei      	r8, 0
 8012ea8:	c5290c21 	incf      	r9, r9, 1
		Show_Flage = 1;
 8012eac:	a3a0      	st.b      	r5, (r3, 0x0)
		INA226_Value.Time.All_Sec++;
 8012eae:	dd042005 	st.w      	r8, (r4, 0x14)
 8012eb2:	dd242006 	st.w      	r9, (r4, 0x18)
		INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
 8012eb6:	3300      	movi      	r3, 0
 8012eb8:	6c23      	mov      	r0, r8
 8012eba:	6c67      	mov      	r1, r9
 8012ebc:	e3ffebfc 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012ec0:	a41c      	st.b      	r0, (r4, 0x1c)
		INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
 8012ec2:	ea020e10 	movi      	r2, 3600
 8012ec6:	3300      	movi      	r3, 0
 8012ec8:	6c23      	mov      	r0, r8
 8012eca:	6c67      	mov      	r1, r9
 8012ecc:	e3ffed8e 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8012ed0:	323c      	movi      	r2, 60
 8012ed2:	3300      	movi      	r3, 0
 8012ed4:	6e03      	mov      	r8, r0
 8012ed6:	6e47      	mov      	r9, r1
 8012ed8:	e3ffebee 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8012edc:	a41d      	st.b      	r0, (r4, 0x1d)
		INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
 8012ede:	323c      	movi      	r2, 60
 8012ee0:	3300      	movi      	r3, 0
 8012ee2:	6c23      	mov      	r0, r8
 8012ee4:	6c67      	mov      	r1, r9
 8012ee6:	e3ffed81 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8012eea:	a41e      	st.b      	r0, (r4, 0x1e)
 8012eec:	0796      	br      	0x8012e18	// 8012e18 <HAL_TIM_Callback+0x80>
 8012eee:	0000      	.short	0x0000
 8012ef0:	20002c80 	.long	0x20002c80
 8012ef4:	2000321c 	.long	0x2000321c
 8012ef8:	470ca000 	.long	0x470ca000
 8012efc:	20000160 	.long	0x20000160

08012f00 <HAL_MspInit>:
#include "wm_hal.h"

void HAL_MspInit(void)
{

}
 8012f00:	783c      	jmp      	r15
	...

08012f04 <HAL_TIM_Base_MspInit>:
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2);
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_3);
}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* htim_base)
{
 8012f04:	14d0      	push      	r15
	__HAL_RCC_TIM_CLK_ENABLE();
 8012f06:	ea224000 	movih      	r2, 16384
 8012f0a:	e4420dff 	addi      	r2, r2, 3584
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 8012f0e:	3100      	movi      	r1, 0
	__HAL_RCC_TIM_CLK_ENABLE();
 8012f10:	9260      	ld.w      	r3, (r2, 0x0)
 8012f12:	ec630400 	ori      	r3, r3, 1024
 8012f16:	b260      	st.w      	r3, (r2, 0x0)
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 8012f18:	301e      	movi      	r0, 30
 8012f1a:	e3fff821 	bsr      	0x8011f5c	// 8011f5c <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(TIM_IRQn);
 8012f1e:	301e      	movi      	r0, 30
 8012f20:	e3fff838 	bsr      	0x8011f90	// 8011f90 <HAL_NVIC_EnableIRQ>
}
 8012f24:	1490      	pop      	r15
	...

08012f28 <HAL_ADC_MspInit>:
	HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5);
}


void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
 8012f28:	14d0      	push      	r15
	if (hadc->Instance == ADC)
 8012f2a:	9040      	ld.w      	r2, (r0, 0x0)
 8012f2c:	ea234001 	movih      	r3, 16385
 8012f30:	3ba9      	bseti      	r3, 9
 8012f32:	64ca      	cmpne      	r2, r3
 8012f34:	0c02      	bf      	0x8012f38	// 8012f38 <HAL_ADC_MspInit+0x10>
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
		HAL_NVIC_EnableIRQ(ADC_IRQn);
	}
}
 8012f36:	1490      	pop      	r15
		__HAL_RCC_ADC_CLK_ENABLE();
 8012f38:	ea234000 	movih      	r3, 16384
 8012f3c:	e4630dff 	addi      	r3, r3, 3584
 8012f40:	9340      	ld.w      	r2, (r3, 0x0)
 8012f42:	ec421000 	ori      	r2, r2, 4096
 8012f46:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_RCC_GPIO_CLK_ENABLE();
 8012f48:	9340      	ld.w      	r2, (r3, 0x0)
 8012f4a:	ec420800 	ori      	r2, r2, 2048
 8012f4e:	b340      	st.w      	r2, (r3, 0x0)
		if (hadc->Init.channel == ADC_CHANNEL_0)
 8012f50:	9061      	ld.w      	r3, (r0, 0x4)
 8012f52:	e903002d 	bez      	r3, 0x8012fac	// 8012fac <HAL_ADC_MspInit+0x84>
		else if (hadc->Init.channel == ADC_CHANNEL_1)
 8012f56:	eb430100 	cmpnei      	r3, 256
 8012f5a:	0c41      	bf      	0x8012fdc	// 8012fdc <HAL_ADC_MspInit+0xb4>
		else if (hadc->Init.channel == ADC_CHANNEL_2)
 8012f5c:	eb430200 	cmpnei      	r3, 512
 8012f60:	0c4d      	bf      	0x8012ffa	// 8012ffa <HAL_ADC_MspInit+0xd2>
		else if (hadc->Init.channel == ADC_CHANNEL_3)
 8012f62:	eb430300 	cmpnei      	r3, 768
 8012f66:	0c39      	bf      	0x8012fd8	// 8012fd8 <HAL_ADC_MspInit+0xb0>
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
 8012f68:	eb430800 	cmpnei      	r3, 2048
 8012f6c:	0c56      	bf      	0x8013018	// 8013018 <HAL_ADC_MspInit+0xf0>
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
 8012f6e:	eb430900 	cmpnei      	r3, 2304
 8012f72:	082b      	bt      	0x8012fc8	// 8012fc8 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8012f74:	1171      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
 8012f76:	9344      	ld.w      	r2, (r3, 0x10)
 8012f78:	3a83      	bclri      	r2, 3
 8012f7a:	b344      	st.w      	r2, (r3, 0x10)
 8012f7c:	9342      	ld.w      	r2, (r3, 0x8)
 8012f7e:	3a83      	bclri      	r2, 3
 8012f80:	b342      	st.w      	r2, (r3, 0x8)
 8012f82:	9343      	ld.w      	r2, (r3, 0xc)
 8012f84:	ec420008 	ori      	r2, r2, 8
 8012f88:	b343      	st.w      	r2, (r3, 0xc)
 8012f8a:	9347      	ld.w      	r2, (r3, 0x1c)
 8012f8c:	3a83      	bclri      	r2, 3
 8012f8e:	b347      	st.w      	r2, (r3, 0x1c)
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8012f90:	9344      	ld.w      	r2, (r3, 0x10)
 8012f92:	3a82      	bclri      	r2, 2
 8012f94:	b344      	st.w      	r2, (r3, 0x10)
 8012f96:	9342      	ld.w      	r2, (r3, 0x8)
 8012f98:	3a82      	bclri      	r2, 2
 8012f9a:	b342      	st.w      	r2, (r3, 0x8)
 8012f9c:	9343      	ld.w      	r2, (r3, 0xc)
 8012f9e:	ec420004 	ori      	r2, r2, 4
 8012fa2:	b343      	st.w      	r2, (r3, 0xc)
 8012fa4:	9347      	ld.w      	r2, (r3, 0x1c)
 8012fa6:	3a82      	bclri      	r2, 2
 8012fa8:	b347      	st.w      	r2, (r3, 0x1c)
 8012faa:	040f      	br      	0x8012fc8	// 8012fc8 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8012fac:	1163      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
 8012fae:	9344      	ld.w      	r2, (r3, 0x10)
 8012fb0:	3a81      	bclri      	r2, 1
 8012fb2:	b344      	st.w      	r2, (r3, 0x10)
 8012fb4:	9342      	ld.w      	r2, (r3, 0x8)
 8012fb6:	3a81      	bclri      	r2, 1
 8012fb8:	b342      	st.w      	r2, (r3, 0x8)
 8012fba:	9343      	ld.w      	r2, (r3, 0xc)
 8012fbc:	ec420002 	ori      	r2, r2, 2
 8012fc0:	b343      	st.w      	r2, (r3, 0xc)
 8012fc2:	9347      	ld.w      	r2, (r3, 0x1c)
 8012fc4:	3a81      	bclri      	r2, 1
 8012fc6:	b347      	st.w      	r2, (r3, 0x1c)
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
 8012fc8:	3100      	movi      	r1, 0
 8012fca:	300b      	movi      	r0, 11
 8012fcc:	e3fff7c8 	bsr      	0x8011f5c	// 8011f5c <HAL_NVIC_SetPriority>
		HAL_NVIC_EnableIRQ(ADC_IRQn);
 8012fd0:	300b      	movi      	r0, 11
 8012fd2:	e3fff7df 	bsr      	0x8011f90	// 8011f90 <HAL_NVIC_EnableIRQ>
}
 8012fd6:	1490      	pop      	r15
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8012fd8:	1078      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
 8012fda:	07db      	br      	0x8012f90	// 8012f90 <HAL_ADC_MspInit+0x68>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8012fdc:	1077      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8012fde:	9344      	ld.w      	r2, (r3, 0x10)
 8012fe0:	3a84      	bclri      	r2, 4
 8012fe2:	b344      	st.w      	r2, (r3, 0x10)
 8012fe4:	9342      	ld.w      	r2, (r3, 0x8)
 8012fe6:	3a84      	bclri      	r2, 4
 8012fe8:	b342      	st.w      	r2, (r3, 0x8)
 8012fea:	9343      	ld.w      	r2, (r3, 0xc)
 8012fec:	ec420010 	ori      	r2, r2, 16
 8012ff0:	b343      	st.w      	r2, (r3, 0xc)
 8012ff2:	9347      	ld.w      	r2, (r3, 0x1c)
 8012ff4:	3a84      	bclri      	r2, 4
 8012ff6:	b347      	st.w      	r2, (r3, 0x1c)
 8012ff8:	07e8      	br      	0x8012fc8	// 8012fc8 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8012ffa:	1070      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
 8012ffc:	9344      	ld.w      	r2, (r3, 0x10)
 8012ffe:	3a83      	bclri      	r2, 3
 8013000:	b344      	st.w      	r2, (r3, 0x10)
 8013002:	9342      	ld.w      	r2, (r3, 0x8)
 8013004:	3a83      	bclri      	r2, 3
 8013006:	b342      	st.w      	r2, (r3, 0x8)
 8013008:	9343      	ld.w      	r2, (r3, 0xc)
 801300a:	ec420008 	ori      	r2, r2, 8
 801300e:	b343      	st.w      	r2, (r3, 0xc)
 8013010:	9347      	ld.w      	r2, (r3, 0x1c)
 8013012:	3a83      	bclri      	r2, 3
 8013014:	b347      	st.w      	r2, (r3, 0x1c)
 8013016:	07d9      	br      	0x8012fc8	// 8012fc8 <HAL_ADC_MspInit+0xa0>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8013018:	1068      	lrw      	r3, 0x40011200	// 8013038 <HAL_ADC_MspInit+0x110>
 801301a:	9344      	ld.w      	r2, (r3, 0x10)
 801301c:	3a81      	bclri      	r2, 1
 801301e:	b344      	st.w      	r2, (r3, 0x10)
 8013020:	9342      	ld.w      	r2, (r3, 0x8)
 8013022:	3a81      	bclri      	r2, 1
 8013024:	b342      	st.w      	r2, (r3, 0x8)
 8013026:	9343      	ld.w      	r2, (r3, 0xc)
 8013028:	ec420002 	ori      	r2, r2, 2
 801302c:	b343      	st.w      	r2, (r3, 0xc)
 801302e:	9347      	ld.w      	r2, (r3, 0x1c)
 8013030:	3a81      	bclri      	r2, 1
 8013032:	b347      	st.w      	r2, (r3, 0x1c)
 8013034:	07d5      	br      	0x8012fde	// 8012fde <HAL_ADC_MspInit+0xb6>
 8013036:	0000      	.short	0x0000
 8013038:	40011200 	.long	0x40011200

0801303c <CORET_IRQHandler>:

#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
 801303c:	1460      	nie
 801303e:	1462      	ipush
 8013040:	142e      	subi      	r14, r14, 56
 8013042:	d64e1c2d 	stm      	r18-r31, (r14)
 8013046:	1428      	subi      	r14, r14, 32
 8013048:	f4ee3400 	fstms      	fr0-fr7, (r14)
 801304c:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 801304e:	1068      	lrw      	r3, 0xe000e000	// 801306c <CORET_IRQHandler+0x30>
 8013050:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8013052:	e3fff76b 	bsr      	0x8011f28	// 8011f28 <HAL_IncTick>
}
 8013056:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801305a:	1401      	addi      	r14, r14, 4
 801305c:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8013060:	1408      	addi      	r14, r14, 32
 8013062:	d24e1c2d 	ldm      	r18-r31, (r14)
 8013066:	140e      	addi      	r14, r14, 56
 8013068:	1463      	ipop
 801306a:	1461      	nir
 801306c:	e000e000 	.long	0xe000e000

08013070 <GPIOA_IRQHandler>:

__attribute__((isr)) void GPIOA_IRQHandler(void)
{
 8013070:	1460      	nie
 8013072:	1462      	ipush
 8013074:	142e      	subi      	r14, r14, 56
 8013076:	d64e1c2d 	stm      	r18-r31, (r14)
 801307a:	1428      	subi      	r14, r14, 32
 801307c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 	//HAL_GPIO_EXTI_IRQHandler(GPIOA, GPIO_PIN_0);
}
 8013080:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8013084:	1408      	addi      	r14, r14, 32
 8013086:	d24e1c2d 	ldm      	r18-r31, (r14)
 801308a:	140e      	addi      	r14, r14, 56
 801308c:	1463      	ipop
 801308e:	1461      	nir

08013090 <GPIOB_IRQHandler>:

__attribute__((isr)) void GPIOB_IRQHandler(void)
{
 8013090:	1460      	nie
 8013092:	1462      	ipush
 8013094:	142e      	subi      	r14, r14, 56
 8013096:	d64e1c2d 	stm      	r18-r31, (r14)
 801309a:	1428      	subi      	r14, r14, 32
 801309c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80130a0:	14d0      	push      	r15
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_18);
 80130a2:	ea210004 	movih      	r1, 4
 80130a6:	100a      	lrw      	r0, 0x40011400	// 80130cc <GPIOB_IRQHandler+0x3c>
 80130a8:	e3fff6b4 	bsr      	0x8011e10	// 8011e10 <HAL_GPIO_EXTI_IRQHandler>
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_26);
 80130ac:	ea210400 	movih      	r1, 1024
 80130b0:	1007      	lrw      	r0, 0x40011400	// 80130cc <GPIOB_IRQHandler+0x3c>
 80130b2:	e3fff6af 	bsr      	0x8011e10	// 8011e10 <HAL_GPIO_EXTI_IRQHandler>
}
 80130b6:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80130ba:	1401      	addi      	r14, r14, 4
 80130bc:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80130c0:	1408      	addi      	r14, r14, 32
 80130c2:	d24e1c2d 	ldm      	r18-r31, (r14)
 80130c6:	140e      	addi      	r14, r14, 56
 80130c8:	1463      	ipop
 80130ca:	1461      	nir
 80130cc:	40011400 	.long	0x40011400

080130d0 <TIM0_5_IRQHandler>:


extern TIM_HandleTypeDef htim[6];

__attribute__((isr)) void TIM0_5_IRQHandler(void)
{
 80130d0:	1460      	nie
 80130d2:	1462      	ipush
 80130d4:	142e      	subi      	r14, r14, 56
 80130d6:	d64e1c2d 	stm      	r18-r31, (r14)
 80130da:	1428      	subi      	r14, r14, 32
 80130dc:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80130e0:	14d1      	push      	r4, r15
	HAL_TIM_IRQHandler(&htim[0]);
 80130e2:	108b      	lrw      	r4, 0x20002c84	// 801310c <TIM0_5_IRQHandler+0x3c>
 80130e4:	6c13      	mov      	r0, r4
 80130e6:	e3fff7cf 	bsr      	0x8012084	// 8012084 <HAL_TIM_IRQHandler>
	HAL_TIM_IRQHandler(&htim[1]);
 80130ea:	e4040017 	addi      	r0, r4, 24
 80130ee:	e3fff7cb 	bsr      	0x8012084	// 8012084 <HAL_TIM_IRQHandler>
}
 80130f2:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 80130f6:	9880      	ld.w      	r4, (r14, 0x0)
 80130f8:	1402      	addi      	r14, r14, 8
 80130fa:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80130fe:	1408      	addi      	r14, r14, 32
 8013100:	d24e1c2d 	ldm      	r18-r31, (r14)
 8013104:	140e      	addi      	r14, r14, 56
 8013106:	1463      	ipop
 8013108:	1461      	nir
 801310a:	0000      	.short	0x0000
 801310c:	20002c84 	.long	0x20002c84

08013110 <ADC_IRQHandler>:

extern ADC_HandleTypeDef hadc[6];

__attribute__((isr)) void ADC_IRQHandler(void)
{
 8013110:	1460      	nie
 8013112:	1462      	ipush
 8013114:	142e      	subi      	r14, r14, 56
 8013116:	d64e1c2d 	stm      	r18-r31, (r14)
 801311a:	1428      	subi      	r14, r14, 32
 801311c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8013120:	14d1      	push      	r4, r15
 	HAL_ADC_IRQHandler(&hadc[1]);
 8013122:	108b      	lrw      	r4, 0x20003264	// 801314c <ADC_IRQHandler+0x3c>
 8013124:	6c13      	mov      	r0, r4
 8013126:	e3fff9eb 	bsr      	0x80124fc	// 80124fc <HAL_ADC_IRQHandler>
	HAL_ADC_IRQHandler(&hadc[5]);
 801312a:	e404006f 	addi      	r0, r4, 112
 801312e:	e3fff9e7 	bsr      	0x80124fc	// 80124fc <HAL_ADC_IRQHandler>
 8013132:	d9ee2001 	ld.w      	r15, (r14, 0x4)
 8013136:	9880      	ld.w      	r4, (r14, 0x0)
 8013138:	1402      	addi      	r14, r14, 8
 801313a:	f4ee3000 	fldms      	fr0-fr7, (r14)
 801313e:	1408      	addi      	r14, r14, 32
 8013140:	d24e1c2d 	ldm      	r18-r31, (r14)
 8013144:	140e      	addi      	r14, r14, 56
 8013146:	1463      	ipop
 8013148:	1461      	nir
 801314a:	0000      	.short	0x0000
 801314c:	20003264 	.long	0x20003264

08013150 <Error_Handler_Adc>:
#include "adc.h"
 


void Error_Handler_Adc(void)
{
 8013150:	14d1      	push      	r4, r15
	while (1)
	{
		printf("Error_Handler adc\r\n");
 8013152:	1083      	lrw      	r4, 0x8015518	// 801315c <Error_Handler_Adc+0xc>
 8013154:	6c13      	mov      	r0, r4
 8013156:	e3fff4cb 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 801315a:	07fd      	br      	0x8013154	// 8013154 <Error_Handler_Adc+0x4>
 801315c:	08015518 	.long	0x08015518

08013160 <ADC_Init>:
	}
}


void ADC_Init(uint32_t adc_num, uint32_t freq)
{
 8013160:	14d0      	push      	r15
	#define ADC_CHANNEL_OFFSET	ADC_ANA_CR_CH_OFFSET
*/

	uint32_t ADC_CHANNEL;
	 /* 307hz ~ 2khz */
	switch(adc_num)
 8013162:	3805      	cmphsi      	r0, 6
 8013164:	082a      	bt      	0x80131b8	// 80131b8 <ADC_Init+0x58>
 8013166:	1063      	lrw      	r3, 0x80154b4	// 8013170 <ADC_Init+0x10>
 8013168:	d0030883 	ldr.w      	r3, (r3, r0 << 2)
 801316c:	780c      	jmp      	r3
 801316e:	0000      	.short	0x0000
 8013170:	080154b4 	.long	0x080154b4
	{
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
 8013174:	ea020200 	movi      	r2, 512
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
	}
	
	hadc[adc_num].Instance = ADC;
 8013178:	1073      	lrw      	r3, 0x20003248	// 80131c4 <ADC_Init+0x64>
 801317a:	ea0c001c 	movi      	r12, 28
 801317e:	7c30      	mult      	r0, r12
 8013180:	ea2c4001 	movih      	r12, 16385
 8013184:	c52c284c 	bseti      	r12, r12, 9
 8013188:	d403082c 	str.w      	r12, (r3, r0 << 0)
	hadc[adc_num].Init.channel = ADC_CHANNEL;
 801318c:	600c      	addu      	r0, r3
 801318e:	b041      	st.w      	r2, (r0, 0x4)
	hadc[adc_num].Init.freq = freq;
 8013190:	b022      	st.w      	r1, (r0, 0x8)
	
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
 8013192:	e3fff945 	bsr      	0x801241c	// 801241c <HAL_ADC_Init>
 8013196:	e9200015 	bnez      	r0, 0x80131c0	// 80131c0 <ADC_Init+0x60>
	{
		Error_Handler_Adc();
	}
}
 801319a:	1490      	pop      	r15
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
 801319c:	ea020300 	movi      	r2, 768
 80131a0:	07ec      	br      	0x8013178	// 8013178 <ADC_Init+0x18>
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
 80131a2:	ea020c00 	movi      	r2, 3072
 80131a6:	07e9      	br      	0x8013178	// 8013178 <ADC_Init+0x18>
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
 80131a8:	ea020d00 	movi      	r2, 3328
 80131ac:	07e6      	br      	0x8013178	// 8013178 <ADC_Init+0x18>
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
 80131ae:	6c83      	mov      	r2, r0
 80131b0:	07e4      	br      	0x8013178	// 8013178 <ADC_Init+0x18>
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
 80131b2:	ea020100 	movi      	r2, 256
 80131b6:	07e1      	br      	0x8013178	// 8013178 <ADC_Init+0x18>
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
 80131b8:	1004      	lrw      	r0, 0x80154cc	// 80131c8 <ADC_Init+0x68>
 80131ba:	e3fff499 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 80131be:	1490      	pop      	r15
		Error_Handler_Adc();
 80131c0:	e3ffffc8 	bsr      	0x8013150	// 8013150 <Error_Handler_Adc>
 80131c4:	20003248 	.long	0x20003248
 80131c8:	080154cc 	.long	0x080154cc

080131cc <HAL_ADC_ConvCpltCallback>:

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}
 80131cc:	783c      	jmp      	r15
	...

080131d0 <GPIO_Init>:
//KEY
volatile uint8_t key_flag = 0;


void GPIO_Init(void)
{
 80131d0:	14d1      	push      	r4, r15
 80131d2:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	__HAL_RCC_GPIO_CLK_ENABLE();
 80131d4:	ea224000 	movih      	r2, 16384
 80131d8:	e4420dff 	addi      	r2, r2, 3584
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 80131dc:	3400      	movi      	r4, 0
 80131de:	b880      	st.w      	r4, (r14, 0x0)
 80131e0:	b881      	st.w      	r4, (r14, 0x4)
 80131e2:	b882      	st.w      	r4, (r14, 0x8)
	__HAL_RCC_GPIO_CLK_ENABLE();
 80131e4:	9260      	ld.w      	r3, (r2, 0x0)
 80131e6:	ec630800 	ori      	r3, r3, 2048
 80131ea:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	*/
	
	GPIO_InitStruct.Pin = GPIO_PIN_18 | GPIO_PIN_26;
 80131ec:	ea230404 	movih      	r3, 1028
 80131f0:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
 80131f2:	3388      	movi      	r3, 136
 80131f4:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80131f6:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80131f8:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80131fa:	1007      	lrw      	r0, 0x40011400	// 8013214 <GPIO_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 80131fc:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80131fe:	e3fff515 	bsr      	0x8011c28	// 8011c28 <HAL_GPIO_Init>
	
	
	HAL_NVIC_SetPriority(GPIOB_IRQn,0);
 8013202:	6c53      	mov      	r1, r4
 8013204:	300f      	movi      	r0, 15
 8013206:	e3fff6ab 	bsr      	0x8011f5c	// 8011f5c <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 801320a:	300f      	movi      	r0, 15
 801320c:	e3fff6c2 	bsr      	0x8011f90	// 8011f90 <HAL_NVIC_EnableIRQ>

}
 8013210:	1403      	addi      	r14, r14, 12
 8013212:	1491      	pop      	r4, r15
 8013214:	40011400 	.long	0x40011400

08013218 <HAL_GPIO_EXTI_Callback>:

void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_18))
 8013218:	106a      	lrw      	r3, 0x40011400	// 8013240 <HAL_GPIO_EXTI_Callback+0x28>
 801321a:	64c2      	cmpne      	r0, r3
 801321c:	0c02      	bf      	0x8013220	// 8013220 <HAL_GPIO_EXTI_Callback+0x8>
	}
	else if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_26))
	{
		key_flag = 2;
	}
}
 801321e:	783c      	jmp      	r15
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_18))
 8013220:	ea230004 	movih      	r3, 4
 8013224:	64c6      	cmpne      	r1, r3
 8013226:	0c09      	bf      	0x8013238	// 8013238 <HAL_GPIO_EXTI_Callback+0x20>
	else if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_26))
 8013228:	ea230400 	movih      	r3, 1024
 801322c:	64c6      	cmpne      	r1, r3
 801322e:	0bf8      	bt      	0x801321e	// 801321e <HAL_GPIO_EXTI_Callback+0x6>
		key_flag = 2;
 8013230:	1065      	lrw      	r3, 0x20002c81	// 8013244 <HAL_GPIO_EXTI_Callback+0x2c>
 8013232:	3202      	movi      	r2, 2
 8013234:	a340      	st.b      	r2, (r3, 0x0)
}
 8013236:	07f4      	br      	0x801321e	// 801321e <HAL_GPIO_EXTI_Callback+0x6>
		key_flag = 1;
 8013238:	1063      	lrw      	r3, 0x20002c81	// 8013244 <HAL_GPIO_EXTI_Callback+0x2c>
 801323a:	3201      	movi      	r2, 1
 801323c:	a340      	st.b      	r2, (r3, 0x0)
 801323e:	07f0      	br      	0x801321e	// 801321e <HAL_GPIO_EXTI_Callback+0x6>
 8013240:	40011400 	.long	0x40011400
 8013244:	20002c81 	.long	0x20002c81

08013248 <I2C_Init>:
#include "iic.h"

I2C_HandleTypeDef hi2c[2];

void I2C_Init(uint32_t num)
{
 8013248:	14d1      	push      	r4, r15
 801324a:	6d03      	mov      	r4, r0
	if(num == OLED_NUM)
 801324c:	e900000a 	bez      	r0, 0x8013260	// 8013260 <I2C_Init+0x18>
		printf("OLED GPIO INIT\r\n");
		hi2c[num].SCL_Port = GPIOA;
		hi2c[num].SCL_Pin = GPIO_PIN_1;
		hi2c[num].SDA_Port = GPIOA;
		hi2c[num].SDA_Pin = GPIO_PIN_4;
	}else if(num == INA226_NUM)
 8013250:	3841      	cmpnei      	r0, 1
 8013252:	0c18      	bf      	0x8013282	// 8013282 <I2C_Init+0x3a>
		hi2c[num].SCL_Pin = GPIO_PIN_14;
		hi2c[num].SDA_Port = GPIOB;
		hi2c[num].SDA_Pin = GPIO_PIN_15;
	}

	HAL_I2C_Init(&hi2c[num]);
 8013254:	1075      	lrw      	r3, 0x200032f0	// 80132a8 <I2C_Init+0x60>
 8013256:	4404      	lsli      	r0, r4, 4
 8013258:	600c      	addu      	r0, r3
 801325a:	e3fffa0d 	bsr      	0x8012674	// 8012674 <HAL_I2C_Init>
 801325e:	1491      	pop      	r4, r15
		printf("OLED GPIO INIT\r\n");
 8013260:	1013      	lrw      	r0, 0x801552c	// 80132ac <I2C_Init+0x64>
 8013262:	e3fff445 	bsr      	0x8011aec	// 8011aec <__GI_puts>
		hi2c[num].SCL_Port = GPIOA;
 8013266:	1071      	lrw      	r3, 0x200032f0	// 80132a8 <I2C_Init+0x60>
 8013268:	1052      	lrw      	r2, 0x40011200	// 80132b0 <I2C_Init+0x68>
 801326a:	b340      	st.w      	r2, (r3, 0x0)
		hi2c[num].SCL_Pin = GPIO_PIN_1;
 801326c:	3102      	movi      	r1, 2
		hi2c[num].SDA_Port = GPIOA;
 801326e:	b342      	st.w      	r2, (r3, 0x8)
		hi2c[num].SDA_Pin = GPIO_PIN_4;
 8013270:	3210      	movi      	r2, 16
		hi2c[num].SCL_Pin = GPIO_PIN_1;
 8013272:	b321      	st.w      	r1, (r3, 0x4)
		hi2c[num].SDA_Pin = GPIO_PIN_4;
 8013274:	b343      	st.w      	r2, (r3, 0xc)
	HAL_I2C_Init(&hi2c[num]);
 8013276:	4404      	lsli      	r0, r4, 4
 8013278:	106c      	lrw      	r3, 0x200032f0	// 80132a8 <I2C_Init+0x60>
 801327a:	600c      	addu      	r0, r3
 801327c:	e3fff9fc 	bsr      	0x8012674	// 8012674 <HAL_I2C_Init>
 8013280:	1491      	pop      	r4, r15
		printf("INA226 GPIO INIT\r\n");
 8013282:	100d      	lrw      	r0, 0x801553c	// 80132b4 <I2C_Init+0x6c>
 8013284:	e3fff434 	bsr      	0x8011aec	// 8011aec <__GI_puts>
		hi2c[num].SCL_Port = GPIOB;
 8013288:	1068      	lrw      	r3, 0x200032f0	// 80132a8 <I2C_Init+0x60>
 801328a:	104c      	lrw      	r2, 0x40011400	// 80132b8 <I2C_Init+0x70>
 801328c:	b344      	st.w      	r2, (r3, 0x10)
		hi2c[num].SCL_Pin = GPIO_PIN_14;
 801328e:	ea014000 	movi      	r1, 16384
		hi2c[num].SDA_Port = GPIOB;
 8013292:	b346      	st.w      	r2, (r3, 0x18)
		hi2c[num].SDA_Pin = GPIO_PIN_15;
 8013294:	ea028000 	movi      	r2, 32768
		hi2c[num].SCL_Pin = GPIO_PIN_14;
 8013298:	b325      	st.w      	r1, (r3, 0x14)
		hi2c[num].SDA_Pin = GPIO_PIN_15;
 801329a:	b347      	st.w      	r2, (r3, 0x1c)
	HAL_I2C_Init(&hi2c[num]);
 801329c:	4404      	lsli      	r0, r4, 4
 801329e:	1063      	lrw      	r3, 0x200032f0	// 80132a8 <I2C_Init+0x60>
 80132a0:	600c      	addu      	r0, r3
 80132a2:	e3fff9e9 	bsr      	0x8012674	// 8012674 <HAL_I2C_Init>
 80132a6:	1491      	pop      	r4, r15
 80132a8:	200032f0 	.long	0x200032f0
 80132ac:	0801552c 	.long	0x0801552c
 80132b0:	40011200 	.long	0x40011200
 80132b4:	0801553c 	.long	0x0801553c
 80132b8:	40011400 	.long	0x40011400

080132bc <INA226_Read2Byte>:
#include "ina226.h"
#include "iic.h"


uint16_t INA226_Read2Byte(uint8_t dev_addr, uint8_t reg_addr)
{
 80132bc:	14d0      	push      	r15
 80132be:	1422      	subi      	r14, r14, 8
	uint8_t reg_data_8[2] = {0};
 80132c0:	3300      	movi      	r3, 0
 80132c2:	dc6e1002 	st.h      	r3, (r14, 0x4)
	uint16_t reg_data_16 = 0xffff;
	uint8_t state = 0;
	state = HAL_I2C_Read(&hi2c[INA226_NUM], dev_addr, reg_addr, reg_data_8, 2);
 80132c6:	3302      	movi      	r3, 2
 80132c8:	b860      	st.w      	r3, (r14, 0x0)
 80132ca:	6c87      	mov      	r2, r1
 80132cc:	1b01      	addi      	r3, r14, 4
 80132ce:	6c43      	mov      	r1, r0
 80132d0:	1009      	lrw      	r0, 0x20003300	// 80132f4 <INA226_Read2Byte+0x38>
 80132d2:	e3fffa2b 	bsr      	0x8012728	// 8012728 <HAL_I2C_Read>
	if(state == HAL_ERROR)
 80132d6:	7400      	zextb      	r0, r0
 80132d8:	3841      	cmpnei      	r0, 1
 80132da:	0c09      	bf      	0x80132ec	// 80132ec <INA226_Read2Byte+0x30>
	{
		printf("IIC read ERROR \r\n");
	}
	reg_data_16 = reg_data_8[0];
	reg_data_16=(reg_data_16<<8)&0xFF00;
 80132dc:	d86e0004 	ld.b      	r3, (r14, 0x4)
 80132e0:	4368      	lsli      	r3, r3, 8
	reg_data_16|=reg_data_8[1];
 80132e2:	d80e0005 	ld.b      	r0, (r14, 0x5)
	return reg_data_16;
}
 80132e6:	6c0c      	or      	r0, r3
 80132e8:	1402      	addi      	r14, r14, 8
 80132ea:	1490      	pop      	r15
		printf("IIC read ERROR \r\n");
 80132ec:	1003      	lrw      	r0, 0x8015550	// 80132f8 <INA226_Read2Byte+0x3c>
 80132ee:	e3fff3ff 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 80132f2:	07f5      	br      	0x80132dc	// 80132dc <INA226_Read2Byte+0x20>
 80132f4:	20003300 	.long	0x20003300
 80132f8:	08015550 	.long	0x08015550

080132fc <INA226_Write2Byte>:

uint8_t INA226_Write2Byte(uint8_t dev_addr, uint8_t reg_addr,uint16_t reg_data)
{       
 80132fc:	14d0      	push      	r15
 80132fe:	1422      	subi      	r14, r14, 8
	uint8_t state = 0;
	uint8_t temp[2] = {0};
	temp[0] = (uint8_t)((reg_data&0xFF00)>>8);
 8013300:	4a68      	lsri      	r3, r2, 8
 8013302:	dc6e0004 	st.b      	r3, (r14, 0x4)
	temp[1] = (uint8_t)reg_data&0x00FF;
	state = HAL_I2C_Write(&hi2c[INA226_NUM], dev_addr, reg_addr, temp, 2);	
 8013306:	3302      	movi      	r3, 2
	temp[1] = (uint8_t)reg_data&0x00FF;
 8013308:	dc4e0005 	st.b      	r2, (r14, 0x5)
	state = HAL_I2C_Write(&hi2c[INA226_NUM], dev_addr, reg_addr, temp, 2);	
 801330c:	b860      	st.w      	r3, (r14, 0x0)
 801330e:	6c87      	mov      	r2, r1
 8013310:	1b01      	addi      	r3, r14, 4
 8013312:	6c43      	mov      	r1, r0
 8013314:	1008      	lrw      	r0, 0x20003300	// 8013334 <INA226_Write2Byte+0x38>
 8013316:	e3fff9d1 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	if(state == HAL_ERROR)
 801331a:	7400      	zextb      	r0, r0
 801331c:	3841      	cmpnei      	r0, 1
 801331e:	0c04      	bf      	0x8013326	// 8013326 <INA226_Write2Byte+0x2a>
	{
		printf("IIC write ERROR \r\n");
	}

	return 1;
}
 8013320:	3001      	movi      	r0, 1
 8013322:	1402      	addi      	r14, r14, 8
 8013324:	1490      	pop      	r15
		printf("IIC write ERROR \r\n");
 8013326:	1005      	lrw      	r0, 0x8015564	// 8013338 <INA226_Write2Byte+0x3c>
 8013328:	e3fff3e2 	bsr      	0x8011aec	// 8011aec <__GI_puts>
}
 801332c:	3001      	movi      	r0, 1
 801332e:	1402      	addi      	r14, r14, 8
 8013330:	1490      	pop      	r15
 8013332:	0000      	.short	0x0000
 8013334:	20003300 	.long	0x20003300
 8013338:	08015564 	.long	0x08015564

0801333c <Get_Shunt_voltage>:
	return Value;
}
 
//获取分流电压
float Get_Shunt_voltage()//mV
{
 801333c:	14d0      	push      	r15
	temp = INA226_Read2Byte(dev_addr, Shunt_V_Reg);
 801333e:	3101      	movi      	r1, 1
 8013340:	3081      	movi      	r0, 129
 8013342:	e3ffffbd 	bsr      	0x80132bc	// 80132bc <INA226_Read2Byte>
 8013346:	74c3      	sexth      	r3, r0
	if(temp&0x8000)	temp = ~(temp - 1);	
 8013348:	e9a30005 	bhsz      	r3, 0x8013352	// 8013352 <Get_Shunt_voltage+0x16>
 801334c:	3300      	movi      	r3, 0
 801334e:	60c2      	subu      	r3, r0
 8013350:	74cf      	sexth      	r3, r3
	float Value;
	Value = INA226_GetShuntVoltage(INA226_READ_ADDR)*INA226_VAL_LSB*0.001;//如需矫正电流分流参数请将这里改为2.5
 8013352:	74cd      	zexth      	r3, r3
 8013354:	f4031b60 	fmtvrl      	fr0, r3
 8013358:	ea234020 	movih      	r3, 16416
 801335c:	f4031b61 	fmtvrl      	fr1, r3
 8013360:	f4001a00 	fsitos      	fr0, fr0
 8013364:	f4200200 	fmuls      	fr0, fr0, fr1
 8013368:	e3ffecd2 	bsr      	0x8010d0c	// 8010d0c <__extendsfdf2>
 801336c:	1044      	lrw      	r2, 0xd2f1a9fc	// 801337c <Get_Shunt_voltage+0x40>
 801336e:	1065      	lrw      	r3, 0x3f50624d	// 8013380 <Get_Shunt_voltage+0x44>
 8013370:	e3ffee7c 	bsr      	0x8011068	// 8011068 <__muldf3>
 8013374:	e3fff102 	bsr      	0x8011578	// 8011578 <__truncdfsf2>
	return Value;
}
 8013378:	1490      	pop      	r15
 801337a:	0000      	.short	0x0000
 801337c:	d2f1a9fc 	.long	0xd2f1a9fc
 8013380:	3f50624d 	.long	0x3f50624d

08013384 <Get_Power>:
	return Current;
}

//获取功率= 总线电压 * 电流
float Get_Power()//W
{
 8013384:	14d0      	push      	r15
 8013386:	1421      	subi      	r14, r14, 4
 8013388:	f40e2408 	fsts      	fr8, (r14, 0x0)
 801338c:	1421      	subi      	r14, r14, 4
	temp = INA226_Read2Byte(dev_addr, Bus_V_Reg);
 801338e:	3102      	movi      	r1, 2
 8013390:	3081      	movi      	r0, 129
 8013392:	e3ffff95 	bsr      	0x80132bc	// 80132bc <INA226_Read2Byte>
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 8013396:	f4001b60 	fmtvrl      	fr0, r0
 801339a:	ea233fa0 	movih      	r3, 16288
 801339e:	f4031b68 	fmtvrl      	fr8, r3
 80133a2:	f4001a00 	fsitos      	fr0, fr0
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 80133a6:	3104      	movi      	r1, 4
 80133a8:	3081      	movi      	r0, 129
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 80133aa:	f5000208 	fmuls      	fr8, fr0, fr8
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 80133ae:	e3ffff87 	bsr      	0x80132bc	// 80132bc <INA226_Read2Byte>
 80133b2:	b800      	st.w      	r0, (r14, 0x0)
	if(temp&0x8000)	temp = ~(temp - 1);	
 80133b4:	d86e1000 	ld.h      	r3, (r14, 0x0)
 80133b8:	74cf      	sexth      	r3, r3
 80133ba:	e9a30006 	bhsz      	r3, 0x80133c6	// 80133c6 <Get_Power+0x42>
 80133be:	3300      	movi      	r3, 0
 80133c0:	60c2      	subu      	r3, r0
 80133c2:	74cd      	zexth      	r3, r3
 80133c4:	b860      	st.w      	r3, (r14, 0x0)
	Current = INA226_GetShunt_Current(INA226_READ_ADDR)* CURRENT_LSB;
 80133c6:	f40e2000 	flds      	fr0, (r14, 0x0)
 80133ca:	106e      	lrw      	r3, 0x3dcccccd	// 8013400 <Get_Power+0x7c>
 80133cc:	f4001a01 	fsitos      	fr1, fr0
 80133d0:	f4031b60 	fmtvrl      	fr0, r3
 80133d4:	f4010201 	fmuls      	fr1, fr1, fr0
	float mA = 0;
	float Power = 0.0;
	mV = Get_Voltage();			//mV
	mA= Get_Shunt_Current();	//mA
	mA = (int)mA;
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 80133d8:	ea23447a 	movih      	r3, 17530
	mA = (int)mA;
 80133dc:	f4011821 	fstosi.rz      	fr1, fr1
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 80133e0:	f4031b60 	fmtvrl      	fr0, r3
	mA = (int)mA;
 80133e4:	f4011a01 	fsitos      	fr1, fr1
	Power = (mV/1000) * (mA/1000); 	//mV*mA
 80133e8:	f4010301 	fdivs      	fr1, fr1, fr0
 80133ec:	f4080300 	fdivs      	fr0, fr8, fr0
	return Power;
}
 80133f0:	f4010200 	fmuls      	fr0, fr1, fr0
 80133f4:	1401      	addi      	r14, r14, 4
 80133f6:	f40e2008 	flds      	fr8, (r14, 0x0)
 80133fa:	1401      	addi      	r14, r14, 4
 80133fc:	1490      	pop      	r15
 80133fe:	0000      	.short	0x0000
 8013400:	3dcccccd 	.long	0x3dcccccd

08013404 <Get_INA226_All_Value>:
	return Power;
}


void Get_INA226_All_Value(INA226_VALUE *ina226_value)
{
 8013404:	14d1      	push      	r4, r15
 8013406:	1421      	subi      	r14, r14, 4
 8013408:	6d03      	mov      	r4, r0
	temp = INA226_Read2Byte(dev_addr, Bus_V_Reg);
 801340a:	3102      	movi      	r1, 2
 801340c:	3081      	movi      	r0, 129
 801340e:	e3ffff57 	bsr      	0x80132bc	// 80132bc <INA226_Read2Byte>
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
 8013412:	f4001b60 	fmtvrl      	fr0, r0
 8013416:	ea233fa0 	movih      	r3, 16288
 801341a:	f4031b61 	fmtvrl      	fr1, r3
 801341e:	f4001a00 	fsitos      	fr0, fr0
 8013422:	f4200200 	fmuls      	fr0, fr0, fr1
	ina226_value->Bus_V = Get_Voltage();  			//mv
 8013426:	f4042400 	fsts      	fr0, (r4, 0x0)
	ina226_value->Shunt_V = Get_Shunt_voltage();	//uv
 801342a:	e3ffff89 	bsr      	0x801333c	// 801333c <Get_Shunt_voltage>
 801342e:	f4042410 	fsts      	fr0, (r4, 0x4)
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
 8013432:	3104      	movi      	r1, 4
 8013434:	3081      	movi      	r0, 129
 8013436:	e3ffff43 	bsr      	0x80132bc	// 80132bc <INA226_Read2Byte>
 801343a:	b800      	st.w      	r0, (r14, 0x0)
	if(temp&0x8000)	temp = ~(temp - 1);	
 801343c:	d86e1000 	ld.h      	r3, (r14, 0x0)
 8013440:	74cf      	sexth      	r3, r3
 8013442:	e9a30006 	bhsz      	r3, 0x801344e	// 801344e <Get_INA226_All_Value+0x4a>
 8013446:	3300      	movi      	r3, 0
 8013448:	60c2      	subu      	r3, r0
 801344a:	74cd      	zexth      	r3, r3
 801344c:	b860      	st.w      	r3, (r14, 0x0)
	Current = INA226_GetShunt_Current(INA226_READ_ADDR)* CURRENT_LSB;
 801344e:	f40e2000 	flds      	fr0, (r14, 0x0)
 8013452:	1068      	lrw      	r3, 0x3dcccccd	// 8013470 <Get_INA226_All_Value+0x6c>
 8013454:	f4031b61 	fmtvrl      	fr1, r3
 8013458:	f4001a00 	fsitos      	fr0, fr0
 801345c:	f4200200 	fmuls      	fr0, fr0, fr1
	ina226_value->Current = Get_Shunt_Current();	//ma	
 8013460:	f4042420 	fsts      	fr0, (r4, 0x8)
	ina226_value->Power = Get_Power();				//mw
 8013464:	e3ffff90 	bsr      	0x8013384	// 8013384 <Get_Power>
 8013468:	f4042430 	fsts      	fr0, (r4, 0xc)
}
 801346c:	1401      	addi      	r14, r14, 4
 801346e:	1491      	pop      	r4, r15
 8013470:	3dcccccd 	.long	0x3dcccccd

08013474 <INA226_Init>:
 
 
void INA226_Init(void)
{
 8013474:	14d0      	push      	r15
	
	I2C_Init(INA226_NUM);
 8013476:	3001      	movi      	r0, 1
 8013478:	e3fffee8 	bsr      	0x8013248	// 8013248 <I2C_Init>
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0x8000);		//重新启动
 801347c:	ea028000 	movi      	r2, 32768
 8013480:	3100      	movi      	r1, 0
 8013482:	3080      	movi      	r0, 128
 8013484:	e3ffff3c 	bsr      	0x80132fc	// 80132fc <INA226_Write2Byte>
	//0b0100101001001111,204us,256次测量 204*256 = 53ms
	//0x484f设置转换时间204us,求平均值次数128，采样时间为204*128 = 26ms，
	//0x452716次平均,1.1ms,1.1ms,连续测量分流电压和总线电压
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0b0100101001001111);		
 8013488:	ea024a4f 	movi      	r2, 19023
 801348c:	3100      	movi      	r1, 0
 801348e:	3080      	movi      	r0, 128
 8013490:	e3ffff36 	bsr      	0x80132fc	// 80132fc <INA226_Write2Byte>
	INA226_Write2Byte(INA226_WRITE_ADDR, Calib_Reg, CAL);		//设置分辨率
 8013494:	ea020800 	movi      	r2, 2048
 8013498:	3105      	movi      	r1, 5
 801349a:	3080      	movi      	r0, 128
 801349c:	e3ffff30 	bsr      	0x80132fc	// 80132fc <INA226_Write2Byte>
	/*
	I2C_Init(INA226_NUM);
	INA226_Write2Byte(Config_Reg, 0x4527);//0100_010_100_100_111 
	INA226_Write2Byte(Calib_Reg, 0x0A00);
	*/
}
 80134a0:	1490      	pop      	r15
	...

080134a4 <OLED_Clear>:
	} //更新显示
}

//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
 80134a4:	14d5      	push      	r4-r8, r15
 80134a6:	1422      	subi      	r14, r14, 8
 80134a8:	ea0800b0 	movi      	r8, 176
	uint8_t i,n;		    
	uint8_t buf[1];
	for(i=0;i<8;i++)  
	{  
		buf[0] = 0xb0+i;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80134ac:	3601      	movi      	r6, 1
 80134ae:	10ba      	lrw      	r5, 0x200032f0	// 8013514 <OLED_Clear+0x70>
		buf[0] = 0x00;
 80134b0:	3700      	movi      	r7, 0
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80134b2:	1b01      	addi      	r3, r14, 4
 80134b4:	3200      	movi      	r2, 0
 80134b6:	3178      	movi      	r1, 120
 80134b8:	b8c0      	st.w      	r6, (r14, 0x0)
 80134ba:	6c17      	mov      	r0, r5
		buf[0] = 0xb0+i;
 80134bc:	dd0e0004 	st.b      	r8, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 80134c0:	e3fff8fc 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 80134c4:	1b01      	addi      	r3, r14, 4
 80134c6:	3200      	movi      	r2, 0
 80134c8:	3178      	movi      	r1, 120
 80134ca:	b8c0      	st.w      	r6, (r14, 0x0)
 80134cc:	6c17      	mov      	r0, r5
		buf[0] = 0x00;
 80134ce:	dcee0004 	st.b      	r7, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 80134d2:	e3fff8f3 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
		buf[0] = 0x10;
 80134d6:	3310      	movi      	r3, 16
 80134d8:	dc6e0004 	st.b      	r3, (r14, 0x4)
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 80134dc:	b8c0      	st.w      	r6, (r14, 0x0)
 80134de:	1b01      	addi      	r3, r14, 4
 80134e0:	3200      	movi      	r2, 0
 80134e2:	3178      	movi      	r1, 120
 80134e4:	6c17      	mov      	r0, r5
 80134e6:	e3fff8e9 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
 80134ea:	3480      	movi      	r4, 128
		
		for(n=0;n<128;n++)
		{
			buf[0] = 0x00;
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
 80134ec:	b8c0      	st.w      	r6, (r14, 0x0)
 80134ee:	1b01      	addi      	r3, r14, 4
 80134f0:	3240      	movi      	r2, 64
 80134f2:	3178      	movi      	r1, 120
 80134f4:	6c17      	mov      	r0, r5
 80134f6:	2c00      	subi      	r4, 1
			buf[0] = 0x00;
 80134f8:	dcee0004 	st.b      	r7, (r14, 0x4)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
 80134fc:	e3fff8de 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
		for(n=0;n<128;n++)
 8013500:	e924fff6 	bnez      	r4, 0x80134ec	// 80134ec <OLED_Clear+0x48>
 8013504:	e5080000 	addi      	r8, r8, 1
 8013508:	7620      	zextb      	r8, r8
	for(i=0;i<8;i++)  
 801350a:	eb4800b8 	cmpnei      	r8, 184
 801350e:	0bd2      	bt      	0x80134b2	// 80134b2 <OLED_Clear+0xe>
		}
	}
}
 8013510:	1402      	addi      	r14, r14, 8
 8013512:	1495      	pop      	r4-r8, r15
 8013514:	200032f0 	.long	0x200032f0

08013518 <OLED_Set_Pos>:

void OLED_Set_Pos(unsigned char x, unsigned char y) 
{
 8013518:	14d3      	push      	r4-r6, r15
 801351a:	1422      	subi      	r14, r14, 8
	uint8_t buf[1];
	
	buf[0] = 0xb0+y;
 801351c:	294f      	subi      	r1, 80
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 801351e:	10b3      	lrw      	r5, 0x200032f0	// 8013568 <OLED_Set_Pos+0x50>
 8013520:	3601      	movi      	r6, 1
{
 8013522:	6d03      	mov      	r4, r0
	buf[0] = 0xb0+y;
 8013524:	dc2e0004 	st.b      	r1, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
 8013528:	1b01      	addi      	r3, r14, 4
 801352a:	b8c0      	st.w      	r6, (r14, 0x0)
 801352c:	3200      	movi      	r2, 0
 801352e:	3178      	movi      	r1, 120
 8013530:	6c17      	mov      	r0, r5
 8013532:	e3fff8c3 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf[0] = ((x&0xf0)>>4)|0x10;
 8013536:	4c64      	lsri      	r3, r4, 4
 8013538:	ec630010 	ori      	r3, r3, 16
 801353c:	dc6e0004 	st.b      	r3, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
 8013540:	b8c0      	st.w      	r6, (r14, 0x0)
 8013542:	1b01      	addi      	r3, r14, 4
 8013544:	3200      	movi      	r2, 0
 8013546:	3178      	movi      	r1, 120
 8013548:	6c17      	mov      	r0, r5
 801354a:	e3fff8b7 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf[0] = (x&0x0f);
 801354e:	e484200f 	andi      	r4, r4, 15
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 8013552:	b8c0      	st.w      	r6, (r14, 0x0)
 8013554:	1b01      	addi      	r3, r14, 4
 8013556:	3200      	movi      	r2, 0
 8013558:	3178      	movi      	r1, 120
 801355a:	6c17      	mov      	r0, r5
	buf[0] = (x&0x0f);
 801355c:	dc8e0004 	st.b      	r4, (r14, 0x4)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
 8013560:	e3fff8ac 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
} 
 8013564:	1402      	addi      	r14, r14, 8
 8013566:	1493      	pop      	r4-r6, r15
 8013568:	200032f0 	.long	0x200032f0

0801356c <OLED_ShowChar>:
//x:0~127
//y:0~31
//mode:0,反白显示;1,正常显示				 
//size:选择字体 16/12 
void OLED_ShowChar(uint8_t x,uint8_t y,uint8_t chr,uint8_t Char_Size)
{      	
 801356c:	ebe00038 	push      	r4-r11, r15, r16
 8013570:	1421      	subi      	r14, r14, 4
	unsigned char c=0,i=0;	
		c=chr-' ';//得到偏移后的值			
 8013572:	2a1f      	subi      	r2, 32
 8013574:	7588      	zextb      	r6, r2
		if(x>Max_Column-1){x=0;y=y+2;}
 8013576:	7482      	sextb      	r2, r0
{      	
 8013578:	6e43      	mov      	r9, r0
 801357a:	6e07      	mov      	r8, r1
		if(x>Max_Column-1){x=0;y=y+2;}
 801357c:	e982004f 	blz      	r2, 0x801361a	// 801361a <OLED_ShowChar+0xae>
		if(Char_Size == 16)
 8013580:	3b50      	cmpnei      	r3, 16
			{
			OLED_Set_Pos(x,y);	
 8013582:	6c63      	mov      	r1, r8
 8013584:	6c27      	mov      	r0, r9
		if(Char_Size == 16)
 8013586:	0c1a      	bf      	0x80135ba	// 80135ba <OLED_ShowChar+0x4e>
			OLED_Set_Pos(x,y+1);
			for(i=0;i<8;i++)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i+8], 1);	
			}
			else {	
				OLED_Set_Pos(x,y);
 8013588:	e3ffffc8 	bsr      	0x8013518	// 8013518 <OLED_Set_Pos>
 801358c:	749b      	sexth      	r2, r6
 801358e:	5aa8      	addu      	r5, r2, r2
 8013590:	6094      	addu      	r2, r5
 8013592:	6088      	addu      	r2, r2
 8013594:	11a5      	lrw      	r5, 0x20000164	// 8013628 <OLED_ShowChar+0xbc>
 8013596:	5d88      	addu      	r4, r5, r2
 8013598:	2205      	addi      	r2, 6
 801359a:	6148      	addu      	r5, r2
				for(i=0;i<6;i++)
				HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F6x8[c][i], 1);	//设置显示位置—列高地址
 801359c:	3701      	movi      	r7, 1
 801359e:	11c4      	lrw      	r6, 0x200032f0	// 801362c <OLED_ShowChar+0xc0>
 80135a0:	6cd3      	mov      	r3, r4
 80135a2:	b8e0      	st.w      	r7, (r14, 0x0)
 80135a4:	3240      	movi      	r2, 64
 80135a6:	3178      	movi      	r1, 120
 80135a8:	6c1b      	mov      	r0, r6
 80135aa:	2400      	addi      	r4, 1
 80135ac:	e3fff886 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
				for(i=0;i<6;i++)
 80135b0:	6552      	cmpne      	r4, r5
 80135b2:	0bf7      	bt      	0x80135a0	// 80135a0 <OLED_ShowChar+0x34>
				
			}
}
 80135b4:	1401      	addi      	r14, r14, 4
 80135b6:	ebc00038 	pop      	r4-r11, r15, r16
 80135ba:	46c4      	lsli      	r6, r6, 4
 80135bc:	10fd      	lrw      	r7, 0x2000038c	// 8013630 <OLED_ShowChar+0xc4>
 80135be:	5e9e      	addi      	r4, r6, 8
			OLED_Set_Pos(x,y);	
 80135c0:	e3ffffac 	bsr      	0x8013518	// 8013518 <OLED_Set_Pos>
 80135c4:	5fb8      	addu      	r5, r7, r6
 80135c6:	c4870030 	addu      	r16, r7, r4
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i], 1);	
 80135ca:	ea0b0001 	movi      	r11, 1
 80135ce:	ea8a0018 	lrw      	r10, 0x200032f0	// 801362c <OLED_ShowChar+0xc0>
 80135d2:	6cd7      	mov      	r3, r5
 80135d4:	dd6e2000 	st.w      	r11, (r14, 0x0)
 80135d8:	3240      	movi      	r2, 64
 80135da:	3178      	movi      	r1, 120
 80135dc:	6c2b      	mov      	r0, r10
 80135de:	2500      	addi      	r5, 1
 80135e0:	e3fff86c 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
			for(i=0;i<8;i++)
 80135e4:	c4b00480 	cmpne      	r16, r5
 80135e8:	0bf5      	bt      	0x80135d2	// 80135d2 <OLED_ShowChar+0x66>
			OLED_Set_Pos(x,y+1);
 80135ea:	e4280000 	addi      	r1, r8, 1
 80135ee:	7444      	zextb      	r1, r1
 80135f0:	6c27      	mov      	r0, r9
 80135f2:	260f      	addi      	r6, 16
 80135f4:	611c      	addu      	r4, r7
 80135f6:	619c      	addu      	r6, r7
 80135f8:	e3ffff90 	bsr      	0x8013518	// 8013518 <OLED_Set_Pos>
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i+8], 1);	
 80135fc:	3701      	movi      	r7, 1
 80135fe:	10ac      	lrw      	r5, 0x200032f0	// 801362c <OLED_ShowChar+0xc0>
 8013600:	6cd3      	mov      	r3, r4
 8013602:	b8e0      	st.w      	r7, (r14, 0x0)
 8013604:	3240      	movi      	r2, 64
 8013606:	3178      	movi      	r1, 120
 8013608:	6c17      	mov      	r0, r5
 801360a:	2400      	addi      	r4, 1
 801360c:	e3fff856 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
			for(i=0;i<8;i++)
 8013610:	651a      	cmpne      	r6, r4
 8013612:	0bf7      	bt      	0x8013600	// 8013600 <OLED_ShowChar+0x94>
}
 8013614:	1401      	addi      	r14, r14, 4
 8013616:	ebc00038 	pop      	r4-r11, r15, r16
		if(x>Max_Column-1){x=0;y=y+2;}
 801361a:	e5010001 	addi      	r8, r1, 2
 801361e:	7620      	zextb      	r8, r8
 8013620:	ea090000 	movi      	r9, 0
 8013624:	07ae      	br      	0x8013580	// 8013580 <OLED_ShowChar+0x14>
 8013626:	0000      	.short	0x0000
 8013628:	20000164 	.long	0x20000164
 801362c:	200032f0 	.long	0x200032f0
 8013630:	2000038c 	.long	0x2000038c

08013634 <OLED_ShowString>:

//显示一个字符号串
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Char_Size)
{
 8013634:	14d6      	push      	r4-r9, r15
 8013636:	6dcb      	mov      	r7, r2
	unsigned char j=0;
	while (chr[j]!='\0')
 8013638:	8240      	ld.b      	r2, (r2, 0x0)
{
 801363a:	6d03      	mov      	r4, r0
 801363c:	6d87      	mov      	r6, r1
 801363e:	6e0f      	mov      	r8, r3
	while (chr[j]!='\0')
 8013640:	e9020017 	bez      	r2, 0x801366e	// 801366e <OLED_ShowString+0x3a>
 8013644:	3500      	movi      	r5, 0
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
			x+=8;
		if(x>120){x=0;y+=2;}
 8013646:	ea090078 	movi      	r9, 120
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 801364a:	6c13      	mov      	r0, r4
			x+=8;
 801364c:	2407      	addi      	r4, 8
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 801364e:	6ce3      	mov      	r3, r8
 8013650:	6c5b      	mov      	r1, r6
			x+=8;
 8013652:	7510      	zextb      	r4, r4
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
 8013654:	e3ffff8c 	bsr      	0x801356c	// 801356c <OLED_ShowChar>
		if(x>120){x=0;y+=2;}
 8013658:	6524      	cmphs      	r9, r4
 801365a:	0804      	bt      	0x8013662	// 8013662 <OLED_ShowString+0x2e>
 801365c:	2601      	addi      	r6, 2
 801365e:	7598      	zextb      	r6, r6
 8013660:	3400      	movi      	r4, 0
			j++;
 8013662:	2500      	addi      	r5, 1
 8013664:	7554      	zextb      	r5, r5
	while (chr[j]!='\0')
 8013666:	d0a70022 	ldr.b      	r2, (r7, r5 << 0)
 801366a:	e922fff0 	bnez      	r2, 0x801364a	// 801364a <OLED_ShowString+0x16>
	}
}
 801366e:	1496      	pop      	r4-r9, r15

08013670 <OLED_Init>:
	}					
}

//初始化SSD1306					    
void OLED_Init(void)
{ 	
 8013670:	14d2      	push      	r4-r5, r15
 8013672:	1422      	subi      	r14, r14, 8
	
	I2C_Init(OLED_NUM);
 8013674:	3000      	movi      	r0, 0
 8013676:	e3fffde9 	bsr      	0x8013248	// 8013248 <I2C_Init>
	uint8_t buf;// = {0xAE,0X40,0XB0,0xC8,0x81,0xff,0xa1,0xa6,0xa8,0x1f,0xd3,0x00,0xd5,0xf0,0xd9,0x22,0xda,0x02,0xdb,0x49,0x8d,0x14,0xaf};
	HAL_Delay(100);
 801367a:	3064      	movi      	r0, 100
 801367c:	e3fff464 	bsr      	0x8011f44	// 8011f44 <HAL_Delay>
	//addr common  data
	buf = 0xAE;
 8013680:	3300      	movi      	r3, 0
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//关闭显示
 8013682:	0395      	lrw      	r4, 0x200032f0	// 80138a8 <OLED_Init+0x238>
 8013684:	3501      	movi      	r5, 1
	buf = 0xAE;
 8013686:	2b51      	subi      	r3, 82
 8013688:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//关闭显示
 801368c:	b8a0      	st.w      	r5, (r14, 0x0)
 801368e:	e46e0006 	addi      	r3, r14, 7
 8013692:	3200      	movi      	r2, 0
 8013694:	3178      	movi      	r1, 120
 8013696:	6c13      	mov      	r0, r4
 8013698:	e3fff810 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x40;
 801369c:	3340      	movi      	r3, 64
 801369e:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80136a2:	b8a0      	st.w      	r5, (r14, 0x0)
 80136a4:	e46e0006 	addi      	r3, r14, 7
 80136a8:	3200      	movi      	r2, 0
 80136aa:	3178      	movi      	r1, 120
 80136ac:	6c13      	mov      	r0, r4
 80136ae:	e3fff805 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xb0;
 80136b2:	3300      	movi      	r3, 0
 80136b4:	2b4f      	subi      	r3, 80
 80136b6:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80136ba:	b8a0      	st.w      	r5, (r14, 0x0)
 80136bc:	e46e0006 	addi      	r3, r14, 7
 80136c0:	3200      	movi      	r2, 0
 80136c2:	3178      	movi      	r1, 120
 80136c4:	6c13      	mov      	r0, r4
 80136c6:	e3fff7f9 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xc8;
 80136ca:	3300      	movi      	r3, 0
 80136cc:	2b37      	subi      	r3, 56
 80136ce:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//---set low column address
 80136d2:	b8a0      	st.w      	r5, (r14, 0x0)
 80136d4:	e46e0006 	addi      	r3, r14, 7
 80136d8:	3200      	movi      	r2, 0
 80136da:	3178      	movi      	r1, 120
 80136dc:	6c13      	mov      	r0, r4
 80136de:	e3fff7ed 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x81;
 80136e2:	3300      	movi      	r3, 0
 80136e4:	2b7e      	subi      	r3, 127
 80136e6:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80136ea:	b8a0      	st.w      	r5, (r14, 0x0)
 80136ec:	e46e0006 	addi      	r3, r14, 7
 80136f0:	3200      	movi      	r2, 0
 80136f2:	3178      	movi      	r1, 120
 80136f4:	6c13      	mov      	r0, r4
 80136f6:	e3fff7e1 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xff;
 80136fa:	3300      	movi      	r3, 0
 80136fc:	2b00      	subi      	r3, 1
 80136fe:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013702:	b8a0      	st.w      	r5, (r14, 0x0)
 8013704:	e46e0006 	addi      	r3, r14, 7
 8013708:	3200      	movi      	r2, 0
 801370a:	3178      	movi      	r1, 120
 801370c:	6c13      	mov      	r0, r4
 801370e:	e3fff7d5 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xa1;
 8013712:	3300      	movi      	r3, 0
 8013714:	2b5e      	subi      	r3, 95
 8013716:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//-not offset
 801371a:	b8a0      	st.w      	r5, (r14, 0x0)
 801371c:	e46e0006 	addi      	r3, r14, 7
 8013720:	3200      	movi      	r2, 0
 8013722:	3178      	movi      	r1, 120
 8013724:	6c13      	mov      	r0, r4
 8013726:	e3fff7c9 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xa6;
 801372a:	3300      	movi      	r3, 0
 801372c:	2b59      	subi      	r3, 90
 801372e:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013732:	b8a0      	st.w      	r5, (r14, 0x0)
 8013734:	e46e0006 	addi      	r3, r14, 7
 8013738:	3200      	movi      	r2, 0
 801373a:	3178      	movi      	r1, 120
 801373c:	6c13      	mov      	r0, r4
 801373e:	e3fff7bd 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xa8;
 8013742:	3300      	movi      	r3, 0
 8013744:	2b57      	subi      	r3, 88
 8013746:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//设置驱动路数
 801374a:	b8a0      	st.w      	r5, (r14, 0x0)
 801374c:	e46e0006 	addi      	r3, r14, 7
 8013750:	3200      	movi      	r2, 0
 8013752:	3178      	movi      	r1, 120
 8013754:	6c13      	mov      	r0, r4
 8013756:	e3fff7b1 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x1f;
 801375a:	331f      	movi      	r3, 31
 801375c:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013760:	b8a0      	st.w      	r5, (r14, 0x0)
 8013762:	e46e0006 	addi      	r3, r14, 7
 8013766:	3200      	movi      	r2, 0
 8013768:	3178      	movi      	r1, 120
 801376a:	6c13      	mov      	r0, r4
 801376c:	e3fff7a6 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xd3;
 8013770:	3300      	movi      	r3, 0
 8013772:	2b2c      	subi      	r3, 45
 8013774:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013778:	b8a0      	st.w      	r5, (r14, 0x0)
 801377a:	e46e0006 	addi      	r3, r14, 7
 801377e:	3200      	movi      	r2, 0
 8013780:	3178      	movi      	r1, 120
 8013782:	6c13      	mov      	r0, r4
 8013784:	e3fff79a 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x00;
 8013788:	3300      	movi      	r3, 0
 801378a:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801378e:	b8a0      	st.w      	r5, (r14, 0x0)
 8013790:	e46e0006 	addi      	r3, r14, 7
 8013794:	3200      	movi      	r2, 0
 8013796:	3178      	movi      	r1, 120
 8013798:	6c13      	mov      	r0, r4
 801379a:	e3fff78f 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xd5;	
 801379e:	3300      	movi      	r3, 0
 80137a0:	2b2a      	subi      	r3, 43
 80137a2:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80137a6:	b8a0      	st.w      	r5, (r14, 0x0)
 80137a8:	e46e0006 	addi      	r3, r14, 7
 80137ac:	3200      	movi      	r2, 0
 80137ae:	3178      	movi      	r1, 120
 80137b0:	6c13      	mov      	r0, r4
 80137b2:	e3fff783 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xf0;
 80137b6:	3300      	movi      	r3, 0
 80137b8:	2b0f      	subi      	r3, 16
 80137ba:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80137be:	b8a0      	st.w      	r5, (r14, 0x0)
 80137c0:	e46e0006 	addi      	r3, r14, 7
 80137c4:	3200      	movi      	r2, 0
 80137c6:	3178      	movi      	r1, 120
 80137c8:	6c13      	mov      	r0, r4
 80137ca:	e3fff777 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xd9;
 80137ce:	3300      	movi      	r3, 0
 80137d0:	2b26      	subi      	r3, 39
 80137d2:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80137d6:	b8a0      	st.w      	r5, (r14, 0x0)
 80137d8:	e46e0006 	addi      	r3, r14, 7
 80137dc:	3200      	movi      	r2, 0
 80137de:	3178      	movi      	r1, 120
 80137e0:	6c13      	mov      	r0, r4
 80137e2:	e3fff76b 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x22;
 80137e6:	3322      	movi      	r3, 34
 80137e8:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 80137ec:	b8a0      	st.w      	r5, (r14, 0x0)
 80137ee:	e46e0006 	addi      	r3, r14, 7
 80137f2:	3200      	movi      	r2, 0
 80137f4:	3178      	movi      	r1, 120
 80137f6:	6c13      	mov      	r0, r4
 80137f8:	e3fff760 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xda;
 80137fc:	3300      	movi      	r3, 0
 80137fe:	2b25      	subi      	r3, 38
 8013800:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013804:	b8a0      	st.w      	r5, (r14, 0x0)
 8013806:	e46e0006 	addi      	r3, r14, 7
 801380a:	3200      	movi      	r2, 0
 801380c:	3178      	movi      	r1, 120
 801380e:	6c13      	mov      	r0, r4
 8013810:	e3fff754 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x02;
 8013814:	3302      	movi      	r3, 2
 8013816:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 801381a:	b8a0      	st.w      	r5, (r14, 0x0)
 801381c:	e46e0006 	addi      	r3, r14, 7
 8013820:	3200      	movi      	r2, 0
 8013822:	3178      	movi      	r1, 120
 8013824:	6c13      	mov      	r0, r4
 8013826:	e3fff749 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x8d;
 801382a:	3300      	movi      	r3, 0
 801382c:	2b72      	subi      	r3, 115
 801382e:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013832:	b8a0      	st.w      	r5, (r14, 0x0)
 8013834:	e46e0006 	addi      	r3, r14, 7
 8013838:	3200      	movi      	r2, 0
 801383a:	3178      	movi      	r1, 120
 801383c:	6c13      	mov      	r0, r4
 801383e:	e3fff73d 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x14;
 8013842:	3314      	movi      	r3, 20
 8013844:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013848:	b8a0      	st.w      	r5, (r14, 0x0)
 801384a:	e46e0006 	addi      	r3, r14, 7
 801384e:	3200      	movi      	r2, 0
 8013850:	3178      	movi      	r1, 120
 8013852:	6c13      	mov      	r0, r4
 8013854:	e3fff732 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xdb;
 8013858:	3300      	movi      	r3, 0
 801385a:	2b24      	subi      	r3, 37
 801385c:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
 8013860:	b8a0      	st.w      	r5, (r14, 0x0)
 8013862:	e46e0006 	addi      	r3, r14, 7
 8013866:	3200      	movi      	r2, 0
 8013868:	3178      	movi      	r1, 120
 801386a:	6c13      	mov      	r0, r4
 801386c:	e3fff726 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0x49;
 8013870:	3349      	movi      	r3, 73
 8013872:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
 8013876:	b8a0      	st.w      	r5, (r14, 0x0)
 8013878:	e46e0006 	addi      	r3, r14, 7
 801387c:	3200      	movi      	r2, 0
 801387e:	3178      	movi      	r1, 120
 8013880:	6c13      	mov      	r0, r4
 8013882:	e3fff71b 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	buf = 0xaf;
 8013886:	3300      	movi      	r3, 0
 8013888:	2b50      	subi      	r3, 81
 801388a:	dc6e0007 	st.b      	r3, (r14, 0x7)
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
 801388e:	3200      	movi      	r2, 0
 8013890:	e46e0006 	addi      	r3, r14, 7
 8013894:	3178      	movi      	r1, 120
 8013896:	b8a0      	st.w      	r5, (r14, 0x0)
 8013898:	6c13      	mov      	r0, r4
 801389a:	e3fff70f 	bsr      	0x80126b8	// 80126b8 <HAL_I2C_Write>
	
	OLED_Clear();
 801389e:	e3fffe03 	bsr      	0x80134a4	// 80134a4 <OLED_Clear>
}  
 80138a2:	1402      	addi      	r14, r14, 8
 80138a4:	1492      	pop      	r4-r5, r15
 80138a6:	0000      	.short	0x0000
 80138a8:	200032f0 	.long	0x200032f0

080138ac <Error_Handler_Time>:

TIM_HandleTypeDef htim[6] = {0};


void Error_Handler_Time(void)
{
 80138ac:	14d1      	push      	r4, r15
	while (1)
	{
		printf("Error_Handler Time\r\n");
 80138ae:	1083      	lrw      	r4, 0x8015578	// 80138b8 <Error_Handler_Time+0xc>
 80138b0:	6c13      	mov      	r0, r4
 80138b2:	e3fff11d 	bsr      	0x8011aec	// 8011aec <__GI_puts>
 80138b6:	07fd      	br      	0x80138b0	// 80138b0 <Error_Handler_Time+0x4>
 80138b8:	08015578 	.long	0x08015578

080138bc <TIM_Init_Us>:
	}
}


void TIM_Init_Us(uint32_t TIM_NUM,uint32_t time)
{
 80138bc:	14d0      	push      	r15
	htim[TIM_NUM].Instance = TIM_NUM;
 80138be:	3218      	movi      	r2, 24
 80138c0:	7c80      	mult      	r2, r0
 80138c2:	1068      	lrw      	r3, 0x20002c84	// 80138e0 <TIM_Init_Us+0x24>
 80138c4:	d4620820 	str.w      	r0, (r2, r3 << 0)
	htim[TIM_NUM].Init.Unit = TIM_UNIT_US;
 80138c8:	5b08      	addu      	r0, r3, r2
 80138ca:	3300      	movi      	r3, 0
 80138cc:	b061      	st.w      	r3, (r0, 0x4)
	htim[TIM_NUM].Init.Period = time;  //定时时间
 80138ce:	b023      	st.w      	r1, (r0, 0xc)
	htim[TIM_NUM].Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
 80138d0:	b062      	st.w      	r3, (r0, 0x8)
	if (HAL_TIM_Base_Init(&htim[TIM_NUM]) != HAL_OK)
 80138d2:	e3fff375 	bsr      	0x8011fbc	// 8011fbc <HAL_TIM_Base_Init>
 80138d6:	e9200003 	bnez      	r0, 0x80138dc	// 80138dc <TIM_Init_Us+0x20>
	{
		Error_Handler_Time();
	}
}
 80138da:	1490      	pop      	r15
		Error_Handler_Time();
 80138dc:	e3ffffe8 	bsr      	0x80138ac	// 80138ac <Error_Handler_Time>
 80138e0:	20002c84 	.long	0x20002c84

080138e4 <SystemInit>:
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 80138e4:	106a      	lrw      	r3, 0x20000000	// 801390c <SystemInit+0x28>
 80138e6:	c0036421 	mtcr      	r3, cr<1, 0>
    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 80138ea:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 80138ee:	ec630010 	ori      	r3, r3, 16
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 80138f2:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 80138f6:	1047      	lrw      	r2, 0xe000e100	// 8013910 <SystemInit+0x2c>
 80138f8:	3300      	movi      	r3, 0
 80138fa:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 80138fe:	2b00      	subi      	r3, 1
 8013900:	dc622060 	st.w      	r3, (r2, 0x180)
    __ASM volatile("psrset ee, ie");
 8013904:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8013908:	783c      	jmp      	r15
 801390a:	0000      	.short	0x0000
 801390c:	20000000 	.long	0x20000000
 8013910:	e000e100 	.long	0xe000e100

08013914 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8013914:	14d4      	push      	r4-r7, r15
 8013916:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8013918:	c0006021 	mfcr      	r1, cr<0, 0>
 801391c:	4930      	lsri      	r1, r1, 16
 801391e:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8013920:	1018      	lrw      	r0, 0x801558c	// 8013980 <trap_c+0x6c>
 8013922:	e0000c4d 	bsr      	0x80151bc	// 80151bc <wm_printf>
    printf("\n");
 8013926:	300a      	movi      	r0, 10
 8013928:	e3fff0da 	bsr      	0x8011adc	// 8011adc <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 801392c:	9540      	ld.w      	r2, (r5, 0x0)
 801392e:	3100      	movi      	r1, 0
 8013930:	1015      	lrw      	r0, 0x80155a0	// 8013984 <trap_c+0x70>
 8013932:	e0000c45 	bsr      	0x80151bc	// 80151bc <wm_printf>
    for (i = 0; i < 16; i++) {
 8013936:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8013938:	10f3      	lrw      	r7, 0x80155a0	// 8013984 <trap_c+0x70>

        if ((i % 5) == 4) {
 801393a:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 801393c:	2400      	addi      	r4, 1
 801393e:	3c50      	cmpnei      	r4, 16
 8013940:	0c13      	bf      	0x8013966	// 8013966 <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8013942:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8013946:	6c53      	mov      	r1, r4
 8013948:	6c1f      	mov      	r0, r7
 801394a:	e0000c39 	bsr      	0x80151bc	// 80151bc <wm_printf>
        if ((i % 5) == 4) {
 801394e:	c4c48043 	divs      	r3, r4, r6
 8013952:	7cd8      	mult      	r3, r6
 8013954:	5c6d      	subu      	r3, r4, r3
 8013956:	3b44      	cmpnei      	r3, 4
 8013958:	0bf2      	bt      	0x801393c	// 801393c <trap_c+0x28>
            printf("\n");
 801395a:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 801395c:	2400      	addi      	r4, 1
            printf("\n");
 801395e:	e3fff0bf 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8013962:	3c50      	cmpnei      	r4, 16
 8013964:	0bef      	bt      	0x8013942	// 8013942 <trap_c+0x2e>
        }
    }

    printf("\n");
 8013966:	300a      	movi      	r0, 10
 8013968:	e3fff0ba 	bsr      	0x8011adc	// 8011adc <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 801396c:	9530      	ld.w      	r1, (r5, 0x40)
 801396e:	1007      	lrw      	r0, 0x80155ac	// 8013988 <trap_c+0x74>
 8013970:	e0000c26 	bsr      	0x80151bc	// 80151bc <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8013974:	9531      	ld.w      	r1, (r5, 0x44)
 8013976:	1006      	lrw      	r0, 0x80155b8	// 801398c <trap_c+0x78>
 8013978:	e0000c22 	bsr      	0x80151bc	// 80151bc <wm_printf>
 801397c:	0400      	br      	0x801397c	// 801397c <trap_c+0x68>
 801397e:	0000      	.short	0x0000
 8013980:	0801558c 	.long	0x0801558c
 8013984:	080155a0 	.long	0x080155a0
 8013988:	080155ac 	.long	0x080155ac
 801398c:	080155b8 	.long	0x080155b8

08013990 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8013990:	106a      	lrw      	r3, 0xe000e100	// 80139b8 <board_init+0x28>
 8013992:	ea210001 	movih      	r1, 1
 8013996:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 801399a:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 801399e:	1068      	lrw      	r3, 0x40010600	// 80139bc <board_init+0x2c>
 80139a0:	ea21000b 	movih      	r1, 11
 80139a4:	2113      	addi      	r1, 20
 80139a6:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 80139a8:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 80139aa:	31c3      	movi      	r1, 195
 80139ac:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 80139ae:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 80139b0:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 80139b2:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 80139b4:	783c      	jmp      	r15
 80139b6:	0000      	.short	0x0000
 80139b8:	e000e100 	.long	0xe000e100
 80139bc:	40010600 	.long	0x40010600

080139c0 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80139c0:	1044      	lrw      	r2, 0x40010600	// 80139d0 <_out_uart+0x10>
 80139c2:	9267      	ld.w      	r3, (r2, 0x1c)
 80139c4:	e463203f 	andi      	r3, r3, 63
 80139c8:	3b1f      	cmphsi      	r3, 32
 80139ca:	0bfc      	bt      	0x80139c2	// 80139c2 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80139cc:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 80139ce:	783c      	jmp      	r15
 80139d0:	40010600 	.long	0x40010600

080139d4 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 80139d4:	783c      	jmp      	r15
	...

080139d8 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 80139d8:	ebe00058 	push      	r4-r11, r15, r16-r17
 80139dc:	6e4f      	mov      	r9, r3
 80139de:	da0e200e 	ld.w      	r16, (r14, 0x38)
 80139e2:	986b      	ld.w      	r3, (r14, 0x2c)
 80139e4:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80139e8:	e4702003 	andi      	r3, r16, 3
{
 80139ec:	6dc3      	mov      	r7, r0
 80139ee:	6e07      	mov      	r8, r1
 80139f0:	6e8b      	mov      	r10, r2
 80139f2:	98ac      	ld.w      	r5, (r14, 0x30)
 80139f4:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80139f8:	e9230010 	bnez      	r3, 0x8013a18	// 8013a18 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 80139fc:	66d4      	cmphs      	r5, r11
 80139fe:	080d      	bt      	0x8013a18	// 8013a18 <_out_rev+0x40>
 8013a00:	c4ab0086 	subu      	r6, r11, r5
 8013a04:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 8013a06:	5a82      	addi      	r4, r2, 1
 8013a08:	6ce7      	mov      	r3, r9
 8013a0a:	6c63      	mov      	r1, r8
 8013a0c:	3020      	movi      	r0, 32
 8013a0e:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8013a10:	6592      	cmpne      	r4, r6
 8013a12:	6c93      	mov      	r2, r4
 8013a14:	0bf9      	bt      	0x8013a06	// 8013a06 <_out_rev+0x2e>
 8013a16:	0402      	br      	0x8013a1a	// 8013a1a <_out_rev+0x42>
 8013a18:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 8013a1a:	e905002a 	bez      	r5, 0x8013a6e	// 8013a6e <_out_rev+0x96>
 8013a1e:	5dc3      	subi      	r6, r5, 1
 8013a20:	c4114823 	lsli      	r3, r17, 0
 8013a24:	60d8      	addu      	r3, r6
 8013a26:	6d8f      	mov      	r6, r3
 8013a28:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 8013a2a:	e6240000 	addi      	r17, r4, 1
 8013a2e:	6c93      	mov      	r2, r4
 8013a30:	8600      	ld.b      	r0, (r6, 0x0)
 8013a32:	6ce7      	mov      	r3, r9
 8013a34:	6c63      	mov      	r1, r8
 8013a36:	c4114824 	lsli      	r4, r17, 0
 8013a3a:	7bdd      	jsr      	r7
  while (len) {
 8013a3c:	6552      	cmpne      	r4, r5
 8013a3e:	2e00      	subi      	r6, 1
 8013a40:	0bf5      	bt      	0x8013a2a	// 8013a2a <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8013a42:	e6102002 	andi      	r16, r16, 2
 8013a46:	e9100011 	bez      	r16, 0x8013a68	// 8013a68 <_out_rev+0x90>
    while (idx - start_idx < width) {
 8013a4a:	c5450083 	subu      	r3, r5, r10
 8013a4e:	66cc      	cmphs      	r3, r11
 8013a50:	080c      	bt      	0x8013a68	// 8013a68 <_out_rev+0x90>
 8013a52:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8013a54:	2500      	addi      	r5, 1
 8013a56:	6ce7      	mov      	r3, r9
 8013a58:	6c63      	mov      	r1, r8
 8013a5a:	3020      	movi      	r0, 32
 8013a5c:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8013a5e:	c5450083 	subu      	r3, r5, r10
 8013a62:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8013a64:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8013a66:	0ff7      	bf      	0x8013a54	// 8013a54 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8013a68:	6c17      	mov      	r0, r5
 8013a6a:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8013a6e:	6d53      	mov      	r5, r4
 8013a70:	07e9      	br      	0x8013a42	// 8013a42 <_out_rev+0x6a>
	...

08013a74 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013a74:	14d1      	push      	r4, r15
 8013a76:	1424      	subi      	r14, r14, 16
 8013a78:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8013a7c:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8013a80:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8013a84:	e5b42002 	andi      	r13, r20, 2
{
 8013a88:	dace2006 	ld.w      	r22, (r14, 0x18)
 8013a8c:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013a90:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8013a94:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8013a98:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8013a9c:	e92d0039 	bnez      	r13, 0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013aa0:	e9320071 	bnez      	r18, 0x8013b82	// 8013b82 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013aa4:	c66c0420 	cmphs      	r12, r19
 8013aa8:	0833      	bt      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
 8013aaa:	eb0c001f 	cmphsi      	r12, 32
 8013aae:	e7142001 	andi      	r24, r20, 1
 8013ab2:	082e      	bt      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
 8013ab4:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013ab8:	ea150030 	movi      	r21, 48
 8013abc:	0406      	br      	0x8013ac8	// 8013ac8 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013abe:	eb4c0020 	cmpnei      	r12, 32
 8013ac2:	e5ad0000 	addi      	r13, r13, 1
 8013ac6:	0c08      	bf      	0x8013ad6	// 8013ad6 <_ntoa_format+0x62>
      buf[len++] = '0';
 8013ac8:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013acc:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 8013ad0:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013ad4:	0ff5      	bf      	0x8013abe	// 8013abe <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013ad6:	e918001c 	bez      	r24, 0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
 8013ada:	c64c0420 	cmphs      	r12, r18
 8013ade:	0818      	bt      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
 8013ae0:	ea0d001f 	movi      	r13, 31
 8013ae4:	6734      	cmphs      	r13, r12
 8013ae6:	0c62      	bf      	0x8013baa	// 8013baa <_ntoa_format+0x136>
 8013ae8:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8013aec:	ea150030 	movi      	r21, 48
 8013af0:	0406      	br      	0x8013afc	// 8013afc <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013af2:	eb4c0020 	cmpnei      	r12, 32
 8013af6:	e5ad0000 	addi      	r13, r13, 1
 8013afa:	0c58      	bf      	0x8013baa	// 8013baa <_ntoa_format+0x136>
      buf[len++] = '0';
 8013afc:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b00:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8013b04:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b08:	0bf5      	bt      	0x8013af2	// 8013af2 <_ntoa_format+0x7e>
      buf[len++] = '0';
 8013b0a:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8013b0e:	e5b42010 	andi      	r13, r20, 16
 8013b12:	e90d0019 	bez      	r13, 0x8013b44	// 8013b44 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013b16:	e5b42400 	andi      	r13, r20, 1024
 8013b1a:	e92d0004 	bnez      	r13, 0x8013b22	// 8013b22 <_ntoa_format+0xae>
 8013b1e:	e92c004e 	bnez      	r12, 0x8013bba	// 8013bba <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b22:	c4194824 	lsli      	r4, r25, 0
 8013b26:	3c50      	cmpnei      	r4, 16
 8013b28:	0c74      	bf      	0x8013c10	// 8013c10 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b2a:	c4194824 	lsli      	r4, r25, 0
 8013b2e:	3c42      	cmpnei      	r4, 2
 8013b30:	0c7e      	bf      	0x8013c2c	// 8013c2c <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013b32:	eb0c001f 	cmphsi      	r12, 32
 8013b36:	081a      	bt      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
      buf[len++] = '0';
 8013b38:	ea0d0030 	movi      	r13, 48
 8013b3c:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b40:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8013b44:	eb0c001f 	cmphsi      	r12, 32
 8013b48:	0811      	bt      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
    if (negative) {
 8013b4a:	e9370048 	bnez      	r23, 0x8013bda	// 8013bda <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8013b4e:	e5b42004 	andi      	r13, r20, 4
 8013b52:	e92d0056 	bnez      	r13, 0x8013bfe	// 8013bfe <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8013b56:	e5b42008 	andi      	r13, r20, 8
 8013b5a:	e90d0008 	bez      	r13, 0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8013b5e:	ea0d0020 	movi      	r13, 32
 8013b62:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013b66:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013b6a:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013b6e:	de4e2002 	st.w      	r18, (r14, 0x8)
 8013b72:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8013b76:	dece2000 	st.w      	r22, (r14, 0x0)
 8013b7a:	e3ffff2f 	bsr      	0x80139d8	// 80139d8 <_out_rev>
}
 8013b7e:	1404      	addi      	r14, r14, 16
 8013b80:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8013b82:	e7142001 	andi      	r24, r20, 1
 8013b86:	e9180031 	bez      	r24, 0x8013be8	// 8013be8 <_ntoa_format+0x174>
 8013b8a:	e9370037 	bnez      	r23, 0x8013bf8	// 8013bf8 <_ntoa_format+0x184>
 8013b8e:	e5b4200c 	andi      	r13, r20, 12
 8013b92:	e92d0033 	bnez      	r13, 0x8013bf8	// 8013bf8 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013b96:	c66c0420 	cmphs      	r12, r19
 8013b9a:	0ba0      	bt      	0x8013ada	// 8013ada <_ntoa_format+0x66>
 8013b9c:	ea0d001f 	movi      	r13, 31
 8013ba0:	6734      	cmphs      	r13, r12
 8013ba2:	0b89      	bt      	0x8013ab4	// 8013ab4 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013ba4:	c64c0420 	cmphs      	r12, r18
 8013ba8:	0bb3      	bt      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8013baa:	e5b42010 	andi      	r13, r20, 16
 8013bae:	e90dffde 	bez      	r13, 0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8013bb2:	e5b42400 	andi      	r13, r20, 1024
 8013bb6:	e92dffb6 	bnez      	r13, 0x8013b22	// 8013b22 <_ntoa_format+0xae>
 8013bba:	c5930480 	cmpne      	r19, r12
 8013bbe:	0c04      	bf      	0x8013bc6	// 8013bc6 <_ntoa_format+0x152>
 8013bc0:	c64c0480 	cmpne      	r12, r18
 8013bc4:	0baf      	bt      	0x8013b22	// 8013b22 <_ntoa_format+0xae>
      len--;
 8013bc6:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 8013bca:	e90d0046 	bez      	r13, 0x8013c56	// 8013c56 <_ntoa_format+0x1e2>
 8013bce:	c4194824 	lsli      	r4, r25, 0
 8013bd2:	3c50      	cmpnei      	r4, 16
 8013bd4:	0c1c      	bf      	0x8013c0c	// 8013c0c <_ntoa_format+0x198>
 8013bd6:	6f37      	mov      	r12, r13
 8013bd8:	07a9      	br      	0x8013b2a	// 8013b2a <_ntoa_format+0xb6>
      buf[len++] = '-';
 8013bda:	ea0d002d 	movi      	r13, 45
 8013bde:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013be2:	e58c0000 	addi      	r12, r12, 1
 8013be6:	07c2      	br      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013be8:	c66c0420 	cmphs      	r12, r19
 8013bec:	0b91      	bt      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
 8013bee:	ea0d001f 	movi      	r13, 31
 8013bf2:	6734      	cmphs      	r13, r12
 8013bf4:	0b60      	bt      	0x8013ab4	// 8013ab4 <_ntoa_format+0x40>
 8013bf6:	078c      	br      	0x8013b0e	// 8013b0e <_ntoa_format+0x9a>
      width--;
 8013bf8:	e6521000 	subi      	r18, r18, 1
 8013bfc:	07cd      	br      	0x8013b96	// 8013b96 <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8013bfe:	ea0d002b 	movi      	r13, 43
 8013c02:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013c06:	e58c0000 	addi      	r12, r12, 1
 8013c0a:	07b0      	br      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
        len--;
 8013c0c:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c10:	e5b42020 	andi      	r13, r20, 32
 8013c14:	e92d0016 	bnez      	r13, 0x8013c40	// 8013c40 <_ntoa_format+0x1cc>
 8013c18:	eb0c001f 	cmphsi      	r12, 32
 8013c1c:	0ba7      	bt      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8013c1e:	ea0d0078 	movi      	r13, 120
 8013c22:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013c26:	e58c0000 	addi      	r12, r12, 1
 8013c2a:	0784      	br      	0x8013b32	// 8013b32 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c2c:	eb0c001f 	cmphsi      	r12, 32
 8013c30:	0b9d      	bt      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8013c32:	ea0d0062 	movi      	r13, 98
 8013c36:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013c3a:	e58c0000 	addi      	r12, r12, 1
 8013c3e:	077a      	br      	0x8013b32	// 8013b32 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8013c40:	ea0d001f 	movi      	r13, 31
 8013c44:	6734      	cmphs      	r13, r12
 8013c46:	0f92      	bf      	0x8013b6a	// 8013b6a <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8013c48:	ea0d0058 	movi      	r13, 88
 8013c4c:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8013c50:	e58c0000 	addi      	r12, r12, 1
 8013c54:	076f      	br      	0x8013b32	// 8013b32 <_ntoa_format+0xbe>
 8013c56:	6f37      	mov      	r12, r13
 8013c58:	0765      	br      	0x8013b22	// 8013b22 <_ntoa_format+0xae>
	...

08013c5c <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013c5c:	14d3      	push      	r4-r6, r15
 8013c5e:	142f      	subi      	r14, r14, 60
 8013c60:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8013c64:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8013c68:	6d77      	mov      	r5, r13
 8013c6a:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8013c6e:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8013c72:	6db7      	mov      	r6, r13
 8013c74:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8013c78:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013c7c:	e92c000a 	bnez      	r12, 0x8013c90	// 8013c90 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8013c80:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013c84:	e7182400 	andi      	r24, r24, 1024
 8013c88:	e9380043 	bnez      	r24, 0x8013d0e	// 8013d0e <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8013c8c:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013c90:	e5b82020 	andi      	r13, r24, 32
 8013c94:	eb4d0000 	cmpnei      	r13, 0
 8013c98:	ea170041 	movi      	r23, 65
 8013c9c:	ea0d0061 	movi      	r13, 97
 8013ca0:	c6ed0c20 	incf      	r23, r13, 0
 8013ca4:	e72e001b 	addi      	r25, r14, 28
 8013ca8:	c4194832 	lsli      	r18, r25, 0
 8013cac:	ea150000 	movi      	r21, 0
 8013cb0:	e6f71009 	subi      	r23, r23, 10
 8013cb4:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8013cb8:	c68c802d 	divu      	r13, r12, r20
 8013cbc:	c68d8436 	mult      	r22, r13, r20
 8013cc0:	c6cc008c 	subu      	r12, r12, r22
 8013cc4:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013cc6:	eb0c0009 	cmphsi      	r12, 10
 8013cca:	e6b50000 	addi      	r21, r21, 1
 8013cce:	081c      	bt      	0x8013d06	// 8013d06 <_ntoa_long+0xaa>
 8013cd0:	e58c002f 	addi      	r12, r12, 48
 8013cd4:	7730      	zextb      	r12, r12
 8013cd6:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 8013cda:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013cdc:	e90d0006 	bez      	r13, 0x8013ce8	// 8013ce8 <_ntoa_long+0x8c>
 8013ce0:	e6520000 	addi      	r18, r18, 1
 8013ce4:	e833ffea 	bnezad      	r19, 0x8013cb8	// 8013cb8 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013ce8:	df0e2006 	st.w      	r24, (r14, 0x18)
 8013cec:	b8c5      	st.w      	r6, (r14, 0x14)
 8013cee:	b8a4      	st.w      	r5, (r14, 0x10)
 8013cf0:	de8e2003 	st.w      	r20, (r14, 0xc)
 8013cf4:	b882      	st.w      	r4, (r14, 0x8)
 8013cf6:	deae2001 	st.w      	r21, (r14, 0x4)
 8013cfa:	df2e2000 	st.w      	r25, (r14, 0x0)
 8013cfe:	e3fffebb 	bsr      	0x8013a74	// 8013a74 <_ntoa_format>
}
 8013d02:	140f      	addi      	r14, r14, 60
 8013d04:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013d06:	c6ec002c 	addu      	r12, r12, r23
 8013d0a:	7730      	zextb      	r12, r12
 8013d0c:	07e5      	br      	0x8013cd6	// 8013cd6 <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8013d0e:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8013d12:	c40c4835 	lsli      	r21, r12, 0
 8013d16:	e72e001b 	addi      	r25, r14, 28
 8013d1a:	07e7      	br      	0x8013ce8	// 8013ce8 <_ntoa_long+0x8c>

08013d1c <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013d1c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013d20:	1435      	subi      	r14, r14, 84
 8013d22:	c4034831 	lsli      	r17, r3, 0
 8013d26:	d96e2020 	ld.w      	r11, (r14, 0x80)
 8013d2a:	9965      	ld.w      	r3, (r14, 0x94)
 8013d2c:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8013d30:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8013d32:	c60b2424 	or      	r4, r11, r16
{
 8013d36:	9966      	ld.w      	r3, (r14, 0x98)
 8013d38:	b86c      	st.w      	r3, (r14, 0x30)
 8013d3a:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8013d3e:	b807      	st.w      	r0, (r14, 0x1c)
 8013d40:	b828      	st.w      	r1, (r14, 0x20)
 8013d42:	b849      	st.w      	r2, (r14, 0x24)
 8013d44:	99c3      	ld.w      	r6, (r14, 0x8c)
 8013d46:	99e4      	ld.w      	r7, (r14, 0x90)
 8013d48:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8013d4c:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8013d4e:	e9240009 	bnez      	r4, 0x8013d60	// 8013d60 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8013d52:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8013d56:	c48a2823 	bclri      	r3, r10, 4
 8013d5a:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8013d5c:	e9220033 	bnez      	r2, 0x8013dc2	// 8013dc2 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013d60:	e46a2020 	andi      	r3, r10, 32
 8013d64:	3b40      	cmpnei      	r3, 0
 8013d66:	ea080041 	movi      	r8, 65
 8013d6a:	3361      	movi      	r3, 97
 8013d6c:	c5030c20 	incf      	r8, r3, 0
 8013d70:	e52e0033 	addi      	r9, r14, 52
 8013d74:	6d67      	mov      	r5, r9
 8013d76:	3400      	movi      	r4, 0
 8013d78:	e5081009 	subi      	r8, r8, 10
 8013d7c:	0415      	br      	0x8013da6	// 8013da6 <_ntoa_long_long+0x8a>
 8013d7e:	202f      	addi      	r0, 48
 8013d80:	7400      	zextb      	r0, r0
 8013d82:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8013d84:	c4104821 	lsli      	r1, r16, 0
 8013d88:	6c2f      	mov      	r0, r11
 8013d8a:	6c9b      	mov      	r2, r6
 8013d8c:	6cdf      	mov      	r3, r7
 8013d8e:	e3ffe493 	bsr      	0x80106b4	// 80106b4 <__udivdi3>
 8013d92:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013d96:	6c40      	or      	r1, r0
      value /= base;
 8013d98:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8013d9a:	e9010016 	bez      	r1, 0x8013dc6	// 8013dc6 <_ntoa_long_long+0xaa>
 8013d9e:	eb440020 	cmpnei      	r4, 32
 8013da2:	2500      	addi      	r5, 1
 8013da4:	0c11      	bf      	0x8013dc6	// 8013dc6 <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 8013da6:	6c9b      	mov      	r2, r6
 8013da8:	6cdf      	mov      	r3, r7
 8013daa:	6c2f      	mov      	r0, r11
 8013dac:	c4104821 	lsli      	r1, r16, 0
 8013db0:	e3ffe61c 	bsr      	0x80109e8	// 80109e8 <__umoddi3>
 8013db4:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8013db6:	3809      	cmphsi      	r0, 10
 8013db8:	2400      	addi      	r4, 1
 8013dba:	0fe2      	bf      	0x8013d7e	// 8013d7e <_ntoa_long_long+0x62>
 8013dbc:	6020      	addu      	r0, r8
 8013dbe:	7400      	zextb      	r0, r0
 8013dc0:	07e1      	br      	0x8013d82	// 8013d82 <_ntoa_long_long+0x66>
 8013dc2:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8013dc6:	986c      	ld.w      	r3, (r14, 0x30)
 8013dc8:	b865      	st.w      	r3, (r14, 0x14)
 8013dca:	986b      	ld.w      	r3, (r14, 0x2c)
 8013dcc:	b864      	st.w      	r3, (r14, 0x10)
 8013dce:	986a      	ld.w      	r3, (r14, 0x28)
 8013dd0:	b862      	st.w      	r3, (r14, 0x8)
 8013dd2:	dd4e2006 	st.w      	r10, (r14, 0x18)
 8013dd6:	b8c3      	st.w      	r6, (r14, 0xc)
 8013dd8:	b881      	st.w      	r4, (r14, 0x4)
 8013dda:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8013dde:	c4114823 	lsli      	r3, r17, 0
 8013de2:	9849      	ld.w      	r2, (r14, 0x24)
 8013de4:	9828      	ld.w      	r1, (r14, 0x20)
 8013de6:	9807      	ld.w      	r0, (r14, 0x1c)
 8013de8:	e3fffe46 	bsr      	0x8013a74	// 8013a74 <_ntoa_format>
}
 8013dec:	1415      	addi      	r14, r14, 84
 8013dee:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

08013df4 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8013df4:	ebe00058 	push      	r4-r11, r15, r16-r17
 8013df8:	1435      	subi      	r14, r14, 84
 8013dfa:	6ecf      	mov      	r11, r3
 8013dfc:	9962      	ld.w      	r3, (r14, 0x88)
 8013dfe:	6e4f      	mov      	r9, r3
 8013e00:	9963      	ld.w      	r3, (r14, 0x8c)
 8013e02:	9980      	ld.w      	r4, (r14, 0x80)
 8013e04:	99a1      	ld.w      	r5, (r14, 0x84)
 8013e06:	b865      	st.w      	r3, (r14, 0x14)
 8013e08:	9964      	ld.w      	r3, (r14, 0x90)
 8013e0a:	6d83      	mov      	r6, r0
 8013e0c:	6dc7      	mov      	r7, r1
 8013e0e:	6e8b      	mov      	r10, r2
 8013e10:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8013e12:	6c93      	mov      	r2, r4
 8013e14:	6cd7      	mov      	r3, r5
 8013e16:	6c13      	mov      	r0, r4
 8013e18:	6c57      	mov      	r1, r5
 8013e1a:	e3ffeab3 	bsr      	0x8011380	// 8011380 <__nedf2>
 8013e1e:	e920010c 	bnez      	r0, 0x8014036	// 8014036 <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8013e22:	3200      	movi      	r2, 0
 8013e24:	ea23fff0 	movih      	r3, 65520
 8013e28:	2a00      	subi      	r2, 1
 8013e2a:	2b00      	subi      	r3, 1
 8013e2c:	6c13      	mov      	r0, r4
 8013e2e:	9921      	ld.w      	r1, (r14, 0x84)
 8013e30:	e3ffeb04 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013e34:	e980011b 	blz      	r0, 0x801406a	// 801406a <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8013e38:	3200      	movi      	r2, 0
 8013e3a:	ea237ff0 	movih      	r3, 32752
 8013e3e:	2a00      	subi      	r2, 1
 8013e40:	2b00      	subi      	r3, 1
 8013e42:	6c13      	mov      	r0, r4
 8013e44:	9921      	ld.w      	r1, (r14, 0x84)
 8013e46:	e3ffeab9 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013e4a:	e960001d 	blsz      	r0, 0x8013e84	// 8013e84 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8013e4e:	9806      	ld.w      	r0, (r14, 0x18)
 8013e50:	e4402004 	andi      	r2, r0, 4
 8013e54:	3a40      	cmpnei      	r2, 0
 8013e56:	0137      	lrw      	r1, 0x80157ec	// 8014174 <_ftoa+0x380>
 8013e58:	0177      	lrw      	r3, 0x80157e4	// 8014178 <_ftoa+0x384>
 8013e5a:	c4610c20 	incf      	r3, r1, 0
 8013e5e:	3a40      	cmpnei      	r2, 0
 8013e60:	3103      	movi      	r1, 3
 8013e62:	3204      	movi      	r2, 4
 8013e64:	c4410c20 	incf      	r2, r1, 0
 8013e68:	9825      	ld.w      	r1, (r14, 0x14)
 8013e6a:	b803      	st.w      	r0, (r14, 0xc)
 8013e6c:	b822      	st.w      	r1, (r14, 0x8)
 8013e6e:	b841      	st.w      	r2, (r14, 0x4)
 8013e70:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8013e72:	6cef      	mov      	r3, r11
 8013e74:	6cab      	mov      	r2, r10
 8013e76:	6c5f      	mov      	r1, r7
 8013e78:	6c1b      	mov      	r0, r6
 8013e7a:	e3fffdaf 	bsr      	0x80139d8	// 80139d8 <_out_rev>
}
 8013e7e:	1415      	addi      	r14, r14, 84
 8013e80:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8013e84:	3200      	movi      	r2, 0
 8013e86:	0261      	lrw      	r3, 0x41cdcd65	// 801417c <_ftoa+0x388>
 8013e88:	6c13      	mov      	r0, r4
 8013e8a:	9921      	ld.w      	r1, (r14, 0x84)
 8013e8c:	e3ffea96 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013e90:	e94000dc 	bhz      	r0, 0x8014048	// 8014048 <_ftoa+0x254>
 8013e94:	3200      	movi      	r2, 0
 8013e96:	0264      	lrw      	r3, 0xc1cdcd65	// 8014180 <_ftoa+0x38c>
 8013e98:	6c13      	mov      	r0, r4
 8013e9a:	9921      	ld.w      	r1, (r14, 0x84)
 8013e9c:	e3ffeace 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013ea0:	e98000d4 	blz      	r0, 0x8014048	// 8014048 <_ftoa+0x254>
  if (value < 0) {
 8013ea4:	3200      	movi      	r2, 0
 8013ea6:	6ccb      	mov      	r3, r2
 8013ea8:	6c13      	mov      	r0, r4
 8013eaa:	9921      	ld.w      	r1, (r14, 0x84)
 8013eac:	e3ffeac6 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013eb0:	e98001b0 	blz      	r0, 0x8014210	// 8014210 <_ftoa+0x41c>
  bool negative = false;
 8013eb4:	3300      	movi      	r3, 0
 8013eb6:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8013eb8:	9866      	ld.w      	r3, (r14, 0x18)
 8013eba:	e5a32400 	andi      	r13, r3, 1024
 8013ebe:	e92d0136 	bnez      	r13, 0x801412a	// 801412a <_ftoa+0x336>
 8013ec2:	026e      	lrw      	r3, 0x412e8480	// 8014184 <_ftoa+0x390>
 8013ec4:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8013ec8:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8013eca:	ea080006 	movi      	r8, 6
 8013ece:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 8013ed2:	6c57      	mov      	r1, r5
 8013ed4:	6c13      	mov      	r0, r4
 8013ed6:	de8e200b 	st.w      	r20, (r14, 0x2c)
 8013eda:	ddae200a 	st.w      	r13, (r14, 0x28)
 8013ede:	e3ffeafd 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8013ee2:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 8013ee4:	e3ffeac6 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8013ee8:	6c83      	mov      	r2, r0
 8013eea:	6cc7      	mov      	r3, r1
 8013eec:	6c13      	mov      	r0, r4
 8013eee:	6c57      	mov      	r1, r5
 8013ef0:	e3ffe89e 	bsr      	0x801102c	// 801102c <__subdf3>
 8013ef4:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013ef8:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013efc:	6cb3      	mov      	r2, r12
 8013efe:	9868      	ld.w      	r3, (r14, 0x20)
 8013f00:	e3ffe8b4 	bsr      	0x8011068	// 8011068 <__muldf3>
 8013f04:	c4014831 	lsli      	r17, r1, 0
 8013f08:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 8013f0c:	e3ffe3b8 	bsr      	0x801067c	// 801067c <__fixunsdfsi>
 8013f10:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8013f12:	e3ffeb4d 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8013f16:	6c83      	mov      	r2, r0
 8013f18:	6cc7      	mov      	r3, r1
 8013f1a:	c4104820 	lsli      	r0, r16, 0
 8013f1e:	c4114821 	lsli      	r1, r17, 0
 8013f22:	e3ffe885 	bsr      	0x801102c	// 801102c <__subdf3>
  if (diff > 0.5) {
 8013f26:	3200      	movi      	r2, 0
 8013f28:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8013f2c:	c4004830 	lsli      	r16, r0, 0
 8013f30:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8013f34:	e3ffea42 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 8013f38:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8013f3c:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8013f40:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8013f44:	e96000d3 	blsz      	r0, 0x80140ea	// 80140ea <_ftoa+0x2f6>
    ++frac;
 8013f48:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8013f4c:	c4124820 	lsli      	r0, r18, 0
 8013f50:	de8e2009 	st.w      	r20, (r14, 0x24)
 8013f54:	c40d4831 	lsli      	r17, r13, 0
 8013f58:	c4124830 	lsli      	r16, r18, 0
 8013f5c:	e3ffeb28 	bsr      	0x80115ac	// 80115ac <__floatunsidf>
 8013f60:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8013f64:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8013f68:	6cf7      	mov      	r3, r13
 8013f6a:	6cb3      	mov      	r2, r12
 8013f6c:	e3ffea46 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8013f70:	c4104832 	lsli      	r18, r16, 0
 8013f74:	c411482d 	lsli      	r13, r17, 0
 8013f78:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8013f7c:	e9a0011f 	bhsz      	r0, 0x80141ba	// 80141ba <_ftoa+0x3c6>
  if (prec == 0U) {
 8013f80:	e928007e 	bnez      	r8, 0x801407c	// 801407c <_ftoa+0x288>
    diff = value - (double)whole;
 8013f84:	6c27      	mov      	r0, r9
 8013f86:	c4144831 	lsli      	r17, r20, 0
 8013f8a:	c40d4830 	lsli      	r16, r13, 0
 8013f8e:	e3ffea71 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8013f92:	6c83      	mov      	r2, r0
 8013f94:	6cc7      	mov      	r3, r1
 8013f96:	6c13      	mov      	r0, r4
 8013f98:	6c57      	mov      	r1, r5
 8013f9a:	e3ffe849 	bsr      	0x801102c	// 801102c <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013f9e:	6ca3      	mov      	r2, r8
 8013fa0:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8013fa4:	6d03      	mov      	r4, r0
 8013fa6:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8013fa8:	e3ffea48 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8013fac:	c410482d 	lsli      	r13, r16, 0
 8013fb0:	c4114834 	lsli      	r20, r17, 0
 8013fb4:	e98000f5 	blz      	r0, 0x801419e	// 801419e <_ftoa+0x3aa>
 8013fb8:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8013fbc:	3b40      	cmpnei      	r3, 0
 8013fbe:	c4690c20 	incf      	r3, r9, 0
 8013fc2:	c4690c41 	inct      	r3, r9, 1
 8013fc6:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013fc8:	eb4d0020 	cmpnei      	r13, 32
 8013fcc:	0c81      	bf      	0x80140ce	// 80140ce <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8013fce:	300a      	movi      	r0, 10
 8013fd0:	c4098043 	divs      	r3, r9, r0
 8013fd4:	6d27      	mov      	r4, r9
 8013fd6:	c4038421 	mult      	r1, r3, r0
 8013fda:	5c25      	subu      	r1, r4, r1
 8013fdc:	212f      	addi      	r1, 48
 8013fde:	e44d0000 	addi      	r2, r13, 1
 8013fe2:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 8013fe6:	e9030013 	bez      	r3, 0x801400c	// 801400c <_ftoa+0x218>
 8013fea:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8013fee:	eb420020 	cmpnei      	r2, 32
 8013ff2:	0c6e      	bf      	0x80140ce	// 80140ce <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8013ff4:	c4038041 	divs      	r1, r3, r0
 8013ff8:	c401842d 	mult      	r13, r1, r0
 8013ffc:	60f6      	subu      	r3, r13
 8013ffe:	232f      	addi      	r3, 48
 8014000:	d40c8003 	stbi.b      	r3, (r12)
 8014004:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 8014006:	6cc7      	mov      	r3, r1
 8014008:	e921fff3 	bnez      	r1, 0x8013fee	// 8013fee <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801400c:	9866      	ld.w      	r3, (r14, 0x18)
 801400e:	e4632003 	andi      	r3, r3, 3
 8014012:	3b41      	cmpnei      	r3, 1
 8014014:	0cda      	bf      	0x80141c8	// 80141c8 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014016:	eb420020 	cmpnei      	r2, 32
 801401a:	0d27      	bf      	0x8014268	// 8014268 <_ftoa+0x474>
    if (negative) {
 801401c:	986c      	ld.w      	r3, (r14, 0x30)
 801401e:	e92300bb 	bnez      	r3, 0x8014194	// 8014194 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8014022:	9866      	ld.w      	r3, (r14, 0x18)
 8014024:	e4632004 	andi      	r3, r3, 4
 8014028:	e9030116 	bez      	r3, 0x8014254	// 8014254 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 801402c:	312b      	movi      	r1, 43
 801402e:	5a62      	addi      	r3, r2, 1
 8014030:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8014034:	0453      	br      	0x80140da	// 80140da <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8014036:	9866      	ld.w      	r3, (r14, 0x18)
 8014038:	b863      	st.w      	r3, (r14, 0xc)
 801403a:	9865      	ld.w      	r3, (r14, 0x14)
 801403c:	b862      	st.w      	r3, (r14, 0x8)
 801403e:	3303      	movi      	r3, 3
 8014040:	b861      	st.w      	r3, (r14, 0x4)
 8014042:	1272      	lrw      	r3, 0x80157f0	// 8014188 <_ftoa+0x394>
 8014044:	b860      	st.w      	r3, (r14, 0x0)
 8014046:	0716      	br      	0x8013e72	// 8013e72 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8014048:	9866      	ld.w      	r3, (r14, 0x18)
 801404a:	b864      	st.w      	r3, (r14, 0x10)
 801404c:	9865      	ld.w      	r3, (r14, 0x14)
 801404e:	b863      	st.w      	r3, (r14, 0xc)
 8014050:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8014054:	b880      	st.w      	r4, (r14, 0x0)
 8014056:	b8a1      	st.w      	r5, (r14, 0x4)
 8014058:	6cef      	mov      	r3, r11
 801405a:	6cab      	mov      	r2, r10
 801405c:	6c5f      	mov      	r1, r7
 801405e:	6c1b      	mov      	r0, r6
 8014060:	e0000116 	bsr      	0x801428c	// 801428c <_etoa>
}
 8014064:	1415      	addi      	r14, r14, 84
 8014066:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 801406a:	9866      	ld.w      	r3, (r14, 0x18)
 801406c:	b863      	st.w      	r3, (r14, 0xc)
 801406e:	9865      	ld.w      	r3, (r14, 0x14)
 8014070:	b862      	st.w      	r3, (r14, 0x8)
 8014072:	3304      	movi      	r3, 4
 8014074:	b861      	st.w      	r3, (r14, 0x4)
 8014076:	1266      	lrw      	r3, 0x80157f4	// 801418c <_ftoa+0x398>
 8014078:	b860      	st.w      	r3, (r14, 0x0)
 801407a:	06fc      	br      	0x8013e72	// 8013e72 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 801407c:	eb4d0020 	cmpnei      	r13, 32
 8014080:	0c27      	bf      	0x80140ce	// 80140ce <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 8014082:	300a      	movi      	r0, 10
 8014084:	c4128023 	divu      	r3, r18, r0
 8014088:	c4038421 	mult      	r1, r3, r0
 801408c:	c4320092 	subu      	r18, r18, r1
 8014090:	e652002f 	addi      	r18, r18, 48
      --count;
 8014094:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8014098:	e44d0000 	addi      	r2, r13, 1
 801409c:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 80140a0:	e90300c3 	bez      	r3, 0x8014226	// 8014226 <_ftoa+0x432>
 80140a4:	c454002d 	addu      	r13, r20, r2
 80140a8:	0410      	br      	0x80140c8	// 80140c8 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 80140aa:	c4038021 	divu      	r1, r3, r0
 80140ae:	c4018432 	mult      	r18, r1, r0
 80140b2:	c6430083 	subu      	r3, r3, r18
 80140b6:	232f      	addi      	r3, 48
 80140b8:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 80140bc:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 80140c0:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 80140c2:	6cc7      	mov      	r3, r1
 80140c4:	e90100b1 	bez      	r1, 0x8014226	// 8014226 <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80140c8:	eb420020 	cmpnei      	r2, 32
 80140cc:	0bef      	bt      	0x80140aa	// 80140aa <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80140ce:	9866      	ld.w      	r3, (r14, 0x18)
 80140d0:	e4632003 	andi      	r3, r3, 3
 80140d4:	3b41      	cmpnei      	r3, 1
 80140d6:	0c78      	bf      	0x80141c6	// 80141c6 <_ftoa+0x3d2>
 80140d8:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80140da:	9846      	ld.w      	r2, (r14, 0x18)
 80140dc:	b843      	st.w      	r2, (r14, 0xc)
 80140de:	9845      	ld.w      	r2, (r14, 0x14)
 80140e0:	b842      	st.w      	r2, (r14, 0x8)
 80140e2:	b861      	st.w      	r3, (r14, 0x4)
 80140e4:	de8e2000 	st.w      	r20, (r14, 0x0)
 80140e8:	06c5      	br      	0x8013e72	// 8013e72 <_ftoa+0x7e>
  else if (diff < 0.5) {
 80140ea:	3200      	movi      	r2, 0
 80140ec:	ea233fe0 	movih      	r3, 16352
 80140f0:	c4104820 	lsli      	r0, r16, 0
 80140f4:	c4114821 	lsli      	r1, r17, 0
 80140f8:	de8e200a 	st.w      	r20, (r14, 0x28)
 80140fc:	de4e2009 	st.w      	r18, (r14, 0x24)
 8014100:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8014104:	e3ffe99a 	bsr      	0x8011438	// 8011438 <__ltdf2>
 8014108:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 801410c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8014110:	da8e200a 	ld.w      	r20, (r14, 0x28)
 8014114:	e980ff36 	blz      	r0, 0x8013f80	// 8013f80 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 8014118:	e9120006 	bez      	r18, 0x8014124	// 8014124 <_ftoa+0x330>
 801411c:	e4722001 	andi      	r3, r18, 1
 8014120:	e903ff30 	bez      	r3, 0x8013f80	// 8013f80 <_ftoa+0x18c>
    ++frac;
 8014124:	e6520000 	addi      	r18, r18, 1
 8014128:	072c      	br      	0x8013f80	// 8013f80 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801412a:	6ce7      	mov      	r3, r9
 801412c:	3b09      	cmphsi      	r3, 10
 801412e:	0c9f      	bf      	0x801426c	// 801426c <_ftoa+0x478>
    buf[len++] = '0';
 8014130:	e68e0033 	addi      	r20, r14, 52
 8014134:	3030      	movi      	r0, 48
 8014136:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801413a:	e5091000 	subi      	r8, r9, 1
 801413e:	e44e0034 	addi      	r2, r14, 53
 8014142:	e4291008 	subi      	r1, r9, 9
 8014146:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 801414a:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801414c:	6476      	cmpne      	r13, r1
 801414e:	0c09      	bf      	0x8014160	// 8014160 <_ftoa+0x36c>
    buf[len++] = '0';
 8014150:	e5ad0000 	addi      	r13, r13, 1
 8014154:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 8014158:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801415c:	e823fff8 	bnezad      	r3, 0x801414c	// 801414c <_ftoa+0x358>
 8014160:	104c      	lrw      	r2, 0x80157fc	// 8014190 <_ftoa+0x39c>
 8014162:	c4684823 	lsli      	r3, r8, 3
 8014166:	60c8      	addu      	r3, r2
 8014168:	9340      	ld.w      	r2, (r3, 0x0)
 801416a:	9361      	ld.w      	r3, (r3, 0x4)
 801416c:	b847      	st.w      	r2, (r14, 0x1c)
 801416e:	b868      	st.w      	r3, (r14, 0x20)
 8014170:	06b1      	br      	0x8013ed2	// 8013ed2 <_ftoa+0xde>
 8014172:	0000      	.short	0x0000
 8014174:	080157ec 	.long	0x080157ec
 8014178:	080157e4 	.long	0x080157e4
 801417c:	41cdcd65 	.long	0x41cdcd65
 8014180:	c1cdcd65 	.long	0xc1cdcd65
 8014184:	412e8480 	.long	0x412e8480
 8014188:	080157f0 	.long	0x080157f0
 801418c:	080157f4 	.long	0x080157f4
 8014190:	080157fc 	.long	0x080157fc
      buf[len++] = '-';
 8014194:	312d      	movi      	r1, 45
 8014196:	5a62      	addi      	r3, r2, 1
 8014198:	d4540021 	str.b      	r1, (r20, r2 << 0)
 801419c:	079f      	br      	0x80140da	// 80140da <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801419e:	6ca3      	mov      	r2, r8
 80141a0:	ea233fe0 	movih      	r3, 16352
 80141a4:	6c13      	mov      	r0, r4
 80141a6:	6c57      	mov      	r1, r5
 80141a8:	e3ffe908 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80141ac:	c410482d 	lsli      	r13, r16, 0
 80141b0:	c4114834 	lsli      	r20, r17, 0
 80141b4:	e960ff0a 	blsz      	r0, 0x8013fc8	// 8013fc8 <_ftoa+0x1d4>
 80141b8:	0700      	br      	0x8013fb8	// 8013fb8 <_ftoa+0x1c4>
      ++whole;
 80141ba:	6ce7      	mov      	r3, r9
 80141bc:	2300      	addi      	r3, 1
 80141be:	6e4f      	mov      	r9, r3
      frac = 0;
 80141c0:	ea120000 	movi      	r18, 0
 80141c4:	06de      	br      	0x8013f80	// 8013f80 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80141c6:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80141c8:	9865      	ld.w      	r3, (r14, 0x14)
 80141ca:	e903ff26 	bez      	r3, 0x8014016	// 8014016 <_ftoa+0x222>
 80141ce:	986c      	ld.w      	r3, (r14, 0x30)
 80141d0:	e9230007 	bnez      	r3, 0x80141de	// 80141de <_ftoa+0x3ea>
 80141d4:	9866      	ld.w      	r3, (r14, 0x18)
 80141d6:	e463200c 	andi      	r3, r3, 12
 80141da:	e9030005 	bez      	r3, 0x80141e4	// 80141e4 <_ftoa+0x3f0>
      width--;
 80141de:	9865      	ld.w      	r3, (r14, 0x14)
 80141e0:	2b00      	subi      	r3, 1
 80141e2:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80141e4:	9865      	ld.w      	r3, (r14, 0x14)
 80141e6:	64c8      	cmphs      	r2, r3
 80141e8:	0b17      	bt      	0x8014016	// 8014016 <_ftoa+0x222>
 80141ea:	eb420020 	cmpnei      	r2, 32
 80141ee:	0c3d      	bf      	0x8014268	// 8014268 <_ftoa+0x474>
 80141f0:	c4540021 	addu      	r1, r20, r2
 80141f4:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 80141f6:	3230      	movi      	r2, 48
 80141f8:	0405      	br      	0x8014202	// 8014202 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80141fa:	eb430020 	cmpnei      	r3, 32
 80141fe:	2100      	addi      	r1, 1
 8014200:	0f6d      	bf      	0x80140da	// 80140da <_ftoa+0x2e6>
      buf[len++] = '0';
 8014202:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014204:	9805      	ld.w      	r0, (r14, 0x14)
 8014206:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8014208:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801420a:	0bf8      	bt      	0x80141fa	// 80141fa <_ftoa+0x406>
      buf[len++] = '0';
 801420c:	9845      	ld.w      	r2, (r14, 0x14)
 801420e:	0704      	br      	0x8014016	// 8014016 <_ftoa+0x222>
    value = 0 - value;
 8014210:	6c93      	mov      	r2, r4
 8014212:	9961      	ld.w      	r3, (r14, 0x84)
 8014214:	3000      	movi      	r0, 0
 8014216:	3100      	movi      	r1, 0
 8014218:	e3ffe70a 	bsr      	0x801102c	// 801102c <__subdf3>
    negative = true;
 801421c:	3301      	movi      	r3, 1
    value = 0 - value;
 801421e:	6d03      	mov      	r4, r0
 8014220:	6d47      	mov      	r5, r1
    negative = true;
 8014222:	b86c      	st.w      	r3, (r14, 0x30)
 8014224:	064a      	br      	0x8013eb8	// 8013eb8 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8014226:	eb420020 	cmpnei      	r2, 32
 801422a:	0f52      	bf      	0x80140ce	// 80140ce <_ftoa+0x2da>
 801422c:	e90c000e 	bez      	r12, 0x8014248	// 8014248 <_ftoa+0x454>
 8014230:	c4540023 	addu      	r3, r20, r2
 8014234:	6308      	addu      	r12, r2
      buf[len++] = '0';
 8014236:	3130      	movi      	r1, 48
 8014238:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801423a:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 801423e:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8014240:	0f47      	bf      	0x80140ce	// 80140ce <_ftoa+0x2da>
 8014242:	670a      	cmpne      	r2, r12
 8014244:	2300      	addi      	r3, 1
 8014246:	0bf9      	bt      	0x8014238	// 8014238 <_ftoa+0x444>
      buf[len++] = '.';
 8014248:	332e      	movi      	r3, 46
 801424a:	e5a20000 	addi      	r13, r2, 1
 801424e:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8014252:	06bb      	br      	0x8013fc8	// 8013fc8 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8014254:	9866      	ld.w      	r3, (r14, 0x18)
 8014256:	e4632008 	andi      	r3, r3, 8
 801425a:	e9030007 	bez      	r3, 0x8014268	// 8014268 <_ftoa+0x474>
      buf[len++] = ' ';
 801425e:	3120      	movi      	r1, 32
 8014260:	5a62      	addi      	r3, r2, 1
 8014262:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8014266:	073a      	br      	0x80140da	// 80140da <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 8014268:	6ccb      	mov      	r3, r2
 801426a:	0738      	br      	0x80140da	// 80140da <_ftoa+0x2e6>
 801426c:	1047      	lrw      	r2, 0x80157fc	// 8014288 <_ftoa+0x494>
 801426e:	4363      	lsli      	r3, r3, 3
 8014270:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014272:	6e27      	mov      	r8, r9
 8014274:	9340      	ld.w      	r2, (r3, 0x0)
 8014276:	9361      	ld.w      	r3, (r3, 0x4)
 8014278:	b847      	st.w      	r2, (r14, 0x1c)
 801427a:	b868      	st.w      	r3, (r14, 0x20)
 801427c:	ea0d0000 	movi      	r13, 0
 8014280:	e68e0033 	addi      	r20, r14, 52
 8014284:	0627      	br      	0x8013ed2	// 8013ed2 <_ftoa+0xde>
 8014286:	0000      	.short	0x0000
 8014288:	080157fc 	.long	0x080157fc

0801428c <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 801428c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014290:	1434      	subi      	r14, r14, 80
 8014292:	6e0f      	mov      	r8, r3
 8014294:	9961      	ld.w      	r3, (r14, 0x84)
 8014296:	b867      	st.w      	r3, (r14, 0x1c)
 8014298:	9962      	ld.w      	r3, (r14, 0x88)
 801429a:	98bf      	ld.w      	r5, (r14, 0x7c)
 801429c:	9980      	ld.w      	r4, (r14, 0x80)
 801429e:	b868      	st.w      	r3, (r14, 0x20)
 80142a0:	9963      	ld.w      	r3, (r14, 0x8c)
 80142a2:	b866      	st.w      	r3, (r14, 0x18)
 80142a4:	6d83      	mov      	r6, r0
 80142a6:	6dc7      	mov      	r7, r1
 80142a8:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 80142aa:	6cd3      	mov      	r3, r4
 80142ac:	6c97      	mov      	r2, r5
 80142ae:	6c17      	mov      	r0, r5
 80142b0:	6c53      	mov      	r1, r4
 80142b2:	e3ffe867 	bsr      	0x8011380	// 8011380 <__nedf2>
 80142b6:	6e43      	mov      	r9, r0
 80142b8:	e92001d7 	bnez      	r0, 0x8014666	// 8014666 <_etoa+0x3da>
 80142bc:	3200      	movi      	r2, 0
 80142be:	ea237ff0 	movih      	r3, 32752
 80142c2:	2a00      	subi      	r2, 1
 80142c4:	2b00      	subi      	r3, 1
 80142c6:	6c17      	mov      	r0, r5
 80142c8:	6c53      	mov      	r1, r4
 80142ca:	e3ffe877 	bsr      	0x80113b8	// 80113b8 <__gtdf2>
 80142ce:	e94001cc 	bhz      	r0, 0x8014666	// 8014666 <_etoa+0x3da>
 80142d2:	3200      	movi      	r2, 0
 80142d4:	ea23fff0 	movih      	r3, 65520
 80142d8:	2a00      	subi      	r2, 1
 80142da:	2b00      	subi      	r3, 1
 80142dc:	6c17      	mov      	r0, r5
 80142de:	6c53      	mov      	r1, r4
 80142e0:	e3ffe8ac 	bsr      	0x8011438	// 8011438 <__ltdf2>
 80142e4:	e98001c1 	blz      	r0, 0x8014666	// 8014666 <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 80142e8:	6ca7      	mov      	r2, r9
 80142ea:	6ce7      	mov      	r3, r9
 80142ec:	6c17      	mov      	r0, r5
 80142ee:	6c53      	mov      	r1, r4
 80142f0:	e3ffe8a4 	bsr      	0x8011438	// 8011438 <__ltdf2>
    value = -value;
 80142f4:	6e97      	mov      	r10, r5
  if (negative) {
 80142f6:	e9800208 	blz      	r0, 0x8014706	// 8014706 <_etoa+0x47a>
 80142fa:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 80142fc:	9866      	ld.w      	r3, (r14, 0x18)
 80142fe:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014302:	3b40      	cmpnei      	r3, 0
 8014304:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 8014306:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014308:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801430c:	3306      	movi      	r3, 6
 801430e:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014312:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014316:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014318:	dd4e200a 	st.w      	r10, (r14, 0x28)
 801431c:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014320:	e3ffe8a8 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8014324:	0145      	lrw      	r2, 0x509f79fb	// 801468c <_etoa+0x400>
 8014326:	0164      	lrw      	r3, 0x3fd34413	// 8014690 <_etoa+0x404>
 8014328:	e3ffe6a0 	bsr      	0x8011068	// 8011068 <__muldf3>
 801432c:	0145      	lrw      	r2, 0x8b60c8b3	// 8014694 <_etoa+0x408>
 801432e:	0164      	lrw      	r3, 0x3fc68a28	// 8014698 <_etoa+0x40c>
 8014330:	e3ffe666 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014334:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8014338:	da6e2009 	ld.w      	r19, (r14, 0x24)
 801433c:	c40c4836 	lsli      	r22, r12, 0
 8014340:	c4135677 	zext      	r23, r19, 19, 0
 8014344:	ea140000 	movi      	r20, 0
 8014348:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801434c:	c4004831 	lsli      	r17, r0, 0
 8014350:	c4014830 	lsli      	r16, r1, 0
 8014354:	3200      	movi      	r2, 0
 8014356:	c6962420 	or      	r0, r22, r20
 801435a:	c6b72421 	or      	r1, r23, r21
 801435e:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014362:	dd8e2012 	st.w      	r12, (r14, 0x48)
 8014366:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801436a:	de8e200f 	st.w      	r20, (r14, 0x3c)
 801436e:	deae2010 	st.w      	r21, (r14, 0x40)
 8014372:	e3ffe65d 	bsr      	0x801102c	// 801102c <__subdf3>
 8014376:	0155      	lrw      	r2, 0x636f4361	// 801469c <_etoa+0x410>
 8014378:	0175      	lrw      	r3, 0x3fd287a7	// 80146a0 <_etoa+0x414>
 801437a:	e3ffe677 	bsr      	0x8011068	// 8011068 <__muldf3>
 801437e:	6c83      	mov      	r2, r0
 8014380:	6cc7      	mov      	r3, r1
 8014382:	c4114820 	lsli      	r0, r17, 0
 8014386:	c4104821 	lsli      	r1, r16, 0
 801438a:	e3ffe639 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 801438e:	e3ffe8a5 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 8014392:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8014394:	e3ffe86e 	bsr      	0x8011470	// 8011470 <__floatsidf>
 8014398:	015c      	lrw      	r2, 0x979a371	// 80146a4 <_etoa+0x418>
 801439a:	017b      	lrw      	r3, 0x400a934f	// 80146a8 <_etoa+0x41c>
 801439c:	c4004831 	lsli      	r17, r0, 0
 80143a0:	c4014830 	lsli      	r16, r1, 0
 80143a4:	e3ffe662 	bsr      	0x8011068	// 8011068 <__muldf3>
 80143a8:	3200      	movi      	r2, 0
 80143aa:	ea233fe0 	movih      	r3, 16352
 80143ae:	e3ffe627 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 80143b2:	e3ffe893 	bsr      	0x80114d8	// 80114d8 <__fixdfsi>
 80143b6:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 80143b8:	0242      	lrw      	r2, 0xbbb55516	// 80146ac <_etoa+0x420>
 80143ba:	0261      	lrw      	r3, 0x40026bb1	// 80146b0 <_etoa+0x424>
 80143bc:	c4114820 	lsli      	r0, r17, 0
 80143c0:	c4104821 	lsli      	r1, r16, 0
 80143c4:	e3ffe652 	bsr      	0x8011068	// 8011068 <__muldf3>
 80143c8:	c4004831 	lsli      	r17, r0, 0
 80143cc:	980a      	ld.w      	r0, (r14, 0x28)
 80143ce:	c4014830 	lsli      	r16, r1, 0
 80143d2:	e3ffe84f 	bsr      	0x8011470	// 8011470 <__floatsidf>
 80143d6:	0247      	lrw      	r2, 0xfefa39ef	// 80146b4 <_etoa+0x428>
 80143d8:	0267      	lrw      	r3, 0x3fe62e42	// 80146b8 <_etoa+0x42c>
 80143da:	e3ffe647 	bsr      	0x8011068	// 8011068 <__muldf3>
 80143de:	6c83      	mov      	r2, r0
 80143e0:	6cc7      	mov      	r3, r1
 80143e2:	c4114820 	lsli      	r0, r17, 0
 80143e6:	c4104821 	lsli      	r1, r16, 0
 80143ea:	e3ffe621 	bsr      	0x801102c	// 801102c <__subdf3>
  const double z2 = z * z;
 80143ee:	6c83      	mov      	r2, r0
 80143f0:	6cc7      	mov      	r3, r1
 80143f2:	b80c      	st.w      	r0, (r14, 0x30)
 80143f4:	b82b      	st.w      	r1, (r14, 0x2c)
 80143f6:	e3ffe639 	bsr      	0x8011068	// 8011068 <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80143fa:	da4e200c 	ld.w      	r18, (r14, 0x30)
 80143fe:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8014402:	c4124822 	lsli      	r2, r18, 0
 8014406:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8014408:	c4004831 	lsli      	r17, r0, 0
 801440c:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014410:	c4124820 	lsli      	r0, r18, 0
 8014414:	6c77      	mov      	r1, r13
 8014416:	de4e200e 	st.w      	r18, (r14, 0x38)
 801441a:	ddae200d 	st.w      	r13, (r14, 0x34)
 801441e:	e3ffe5ef 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8014422:	b80c      	st.w      	r0, (r14, 0x30)
 8014424:	b82b      	st.w      	r1, (r14, 0x2c)
 8014426:	3200      	movi      	r2, 0
 8014428:	ea23402c 	movih      	r3, 16428
 801442c:	c4114820 	lsli      	r0, r17, 0
 8014430:	c4104821 	lsli      	r1, r16, 0
 8014434:	e3ffe71a 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014438:	3200      	movi      	r2, 0
 801443a:	ea234024 	movih      	r3, 16420
 801443e:	e3ffe5df 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 8014442:	6c83      	mov      	r2, r0
 8014444:	6cc7      	mov      	r3, r1
 8014446:	c4114820 	lsli      	r0, r17, 0
 801444a:	c4104821 	lsli      	r1, r16, 0
 801444e:	e3ffe70d 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014452:	3200      	movi      	r2, 0
 8014454:	ea234018 	movih      	r3, 16408
 8014458:	e3ffe5d2 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 801445c:	6c83      	mov      	r2, r0
 801445e:	6cc7      	mov      	r3, r1
 8014460:	c4114820 	lsli      	r0, r17, 0
 8014464:	c4104821 	lsli      	r1, r16, 0
 8014468:	e3ffe700 	bsr      	0x8011268	// 8011268 <__divdf3>
 801446c:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8014470:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8014474:	c4124822 	lsli      	r2, r18, 0
 8014478:	6cf7      	mov      	r3, r13
 801447a:	c4004831 	lsli      	r17, r0, 0
 801447e:	c4014830 	lsli      	r16, r1, 0
 8014482:	3000      	movi      	r0, 0
 8014484:	ea214000 	movih      	r1, 16384
 8014488:	e3ffe5d2 	bsr      	0x801102c	// 801102c <__subdf3>
 801448c:	6c83      	mov      	r2, r0
 801448e:	6cc7      	mov      	r3, r1
 8014490:	c4114820 	lsli      	r0, r17, 0
 8014494:	c4104821 	lsli      	r1, r16, 0
 8014498:	e3ffe5b2 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
 801449c:	daee200c 	ld.w      	r23, (r14, 0x30)
 80144a0:	dace200b 	ld.w      	r22, (r14, 0x2c)
 80144a4:	6c83      	mov      	r2, r0
 80144a6:	6cc7      	mov      	r3, r1
 80144a8:	c4174820 	lsli      	r0, r23, 0
 80144ac:	c4164821 	lsli      	r1, r22, 0
 80144b0:	e3ffe6dc 	bsr      	0x8011268	// 8011268 <__divdf3>
 80144b4:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 80144b8:	daae2010 	ld.w      	r21, (r14, 0x40)
 80144bc:	c4144822 	lsli      	r2, r20, 0
 80144c0:	c4154823 	lsli      	r3, r21, 0
 80144c4:	e3ffe59c 	bsr      	0x8010ffc	// 8010ffc <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 80144c8:	984a      	ld.w      	r2, (r14, 0x28)
 80144ca:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80144ce:	4374      	lsli      	r3, r3, 20
 80144d0:	3200      	movi      	r2, 0
 80144d2:	e3ffe5cb 	bsr      	0x8011068	// 8011068 <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 80144d6:	d98e2012 	ld.w      	r12, (r14, 0x48)
 80144da:	da6e2011 	ld.w      	r19, (r14, 0x44)
 80144de:	6c83      	mov      	r2, r0
 80144e0:	c4004830 	lsli      	r16, r0, 0
 80144e4:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80144e6:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 80144ea:	6c33      	mov      	r0, r12
 80144ec:	c4134821 	lsli      	r1, r19, 0
 80144f0:	e3ffe7a4 	bsr      	0x8011438	// 8011438 <__ltdf2>
 80144f4:	c4104832 	lsli      	r18, r16, 0
 80144f8:	e9a00012 	bhsz      	r0, 0x801451c	// 801451c <_etoa+0x290>
    expval--;
 80144fc:	9869      	ld.w      	r3, (r14, 0x24)
 80144fe:	2b00      	subi      	r3, 1
 8014500:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8014502:	c4114821 	lsli      	r1, r17, 0
 8014506:	3200      	movi      	r2, 0
 8014508:	ea234024 	movih      	r3, 16420
 801450c:	c4104820 	lsli      	r0, r16, 0
 8014510:	e3ffe6ac 	bsr      	0x8011268	// 8011268 <__divdf3>
 8014514:	c4004832 	lsli      	r18, r0, 0
 8014518:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801451c:	9849      	ld.w      	r2, (r14, 0x24)
 801451e:	e4620062 	addi      	r3, r2, 99
 8014522:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8014526:	9866      	ld.w      	r3, (r14, 0x18)
 8014528:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801452c:	c4000510 	mvc      	r16
 8014530:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8014534:	e9030027 	bez      	r3, 0x8014582	// 8014582 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8014538:	1341      	lrw      	r2, 0xeb1c432d	// 80146bc <_etoa+0x430>
 801453a:	1362      	lrw      	r3, 0x3f1a36e2	// 80146c0 <_etoa+0x434>
 801453c:	6c2b      	mov      	r0, r10
 801453e:	6c67      	mov      	r1, r9
 8014540:	de4e200a 	st.w      	r18, (r14, 0x28)
 8014544:	e3ffe75a 	bsr      	0x80113f8	// 80113f8 <__gedf2>
 8014548:	da4e200a 	ld.w      	r18, (r14, 0x28)
 801454c:	e98000cd 	blz      	r0, 0x80146e6	// 80146e6 <_etoa+0x45a>
 8014550:	3200      	movi      	r2, 0
 8014552:	127d      	lrw      	r3, 0x412e8480	// 80146c4 <_etoa+0x438>
 8014554:	6c2b      	mov      	r0, r10
 8014556:	6c67      	mov      	r1, r9
 8014558:	e3ffe770 	bsr      	0x8011438	// 8011438 <__ltdf2>
 801455c:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8014560:	e9a000c3 	bhsz      	r0, 0x80146e6	// 80146e6 <_etoa+0x45a>
      if ((int)prec > expval) {
 8014564:	9849      	ld.w      	r2, (r14, 0x24)
 8014566:	9867      	ld.w      	r3, (r14, 0x1c)
 8014568:	64c9      	cmplt      	r2, r3
 801456a:	0cd4      	bf      	0x8014712	// 8014712 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 801456c:	60ca      	subu      	r3, r2
 801456e:	2b00      	subi      	r3, 1
 8014570:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8014572:	9866      	ld.w      	r3, (r14, 0x18)
 8014574:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8014578:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 801457c:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 801457e:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8014582:	9848      	ld.w      	r2, (r14, 0x20)
 8014584:	c602008c 	subu      	r12, r2, r16
 8014588:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 801458c:	9846      	ld.w      	r2, (r14, 0x18)
 801458e:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8014592:	3300      	movi      	r3, 0
 8014594:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8014598:	b84a      	st.w      	r2, (r14, 0x28)
 801459a:	e9020006 	bez      	r2, 0x80145a6	// 80145a6 <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 801459e:	eb500000 	cmpnei      	r16, 0
 80145a2:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 80145a6:	9869      	ld.w      	r3, (r14, 0x24)
 80145a8:	e9230090 	bnez      	r3, 0x80146c8	// 80146c8 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 80145ac:	3200      	movi      	r2, 0
 80145ae:	6ccb      	mov      	r3, r2
 80145b0:	6c17      	mov      	r0, r5
 80145b2:	6c53      	mov      	r1, r4
 80145b4:	c40c4831 	lsli      	r17, r12, 0
 80145b8:	e3ffe740 	bsr      	0x8011438	// 8011438 <__ltdf2>
 80145bc:	c411482c 	lsli      	r12, r17, 0
 80145c0:	e980009e 	blz      	r0, 0x80146fc	// 80146fc <_etoa+0x470>
 80145c4:	da2e2006 	ld.w      	r17, (r14, 0x18)
 80145c8:	98a7      	ld.w      	r5, (r14, 0x1c)
 80145ca:	c5712823 	bclri      	r3, r17, 11
 80145ce:	b864      	st.w      	r3, (r14, 0x10)
 80145d0:	dd2e2001 	st.w      	r9, (r14, 0x4)
 80145d4:	dd8e2003 	st.w      	r12, (r14, 0xc)
 80145d8:	b8a2      	st.w      	r5, (r14, 0x8)
 80145da:	dd4e2000 	st.w      	r10, (r14, 0x0)
 80145de:	6ce3      	mov      	r3, r8
 80145e0:	6caf      	mov      	r2, r11
 80145e2:	6c5f      	mov      	r1, r7
 80145e4:	6c1b      	mov      	r0, r6
 80145e6:	e3fffc07 	bsr      	0x8013df4	// 8013df4 <_ftoa>
 80145ea:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 80145ec:	6e57      	mov      	r9, r5
 80145ee:	e925004b 	bnez      	r5, 0x8014684	// 8014684 <_etoa+0x3f8>
 80145f2:	e9100049 	bez      	r16, 0x8014684	// 8014684 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 80145f6:	e4712020 	andi      	r3, r17, 32
 80145fa:	3b40      	cmpnei      	r3, 0
 80145fc:	6c83      	mov      	r2, r0
 80145fe:	ea0c0065 	movi      	r12, 101
 8014602:	58a2      	addi      	r5, r0, 1
 8014604:	3045      	movi      	r0, 69
 8014606:	c40c0c20 	incf      	r0, r12, 0
 801460a:	6ce3      	mov      	r3, r8
 801460c:	6c5f      	mov      	r1, r7
 801460e:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8014610:	3305      	movi      	r3, 5
 8014612:	9849      	ld.w      	r2, (r14, 0x24)
 8014614:	b865      	st.w      	r3, (r14, 0x14)
 8014616:	330a      	movi      	r3, 10
 8014618:	b862      	st.w      	r3, (r14, 0x8)
 801461a:	4a7f      	lsri      	r3, r2, 31
 801461c:	b861      	st.w      	r3, (r14, 0x4)
 801461e:	e6101000 	subi      	r16, r16, 1
 8014622:	c4020203 	abs      	r3, r2
 8014626:	b860      	st.w      	r3, (r14, 0x0)
 8014628:	de0e2004 	st.w      	r16, (r14, 0x10)
 801462c:	6ce3      	mov      	r3, r8
 801462e:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8014632:	6c97      	mov      	r2, r5
 8014634:	6c5f      	mov      	r1, r7
 8014636:	6c1b      	mov      	r0, r6
 8014638:	e3fffb12 	bsr      	0x8013c5c	// 8013c5c <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 801463c:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 801463e:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8014640:	e9030022 	bez      	r3, 0x8014684	// 8014684 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8014644:	c5600083 	subu      	r3, r0, r11
 8014648:	98a8      	ld.w      	r5, (r14, 0x20)
 801464a:	654c      	cmphs      	r3, r5
 801464c:	081c      	bt      	0x8014684	// 8014684 <_etoa+0x3f8>
 801464e:	6c83      	mov      	r2, r0
 8014650:	2400      	addi      	r4, 1
 8014652:	6ce3      	mov      	r3, r8
 8014654:	6c5f      	mov      	r1, r7
 8014656:	3020      	movi      	r0, 32
 8014658:	7bd9      	jsr      	r6
 801465a:	c5640083 	subu      	r3, r4, r11
 801465e:	654c      	cmphs      	r3, r5
 8014660:	6c93      	mov      	r2, r4
 8014662:	0ff7      	bf      	0x8014650	// 8014650 <_etoa+0x3c4>
 8014664:	0410      	br      	0x8014684	// 8014684 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8014666:	9866      	ld.w      	r3, (r14, 0x18)
 8014668:	b864      	st.w      	r3, (r14, 0x10)
 801466a:	9868      	ld.w      	r3, (r14, 0x20)
 801466c:	b863      	st.w      	r3, (r14, 0xc)
 801466e:	9867      	ld.w      	r3, (r14, 0x1c)
 8014670:	b862      	st.w      	r3, (r14, 0x8)
 8014672:	b881      	st.w      	r4, (r14, 0x4)
 8014674:	b8a0      	st.w      	r5, (r14, 0x0)
 8014676:	6ce3      	mov      	r3, r8
 8014678:	6caf      	mov      	r2, r11
 801467a:	6c5f      	mov      	r1, r7
 801467c:	6c1b      	mov      	r0, r6
 801467e:	e3fffbbb 	bsr      	0x8013df4	// 8013df4 <_ftoa>
 8014682:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8014684:	6c13      	mov      	r0, r4
 8014686:	1414      	addi      	r14, r14, 80
 8014688:	ebc00058 	pop      	r4-r11, r15, r16-r17
 801468c:	509f79fb 	.long	0x509f79fb
 8014690:	3fd34413 	.long	0x3fd34413
 8014694:	8b60c8b3 	.long	0x8b60c8b3
 8014698:	3fc68a28 	.long	0x3fc68a28
 801469c:	636f4361 	.long	0x636f4361
 80146a0:	3fd287a7 	.long	0x3fd287a7
 80146a4:	0979a371 	.long	0x0979a371
 80146a8:	400a934f 	.long	0x400a934f
 80146ac:	bbb55516 	.long	0xbbb55516
 80146b0:	40026bb1 	.long	0x40026bb1
 80146b4:	fefa39ef 	.long	0xfefa39ef
 80146b8:	3fe62e42 	.long	0x3fe62e42
 80146bc:	eb1c432d 	.long	0xeb1c432d
 80146c0:	3f1a36e2 	.long	0x3f1a36e2
 80146c4:	412e8480 	.long	0x412e8480
    value /= conv.F;
 80146c8:	6c2b      	mov      	r0, r10
 80146ca:	6c67      	mov      	r1, r9
 80146cc:	c4124822 	lsli      	r2, r18, 0
 80146d0:	c4114823 	lsli      	r3, r17, 0
 80146d4:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 80146d8:	e3ffe5c8 	bsr      	0x8011268	// 8011268 <__divdf3>
 80146dc:	6e83      	mov      	r10, r0
 80146de:	6e47      	mov      	r9, r1
 80146e0:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 80146e4:	0764      	br      	0x80145ac	// 80145ac <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 80146e6:	9847      	ld.w      	r2, (r14, 0x1c)
 80146e8:	e902ff4d 	bez      	r2, 0x8014582	// 8014582 <_etoa+0x2f6>
        --prec;
 80146ec:	9873      	ld.w      	r3, (r14, 0x4c)
 80146ee:	3b40      	cmpnei      	r3, 0
 80146f0:	c4620c20 	incf      	r3, r2, 0
 80146f4:	c4620d01 	dect      	r3, r2, 1
 80146f8:	b867      	st.w      	r3, (r14, 0x1c)
 80146fa:	0744      	br      	0x8014582	// 8014582 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 80146fc:	ea238000 	movih      	r3, 32768
 8014700:	60e4      	addu      	r3, r9
 8014702:	6e4f      	mov      	r9, r3
 8014704:	0760      	br      	0x80145c4	// 80145c4 <_etoa+0x338>
    value = -value;
 8014706:	ea238000 	movih      	r3, 32768
 801470a:	c4640029 	addu      	r9, r4, r3
 801470e:	e800fdf7 	br      	0x80142fc	// 80142fc <_etoa+0x70>
      if ((int)prec > expval) {
 8014712:	3300      	movi      	r3, 0
 8014714:	072e      	br      	0x8014570	// 8014570 <_etoa+0x2e4>
	...

08014718 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8014718:	ebe00058 	push      	r4-r11, r15, r16-r17
 801471c:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 801471e:	3940      	cmpnei      	r1, 0
 8014720:	10cf      	lrw      	r6, 0x80139d4	// 801475c <_vsnprintf+0x44>
{
 8014722:	6e07      	mov      	r8, r1
 8014724:	6dcb      	mov      	r7, r2
 8014726:	6d4f      	mov      	r5, r3
 8014728:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 801472a:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 801472e:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8014732:	ea89000c 	lrw      	r9, 0x80155c4	// 8014760 <_vsnprintf+0x48>
  while (*format)
 8014736:	8500      	ld.b      	r0, (r5, 0x0)
 8014738:	e900006f 	bez      	r0, 0x8014816	// 8014816 <_vsnprintf+0xfe>
    if (*format != '%') {
 801473c:	eb400025 	cmpnei      	r0, 37
 8014740:	0860      	bt      	0x8014800	// 8014800 <_vsnprintf+0xe8>
      format++;
 8014742:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8014744:	3100      	movi      	r1, 0
      switch (*format) {
 8014746:	8200      	ld.b      	r0, (r2, 0x0)
 8014748:	e460101f 	subi      	r3, r0, 32
 801474c:	74cc      	zextb      	r3, r3
 801474e:	3b10      	cmphsi      	r3, 17
 8014750:	6d4b      	mov      	r5, r2
 8014752:	081d      	bt      	0x801478c	// 801478c <_vsnprintf+0x74>
 8014754:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8014758:	780c      	jmp      	r3
 801475a:	0000      	.short	0x0000
 801475c:	080139d4 	.long	0x080139d4
 8014760:	080155c4 	.long	0x080155c4
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8014764:	ec210001 	ori      	r1, r1, 1
 8014768:	2200      	addi      	r2, 1
 801476a:	07ee      	br      	0x8014746	// 8014746 <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 801476c:	ec210008 	ori      	r1, r1, 8
 8014770:	2200      	addi      	r2, 1
 8014772:	07ea      	br      	0x8014746	// 8014746 <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8014774:	ec210010 	ori      	r1, r1, 16
 8014778:	2200      	addi      	r2, 1
 801477a:	07e6      	br      	0x8014746	// 8014746 <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 801477c:	ec210004 	ori      	r1, r1, 4
 8014780:	2200      	addi      	r2, 1
 8014782:	07e2      	br      	0x8014746	// 8014746 <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8014784:	ec210002 	ori      	r1, r1, 2
 8014788:	2200      	addi      	r2, 1
 801478a:	07de      	br      	0x8014746	// 8014746 <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 801478c:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8014790:	74cc      	zextb      	r3, r3
 8014792:	3b09      	cmphsi      	r3, 10
 8014794:	0c5b      	bf      	0x801484a	// 801484a <_vsnprintf+0x132>
    else if (*format == '*') {
 8014796:	eb40002a 	cmpnei      	r0, 42
 801479a:	e84003c3 	bf      	0x8014f20	// 8014f20 <_vsnprintf+0x808>
    width = 0U;
 801479e:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 80147a2:	eb40002e 	cmpnei      	r0, 46
 80147a6:	0c65      	bf      	0x8014870	// 8014870 <_vsnprintf+0x158>
    precision = 0U;
 80147a8:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 80147ac:	e4601067 	subi      	r3, r0, 104
 80147b0:	74cc      	zextb      	r3, r3
 80147b2:	3b12      	cmphsi      	r3, 19
 80147b4:	080c      	bt      	0x80147cc	// 80147cc <_vsnprintf+0xb4>
 80147b6:	1043      	lrw      	r2, 0x8015608	// 80147c0 <_vsnprintf+0xa8>
 80147b8:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 80147bc:	780c      	jmp      	r3
 80147be:	0000      	.short	0x0000
 80147c0:	08015608 	.long	0x08015608
 80147c4:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80147c6:	ec210100 	ori      	r1, r1, 256
        format++;
 80147ca:	2500      	addi      	r5, 1
    switch (*format) {
 80147cc:	e4601024 	subi      	r3, r0, 37
 80147d0:	74cc      	zextb      	r3, r3
 80147d2:	eb030053 	cmphsi      	r3, 84
 80147d6:	0815      	bt      	0x8014800	// 8014800 <_vsnprintf+0xe8>
 80147d8:	1042      	lrw      	r2, 0x8015654	// 80147e0 <_vsnprintf+0xc8>
 80147da:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 80147de:	780c      	jmp      	r3
 80147e0:	08015654 	.long	0x08015654
        if (*format == 'l') {
 80147e4:	8501      	ld.b      	r0, (r5, 0x1)
 80147e6:	eb40006c 	cmpnei      	r0, 108
 80147ea:	e84003ac 	bf      	0x8014f42	// 8014f42 <_vsnprintf+0x82a>
    switch (*format) {
 80147ee:	e4601024 	subi      	r3, r0, 37
 80147f2:	74cc      	zextb      	r3, r3
 80147f4:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 80147f8:	ec210100 	ori      	r1, r1, 256
        format++;
 80147fc:	2500      	addi      	r5, 1
    switch (*format) {
 80147fe:	0fed      	bf      	0x80147d8	// 80147d8 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8014800:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8014802:	6caf      	mov      	r2, r11
 8014804:	6cdf      	mov      	r3, r7
 8014806:	6c63      	mov      	r1, r8
 8014808:	7bd9      	jsr      	r6
  while (*format)
 801480a:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 801480c:	e54b0000 	addi      	r10, r11, 1
 8014810:	6eeb      	mov      	r11, r10
  while (*format)
 8014812:	e920ff95 	bnez      	r0, 0x801473c	// 801473c <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8014816:	65ec      	cmphs      	r11, r7
 8014818:	e8400381 	bf      	0x8014f1a	// 8014f1a <_vsnprintf+0x802>
 801481c:	5f43      	subi      	r2, r7, 1
 801481e:	6cdf      	mov      	r3, r7
 8014820:	6c63      	mov      	r1, r8
 8014822:	3000      	movi      	r0, 0
 8014824:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8014826:	6c2f      	mov      	r0, r11
 8014828:	1416      	addi      	r14, r14, 88
 801482a:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 801482e:	8501      	ld.b      	r0, (r5, 0x1)
 8014830:	eb400068 	cmpnei      	r0, 104
 8014834:	e8400381 	bf      	0x8014f36	// 8014f36 <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8014838:	ec210080 	ori      	r1, r1, 128
        format++;
 801483c:	2500      	addi      	r5, 1
 801483e:	07c7      	br      	0x80147cc	// 80147cc <_vsnprintf+0xb4>
 8014840:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8014842:	ec210200 	ori      	r1, r1, 512
        format++;
 8014846:	2500      	addi      	r5, 1
        break;
 8014848:	07c2      	br      	0x80147cc	// 80147cc <_vsnprintf+0xb4>
 801484a:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 801484e:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8014852:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014854:	2500      	addi      	r5, 1
 8014856:	f9b18440 	mula.32.l      	r0, r17, r13
 801485a:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 801485e:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8014860:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8014864:	74cc      	zextb      	r3, r3
 8014866:	64c8      	cmphs      	r2, r3
 8014868:	0bf6      	bt      	0x8014854	// 8014854 <_vsnprintf+0x13c>
    if (*format == '.') {
 801486a:	eb40002e 	cmpnei      	r0, 46
 801486e:	0b9d      	bt      	0x80147a8	// 80147a8 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8014870:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8014872:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8014876:	74cc      	zextb      	r3, r3
 8014878:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 801487a:	ec210400 	ori      	r1, r1, 1024
      format++;
 801487e:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 8014880:	0813      	bt      	0x80148a6	// 80148a6 <_vsnprintf+0x18e>
 8014882:	6d4b      	mov      	r5, r2
 8014884:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8014888:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 801488c:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 801488e:	2500      	addi      	r5, 1
 8014890:	fa4a8440 	mula.32.l      	r0, r10, r18
 8014894:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8014898:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 801489a:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 801489e:	74cc      	zextb      	r3, r3
 80148a0:	64c8      	cmphs      	r2, r3
 80148a2:	0bf6      	bt      	0x801488e	// 801488e <_vsnprintf+0x176>
 80148a4:	0784      	br      	0x80147ac	// 80147ac <_vsnprintf+0x94>
      else if (*format == '*') {
 80148a6:	eb40002a 	cmpnei      	r0, 42
 80148aa:	e84003e2 	bf      	0x801506e	// 801506e <_vsnprintf+0x956>
      format++;
 80148ae:	6d4b      	mov      	r5, r2
 80148b0:	077c      	br      	0x80147a8	// 80147a8 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 80148b2:	5c6e      	addi      	r3, r4, 4
 80148b4:	3000      	movi      	r0, 0
 80148b6:	dac42000 	ld.w      	r22, (r4, 0x0)
 80148ba:	b869      	st.w      	r3, (r14, 0x24)
 80148bc:	6d03      	mov      	r4, r0
            h = bit / 100;
 80148be:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 80148c2:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 80148c6:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 80148ca:	ea15002e 	movi      	r21, 46
 80148ce:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 80148d2:	c4164043 	lsr      	r3, r22, r0
 80148d6:	74cc      	zextb      	r3, r3
            h = bit / 100;
 80148d8:	c6838022 	divu      	r2, r3, r20
 80148dc:	7748      	zextb      	r13, r2
            if (h)
 80148de:	e90d0306 	bez      	r13, 0x8014eea	// 8014eea <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 80148e2:	c6828422 	mult      	r2, r2, r20
 80148e6:	60ca      	subu      	r3, r2
 80148e8:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 80148ea:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 80148ee:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 80148f2:	e5840000 	addi      	r12, r4, 1
 80148f6:	e5ad002f 	addi      	r13, r13, 48
 80148fa:	7730      	zextb      	r12, r12
 80148fc:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8014900:	e92202fe 	bnez      	r2, 0x8014efc	// 8014efc <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8014904:	1a0c      	addi      	r2, r14, 48
 8014906:	2401      	addi      	r4, 2
 8014908:	7510      	zextb      	r4, r4
 801490a:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 801490e:	c6638022 	divu      	r2, r3, r19
 8014912:	c6628422 	mult      	r2, r2, r19
 8014916:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8014918:	1a0c      	addi      	r2, r14, 48
 801491a:	e5840000 	addi      	r12, r4, 1
 801491e:	232f      	addi      	r3, 48
 8014920:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8014924:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8014926:	2401      	addi      	r4, 2
 8014928:	7510      	zextb      	r4, r4
 801492a:	d5820035 	str.b      	r21, (r2, r12 << 0)
 801492e:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8014930:	e832ffd1 	bnezad      	r18, 0x80148d2	// 80148d2 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8014934:	e46e002e 	addi      	r3, r14, 47
 8014938:	3200      	movi      	r2, 0
 801493a:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 801493e:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014940:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014944:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014946:	3a40      	cmpnei      	r2, 0
 8014948:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 801494c:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 801494e:	6c83      	mov      	r2, r0
 8014950:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014954:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014958:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 801495a:	b86b      	st.w      	r3, (r14, 0x2c)
 801495c:	e9230333 	bnez      	r3, 0x8014fc2	// 8014fc2 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8014960:	c6220420 	cmphs      	r2, r17
 8014964:	6ccb      	mov      	r3, r2
 8014966:	2300      	addi      	r3, 1
 8014968:	e86003ff 	bt      	0x8015166	// 8015166 <_vsnprintf+0xa4e>
 801496c:	c5710023 	addu      	r3, r17, r11
 8014970:	5b89      	subu      	r4, r3, r2
 8014972:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014974:	e56b0000 	addi      	r11, r11, 1
 8014978:	6cdf      	mov      	r3, r7
 801497a:	6c63      	mov      	r1, r8
 801497c:	3020      	movi      	r0, 32
 801497e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014980:	66d2      	cmpne      	r4, r11
 8014982:	6caf      	mov      	r2, r11
 8014984:	0bf8      	bt      	0x8014974	// 8014974 <_vsnprintf+0x25c>
 8014986:	e4710000 	addi      	r3, r17, 1
 801498a:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801498c:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014990:	e9000030 	bez      	r0, 0x80149f0	// 80149f0 <_vsnprintf+0x2d8>
 8014994:	6caf      	mov      	r2, r11
 8014996:	e60e002f 	addi      	r16, r14, 48
 801499a:	d96e200a 	ld.w      	r11, (r14, 0x28)
 801499e:	0402      	br      	0x80149a2	// 80149a2 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 80149a0:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80149a2:	e90b0007 	bez      	r11, 0x80149b0	// 80149b0 <_vsnprintf+0x298>
 80149a6:	e46a1000 	subi      	r3, r10, 1
 80149aa:	e90a034a 	bez      	r10, 0x801503e	// 801503e <_vsnprintf+0x926>
 80149ae:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 80149b0:	e6100000 	addi      	r16, r16, 1
 80149b4:	6cdf      	mov      	r3, r7
 80149b6:	6c63      	mov      	r1, r8
 80149b8:	5a82      	addi      	r4, r2, 1
 80149ba:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80149bc:	d8100000 	ld.b      	r0, (r16, 0x0)
 80149c0:	e920fff0 	bnez      	r0, 0x80149a0	// 80149a0 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 80149c4:	986b      	ld.w      	r3, (r14, 0x2c)
 80149c6:	e90302a5 	bez      	r3, 0x8014f10	// 8014f10 <_vsnprintf+0x7f8>
          while (l++ < width) {
 80149ca:	9868      	ld.w      	r3, (r14, 0x20)
 80149cc:	c6230420 	cmphs      	r3, r17
 80149d0:	e86002a0 	bt      	0x8014f10	// 8014f10 <_vsnprintf+0x7f8>
 80149d4:	c4910020 	addu      	r0, r17, r4
 80149d8:	c460008a 	subu      	r10, r0, r3
 80149dc:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 80149de:	e5620000 	addi      	r11, r2, 1
 80149e2:	6cdf      	mov      	r3, r7
 80149e4:	6c63      	mov      	r1, r8
 80149e6:	3020      	movi      	r0, 32
 80149e8:	7bd9      	jsr      	r6
          while (l++ < width) {
 80149ea:	66ea      	cmpne      	r10, r11
 80149ec:	6caf      	mov      	r2, r11
 80149ee:	0bf8      	bt      	0x80149de	// 80149de <_vsnprintf+0x2c6>
        format++;
 80149f0:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80149f2:	9889      	ld.w      	r4, (r14, 0x24)
 80149f4:	06a1      	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 80149f6:	da042000 	ld.w      	r16, (r4, 0x0)
 80149fa:	5c6e      	addi      	r3, r4, 4
 80149fc:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 80149fe:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8014a02:	3300      	movi      	r3, 0
 8014a04:	2b00      	subi      	r3, 1
 8014a06:	eb4a0000 	cmpnei      	r10, 0
 8014a0a:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8014a0e:	c4104824 	lsli      	r4, r16, 0
 8014a12:	e9200006 	bnez      	r0, 0x8014a1e	// 8014a1e <_vsnprintf+0x306>
 8014a16:	0408      	br      	0x8014a26	// 8014a26 <_vsnprintf+0x30e>
 8014a18:	2b00      	subi      	r3, 1
 8014a1a:	e9030006 	bez      	r3, 0x8014a26	// 8014a26 <_vsnprintf+0x30e>
 8014a1e:	2400      	addi      	r4, 1
 8014a20:	8440      	ld.b      	r2, (r4, 0x0)
 8014a22:	e922fffb 	bnez      	r2, 0x8014a18	// 8014a18 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8014a26:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 8014a2a:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8014a2e:	f944cd23 	min.u32      	r3, r4, r10
 8014a32:	3a40      	cmpnei      	r2, 0
 8014a34:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014a38:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8014a3c:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8014a3e:	b86a      	st.w      	r3, (r14, 0x28)
 8014a40:	e9230287 	bnez      	r3, 0x8014f4e	// 8014f4e <_vsnprintf+0x836>
          while (l++ < width) {
 8014a44:	c6240420 	cmphs      	r4, r17
 8014a48:	5c62      	addi      	r3, r4, 1
 8014a4a:	e860039c 	bt      	0x8015182	// 8015182 <_vsnprintf+0xa6a>
 8014a4e:	c5710023 	addu      	r3, r17, r11
 8014a52:	5b91      	subu      	r4, r3, r4
 8014a54:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014a56:	e5620000 	addi      	r11, r2, 1
 8014a5a:	6cdf      	mov      	r3, r7
 8014a5c:	6c63      	mov      	r1, r8
 8014a5e:	3020      	movi      	r0, 32
 8014a60:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014a62:	66d2      	cmpne      	r4, r11
 8014a64:	6caf      	mov      	r2, r11
 8014a66:	0bf8      	bt      	0x8014a56	// 8014a56 <_vsnprintf+0x33e>
 8014a68:	c40b4832 	lsli      	r18, r11, 0
 8014a6c:	e4910000 	addi      	r4, r17, 1
 8014a70:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014a74:	e9000391 	bez      	r0, 0x8015196	// 8015196 <_vsnprintf+0xa7e>
 8014a78:	b88b      	st.w      	r4, (r14, 0x2c)
 8014a7a:	c4124822 	lsli      	r2, r18, 0
 8014a7e:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8014a82:	0402      	br      	0x8014a86	// 8014a86 <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8014a84:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014a86:	e90b0007 	bez      	r11, 0x8014a94	// 8014a94 <_vsnprintf+0x37c>
 8014a8a:	e46a1000 	subi      	r3, r10, 1
 8014a8e:	e90a02d2 	bez      	r10, 0x8015032	// 8015032 <_vsnprintf+0x91a>
 8014a92:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8014a94:	e6100000 	addi      	r16, r16, 1
 8014a98:	6cdf      	mov      	r3, r7
 8014a9a:	6c63      	mov      	r1, r8
 8014a9c:	5a82      	addi      	r4, r2, 1
 8014a9e:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014aa0:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014aa4:	e920fff0 	bnez      	r0, 0x8014a84	// 8014a84 <_vsnprintf+0x36c>
 8014aa8:	6ed3      	mov      	r11, r4
 8014aaa:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8014aac:	986a      	ld.w      	r3, (r14, 0x28)
 8014aae:	e9030012 	bez      	r3, 0x8014ad2	// 8014ad2 <_vsnprintf+0x3ba>
          while (l++ < width) {
 8014ab2:	c6240420 	cmphs      	r4, r17
 8014ab6:	080e      	bt      	0x8014ad2	// 8014ad2 <_vsnprintf+0x3ba>
 8014ab8:	c5710020 	addu      	r0, r17, r11
 8014abc:	5891      	subu      	r4, r0, r4
 8014abe:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014ac0:	e56b0000 	addi      	r11, r11, 1
 8014ac4:	6cdf      	mov      	r3, r7
 8014ac6:	6c63      	mov      	r1, r8
 8014ac8:	3020      	movi      	r0, 32
 8014aca:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014acc:	66d2      	cmpne      	r4, r11
 8014ace:	6caf      	mov      	r2, r11
 8014ad0:	0bf8      	bt      	0x8014ac0	// 8014ac0 <_vsnprintf+0x3a8>
        format++;
 8014ad2:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 8014ad4:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 8014ad6:	0630      	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014ad8:	3308      	movi      	r3, 8
 8014ada:	b864      	st.w      	r3, (r14, 0x10)
 8014adc:	3310      	movi      	r3, 16
 8014ade:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8014ae0:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014ae4:	3300      	movi      	r3, 0
 8014ae6:	b825      	st.w      	r1, (r14, 0x14)
 8014ae8:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014aec:	b861      	st.w      	r3, (r14, 0x4)
 8014aee:	9460      	ld.w      	r3, (r4, 0x0)
 8014af0:	b860      	st.w      	r3, (r14, 0x0)
 8014af2:	6caf      	mov      	r2, r11
 8014af4:	6cdf      	mov      	r3, r7
 8014af6:	6c63      	mov      	r1, r8
 8014af8:	6c1b      	mov      	r0, r6
 8014afa:	e6040003 	addi      	r16, r4, 4
 8014afe:	e3fff8af 	bsr      	0x8013c5c	// 8013c5c <_ntoa_long>
 8014b02:	6ec3      	mov      	r11, r0
        format++;
 8014b04:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8014b06:	c4104824 	lsli      	r4, r16, 0
        break;
 8014b0a:	0616      	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8014b0c:	e4212002 	andi      	r1, r1, 2
 8014b10:	e9210227 	bnez      	r1, 0x8014f5e	// 8014f5e <_vsnprintf+0x846>
          while (l++ < width) {
 8014b14:	3301      	movi      	r3, 1
 8014b16:	c6230420 	cmphs      	r3, r17
 8014b1a:	e860032f 	bt      	0x8015178	// 8015178 <_vsnprintf+0xa60>
 8014b1e:	e60b1000 	subi      	r16, r11, 1
 8014b22:	c6300030 	addu      	r16, r16, r17
 8014b26:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014b28:	e5420000 	addi      	r10, r2, 1
 8014b2c:	6cdf      	mov      	r3, r7
 8014b2e:	6c63      	mov      	r1, r8
 8014b30:	3020      	movi      	r0, 32
 8014b32:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014b34:	c5500480 	cmpne      	r16, r10
 8014b38:	6cab      	mov      	r2, r10
 8014b3a:	0bf7      	bt      	0x8014b28	// 8014b28 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014b3c:	8400      	ld.b      	r0, (r4, 0x0)
 8014b3e:	e6040003 	addi      	r16, r4, 4
 8014b42:	6cdf      	mov      	r3, r7
 8014b44:	6cab      	mov      	r2, r10
 8014b46:	6c63      	mov      	r1, r8
 8014b48:	e56a0000 	addi      	r11, r10, 1
 8014b4c:	7bd9      	jsr      	r6
 8014b4e:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014b52:	2500      	addi      	r5, 1
        break;
 8014b54:	e800fdf1 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8014b58:	eb400078 	cmpnei      	r0, 120
 8014b5c:	e8400277 	bf      	0x801504a	// 801504a <_vsnprintf+0x932>
 8014b60:	eb400058 	cmpnei      	r0, 88
 8014b64:	e8400275 	bf      	0x801504e	// 801504e <_vsnprintf+0x936>
        else if (*format == 'o') {
 8014b68:	eb40006f 	cmpnei      	r0, 111
 8014b6c:	e8400232 	bf      	0x8014fd0	// 8014fd0 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8014b70:	eb400062 	cmpnei      	r0, 98
 8014b74:	e84002d5 	bf      	0x801511e	// 801511e <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8014b78:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014b7c:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8014b80:	e8600232 	bt      	0x8014fe4	// 8014fe4 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8014b84:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8014b88:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8014b8a:	e9010236 	bez      	r1, 0x8014ff6	// 8014ff6 <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8014b8e:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8014b90:	eb400069 	cmpnei      	r0, 105
 8014b94:	e8400231 	bf      	0x8014ff6	// 8014ff6 <_vsnprintf+0x8de>
 8014b98:	eb400064 	cmpnei      	r0, 100
 8014b9c:	e840022d 	bf      	0x8014ff6	// 8014ff6 <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8014ba0:	e4232200 	andi      	r1, r3, 512
 8014ba4:	e9210276 	bnez      	r1, 0x8015090	// 8015090 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8014ba8:	e4032100 	andi      	r0, r3, 256
 8014bac:	e92002a2 	bnez      	r0, 0x80150f0	// 80150f0 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8014bb0:	e4232040 	andi      	r1, r3, 64
 8014bb4:	e92102cf 	bnez      	r1, 0x8015152	// 8015152 <_vsnprintf+0xa3a>
 8014bb8:	e4232080 	andi      	r1, r3, 128
 8014bbc:	e92102b3 	bnez      	r1, 0x8015122	// 8015122 <_vsnprintf+0xa0a>
 8014bc0:	9420      	ld.w      	r1, (r4, 0x0)
 8014bc2:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 8014bc4:	b865      	st.w      	r3, (r14, 0x14)
 8014bc6:	3300      	movi      	r3, 0
 8014bc8:	de2e2004 	st.w      	r17, (r14, 0x10)
 8014bcc:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8014bd0:	b842      	st.w      	r2, (r14, 0x8)
 8014bd2:	b861      	st.w      	r3, (r14, 0x4)
 8014bd4:	b820      	st.w      	r1, (r14, 0x0)
 8014bd6:	6caf      	mov      	r2, r11
 8014bd8:	6cdf      	mov      	r3, r7
 8014bda:	6c63      	mov      	r1, r8
 8014bdc:	6c1b      	mov      	r0, r6
 8014bde:	e3fff83f 	bsr      	0x8013c5c	// 8013c5c <_ntoa_long>
 8014be2:	6ec3      	mov      	r11, r0
        format++;
 8014be4:	2500      	addi      	r5, 1
 8014be6:	e800fda8 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8014bea:	eb400046 	cmpnei      	r0, 70
 8014bee:	e840023c 	bf      	0x8015066	// 8015066 <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014bf2:	b824      	st.w      	r1, (r14, 0x10)
 8014bf4:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014bf8:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014bfc:	e6040007 	addi      	r16, r4, 8
 8014c00:	9460      	ld.w      	r3, (r4, 0x0)
 8014c02:	9481      	ld.w      	r4, (r4, 0x4)
 8014c04:	b860      	st.w      	r3, (r14, 0x0)
 8014c06:	b881      	st.w      	r4, (r14, 0x4)
 8014c08:	6caf      	mov      	r2, r11
 8014c0a:	6cdf      	mov      	r3, r7
 8014c0c:	6c63      	mov      	r1, r8
 8014c0e:	6c1b      	mov      	r0, r6
 8014c10:	e3fff8f2 	bsr      	0x8013df4	// 8013df4 <_ftoa>
 8014c14:	6ec3      	mov      	r11, r0
        format++;
 8014c16:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014c18:	c4104824 	lsli      	r4, r16, 0
        break;
 8014c1c:	e800fd8d 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8014c20:	6caf      	mov      	r2, r11
 8014c22:	e54b0000 	addi      	r10, r11, 1
 8014c26:	6cdf      	mov      	r3, r7
 8014c28:	6c63      	mov      	r1, r8
 8014c2a:	3025      	movi      	r0, 37
 8014c2c:	7bd9      	jsr      	r6
        format++;
 8014c2e:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8014c30:	6eeb      	mov      	r11, r10
        break;
 8014c32:	e800fd82 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8014c36:	5c6e      	addi      	r3, r4, 4
 8014c38:	dac42000 	ld.w      	r22, (r4, 0x0)
 8014c3c:	b869      	st.w      	r3, (r14, 0x24)
 8014c3e:	e716000f 	addi      	r24, r22, 16
 8014c42:	3400      	movi      	r4, 0
                if (h > 9)
 8014c44:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8014c48:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8014c4c:	ea0c0000 	movi      	r12, 0
 8014c50:	da562000 	ld.w      	r18, (r22, 0x0)
 8014c54:	6c33      	mov      	r0, r12
 8014c56:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 8014c5a:	c5924043 	lsr      	r3, r18, r12
 8014c5e:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8014c60:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8014c62:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8014c66:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 8014c6a:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8014c6e:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8014c72:	092e      	bt      	0x8014ece	// 8014ece <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8014c74:	e6ae002f 	addi      	r21, r14, 48
 8014c78:	2236      	addi      	r2, 55
 8014c7a:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8014c7e:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8014c82:	e4930000 	addi      	r4, r19, 1
 8014c86:	7510      	zextb      	r4, r4
                if (l > 9)
 8014c88:	091e      	bt      	0x8014ec4	// 8014ec4 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8014c8a:	1a0c      	addi      	r2, r14, 48
 8014c8c:	2336      	addi      	r3, 55
 8014c8e:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8014c92:	e4602001 	andi      	r3, r0, 1
 8014c96:	e9030007 	bez      	r3, 0x8014ca4	// 8014ca4 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8014c9a:	1a0c      	addi      	r2, r14, 48
 8014c9c:	5c62      	addi      	r3, r4, 1
 8014c9e:	d4820037 	str.b      	r23, (r2, r4 << 0)
 8014ca2:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8014ca4:	2000      	addi      	r0, 1
 8014ca6:	7400      	zextb      	r0, r0
 8014ca8:	e58c0007 	addi      	r12, r12, 8
 8014cac:	e82dffd7 	bnezad      	r13, 0x8014c5a	// 8014c5a <_vsnprintf+0x542>
            inuint++;
 8014cb0:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8014cb4:	c6d80480 	cmpne      	r24, r22
 8014cb8:	0bca      	bt      	0x8014c4c	// 8014c4c <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8014cba:	e46e002e 	addi      	r3, r14, 47
 8014cbe:	3200      	movi      	r2, 0
 8014cc0:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8014cc4:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8014cc6:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8014cca:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8014ccc:	3a40      	cmpnei      	r2, 0
 8014cce:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8014cd2:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8014cd4:	6c83      	mov      	r2, r0
 8014cd6:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8014cda:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8014cde:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014ce0:	b86b      	st.w      	r3, (r14, 0x2c)
 8014ce2:	e923015a 	bnez      	r3, 0x8014f96	// 8014f96 <_vsnprintf+0x87e>
          while (l++ < width) {
 8014ce6:	c6220420 	cmphs      	r2, r17
 8014cea:	6ccb      	mov      	r3, r2
 8014cec:	2300      	addi      	r3, 1
 8014cee:	e8600239 	bt      	0x8015160	// 8015160 <_vsnprintf+0xa48>
 8014cf2:	c5710023 	addu      	r3, r17, r11
 8014cf6:	5b89      	subu      	r4, r3, r2
 8014cf8:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014cfa:	e56b0000 	addi      	r11, r11, 1
 8014cfe:	6cdf      	mov      	r3, r7
 8014d00:	6c63      	mov      	r1, r8
 8014d02:	3020      	movi      	r0, 32
 8014d04:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014d06:	66d2      	cmpne      	r4, r11
 8014d08:	6caf      	mov      	r2, r11
 8014d0a:	0bf8      	bt      	0x8014cfa	// 8014cfa <_vsnprintf+0x5e2>
 8014d0c:	e4710000 	addi      	r3, r17, 1
 8014d10:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d12:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014d16:	e900fe6d 	bez      	r0, 0x80149f0	// 80149f0 <_vsnprintf+0x2d8>
 8014d1a:	6caf      	mov      	r2, r11
 8014d1c:	e60e002f 	addi      	r16, r14, 48
 8014d20:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014d24:	0402      	br      	0x8014d28	// 8014d28 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8014d26:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d28:	e90b0007 	bez      	r11, 0x8014d36	// 8014d36 <_vsnprintf+0x61e>
 8014d2c:	e46a1000 	subi      	r3, r10, 1
 8014d30:	e90a0185 	bez      	r10, 0x801503a	// 801503a <_vsnprintf+0x922>
 8014d34:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014d36:	e6100000 	addi      	r16, r16, 1
 8014d3a:	6cdf      	mov      	r3, r7
 8014d3c:	6c63      	mov      	r1, r8
 8014d3e:	5a82      	addi      	r4, r2, 1
 8014d40:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014d42:	d8100000 	ld.b      	r0, (r16, 0x0)
 8014d46:	e920fff0 	bnez      	r0, 0x8014d26	// 8014d26 <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 8014d4a:	986b      	ld.w      	r3, (r14, 0x2c)
 8014d4c:	e90300e2 	bez      	r3, 0x8014f10	// 8014f10 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8014d50:	9868      	ld.w      	r3, (r14, 0x20)
 8014d52:	c6230420 	cmphs      	r3, r17
 8014d56:	08dd      	bt      	0x8014f10	// 8014f10 <_vsnprintf+0x7f8>
 8014d58:	c4910020 	addu      	r0, r17, r4
 8014d5c:	c460008a 	subu      	r10, r0, r3
 8014d60:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8014d62:	e5620000 	addi      	r11, r2, 1
 8014d66:	6cdf      	mov      	r3, r7
 8014d68:	6c63      	mov      	r1, r8
 8014d6a:	3020      	movi      	r0, 32
 8014d6c:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014d6e:	66ea      	cmpne      	r10, r11
 8014d70:	6caf      	mov      	r2, r11
 8014d72:	0bf8      	bt      	0x8014d62	// 8014d62 <_vsnprintf+0x64a>
        format++;
 8014d74:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014d76:	9889      	ld.w      	r4, (r14, 0x24)
 8014d78:	e800fcdf 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8014d7c:	5c6e      	addi      	r3, r4, 4
 8014d7e:	b869      	st.w      	r3, (r14, 0x24)
 8014d80:	da642000 	ld.w      	r19, (r4, 0x0)
 8014d84:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8014d86:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8014d8a:	ea15002d 	movi      	r21, 45
 8014d8e:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8014d92:	d8730000 	ld.b      	r3, (r19, 0x0)
 8014d96:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8014d98:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8014d9c:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8014da0:	089d      	bt      	0x8014eda	// 8014eda <_vsnprintf+0x7c2>
        if (lbit > 9)
 8014da2:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 8014da6:	2036      	addi      	r0, 55
 8014da8:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014daa:	089d      	bt      	0x8014ee4	// 8014ee4 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8014dac:	2336      	addi      	r3, 55
 8014dae:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8014db0:	dea20002 	st.b      	r21, (r2, 0x2)
 8014db4:	e6730000 	addi      	r19, r19, 1
 8014db8:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8014dba:	e832ffec 	bnezad      	r18, 0x8014d92	// 8014d92 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 8014dbe:	3300      	movi      	r3, 0
 8014dc0:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 8014dc4:	e4612400 	andi      	r3, r1, 1024
 8014dc8:	b86a      	st.w      	r3, (r14, 0x28)
 8014dca:	e90300f3 	bez      	r3, 0x8014fb0	// 8014fb0 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 8014dce:	ea100011 	movi      	r16, 17
 8014dd2:	fa0acd23 	min.u32      	r3, r10, r16
 8014dd6:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8014dd8:	e4612002 	andi      	r3, r1, 2
 8014ddc:	b86b      	st.w      	r3, (r14, 0x2c)
 8014dde:	e92300e2 	bnez      	r3, 0x8014fa2	// 8014fa2 <_vsnprintf+0x88a>
          while (l++ < width) {
 8014de2:	9848      	ld.w      	r2, (r14, 0x20)
 8014de4:	c6220420 	cmphs      	r2, r17
 8014de8:	6ccb      	mov      	r3, r2
 8014dea:	2300      	addi      	r3, 1
 8014dec:	09c9      	bt      	0x801517e	// 801517e <_vsnprintf+0xa66>
 8014dee:	c5710023 	addu      	r3, r17, r11
 8014df2:	c4430090 	subu      	r16, r3, r2
 8014df6:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8014df8:	e56b0000 	addi      	r11, r11, 1
 8014dfc:	6cdf      	mov      	r3, r7
 8014dfe:	6c63      	mov      	r1, r8
 8014e00:	3020      	movi      	r0, 32
 8014e02:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014e04:	c60b0480 	cmpne      	r11, r16
 8014e08:	6caf      	mov      	r2, r11
 8014e0a:	0bf7      	bt      	0x8014df8	// 8014df8 <_vsnprintf+0x6e0>
 8014e0c:	e4710000 	addi      	r3, r17, 1
 8014e10:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014e12:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014e16:	e900fded 	bez      	r0, 0x80149f0	// 80149f0 <_vsnprintf+0x2d8>
 8014e1a:	6caf      	mov      	r2, r11
 8014e1c:	1c0c      	addi      	r4, r14, 48
 8014e1e:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8014e22:	0403      	br      	0x8014e28	// 8014e28 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8014e24:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014e28:	e90b0007 	bez      	r11, 0x8014e36	// 8014e36 <_vsnprintf+0x71e>
 8014e2c:	e46a1000 	subi      	r3, r10, 1
 8014e30:	e90a010a 	bez      	r10, 0x8015044	// 8015044 <_vsnprintf+0x92c>
 8014e34:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8014e36:	2400      	addi      	r4, 1
 8014e38:	6cdf      	mov      	r3, r7
 8014e3a:	6c63      	mov      	r1, r8
 8014e3c:	e6020000 	addi      	r16, r2, 1
 8014e40:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014e42:	8400      	ld.b      	r0, (r4, 0x0)
 8014e44:	e920fff0 	bnez      	r0, 0x8014e24	// 8014e24 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8014e48:	986b      	ld.w      	r3, (r14, 0x2c)
 8014e4a:	e90300b6 	bez      	r3, 0x8014fb6	// 8014fb6 <_vsnprintf+0x89e>
          while (l++ < width) {
 8014e4e:	9868      	ld.w      	r3, (r14, 0x20)
 8014e50:	c6230420 	cmphs      	r3, r17
 8014e54:	08b1      	bt      	0x8014fb6	// 8014fb6 <_vsnprintf+0x89e>
 8014e56:	c6110020 	addu      	r0, r17, r16
 8014e5a:	588d      	subu      	r4, r0, r3
 8014e5c:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8014e60:	e5620000 	addi      	r11, r2, 1
 8014e64:	6cdf      	mov      	r3, r7
 8014e66:	6c63      	mov      	r1, r8
 8014e68:	3020      	movi      	r0, 32
 8014e6a:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014e6c:	652e      	cmpne      	r11, r4
 8014e6e:	6caf      	mov      	r2, r11
 8014e70:	0bf8      	bt      	0x8014e60	// 8014e60 <_vsnprintf+0x748>
        format++;
 8014e72:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014e74:	9889      	ld.w      	r4, (r14, 0x24)
 8014e76:	e800fc60 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8014e7a:	e46020df 	andi      	r3, r0, 223
 8014e7e:	eb430047 	cmpnei      	r3, 71
 8014e82:	0805      	bt      	0x8014e8c	// 8014e8c <_vsnprintf+0x774>
 8014e84:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8014e88:	e40020fd 	andi      	r0, r0, 253
 8014e8c:	eb400045 	cmpnei      	r0, 69
 8014e90:	0803      	bt      	0x8014e96	// 8014e96 <_vsnprintf+0x77e>
 8014e92:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014e96:	b824      	st.w      	r1, (r14, 0x10)
 8014e98:	de2e2003 	st.w      	r17, (r14, 0xc)
 8014e9c:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8014ea0:	e6040007 	addi      	r16, r4, 8
 8014ea4:	9460      	ld.w      	r3, (r4, 0x0)
 8014ea6:	9481      	ld.w      	r4, (r4, 0x4)
 8014ea8:	b860      	st.w      	r3, (r14, 0x0)
 8014eaa:	b881      	st.w      	r4, (r14, 0x4)
 8014eac:	6caf      	mov      	r2, r11
 8014eae:	6cdf      	mov      	r3, r7
 8014eb0:	6c63      	mov      	r1, r8
 8014eb2:	6c1b      	mov      	r0, r6
 8014eb4:	e3fff9ec 	bsr      	0x801428c	// 801428c <_etoa>
 8014eb8:	6ec3      	mov      	r11, r0
        format++;
 8014eba:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8014ebc:	c4104824 	lsli      	r4, r16, 0
        break;
 8014ec0:	e800fc3b 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 8014ec4:	1a0c      	addi      	r2, r14, 48
 8014ec6:	232f      	addi      	r3, 48
 8014ec8:	d6620023 	str.b      	r3, (r2, r19 << 0)
 8014ecc:	06e3      	br      	0x8014c92	// 8014c92 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 8014ece:	e6ae002f 	addi      	r21, r14, 48
 8014ed2:	222f      	addi      	r2, 48
 8014ed4:	d4950022 	str.b      	r2, (r21, r4 << 0)
 8014ed8:	06d3      	br      	0x8014c7e	// 8014c7e <_vsnprintf+0x566>
        if (lbit > 9)
 8014eda:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 8014ede:	202f      	addi      	r0, 48
 8014ee0:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8014ee2:	0f65      	bf      	0x8014dac	// 8014dac <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 8014ee4:	232f      	addi      	r3, 48
 8014ee6:	a261      	st.b      	r3, (r2, 0x1)
 8014ee8:	0764      	br      	0x8014db0	// 8014db0 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 8014eea:	c6828422 	mult      	r2, r2, r20
 8014eee:	60ca      	subu      	r3, r2
 8014ef0:	74cc      	zextb      	r3, r3
 8014ef2:	c6638022 	divu      	r2, r3, r19
            if (m)
 8014ef6:	e902fd0c 	bez      	r2, 0x801490e	// 801490e <_vsnprintf+0x1f6>
 8014efa:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 8014efc:	e5ae002f 	addi      	r13, r14, 48
 8014f00:	e48c0000 	addi      	r4, r12, 1
 8014f04:	222f      	addi      	r2, 48
 8014f06:	7510      	zextb      	r4, r4
 8014f08:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 8014f0c:	e800fd01 	br      	0x801490e	// 801490e <_vsnprintf+0x1f6>
          while (l++ < width) {
 8014f10:	6ed3      	mov      	r11, r4
        format++;
 8014f12:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014f14:	9889      	ld.w      	r4, (r14, 0x24)
 8014f16:	e800fc10 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
 8014f1a:	6caf      	mov      	r2, r11
 8014f1c:	e800fc81 	br      	0x801481e	// 801481e <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8014f20:	9400      	ld.w      	r0, (r4, 0x0)
 8014f22:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8014f24:	e98000af 	blz      	r0, 0x8015082	// 8015082 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 8014f28:	c4004831 	lsli      	r17, r0, 0
 8014f2c:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 8014f2e:	6d0f      	mov      	r4, r3
      format++;
 8014f30:	5aa2      	addi      	r5, r2, 1
 8014f32:	e800fc38 	br      	0x80147a2	// 80147a2 <_vsnprintf+0x8a>
 8014f36:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 8014f38:	ec2100c0 	ori      	r1, r1, 192
          format++;
 8014f3c:	2501      	addi      	r5, 2
 8014f3e:	e800fc47 	br      	0x80147cc	// 80147cc <_vsnprintf+0xb4>
 8014f42:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8014f44:	ec210300 	ori      	r1, r1, 768
          format++;
 8014f48:	2501      	addi      	r5, 2
 8014f4a:	e800fc41 	br      	0x80147cc	// 80147cc <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014f4e:	e900fdb2 	bez      	r0, 0x8014ab2	// 8014ab2 <_vsnprintf+0x39a>
 8014f52:	6caf      	mov      	r2, r11
 8014f54:	b88b      	st.w      	r4, (r14, 0x2c)
 8014f56:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8014f5a:	e800fd96 	br      	0x8014a86	// 8014a86 <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014f5e:	6cdf      	mov      	r3, r7
 8014f60:	6caf      	mov      	r2, r11
 8014f62:	6c63      	mov      	r1, r8
 8014f64:	8400      	ld.b      	r0, (r4, 0x0)
 8014f66:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014f68:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014f6c:	e6040003 	addi      	r16, r4, 4
 8014f70:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8014f74:	0cfc      	bf      	0x801516c	// 801516c <_vsnprintf+0xa54>
 8014f76:	c571002b 	addu      	r11, r17, r11
 8014f7a:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 8014f7c:	5a82      	addi      	r4, r2, 1
 8014f7e:	6cdf      	mov      	r3, r7
 8014f80:	6c63      	mov      	r1, r8
 8014f82:	3020      	movi      	r0, 32
 8014f84:	7bd9      	jsr      	r6
          while (l++ < width) {
 8014f86:	652e      	cmpne      	r11, r4
 8014f88:	6c93      	mov      	r2, r4
 8014f8a:	0bf9      	bt      	0x8014f7c	// 8014f7c <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8014f8c:	c4104824 	lsli      	r4, r16, 0
        format++;
 8014f90:	2500      	addi      	r5, 1
 8014f92:	e800fbd2 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014f96:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014f9a:	e920fec0 	bnez      	r0, 0x8014d1a	// 8014d1a <_vsnprintf+0x602>
 8014f9e:	6d2f      	mov      	r4, r11
 8014fa0:	06d8      	br      	0x8014d50	// 8014d50 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014fa2:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014fa6:	e920ff3a 	bnez      	r0, 0x8014e1a	// 8014e1a <_vsnprintf+0x702>
 8014faa:	c40b4830 	lsli      	r16, r11, 0
 8014fae:	0750      	br      	0x8014e4e	// 8014e4e <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8014fb0:	3311      	movi      	r3, 17
 8014fb2:	b868      	st.w      	r3, (r14, 0x20)
 8014fb4:	0712      	br      	0x8014dd8	// 8014dd8 <_vsnprintf+0x6c0>
          while (l++ < width) {
 8014fb6:	c410482b 	lsli      	r11, r16, 0
        format++;
 8014fba:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8014fbc:	9889      	ld.w      	r4, (r14, 0x24)
 8014fbe:	e800fbbc 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8014fc2:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8014fc6:	e920fce7 	bnez      	r0, 0x8014994	// 8014994 <_vsnprintf+0x27c>
 8014fca:	6d2f      	mov      	r4, r11
 8014fcc:	e800fcff 	br      	0x80149ca	// 80149ca <_vsnprintf+0x2b2>
          base =  8U;
 8014fd0:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8014fd2:	c4412823 	bclri      	r3, r1, 2
 8014fd6:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8014fd8:	e4212400 	andi      	r1, r1, 1024
 8014fdc:	e901fdda 	bez      	r1, 0x8014b90	// 8014b90 <_vsnprintf+0x478>
 8014fe0:	e800fdd7 	br      	0x8014b8e	// 8014b8e <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 8014fe4:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8014fe8:	6c4f      	mov      	r1, r3
          base = 10U;
 8014fea:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 8014fec:	0bf3      	bt      	0x8014fd2	// 8014fd2 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 8014fee:	e4232400 	andi      	r1, r3, 1024
 8014ff2:	e921fdce 	bnez      	r1, 0x8014b8e	// 8014b8e <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 8014ff6:	e4232200 	andi      	r1, r3, 512
 8014ffa:	e9210066 	bnez      	r1, 0x80150c6	// 80150c6 <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 8014ffe:	e4032100 	andi      	r0, r3, 256
 8015002:	e9200099 	bnez      	r0, 0x8015134	// 8015134 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8015006:	e4232040 	andi      	r1, r3, 64
 801500a:	e92100a8 	bnez      	r1, 0x801515a	// 801515a <_vsnprintf+0xa42>
 801500e:	e4232080 	andi      	r1, r3, 128
 8015012:	e921008c 	bnez      	r1, 0x801512a	// 801512a <_vsnprintf+0xa12>
 8015016:	9420      	ld.w      	r1, (r4, 0x0)
 8015018:	491f      	lsri      	r0, r1, 31
 801501a:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801501c:	b865      	st.w      	r3, (r14, 0x14)
 801501e:	de2e2004 	st.w      	r17, (r14, 0x10)
 8015022:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8015026:	b842      	st.w      	r2, (r14, 0x8)
 8015028:	b801      	st.w      	r0, (r14, 0x4)
 801502a:	c4010201 	abs      	r1, r1
 801502e:	e800fdd3 	br      	0x8014bd4	// 8014bd4 <_vsnprintf+0x4bc>
 8015032:	988b      	ld.w      	r4, (r14, 0x2c)
 8015034:	6ecb      	mov      	r11, r2
 8015036:	e800fd3b 	br      	0x8014aac	// 8014aac <_vsnprintf+0x394>
 801503a:	6d0b      	mov      	r4, r2
 801503c:	0687      	br      	0x8014d4a	// 8014d4a <_vsnprintf+0x632>
 801503e:	6d0b      	mov      	r4, r2
 8015040:	e800fcc2 	br      	0x80149c4	// 80149c4 <_vsnprintf+0x2ac>
 8015044:	c4024830 	lsli      	r16, r2, 0
 8015048:	0700      	br      	0x8014e48	// 8014e48 <_vsnprintf+0x730>
          base = 16U;
 801504a:	3210      	movi      	r2, 16
 801504c:	07c3      	br      	0x8014fd2	// 8014fd2 <_vsnprintf+0x8ba>
 801504e:	c4412823 	bclri      	r3, r1, 2
 8015052:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8015054:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8015058:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 801505c:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 801505e:	e921fd98 	bnez      	r1, 0x8014b8e	// 8014b8e <_vsnprintf+0x476>
 8015062:	e800fd9f 	br      	0x8014ba0	// 8014ba0 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8015066:	ec210020 	ori      	r1, r1, 32
 801506a:	e800fdc4 	br      	0x8014bf2	// 8014bf2 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 801506e:	d9a42000 	ld.w      	r13, (r4, 0x0)
 8015072:	3300      	movi      	r3, 0
 8015074:	8502      	ld.b      	r0, (r5, 0x2)
 8015076:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 801507a:	2403      	addi      	r4, 4
        format++;
 801507c:	2501      	addi      	r5, 2
 801507e:	e800fb97 	br      	0x80147ac	// 80147ac <_vsnprintf+0x94>
        width = (unsigned int)-w;
 8015082:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 8015086:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 801508a:	c40c0091 	subu      	r17, r12, r0
 801508e:	074f      	br      	0x8014f2c	// 8014f2c <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8015090:	b867      	st.w      	r3, (r14, 0x1c)
 8015092:	3300      	movi      	r3, 0
 8015094:	de2e2006 	st.w      	r17, (r14, 0x18)
 8015098:	dd4e2005 	st.w      	r10, (r14, 0x14)
 801509c:	b843      	st.w      	r2, (r14, 0xc)
 801509e:	b864      	st.w      	r3, (r14, 0x10)
 80150a0:	b862      	st.w      	r3, (r14, 0x8)
 80150a2:	e6040007 	addi      	r16, r4, 8
 80150a6:	9460      	ld.w      	r3, (r4, 0x0)
 80150a8:	9481      	ld.w      	r4, (r4, 0x4)
 80150aa:	b860      	st.w      	r3, (r14, 0x0)
 80150ac:	b881      	st.w      	r4, (r14, 0x4)
 80150ae:	6caf      	mov      	r2, r11
 80150b0:	6cdf      	mov      	r3, r7
 80150b2:	6c63      	mov      	r1, r8
 80150b4:	6c1b      	mov      	r0, r6
 80150b6:	e3fff633 	bsr      	0x8013d1c	// 8013d1c <_ntoa_long_long>
 80150ba:	6ec3      	mov      	r11, r0
 80150bc:	c4104824 	lsli      	r4, r16, 0
        format++;
 80150c0:	2500      	addi      	r5, 1
 80150c2:	e800fb3a 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 80150c6:	9421      	ld.w      	r1, (r4, 0x4)
 80150c8:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80150ca:	b867      	st.w      	r3, (r14, 0x1c)
 80150cc:	3300      	movi      	r3, 0
 80150ce:	b864      	st.w      	r3, (r14, 0x10)
 80150d0:	497f      	lsri      	r3, r1, 31
 80150d2:	b843      	st.w      	r2, (r14, 0xc)
 80150d4:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80150d6:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80150da:	de2e2006 	st.w      	r17, (r14, 0x18)
 80150de:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80150e2:	6c83      	mov      	r2, r0
 80150e4:	6cc7      	mov      	r3, r1
 80150e6:	e9810053 	blz      	r1, 0x801518c	// 801518c <_vsnprintf+0xa74>
 80150ea:	b840      	st.w      	r2, (r14, 0x0)
 80150ec:	b861      	st.w      	r3, (r14, 0x4)
 80150ee:	07e0      	br      	0x80150ae	// 80150ae <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80150f0:	b865      	st.w      	r3, (r14, 0x14)
 80150f2:	de2e2004 	st.w      	r17, (r14, 0x10)
 80150f6:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80150fa:	b842      	st.w      	r2, (r14, 0x8)
 80150fc:	b821      	st.w      	r1, (r14, 0x4)
 80150fe:	9460      	ld.w      	r3, (r4, 0x0)
 8015100:	e6040003 	addi      	r16, r4, 4
 8015104:	b860      	st.w      	r3, (r14, 0x0)
 8015106:	6caf      	mov      	r2, r11
 8015108:	6cdf      	mov      	r3, r7
 801510a:	6c63      	mov      	r1, r8
 801510c:	6c1b      	mov      	r0, r6
 801510e:	e3fff5a7 	bsr      	0x8013c5c	// 8013c5c <_ntoa_long>
 8015112:	6ec3      	mov      	r11, r0
 8015114:	c4104824 	lsli      	r4, r16, 0
        format++;
 8015118:	2500      	addi      	r5, 1
 801511a:	e800fb0e 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
          base =  2U;
 801511e:	3202      	movi      	r2, 2
 8015120:	0759      	br      	0x8014fd2	// 8014fd2 <_vsnprintf+0x8ba>
 8015122:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8015124:	2403      	addi      	r4, 4
 8015126:	e800fd4f 	br      	0x8014bc4	// 8014bc4 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801512a:	d8245000 	ld.hs      	r1, (r4, 0x0)
 801512e:	491f      	lsri      	r0, r1, 31
 8015130:	2403      	addi      	r4, 4
 8015132:	0775      	br      	0x801501c	// 801501c <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8015134:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015136:	b865      	st.w      	r3, (r14, 0x14)
 8015138:	497f      	lsri      	r3, r1, 31
 801513a:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 801513e:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015142:	de2e2004 	st.w      	r17, (r14, 0x10)
 8015146:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801514a:	b842      	st.w      	r2, (r14, 0x8)
 801514c:	b861      	st.w      	r3, (r14, 0x4)
 801514e:	b820      	st.w      	r1, (r14, 0x0)
 8015150:	07db      	br      	0x8015106	// 8015106 <_vsnprintf+0x9ee>
 8015152:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8015154:	2403      	addi      	r4, 4
 8015156:	e800fd37 	br      	0x8014bc4	// 8014bc4 <_vsnprintf+0x4ac>
 801515a:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801515c:	2403      	addi      	r4, 4
 801515e:	075f      	br      	0x801501c	// 801501c <_vsnprintf+0x904>
          while (l++ < width) {
 8015160:	b868      	st.w      	r3, (r14, 0x20)
 8015162:	e800fdd8 	br      	0x8014d12	// 8014d12 <_vsnprintf+0x5fa>
          while (l++ < width) {
 8015166:	b868      	st.w      	r3, (r14, 0x20)
 8015168:	e800fc12 	br      	0x801498c	// 801498c <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801516c:	c4104824 	lsli      	r4, r16, 0
 8015170:	6eeb      	mov      	r11, r10
        format++;
 8015172:	2500      	addi      	r5, 1
 8015174:	e800fae1 	br      	0x8014736	// 8014736 <_vsnprintf+0x1e>
          while (l++ < width) {
 8015178:	6eaf      	mov      	r10, r11
 801517a:	e800fce1 	br      	0x8014b3c	// 8014b3c <_vsnprintf+0x424>
          while (l++ < width) {
 801517e:	b868      	st.w      	r3, (r14, 0x20)
 8015180:	0649      	br      	0x8014e12	// 8014e12 <_vsnprintf+0x6fa>
          while (l++ < width) {
 8015182:	6d0f      	mov      	r4, r3
 8015184:	c40b4832 	lsli      	r18, r11, 0
 8015188:	e800fc76 	br      	0x8014a74	// 8014a74 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801518c:	3000      	movi      	r0, 0
 801518e:	3100      	movi      	r1, 0
 8015190:	f840c462 	sub.64      	r2, r0, r2
 8015194:	07ab      	br      	0x80150ea	// 80150ea <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015196:	c412482b 	lsli      	r11, r18, 0
 801519a:	e800fc9c 	br      	0x8014ad2	// 8014ad2 <_vsnprintf+0x3ba>
	...

080151a0 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80151a0:	1046      	lrw      	r2, 0x40010600	// 80151b8 <fputc+0x18>
 80151a2:	9267      	ld.w      	r3, (r2, 0x1c)
 80151a4:	e463203f 	andi      	r3, r3, 63
 80151a8:	3b1f      	cmphsi      	r3, 32
 80151aa:	0bfc      	bt      	0x80151a2	// 80151a2 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80151ac:	e40020ff 	andi      	r0, r0, 255
 80151b0:	b208      	st.w      	r0, (r2, 0x20)
}
 80151b2:	3000      	movi      	r0, 0
 80151b4:	783c      	jmp      	r15
 80151b6:	0000      	.short	0x0000
 80151b8:	40010600 	.long	0x40010600

080151bc <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 80151bc:	1424      	subi      	r14, r14, 16
 80151be:	b863      	st.w      	r3, (r14, 0xc)
 80151c0:	b842      	st.w      	r2, (r14, 0x8)
 80151c2:	b821      	st.w      	r1, (r14, 0x4)
 80151c4:	b800      	st.w      	r0, (r14, 0x0)
 80151c6:	14d0      	push      	r15
 80151c8:	1421      	subi      	r14, r14, 4
 80151ca:	9862      	ld.w      	r3, (r14, 0x8)
 80151cc:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80151ce:	1b03      	addi      	r3, r14, 12
 80151d0:	b860      	st.w      	r3, (r14, 0x0)
 80151d2:	6ccb      	mov      	r3, r2
 80151d4:	3200      	movi      	r2, 0
 80151d6:	2a00      	subi      	r2, 1
 80151d8:	6c4f      	mov      	r1, r3
 80151da:	1005      	lrw      	r0, 0x80139c0	// 80151ec <wm_printf+0x30>
 80151dc:	e3fffa9e 	bsr      	0x8014718	// 8014718 <_vsnprintf>
	va_end(args);

	return length;
}
 80151e0:	1401      	addi      	r14, r14, 4
 80151e2:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80151e6:	1405      	addi      	r14, r14, 20
 80151e8:	783c      	jmp      	r15
 80151ea:	0000      	.short	0x0000
 80151ec:	080139c0 	.long	0x080139c0

080151f0 <__assert_fail>:

__attribute__((weak)) void __assert_fail(const char *file,
	int line,
	const char *func,
	const char *failedexpr)
{
 80151f0:	14d0      	push      	r15
 80151f2:	1422      	subi      	r14, r14, 8
 80151f4:	6f07      	mov      	r12, r1
 80151f6:	6c4f      	mov      	r1, r3
    wm_printf("assertion \"%s\" failed: file \"%s\", line %d%s%s\r\n",
 80151f8:	e902000b 	bez      	r2, 0x801520e	// 801520e <__assert_fail+0x1e>
 80151fc:	1066      	lrw      	r3, 0x80157a4	// 8015214 <__assert_fail+0x24>
 80151fe:	b841      	st.w      	r2, (r14, 0x4)
 8015200:	b860      	st.w      	r3, (r14, 0x0)
 8015202:	6c83      	mov      	r2, r0
 8015204:	6cf3      	mov      	r3, r12
 8015206:	1005      	lrw      	r0, 0x80157b4	// 8015218 <__assert_fail+0x28>
 8015208:	e3ffffda 	bsr      	0x80151bc	// 80151bc <wm_printf>
 801520c:	0400      	br      	0x801520c	// 801520c <__assert_fail+0x1c>
 801520e:	1064      	lrw      	r3, 0x8015898	// 801521c <__assert_fail+0x2c>
 8015210:	6c8f      	mov      	r2, r3
 8015212:	07f6      	br      	0x80151fe	// 80151fe <__assert_fail+0xe>
 8015214:	080157a4 	.long	0x080157a4
 8015218:	080157b4 	.long	0x080157b4
 801521c:	08015898 	.long	0x08015898

08015220 <vTaskSwitchContext>:

#endif /* configUSE_APPLICATION_TASK_TAG */
/*-----------------------------------------------------------*/

void vTaskSwitchContext( void )
{
 8015220:	14d0      	push      	r15
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
 8015222:	1160      	lrw      	r3, 0x20003204	// 80152a0 <vTaskSwitchContext+0x80>
 8015224:	9360      	ld.w      	r3, (r3, 0x0)
 8015226:	e9230034 	bnez      	r3, 0x801528e	// 801528e <vTaskSwitchContext+0x6e>
         * switch. */
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
 801522a:	105f      	lrw      	r2, 0x2000320c	// 80152a4 <vTaskSwitchContext+0x84>
            }
        #endif

        /* Select a new task to run using either the generic C or port
         * optimised asm code. */
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 801522c:	ea8d001f 	lrw      	r13, 0x20003208	// 80152a8 <vTaskSwitchContext+0x88>
 8015230:	3114      	movi      	r1, 20
        xYieldPending = pdFALSE;
 8015232:	b260      	st.w      	r3, (r2, 0x0)
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8015234:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8015238:	c4238420 	mult      	r0, r3, r1
 801523c:	105c      	lrw      	r2, 0x20002d18	// 80152ac <vTaskSwitchContext+0x8c>
 801523e:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8015242:	e900000a 	bez      	r0, 0x8015256	// 8015256 <vTaskSwitchContext+0x36>
 8015246:	0411      	br      	0x8015268	// 8015268 <vTaskSwitchContext+0x48>
 8015248:	2b00      	subi      	r3, 1
 801524a:	c4238420 	mult      	r0, r3, r1
 801524e:	d0020820 	ldr.w      	r0, (r2, r0 << 0)
 8015252:	e920000b 	bnez      	r0, 0x8015268	// 8015268 <vTaskSwitchContext+0x48>
 8015256:	e923fff9 	bnez      	r3, 0x8015248	// 8015248 <vTaskSwitchContext+0x28>
 801525a:	ea020be7 	movi      	r2, 3047
 801525e:	1035      	lrw      	r1, 0x801584c	// 80152b0 <vTaskSwitchContext+0x90>
 8015260:	1015      	lrw      	r0, 0x8015888	// 80152b4 <vTaskSwitchContext+0x94>
 8015262:	e3ffffad 	bsr      	0x80151bc	// 80151bc <wm_printf>
 8015266:	0400      	br      	0x8015266	// 8015266 <vTaskSwitchContext+0x46>
 8015268:	3014      	movi      	r0, 20
 801526a:	7c0c      	mult      	r0, r3
 801526c:	c402002c 	addu      	r12, r2, r0
 8015270:	2007      	addi      	r0, 8
 8015272:	d82c2001 	ld.w      	r1, (r12, 0x4)
 8015276:	6080      	addu      	r2, r0
 8015278:	9121      	ld.w      	r1, (r1, 0x4)
 801527a:	6486      	cmpne      	r1, r2
 801527c:	dc2c2001 	st.w      	r1, (r12, 0x4)
 8015280:	0c0b      	bf      	0x8015296	// 8015296 <vTaskSwitchContext+0x76>
 8015282:	104e      	lrw      	r2, 0x20002d14	// 80152b8 <vTaskSwitchContext+0x98>
 8015284:	9123      	ld.w      	r1, (r1, 0xc)
 8015286:	b220      	st.w      	r1, (r2, 0x0)
 8015288:	dc6d2000 	st.w      	r3, (r13, 0x0)
                 * for additional information. */
                _impure_ptr = &( pxCurrentTCB->xNewLib_reent );
            }
        #endif /* configUSE_NEWLIB_REENTRANT */
    }
}
 801528c:	1490      	pop      	r15
        xYieldPending = pdTRUE;
 801528e:	1066      	lrw      	r3, 0x2000320c	// 80152a4 <vTaskSwitchContext+0x84>
 8015290:	3201      	movi      	r2, 1
 8015292:	b340      	st.w      	r2, (r3, 0x0)
}
 8015294:	1490      	pop      	r15
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
 8015296:	9121      	ld.w      	r1, (r1, 0x4)
 8015298:	dc2c2001 	st.w      	r1, (r12, 0x4)
 801529c:	07f3      	br      	0x8015282	// 8015282 <vTaskSwitchContext+0x62>
 801529e:	0000      	.short	0x0000
 80152a0:	20003204 	.long	0x20003204
 80152a4:	2000320c 	.long	0x2000320c
 80152a8:	20003208 	.long	0x20003208
 80152ac:	20002d18 	.long	0x20002d18
 80152b0:	0801584c 	.long	0x0801584c
 80152b4:	08015888 	.long	0x08015888
 80152b8:	20002d14 	.long	0x20002d14
 80152bc:	00000000 	.long	0x00000000
