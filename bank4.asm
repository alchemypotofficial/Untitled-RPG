;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank4
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Set_Sprite_Packages
	.globl _Set_Char_Tile
	.globl _Load_Char_Sprite
	.globl _set_sprite_data
	.globl _Tiles_Man_1BLK2
	.globl _Tiles_Man_1BLK1
	.globl _Tiles_Man_1BLK0
	.globl _Hiro_TilesBLK3
	.globl _Hiro_TilesBLK2
	.globl _Hiro_TilesBLK1
	.globl _Hiro_TilesBLK0
	.globl _Tiles_HiroBLK2
	.globl _Tiles_HiroBLK1
	.globl _Tiles_HiroBLK0
	.globl _Clear_Tiles
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
	.area _CODE_4
;bank4.c:14: void Load_Char_Sprite(GameCharacter* character, GameSprite* sprite)
;	---------------------------------
; Function Load_Char_Sprite
; ---------------------------------
_Load_Char_Sprite::
;bank4.c:16: set_sprite_data(character->sprite_index, 4, sprite->tiles);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	bc
	ld	h, #0x04
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;bank4.c:17: }
	ret
_Clear_Tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_HiroBLK0:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1b	; 27
	.db #0x17	; 23
	.db #0x21	; 33
	.db #0x3e	; 62
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xec	; 236
	.db #0xf4	; 244
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0x12	; 18
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf2	; 242
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
_Tiles_HiroBLK1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x1b	; 27
	.db #0x34	; 52	'4'
	.db #0x2f	; 47
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x34	; 52	'4'
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe4	; 228
	.db #0xb8	; 184
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
_Tiles_HiroBLK2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x13	; 19
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xf4	; 244
	.db #0xec	; 236
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0x96	; 150
	.db #0xf6	; 246
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
_Hiro_TilesBLK0:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x3e	; 62
	.db #0x2e	; 46
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xc8	; 200
	.db #0xbf	; 191
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x2d	; 45
	.db #0x3f	; 63
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x74	; 116	't'
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0x2f	; 47
	.db #0x38	; 56	'8'
	.db #0x3b	; 59
	.db #0x2d	; 45
	.db #0x12	; 18
	.db #0x1d	; 29
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x64	; 100	'd'
	.db #0x5b	; 91
	.db #0x48	; 72	'H'
	.db #0x7f	; 127
	.db #0xb8	; 184
	.db #0xcf	; 207
	.db #0xf4	; 244
	.db #0x1c	; 28
	.db #0xdc	; 220
	.db #0xb4	; 180
	.db #0x48	; 72	'H'
	.db #0xb8	; 184
	.db #0x30	; 48	'0'
	.db #0xd0	; 208
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0x26	; 38
	.db #0xda	; 218
	.db #0x12	; 18
	.db #0xfe	; 254
	.db #0x1d	; 29
	.db #0xf3	; 243
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xf8	; 248
	.db #0x97	; 151
	.db #0x7e	; 126
	.db #0x61	; 97	'a'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x17	; 23
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0x1f	; 31
	.db #0xe9	; 233
	.db #0x7e	; 126
	.db #0x86	; 134
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xe8	; 232
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
_Hiro_TilesBLK1:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x3e	; 62
	.db #0x2e	; 46
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xc8	; 200
	.db #0xbf	; 191
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x2d	; 45
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0xa4	; 164
	.db #0xfc	; 252
	.db #0xb8	; 184
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x2b	; 43
	.db #0x3e	; 62
	.db #0x17	; 23
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x35	; 53	'5'
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5f	; 95
	.db #0x48	; 72	'H'
	.db #0x7f	; 127
	.db #0xb8	; 184
	.db #0xd7	; 215
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xd4	; 212
	.db #0x7c	; 124
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xac	; 172
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0xfa	; 250
	.db #0x12	; 18
	.db #0xfe	; 254
	.db #0x1d	; 29
	.db #0xeb	; 235
	.db #0xdf	; 223
	.db #0xbe	; 190
	.db #0xf8	; 248
	.db #0x97	; 151
	.db #0x7e	; 126
	.db #0x61	; 97	'a'
	.db #0x2e	; 46
	.db #0x31	; 49	'1'
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x17	; 23
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xfb	; 251
	.db #0x7d	; 125
	.db #0x1f	; 31
	.db #0xe9	; 233
	.db #0x7e	; 126
	.db #0x86	; 134
	.db #0x74	; 116	't'
	.db #0x8c	; 140
	.db #0xa8	; 168
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x98	; 152
	.db #0xe8	; 232
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
_Hiro_TilesBLK2:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x5b	; 91
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0x78	; 120	'x'
	.db #0xd2	; 210
	.db #0xf4	; 244
	.db #0xa4	; 164
	.db #0xea	; 234
	.db #0x6a	; 106	'j'
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
_Hiro_TilesBLK3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x9e	; 158
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0xda	; 218
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x36	; 54	'6'
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x35	; 53	'5'
	.db #0x1e	; 30
	.db #0x4b	; 75	'K'
	.db #0x2f	; 47
	.db #0x25	; 37
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0xe8	; 232
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0xb0	; 176
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0xb0	; 176
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
_Tiles_Man_1BLK0:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x3e	; 62
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x27	; 39
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0x12	; 18
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf2	; 242
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
_Tiles_Man_1BLK1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x34	; 52	'4'
	.db #0x2f	; 47
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x34	; 52	'4'
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe4	; 228
	.db #0xb8	; 184
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
_Tiles_Man_1BLK2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x13	; 19
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0x96	; 150
	.db #0xf6	; 246
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
;bank4.c:19: void Set_Char_Tile(GameCharacter* character, UBYTE tile, GameSprite* sprite)
;	---------------------------------
; Function Set_Char_Tile
; ---------------------------------
_Set_Char_Tile::
;bank4.c:21: set_sprite_data(character->sprite_index + tile, 1, sprite->tiles);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	inc	hl
	add	a, (hl)
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;bank4.c:22: }
	ret
;bank4.c:24: void Set_Sprite_Packages(GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right)
;	---------------------------------
; Function Set_Sprite_Packages
; ---------------------------------
_Set_Sprite_Packages::
;bank4.c:26: character->sprites_up = sprites_up;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;bank4.c:27: character->sprites_down = sprites_down;
	ld	hl, #0x0011
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;bank4.c:28: character->sprites_left = sprites_left;
	ld	hl, #0x0013
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;bank4.c:29: character->sprites_right = sprites_right;
	ld	hl, #0x0015
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;bank4.c:30: }
	ret
	.area _CODE_4
	.area _CABS (ABS)
