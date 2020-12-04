;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank15
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Menu_Skills
	.globl _Menu_Skills
	.globl _Menu_Skills_Joypad
	.globl _Draw_Menu_Skills
	.globl _Draw_Actor_Skills
	.globl _Draw_Skill
	.globl _Draw_Skills_Class
	.globl _Draw_Skills_Number
	.globl _Call_Play_Confirm
	.globl _Call_Play_Buzz
	.globl _Get_Skill_Useable
	.globl _Get_Required_AP
	.globl _Call_Set_Actor_Skills
	.globl _Call_Menu_Main
	.globl _Call_Load_Menu_Main
	.globl _Call_Draw_Skills_Name
	.globl _Call_Draw_Name
	.globl _Get_Skill
	.globl _Get_Class
	.globl _Get_Actor
	.globl _fade_in
	.globl _fade_out
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Skills_Learned
	.globl _Skills_Border
	.globl _Skills_Slash
	.globl _Skills_Background
	.globl _Skills_Pointer
	.globl _Map_Menu_BlankPLN1
	.globl _Map_Menu_BlankPLN0
	.globl _Map_Menu_SkillsPLN1
	.globl _Map_Menu_SkillsPLN0
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
	.area _CODE_15
;bank15.c:79: void Draw_Skills_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skills_Number
; ---------------------------------
_Draw_Skills_Number::
;bank15.c:81: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank15.c:83: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank15.c:85: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank15.c:87: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank15.c:89: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank15.c:87: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank15.c:92: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank15.c:94: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank15.c:95: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank15.c:98: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank15.c:99: parsed_number = 0;
	ld	(hl), #0x00
;bank15.c:101: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank15.c:103: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank15.c:104: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank15.c:107: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank15.c:108: parsed_number = 0;
	ld	(hl), #0x00
;bank15.c:110: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank15.c:112: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank15.c:113: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank15.c:116: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank15.c:118: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank15.c:120: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank15.c:121: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank15.c:122: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank15.c:123: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank15.c:127: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank15.c:125: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank15.c:127: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
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
;bank15.c:129: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank15.c:131: set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
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
;bank15.c:133: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank15.c:135: set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
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
;bank15.c:139: set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
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
;bank15.c:142: }
	ret
_Map_Menu_SkillsPLN0:
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
	.db #0x07	; 7
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
_Map_Menu_SkillsPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_BlankPLN0:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_Map_Menu_BlankPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Skills_Pointer:
	.db #0x0a	; 10
_Skills_Background:
	.db #0x01	; 1
_Skills_Slash:
	.db #0x0f	; 15
_Skills_Border:
	.db #0x09	; 9
_Skills_Learned:
	.db #0x46	; 70	'F'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x23	; 35
	.db #0x1a	; 26
	.db #0x19	; 25
;bank15.c:144: void Draw_Skills_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skills_Class
; ---------------------------------
_Draw_Skills_Class::
;bank15.c:146: set_win_tiles(tile_x, tile_y, 1, 1, icon);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0101
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
;bank15.c:147: set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
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
;bank15.c:148: }
	ret
;bank15.c:150: void Draw_Skill(GameActor* actor, UBYTE skill_id, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skill
; ---------------------------------
_Draw_Skill::
	add	sp, #-3
;bank15.c:152: Call_Draw_Skills_Name(bank15, Get_Skill(skill_id), tile_x, tile_y);
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Draw_Skills_Name
	add	sp, #5
;bank15.c:154: if(actor->skill_ap[skill_id] == Get_Required_AP(bank15, Get_Skill(skill_id)))
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x002e
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	pop	bc
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
;bank15.c:156: set_win_tiles(tile_x + 10, tile_y, 7, 1, Skills_Learned);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;bank15.c:154: if(actor->skill_ap[skill_id] == Get_Required_AP(bank15, Get_Skill(skill_id)))
	ld	a, c
	sub	a, e
	jr	NZ, 00108$
	ld	a, b
	sub	a, d
	jr	NZ, 00108$
;bank15.c:156: set_win_tiles(tile_x + 10, tile_y, 7, 1, Skills_Learned);
	ld	bc, #_Skills_Learned+0
	ld	a, (hl)
	add	a, #0x0a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x07
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
	jp	00110$
00108$:
;bank15.c:160: Draw_Skills_Number(actor->skill_ap[skill_id], 9 + tile_x, tile_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x09
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_Draw_Skills_Number
	add	sp, #4
;bank15.c:162: set_win_tiles(tile_x + 13, tile_y, 1, 1, Skills_Slash);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0d
	inc	hl
	ld	(hl), a
	ld	hl, #_Skills_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank15.c:164: if(Get_Required_AP(bank15, Get_Skill(skill_id)) < 10)
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00105$
;bank15.c:166: Draw_Skills_Number(Get_Required_AP(bank15, Get_Skill(skill_id)), 11 + tile_x, tile_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0b
	ld	b, a
	push	bc
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_Draw_Skills_Number
	add	sp, #4
	jr	00110$
00105$:
;bank15.c:168: else if(Get_Required_AP(bank15, Get_Skill(skill_id)) < 100)
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00102$
;bank15.c:170: Draw_Skills_Number(Get_Required_AP(bank15, Get_Skill(skill_id)), 12 + tile_x, tile_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0c
	ld	b, a
	push	bc
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_Draw_Skills_Number
	add	sp, #4
	jr	00110$
00102$:
;bank15.c:174: Draw_Skills_Number(Get_Required_AP(bank15, Get_Skill(skill_id)), 13 + tile_x, tile_y);
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Required_AP
	add	sp, #3
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Skills_Number
	add	sp, #4
00110$:
;bank15.c:177: }
	add	sp, #3
	ret
;bank15.c:179: void Draw_Actor_Skills(UBYTE skill_position)
;	---------------------------------
; Function Draw_Actor_Skills
; ---------------------------------
_Draw_Actor_Skills::
;bank15.c:181: if(Get_Actor(party[actor_y])->skills[skill_position] > 0)
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	b, (hl)
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;bank15.c:183: Draw_Skill(Get_Actor(party[actor_y]), Get_Actor(party[actor_y])->skills[skill_position], 2, 4);
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
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
	push	bc
	ld	hl, #0x0402
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	de
	call	_Draw_Skill
	add	sp, #5
	pop	bc
00102$:
;bank15.c:186: if(Get_Actor(party[actor_y])->skills[skill_position + 1] > 0)
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
	ld	hl, #0x0024
	add	hl, de
	ld	c, b
	inc	c
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;bank15.c:188: Draw_Skill(Get_Actor(party[actor_y]), Get_Actor(party[actor_y])->skills[skill_position + 1], 2, 6);
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
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
	push	bc
	ld	hl, #0x0602
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	de
	call	_Draw_Skill
	add	sp, #5
	pop	bc
00104$:
;bank15.c:191: if(Get_Actor(party[actor_y])->skills[skill_position + 2] > 0)
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
	ld	hl, #0x0024
	add	hl, de
	ld	c, b
	inc	c
	inc	c
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;bank15.c:193: Draw_Skill(Get_Actor(party[actor_y]), Get_Actor(party[actor_y])->skills[skill_position + 2], 2, 8);
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
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
	push	bc
	ld	hl, #0x0802
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	de
	call	_Draw_Skill
	add	sp, #5
	pop	bc
00106$:
;bank15.c:196: if(Get_Actor(party[actor_y])->skills[skill_position + 3] > 0)
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
	ld	hl, #0x0024
	add	hl, de
	ld	c, b
	inc	c
	inc	c
	inc	c
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;bank15.c:198: Draw_Skill(Get_Actor(party[actor_y]), Get_Actor(party[actor_y])->skills[skill_position + 3], 2, 10);
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
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
	push	bc
	ld	hl, #0x0a02
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	de
	call	_Draw_Skill
	add	sp, #5
	pop	bc
00108$:
;bank15.c:201: if(Get_Actor(party[actor_y])->skills[skill_position + 4] > 0)
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
	ld	hl, #0x0024
	add	hl, de
	inc	b
	inc	b
	inc	b
	inc	b
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	ret	Z
;bank15.c:203: Draw_Skill(Get_Actor(party[actor_y]), Get_Actor(party[actor_y])->skills[skill_position + 4], 2, 12);
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
	ld	hl, #0x0024
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
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
	ld	hl, #0x0c02
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	de
	call	_Draw_Skill
	add	sp, #5
;bank15.c:205: }
	ret
;bank15.c:207: void Draw_Menu_Skills()
;	---------------------------------
; Function Draw_Menu_Skills
; ---------------------------------
_Draw_Menu_Skills::
	add	sp, #-2
;bank15.c:209: fade_out();
	call	_fade_out
;bank15.c:211: CurrentMenu = menu_status;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x08
;bank15.c:213: skills_y = 0;
	ld	hl, #_skills_y
	ld	(hl), #0x00
;bank15.c:215: set_win_tiles(0, 0, 20, 18, Map_Menu_SkillsPLN0);
	ld	hl, #_Map_Menu_SkillsPLN0
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank15.c:217: set_win_tiles(1, 4, 1, 1, Skills_Pointer);
	ld	hl, #_Skills_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:219: Call_Set_Actor_Skills(bank15, Get_Actor(party[0]));
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank15.c:220: Call_Set_Actor_Skills(bank15, Get_Actor(party[1]));
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank15.c:221: Call_Set_Actor_Skills(bank15, Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank15.c:222: Call_Set_Actor_Skills(bank15, Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Set_Actor_Skills
	add	sp, #3
;bank15.c:224: Call_Draw_Name(bank15, 2, 1, Get_Actor(party[actor_y])->name, true);
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
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank15.c:225: Draw_Skills_Number(Get_Actor(party[actor_y])->level, 9, 1);
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
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0109
	push	de
	push	bc
	call	_Draw_Skills_Number
	add	sp, #4
;bank15.c:226: Draw_Skills_Class(Get_Class(Get_Actor(party[actor_y])->class)->name, Get_Class(Get_Actor(party[actor_y])->class)->icon, 14, 1);
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
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Class
	inc	sp
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
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
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Class
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x010e
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Skills_Class
	add	sp, #6
;bank15.c:228: Draw_Actor_Skills(0);
	xor	a, a
	push	af
	inc	sp
	call	_Draw_Actor_Skills
	inc	sp
;bank15.c:230: fade_in();
	call	_fade_in
;bank15.c:231: }
	add	sp, #2
	ret
;bank15.c:233: void Menu_Skills_Joypad()
;	---------------------------------
; Function Menu_Skills_Joypad
; ---------------------------------
_Menu_Skills_Joypad::
	add	sp, #-3
;bank15.c:235: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank15.c:237: if(Joy & J_UP)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;bank15.c:239: if(CurrentMenu == menu_skills)
	ld	a, (#_CurrentMenu)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00261$
	xor	a, a
00261$:
	ldhl	sp,	#1
	ld	(hl), a
;bank15.c:254: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Background);
	ld	a, (#_actor_y)
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ldhl	sp,	#2
;bank15.c:237: if(Joy & J_UP)
	ld	(hl-), a
	dec	hl
	bit	2, (hl)
	jp	Z,00146$
;bank15.c:239: if(CurrentMenu == menu_skills)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;bank15.c:241: if(skills_y > 0)
	ld	hl, #_skills_y
	ld	a, (hl)
	or	a, a
	jp	Z, 00148$
;bank15.c:243: set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Background);
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	ld	hl, #_Skills_Background
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
	call	_set_win_tiles
	add	sp, #6
;bank15.c:245: skills_y -= 1;
	ld	hl, #_skills_y
	ld	a, (hl)
	add	a, #0xff
;bank15.c:247: set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x04
	ld	hl, #_Skills_Pointer
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
	call	_set_win_tiles
	add	sp, #6
	jp	00148$
00109$:
;bank15.c:252: if(actor_y > 0)
	ld	a, (#_actor_y)
	or	a, a
	jr	Z, 00105$
;bank15.c:254: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Background);
	ld	hl, #_Skills_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:256: actor_y -= 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank15.c:258: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Pointer);
	ld	bc, #_Skills_Pointer+0
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
;bank15.c:261: while(joypad() & J_UP)
00105$:
	call	_joypad
	bit	2, e
	jp	Z,00148$
;bank15.c:263: wait_vbl_done();
	call	_wait_vbl_done
	jr	00105$
00146$:
;bank15.c:268: else if(Joy & J_DOWN)
	ldhl	sp,	#0
	bit	3, (hl)
	jp	Z,00143$
;bank15.c:270: if(CurrentMenu == menu_skills)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
;bank15.c:272: if(skills_y < 5 && Get_Actor(party[actor_y])->skills[skills_y + 1] > 0)
	ld	a, (#_skills_y)
	sub	a, #0x05
	jp	NC, 00148$
	ld	bc, #_party+0
	ld	a, c
	ld	hl, #_actor_y
	add	a, (hl)
	ld	c, a
	jr	NC, 00265$
	inc	b
00265$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_skills_y)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00148$
;bank15.c:274: set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Background);
	ld	bc, #_Skills_Background+0
	ld	hl, #_skills_y
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
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:276: skills_y += 1;
	ld	hl, #_skills_y
	inc	(hl)
;bank15.c:278: set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Pointer);
	ld	bc, #_Skills_Pointer+0
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
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
	jp	00148$
00120$:
;bank15.c:283: if(actor_y < actor_max - 1)
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
	jr	Z, 00266$
	bit	7, d
	jr	NZ, 00267$
	cp	a, a
	jr	00267$
00266$:
	bit	7, d
	jr	Z, 00267$
	scf
00267$:
	jr	NC, 00116$
;bank15.c:285: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Background);
	ld	hl, #_Skills_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:287: actor_y += 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	inc	a
;bank15.c:289: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Pointer);
	ld	(hl), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ld	hl, #_Skills_Pointer
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
;bank15.c:292: while(joypad() & J_DOWN)
00116$:
	call	_joypad
	bit	3, e
	jp	Z,00148$
;bank15.c:294: wait_vbl_done();
	call	_wait_vbl_done
	jr	00116$
00143$:
;bank15.c:299: else if(Joy & J_A)
	ldhl	sp,	#0
	bit	4, (hl)
	jr	Z, 00140$
;bank15.c:301: if(CurrentMenu == menu_skills)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00132$
;bank15.c:303: u_x = Get_Actor(party[actor_y])->skills[skills_y];
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
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_skills_y
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
;bank15.c:305: if(Get_Skill_Useable(bank15, Get_Skill(u_x)) == true)
	ld	(#_u_x), a
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Get_Skill_Useable
	add	sp, #3
	ld	a, e
	dec	a
	or	a, d
	jr	Z, 00125$
;bank15.c:311: Call_Play_Buzz(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank15.c:314: while(joypad() & J_A)
00125$:
	call	_joypad
	bit	4, e
	jp	Z,00148$
;bank15.c:316: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00125$
00132$:
;bank15.c:321: Call_Play_Confirm(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank15.c:323: Draw_Menu_Skills();
	call	_Draw_Menu_Skills
;bank15.c:325: CurrentMenu = menu_skills;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x0a
;bank15.c:327: while(joypad() & J_A)
00128$:
	call	_joypad
	bit	4, e
	jr	Z, 00148$
;bank15.c:329: wait_vbl_done();
	call	_wait_vbl_done
	jr	00128$
00140$:
;bank15.c:334: else if(Joy & J_B)
	ldhl	sp,	#0
	bit	5, (hl)
	jr	Z, 00148$
;bank15.c:336: if(CurrentMenu == menu_skills)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
;bank15.c:338: Call_Play_Confirm(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank15.c:339: Call_Load_Menu_Main(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Load_Menu_Main
	inc	sp
	jr	00148$
00135$:
;bank15.c:343: Call_Play_Confirm(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank15.c:345: set_win_tiles(9, 2, 1, 1, Skills_Background);
	ld	bc, #_Skills_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:346: set_win_tiles(9, 5, 1, 1, Skills_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0509
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:347: set_win_tiles(9, 8, 1, 1, Skills_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0809
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:348: set_win_tiles(9, 10, 1, 1, Skills_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:350: Call_Menu_Main(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_Call_Menu_Main
	inc	sp
00148$:
;bank15.c:353: }
	add	sp, #3
	ret
;bank15.c:355: void Menu_Skills()
;	---------------------------------
; Function Menu_Skills
; ---------------------------------
_Menu_Skills::
;bank15.c:357: while(1)
00102$:
;bank15.c:359: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank15.c:361: Menu_Skills_Joypad();
	call	_Menu_Skills_Joypad
;bank15.c:363: }
	jr	00102$
;bank15.c:365: void Load_Menu_Skills()
;	---------------------------------
; Function Load_Menu_Skills
; ---------------------------------
_Load_Menu_Skills::
;bank15.c:367: if(party[1] == 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	NZ, 00108$
;bank15.c:369: actor_max = 1;
	ld	hl, #_actor_max
	ld	(hl), #0x01
	jr	00109$
00108$:
;bank15.c:371: else if(party[2] == 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	NZ, 00105$
;bank15.c:373: actor_max = 2;
	ld	hl, #_actor_max
	ld	(hl), #0x02
	jr	00109$
00105$:
;bank15.c:375: else if(party[3] == 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	NZ, 00102$
;bank15.c:377: actor_max = 3;
	ld	hl, #_actor_max
	ld	(hl), #0x03
	jr	00109$
00102$:
;bank15.c:381: actor_max = 0;
	ld	hl, #_actor_max
	ld	(hl), #0x00
00109$:
;bank15.c:384: set_win_tiles(9, 2, 1, 1, Skills_Pointer);
	ld	hl, #_Skills_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank15.c:386: actor_y = 0;
	ld	hl, #_actor_y
	ld	(hl), #0x00
;bank15.c:388: while(joypad() & J_A || joypad() & J_START)
00111$:
	call	_joypad
	bit	4, e
	jr	NZ, 00112$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,_Menu_Skills
00112$:
;bank15.c:390: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank15.c:393: Menu_Skills();
;bank15.c:394: }
	jr	00111$
	.area _CODE_15
	.area _CABS (ABS)
