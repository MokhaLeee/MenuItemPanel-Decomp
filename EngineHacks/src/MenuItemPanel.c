#include "gbafe.h"
#include "MenuItemPanel.h"



static void unk_Draw(u8 xPos, u8 yPos, u8 style);
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


// 0x801E684
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
	if( gBattleActor.battleHitRate > gBattleTarget.battleHitRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 0 );
	if( gBattleActor.battleHitRate < gBattleTarget.battleHitRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+3)*8, 1 );
	
	// Avo
	if( gBattleActor.battleCritRate > gBattleTarget.battleCritRate )
		unk_Draw( proc->xPos*8+0x63, (proc->yPos+5)*8, 0 );
	if( gBattleActor.battleCritRate < gBattleTarget.battleCritRate )
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
