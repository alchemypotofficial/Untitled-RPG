;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank6
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Close_Message_Box
	.globl _Draw_Message_Box
	.globl _parallax_char_sprites
	.globl _Retrieve_Font_Value
	.globl _Call_Set_Char_Tile
	.globl _Call_Load_Char_Sprite
	.globl _set_bkg_tileset
	.globl _set_win_map
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _pointer_tick
	.globl _Message_Blank
	.globl _Message_Format_3
	.globl _Message_Format_2
	.globl _Message_Format_1
	.globl _Map_MessageBoxPLN1
	.globl _Map_MessageBoxPLN0
	.globl _Font_Window
	.globl _Font_1
	.globl _Load_Window
	.globl _Load_Message_Box
	.globl _Draw_Pointer
	.globl _scroll_message
	.globl _clear_message
	.globl _clear_messagebox
	.globl _reset_char_sprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pointer_tick::
	.ds 1
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
	.area _CODE_6
;bank6.c:59: UBYTE Retrieve_Font_Value()
;	---------------------------------
; Function Retrieve_Font_Value
; ---------------------------------
_Retrieve_Font_Value::
;bank6.c:61: return Font_1[g + i];
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	hl, #_g
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	hl, #_Font_1
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;bank6.c:62: }
	ret
_Font_1:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x57	; 87	'W'
	.db #0x8f	; 143
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0xea	; 234
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0xb7	; 183
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xe1	; 225
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x91	; 145
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x93	; 147
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x81	; 129
	.db #0x93	; 147
	.db #0x91	; 145
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x83	; 131
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x23	; 35
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x23	; 35
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x93	; 147
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x93	; 147
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xa3	; 163
	.db #0xb3	; 179
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x98	; 152
	.db #0x9b	; 155
	.db #0xc5	; 197
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x90	; 144
	.db #0xf1	; 241
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0x8f	; 143
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xc0	; 192
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xf9	; 249
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc1	; 193
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0x93	; 147
	.db #0x01	; 1
	.db #0x33	; 51	'3'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xf3	; 243
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x90	; 144
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x18	; 24
	.db #0x39	; 57	'9'
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0xc0	; 192
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xf3	; 243
	.db #0x81	; 129
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x21	; 33
	.db #0x33	; 51	'3'
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x21	; 33
	.db #0x33	; 51	'3'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x35	; 53	'5'
	.db #0x31	; 49	'1'
	.db #0x3b	; 59
	.db #0x81	; 129
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x39	; 57	'9'
	.db #0x23	; 35
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x23	; 35
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x93	; 147
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0xf1	; 241
	.db #0xc1	; 193
	.db #0xe3	; 227
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x07	; 7
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xe3	; 227
	.db #0xc1	; 193
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
_Font_Window:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x8f	; 143
	.db #0x4f	; 79	'O'
	.db #0x98	; 152
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0x19	; 25
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x98	; 152
	.db #0x5f	; 95
	.db #0x8f	; 143
	.db #0x4f	; 79	'O'
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0x19	; 25
	.db #0xfa	; 250
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_MessageBoxPLN0:
	.db #0xd4	; 212
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd5	; 213
	.db #0xd9	; 217
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xdb	; 219
	.db #0xd9	; 217
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xdb	; 219
	.db #0xd9	; 217
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xdb	; 219
	.db #0xd6	; 214
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xd7	; 215
_Map_MessageBoxPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Message_Format_1:
	.db #0xdc	; 220
	.db #0xdd	; 221
	.db #0xde	; 222
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xe1	; 225
	.db #0xe2	; 226
	.db #0xe3	; 227
	.db #0xe4	; 228
	.db #0xe5	; 229
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0xe8	; 232
	.db #0xe9	; 233
	.db #0xea	; 234
	.db #0xeb	; 235
	.db #0xec	; 236
	.db #0xed	; 237
_Message_Format_2:
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0xf3	; 243
	.db #0xf4	; 244
	.db #0xf5	; 245
	.db #0xf6	; 246
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0xfa	; 250
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
_Message_Format_3:
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xd3	; 211
_Message_Blank:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
;bank6.c:64: void Load_Window()
;	---------------------------------
; Function Load_Window
; ---------------------------------
_Load_Window::
;bank6.c:66: set_bkg_tileset(210, 11, Font_Window);
	ld	hl, #_Font_Window
	push	hl
	ld	de, #0x0bd2
	push	de
	call	_set_bkg_tileset
	add	sp, #4
;bank6.c:67: }
	ret
;bank6.c:69: void Load_Message_Box()
;	---------------------------------
; Function Load_Message_Box
; ---------------------------------
_Load_Message_Box::
;c:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0xa0
	ldh	(_WY_REG+0),a
;bank6.c:73: set_bkg_tileset(220, 36, Message_Blank);
	ld	hl, #_Message_Blank
	push	hl
	ld	de, #0x24dc
	push	de
	call	_set_bkg_tileset
	add	sp, #4
;bank6.c:75: set_win_map(0, 0, 20, 5, Map_MessageBoxPLN1, Map_MessageBoxPLN0);
	ld	hl, #_Map_MessageBoxPLN0
	push	hl
	ld	hl, #_Map_MessageBoxPLN1
	push	hl
	ld	de, #0x0514
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_map
	add	sp, #8
;bank6.c:76: set_win_map(1, 1, 18, 1, Message_Format_1, Message_Format_1);
	ld	bc, #_Message_Format_1+0
	push	bc
	push	bc
	ld	de, #0x0112
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:77: set_win_map(1, 2, 18, 1, Message_Format_2, Message_Format_2);
	ld	bc, #_Message_Format_2+0
	push	bc
	push	bc
	ld	de, #0x0112
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:79: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;bank6.c:80: }
	ret
;bank6.c:82: void parallax_char_sprites()
;	---------------------------------
; Function parallax_char_sprites
; ---------------------------------
_parallax_char_sprites::
	add	sp, #-6
;bank6.c:84: if(char_npc_1.active == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jp	NZ,00113$
;bank6.c:86: if(char_npc_1.pos_y > char_player.pos_y + 2)
	ld	a, (#(_char_npc_1 + 0x0007) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00233$
	bit	7, d
	jr	NZ, 00234$
	cp	a, a
	jr	00234$
00233$:
	bit	7, d
	jr	Z, 00234$
	scf
00234$:
	jr	NC, 00110$
;bank6.c:88: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00127$:
;bank6.c:90: Call_Set_Char_Tile(bank6, &char_npc_1, i, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	ld	a, (#_i)
	push	af
	inc	sp
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:88: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00127$
	jr	00113$
00110$:
;bank6.c:93: else if(char_npc_1.pos_y > char_player.pos_y + 1)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	hl
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00235$
	bit	7, d
	jr	NZ, 00236$
	cp	a, a
	jr	00236$
00235$:
	bit	7, d
	jr	Z, 00236$
	scf
00236$:
	jr	NC, 00107$
;bank6.c:95: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00129$:
;bank6.c:97: Call_Set_Char_Tile(bank6, &char_npc_1, 2 + i, &sprite_clear);
	ld	de, #_sprite_clear
	ld	hl, #_i
	ld	b, (hl)
	inc	b
	inc	b
	push	de
	push	bc
	inc	sp
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:95: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00129$
	jr	00113$
00107$:
;bank6.c:100: else if(char_npc_1.pos_y > char_player.pos_y)
	ldhl	sp,	#1
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00113$
;bank6.c:102: for(i = 0; i < 2; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00131$:
;bank6.c:104: Call_Set_Char_Tile(bank6, &char_npc_1, 4 + i, &sprite_clear);
	ld	de, #_sprite_clear
	ld	hl, #_i
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	push	de
	push	bc
	inc	sp
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:102: for(i = 0; i < 2; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00131$
00113$:
;bank6.c:108: if(char_npc_2.active == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jp	NZ,00139$
;bank6.c:110: if(char_npc_2.pos_y > char_player.pos_y + 2)
	ld	a, (#(_char_npc_2 + 0x0007) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00239$
	bit	7, d
	jr	NZ, 00240$
	cp	a, a
	jr	00240$
00239$:
	bit	7, d
	jr	Z, 00240$
	scf
00240$:
	jr	NC, 00123$
;bank6.c:112: for(i = 0; i < 6; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00133$:
;bank6.c:114: Call_Set_Char_Tile(bank6, &char_npc_2, i, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	ld	a, (#_i)
	push	af
	inc	sp
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:112: for(i = 0; i < 6; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x86
	jr	C, 00133$
	jr	00139$
00123$:
;bank6.c:117: else if(char_npc_2.pos_y > char_player.pos_y + 1)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	hl
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00241$
	bit	7, d
	jr	NZ, 00242$
	cp	a, a
	jr	00242$
00241$:
	bit	7, d
	jr	Z, 00242$
	scf
00242$:
	jr	NC, 00120$
;bank6.c:119: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00135$:
;bank6.c:121: Call_Set_Char_Tile(bank6, &char_npc_2, 2 + i, &sprite_clear);
	ld	de, #_sprite_clear
	ld	hl, #_i
	ld	b, (hl)
	inc	b
	inc	b
	push	de
	push	bc
	inc	sp
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:119: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00135$
	jr	00139$
00120$:
;bank6.c:124: else if(char_npc_2.pos_y > char_player.pos_y)
	ldhl	sp,	#1
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00139$
;bank6.c:126: for(i = 0; i < 2; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00137$:
;bank6.c:128: Call_Set_Char_Tile(bank6, &char_npc_2, 4 + i, &sprite_clear);
	ld	de, #_sprite_clear
	ld	hl, #_i
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
	inc	b
	push	de
	push	bc
	inc	sp
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Set_Char_Tile
	add	sp, #6
;bank6.c:126: for(i = 0; i < 2; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00137$
00139$:
;bank6.c:132: }
	add	sp, #6
	ret
;bank6.c:134: void Draw_Pointer()
;	---------------------------------
; Function Draw_Pointer
; ---------------------------------
_Draw_Pointer::
;bank6.c:136: if(pointer_tick == 25 && current_line < total_lines - 1)
	ld	hl, #_total_lines
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_current_line
	ld	c, (hl)
	ld	b, #0x00
	ld	l, e
	ld	h, d
	dec	hl
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00130$
	bit	7, d
	jr	NZ, 00131$
	cp	a, a
	jr	00131$
00130$:
	bit	7, d
	jr	Z, 00131$
	scf
00131$:
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, (#_pointer_tick)
	sub	a,#0x19
	jr	NZ, 00105$
	or	a,c
	jr	Z, 00105$
;bank6.c:138: set_win_tiles(18, 3, 1, 1, Message_Background);   
	ld	hl, #_Message_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0312
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00106$
00105$:
;bank6.c:140: else if(pointer_tick == 50 && current_line < total_lines - 1)
	ld	a, (#_pointer_tick)
	sub	a,#0x32
	jr	NZ, 00106$
	or	a,c
	jr	Z, 00106$
;bank6.c:142: set_win_tiles(18, 3, 1, 1, Message_Pointer);
	ld	hl, #_Message_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0312
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank6.c:144: pointer_tick = 0;
	ld	hl, #_pointer_tick
	ld	(hl), #0x00
00106$:
;bank6.c:147: pointer_tick += 1;
	ld	hl, #_pointer_tick
	inc	(hl)
;bank6.c:148: }
	ret
;bank6.c:150: void Draw_Message_Box()
;	---------------------------------
; Function Draw_Message_Box
; ---------------------------------
_Draw_Message_Box::
;bank6.c:152: Load_Message_Box();
	call	_Load_Message_Box
;bank6.c:154: for(i = 0; i < 7; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
;bank6.c:156: wait_vbl_done();
	call	_wait_vbl_done
;c:/gbdk/include/gb/gb.h:902: WX_REG+=x, WY_REG+=y;
	ldh	a, (_WY_REG+0)
	add	a, #0xf8
	ldh	(_WY_REG+0),a
;bank6.c:154: for(i = 0; i < 7; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jr	C, 00103$
;bank6.c:160: parallax_char_sprites();
;bank6.c:161: }
	jp  _parallax_char_sprites
;bank6.c:163: void Close_Message_Box()
;	---------------------------------
; Function Close_Message_Box
; ---------------------------------
_Close_Message_Box::
;bank6.c:165: for(i = 0; i < 5; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
;bank6.c:167: wait_vbl_done();
	call	_wait_vbl_done
;c:/gbdk/include/gb/gb.h:902: WX_REG+=x, WY_REG+=y;
	ldh	a, (_WY_REG+0)
	add	a, #0x08
	ldh	(_WY_REG+0),a
;bank6.c:165: for(i = 0; i < 5; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jr	C, 00103$
;bank6.c:171: }
	ret
;bank6.c:173: void scroll_message()
;	---------------------------------
; Function scroll_message
; ---------------------------------
_scroll_message::
;bank6.c:175: set_win_map(1, 1, 18, 1, Message_Format_2, Message_Format_2);
	ld	hl, #_Message_Format_2
	push	hl
	push	hl
	ld	de, #0x0112
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:176: set_win_map(1, 2, 18, 1, Message_Format_3, Message_Format_3);
	ld	bc, #_Message_Format_3+0
	push	bc
	push	bc
	ld	de, #0x0112
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:178: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank6.c:180: set_bkg_tileset(220, 18, Message_Blank);
	ld	hl, #_Message_Blank
	push	hl
	ld	de, #0x12dc
	push	de
	call	_set_bkg_tileset
	add	sp, #4
;bank6.c:182: set_win_map(1, 1, 18, 1, Message_Format_2, Message_Format_2);
	ld	hl, #_Message_Format_2
	push	hl
	push	hl
	ld	de, #0x0112
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:183: set_win_map(1, 2, 18, 1, Message_Format_1, Message_Format_1);
	ld	hl, #_Message_Format_1
	push	hl
	push	hl
	ld	de, #0x0112
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:185: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank6.c:187: set_bkg_tileset(238, 18, Message_Blank);
	ld	hl, #_Message_Blank
	push	hl
	ld	de, #0x12ee
	push	de
	call	_set_bkg_tileset
	add	sp, #4
;bank6.c:189: set_win_map(1, 1, 18, 1, Message_Format_1, Message_Format_1);
	ld	hl, #_Message_Format_1
	push	hl
	push	hl
	ld	de, #0x0112
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:190: set_win_map(1, 2, 18, 1, Message_Format_2, Message_Format_2);
	ld	hl, #_Message_Format_2
	push	hl
	push	hl
	ld	de, #0x0112
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:191: }
	ret
;bank6.c:193: void clear_message()
;	---------------------------------
; Function clear_message
; ---------------------------------
_clear_message::
;bank6.c:195: set_win_map(1, 1, 18, 1, Message_Format_3, Message_Format_3);
	ld	bc, #_Message_Format_3+0
	ld	l, c
	ld	h, b
	ld	e, c
	ld	d, b
	push	bc
	push	hl
	push	de
	ld	de, #0x0112
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_map
	add	sp, #8
	pop	bc
;bank6.c:196: set_win_map(1, 2, 18, 1, Message_Format_3, Message_Format_3);
	push	bc
	push	bc
	ld	de, #0x0112
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_map
	add	sp, #8
;bank6.c:197: }
	ret
;bank6.c:199: void clear_messagebox()
;	---------------------------------
; Function clear_messagebox
; ---------------------------------
_clear_messagebox::
;bank6.c:201: for(i = 0; i < 5; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
;bank6.c:203: wait_vbl_done();
	call	_wait_vbl_done
;c:/gbdk/include/gb/gb.h:902: WX_REG+=x, WY_REG+=y;
	ldh	a, (_WY_REG+0)
	add	a, #0x08
	ldh	(_WY_REG+0),a
;bank6.c:201: for(i = 0; i < 5; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jr	C, 00103$
;bank6.c:208: MessageBoxFlag = false;
	ld	hl, #_MessageBoxFlag
	ld	(hl), #0x00
;bank6.c:209: }
	ret
;bank6.c:211: void reset_char_sprites()
;	---------------------------------
; Function reset_char_sprites
; ---------------------------------
_reset_char_sprites::
;bank6.c:213: if(char_npc_1.active == true && char_npc_1.visible == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jp	NZ,00109$
	ld	bc, #_char_npc_1+0
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jp	NZ,00109$
;bank6.c:215: switch(char_npc_1.facing)
	ld	hl, #0x000c
	add	hl, bc
	ld	e, (hl)
;bank6.c:221: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
;bank6.c:215: switch(char_npc_1.facing)
	ld	a, #0x04
	sub	a, e
	jp	C, 00106$
	ld	d, #0x00
	ld	hl, #00157$
	add	hl, de
	add	hl, de
;bank6.c:217: case up:
	jp	(hl)
00157$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
	jr	00105$
00101$:
;bank6.c:218: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_up->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x000f)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:219: break;
	jr	00109$
;bank6.c:220: case down:
00102$:
;bank6.c:221: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:222: break;
	jr	00109$
;bank6.c:223: case left:
00103$:
;bank6.c:224: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_left->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x0013)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:225: break;
	jr	00109$
;bank6.c:226: case right:
00104$:
;bank6.c:227: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_right->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x0015)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:228: break;
	jr	00109$
;bank6.c:229: case idle:
00105$:
;bank6.c:230: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:231: break;
	jr	00109$
;bank6.c:232: default:
00106$:
;bank6.c:233: Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_1 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:235: }
00109$:
;bank6.c:237: if(char_npc_2.active == true && char_npc_2.visible == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	ret	NZ
	ld	bc, #_char_npc_2+0
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	ret	NZ
;bank6.c:239: switch(char_npc_2.facing)
	ld	hl, #0x000c
	add	hl, bc
	ld	e, (hl)
;bank6.c:245: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
;bank6.c:239: switch(char_npc_2.facing)
	ld	a, #0x04
	sub	a, e
	jr	C, 00116$
	ld	d, #0x00
	ld	hl, #00162$
	add	hl, de
	add	hl, de
;bank6.c:241: case up:
	jp	(hl)
00162$:
	jr	00111$
	jr	00112$
	jr	00113$
	jr	00114$
	jr	00115$
00111$:
;bank6.c:242: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_up->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x000f)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:243: break;
	ret
;bank6.c:244: case down:
00112$:
;bank6.c:245: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:246: break;
	ret
;bank6.c:247: case left:
00113$:
;bank6.c:248: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_left->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x0013)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:249: break;
	ret
;bank6.c:250: case right:
00114$:
;bank6.c:251: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_right->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x0015)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:252: break;
	ret
;bank6.c:253: case idle:
00115$:
;bank6.c:254: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:255: break;
	ret
;bank6.c:256: default:
00116$:
;bank6.c:257: Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
	ld	hl, #(_char_npc_2 + 0x0011)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank6.c:259: }
;bank6.c:261: }
	ret
	.area _CODE_6
	.area _CABS (ABS)
