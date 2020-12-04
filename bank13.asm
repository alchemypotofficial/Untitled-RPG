;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank13
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Menu_Item
	.globl _Menu_Item_Joypad
	.globl _Draw_Item_Menu
	.globl _Blink_Item_Name
	.globl _Use_Item_Win
	.globl _Hide_Item_Name
	.globl _Refresh_Item_Menu
	.globl _Refresh_Cursors
	.globl _Reset_Pointer
	.globl _Draw_Item_Description
	.globl _Draw_Party_Window
	.globl _Draw_Actor_Window
	.globl _Draw_Item
	.globl _Draw_Item_Number
	.globl _Restructure_Inventory
	.globl _Use_Item
	.globl _Call_Play_Confirm
	.globl _Call_Play_Use
	.globl _Call_Play_Buzz
	.globl _Call_Load_Menu_Main
	.globl _Call_Draw_Name
	.globl _Get_Actor
	.globl _Get_Item
	.globl _set_win_map
	.globl _fade_in
	.globl _fade_out
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Healing_Brew_Description
	.globl _Item_Clear
	.globl _Item_Zero
	.globl _Item_Number
	.globl _Item_Slash
	.globl _Item_Cursor_Down
	.globl _Item_Cursor_Up
	.globl _Item_Border
	.globl _Item_Pointer
	.globl _Item_Background
	.globl _Mana_Brew_Description
	.globl _Null_Item_Description
	.globl _Map_Item_Use_ReplacePLN1
	.globl _Map_Item_Use_ReplacePLN0
	.globl _Map_Menu_ResetPLN1
	.globl _Map_Menu_ResetPLN0
	.globl _Map_Menu_PartyPLN0
	.globl _Map_Menu_ItemsPLN1
	.globl _Map_Menu_ItemsPLN0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Healing_Brew_Description::
	.ds 36
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
;Maps/Map_Item_Description.c:9: unsigned char Healing_Brew_Description[] =
	ld	hl, #_Healing_Brew_Description
	ld	(hl), #0x4c
	ld	hl, #(_Healing_Brew_Description + 0x0001)
	ld	(hl), #0x1a
	ld	hl, #(_Healing_Brew_Description + 0x0002)
	ld	(hl), #0x18
	ld	hl, #(_Healing_Brew_Description + 0x0003)
	ld	(hl), #0x24
	ld	hl, #(_Healing_Brew_Description + 0x0004)
	ld	(hl), #0x2c
	ld	hl, #(_Healing_Brew_Description + 0x0005)
	ld	(hl), #0x1a
	ld	hl, #(_Healing_Brew_Description + 0x0006)
	ld	(hl), #0x27
	ld	hl, #(_Healing_Brew_Description + 0x0007)
	ld	(hl), #0x29
	ld	hl, #(_Healing_Brew_Description + 0x0008)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0009)
	ld	(hl), #0x32
	ld	hl, #(_Healing_Brew_Description + 0x000a)
	ld	(hl), #0x36
	ld	hl, #(_Healing_Brew_Description + 0x000b)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x000c)
	ld	(hl), #0x42
	ld	hl, #(_Healing_Brew_Description + 0x000d)
	ld	(hl), #0x4a
	ld	hl, #(_Healing_Brew_Description + 0x000e)
	ld	(hl), #0x55
	ld	hl, #(_Healing_Brew_Description + 0x000f)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0010)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0011)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0012)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0013)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0014)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0015)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0016)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0017)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0018)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0019)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001a)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001b)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001c)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001d)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001e)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x001f)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0020)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0021)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_Healing_Brew_Description + 0x0023)
	ld	(hl), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_13
;bank13.c:112: void Use_Item(GameActor* actor, UBYTE item_id)
;	---------------------------------
; Function Use_Item
; ---------------------------------
_Use_Item::
	add	sp, #-6
;bank13.c:114: switch(item_id)
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jp	Z,00110$
;bank13.c:119: actor->health += 15;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	c, a
;bank13.c:114: switch(item_id)
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00105$
	jp	00110$
;bank13.c:118: case 1:
00102$:
;bank13.c:119: actor->health += 15;
	ld	hl, #0x0007
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
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
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank13.c:121: if(actor->health > actor->max_health)
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00110$
;bank13.c:123: actor->health = actor->max_health;
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;bank13.c:125: break;
	jr	00110$
;bank13.c:126: case 2:
00105$:
;bank13.c:127: actor->mana += 10;
	ld	hl, #0x000b
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
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
;bank13.c:129: if(actor->mana > actor->max_mana)
	ld	hl, #0x000d
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00110$
;bank13.c:131: actor->mana = actor->max_mana;
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;bank13.c:136: }
00110$:
;bank13.c:137: }
	add	sp, #6
	ret
_Map_Menu_ItemsPLN0:
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
	.db #0x4f	; 79	'O'
	.db #0x29	; 41
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x2a	; 42
	.db #0x1a	; 26
	.db #0x22	; 34
	.db #0x29	; 41
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
_Map_Menu_ItemsPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_PartyPLN0:
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
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x28	; 40
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
	.db #0x05	; 5
_Map_Menu_ResetPLN0:
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
	.db #0x01	; 1
	.db #0x28	; 40
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
_Map_Menu_ResetPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Item_Use_ReplacePLN0:
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
_Map_Item_Use_ReplacePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Null_Item_Description:
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
_Mana_Brew_Description:
	.db #0x4c	; 76	'L'
	.db #0x1a	; 26
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x2c	; 44
	.db #0x1a	; 26
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x47	; 71	'G'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
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
_Item_Background:
	.db #0x01	; 1
_Item_Pointer:
	.db #0x0a	; 10
_Item_Border:
	.db #0x09	; 9
_Item_Cursor_Up:
	.db #0x0b	; 11
_Item_Cursor_Down:
	.db #0x0c	; 12
_Item_Slash:
	.db #0x0f	; 15
_Item_Number:
	.db #0x2e	; 46
_Item_Zero:
	.db #0x31	; 49	'1'
_Item_Clear:
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
;bank13.c:139: void Restructure_Inventory()
;	---------------------------------
; Function Restructure_Inventory
; ---------------------------------
_Restructure_Inventory::
;bank13.c:141: if(inventory[CurrentItemSlot + CurrentItemSelection] == 0)
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	e, a
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ret	NZ
;bank13.c:143: for(i = CurrentItemSlot + CurrentItemSelection; i < 99; i++)
	ld	hl, #_i
	ld	(hl), e
00107$:
	ld	hl, #_i
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe3
	ret	NC
;bank13.c:145: inventory[i] = inventory[i + 1];
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, c
	add	a, e
	ld	e, a
	ld	a, b
	adc	a, d
	ld	d, a
	ld	a, (hl)
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank13.c:146: inv_amount[i] = inv_amount[i + 1];
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_inv_amount
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	de
	ld	de, #_inv_amount
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(de), a
;bank13.c:148: if(inventory[i] == 0)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, c
	ld	h, b
	add	hl, de
	ld	a, (hl)
	or	a, a
;bank13.c:150: return;
	ret	Z
;bank13.c:143: for(i = CurrentItemSlot + CurrentItemSelection; i < 99; i++)
	ld	hl, #_i
	inc	(hl)
;bank13.c:154: }
	jr	00107$
;bank13.c:156: void Draw_Item_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Item_Number
; ---------------------------------
_Draw_Item_Number::
;bank13.c:158: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank13.c:160: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank13.c:162: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank13.c:164: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank13.c:166: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank13.c:164: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank13.c:169: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank13.c:171: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank13.c:172: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank13.c:175: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank13.c:176: parsed_number = 0;
	ld	(hl), #0x00
;bank13.c:178: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank13.c:180: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank13.c:181: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank13.c:184: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank13.c:185: parsed_number = 0;
	ld	(hl), #0x00
;bank13.c:187: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank13.c:189: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank13.c:190: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank13.c:193: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank13.c:195: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank13.c:197: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank13.c:198: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank13.c:199: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank13.c:200: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank13.c:204: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank13.c:202: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank13.c:204: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
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
	call	_set_win_tiles
	add	sp, #6
	ret
00118$:
;bank13.c:206: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank13.c:208: set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
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
	call	_set_win_tiles
	add	sp, #6
	ret
00115$:
;bank13.c:210: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank13.c:212: set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
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
	call	_set_win_tiles
	add	sp, #6
	ret
00112$:
;bank13.c:216: set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
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
	call	_set_win_tiles
	add	sp, #6
;bank13.c:219: }
	ret
;bank13.c:221: void Draw_Item(GameItem* item, UBYTE inventory_slot, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Item
; ---------------------------------
_Draw_Item::
	add	sp, #-3
;bank13.c:223: set_win_tiles(tile_x, tile_y, 12, 1, item->full_name);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x010c
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:225: if(inv_amount[inventory_slot] > 0)
;c
	ld	de, #_inv_amount
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
;bank13.c:227: set_win_tiles(tile_x + 13, tile_y, 1, 1, Item_Number);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	add	a, #0x0d
	ld	e, a
;bank13.c:225: if(inv_amount[inventory_slot] > 0)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;bank13.c:227: set_win_tiles(tile_x + 13, tile_y, 1, 1, Item_Number);
	ld	hl, #_Item_Number
	push	hl
	ld	hl, #0x0101
	push	hl
	ldhl	sp,	#13
	ld	d, (hl)
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:228: set_win_tiles(tile_x + 14, tile_y, 2, 1, Item_Zero);
	ld	bc, #_Item_Zero+0
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x0e
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x02
	push	hl
	inc	sp
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:229: Draw_Item_Number(inv_amount[inventory_slot], tile_x + 12, tile_y);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x0c
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_Draw_Item_Number
	add	sp, #4
	jr	00104$
00102$:
;bank13.c:233: set_win_tiles(tile_x + 13, tile_y, 3, 1, Item_Clear);
	ld	hl, #_Item_Clear
	push	hl
	ld	hl, #0x0103
	push	hl
	ldhl	sp,	#13
	ld	d, (hl)
	push	de
	call	_set_win_tiles
	add	sp, #6
00104$:
;bank13.c:235: }
	add	sp, #3
	ret
;bank13.c:237: void Draw_Actor_Window(GameActor* actor, UBYTE item_type)
;	---------------------------------
; Function Draw_Actor_Window
; ---------------------------------
_Draw_Actor_Window::
	add	sp, #-13
;bank13.c:239: if(actor->party_slot == 0 && actor->active_member == true)
	ldhl	sp,#15
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001d
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #0x0022
	add	hl, bc
	ld	e, l
	ld	d, h
;bank13.c:243: switch(item_type)
	ldhl	sp,	#17
	ld	a, (hl)
	or	a, a
	ld	a, #0x01
	jr	Z, 00263$
	xor	a, a
00263$:
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00265$
	xor	a, a
00265$:
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00267$
	xor	a, a
00267$:
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00269$
	xor	a, a
00269$:
	ldhl	sp,	#4
	ld	(hl), a
;bank13.c:248: Draw_Item_Number(actor->health, 11, 13);
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;bank13.c:250: Draw_Item_Number(actor->max_health, 15, 13);
	ld	hl, #0x0009
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;bank13.c:253: Draw_Item_Number(actor->mana, 11, 13);
	ld	hl, #0x000b
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;bank13.c:255: Draw_Item_Number(actor->max_mana, 15, 13);
	ld	hl, #0x000d
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
;bank13.c:239: if(actor->party_slot == 0 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	NZ, 00137$
	ld	a, (de)
	dec	a
	jp	NZ,00137$
;bank13.c:241: Call_Draw_Name(bank13, 7, 13, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0d07
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank13.c:243: switch(item_type)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jp	NZ, 00140$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00103$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
	jp	00140$
;bank13.c:247: case health_recovery:
00102$:
;bank13.c:248: Draw_Item_Number(actor->health, 11, 13);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:249: set_win_tiles(15, 13, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:250: Draw_Item_Number(actor->max_health, 15, 13);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:251: break;
	jp	00140$
;bank13.c:252: case mana_recovery:
00103$:
;bank13.c:253: Draw_Item_Number(actor->mana, 11, 13);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:254: set_win_tiles(15, 13, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:255: Draw_Item_Number(actor->max_mana, 15, 13);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:256: break;
	jp	00140$
;bank13.c:257: case status_death:
00104$:
;bank13.c:258: Draw_Item_Number(actor->health, 11, 13);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:259: set_win_tiles(15, 13, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:260: Draw_Item_Number(actor->max_health, 15, 13);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0d0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:261: break;
	jp	00140$
;bank13.c:264: }
00137$:
;bank13.c:266: else if(actor->party_slot == 1 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jp	NZ,00133$
	ld	a, (de)
	dec	a
	jp	NZ,00133$
;bank13.c:268: Call_Draw_Name(bank13, 7, 14, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0e07
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank13.c:270: switch(item_type)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jp	NZ, 00140$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
	jp	00140$
;bank13.c:274: case health_recovery:
00108$:
;bank13.c:275: Draw_Item_Number(actor->health, 11, 14);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:276: set_win_tiles(15, 14, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:277: Draw_Item_Number(actor->max_health, 15, 14);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:278: break;
	jp	00140$
;bank13.c:279: case mana_recovery:
00109$:
;bank13.c:280: Draw_Item_Number(actor->mana, 11, 14);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:281: set_win_tiles(15, 14, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:282: Draw_Item_Number(actor->max_mana, 15, 14);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:283: break;
	jp	00140$
;bank13.c:284: case status_death:
00110$:
;bank13.c:285: Draw_Item_Number(actor->health, 11, 14);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:286: set_win_tiles(15, 14, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0e0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:287: Draw_Item_Number(actor->max_health, 15, 14);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0e0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:288: break;
	jp	00140$
;bank13.c:291: }
00133$:
;bank13.c:293: else if(actor->party_slot == 2 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00129$
	ld	a, (de)
	dec	a
	jp	NZ,00129$
;bank13.c:295: Call_Draw_Name(bank13, 7, 15, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0f07
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank13.c:297: switch(item_type)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jp	NZ, 00140$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00115$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
	jp	00140$
;bank13.c:301: case health_recovery:
00114$:
;bank13.c:302: Draw_Item_Number(actor->health, 11, 15);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:303: set_win_tiles(15, 15, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:304: Draw_Item_Number(actor->max_health, 15, 15);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:305: break;
	jp	00140$
;bank13.c:306: case mana_recovery:
00115$:
;bank13.c:307: Draw_Item_Number(actor->mana, 11, 15);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:308: set_win_tiles(15, 15, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:309: Draw_Item_Number(actor->max_mana, 15, 15);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:310: break;
	jp	00140$
;bank13.c:311: case status_death:
00116$:
;bank13.c:312: Draw_Item_Number(actor->health, 11, 15);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:313: set_win_tiles(15, 15, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0f0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:314: Draw_Item_Number(actor->max_health, 15, 15);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0f0f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:315: break;
	jp	00140$
;bank13.c:318: }
00129$:
;bank13.c:320: else if(actor->party_slot == 3 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00140$
	ld	a, (de)
	dec	a
	jp	NZ,00140$
;bank13.c:322: Call_Draw_Name(bank13, 7, 16, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x1007
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank13.c:324: switch(item_type)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jp	NZ, 00140$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00121$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00122$
	jp	00140$
;bank13.c:328: case health_recovery:
00120$:
;bank13.c:329: Draw_Item_Number(actor->health, 11, 16);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:330: set_win_tiles(15, 16, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:331: Draw_Item_Number(actor->max_health, 15, 16);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:332: break;
	jr	00140$
;bank13.c:333: case mana_recovery:
00121$:
;bank13.c:334: Draw_Item_Number(actor->mana, 11, 16);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:335: set_win_tiles(15, 16, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:336: Draw_Item_Number(actor->max_mana, 15, 16);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:337: break;
	jr	00140$
;bank13.c:338: case status_death:
00122$:
;bank13.c:339: Draw_Item_Number(actor->health, 11, 16);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100b
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:340: set_win_tiles(15, 16, 1, 1, Item_Slash);
	ld	hl, #_Item_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:341: Draw_Item_Number(actor->max_health, 15, 16);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x100f
	push	de
	push	bc
	call	_Draw_Item_Number
	add	sp, #4
;bank13.c:345: }
00140$:
;bank13.c:347: }
	add	sp, #13
	ret
;bank13.c:349: void Draw_Party_Window(GameItem* item)
;	---------------------------------
; Function Draw_Party_Window
; ---------------------------------
_Draw_Party_Window::
	dec	sp
;bank13.c:351: set_win_tiles(5, 12, 15, 6, Map_Menu_PartyPLN0);
	ld	hl, #_Map_Menu_PartyPLN0
	push	hl
	ld	de, #0x060f
	push	de
	ld	de, #0x0c05
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:352: Draw_Actor_Window(Get_Actor(party[0]), item->item_type);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_party + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Actor_Window
	add	sp, #3
	pop	bc
;bank13.c:353: Draw_Actor_Window(Get_Actor(party[1]), item->item_type);
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_party + 0x0001) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Actor_Window
	add	sp, #3
	pop	bc
;bank13.c:354: Draw_Actor_Window(Get_Actor(party[2]), item->item_type);
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_party + 0x0002) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Actor_Window
	add	sp, #3
	pop	bc
;bank13.c:355: Draw_Actor_Window(Get_Actor(party[3]), item->item_type);
	ld	a, (bc)
	ld	b, a
	ld	a, (#(_party + 0x0003) + 0)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	sp
	push	de
	call	_Draw_Actor_Window
	add	sp, #3
;bank13.c:356: }
	inc	sp
	ret
;bank13.c:358: void Draw_Item_Description(GameItem* item)
;	---------------------------------
; Function Draw_Item_Description
; ---------------------------------
_Draw_Item_Description::
;bank13.c:360: set_win_tiles(1, 13, 18, 2, item->description);
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0008
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0212
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:361: }
	ret
;bank13.c:363: void Reset_Pointer()
;	---------------------------------
; Function Reset_Pointer
; ---------------------------------
_Reset_Pointer::
;bank13.c:365: switch(CurrentItemSlot)
	ld	a, #0x09
	ld	hl, #_CurrentItemSlot
	sub	a, (hl)
	jp	C, 00111$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00120$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00120$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
;bank13.c:367: case 0:
00101$:
;bank13.c:368: set_win_tiles(1, 4, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:369: break;
	ret
;bank13.c:370: case 1:
00102$:
;bank13.c:371: set_win_tiles(10, 4, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x040a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:372: break;
	ret
;bank13.c:373: case 2:
00103$:
;bank13.c:374: set_win_tiles(1, 6, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0601
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:375: break;
	ret
;bank13.c:376: case 3:
00104$:
;bank13.c:377: set_win_tiles(10, 6, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x060a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:378: break;
	ret
;bank13.c:379: case 4:
00105$:
;bank13.c:380: set_win_tiles(1, 8, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0801
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:381: break;
	ret
;bank13.c:382: case 5:
00106$:
;bank13.c:383: set_win_tiles(10, 8, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x080a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:384: break;
	ret
;bank13.c:385: case 6:
00107$:
;bank13.c:386: set_win_tiles(1, 10, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:387: break;
	ret
;bank13.c:388: case 7:
00108$:
;bank13.c:389: set_win_tiles(10, 10, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a0a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:390: break;
	ret
;bank13.c:391: case 8:
00109$:
;bank13.c:392: set_win_tiles(1, 12, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:393: break;
	ret
;bank13.c:394: case 9:
00110$:
;bank13.c:395: set_win_tiles(10, 12, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0c0a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:396: break;
	ret
;bank13.c:397: default:
00111$:
;bank13.c:398: set_win_tiles(1, 4, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:400: }
;bank13.c:401: }
	ret
;bank13.c:403: void Refresh_Cursors()
;	---------------------------------
; Function Refresh_Cursors
; ---------------------------------
_Refresh_Cursors::
;bank13.c:405: if(CurrentItemSelection > 0)
	ld	a, (#_CurrentItemSelection)
	or	a, a
	jr	Z, 00102$
;bank13.c:407: set_win_tiles(19, 4, 1, 1, Item_Cursor_Up);
	ld	hl, #_Item_Cursor_Up
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0413
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00103$
00102$:
;bank13.c:411: set_win_tiles(19, 4, 1, 1, Item_Border);
	ld	hl, #_Item_Border
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0413
	push	de
	call	_set_win_tiles
	add	sp, #6
00103$:
;bank13.c:414: if(CurrentItemSelection < 40)
	ld	a, (#_CurrentItemSelection)
	sub	a, #0x28
	jr	NC, 00105$
;bank13.c:416: set_win_tiles(19, 10, 1, 1, Item_Cursor_Down);
	ld	hl, #_Item_Cursor_Down
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a13
	push	de
	call	_set_win_tiles
	add	sp, #6
	ret
00105$:
;bank13.c:420: set_win_tiles(19, 10, 1, 1, Item_Border);
	ld	hl, #_Item_Border
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a13
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:422: }
	ret
;bank13.c:424: void Refresh_Item_Menu()
;	---------------------------------
; Function Refresh_Item_Menu
; ---------------------------------
_Refresh_Item_Menu::
;bank13.c:426: Draw_Item(Get_Item(inventory[CurrentItemSelection]), CurrentItemSelection, 2, 4);
	ld	a, #<(_inventory)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0402
	push	hl
	ld	a, (#_CurrentItemSelection)
	push	af
	inc	sp
	push	de
	call	_Draw_Item
	add	sp, #5
;bank13.c:427: Draw_Item(Get_Item(inventory[1 + CurrentItemSelection]), 1 + CurrentItemSelection, 2, 6);
	ld	hl, #_CurrentItemSelection
	ld	b, (hl)
	inc	b
	ld	a, b
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_inventory
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	pop	bc
	ld	hl, #0x0602
	push	hl
	push	bc
	inc	sp
	push	de
	call	_Draw_Item
	add	sp, #5
;bank13.c:428: Draw_Item(Get_Item(inventory[2 + CurrentItemSelection]), 2 + CurrentItemSelection, 2, 8);
	ld	hl, #_CurrentItemSelection
	ld	b, (hl)
	inc	b
	inc	b
	ld	a, b
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_inventory
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	pop	bc
	ld	hl, #0x0802
	push	hl
	push	bc
	inc	sp
	push	de
	call	_Draw_Item
	add	sp, #5
;bank13.c:429: Draw_Item(Get_Item(inventory[3 + CurrentItemSelection]), 3 + CurrentItemSelection, 2, 10);
	ld	a, (#_CurrentItemSelection)
	add	a, #0x03
	ld	b, a
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_inventory
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	pop	bc
	ld	hl, #0x0a02
	push	hl
	push	bc
	inc	sp
	push	de
	call	_Draw_Item
	add	sp, #5
;bank13.c:431: Refresh_Cursors();
;bank13.c:432: }
	jp  _Refresh_Cursors
;bank13.c:434: void Hide_Item_Name()
;	---------------------------------
; Function Hide_Item_Name
; ---------------------------------
_Hide_Item_Name::
;bank13.c:436: inventory[slot_1] = 0;
	ld	bc, #_inventory+0
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	xor	a, a
	ld	(bc), a
;bank13.c:437: inv_amount[slot_1] = 0;
	ld	bc, #_inv_amount+0
	ld	a, c
	add	a, (hl)
	ld	c, a
	jr	NC, 00104$
	inc	b
00104$:
	xor	a, a
	ld	(bc), a
;bank13.c:439: Refresh_Item_Menu();
;bank13.c:440: }
	jp  _Refresh_Item_Menu
;bank13.c:442: void Use_Item_Win(GameActor* actor, GameItem* item)
;	---------------------------------
; Function Use_Item_Win
; ---------------------------------
_Use_Item_Win::
	add	sp, #-6
;bank13.c:444: switch(item->item_type)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl), a
	or	a, a
	jp	Z,00118$
;bank13.c:449: if(actor->health != 0 && actor->health < actor->max_health)
	ldhl	sp,#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;bank13.c:453: Use_Item(actor, item->item_id);
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;bank13.c:444: switch(item->item_type)
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00109$
	jp	00118$
;bank13.c:448: case health_recovery:
00102$:
;bank13.c:449: if(actor->health != 0 && actor->health < actor->max_health)
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00106$
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00106$
;bank13.c:451: Call_Play_Use(bank13);
	push	bc
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Use
	inc	sp
	pop	bc
;bank13.c:453: Use_Item(actor, item->item_id);
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_Use_Item
	add	sp, #3
;bank13.c:455: inv_amount[CurrentItemSlot + CurrentItemSelection] -= 1;
	ld	de, #_inv_amount+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank13.c:457: if(inv_amount[CurrentItemSlot + CurrentItemSelection] == 0)
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	c, a
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;bank13.c:459: inventory[CurrentItemSlot + CurrentItemSelection] = 0;
	ld	de, #_inventory+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x00
00104$:
;bank13.c:462: set_win_map(5, 8, 15, 6, Map_Menu_ResetPLN1, Map_Menu_ResetPLN0);
	ld	hl, #_Map_Menu_ResetPLN0
	push	hl
	ld	hl, #_Map_Menu_ResetPLN1
	push	hl
	ld	de, #0x060f
	push	de
	ld	de, #0x0805
	push	de
	call	_set_win_map
	add	sp, #8
;bank13.c:464: Restructure_Inventory();
	call	_Restructure_Inventory
;bank13.c:466: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:468: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:470: CurrentMenu = menu_item_use;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x02
	jp	00118$
00106$:
;bank13.c:474: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank13.c:476: break;
	jp	00118$
;bank13.c:477: case mana_recovery:
00109$:
;bank13.c:478: if(actor->max_mana != 0 && actor->mana < actor->max_mana)
	ld	hl, #0x000d
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00113$
	ld	hl, #0x000b
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00113$
;bank13.c:480: Call_Play_Use(bank13);
	push	bc
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Use
	inc	sp
	pop	bc
;bank13.c:482: Use_Item(actor, item->item_id);
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_Use_Item
	add	sp, #3
;bank13.c:484: inv_amount[CurrentItemSlot + CurrentItemSelection] -= 1;
	ld	de, #_inv_amount+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank13.c:486: if(inv_amount[CurrentItemSlot + CurrentItemSelection] == 0)
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	c, a
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
;bank13.c:488: inventory[CurrentItemSlot + CurrentItemSelection] = 0;
	ld	de, #_inventory+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x00
00111$:
;bank13.c:491: set_win_map(5, 8, 15, 6, Map_Menu_ResetPLN1, Map_Menu_ResetPLN1);
	ld	bc, #_Map_Menu_ResetPLN1+0
	push	bc
	push	bc
	ld	de, #0x060f
	push	de
	ld	de, #0x0805
	push	de
	call	_set_win_map
	add	sp, #8
;bank13.c:493: Restructure_Inventory();
	call	_Restructure_Inventory
;bank13.c:495: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:497: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:499: CurrentMenu = menu_item_use;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x02
	jr	00118$
00113$:
;bank13.c:503: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank13.c:508: }
00118$:
;bank13.c:509: }
	add	sp, #6
	ret
;bank13.c:511: void Blink_Item_Name()
;	---------------------------------
; Function Blink_Item_Name
; ---------------------------------
_Blink_Item_Name::
;bank13.c:513: if(slot_1_filled == true)
	ld	a, (#_slot_1_filled)
	dec	a
	jr	NZ, 00109$
;bank13.c:515: if(blink_tick == 25)
	ld	a, (#_blink_tick)
	sub	a, #0x19
	jr	NZ, 00104$
;bank13.c:517: inventory[slot_1] = item_1;
	ld	bc, #_inventory+0
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	jr	NC, 00137$
	inc	b
00137$:
	ld	a, (#_item_1)
	ld	(bc), a
;bank13.c:518: inv_amount[slot_1] = amount_1;
	ld	a, #<(_inv_amount)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inv_amount)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_amount_1)
	ld	(bc), a
;bank13.c:520: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
	jr	00105$
00104$:
;bank13.c:522: else if(blink_tick == 50)
	ld	a, (#_blink_tick)
	sub	a, #0x32
	jr	NZ, 00105$
;bank13.c:524: Hide_Item_Name();
	call	_Hide_Item_Name
;bank13.c:526: blink_tick = 0;
	ld	hl, #_blink_tick
	ld	(hl), #0x00
00105$:
;bank13.c:529: if(slot_1 == CurrentItemSlot + CurrentItemSelection)
	ld	hl, #_CurrentItemSlot
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_CurrentItemSelection
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #_slot_1
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00107$
	ld	a, d
	sub	a, b
	jr	NZ, 00107$
;bank13.c:531: Draw_Item_Description(Get_Item(item_1));
	ld	a, (#_item_1)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
00107$:
;bank13.c:534: blink_tick += 1;
	ld	hl, #_blink_tick
	inc	(hl)
	ret
00109$:
;bank13.c:538: blink_tick = 0;
	ld	hl, #_blink_tick
	ld	(hl), #0x00
;bank13.c:541: }
	ret
;bank13.c:543: void Draw_Item_Menu()
;	---------------------------------
; Function Draw_Item_Menu
; ---------------------------------
_Draw_Item_Menu::
;bank13.c:545: fade_out();
	call	_fade_out
;bank13.c:547: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:548: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:549: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:551: set_win_map(0, 0, 20, 18, Map_Menu_ItemsPLN1, Map_Menu_ItemsPLN0);
	ld	hl, #_Map_Menu_ItemsPLN0
	push	hl
	ld	hl, #_Map_Menu_ItemsPLN1
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
;bank13.c:553: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:554: CurrentItemSelection = 0;
	ld	hl, #_CurrentItemSelection
	ld	(hl), #0x00
;bank13.c:556: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:557: Refresh_Cursors();
	call	_Refresh_Cursors
;bank13.c:559: set_win_tiles(2, 1, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0102
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:561: slot_1_filled = false;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x00
;bank13.c:562: slot_2_filled = false;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x00
;bank13.c:563: slot_1 = 0;
	ld	hl, #_slot_1
	ld	(hl), #0x00
;bank13.c:564: amount_1 = 0;
	ld	hl, #_amount_1
	ld	(hl), #0x00
;bank13.c:565: slot_2 = 0;
	ld	hl, #_slot_2
	ld	(hl), #0x00
;bank13.c:566: amount_2 = 0;
	ld	hl, #_amount_2
	ld	(hl), #0x00
;bank13.c:568: fade_in();
;bank13.c:569: }
	jp  _fade_in
;bank13.c:571: void Menu_Item_Joypad()
;	---------------------------------
; Function Menu_Item_Joypad
; ---------------------------------
_Menu_Item_Joypad::
	add	sp, #-4
;bank13.c:573: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank13.c:575: if(Joy & J_UP)
	bit	2, (hl)
	jp	Z,00145$
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_selection_y
	ld	b, (hl)
	ld	a, (#_selection_x)
;bank13.c:593: CurrentItemSelection -= 1;
	ld	hl, #_CurrentItemSelection
	ld	c, (hl)
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	sla	b
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ldhl	sp,	#3
	ld	(hl), a
;bank13.c:593: CurrentItemSelection -= 1;
	dec	c
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	a, b
	add	a, #0x04
	dec	hl
	ld	(hl+), a
	inc	(hl)
;bank13.c:577: if(CurrentMenu == menu_item_use)
	ld	a, (#_CurrentMenu)
	sub	a, #0x02
	jp	NZ,00142$
;bank13.c:579: if(selection_y > 0)
	ld	a, (#_selection_y)
	or	a, a
	jr	Z, 00105$
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:583: selection_y -= 1;
	ld	hl, #_selection_y
	ld	a, (hl)
	add	a, #0xff
;bank13.c:585: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:587: CurrentItemSlot -= 1;
	ld	hl, #_CurrentItemSlot
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank13.c:589: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (hl)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00106$
00105$:
;bank13.c:591: else if(CurrentItemSelection > 0)
	ld	hl, #_CurrentItemSelection
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;bank13.c:593: CurrentItemSelection -= 1;
	ld	(hl), c
;bank13.c:595: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:597: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00106$
00102$:
;bank13.c:601: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00106$:
;bank13.c:604: Refresh_Cursors();
	call	_Refresh_Cursors
;bank13.c:606: while(joypad() & J_UP)
00112$:
	call	_joypad
	bit	2, e
	jp	Z,00145$
;bank13.c:608: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:610: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00112$
;bank13.c:612: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:614: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:615: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:617: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:619: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:621: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:622: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:624: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:626: while(joypad() & J_B)
00107$:
	call	_joypad
	bit	5, e
	jr	Z, 00112$
;bank13.c:628: wait_vbl_done();
	call	_wait_vbl_done
	jr	00107$
00142$:
;bank13.c:633: else if(CurrentMenu == menu_item_sort)
	ld	a, (#_CurrentMenu)
	sub	a, #0x03
	jp	NZ,00139$
;bank13.c:635: if(selection_y > 0)
	ld	a, (#_selection_y)
	or	a, a
	jr	Z, 00119$
;bank13.c:637: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:639: selection_y -= 1;
	ld	hl, #_selection_y
	ld	a, (hl)
	add	a, #0xff
;bank13.c:641: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:643: CurrentItemSlot -= 1;
	ld	hl, #_CurrentItemSlot
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank13.c:645: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (hl)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00120$
00119$:
;bank13.c:647: else if(CurrentItemSelection > 0)
	ld	hl, #_CurrentItemSelection
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;bank13.c:649: CurrentItemSelection -= 1;
	ld	(hl), c
;bank13.c:651: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:653: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00120$
00116$:
;bank13.c:657: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00120$:
;bank13.c:660: Refresh_Cursors();
	call	_Refresh_Cursors
;bank13.c:662: while(joypad() & J_UP)
00128$:
	call	_joypad
	bit	2, e
	jp	Z,00145$
;bank13.c:664: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:666: Blink_Item_Name();
	call	_Blink_Item_Name
;bank13.c:668: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00128$
;bank13.c:670: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:672: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:673: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:675: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:677: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:679: selection_x = 1;
	ld	hl, #_selection_x
	ld	(hl), #0x01
;bank13.c:680: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:682: if(slot_1_filled == true)
	ld	a, (#_slot_1_filled)
	dec	a
	jr	NZ, 00122$
;bank13.c:684: inventory[slot_1] = item_1;
	ld	a, #<(_inventory)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_item_1)
	ld	(bc), a
;bank13.c:685: inv_amount[slot_1] = amount_1;
	ld	a, #<(_inv_amount)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inv_amount)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_amount_1)
	ld	(bc), a
;bank13.c:687: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
00122$:
;bank13.c:690: slot_1 = 0;
	ld	hl, #_slot_1
	ld	(hl), #0x00
;bank13.c:691: amount_1 = 0;
	ld	hl, #_amount_1
	ld	(hl), #0x00
;bank13.c:692: slot_1_filled = false;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x00
;bank13.c:694: slot_2 = 0;
	ld	hl, #_slot_2
	ld	(hl), #0x00
;bank13.c:695: amount_2 = 0;
	ld	hl, #_amount_2
	ld	(hl), #0x00
;bank13.c:696: slot_2_filled = false;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x00
;bank13.c:698: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:700: while(joypad() & J_B)
00123$:
	call	_joypad
	bit	5, e
	jp	Z,00128$
;bank13.c:702: wait_vbl_done();
	call	_wait_vbl_done
	jr	00123$
00139$:
;bank13.c:707: else if(CurrentMenu == menu_item_use_win)
	ld	a, (#_CurrentMenu)
	sub	a, #0x04
	jr	NZ, 00145$
;bank13.c:709: if(party_y > 0)
	ld	hl, #_party_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;bank13.c:711: set_win_tiles(6, 13 + party_y, 1, 1, Item_Background);
	ld	bc, #_Item_Background+0
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
	ld	e,#0x06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:712: party_y -= 1;
	ld	hl, #_party_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank13.c:713: set_win_tiles(6, 13 + party_y, 1, 1, Item_Pointer);
	ld	bc, #_Item_Pointer+0
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
	ld	e,#0x06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:716: while(joypad() & J_UP)
00133$:
	call	_joypad
	bit	2, e
	jr	Z, 00145$
;bank13.c:718: wait_vbl_done();
	call	_wait_vbl_done
	jr	00133$
00145$:
;bank13.c:723: if(Joy & J_DOWN)
	ld	a, (#_Joy)
	bit	3, a
	jp	Z,00190$
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_selection_y
	ld	e, (hl)
	ld	a, (#_selection_x)
	ldhl	sp,	#0
	ld	(hl), a
;bank13.c:593: CurrentItemSelection -= 1;
	ld	hl, #_CurrentItemSelection
	ld	c, (hl)
;bank13.c:727: if(selection_y < 3)
	ld	a, (#_selection_y)
	sub	a, #0x03
	ld	a, #0x00
	rla
	ldhl	sp,	#1
	ld	(hl), a
;bank13.c:739: else if (CurrentItemSelection < 40)
	ld	a, (#_CurrentItemSelection)
	sub	a, #0x28
	ld	a, #0x00
	rla
	ldhl	sp,	#2
	ld	(hl), a
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	a, e
	add	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	b, a
;bank13.c:741: CurrentItemSelection += 1;
	inc	c
;bank13.c:581: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ldhl	sp,	#3
	ld	e, (hl)
	inc	e
	inc	e
	inc	e
	inc	e
	inc	b
;bank13.c:725: if(CurrentMenu == menu_item_use)
	ld	a, (#_CurrentMenu)
	sub	a, #0x02
	jp	NZ,00187$
;bank13.c:727: if(selection_y < 3)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00150$
;bank13.c:729: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	d, #0x01
	push	de
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:731: selection_y += 1;
	ld	hl, #_selection_y
	ld	a, (hl)
	inc	a
;bank13.c:733: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:735: CurrentItemSlot += 1;
	ld	hl, #_CurrentItemSlot
	inc	(hl)
;bank13.c:737: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (hl)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00151$
00150$:
;bank13.c:739: else if (CurrentItemSelection < 40)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00147$
;bank13.c:741: CurrentItemSelection += 1;
	ld	hl, #_CurrentItemSelection
	ld	(hl), c
;bank13.c:743: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:745: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00151$
00147$:
;bank13.c:749: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00151$:
;bank13.c:752: Refresh_Cursors();
	call	_Refresh_Cursors
;bank13.c:754: while(joypad() & J_DOWN)
00157$:
	call	_joypad
	bit	3, e
	jp	Z,00190$
;bank13.c:756: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:758: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00157$
;bank13.c:760: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:762: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:763: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:765: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:767: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:769: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:770: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:772: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:774: while(joypad() & J_B)
00152$:
	call	_joypad
	bit	5, e
	jr	Z, 00157$
;bank13.c:776: wait_vbl_done();
	call	_wait_vbl_done
	jr	00152$
00187$:
;bank13.c:781: else if(CurrentMenu == menu_item_sort)
	ld	a, (#_CurrentMenu)
	sub	a, #0x03
	jp	NZ,00184$
;bank13.c:783: if(selection_y < 3)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00164$
;bank13.c:785: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	d, #0x01
	push	de
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:787: selection_y += 1;
	ld	hl, #_selection_y
	ld	a, (hl)
	inc	a
;bank13.c:789: set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:791: CurrentItemSlot += 1;
	ld	hl, #_CurrentItemSlot
	inc	(hl)
;bank13.c:793: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (hl)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00165$
00164$:
;bank13.c:795: else if (CurrentItemSelection < 40)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00161$
;bank13.c:797: CurrentItemSelection += 1;
	ld	hl, #_CurrentItemSelection
	ld	(hl), c
;bank13.c:799: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:801: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
	jr	00165$
00161$:
;bank13.c:805: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00165$:
;bank13.c:808: Refresh_Cursors();
	call	_Refresh_Cursors
;bank13.c:810: while(joypad() & J_DOWN)
00173$:
	call	_joypad
	bit	3, e
	jp	Z,00190$
;bank13.c:812: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:814: Blink_Item_Name();
	call	_Blink_Item_Name
;bank13.c:816: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00173$
;bank13.c:818: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:820: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:821: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:823: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:825: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:827: selection_x = 1;
	ld	hl, #_selection_x
	ld	(hl), #0x01
;bank13.c:828: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:830: if(slot_1_filled == true)
	ld	a, (#_slot_1_filled)
	dec	a
	jr	NZ, 00167$
;bank13.c:832: inventory[slot_1] = item_1;
	ld	a, #<(_inventory)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_item_1)
	ld	(bc), a
;bank13.c:833: inv_amount[slot_1] = amount_1;
	ld	a, #<(_inv_amount)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inv_amount)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_amount_1)
	ld	(bc), a
;bank13.c:835: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
00167$:
;bank13.c:838: slot_1 = 0;
	ld	hl, #_slot_1
	ld	(hl), #0x00
;bank13.c:839: amount_1 = 0;
	ld	hl, #_amount_1
	ld	(hl), #0x00
;bank13.c:840: slot_1_filled = false;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x00
;bank13.c:842: slot_2 = 0;
	ld	hl, #_slot_2
	ld	(hl), #0x00
;bank13.c:843: amount_2 = 0;
	ld	hl, #_amount_2
	ld	(hl), #0x00
;bank13.c:844: slot_2_filled = false;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x00
;bank13.c:846: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:848: while(joypad() & J_B)
00168$:
	call	_joypad
	bit	5, e
	jp	Z,00173$
;bank13.c:850: wait_vbl_done();
	call	_wait_vbl_done
	jr	00168$
00184$:
;bank13.c:855: else if(CurrentMenu == menu_item_use_win)
	ld	a, (#_CurrentMenu)
	sub	a, #0x04
	jr	NZ, 00190$
;bank13.c:857: if(party_y < party_max - 1)
	ld	hl, #_party_max
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a, (#_party_y)
	ldhl	sp,	#2
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
	jr	Z, 00773$
	bit	7, d
	jr	NZ, 00774$
	cp	a, a
	jr	00774$
00773$:
	bit	7, d
	jr	Z, 00774$
	scf
00774$:
	jr	NC, 00178$
;bank13.c:859: set_win_tiles(6, 13 + party_y, 1, 1, Item_Background);
	ld	bc, #_Item_Background+0
	ld	hl, #_party_y
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
	ld	e,#0x06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:860: party_y += 1;
	ld	hl, #_party_y
	inc	(hl)
;bank13.c:861: set_win_tiles(6, 13 + party_y, 1, 1, Item_Pointer);
	ld	bc, #_Item_Pointer+0
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
	ld	e,#0x06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:864: while(joypad() & J_DOWN)
00178$:
	call	_joypad
	bit	3, e
	jr	Z, 00190$
;bank13.c:866: wait_vbl_done();
	call	_wait_vbl_done
	jr	00178$
00190$:
;bank13.c:871: if(Joy & J_LEFT)
	ld	a, (#_Joy)
	bit	1, a
	jr	Z, 00196$
;bank13.c:873: if(CurrentMenu == menu_item)
	ld	a, (#_CurrentMenu)
	dec	a
	jr	NZ, 00196$
;bank13.c:875: if(selection_x > 0)
	ld	hl, #_selection_x
	ld	a, (hl)
	or	a, a
	jr	Z, 00196$
;bank13.c:877: selection_x -= 1;
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank13.c:879: set_win_tiles(6, 1, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0106
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:880: set_win_tiles(2, 1, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0102
	push	de
	call	_set_win_tiles
	add	sp, #6
00196$:
;bank13.c:885: if(Joy & J_RIGHT)
	ld	a, (#_Joy)
	rrca
	jr	NC, 00202$
;bank13.c:887: if(CurrentMenu == menu_item)
	ld	a, (#_CurrentMenu)
	dec	a
	jr	NZ, 00202$
;bank13.c:889: if(selection_x < 1)
	ld	hl, #_selection_x
;bank13.c:891: selection_x += 1;
	ld	a,(hl)
	cp	a,#0x01
	jr	NC, 00202$
	inc	a
	ld	(hl), a
;bank13.c:893: set_win_tiles(2, 1, 1, 1, Item_Background);
	ld	hl, #_Item_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0102
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:894: set_win_tiles(6, 1, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0106
	push	de
	call	_set_win_tiles
	add	sp, #6
00202$:
;bank13.c:899: if(Joy & J_B)
	ld	a, (#_Joy)
	bit	5, a
	jp	Z,00226$
;bank13.c:901: if(CurrentMenu == menu_item)
	ld	a, (#_CurrentMenu)
	dec	a
	jr	NZ, 00223$
;bank13.c:903: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:904: Call_Load_Menu_Main(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Load_Menu_Main
	inc	sp
	jp	00226$
00223$:
;bank13.c:906: else if(CurrentMenu == menu_item_use)
	ld	a, (#_CurrentMenu)
	sub	a, #0x02
	jr	NZ, 00220$
;bank13.c:908: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:910: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:911: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:913: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:915: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:917: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:918: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:920: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:922: while(joypad() & J_B)
00203$:
	call	_joypad
	bit	5, e
	jp	Z,00226$
;bank13.c:924: wait_vbl_done();
	call	_wait_vbl_done
	jr	00203$
00220$:
;bank13.c:927: else if(CurrentMenu == menu_item_sort)
	ld	a, (#_CurrentMenu)
	sub	a, #0x03
	jp	NZ,00217$
;bank13.c:929: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:931: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:932: CurrentItemSlot = 0;
	ld	hl, #_CurrentItemSlot
	ld	(hl), #0x00
;bank13.c:934: set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);
	ld	a, (#_selection_y)
	add	a, a
	add	a, #0x04
	ld	b, a
	ld	a, (#_selection_x)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	inc	a
	ld	hl, #_Item_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank13.c:936: set_win_tiles(1, 15, 18, 2, Null_Item_Description);
	ld	hl, #_Null_Item_Description
	push	hl
	ld	de, #0x0212
	push	de
	ld	de, #0x0f01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:938: selection_x = 1;
	ld	hl, #_selection_x
	ld	(hl), #0x01
;bank13.c:939: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:941: if(slot_1_filled == true)
	ld	a, (#_slot_1_filled)
	dec	a
	jr	NZ, 00207$
;bank13.c:943: inventory[slot_1] = item_1;
	ld	bc, #_inventory+0
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	jr	NC, 00792$
	inc	b
00792$:
	ld	a, (#_item_1)
	ld	(bc), a
;bank13.c:944: inv_amount[slot_1] = amount_1;
	ld	bc, #_inv_amount+0
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	jr	NC, 00793$
	inc	b
00793$:
	ld	a, (#_amount_1)
	ld	(bc), a
;bank13.c:946: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
00207$:
;bank13.c:949: slot_1 = 0;
	ld	hl, #_slot_1
	ld	(hl), #0x00
;bank13.c:950: amount_1 = 0;
	ld	hl, #_amount_1
	ld	(hl), #0x00
;bank13.c:951: slot_1_filled = false;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x00
;bank13.c:953: slot_2 = 0;
	ld	hl, #_slot_2
	ld	(hl), #0x00
;bank13.c:954: amount_2 = 0;
	ld	hl, #_amount_2
	ld	(hl), #0x00
;bank13.c:955: slot_2_filled = false;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x00
;bank13.c:957: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:959: while(joypad() & J_B)
00208$:
	call	_joypad
	bit	5, e
	jr	Z, 00226$
;bank13.c:961: wait_vbl_done();
	call	_wait_vbl_done
	jr	00208$
00217$:
;bank13.c:964: else if(CurrentMenu == menu_item_use_win)
	ld	a, (#_CurrentMenu)
	sub	a, #0x04
	jr	NZ, 00226$
;bank13.c:966: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:968: CurrentMenu = menu_item_use;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x02
;bank13.c:969: set_win_map(5, 12, 15, 6, Map_Item_Use_ReplacePLN1, Map_Item_Use_ReplacePLN0);
	ld	hl, #_Map_Item_Use_ReplacePLN0
	push	hl
	ld	hl, #_Map_Item_Use_ReplacePLN1
	push	hl
	ld	de, #0x060f
	push	de
	ld	de, #0x0c05
	push	de
	call	_set_win_map
	add	sp, #8
;bank13.c:971: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:973: Refresh_Item_Menu();
	call	_Refresh_Item_Menu
;bank13.c:975: Reset_Pointer();
	call	_Reset_Pointer
;bank13.c:977: party_y = 0;
	ld	hl, #_party_y
	ld	(hl), #0x00
;bank13.c:979: while(joypad() & J_B)
00211$:
	call	_joypad
	bit	5, e
	jr	Z, 00226$
;bank13.c:981: wait_vbl_done();
	call	_wait_vbl_done
	jr	00211$
00226$:
;bank13.c:575: if(Joy & J_UP)
	ld	a, (#_Joy)
	ldhl	sp,	#3
	ld	(hl), a
;bank13.c:986: if(Joy & J_A || Joy & J_START)
	bit	4, (hl)
	jr	NZ, 00287$
	ldhl	sp,	#3
	bit	7, (hl)
	jp	Z,00290$
00287$:
;bank13.c:988: if(CurrentMenu == menu_item)
	ld	a, (#_CurrentMenu)
	dec	a
	jp	NZ,00285$
;bank13.c:990: if(selection_x == 0)
	ld	a, (#_selection_x)
	or	a, a
	jr	NZ, 00238$
;bank13.c:992: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:994: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:996: set_win_tiles(1, 4, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:998: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:999: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:1001: CurrentMenu = menu_item_use;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x02
;bank13.c:1003: while(joypad() & J_A || joypad() & J_START)
00228$:
	call	_joypad
	bit	4, e
	jr	NZ, 00229$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,00290$
00229$:
;bank13.c:1005: wait_vbl_done();
	call	_wait_vbl_done
	jr	00228$
00238$:
;bank13.c:1008: else if(selection_x == 1)
	ld	a, (#_selection_x)
	dec	a
	jp	NZ,00290$
;bank13.c:1010: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:1012: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	bc, #_inventory+0
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:1014: set_win_tiles(1, 4, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:1016: selection_x = 0;
	ld	hl, #_selection_x
	ld	(hl), #0x00
;bank13.c:1017: selection_y = 0;
	ld	hl, #_selection_y
	ld	(hl), #0x00
;bank13.c:1019: CurrentMenu = menu_item_sort;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x03
;bank13.c:1021: while(joypad() & J_A || joypad() & J_START)
00232$:
	call	_joypad
	bit	4, e
	jr	NZ, 00233$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,00290$
00233$:
;bank13.c:1023: wait_vbl_done();
	call	_wait_vbl_done
	jr	00232$
00285$:
;bank13.c:589: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;bank13.c:1027: else if(CurrentMenu == menu_item_use)
	ld	a, (#_CurrentMenu)
	sub	a, #0x02
	jp	NZ,00282$
;bank13.c:1029: slot_1 = CurrentItemSlot + CurrentItemSelection;
	ldhl	sp,	#3
	ld	a, (hl)
;bank13.c:1031: if(inventory[slot_1] != 0)
	ld	(#_slot_1),a
	add	a,#<(_inventory)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	Z, 00250$
;bank13.c:1033: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:1035: Draw_Party_Window(Get_Item(inventory[slot_1]));
	ld	a, #<(_inventory)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Party_Window
	add	sp, #2
;bank13.c:1037: set_win_tiles(6, 13, 1, 1, Item_Pointer);
	ld	hl, #_Item_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d06
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank13.c:1039: if(party[1] == 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	NZ, 00247$
;bank13.c:1041: party_max = 1;
	ld	hl, #_party_max
	ld	(hl), #0x01
	jr	00248$
00247$:
;bank13.c:1043: else if(party[2] == 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	NZ, 00244$
;bank13.c:1045: party_max = 2;
	ld	hl, #_party_max
	ld	(hl), #0x02
	jr	00248$
00244$:
;bank13.c:1047: else if(party[3] == 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	NZ, 00241$
;bank13.c:1049: party_max = 3;
	ld	hl, #_party_max
	ld	(hl), #0x03
	jr	00248$
00241$:
;bank13.c:1053: party_max = 0;
	ld	hl, #_party_max
	ld	(hl), #0x00
00248$:
;bank13.c:1056: party_y = 0;
	ld	hl, #_party_y
	ld	(hl), #0x00
;bank13.c:1058: CurrentMenu = menu_item_use_win;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x04
	jr	00253$
00250$:
;bank13.c:1062: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank13.c:1065: while(joypad() & J_A || joypad() & J_START)
00253$:
	call	_joypad
	bit	4, e
	jr	NZ, 00254$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,00290$
00254$:
;bank13.c:1067: wait_vbl_done();
	call	_wait_vbl_done
	jr	00253$
00282$:
;bank13.c:1070: else if(CurrentMenu == menu_item_sort)
	ld	a, (#_CurrentMenu)
	sub	a, #0x03
	jp	NZ,00279$
;bank13.c:1072: if(slot_1_filled == false && inventory[CurrentItemSlot + CurrentItemSelection] != 0)
	ld	a, (#_slot_1_filled)
	or	a, a
	jr	NZ, 00262$
	ld	bc, #_inventory+0
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jr	Z, 00262$
;bank13.c:1074: Call_Play_Confirm(bank13);
	push	bc
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
	pop	bc
;bank13.c:1076: slot_1 = CurrentItemSlot + CurrentItemSelection;
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
;bank13.c:1077: item_1 = inventory[slot_1];
	ld	(#_slot_1),a
	add	a,c
	ld	c, a
	jr	NC, 00818$
	inc	b
00818$:
	ld	a, (bc)
	ld	(#_item_1),a
;bank13.c:1078: amount_1 = inv_amount[slot_1];
	ld	bc, #_inv_amount+0
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	c, a
	jr	NC, 00819$
	inc	b
00819$:
	ld	a, (bc)
	ld	(#_amount_1),a
;bank13.c:1080: slot_1_filled = true;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x01
;bank13.c:1082: slot_selected = CurrentItemSlot;
	ld	a, (#_CurrentItemSlot)
	ld	(#_slot_selected),a
;bank13.c:1084: Hide_Item_Name();
	call	_Hide_Item_Name
	jr	00263$
00262$:
;bank13.c:1086: else if(slot_2_filled == false && inventory[CurrentItemSlot + CurrentItemSelection] != 0 && CurrentItemSlot + CurrentItemSelection != slot_1)
	ld	a, (#_slot_2_filled)
	or	a, a
	jr	NZ, 00257$
;c
	ld	de, #_inventory
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00257$
	ld	hl, #_CurrentItemSlot
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_CurrentItemSelection
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #_slot_1
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00820$
	ld	a, d
	sub	a, b
	jr	Z, 00257$
00820$:
;bank13.c:1088: Call_Play_Confirm(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank13.c:1090: slot_2 = CurrentItemSlot + CurrentItemSelection;
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
;bank13.c:1091: item_2 = inventory[slot_2];
	ld	(#_slot_2),a
	add	a,#<(_inventory)
	ld	c, a
	ld	a, #>(_inventory)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(#_item_2),a
;bank13.c:1092: amount_2 = inv_amount[slot_2];
	ld	bc, #_inv_amount+0
	ld	a, c
	ld	hl, #_slot_2
	add	a, (hl)
	ld	c, a
	jr	NC, 00821$
	inc	b
00821$:
	ld	a, (bc)
	ld	(#_amount_2),a
;bank13.c:1094: slot_2_filled = true;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x01
	jr	00263$
00257$:
;bank13.c:1098: Call_Play_Buzz(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
00263$:
;bank13.c:1101: if(slot_1_filled == true && slot_2_filled == true)
	ld	a, (#_slot_1_filled)
	dec	a
	jr	NZ, 00269$
	ld	a, (#_slot_2_filled)
	dec	a
	jr	NZ, 00269$
;bank13.c:1103: inventory[slot_2] = item_1;
	ld	bc, #_inventory+0
	ld	a, c
	ld	hl, #_slot_2
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (#_item_1)
	ld	(de), a
;bank13.c:1104: inv_amount[slot_2] = amount_1;
	ld	a, #<(_inv_amount)
	ld	hl, #_slot_2
	add	a, (hl)
	ld	e, a
	ld	a, #>(_inv_amount)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_amount_1)
	ld	(de), a
;bank13.c:1106: inventory[slot_1] = item_2;
	ld	a, c
	ld	hl, #_slot_1
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (#_item_2)
	ld	(de), a
;bank13.c:1107: inv_amount[slot_1] = amount_2;
	ld	a, #<(_inv_amount)
	ld	hl, #_slot_1
	add	a, (hl)
	ld	e, a
	ld	a, #>(_inv_amount)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_amount_2)
	ld	(de), a
;bank13.c:1109: Refresh_Item_Menu();
	push	bc
	call	_Refresh_Item_Menu
	pop	bc
;bank13.c:1111: Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
	ld	a, (#_CurrentItemSlot)
	ld	hl, #_CurrentItemSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Draw_Item_Description
	add	sp, #2
;bank13.c:1113: slot_1_filled = false;
	ld	hl, #_slot_1_filled
	ld	(hl), #0x00
;bank13.c:1114: slot_2_filled = false;
	ld	hl, #_slot_2_filled
	ld	(hl), #0x00
;bank13.c:1117: while(joypad() & J_A || joypad() & J_START)
00269$:
	call	_joypad
	bit	4, e
	jr	NZ, 00270$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00290$
00270$:
;bank13.c:1119: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:1121: Blink_Item_Name();
	call	_Blink_Item_Name
	jr	00269$
00279$:
;bank13.c:1124: else if(CurrentMenu == menu_item_use_win)
	ld	a, (#_CurrentMenu)
	sub	a, #0x04
	jr	NZ, 00290$
;bank13.c:1126: Use_Item_Win(Get_Actor(party[party_y]), Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
;c
	ld	de, #_inventory
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	c, e
	ld	b, d
	ld	a, #<(_party)
	ld	hl, #_party_y
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
	push	de
	call	_Use_Item_Win
	add	sp, #4
;bank13.c:1128: while(joypad() & J_A || joypad() & J_START)
00273$:
	call	_joypad
	bit	4, e
	jr	NZ, 00274$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00290$
00274$:
;bank13.c:1130: wait_vbl_done();
	call	_wait_vbl_done
	jr	00273$
00290$:
;bank13.c:1134: }
	add	sp, #4
	ret
;bank13.c:1136: void Menu_Item()
;	---------------------------------
; Function Menu_Item
; ---------------------------------
_Menu_Item::
;bank13.c:1138: CurrentMenu = menu_item;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank13.c:1139: Draw_Item_Menu();
	call	_Draw_Item_Menu
;bank13.c:1141: while(joypad() & J_A || joypad() & J_START)
00102$:
	call	_joypad
	bit	4, e
	jr	NZ, 00103$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00106$
00103$:
;bank13.c:1143: wait_vbl_done();
	call	_wait_vbl_done
	jr	00102$
;bank13.c:1146: while(true)
00106$:
;bank13.c:1148: wait_vbl_done();
	call	_wait_vbl_done
;bank13.c:1150: Menu_Item_Joypad();
	call	_Menu_Item_Joypad
;bank13.c:1152: Blink_Item_Name();
	call	_Blink_Item_Name
;bank13.c:1154: }
	jr	00106$
	.area _CODE_13
	.area _CABS (ABS)
