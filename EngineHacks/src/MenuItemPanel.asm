	.cpu arm7tdmi
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"MenuItemPanel.c"
@ GNU C17 (devkitARM release 56) version 11.1.0 (arm-none-eabi)
@	compiled by GNU C version 10.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Os -ffreestanding
	.text
	.align	1
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	unk_Draw, %function
unk_Draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}	@
@ src/MenuItemPanel.c:91: 	int mod = Mod(GetGameClock(),3);
	ldr	r3, .L5	@ tmp125,
@ src/MenuItemPanel.c:89: static void unk_Draw(u8 xPos, u8 yPos, u8 style){
	movs	r5, r1	@ yPos, tmp135
	movs	r6, r2	@ style, tmp136
	movs	r4, r0	@ xPos, tmp134
@ src/MenuItemPanel.c:91: 	int mod = Mod(GetGameClock(),3);
	bl	.L7		@
	ldr	r3, .L5+4	@ tmp126,
	movs	r1, #3	@,
	bl	.L7		@
@ src/MenuItemPanel.c:94: 		ppData = ObjData_859A530;
	ldr	r3, .L5+8	@ ppData,
@ src/MenuItemPanel.c:93: 	if( 0 == style )
	cmp	r6, #0	@ style,
	beq	.L2		@,
@ src/MenuItemPanel.c:96: 		ppData = ObjData_859A53C;
	ldr	r3, .L5+12	@ ppData,
.L2:
@ src/MenuItemPanel.c:100: }
	@ sp needed	@
@ src/MenuItemPanel.c:99: 	ObjInsertSafe(4, xPos, yPos, ppData[mod], 0);
	movs	r1, r4	@ tmp130, xPos
	movs	r4, #0	@ tmp132,
	str	r4, [sp]	@ tmp132,
	lsls	r0, r0, #2	@ tmp127, mod,
	movs	r2, r5	@ tmp128, yPos
	ldr	r3, [r0, r3]	@, *_6
	ldr	r4, .L5+16	@ tmp133,
	movs	r0, #4	@,
	bl	.L8		@
@ src/MenuItemPanel.c:100: }
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	.align	2
.L5:
	.word	GetGameClock
	.word	Mod
	.word	ObjData_859A530
	.word	ObjData_859A53C
	.word	ObjInsertSafe
	.size	unk_Draw, .-unk_Draw
	.align	1
	.global	ForceMenuItemPanel
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	ForceMenuItemPanel, %function
ForceMenuItemPanel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
@ src/MenuItemPanel.c:24: 	if( 0 != ProcFind( gProc_MenuItemPanel ) )
	ldr	r7, .L11	@ tmp130,
@ src/MenuItemPanel.c:21: void ForceMenuItemPanel(MenuProc* pmu, Unit* unit, u8 xPos, u8 yPos){
	movs	r6, r0	@ pmu, tmp193
	str	r3, [sp, #4]	@ tmp196, %sfp
@ src/MenuItemPanel.c:24: 	if( 0 != ProcFind( gProc_MenuItemPanel ) )
	movs	r0, r7	@, tmp130
	ldr	r3, .L11+4	@ tmp131,
@ src/MenuItemPanel.c:21: void ForceMenuItemPanel(MenuProc* pmu, Unit* unit, u8 xPos, u8 yPos){
	movs	r4, r1	@ unit, tmp194
	movs	r5, r2	@ xPos, tmp195
@ src/MenuItemPanel.c:24: 	if( 0 != ProcFind( gProc_MenuItemPanel ) )
	bl	.L7		@
@ src/MenuItemPanel.c:24: 	if( 0 != ProcFind( gProc_MenuItemPanel ) )
	cmp	r0, #0	@ tmp197,
	bne	.L9		@,
@ src/MenuItemPanel.c:27: 	panel = (PanelProc*)ProcStart(gProc_MenuItemPanel, (Proc*)pmu);
	movs	r1, r6	@, pmu
	movs	r0, r7	@, tmp130
	ldr	r3, .L11+8	@ tmp133,
	bl	.L7		@
@ src/MenuItemPanel.c:30: 	panel->xPos = xPos;
	movs	r3, r0	@ tmp136, panel
@ src/MenuItemPanel.c:31: 	panel->yPos = yPos;
	ldr	r2, [sp, #4]	@ yPos, %sfp
@ src/MenuItemPanel.c:30: 	panel->xPos = xPos;
	adds	r3, r3, #48	@ tmp136,
@ src/MenuItemPanel.c:29: 	panel->unit = unit;
	str	r4, [r0, #44]	@ unit, panel_19->unit
@ src/MenuItemPanel.c:30: 	panel->xPos = xPos;
	strb	r5, [r3]	@ xPos, panel_19->xPos
@ src/MenuItemPanel.c:32: 	panel->IconPalIndex = 3;
	movs	r5, r0	@ tmp144, panel
@ src/MenuItemPanel.c:31: 	panel->yPos = yPos;
	strb	r2, [r3, #1]	@ yPos, panel_19->yPos
@ src/MenuItemPanel.c:32: 	panel->IconPalIndex = 3;
	movs	r3, #3	@ tmp145,
@ src/MenuItemPanel.c:27: 	panel = (PanelProc*)ProcStart(gProc_MenuItemPanel, (Proc*)pmu);
	movs	r6, r0	@ panel, tmp198
@ src/MenuItemPanel.c:32: 	panel->IconPalIndex = 3;
	adds	r5, r5, #50	@ tmp144,
@ src/MenuItemPanel.c:34: 	panel->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
	movs	r0, r4	@, unit
@ src/MenuItemPanel.c:32: 	panel->IconPalIndex = 3;
	strb	r3, [r5]	@ tmp145, panel_19->IconPalIndex
@ src/MenuItemPanel.c:34: 	panel->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
	ldr	r3, .L11+12	@ tmp147,
	bl	.L7		@
@ src/MenuItemPanel.c:34: 	panel->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
	movs	r3, r6	@ tmp150, panel
	adds	r3, r3, #51	@ tmp150,
	strb	r0, [r3]	@ tmp199, panel_19->ItemSlotIndex
@ src/MenuItemPanel.c:35: 	panel->_unk64 = TRUE;
	movs	r7, #1	@ tmp155,
@ src/MenuItemPanel.c:37: 	Text_InitDB( &panel->text[0], 0xC );
	movs	r0, r6	@ tmp157, panel
@ src/MenuItemPanel.c:35: 	panel->_unk64 = TRUE;
	adds	r3, r3, #49	@ tmp154,
	strb	r7, [r3]	@ tmp155, panel_19->_unk64
@ src/MenuItemPanel.c:37: 	Text_InitDB( &panel->text[0], 0xC );
	ldr	r4, .L11+16	@ tmp158,
	movs	r1, #12	@,
@ src/MenuItemPanel.c:37: 	Text_InitDB( &panel->text[0], 0xC );
	adds	r0, r0, #52	@ tmp157,
@ src/MenuItemPanel.c:37: 	Text_InitDB( &panel->text[0], 0xC );
	bl	.L8		@
@ src/MenuItemPanel.c:38: 	Text_InitDB( &panel->text[1], 0xC );
	movs	r0, r6	@ tmp159, panel
@ src/MenuItemPanel.c:38: 	Text_InitDB( &panel->text[1], 0xC );
	movs	r1, #12	@,
@ src/MenuItemPanel.c:38: 	Text_InitDB( &panel->text[1], 0xC );
	adds	r0, r0, #60	@ tmp159,
@ src/MenuItemPanel.c:38: 	Text_InitDB( &panel->text[1], 0xC );
	bl	.L8		@
@ src/MenuItemPanel.c:39: 	Text_InitDB( &panel->text[2], 0xC );
	movs	r0, r6	@ tmp161, panel
@ src/MenuItemPanel.c:39: 	Text_InitDB( &panel->text[2], 0xC );
	movs	r1, #12	@,
@ src/MenuItemPanel.c:39: 	Text_InitDB( &panel->text[2], 0xC );
	adds	r0, r0, #68	@ tmp161,
@ src/MenuItemPanel.c:39: 	Text_InitDB( &panel->text[2], 0xC );
	bl	.L8		@
@ src/MenuItemPanel.c:41: 	LoadIconPalette( 1 , panel->IconPalIndex );
	movs	r0, r7	@, tmp155
	ldrb	r1, [r5]	@ tmp166,
	ldr	r3, .L11+20	@ tmp167,
	bl	.L7		@
@ src/MenuItemPanel.c:43: 	BattleGenerateUiStats( panel->unit, BU_ISLOT_AUTO );
	movs	r1, #1	@,
	ldr	r0, [r6, #44]	@, panel_19->unit
	ldr	r3, .L11+24	@ tmp169,
	rsbs	r1, r1, #0	@,
	bl	.L7		@
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	ldr	r2, .L11+28	@ tmp171,
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	ldr	r3, .L11+32	@ tmp170,
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	movs	r0, r2	@ tmp174, tmp171
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	movs	r1, r3	@ tmp177, tmp170
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	adds	r0, r0, #90	@ tmp174,
@ src/MenuItemPanel.c:45: 	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	ldrh	r0, [r0]	@ tmp178,
	adds	r1, r1, #90	@ tmp177,
	strh	r0, [r1]	@ tmp178, gBattleTarget.battleAttack
@ src/MenuItemPanel.c:47: 	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	movs	r0, r2	@ tmp184, tmp171
@ src/MenuItemPanel.c:47: 	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	movs	r1, r3	@ tmp187, tmp170
@ src/MenuItemPanel.c:47: 	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	adds	r0, r0, #102	@ tmp184,
@ src/MenuItemPanel.c:47: 	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	ldrh	r0, [r0]	@ tmp188,
@ src/MenuItemPanel.c:46: 	gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
	ldr	r2, [r2, #96]	@ MEM <unsigned int> [(short int *)&gBattleActor + 96B], MEM <unsigned int> [(short int *)&gBattleActor + 96B]
@ src/MenuItemPanel.c:47: 	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	adds	r1, r1, #102	@ tmp187,
	strh	r0, [r1]	@ tmp188, gBattleTarget.battleCritRate
@ src/MenuItemPanel.c:46: 	gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
	str	r2, [r3, #96]	@ MEM <unsigned int> [(short int *)&gBattleActor + 96B], MEM <unsigned int> [(short int *)&gBattleTarget + 96B]
.L9:
@ src/MenuItemPanel.c:49: }
	@ sp needed	@
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L12:
	.align	2
.L11:
	.word	gProc_MenuItemPanel
	.word	ProcFind
	.word	ProcStart
	.word	GetUnitEquippedWeaponSlot
	.word	Text_InitDB
	.word	LoadIconPalette
	.word	BattleGenerateUiStats
	.word	gBattleActor
	.word	gBattleTarget
	.size	ForceMenuItemPanel, .-ForceMenuItemPanel
	.align	1
	.global	MenuItemPanel_Idle
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	MenuItemPanel_Idle, %function
MenuItemPanel_Idle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/MenuItemPanel.c:54: 	if( FALSE == proc->_unk64 )
	movs	r3, r0	@ tmp182, proc
@ src/MenuItemPanel.c:53: void MenuItemPanel_Idle(PanelProc* proc){
	push	{r4, r5, r6, lr}	@
@ src/MenuItemPanel.c:54: 	if( FALSE == proc->_unk64 )
	adds	r3, r3, #100	@ tmp182,
@ src/MenuItemPanel.c:54: 	if( FALSE == proc->_unk64 )
	ldrb	r3, [r3]	@ tmp183,
@ src/MenuItemPanel.c:53: void MenuItemPanel_Idle(PanelProc* proc){
	movs	r4, r0	@ proc, tmp432
@ src/MenuItemPanel.c:54: 	if( FALSE == proc->_unk64 )
	cmp	r3, #0	@ tmp183,
	bne	.LCB162	@
	b	.L13	@long jump	@
.LCB162:
@ src/MenuItemPanel.c:57: 	if( proc->ItemSlotIndex < 0 )
	movs	r3, r0	@ tmp186, proc
	adds	r3, r3, #51	@ tmp186,
@ src/MenuItemPanel.c:57: 	if( proc->ItemSlotIndex < 0 )
	ldrb	r3, [r3]	@ tmp189,
	cmp	r3, #127	@ tmp189,
	bls	.LCB167	@
	b	.L13	@long jump	@
.LCB167:
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	ldr	r6, .L24	@ tmp190,
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	ldr	r5, .L24+4	@ tmp194,
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	movs	r2, r6	@ tmp193, tmp190
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	movs	r3, r5	@ tmp197, tmp194
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	adds	r2, r2, #90	@ tmp193,
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	adds	r3, r3, #90	@ tmp197,
@ src/MenuItemPanel.c:61: 	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
	movs	r1, #0	@ tmp434,
	ldrsh	r2, [r2, r1]	@ tmp198, tmp193, tmp434
	movs	r1, #0	@ tmp435,
	ldrsh	r3, [r3, r1]	@ tmp199, tmp197, tmp435
	cmp	r2, r3	@ tmp198, tmp199
	ble	.L17		@,
@ src/MenuItemPanel.c:62: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 0 );
	movs	r3, r0	@ tmp202, proc
	adds	r3, r3, #49	@ tmp202,
@ src/MenuItemPanel.c:62: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 0 );
	ldrb	r1, [r3]	@ tmp204,
@ src/MenuItemPanel.c:62: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 0 );
	subs	r3, r3, #1	@ tmp212,
@ src/MenuItemPanel.c:62: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 0 );
	ldrb	r0, [r3]	@ tmp214,
	movs	r3, #204	@ tmp456,
	adds	r1, r1, #3	@ tmp205,
	lsls	r0, r0, #27	@ tmp217, tmp214,
	lsls	r3, r3, #22	@ tmp456, tmp456,
	lsls	r1, r1, #27	@ tmp209, tmp205,
	adds	r0, r0, r3	@ tmp219, tmp217, tmp456
	movs	r2, #0	@,
	lsrs	r1, r1, #24	@ tmp208, tmp209,
	lsrs	r0, r0, #24	@ tmp218, tmp219,
	bl	unk_Draw		@
.L17:
@ src/MenuItemPanel.c:64: 	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
	movs	r2, r6	@ tmp223, tmp190
@ src/MenuItemPanel.c:64: 	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
	movs	r3, r5	@ tmp227, tmp194
@ src/MenuItemPanel.c:64: 	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
	adds	r2, r2, #90	@ tmp223,
@ src/MenuItemPanel.c:64: 	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
	adds	r3, r3, #90	@ tmp227,
@ src/MenuItemPanel.c:64: 	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
	movs	r1, #0	@ tmp436,
	ldrsh	r2, [r2, r1]	@ tmp228, tmp223, tmp436
	movs	r1, #0	@ tmp437,
	ldrsh	r3, [r3, r1]	@ tmp229, tmp227, tmp437
	cmp	r2, r3	@ tmp228, tmp229
	bge	.L18		@,
@ src/MenuItemPanel.c:65: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 1 );
	movs	r3, r4	@ tmp232, proc
	adds	r3, r3, #49	@ tmp232,
@ src/MenuItemPanel.c:65: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 1 );
	ldrb	r1, [r3]	@ tmp234,
@ src/MenuItemPanel.c:65: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 1 );
	subs	r3, r3, #1	@ tmp242,
@ src/MenuItemPanel.c:65: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 1 );
	ldrb	r0, [r3]	@ tmp244,
	movs	r3, #204	@ tmp461,
	adds	r1, r1, #3	@ tmp235,
	lsls	r0, r0, #27	@ tmp247, tmp244,
	lsls	r3, r3, #22	@ tmp461, tmp461,
	lsls	r1, r1, #27	@ tmp239, tmp235,
	adds	r0, r0, r3	@ tmp249, tmp247, tmp461
	movs	r2, #1	@,
	lsrs	r1, r1, #24	@ tmp238, tmp239,
	lsrs	r0, r0, #24	@ tmp248, tmp249,
	bl	unk_Draw		@
.L18:
@ src/MenuItemPanel.c:68: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r2, r6	@ tmp253, tmp190
@ src/MenuItemPanel.c:68: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r3, r5	@ tmp257, tmp194
@ src/MenuItemPanel.c:68: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	adds	r2, r2, #96	@ tmp253,
@ src/MenuItemPanel.c:68: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	adds	r3, r3, #96	@ tmp257,
@ src/MenuItemPanel.c:68: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r1, #0	@ tmp438,
	ldrsh	r2, [r2, r1]	@ tmp258, tmp253, tmp438
	movs	r1, #0	@ tmp439,
	ldrsh	r3, [r3, r1]	@ tmp259, tmp257, tmp439
	cmp	r2, r3	@ tmp258, tmp259
	ble	.L19		@,
@ src/MenuItemPanel.c:69: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 0 );
	movs	r3, r4	@ tmp262, proc
	adds	r3, r3, #49	@ tmp262,
@ src/MenuItemPanel.c:69: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 0 );
	ldrb	r1, [r3]	@ tmp264,
@ src/MenuItemPanel.c:69: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 0 );
	subs	r3, r3, #1	@ tmp272,
@ src/MenuItemPanel.c:69: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 0 );
	ldrb	r0, [r3]	@ tmp274,
	movs	r3, #204	@ tmp466,
	adds	r1, r1, #5	@ tmp265,
	lsls	r0, r0, #27	@ tmp277, tmp274,
	lsls	r3, r3, #22	@ tmp466, tmp466,
	lsls	r1, r1, #27	@ tmp269, tmp265,
	adds	r0, r0, r3	@ tmp279, tmp277, tmp466
	movs	r2, #0	@,
	lsrs	r1, r1, #24	@ tmp268, tmp269,
	lsrs	r0, r0, #24	@ tmp278, tmp279,
	bl	unk_Draw		@
.L19:
@ src/MenuItemPanel.c:70: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r2, r6	@ tmp283, tmp190
@ src/MenuItemPanel.c:70: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r3, r5	@ tmp287, tmp194
@ src/MenuItemPanel.c:70: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	adds	r2, r2, #96	@ tmp283,
@ src/MenuItemPanel.c:70: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	adds	r3, r3, #96	@ tmp287,
@ src/MenuItemPanel.c:70: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r1, #0	@ tmp440,
	ldrsh	r2, [r2, r1]	@ tmp288, tmp283, tmp440
	movs	r1, #0	@ tmp441,
	ldrsh	r3, [r3, r1]	@ tmp289, tmp287, tmp441
	cmp	r2, r3	@ tmp288, tmp289
	bge	.L20		@,
@ src/MenuItemPanel.c:71: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 1 );
	movs	r3, r4	@ tmp292, proc
	adds	r3, r3, #49	@ tmp292,
@ src/MenuItemPanel.c:71: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 1 );
	ldrb	r1, [r3]	@ tmp294,
@ src/MenuItemPanel.c:71: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 1 );
	subs	r3, r3, #1	@ tmp302,
@ src/MenuItemPanel.c:71: 		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 1 );
	ldrb	r0, [r3]	@ tmp304,
	movs	r3, #204	@ tmp471,
	adds	r1, r1, #5	@ tmp295,
	lsls	r0, r0, #27	@ tmp307, tmp304,
	lsls	r3, r3, #22	@ tmp471, tmp471,
	lsls	r1, r1, #27	@ tmp299, tmp295,
	adds	r0, r0, r3	@ tmp309, tmp307, tmp471
	movs	r2, #1	@,
	lsrs	r1, r1, #24	@ tmp298, tmp299,
	lsrs	r0, r0, #24	@ tmp308, tmp309,
	bl	unk_Draw		@
.L20:
@ src/MenuItemPanel.c:74: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r2, r6	@ tmp313, tmp190
@ src/MenuItemPanel.c:74: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r3, r5	@ tmp317, tmp194
@ src/MenuItemPanel.c:74: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	adds	r2, r2, #96	@ tmp313,
@ src/MenuItemPanel.c:74: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	adds	r3, r3, #96	@ tmp317,
@ src/MenuItemPanel.c:74: 	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
	movs	r1, #0	@ tmp442,
	ldrsh	r2, [r2, r1]	@ tmp318, tmp313, tmp442
	movs	r1, #0	@ tmp443,
	ldrsh	r3, [r3, r1]	@ tmp319, tmp317, tmp443
	cmp	r2, r3	@ tmp318, tmp319
	ble	.L21		@,
@ src/MenuItemPanel.c:75: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	movs	r3, r4	@ tmp322, proc
	adds	r3, r3, #49	@ tmp322,
@ src/MenuItemPanel.c:75: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	ldrb	r1, [r3]	@ tmp324,
@ src/MenuItemPanel.c:75: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	subs	r3, r3, #1	@ tmp332,
@ src/MenuItemPanel.c:75: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	ldrb	r0, [r3]	@ tmp334,
	movs	r3, #198	@ tmp476,
	adds	r1, r1, #3	@ tmp325,
	lsls	r0, r0, #27	@ tmp337, tmp334,
	lsls	r3, r3, #23	@ tmp476, tmp476,
	lsls	r1, r1, #27	@ tmp329, tmp325,
	adds	r0, r0, r3	@ tmp339, tmp337, tmp476
	movs	r2, #0	@,
	lsrs	r1, r1, #24	@ tmp328, tmp329,
	lsrs	r0, r0, #24	@ tmp338, tmp339,
	bl	unk_Draw		@
.L21:
@ src/MenuItemPanel.c:76: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r2, r6	@ tmp343, tmp190
@ src/MenuItemPanel.c:76: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r3, r5	@ tmp347, tmp194
@ src/MenuItemPanel.c:76: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	adds	r2, r2, #96	@ tmp343,
@ src/MenuItemPanel.c:76: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	adds	r3, r3, #96	@ tmp347,
@ src/MenuItemPanel.c:76: 	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
	movs	r1, #0	@ tmp444,
	ldrsh	r2, [r2, r1]	@ tmp348, tmp343, tmp444
	movs	r1, #0	@ tmp445,
	ldrsh	r3, [r3, r1]	@ tmp349, tmp347, tmp445
	cmp	r2, r3	@ tmp348, tmp349
	bge	.L22		@,
@ src/MenuItemPanel.c:77: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	movs	r3, r4	@ tmp352, proc
	adds	r3, r3, #49	@ tmp352,
@ src/MenuItemPanel.c:77: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	ldrb	r1, [r3]	@ tmp354,
@ src/MenuItemPanel.c:77: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	subs	r3, r3, #1	@ tmp362,
@ src/MenuItemPanel.c:77: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	ldrb	r0, [r3]	@ tmp364,
	movs	r3, #198	@ tmp481,
	adds	r1, r1, #3	@ tmp355,
	lsls	r0, r0, #27	@ tmp367, tmp364,
	lsls	r3, r3, #23	@ tmp481, tmp481,
	lsls	r1, r1, #27	@ tmp359, tmp355,
	adds	r0, r0, r3	@ tmp369, tmp367, tmp481
	movs	r2, #1	@,
	lsrs	r1, r1, #24	@ tmp358, tmp359,
	lsrs	r0, r0, #24	@ tmp368, tmp369,
	bl	unk_Draw		@
.L22:
@ src/MenuItemPanel.c:80: 	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
	movs	r2, r6	@ tmp373, tmp190
@ src/MenuItemPanel.c:80: 	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
	movs	r3, r5	@ tmp377, tmp194
@ src/MenuItemPanel.c:80: 	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
	adds	r2, r2, #102	@ tmp373,
@ src/MenuItemPanel.c:80: 	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
	adds	r3, r3, #102	@ tmp377,
@ src/MenuItemPanel.c:80: 	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
	movs	r1, #0	@ tmp446,
	ldrsh	r2, [r2, r1]	@ tmp378, tmp373, tmp446
	movs	r1, #0	@ tmp447,
	ldrsh	r3, [r3, r1]	@ tmp379, tmp377, tmp447
	cmp	r2, r3	@ tmp378, tmp379
	ble	.L23		@,
@ src/MenuItemPanel.c:81: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	movs	r3, r4	@ tmp382, proc
	adds	r3, r3, #49	@ tmp382,
@ src/MenuItemPanel.c:81: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	ldrb	r1, [r3]	@ tmp384,
@ src/MenuItemPanel.c:81: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	subs	r3, r3, #1	@ tmp392,
@ src/MenuItemPanel.c:81: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	ldrb	r0, [r3]	@ tmp394,
	movs	r3, #198	@ tmp486,
	adds	r1, r1, #5	@ tmp385,
	lsls	r0, r0, #27	@ tmp397, tmp394,
	lsls	r3, r3, #23	@ tmp486, tmp486,
	lsls	r1, r1, #27	@ tmp389, tmp385,
	adds	r0, r0, r3	@ tmp399, tmp397, tmp486
	movs	r2, #0	@,
	lsrs	r1, r1, #24	@ tmp388, tmp389,
	lsrs	r0, r0, #24	@ tmp398, tmp399,
	bl	unk_Draw		@
.L23:
@ src/MenuItemPanel.c:82: 	if( gBattleActor.battleCritRate < gBattleTarget.battleCritRate )
	adds	r6, r6, #102	@ tmp403,
@ src/MenuItemPanel.c:82: 	if( gBattleActor.battleCritRate < gBattleTarget.battleCritRate )
	adds	r5, r5, #102	@ tmp407,
@ src/MenuItemPanel.c:82: 	if( gBattleActor.battleCritRate < gBattleTarget.battleCritRate )
	movs	r3, #0	@ tmp448,
	ldrsh	r2, [r6, r3]	@ tmp408, tmp403, tmp448
	movs	r1, #0	@ tmp449,
	ldrsh	r3, [r5, r1]	@ tmp409, tmp407, tmp449
	cmp	r2, r3	@ tmp408, tmp409
	bge	.L13		@,
@ src/MenuItemPanel.c:83: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 1 );
	movs	r3, r4	@ tmp412, proc
	adds	r3, r3, #49	@ tmp412,
@ src/MenuItemPanel.c:83: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 1 );
	ldrb	r1, [r3]	@ tmp414,
	movs	r3, #198	@ tmp488,
@ src/MenuItemPanel.c:83: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 1 );
	adds	r4, r4, #48	@ tmp422,
@ src/MenuItemPanel.c:83: 		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 1 );
	ldrb	r0, [r4]	@ tmp424,
	adds	r1, r1, #5	@ tmp415,
	lsls	r0, r0, #27	@ tmp427, tmp424,
	lsls	r3, r3, #23	@ tmp488, tmp488,
	lsls	r1, r1, #27	@ tmp419, tmp415,
	adds	r0, r0, r3	@ tmp429, tmp427, tmp488
	movs	r2, #1	@,
	lsrs	r1, r1, #24	@ tmp418, tmp419,
	lsrs	r0, r0, #24	@ tmp428, tmp429,
	bl	unk_Draw		@
.L13:
@ src/MenuItemPanel.c:86: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L25:
	.align	2
.L24:
	.word	gBattleActor
	.word	gBattleTarget
	.size	MenuItemPanel_Idle, .-MenuItemPanel_Idle
	.ident	"GCC: (devkitARM release 56) 11.1.0"
	.code 16
	.align	1
.L7:
	bx	r3
.L8:
	bx	r4
