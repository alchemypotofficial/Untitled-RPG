;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank14
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Menu_Status
	.globl _Menu_Status
	.globl _Menu_Status_Joypad
	.globl _Draw_Menu_Status
	.globl _Draw_Status_Stats
	.globl _Draw_Status_Class
	.globl _Draw_Status_Number
	.globl _Call_Play_Confirm
	.globl _Call_Menu_Main
	.globl _Call_Load_Menu_Main
	.globl _Call_Draw_Name
	.globl _Get_Class
	.globl _Get_Equip
	.globl _Get_Actor
	.globl _fade_in
	.globl _fade_out
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Status_Border
	.globl _Status_Slash
	.globl _Status_Background
	.globl _Status_Pointer
	.globl _Experience_List
	.globl _Map_Menu_StatusPLN1
	.globl _Map_Menu_StatusPLN0
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
	.area _CODE_14
;bank14.c:75: void Draw_Status_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Status_Number
; ---------------------------------
_Draw_Status_Number::
;bank14.c:77: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank14.c:79: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank14.c:81: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank14.c:83: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank14.c:85: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank14.c:83: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank14.c:88: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank14.c:90: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank14.c:91: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank14.c:94: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank14.c:95: parsed_number = 0;
	ld	(hl), #0x00
;bank14.c:97: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank14.c:99: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank14.c:100: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank14.c:103: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank14.c:104: parsed_number = 0;
	ld	(hl), #0x00
;bank14.c:106: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank14.c:108: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank14.c:109: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank14.c:112: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank14.c:114: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank14.c:116: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank14.c:117: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank14.c:118: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank14.c:119: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank14.c:123: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank14.c:121: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank14.c:123: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
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
;bank14.c:125: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank14.c:127: set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
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
;bank14.c:129: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank14.c:131: set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
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
;bank14.c:135: set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
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
;bank14.c:138: }
	ret
_Map_Menu_StatusPLN0:
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
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
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
	.db #0x09	; 9
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
	.db #0x42	; 66	'B'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x2a	; 42
	.db #0x27	; 39
	.db #0x55	; 85	'U'
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
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1e	; 30
	.db #0x29	; 41
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x47	; 71	'G'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
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
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x21	; 33
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
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x3b	; 59
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x55	; 85	'U'
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
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x46	; 70	'F'
	.db #0x2b	; 43
	.db #0x18	; 24
	.db #0x20	; 32
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
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Menu_StatusPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Experience_List:
	.dw #0x0032
	.dw #0x0070
	.dw #0x00cc
	.dw #0x0149
	.dw #0x01e5
	.dw #0x02a0
	.dw #0x037a
	.dw #0x0471
	.dw #0x0589
	.dw #0x06bb
	.dw #0x080d
	.dw #0x0979
	.dw #0x0b01
	.dw #0x0ca5
	.dw #0x0e61
	.dw #0x1037
	.dw #0x1225
	.dw #0x142a
	.dw #0x1645
	.dw #0x1876
	.dw #0x1aba
	.dw #0x1d12
	.dw #0x1f7d
	.dw #0x21f6
	.dw #0x2482
	.dw #0x271a
	.dw #0x29c2
	.dw #0x2c75
	.dw #0x2f33
	.dw #0x31fd
	.dw #0x3533
	.dw #0x37aa
	.dw #0x3a8b
	.dw #0x3d73
	.dw #0x4060
_Status_Pointer:
	.db #0x0a	; 10
_Status_Background:
	.db #0x01	; 1
_Status_Slash:
	.db #0x0f	; 15
_Status_Border:
	.db #0x09	; 9
;bank14.c:140: void Draw_Status_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Status_Class
; ---------------------------------
_Draw_Status_Class::
;bank14.c:142: set_win_tiles(tile_x, tile_y, 1, 1, icon);
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
;bank14.c:143: set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
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
;bank14.c:144: }
	ret
;bank14.c:146: void Draw_Status_Stats(GameActor* actor)
;	---------------------------------
; Function Draw_Status_Stats
; ---------------------------------
_Draw_Status_Stats::
	add	sp, #-10
;bank14.c:148: if(actor->max_health > 9)
	ldhl	sp,	#12
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
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank14.c:151: Draw_Status_Number(actor->health, 4, 7);
;c
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
;bank14.c:148: if(actor->max_health > 9)
	ldhl	sp,	#8
	ld	a, #0x09
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00102$
;bank14.c:150: set_win_tiles(8, 7, 1, 1, Status_Slash);
	ld	hl, #_Status_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0708
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:151: Draw_Status_Number(actor->health, 4, 7);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0704
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:152: Draw_Status_Number(actor->max_health, 5, 8);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0805
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
	jr	00103$
00102$:
;bank14.c:156: set_win_tiles(7, 7, 1, 1, Status_Slash);
	ld	hl, #_Status_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0707
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:157: Draw_Status_Number(actor->health, 3, 7);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0703
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:158: Draw_Status_Number(actor->max_health, 4, 8);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0804
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
00103$:
;bank14.c:161: if(actor->max_mana > 9)
;c
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank14.c:164: Draw_Status_Number(actor->mana, 4, 10);
;c
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;bank14.c:161: if(actor->max_mana > 9)
	ldhl	sp,	#6
	ld	a, #0x09
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00105$
;bank14.c:163: set_win_tiles(8, 10, 1, 1, Status_Slash);
	ld	hl, #_Status_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a08
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:164: Draw_Status_Number(actor->mana, 4, 10);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	bc
	ld	de, #0x0a04
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:165: Draw_Status_Number(actor->max_mana, 5, 11);
	pop	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0b05
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
	jr	00106$
00105$:
;bank14.c:169: set_win_tiles(7, 10, 1, 1, Status_Slash);
	ld	hl, #_Status_Slash
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0a07
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:170: Draw_Status_Number(actor->mana, 3, 10);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	bc
	ld	de, #0x0a03
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:171: Draw_Status_Number(actor->max_mana, 4, 11);
	pop	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0b04
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
00106$:
;bank14.c:174: Draw_Status_Number(actor->phys_def + Get_Equip(actor->equipped[weapon_slot])->phys_def + Get_Equip(actor->equipped[secondary_slot])->phys_def + Get_Equip(actor->equipped[armor_slot])->phys_def + Get_Equip(actor->equipped[accessory_slot])->phys_def, 5, 13);
;c
	pop	de
	push	de
	ld	hl, #0x0017
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;c
	pop	de
	push	de
	ld	hl, #0x001e
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
;c
	pop	de
	push	de
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
;c
	pop	de
	push	de
	ld	hl, #0x0020
	add	hl, de
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
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;c
	pop	de
	push	de
	ld	hl, #0x0021
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
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
	ld	hl, #0x000e
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0d05
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:175: Draw_Status_Number(actor->magic_def + Get_Equip(actor->equipped[weapon_slot])->magic_def + Get_Equip(actor->equipped[secondary_slot])->magic_def + Get_Equip(actor->equipped[armor_slot])->magic_def + Get_Equip(actor->equipped[accessory_slot])->magic_def, 5, 15);
;c
	pop	de
	push	de
	ld	hl, #0x0019
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
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
	ldhl	sp,#8
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
	ld	de, #0x0f05
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:177: Draw_Status_Number(actor->strength + Get_Equip(actor->equipped[weapon_slot])->strength + Get_Equip(actor->equipped[secondary_slot])->strength + Get_Equip(actor->equipped[armor_slot])->strength + Get_Equip(actor->equipped[accessory_slot])->strength, 15, 7);
;c
	pop	de
	push	de
	ld	hl, #0x000f
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
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
	ld	de, #0x070f
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:178: Draw_Status_Number(actor->wisdom + Get_Equip(actor->equipped[weapon_slot])->wisdom + Get_Equip(actor->equipped[secondary_slot])->wisdom + Get_Equip(actor->equipped[armor_slot])->wisdom + Get_Equip(actor->equipped[accessory_slot])->wisdom, 15, 9);
;c
	pop	de
	push	de
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
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
	ldhl	sp,#8
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
	ld	de, #0x090f
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:179: Draw_Status_Number(actor->will + Get_Equip(actor->equipped[weapon_slot])->will + Get_Equip(actor->equipped[secondary_slot])->will + Get_Equip(actor->equipped[armor_slot])->will + Get_Equip(actor->equipped[accessory_slot])->will, 15, 11);
;c
	pop	de
	push	de
	ld	hl, #0x0013
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
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
	ldhl	sp,#8
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
	ld	de, #0x0b0f
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:180: Draw_Status_Number(actor->agility + Get_Equip(actor->equipped[weapon_slot])->agility + Get_Equip(actor->equipped[secondary_slot])->agility + Get_Equip(actor->equipped[armor_slot])->agility + Get_Equip(actor->equipped[accessory_slot])->agility, 15, 13);
;c
	pop	de
	push	de
	ld	hl, #0x0015
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
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
	ld	hl, #0x000c
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
	ld	hl, #0x000c
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
	ld	hl, #0x000c
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000c
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0d0f
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:181: Draw_Status_Number(Get_Equip(actor->equipped[weapon_slot])->luck + Get_Equip(actor->equipped[secondary_slot])->luck + Get_Equip(actor->equipped[armor_slot])->luck + Get_Equip(actor->equipped[accessory_slot])->luck, 15, 15);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x000d
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
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
	ld	hl, #0x000d
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
	ld	hl, #0x000d
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000d
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	de, #0x0f0f
	push	de
	push	hl
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:182: }
	add	sp, #10
	ret
;bank14.c:184: void Draw_Menu_Status()
;	---------------------------------
; Function Draw_Menu_Status
; ---------------------------------
_Draw_Menu_Status::
	add	sp, #-2
;bank14.c:186: fade_out();
	call	_fade_out
;bank14.c:188: CurrentMenu = menu_status;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x08
;bank14.c:190: set_win_tiles(0, 0, 20, 18, Map_Menu_StatusPLN0);
	ld	hl, #_Map_Menu_StatusPLN0
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
;bank14.c:192: Call_Draw_Name(bank14, 2, 2, Get_Actor(party[actor_y])->name, true);
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
	ld	de, #0x0202
	push	de
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Draw_Name
	add	sp, #6
;bank14.c:193: Draw_Status_Stats(Get_Actor(party[actor_y]));
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
	call	_Draw_Status_Stats
	add	sp, #2
;bank14.c:194: Draw_Status_Number(Get_Actor(party[actor_y])->experience, 8, 4);
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
	ld	hl, #0x001b
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0408
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:195: Draw_Status_Number(Get_Actor(party[actor_y])->level, 9, 2);
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
	ld	de, #0x0209
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:196: Draw_Status_Number(Experience_List[Get_Actor(party[actor_y])->level - 1], 12, 4);
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
	ld	l, (hl)
	dec	l
	ld	a, l
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_Experience_List
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x040c
	push	de
	push	bc
	call	_Draw_Status_Number
	add	sp, #4
;bank14.c:197: Draw_Status_Class(Get_Class(Get_Actor(party[actor_y])->class)->name, Get_Class(Get_Actor(party[actor_y])->class)->icon, 14, 2);
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
	ld	de, #0x020e
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Status_Class
	add	sp, #6
;bank14.c:199: fade_in();
	call	_fade_in
;bank14.c:200: }
	add	sp, #2
	ret
;bank14.c:202: void Menu_Status_Joypad()
;	---------------------------------
; Function Menu_Status_Joypad
; ---------------------------------
_Menu_Status_Joypad::
	add	sp, #-9
;bank14.c:204: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank14.c:206: if(Joy & J_UP)
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;bank14.c:208: if(CurrentMenu == menu_status)
	ld	a, (#_CurrentMenu)
	sub	a, #0x08
	ld	a, #0x01
	jr	Z, 00236$
	xor	a, a
00236$:
	ldhl	sp,	#0
	ld	(hl), a
;bank14.c:216: actor_y -= 1;
	ld	a, (#_actor_y)
	ldhl	sp,	#1
	ld	(hl), a
;bank14.c:225: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Background);
	ld	a, (#_actor_y)
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ldhl	sp,	#2
	ld	(hl), a
;bank14.c:206: if(Joy & J_UP)
	ldhl	sp,	#8
	bit	2, (hl)
	jr	Z, 00141$
;bank14.c:208: if(CurrentMenu == menu_status)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;bank14.c:210: if(actor_y == 0)
	ld	a, (#_actor_y)
	or	a, a
	jr	NZ, 00102$
;bank14.c:212: actor_y = actor_max - 1;
	ld	a, (#_actor_max)
	add	a, #0xff
	ld	(#_actor_y),a
	jr	00103$
00102$:
;bank14.c:216: actor_y -= 1;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0xff
	ld	(#_actor_y),a
00103$:
;bank14.c:219: Draw_Menu_Status();
	call	_Draw_Menu_Status
	jp	00143$
00110$:
;bank14.c:223: if(actor_y > 0)
	ld	a, (#_actor_y)
	or	a, a
	jr	Z, 00106$
;bank14.c:225: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Background);
	ld	hl, #_Status_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:227: actor_y -= 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	add	a, #0xff
;bank14.c:229: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Pointer);
	ld	(hl), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ld	hl, #_Status_Pointer
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
;bank14.c:232: while(joypad() & J_UP)
00106$:
	call	_joypad
	bit	2, e
	jp	Z,00143$
;bank14.c:234: wait_vbl_done();
	call	_wait_vbl_done
	jr	00106$
00141$:
;bank14.c:239: else if(Joy & J_DOWN)
	ldhl	sp,	#8
	bit	3, (hl)
	jp	Z,00138$
;bank14.c:243: if(actor_y == actor_max - 1)
	ld	a, (#_actor_max)
	ldhl	sp,	#3
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_actor_y)
	ldhl	sp,	#5
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
;bank14.c:241: if(CurrentMenu == menu_status)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
;bank14.c:243: if(actor_y == actor_max - 1)
	ldhl	sp,	#5
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00113$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00113$
;bank14.c:245: actor_y = 0;
	ld	hl, #_actor_y
	ld	(hl), #0x00
	jr	00114$
00113$:
;bank14.c:249: actor_y += 1;
	ldhl	sp,	#1
	ld	a, (hl)
	inc	a
	ld	(#_actor_y),a
00114$:
;bank14.c:252: Draw_Menu_Status();
	call	_Draw_Menu_Status
	jp	00143$
00121$:
;bank14.c:256: if(actor_y < actor_max - 1)
	ldhl	sp,	#5
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00242$
	bit	7, d
	jr	NZ, 00243$
	cp	a, a
	jr	00243$
00242$:
	bit	7, d
	jr	Z, 00243$
	scf
00243$:
	jr	NC, 00117$
;bank14.c:258: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Background);
	ld	hl, #_Status_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:260: actor_y += 1;
	ld	hl, #_actor_y
	ld	a, (hl)
	inc	a
;bank14.c:262: set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Pointer);
	ld	(hl), a
	ld	c, a
	add	a, a
	add	a, c
	add	a, #0x02
	ld	hl, #_Status_Pointer
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
;bank14.c:265: while(joypad() & J_DOWN)
00117$:
	call	_joypad
	bit	3, e
	jp	Z,00143$
;bank14.c:267: wait_vbl_done();
	call	_wait_vbl_done
	jr	00117$
00138$:
;bank14.c:272: else if(Joy & J_A)
	ldhl	sp,	#8
	bit	4, (hl)
	jr	Z, 00135$
;bank14.c:274: if(CurrentMenu == menu_status)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	NZ, 00143$
;bank14.c:280: Call_Play_Confirm(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank14.c:282: Draw_Menu_Status();
	call	_Draw_Menu_Status
;bank14.c:284: CurrentMenu = menu_status;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x08
;bank14.c:286: while(joypad() & J_A)
00123$:
	call	_joypad
	bit	4, e
	jr	Z, 00143$
;bank14.c:288: wait_vbl_done();
	call	_wait_vbl_done
	jr	00123$
00135$:
;bank14.c:293: else if(Joy & J_B)
	ldhl	sp,	#8
	bit	5, (hl)
	jr	Z, 00143$
;bank14.c:295: if(CurrentMenu == menu_status)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00130$
;bank14.c:297: Call_Play_Confirm(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank14.c:298: Call_Load_Menu_Main(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Load_Menu_Main
	inc	sp
	jr	00143$
00130$:
;bank14.c:302: Call_Play_Confirm(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank14.c:304: set_win_tiles(9, 2, 1, 1, Status_Background);
	ld	bc, #_Status_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:305: set_win_tiles(9, 5, 1, 1, Status_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0509
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:306: set_win_tiles(9, 8, 1, 1, Status_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0809
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:307: set_win_tiles(9, 10, 1, 1, Status_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a09
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:309: Call_Menu_Main(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_Call_Menu_Main
	inc	sp
00143$:
;bank14.c:312: }
	add	sp, #9
	ret
;bank14.c:314: void Menu_Status()
;	---------------------------------
; Function Menu_Status
; ---------------------------------
_Menu_Status::
;bank14.c:316: while(1)
00102$:
;bank14.c:318: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank14.c:320: Menu_Status_Joypad();
	call	_Menu_Status_Joypad
;bank14.c:322: }
	jr	00102$
;bank14.c:324: void Load_Menu_Status()
;	---------------------------------
; Function Load_Menu_Status
; ---------------------------------
_Load_Menu_Status::
;bank14.c:326: if(party[1] == 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	NZ, 00108$
;bank14.c:328: actor_max = 1;
	ld	hl, #_actor_max
	ld	(hl), #0x01
	jr	00109$
00108$:
;bank14.c:330: else if(party[2] == 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	NZ, 00105$
;bank14.c:332: actor_max = 2;
	ld	hl, #_actor_max
	ld	(hl), #0x02
	jr	00109$
00105$:
;bank14.c:334: else if(party[3] == 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	NZ, 00102$
;bank14.c:336: actor_max = 3;
	ld	hl, #_actor_max
	ld	(hl), #0x03
	jr	00109$
00102$:
;bank14.c:340: actor_max = 0;
	ld	hl, #_actor_max
	ld	(hl), #0x00
00109$:
;bank14.c:343: set_win_tiles(9, 2, 1, 1, Status_Pointer);
	ld	hl, #_Status_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0209
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank14.c:345: actor_y = 0;
	ld	hl, #_actor_y
	ld	(hl), #0x00
;bank14.c:347: while(joypad() & J_A || joypad() & J_START)
00111$:
	call	_joypad
	bit	4, e
	jr	NZ, 00112$
	call	_joypad
	ld	a, e
	rlca
	jp	NC,_Menu_Status
00112$:
;bank14.c:349: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank14.c:352: Menu_Status();
;bank14.c:353: }
	jr	00111$
	.area _CODE_14
	.area _CABS (ABS)
