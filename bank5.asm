;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank5
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Reset_NPC
	.globl _Add_NPC
	.globl _Call_Set_Sprite_Packages
	.globl _Call_Build_Char
	.globl _Call_Load_Char_Sprite
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
	.area _CODE_5
;bank5.c:16: void Add_NPC(GameCharacter* character, GameNPC* npc)
;	---------------------------------
; Function Add_NPC
; ---------------------------------
_Add_NPC::
	add	sp, #-10
;bank5.c:18: character->pos_x = npc->pos_x;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank5.c:19: character->pos_y = npc->pos_y;
;c
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;bank5.c:20: character->npc_type = npc->npc_type;
	pop	hl
	push	hl
	inc	hl
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank5.c:21: character->action_id = npc->action_id;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
;bank5.c:23: character->active = true;
	pop	hl
	push	hl
	ld	(hl), #0x01
;bank5.c:24: character->visible = true;
;c
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	ld	(hl), #0x01
;bank5.c:26: Call_Set_Sprite_Packages(bank5, character, npc->sprites_up, npc->sprites_down, npc->sprites_left, npc->sprites_right);
	ld	hl, #0x000b
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
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
	ld	hl, #0x0007
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
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Set_Sprite_Packages
	add	sp, #11
;bank5.c:27: Call_Load_Char_Sprite(bank5, character, npc->sprites_down->sprites[0]);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank5.c:28: }
	add	sp, #10
	ret
;bank5.c:30: void Reset_NPC()
;	---------------------------------
; Function Reset_NPC
; ---------------------------------
_Reset_NPC::
;bank5.c:32: Call_Load_Char_Sprite(bank5, &char_npc_1, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank5.c:33: Call_Build_Char(bank5, &char_npc_1);
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Build_Char
	add	sp, #3
;bank5.c:34: char_npc_1.active = false;
	ld	hl, #_char_npc_1
	ld	(hl), #0x00
;bank5.c:36: Call_Load_Char_Sprite(bank5, &char_npc_2, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank5.c:37: Call_Build_Char(bank5, &char_npc_2);
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Build_Char
	add	sp, #3
;bank5.c:38: char_npc_2.active = false;
	ld	hl, #_char_npc_2
	ld	(hl), #0x00
;bank5.c:40: Call_Load_Char_Sprite(bank5, &char_npc_3, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank5.c:41: Call_Build_Char(bank5, &char_npc_3);
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_Call_Build_Char
	add	sp, #3
;bank5.c:42: char_npc_3.active = false;
	ld	hl, #_char_npc_3
	ld	(hl), #0x00
;bank5.c:43: }
	ret
	.area _CODE_5
	.area _CABS (ABS)
