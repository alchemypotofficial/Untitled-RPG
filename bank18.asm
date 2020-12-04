;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank18
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Check_Tile_Collision_Bank18
	.globl _Draw_Line_Bank18
	.globl _Draw_Map_Bank18
	.globl _Draw_Tile18
	.globl _set_bkg_tiles
	.globl _Map_YggdridPLN0
	.globl _Map_YggdridLUT
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
	.area _CODE_18
;bank18.c:35: void Draw_Tile18(UINT16 tile_x, UINT16 tile_y, UBYTE tile_num)
;	---------------------------------
; Function Draw_Tile18
; ---------------------------------
_Draw_Tile18::
;bank18.c:40: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
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
;bank18.c:37: switch(Tileset)
	ld	a, (#_Tileset)
	dec	a
	jr	Z, 00101$
	ld	a,(#_Tileset)
	cp	a,#0x02
	jr	Z, 00102$
	sub	a, #0x03
	jr	Z, 00103$
	jr	00104$
;bank18.c:39: case 1:
00101$:
;bank18.c:40: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
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
;bank18.c:41: break;
	ret
;bank18.c:42: case 2:
00102$:
;bank18.c:43: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_2_Map[tile_num]);
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
;bank18.c:44: break;
	ret
;bank18.c:45: case 3:
00103$:
;bank18.c:46: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_3_Map[tile_num]);
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
;bank18.c:47: break;
	ret
;bank18.c:48: default:
00104$:
;bank18.c:49: set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
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
;bank18.c:51: }
;bank18.c:52: }
	ret
_Map_YggdridLUT:
	.dw #0x0000
	.dw #0x0002
	.dw #0x0004
	.dw #0x0006
	.dw #0x0008
	.dw #0x000a
	.dw #0x000c
	.dw #0x000e
	.dw #0x0010
	.dw #0x0012
	.dw #0x0014
	.dw #0x0016
	.dw #0x0018
	.dw #0x001a
	.dw #0x001c
	.dw #0x001e
	.dw #0x0020
	.dw #0x0022
	.dw #0x0024
	.dw #0x0026
	.dw #0x0028
	.dw #0x002a
	.dw #0x002c
	.dw #0x002e
	.dw #0x0030
	.dw #0x0032
	.dw #0x0034
	.dw #0x0036
	.dw #0x0038
	.dw #0x003a
	.dw #0x003c
	.dw #0x003e
	.dw #0x0040
	.dw #0x0042
	.dw #0x0044
	.dw #0x0046
	.dw #0x0048
	.dw #0x004a
	.dw #0x004c
	.dw #0x004e
	.dw #0x0050
	.dw #0x0052
	.dw #0x0054
	.dw #0x0056
	.dw #0x0058
	.dw #0x005a
	.dw #0x005c
	.dw #0x005e
	.dw #0x0060
	.dw #0x0062
	.dw #0x0064
	.dw #0x0066
	.dw #0x0068
	.dw #0x006a
	.dw #0x006c
	.dw #0x006e
	.dw #0x0070
	.dw #0x0072
	.dw #0x0074
	.dw #0x0076
	.dw #0x0078
	.dw #0x007a
	.dw #0x007c
	.dw #0x007e
	.dw #0x0080
	.dw #0x0082
	.dw #0x0084
	.dw #0x0086
	.dw #0x0088
	.dw #0x008a
	.dw #0x008c
	.dw #0x008e
	.dw #0x0090
	.dw #0x0092
	.dw #0x0094
	.dw #0x0096
	.dw #0x0098
	.dw #0x009a
	.dw #0x009c
	.dw #0x009e
	.dw #0x00a0
	.dw #0x00a2
	.dw #0x00a4
	.dw #0x00a6
	.dw #0x00a8
	.dw #0x00aa
	.dw #0x00ac
	.dw #0x00ae
	.dw #0x00b0
	.dw #0x00b2
	.dw #0x00b4
	.dw #0x00b6
	.dw #0x00b8
	.dw #0x00ba
	.dw #0x00bc
	.dw #0x00be
	.dw #0x00c0
	.dw #0x00c2
	.dw #0x00c4
	.dw #0x00c6
	.dw #0x00c8
	.dw #0x00ca
	.dw #0x00cc
	.dw #0x00ce
	.dw #0x00d0
	.dw #0x00d2
	.dw #0x00d4
	.dw #0x00d6
	.dw #0x00d8
	.dw #0x00da
	.dw #0x00dc
	.dw #0x00de
	.dw #0x00e0
	.dw #0x00e2
	.dw #0x00e4
	.dw #0x00e6
	.dw #0x00e8
	.dw #0x00ea
	.dw #0x00ec
	.dw #0x00ee
	.dw #0x00f0
	.dw #0x00f2
	.dw #0x00f4
	.dw #0x00f6
	.dw #0x00f8
	.dw #0x00fa
	.dw #0x00fc
	.dw #0x00fe
	.dw #0x0100
	.dw #0x0102
	.dw #0x0104
	.dw #0x0106
	.dw #0x0108
	.dw #0x010a
	.dw #0x010c
	.dw #0x010e
	.dw #0x0110
	.dw #0x0112
	.dw #0x0114
	.dw #0x0116
	.dw #0x0118
	.dw #0x011a
	.dw #0x011c
	.dw #0x011e
	.dw #0x0120
	.dw #0x0122
	.dw #0x0124
	.dw #0x0126
	.dw #0x0128
	.dw #0x012a
	.dw #0x012c
	.dw #0x012e
	.dw #0x0130
	.dw #0x0132
	.dw #0x0134
	.dw #0x0136
	.dw #0x0138
	.dw #0x013a
	.dw #0x013c
	.dw #0x013e
	.dw #0x0140
	.dw #0x0142
	.dw #0x0144
	.dw #0x0146
	.dw #0x0148
	.dw #0x014a
	.dw #0x014c
	.dw #0x014e
	.dw #0x0150
	.dw #0x0152
	.dw #0x0154
	.dw #0x0156
	.dw #0x0158
	.dw #0x015a
	.dw #0x015c
	.dw #0x015e
	.dw #0x0160
	.dw #0x0162
	.dw #0x0164
	.dw #0x0166
	.dw #0x0168
	.dw #0x016a
	.dw #0x016c
	.dw #0x016e
	.dw #0x0170
	.dw #0x0172
	.dw #0x0174
	.dw #0x0176
	.dw #0x0178
	.dw #0x017a
	.dw #0x017c
	.dw #0x017e
	.dw #0x0180
	.dw #0x0182
	.dw #0x0184
	.dw #0x018e
	.dw #0x01a4
	.dw #0x01c0
	.dw #0x01dc
	.dw #0x01f4
	.dw #0x0212
	.dw #0x0230
	.dw #0x024c
	.dw #0x026a
	.dw #0x028e
	.dw #0x02ac
	.dw #0x02c8
	.dw #0x02f8
	.dw #0x0324
	.dw #0x0344
	.dw #0x0368
	.dw #0x0380
	.dw #0x0398
	.dw #0x03b8
	.dw #0x03dc
	.dw #0x03f6
	.dw #0x040c
	.dw #0x042e
	.dw #0x0448
	.dw #0x0468
	.dw #0x047c
	.dw #0x0498
	.dw #0x04b0
	.dw #0x04c0
	.dw #0x04d4
	.dw #0x04e8
	.dw #0x04f2
	.dw #0x0504
	.dw #0x0512
	.dw #0x051c
	.dw #0x051e
	.dw #0x0520
	.dw #0x0522
	.dw #0x0524
	.dw #0x0526
	.dw #0x0528
	.dw #0x052a
	.dw #0x052c
	.dw #0x052e
	.dw #0x0530
	.dw #0x0532
	.dw #0x0534
	.dw #0x0536
	.dw #0x0538
	.dw #0x053a
	.dw #0x053c
	.dw #0x053e
	.dw #0x0540
	.dw #0x0542
	.dw #0x0544
	.dw #0x0546
	.dw #0x0548
	.dw #0x054a
	.dw #0x054c
	.dw #0x054e
_Map_YggdridPLN0:
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0x72	; 114	'r'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0x71	; 113	'q'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x81	; 129
	.db #0x12	; 18
	.db #0x71	; 113	'q'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x71	; 113	'q'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x12	; 18
	.db #0x71	; 113	'q'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x12	; 18
	.db #0x72	; 114	'r'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7e	; 126
	.db #0x12	; 18
	.db #0x72	; 114	'r'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x72	; 114	'r'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x6a	; 106	'j'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x6a	; 106	'j'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x69	; 105	'i'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x69	; 105	'i'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x68	; 104	'h'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x68	; 104	'h'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x68	; 104	'h'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x68	; 104	'h'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x69	; 105	'i'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x7d	; 125
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x82	; 130
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x17	; 23
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x87	; 135
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x88	; 136
	.db #0x12	; 18
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x89	; 137
	.db #0x12	; 18
	.db #0x6c	; 108	'l'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x89	; 137
	.db #0x12	; 18
	.db #0x6c	; 108	'l'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x27	; 39
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x89	; 137
	.db #0x12	; 18
	.db #0x6d	; 109	'm'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x26	; 38
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0x6d	; 109	'm'
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0x6d	; 109	'm'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8a	; 138
	.db #0x12	; 18
	.db #0x6e	; 110	'n'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8b	; 139
	.db #0x12	; 18
	.db #0x6f	; 111	'o'
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x8b	; 139
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0xff	; 255
;bank18.c:54: void Draw_Map_Bank18(GameMap* map) //* Draws map tiles.
;	---------------------------------
; Function Draw_Map_Bank18
; ---------------------------------
_Draw_Map_Bank18::
	add	sp, #-4
;bank18.c:56: if(char_player.pos_x <= 5)
	ld	a, (#(_char_player + 0x0006) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#1
	sub	a, (hl)
	jr	C, 00105$
;bank18.c:58: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
	jr	00106$
00105$:
;bank18.c:60: else if(char_player.pos_x >= map_size_x - 5)
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xfb
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl+)
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
	jr	Z, 00190$
	bit	7, d
	jr	NZ, 00191$
	cp	a, a
	jr	00191$
00190$:
	bit	7, d
	jr	Z, 00191$
	scf
00191$:
	jr	C, 00102$
;bank18.c:62: u_x = map_size_x - 10;
	ld	a, (#_map_size_x)
	add	a, #0xf6
	ld	(#_u_x),a
	jr	00106$
00102$:
;bank18.c:66: u_x = char_player.pos_x - 5;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0xfb
	ld	(#_u_x),a
00106$:
;bank18.c:69: if(char_player.pos_y <= 5)
	ld	hl, #_char_player + 7
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jr	C, 00111$
;bank18.c:71: u_y = 0;
	ld	hl, #_u_y
	ld	(hl), #0x00
	jr	00112$
00111$:
;bank18.c:73: else if(char_player.pos_y > map_size_y - 5)
	ld	a, (#_map_size_y)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl), a
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
	jr	Z, 00192$
	bit	7, d
	jr	NZ, 00193$
	cp	a, a
	jr	00193$
00192$:
	bit	7, d
	jr	Z, 00193$
	scf
00193$:
	jr	NC, 00108$
;bank18.c:75: u_y = map_size_y - 9;
	ld	a, (#_map_size_y)
	add	a, #0xf7
	ld	(#_u_y),a
	jr	00112$
00108$:
;bank18.c:79: u_y = char_player.pos_y - 5;
	ld	a, c
	add	a, #0xfb
	ld	(#_u_y),a
00112$:
;bank18.c:82: u_j = u_x;
	ld	a, (#_u_x)
	ld	(#_u_j),a
;bank18.c:84: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:85: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:86: j = 0;
	ld	hl, #_j
	ld	(hl), #0x00
;bank18.c:88: while(1)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;c
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
00131$:
;bank18.c:90: f = Map_YggdridLUT[u_y + j];
	ld	hl, #_u_y
	ld	c, (hl)
	ld	b, #0x00
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:91: base_byte = map->data[f + u_i];
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:92: count_byte = map->data[f + u_i + 1];
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:94: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
	ld	c, a
	or	a, a
	jr	Z, 00124$
;bank18.c:96: count_byte -= u_x;
	ld	a, (hl)
	ld	hl, #_u_x
	sub	a, (hl)
	ld	(#_count_byte),a
;bank18.c:97: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank18.c:99: while(1)
00119$:
;bank18.c:101: Draw_Tile18(i * 2, j * 2, base_byte);
	ld	a, (#_j)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	sla	e
	rl	d
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	sla	c
	rl	b
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	de
	push	bc
	call	_Draw_Tile18
	add	sp, #5
;bank18.c:103: i++;
	ld	hl, #_i
	inc	(hl)
;bank18.c:104: count_byte--;
	ld	hl, #_count_byte
;bank18.c:106: if(count_byte == 0)
	dec	(hl)
	jr	NZ, 00116$
;bank18.c:108: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:109: break;
	jr	00125$
00116$:
;bank18.c:111: else if(i == 10)
	ld	a, (#_i)
	sub	a, #0x0a
	jr	Z, 00125$
;bank18.c:113: break;
	jr	00119$
00124$:
;bank18.c:117: else if(count_byte <= u_x)
	bit	0, c
	jr	NZ, 00125$
;bank18.c:119: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:120: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:122: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00125$:
;bank18.c:125: if(i == 10)
	ld	a, (#_i)
	sub	a, #0x0a
	jr	NZ, 00127$
;bank18.c:127: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:128: j++;
	ld	hl, #_j
	inc	(hl)
;bank18.c:129: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:130: u_x = u_j;
	ld	a, (#_u_j)
	ld	(#_u_x),a
00127$:
;bank18.c:133: if(j == 9)
	ld	a, (#_j)
	sub	a, #0x09
	jp	NZ,00131$
;bank18.c:135: break;
;bank18.c:138: }
	add	sp, #4
	ret
;bank18.c:140: void Draw_Line_Bank18(GameMap* map, UBYTE direction) //* Draws verticle/horizontal line of map tiles.
;	---------------------------------
; Function Draw_Line_Bank18
; ---------------------------------
_Draw_Line_Bank18::
	add	sp, #-23
;bank18.c:142: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:143: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:144: j = 0;
	ld	hl, #_j
	ld	(hl), #0x00
;bank18.c:145: u_k = 0;
	ld	hl, #_u_k
	ld	(hl), #0x00
;bank18.c:147: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
;bank18.c:149: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:152: load_pos_y = camera_y;
	ld	a, (#_camera_y)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:161: else if(char_player.pos_y >= map_size_y - 4)
	ld	a, (#_map_size_y)
	ldhl	sp,	#18
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:163: u_y = map_size_y - 9;
	ld	a, (#_map_size_y)
	ldhl	sp,	#20
	ld	(hl), a
;bank18.c:172: if(camera_y + 18 > 31)
	ld	a, (#_camera_y)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:174: while(1)
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
;bank18.c:147: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ld	de, #0x0005
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	inc	hl
	inc	hl
	ld	(hl-), a
	ld	(hl), e
;bank18.c:149: load_pos_x = camera_x + 20;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#23
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#22
	ld	(hl), a
;bank18.c:161: else if(char_player.pos_y >= map_size_y - 4)
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	(hl), e
;bank18.c:163: u_y = map_size_y - 9;
	ldhl	sp,	#20
	ld	a, (hl)
	add	a, #0xf7
	dec	hl
	ld	(hl), a
;bank18.c:172: if(camera_y + 18 > 31)
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
;bank18.c:174: while(1)
;c
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl), a
;bank18.c:172: if(camera_y + 18 > 31)
	ldhl	sp,	#14
	ld	a, #0x1f
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00769$
	bit	7, d
	jr	NZ, 00770$
	cp	a, a
	jr	00770$
00769$:
	bit	7, d
	jr	Z, 00770$
	scf
00770$:
	ld	a, #0x00
	rla
	ldhl	sp,	#20
	ld	(hl), a
;bank18.c:147: if(direction == right && char_player.pos_x <= map_size_x - 5)
	ldhl	sp,	#27
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00323$
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#10
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
	jp	C, 00323$
;bank18.c:149: load_pos_x = camera_x + 20;
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_x
	ld	(hl+), a
;bank18.c:150: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
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
;bank18.c:152: load_pos_y = camera_y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank18.c:153: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
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
;bank18.c:155: u_x = char_player.pos_x + 5;
	ld	a, (#(_char_player + 0x0006) + 0)
	add	a, #0x05
	ld	(#_u_x),a
;bank18.c:157: if(char_player.pos_y <= 5)
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#18
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#18
	sub	a, (hl)
	jr	C, 00109$
;bank18.c:159: u_y = 0;
	ld	hl, #_u_y
	ld	(hl), #0x00
	jr	00110$
00109$:
;bank18.c:161: else if(char_player.pos_y >= map_size_y - 4)
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#21
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00775$
	bit	7, d
	jr	NZ, 00776$
	cp	a, a
	jr	00776$
00775$:
	bit	7, d
	jr	Z, 00776$
	scf
00776$:
	jr	C, 00106$
;bank18.c:163: u_y = map_size_y - 9;
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(#_u_y),a
	jr	00110$
00106$:
;bank18.c:167: u_y = char_player.pos_y - 5;
	ldhl	sp,	#18
	ld	a, (hl)
	add	a, #0xfb
	ld	(#_u_y),a
00110$:
;bank18.c:170: u_j = u_x;
	ld	a, (#_u_x)
	ld	(#_u_j),a
;bank18.c:172: if(camera_y + 18 > 31)
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jp	Z, 00344$
;bank18.c:174: while(1)
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	ld	(hl), e
00126$:
;bank18.c:176: f = Map_YggdridLUT[u_y + j];
	ld	a, (#_u_y)
	ldhl	sp,	#15
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_j)
	ldhl	sp,	#17
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Map_YggdridLUT
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:177: base_byte = map->data[f + u_i];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:178: count_byte = map->data[f + u_i + 1];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
	or	a, a
	jp	Z, 00120$
;bank18.c:182: if(u_k == 0)
	ld	a, (#_u_k)
	or	a, a
	jr	NZ, 00112$
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ldhl	sp,#8
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
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
	jr	00113$
00112$:
;bank18.c:188: Draw_Tile18(load_pos_x, i, base_byte);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
00113$:
;bank18.c:191: j++;
	ld	hl, #_j
	inc	(hl)
;bank18.c:192: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:193: u_x = u_j;
	ld	a, (#_u_j)
	ld	(#_u_x),a
;bank18.c:194: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:172: if(camera_y + 18 > 31)
	ld	a, (#_camera_y)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:196: if(i == 32 - camera_y && u_k == 0)
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
	ld	b, a
	ld	c, e
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00121$
	ld	a, d
	sub	a, b
	jr	NZ, 00121$
	ld	a, (#_u_k)
	or	a, a
	jr	NZ, 00121$
;bank18.c:198: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:199: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
	jr	00121$
00120$:
;bank18.c:202: else if(count_byte <= u_x)
	bit	0,a
	jr	NZ, 00121$
;bank18.c:204: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:205: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:207: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00121$:
;bank18.c:210: if(i == camera_y - 14 && u_k == 1)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;bank18.c:210: if(i == camera_y - 14 && u_k == 1)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jp	NZ,00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	NZ,00126$
	ld	a, (#_u_k)
	dec	a
	jp	Z,00326$
;bank18.c:212: break;
	jp	00126$
;bank18.c:218: while(1)
00344$:
	ldhl	sp,#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00136$:
;bank18.c:220: f = Map_YggdridLUT[u_y + j];
	ld	hl, #_u_y
	ld	e, (hl)
	ld	d, #0x00
	ld	a, (#_j)
	ldhl	sp,	#17
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:221: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:222: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
;bank18.c:224: if(count_byte > u_x)
	ld	e, a
	or	a, a
	jr	Z, 00131$
;bank18.c:226: Draw_Tile18(load_pos_x, load_pos_y + j * 2, base_byte);
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	de
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:228: j++;
	ld	hl, #_j
	inc	(hl)
;bank18.c:229: u_x = u_j;
	ld	a, (#_u_j)
	ld	(#_u_x),a
;bank18.c:230: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
	jr	00132$
00131$:
;bank18.c:232: else if(count_byte <= u_x)
	bit	0, e
	jr	NZ, 00132$
;bank18.c:234: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:235: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:237: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00132$:
;bank18.c:240: if(j == 9)
	ld	a, (#_j)
	sub	a, #0x09
	jp	Z,00326$
;bank18.c:242: break;
	jp	00136$
00323$:
;bank18.c:248: else if(direction == left && char_player.pos_x >= 5)
	ldhl	sp,	#27
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00319$
	ld	bc, #_char_player + 6
	ld	a, (bc)
	sub	a, #0x05
	jp	C, 00319$
;bank18.c:250: if(camera_x == 0){load_pos_x = 30;}
	ld	a, (#_camera_x)
	or	a, a
	jr	NZ, 00142$
	ld	hl, #_load_pos_x
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00143$
00142$:
;bank18.c:251: else{load_pos_x = camera_x - 2;}
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
00143$:
;bank18.c:253: load_pos_y = camera_y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank18.c:254: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00145$
	ld	hl, #_load_pos_y
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00145$:
;bank18.c:256: u_x = char_player.pos_x - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(#_u_x),a
;bank18.c:258: if(char_player.pos_y <= 5)
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#22
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#22
	sub	a, (hl)
	jr	C, 00150$
;bank18.c:260: u_y = 0;
	ld	hl, #_u_y
	ld	(hl), #0x00
	jr	00151$
00150$:
;bank18.c:262: else if(char_player.pos_y >= map_size_y - 4)
	ldhl	sp,	#22
	ld	c, (hl)
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
	jr	Z, 00789$
	bit	7, d
	jr	NZ, 00790$
	cp	a, a
	jr	00790$
00789$:
	bit	7, d
	jr	Z, 00790$
	scf
00790$:
	jr	C, 00147$
;bank18.c:264: u_y = map_size_y - 9;
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(#_u_y),a
	jr	00151$
00147$:
;bank18.c:268: u_y = char_player.pos_y - 5;
	ldhl	sp,	#22
	ld	a, (hl)
	add	a, #0xfb
	ld	(#_u_y),a
00151$:
;bank18.c:271: u_j = u_x;
	ld	a, (#_u_x)
	ld	(#_u_j),a
;bank18.c:273: if(camera_y + 18 > 31)
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jp	Z, 00362$
;bank18.c:275: while(1)
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	ld	(hl), e
00167$:
;bank18.c:277: f = Map_YggdridLUT[u_y + j];
	ld	a, (#_u_y)
	ldhl	sp,	#15
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_j)
	ldhl	sp,	#17
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Map_YggdridLUT
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:278: base_byte = map->data[f + u_i];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:279: count_byte = map->data[f + u_i + 1];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
;bank18.c:281: if(count_byte > u_x)
	or	a, a
	jp	Z, 00161$
;bank18.c:283: if(u_k == 0)
	ld	a, (#_u_k)
	or	a, a
	jr	NZ, 00153$
;bank18.c:285: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ldhl	sp,#8
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
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
	jr	00154$
00153$:
;bank18.c:289: Draw_Tile18(load_pos_x, i, base_byte);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	bc
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
00154$:
;bank18.c:292: j++;
	ld	hl, #_j
	inc	(hl)
;bank18.c:293: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:294: u_x = u_j;
	ld	a, (#_u_j)
	ld	(#_u_x),a
;bank18.c:295: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:172: if(camera_y + 18 > 31)
	ld	a, (#_camera_y)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:297: if(i == 32 - camera_y && u_k == 0)
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
	ld	b, a
	ld	c, e
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00162$
	ld	a, d
	sub	a, b
	jr	NZ, 00162$
	ld	a, (#_u_k)
	or	a, a
	jr	NZ, 00162$
;bank18.c:299: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:300: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
	jr	00162$
00161$:
;bank18.c:303: else if(count_byte <= u_x)
	bit	0,a
	jr	NZ, 00162$
;bank18.c:305: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:306: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:308: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00162$:
;bank18.c:311: if(i == camera_y - 14 && u_k == 1)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;bank18.c:311: if(i == camera_y - 14 && u_k == 1)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jp	NZ,00167$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	NZ,00167$
	ld	a, (#_u_k)
	dec	a
	jp	Z,00326$
;bank18.c:313: break;
	jp	00167$
;bank18.c:319: while(1)
00362$:
	ldhl	sp,#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00177$:
;bank18.c:321: f = Map_YggdridLUT[u_y + j];
	ld	hl, #_u_y
	ld	e, (hl)
	ld	d, #0x00
	ld	a, (#_j)
	ldhl	sp,	#17
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:322: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:323: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
;bank18.c:325: if(count_byte > u_x)
	ld	e, a
	or	a, a
	jr	Z, 00172$
;bank18.c:327: Draw_Tile18(load_pos_x, load_pos_y + j * 2, base_byte);
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	hl, #_load_pos_y
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	push	de
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:329: j++;
	ld	hl, #_j
	inc	(hl)
;bank18.c:330: u_x = u_j;
	ld	a, (#_u_j)
	ld	(#_u_x),a
;bank18.c:331: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
	jr	00173$
00172$:
;bank18.c:333: else if(count_byte <= u_x)
	bit	0, e
	jr	NZ, 00173$
;bank18.c:335: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:336: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:338: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00173$:
;bank18.c:341: if(j == 9)
	ld	a, (#_j)
	sub	a, #0x09
	jp	Z,00326$
;bank18.c:343: break;
	jp	00177$
00319$:
;bank18.c:351: load_pos_x = camera_x;
	ld	hl, #_camera_x
	ld	c, (hl)
	ld	b, #0x00
;bank18.c:363: u_x = map_size_x - 10;
	ld	hl, #_map_size_x
	ld	e, (hl)
;bank18.c:483: else if(i == 10)
	ld	a, (#_i)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00802$
	xor	a, a
00802$:
	ldhl	sp,	#18
	ld	(hl), a
;bank18.c:363: u_x = map_size_x - 10;
	ld	a, e
	add	a, #0xf6
	inc	hl
;bank18.c:372: if(camera_x + 20 > 32)
	ld	(hl+), a
	inc	hl
	ld	a, #0x20
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00803$
	bit	7, d
	jr	NZ, 00804$
	cp	a, a
	jr	00804$
00803$:
	bit	7, d
	jr	Z, 00804$
	scf
00804$:
	ld	a, #0x00
	rla
	ldhl	sp,	#20
	ld	(hl), a
;bank18.c:349: else if(direction == down && char_player.pos_y <= map_size_y - 4)
	ldhl	sp,	#27
	ld	a, (hl)
	dec	a
	jp	NZ,00315$
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#21
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00807$
	bit	7, d
	jr	NZ, 00808$
	cp	a, a
	jr	00808$
00807$:
	bit	7, d
	jr	Z, 00808$
	scf
00808$:
	jp	C, 00315$
;bank18.c:351: load_pos_x = camera_x;
	ld	hl, #_load_pos_x
	ld	a, c
	ld	(hl+), a
;bank18.c:352: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00183$
	ld	hl, #_load_pos_x
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00183$:
;bank18.c:354: load_pos_y = camera_y + 18;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_load_pos_y
	ld	(hl+), a
;bank18.c:355: if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00185$
	ld	hl, #_load_pos_y
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00185$:
;bank18.c:357: if(char_player.pos_x <= 5)
	ld	a, (#(_char_player + 0x0006) + 0)
	ldhl	sp,	#22
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#22
	sub	a, (hl)
	jr	C, 00190$
;bank18.c:359: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
	jr	00191$
00190$:
;bank18.c:361: else if(char_player.pos_x >= map_size_x - 5)
	ldhl	sp,	#22
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#10
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00809$
	bit	7, d
	jr	NZ, 00810$
	cp	a, a
	jr	00810$
00809$:
	bit	7, d
	jr	Z, 00810$
	scf
00810$:
	jr	C, 00187$
;bank18.c:363: u_x = map_size_x - 10;
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(#_u_x),a
	jr	00191$
00187$:
;bank18.c:367: u_x = char_player.pos_x - 5;
	ldhl	sp,	#22
	ld	a, (hl)
	add	a, #0xfb
	ld	(#_u_x),a
00191$:
;bank18.c:370: u_y = char_player.pos_y + 4;
	ld	a, (#(_char_player + 0x0007) + 0)
	add	a, #0x04
	ld	(#_u_y),a
;bank18.c:372: if(camera_x + 20 > 32)
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jp	Z, 00387$
;bank18.c:374: while(1)
	ldhl	sp,#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00223$:
;bank18.c:376: f = Map_YggdridLUT[u_y];
	ld	hl, #_u_y
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:377: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:378: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
;bank18.c:380: if(count_byte > u_x)
	or	a, a
	jp	Z, 00217$
;bank18.c:382: count_byte -= u_x;
	ld	a, (hl)
	ld	hl, #_u_x
	sub	a, (hl)
	ld	(#_count_byte),a
;bank18.c:383: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank18.c:385: if(u_k == 0)
	ld	a, (#_u_k)
	or	a, a
	jp	NZ, 00203$
;bank18.c:387: while(1)
00200$:
;bank18.c:389: Draw_Tile18(load_pos_x + i, load_pos_y, base_byte);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:391: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:392: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:149: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
;bank18.c:398: if(i == 32 - camera_x)
	ld	de, #0x0020
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#21
	sub	a, (hl)
	jr	NZ, 00811$
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#22
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00812$
00811$:
	xor	a, a
00812$:
	ld	e, a
;bank18.c:394: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00197$
;bank18.c:396: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:398: if(i == 32 - camera_x)
	ld	a, e
	or	a, a
	jr	Z, 00203$
;bank18.c:400: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
;bank18.c:402: f = Map_YggdridLUT[u_y];
	ld	hl, #_u_y
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:403: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:404: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:406: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:408: break;
	jr	00203$
;bank18.c:411: break;
00197$:
;bank18.c:413: else if(i == 32 - camera_x)
	ld	a, e
	or	a, a
	jp	Z, 00200$
;bank18.c:415: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
;bank18.c:416: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:418: break;
00203$:
;bank18.c:423: if(u_k == 1)
	ld	a, (#_u_k)
	dec	a
	jr	NZ, 00218$
;bank18.c:425: while(1)
00210$:
;bank18.c:427: Draw_Tile18(i, load_pos_y, base_byte);
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:429: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:430: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:149: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:432: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00207$
;bank18.c:434: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:435: break;
	jr	00218$
00207$:
;bank18.c:437: else if(i == camera_x - 12)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00210$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00218$
;bank18.c:439: break;
	jr	00210$
00217$:
;bank18.c:444: else if(count_byte <= u_x)
	bit	0,a
	jr	NZ, 00218$
;bank18.c:446: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:447: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:449: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00218$:
;bank18.c:452: if(i == camera_x - 12 && u_k == 1)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;bank18.c:452: if(i == camera_x - 12 && u_k == 1)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#21
	sub	a, (hl)
	jp	NZ,00223$
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#22
	sub	a, (hl)
	jp	NZ,00223$
	ld	a, (#_u_k)
	dec	a
	jp	Z,00326$
;bank18.c:454: break;
	jp	00223$
;bank18.c:460: while(1)
00387$:
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	ld	(hl), e
00241$:
;bank18.c:462: f = Map_YggdridLUT[u_y];
	ld	a, (#_u_y)
	ldhl	sp,	#19
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Map_YggdridLUT
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:463: base_byte = map->data[f + u_i];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:464: count_byte = map->data[f + u_i + 1];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#20
;bank18.c:466: if(count_byte > u_x)
	ld	(hl), a
	or	a, a
	jp	Z, 00236$
;bank18.c:468: count_byte -= u_x;
	ld	a, (#_count_byte)
	ld	hl, #_u_x
	sub	a, (hl)
	ld	(#_count_byte),a
;bank18.c:469: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank18.c:471: while(1)
00231$:
;bank18.c:473: Draw_Tile18(load_pos_x + i * 2, load_pos_y, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#19
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#17
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl), a
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
;bank18.c:475: i++;
	ld	hl, #_i
	inc	(hl)
;bank18.c:476: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:483: else if(i == 10)
	ld	a, (#_i)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00823$
	xor	a, a
00823$:
	ldhl	sp,	#18
	ld	(hl), a
;bank18.c:478: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00228$
;bank18.c:480: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:481: break;
	jr	00237$
00228$:
;bank18.c:483: else if(i == 10)
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	NZ, 00237$
;bank18.c:485: break;
	jr	00231$
00236$:
;bank18.c:489: else if(count_byte <= u_x)
	ldhl	sp,	#20
	bit	0, (hl)
	jr	NZ, 00237$
;bank18.c:491: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:492: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:494: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00237$:
;bank18.c:497: if(i == 10)
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00241$
;bank18.c:499: break;
	jp	00326$
00315$:
;bank18.c:505: else if(direction == up && char_player.pos_y >= 5)
	ldhl	sp,	#27
	ld	a, (hl)
	or	a, a
	jp	NZ, 00326$
	ld	a, (#(_char_player + 0x0007) + 0)
	sub	a, #0x05
	jp	C, 00326$
;bank18.c:507: load_pos_x = camera_x;
	ld	hl, #_load_pos_x
	ld	a, c
	ld	(hl+), a
;bank18.c:508: if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x20
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00247$
	ld	hl, #_load_pos_x
	ld	a, (hl)
	add	a, #0xe0
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00247$:
;bank18.c:510: if(camera_y == 0){load_pos_y = 30;}
	ld	a, (#_camera_y)
	or	a, a
	jr	NZ, 00249$
	ld	hl, #_load_pos_y
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00250$
00249$:
;bank18.c:511: else{load_pos_y = camera_y - 2;}
	ldhl	sp,#6
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
00250$:
;bank18.c:513: if(char_player.pos_x <= 5)
	ld	a, (#(_char_player + 0x0006) + 0)
	ldhl	sp,	#22
	ld	(hl), a
	ld	a, #0x05
	ldhl	sp,	#22
	sub	a, (hl)
	jr	C, 00255$
;bank18.c:515: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
	jr	00256$
00255$:
;bank18.c:517: else if(char_player.pos_x >= map_size_x - 5)
	ldhl	sp,	#22
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#10
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00824$
	bit	7, d
	jr	NZ, 00825$
	cp	a, a
	jr	00825$
00824$:
	bit	7, d
	jr	Z, 00825$
	scf
00825$:
	jr	C, 00252$
;bank18.c:519: u_x = map_size_x - 10;
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(#_u_x),a
	jr	00256$
00252$:
;bank18.c:523: u_x = char_player.pos_x - 5;
	ldhl	sp,	#22
	ld	a, (hl)
	add	a, #0xfb
	ld	(#_u_x),a
00256$:
;bank18.c:526: u_y = char_player.pos_y - 6;
	ld	a, (#(_char_player + 0x0007) + 0)
	add	a, #0xfa
	ld	(#_u_y),a
;bank18.c:528: if(camera_x + 20 > 32)
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jp	Z, 00412$
;bank18.c:530: while(1)
	ldhl	sp,#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00288$:
;bank18.c:532: f = Map_YggdridLUT[u_y];
	ld	hl, #_u_y
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:533: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:534: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
;bank18.c:536: if(count_byte > u_x)
	or	a, a
	jp	Z, 00282$
;bank18.c:538: count_byte -= u_x;
	ld	a, (hl)
	ld	hl, #_u_x
	sub	a, (hl)
	ld	(#_count_byte),a
;bank18.c:539: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank18.c:541: if(u_k == 0)
	ld	a, (#_u_k)
	or	a, a
	jp	NZ, 00268$
;bank18.c:543: while(1)
00265$:
;bank18.c:545: Draw_Tile18(load_pos_x + i, load_pos_y, base_byte);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	ld	hl, #_load_pos_x
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:547: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:548: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:149: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
;bank18.c:398: if(i == 32 - camera_x)
	ld	de, #0x0020
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#21
	sub	a, (hl)
	jr	NZ, 00826$
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#22
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00827$
00826$:
	xor	a, a
00827$:
	ld	e, a
;bank18.c:550: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00262$
;bank18.c:552: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:554: if(i == 32 - camera_x)
	ld	a, e
	or	a, a
	jr	Z, 00268$
;bank18.c:556: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
;bank18.c:558: f = Map_YggdridLUT[u_y];
	ld	hl, #_u_y
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:559: base_byte = map->data[f + u_i];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	e, (hl)
	ld	d, #0x00
;c
	ld	hl, #_f
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:560: count_byte = map->data[f + u_i + 1];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;c
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_count_byte),a
;bank18.c:562: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:564: break;
	jr	00268$
;bank18.c:567: break;
00262$:
;bank18.c:569: else if(i == 32 - camera_x)
	ld	a, e
	or	a, a
	jp	Z, 00265$
;bank18.c:571: u_k = 1;
	ld	hl, #_u_k
	ld	(hl), #0x01
;bank18.c:572: i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;bank18.c:574: break;
00268$:
;bank18.c:579: if(u_k == 1)
	ld	a, (#_u_k)
	dec	a
	jr	NZ, 00283$
;bank18.c:581: while(1)
00275$:
;bank18.c:583: Draw_Tile18(i, load_pos_y, base_byte);
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	push	bc
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_Draw_Tile18
	add	sp, #5
	pop	bc
;bank18.c:585: i += 2;
	ld	hl, #_i
	inc	(hl)
	inc	(hl)
;bank18.c:586: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:149: load_pos_x = camera_x + 20;
	ld	a, (#_camera_x)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank18.c:588: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00272$
;bank18.c:590: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:591: break;
	jr	00283$
00272$:
;bank18.c:593: else if(i == camera_x - 12)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00275$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00283$
;bank18.c:595: break;
	jr	00275$
00282$:
;bank18.c:600: else if(count_byte <= u_x)
	bit	0,a
	jr	NZ, 00283$
;bank18.c:602: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:603: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:605: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00283$:
;bank18.c:608: if(i == camera_x - 12 && u_k == 1)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#22
	ld	(hl-), a
	ld	(hl), e
;bank18.c:184: Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#8
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
;bank18.c:608: if(i == camera_x - 12 && u_k == 1)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#21
	sub	a, (hl)
	jp	NZ,00288$
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#22
	sub	a, (hl)
	jp	NZ,00288$
	ld	a, (#_u_k)
	dec	a
	jp	Z,00326$
;bank18.c:610: break;
	jp	00288$
;bank18.c:616: while(1)
00412$:
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	ld	(hl), e
00306$:
;bank18.c:618: f = Map_YggdridLUT[u_y];
	ld	a, (#_u_y)
	ldhl	sp,	#19
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Map_YggdridLUT
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:619: base_byte = map->data[f + u_i];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:620: count_byte = map->data[f + u_i + 1];
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:180: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#20
;bank18.c:622: if(count_byte > u_x)
	ld	(hl), a
	or	a, a
	jp	Z, 00301$
;bank18.c:624: count_byte -= u_x;
	ld	a, (#_count_byte)
	ld	hl, #_u_x
	sub	a, (hl)
	ld	(#_count_byte),a
;bank18.c:625: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank18.c:627: while(1)
00296$:
;bank18.c:629: Draw_Tile18(load_pos_x + i * 2, load_pos_y, base_byte);
	ld	a, (#_i)
	ldhl	sp,	#19
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#17
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_load_pos_x
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl), a
	ld	a, (#_base_byte)
	push	af
	inc	sp
	ld	hl, #_load_pos_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Tile18
	add	sp, #5
;bank18.c:631: i++;
	ld	hl, #_i
	inc	(hl)
;bank18.c:632: count_byte--;
	ld	hl, #_count_byte
	dec	(hl)
;bank18.c:483: else if(i == 10)
	ld	a, (#_i)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00838$
	xor	a, a
00838$:
	ldhl	sp,	#18
	ld	(hl), a
;bank18.c:634: if(count_byte == 0)
	ld	a, (#_count_byte)
	or	a, a
	jr	NZ, 00293$
;bank18.c:636: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank18.c:637: break;
	jr	00302$
00293$:
;bank18.c:639: else if(i == 10)
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	NZ, 00302$
;bank18.c:641: break;
	jr	00296$
00301$:
;bank18.c:645: else if(count_byte <= u_x)
	ldhl	sp,	#20
	bit	0, (hl)
	jr	NZ, 00302$
;bank18.c:647: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:648: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:650: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
00302$:
;bank18.c:653: if(i == 10)
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00306$
;bank18.c:655: break;
00326$:
;bank18.c:660: }
	add	sp, #23
	ret
;bank18.c:662: UBYTE Check_Tile_Collision_Bank18(GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y)
;	---------------------------------
; Function Check_Tile_Collision_Bank18
; ---------------------------------
_Check_Tile_Collision_Bank18::
	add	sp, #-4
;bank18.c:664: u_i = 0;
	ld	hl, #_u_i
	ld	(hl), #0x00
;bank18.c:666: u_x = character->pos_x + move_x;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#10
	add	a, (hl)
	ld	(#_u_x),a
;bank18.c:667: u_y = character->pos_y + move_y;
	ld	hl, #0x0007
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#11
	add	a, (hl)
	ld	(#_u_y),a
;bank18.c:669: while(1)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;c
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
00107$:
;bank18.c:671: f = Map_YggdridLUT[u_y];
	ld	hl, #_u_y
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	de, #_Map_YggdridLUT
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_f
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank18.c:672: base_byte = map->data[f + u_i];
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_i
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	ld	hl, #_f
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_base_byte),a
;bank18.c:673: count_byte = map->data[f + u_i + 1];
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	bc
	add	hl, bc
	ld	a, (hl)
	ld	(#_count_byte),a
;bank18.c:675: if(count_byte > u_x)
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	a, #0x00
	rla
	or	a, a
	jr	Z, 00104$
;bank18.c:677: return tilemap_3[base_byte] == impassable ? true : false;
	ld	bc, #_tilemap_3+0
	ld	a, c
	ld	hl, #_base_byte
	add	a, (hl)
	ld	c, a
	jr	NC, 00133$
	inc	b
00133$:
	ld	a, (bc)
	dec	a
	jr	NZ, 00111$
	ld	de, #0x0001
	jr	00109$
00111$:
	ld	de, #0x0000
	jr	00109$
00104$:
;bank18.c:679: else if(count_byte <= u_x)
	bit	0,a
	jr	NZ, 00107$
;bank18.c:681: u_x -= count_byte;
	ld	a, (#_u_x)
	ld	hl, #_count_byte
	sub	a, (hl)
	ld	(#_u_x),a
;bank18.c:682: count_byte = 0;
	ld	hl, #_count_byte
	ld	(hl), #0x00
;bank18.c:684: u_i += 2;
	ld	hl, #_u_i
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	jp	00107$
00109$:
;bank18.c:687: }
	add	sp, #4
	ret
	.area _CODE_18
	.area _CABS (ABS)
