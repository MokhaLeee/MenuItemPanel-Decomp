#include "gbafe.h"
#include "MenuItemPanel.h"


static void unk_Draw(u8 xPos, u8 yPos, u8 style);
static void UpdateMenuItemPanel_DrawWpn(PanelProc* panel, s8 index, u16 item);
static void UpdateMenuItemPanel_DrawItemStaff(PanelProc* panel, s8 index, u16 item);

extern void MenuItemPanel_Idle(PanelProc* proc);

/* 
const ProcInstruction gProc_MenuItemPanel[] = {
	PROC_15,
	PROC_REPEAT(MenuItemPanel_Idle),
	PROC_END
}; 
*/




// 0x801E684
void ForceMenuItemPanel(MenuProc* pmu, Unit* unit, u8 xPos, u8 yPos){
	PanelProc* panel;
	
	if( 0 != ProcFind( gProc_MenuItemPanel ) )
		return;
	
	panel = (PanelProc*)ProcStart(gProc_MenuItemPanel, (Proc*)pmu);
	
	panel->unit = unit;
	panel->xPos = xPos;
	panel->yPos = yPos;
	panel->IconPalIndex = 3;
	
	panel->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
	panel->_unk64 = TRUE;
	
	Text_InitDB( &panel->text[0], 0xC );
	Text_InitDB( &panel->text[1], 0xC );
	Text_InitDB( &panel->text[2], 0xC );
	
	LoadIconPalette( 1 , panel->IconPalIndex );
	
	BattleGenerateUiStats( panel->unit, BU_ISLOT_AUTO );
	
	gBattleTarget.battleAttack = gBattleActor.battleAttack;
	gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
	gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
	gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
}


// 0x801E4F4+1
void MenuItemPanel_Idle(PanelProc* proc){
	if( FALSE == proc->_unk64 )
		return;
	
	if( proc->ItemSlotIndex < 0 )
		return;
	
	// Atk
	if( gBattleActor.battleAttack > gBattleTarget.battleAttack )
		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 0 );
	
	if( gBattleActor.battleAttack < gBattleTarget.battleAttack )
		unk_Draw( proc->xPos*8+0x33, (proc->yPos+3)*8, 1 );
	
	// Hit
	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 0 );
	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
		unk_Draw( proc->xPos*8+0x33, (proc->yPos+5)*8, 1 );
	
	// Crit
	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	if( gBattleActor.battleCritRate < gBattleTarget.battleCritRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	
	// Avo
	if(gBattleActor.battleAvoidRate > gBattleTarget.battleAvoidRate)
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	if( gBattleActor.battleAvoidRate < gBattleTarget.battleAvoidRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 1 );
	
	return;
}


static void unk_Draw(u8 xPos, u8 yPos, u8 style){
	const struct ObjData** ppData;
	int mod = Mod(GetGameClock(),3);
	
	if( 0 == style )
		ppData = ObjData_859A530;
	else
		ppData = ObjData_859A53C;
	
	//(int node, u16 xBase, u16 yBase, const struct ObjData* pData, u16 tileBase);
	ObjInsertSafe(4, xPos, yPos, ppData[mod], 0);
}




void UpdateMenuItemPanel(s8 index){
	u16 item;
	
	PanelProc* panel = (PanelProc*)ProcFind( gProc_MenuItemPanel );
	//GetBgMapBuffer(0) + panel->xPos *2 + panel->yPos*0x40;
	
	Text_Clear(&panel->text[0]);
	Text_Clear(&panel->text[1]);
	Text_Clear(&panel->text[2]);
	
	// (int x, int y, int w, int h, int style)
	MakeUIWindowTileMap_BG0BG1(
		panel->xPos,
		panel->yPos,
		0xE, 0x8, 0 );
	

	if( (index < UNIT_ITEM_COUNT) && (index >= 0) )
		item = panel->unit->items[index];
	else if( UNIT_ITEM_COUNT == index )
		item = gGameState.ItemGotButNotYet;
	else
	{
		item = index;
		index = BU_ISLOT_BALLISTA;
	}
	
	// loc_801E7E4
	switch( GetItemType(item) )
	{
		case ITYPE_SWORD:
		case ITYPE_LANCE:
		case ITYPE_AXE:
		case ITYPE_BOW:
		case ITYPE_ANIMA:
		case ITYPE_LIGHT:
		case ITYPE_DARK:
		case ITYPE_BLLST:
			UpdateMenuItemPanel_DrawWpn(panel,index,item);	
			break;

		default:
			UpdateMenuItemPanel_DrawItemStaff(panel,index,item);
	}	// switch( GetItemType(item) )

	EnableBgSyncByMask(0b1);
	return;
}




static void UpdateMenuItemPanel_DrawWpn(PanelProc* panel, s8 index, u16 item){
	int color;
	
	BattleGenerateUiStats(panel->unit,index);
	
	if( BU_ISLOT_BALLISTA == index )
	{
		gBattleTarget.battleAttack = gBattleActor.battleAttack;
		gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
		gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
		gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
	}
	
	if( CanUnitUseWeapon(panel->unit, gBattleActor.weapon) )
		color = TEXT_COLOR_BLUE;
	else
		color = TEXT_COLOR_GRAY;
	
	// Text_InsertString(struct TextHandle*, int xPos, int color, const char*)
	// "Affin"
	Text_InsertString(
		&panel->text[0],
		0x1C,
		TEXT_COLOR_NORMAL,
		GetStringFromIndex(0x4F1) );
	
	// "Atk"
	Text_InsertString(
		&panel->text[1],
		0x2,
		TEXT_COLOR_NORMAL,
		GetStringFromIndex(0x4F3) );
	
	// "Hit"
	Text_InsertString(
		&panel->text[2],
		0x2,
		TEXT_COLOR_NORMAL,
		GetStringFromIndex(0x4F4) );
	
	// "Crit"
	Text_InsertString(
		&panel->text[1],
		0x32,
		TEXT_COLOR_NORMAL,
		GetStringFromIndex(0x501) );
	
	// "Avoid"
	Text_InsertString(
		&panel->text[2],
		0x32,
		TEXT_COLOR_NORMAL,
		GetStringFromIndex(0x4F5) );
		
	
	// Text_InsertNumberOr2Dashes(struct TextHandle*, int xPos, int color, u8); 
	// Bu.Atk
	Text_InsertNumberOr2Dashes(
		&panel->text[1],
		0x24,
		color,
		gBattleActor.battleAttack );
	
	// Bu.Hit
	Text_InsertNumberOr2Dashes(
		&panel->text[2],
		0x24,
		color,
		gBattleActor.battleHitRate );
	
	// Bu.Crit
	Text_InsertNumberOr2Dashes(
		&panel->text[1],
		0x54,
		color,
		gBattleActor.battleCritRate );
	
	// Bu.Avoid
	Text_InsertNumberOr2Dashes(
		&panel->text[2],
		0x54,
		color,
		gBattleActor.battleAvoidRate );
		
	// Text_Display(struct TextHandle*, u16* bgMap)
	Text_Display(
		&panel->text[0],
		TILEMAP_LOCATED(gBg0MapBuffer, panel->xPos+1, panel->yPos+1) );
	
	Text_Display(
		&panel->text[1],
		TILEMAP_LOCATED(gBg0MapBuffer, panel->xPos+1, panel->yPos+3) );
	
	Text_Display(
		&panel->text[2],
		TILEMAP_LOCATED(gBg0MapBuffer, panel->xPos+1, panel->yPos+5) );
	
	// (u16* bgOut, int iconId, int oam2Base)
	DrawIcon(
		TILEMAP_LOCATED(GetBgMapBuffer(0), panel->xPos+8, panel->yPos+1),
		GetItemType(item) + 0x70,
		panel->IconPalIndex << 0xC );
}


static void UpdateMenuItemPanel_DrawItemStaff(PanelProc* panel, s8 index, u16 item){
	const char* strCur = GetStringFromIndex( GetItemUseDescId(item) );
	
	for( int i=0; *strCur != 0 ; i++ )
	{
		// (struct TextHandle* gTextStruct, int xPos, int color, const char* gCurrentTextString)
		Text_InsertString(
			&panel->text[i],
			0,
			TEXT_COLOR_NORMAL,
			strCur );
		strCur = Text_GetStringNextLine(strCur) +1;
	}
	
	gBattleActor.battleAttack = gBattleTarget.battleAttack;
	gBattleActor.battleHitRate = gBattleTarget.battleHitRate;
	gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	gBattleActor.battleAvoidRate = gBattleTarget.battleAvoidRate;
	
	Text_Display(
		&panel->text[0],
		TILEMAP_LOCATED(GetBgMapBuffer(0), panel->xPos+1, panel->yPos+1) );
	
	Text_Display(
		&panel->text[1],
		TILEMAP_LOCATED(GetBgMapBuffer(0), panel->xPos+1, panel->yPos+3) );
		
	Text_Display(
		&panel->text[2],
		TILEMAP_LOCATED(GetBgMapBuffer(0), panel->xPos+1, panel->yPos+0xA) );
}


// 
void EndMenuItemPanel(void){
	EndEachProc(gProc_MenuItemPanel);
}
