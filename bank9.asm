;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank9
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Check_Tile_Collision_Bank9
	.globl _Draw_Line_Bank9
	.globl _Draw_Map_Bank9
	.globl _Draw_Tile9
	.globl _performant_delay
	.globl _set_bkg_tiles
	.globl _Map_Bud_HousePLN1
	.globl _Map_Bud_HousePLN0
	.globl _Map_Plum_Item_ShopPLN0
	.globl _Map_Hiro_HousePLN1
	.globl _Map_Hiro_HousePLN0
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
	.area _CODE_9
;bank9.c:37: void Draw_Tile9(UINT16 tile_x, UINT16 tile_y, UBYTE tile_num)
;	---------------------------------
; Function Draw_Tile9
; ---------------------------------
_Draw_Tile9::
;bank9.c:42: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	dec	hl
	dec	hl
	ld	a, (hl-)
	ld	c, a
	dec	hl
	ld	b, (hl)
	sla	e
	rl	d
	sla	e
	rl	d
;bank9.c:39: switch(Tileset)
	ld	a, (#_Tileset)
	dec	a
	jr	Z, 00101$
	ld	a,(#_Tileset)
	cp	a,#0x02
	jr	Z, 00102$
	sub	a, #0x03
	jr	Z, 00103$
	jr	00104$
;bank9.c:41: case 1:
00101$:
;bank9.c:42: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
	ld	hl, #_Tileset_1_Map
	add	hl, de
	push	hl
	ld	de, #0x0202
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank9.c:43: break;
	ret
;bank9.c:44: case 2:
00102$:
;bank9.c:45: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_2_Map[tile_num]);
	ld	hl, #_Tileset_2_Map
	add	hl, de
	push	hl
	ld	de, #0x0202
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank9.c:46: break;
	ret
;bank9.c:47: case 3:
00103$:
;bank9.c:48: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_3_Map[tile_num]);
	ld	hl, #_Tileset_3_Map
	add	hl, de
	push	hl
	ld	de, #0x0202
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank9.c:49: break;
	ret
;bank9.c:50: default:
00104$:
;bank9.c:51: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
	ld	hl, #_Tileset_1_Map
	add	hl, de
	push	hl
	ld	de, #0x0202
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank9.c:53: }
;bank9.c:54: }
	ret
_Map_Hiro_HousePLN0:
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
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x12	; 18
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x21	; 33
	.db #0x13	; 19
	.db #0x05	; 5
	.db #0x2d	; 45
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x15	; 21
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x1f	; 31
	.db #0x2f	; 47
	.db #0x1d	; 29
	.db #0x17	; 23
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x22	; 34
	.db #0x2c	; 44
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x2a	; 42
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2e	; 46
	.db #0x29	; 41
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0f	; 15
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
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
_Map_Hiro_HousePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Plum_Item_ShopPLN0:
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
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x12	; 18
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x2d	; 45
	.db #0x13	; 19
	.db #0x3a	; 58
	.db #0x31	; 49	'1'
	.db #0x3a	; 58
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x21	; 33
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x2e	; 46
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0x2c	; 44
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x2c	; 44
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x32	; 50	'2'
	.db #0x38	; 56	'8'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2e	; 46
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x29	; 41
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0f	; 15
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
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
_Map_Bud_HousePLN0:
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
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x12	; 18
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x30	; 48	'0'
	.db #0x21	; 33
	.db #0x05	; 5
	.db #0x31	; 49	'1'
	.db #0x13	; 19
	.db #0x05	; 5
	.db #0x2d	; 45
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x15	; 21
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x2e	; 46
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x1d	; 29
	.db #0x17	; 23
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x2a	; 42
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x29	; 41
	.db #0x2e	; 46
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x29	; 41
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0f	; 15
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
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
_Map_Bud_HousePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;bank9.c:56: void Draw_Map_Bank9(GameMap* map) //* Draws map tiles.
;	---------------------------------
; Function Draw_Map_Bank9
; ---------------------------------
_Draw_Map_Bank9::
	add	sp, #-6
;bank9.c:58: if(char_player.pos_x <= 5)
	ld	hl, #_char_player + 6
	ld	c, (hl)
;bank9.c:62: else if(char_player.pos_x >= map_size_x - 5)
	ld	a, (#_map_size_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:58: if(char_player.pos_x <= 5)
	ld	a, #0x05
	sub	a, c
	jr	C, 00105$
;bank9.c:60: map_x = 0;
	ld	hl, #_map_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00106$
00105$:
;bank9.c:62: else if(char_player.pos_x >= map_size_x - 5)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	b, #0x00
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00184$
	bit	7, d
	jr	NZ, 00185$
	cp	a, a
	jr	00185$
00184$:
	bit	7, d
	jr	Z, 00185$
	scf
00185$:
	jr	C, 00102$
;bank9.c:64: map_x = map_size_x - 10;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_map_x + 1
	ld	(hl-), a
	ld	(hl), e
	jr	00106$
00102$:
;bank9.c:68: map_x = char_player.pos_x - 5;
	ld	a, c
	add	a, #0xfb
	ld	hl, #_map_x
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
00106$:
;bank9.c:71: if(char_player.pos_y <= 5)
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00113$
;bank9.c:73: map_y = 0;
	ld	hl, #_map_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jp	00114$
00113$:
;bank9.c:75: else if(char_player.pos_y > map_size_y - 5)
	ld	hl, #_map_size_y
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0005
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:79: map_y += map_size_x;
;bank9.c:75: else if(char_player.pos_y > map_size_y - 5)
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
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
	jr	NC, 00110$
;bank9.c:77: for(i = 0; i != map_size_y - 9; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ld	a, c
	add	a, #0xf7
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
00118$:
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00188$
	ld	a, d
	sub	a, b
	jr	Z, 00114$
00188$:
;bank9.c:79: map_y += map_size_x;
;c
	ld	hl, #_map_y + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_map_y), a
	ld	a, h
	ld	(_map_y + 1), a
;bank9.c:77: for(i = 0; i != map_size_y - 9; i++)
	ld	hl, #_i
	inc	(hl)
	jr	00118$
00110$:
;bank9.c:84: for(i = 0; i < char_player.pos_y - 5; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00121$:
	ld	a, (#(_char_player + 0x0007) + 0)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x0005
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_i)
	ldhl	sp,	#2
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00189$
	bit	7, d
	jr	NZ, 00190$
	cp	a, a
	jr	00190$
00189$:
	bit	7, d
	jr	Z, 00190$
	scf
00190$:
	jr	NC, 00114$
;bank9.c:86: map_y += map_size_x;
;c
	ld	hl, #_map_y + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_map_y), a
	ld	a, h
	ld	(_map_y + 1), a
;bank9.c:84: for(i = 0; i < char_player.pos_y - 5; i++)
	ld	hl, #_i
	inc	(hl)
	jr	00121$
00114$:
;bank9.c:90: k = 0;
	ld	hl, #_k
	ld	(hl), #0x00
;bank9.c:92: for(i = 0; i < 18; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;c
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
00125$:
;bank9.c:94: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank9.c:96: for(j = 0; j < 20; j += 2)
	ld	hl, #_j
	ld	(hl), #0x00
00123$:
;bank9.c:98: Draw_Tile9(0 + j, 0 + i, map->data[map_x + map_y + k]);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;c
	ld	hl, #_map_x + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_k)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, (#_j)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:99: k += 1;
	ld	hl, #_k
	inc	(hl)
;bank9.c:96: for(j = 0; j < 20; j += 2)
	ld	hl, #_j
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00123$
;bank9.c:102: k = 0;
	ld	hl, #_k
	ld	(hl), #0x00
;bank9.c:104: map_y += map_size_x;
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_map_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank9.c:92: for(i = 0; i < 18; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x92
	jp	C, 00125$
;bank9.c:106: }
	add	sp, #6
	ret
;bank9.c:108: void Draw_Line_Bank9(GameMap* map, UBYTE direction) //* Draws verticle/horizontal line of map tiles.
;	---------------------------------
; Function Draw_Line_Bank9
; ---------------------------------
_Draw_Line_Bank9::
	add	sp, #-25
;bank9.c:110: map_x = 0;
	ld	hl, #_map_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank9.c:111: map_y = 0;
	ld	hl, #_map_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank9.c:112: load_pos_x = 0;
	ld	hl, #_load_pos_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank9.c:113: load_pos_y = 0;
	ld	hl, #_load_pos_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank9.c:115: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ld	a, (#_map_size_x)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:117: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:120: load_pos_y = camera_y;
	ld	a, (#_camera_y)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:129: else if(char_player.pos_y >= map_size_y - 4)
	ld	hl, #_map_size_y
	ld	c, (hl)
	ld	b, #0x00
;bank9.c:132: map_y = g * map_size_x;
	ld	a, (#_map_size_x)
	ldhl	sp,	#8
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:140: if(camera_y + 18 > 31)
	ld	a, (#_camera_y)
	ldhl	sp,	#10
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank9.c:144: for(i = 0; i < 32 - camera_y; i += 2)
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
;bank9.c:115: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ld	a, e
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	(hl), e
;bank9.c:117: load_pos_x = camera_x + 20;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
;bank9.c:129: else if(char_player.pos_y >= map_size_y - 4)
	ld	de, #0x0004
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	inc	hl
	inc	hl
	ld	(hl-), a
	ld	(hl), e
;bank9.c:131: g = map_size_y - 9;
	ld	de, #0x0009
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#19
	ld	(hl-), a
	ld	(hl), e
;bank9.c:140: if(camera_y + 18 > 31)
;c
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl), a
;bank9.c:144: for(i = 0; i < 32 - camera_y; i += 2)
;c
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl), a
;bank9.c:140: if(camera_y + 18 > 31)
	ldhl	sp,	#20
	ld	a, #0x1f
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00499$
	bit	7, d
	jr	NZ, 00500$
	cp	a, a
	jr	00500$
00499$:
	bit	7, d
	jr	Z, 00500$
	scf
00500$:
	ld	a, #0x00
	rla
	ldhl	sp,	#24
	ld	(hl), a
;bank9.c:115: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00181$
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00503$
	bit	7, d
	jr	NZ, 00504$
	cp	a, a
	jr	00504$
00503$:
	bit	7, d
	jr	Z, 00504$
	scf
00504$:
	jp	C, 00181$
;bank9.c:117: load_pos_x = camera_x + 20;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_x
	ld	(hl+), a
;bank9.c:118: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00102$
	ld	hl, #_load_pos_x
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00102$:
;bank9.c:120: load_pos_y = camera_y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank9.c:121: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00104$
	ld	hl, #_load_pos_y
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00104$:
;bank9.c:123: map_x = char_player.pos_x + 5;
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0005
	add	hl, bc
	ld	a, l
	ld	d, h
	ld	hl, #_map_x
	ld	(hl+), a
	ld	(hl), d
;bank9.c:125: if(char_player.pos_y <= 5)
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#21
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#21
	sub	a, (hl)
	jr	C, 00109$
;bank9.c:127: map_y = 0;
	ld	hl, #_map_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00110$
00109$:
;bank9.c:129: else if(char_player.pos_y >= map_size_y - 4)
	ldhl	sp,	#21
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#20
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00505$
	bit	7, d
	jr	NZ, 00506$
	cp	a, a
	jr	00506$
00505$:
	bit	7, d
	jr	Z, 00506$
	scf
00506$:
	jr	C, 00106$
;bank9.c:131: g = map_size_y - 9;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_g
	ld	(hl+), a
	ld	(hl), e
;bank9.c:132: map_y = g * map_size_x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #_g
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mulint
	add	sp, #4
	ld	hl, #_map_y
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00110$
00106$:
;bank9.c:136: g = char_player.pos_y - 5;
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_g + 1
	ld	(hl-), a
	ld	(hl), e
;bank9.c:137: map_y = g * map_size_x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #_g
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mulint
	add	sp, #4
	ld	hl, #_map_y
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00110$:
;bank9.c:142: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	c, a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	b, a
;bank9.c:140: if(camera_y + 18 > 31)
	ldhl	sp,	#24
	ld	a, (hl)
	or	a, a
	jp	Z, 00115$
;bank9.c:142: map_pos = map_x + map_y;
	ld	hl, #_map_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;bank9.c:144: for(i = 0; i < 32 - camera_y; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#22
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00185$:
	ld	a, (#_camera_y)
	ldhl	sp,	#23
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	de, #0x0020
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#21
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_i)
	ldhl	sp,	#22
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#22
	ld	e, l
	ld	d, h
	ldhl	sp,	#20
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00507$
	bit	7, d
	jr	NZ, 00508$
	cp	a, a
	jr	00508$
00507$:
	bit	7, d
	jr	Z, 00508$
	scf
00508$:
	jr	NC, 00111$
;bank9.c:146: Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_pos
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#24
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ldhl	sp,	#26
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
	pop	bc
;bank9.c:147: map_pos += map_size_x;
	ld	hl, #_map_size_x
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_map_pos
	ld	a, (hl)
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	adc	a, d
	ld	(hl), a
;bank9.c:144: for(i = 0; i < 32 - camera_y; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jp	00185$
00111$:
;bank9.c:150: for(i = 0; i < camera_y - 14; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#21
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00188$:
	ld	hl, #_camera_y
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf2
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, (#_i)
	ldhl	sp,	#23
	ld	(hl), a
	rla
	sbc	a, a
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
	jr	Z, 00509$
	bit	7, d
	jr	NZ, 00510$
	cp	a, a
	jr	00510$
00509$:
	bit	7, d
	jr	Z, 00510$
	scf
00510$:
	jp	NC, 00222$
;bank9.c:152: Draw_Tile9(load_pos_x, i, map->data[map_pos]);
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	push	de
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:153: map_pos += map_size_x;
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_map_pos
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank9.c:150: for(i = 0; i < camera_y - 14; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jr	00188$
00115$:
;bank9.c:158: map_pos = map_x + map_y;
	ld	hl, #_map_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;bank9.c:160: for(i = 0; i < 18; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#22
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00190$:
;bank9.c:162: Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_pos
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#24
	ld	(hl), a
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ldhl	sp,	#26
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
	pop	bc
;bank9.c:163: map_pos += map_size_x;
	ld	hl, #_map_size_x
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_map_pos
	ld	a, (hl)
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	adc	a, d
	ld	(hl), a
;bank9.c:160: for(i = 0; i < 18; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x92
	jr	C, 00190$
	jp	00222$
00181$:
;bank9.c:168: else if(direction == left && char_player.pos_x >= 5)
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00177$
	ld	a, (#(_char_player + 0x0006) + 0)
	sub	a, #0x05
	jp	C, 00177$
;bank9.c:170: if(camera_x == 0){load_pos_x = 30;}
	ld	a, (#_camera_x)
	or	a, a
	jr	NZ, 00118$
	ld	hl, #_load_pos_x
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00119$
00118$:
;bank9.c:171: else{load_pos_x = camera_x - 2;}
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_load_pos_x + 1
	ld	(hl-), a
	ld	(hl), e
00119$:
;bank9.c:173: load_pos_y = camera_y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank9.c:174: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00121$
	ld	hl, #_load_pos_y
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00121$:
;bank9.c:176: map_x = char_player.pos_x - 6;
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xfa
	ld	hl, #_map_x
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
;bank9.c:178: if(char_player.pos_y <= 5)
	ld	hl, #_char_player + 7
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jr	C, 00126$
;bank9.c:180: map_y = 0;
	ld	hl, #_map_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00127$
00126$:
;bank9.c:182: else if(char_player.pos_y >= map_size_y - 4)
	ld	b, #0x00
	ldhl	sp,	#16
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00513$
	bit	7, d
	jr	NZ, 00514$
	cp	a, a
	jr	00514$
00513$:
	bit	7, d
	jr	Z, 00514$
	scf
00514$:
	jr	C, 00123$
;bank9.c:184: g = map_size_y - 9;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_g
	ld	(hl+), a
	ld	(hl), e
;bank9.c:185: map_y = g * map_size_x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #_g
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mulint
	add	sp, #4
	ld	hl, #_map_y
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00127$
00123$:
;bank9.c:189: g = char_player.pos_y - 5;
	ld	a, c
	add	a, #0xfb
	ld	hl, #_g
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
;bank9.c:190: map_y = g * map_size_x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #_g
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mulint
	add	sp, #4
	ld	hl, #_map_y
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00127$:
;bank9.c:193: if(camera_y + 18 > 31)
	ldhl	sp,	#24
	ld	a, (hl)
	or	a, a
	jp	Z, 00132$
;bank9.c:195: for(i = 0; i < 32 - camera_y; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00193$:
	ld	hl, #_camera_y
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x20
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	a, (#_i)
	ldhl	sp,	#21
	ld	(hl), a
	rla
	sbc	a, a
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
	jr	Z, 00515$
	bit	7, d
	jr	NZ, 00516$
	cp	a, a
	jr	00516$
00515$:
	bit	7, d
	jr	Z, 00516$
	scf
00516$:
	jr	NC, 00128$
;bank9.c:197: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:198: Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_pos
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, a
	ldhl	sp,#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:199: map_y += map_size_x;
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_map_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank9.c:195: for(i = 0; i < 32 - camera_y; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jp	00193$
00128$:
;bank9.c:202: for(i = 0; i < camera_y - 14; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	ld	(hl), e
00196$:
	ld	hl, #_camera_y
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf2
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, (#_i)
	ldhl	sp,	#21
	ld	(hl), a
	rla
	sbc	a, a
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
	jr	Z, 00517$
	bit	7, d
	jr	NZ, 00518$
	cp	a, a
	jr	00518$
00517$:
	bit	7, d
	jr	Z, 00518$
	scf
00518$:
	jp	NC, 00222$
;bank9.c:204: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:205: Draw_Tile9(load_pos_x, i, map->data[map_pos]);
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	push	de
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:206: map_y += map_size_x;
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_map_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank9.c:202: for(i = 0; i < camera_y - 14; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jp	00196$
00132$:
;bank9.c:211: for(i = 0; i != 18; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00198$:
;bank9.c:213: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:214: Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:215: map_y += map_size_x;
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_map_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank9.c:211: for(i = 0; i != 18; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x12
	jp	Z,00222$
	jr	00198$
00177$:
;bank9.c:222: load_pos_x = camera_x;
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
;bank9.c:234: map_x = map_size_x - 10;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
;bank9.c:243: map_y += map_size_x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#18
	ld	(hl+), a
	ld	(hl), e
;bank9.c:246: if(camera_x + 20 > 31)
	ldhl	sp,	#14
	ld	a, #0x1f
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00521$
	bit	7, d
	jr	NZ, 00522$
	cp	a, a
	jr	00522$
00521$:
	bit	7, d
	jr	Z, 00522$
	scf
00522$:
	ld	a, #0x00
	rla
	ldhl	sp,	#24
	ld	(hl), a
;bank9.c:220: else if(direction == down && char_player.pos_y <= map_size_y - 4)
	ldhl	sp,	#29
	ld	a, (hl)
	dec	a
	jp	NZ,00173$
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#16
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00525$
	bit	7, d
	jr	NZ, 00526$
	cp	a, a
	jr	00526$
00525$:
	bit	7, d
	jr	Z, 00526$
	scf
00526$:
	jp	C, 00173$
;bank9.c:222: load_pos_x = camera_x;
	ld	hl, #_load_pos_x
	ld	a, c
	ld	(hl+), a
;bank9.c:223: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00135$
	ld	hl, #_load_pos_x
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00135$:
;bank9.c:225: load_pos_y = camera_y + 18;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank9.c:226: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00137$
	ld	hl, #_load_pos_y
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00137$:
;bank9.c:228: if(char_player.pos_x <= 5)
	ld	hl, #_char_player + 6
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jr	C, 00142$
;bank9.c:230: map_x = 0;
	ld	hl, #_map_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00143$
00142$:
;bank9.c:232: else if(char_player.pos_x >= map_size_x - 5)
	ld	b, #0x00
	ldhl	sp,	#12
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00527$
	bit	7, d
	jr	NZ, 00528$
	cp	a, a
	jr	00528$
00527$:
	bit	7, d
	jr	Z, 00528$
	scf
00528$:
	jr	C, 00139$
;bank9.c:234: map_x = map_size_x - 10;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_map_x
	ld	(hl+), a
	ld	(hl), e
	jr	00143$
00139$:
;bank9.c:238: map_x = char_player.pos_x - 5;
	ld	a, c
	add	a, #0xfb
	ld	hl, #_map_x
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
00143$:
;bank9.c:241: for(i = char_player.pos_y + 4; i != 0; i--)
	ld	a, (#(_char_player + 0x0007) + 0)
	add	a, #0x04
	ld	(#_i),a
00201$:
	ld	a, (#_i)
	or	a, a
	jr	Z, 00144$
;bank9.c:243: map_y += map_size_x;
;c
	ld	hl, #_map_y + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_map_y), a
	ld	a, h
	ld	(_map_y + 1), a
;bank9.c:241: for(i = char_player.pos_y + 4; i != 0; i--)
	ld	hl, #_i
	dec	(hl)
	jr	00201$
00144$:
;bank9.c:246: if(camera_x + 20 > 31)
	ldhl	sp,	#24
	ld	a, (hl)
	or	a, a
	jp	Z, 00149$
;bank9.c:248: for(i = 0; i != 32 - camera_x; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00204$:
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x20
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	a, (#_i)
	ldhl	sp,	#21
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00529$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00145$
00529$:
;bank9.c:250: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:251: Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_pos
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, a
	ldhl	sp,#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:252: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00530$
	inc	hl
	inc	(hl)
00530$:
;bank9.c:248: for(i = 0; i != 32 - camera_x; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jr	00204$
00145$:
;bank9.c:255: for(i = 0; i != camera_x - 12; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	ld	(hl), e
00207$:
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00531$
	ld	a, d
	sub	a, b
	jp	Z,00222$
00531$:
;bank9.c:257: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:258: Draw_Tile9(i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:259: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00532$
	inc	hl
	inc	(hl)
00532$:
;bank9.c:255: for(i = 0; i != camera_x - 12; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jr	00207$
00149$:
;bank9.c:264: for(i = 0; i < 20; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00209$:
;bank9.c:266: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:267: Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:268: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00533$
	inc	hl
	inc	(hl)
00533$:
;bank9.c:264: for(i = 0; i < 20; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00209$
	jp	00222$
00173$:
;bank9.c:273: else if(direction == up && char_player.pos_y >= 5)
	ldhl	sp,	#29
	ld	a, (hl)
	or	a, a
	jp	NZ, 00222$
	ld	a, (#(_char_player + 0x0007) + 0)
	sub	a, #0x05
	jp	C, 00222$
;bank9.c:275: load_pos_x = camera_x;
	ld	hl, #_load_pos_x
	ld	a, c
	ld	(hl+), a
;bank9.c:276: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00152$
	ld	hl, #_load_pos_x
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00152$:
;bank9.c:278: if(camera_y == 0){load_pos_y = 30;}
	ld	a, (#_camera_y)
	or	a, a
	jr	NZ, 00154$
	ld	hl, #_load_pos_y
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00155$
00154$:
;bank9.c:279: else{load_pos_y = camera_y - 2;}
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_load_pos_y + 1
	ld	(hl-), a
	ld	(hl), e
00155$:
;bank9.c:281: if(char_player.pos_x <= 5)
	ld	hl, #_char_player + 6
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jr	C, 00160$
;bank9.c:283: map_x = 0;
	ld	hl, #_map_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00161$
00160$:
;bank9.c:285: else if(char_player.pos_x >= map_size_x - 5)
	ld	b, #0x00
	ldhl	sp,	#12
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00534$
	bit	7, d
	jr	NZ, 00535$
	cp	a, a
	jr	00535$
00534$:
	bit	7, d
	jr	Z, 00535$
	scf
00535$:
	jr	C, 00157$
;bank9.c:287: map_x = map_size_x - 10;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_map_x
	ld	(hl+), a
	ld	(hl), e
	jr	00161$
00157$:
;bank9.c:291: map_x = char_player.pos_x - 5;
	ld	a, c
	add	a, #0xfb
	ld	hl, #_map_x
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
00161$:
;bank9.c:294: for(i = char_player.pos_y - 6; i != 0; i--)
	ld	a, (#(_char_player + 0x0007) + 0)
	add	a, #0xfa
	ld	(#_i),a
00212$:
	ld	a, (#_i)
	or	a, a
	jr	Z, 00162$
;bank9.c:296: map_y = map_y + map_size_x;
;c
	ld	hl, #_map_y + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_map_y), a
	ld	a, h
	ld	(_map_y + 1), a
;bank9.c:294: for(i = char_player.pos_y - 6; i != 0; i--)
	ld	hl, #_i
	dec	(hl)
	jr	00212$
00162$:
;bank9.c:299: if(camera_x + 20 > 31)
	ldhl	sp,	#24
	ld	a, (hl)
	or	a, a
	jp	Z, 00167$
;bank9.c:301: for(i = 0; i != 32 - camera_x; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00215$:
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0x20
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	a, (#_i)
	ldhl	sp,	#21
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00536$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00163$
00536$:
;bank9.c:303: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:304: Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_map_pos
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, a
	ldhl	sp,#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:305: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00537$
	inc	hl
	inc	(hl)
00537$:
;bank9.c:301: for(i = 0; i != 32 - camera_x; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jr	00215$
00163$:
;bank9.c:308: for(i = 0; i != camera_x - 12; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	ld	(hl), e
00218$:
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00538$
	ld	a, d
	sub	a, b
	jp	Z,00222$
00538$:
;bank9.c:310: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:311: Draw_Tile9(i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:312: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00539$
	inc	hl
	inc	(hl)
00539$:
;bank9.c:308: for(i = 0; i != camera_x - 12; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	jr	00218$
00167$:
;bank9.c:317: for(i = 0; i != 20; i += 2)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), e
00220$:
;bank9.c:319: map_pos = map_x + map_y;
	ld	a, (#_map_x)
	ld	hl, #_map_y
	add	a, (hl)
	ld	(#_map_pos),a
	ld	a, (#_map_x + 1)
	ld	hl, #_map_y + 1
	adc	a, (hl)
	ld	(#_map_pos + 1),a
;bank9.c:320: Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_map_pos
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	de
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Draw_Tile9
	add	sp, #5
;bank9.c:321: map_x += 1;
	ld	hl, #_map_x
	inc	(hl)
	jr	NZ, 00540$
	inc	hl
	inc	(hl)
00540$:
;bank9.c:317: for(i = 0; i != 20; i += 2)
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00220$
00222$:
;bank9.c:325: }
	add	sp, #25
	ret
;bank9.c:327: UBYTE Check_Tile_Collision_Bank9(GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y)
;	---------------------------------
; Function Check_Tile_Collision_Bank9
; ---------------------------------
_Check_Tile_Collision_Bank9::
	add	sp, #-2
;bank9.c:329: grid_x = character->pos_x + move_x;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	pop	hl
	push	hl
	add	hl, de
	ld	a, l
	ld	(_grid_x), a
	ld	a, h
	ld	(_grid_x + 1), a
;bank9.c:330: grid_y = character->pos_y + move_y;
	ld	hl, #0x0007
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#9
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	hl, #_grid_y
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;bank9.c:331: tile = map->data[(grid_y * map_size_x) + grid_x];
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_map_size_x
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #_grid_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__mulint
	add	sp, #4
	pop	bc
	ld	a, e
	ld	hl, #_grid_x
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_tile
	ld	(hl), a
	xor	a, a
	ld	(_tile + 1), a
;bank9.c:333: if(Tileset == 1)
	ld	a, (#_Tileset)
	dec	a
	jr	NZ, 00102$
;bank9.c:335: return tilemap_1[tile] == impassable ? true : false;
	ld	a, #<(_tilemap_1)
	ld	hl, #_tile
	add	a, (hl)
	ld	c, a
	ld	a, #>(_tilemap_1)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	dec	a
	jr	NZ, 00108$
	ld	de, #0x0001
	jr	00106$
00108$:
	ld	de, #0x0000
	jr	00106$
00102$:
;bank9.c:337: if(Tileset == 2)
	ld	a, (#_Tileset)
	sub	a, #0x02
	jr	NZ, 00104$
;bank9.c:339: return tilemap_2[tile] == impassable ? true : false;
	ld	a, #<(_tilemap_2)
	ld	hl, #_tile
	add	a, (hl)
	ld	c, a
	ld	a, #>(_tilemap_2)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	dec	a
	jr	NZ, 00110$
	ld	de, #0x0001
	jr	00106$
00110$:
	ld	de, #0x0000
	jr	00106$
00104$:
;bank9.c:343: return false;
	ld	e, #0x00
00106$:
;bank9.c:345: }
	add	sp, #2
	ret
	.area _CODE_9
	.area _CABS (ABS)
