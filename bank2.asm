;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank2
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_NPC
	.globl _Update_Anim_Walk
	.globl _test_update_npc
	.globl _Update_Joypad
	.globl _walk_char
	.globl _walk_player
	.globl _walk_counter
	.globl _Check_Event_Trigger
	.globl _Check_Event_Tele
	.globl _Check_Event_Sign
	.globl _Check_Event_Chest
	.globl _Check_Event_Shopkeeper
	.globl _Check_NPC_Trigger
	.globl _Check_NPC_Shopkeeper
	.globl _Check_NPC_Messenger
	.globl _open_chest
	.globl _teleport_player
	.globl _open_shop
	.globl _read_message
	.globl _build_char
	.globl _check_walk_counter
	.globl _check_char_collision
	.globl _Get_Shop
	.globl _Get_Message
	.globl _Get_Sign
	.globl _Get_Tele
	.globl _Get_Map
	.globl _Menu
	.globl _Call_Check_Tile_Collision
	.globl _Call_Shop
	.globl _Call_Scene_Handler
	.globl _Call_Add_Item
	.globl _Call_Load_Char_Sprite
	.globl _Call_Draw_Message
	.globl _Call_Draw_Map_Line
	.globl _Call_Draw_Map
	.globl _Call_Check_Step_Counter
	.globl _Call_Load_Combat_Main
	.globl _fade_in
	.globl _fade_out
	.globl _performant_delay
	.globl _rand
	.globl _joypad
	.globl _test_sign
	.globl _chest_opened
	.globl _move_screen
	.globl _move_char
	.globl _hide_char
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
	.area _CODE_2
;bank2.c:86: UBYTE check_char_collision(GameCharacter* character, INT8 move_x, INT8 move_y)
;	---------------------------------
; Function check_char_collision
; ---------------------------------
_check_char_collision::
	add	sp, #-7
;bank2.c:88: if(char_npc_1.active == true && char_npc_1.visible == true && character->pos_x + move_x == char_npc_1.pos_x && character->pos_y + move_y == char_npc_1.pos_y)
	ld	a, (#_char_npc_1 + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00108$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00108$
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
;c
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_char_npc_1 + 6
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	sub	a, e
	jr	NZ, 00108$
	ld	a, h
	sub	a, d
	jr	NZ, 00108$
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
;c
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_char_npc_1 + 7
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	sub	a, e
	jr	NZ, 00108$
	ld	a, h
	sub	a, d
	jr	NZ, 00108$
;bank2.c:90: return true;
	ld	e, #0x01
	jr	00113$
00108$:
;bank2.c:92: else if(char_npc_2.active == true && char_npc_2.visible == true && character->pos_x + move_x == char_npc_2.pos_x && character->pos_y + move_y == char_npc_2.pos_y)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00102$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00102$
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
;c
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_char_npc_2 + 6
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	sub	a, e
	jr	NZ, 00102$
	ld	a, h
	sub	a, d
	jr	NZ, 00102$
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#(_char_npc_2 + 0x0007) + 0)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	jr	NZ, 00102$
	ld	a, b
	sub	a, d
;bank2.c:94: return true;
;bank2.c:98: return false;
	ld	e, #0x01
	jr	Z, 00113$
00102$:
	ld	e, #0x00
00113$:
;bank2.c:100: }
	add	sp, #7
	ret
_chest_opened:
	.db #0xc4	; 196
	.db #0xc5	; 197
	.db #0xc7	; 199
	.db #0xc9	; 201
_test_sign:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
;bank2.c:102: UBYTE check_walk_counter()
;	---------------------------------
; Function check_walk_counter
; ---------------------------------
_check_walk_counter::
;bank2.c:104: if(char_player.walk_count[0] == 0 && char_player.walk_count[1] == 0 && char_player.walk_count[2] == 0 && char_player.walk_count[3] == 0)
	ld	a, (#(_char_player + 0x0008) + 0)
	or	a, a
	jr	NZ, 00102$
	ld	a, (#(_char_player + 0x0009) + 0)
	or	a, a
	jr	NZ, 00102$
	ld	a, (#(_char_player + 0x000a) + 0)
	or	a, a
	jr	NZ, 00102$
	ld	a, (#(_char_player + 0x000b) + 0)
;bank2.c:106: return 0;
	or	a,a
	jr	NZ, 00102$
	ld	e,a
	ret
00102$:
;bank2.c:110: return 1;
	ld	e, #0x01
;bank2.c:112: }
	ret
;bank2.c:114: void build_char(GameCharacter* character)
;	---------------------------------
; Function build_char
; ---------------------------------
_build_char::
	add	sp, #-3
;bank2.c:116: set_sprite_tile(character->sprite_id[0], character->sprite_index);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0003
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;bank2.c:117: set_sprite_tile(character->sprite_id[0] + 1, character->sprite_index + 2);
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x02
	ld	e, a
	ld	a, (bc)
	ld	d, a
	inc	d
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), e
;bank2.c:118: set_sprite_tile(character->sprite_id[0] + 2, character->sprite_index + 1);
	pop	de
	push	de
	ld	a, (de)
	ld	e, a
	inc	e
	ld	a, (bc)
	add	a, #0x02
	ld	d, a
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), e
;bank2.c:119: set_sprite_tile(character->sprite_id[0] + 3, character->sprite_index + 3);
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x03
	ld	e, a
	ld	a, (bc)
	add	a, #0x03
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;bank2.c:119: set_sprite_tile(character->sprite_id[0] + 3, character->sprite_index + 3);
;bank2.c:120: }
	add	sp, #3
	ret
;bank2.c:122: void move_screen(INT16 move_x, INT16 move_y)
;	---------------------------------
; Function move_screen
; ---------------------------------
_move_screen::
;bank2.c:124: while(move_x != 0)
00101$:
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
;bank2.c:126: scroll_bkg(move_x < 0 ? -1 : 1, 0);
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00159$
	bit	7, d
	jr	NZ, 00160$
	cp	a, a
	jr	00160$
00159$:
	bit	7, d
	jr	Z, 00160$
	scf
00160$:
	jr	NC, 00111$
	ld	bc, #0xffff
	jr	00112$
00111$:
	ld	bc, #0x0001
00112$:
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, c
	ldh	(_SCX_REG+0),a
;bank2.c:127: move_x += move_x < 0 ? 1 : -1;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00161$
	bit	7, d
	jr	NZ, 00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z, 00162$
	scf
00162$:
	jr	NC, 00113$
	ld	bc, #0x0001
	jr	00114$
00113$:
	ld	bc, #0xffff
00114$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;bank2.c:128: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00101$
;bank2.c:130: while(move_y != 0)
00104$:
	ldhl	sp,	#5
	ld	a, (hl-)
	or	a, (hl)
	ret	Z
;bank2.c:132: scroll_bkg(0, move_y < 0 ? 1 : -1);
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	NC, 00115$
	ld	bc, #0x0001
	jr	00116$
00115$:
	ld	bc, #0xffff
00116$:
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG+0)
	add	a, c
	ldh	(_SCY_REG+0),a
;bank2.c:133: move_y += move_y < 0 ? 1 : -1;
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00165$
	bit	7, d
	jr	NZ, 00166$
	cp	a, a
	jr	00166$
00165$:
	bit	7, d
	jr	Z, 00166$
	scf
00166$:
	jr	NC, 00117$
	ld	bc, #0x0001
	jr	00118$
00117$:
	ld	bc, #0xffff
00118$:
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;bank2.c:134: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank2.c:136: }
	jr	00104$
;bank2.c:138: void move_char(GameCharacter* character, UBYTE tile_x, UBYTE tile_y, UBYTE pixel_offset)
;	---------------------------------
; Function move_char
; ---------------------------------
_move_char::
	add	sp, #-7
;bank2.c:140: tile_x = tile_x * 8;
	ldhl	sp,	#11
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank2.c:141: tile_y = tile_y * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
;bank2.c:143: move_sprite(character->sprite_id[0], tile_x - pixel_offset, tile_y + 8);
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	inc	hl
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank2.c:144: move_sprite(character->sprite_id[0] + 1, tile_x + 8 - pixel_offset, tile_y + 8);
	ldhl	sp,	#11
	ld	a, (hl)
	add	a, #0x08
	inc	hl
	inc	hl
	ld	e, (hl)
	sub	a, e
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;bank2.c:145: move_sprite(character->sprite_id[0] + 2, tile_x - pixel_offset, tile_y + 16);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x10
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
;bank2.c:146: move_sprite(character->sprite_id[0] + 3, tile_x + 8 - pixel_offset, tile_y + 16);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	dec	hl
	ld	a, (hl)
	ld	(bc), a
;bank2.c:146: move_sprite(character->sprite_id[0] + 3, tile_x + 8 - pixel_offset, tile_y + 16);
;bank2.c:147: }
	add	sp, #7
	ret
;bank2.c:149: void read_message(GameMessage* message) //* Displays specified message.
;	---------------------------------
; Function read_message
; ---------------------------------
_read_message::
;bank2.c:151: Call_Draw_Message(bank2, message);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Message
	add	sp, #3
;bank2.c:152: }
	ret
;bank2.c:154: void open_shop(GameShop* shop)
;	---------------------------------
; Function open_shop
; ---------------------------------
_open_shop::
;bank2.c:156: CurrentShop = shop->shop_id;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	a, (de)
	ld	(#_CurrentShop),a
;bank2.c:158: Call_Shop(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Shop
	inc	sp
;bank2.c:159: }
	ret
;bank2.c:161: void teleport_player(GameTele* event_tele) //* Teleports player to specified teleport.
;	---------------------------------
; Function teleport_player
; ---------------------------------
_teleport_player::
	add	sp, #-2
;bank2.c:163: if(event_tele != &tele_null)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #<(_tele_null)
	jr	NZ, 00160$
	inc	hl
	ld	a, (hl)
	sub	a, #>(_tele_null)
	jp	Z,00120$
00160$:
;bank2.c:165: fade_out();
	call	_fade_out
;c:/gbdk/include/gb/gb.h:756: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;bank2.c:169: camera_x = 0;
	ld	hl, #_camera_x
	ld	(hl), #0x00
;bank2.c:170: camera_y = 0;
	ld	hl, #_camera_y
	ld	(hl), #0x00
;bank2.c:171: char_player.walk_count[0] = 0;
	ld	hl, #(_char_player + 0x0008)
	ld	(hl), #0x00
;bank2.c:172: char_player.walk_count[1] = 0;
	ld	hl, #(_char_player + 0x0009)
	ld	(hl), #0x00
;bank2.c:173: char_player.walk_count[2] = 0;
	ld	hl, #(_char_player + 0x000a)
	ld	(hl), #0x00
;bank2.c:174: char_player.walk_count[3] = 0;
	ld	hl, #(_char_player + 0x000b)
	ld	(hl), #0x00
;bank2.c:176: char_player.pos_x = event_tele->pos_x;
	ld	de, #_char_player + 6
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank2.c:177: char_player.pos_y = event_tele->pos_y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(#(_char_player + 0x0007)),a
;bank2.c:179: Call_Draw_Map(bank2, Get_Map(event_tele->map_id));
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map
	add	sp, #3
	pop	bc
;bank2.c:181: if(event_tele->direction == up){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_up_0);}
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	or	a, a
	jr	NZ, 00104$
	push	bc
	ld	hl, #_sprite_hiro_up_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	pop	bc
	jr	00105$
00104$:
;bank2.c:182: else if(event_tele->direction == down){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_down_0);}
	dec	a
	jr	NZ, 00105$
	push	bc
	ld	hl, #_sprite_hiro_down_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	pop	bc
00105$:
;bank2.c:184: fade_in();
	push	bc
	call	_fade_in
	pop	bc
;bank2.c:186: if(event_tele->direction == up)
	ld	a, (bc)
	ld	e, a
;bank2.c:188: if(char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 5)
	ld	hl, #_map_size_y
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xfb
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;bank2.c:186: if(event_tele->direction == up)
	ld	a, e
	or	a, a
	jr	NZ, 00117$
;bank2.c:188: if(char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 5)
	ld	hl, #(_char_player + 0x0007)
	ld	l, (hl)
	ld	a, #0x05
	sub	a, l
	jr	NC, 00106$
	ld	h, #0x00
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	NC, 00107$
00106$:
;bank2.c:190: camera_focus = 0;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:191: char_player.pos_y -= 1;
	ld	a, (#(_char_player + 0x0007) + 0)
	dec	a
	ld	(#(_char_player + 0x0007)),a
;bank2.c:192: char_player.walk_count[0] = 16;
	ld	hl, #(_char_player + 0x0008)
	ld	(hl), #0x10
	jp	00123$
00107$:
;bank2.c:196: camera_focus = 1;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:197: Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), up);
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:198: char_player.pos_y -= 1;
	ld	a, (#(_char_player + 0x0007) + 0)
	dec	a
	ld	(#(_char_player + 0x0007)),a
;bank2.c:199: char_player.walk_count[0] = 16;
	ld	hl, #(_char_player + 0x0008)
	ld	(hl), #0x10
	jr	00123$
00117$:
;bank2.c:202: else if(event_tele->direction == down)
	dec	e
	jr	NZ, 00123$
;bank2.c:188: if(char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 5)
	ld	a, (#(_char_player + 0x0007) + 0)
;bank2.c:204: if(char_player.pos_y < 5 || char_player.pos_y >= map_size_y - 5)
	cp	a, #0x05
	jr	C, 00110$
	ld	l, a
	ld	h, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00167$
	bit	7, d
	jr	NZ, 00168$
	cp	a, a
	jr	00168$
00167$:
	bit	7, d
	jr	Z, 00168$
	scf
00168$:
	jr	C, 00111$
00110$:
;bank2.c:206: camera_focus = 0;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:207: char_player.pos_y += 1;
	ld	a, (#(_char_player + 0x0007) + 0)
	inc	a
	ld	(#(_char_player + 0x0007)),a
;bank2.c:208: char_player.walk_count[1] = 16;
	ld	hl, #(_char_player + 0x0009)
	ld	(hl), #0x10
	jr	00123$
00111$:
;bank2.c:212: camera_focus = 1;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:213: Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), down);
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:214: char_player.pos_y += 1;
	ld	a, (#(_char_player + 0x0007) + 0)
	inc	a
	ld	(#(_char_player + 0x0007)),a
;bank2.c:215: char_player.walk_count[1] = 16;
	ld	hl, #(_char_player + 0x0009)
	ld	(hl), #0x10
;bank2.c:221: return;
00120$:
00123$:
;bank2.c:223: }
	add	sp, #2
	ret
;bank2.c:225: void open_chest(UBYTE chest_id)
;	---------------------------------
; Function open_chest
; ---------------------------------
_open_chest::
;bank2.c:227: switch(chest_id)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	jr	00103$
;bank2.c:229: case 0: //* Chest 0
00101$:
;bank2.c:230: Call_Add_Item(bank2, &item_healing_brew, 2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	hl, #_item_healing_brew
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Add_Item
	add	sp, #4
;bank2.c:231: Call_Add_Item(bank2, &item_mana_brew, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_item_mana_brew
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Add_Item
	add	sp, #4
;bank2.c:232: break;
	ret
;bank2.c:233: case  1: //* Chest 1
00102$:
;bank2.c:234: Call_Add_Item(bank2, &item_life_leaf, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_item_life_leaf
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Add_Item
	add	sp, #4
;bank2.c:235: break;
	ret
;bank2.c:236: default: //* Chest 0 - Default
00103$:
;bank2.c:237: Call_Add_Item(bank2, &item_healing_brew, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_item_healing_brew
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Add_Item
	add	sp, #4
;bank2.c:239: }
;bank2.c:240: }
	ret
;bank2.c:242: void Check_NPC_Messenger(void)
;	---------------------------------
; Function Check_NPC_Messenger
; ---------------------------------
_Check_NPC_Messenger::
;bank2.c:244: if(char_player.facing == up)
	ld	hl, #_char_player + 12
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	NZ, 00178$
;bank2.c:246: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00113$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00113$
;bank2.c:248: char_npc_1.facing = down;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x01
;bank2.c:249: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
	ld	hl, #_char_npc_1 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:251: read_message(Get_Message(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:252: return;
	ret
00113$:
;bank2.c:254: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00107$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00107$
;bank2.c:256: char_npc_2.facing = down;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x01
;bank2.c:257: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
	ld	hl, #_char_npc_2 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:259: read_message(Get_Message(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:260: return;
	ret
00107$:
;bank2.c:262: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	or	a, a
	ret	NZ
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:264: char_npc_3.facing = down;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x01
;bank2.c:265: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_down->sprites[0]);
	ld	hl, #_char_npc_3 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:267: read_message(Get_Message(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:268: return;
	ret
00178$:
;bank2.c:271: else if(char_player.facing == down)
	ld	a, c
	dec	a
	jp	NZ,00175$
;bank2.c:273: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00130$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00130$
;bank2.c:275: char_npc_1.facing = up;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x00
;bank2.c:276: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_up->sprites[0]);
	ld	hl, #_char_npc_1 + 15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:278: read_message(Get_Message(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:279: return;
	ret
00130$:
;bank2.c:281: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00124$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00124$
;bank2.c:283: char_npc_2.facing = up;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x00
;bank2.c:284: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_up->sprites[0]);
	ld	hl, #_char_npc_2 + 15
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:286: read_message(Get_Message(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:287: return;
	ret
00124$:
;bank2.c:289: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	or	a, a
	ret	NZ
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:291: char_npc_3.facing = up;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x00
;bank2.c:292: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_up->sprites[0]);
	ld	hl, #_char_npc_3 + 15
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:294: read_message(Get_Message(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:295: return;
	ret
00175$:
;bank2.c:298: else if(char_player.facing == left)
	ld	a, c
	sub	a, #0x02
	jp	NZ,00172$
;bank2.c:300: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == messenger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00147$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00147$
;bank2.c:302: char_npc_1.facing = right;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x03
;bank2.c:303: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_right->sprites[0]);
	ld	hl, #_char_npc_1 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:305: read_message(Get_Message(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:306: return;
	ret
00147$:
;bank2.c:308: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == messenger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00141$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00141$
;bank2.c:310: char_npc_2.facing = right;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x03
;bank2.c:311: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_right->sprites[0]);
	ld	hl, #_char_npc_2 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:313: read_message(Get_Message(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:314: return;
	ret
00141$:
;bank2.c:316: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == messenger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	or	a, a
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:318: char_npc_3.facing = right;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x03
;bank2.c:319: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_right->sprites[0]);
	ld	hl, #_char_npc_3 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:321: read_message(Get_Message(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:322: return;
	ret
00172$:
;bank2.c:325: else if(char_player.facing == right)
	ld	a, c
	sub	a, #0x03
	ret	NZ
;bank2.c:327: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00164$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00164$
;bank2.c:329: char_npc_1.facing = left;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x02
;bank2.c:330: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_left->sprites[0]);
	ld	hl, #_char_npc_1 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:332: read_message(Get_Message(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:333: return;
	ret
00164$:
;bank2.c:335: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	or	a, a
	jr	NZ, 00158$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00158$
;bank2.c:337: char_npc_2.facing = left;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x02
;bank2.c:338: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_left->sprites[0]);
	ld	hl, #_char_npc_2 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:340: read_message(Get_Message(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:341: return;
	ret
00158$:
;bank2.c:343: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	or	a, a
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:345: char_npc_1.facing = left;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x02
;bank2.c:346: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_left->sprites[0]);
	ld	hl, #_char_npc_3 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:348: read_message(Get_Message(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:349: return;
;bank2.c:352: }
	ret
;bank2.c:354: void Check_NPC_Shopkeeper(void)
;	---------------------------------
; Function Check_NPC_Shopkeeper
; ---------------------------------
_Check_NPC_Shopkeeper::
;bank2.c:356: if(char_player.facing == up)
	ld	hl, #_char_player + 12
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	NZ, 00178$
;bank2.c:358: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00113$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00113$
;bank2.c:360: char_npc_1.facing = down;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x01
;bank2.c:361: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
	ld	hl, #_char_npc_1 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:363: open_shop(Get_Shop(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:364: return;
	ret
00113$:
;bank2.c:366: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00107$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00107$
;bank2.c:368: char_npc_2.facing = down;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x01
;bank2.c:369: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
	ld	hl, #_char_npc_2 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:371: open_shop(Get_Shop(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:372: return;
	ret
00107$:
;bank2.c:374: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x02
	ret	NZ
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:376: char_npc_3.facing = down;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x01
;bank2.c:377: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_down->sprites[0]);
	ld	hl, #_char_npc_3 + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:379: open_shop(Get_Shop(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:380: return;
	ret
00178$:
;bank2.c:383: else if(char_player.facing == down)
	ld	a, c
	dec	a
	jp	NZ,00175$
;bank2.c:385: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00130$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00130$
;bank2.c:387: char_npc_1.facing = up;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x00
;bank2.c:388: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_up->sprites[0]);
	ld	hl, #_char_npc_1 + 15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:390: open_shop(Get_Shop(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:391: return;
	ret
00130$:
;bank2.c:393: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00124$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00124$
;bank2.c:395: char_npc_2.facing = up;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x00
;bank2.c:396: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_up->sprites[0]);
	ld	hl, #_char_npc_2 + 15
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:398: open_shop(Get_Shop(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:399: return;
	ret
00124$:
;bank2.c:401: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x02
	ret	NZ
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:403: char_npc_3.facing = up;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x00
;bank2.c:404: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_up->sprites[0]);
	ld	hl, #_char_npc_3 + 15
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:406: open_shop(Get_Shop(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:407: return;
	ret
00175$:
;bank2.c:410: else if(char_player.facing == left)
	ld	a, c
	sub	a, #0x02
	jp	NZ,00172$
;bank2.c:412: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00147$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00147$
;bank2.c:414: char_npc_1.facing = right;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x03
;bank2.c:415: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_right->sprites[0]);
	ld	hl, #_char_npc_1 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:417: open_shop(Get_Shop(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:418: return;
	ret
00147$:
;bank2.c:420: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00141$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00141$
;bank2.c:422: char_npc_2.facing = right;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x03
;bank2.c:423: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_right->sprites[0]);
	ld	hl, #_char_npc_2 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:425: open_shop(Get_Shop(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:426: return;
	ret
00141$:
;bank2.c:428: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x02
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:430: char_npc_3.facing = right;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x03
;bank2.c:431: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_right->sprites[0]);
	ld	hl, #_char_npc_3 + 21
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:433: open_shop(Get_Shop(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:434: return;
	ret
00172$:
;bank2.c:437: else if(char_player.facing == right)
	ld	a, c
	sub	a, #0x03
	ret	NZ
;bank2.c:439: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00164$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00164$
;bank2.c:441: char_npc_1.facing = left;
	ld	hl, #(_char_npc_1 + 0x000c)
	ld	(hl), #0x02
;bank2.c:442: Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_left->sprites[0]);
	ld	hl, #_char_npc_1 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_1
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:444: open_shop(Get_Shop(char_npc_1.action_id));
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:445: return;
	ret
00164$:
;bank2.c:447: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x02
	jr	NZ, 00158$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00158$
;bank2.c:449: char_npc_2.facing = left;
	ld	hl, #(_char_npc_2 + 0x000c)
	ld	(hl), #0x02
;bank2.c:450: Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_left->sprites[0]);
	ld	hl, #_char_npc_2 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:452: open_shop(Get_Shop(char_npc_2.action_id));
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:453: return;
	ret
00158$:
;bank2.c:455: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x02
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:457: char_npc_3.facing = left;
	ld	hl, #(_char_npc_3 + 0x000c)
	ld	(hl), #0x02
;bank2.c:458: Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_left->sprites[0]);
	ld	hl, #_char_npc_3 + 19
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_npc_3
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:460: open_shop(Get_Shop(char_npc_3.action_id));
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	push	de
	call	_open_shop
	add	sp, #2
;bank2.c:461: return;
;bank2.c:464: }
	ret
;bank2.c:466: void Check_NPC_Trigger(void)
;	---------------------------------
; Function Check_NPC_Trigger
; ---------------------------------
_Check_NPC_Trigger::
;bank2.c:468: if(char_player.facing == up)
	ld	hl, #_char_player + 12
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	NZ, 00178$
;bank2.c:470: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00113$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00113$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00113$
;bank2.c:472: Call_Scene_Handler(bank2, char_npc_1.action_id);
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:473: return;
	ret
00113$:
;bank2.c:475: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00107$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00107$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00107$
;bank2.c:477: Call_Scene_Handler(bank2, char_npc_2.action_id);
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:478: return;
	ret
00107$:
;bank2.c:480: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 0, -1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x03
	ret	NZ
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:482: Call_Scene_Handler(bank2, char_npc_3.action_id);
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:483: return;
	ret
00178$:
;bank2.c:486: else if(char_player.facing == down)
	ld	a, c
	dec	a
	jp	NZ,00175$
;bank2.c:488: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00130$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00130$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00130$
;bank2.c:490: Call_Scene_Handler(bank2, char_npc_1.action_id);
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:491: return;
	ret
00130$:
;bank2.c:493: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00124$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00124$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00124$
;bank2.c:495: Call_Scene_Handler(bank2, char_npc_2.action_id);
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:496: return;
	ret
00124$:
;bank2.c:498: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 0, 1) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x03
	ret	NZ
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:500: Call_Scene_Handler(bank2, char_npc_3.action_id);
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:501: return;
	ret
00175$:
;bank2.c:504: else if(char_player.facing == left)
	ld	a, c
	sub	a, #0x02
	jp	NZ,00172$
;bank2.c:506: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == trigger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00147$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00147$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00147$
;bank2.c:508: Call_Scene_Handler(bank2, char_npc_1.action_id);
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:509: return;
	ret
00147$:
;bank2.c:511: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == trigger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00141$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00141$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00141$
;bank2.c:513: Call_Scene_Handler(bank2, char_npc_2.action_id);
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:514: return;
	ret
00141$:
;bank2.c:516: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == trigger && check_char_collision(&char_player, -1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x03
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:518: Call_Scene_Handler(bank2, char_npc_3.action_id);
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:519: return;
	ret
00172$:
;bank2.c:522: else if(char_player.facing == right)
	ld	a, c
	sub	a, #0x03
	ret	NZ
;bank2.c:524: if(char_npc_1.active == true && char_npc_1.visible == true && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x000d) + 0)
	dec	a
	jr	NZ, 00164$
	ld	a, (#(_char_npc_1 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00164$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00164$
;bank2.c:526: Call_Scene_Handler(bank2, char_npc_1.action_id);
	ld	a, (#(_char_npc_1 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:527: return;
	ret
00164$:
;bank2.c:529: else if(char_npc_2.active == true && char_npc_2.visible == true && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x000d) + 0)
	dec	a
	jr	NZ, 00158$
	ld	a, (#(_char_npc_2 + 0x0001) + 0)
	sub	a, #0x03
	jr	NZ, 00158$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	jr	NZ, 00158$
;bank2.c:531: Call_Scene_Handler(bank2, char_npc_2.action_id);
	ld	a, (#(_char_npc_2 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:532: return;
	ret
00158$:
;bank2.c:534: else if(char_npc_3.active == true && char_npc_3.visible == true && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 1, 0) == true)
	ld	a, (#_char_npc_3 + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x000d) + 0)
	dec	a
	ret	NZ
	ld	a, (#(_char_npc_3 + 0x0001) + 0)
	sub	a, #0x03
	ret	NZ
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	dec	e
	ret	NZ
;bank2.c:536: Call_Scene_Handler(bank2, char_npc_3.action_id);
	ld	a, (#(_char_npc_3 + 0x0002) + 0)
	ld	d,a
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
;bank2.c:537: return;
;bank2.c:540: }
	ret
;bank2.c:542: void Check_Event_Shopkeeper(void)
;	---------------------------------
; Function Check_Event_Shopkeeper
; ---------------------------------
_Check_Event_Shopkeeper::
;bank2.c:544: x = 0;
	ld	hl, #_x
	ld	(hl), #0x00
;bank2.c:545: y = 0;
	ld	hl, #_y
	ld	(hl), #0x00
;bank2.c:547: switch(char_player.facing)
	ld	a, (#(_char_player + 0x000c) + 0)
	or	a, a
	jr	Z, 00101$
	cp	a, #0x01
	jr	Z, 00102$
	cp	a, #0x02
	jr	Z, 00103$
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank2.c:549: case up:
00101$:
;bank2.c:550: y = -1;
	ld	hl, #_y
	ld	(hl), #0xff
;bank2.c:551: break;
	jr	00106$
;bank2.c:552: case down:
00102$:
;bank2.c:553: y = 1;
	ld	hl, #_y
	ld	(hl), #0x01
;bank2.c:554: break;
	jr	00106$
;bank2.c:555: case left:
00103$:
;bank2.c:556: x = -1;
	ld	hl, #_x
	ld	(hl), #0xff
;bank2.c:557: break;
	jr	00106$
;bank2.c:558: case right:
00104$:
;bank2.c:559: x = 1;
	ld	hl, #_x
	ld	(hl), #0x01
;bank2.c:560: break;
	jr	00106$
;bank2.c:561: default:
00105$:
;bank2.c:562: y = -1;
	ld	hl, #_y
	ld	(hl), #0xff
;bank2.c:564: }
00106$:
;bank2.c:566: for(i = 0; i < 5; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00111$:
;bank2.c:568: if(char_player.pos_x + x == Get_Map(CurrentMap)->event_shopkeeper[i]->pos_x && char_player.pos_y + y == Get_Map(CurrentMap)->event_shopkeeper[i]->pos_y)
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_x)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x003f
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00112$
	ld	a, d
	sub	a, b
	jr	NZ, 00112$
	ld	a, (#(_char_player + 0x0007) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_y)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x003f
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00112$
	ld	a, d
	sub	a, b
	jr	NZ, 00112$
;bank2.c:570: open_shop(Get_Map(CurrentMap)->event_shopkeeper[i]->shop);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x003f
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	call	_open_shop
	add	sp, #2
00112$:
;bank2.c:566: for(i = 0; i < 5; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jp	C, 00111$
;bank2.c:573: }
	ret
;bank2.c:575: void Check_Event_Chest(void)
;	---------------------------------
; Function Check_Event_Chest
; ---------------------------------
_Check_Event_Chest::
	add	sp, #-2
;bank2.c:577: for(i = 0; i < 100; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00108$:
;bank2.c:579: if(char_player.pos_x == event_chest.pos_x[i] && char_player.pos_y - 2 == event_chest.pos_y[i] && CurrentMap == event_chest.map_id[i])
	ld	hl, #(_char_player + 0x0006)
	ld	c, (hl)
	ld	hl, #_i
	ld	e, (hl)
	ld	hl, #(_event_chest + 0x00c8)
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00109$
	ld	hl, #_char_player + 7
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	dec	bc
	ld	hl, #(_event_chest + 0x012c)
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	sub	a, c
	jr	NZ, 00109$
	ld	a, h
	sub	a, b
	jr	NZ, 00109$
	ld	hl, #(_event_chest + 0x0064)
	ld	d, #0x00
	add	hl, de
	ld	c, (hl)
	ld	a, (#_CurrentMap)
;bank2.c:581: if(event_chest.used[i] == false)
;b
	sub	a,c
	jr	NZ, 00109$
	ld	d,a
	ld	hl, #(_event_chest + 0x01f4)
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00110$
;bank2.c:583: event_chest.used[i] = true;
	pop	hl
	push	hl
	ld	(hl), #0x01
;bank2.c:584: open_chest(event_chest.content_id[i]);
	ld	bc, #_event_chest + 600
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_open_chest
	inc	sp
;bank2.c:587: return;
	jr	00110$
00109$:
;bank2.c:577: for(i = 0; i < 100; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe4
	jr	C, 00108$
00110$:
;bank2.c:590: }
	add	sp, #2
	ret
;bank2.c:592: void Check_Event_Sign(void)
;	---------------------------------
; Function Check_Event_Sign
; ---------------------------------
_Check_Event_Sign::
;bank2.c:594: x = 0;
	ld	hl, #_x
	ld	(hl), #0x00
;bank2.c:595: y = 0;
	ld	hl, #_y
	ld	(hl), #0x00
;bank2.c:597: switch(char_player.facing)
	ld	a, (#(_char_player + 0x000c) + 0)
	or	a, a
	jr	Z, 00101$
	cp	a, #0x01
	jr	Z, 00102$
	cp	a, #0x02
	jr	Z, 00103$
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank2.c:599: case up:
00101$:
;bank2.c:600: y = -1;
	ld	hl, #_y
	ld	(hl), #0xff
;bank2.c:601: break;
	jr	00106$
;bank2.c:602: case down:
00102$:
;bank2.c:603: y = 1;
	ld	hl, #_y
	ld	(hl), #0x01
;bank2.c:604: break;
	jr	00106$
;bank2.c:605: case left:
00103$:
;bank2.c:606: x = -1;
	ld	hl, #_x
	ld	(hl), #0xff
;bank2.c:607: break;
	jr	00106$
;bank2.c:608: case right:
00104$:
;bank2.c:609: x = 1;
	ld	hl, #_x
	ld	(hl), #0x01
;bank2.c:610: break;
	jr	00106$
;bank2.c:611: default:
00105$:
;bank2.c:612: y = -1;
	ld	hl, #_y
	ld	(hl), #0xff
;bank2.c:614: }
00106$:
;bank2.c:616: for(i = 0; i < 10; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00111$:
;bank2.c:618: if(char_player.pos_x + x == Get_Sign(Get_Map(CurrentMap)->event_sign[i])->pos_x && char_player.pos_y + y == Get_Sign(Get_Map(CurrentMap)->event_sign[i])->pos_y)
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_x)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x0021
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Sign
	inc	sp
	pop	bc
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00112$
	ld	a, d
	sub	a, b
	jr	NZ, 00112$
	ld	a, (#(_char_player + 0x0007) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_y)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x0021
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Sign
	inc	sp
	pop	bc
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00112$
	ld	a, d
	sub	a, b
	jr	NZ, 00112$
;bank2.c:620: r = Get_Sign(Get_Map(CurrentMap)->event_sign[i])->message_id;
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0021
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Sign
	inc	sp
	inc	de
	inc	de
	inc	de
	ld	a, (de)
;bank2.c:621: read_message(Get_Message(r));
	ld	(#_r),a
	push	af
	inc	sp
	call	_Get_Message
	inc	sp
	push	de
	call	_read_message
	add	sp, #2
;bank2.c:622: return;
	ret
00112$:
;bank2.c:616: for(i = 0; i < 10; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jp	C, 00111$
;bank2.c:625: }
	ret
;bank2.c:627: void Check_Event_Tele(void)
;	---------------------------------
; Function Check_Event_Tele
; ---------------------------------
_Check_Event_Tele::
;bank2.c:629: for(i = 0; i < 10; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00105$:
;bank2.c:631: if(char_player.pos_x == Get_Tele(Get_Map(CurrentMap)->event_tele[i])->pos_x && char_player.pos_y == Get_Tele(Get_Map(CurrentMap)->event_tele[i])->pos_y)
	ld	hl, #(_char_player + 0x0006)
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Tele
	inc	sp
	pop	bc
	inc	de
	inc	de
	ld	a, (de)
	sub	a, c
	jr	NZ, 00106$
	ld	hl, #_char_player + 7
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Tele
	inc	sp
	pop	bc
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	jr	NZ, 00106$
;bank2.c:633: r = Get_Tele(Get_Map(CurrentMap)->event_tele[i])->tele_id;
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Tele
	inc	sp
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
;bank2.c:634: teleport_player(Get_Tele(r));
	ld	(#_r), a
	push	af
	inc	sp
	call	_Get_Tele
	inc	sp
	push	de
	call	_teleport_player
	add	sp, #2
;bank2.c:635: return;
	ret
00106$:
;bank2.c:629: for(i = 0; i < 10; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jp	C, 00105$
;bank2.c:638: }
	ret
;bank2.c:640: void Check_Event_Trigger(void)
;	---------------------------------
; Function Check_Event_Trigger
; ---------------------------------
_Check_Event_Trigger::
;bank2.c:642: for(i = 0; i < 10; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;bank2.c:644: if(char_player.pos_x >= Get_Map(CurrentMap)->event_trigger[i]->pos_1[0] && char_player.pos_y >= Get_Map(CurrentMap)->event_trigger[i]->pos_1[1] && char_player.pos_x <= Get_Map(CurrentMap)->event_trigger[i]->pos_2[0] && char_player.pos_y <= Get_Map(CurrentMap)->event_trigger[i]->pos_2[1])
	ld	hl, #(_char_player + 0x0006)
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x002b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	C, 00108$
	ld	hl, #(_char_player + 0x0007)
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x002b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00108$
	ld	hl, #(_char_player + 0x0006)
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x002b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, b
	sub	a, c
	jr	C, 00108$
	ld	hl, #(_char_player + 0x0007)
	ld	c, (hl)
	push	bc
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	pop	bc
	ld	hl, #0x002b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0004
	add	hl, de
	ld	b, (hl)
	ld	a, b
	sub	a, c
	jr	C, 00108$
;bank2.c:646: Call_Scene_Handler(bank2, Get_Map(CurrentMap)->event_trigger[i]->scene_id);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x002b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_i)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	e,#0x02
	push	de
	call	_Call_Scene_Handler
	add	sp, #2
00108$:
;bank2.c:642: for(i = 0; i < 10; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jp	C, 00107$
;bank2.c:649: }
	ret
;bank2.c:651: void hide_char(GameCharacter* character)
;	---------------------------------
; Function hide_char
; ---------------------------------
_hide_char::
	add	sp, #-13
;bank2.c:653: if(character->active == true)
	ldhl	sp,#15
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	dec	a
	jp	NZ,00113$
;bank2.c:655: if(character->pos_x < char_player.pos_x - 6 || character->pos_y < char_player.pos_y - 6 || character->pos_x > char_player.pos_x + 5 || character->pos_y > char_player.pos_y + 5)
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (#(_char_player + 0x0006) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank2.c:657: if(character->visible == true)
	ld	hl, #0x000d
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
	inc	hl
	ld	(hl), a
;bank2.c:655: if(character->pos_x < char_player.pos_x - 6 || character->pos_y < char_player.pos_y - 6 || character->pos_x > char_player.pos_x + 5 || character->pos_y > char_player.pos_y + 5)
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00147$
	bit	7, d
	jr	NZ, 00148$
	cp	a, a
	jr	00148$
00147$:
	bit	7, d
	jr	Z, 00148$
	scf
00148$:
	jp	C, 00105$
	ld	hl, #0x0007
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#12
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#11
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jr	C, 00105$
;c
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#9
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
	jr	Z, 00151$
	bit	7, d
	jr	NZ, 00152$
	cp	a, a
	jr	00152$
00151$:
	bit	7, d
	jr	Z, 00152$
	scf
00152$:
	jr	C, 00105$
;c
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00153$
	bit	7, d
	jr	NZ, 00154$
	cp	a, a
	jr	00154$
00153$:
	bit	7, d
	jr	Z, 00154$
	scf
00154$:
	jr	NC, 00106$
00105$:
;bank2.c:657: if(character->visible == true)
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00113$
;bank2.c:659: Call_Load_Char_Sprite(bank2, character, &sprite_clear);
	ld	hl, #_sprite_clear
	push	hl
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:660: character->visible = false;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00113$
00106$:
;bank2.c:663: else if(character->visible == false)
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;bank2.c:665: Call_Load_Char_Sprite(bank2, character, character->sprites_down->sprites[0]);
	ld	hl, #0x0011
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
;bank2.c:666: character->visible = true;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00113$:
;bank2.c:669: }
	add	sp, #13
	ret
;bank2.c:671: void walk_counter(INT8 move_x, INT8 move_y)
;	---------------------------------
; Function walk_counter
; ---------------------------------
_walk_counter::
;bank2.c:673: if(move_x > 0)
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00134$
	bit	7, d
	jr	NZ, 00135$
	cp	a, a
	jr	00135$
00134$:
	bit	7, d
	jr	Z, 00135$
	scf
00135$:
	jr	NC, 00110$
;bank2.c:675: char_player.pos_x += 1;
	ld	bc, #_char_player + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
;bank2.c:676: char_player.walk_count[3] += 16;
	ld	bc, #_char_player + 11
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;bank2.c:678: Check_Event_Tele();
	jp  _Check_Event_Tele
00110$:
;bank2.c:680: else if(move_x < 0)
	ldhl	sp,	#2
	bit	7, (hl)
	jr	Z, 00107$
;bank2.c:682: char_player.pos_x -= 1;
	ld	bc, #_char_player + 6
	ld	a, (bc)
	dec	a
	ld	(bc), a
;bank2.c:683: char_player.walk_count[2] += 16;
	ld	bc, #_char_player + 10
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;bank2.c:685: Check_Event_Tele();
	jp  _Check_Event_Tele
00107$:
;bank2.c:687: else if(move_y > 0)
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00136$
	bit	7, d
	jr	NZ, 00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z, 00137$
	scf
00137$:
	jr	NC, 00104$
;bank2.c:689: char_player.pos_y += 1;
	ld	bc, #_char_player + 7
	ld	a, (bc)
	inc	a
	ld	(bc), a
;bank2.c:690: char_player.walk_count[1] += 16;
	ld	bc, #_char_player + 9
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;bank2.c:692: Check_Event_Tele();
	jp  _Check_Event_Tele
00104$:
;bank2.c:694: else if(move_y < 0)
	ldhl	sp,	#3
	bit	7, (hl)
	ret	Z
;bank2.c:696: char_player.pos_y -= 1;
	ld	bc, #_char_player + 7
	ld	a, (bc)
	dec	a
	ld	(bc), a
;bank2.c:697: char_player.walk_count[0] += 16;
	ld	bc, #_char_player + 8
	ld	a, (bc)
	add	a, #0x10
	ld	(bc), a
;bank2.c:699: Check_Event_Tele();
;bank2.c:701: }
	jp  _Check_Event_Tele
;bank2.c:703: void walk_player()
;	---------------------------------
; Function walk_player
; ---------------------------------
_walk_player::
	add	sp, #-4
;bank2.c:705: if(char_player.walk_count[0] > 0)
	ld	a, (#(_char_player + 0x0008) + 0)
	or	a, a
	jp	Z, 00150$
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG+0)
	dec	a
	ldh	(_SCY_REG+0),a
;bank2.c:709: if(char_npc_1.active == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jp	NZ,00102$
;bank2.c:711: scroll_sprite(char_npc_1.sprite_id[0], 0, 1);
	ld	a, (#(_char_npc_1 + 0x0004) + 0)
	ldhl	sp,	#3
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00312$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00312$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:712: scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, 1);
	ld	a, (#(_char_npc_1 + 0x0004) + 0)
	inc	a
	ldhl	sp,	#3
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00313$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00313$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:713: scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, 1);
	ld	a, (#(_char_npc_1 + 0x0004) + 0)
	add	a, #0x02
	ldhl	sp,	#3
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00314$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00314$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:714: scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, 1);
	ld	a, (#(_char_npc_1 + 0x0004) + 0)
	add	a, #0x03
	ldhl	sp,	#3
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00315$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00315$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:714: scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, 1);
00102$:
;bank2.c:716: if(char_npc_2.active == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00104$
;bank2.c:718: scroll_sprite(char_npc_2.sprite_id[0], 0, 1);
	ld	bc, #_char_npc_2+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:719: scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, 1);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:720: scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, 1);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:721: scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, 1);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:721: scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, 1);
00104$:
;bank2.c:724: char_player.walk_count[0] = char_player.walk_count[0] - 1;
	ld	a, (#(_char_player + 0x0008) + 0)
	dec	a
	ld	(#(_char_player + 0x0008)),a
;bank2.c:726: if(char_player.walk_count[0] == 0)
	ld	a, (#(_char_player + 0x0008) + 0)
	or	a, a
	jp	NZ, 00188$
;bank2.c:728: camera_y = camera_y - 2;
	ld	hl, #_camera_y
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
;bank2.c:729: if(camera_y == 254){camera_y = 30;}
	ld	a, (hl)
	sub	a, #0xfe
	jr	NZ, 00106$
	ld	hl, #_camera_y
	ld	(hl), #0x1e
00106$:
;bank2.c:731: Check_Event_Trigger();
	call	_Check_Event_Trigger
;bank2.c:733: if(Get_Map(CurrentMap)->combat == true)
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	dec	a
	jp	NZ,00188$
;bank2.c:735: Call_Check_Step_Counter(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Step_Counter
	inc	sp
	jp	00188$
00150$:
;bank2.c:739: else if(char_player.walk_count[1] > 0)
	ld	a, (#(_char_player + 0x0009) + 0)
	or	a, a
	jp	Z, 00147$
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG+0)
	inc	a
	ldh	(_SCY_REG+0),a
;bank2.c:743: if(char_npc_1.active == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00112$
;bank2.c:745: scroll_sprite(char_npc_1.sprite_id[0], 0, -1);
	ld	bc, #_char_npc_1+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:746: scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, -1);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:747: scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, -1);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:748: scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, -1);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:748: scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, -1);
00112$:
;bank2.c:750: if(char_npc_2.active == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00114$
;bank2.c:752: scroll_sprite(char_npc_2.sprite_id[0], 0, -1);
	ld	bc, #_char_npc_2+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:753: scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, -1);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:754: scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, -1);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:755: scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, -1);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;bank2.c:755: scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, -1);
00114$:
;bank2.c:758: char_player.walk_count[1] = char_player.walk_count[1] - 1;
	ld	a, (#(_char_player + 0x0009) + 0)
	dec	a
	ld	(#(_char_player + 0x0009)),a
;bank2.c:760: if(char_player.walk_count[1] == 0)
	ld	a, (#(_char_player + 0x0009) + 0)
	or	a, a
	jp	NZ, 00188$
;bank2.c:762: camera_y = camera_y + 2;
	ld	hl, #_camera_y
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank2.c:763: if(camera_y == 32){camera_y = 0;}
	ld	a, (hl)
	sub	a, #0x20
	jr	NZ, 00116$
	ld	hl, #_camera_y
	ld	(hl), #0x00
00116$:
;bank2.c:765: Check_Event_Trigger();
	call	_Check_Event_Trigger
;bank2.c:767: if(Get_Map(CurrentMap)->combat == true)
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	dec	a
	jp	NZ,00188$
;bank2.c:769: Call_Check_Step_Counter(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Step_Counter
	inc	sp
	jp	00188$
00147$:
;bank2.c:773: else if(char_player.walk_count[2] > 0)
	ld	a, (#(_char_player + 0x000a) + 0)
	or	a, a
	jp	Z, 00144$
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	dec	a
	ldh	(_SCX_REG+0),a
;bank2.c:777: if(char_npc_1.active == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00122$
;bank2.c:779: scroll_sprite(char_npc_1.sprite_id[0], 1, 0);
	ld	bc, #_char_npc_1+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:780: scroll_sprite(char_npc_1.sprite_id[0] + 1, 1, 0);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:781: scroll_sprite(char_npc_1.sprite_id[0] + 2, 1, 0);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:782: scroll_sprite(char_npc_1.sprite_id[0] + 3, 1, 0);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:782: scroll_sprite(char_npc_1.sprite_id[0] + 3, 1, 0);
00122$:
;bank2.c:784: if(char_npc_2.active == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00124$
;bank2.c:786: scroll_sprite(char_npc_2.sprite_id[0], 1, 0);
	ld	bc, #_char_npc_2+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:787: scroll_sprite(char_npc_2.sprite_id[0] + 1, 1, 0);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:788: scroll_sprite(char_npc_2.sprite_id[0] + 2, 1, 0);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:789: scroll_sprite(char_npc_2.sprite_id[0] + 3, 1, 0);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:789: scroll_sprite(char_npc_2.sprite_id[0] + 3, 1, 0);
00124$:
;bank2.c:792: char_player.walk_count[2] = char_player.walk_count[2] - 1;
	ld	a, (#(_char_player + 0x000a) + 0)
	dec	a
	ld	(#(_char_player + 0x000a)),a
;bank2.c:794: Check_Event_Trigger();
	call	_Check_Event_Trigger
;bank2.c:796: if(char_player.walk_count[2] == 0)
	ld	a, (#(_char_player + 0x000a) + 0)
	or	a, a
	jp	NZ, 00188$
;bank2.c:798: camera_x = camera_x - 2;
	ld	hl, #_camera_x
	ld	a, (hl)
	add	a, #0xfe
	ld	(hl), a
;bank2.c:799: if(camera_x == 254){camera_x = 30;}
	ld	a, (hl)
	sub	a, #0xfe
	jr	NZ, 00126$
	ld	hl, #_camera_x
	ld	(hl), #0x1e
00126$:
;bank2.c:801: if(Get_Map(CurrentMap)->combat == true)
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	dec	a
	jp	NZ,00188$
;bank2.c:803: Call_Check_Step_Counter(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Step_Counter
	inc	sp
	jp	00188$
00144$:
;bank2.c:807: else if(char_player.walk_count[3] > 0)
	ld	a, (#(_char_player + 0x000b) + 0)
	or	a, a
	jp	Z, 00188$
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	inc	a
	ldh	(_SCX_REG+0),a
;bank2.c:811: if(char_npc_1.active == true)
	ld	a, (#_char_npc_1 + 0)
	dec	a
	jr	NZ, 00132$
;bank2.c:813: scroll_sprite(char_npc_1.sprite_id[0], -1, 0);
	ld	bc, #_char_npc_1+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:814: scroll_sprite(char_npc_1.sprite_id[0] + 1, -1, 0);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:815: scroll_sprite(char_npc_1.sprite_id[0] + 2, -1, 0);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:816: scroll_sprite(char_npc_1.sprite_id[0] + 3, -1, 0);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:816: scroll_sprite(char_npc_1.sprite_id[0] + 3, -1, 0);
00132$:
;bank2.c:818: if(char_npc_2.active == true)
	ld	a, (#_char_npc_2 + 0)
	dec	a
	jr	NZ, 00134$
;bank2.c:820: scroll_sprite(char_npc_2.sprite_id[0], -1, 0);
	ld	bc, #_char_npc_2+4
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:821: scroll_sprite(char_npc_2.sprite_id[0] + 1, -1, 0);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:822: scroll_sprite(char_npc_2.sprite_id[0] + 2, -1, 0);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:823: scroll_sprite(char_npc_2.sprite_id[0] + 3, -1, 0);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:823: scroll_sprite(char_npc_2.sprite_id[0] + 3, -1, 0);
00134$:
;bank2.c:826: char_player.walk_count[3] = char_player.walk_count[3] - 1;
	ld	a, (#(_char_player + 0x000b) + 0)
	dec	a
	ld	(#(_char_player + 0x000b)),a
;bank2.c:828: Check_Event_Trigger();
	call	_Check_Event_Trigger
;bank2.c:830: if(char_player.walk_count[3] == 0)
	ld	a, (#(_char_player + 0x000b) + 0)
	or	a, a
	jr	NZ, 00188$
;bank2.c:832: camera_x = camera_x + 2;
	ld	hl, #_camera_x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;bank2.c:833: if(camera_x == 32){camera_x = 0;}
	ld	a, (hl)
	sub	a, #0x20
	jr	NZ, 00136$
	ld	hl, #_camera_x
	ld	(hl), #0x00
00136$:
;bank2.c:835: if(Get_Map(CurrentMap)->combat == true)
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	NZ, 00188$
;bank2.c:837: Call_Check_Step_Counter(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Step_Counter
	inc	sp
00188$:
;bank2.c:841: }
	add	sp, #4
	ret
;bank2.c:843: void walk_char(GameCharacter* character)
;	---------------------------------
; Function walk_char
; ---------------------------------
_walk_char::
	add	sp, #-9
;bank2.c:845: if(character->walk_count[0] > 0)
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
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
	ldhl	sp,	#8
;bank2.c:847: scroll_sprite(character->sprite_id[0], 0, -1);
;c
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;bank2.c:845: if(character->walk_count[0] > 0)
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jp	Z, 00110$
;bank2.c:847: scroll_sprite(character->sprite_id[0], 0, -1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00150$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00150$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	c, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:848: scroll_sprite(character->sprite_id[0] + 1, 0, -1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00151$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00151$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	c, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:849: scroll_sprite(character->sprite_id[0] + 2, 0, -1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00152$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00152$
;c
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	c, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:850: scroll_sprite(character->sprite_id[0] + 3, 0, -1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
	inc	(hl)
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, #0x02
00153$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00153$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	c, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(hl), a
;bank2.c:852: character->walk_count[0] -= 1;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jp	00128$
00110$:
;bank2.c:855: else if(character->walk_count[1] > 0)
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
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
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
;bank2.c:857: scroll_sprite(character->sprite_id[0], 0, 1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00154$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00154$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	inc	(hl)
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
;bank2.c:858: scroll_sprite(character->sprite_id[0] + 1, 0, 1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00155$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00155$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	inc	(hl)
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
;bank2.c:859: scroll_sprite(character->sprite_id[0] + 2, 0, 1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00156$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00156$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	inc	(hl)
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
;bank2.c:860: scroll_sprite(character->sprite_id[0] + 3, 0, 1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	inc	(hl)
	inc	(hl)
	inc	(hl)
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00157$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00157$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	inc	(hl)
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ld	c, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;bank2.c:862: character->walk_count[1] -= 1;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ld	c, (hl)
	dec	c
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jp	00128$
00107$:
;bank2.c:865: else if(character->walk_count[2] > 0)
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00104$
;bank2.c:867: scroll_sprite(character->sprite_id[0], -1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:868: scroll_sprite(character->sprite_id[0] + 1, -1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:869: scroll_sprite(character->sprite_id[0] + 2, -1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:870: scroll_sprite(character->sprite_id[0] + 3, -1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	ld	(hl), a
;bank2.c:872: character->walk_count[2] -= 1;
	ld	a, (bc)
	dec	a
	ld	(bc), a
	jr	00128$
00104$:
;bank2.c:875: else if(character->walk_count[3] > 0)
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00128$
;bank2.c:877: scroll_sprite(character->sprite_id[0], 1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:878: scroll_sprite(character->sprite_id[0] + 1, 1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	inc	e
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:879: scroll_sprite(character->sprite_id[0] + 2, 1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x02
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:880: scroll_sprite(character->sprite_id[0] + 3, 1, 0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x03
	ld	e, a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
;bank2.c:882: character->walk_count[3] -= 1;
	ld	a, (bc)
	dec	a
	ld	(bc), a
00128$:
;bank2.c:885: }
	add	sp, #9
	ret
;bank2.c:887: void Update_Joypad(void) //* Updates player action using button presses
;	---------------------------------
; Function Update_Joypad
; ---------------------------------
_Update_Joypad::
	add	sp, #-6
;bank2.c:889: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank2.c:891: if(Joy & J_A && check_walk_counter() == false)
	bit	4, (hl)
	jr	Z, 00102$
	call	_check_walk_counter
	ld	a, e
	or	a, a
	jr	NZ, 00102$
;bank2.c:893: Check_Event_Sign();
	call	_Check_Event_Sign
;bank2.c:894: Check_NPC_Messenger();
	call	_Check_NPC_Messenger
;bank2.c:895: Check_NPC_Shopkeeper();
	call	_Check_NPC_Shopkeeper
;bank2.c:896: Check_Event_Chest();
	call	_Check_Event_Chest
;bank2.c:897: Check_Event_Shopkeeper();
	call	_Check_Event_Shopkeeper
;bank2.c:898: Check_Event_Trigger();
	call	_Check_Event_Trigger
00102$:
;bank2.c:901: if(Joy & J_B && check_walk_counter() == false)
	ld	a, (#_Joy)
	bit	5, a
	jr	Z, 00105$
	call	_check_walk_counter
	ld	a, e
	or	a, a
	jr	NZ, 00105$
;bank2.c:903: Call_Load_Combat_Main(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Combat_Main
	inc	sp
00105$:
;bank2.c:910: if(Joy & J_START && check_walk_counter() == false)
	ld	a, (#_Joy)
	rlca
	jr	NC, 00108$
	call	_check_walk_counter
	ld	a, e
	or	a, a
	jr	NZ, 00108$
;bank2.c:912: Menu();
	call	_Menu
00108$:
;bank2.c:915: if(Joy & J_UP && PlayerControlFlag == true && check_walk_counter() == false)
	ld	hl, #_Joy
	ld	c, (hl)
	ld	a, (#_PlayerControlFlag)
	dec	a
	ld	a, #0x01
	jr	Z, 00449$
	xor	a, a
00449$:
	ldhl	sp,	#0
	ld	(hl), a
	bit	2, c
	jp	Z,00189$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00189$
	call	_check_walk_counter
	ld	a, (#_PlayerControlFlag)
	dec	a
	ld	a, #0x01
	jr	Z, 00452$
	xor	a, a
00452$:
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, e
	or	a, a
	jp	NZ, 00189$
;bank2.c:917: if(char_player.pos_y > 0)
	ld	hl, #_char_player + 7
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	Z, 00193$
;bank2.c:924: char_player.facing = up;
;bank2.c:919: if(char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 4)
	ld	a, #0x05
	sub	a, c
	jr	NC, 00120$
	ld	hl, #_map_size_y
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, #0xfc
	ld	l, a
	ld	a, d
	adc	a, #0xff
	ld	h, a
	ld	b, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00453$
	bit	7, d
	jr	NZ, 00454$
	cp	a, a
	jr	00454$
00453$:
	bit	7, d
	jr	Z, 00454$
	scf
00454$:
	jr	NC, 00121$
00120$:
;bank2.c:921: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, -1) == false && check_char_collision(&char_player, 0, -1) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00111$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00111$
;bank2.c:923: camera_focus = false;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:924: char_player.facing = up;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x00
;bank2.c:926: walk_counter(0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_walk_counter
	add	sp, #2
	jp	00193$
00111$:
;bank2.c:930: char_player.facing = up;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x00
;bank2.c:932: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_up_0);
	ld	hl, #_sprite_hiro_up_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00121$:
;bank2.c:937: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, -1) == false && check_char_collision(&char_player, 0, -1) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00116$
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00116$
;bank2.c:939: camera_focus = true;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:941: Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), up);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:943: walk_counter(0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_walk_counter
	add	sp, #2
;bank2.c:945: char_player.facing = up;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x00
	jp	00193$
00116$:
;bank2.c:949: char_player.facing = up;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x00
;bank2.c:950: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_up_0);
	ld	hl, #_sprite_hiro_up_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00189$:
;bank2.c:956: else if(Joy & J_DOWN && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_Joy)
	bit	3, a
	jp	Z,00184$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00184$
	call	_check_walk_counter
;bank2.c:915: if(Joy & J_UP && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_PlayerControlFlag)
	dec	a
	ld	a, #0x01
	jr	Z, 00457$
	xor	a, a
00457$:
	ldhl	sp,	#0
	ld	(hl), a
;bank2.c:956: else if(Joy & J_DOWN && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, e
	or	a, a
	jp	NZ, 00184$
;bank2.c:958: if(char_player.pos_y < map_size_y - 1)
	ld	a, (#(_char_player + 0x0007) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_map_size_y
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
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
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00458$
	bit	7, d
	jr	NZ, 00459$
	cp	a, a
	jr	00459$
00458$:
	bit	7, d
	jr	Z, 00459$
	scf
00459$:
	jp	NC, 00193$
;bank2.c:966: char_player.facing = down;
;bank2.c:960: if(char_player.pos_y <= 4 || char_player.pos_y >= map_size_y - 4)
	ld	a, #0x04
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NC, 00136$
	ld	a, c
	add	a, #0xfc
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00460$
	bit	7, d
	jr	NZ, 00461$
	cp	a, a
	jr	00461$
00460$:
	bit	7, d
	jr	Z, 00461$
	scf
00461$:
	jr	C, 00137$
00136$:
;bank2.c:962: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, 1) == false && check_char_collision(&char_player, 0, 1) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00127$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00127$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00127$
;bank2.c:964: camera_focus = false;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:966: char_player.facing = down;
	ld	hl, #(_char_player + 0x000c)
;bank2.c:967: walk_counter(0, 1);
	ld	a,#0x01
	ld	(hl),a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_walk_counter
	add	sp, #2
	jp	00193$
00127$:
;bank2.c:971: char_player.facing = down;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x01
;bank2.c:972: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_down_0);
	ld	hl, #_sprite_hiro_down_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00137$:
;bank2.c:977: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, 1) == false && check_char_collision(&char_player, 0, 1) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00132$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00132$
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00132$
;bank2.c:979: camera_focus = true;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:981: Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), down);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:983: walk_counter(0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_walk_counter
	add	sp, #2
;bank2.c:985: char_player.facing = down;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x01
	jp	00193$
00132$:
;bank2.c:989: char_player.facing = down;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x01
;bank2.c:990: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_down_0);
	ld	hl, #_sprite_hiro_down_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00184$:
;bank2.c:996: else if(Joy & J_LEFT && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_Joy)
	bit	1, a
	jp	Z,00179$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00179$
	call	_check_walk_counter
;bank2.c:915: if(Joy & J_UP && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_PlayerControlFlag)
	dec	a
	ld	a, #0x01
	jr	Z, 00464$
	xor	a, a
00464$:
	ldhl	sp,	#0
	ld	(hl), a
;bank2.c:996: else if(Joy & J_LEFT && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, e
	or	a, a
	jp	NZ, 00179$
;bank2.c:998: if(char_player.pos_x > 0)
	ld	hl, #_char_player + 6
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	Z, 00193$
;bank2.c:1006: char_player.facing = left;
;bank2.c:1000: if(char_player.pos_x <= 5 || char_player.pos_x > map_size_x - 5)
	ld	a, #0x05
	sub	a, c
	jr	NC, 00152$
	ld	hl, #_map_size_x
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, #0xfb
	ld	b, a
	ld	a, d
	adc	a, #0xff
	ld	l, a
	ld	h, #0x00
	ld	e, h
	ld	d, l
	ld	a, b
	sub	a, c
	ld	a, l
	sbc	a, h
	bit	7, e
	jr	Z, 00465$
	bit	7, d
	jr	NZ, 00466$
	cp	a, a
	jr	00466$
00465$:
	bit	7, d
	jr	Z, 00466$
	scf
00466$:
	jr	NC, 00153$
00152$:
;bank2.c:1002: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, -1, 0) == false && check_char_collision(&char_player, -1, 0) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00143$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0xff
	push	hl
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00143$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00143$
;bank2.c:1004: camera_focus = false;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:1006: char_player.facing = left;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x02
;bank2.c:1007: walk_counter(-1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_walk_counter
	add	sp, #2
	jp	00193$
00143$:
;bank2.c:1011: char_player.facing = left;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x02
;bank2.c:1012: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_left_0);
	ld	hl, #_sprite_hiro_left_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00153$:
;bank2.c:1017: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, -1, 0) == false && check_char_collision(&char_player, -1, 0) == false)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00148$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0xff
	push	hl
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00148$
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00148$
;bank2.c:1019: camera_focus = true;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:1021: Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), left);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x02
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:1023: walk_counter(-1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_walk_counter
	add	sp, #2
;bank2.c:1025: char_player.facing = left;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x02
	jp	00193$
00148$:
;bank2.c:1029: char_player.facing = left;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x02
;bank2.c:1030: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_left_0);
	ld	hl, #_sprite_hiro_left_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jp	00193$
00179$:
;bank2.c:1036: else if(Joy & J_RIGHT && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_Joy)
	rrca
	jp	NC,00193$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00193$
	call	_check_walk_counter
	ld	a, e
	or	a, a
	jp	NZ, 00193$
;bank2.c:1038: if(char_player.pos_x < map_size_x - 1)
	ld	a, (#(_char_player + 0x0006) + 0)
	ldhl	sp,	#2
	ld	(hl), a
	ld	hl, #_map_size_x
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#3
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
	jr	Z, 00468$
	bit	7, d
	jr	NZ, 00469$
	cp	a, a
	jr	00469$
00468$:
	bit	7, d
	jr	Z, 00469$
	scf
00469$:
	jp	NC, 00193$
;bank2.c:915: if(Joy & J_UP && PlayerControlFlag == true && check_walk_counter() == false)
	ld	a, (#_PlayerControlFlag)
	dec	a
	ld	a, #0x01
	jr	Z, 00471$
	xor	a, a
00471$:
	ldhl	sp,	#5
	ld	(hl), a
;bank2.c:1046: char_player.facing = right;
;bank2.c:1040: if(char_player.pos_x < 5 || char_player.pos_x >= map_size_x - 5)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00168$
	ld	a, c
	add	a, #0xfb
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	inc	hl
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00472$
	bit	7, d
	jr	NZ, 00473$
	cp	a, a
	jr	00473$
00472$:
	bit	7, d
	jr	Z, 00473$
	scf
00473$:
	jr	C, 00169$
00168$:
;bank2.c:1042: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 1, 0) == false && check_char_collision(&char_player, 1, 0) == false)
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00159$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00159$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00159$
;bank2.c:1044: camera_focus = false;
	ld	hl, #_camera_focus
	ld	(hl), #0x00
;bank2.c:1046: char_player.facing = right;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x03
;bank2.c:1047: walk_counter(1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_walk_counter
	add	sp, #2
	jp	00193$
00159$:
;bank2.c:1051: char_player.facing = right;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x03
;bank2.c:1052: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_right_0);
	ld	hl, #_sprite_hiro_right_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jr	00193$
00169$:
;bank2.c:1057: if(PlayerControlFlag == true && Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 1, 0) == false && check_char_collision(&char_player, 1, 0) == false)
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00164$
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	hl, #_char_player
	push	hl
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Check_Tile_Collision
	add	sp, #7
	ld	a, e
	or	a, a
	jr	NZ, 00164$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	ld	hl, #_char_player
	push	hl
	call	_check_char_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00164$
;bank2.c:1059: camera_focus = true;
	ld	hl, #_camera_focus
	ld	(hl), #0x01
;bank2.c:1061: Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), right);
	ld	a, (#_CurrentMap)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Draw_Map_Line
	add	sp, #4
;bank2.c:1063: walk_counter(1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_walk_counter
	add	sp, #2
;bank2.c:1065: char_player.facing = right;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x03
	jr	00193$
00164$:
;bank2.c:1069: char_player.facing = right;
	ld	hl, #(_char_player + 0x000c)
	ld	(hl), #0x03
;bank2.c:1070: Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_right_0);
	ld	hl, #_sprite_hiro_right_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
00193$:
;bank2.c:1075: }
	add	sp, #6
	ret
;bank2.c:1077: void test_update_npc(void)
;	---------------------------------
; Function test_update_npc
; ---------------------------------
_test_update_npc::
;bank2.c:1079: j = rand();
	call	_rand
	ld	hl, #_j
	ld	(hl), e
;bank2.c:1080: if(j >= 0 && j <= 20)
	bit	7, (hl)
	jr	NZ, 00113$
	ld	e, (hl)
	ld	a,#0x14
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jr	C, 00113$
;bank2.c:1082: char_npc_1.walk_count[0] += 8;
	ld	bc, #_char_npc_1 + 8
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
;bank2.c:1083: char_npc_1.pos_y -= 1;
	ld	bc, #_char_npc_1 + 7
	ld	a, (bc)
	dec	a
	ld	(bc), a
	ret
00113$:
;bank2.c:1085: else if(j >= 21 && j <= 40)
	ld	hl, #_j
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x95
	jr	C, 00109$
	ld	e, (hl)
	ld	a,#0x28
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jr	C, 00109$
;bank2.c:1087: char_npc_1.walk_count[1] += 8;
	ld	bc, #_char_npc_1 + 9
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
;bank2.c:1088: char_npc_1.pos_y += 1;
	ld	bc, #_char_npc_1 + 7
	ld	a, (bc)
	inc	a
	ld	(bc), a
	ret
00109$:
;bank2.c:1090: else if(j >= 41 && j <= 60)
	ld	hl, #_j
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xa9
	jr	C, 00105$
	ld	e, (hl)
	ld	a,#0x3c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jr	C, 00105$
;bank2.c:1092: char_npc_1.walk_count[2] += 8;
	ld	bc, #_char_npc_1 + 10
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
;bank2.c:1093: char_npc_1.pos_x -= 1;
	ld	bc, #_char_npc_1 + 6
	ld	a, (bc)
	dec	a
	ld	(bc), a
	ret
00105$:
;bank2.c:1095: else if(j >= 61 && j <= 80)
	ld	hl, #_j
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xbd
	ret	C
	ld	e, (hl)
	ld	a,#0x50
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	ret	C
;bank2.c:1097: char_npc_1.walk_count[3] += 8;
	ld	bc, #_char_npc_1 + 11
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
;bank2.c:1098: char_npc_1.pos_x += 1;
	ld	bc, #_char_npc_1 + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
;bank2.c:1100: }
	ret
;bank2.c:1102: void Update_Anim_Walk()
;	---------------------------------
; Function Update_Anim_Walk
; ---------------------------------
_Update_Anim_Walk::
	dec	sp
;bank2.c:1104: if(char_player.walk_count[0] > 0 || char_player.walk_count[1] > 0 || char_player.walk_count[2] > 0 || char_player.walk_count[3] > 0)
	ld	hl, #_char_player + 8
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00121$
	ld	a, (#(_char_player + 0x0009) + 0)
	or	a, a
	jr	NZ, 00121$
	ld	a, (#(_char_player + 0x000a) + 0)
	or	a, a
	jr	NZ, 00121$
	ld	a, (#(_char_player + 0x000b) + 0)
	or	a, a
	jp	Z, 00126$
00121$:
;bank2.c:1106: if(char_player.walk_count[up] == 16){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_up_0);}
	ld	a, c
	sub	a, #0x10
	jr	NZ, 00104$
	ld	hl, #_sprite_hiro_up_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jr	00105$
00104$:
;bank2.c:1107: else if(char_player.walk_count[up] == 8){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_up_0);}
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00105$
	ld	hl, #_sprite_hiro_up_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
00105$:
;bank2.c:1109: if(char_player.walk_count[down] == 16){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_down_1);}
	ld	a, (#(_char_player + 0x0009) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x10
	jr	NZ, 00109$
	ld	hl, #_sprite_hiro_down_1
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jr	00110$
00109$:
;bank2.c:1110: else if(char_player.walk_count[down] == 8){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_down_0);}
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00110$
	ld	hl, #_sprite_hiro_down_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
00110$:
;bank2.c:1112: if(char_player.walk_count[left] == 16){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_left_0);}
	ld	a, (#(_char_player + 0x000a) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x10
	jr	NZ, 00114$
	ld	hl, #_sprite_hiro_left_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jr	00115$
00114$:
;bank2.c:1113: else if(char_player.walk_count[left] == 8){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_left_0);}
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00115$
	ld	hl, #_sprite_hiro_left_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
00115$:
;bank2.c:1115: if(char_player.walk_count[right] == 16){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_right_0);}
	ld	a, (#(_char_player + 0x000b) + 0)
	cp	a, #0x10
	jr	NZ, 00119$
	ld	hl, #_sprite_hiro_right_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
	jr	00126$
00119$:
;bank2.c:1116: else if(char_player.walk_count[right] == 8){Call_Load_Char_Sprite(bank2, &char_player, &sprite_hiro_right_0);}
	sub	a, #0x08
	jr	NZ, 00126$
	ld	hl, #_sprite_hiro_right_0
	push	hl
	ld	hl, #_char_player
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_Call_Load_Char_Sprite
	add	sp, #5
00126$:
;bank2.c:1118: }
	inc	sp
	ret
;bank2.c:1120: void Update_NPC(void)
;	---------------------------------
; Function Update_NPC
; ---------------------------------
_Update_NPC::
;bank2.c:1122: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
