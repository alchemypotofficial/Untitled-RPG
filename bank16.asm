;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank16
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Check_Step_Counter
	.globl _Load_Step_Counter
	.globl _Load_Combat_Main
	.globl _Combat
	.globl _Update_Combat_Joypad
	.globl _Move_Pointer_Right
	.globl _Move_Pointer_Left
	.globl _Confirm_Target_Selection
	.globl _Select_Target
	.globl _Flee_Battle
	.globl _Execute_Combat
	.globl _Refresh_Order
	.globl _Load_Enemy_Target
	.globl _Load_Enemy_Skill
	.globl _Draw_Selection_Skill
	.globl _Draw_Current_Skills
	.globl _Draw_Combat_Main
	.globl _Clear_Screen
	.globl _Draw_Selection_Fight
	.globl _Draw_Selection_Main
	.globl _Draw_Enemy_Names
	.globl _Load_Battle_Message_Box
	.globl _Load_Enemy_Pointer
	.globl _Clear_Enemy_Tiles
	.globl _Order_Turns
	.globl _Clear_Pointer
	.globl _Move_Small_Pointer
	.globl _Move_Pointer
	.globl _Load_Random_Troop
	.globl _Load_Actor_Info
	.globl _Load_Enemy_Dummy
	.globl _Copy_Dummy_Stats
	.globl _Draw_Combat_Actors
	.globl _Draw_Combat_Name
	.globl _Draw_Number_Zeros
	.globl _Draw_Combat_Number
	.globl _Get_Party_Slot_Filled
	.globl _Get_Enemy_Dummy_Combat
	.globl _Call_Play_Confirm
	.globl _Call_Play_Buzz
	.globl _Call_Set_Actor_Skills
	.globl _Call_Draw_End_Message
	.globl _Call_Get_Skill_Cost
	.globl _Call_Draw_Skill_Cost
	.globl _Call_Load_Tileset
	.globl _Call_Draw_Skill_Name
	.globl _Call_Load_Font_Menu
	.globl _Call_Move_Char
	.globl _Call_Clear_Map
	.globl _Call_Draw_Troop
	.globl _Call_Execute_Skill
	.globl _Call_Reload_Map
	.globl _Get_Skill
	.globl _Get_Troop
	.globl _Get_Enemy
	.globl _Get_Actor
	.globl _Get_Map
	.globl _set_bkg_map
	.globl _Gameplay
	.globl _flash_in
	.globl _flash_out
	.globl _fade_in
	.globl _fade_out
	.globl _toggle_control
	.globl _performant_delay
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Combat_Zeros
	.globl _Combat_Background
	.globl _Combat_Pointer
	.globl _Combat_Slash
	.globl _Combat_Period
	.globl _Combat_Mana
	.globl _Combat_Health
	.globl _Blank_Tile
	.globl _Tiles_Combat_Clear
	.globl _Tiles_Pointer
	.globl _Map_Combat_SkillsPLN1
	.globl _Map_Combat_SkillsPLN0
	.globl _Map_Combat_Message_BoxPLN1
	.globl _Map_Combat_Message_BoxPLN0
	.globl _Map_Combat_Actor_SmallPLN1
	.globl _Map_Combat_Actor_SmallPLN0
	.globl _Map_Combat_Actor_LargePLN1
	.globl _Map_Combat_Actor_LargePLN0
	.globl _Map_Combat_Selection_MainPLN1
	.globl _Map_Combat_Selection_MainPLN0
	.globl _Map_Combat_Selection_FightPLN1
	.globl _Map_Combat_Selection_FightPLN0
	.globl _Map_Combat_Actor_BoxPLN1
	.globl _Map_Combat_Actor_BoxPLN0
	.globl _Map_Combat_MainPLN1
	.globl _Map_Combat_MainPLN0
	.globl _troop_slime1
	.globl _troop_bee2
	.globl _troop_wolf1
	.globl _troop_bee1
	.globl _Close_Combat
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_16
;bank16.c:145: GameEnemyDummy* Get_Enemy_Dummy_Combat(UBYTE enemy_dummy_id)
;	---------------------------------
; Function Get_Enemy_Dummy_Combat
; ---------------------------------
_Get_Enemy_Dummy_Combat::
;bank16.c:147: switch(enemy_dummy_id)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00103$
	jr	00104$
;bank16.c:149: case 4:
00101$:
;bank16.c:150: return &enemy_dummy_1;
	ld	de, #_enemy_dummy_1
	ret
;bank16.c:152: case 5:
00102$:
;bank16.c:153: return &enemy_dummy_2;
	ld	de, #_enemy_dummy_2
	ret
;bank16.c:155: case 6:
00103$:
;bank16.c:156: return &enemy_dummy_3;
	ld	de, #_enemy_dummy_3
	ret
;bank16.c:158: default:
00104$:
;bank16.c:159: return &enemy_dummy_1;
	ld	de, #_enemy_dummy_1
;bank16.c:161: }
;bank16.c:162: }
	ret
_troop_bee1:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _Tiles_Troop_Bee1
	.dw _Map_Troop_Bee1PLN0
	.db #0x01	; 1
_troop_wolf1:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _Tiles_Troop_Wolf1
	.dw _Map_Troop_Wolf1PLN0
	.db #0x01	; 1
_troop_bee2:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.dw _Tiles_Troop_Bee1
	.dw _Map_Troop_Bee2PLN0
	.db #0x01	; 1
_troop_slime1:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _Tiles_Troop_Slime1
	.dw _Map_Troop_Slime1PLN0
	.db #0x01	; 1
_Map_Combat_MainPLN0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_MainPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Actor_BoxPLN0:
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Actor_BoxPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Selection_FightPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x42	; 66	'B'
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x2a	; 42
	.db #0x1a	; 26
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Selection_FightPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Selection_MainPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4c	; 76	'L'
	.db #0x2b	; 43
	.db #0x23	; 35
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Selection_MainPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Actor_LargePLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Actor_LargePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Actor_SmallPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Actor_SmallPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_Message_BoxPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_Message_BoxPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Combat_SkillsPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x47	; 71	'G'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Combat_SkillsPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Pointer:
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xea	; 234
	.db #0x9e	; 158
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xea	; 234
	.db #0x9e	; 158
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x57	; 87	'W'
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x57	; 87	'W'
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xea	; 234
	.db #0x9e	; 158
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0xea	; 234
	.db #0x9e	; 158
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x57	; 87	'W'
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x57	; 87	'W'
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Combat_Clear:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Blank_Tile:
	.db #0x00	; 0
_Combat_Health:
	.db #0x42	; 66	'B'
_Combat_Mana:
	.db #0x47	; 71	'G'
_Combat_Period:
	.db #0x55	; 85	'U'
_Combat_Slash:
	.db #0x0f	; 15
_Combat_Pointer:
	.db #0x0a	; 10
_Combat_Background:
	.db #0x01	; 1
_Combat_Zeros:
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
;bank16.c:164: UBYTE Get_Party_Slot_Filled(UBYTE party_slot)
;	---------------------------------
; Function Get_Party_Slot_Filled
; ---------------------------------
_Get_Party_Slot_Filled::
;bank16.c:166: if(Get_Actor(party[party_slot]) != &actor_null)
;c
	ld	de, #_party
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00111$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00102$
00111$:
;bank16.c:168: return true;
	ld	e, #0x01
	ret
00102$:
;bank16.c:172: return false;
	ld	e, #0x00
;bank16.c:174: }
	ret
;bank16.c:176: void Draw_Combat_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Combat_Number
; ---------------------------------
_Draw_Combat_Number::
;bank16.c:178: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank16.c:180: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank16.c:182: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank16.c:184: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank16.c:186: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:184: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank16.c:189: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank16.c:191: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank16.c:192: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank16.c:195: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank16.c:196: parsed_number = 0;
	ld	(hl), #0x00
;bank16.c:198: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank16.c:200: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank16.c:201: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank16.c:204: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank16.c:205: parsed_number = 0;
	ld	(hl), #0x00
;bank16.c:207: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank16.c:209: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank16.c:210: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank16.c:213: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank16.c:215: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank16.c:217: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank16.c:218: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank16.c:219: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank16.c:220: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank16.c:224: set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank16.c:222: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank16.c:224: set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ld	de, #(_parsed_decimal + 0x0003)
	inc	b
	inc	b
	inc	b
	push	de
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00118$:
;bank16.c:226: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank16.c:228: set_bkg_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
	ld	de, #(_parsed_decimal + 0x0002)
	inc	b
	inc	b
	push	de
	ld	de, #0x0102
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00115$:
;bank16.c:230: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank16.c:232: set_bkg_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
	ld	de, #(_parsed_decimal + 0x0001)
	inc	b
	push	de
	ld	de, #0x0103
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00112$:
;bank16.c:236: set_bkg_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
	ld	hl, #_parsed_decimal
	push	hl
	ld	de, #0x0104
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:239: }
	ret
;bank16.c:241: void Draw_Number_Zeros(UBYTE tile_x, UBYTE tile_y, UINT16 number)
;	---------------------------------
; Function Draw_Number_Zeros
; ---------------------------------
_Draw_Number_Zeros::
	dec	sp
;bank16.c:245: set_bkg_tiles(tile_x + 3, tile_y, 2, 1, Combat_Zeros);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;bank16.c:243: if(number < 100)
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00104$
;bank16.c:245: set_bkg_tiles(tile_x + 3, tile_y, 2, 1, Combat_Zeros);
	ld	bc, #_Combat_Zeros+0
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	inc	a
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x02
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00106$
00104$:
;bank16.c:247: else if(number < 1000)
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00106$
;bank16.c:249: set_bkg_tiles(tile_x + 2, tile_y, 3, 1, Combat_Zeros);
	ld	bc, #_Combat_Zeros+0
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x03
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00106$:
;bank16.c:251: }
	inc	sp
	ret
;bank16.c:253: void Draw_Combat_Name(UBYTE tile_x, UBYTE tile_y, unsigned char* name, UBYTE full_name)
;	---------------------------------
; Function Draw_Combat_Name
; ---------------------------------
_Draw_Combat_Name::
;bank16.c:255: if(name[4] != 0x01 && full_name == false)
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	ld	a, #0x01
	jr	Z, 00126$
	xor	a, a
00126$:
	ld	c, a
	bit	0, c
	jr	NZ, 00105$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;bank16.c:257: set_bkg_tiles(tile_x, tile_y, 3, 1, name);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0103
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:258: set_bkg_tiles(tile_x + 3, tile_y, 1, 1, Combat_Period);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x03
	ld	hl, #_Combat_Period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00105$:
;bank16.c:260: else if(name[4] == 0x01)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;bank16.c:262: set_bkg_tiles(tile_x, tile_y, 4, 1, name);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0104
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00102$:
;bank16.c:266: set_bkg_tiles(tile_x, tile_y, 7, 1, name);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:268: }
	ret
;bank16.c:270: void Draw_Combat_Actors()
;	---------------------------------
; Function Draw_Combat_Actors
; ---------------------------------
_Draw_Combat_Actors::
;bank16.c:272: if(party[0] != 0)
	ld	a, (#_party + 0)
	or	a, a
	jp	Z, 00105$
;bank16.c:274: Draw_Combat_Name(9, 13, Get_Actor(party[0])->name, false);
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0d09
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:276: if(Get_Actor(party[0])->max_health < 100)
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00102$
;bank16.c:278: set_bkg_tiles(15, 13, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:279: set_bkg_tiles(16, 13, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d10
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:281: Draw_Number_Zeros(14, 13, Get_Actor(party[0])->max_health);
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0d0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:282: Draw_Combat_Number(Get_Actor(party[0])->health, 15, 13);
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0d0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
	jr	00105$
00102$:
;bank16.c:286: set_bkg_tiles(14, 13, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0e
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:287: set_bkg_tiles(15, 13, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:289: Draw_Number_Zeros(14, 13, Get_Actor(party[0])->max_health);
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0d0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:290: Draw_Combat_Number(Get_Actor(party[0])->health, 15, 13);
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0d0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
00105$:
;bank16.c:295: if(party[1] != 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jp	Z, 00110$
;bank16.c:297: Draw_Combat_Name(9, 14, Get_Actor(party[1])->name, false);
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0e09
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:299: if(Get_Actor(party[1])->max_health < 100)
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00107$
;bank16.c:301: set_bkg_tiles(15, 14, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:302: set_bkg_tiles(16, 14, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e10
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:304: Draw_Number_Zeros(14, 14, Get_Actor(party[1])->max_health);
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0e0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:305: Draw_Combat_Number(Get_Actor(party[1])->health, 15, 14);
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0e0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
	jr	00110$
00107$:
;bank16.c:309: set_bkg_tiles(14, 14, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0e
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:310: set_bkg_tiles(15, 14, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:312: Draw_Number_Zeros(14, 14, Get_Actor(party[1])->max_health);
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0e0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:313: Draw_Combat_Number(Get_Actor(party[1])->health, 15, 14);
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0e0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
00110$:
;bank16.c:317: if(party[2] != 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jp	Z, 00115$
;bank16.c:319: Draw_Combat_Name(9, 15, Get_Actor(party[2])->name, false);
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0f09
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:321: if(Get_Actor(party[2])->max_health < 100)
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00112$
;bank16.c:323: set_bkg_tiles(15, 15, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:324: set_bkg_tiles(16, 15, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f10
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:326: Draw_Number_Zeros(14, 15, Get_Actor(party[2])->max_health);
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0f0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:327: Draw_Combat_Number(Get_Actor(party[2])->health, 15, 15);
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0f0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
	jr	00115$
00112$:
;bank16.c:331: set_bkg_tiles(14, 15, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0e
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:332: set_bkg_tiles(15, 15, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:334: Draw_Number_Zeros(14, 15, Get_Actor(party[2])->max_health);
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0f0e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:335: Draw_Combat_Number(Get_Actor(party[2])->health, 15, 15);
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0f0f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
00115$:
;bank16.c:339: if(party[3] != 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	ret	Z
;bank16.c:341: Draw_Combat_Name(9, 16, Get_Actor(party[3])->name, false);
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x1009
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:343: if(Get_Actor(party[3])->max_health < 100)
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00117$
;bank16.c:345: set_bkg_tiles(15, 16, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:346: set_bkg_tiles(16, 16, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x1010
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:348: Draw_Number_Zeros(14, 16, Get_Actor(party[3])->max_health);
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x100e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:349: Draw_Combat_Number(Get_Actor(party[3])->health, 15, 16);
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x100f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
	ret
00117$:
;bank16.c:353: set_bkg_tiles(14, 16, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100e
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:354: set_bkg_tiles(15, 16, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:356: Draw_Number_Zeros(14, 16, Get_Actor(party[3])->max_health);
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x100e
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:357: Draw_Combat_Number(Get_Actor(party[3])->health, 15, 16);
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x100f
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
;bank16.c:360: }
	ret
;bank16.c:362: void Copy_Dummy_Stats(GameEnemy* enemy, GameEnemyDummy* dummy) //* Copies specified enemy stats into specified dummy.
;	---------------------------------
; Function Copy_Dummy_Stats
; ---------------------------------
_Copy_Dummy_Stats::
	add	sp, #-8
;bank16.c:364: dummy->health = enemy->max_health;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0013
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:365: dummy->max_health = enemy->max_health;
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:366: dummy->mana = enemy->max_mana;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #0x0015
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:367: dummy->max_mana = enemy->max_mana;
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:368: dummy->strength = enemy->strength;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #0x0017
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:369: dummy->agility = enemy->agility;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #0x001d
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:370: dummy->gold = enemy->gold;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0010
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:371: dummy->experience = enemy->experience;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0011
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:372: dummy->ability_point = enemy->ability_point;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:373: dummy->skill[0] = enemy->skill[0];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:374: dummy->skill[1] = enemy->skill[1];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:375: dummy->skill[2] = enemy->skill[2];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank16.c:376: }
	add	sp, #8
	ret
;bank16.c:378: void Load_Enemy_Dummy() //* Loads all three enemy dummies based "enemy[]".
;	---------------------------------
; Function Load_Enemy_Dummy
; ---------------------------------
_Load_Enemy_Dummy::
;bank16.c:380: for(i = 0; i < 3; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00108$:
;bank16.c:382: enemy[i] = Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->enemy_slot[i];
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_enemy
	add	hl, bc
	push	hl
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_CurrentTroop
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Troop
	inc	sp
	pop	bc
	inc	de
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;bank16.c:380: for(i = 0; i < 3; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00108$
;bank16.c:385: if(enemy[0] != 0)
	ld	hl, #_enemy
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	Z, 00103$
;bank16.c:387: Copy_Dummy_Stats(Get_Enemy(enemy[0]), &enemy_dummy_1);
	push	bc
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #_enemy_dummy_1
	push	hl
	push	de
	call	_Copy_Dummy_Stats
	add	sp, #4
;bank16.c:388: enemy_dummy_1.can_attack = true;
	ld	hl, #(_enemy_dummy_1 + 0x001a)
	ld	(hl), #0x01
00103$:
;bank16.c:391: if(enemy[1] != 0)
	ld	hl, #(_enemy + 0x0001)
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	Z, 00105$
;bank16.c:393: Copy_Dummy_Stats(Get_Enemy(enemy[1]), &enemy_dummy_2);
	push	bc
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #_enemy_dummy_2
	push	hl
	push	de
	call	_Copy_Dummy_Stats
	add	sp, #4
;bank16.c:394: enemy_dummy_2.can_attack = true;
	ld	hl, #(_enemy_dummy_2 + 0x001a)
	ld	(hl), #0x01
00105$:
;bank16.c:397: if(enemy[2] != 0)
	ld	hl, #(_enemy + 0x0002)
	ld	b, (hl)
	ld	a, b
	or	a, a
	ret	Z
;bank16.c:399: Copy_Dummy_Stats(Get_Enemy(enemy[2]), &enemy_dummy_3);
	push	bc
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #_enemy_dummy_3
	push	hl
	push	de
	call	_Copy_Dummy_Stats
	add	sp, #4
;bank16.c:400: enemy_dummy_3.can_attack = true;
	ld	hl, #(_enemy_dummy_3 + 0x001a)
	ld	(hl), #0x01
;bank16.c:402: }
	ret
;bank16.c:404: void Load_Actor_Info()
;	---------------------------------
; Function Load_Actor_Info
; ---------------------------------
_Load_Actor_Info::
;bank16.c:406: if(Get_Actor(party[CurrentTurn])->max_health < 100)
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jp	NC, 00106$
;bank16.c:408: set_bkg_tiles(0, 0, 11, 4, Map_Combat_Actor_SmallPLN0);
	ld	hl, #_Map_Combat_Actor_SmallPLN0
	push	hl
	ld	de, #0x040b
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:410: Draw_Combat_Name(1, 1, Get_Actor(party[CurrentTurn])->name, false);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0101
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:412: Draw_Number_Zeros(5, 1, Get_Actor(party[CurrentTurn])->max_health);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0105
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:414: set_bkg_tiles(7, 1, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0107
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:415: set_bkg_tiles(6, 1, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0106
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:417: Draw_Combat_Number(Get_Actor(party[CurrentTurn])->health, 6, 1);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0106
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
;bank16.c:419: if(Get_Actor(party[CurrentTurn])->max_mana < 10)
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000d
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	ret	NC
;bank16.c:421: set_bkg_tiles(8, 2, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0208
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:422: set_bkg_tiles(7, 2, 1, 1, Combat_Mana);
	ld	hl, #_Combat_Mana
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0207
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:424: Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 6, 2);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0206
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
	ret
00106$:
;bank16.c:429: set_bkg_tiles(0, 0, 12, 4, Map_Combat_Actor_LargePLN0);
	ld	hl, #_Map_Combat_Actor_LargePLN0
	push	hl
	ld	de, #0x040c
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:431: Draw_Combat_Name(1, 1, Get_Actor(party[CurrentTurn])->name, false);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0101
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:433: Draw_Number_Zeros(6, 1, Get_Actor(party[CurrentTurn])->max_health);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0106
	push	de
	call	_Draw_Number_Zeros
	add	sp, #4
;bank16.c:435: Draw_Combat_Number(Get_Actor(party[CurrentTurn])->health, 7, 1);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0107
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
;bank16.c:437: set_bkg_tiles(7, 1, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0107
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:438: set_bkg_tiles(6, 1, 1, 1, Combat_Health);
	ld	hl, #_Combat_Health
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0106
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:440: if(Get_Actor(party[CurrentTurn])->max_mana < 10)
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000d
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	ret	NC
;bank16.c:442: set_bkg_tiles(9, 2, 1, 1, Combat_Period);
	ld	hl, #_Combat_Period
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:443: set_bkg_tiles(8, 2, 1, 1, Combat_Mana);
	ld	hl, #_Combat_Mana
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0208
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:445: Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 7, 2);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0207
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
;bank16.c:448: }
	ret
;bank16.c:450: void Load_Random_Troop() //* Loads a random troop id, based on map troops, into "CurrentTroop".
;	---------------------------------
; Function Load_Random_Troop
; ---------------------------------
_Load_Random_Troop::
;bank16.c:452: initrand(Seed);
	ld	hl, #_Seed
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;bank16.c:454: CurrentTroop = rand() % 5;
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0005
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, #_CurrentTroop
	ld	(hl), e
;bank16.c:455: }
	ret
;bank16.c:457: void Move_Pointer(UBYTE pos_x, UBYTE pos_y, UBYTE offset_x, UBYTE offset_y) //* Moves pointer and expands to fit offset.
;	---------------------------------
; Function Move_Pointer
; ---------------------------------
_Move_Pointer::
	add	sp, #-10
;bank16.c:459: pos_x = pos_x * 8;
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:460: pos_y = pos_y * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:462: offset_x = offset_x * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:463: offset_y = offset_y * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
;bank16.c:465: move_sprite(36, pos_x - (offset_x / 2) + 8, pos_y - (offset_y / 2) + 8);
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00155$
	bit	7, d
	jr	NZ, 00156$
	cp	a, a
	jr	00156$
00155$:
	bit	7, d
	jr	Z, 00156$
	scf
00156$:
	ld	a, #0x00
	rla
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
00107$:
	sra	b
	rr	c
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl)
	sub	a, c
	add	a, #0x08
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#14
	ld	c, (hl)
	ld	b, #0x00
	inc	sp
	inc	sp
	push	bc
	ld	a, b
	rlca
	and	a,#0x01
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	push	hl
00108$:
	pop	de
	push	de
	sra	d
	rr	e
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	sub	a, e
	add	a, #0x08
	inc	hl
	inc	hl
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+144
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:466: move_sprite(37, pos_x - (offset_x / 2) + 8, pos_y + 8 + (offset_y / 2) - 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
00109$:
	sra	d
	rr	e
	ld	a, e
	ldhl	sp,	#5
	add	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ld	e, c
	ld	d, b
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ld	e, c
	ld	d, b
	inc	de
00110$:
	sra	d
	rr	e
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, e
	add	a, #0x08
	inc	hl
	inc	hl
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+148
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:467: move_sprite(38, pos_x + 8 + (offset_x / 2) - 8, pos_y - (offset_y / 2) + 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
00111$:
	sra	d
	rr	e
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, e
	add	a, #0x08
	ldhl	sp,	#8
	ld	(hl), a
	ld	e, c
	ld	d, b
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
	ld	e, c
	ld	d, b
	inc	de
00112$:
	sra	d
	rr	e
	ld	a, e
	ldhl	sp,	#7
	add	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+152
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank16.c:468: move_sprite(39, pos_x + 8 + (offset_x / 2) - 8, pos_y + 8 + (offset_y / 2) - 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
00113$:
	sra	d
	rr	e
	ld	a, e
	ldhl	sp,	#5
	add	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ld	e, c
	ld	d, b
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	ld	e, c
	ld	d, b
	inc	de
00114$:
	sra	d
	rr	e
	ld	a, e
	ldhl	sp,	#7
	add	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+156
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;bank16.c:468: move_sprite(39, pos_x + 8 + (offset_x / 2) - 8, pos_y + 8 + (offset_y / 2) - 8);
;bank16.c:469: }
	add	sp, #10
	ret
;bank16.c:471: void Move_Small_Pointer(UBYTE pos_x, UBYTE pos_y, UBYTE offset_x) //* Moves small pointer and expands to fit offset.
;	---------------------------------
; Function Move_Small_Pointer
; ---------------------------------
_Move_Small_Pointer::
;bank16.c:473: pos_x = pos_x * 8;
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:474: pos_y = pos_y * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:476: offset_x = offset_x * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank16.c:478: move_sprite(34, pos_x, pos_y);
	ld	(hl-), a
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0088)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;bank16.c:479: move_sprite(35, pos_x + offset_x + 8, pos_y);
	ld	a, c
	ldhl	sp,	#4
	add	a, (hl)
	add	a, #0x08
	ld	c, a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x008c)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;bank16.c:479: move_sprite(35, pos_x + offset_x + 8, pos_y);
;bank16.c:480: }
	ret
;bank16.c:482: void Clear_Pointer() //* Clears pointer's sprites and moves them offscreen.
;	---------------------------------
; Function Clear_Pointer
; ---------------------------------
_Clear_Pointer::
;bank16.c:484: set_sprite_data(122, 6, Tiles_Combat_Clear);
	ld	hl, #_Tiles_Combat_Clear
	push	hl
	ld	de, #0x067a
	push	de
	call	_set_sprite_data
	add	sp, #4
;bank16.c:486: Move_Pointer(25, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	a, #0x19
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
;bank16.c:487: Move_Small_Pointer(25, 25, 0);
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	a, #0x19
	push	af
	inc	sp
	call	_Move_Small_Pointer
	add	sp, #3
;bank16.c:488: }
	ret
;bank16.c:490: void Order_Turns() //* Orders battle turns by agility from greatest to least.
;	---------------------------------
; Function Order_Turns
; ---------------------------------
_Order_Turns::
	add	sp, #-4
;bank16.c:492: for(j = 0; j < 4; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00126$:
;bank16.c:494: if(Get_Actor(party[j]) != &actor_null && Get_Actor(party[j])->health != 0 && Get_Actor(party[j])->can_attack == true)
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, #<(_actor_null)
	sub	a, c
	jr	NZ, 00224$
	ld	a, #>(_actor_null)
	sub	a, b
	jr	Z, 00102$
00224$:
	ld	hl, #_party
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, b
	or	a, c
	jr	Z, 00102$
	ld	hl, #_party
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0023
	add	hl, de
	ld	c, (hl)
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	dec	c
	jr	NZ, 00102$
;bank16.c:496: turn_order[j] = j + 1;
	ld	hl, #_turn_order
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_j
	ld	a, (hl)
	inc	a
	ld	(bc), a
;bank16.c:497: agility[j] = Get_Actor(party[j])->agility;
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_agility
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_party
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0015
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	jr	00127$
00102$:
;bank16.c:501: turn_order[j] = 0;
	ld	hl, #_turn_order
	add	hl, de
	ld	(hl), #0x00
;bank16.c:502: target_selection[j] = 0;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_target_selection
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:503: skill_selection[j] = 0;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_skill_selection
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:504: agility[j] = 0;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_agility
	add	hl, bc
	ld	(hl), #0x00
00127$:
;bank16.c:492: for(j = 0; j < 4; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jp	C, 00126$
;bank16.c:508: if(Get_Enemy(enemy[0]) != &enemy_null && enemy_dummy_1.health != 0 && enemy_dummy_1.can_attack == true)
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
;bank16.c:510: turn_order[4] = 5;
;bank16.c:511: agility[4] = enemy_dummy_1.agility;
	ld	bc, #_agility + 4
;bank16.c:508: if(Get_Enemy(enemy[0]) != &enemy_null && enemy_dummy_1.health != 0 && enemy_dummy_1.can_attack == true)
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00227$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00108$
00227$:
	ld	hl, #_enemy_dummy_1 + 7
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00108$
	ld	a, (#(_enemy_dummy_1 + 0x001a) + 0)
	dec	a
	jr	NZ, 00108$
;bank16.c:510: turn_order[4] = 5;
	ld	hl, #(_turn_order + 0x0004)
	ld	(hl), #0x05
;bank16.c:511: agility[4] = enemy_dummy_1.agility;
	ld	a, (#(_enemy_dummy_1 + 0x0015) + 0)
	ld	(bc), a
	jr	00109$
00108$:
;bank16.c:515: turn_order[4] = 0;
	ld	hl, #(_turn_order + 0x0004)
	ld	(hl), #0x00
;bank16.c:516: target_selection[4] = 0;
	ld	hl, #(_target_selection + 0x0004)
	ld	(hl), #0x00
;bank16.c:517: skill_selection[4] = 0;
	ld	hl, #(_skill_selection + 0x0004)
	ld	(hl), #0x00
;bank16.c:518: agility[4] = 0;
	xor	a, a
	ld	(bc), a
00109$:
;bank16.c:521: if(Get_Enemy(enemy[1]) != &enemy_null && enemy_dummy_2.health != 0 && enemy_dummy_2.can_attack == true)
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
;bank16.c:523: turn_order[5] = 6;
;bank16.c:524: agility[5] = enemy_dummy_2.agility;
	ld	bc, #_agility + 5
;bank16.c:521: if(Get_Enemy(enemy[1]) != &enemy_null && enemy_dummy_2.health != 0 && enemy_dummy_2.can_attack == true)
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00230$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00113$
00230$:
	ld	hl, #_enemy_dummy_2 + 7
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00113$
	ld	a, (#(_enemy_dummy_2 + 0x001a) + 0)
	dec	a
	jr	NZ, 00113$
;bank16.c:523: turn_order[5] = 6;
	ld	hl, #(_turn_order + 0x0005)
	ld	(hl), #0x06
;bank16.c:524: agility[5] = enemy_dummy_2.agility;
	ld	a, (#(_enemy_dummy_2 + 0x0015) + 0)
	ld	(bc), a
	jr	00114$
00113$:
;bank16.c:528: turn_order[5] = 0;
	ld	hl, #(_turn_order + 0x0005)
	ld	(hl), #0x00
;bank16.c:529: target_selection[5] = 0;
	ld	hl, #(_target_selection + 0x0005)
	ld	(hl), #0x00
;bank16.c:530: skill_selection[5] = 0;
	ld	hl, #(_skill_selection + 0x0005)
	ld	(hl), #0x00
;bank16.c:531: agility[5] = 0;
	xor	a, a
	ld	(bc), a
00114$:
;bank16.c:534: if(Get_Enemy(enemy[2]) != &enemy_null && enemy_dummy_3.health != 0 && enemy_dummy_3.can_attack == true)
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
;bank16.c:536: turn_order[6] = 7;
;bank16.c:537: agility[6] = enemy_dummy_3.agility;
;bank16.c:534: if(Get_Enemy(enemy[2]) != &enemy_null && enemy_dummy_3.health != 0 && enemy_dummy_3.can_attack == true)
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00233$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00118$
00233$:
	ld	hl, #(_enemy_dummy_3 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	Z, 00118$
	ld	a, (#(_enemy_dummy_3 + 0x001a) + 0)
	dec	a
	jr	NZ, 00118$
;bank16.c:536: turn_order[6] = 7;
	ld	hl, #(_turn_order + 0x0006)
	ld	(hl), #0x07
;bank16.c:537: agility[6] = enemy_dummy_3.agility;
	ld	a, (#(_enemy_dummy_3 + 0x0015) + 0)
	ld	(#(_agility + 0x0006)),a
	jr	00119$
00118$:
;bank16.c:541: turn_order[6] = 0;
	ld	hl, #(_turn_order + 0x0006)
	ld	(hl), #0x00
;bank16.c:542: target_selection[6] = 0;
	ld	hl, #(_target_selection + 0x0006)
	ld	(hl), #0x00
;bank16.c:543: skill_selection[6] = 0;
	ld	hl, #(_skill_selection + 0x0006)
	ld	(hl), #0x00
;bank16.c:544: agility[6] = 0;
	ld	hl, #(_agility + 0x0006)
	ld	(hl), #0x00
00119$:
;bank16.c:547: for(k = 0; k < 7; k++)
	ld	hl, #_k
	ld	(hl), #0x00
00130$:
;bank16.c:549: for(j = 0; j < 7; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00128$:
;bank16.c:551: if(agility[j] < agility[k])
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_agility
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	b, a
	ld	a, (#_k)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	ld	hl, #_agility
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, b
	sub	a, c
	jr	NC, 00129$
;bank16.c:553: agility_temp = agility[k];
	ld	hl, #_agility_temp
	ld	(hl), c
;bank16.c:554: agility[k] = agility[j];
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;bank16.c:555: agility[j] = agility_temp;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_agility
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_agility_temp)
	ld	(bc), a
;bank16.c:557: turn_order_temp = turn_order[k];
	ld	a, (#_k)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_turn_order_temp),a
;bank16.c:558: turn_order[k] = turn_order[j];
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_turn_order
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;bank16.c:559: turn_order[j] = turn_order_temp;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_turn_order_temp)
	ld	(bc), a
00129$:
;bank16.c:549: for(j = 0; j < 7; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	C, 00128$
;bank16.c:547: for(k = 0; k < 7; k++)
	ld	hl, #_k
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	C, 00130$
;bank16.c:563: }
	add	sp, #4
	ret
;bank16.c:565: void Clear_Enemy_Tiles(GameEnemy* enemy, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Clear_Enemy_Tiles
; ---------------------------------
_Clear_Enemy_Tiles::
	add	sp, #-7
;bank16.c:567: x = enemy->size[0];
	ldhl	sp,#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(#_x),a
;bank16.c:568: y = enemy->size[1];
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(#_y),a
;bank16.c:570: for(m = 0; m < y; m++)
	ld	hl, #_m
	ld	(hl), #0x00
00107$:
	ld	hl, #_y
	ld	e, (hl)
	ld	a, (#_m)
	ld	d,a
	ld	hl, #_y
	sub	a, (hl)
	bit	7, e
	jr	Z, 00143$
	bit	7, d
	jr	NZ, 00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z, 00144$
	scf
00144$:
	jp	NC, 00109$
;bank16.c:572: for(n = 0; n < x; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00104$:
	ld	hl, #_x
	ld	e, (hl)
	ld	a, (#_n)
	ld	d,a
	ld	hl, #_x
	sub	a, (hl)
	bit	7, e
	jr	Z, 00145$
	bit	7, d
	jr	NZ, 00146$
	cp	a, a
	jr	00146$
00145$:
	bit	7, d
	jr	Z, 00146$
	scf
00146$:
	jr	NC, 00108$
;bank16.c:574: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank16.c:576: set_bkg_tiles(tile_x - (enemy->size[0] / 2) + n, tile_y - (enemy->size[1] / 2) - 1 + m, 1, 1, Map_Combat_MainPLN0);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	inc	sp
	inc	sp
	push	bc
	bit	7, b
	jr	Z, 00111$
	inc	bc
	inc	sp
	inc	sp
	push	bc
00111$:
	pop	bc
	push	bc
	sra	b
	rr	c
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	dec	a
	ld	hl, #_m
	add	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00112$
	inc	hl
	ld	c, l
	ld	b, h
00112$:
	sra	b
	rr	c
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	ld	hl, #_n
	add	a, (hl)
	ld	hl, #_Map_Combat_MainPLN0
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#10
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:572: for(n = 0; n < x; n++)
	ld	hl, #_n
	inc	(hl)
	jp	00104$
00108$:
;bank16.c:570: for(m = 0; m < y; m++)
	ld	hl, #_m
	inc	(hl)
	jp	00107$
00109$:
;bank16.c:579: }
	add	sp, #7
	ret
;bank16.c:581: void Load_Enemy_Pointer()
;	---------------------------------
; Function Load_Enemy_Pointer
; ---------------------------------
_Load_Enemy_Pointer::
;bank16.c:583: selected_enemy = enemy_selection[CurrentTurn] - 4;
	ld	bc, #_enemy_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00132$
	inc	b
00132$:
	ld	a, (bc)
	add	a, #0xfc
	ld	hl, #_selected_enemy
	ld	(hl), a
;bank16.c:585: if(enemy_selection[CurrentTurn] == 4)
	ld	a, (bc)
	ld	c, a
	sub	a, #0x04
	jr	NZ, 00107$
;bank16.c:587: Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
	jp	00108$
00107$:
;bank16.c:589: else if(enemy_selection[CurrentTurn] == 5)
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00104$
;bank16.c:591: Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	c, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	b, (hl)
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	de, #0x0904
	push	de
	call	_Move_Pointer
	add	sp, #4
	jr	00108$
00104$:
;bank16.c:593: else if(enemy_selection[CurrentTurn] == 6)
	ld	a, c
	sub	a, #0x06
	jr	NZ, 00108$
;bank16.c:595: Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
00108$:
;bank16.c:598: set_sprite_data(122, 6, Tiles_Pointer);
	ld	hl, #_Tiles_Pointer
	push	hl
	ld	a, #0x06
	ld	d,a
	ld	e,#0x7a
	push	de
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x008a)
	ld	(hl), #0x7a
	ld	hl, #(_shadow_OAM + 0x008e)
	ld	(hl), #0x7b
	ld	hl, #(_shadow_OAM + 0x0092)
	ld	(hl), #0x7c
	ld	hl, #(_shadow_OAM + 0x0096)
	ld	(hl), #0x7d
	ld	hl, #(_shadow_OAM + 0x009a)
	ld	(hl), #0x7e
	ld	hl, #(_shadow_OAM + 0x009e)
	ld	(hl), #0x7f
;bank16.c:604: set_sprite_tile(39, 127);
;bank16.c:605: }
	ret
;bank16.c:607: void Load_Battle_Message_Box()
;	---------------------------------
; Function Load_Battle_Message_Box
; ---------------------------------
_Load_Battle_Message_Box::
;bank16.c:609: wait_vbl_done();
	call	_wait_vbl_done
;bank16.c:610: set_bkg_map(0, 12, 20, 6, Map_Combat_Message_BoxPLN1, Map_Combat_Message_BoxPLN0);
	ld	hl, #_Map_Combat_Message_BoxPLN0
	push	hl
	ld	hl, #_Map_Combat_Message_BoxPLN1
	push	hl
	ld	de, #0x0614
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_map
	add	sp, #8
;bank16.c:611: }
	ret
;bank16.c:613: void Draw_Enemy_Names()
;	---------------------------------
; Function Draw_Enemy_Names
; ---------------------------------
_Draw_Enemy_Names::
;bank16.c:615: if(Get_Enemy(enemy[0]) != &enemy_null)
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00124$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00102$
00124$:
;bank16.c:617: set_bkg_tiles(10, 13, 7, 1, Get_Enemy(enemy[0])->name);
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x0d0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
00102$:
;bank16.c:620: if(Get_Enemy(enemy[1]) != &enemy_null)
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00125$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00104$
00125$:
;bank16.c:622: set_bkg_tiles(10, 14, 7, 1, Get_Enemy(enemy[1])->name);
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x0e0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
00104$:
;bank16.c:625: if(Get_Enemy(enemy[2]) != &enemy_null)
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00126$
	ld	a, #>(_enemy_null)
	sub	a, d
	ret	Z
00126$:
;bank16.c:627: set_bkg_tiles(10, 15, 7, 1, Get_Enemy(enemy[2])->name);
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x0f0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:629: }
	ret
;bank16.c:631: void Draw_Selection_Main()
;	---------------------------------
; Function Draw_Selection_Main
; ---------------------------------
_Draw_Selection_Main::
;bank16.c:633: wait_vbl_done();
	call	_wait_vbl_done
;bank16.c:634: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:635: set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:637: Draw_Combat_Actors();
;bank16.c:638: }
	jp  _Draw_Combat_Actors
;bank16.c:640: void Draw_Selection_Fight()
;	---------------------------------
; Function Draw_Selection_Fight
; ---------------------------------
_Draw_Selection_Fight::
;bank16.c:642: wait_vbl_done();
	call	_wait_vbl_done
;bank16.c:643: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_FightPLN0);
	ld	hl, #_Map_Combat_Selection_FightPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:644: set_bkg_tiles(1, 13 + action_selection[CurrentTurn], 1, 1, Combat_Pointer);
	ld	a, #<(_action_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_action_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	add	a, #0x0d
	ld	hl, #_Combat_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:645: }
	ret
;bank16.c:647: void Clear_Screen()
;	---------------------------------
; Function Clear_Screen
; ---------------------------------
_Clear_Screen::
;bank16.c:649: for(i = 0; i < 18; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00105$:
;bank16.c:651: for(j = 0; j < 20; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00103$:
;bank16.c:653: set_bkg_tiles(j, i, 1, 1, Blank_Tile);
	ld	hl, #_Blank_Tile
	push	hl
	ld	de, #0x0101
	push	de
	ld	a, (#_i)
	push	af
	inc	sp
	ld	a, (#_j)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:651: for(j = 0; j < 20; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00103$
;bank16.c:649: for(i = 0; i < 18; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x92
	jr	C, 00105$
;bank16.c:656: }
	ret
;bank16.c:658: void Draw_Combat_Main()
;	---------------------------------
; Function Draw_Combat_Main
; ---------------------------------
_Draw_Combat_Main::
;bank16.c:660: flash_out();
	call	_flash_out
;bank16.c:662: Call_Load_Font_Menu(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Load_Font_Menu
	inc	sp
;bank16.c:664: Call_Clear_Map(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Clear_Map
	inc	sp
;bank16.c:666: Call_Move_Char(bank16, &char_player, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	hl, #_char_player
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Move_Char
	add	sp, #6
;bank16.c:667: Call_Move_Char(bank16, &char_npc_1, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Move_Char
	add	sp, #6
;bank16.c:668: Call_Move_Char(bank16, &char_npc_2, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Move_Char
	add	sp, #6
;bank16.c:669: Call_Move_Char(bank16, &char_npc_3, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Move_Char
	add	sp, #6
;bank16.c:670: Call_Move_Char(bank16, &char_npc_4, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	hl, #_char_npc_4
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Move_Char
	add	sp, #6
;c:/gbdk/include/gb/gb.h:756: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;bank16.c:674: set_bkg_tiles(0, 12, 20, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0614
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:675: set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);
	ld	hl, #_Map_Combat_Actor_BoxPLN0
	push	hl
	ld	de, #0x060c
	push	de
	ld	de, #0x0c08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:677: Load_Random_Troop();
	call	_Load_Random_Troop
;bank16.c:679: Call_Draw_Troop(bank16, Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->tiles, Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->data);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_CurrentTroop
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Troop
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_CurrentTroop
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Troop
	inc	sp
	pop	bc
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Troop
	add	sp, #5
;bank16.c:681: Load_Enemy_Dummy();
	call	_Load_Enemy_Dummy
;bank16.c:683: Draw_Selection_Main();
	call	_Draw_Selection_Main
;bank16.c:685: CurrentCombat = combat_main;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x00
;bank16.c:686: CurrentTurn = 0;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x00
;bank16.c:687: turn_number = 0;
	ld	hl, #_turn_number
	ld	(hl), #0x00
;bank16.c:689: enemy_selection[0] = 4;
	ld	hl, #_enemy_selection
	ld	(hl), #0x04
;bank16.c:690: enemy_selection[1] = 4;
	ld	hl, #(_enemy_selection + 0x0001)
	ld	(hl), #0x04
;bank16.c:691: enemy_selection[2] = 4;
	ld	hl, #(_enemy_selection + 0x0002)
	ld	(hl), #0x04
;bank16.c:692: enemy_selection[3] = 4;
	ld	hl, #(_enemy_selection + 0x0003)
	ld	(hl), #0x04
;bank16.c:694: Call_Set_Actor_Skills(bank16, Get_Actor(party[0]));
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank16.c:695: Call_Set_Actor_Skills(bank16, Get_Actor(party[1]));
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank16.c:696: Call_Set_Actor_Skills(bank16, Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank16.c:697: Call_Set_Actor_Skills(bank16, Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank16.c:699: flash_in();
;bank16.c:700: }
	jp  _flash_in
;bank16.c:702: void Draw_Current_Skills(GameActor* actor)
;	---------------------------------
; Function Draw_Current_Skills
; ---------------------------------
_Draw_Current_Skills::
;bank16.c:704: Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn]]), 11, 13);
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x0d0b
	push	hl
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Name
	add	sp, #5
	pop	bc
;bank16.c:705: Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn] + 1]), 11, 14);
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x0e0b
	push	hl
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Name
	add	sp, #5
	pop	bc
;bank16.c:706: Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn] + 2]), 11, 15);
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x0f0b
	push	hl
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Name
	add	sp, #5
;bank16.c:707: }
	ret
;bank16.c:709: void Draw_Selection_Skill()
;	---------------------------------
; Function Draw_Selection_Skill
; ---------------------------------
_Draw_Selection_Skill::
	dec	sp
;bank16.c:711: set_bkg_tiles(3, 12, 17, 5, Map_Combat_SkillsPLN0);
	ld	hl, #_Map_Combat_SkillsPLN0
	push	hl
	ld	de, #0x0511
	push	de
	ld	de, #0x0c03
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:713: Draw_Current_Skills(Get_Actor(party[CurrentTurn]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Current_Skills
	add	sp, #2
;bank16.c:715: set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:717: Draw_Combat_Name(4, 13, Get_Actor(party[CurrentTurn])->name, false);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0d04
	push	de
	call	_Draw_Combat_Name
	add	sp, #5
;bank16.c:719: Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #_CurrentSkillSelection+0
	ld	a, e
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	jr	NC, 00103$
	inc	d
00103$:
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#0
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Cost
	add	sp, #3
;bank16.c:721: Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 5, 15);
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0f05
	push	de
	push	bc
	call	_Draw_Combat_Number
	add	sp, #4
;bank16.c:722: }
	inc	sp
	ret
;bank16.c:724: void Load_Enemy_Skill()
;	---------------------------------
; Function Load_Enemy_Skill
; ---------------------------------
_Load_Enemy_Skill::
;bank16.c:726: for(j = 0; j < 3; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00110$:
;bank16.c:728: if(Get_Enemy_Dummy_Combat(j + 4)->health != 0 && Get_Enemy(enemy[j]) != &enemy_null)
	ld	a, (#_j)
	inc	a
	inc	a
	inc	a
	inc	a
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	or	a,(hl)
	jp	Z, 00111$
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_enemy
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00134$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00111$
00134$:
;bank16.c:730: while(1)
00104$:
;bank16.c:732: x = rand() % 3;
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, #_x
	ld	(hl), e
;bank16.c:733: if(Get_Enemy(enemy[j])->skill[x] > 0)
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_enemy
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_x
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;bank16.c:739: skill_selection[j + 4] = Get_Enemy(enemy[j])->skill[x];
	ld	a, (#_j)
	inc	a
	inc	a
	inc	a
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_skill_selection
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_enemy
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_x
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
00111$:
;bank16.c:726: for(j = 0; j < 3; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jp	C, 00110$
;bank16.c:742: }
	ret
;bank16.c:744: void Load_Enemy_Target()
;	---------------------------------
; Function Load_Enemy_Target
; ---------------------------------
_Load_Enemy_Target::
;bank16.c:746: for(j = 0; j < 3; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00110$:
;bank16.c:748: if(Get_Enemy_Dummy_Combat(j + 4)->health != 0 && Get_Enemy(enemy[j]) != &enemy_null)
	ld	a, (#_j)
	inc	a
	inc	a
	inc	a
	inc	a
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	or	a,(hl)
	jr	Z, 00111$
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_enemy
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00134$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00111$
00134$:
;bank16.c:750: while(1)
00104$:
;bank16.c:752: x = 1 + (rand() % 3);
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	inc	a
;bank16.c:753: if(party[x] > 0)
	ld	(#_x),a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;bank16.c:759: target_selection[j + 4] = x;
	ld	a, (#_j)
	inc	a
	inc	a
	inc	a
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_target_selection
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_x)
	ld	(bc), a
00111$:
;bank16.c:746: for(j = 0; j < 3; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00110$
;bank16.c:762: }
	ret
;bank16.c:764: void Refresh_Order()
;	---------------------------------
; Function Refresh_Order
; ---------------------------------
_Refresh_Order::
;bank16.c:766: for(j = 0; j < 7; j++)
	ld	hl, #_j
	ld	(hl), #0x00
00112$:
;bank16.c:768: if(turn_order[j] < 5)
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	c, (hl)
;bank16.c:770: x = turn_order[j] - 1;
	ld	e, c
	dec	e
;bank16.c:768: if(turn_order[j] < 5)
	ld	a, c
	sub	a, #0x05
	jr	NC, 00109$
;bank16.c:770: x = turn_order[j] - 1;
	ld	hl, #_x
	ld	(hl), e
;bank16.c:772: if(Get_Actor(party[x]) != &actor_null && Get_Actor(party[x])->health == 0)
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00146$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00113$
00146$:
	ld	a, (#_x)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	NZ, 00113$
;bank16.c:774: turn_order[j] = 0;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:775: target_selection[x] = 0;
	ld	a, (#_x)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_target_selection
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:776: skill_selection[x] = 0;
	ld	a, (#_x)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_skill_selection
	add	hl, bc
	ld	(hl), #0x00
	jr	00113$
00109$:
;bank16.c:779: else if(turn_order[j] > 4)
	ld	a, #0x04
	sub	a, c
	jr	NC, 00113$
;bank16.c:781: x = turn_order[j] - 1;
	ld	hl, #_x
	ld	(hl), e
;bank16.c:783: if(Get_Enemy_Dummy_Combat(x)->health == 0)
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00113$
;bank16.c:785: turn_order[j] = 0;
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;bank16.c:786: target_selection[x] = 0;
	ld	a, (#_x)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_target_selection
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;bank16.c:787: skill_selection[x] = 0;
	ld	a, (#_x)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_skill_selection
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
00113$:
;bank16.c:766: for(j = 0; j < 7; j++)
	ld	hl, #_j
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	C, 00112$
;bank16.c:791: }
	ret
;bank16.c:793: void Execute_Combat()
;	---------------------------------
; Function Execute_Combat
; ---------------------------------
_Execute_Combat::
	dec	sp
;bank16.c:795: Load_Enemy_Skill();
	call	_Load_Enemy_Skill
;bank16.c:796: Load_Enemy_Target();
	call	_Load_Enemy_Target
;bank16.c:798: Order_Turns();
	call	_Order_Turns
;bank16.c:800: Load_Battle_Message_Box();
	call	_Load_Battle_Message_Box
;bank16.c:802: for(i = 0; i < 7; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00122$:
;bank16.c:804: Refresh_Order();
	call	_Refresh_Order
;bank16.c:806: if(turn_order[i] != 0)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;bank16.c:808: Call_Execute_Skill(bank16, skill_selection[turn_order[i] - 1], turn_order[i] - 1, target_selection[turn_order[i] - 1]);
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
	dec	e
	ld	a, e
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_target_selection
	add	hl, bc
	ld	d, (hl)
	ld	hl, #_skill_selection
	add	hl, bc
	ld	b, (hl)
	push	de
	ld	c, #0x10
	push	bc
	call	_Call_Execute_Skill
	add	sp, #4
00102$:
;bank16.c:811: if(enemy_dummy_1.health == 0 && enemy[0] != 0)
	ld	hl, #(_enemy_dummy_1 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00104$
	ld	a, (#_enemy + 0)
	or	a, a
	jr	Z, 00104$
;bank16.c:813: Clear_Enemy_Tiles(Get_Enemy(enemy[0]), 10, 10);
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #0x0a0a
	push	hl
	push	de
	call	_Clear_Enemy_Tiles
	add	sp, #4
;bank16.c:815: enemy[0] = 0;
	ld	hl, #_enemy
	ld	(hl), #0x00
00104$:
;bank16.c:817: if(enemy_dummy_2.health == 0 && enemy[1] != 0)
	ld	hl, #(_enemy_dummy_2 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00107$
	ld	a, (#(_enemy + 0x0001) + 0)
	or	a, a
	jr	Z, 00107$
;bank16.c:819: Clear_Enemy_Tiles(Get_Enemy(enemy[1]), 4, 9);
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #0x0904
	push	hl
	push	de
	call	_Clear_Enemy_Tiles
	add	sp, #4
;bank16.c:821: enemy[1] = 0;
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0x00
00107$:
;bank16.c:823: if(enemy_dummy_3.health == 0 && enemy[2] != 0)
	ld	hl, #(_enemy_dummy_3 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00110$
	ld	a, (#(_enemy + 0x0002) + 0)
	or	a, a
	jr	Z, 00110$
;bank16.c:825: Clear_Enemy_Tiles(Get_Enemy(enemy[2]), 16, 9);
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl, #0x0910
	push	hl
	push	de
	call	_Clear_Enemy_Tiles
	add	sp, #4
;bank16.c:827: enemy[2] = 0;
	ld	hl, #(_enemy + 0x0002)
	ld	(hl), #0x00
00110$:
;bank16.c:830: turn_order[i] = 0;
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_turn_order
	add	hl, bc
	ld	(hl), #0x00
;bank16.c:832: Load_Battle_Message_Box();
	call	_Load_Battle_Message_Box
;bank16.c:834: if(Get_Actor(party[0])->health == 0 && Get_Actor(party[1])->health == 0 && Get_Actor(party[2])->health == 0 && Get_Actor(party[3])->health == 0)
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00113$
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	NZ, 00113$
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	NZ, 00113$
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	NZ, 00113$
;bank16.c:836: Close_Combat();
	call	_Close_Combat
00113$:
;bank16.c:838: if(enemy_dummy_1.health == 0 && enemy_dummy_2.health == 0 && enemy_dummy_3.health == 0)
	ld	hl, #(_enemy_dummy_1 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00123$
	ld	hl, #(_enemy_dummy_2 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00123$
	ld	hl, #(_enemy_dummy_3 + 0x0007)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00123$
;bank16.c:840: Call_Draw_End_Message(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_End_Message
	inc	sp
;bank16.c:842: Close_Combat();
	call	_Close_Combat
00123$:
;bank16.c:802: for(i = 0; i < 7; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	C, 00122$
;bank16.c:846: turn_number += 1;
	ld	hl, #_turn_number
	inc	(hl)
;bank16.c:848: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank16.c:849: Draw_Combat_Actors();
	call	_Draw_Combat_Actors
;bank16.c:851: }
	inc	sp
	ret
;bank16.c:853: void Close_Combat()
;	---------------------------------
; Function Close_Combat
; ---------------------------------
_Close_Combat::
;bank16.c:855: fade_out();
	call	_fade_out
;bank16.c:857: Call_Load_Tileset(bank16, Tileset);
	ld	a, (#_Tileset)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_Call_Load_Tileset
	add	sp, #2
;bank16.c:859: Call_Reload_Map(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Reload_Map
	inc	sp
;bank16.c:861: toggle_control(true);
	ld	a, #0x01
	push	af
	inc	sp
	call	_toggle_control
	inc	sp
;bank16.c:863: fade_in();
	call	_fade_in
;bank16.c:865: combat_main_y = 0;
	ld	hl, #_combat_main_y
	ld	(hl), #0x00
;bank16.c:867: Gameplay();
;bank16.c:868: }
	jp  _Gameplay
;bank16.c:870: void Flee_Battle()
;	---------------------------------
; Function Flee_Battle
; ---------------------------------
_Flee_Battle::
;bank16.c:872: initrand(clock_tick);
	ld	hl, #_clock_tick
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;bank16.c:874: if(Get_Troop(CurrentTroop)->escapable == true)
	ld	a, (#_CurrentTroop)
	push	af
	inc	sp
	call	_Get_Troop
	inc	sp
	ld	hl, #0x0008
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;bank16.c:876: x = rand() % 3;
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	hl, #_x
	ld	(hl), e
;bank16.c:878: if(x < 1)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	ret	NC
;bank16.c:880: Close_Combat();
;bank16.c:888: }
	jp  _Close_Combat
;bank16.c:890: void Select_Target()
;	---------------------------------
; Function Select_Target
; ---------------------------------
_Select_Target::
;bank16.c:892: if(enemy_selection[CurrentTurn] > 3)
	ld	bc, #_enemy_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	e, a
	ld	a, #0x03
	sub	a, e
	jp	NC, 00131$
;bank16.c:894: if(Get_Enemy_Dummy_Combat(enemy_selection[CurrentTurn])->health == 0)
	push	bc
	ld	a, e
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	ret	NZ
;bank16.c:896: if(Get_Enemy_Dummy_Combat(4)->health != 0 && Get_Enemy(enemy[0]) != &enemy_null)
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00109$
	ld	a, (#_enemy + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00215$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00109$
00215$:
;bank16.c:898: enemy_selection[CurrentTurn] = 4;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00216$
	inc	b
00216$:
	ld	a, #0x04
	ld	(bc), a
	ret
00109$:
;bank16.c:900: else if(Get_Enemy_Dummy_Combat(5)->health != 0 && Get_Enemy(enemy[1]) != &enemy_null)
	push	bc
	ld	a, #0x05
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00105$
	ld	a, (#(_enemy + 0x0001) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00217$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00105$
00217$:
;bank16.c:902: enemy_selection[CurrentTurn] = 5;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00218$
	inc	b
00218$:
	ld	a, #0x05
	ld	(bc), a
	ret
00105$:
;bank16.c:904: else if(Get_Enemy_Dummy_Combat(6)->health != 0 && Get_Enemy(enemy[2]) != &enemy_null)
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	ret	Z
	ld	a, (#(_enemy + 0x0002) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00219$
	ld	a, #>(_enemy_null)
	sub	a, d
	ret	Z
00219$:
;bank16.c:906: enemy_selection[CurrentTurn] = 6;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00220$
	inc	b
00220$:
	ld	a, #0x06
	ld	(bc), a
	ret
00131$:
;bank16.c:910: else if(enemy_selection[CurrentTurn] < 4)
	ld	a, e
	sub	a, #0x04
	ret	NC
;bank16.c:912: if(Get_Actor(party[enemy_selection[CurrentTurn]])->health == 0 || Get_Actor(party[enemy_selection[CurrentTurn]]) == &actor_null)
	ld	hl, #_party
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00125$
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #<(_party)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_party)
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	ret	NZ
	ld	a, #>(_actor_null)
	sub	a, d
	ret	NZ
00125$:
;bank16.c:914: if(Get_Actor(party[1])->health != 0 && Get_Actor(party[1]) != &actor_null)
	ld	a, (#(_party + 0x0001) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00122$
	ld	a, (#(_party + 0x0001) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00223$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00122$
00223$:
;bank16.c:916: enemy_selection[CurrentTurn] = 1;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00224$
	inc	b
00224$:
	ld	a, #0x01
	ld	(bc), a
	ret
00122$:
;bank16.c:918: else if(Get_Actor(party[2])->health != 0 && Get_Actor(party[2]) != &actor_null)
	ld	a, (#(_party + 0x0002) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00118$
	ld	a, (#(_party + 0x0002) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00225$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00118$
00225$:
;bank16.c:920: enemy_selection[CurrentTurn] = 2;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00226$
	inc	b
00226$:
	ld	a, #0x02
	ld	(bc), a
	ret
00118$:
;bank16.c:922: else if(Get_Actor(party[3])->health != 0 && Get_Actor(party[3]) != &actor_null)
	ld	a, (#(_party + 0x0003) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	ret	Z
	ld	a, (#(_party + 0x0003) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00227$
	ld	a, #>(_actor_null)
	sub	a, d
	ret	Z
00227$:
;bank16.c:924: enemy_selection[CurrentTurn] = 3;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00228$
	inc	b
00228$:
	ld	a, #0x03
	ld	(bc), a
;bank16.c:929: }
	ret
;bank16.c:931: void Confirm_Target_Selection()
;	---------------------------------
; Function Confirm_Target_Selection
; ---------------------------------
_Confirm_Target_Selection::
	add	sp, #-2
;bank16.c:933: if(Get_Actor(party[CurrentTurn + 1]) != &actor_null && Get_Actor(party[CurrentTurn + 1])->health == 0 && CurrentTurn + 1 <= total_actors)
	ld	a, (#_CurrentTurn)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00171$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00115$
00171$:
	ld	a, (#_CurrentTurn)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jp	NZ, 00115$
	ld	hl, #_CurrentTurn
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_total_actors
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00172$
	bit	7, d
	jr	NZ, 00173$
	cp	a, a
	jr	00173$
00172$:
	bit	7, d
	jr	Z, 00173$
	scf
00173$:
	jp	C, 00115$
;bank16.c:935: if(Get_Actor(party[CurrentTurn + 2]) != &actor_null && Get_Actor(party[CurrentTurn + 2])->health != 0 && CurrentTurn + 2 <= total_actors)
	ld	a, (#_CurrentTurn)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00174$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00107$
00174$:
	ld	a, (#_CurrentTurn)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00107$
	ld	hl, #_CurrentTurn
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_total_actors
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00175$
	bit	7, d
	jr	NZ, 00176$
	cp	a, a
	jr	00176$
00175$:
	bit	7, d
	jr	Z, 00176$
	scf
00176$:
	jr	C, 00107$
;bank16.c:937: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:938: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:940: target_selection[CurrentTurn] = enemy_selection[CurrentTurn];
	ld	bc, #_target_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00177$
	inc	b
00177$:
	ld	de, #_enemy_selection+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00178$
	inc	d
00178$:
	ld	a, (de)
	ld	(bc), a
;bank16.c:942: CurrentTurn += 2;
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank16.c:944: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:946: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:948: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00179$
	inc	b
00179$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:950: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00119$
00107$:
;bank16.c:952: else if(Get_Actor(party[CurrentTurn + 3]) != &actor_null && Get_Actor(party[CurrentTurn + 3])->health != 0 && CurrentTurn + 3 <= total_actors)
	ld	a, (#_CurrentTurn)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00180$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00102$
00180$:
	ld	a, (#_CurrentTurn)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_party
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00102$
	ld	hl, #_CurrentTurn
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_total_actors
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00181$
	bit	7, d
	jr	NZ, 00182$
	cp	a, a
	jr	00182$
00181$:
	bit	7, d
	jr	Z, 00182$
	scf
00182$:
	jr	C, 00102$
;bank16.c:954: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:955: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:957: target_selection[CurrentTurn] = enemy_selection[CurrentTurn];
	ld	bc, #_target_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00183$
	inc	b
00183$:
	ld	de, #_enemy_selection+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00184$
	inc	d
00184$:
	ld	a, (de)
	ld	(bc), a
;bank16.c:959: CurrentTurn += 3;
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;bank16.c:961: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:963: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:965: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00185$
	inc	b
00185$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:967: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00119$
00102$:
;bank16.c:971: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:972: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:974: set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);
	ld	hl, #_Map_Combat_MainPLN0
	push	hl
	ld	de, #0x0614
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:976: Execute_Combat();
	call	_Execute_Combat
;bank16.c:978: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:979: set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:981: combat_main_y = 0;
	ld	hl, #_combat_main_y
	ld	(hl), #0x00
;bank16.c:983: CurrentTurn = 0;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x00
;bank16.c:985: CurrentCombat = combat_main;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x00
	jp	00119$
00115$:
;bank16.c:989: else if(CurrentTurn < total_actors - 1)
	ld	hl, #_total_actors
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a, (#_CurrentTurn)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00186$
	bit	7, d
	jr	NZ, 00187$
	cp	a, a
	jr	00187$
00186$:
	bit	7, d
	jr	Z, 00187$
	scf
00187$:
	jr	NC, 00112$
;bank16.c:991: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:992: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:994: target_selection[CurrentTurn] = enemy_selection[CurrentTurn];
	ld	bc, #_target_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00188$
	inc	b
00188$:
	ld	de, #_enemy_selection+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00189$
	inc	d
00189$:
	ld	a, (de)
	ld	(bc), a
;bank16.c:996: CurrentTurn += 1;
	inc	(hl)
;bank16.c:998: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1000: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1002: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00190$
	inc	b
00190$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1004: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jr	00119$
00112$:
;bank16.c:1008: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1009: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1011: target_selection[CurrentTurn] = enemy_selection[CurrentTurn];
	ld	bc, #_target_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00191$
	inc	b
00191$:
	ld	de, #_enemy_selection+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00192$
	inc	d
00192$:
	ld	a, (de)
	ld	(bc), a
;bank16.c:1013: set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);
	ld	hl, #_Map_Combat_MainPLN0
	push	hl
	ld	de, #0x0614
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1015: Execute_Combat();
	call	_Execute_Combat
;bank16.c:1017: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1018: set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1020: combat_main_y = 0;
	ld	hl, #_combat_main_y
	ld	(hl), #0x00
;bank16.c:1022: CurrentTurn = 0;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x00
;bank16.c:1024: CurrentCombat = combat_main;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x00
00119$:
;bank16.c:1026: }
	add	sp, #2
	ret
;bank16.c:1028: void Move_Pointer_Left()
;	---------------------------------
; Function Move_Pointer_Left
; ---------------------------------
_Move_Pointer_Left::
;bank16.c:1030: selected_enemy = enemy_selection[CurrentTurn] - 4;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	add	a, #0xfc
	ld	(#_selected_enemy),a
;bank16.c:1032: if(enemy_selection[CurrentTurn] == 4 && Get_Enemy(enemy[1]) != &enemy_null && Get_Enemy_Dummy_Combat(5)->health != 0)
	ld	a, (bc)
	sub	a, #0x04
	jr	NZ, 00112$
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00170$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00112$
00170$:
	ld	a, #0x05
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00112$
;bank16.c:1034: enemy_selection[CurrentTurn] = 5;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x05
	ld	(bc), a
;bank16.c:1035: Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
	ret
00112$:
;bank16.c:1037: else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health != 0)
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	sub	a, #0x06
	jr	NZ, 00107$
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00173$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00107$
00173$:
	ld	a, #0x04
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00107$
;bank16.c:1039: enemy_selection[CurrentTurn] = 4;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;bank16.c:1040: Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
	ret
00107$:
;bank16.c:1042: else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health == 0 && Get_Enemy_Dummy_Combat(5)->health != 0)
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	sub	a, #0x06
	ret	NZ
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00176$
	ld	a, #>(_enemy_null)
	sub	a, d
	ret	Z
00176$:
	ld	a, #0x04
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	NZ
	ld	a, #0x05
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	Z
;bank16.c:1044: enemy_selection[CurrentTurn] = 6;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x06
	ld	(bc), a
;bank16.c:1045: Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
;bank16.c:1047: }
	ret
;bank16.c:1049: void Move_Pointer_Right()
;	---------------------------------
; Function Move_Pointer_Right
; ---------------------------------
_Move_Pointer_Right::
;bank16.c:1051: selected_enemy = enemy_selection[CurrentTurn] - 4;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	add	a, #0xfc
	ld	(#_selected_enemy),a
;bank16.c:1053: if(enemy_selection[CurrentTurn] == 4 && Get_Enemy(enemy[2]) != &enemy_null && Get_Enemy_Dummy_Combat(6)->health != 0)
	ld	a, (bc)
	sub	a, #0x04
	jr	NZ, 00112$
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00170$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00112$
00170$:
	ld	a, #0x06
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00112$
;bank16.c:1055: enemy_selection[CurrentTurn] = 6;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x06
	ld	(bc), a
;bank16.c:1056: Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
	ret
00112$:
;bank16.c:1058: else if(enemy_selection[CurrentTurn] == 5 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health != 0)
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	sub	a, #0x05
	jr	NZ, 00107$
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00173$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00107$
00173$:
	ld	a, #0x04
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00107$
;bank16.c:1060: enemy_selection[CurrentTurn] = 4;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x04
	ld	(bc), a
;bank16.c:1061: Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
	ret
00107$:
;bank16.c:1063: else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health == 0 && Get_Enemy_Dummy_Combat(6)->health != 0)
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	sub	a, #0x06
	ret	NZ
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00176$
	ld	a, #>(_enemy_null)
	sub	a, d
	ret	Z
00176$:
	ld	a, #0x04
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	NZ
	ld	a, #0x06
	push	af
	inc	sp
	call	_Get_Enemy_Dummy_Combat
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	Z
;bank16.c:1065: enemy_selection[CurrentTurn] = 6;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x06
	ld	(bc), a
;bank16.c:1066: Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	hl,#0x0006+1
	add	hl,de
	ld	b, (hl)
	ld	a, #<(_enemy)
	ld	hl, #_selected_enemy
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
;bank16.c:1068: }
	ret
;bank16.c:1070: void Update_Combat_Joypad()
;	---------------------------------
; Function Update_Combat_Joypad
; ---------------------------------
_Update_Combat_Joypad::
	add	sp, #-3
;bank16.c:1072: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank16.c:1074: if(Joy & J_A)
	bit	4, (hl)
	jp	Z,00159$
;bank16.c:1076: if(CurrentCombat == combat_main)
	ld	a, (#_CurrentCombat)
	or	a, a
	jp	NZ, 00156$
;bank16.c:1078: if(combat_main_y == 0)
	ld	a, (#_combat_main_y)
	or	a, a
	jp	NZ, 00122$
;bank16.c:1080: if(Get_Actor(party[CurrentTurn]) != &actor_null && Get_Actor(party[CurrentTurn])->health == 0)
	ld	bc, #_party+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00983$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00113$
00983$:
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jp	NZ, 00113$
;bank16.c:1082: if(Get_Actor(party[CurrentTurn + 1]) != &actor_null && Get_Actor(party[CurrentTurn + 1])->health != 0)
	ld	a, (#_CurrentTurn)
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00984$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00109$
00984$:
	ld	a, (#_CurrentTurn)
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00109$
;bank16.c:1084: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1086: CurrentTurn = 1;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x01
;bank16.c:1088: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1090: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1092: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00985$
	inc	b
00985$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1094: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00116$
00109$:
;bank16.c:1096: else if(Get_Actor(party[CurrentTurn + 2]) != &actor_null && Get_Actor(party[CurrentTurn + 2])->health != 0)
	ld	a, (#_CurrentTurn)
	add	a, #0x02
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00986$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00105$
00986$:
	ld	a, (#_CurrentTurn)
	add	a, #0x02
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00105$
;bank16.c:1098: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1100: CurrentTurn = 2;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x02
;bank16.c:1102: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1104: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1106: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00987$
	inc	b
00987$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1108: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00116$
00105$:
;bank16.c:1110: else if(Get_Actor(party[CurrentTurn + 3]) != &actor_null && Get_Actor(party[CurrentTurn + 3])->health != 0)
	ld	a, (#_CurrentTurn)
	add	a, #0x03
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00988$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00116$
00988$:
	ld	a, (#_CurrentTurn)
	add	a, #0x03
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00116$
;bank16.c:1112: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1114: CurrentTurn = 3;
	ld	hl, #_CurrentTurn
	ld	(hl), #0x03
;bank16.c:1116: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1118: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1120: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00989$
	inc	b
00989$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1122: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jr	00116$
00113$:
;bank16.c:1127: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1128: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1130: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1132: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00990$
	inc	b
00990$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1134: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
;bank16.c:1137: while(joypad() & J_A)
00116$:
	call	_joypad
	bit	4, e
	jp	Z,00159$
;bank16.c:1139: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00116$
00122$:
;bank16.c:1142: else if(combat_main_y == 1)
	ld	a, (#_combat_main_y)
	dec	a
	jp	NZ,00159$
;bank16.c:1144: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1145: Close_Combat();
	call	_Close_Combat
	jp	00159$
00156$:
;bank16.c:1148: else if(CurrentCombat == combat_fight)
	ld	a, (#_CurrentCombat)
	dec	a
	jr	NZ, 00153$
;bank16.c:1150: if(combat_main_y == 0)
	ld	a, (#_combat_main_y)
	or	a, a
	jr	NZ, 00125$
;bank16.c:1152: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1154: skill_selection[CurrentTurn] = 1;
	ld	bc, #_skill_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 00996$
	inc	b
00996$:
	ld	a, #0x01
	ld	(bc), a
;bank16.c:1156: Select_Target();
	call	_Select_Target
;bank16.c:1158: Load_Enemy_Pointer();
	call	_Load_Enemy_Pointer
;bank16.c:1160: CurrentCombat = combat_select;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x02
00125$:
;bank16.c:1162: if(combat_main_y == 1)
	ld	a, (#_combat_main_y)
	dec	a
	jr	NZ, 00128$
;bank16.c:1164: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1166: Draw_Selection_Skill();
	call	_Draw_Selection_Skill
;bank16.c:1168: CurrentCombat = combat_skill;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x03
;bank16.c:1171: while(joypad() & J_A)
00128$:
	call	_joypad
	bit	4, e
	jp	Z,00159$
;bank16.c:1173: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00128$
00153$:
;bank16.c:1176: else if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jr	NZ, 00150$
;bank16.c:1178: Confirm_Target_Selection();
	call	_Confirm_Target_Selection
;bank16.c:1180: while(joypad() & J_A)
00131$:
	call	_joypad
	bit	4, e
	jp	Z,00159$
;bank16.c:1182: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00131$
00150$:
;bank16.c:1185: else if(CurrentCombat == combat_skill)
	ld	a, (#_CurrentCombat)
	sub	a, #0x03
	jp	NZ,00147$
;bank16.c:1187: u_x = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_u_x),a
;bank16.c:1189: if(Get_Actor(party[CurrentTurn])->mana >= Call_Get_Skill_Cost(bank16, Get_Skill(u_x)) && Call_Get_Skill_Cost(bank16, Get_Skill(u_x)) > 0)
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Get_Skill_Cost
	add	sp, #3
	pop	bc
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	C, 00135$
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Get_Skill_Cost
	add	sp, #3
	ld	a, e
	or	a, a
	jr	Z, 00135$
;bank16.c:1191: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1193: skill_selection[CurrentTurn] = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];
;c
	ld	de, #_skill_selection
	ld	hl, #_CurrentTurn
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
	pop	hl
	push	hl
	ld	(hl), c
;bank16.c:1195: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1196: set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);
	ld	hl, #_Map_Combat_Actor_BoxPLN0
	push	hl
	ld	de, #0x060c
	push	de
	ld	de, #0x0c08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1197: Draw_Combat_Actors();
	call	_Draw_Combat_Actors
;bank16.c:1199: Select_Target();
	call	_Select_Target
;bank16.c:1201: Load_Enemy_Pointer();
	call	_Load_Enemy_Pointer
;bank16.c:1203: CurrentCombat = combat_skill_select;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x04
	jr	00138$
00135$:
;bank16.c:1207: Call_Play_Buzz(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank16.c:1210: while(joypad() & J_A)
00138$:
	call	_joypad
	bit	4, e
	jp	Z,00159$
;bank16.c:1212: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00138$
00147$:
;bank16.c:1215: else if(CurrentCombat == combat_skill_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x04
	jp	NZ,00159$
;bank16.c:1217: u_x = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_u_x),a
;bank16.c:1219: Get_Actor(party[CurrentTurn])->mana -= Call_Get_Skill_Cost(bank16, Get_Skill(u_x));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
;c
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Get_Skill_Cost
	add	sp, #3
	pop	bc
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;bank16.c:1221: Confirm_Target_Selection();
	call	_Confirm_Target_Selection
;bank16.c:1223: while(joypad() & J_A)
00141$:
	call	_joypad
	bit	4, e
	jr	Z, 00159$
;bank16.c:1225: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00141$
00159$:
;bank16.c:1230: if(Joy & J_B)
	ld	a, (#_Joy)
	bit	5, a
	jp	Z,00205$
;bank16.c:1232: if(CurrentCombat == combat_fight)
	ld	a, (#_CurrentCombat)
	dec	a
	jp	NZ,00202$
;bank16.c:1234: if(CurrentTurn == 0)
	ld	a, (#_CurrentTurn)
	or	a, a
	jr	NZ, 00179$
;bank16.c:1236: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1238: set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);
	ld	hl, #_Map_Combat_MainPLN0
	push	hl
	ld	de, #0x0614
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1240: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1241: set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1243: combat_main_y = 0;
	ld	hl, #_combat_main_y
	ld	(hl), #0x00
;bank16.c:1245: CurrentCombat = combat_main;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x00
	jp	00181$
00179$:
;bank16.c:1249: if(Get_Actor(party[CurrentTurn - 1]) != &actor_null && Get_Actor(party[CurrentTurn - 1])->health == 0 && CurrentTurn - 1 >= 0)
	ld	bc, #_party+0
	ld	a, (#_CurrentTurn)
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 01012$
	ld	a, #>(_actor_null)
	sub	a, d
	jp	Z,00174$
01012$:
	ld	a, (#_CurrentTurn)
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jp	NZ, 00174$
	ld	hl, #_CurrentTurn
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	dec	hl
	bit	7, h
	jp	NZ, 00174$
;bank16.c:1251: if(Get_Actor(party[CurrentTurn - 2]) != &actor_null && Get_Actor(party[CurrentTurn - 2])->health != 0 && CurrentTurn - 2 >= 0)
	ld	a, (#_CurrentTurn)
	dec	a
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 01013$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00166$
01013$:
	ld	a, (#_CurrentTurn)
	dec	a
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
	or	a, l
	jr	Z, 00166$
	ld	hl, #_CurrentTurn
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	dec	hl
	dec	hl
	bit	7, h
	jr	NZ, 00166$
;bank16.c:1253: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1254: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1256: CurrentTurn -= 2;
	ld	hl, #_CurrentTurn
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
;bank16.c:1258: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1260: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1262: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01014$
	inc	b
01014$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1264: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00181$
00166$:
;bank16.c:1266: else if(Get_Actor(party[CurrentTurn - 3]) != &actor_null && Get_Actor(party[CurrentTurn - 3])->health != 0 && CurrentTurn - 3 >= 0)
	ld	a, (#_CurrentTurn)
	add	a, #0xfd
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 01015$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00161$
01015$:
	ld	a, (#_CurrentTurn)
	add	a, #0xfd
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00161$
	ld	hl, #_CurrentTurn
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xfd
	ld	a, b
	adc	a, #0xff
	bit	7,a
	jr	NZ, 00161$
;bank16.c:1268: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1269: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1271: CurrentTurn -= 3;
	ld	hl, #_CurrentTurn
	ld	a, (hl)
	add	a, #0xfd
	ld	(hl), a
;bank16.c:1273: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1275: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1277: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01016$
	inc	b
01016$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1279: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jp	00181$
00161$:
;bank16.c:1283: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1285: set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);
	ld	hl, #_Map_Combat_MainPLN0
	push	hl
	ld	de, #0x0614
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1287: set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
	ld	hl, #_Map_Combat_Selection_MainPLN0
	push	hl
	ld	de, #0x0608
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1288: set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1290: combat_main_y = 0;
	ld	hl, #_combat_main_y
	ld	(hl), #0x00
;bank16.c:1292: CurrentCombat = combat_main;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x00
	jr	00181$
00174$:
;bank16.c:1296: else if(CurrentTurn > 0)
	ld	a, (#_CurrentTurn)
	or	a, a
	jr	Z, 00171$
;bank16.c:1298: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1299: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1301: CurrentTurn -= 1;
	ld	hl, #_CurrentTurn
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank16.c:1303: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1305: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1307: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01017$
	inc	b
01017$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1309: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
	jr	00181$
00171$:
;bank16.c:1313: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1315: CurrentTurn -= 1;
	ld	hl, #_CurrentTurn
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank16.c:1317: Load_Actor_Info();
	call	_Load_Actor_Info
;bank16.c:1319: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1321: combat_main_y = action_selection[CurrentTurn];
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01018$
	inc	b
01018$:
	ld	a, (bc)
	ld	(#_combat_main_y),a
;bank16.c:1326: while(joypad() & J_B)
00181$:
	call	_joypad
	bit	5, e
	jp	Z,00205$
;bank16.c:1328: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00181$
00202$:
;bank16.c:1331: else if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jr	NZ, 00199$
;bank16.c:1333: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1334: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1336: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
;bank16.c:1338: while(joypad() & J_B)
00184$:
	call	_joypad
	bit	5, e
	jr	Z, 00205$
;bank16.c:1340: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00184$
00199$:
;bank16.c:1343: else if(CurrentCombat == combat_skill)
	ld	a, (#_CurrentCombat)
	sub	a, #0x03
	jr	NZ, 00196$
;bank16.c:1345: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1347: Draw_Selection_Fight();
	call	_Draw_Selection_Fight
;bank16.c:1348: set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);
	ld	hl, #_Map_Combat_Actor_BoxPLN0
	push	hl
	ld	de, #0x060c
	push	de
	ld	de, #0x0c08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1349: Draw_Combat_Actors();
	call	_Draw_Combat_Actors
;bank16.c:1351: CurrentCombat = combat_fight;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x01
;bank16.c:1353: while(joypad() & J_B)
00187$:
	call	_joypad
	bit	5, e
	jr	Z, 00205$
;bank16.c:1355: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00187$
00196$:
;bank16.c:1358: else if(CurrentCombat == combat_skill_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x04
	jr	NZ, 00205$
;bank16.c:1360: Call_Play_Confirm(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank16.c:1362: Clear_Pointer();
	call	_Clear_Pointer
;bank16.c:1364: Draw_Selection_Skill();
	call	_Draw_Selection_Skill
;bank16.c:1366: CurrentCombat = combat_skill;
	ld	hl, #_CurrentCombat
	ld	(hl), #0x03
;bank16.c:1368: while(joypad() & J_B)
00190$:
	call	_joypad
	bit	5, e
	jr	Z, 00205$
;bank16.c:1370: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00190$
00205$:
;bank16.c:1375: if(Joy & J_UP)
	ld	a, (#_Joy)
	bit	2, a
	jp	Z,00244$
;bank16.c:1377: if(CurrentCombat == combat_main)
	ld	a, (#_CurrentCombat)
	or	a, a
	jr	NZ, 00241$
;bank16.c:1379: if(combat_main_y > 0)
	ld	hl, #_combat_main_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00208$
;bank16.c:1381: set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Background);
	ld	bc, #_Combat_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1382: combat_main_y -= 1;
	ld	hl, #_combat_main_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank16.c:1383: set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1386: while(joypad() & J_UP)
00208$:
	call	_joypad
	bit	2, e
	jp	Z,00244$
;bank16.c:1388: wait_vbl_done();
	call	_wait_vbl_done
	jr	00208$
00241$:
;bank16.c:1391: else if(CurrentCombat == combat_fight)
	ld	a, (#_CurrentCombat)
	dec	a
	jr	NZ, 00238$
;bank16.c:1393: if(combat_main_y > 0)
	ld	hl, #_combat_main_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00213$
;bank16.c:1395: set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Background);
	ld	bc, #_Combat_Background+0
	ld	a, (hl)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1396: combat_main_y -= 1;
	ld	hl, #_combat_main_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank16.c:1397: set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, (hl)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1399: action_selection[CurrentTurn] -= 1;
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01033$
	inc	b
01033$:
	ld	a, (bc)
	dec	a
	ld	(bc), a
;bank16.c:1402: while(joypad() & J_UP)
00213$:
	call	_joypad
	bit	2, e
	jp	Z,00244$
;bank16.c:1404: wait_vbl_done();
	call	_wait_vbl_done
	jr	00213$
00238$:
;bank16.c:1407: else if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jp	NZ,00235$
;bank16.c:1409: if(enemy_selection[CurrentTurn] > 0)
;c
	ld	de, #_enemy_selection
	ld	hl, #_CurrentTurn
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	or	a, a
	jr	Z, 00217$
;bank16.c:1411: set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Background);
	ld	de, #_Combat_Background+0
	ld	a, c
	add	a, #0x0d
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1413: enemy_selection[CurrentTurn]--;
	ld	a, #<(_enemy_selection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	dec	a
	ld	(bc), a
;bank16.c:1415: set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, #<(_enemy_selection)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_enemy_selection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	jr	00219$
00217$:
;bank16.c:1419: enemy_selection[CurrentTurn] = 4;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
;bank16.c:1421: set_bkg_tiles(8, 13, 1, 1, Combat_Background);
	ld	hl, #_Combat_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1423: Select_Target();
	call	_Select_Target
;bank16.c:1424: Load_Enemy_Pointer();
	call	_Load_Enemy_Pointer
;bank16.c:1427: while(joypad() & J_UP)
00219$:
	call	_joypad
	bit	2, e
	jp	Z,00244$
;bank16.c:1429: wait_vbl_done();
	call	_wait_vbl_done
	jr	00219$
00235$:
;bank16.c:1432: else if(CurrentCombat == combat_skill)
	ld	a, (#_CurrentCombat)
	sub	a, #0x03
	jp	NZ,00244$
;bank16.c:1434: if(skill_y[CurrentTurn] > 0)
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#2
;bank16.c:1436: set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Background);
	ld	(hl),a
	or	a,a
	jr	Z, 00227$
	add	a, #0x0d
	ld	hl, #_Combat_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1438: skill_y[CurrentTurn] -= 1;
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	dec	a
	ld	(bc), a
;bank16.c:1440: set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, #<(_skill_y)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	jr	00228$
00227$:
;bank16.c:1442: else if(skill_y[CurrentTurn] == 0 && CurrentSkillSelection[CurrentTurn] > 0 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00228$
	ld	bc, #_CurrentSkillSelection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	or	a, a
	jr	Z, 00228$
	ld	a, #<(_party)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
;c
	ld	hl, #0x0024
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01040$
	inc	b
01040$:
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	inc	a
;c
	ld	e, a
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jr	Z, 00228$
;bank16.c:1444: CurrentSkillSelection[CurrentTurn] -= 1;
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	ld	(bc), a
;bank16.c:1446: Draw_Current_Skills(Get_Actor(party[CurrentTurn]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Current_Skills
	add	sp, #2
00228$:
;bank16.c:1449: Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Cost
	add	sp, #3
;bank16.c:1451: while(joypad() & J_UP)
00229$:
	call	_joypad
	bit	2, e
	jr	Z, 00244$
;bank16.c:1453: wait_vbl_done();
	call	_wait_vbl_done
	jr	00229$
00244$:
;bank16.c:1458: if(Joy & J_DOWN)
	ld	a, (#_Joy)
	bit	3, a
	jp	Z,00287$
;bank16.c:1460: if(CurrentCombat == combat_main)
	ld	a, (#_CurrentCombat)
	or	a, a
	jr	NZ, 00284$
;bank16.c:1462: if(combat_main_y < 1)
	ld	hl, #_combat_main_y
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00247$
;bank16.c:1464: set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Background);
	ld	bc, #_Combat_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1465: combat_main_y += 1;
	ld	hl, #_combat_main_y
	inc	(hl)
;bank16.c:1466: set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1469: while(joypad() & J_DOWN)
00247$:
	call	_joypad
	bit	3, e
	jp	Z,00287$
;bank16.c:1471: wait_vbl_done();
	call	_wait_vbl_done
	jr	00247$
00284$:
;bank16.c:1474: else if(CurrentCombat == combat_fight)
	ld	a, (#_CurrentCombat)
	dec	a
	jr	NZ, 00281$
;bank16.c:1476: if(combat_main_y < 2)
	ld	hl, #_combat_main_y
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00252$
;bank16.c:1478: set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Background);
	ld	bc, #_Combat_Background+0
	ld	a, (hl)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1479: combat_main_y += 1;
	ld	hl, #_combat_main_y
	inc	(hl)
;bank16.c:1480: set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, (hl)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1482: action_selection[CurrentTurn] += 1;
	ld	bc, #_action_selection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01046$
	inc	b
01046$:
	ld	a, (bc)
	inc	a
	ld	(bc), a
;bank16.c:1485: while(joypad() & J_DOWN)
00252$:
	call	_joypad
	bit	3, e
	jp	Z,00287$
;bank16.c:1487: wait_vbl_done();
	call	_wait_vbl_done
	jr	00252$
00281$:
;bank16.c:1490: else if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jp	NZ,00278$
;bank16.c:1492: if(enemy_selection[CurrentTurn] > 3)
	ld	bc, #_enemy_selection+0
	ld	hl, #_CurrentTurn
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, a
	ld	a, #0x03
	sub	a, h
	jr	NC, 00259$
;bank16.c:1494: enemy_selection[CurrentTurn] = 0;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;bank16.c:1495: Move_Pointer(25, 25, 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	a, #0x19
	push	af
	inc	sp
	call	_Move_Pointer
	add	sp, #4
;bank16.c:1497: set_bkg_tiles(8, 13, 1, 1, Combat_Pointer);
	ld	hl, #_Combat_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	jr	00261$
00259$:
;bank16.c:1499: else if(enemy_selection[CurrentTurn] < 4 && Get_Party_Slot_Filled(enemy_selection[CurrentTurn] + 1) == true)
	ld	a, h
	sub	a, #0x04
	jr	NC, 00261$
	inc	h
	push	bc
	push	hl
	inc	sp
	call	_Get_Party_Slot_Filled
	inc	sp
	pop	bc
	dec	e
	jr	NZ, 00261$
;bank16.c:1501: set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Background);
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x0d
	ld	hl, #_Combat_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1503: enemy_selection[CurrentTurn]++;
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	inc	a
	ld	(de), a
;bank16.c:1505: set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Pointer);
	ld	de, #_Combat_Pointer+0
	ld	a, c
	add	a, (hl)
	ld	c, a
	jr	NC, 01052$
	inc	b
01052$:
	ld	a, (bc)
	add	a, #0x0d
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x08
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1508: while(joypad() & J_DOWN)
00261$:
	call	_joypad
	bit	3, e
	jp	Z,00287$
;bank16.c:1510: wait_vbl_done();
	call	_wait_vbl_done
	jr	00261$
00278$:
;bank16.c:1513: else if(CurrentCombat == combat_skill)
	ld	a, (#_CurrentCombat)
	sub	a, #0x03
	jp	NZ,00287$
;bank16.c:1515: if(skill_y[CurrentTurn] < 2 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	sub	a, #0x02
	jp	NC, 00269$
	ld	bc, #_party+0
	ld	a, c
	add	a, (hl)
	ld	c, a
	jr	NC, 01056$
	inc	b
01056$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	e, l
	ld	d, h
	ld	bc, #_CurrentSkillSelection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01057$
	inc	b
01057$:
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, c
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00269$
;bank16.c:1517: set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Background);
	ld	de, #_Combat_Background+0
	ld	a, c
	add	a, #0x0d
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;bank16.c:1519: skill_y[CurrentTurn] += 1;
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	inc	a
	ld	(bc), a
;bank16.c:1521: set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);
	ld	bc, #_Combat_Pointer+0
	ld	a, #<(_skill_y)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #0x0d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0a
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	jr	00270$
00269$:
;bank16.c:1523: else if(skill_y[CurrentTurn] == 2 && CurrentSkillSelection[CurrentTurn] < 7 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00270$
	ld	bc, #_CurrentSkillSelection+0
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	sub	a, #0x07
	jr	NC, 00270$
	ld	a, #<(_party)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
;c
	ld	hl, #0x0024
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, c
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	jr	NC, 01060$
	inc	b
01060$:
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	inc	a
;c
	ld	e, a
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jr	Z, 00270$
;bank16.c:1525: CurrentSkillSelection[CurrentTurn] += 1;
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	ld	(bc), a
;bank16.c:1527: Draw_Current_Skills(Get_Actor(party[CurrentTurn]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Current_Skills
	add	sp, #2
00270$:
;bank16.c:1530: Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));
	ld	a, #<(_party)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	c, a
	ld	a, #>(_party)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, #<(_CurrentSkillSelection)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_CurrentSkillSelection)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #<(_skill_y)
	ld	hl, #_CurrentTurn
	add	a, (hl)
	ld	e, a
	ld	a, #>(_skill_y)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Call_Draw_Skill_Cost
	add	sp, #3
;bank16.c:1532: while(joypad() & J_DOWN)
00272$:
	call	_joypad
	bit	3, e
	jr	Z, 00287$
;bank16.c:1534: wait_vbl_done();
	call	_wait_vbl_done
	jr	00272$
00287$:
;bank16.c:1539: if(Joy & J_LEFT)
	ld	a, (#_Joy)
	bit	1, a
	jr	Z, 00300$
;bank16.c:1541: if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jr	NZ, 00297$
;bank16.c:1543: Move_Pointer_Left();
	call	_Move_Pointer_Left
;bank16.c:1545: while(joypad() & J_LEFT)
00288$:
	call	_joypad
	bit	1, e
	jr	Z, 00300$
;bank16.c:1547: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00288$
00297$:
;bank16.c:1550: else if(CurrentCombat == combat_skill_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x04
	jr	NZ, 00300$
;bank16.c:1552: Move_Pointer_Left();
	call	_Move_Pointer_Left
;bank16.c:1554: while(joypad() & J_LEFT)
00291$:
	call	_joypad
	bit	1, e
	jr	Z, 00300$
;bank16.c:1556: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00291$
00300$:
;bank16.c:1561: if(Joy & J_RIGHT)
	ld	a, (#_Joy)
	rrca
	jr	NC, 00314$
;bank16.c:1563: if(CurrentCombat == combat_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x02
	jr	NZ, 00310$
;bank16.c:1565: Move_Pointer_Right();
	call	_Move_Pointer_Right
;bank16.c:1567: while(joypad() & J_RIGHT)
00301$:
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00314$
;bank16.c:1569: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00301$
00310$:
;bank16.c:1572: else if(CurrentCombat == combat_skill_select)
	ld	a, (#_CurrentCombat)
	sub	a, #0x04
	jr	NZ, 00314$
;bank16.c:1574: Move_Pointer_Right();
	call	_Move_Pointer_Right
;bank16.c:1576: while(joypad() & J_RIGHT)
00304$:
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00314$
;bank16.c:1578: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00304$
00314$:
;bank16.c:1582: }
	add	sp, #3
	ret
;bank16.c:1584: void Combat()
;	---------------------------------
; Function Combat
; ---------------------------------
_Combat::
;bank16.c:1586: while(1)
00102$:
;bank16.c:1588: wait_vbl_done();
	call	_wait_vbl_done
;bank16.c:1589: initrand(clock_tick);
	ld	hl, #_clock_tick
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;bank16.c:1591: Update_Combat_Joypad();
	call	_Update_Combat_Joypad
;bank16.c:1593: }
	jr	00102$
;bank16.c:1595: void Load_Combat_Main()
;	---------------------------------
; Function Load_Combat_Main
; ---------------------------------
_Load_Combat_Main::
;bank16.c:1597: Draw_Combat_Main();
	call	_Draw_Combat_Main
;bank16.c:1599: while(joypad() & J_B)
00101$:
	call	_joypad
	bit	5, e
	jp	Z,_Combat
;bank16.c:1601: wait_vbl_done();
	call	_wait_vbl_done
;bank16.c:1604: Combat();
;bank16.c:1605: }
	jr	00101$
;bank16.c:1607: void Load_Step_Counter()
;	---------------------------------
; Function Load_Step_Counter
; ---------------------------------
_Load_Step_Counter::
;bank16.c:1609: initrand(Seed);
	ld	hl, #_Seed
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;bank16.c:1611: step_counter = rand() % 5 + 5;
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0005
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x05
	ld	(#_step_counter),a
;bank16.c:1612: }
	ret
;bank16.c:1614: void Check_Step_Counter()
;	---------------------------------
; Function Check_Step_Counter
; ---------------------------------
_Check_Step_Counter::
;bank16.c:1616: step_counter -= 1;
	ld	hl, #_step_counter
	ld	a, (hl)
	add	a, #0xff
;bank16.c:1618: if(step_counter == 0)
	ld	(hl), a
	or	a, a
	ret	NZ
;bank16.c:1620: Load_Step_Counter();
	call	_Load_Step_Counter
;bank16.c:1622: initrand(Seed);
	ld	hl, #_Seed
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;bank16.c:1624: encounter_value = rand() % 100 + 1;
	call	_rand
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0064
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	inc	a
	ld	(#_encounter_value),a
;bank16.c:1626: if(encounter_value <= encounter_rate)
	ld	a, (#_encounter_rate)
	ld	hl, #_encounter_value
	sub	a, (hl)
	ret	C
;bank16.c:1628: Load_Combat_Main();
;bank16.c:1631: }
	jp  _Load_Combat_Main
	.area _CODE_16
	.area _CABS (ABS)
