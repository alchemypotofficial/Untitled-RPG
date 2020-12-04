;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank10
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Message_Bank10
	.globl _Get_Font_Value
	.globl _Call_Reset_Char_Sprites
	.globl _Call_Draw_Pointer
	.globl _Call_Scroll_Message
	.globl _Call_Close_Message_Box
	.globl _Call_Draw_Message_Box
	.globl _set_bkg_tileset
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _joypad
	.globl _Message_TestTextPLN1
	.globl _Message_TestTextPLN0
	.globl _Message_Health_BrewPLN0
	.globl _Message_SampleTextPLN1
	.globl _Message_SampleTextPLN0
	.globl _Message_Plum_HeadstonePLN1
	.globl _Message_Plum_HeadstonePLN0
	.globl _Message_Hiro_House_ShelfPLN0
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
	.area _CODE_10
;bank10.c:49: void Load_Message_Bank10(GameMessage* message)
;	---------------------------------
; Function Load_Message_Bank10
; ---------------------------------
_Load_Message_Bank10::
	add	sp, #-6
;bank10.c:51: Call_Draw_Message_Box(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Draw_Message_Box
	inc	sp
;bank10.c:53: current_line = 0;
	ld	hl, #_current_line
	ld	(hl), #0x00
;bank10.c:55: while(current_line < message->length)
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
00115$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, (#_current_line)
	sub	a, c
	jp	NC, 00117$
;bank10.c:57: u_x = 220;
	ld	hl, #_u_x
	ld	(hl), #0xdc
;bank10.c:59: for(current_row = 0; current_row < 2; current_row += 1)
	ld	hl, #_current_row
	ld	(hl), #0x00
;c
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00125$:
;bank10.c:61: for(h = 0; h < 18; h++)
	ld	hl, #_h
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00123$:
;bank10.c:63: if(joypad() & J_A)
	call	_joypad
	bit	4, e
	jr	Z, 00102$
;bank10.c:65: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00103$
00102$:
;bank10.c:69: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00103$:
;bank10.c:72: f = h * 16;
	ld	a, (#_h)
	ld	(#_f),a
	ld	a, (#_h + 1)
	ld	(#_f + 1),a
	ld	a, #0x04
00205$:
	ld	hl, #_f
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00205$
;bank10.c:74: e = 18 * current_line;
	ld	hl, #_current_line
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, l
	ld	(_e), a
	ld	a, h
	ld	(_e + 1), a
;bank10.c:75: e = e + h;
	ld	a, (#_e)
	ld	hl, #_h
	add	a, (hl)
	ld	hl, #_e
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_h + 1
	adc	a, (hl)
	ld	(#_e + 1),a
;bank10.c:77: g = message->message[e] - 180;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_e
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0x4c
	ld	hl, #_g
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
;bank10.c:79: g = g * 16;
	ld	(hl-), a
	ld	a, (hl)
	ld	(hl+), a
	ld	a, #0x04
00206$:
	ld	hl, #_g
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00206$
;bank10.c:81: for(i = 0; i < 16; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00121$:
;bank10.c:83: message_base[i] = Get_Font_Value(bank10);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_message_base
	add	hl, bc
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Get_Font_Value
	inc	sp
	ld	a, e
	pop	bc
	ld	(bc), a
;bank10.c:81: for(i = 0; i < 16; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x90
	jr	C, 00121$
;bank10.c:86: set_bkg_tileset(u_x, 1, message_base);
	ld	hl, #_message_base
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_set_bkg_tileset
	add	sp, #4
;bank10.c:88: u_x += 1;
	ld	hl, #_u_x
	inc	(hl)
;bank10.c:61: for(h = 0; h < 18; h++)
	ld	hl, #_h
	inc	(hl)
	jr	NZ, 00207$
	inc	hl
	inc	(hl)
00207$:
	ld	hl, #_h
	ld	a, (hl)
	sub	a, #0x12
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jp	C, 00123$
;bank10.c:91: current_line += 1;
	ld	hl, #_current_line
	inc	(hl)
;bank10.c:59: for(current_row = 0; current_row < 2; current_row += 1)
	ld	hl, #_current_row
	ld	a, (hl)
	inc	a
	ld	(hl), a
	sub	a, #0x02
	jp	C, 00125$
;bank10.c:94: set_win_tiles(18, 3, 1, 1, Message_Pointer);
	ld	hl, #_Message_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0312
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank10.c:96: while(joypad() & J_A)
00107$:
	call	_joypad
	bit	4, e
	jr	Z, 00113$
;bank10.c:98: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank10.c:100: Call_Draw_Pointer(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Draw_Pointer
	inc	sp
	jr	00107$
;bank10.c:103: while(1)
00113$:
;bank10.c:105: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank10.c:107: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank10.c:109: Call_Draw_Pointer(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Draw_Pointer
	inc	sp
;bank10.c:111: if(Joy & J_A)
	ld	a, (#_Joy)
	bit	4, a
	jr	Z, 00113$
;bank10.c:113: set_win_tiles(18, 3, 1, 1, Message_Background);
	ld	hl, #_Message_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0312
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank10.c:115: pointer_tick = 0;
	ld	hl, #_pointer_tick
	ld	(hl), #0x00
;bank10.c:117: Call_Scroll_Message(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Scroll_Message
	inc	sp
;bank10.c:119: break;
	jp	00115$
00117$:
;bank10.c:124: performant_delay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank10.c:126: Call_Reset_Char_Sprites(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Reset_Char_Sprites
	inc	sp
;bank10.c:128: Call_Close_Message_Box(bank10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Call_Close_Message_Box
	inc	sp
;bank10.c:130: while(joypad() & J_A)
00118$:
	call	_joypad
	bit	4, e
	jr	Z, 00127$
;bank10.c:132: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00118$
00127$:
;bank10.c:134: }
	add	sp, #6
	ret
_Message_Hiro_House_ShelfPLN0:
	.db #0xeb	; 235
	.db #0xd3	; 211
	.db #0xcc	; 204
	.db #0xcd	; 205
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xc5	; 197
	.db #0xbf	; 191
	.db #0xcc	; 204
	.db #0xc2	; 194
	.db #0xcd	; 205
	.db #0xcc	; 204
	.db #0xbf	; 191
	.db #0xcf	; 207
	.db #0xc5	; 197
	.db #0xc5	; 197
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xc8	; 200
	.db #0xbf	; 191
	.db #0xcc	; 204
	.db #0xc2	; 194
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xcb	; 203
	.db #0xbe	; 190
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0xbe	; 190
	.db #0xc7	; 199
	.db #0xce	; 206
	.db #0xcd	; 205
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xea	; 234
	.db #0xc2	; 194
	.db #0xc5	; 197
	.db #0xd3	; 211
	.db #0xcc	; 204
	.db #0xba	; 186
	.db #0xc7	; 199
	.db #0xbd	; 189
	.db #0xcc	; 204
	.db #0xe7	; 231
	.db #0xcc	; 204
	.db #0xcf	; 207
	.db #0xcd	; 205
	.db #0xbe	; 190
	.db #0xbd	; 189
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xce	; 206
	.db #0xc8	; 200
	.db #0xcc	; 204
	.db #0xc0	; 192
	.db #0xba	; 186
	.db #0xce	; 206
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xcb	; 203
	.db #0xcc	; 204
	.db #0xce	; 206
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xc6	; 198
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xbb	; 187
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xc8	; 200
	.db #0xcb	; 203
	.db #0xbe	; 190
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xe7	; 231
	.db #0xcc	; 204
	.db #0xcd	; 205
	.db #0xc1	; 193
	.db #0xc8	; 200
	.db #0xcf	; 207
	.db #0xc5	; 197
	.db #0xbd	; 189
	.db #0xcc	; 204
	.db #0xc9	; 201
	.db #0xc2	; 194
	.db #0xbc	; 188
	.db #0xc4	; 196
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcd	; 205
	.db #0xc8	; 200
	.db #0xc6	; 198
	.db #0xbe	; 190
	.db #0xcc	; 204
	.db #0xc6	; 198
	.db #0xc8	; 200
	.db #0xcb	; 203
	.db #0xbe	; 190
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_Message_Plum_HeadstonePLN0:
	.db #0xf5	; 245
	.db #0xbe	; 190
	.db #0xcc	; 204
	.db #0xc6	; 198
	.db #0xc2	; 194
	.db #0xcd	; 205
	.db #0xcd	; 205
	.db #0xcc	; 204
	.db #0xd3	; 211
	.db #0xc8	; 200
	.db #0xcf	; 207
	.db #0xcc	; 204
	.db #0xeb	; 235
	.db #0xc8	; 200
	.db #0xc6	; 198
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xba	; 186
	.db #0xc7	; 199
	.db #0xbd	; 189
	.db #0xcc	; 204
	.db #0xe2	; 226
	.db #0xba	; 186
	.db #0xbd	; 189
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_Message_Plum_HeadstonePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Message_SampleTextPLN0:
	.db #0xe6	; 230
	.db #0xbe	; 190
	.db #0xc5	; 197
	.db #0xc5	; 197
	.db #0xc8	; 200
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0xc2	; 194
	.db #0xcb	; 203
	.db #0xc8	; 200
	.db #0xfe	; 254
	.db #0xcc	; 204
	.db #0xf2	; 242
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xcd	; 205
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xc2	; 194
	.db #0xcd	; 205
	.db #0xcc	; 204
	.db #0xce	; 206
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xcc	; 204
	.db #0xbd	; 189
	.db #0xbe	; 190
	.db #0xd0	; 208
	.db #0xbe	; 190
	.db #0xc5	; 197
	.db #0xc8	; 200
	.db #0xc9	; 201
	.db #0xbe	; 190
	.db #0xcb	; 203
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xe7	; 231
	.db #0xcc	; 204
	.db #0xc1	; 193
	.db #0xc8	; 200
	.db #0xc9	; 201
	.db #0xbe	; 190
	.db #0xcc	; 204
	.db #0xd3	; 211
	.db #0xc8	; 200
	.db #0xcf	; 207
	.db #0xfa	; 250
	.db #0xcb	; 203
	.db #0xbe	; 190
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xbe	; 190
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc8	; 200
	.db #0xd3	; 211
	.db #0xc2	; 194
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xcc	; 204
	.db #0xc2	; 194
	.db #0xce	; 206
	.db #0xfe	; 254
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_Message_SampleTextPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Message_Health_BrewPLN0:
	.db #0xf7	; 247
	.db #0xc8	; 200
	.db #0xcf	; 207
	.db #0xcc	; 204
	.db #0xc8	; 200
	.db #0xbb	; 187
	.db #0xce	; 206
	.db #0xba	; 186
	.db #0xc2	; 194
	.db #0xc7	; 199
	.db #0xcc	; 204
	.db #0xdf	; 223
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0xbe	; 190
	.db #0xba	; 186
	.db #0xc5	; 197
	.db #0xce	; 206
	.db #0xc1	; 193
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0xbe	; 190
	.db #0xcb	; 203
	.db #0xbb	; 187
	.db #0xfe	; 254
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_Message_TestTextPLN0:
	.db #0xe6	; 230
	.db #0xe3	; 227
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xed	; 237
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0xf0	; 240
	.db #0xed	; 237
	.db #0xcc	; 204
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0xf1	; 241
	.db #0xcc	; 204
	.db #0xe7	; 231
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xe3	; 227
	.db #0xcc	; 204
	.db #0xe2	; 226
	.db #0xe3	; 227
	.db #0xf4	; 244
	.db #0xe3	; 227
	.db #0xea	; 234
	.db #0xed	; 237
	.db #0xee	; 238
	.db #0xe3	; 227
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_Message_TestTextPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CODE_10
	.area _CABS (ABS)
