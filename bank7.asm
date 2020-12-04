;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank7
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Menu_Main
	.globl _Menu_Main
	.globl _Update_Menu_Joypad
	.globl _Close_Menu
	.globl _Draw_Menu_Save
	.globl _Draw_Save_Message
	.globl _Refresh_Main_Menu
	.globl _Draw_Main_Menu
	.globl _Load_Font_Menu
	.globl _Draw_Gold
	.globl _Draw_Time
	.globl _Draw_Party
	.globl _Draw_Actor
	.globl _Draw_Name
	.globl _Draw_Number
	.globl _Add_Actor
	.globl _Add_Item
	.globl _Call_Play_Confirm
	.globl _Call_Menu_Skills
	.globl _Call_Menu_Status
	.globl _Call_Menu_Item
	.globl _Call_Menu_Equip
	.globl _Call_Load_Tileset
	.globl _Gameplay
	.globl _Get_Actor
	.globl _set_bkg_tileset
	.globl _fade_in
	.globl _fade_out
	.globl _Save_Variables
	.globl _toggle_control
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Menu_Coin
	.globl _Menu_Zero
	.globl _Menu_Empty
	.globl _Menu_Slash
	.globl _Menu_Pointer
	.globl _Menu_Background
	.globl _name_blank
	.globl _name_period
	.globl _Message_SavePLN1
	.globl _Message_SavePLN0
	.globl _Map_Menu_ConfirmBox_RefreshPLN1
	.globl _Map_Menu_ConfirmBox_RefreshPLN0
	.globl _Map_Menu_ConfirmBoxPLN1
	.globl _Map_Menu_ConfirmBoxPLN0
	.globl _Map_Menu_MessageBoxPLN1
	.globl _Map_Menu_MessageBoxPLN0
	.globl _Map_Menu_ActorPLN1
	.globl _Map_Menu_ActorPLN0
	.globl _Map_Menu_MainPLN1
	.globl _Map_Menu_MainPLN0
	.globl _Font_Menu
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
	.area _CODE_7
;bank7.c:117: void Add_Item(GameItem* item, UBYTE amount)
;	---------------------------------
; Function Add_Item
; ---------------------------------
_Add_Item::
	add	sp, #-3
;bank7.c:119: for(i = 0; i < 100; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;c
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
00105$:
;bank7.c:121: if(inventory[i] == 0 || inventory[i] == item->item_id)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_inventory
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00106$
00101$:
;bank7.c:123: inventory[i] = item->item_id;
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;bank7.c:124: inv_amount[i] += amount;
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_inv_amount
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#7
	add	a, (hl)
	ld	(bc), a
;bank7.c:125: return;
	jr	00107$
00106$:
;bank7.c:119: for(i = 0; i < 100; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe4
	jr	C, 00105$
00107$:
;bank7.c:128: }
	add	sp, #3
	ret
_Font_Menu:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xf1	; 241
	.db #0xea	; 234
	.db #0xe1	; 225
	.db #0xc6	; 198
	.db #0xc1	; 193
	.db #0x82	; 130
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x82	; 130
	.db #0xe1	; 225
	.db #0xc6	; 198
	.db #0xf1	; 241
	.db #0xea	; 234
	.db #0xe9	; 233
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xb3	; 179
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0x53	; 83	'S'
	.db #0xb3	; 179
	.db #0x07	; 7
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcd	; 205
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xca	; 202
	.db #0xcd	; 205
	.db #0xc8	; 200
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
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
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x29	; 41
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x19	; 25
	.db #0x39	; 57	'9'
	.db #0x19	; 25
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xa1	; 161
	.db #0xc3	; 195
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x93	; 147
	.db #0x13	; 19
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xe1	; 225
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xc1	; 193
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xc1	; 193
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0x33	; 51	'3'
	.db #0x31	; 49	'1'
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x8f	; 143
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
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x99	; 153
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x11	; 17
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x99	; 153
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x2f	; 47
	.db #0x9f	; 159
	.db #0x57	; 87	'W'
	.db #0x8f	; 143
	.db #0xa9	; 169
	.db #0xc7	; 199
	.db #0xd2	; 210
	.db #0xe5	; 229
	.db #0xe5	; 229
	.db #0xfb	; 251
	.db #0xe8	; 232
	.db #0xf5	; 245
	.db #0xf4	; 244
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x4f	; 79	'O'
	.db #0x9f	; 159
	.db #0x27	; 39
	.db #0xdf	; 223
	.db #0x93	; 147
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xed	; 237
	.db #0xf3	; 243
	.db #0xf0	; 240
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0x99	; 153
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xc3	; 195
	.db #0x3d	; 61
	.db #0xc3	; 195
	.db #0x3d	; 61
	.db #0xc3	; 195
	.db #0x39	; 57	'9'
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0x8b	; 139
	.db #0x09	; 9
	.db #0xf7	; 247
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0xdf	; 223
	.db #0x6f	; 111	'o'
	.db #0x8f	; 143
	.db #0x17	; 23
	.db #0xb7	; 183
	.db #0x19	; 25
	.db #0xbb	; 187
	.db #0x66	; 102	'f'
	.db #0x99	; 153
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0x42	; 66	'B'
	.db #0xbd	; 189
	.db #0x18	; 24
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0x99	; 153
	.db #0xb5	; 181
	.db #0xc3	; 195
	.db #0xdb	; 219
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0xc3	; 195
	.db #0x02	; 2
	.db #0xb9	; 185
	.db #0x02	; 2
	.db #0xb5	; 181
	.db #0x40	; 64
	.db #0xad	; 173
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x27	; 39
	.db #0x9f	; 159
	.db #0x6b	; 107	'k'
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0xef	; 239
	.db #0xab	; 171
	.db #0xd7	; 215
	.db #0xd5	; 213
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xdf	; 223
	.db #0x57	; 87	'W'
	.db #0xaf	; 175
	.db #0xab	; 171
	.db #0xf7	; 247
	.db #0xf5	; 245
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_MainPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x2a	; 42
	.db #0x1a	; 26
	.db #0x22	; 34
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
	.db #0x09	; 9
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x1e	; 30
	.db #0x25	; 37
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
	.db #0x09	; 9
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x29	; 41
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x28	; 40
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x29	; 41
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
	.db #0x09	; 9
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x49	; 73	'I'
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x1e	; 30
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x28	; 40
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
	.db #0x09	; 9
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x16	; 22
	.db #0x2c	; 44
	.db #0x1a	; 26
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
	.db #0x09	; 9
	.db #0x07	; 7
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
	.db #0x09	; 9
	.db #0x02	; 2
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
	.db #0x02	; 2
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
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x14	; 20
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
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Menu_MainPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_ActorPLN0:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x46	; 70	'F'
	.db #0x2c	; 44
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_Map_Menu_ActorPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_MessageBoxPLN0:
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
_Map_Menu_MessageBoxPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_ConfirmBoxPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x53	; 83	'S'
	.db #0x1a	; 26
	.db #0x29	; 41
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x48	; 72	'H'
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Menu_ConfirmBoxPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Menu_ConfirmBox_RefreshPLN0:
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
	.db #0x09	; 9
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
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
_Map_Menu_ConfirmBox_RefreshPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Message_SavePLN0:
	.db #0x51	; 81	'Q'
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x21	; 33
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x2f	; 47
	.db #0x24	; 36
	.db #0x2b	; 43
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x16	; 22
	.db #0x2c	; 44
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x16	; 22
	.db #0x22	; 34
	.db #0x1a	; 26
	.db #0x5b	; 91
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_Message_SavePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_name_period:
	.db #0x55	; 85	'U'
_name_blank:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_Menu_Background:
	.db #0x01	; 1
_Menu_Pointer:
	.db #0x0a	; 10
_Menu_Slash:
	.db #0x0f	; 15
_Menu_Empty:
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
_Menu_Zero:
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
_Menu_Coin:
	.db #0x75	; 117	'u'
;bank7.c:130: void Add_Actor(GameActor* actor)
;	---------------------------------
; Function Add_Actor
; ---------------------------------
_Add_Actor::
	dec	sp
;bank7.c:132: if(party[0] == 0)
	ld	a, (#_party + 0)
	ldhl	sp,	#0
	ld	(hl), a
;bank7.c:134: party[0] = actor->actor_id;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;bank7.c:135: actor->party_slot = 0;
	ld	hl, #0x001d
	add	hl, bc
	ld	c, l
	ld	b, h
;bank7.c:132: if(party[0] == 0)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
;bank7.c:134: party[0] = actor->actor_id;
	ld	a, (de)
	ld	(#_party),a
;bank7.c:135: actor->party_slot = 0;
	xor	a, a
	ld	(bc), a
	jr	00111$
00110$:
;bank7.c:137: else if(party[1] == 0)
	ld	hl, #_party + 1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
;bank7.c:139: party[1] = actor->actor_id;
	ld	a, (de)
	ld	(hl), a
;bank7.c:140: actor->party_slot = 1;
	ld	a, #0x01
	ld	(bc), a
	jr	00111$
00107$:
;bank7.c:142: else if(party[2] == 0)
	ld	hl, #_party + 2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;bank7.c:144: party[2] = actor->actor_id;
	ld	a, (de)
	ld	(hl), a
;bank7.c:145: actor->party_slot = 2;
	ld	a, #0x02
	ld	(bc), a
	jr	00111$
00104$:
;bank7.c:147: else if(party[3] == 0)
	ld	hl, #_party + 3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
;bank7.c:149: party[3] = actor->actor_id;
	ld	a, (de)
	ld	(hl), a
;bank7.c:150: actor->party_slot = 3;
	ld	a, #0x03
	ld	(bc), a
00111$:
;bank7.c:153: total_actors += 1;
	ld	hl, #_total_actors
	inc	(hl)
;bank7.c:154: }
	inc	sp
	ret
;bank7.c:156: void Draw_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Number
; ---------------------------------
_Draw_Number::
;bank7.c:158: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank7.c:160: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank7.c:162: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank7.c:164: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank7.c:166: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank7.c:164: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank7.c:169: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank7.c:171: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank7.c:172: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank7.c:175: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank7.c:176: parsed_number = 0;
	ld	(hl), #0x00
;bank7.c:178: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank7.c:180: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank7.c:181: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank7.c:184: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank7.c:185: parsed_number = 0;
	ld	(hl), #0x00
;bank7.c:187: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank7.c:189: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank7.c:190: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank7.c:193: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank7.c:195: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank7.c:197: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank7.c:198: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank7.c:199: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank7.c:200: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank7.c:204: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank7.c:202: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank7.c:204: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
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
;bank7.c:206: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank7.c:208: set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
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
;bank7.c:210: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank7.c:212: set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
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
;bank7.c:216: set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
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
;bank7.c:219: }
	ret
;bank7.c:221: void Draw_Name(UBYTE tile_x, UBYTE tile_y, unsigned char* name, UBYTE full_name)
;	---------------------------------
; Function Draw_Name
; ---------------------------------
_Draw_Name::
;bank7.c:223: if(name[4] != 0x01 && full_name == false)
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	ld	a, #0x01
	jr	Z, 00126$
	xor	a, a
00126$:
	ld	c, a
	bit	0, c
	jr	NZ, 00105$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;bank7.c:225: set_win_tiles(tile_x, tile_y, 3, 1, name);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0103
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:226: set_win_tiles(tile_x + 3, tile_y, 1, 1, name_period);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x03
	ld	hl, #_name_period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00105$:
;bank7.c:228: else if(name[4] == 0x01)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;bank7.c:230: set_win_tiles(tile_x, tile_y, 4, 1, name);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0104
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00102$:
;bank7.c:234: set_win_tiles(tile_x, tile_y, 7, 1, name);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:236: }
	ret
;bank7.c:238: void Draw_Actor(GameActor* actor)
;	---------------------------------
; Function Draw_Actor
; ---------------------------------
_Draw_Actor::
	add	sp, #-7
;bank7.c:240: if(actor != &actor_null)
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #<(_actor_null)
	jr	NZ, 00197$
	inc	hl
	ld	a, (hl)
	sub	a, #>(_actor_null)
	jp	Z,00130$
00197$:
;bank7.c:242: if(actor->party_slot == 0 && actor->active_member == true)
	ldhl	sp,#9
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
;bank7.c:248: Draw_Number(actor->max_health, 15, 3);
	ld	hl, #0x0009
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), a
;bank7.c:249: Draw_Number(actor->health, 14, 2);
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;bank7.c:251: if(actor->level > 9){Draw_Number(actor->level, 11, 3);}
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;bank7.c:242: if(actor->party_slot == 0 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
	ld	a, (de)
	dec	a
	jr	NZ, 00125$
;bank7.c:244: set_win_tiles(10, 2, 9, 2, Map_Menu_ActorPLN0);
	ld	hl, #_Map_Menu_ActorPLN0
	push	hl
	ld	de, #0x0209
	push	de
	ld	de, #0x020a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:246: Draw_Name(10, 2, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x020a
	push	de
	call	_Draw_Name
	add	sp, #5
;bank7.c:248: Draw_Number(actor->max_health, 15, 3);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x030f
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:249: Draw_Number(actor->health, 14, 2);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x020e
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:251: if(actor->level > 9){Draw_Number(actor->level, 11, 3);}
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, #0x09
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00102$
	ld	de, #0x030b
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00102$:
;bank7.c:252: else{Draw_Number(actor->level, 10, 3);}
	ld	de, #0x030a
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00125$:
;bank7.c:255: else if(actor->party_slot == 1 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00121$
	ld	a, (de)
	dec	a
	jr	NZ, 00121$
;bank7.c:257: set_win_tiles(10, 5, 9, 2, Map_Menu_ActorPLN0);
	ld	hl, #_Map_Menu_ActorPLN0
	push	hl
	ld	de, #0x0209
	push	de
	ld	de, #0x050a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:259: Draw_Name(10, 5, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x050a
	push	de
	call	_Draw_Name
	add	sp, #5
;bank7.c:261: Draw_Number(actor->max_health, 15, 6);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x060f
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:262: Draw_Number(actor->health, 14, 5);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x050e
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:264: if(actor->level > 9){Draw_Number(actor->level, 11, 6);}
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, #0x09
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00105$
	ld	de, #0x060b
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00105$:
;bank7.c:265: else{Draw_Number(actor->level, 10, 6);}
	ld	de, #0x060a
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00121$:
;bank7.c:267: else if(actor->party_slot == 2 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00117$
	ld	a, (de)
	dec	a
	jr	NZ, 00117$
;bank7.c:269: set_win_tiles(10, 8, 9, 2, Map_Menu_ActorPLN0);
	ld	hl, #_Map_Menu_ActorPLN0
	push	hl
	ld	de, #0x0209
	push	de
	ld	de, #0x080a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:271: Draw_Name(10, 8, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x080a
	push	de
	call	_Draw_Name
	add	sp, #5
;bank7.c:273: Draw_Number(actor->max_health, 15, 9);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x090f
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:274: Draw_Number(actor->health, 14, 8);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x080e
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:276: if(actor->level > 9){Draw_Number(actor->level, 11, 9);}
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, #0x09
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00108$
	ld	de, #0x090b
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00108$:
;bank7.c:277: else{Draw_Number(actor->level, 10, 9);}
	ld	de, #0x090a
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jp	00130$
00117$:
;bank7.c:279: else if(actor->party_slot == 3 && actor->active_member == true)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00130$
	ld	a, (de)
	dec	a
	jr	NZ, 00130$
;bank7.c:281: set_win_tiles(10, 11, 9, 2, Map_Menu_ActorPLN0);
	ld	hl, #_Map_Menu_ActorPLN0
	push	hl
	ld	de, #0x0209
	push	de
	ld	de, #0x0b0a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:283: Draw_Name(10, 11, actor->name, false);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	ld	de, #0x0b0a
	push	de
	call	_Draw_Name
	add	sp, #5
;bank7.c:285: Draw_Number(actor->max_health, 15, 12);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0c0f
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:286: Draw_Number(actor->health, 14, 11);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0b0e
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
;bank7.c:288: if(actor->level > 9){Draw_Number(actor->level, 11, 12);}
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, #0x09
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00111$
	ld	de, #0x0c0b
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
	jr	00130$
00111$:
;bank7.c:289: else{Draw_Number(actor->level, 10, 12);}
	ld	de, #0x0c0a
	push	de
	push	bc
	call	_Draw_Number
	add	sp, #4
00130$:
;bank7.c:292: }
	add	sp, #7
	ret
;bank7.c:294: void Draw_Party()
;	---------------------------------
; Function Draw_Party
; ---------------------------------
_Draw_Party::
;bank7.c:296: Draw_Actor(Get_Actor(party[0]));
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:297: Draw_Actor(Get_Actor(party[1]));
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:298: Draw_Actor(Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:299: Draw_Actor(Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:300: }
	ret
;bank7.c:302: void Draw_Time()
;	---------------------------------
; Function Draw_Time
; ---------------------------------
_Draw_Time::
;bank7.c:304: if(CurrentMenu == menu_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	ret	NZ
;bank7.c:306: set_win_tiles(17, 16, 2, 1, Menu_Zero);
	ld	hl, #_Menu_Zero
	push	hl
	ld	de, #0x0102
	push	de
	ld	de, #0x1011
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:307: Draw_Number(clock_time_minute, 15, 16);
	ld	de, #0x100f
	push	de
	ld	hl, #_clock_time_minute
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Number
	add	sp, #4
;bank7.c:308: set_win_tiles(15, 16, 1, 1, Menu_Zero);
	ld	hl, #_Menu_Zero
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:309: Draw_Number(clock_time_hour, 14, 16);
	ld	de, #0x100e
	push	de
	ld	hl, #_clock_time_hour
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Number
	add	sp, #4
;bank7.c:311: }
	ret
;bank7.c:313: void Draw_Gold(UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Gold
; ---------------------------------
_Draw_Gold::
;bank7.c:315: set_win_tiles(tile_x + 4, tile_y, 1, 1, Char_Gold);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x04
	ld	hl, #_Char_Gold
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:316: Draw_Number(party_gold, tile_x, tile_y);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #_party_gold
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Number
	add	sp, #4
;bank7.c:317: }
	ret
;bank7.c:319: void Load_Font_Menu()
;	---------------------------------
; Function Load_Font_Menu
; ---------------------------------
_Load_Font_Menu::
;bank7.c:321: set_bkg_tileset(0, 120, Font_Menu);
	ld	hl, #_Font_Menu
	push	hl
	ld	a, #0x78
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tileset
	add	sp, #4
;bank7.c:322: }
	ret
;bank7.c:324: void Draw_Main_Menu()
;	---------------------------------
; Function Draw_Main_Menu
; ---------------------------------
_Draw_Main_Menu::
;bank7.c:326: fade_out();
	call	_fade_out
;bank7.c:328: CurrentMenu = menu_main;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x00
;bank7.c:329: selection_max = 5;
	ld	hl, #_selection_max
	ld	(hl), #0x05
;bank7.c:331: Load_Font_Menu();
	call	_Load_Font_Menu
;bank7.c:333: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;bank7.c:334: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;c:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;bank7.c:338: set_win_tiles(0, 0, 20, 18, Map_Menu_MainPLN0);
	ld	hl, #_Map_Menu_MainPLN0
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
;bank7.c:340: Draw_Gold(3, 16);
	ld	de, #0x1003
	push	de
	call	_Draw_Gold
	add	sp, #2
;bank7.c:342: Draw_Time();
	call	_Draw_Time
;bank7.c:344: Draw_Party();
	call	_Draw_Party
;bank7.c:348: set_win_tiles(1, 3 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	add	a, a
	ld	b, a
;bank7.c:346: if(CurrentSelection == selection_max)
	ld	a, (hl)
	ld	hl, #_selection_max
	sub	a, (hl)
	jr	NZ, 00102$
;bank7.c:348: set_win_tiles(1, 3 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	de, #_Menu_Pointer+0
	inc	b
	inc	b
	inc	b
	push	de
	ld	de, #0x0101
	push	de
	ld	c, #0x01
	push	bc
	call	_set_win_tiles
	add	sp, #6
	jp	_fade_in
00102$:
;bank7.c:352: set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	inc	b
	inc	b
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	c, #0x01
	push	bc
	call	_set_win_tiles
	add	sp, #6
;bank7.c:355: fade_in();
;bank7.c:356: }
	jp  _fade_in
;bank7.c:358: void Refresh_Main_Menu()
;	---------------------------------
; Function Refresh_Main_Menu
; ---------------------------------
_Refresh_Main_Menu::
;bank7.c:360: set_win_tiles(14, 8, 6, 5, Map_Menu_ConfirmBox_RefreshPLN0);
	ld	hl, #_Map_Menu_ConfirmBox_RefreshPLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x080e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:362: Draw_Actor(Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:363: Draw_Actor(Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Actor
	add	sp, #2
;bank7.c:365: set_win_tiles(0, 13, 20, 5, &Map_Menu_MainPLN0[260]);
	ld	hl, #(_Map_Menu_MainPLN0 + 0x0104)
	push	hl
	ld	de, #0x0514
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:367: Draw_Number(party_gold, 4, 16);
	ld	de, #0x1004
	push	de
	ld	hl, #_party_gold
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Number
	add	sp, #4
;bank7.c:369: Draw_Time();
	call	_Draw_Time
;bank7.c:371: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank7.c:372: }
	ret
;bank7.c:374: void Draw_Save_Message()
;	---------------------------------
; Function Draw_Save_Message
; ---------------------------------
_Draw_Save_Message::
;bank7.c:376: for(i = 0; i < 18; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00111$:
;bank7.c:378: if(joypad() & J_A || joypad() & J_START)
	call	_joypad
	bit	4, e
	jr	NZ, 00101$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00102$
00101$:
;bank7.c:380: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00103$
00102$:
;bank7.c:384: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00103$:
;bank7.c:387: set_win_tiles(1 + i, 14, 1, 1, &Message_SavePLN0[i]);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_Message_SavePLN0
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_i
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0e
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:376: for(i = 0; i < 18; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x92
	jr	C, 00111$
;bank7.c:390: for(i = 0; i < 16; i++)
	ld	(hl), #0x00
00113$:
;bank7.c:392: if(joypad() & J_A || joypad() & J_START)
	call	_joypad
	bit	4, e
	jr	NZ, 00106$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00107$
00106$:
;bank7.c:394: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00108$
00107$:
;bank7.c:398: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00108$:
;bank7.c:401: set_win_tiles(1 + i, 15, 1, 1, &Message_SavePLN0[i + 18]);
	ld	a, (#_i)
	add	a, #0x12
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_Message_SavePLN0
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_i
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:390: for(i = 0; i < 16; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x90
	jr	C, 00113$
;bank7.c:403: }
	ret
;bank7.c:405: void Draw_Menu_Save()
;	---------------------------------
; Function Draw_Menu_Save
; ---------------------------------
_Draw_Menu_Save::
;bank7.c:407: CurrentMenu = menu_main_save;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x07
;bank7.c:409: set_win_tiles(0, 13, 20, 5, Map_Menu_MessageBoxPLN0);
	ld	hl, #_Map_Menu_MessageBoxPLN0
	push	hl
	ld	de, #0x0514
	push	de
	ld	a, #0x0d
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank7.c:411: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank7.c:413: Draw_Save_Message();
	call	_Draw_Save_Message
;bank7.c:415: set_win_tiles(14, 8, 6, 5, Map_Menu_ConfirmBoxPLN0);
	ld	hl, #_Map_Menu_ConfirmBoxPLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x080e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:417: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank7.c:419: set_win_tiles(15, 9, 1, 1, Menu_Pointer);
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x090f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:420: }
	ret
;bank7.c:422: void Close_Menu()
;	---------------------------------
; Function Close_Menu
; ---------------------------------
_Close_Menu::
;bank7.c:424: fade_out();
	call	_fade_out
;bank7.c:426: Call_Load_Tileset(bank7, Tileset);
	ld	a, (#_Tileset)
	ld	d,a
	ld	e,#0x07
	push	de
	call	_Call_Load_Tileset
	add	sp, #2
;bank7.c:428: HIDE_WIN;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;bank7.c:429: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;c:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0xff
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;bank7.c:433: toggle_control(true);
	ld	a, #0x01
	push	af
	inc	sp
	call	_toggle_control
	inc	sp
;bank7.c:435: fade_in();
	call	_fade_in
;bank7.c:437: Gameplay();
;bank7.c:438: }
	jp  _Gameplay
;bank7.c:440: void Update_Menu_Joypad()
;	---------------------------------
; Function Update_Menu_Joypad
; ---------------------------------
_Update_Menu_Joypad::
	dec	sp
;bank7.c:442: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank7.c:444: if(Joy & J_UP)
	bit	2, (hl)
	jp	Z,00123$
;bank7.c:446: if(CurrentMenu == menu_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jp	NZ, 00120$
;bank7.c:448: if(CurrentSelection == 0)
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;bank7.c:450: CurrentSelection = 5;
	ld	(hl), #0x05
	jr	00103$
00102$:
;bank7.c:454: CurrentSelection -= 1;
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
00103$:
;bank7.c:459: set_win_tiles(1, 5 + CurrentSelection * 2, 1, 1, Menu_Background);
	ld	a, (#_CurrentSelection)
	add	a, a
	ldhl	sp,	#0
	ld	(hl), a
;bank7.c:457: if(CurrentSelection == 4)
	ld	a, (#_CurrentSelection)
	sub	a, #0x04
	jr	NZ, 00108$
;bank7.c:459: set_win_tiles(1, 5 + CurrentSelection * 2, 1, 1, Menu_Background);
	ld	bc, #_Menu_Background+0
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x05
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
;bank7.c:461: set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	bc, #_Menu_Pointer+0
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	add	a, a
	add	a, #0x02
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
	jr	00112$
00108$:
;bank7.c:463: else if(CurrentSelection == 5)
	ld	a, (#_CurrentSelection)
	sub	a, #0x05
	jr	NZ, 00105$
;bank7.c:465: set_win_tiles(1, 2, 1, 1, Menu_Background);
	ld	hl, #_Menu_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:467: set_win_tiles(1, 13, 1, 1, Menu_Pointer);
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00112$
00105$:
;bank7.c:471: set_win_tiles(1, 4 + CurrentSelection * 2, 1, 1, Menu_Background);
	ld	bc, #_Menu_Background+0
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	inc	a
	inc	a
	inc	a
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
;bank7.c:473: set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	bc, #_Menu_Pointer+0
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	add	a, a
	add	a, #0x02
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
;bank7.c:476: while(joypad() & J_UP)
00112$:
	call	_joypad
	bit	2, e
	jr	Z, 00123$
;bank7.c:478: wait_vbl_done();
	call	_wait_vbl_done
;bank7.c:480: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00112$
;bank7.c:482: Close_Menu();
	call	_Close_Menu
	jr	00112$
00120$:
;bank7.c:486: else if(CurrentMenu == menu_main_save)
	ld	a, (#_CurrentMenu)
	sub	a, #0x07
	jr	NZ, 00123$
;bank7.c:488: if(menu_y > 0)
	ld	hl, #_menu_y
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
;bank7.c:490: set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Background);
	ld	bc, #_Menu_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x09
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:492: menu_y -= 1;
	ld	hl, #_menu_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank7.c:494: set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Pointer);
	ld	bc, #_Menu_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x09
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
00123$:
;bank7.c:499: if(Joy & J_DOWN)
	ld	a, (#_Joy)
	bit	3, a
	jp	Z,00146$
;bank7.c:501: if(CurrentMenu == menu_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jp	NZ, 00143$
;bank7.c:503: if(CurrentSelection == 5)
	ld	a, (#_CurrentSelection)
	sub	a, #0x05
	jr	NZ, 00125$
;bank7.c:505: CurrentSelection = 0;
	ld	hl, #_CurrentSelection
	ld	(hl), #0x00
	jr	00126$
00125$:
;bank7.c:509: CurrentSelection += 1;
	ld	hl, #_CurrentSelection
	inc	(hl)
00126$:
;bank7.c:514: set_win_tiles(1, CurrentSelection * 2, 1, 1, Menu_Background);
	ld	hl, #_CurrentSelection
	ld	a, (hl)
	add	a, a
	ld	b, a
;bank7.c:512: if(CurrentSelection == 5)
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00131$
;bank7.c:514: set_win_tiles(1, CurrentSelection * 2, 1, 1, Menu_Background);
	ld	hl, #_Menu_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	c, #0x01
	push	bc
	call	_set_win_tiles
	add	sp, #6
;bank7.c:516: set_win_tiles(1, 3 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	a, (#_CurrentSelection)
	add	a, a
	add	a, #0x03
	ld	hl, #_Menu_Pointer
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
	jr	00135$
00131$:
;bank7.c:518: else if(CurrentSelection == 0)
	ld	a, (#_CurrentSelection)
	or	a, a
	jr	NZ, 00128$
;bank7.c:520: set_win_tiles(1, 13, 1, 1, Menu_Background);
	ld	hl, #_Menu_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:522: set_win_tiles(1, 2, 1, 1, Menu_Pointer);
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_tiles
	add	sp, #6
	jr	00135$
00128$:
;bank7.c:526: set_win_tiles(1, CurrentSelection * 2, 1, 1, Menu_Background);
	ld	hl, #_Menu_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	c, #0x01
	push	bc
	call	_set_win_tiles
	add	sp, #6
;bank7.c:528: set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
	ld	a, (#_CurrentSelection)
	add	a, a
	add	a, #0x02
	ld	hl, #_Menu_Pointer
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
;bank7.c:531: while(joypad() & J_DOWN)
00135$:
	call	_joypad
	bit	3, e
	jr	Z, 00146$
;bank7.c:533: wait_vbl_done();
	call	_wait_vbl_done
;bank7.c:535: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00135$
;bank7.c:537: Close_Menu();
	call	_Close_Menu
	jr	00135$
00143$:
;bank7.c:541: else if(CurrentMenu == menu_main_save)
	ld	a, (#_CurrentMenu)
	sub	a, #0x07
	jr	NZ, 00146$
;bank7.c:543: if(menu_y < 1)
;bank7.c:545: set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Background);
	ld	a, (#_menu_y)
	cp	a,#0x01
	jr	NC, 00146$
	add	a, a
	add	a, #0x09
	ld	hl, #_Menu_Background
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:547: menu_y += 1;
	ld	hl, #_menu_y
	ld	a, (hl)
	inc	a
;bank7.c:549: set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Pointer);
	ld	(hl), a
	add	a, a
	add	a, #0x09
	ld	hl, #_Menu_Pointer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
00146$:
;bank7.c:554: if(Joy & J_B)
	ld	a, (#_Joy)
	bit	5, a
	jr	Z, 00156$
;bank7.c:556: if(CurrentMenu == menu_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jr	NZ, 00153$
;bank7.c:558: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:559: Close_Menu();
	call	_Close_Menu
	jr	00156$
00153$:
;bank7.c:561: else if(CurrentMenu == menu_main_save)
	ld	a, (#_CurrentMenu)
	sub	a, #0x07
	jr	NZ, 00156$
;bank7.c:563: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:565: CurrentMenu = menu_main;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x00
;bank7.c:567: Refresh_Main_Menu();
	call	_Refresh_Main_Menu
;bank7.c:569: set_win_tiles(1, 13, 1, 1, Menu_Pointer);
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:571: while(joypad() & J_B)
00147$:
	call	_joypad
	bit	5, e
	jr	Z, 00156$
;bank7.c:573: wait_vbl_done();
	call	_wait_vbl_done
	jr	00147$
00156$:
;bank7.c:444: if(Joy & J_UP)
	ld	a, (#_Joy)
;bank7.c:578: if(Joy & J_A || Joy & J_START)
	bit	4, a
	jr	NZ, 00185$
	rlca
	jp	NC,00188$
00185$:
;bank7.c:580: if(CurrentMenu == menu_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jp	NZ, 00183$
;bank7.c:582: if(CurrentSelection == 0)
	ld	a, (#_CurrentSelection)
	or	a, a
	jr	NZ, 00174$
;bank7.c:584: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:585: Call_Menu_Item(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Menu_Item
	inc	sp
	jp	00188$
00174$:
;bank7.c:587: else if(CurrentSelection == 1)
	ld	a, (#_CurrentSelection)
	dec	a
	jr	NZ, 00171$
;bank7.c:589: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:590: Call_Menu_Equip(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Menu_Equip
	inc	sp
	jp	00188$
00171$:
;bank7.c:592: else if(CurrentSelection == 2)
	ld	a, (#_CurrentSelection)
	sub	a, #0x02
	jr	NZ, 00168$
;bank7.c:594: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:595: Call_Menu_Skills(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Menu_Skills
	inc	sp
	jp	00188$
00168$:
;bank7.c:597: else if(CurrentSelection == 3)
	ld	a, (#_CurrentSelection)
	sub	a, #0x03
	jr	NZ, 00165$
;bank7.c:599: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:600: Call_Menu_Status(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Menu_Status
	inc	sp
	jr	00188$
00165$:
;bank7.c:602: else if(CurrentSelection == 5)
	ld	a, (#_CurrentSelection)
	sub	a, #0x05
	jr	NZ, 00188$
;bank7.c:604: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:606: menu_y = 0;
	ld	hl, #_menu_y
	ld	(hl), #0x00
;bank7.c:607: Draw_Menu_Save();
	call	_Draw_Menu_Save
;bank7.c:609: while(joypad() & J_A || joypad() & J_START || joypad() & J_B)
00159$:
	call	_joypad
	bit	4, e
	jr	NZ, 00160$
	call	_joypad
	ld	a, e
	rlca
	jr	C, 00160$
	call	_joypad
	bit	5, e
	jr	Z, 00188$
00160$:
;bank7.c:611: wait_vbl_done();
	call	_wait_vbl_done
	jr	00159$
00183$:
;bank7.c:615: else if(CurrentMenu == menu_main_save)
	ld	a, (#_CurrentMenu)
	sub	a, #0x07
	jr	NZ, 00188$
;bank7.c:617: Call_Play_Confirm(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank7.c:619: CurrentMenu = menu_main;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x00
;bank7.c:621: Save_Variables();
	call	_Save_Variables
;bank7.c:623: Refresh_Main_Menu();
	call	_Refresh_Main_Menu
;bank7.c:625: set_win_tiles(1, 13, 1, 1, Menu_Pointer);
	ld	hl, #_Menu_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank7.c:627: while(joypad() & J_A || joypad() & J_START)
00177$:
	call	_joypad
	bit	4, e
	jr	NZ, 00178$
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00188$
00178$:
;bank7.c:629: wait_vbl_done();
	call	_wait_vbl_done
	jr	00177$
00188$:
;bank7.c:633: }
	inc	sp
	ret
;bank7.c:635: void Menu_Main()
;	---------------------------------
; Function Menu_Main
; ---------------------------------
_Menu_Main::
;bank7.c:637: while(joypad() & J_B)
00101$:
	call	_joypad
	bit	5, e
	jr	Z, 00105$
;bank7.c:639: wait_vbl_done();
	call	_wait_vbl_done
	jr	00101$
;bank7.c:642: while(true)
00105$:
;bank7.c:644: wait_vbl_done();
	call	_wait_vbl_done
;bank7.c:646: Draw_Time();
	call	_Draw_Time
;bank7.c:647: Update_Menu_Joypad();
	call	_Update_Menu_Joypad
;bank7.c:649: }
	jr	00105$
;bank7.c:651: void Load_Menu_Main()
;	---------------------------------
; Function Load_Menu_Main
; ---------------------------------
_Load_Menu_Main::
;bank7.c:653: Draw_Main_Menu();
	call	_Draw_Main_Menu
;bank7.c:655: while(joypad() & J_A || joypad() & J_START || joypad() & J_B)
00103$:
	call	_joypad
	bit	4, e
	jr	NZ, 00104$
	call	_joypad
	ld	a, e
	rlca
	jr	C, 00104$
	call	_joypad
	bit	5, e
	jp	Z,_Menu_Main
00104$:
;bank7.c:657: wait_vbl_done();
	call	_wait_vbl_done
;bank7.c:660: Menu_Main();
;bank7.c:661: }
	jr	00103$
	.area _CODE_7
	.area _CABS (ABS)
