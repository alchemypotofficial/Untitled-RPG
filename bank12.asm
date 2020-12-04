;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank12
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Menu_Equip
	.globl _Menu_Equip
	.globl _Menu_Equip_Joypad
	.globl _Equip_Actor
	.globl _Equip_Equipment
	.globl _Refresh_Equip_Menu
	.globl _Refresh_Stat_Changes
	.globl _Compare_Stats
	.globl _Draw_Equip_Stats
	.globl _Refresh_Equip_List
	.globl _Draw_Equip_Pointer
	.globl _Draw_Equip_List
	.globl _Refresh_Equip_Cursors
	.globl _Draw_List_Slot
	.globl _Draw_Equip_Menu
	.globl _Draw_Equip_Slots
	.globl _Draw_Equipped
	.globl _Draw_Equip_Description_Large
	.globl _Draw_Equip_Description
	.globl _Draw_Actor_Equip
	.globl _Refresh_Actor_Stats
	.globl _Draw_Accessory_Slot
	.globl _Draw_Armor_Slot
	.globl _Draw_Secondary_Slot
	.globl _Draw_Weapon_Slot
	.globl _Draw_Equip_Class
	.globl _Draw_Equip
	.globl _Add_Equip
	.globl _Call_Play_Confirm
	.globl _Call_Play_Buzz
	.globl _Call_Draw_Name
	.globl _Call_Draw_Number
	.globl _Call_Load_Menu_Main
	.globl _Call_Menu_Main
	.globl _Get_Class
	.globl _Get_Equip
	.globl _Get_Actor
	.globl _set_win_map
	.globl _fade_in
	.globl _fade_out
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _accessory_title
	.globl _armor_title
	.globl _secondary_title
	.globl _weapon_title
	.globl _armor_name
	.globl _weapon_name
	.globl _none_name
	.globl _Equip_Minus
	.globl _Equip_Plus
	.globl _Equip_Cursor_Down
	.globl _Equip_Cursor_Up
	.globl _Equip_Border
	.globl _Equip_Background
	.globl _Equip_Pointer
	.globl _Wooden_Sword_Description
	.globl _Null_Equip_Description
	.globl _Map_Menu_ListPLN1
	.globl _Map_Menu_ListPLN0
	.globl _Map_Menu_EquipPLN1
	.globl _Map_Menu_EquipPLN0
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
	.area _CODE_12
;bank12.c:99: void Add_Equip(GameEquip* equip) //* Adds equip into equipment inventory.
;	---------------------------------
; Function Add_Equip
; ---------------------------------
_Add_Equip::
	add	sp, #-2
;bank12.c:101: if(equip->equip_type == weapon)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, (hl)
;bank12.c:107: equipment_weapon[i] = equip->equip_id;
;c
	ld	hl, #0x0006
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;bank12.c:101: if(equip->equip_type == weapon)
	ld	a, c
	dec	a
	jr	NZ, 00122$
;bank12.c:103: for(i = 0; i < 30; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00124$:
;bank12.c:105: if(equipment_weapon[i] == 0)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_weapon
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00125$
;bank12.c:107: equipment_weapon[i] = equip->equip_id;
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;bank12.c:108: return;
	jp	00132$
00125$:
;bank12.c:103: for(i = 0; i < 30; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9e
	jr	C, 00124$
	jp	00132$
00122$:
;bank12.c:112: else if(equip->equip_type == secondary)
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00119$
;bank12.c:114: for(i = 0; i < 30; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00126$:
;bank12.c:116: if(equipment_secondary[i] == 0)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_secondary
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00127$
;bank12.c:118: equipment_secondary[i] = equip->equip_id;
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;bank12.c:119: return;
	jr	00132$
00127$:
;bank12.c:114: for(i = 0; i < 30; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9e
	jr	C, 00126$
	jr	00132$
00119$:
;bank12.c:123: else if(equip->equip_type == armor)
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00116$
;bank12.c:125: for(i = 0; i < 30; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00128$:
;bank12.c:127: if(equipment_armor[i] == 0)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_armor
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00129$
;bank12.c:129: equipment_armor[i] = equip->equip_id;
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;bank12.c:130: return;
	jr	00132$
00129$:
;bank12.c:125: for(i = 0; i < 30; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9e
	jr	C, 00128$
	jr	00132$
00116$:
;bank12.c:134: else if(equip->equip_type == accessory)
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00132$
;bank12.c:136: for(i = 0; i < 30; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00130$:
;bank12.c:138: if(equipment_accessory[i] == 0)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_accessory
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00131$
;bank12.c:140: equipment_accessory[i] = equip->equip_id;
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;bank12.c:141: return;
	jr	00132$
00131$:
;bank12.c:136: for(i = 0; i < 30; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9e
	jr	C, 00130$
00132$:
;bank12.c:145: }
	add	sp, #2
	ret
_Map_Menu_EquipPLN0:
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
	.db #0x28	; 40
	.db #0x46	; 70	'F'
	.db #0x2c	; 44
	.db #0x55	; 85	'U'
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
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x2a	; 42
	.db #0x27	; 39
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
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1e	; 30
	.db #0x29	; 41
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
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x21	; 33
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
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
	.db #0x3e	; 62
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
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x47	; 71	'G'
	.db #0x55	; 85	'U'
	.db #0x3e	; 62
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
	.db #0x07	; 7
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
	.db #0x09	; 9
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
_Map_Menu_EquipPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_ListPLN0:
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
	.db #0x09	; 9
_Map_Menu_ListPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Null_Equip_Description:
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
_Wooden_Sword_Description:
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4c	; 76	'L'
	.db #0x5c	; 92
	.db #0x32	; 50	'2'
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x6e	; 110	'n'
	.db #0x45	; 69	'E'
	.db #0x48	; 72	'H'
	.db #0x4e	; 78	'N'
_Equip_Pointer:
	.db #0x0a	; 10
_Equip_Background:
	.db #0x01	; 1
_Equip_Border:
	.db #0x09	; 9
_Equip_Cursor_Up:
	.db #0x0b	; 11
_Equip_Cursor_Down:
	.db #0x0c	; 12
_Equip_Plus:
	.db #0x5c	; 92
_Equip_Minus:
	.db #0x57	; 87	'W'
_none_name:
	.db #0x48	; 72	'H'
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_weapon_name:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x25	; 37
	.db #0x55	; 85	'U'
_armor_name:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3b	; 59
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x24	; 36
	.db #0x27	; 39
_weapon_title:
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x25	; 37
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x01	; 1
_secondary_title:
	.db #0x4d	; 77	'M'
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x55	; 85	'U'
_armor_title:
	.db #0x01	; 1
	.db #0x3b	; 59
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x01	; 1
	.db #0x01	; 1
_accessory_title:
	.db #0x3b	; 59
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1a	; 26
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x24	; 36
	.db #0x55	; 85	'U'
;bank12.c:147: void Draw_Equip(UBYTE slot, unsigned char* name) //* Draws name of equip in specified slot.
;	---------------------------------
; Function Draw_Equip
; ---------------------------------
_Draw_Equip::
;bank12.c:149: switch(slot)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00103$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	ret
;bank12.c:151: case 0:
00101$:
;bank12.c:152: set_win_tiles(2, 14, 7, 1, name);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0e02
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:153: break;
	ret
;bank12.c:154: case 1:
00102$:
;bank12.c:155: set_win_tiles(11, 14, 7, 1, name);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0e0b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:156: break;
	ret
;bank12.c:157: case 2:
00103$:
;bank12.c:158: set_win_tiles(2, 16, 7, 1, name);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x1002
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:159: break;
	ret
;bank12.c:160: case 3:
00104$:
;bank12.c:161: set_win_tiles(11, 16, 7, 1, name);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x100b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:163: }
;bank12.c:164: }
	ret
;bank12.c:166: void Draw_Equip_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y) //* Draws name of class.
;	---------------------------------
; Function Draw_Equip_Class
; ---------------------------------
_Draw_Equip_Class::
;bank12.c:168: set_win_tiles(tile_x, tile_y, 3, 1, icon);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0103
	push	de
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank12.c:169: set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
	ldhl	sp,	#6
	ld	a, (hl)
	inc	a
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x03
	push	hl
	inc	sp
	ldhl	sp,	#11
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank12.c:170: }
	ret
;bank12.c:172: void Draw_Weapon_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_weapon" in specified equip slot.
;	---------------------------------
; Function Draw_Weapon_Slot
; ---------------------------------
_Draw_Weapon_Slot::
;bank12.c:174: Draw_Equip(equip_slot, Get_Equip(equipment_weapon[equipment_slot])->name);
	ld	bc, #_equipment_weapon+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Draw_Equip
	add	sp, #3
;bank12.c:175: }
	ret
;bank12.c:177: void Draw_Secondary_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_secondary" in specified equip slot.
;	---------------------------------
; Function Draw_Secondary_Slot
; ---------------------------------
_Draw_Secondary_Slot::
;bank12.c:179: Draw_Equip(equip_slot, Get_Equip(equipment_secondary[equipment_slot])->name);
	ld	bc, #_equipment_secondary+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Draw_Equip
	add	sp, #3
;bank12.c:180: }
	ret
;bank12.c:182: void Draw_Armor_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_armor" in specified equip slot.
;	---------------------------------
; Function Draw_Armor_Slot
; ---------------------------------
_Draw_Armor_Slot::
;bank12.c:184: Draw_Equip(equip_slot, Get_Equip(equipment_armor[equipment_slot])->name);
	ld	bc, #_equipment_armor+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Draw_Equip
	add	sp, #3
;bank12.c:185: }
	ret
;bank12.c:187: void Draw_Accessory_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_accesory" in specified equip slot.
;	---------------------------------
; Function Draw_Accessory_Slot
; ---------------------------------
_Draw_Accessory_Slot::
;bank12.c:189: Draw_Equip(equip_slot, Get_Equip(equipment_accessory[equipment_slot])->name);
	ld	bc, #_equipment_accessory+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Draw_Equip
	add	sp, #3
;bank12.c:190: }
	ret
;bank12.c:192: void Refresh_Actor_Stats(GameActor* actor) //* Draws actor's stats.
;	---------------------------------
; Function Refresh_Actor_Stats
; ---------------------------------
_Refresh_Actor_Stats::
	add	sp, #-12
;bank12.c:194: if(actor->level > 9){Call_Draw_Number(bank12, actor->level, 10, 1);}
	ldhl	sp,#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x09
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00102$
	push	bc
	ld	de, #0x010a
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
	jr	00103$
00102$:
;bank12.c:195: else{Call_Draw_Number(bank12, actor->level, 9, 1);}
	push	bc
	ld	de, #0x0109
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
00103$:
;bank12.c:197: Draw_Equip_Class(Get_Class(actor->class)->name, Get_Class(actor->class)->icon, 14, 1);
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Class
	inc	sp
	pop	bc
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Class
	inc	sp
	push	hl
	ldhl	sp,	#14
	ld	(hl), e
	ldhl	sp,	#15
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	ld	de, #0x010e
	push	de
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Equip_Class
	add	sp, #6
	pop	bc
;bank12.c:199: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength, 5, 4);
	ld	hl, #0x000f
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x001e
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ld	hl, #0x001f
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ld	hl, #0x0020
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ld	hl, #0x0021
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0405
	push	hl
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
;bank12.c:200: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom, 5, 6);
	ld	hl, #0x0011
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0605
	push	hl
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
;bank12.c:201: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will, 5, 8);
	ld	hl, #0x0013
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0805
	push	hl
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
;bank12.c:202: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def, 5, 10);
	ld	hl, #0x0017
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	hl, #0x0a05
	push	hl
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
	pop	bc
;bank12.c:203: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def, 5, 12);
	ld	hl, #0x0019
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0c05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:204: }
	add	sp, #12
	ret
;bank12.c:206: void Draw_Actor_Equip(UBYTE party_slot) //* Draws actor's name and stats.
;	---------------------------------
; Function Draw_Actor_Equip
; ---------------------------------
_Draw_Actor_Equip::
;bank12.c:208: set_win_map(0, 0, 20, 18, Map_Menu_EquipPLN1, Map_Menu_EquipPLN0);
	ld	hl, #_Map_Menu_EquipPLN0
	push	hl
	ld	hl, #_Map_Menu_EquipPLN1
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_map
	add	sp, #8
;bank12.c:210: if(party_slot == 0)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
;bank12.c:212: Call_Draw_Name(bank12, 2, 1, Get_Actor(party[0])->name, true);
	ld	a, (#_party + 0)
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
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	ld	de, #0x0102
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank12.c:214: Refresh_Actor_Stats(Get_Actor(party[0]));
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Refresh_Actor_Stats
	add	sp, #2
	ret
00110$:
;bank12.c:216: else if(party_slot == 1)
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00107$
;bank12.c:218: Call_Draw_Name(bank12, 2, 1, Get_Actor(party[1])->name, true);
	ld	a, (#(_party + 0x0001) + 0)
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
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	ld	de, #0x0102
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank12.c:220: Refresh_Actor_Stats(Get_Actor(party[1]));
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Refresh_Actor_Stats
	add	sp, #2
	ret
00107$:
;bank12.c:222: else if(party_slot == 2)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00104$
;bank12.c:224: Call_Draw_Name(bank12, 2, 1, Get_Actor(party[2])->name, true);
	ld	a, (#(_party + 0x0002) + 0)
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
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	ld	de, #0x0102
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank12.c:226: Refresh_Actor_Stats(Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Refresh_Actor_Stats
	add	sp, #2
	ret
00104$:
;bank12.c:228: else if(party_slot == 3)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	ret	NZ
;bank12.c:230: Call_Draw_Name(bank12, 2, 1, Get_Actor(party[3])->name, true);
	ld	a, (#(_party + 0x0003) + 0)
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
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	ld	de, #0x0102
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank12.c:232: Refresh_Actor_Stats(Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Refresh_Actor_Stats
	add	sp, #2
;bank12.c:234: }
	ret
;bank12.c:236: void Draw_Equip_Description(GameEquip* equip) //* Draws description of specified equip.
;	---------------------------------
; Function Draw_Equip_Description
; ---------------------------------
_Draw_Equip_Description::
;bank12.c:238: set_win_tiles(1, 15, 18, 2, equip->description);
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:239: }
	ret
;bank12.c:241: void Draw_Equip_Description_Large(GameEquip* equip)
;	---------------------------------
; Function Draw_Equip_Description_Large
; ---------------------------------
_Draw_Equip_Description_Large::
;bank12.c:243: set_win_tiles(1, 14, 18, 2, equip->description);
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0212
	push	de
	ld	de, #0x0e01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:244: }
	ret
;bank12.c:246: void Draw_Equipped(GameActor* actor) //* Draws actor's equipped equip.
;	---------------------------------
; Function Draw_Equipped
; ---------------------------------
_Draw_Equipped::
	add	sp, #-4
;bank12.c:248: set_win_tiles(12, 4, 7, 1, Get_Equip(actor->equipped[weapon_slot])->name);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), e
	ldhl	sp,	#7
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x040c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:249: set_win_tiles(11, 4, 1, 1, Get_Equip(actor->equipped[weapon_slot])->icon);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x040b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:250: if(actor->equipped[weapon_slot] == 0){set_win_tiles(12, 4, 7, 1, none_name);}
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #_none_name
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x040c
	push	de
	call	_set_win_tiles
	add	sp, #6
00102$:
;bank12.c:252: set_win_tiles(12, 6, 7, 1, Get_Equip(actor->equipped[secondary_slot])->name);
;c
	pop	de
	push	de
	ld	hl, #0x001f
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), e
	ldhl	sp,	#7
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x060c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:253: set_win_tiles(11, 6, 1, 1, Get_Equip(actor->equipped[secondary_slot])->icon);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x060b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:254: if(actor->equipped[secondary_slot] == 0){set_win_tiles(12, 6, 7, 1, none_name);}
	ld	a, (bc)
	or	a, a
	jr	NZ, 00104$
	ld	hl, #_none_name
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x060c
	push	de
	call	_set_win_tiles
	add	sp, #6
00104$:
;bank12.c:256: set_win_tiles(12, 8, 7, 1, Get_Equip(actor->equipped[armor_slot])->name);
;c
	pop	de
	push	de
	ld	hl, #0x0020
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), e
	ldhl	sp,	#7
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x080c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:257: set_win_tiles(11, 8, 1, 1, Get_Equip(actor->equipped[armor_slot])->icon);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x080b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:258: if(actor->equipped[armor_slot] == 0){set_win_tiles(12, 8, 7, 1, none_name);}
	ld	a, (bc)
	or	a, a
	jr	NZ, 00106$
	ld	hl, #_none_name
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x080c
	push	de
	call	_set_win_tiles
	add	sp, #6
00106$:
;bank12.c:260: set_win_tiles(12, 10, 7, 1, Get_Equip(actor->equipped[accessory_slot])->name);
;c
	pop	de
	push	de
	ld	hl, #0x0021
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), e
	ldhl	sp,	#7
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0a0c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:261: set_win_tiles(11, 10, 1, 1, Get_Equip(actor->equipped[accessory_slot])->icon);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a0b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:262: if(actor->equipped[accessory_slot] == 0){set_win_tiles(12, 10, 7, 1, none_name);}
	ld	a, (bc)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_none_name
	push	hl
	ld	de, #0x0107
	push	de
	ld	de, #0x0a0c
	push	de
	call	_set_win_tiles
	add	sp, #6
00109$:
;bank12.c:263: }
	add	sp, #4
	ret
;bank12.c:265: void Draw_Equip_Slots() //* Draws slot for equipment list.
;	---------------------------------
; Function Draw_Equip_Slots
; ---------------------------------
_Draw_Equip_Slots::
;bank12.c:267: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00102$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jr	Z, 00103$
	sub	a, #0x03
	jp	Z,00104$
	jp	00105$
;bank12.c:269: case weapon_slot:
00101$:
;bank12.c:270: set_win_tiles(6, 13, 8, 1, weapon_title);
	ld	hl, #_weapon_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x0d06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:271: Draw_Weapon_Slot(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:272: Draw_Weapon_Slot(1, 1);
	ld	de, #0x0101
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:273: Draw_Weapon_Slot(2, 2);
	ld	de, #0x0202
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:274: Draw_Weapon_Slot(3, 3);
	ld	de, #0x0303
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:275: break;
	ret
;bank12.c:276: case secondary_slot:
00102$:
;bank12.c:277: set_win_tiles(6, 13, 8, 1, secondary_title);
	ld	hl, #_secondary_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x0d06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:278: Draw_Secondary_Slot(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Secondary_Slot
	add	sp, #2
;bank12.c:279: Draw_Secondary_Slot(1, 1);
	ld	de, #0x0101
	push	de
	call	_Draw_Secondary_Slot
	add	sp, #2
;bank12.c:280: Draw_Secondary_Slot(2, 2);
	ld	de, #0x0202
	push	de
	call	_Draw_Secondary_Slot
	add	sp, #2
;bank12.c:281: Draw_Secondary_Slot(3, 3);
	ld	de, #0x0303
	push	de
	call	_Draw_Secondary_Slot
	add	sp, #2
;bank12.c:282: break;
	ret
;bank12.c:283: case armor_slot:
00103$:
;bank12.c:284: set_win_tiles(6, 13, 8, 1, armor_title);
	ld	hl, #_armor_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x0d06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:285: Draw_Armor_Slot(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Armor_Slot
	add	sp, #2
;bank12.c:286: Draw_Armor_Slot(1, 1);
	ld	de, #0x0101
	push	de
	call	_Draw_Armor_Slot
	add	sp, #2
;bank12.c:287: Draw_Armor_Slot(2, 2);
	ld	de, #0x0202
	push	de
	call	_Draw_Armor_Slot
	add	sp, #2
;bank12.c:288: Draw_Armor_Slot(3, 3);
	ld	de, #0x0303
	push	de
	call	_Draw_Armor_Slot
	add	sp, #2
;bank12.c:289: break;
	ret
;bank12.c:290: case accessory_slot:
00104$:
;bank12.c:291: set_win_tiles(6, 13, 8, 1, accessory_title);
	ld	hl, #_accessory_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x0d06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:292: Draw_Accessory_Slot(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Accessory_Slot
	add	sp, #2
;bank12.c:293: Draw_Accessory_Slot(1, 1);
	ld	de, #0x0101
	push	de
	call	_Draw_Accessory_Slot
	add	sp, #2
;bank12.c:294: Draw_Accessory_Slot(2, 2);
	ld	de, #0x0202
	push	de
	call	_Draw_Accessory_Slot
	add	sp, #2
;bank12.c:295: Draw_Accessory_Slot(3, 3);
	ld	de, #0x0303
	push	de
	call	_Draw_Accessory_Slot
	add	sp, #2
;bank12.c:296: break;
	ret
;bank12.c:297: default:
00105$:
;bank12.c:298: Draw_Weapon_Slot(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:299: Draw_Weapon_Slot(1, 1);
	ld	de, #0x0101
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:300: Draw_Weapon_Slot(2, 2);
	ld	de, #0x0202
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:301: Draw_Weapon_Slot(3, 3);
	ld	de, #0x0303
	push	de
	call	_Draw_Weapon_Slot
	add	sp, #2
;bank12.c:303: }
;bank12.c:304: }
	ret
;bank12.c:306: void Draw_Equip_Menu() //* Draws equip menu for "actor_y".
;	---------------------------------
; Function Draw_Equip_Menu
; ---------------------------------
_Draw_Equip_Menu::
;bank12.c:308: fade_out();
	call	_fade_out
;bank12.c:310: CurrentMenu = menu_equip;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x05
;bank12.c:311: selection_max = 4;
	ld	hl, #_selection_max
	ld	(hl), #0x04
;bank12.c:313: equip_y = 0;
	ld	hl, #_equip_y
	ld	(hl), #0x00
;bank12.c:315: Draw_Actor_Equip(actor_y);
	ld	a, (#_actor_y)
	push	af
	inc	sp
	call	_Draw_Actor_Equip
	inc	sp
;bank12.c:317: Draw_Equipped(Get_Actor(party[actor_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	call	_Draw_Equipped
	add	sp, #2
;bank12.c:319: set_win_tiles(10, 4, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x040a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:321: Draw_Equip_Description(Get_Equip(Get_Actor(party[actor_y])->equipped[0]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:323: fade_in();
;bank12.c:324: }
	jp  _fade_in
;bank12.c:326: void Draw_List_Slot(GameEquip* equip, UBYTE slot) //* Draws slots of equipment list.
;	---------------------------------
; Function Draw_List_Slot
; ---------------------------------
_Draw_List_Slot::
	add	sp, #-2
;bank12.c:331: set_win_tiles(12, 6, 7, 1, equip->name);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;bank12.c:332: set_win_tiles(11, 6, 1, 1, equip->icon);
	ld	hl, #0x0002
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;bank12.c:328: switch(slot)
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00103$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00104$
	jp	00107$
;bank12.c:330: case 0:
00101$:
;bank12.c:331: set_win_tiles(12, 6, 7, 1, equip->name);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x060c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:332: set_win_tiles(11, 6, 1, 1, equip->icon);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x060b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:333: break;
	jr	00107$
;bank12.c:334: case 1:
00102$:
;bank12.c:335: set_win_tiles(12, 8, 7, 1, equip->name);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x080c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:336: set_win_tiles(11, 8, 1, 1, equip->icon);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x080b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:337: break;
	jr	00107$
;bank12.c:338: case 2:
00103$:
;bank12.c:339: set_win_tiles(12, 10, 7, 1, equip->name);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x0a0c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:340: set_win_tiles(11, 10, 1, 1, equip->icon);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a0b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:341: break;
	jr	00107$
;bank12.c:342: case 3:
00104$:
;bank12.c:343: set_win_tiles(12, 12, 7, 1, equip->name);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0107
	push	de
	ld	de, #0x0c0c
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:344: set_win_tiles(11, 12, 1, 1, equip->icon);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0c0b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:348: }
00107$:
;bank12.c:349: }
	add	sp, #2
	ret
;bank12.c:351: void Refresh_Equip_Cursors() //* Draws list cursors. 
;	---------------------------------
; Function Refresh_Equip_Cursors
; ---------------------------------
_Refresh_Equip_Cursors::
;bank12.c:353: if(CurrentEquipSelection > 0)
	ld	a, (#_CurrentEquipSelection)
	or	a, a
	jr	Z, 00102$
;bank12.c:355: set_win_tiles(19, 4, 1, 1, Equip_Cursor_Up);
	ld	hl, #_Equip_Cursor_Up
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0413
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00103$
00102$:
;bank12.c:359: set_win_tiles(19, 4, 1, 1, Equip_Border);
	ld	hl, #_Equip_Border
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0413
	push	de
	call	_set_win_tiles
	add	sp, #6
00103$:
;bank12.c:362: if(CurrentEquipSelection < 26)
	ld	a, (#_CurrentEquipSelection)
	sub	a, #0x1a
	jr	NC, 00105$
;bank12.c:364: set_win_tiles(19, 12, 1, 1, Equip_Cursor_Down);
	ld	hl, #_Equip_Cursor_Down
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c13
	push	de
	call	_set_win_tiles
	add	sp, #6
	ret
00105$:
;bank12.c:368: set_win_tiles(19, 12, 1, 1, Equip_Border);
	ld	hl, #_Equip_Border
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c13
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:370: }
	ret
;bank12.c:372: void Draw_Equip_List(UBYTE equip_type) //* Draws specified equipment list.
;	---------------------------------
; Function Draw_Equip_List
; ---------------------------------
_Draw_Equip_List::
;bank12.c:374: set_win_tiles(10, 3, 10, 11, Map_Menu_ListPLN0);
	ld	hl, #_Map_Menu_ListPLN0
	push	hl
	ld	de, #0x0b0a
	push	de
	ld	de, #0x030a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:376: switch(equip_type)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00103$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00104$
	jp	00106$
;bank12.c:378: case 0:
00101$:
;bank12.c:379: set_win_tiles(10, 4, 8, 1, weapon_title);
	ld	hl, #_weapon_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x040a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:381: Draw_List_Slot(Get_Equip(equipment_weapon[0]), 0);
	ld	a, (#_equipment_weapon + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:382: Draw_List_Slot(Get_Equip(equipment_weapon[1]), 1);
	ld	a, (#(_equipment_weapon + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:383: Draw_List_Slot(Get_Equip(equipment_weapon[2]), 2);
	ld	a, (#(_equipment_weapon + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:384: Draw_List_Slot(Get_Equip(equipment_weapon[3]), 3);
	ld	a, (#(_equipment_weapon + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:385: break;
	jp	00106$
;bank12.c:386: case 1:
00102$:
;bank12.c:387: set_win_tiles(11, 4, 8, 1, secondary_title);
	ld	hl, #_secondary_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x040b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:389: Draw_List_Slot(Get_Equip(equipment_secondary[0]), 0);
	ld	a, (#_equipment_secondary + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:390: Draw_List_Slot(Get_Equip(equipment_secondary[1]), 1);
	ld	a, (#(_equipment_secondary + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:391: Draw_List_Slot(Get_Equip(equipment_secondary[2]), 2);
	ld	a, (#(_equipment_secondary + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:392: Draw_List_Slot(Get_Equip(equipment_secondary[3]), 3);
	ld	a, (#(_equipment_secondary + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:393: break;
	jp	00106$
;bank12.c:394: case 2:
00103$:
;bank12.c:395: set_win_tiles(10, 4, 8, 1, armor_title);
	ld	hl, #_armor_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x040a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:397: Draw_List_Slot(Get_Equip(equipment_armor[0]), 0);
	ld	a, (#_equipment_armor + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:398: Draw_List_Slot(Get_Equip(equipment_armor[1]), 1);
	ld	a, (#(_equipment_armor + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:399: Draw_List_Slot(Get_Equip(equipment_armor[2]), 2);
	ld	a, (#(_equipment_armor + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:400: Draw_List_Slot(Get_Equip(equipment_armor[3]), 3);
	ld	a, (#(_equipment_armor + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:401: break;
	jr	00106$
;bank12.c:402: case 3:
00104$:
;bank12.c:403: set_win_tiles(11, 4, 8, 1, accessory_title);
	ld	hl, #_accessory_title
	push	hl
	ld	de, #0x0108
	push	de
	ld	de, #0x040b
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:405: Draw_List_Slot(Get_Equip(equipment_accessory[0]), 0);
	ld	a, (#_equipment_accessory + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:406: Draw_List_Slot(Get_Equip(equipment_accessory[1]), 1);
	ld	a, (#(_equipment_accessory + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:407: Draw_List_Slot(Get_Equip(equipment_accessory[2]), 2);
	ld	a, (#(_equipment_accessory + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:408: Draw_List_Slot(Get_Equip(equipment_accessory[3]), 3);
	ld	a, (#(_equipment_accessory + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:412: }
00106$:
;bank12.c:414: set_win_tiles(10, 6, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x060a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:416: Refresh_Equip_Cursors();
;bank12.c:417: }
	jp  _Refresh_Equip_Cursors
;bank12.c:419: void Draw_Equip_Pointer() //* Draws pointer for selected actor's equipped.
;	---------------------------------
; Function Draw_Equip_Pointer
; ---------------------------------
_Draw_Equip_Pointer::
;bank12.c:421: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00102$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jr	Z, 00103$
	sub	a, #0x03
	jr	Z, 00104$
	ret
;bank12.c:423: case 0:
00101$:
;bank12.c:424: set_win_tiles(10, 4, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x040a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:425: break;
	ret
;bank12.c:426: case 1:
00102$:
;bank12.c:427: set_win_tiles(10, 6, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x060a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:428: break;
	ret
;bank12.c:429: case 2:
00103$:
;bank12.c:430: set_win_tiles(10, 8, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x080a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:431: break;
	ret
;bank12.c:432: case 3:
00104$:
;bank12.c:433: set_win_tiles(10, 10, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a0a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:437: }
;bank12.c:438: }
	ret
;bank12.c:440: void Refresh_Equip_List() //* Draws equipment list using "CurrentEquipSelection".
;	---------------------------------
; Function Refresh_Equip_List
; ---------------------------------
_Refresh_Equip_List::
;bank12.c:442: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_equip_y)
	dec	a
	jp	Z,00102$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jp	Z,00103$
	sub	a, #0x03
	jp	Z,00104$
	ret
;bank12.c:444: case 0:
00101$:
;bank12.c:445: Draw_List_Slot(Get_Equip(equipment_weapon[0 + CurrentEquipSelection]), 0);
	ld	a, #<(_equipment_weapon)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_equipment_weapon)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:446: Draw_List_Slot(Get_Equip(equipment_weapon[1 + CurrentEquipSelection]), 1);
	ld	a, (#_CurrentEquipSelection)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_weapon
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:447: Draw_List_Slot(Get_Equip(equipment_weapon[2 + CurrentEquipSelection]), 2);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_weapon
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:448: Draw_List_Slot(Get_Equip(equipment_weapon[3 + CurrentEquipSelection]), 3);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_weapon
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:449: break;
	ret
;bank12.c:450: case 1:
00102$:
;bank12.c:451: Draw_List_Slot(Get_Equip(equipment_secondary[0 + CurrentEquipSelection]), 0);
	ld	a, #<(_equipment_secondary)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_equipment_secondary)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:452: Draw_List_Slot(Get_Equip(equipment_secondary[1 + CurrentEquipSelection]), 1);
	ld	a, (#_CurrentEquipSelection)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_secondary
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:453: Draw_List_Slot(Get_Equip(equipment_secondary[2 + CurrentEquipSelection]), 2);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_secondary
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:454: Draw_List_Slot(Get_Equip(equipment_secondary[3 + CurrentEquipSelection]), 3);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_secondary
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:455: break;
	ret
;bank12.c:456: case 2:
00103$:
;bank12.c:457: Draw_List_Slot(Get_Equip(equipment_armor[0 + CurrentEquipSelection]), 0);
	ld	a, #<(_equipment_armor)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_equipment_armor)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:458: Draw_List_Slot(Get_Equip(equipment_armor[1 + CurrentEquipSelection]), 1);
	ld	a, (#_CurrentEquipSelection)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_armor
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:459: Draw_List_Slot(Get_Equip(equipment_armor[2 + CurrentEquipSelection]), 2);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_armor
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:460: Draw_List_Slot(Get_Equip(equipment_armor[3 + CurrentEquipSelection]), 3);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_armor
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:461: break;
	ret
;bank12.c:462: case 3:
00104$:
;bank12.c:463: Draw_List_Slot(Get_Equip(equipment_accessory[0 + CurrentEquipSelection]), 0);
	ld	a, #<(_equipment_accessory)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_equipment_accessory)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:464: Draw_List_Slot(Get_Equip(equipment_accessory[1 + CurrentEquipSelection]), 1);
	ld	a, (#_CurrentEquipSelection)
	inc	a
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_accessory
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:465: Draw_List_Slot(Get_Equip(equipment_accessory[2 + CurrentEquipSelection]), 2);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x02
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_accessory
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:466: Draw_List_Slot(Get_Equip(equipment_accessory[3 + CurrentEquipSelection]), 3);
	ld	a, (#_CurrentEquipSelection)
	add	a, #0x03
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_equipment_accessory
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	call	_Draw_List_Slot
	add	sp, #3
;bank12.c:470: }
;bank12.c:471: }
	ret
;bank12.c:473: void Draw_Equip_Stats(GameActor* actor, GameEquip* equip, UBYTE equipment_slot) //* Draws stat differences between currently equipped equip and selected equip.
;	---------------------------------
; Function Draw_Equip_Stats
; ---------------------------------
_Draw_Equip_Stats::
	add	sp, #-28
;bank12.c:478: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
	ldhl	sp,#30
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#28
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#27
	ld	(hl), a
	ld	hl, #0x001f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #0x0020
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #0x0021
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	push	de
;c
	ld	hl, #0x0009
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;bank12.c:479: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
	ld	hl, #0x0011
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	push	de
;c
	ld	hl, #0x000a
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
;bank12.c:480: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
	ld	hl, #0x0013
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	push	de
;c
	ld	hl, #0x000b
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl), a
;bank12.c:481: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
	ld	hl, #0x0017
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl), a
	push	de
;c
	ld	hl, #0x000e
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl), a
;bank12.c:482: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
	ld	hl, #0x0019
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl), a
;c
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#26
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#25
	ld	(hl), a
;bank12.c:475: switch(equipment_slot)
	ldhl	sp,	#34
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
;bank12.c:485: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
	ld	hl, #0x001e
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;bank12.c:475: switch(equipment_slot)
	ldhl	sp,	#34
	ld	a, (hl)
	dec	a
	jp	Z,00102$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00103$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00104$
	jp	00107$
;bank12.c:477: case weapon_slot:
00101$:
;bank12.c:478: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0009
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0405
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:479: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0605
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:480: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0805
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:481: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0a05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:482: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0c05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:483: break;
	jp	00107$
;bank12.c:484: case secondary_slot:
00102$:
;bank12.c:485: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0405
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:486: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0605
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:487: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0805
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:488: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0a05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:489: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0c05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:490: break;
	jp	00107$
;bank12.c:491: case armor_slot:
00103$:
;bank12.c:492: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0405
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:493: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0605
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:494: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0805
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:495: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0a05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:496: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0c05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:497: break;
	jp	00107$
;bank12.c:498: case accessory_slot:
00104$:
;bank12.c:499: Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + equip->strength, 5, 4);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0405
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:500: Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + equip->wisdom, 5, 6);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0605
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:501: Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + equip->will, 5, 8);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0805
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:502: Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + equip->phys_def, 5, 10);
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0a05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:503: Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + equip->magic_def, 5, 12);
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0c05
	push	de
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Draw_Number
	add	sp, #5
;bank12.c:507: }
00107$:
;bank12.c:508: }
	add	sp, #28
	ret
;bank12.c:510: void Compare_Stats(GameEquip* equip_1, GameEquip* equip_2) //* Compares stat differences between currently equipped equip and selected equip.
;	---------------------------------
; Function Compare_Stats
; ---------------------------------
_Compare_Stats::
	add	sp, #-3
;bank12.c:512: if(equip_1->strength > equip_2->strength)
	ldhl	sp,#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00105$
;bank12.c:514: set_win_tiles(6, 4, 1, 1, Equip_Plus);
	ld	hl, #_Equip_Plus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0406
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00106$
00105$:
;bank12.c:516: else if(equip_1->strength < equip_2->strength)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NC, 00102$
;bank12.c:518: set_win_tiles(6, 4, 1, 1, Equip_Minus);
	ld	hl, #_Equip_Minus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0406
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00106$
00102$:
;bank12.c:522: set_win_tiles(6, 4, 1, 1, Equip_Background);
	ld	hl, #_Equip_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0406
	push	de
	call	_set_win_tiles
	add	sp, #6
00106$:
;bank12.c:525: if(equip_1->wisdom > equip_2->wisdom)
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00111$
;bank12.c:527: set_win_tiles(6, 6, 1, 1, Equip_Plus);
	ld	hl, #_Equip_Plus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0606
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00112$
00111$:
;bank12.c:529: else if(equip_1->wisdom < equip_2->wisdom)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NC, 00108$
;bank12.c:531: set_win_tiles(6, 6, 1, 1, Equip_Minus);
	ld	hl, #_Equip_Minus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0606
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00112$
00108$:
;bank12.c:535: set_win_tiles(6, 6, 1, 1, Equip_Background);
	ld	hl, #_Equip_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0606
	push	de
	call	_set_win_tiles
	add	sp, #6
00112$:
;bank12.c:538: if(equip_1->will > equip_2->will)
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00117$
;bank12.c:540: set_win_tiles(6, 8, 1, 1, Equip_Plus);
	ld	hl, #_Equip_Plus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0806
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00118$
00117$:
;bank12.c:542: else if(equip_1->will < equip_2->will)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NC, 00114$
;bank12.c:544: set_win_tiles(6, 8, 1, 1, Equip_Minus);
	ld	hl, #_Equip_Minus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0806
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00118$
00114$:
;bank12.c:548: set_win_tiles(6, 8, 1, 1, Equip_Background);
	ld	hl, #_Equip_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0806
	push	de
	call	_set_win_tiles
	add	sp, #6
00118$:
;bank12.c:551: if(equip_1->phys_def > equip_2->phys_def)
	ld	hl, #0x000e
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x000e
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00123$
;bank12.c:553: set_win_tiles(6, 10, 1, 1, Equip_Plus);
	ld	hl, #_Equip_Plus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a06
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00124$
00123$:
;bank12.c:555: else if(equip_1->phys_def < equip_2->phys_def)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NC, 00120$
;bank12.c:557: set_win_tiles(6, 10, 1, 1, Equip_Minus);
	ld	hl, #_Equip_Minus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a06
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00124$
00120$:
;bank12.c:561: set_win_tiles(6, 10, 1, 1, Equip_Background);
	ld	hl, #_Equip_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a06
	push	de
	call	_set_win_tiles
	add	sp, #6
00124$:
;bank12.c:564: if(equip_1->magic_def > equip_2->magic_def)
	ld	hl, #0x000f
	add	hl, bc
	ld	c, (hl)
;c
	pop	de
	push	de
	ld	hl, #0x000f
	add	hl, de
	ld	b, (hl)
	ld	a, b
	sub	a, c
	jr	NC, 00129$
;bank12.c:566: set_win_tiles(6, 12, 1, 1, Equip_Plus);
	ld	hl, #_Equip_Plus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c06
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00131$
00129$:
;bank12.c:568: else if(equip_1->magic_def < equip_2->magic_def)
	ld	a, c
	sub	a, b
	jr	NC, 00126$
;bank12.c:570: set_win_tiles(6, 12, 1, 1, Equip_Minus);
	ld	hl, #_Equip_Minus
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c06
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00131$
00126$:
;bank12.c:574: set_win_tiles(6, 12, 1, 1, Equip_Background);
	ld	hl, #_Equip_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c06
	push	de
	call	_set_win_tiles
	add	sp, #6
00131$:
;bank12.c:576: }
	add	sp, #3
	ret
;bank12.c:578: void Refresh_Stat_Changes() //* Refreshes actor stats to display stat changes and compares the change.
;	---------------------------------
; Function Refresh_Stat_Changes
; ---------------------------------
_Refresh_Stat_Changes::
;bank12.c:583: Draw_Equip_Stats(Get_Actor(party[actor_y]), Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]), weapon_slot);
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
;bank12.c:580: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00102$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jp	Z,00103$
	sub	a, #0x03
	jp	Z,00104$
	ret
;bank12.c:582: case weapon_slot:
00101$:
;bank12.c:583: Draw_Equip_Stats(Get_Actor(party[actor_y]), Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]), weapon_slot);
	ld	hl, #_equipment_weapon
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	xor	a, a
	push	af
	inc	sp
	push	bc
	push	de
	call	_Draw_Equip_Stats
	add	sp, #5
;bank12.c:585: Compare_Stats(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]), Get_Equip(Get_Actor(party[actor_y])->equipped[weapon_slot]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_weapon)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_equipment_weapon)
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Compare_Stats
	add	sp, #4
;bank12.c:586: break;
	ret
;bank12.c:587: case secondary_slot:
00102$:
;bank12.c:588: Draw_Equip_Stats(Get_Actor(party[actor_y]), Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]), secondary_slot);
	ld	hl, #_equipment_secondary
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	push	de
	call	_Draw_Equip_Stats
	add	sp, #5
;bank12.c:590: Compare_Stats(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]), Get_Equip(Get_Actor(party[actor_y])->equipped[secondary_slot]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl,#0x001e+1
	add	hl,de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_secondary)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_equipment_secondary)
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Compare_Stats
	add	sp, #4
;bank12.c:591: break;
	ret
;bank12.c:592: case armor_slot:
00103$:
;bank12.c:593: Draw_Equip_Stats(Get_Actor(party[actor_y]), Get_Equip(equipment_armor[list_y + CurrentEquipSelection]), armor_slot);
	ld	hl, #_equipment_armor
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	a, #0x02
	push	af
	inc	sp
	push	bc
	push	de
	call	_Draw_Equip_Stats
	add	sp, #5
;bank12.c:595: Compare_Stats(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]), Get_Equip(Get_Actor(party[actor_y])->equipped[armor_slot]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl,#0x001e+1+1
	add	hl,de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_armor)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_equipment_armor)
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Compare_Stats
	add	sp, #4
;bank12.c:596: break;
	ret
;bank12.c:597: case accessory_slot:
00104$:
;bank12.c:598: Draw_Equip_Stats(Get_Actor(party[actor_y]), Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]), accessory_slot);
	ld	hl, #_equipment_accessory
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	a, #0x03
	push	af
	inc	sp
	push	bc
	push	de
	call	_Draw_Equip_Stats
	add	sp, #5
;bank12.c:600: Compare_Stats(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]), Get_Equip(Get_Actor(party[actor_y])->equipped[accessory_slot]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl,#0x001e+1+1+1
	add	hl,de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_accessory)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_equipment_accessory)
	ld	d, a
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Compare_Stats
	add	sp, #4
;bank12.c:604: }
;bank12.c:605: }
	ret
;bank12.c:607: void Refresh_Equip_Menu() //* Redraws actor's equipped equip and pointer.
;	---------------------------------
; Function Refresh_Equip_Menu
; ---------------------------------
_Refresh_Equip_Menu::
;bank12.c:609: set_win_tiles(10, 3, 10, 11, Map_Menu_ListPLN0);
	ld	hl, #_Map_Menu_ListPLN0
	push	hl
	ld	de, #0x0b0a
	push	de
	ld	de, #0x030a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:611: Draw_Equipped(Get_Actor(party[actor_y]));
	ld	bc, #_party+0
	ld	a, c
	ld	hl, #_actor_y
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Equipped
	add	sp, #2
;bank12.c:613: Draw_Equip_Pointer();
;bank12.c:614: }
	jp  _Draw_Equip_Pointer
;bank12.c:616: void Equip_Equipment(GameActor* actor, GameEquip* equip) //* Equips specified actor with specified equip.
;	---------------------------------
; Function Equip_Equipment
; ---------------------------------
_Equip_Equipment::
	add	sp, #-7
;bank12.c:618: switch(equip->equip_type)
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
;bank12.c:621: Add_Equip(Get_Equip(actor->equipped[weapon_slot]));
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), e
;bank12.c:623: actor->equipped[weapon_slot] = equip->equip_id;
;c
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;bank12.c:618: switch(equip->equip_type)
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00103$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jp	Z,00104$
	jp	00107$
;bank12.c:620: case weapon:
00101$:
;bank12.c:621: Add_Equip(Get_Equip(actor->equipped[weapon_slot]));
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Add_Equip
	add	sp, #2
	pop	bc
;bank12.c:623: actor->equipped[weapon_slot] = equip->equip_id;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(bc), a
;bank12.c:624: actor->class = equip->class_type;
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
;c
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;bank12.c:625: break;
	jp	00107$
;bank12.c:626: case secondary:
00102$:
;bank12.c:627: Add_Equip(Get_Equip(actor->equipped[secondary_slot]));
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001f
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
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Add_Equip
	add	sp, #2
;bank12.c:629: actor->equipped[secondary_slot] = equip->equip_id;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;bank12.c:630: break;
	jr	00107$
;bank12.c:631: case armor:
00103$:
;bank12.c:632: Add_Equip(Get_Equip(actor->equipped[armor_slot]));
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
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
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Add_Equip
	add	sp, #2
;bank12.c:634: actor->equipped[armor_slot] = equip->equip_id;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;bank12.c:635: break;
	jr	00107$
;bank12.c:636: case accessory:
00104$:
;bank12.c:637: Add_Equip(Get_Equip(actor->equipped[accessory_slot]));
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
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
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Add_Equip
	add	sp, #2
;bank12.c:639: actor->equipped[accessory_slot] = equip->equip_id;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;bank12.c:643: }
00107$:
;bank12.c:644: }
	add	sp, #7
	ret
;bank12.c:646: void Equip_Actor(GameActor* actor) //* Equips specified actor with equip selected with "list_y + CurrentEquipSelection".
;	---------------------------------
; Function Equip_Actor
; ---------------------------------
_Equip_Actor::
	add	sp, #-7
;bank12.c:651: held_equip = actor->equipped[weapon_slot];
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), e
;bank12.c:653: actor->equipped[weapon_slot] = Get_Equip(equipment_weapon[list_y + CurrentEquipSelection])->equip_id;
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;bank12.c:648: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_equip_y)
	dec	a
	jp	Z,00102$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jp	Z,00103$
	sub	a, #0x03
	jp	Z,00104$
	jp	00106$
;bank12.c:650: case weapon_slot:
00101$:
;bank12.c:651: held_equip = actor->equipped[weapon_slot];
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_held_equip),a
;bank12.c:653: actor->equipped[weapon_slot] = Get_Equip(equipment_weapon[list_y + CurrentEquipSelection])->equip_id;
;c
	ld	de, #_equipment_weapon
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;bank12.c:655: actor->class = Get_Equip(equipment_weapon[list_y + CurrentEquipSelection])->class_type;
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_weapon)
	ld	c, a
	ld	a, #0x00
	adc	a, #>(_equipment_weapon)
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#3
	ld	(hl), e
	ldhl	sp,	#4
	ld	(hl), d
	pop	hl
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	hl
	ld	a, (hl)
	ld	(de), a
;bank12.c:657: equipment_weapon[list_y + CurrentEquipSelection] = held_equip;
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	add	a, #<(_equipment_weapon)
	ld	c, a
	ld	a, #0x00
	adc	a, #>(_equipment_weapon)
	ld	b, a
	ld	a, (#_held_equip)
	ld	(bc), a
;bank12.c:658: break;
	jp	00106$
;bank12.c:659: case secondary_slot:
00102$:
;bank12.c:660: held_equip = actor->equipped[secondary_slot];
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001f
	add	hl, de
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
	ld	(#_held_equip),a
;bank12.c:662: actor->equipped[secondary_slot] = Get_Equip(equipment_secondary[list_y + CurrentEquipSelection])->equip_id;
;c
	ld	de, #_equipment_secondary
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	inc	sp
	inc	sp
	push	de
;c
	pop	de
	push	de
	ld	hl, #0x0006
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
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;bank12.c:664: equipment_secondary[list_y + CurrentEquipSelection] = held_equip;
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;c
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_equipment_secondary
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_held_equip)
	ld	(bc), a
;bank12.c:665: break;
	jp	00106$
;bank12.c:666: case armor_slot:
00103$:
;bank12.c:667: held_equip = actor->equipped[armor_slot];
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
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
	ld	(#_held_equip),a
;bank12.c:669: actor->equipped[armor_slot] = Get_Equip(equipment_armor[list_y + CurrentEquipSelection])->equip_id;
;c
	ld	de, #_equipment_armor
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	inc	sp
	inc	sp
	push	de
;c
	pop	de
	push	de
	ld	hl, #0x0006
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
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;bank12.c:671: equipment_armor[list_y + CurrentEquipSelection] = held_equip;
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;c
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_equipment_armor
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_held_equip)
	ld	(bc), a
;bank12.c:672: break;
	jr	00106$
;bank12.c:673: case accessory_slot:
00104$:
;bank12.c:674: held_equip = actor->equipped[accessory_slot];
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(#_held_equip),a
;bank12.c:676: actor->equipped[accessory_slot] = Get_Equip(equipment_accessory[list_y + CurrentEquipSelection])->equip_id;
;c
	ld	de, #_equipment_accessory
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	hl
	ldhl	sp,	#3
	ld	(hl), e
	ldhl	sp,	#4
	ld	(hl), d
	pop	hl
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank12.c:678: equipment_accessory[list_y + CurrentEquipSelection] = held_equip;
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;c
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_equipment_accessory
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (#_held_equip)
	ld	(de), a
;bank12.c:682: }
00106$:
;bank12.c:684: Refresh_Actor_Stats(actor);
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Refresh_Actor_Stats
	add	sp, #2
;bank12.c:685: }
	add	sp, #7
	ret
;bank12.c:687: void Menu_Equip_Joypad() //* Joypad handler for equip menu.
;	---------------------------------
; Function Menu_Equip_Joypad
; ---------------------------------
_Menu_Equip_Joypad::
	add	sp, #-2
;bank12.c:689: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank12.c:691: if(Joy & J_UP)
	bit	2, (hl)
	jp	Z,00133$
;bank12.c:693: if(CurrentMenu == menu_equip)
	ld	a, (#_CurrentMenu)
	sub	a, #0x05
	jr	NZ, 00130$
;bank12.c:695: if(equip_y > 0)
	ld	hl, #_equip_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;bank12.c:697: set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
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
	call	_set_win_tiles
	add	sp, #6
;bank12.c:699: equip_y -= 1;
	ld	hl, #_equip_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank12.c:701: set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Pointer);
	ld	bc, #_Equip_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
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
	call	_set_win_tiles
	add	sp, #6
00102$:
;bank12.c:704: Draw_Equip_Description(Get_Equip(Get_Actor(party[actor_y])->equipped[equip_y]));
	ld	bc, #_party+0
	ld	a, c
	ld	hl, #_actor_y
	add	a, (hl)
	ld	c, a
	jr	NC, 00468$
	inc	b
00468$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_equip_y
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:706: while(joypad() & J_UP)
00103$:
	call	_joypad
	bit	2, e
	jp	Z,00133$
;bank12.c:708: wait_vbl_done();
	call	_wait_vbl_done
	jr	00103$
00130$:
;bank12.c:711: else if(CurrentMenu == menu_equip_list)
	ld	a, (#_CurrentMenu)
	sub	a, #0x06
	jp	NZ,00127$
;bank12.c:713: if(list_y > 0)
	ld	hl, #_list_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;bank12.c:715: set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x06
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
	call	_set_win_tiles
	add	sp, #6
;bank12.c:717: list_y -= 1;
	ld	hl, #_list_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank12.c:719: set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Pointer);
	ld	bc, #_Equip_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x06
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
	call	_set_win_tiles
	add	sp, #6
	jr	00111$
00110$:
;bank12.c:721: else if(CurrentEquipSelection > 0)
	ld	hl, #_CurrentEquipSelection
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
;bank12.c:723: CurrentEquipSelection -= 1;
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank12.c:725: Refresh_Equip_List();
	call	_Refresh_Equip_List
	jr	00111$
00107$:
;bank12.c:729: Call_Play_Buzz(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00111$:
;bank12.c:735: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
;bank12.c:732: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00112$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00113$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jr	Z, 00114$
	sub	a, #0x03
	jr	Z, 00115$
	jr	00117$
;bank12.c:734: case weapon_slot:
00112$:
;bank12.c:735: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_weapon+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:736: break;
	jr	00117$
;bank12.c:737: case secondary_slot:
00113$:
;bank12.c:738: Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_secondary+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:739: break;
	jr	00117$
;bank12.c:740: case armor_slot:
00114$:
;bank12.c:741: Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_armor+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:742: break;
	jr	00117$
;bank12.c:743: case accessory_slot:
00115$:
;bank12.c:744: Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_accessory+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:748: }
00117$:
;bank12.c:750: Refresh_Stat_Changes();
	call	_Refresh_Stat_Changes
;bank12.c:752: Refresh_Equip_Cursors();
	call	_Refresh_Equip_Cursors
;bank12.c:754: while(joypad() & J_UP)
00118$:
	call	_joypad
	bit	2, e
	jr	Z, 00133$
;bank12.c:756: wait_vbl_done();
	call	_wait_vbl_done
	jr	00118$
00127$:
;bank12.c:761: if(actor_y > 0)
	ld	hl, #_actor_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
;bank12.c:763: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x02
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:765: actor_y -= 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank12.c:767: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Pointer);
	ld	bc, #_Equip_Pointer+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x02
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:770: while(joypad() & J_UP)
00123$:
	call	_joypad
	bit	2, e
	jr	Z, 00133$
;bank12.c:772: wait_vbl_done();
	call	_wait_vbl_done
	jr	00123$
00133$:
;bank12.c:777: if(Joy & J_DOWN)
	ld	a, (#_Joy)
	bit	3, a
	jp	Z,00166$
;bank12.c:779: if(CurrentMenu == menu_equip)
	ld	a, (#_CurrentMenu)
	sub	a, #0x05
	jp	NZ,00163$
;bank12.c:781: if(equip_y < selection_max - 1)
	ld	hl, #_selection_max
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a, (#_equip_y)
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
	jr	Z, 00481$
	bit	7, d
	jr	NZ, 00482$
	cp	a, a
	jr	00482$
00481$:
	bit	7, d
	jr	Z, 00482$
	scf
00482$:
	jr	NC, 00135$
;bank12.c:783: set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	ld	hl, #_equip_y
	ld	a, (hl)
	add	a, a
	add	a, #0x04
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
	call	_set_win_tiles
	add	sp, #6
;bank12.c:785: equip_y += 1;
	ld	hl, #_equip_y
	inc	(hl)
;bank12.c:787: set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Pointer);
	ld	bc, #_Equip_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
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
	call	_set_win_tiles
	add	sp, #6
00135$:
;bank12.c:790: Draw_Equip_Description(Get_Equip(Get_Actor(party[actor_y])->equipped[equip_y]));
	ld	bc, #_party+0
	ld	a, c
	ld	hl, #_actor_y
	add	a, (hl)
	ld	c, a
	jr	NC, 00483$
	inc	b
00483$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_equip_y
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:792: while(joypad() & J_DOWN)
00136$:
	call	_joypad
	bit	3, e
	jp	Z,00166$
;bank12.c:794: wait_vbl_done();
	call	_wait_vbl_done
	jr	00136$
00163$:
;bank12.c:797: else if(CurrentMenu == menu_equip_list)
	ld	a, (#_CurrentMenu)
	sub	a, #0x06
	jp	NZ,00160$
;bank12.c:799: if(list_y < 3)
	ld	hl, #_list_y
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00143$
;bank12.c:801: set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x06
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
	call	_set_win_tiles
	add	sp, #6
;bank12.c:803: list_y += 1;
	ld	hl, #_list_y
	inc	(hl)
;bank12.c:805: set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Pointer);
	ld	bc, #_Equip_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x06
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
	call	_set_win_tiles
	add	sp, #6
	jr	00144$
00143$:
;bank12.c:807: else if(CurrentEquipSelection < 26)
	ld	hl, #_CurrentEquipSelection
;bank12.c:809: CurrentEquipSelection += 1;
	ld	a,(hl)
	cp	a,#0x1a
	jr	NC, 00140$
	inc	a
	ld	(hl), a
;bank12.c:811: Refresh_Equip_List();
	call	_Refresh_Equip_List
	jr	00144$
00140$:
;bank12.c:815: Call_Play_Buzz(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00144$:
;bank12.c:735: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
;bank12.c:818: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00145$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00146$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jr	Z, 00147$
	sub	a, #0x03
	jr	Z, 00148$
	jr	00150$
;bank12.c:820: case weapon_slot:
00145$:
;bank12.c:821: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_weapon+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:822: break;
	jr	00150$
;bank12.c:823: case secondary_slot:
00146$:
;bank12.c:824: Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_secondary+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:825: break;
	jr	00150$
;bank12.c:826: case armor_slot:
00147$:
;bank12.c:827: Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_armor+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:828: break;
	jr	00150$
;bank12.c:829: case accessory_slot:
00148$:
;bank12.c:830: Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_accessory+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:834: }
00150$:
;bank12.c:836: Refresh_Stat_Changes();
	call	_Refresh_Stat_Changes
;bank12.c:838: Refresh_Equip_Cursors();
	call	_Refresh_Equip_Cursors
;bank12.c:840: while(joypad() & J_DOWN)
00151$:
	call	_joypad
	bit	3, e
	jr	Z, 00166$
;bank12.c:842: wait_vbl_done();
	call	_wait_vbl_done
	jr	00151$
00160$:
;bank12.c:847: if(actor_y < actor_max - 1)
	ld	hl, #_actor_max
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a, (#_actor_y)
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
	jr	Z, 00492$
	bit	7, d
	jr	NZ, 00493$
	cp	a, a
	jr	00493$
00492$:
	bit	7, d
	jr	Z, 00493$
	scf
00493$:
	jr	NC, 00156$
;bank12.c:849: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Background);
	ld	a, (#_actor_y)
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ld	hl, #_Equip_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:851: actor_y += 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	inc	a
;bank12.c:853: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Pointer);
	ld	(hl), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ld	hl, #_Equip_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:856: while(joypad() & J_DOWN)
00156$:
	call	_joypad
	bit	3, e
	jr	Z, 00166$
;bank12.c:858: wait_vbl_done();
	call	_wait_vbl_done
	jr	00156$
00166$:
;bank12.c:863: if(Joy & J_A)
	ld	a, (#_Joy)
	bit	4, a
	jp	Z,00191$
;bank12.c:865: if(CurrentMenu == menu_equip)
	ld	a, (#_CurrentMenu)
	sub	a, #0x05
	jp	NZ,00188$
;bank12.c:867: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:868: Draw_Equip_List(equip_y);
	ld	a, (#_equip_y)
	push	af
	inc	sp
	call	_Draw_Equip_List
	inc	sp
;bank12.c:735: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	a, (#_list_y)
	ld	hl, #_CurrentEquipSelection
	add	a, (hl)
	ld	c, a
;bank12.c:870: switch(equip_y)
	ld	a, (#_equip_y)
	or	a, a
	jr	Z, 00167$
	ld	a, (#_equip_y)
	dec	a
	jr	Z, 00168$
	ld	a,(#_equip_y)
	cp	a,#0x02
	jr	Z, 00169$
	sub	a, #0x03
	jr	Z, 00170$
	jr	00172$
;bank12.c:872: case weapon_slot:
00167$:
;bank12.c:873: Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_weapon+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:874: break;
	jr	00172$
;bank12.c:875: case secondary_slot:
00168$:
;bank12.c:876: Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_secondary+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:877: break;
	jr	00172$
;bank12.c:878: case armor_slot:
00169$:
;bank12.c:879: Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_armor+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:880: break;
	jr	00172$
;bank12.c:881: case accessory_slot:
00170$:
;bank12.c:882: Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
	ld	de, #_equipment_accessory+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:886: }
00172$:
;bank12.c:888: list_y = 0;
	ld	hl, #_list_y
	ld	(hl), #0x00
;bank12.c:889: CurrentMenu = menu_equip_list;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x06
;bank12.c:891: Refresh_Stat_Changes();
	call	_Refresh_Stat_Changes
;bank12.c:893: while(joypad() & J_A || joypad() & J_START)
00174$:
	call	_joypad
	bit	4, e
	jr	NZ, 00175$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,00191$
00175$:
;bank12.c:895: wait_vbl_done();
	call	_wait_vbl_done
	jr	00174$
00188$:
;bank12.c:898: else if(CurrentMenu == menu_equip_list)
	ld	a, (#_CurrentMenu)
	sub	a, #0x06
	jp	NZ,00185$
;bank12.c:900: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:901: Equip_Actor(Get_Actor(party[actor_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	call	_Equip_Actor
	add	sp, #2
;bank12.c:903: CurrentEquipSelection = 0;
	ld	hl, #_CurrentEquipSelection
	ld	(hl), #0x00
;bank12.c:904: list_y = 0;
	ld	hl, #_list_y
	ld	(hl), #0x00
;bank12.c:905: CurrentMenu = menu_equip;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x05
;bank12.c:907: Refresh_Equip_Menu();
	call	_Refresh_Equip_Menu
;bank12.c:908: Draw_Equip_Description(Get_Equip(Get_Actor(party[actor_y])->equipped[equip_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_equip_y
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:910: Refresh_Actor_Stats(Get_Actor(party[actor_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	call	_Refresh_Actor_Stats
	add	sp, #2
;bank12.c:912: set_win_tiles(6, 4, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0406
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:913: set_win_tiles(6, 6, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0606
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:914: set_win_tiles(6, 8, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0806
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:915: set_win_tiles(6, 10, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:916: set_win_tiles(6, 12, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0c06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:918: while(joypad() & J_A || joypad() & J_START)
00178$:
	call	_joypad
	bit	4, e
	jr	NZ, 00179$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00191$
00179$:
;bank12.c:920: wait_vbl_done();
	call	_wait_vbl_done
	jr	00178$
00185$:
;bank12.c:925: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:927: Draw_Equip_Menu();
	call	_Draw_Equip_Menu
;bank12.c:931: while(joypad() & J_A)
00181$:
	call	_joypad
	bit	4, e
	jr	Z, 00191$
;bank12.c:933: wait_vbl_done();
	call	_wait_vbl_done
	jr	00181$
00191$:
;bank12.c:938: if(Joy & J_B)
	ld	a, (#_Joy)
	bit	5, a
	jp	Z,00203$
;bank12.c:940: if(CurrentMenu == menu_equip)
	ld	a, (#_CurrentMenu)
	sub	a, #0x05
	jr	NZ, 00199$
;bank12.c:942: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:943: Call_Load_Menu_Main(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Load_Menu_Main
	inc	sp
	jp	00203$
00199$:
;bank12.c:945: else if(CurrentMenu == menu_equip_list)
	ld	a, (#_CurrentMenu)
	sub	a, #0x06
	jp	NZ,00196$
;bank12.c:947: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:949: Refresh_Equip_Menu();
	call	_Refresh_Equip_Menu
;bank12.c:950: Draw_Equip_Description(Get_Equip(Get_Actor(party[actor_y])->equipped[equip_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_equip_y
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	call	_Draw_Equip_Description
	add	sp, #2
;bank12.c:952: Refresh_Actor_Stats(Get_Actor(party[actor_y]));
	ld	a, #<(_party)
	ld	hl, #_actor_y
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
	call	_Refresh_Actor_Stats
	add	sp, #2
;bank12.c:954: set_win_tiles(6, 4, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0406
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:955: set_win_tiles(6, 6, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0606
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:956: set_win_tiles(6, 8, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0806
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:957: set_win_tiles(6, 10, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:958: set_win_tiles(6, 12, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0c06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:960: CurrentEquipSelection = 0;
	ld	hl, #_CurrentEquipSelection
	ld	(hl), #0x00
;bank12.c:961: list_y = 0;
	ld	hl, #_list_y
	ld	(hl), #0x00
;bank12.c:962: CurrentMenu = menu_equip;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x05
;bank12.c:964: while(joypad() & J_B)
00192$:
	call	_joypad
	bit	5, e
	jr	Z, 00203$
;bank12.c:966: wait_vbl_done();
	call	_wait_vbl_done
	jr	00192$
00196$:
;bank12.c:971: Call_Play_Confirm(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank12.c:973: set_win_tiles(9, 2, 1, 1, Equip_Background);
	ld	bc, #_Equip_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:974: set_win_tiles(9, 5, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0509
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:975: set_win_tiles(9, 8, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0809
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:976: set_win_tiles(9, 10, 1, 1, Equip_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:978: Call_Menu_Main(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_Call_Menu_Main
	inc	sp
00203$:
;bank12.c:981: }
	add	sp, #2
	ret
;bank12.c:983: void Menu_Equip() //* Equip menu.
;	---------------------------------
; Function Menu_Equip
; ---------------------------------
_Menu_Equip::
;bank12.c:985: while(true)
00102$:
;bank12.c:987: wait_vbl_done();
	call	_wait_vbl_done
;bank12.c:989: Menu_Equip_Joypad();
	call	_Menu_Equip_Joypad
;bank12.c:991: }
	jr	00102$
;bank12.c:993: void Load_Menu_Equip() //* Loads equip menu.
;	---------------------------------
; Function Load_Menu_Equip
; ---------------------------------
_Load_Menu_Equip::
;bank12.c:995: if(party[1] == 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	NZ, 00108$
;bank12.c:997: actor_max = 1;
	ld	hl, #_actor_max
	ld	(hl), #0x01
	jr	00109$
00108$:
;bank12.c:999: else if(party[2] == 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	NZ, 00105$
;bank12.c:1001: actor_max = 2;
	ld	hl, #_actor_max
	ld	(hl), #0x02
	jr	00109$
00105$:
;bank12.c:1003: else if(party[3] == 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	NZ, 00102$
;bank12.c:1005: actor_max = 3;
	ld	hl, #_actor_max
	ld	(hl), #0x03
	jr	00109$
00102$:
;bank12.c:1009: actor_max = 0;
	ld	hl, #_actor_max
	ld	(hl), #0x00
00109$:
;bank12.c:1012: set_win_tiles(9, 2, 1, 1, Equip_Pointer);
	ld	hl, #_Equip_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank12.c:1014: actor_y = 0;
	ld	hl, #_actor_y
	ld	(hl), #0x00
;bank12.c:1016: while(joypad() & J_A || joypad() & J_START)
00111$:
	call	_joypad
	bit	4, e
	jr	NZ, 00112$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,_Menu_Equip
00112$:
;bank12.c:1018: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank12.c:1021: Menu_Equip();
;bank12.c:1022: }
	jr	00111$
	.area _CODE_12
	.area _CABS (ABS)
