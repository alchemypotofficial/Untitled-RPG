;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank17
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Draw_Troop
	.globl _Execute_Skill
	.globl _Execute_Skill_Fireball
	.globl _Execute_Skill_Hit
	.globl _Get_Next_Target
	.globl _Draw_Skills_Name
	.globl _Draw_Skill_Name
	.globl _Load_Damage_Sprite
	.globl _Clear_Damage
	.globl _Bounce_Damage_Sprite
	.globl _Draw_End_Message
	.globl _Draw_Gold_Message
	.globl _Draw_Experience_Message
	.globl _Draw_Skill_Message
	.globl _Draw_Skill_Damage
	.globl _Move_Damage
	.globl _Draw_Damage_Message
	.globl _Draw_Skill_Cost
	.globl _Draw_Skill_Number
	.globl _Add_Ability_Points
	.globl _Set_Actor_Skills
	.globl _Get_Skill_Cost
	.globl _Get_Name_Length
	.globl _Get_Name
	.globl _Get_Enemy_Dummy
	.globl _Call_Load_Battle_Message_Box
	.globl _Get_Skill
	.globl _Get_Enemy
	.globl _Get_Equip
	.globl _Get_Actor
	.globl _set_bkg_tileset
	.globl _shake_screen
	.globl _performant_delay
	.globl _rand
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _waitpad
	.globl _joypad
	.globl _Skill_Gold
	.globl _Skill_Party
	.globl _Skill_The
	.globl _Skill_Took
	.globl _Skill_On
	.globl _Skill_Damaged
	.globl _Skill_Experience
	.globl _Skill_Gained
	.globl _Skill_Period
	.globl _Map_Troop_Slime1PLN1
	.globl _Map_Troop_Slime1PLN0
	.globl _Map_Troop_Bee2PLN1
	.globl _Map_Troop_Bee2PLN0
	.globl _Map_Troop_Wolf1PLN1
	.globl _Map_Troop_Wolf1PLN0
	.globl _Map_Troop_Bee1PLN1
	.globl _Map_Troop_Bee1PLN0
	.globl _Tiles_Skill_Clear
	.globl _Tiles_Number
	.globl _Tiles_Troop_Slime1
	.globl _Tiles_Troop_Wolf1
	.globl _Tiles_Troop_Bee1
	.globl _skill_blizzard
	.globl _skill_thunder
	.globl _skill_fireball
	.globl _skill_cure
	.globl _skill_reckless_charge
	.globl _skill_use_item
	.globl _skill_hit
	.globl _skill_null
	.globl _message_ability
	.globl _message_magic
	.globl _message_hit
	.globl _name_blizzard
	.globl _name_thunder
	.globl _name_fireball
	.globl _name_cure
	.globl _name_reckless_charge
	.globl _name_hit
	.globl _name_skill_null
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
	.area _CODE_17
;bank17.c:131: GameEnemyDummy* Get_Enemy_Dummy(UBYTE enemy_dummy_id)
;	---------------------------------
; Function Get_Enemy_Dummy
; ---------------------------------
_Get_Enemy_Dummy::
;bank17.c:133: switch(enemy_dummy_id)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;bank17.c:135: case 0:
00101$:
;bank17.c:136: return &enemy_dummy_1;
	ld	de, #_enemy_dummy_1
	ret
;bank17.c:138: case 1:
00102$:
;bank17.c:139: return &enemy_dummy_2;
	ld	de, #_enemy_dummy_2
	ret
;bank17.c:141: case 2:
00103$:
;bank17.c:142: return &enemy_dummy_3;
	ld	de, #_enemy_dummy_3
	ret
;bank17.c:144: default:
00104$:
;bank17.c:145: return &enemy_dummy_1;
	ld	de, #_enemy_dummy_1
;bank17.c:147: }
;bank17.c:148: }
	ret
_name_skill_null:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_name_hit:
	.db #0x42	; 66	'B'
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_name_reckless_charge:
	.db #0x4c	; 76	'L'
	.db #0x55	; 85	'U'
	.db #0x3d	; 61
	.db #0x1d	; 29
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x1c	; 28
	.db #0x1a	; 26
_name_cure:
	.db #0x3d	; 61
	.db #0x2b	; 43
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_name_fireball:
	.db #0x40	; 64
	.db #0x1e	; 30
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x21	; 33
	.db #0x21	; 33
_name_thunder:
	.db #0x4e	; 78	'N'
	.db #0x1d	; 29
	.db #0x2b	; 43
	.db #0x23	; 35
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x27	; 39
	.db #0x01	; 1
_name_blizzard:
	.db #0x3c	; 60
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x19	; 25
_message_hit:
	.db #0x16	; 22
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x1a	; 26
	.db #0x19	; 25
	.db #0x01	; 1
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_message_magic:
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x01	; 1
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_message_ability:
	.db #0x2b	; 43
	.db #0x29	; 41
	.db #0x1a	; 26
	.db #0x29	; 41
	.db #0x01	; 1
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_skill_null:
	.dw _name_skill_null
	.db #0x00	; 0
	.dw _message_hit
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_skill_hit:
	.dw _name_hit
	.db #0x03	; 3
	.dw _message_hit
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_skill_use_item:
	.dw _name_hit
	.db #0x03	; 3
	.dw _name_hit
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_skill_reckless_charge:
	.dw _name_reckless_charge
	.db #0x08	; 8
	.dw _message_ability
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x01	; 1
_skill_cure:
	.dw _name_cure
	.db #0x04	; 4
	.dw _message_magic
	.db #0x05	; 5
	.db #0x17	; 23
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x02	; 2
_skill_fireball:
	.dw _name_fireball
	.db #0x08	; 8
	.dw _message_magic
	.db #0x05	; 5
	.db #0x2b	; 43
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x03	; 3
_skill_thunder:
	.dw _name_thunder
	.db #0x07	; 7
	.dw _message_magic
	.db #0x05	; 5
	.db #0x2c	; 44
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x03	; 3
_skill_blizzard:
	.dw _name_blizzard
	.db #0x08	; 8
	.dw _message_magic
	.db #0x05	; 5
	.db #0x2d	; 45
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x03	; 3
_Tiles_Troop_Bee1:
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xb0	; 176
	.db #0x80	; 128
	.db #0xbc	; 188
	.db #0x80	; 128
	.db #0x98	; 152
	.db #0x80	; 128
	.db #0x43	; 67	'C'
	.db #0x40	; 64
	.db #0x31	; 49	'1'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x4f	; 79	'O'
	.db #0x41	; 65	'A'
	.db #0x9d	; 157
	.db #0x81	; 129
	.db #0xb9	; 185
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xb7	; 183
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xcd	; 205
	.db #0xce	; 206
	.db #0x29	; 41
	.db #0x2f	; 47
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0xa7	; 167
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0x67	; 103	'g'
	.db #0x38	; 56	'8'
	.db #0x92	; 146
	.db #0x9c	; 156
	.db #0x68	; 104	'h'
	.db #0x7e	; 126
	.db #0x89	; 137
	.db #0xfe	; 254
	.db #0xd5	; 213
	.db #0xf6	; 246
	.db #0x54	; 84	'T'
	.db #0x77	; 119	'w'
	.db #0x2e	; 46
	.db #0x31	; 49	'1'
	.db #0x72	; 114	'r'
	.db #0x7d	; 125
	.db #0xec	; 236
	.db #0xef	; 239
	.db #0x47	; 71	'G'
	.db #0x7f	; 127
	.db #0xe6	; 230
	.db #0xdf	; 223
	.db #0x67	; 103	'g'
	.db #0xdf	; 223
	.db #0xfc	; 252
	.db #0x57	; 87	'W'
	.db #0xfd	; 253
	.db #0x66	; 102	'f'
	.db #0x78	; 120	'x'
	.db #0x6f	; 111	'o'
	.db #0x51	; 81	'Q'
	.db #0x5e	; 94
	.db #0x5c	; 92
	.db #0x5f	; 95
	.db #0xd0	; 208
	.db #0x5f	; 95
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xb3	; 179
	.db #0x73	; 115	's'
	.db #0x94	; 148
	.db #0xf4	; 244
	.db #0xb8	; 184
	.db #0x78	; 120	'x'
	.db #0xe5	; 229
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xfc	; 252
	.db #0xe6	; 230
	.db #0x1c	; 28
	.db #0x49	; 73	'I'
	.db #0x39	; 57	'9'
	.db #0x16	; 22
	.db #0x7e	; 126
	.db #0x91	; 145
	.db #0x7f	; 127
	.db #0xab	; 171
	.db #0x6f	; 111	'o'
	.db #0x2a	; 42
	.db #0xee	; 238
	.db #0x74	; 116	't'
	.db #0x8c	; 140
	.db #0x4e	; 78	'N'
	.db #0xbe	; 190
	.db #0x37	; 55	'7'
	.db #0xf7	; 247
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0x67	; 103	'g'
	.db #0xfb	; 251
	.db #0xe6	; 230
	.db #0xfb	; 251
	.db #0x3f	; 63
	.db #0xea	; 234
	.db #0xbf	; 191
	.db #0x66	; 102	'f'
	.db #0x1e	; 30
	.db #0xf6	; 246
	.db #0x8a	; 138
	.db #0x7a	; 122	'z'
	.db #0x3a	; 58
	.db #0xfa	; 250
	.db #0x0b	; 11
	.db #0xfa	; 250
	.db #0xd1	; 209
	.db #0x31	; 49	'1'
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x3d	; 61
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0x8c	; 140
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xc4	; 196
	.db #0x84	; 132
	.db #0xf2	; 242
	.db #0x82	; 130
	.db #0xb9	; 185
	.db #0x81	; 129
	.db #0x9d	; 157
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xed	; 237
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Troop_Wolf1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x13	; 19
	.db #0x1d	; 29
	.db #0x13	; 19
	.db #0x1d	; 29
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xce	; 206
	.db #0x71	; 113	'q'
	.db #0xf1	; 241
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0x8f	; 143
	.db #0x40	; 64
	.db #0x8f	; 143
	.db #0x43	; 67	'C'
	.db #0x8c	; 140
	.db #0xf3	; 243
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0x06	; 6
	.db #0xf3	; 243
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x8f	; 143
	.db #0x5b	; 91
	.db #0x8b	; 139
	.db #0xf9	; 249
	.db #0x89	; 137
	.db #0x7a	; 122	'z'
	.db #0x8b	; 139
	.db #0x7a	; 122	'z'
	.db #0x8b	; 139
	.db #0x79	; 121	'y'
	.db #0x89	; 137
	.db #0x34	; 52	'4'
	.db #0xcc	; 204
	.db #0xba	; 186
	.db #0xc6	; 198
	.db #0xd5	; 213
	.db #0xe1	; 225
	.db #0x34	; 52	'4'
	.db #0x31	; 49	'1'
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xf0	; 240
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x8c	; 140
	.db #0xfc	; 252
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xcb	; 203
	.db #0xfc	; 252
	.db #0x17	; 23
	.db #0x8f	; 143
	.db #0x04	; 4
	.db #0x2e	; 46
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x23	; 35
	.db #0x3f	; 63
	.db #0xf9	; 249
	.db #0x76	; 118	'v'
	.db #0xf9	; 249
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xf3	; 243
	.db #0x92	; 146
	.db #0xde	; 222
	.db #0xad	; 173
	.db #0xf3	; 243
	.db #0xad	; 173
	.db #0xa1	; 161
	.db #0xde	; 222
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x61	; 97	'a'
	.db #0x9e	; 158
	.db #0x73	; 115	's'
	.db #0xed	; 237
	.db #0xa1	; 161
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xf7	; 247
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x12	; 18
	.db #0x73	; 115	's'
	.db #0x9e	; 158
	.db #0xf3	; 243
	.db #0x9e	; 158
	.db #0xde	; 222
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xe2	; 226
	.db #0xfe	; 254
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0xbc	; 188
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x98	; 152
	.db #0xf7	; 247
	.db #0xcf	; 207
	.db #0x7a	; 122	'z'
	.db #0x61	; 97	'a'
	.db #0x3a	; 58
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0xb8	; 184
	.db #0xc8	; 200
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0xb8	; 184
	.db #0x08	; 8
	.db #0xb8	; 184
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Troop_Slime1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1c	; 28
	.db #0x24	; 36
	.db #0x38	; 56	'8'
	.db #0x26	; 38
	.db #0x38	; 56	'8'
	.db #0x43	; 67	'C'
	.db #0x7c	; 124
	.db #0x49	; 73	'I'
	.db #0x7e	; 126
	.db #0x6c	; 108	'l'
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0x70	; 112	'p'
	.db #0xee	; 238
	.db #0xf0	; 240
	.db #0x2f	; 47
	.db #0xf0	; 240
	.db #0x47	; 71	'G'
	.db #0xf8	; 248
	.db #0xe3	; 227
	.db #0xfc	; 252
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x70	; 112	'p'
	.db #0x0f	; 15
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe8	; 232
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0x13	; 19
	.db #0x2b	; 43
	.db #0x36	; 54	'6'
	.db #0x22	; 34
	.db #0x3e	; 62
	.db #0x26	; 38
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0xd2	; 210
	.db #0xde	; 222
	.db #0x23	; 35
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0x1f	; 31
	.db #0x31	; 49	'1'
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0x7a	; 122	'z'
	.db #0x07	; 7
	.db #0xc1	; 193
	.db #0x0f	; 15
	.db #0xc8	; 200
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x8c	; 140
	.db #0x7f	; 127
	.db #0x67	; 103	'g'
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0x18	; 24
	.db #0xc8	; 200
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0xd8	; 216
	.db #0xc8	; 200
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xa8	; 168
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xb2	; 178
	.db #0xce	; 206
	.db #0x51	; 81	'Q'
	.db #0x8f	; 143
	.db #0x71	; 113	'q'
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Number:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x29	; 41
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x7c	; 124
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x7c	; 124
	.db #0x64	; 100	'd'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x7c	; 124
	.db #0x64	; 100	'd'
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7f	; 127
	.db #0x79	; 121	'y'
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0xff	; 255
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x6f	; 111	'o'
	.db #0x69	; 105	'i'
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x6f	; 111	'o'
	.db #0x69	; 105	'i'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xfe	; 254
	.db #0x92	; 146
	.db #0xfe	; 254
	.db #0x32	; 50	'2'
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
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
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x7f	; 127
	.db #0x79	; 121	'y'
	.db #0x6f	; 111	'o'
	.db #0x69	; 105	'i'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x22	; 34
	.db #0x7c	; 124
	.db #0x4c	; 76	'L'
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xef	; 239
	.db #0x29	; 41
	.db #0xcf	; 207
	.db #0xc9	; 201
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x32	; 50	'2'
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Tiles_Skill_Clear:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Bee1PLN0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Bee1PLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Wolf1PLN0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x90	; 144
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x8e	; 142
	.db #0x92	; 146
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x93	; 147
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Wolf1PLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Bee2PLN0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Bee2PLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Slime1PLN0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x86	; 134
	.db #0x8a	; 138
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x8b	; 139
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Troop_Slime1PLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Skill_Period:
	.db #0x55	; 85	'U'
_Skill_Gained:
	.db #0x1c	; 28
	.db #0x16	; 22
	.db #0x1e	; 30
	.db #0x23	; 35
	.db #0x1a	; 26
	.db #0x19	; 25
_Skill_Experience:
	.db #0x1a	; 26
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x1a	; 26
	.db #0x27	; 39
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x23	; 35
	.db #0x18	; 24
	.db #0x1a	; 26
_Skill_Damaged:
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x22	; 34
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db 0x00
_Skill_On:
	.db #0x24	; 36
	.db #0x23	; 35
_Skill_Took:
	.db #0x2a	; 42
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x20	; 32
_Skill_The:
	.db #0x4e	; 78	'N'
	.db #0x1d	; 29
	.db #0x1a	; 26
_Skill_Party:
	.db #0x25	; 37
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x2a	; 42
	.db #0x2f	; 47
_Skill_Gold:
	.db #0x1c	; 28
	.db #0x24	; 36
	.db #0x21	; 33
	.db #0x19	; 25
;bank17.c:150: unsigned char* Get_Name(UBYTE target_id)
;	---------------------------------
; Function Get_Name
; ---------------------------------
_Get_Name::
;bank17.c:152: switch(target_id)
	ld	a, #0x06
	ldhl	sp,	#2
	sub	a, (hl)
	jp	C, 00108$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00117$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00117$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
;bank17.c:154: case 0:
00101$:
;bank17.c:155: return Get_Actor(party[0])->name;
	ld	a, (#_party + 0)
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
	ld	e, c
	ld	d, b
	ret
;bank17.c:157: case 1:
00102$:
;bank17.c:158: return Get_Actor(party[1])->name;
	ld	a, (#(_party + 0x0001) + 0)
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
	ld	e, c
	ld	d, b
	ret
;bank17.c:160: case 2:
00103$:
;bank17.c:161: return Get_Actor(party[2])->name;
	ld	a, (#(_party + 0x0002) + 0)
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
	ld	e, c
	ld	d, b
	ret
;bank17.c:163: case 3:
00104$:
;bank17.c:164: return Get_Actor(party[3])->name;
	ld	a, (#(_party + 0x0003) + 0)
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
	ld	e, c
	ld	d, b
	ret
;bank17.c:166: case 4:
00105$:
;bank17.c:167: return Get_Enemy(enemy[0])->name;
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ret
;bank17.c:169: case 5:
00106$:
;bank17.c:170: return Get_Enemy(enemy[1])->name;
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ret
;bank17.c:172: case 6:
00107$:
;bank17.c:173: return Get_Enemy(enemy[2])->name;
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ret
;bank17.c:175: default:
00108$:
;bank17.c:176: return Get_Actor(party[0])->name;
	ld	a, (#_party + 0)
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
	ld	e, c
	ld	d, b
;bank17.c:178: }
;bank17.c:179: }
	ret
;bank17.c:181: UBYTE Get_Name_Length(UBYTE target_id)
;	---------------------------------
; Function Get_Name_Length
; ---------------------------------
_Get_Name_Length::
;bank17.c:183: switch(target_id)
	ld	a, #0x06
	ldhl	sp,	#2
	sub	a, (hl)
	jp	C, 00108$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00117$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00117$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
;bank17.c:185: case 0:
00101$:
;bank17.c:186: return Get_Actor(party[0])->length;
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:188: case 1:
00102$:
;bank17.c:189: return Get_Actor(party[1])->length;
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:191: case 2:
00103$:
;bank17.c:192: return Get_Actor(party[2])->length;
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:194: case 3:
00104$:
;bank17.c:195: return Get_Actor(party[3])->length;
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:197: case 4:
00105$:
;bank17.c:198: return Get_Enemy(enemy[0])->length;
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:200: case 5:
00106$:
;bank17.c:201: return Get_Enemy(enemy[1])->length;
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:203: case 6:
00107$:
;bank17.c:204: return Get_Enemy(enemy[2])->length;
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	ret
;bank17.c:206: default:
00108$:
;bank17.c:207: return Get_Actor(party[0])->length;
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;bank17.c:209: }
;bank17.c:210: }
	ret
;bank17.c:212: UBYTE Get_Skill_Cost(GameSkill* skill)
;	---------------------------------
; Function Get_Skill_Cost
; ---------------------------------
_Get_Skill_Cost::
;bank17.c:214: return skill->mana_cost;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0007
	add	hl, de
	ld	e, (hl)
;bank17.c:215: }
	ret
;bank17.c:217: void Set_Actor_Skills(GameActor* actor)
;	---------------------------------
; Function Set_Actor_Skills
; ---------------------------------
_Set_Actor_Skills::
	add	sp, #-10
;bank17.c:219: u_y = 0;
	ld	hl, #_u_y
	ld	(hl), #0x00
;bank17.c:221: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	ld	(hl), #0x00
	ldhl	sp,#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0024
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
00115$:
;bank17.c:223: actor->skills[u_x] = 0;
	ld	hl, #_u_x
	ld	e, (hl)
;c
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;bank17.c:221: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00115$
;bank17.c:226: if(actor->skill_ap[Get_Equip(actor->equipped[0])->skill_id] < Get_Skill(Get_Equip(actor->equipped[0])->skill_id)->required_ap)
	ld	hl, #0x002e
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #0x001e
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
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0010
	add	hl, de
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	dec	hl
	dec	hl
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
	ld	hl, #0x0010
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00103$
;bank17.c:228: actor->skills[0] = Get_Equip(actor->equipped[0])->skill_id;
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
	ld	hl, #0x0010
	add	hl, de
	ld	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
00103$:
;bank17.c:231: for(u_x = 0; u_x < 119; u_x++)
	ld	hl, #_u_x
	ld	(hl), #0x00
	ld	hl, #0x0024
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
00117$:
;bank17.c:233: if(actor->skill_ap[u_x] == Get_Skill(u_x)->required_ap && Get_Skill(u_x)->required_ap > 0 && Get_Skill(u_x)->class == actor->class)
	ld	hl, #_u_x
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	a, (bc)
	sub	a, e
	jr	NZ, 00118$
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00118$
	ld	a, (#_u_x)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x000d
	add	hl, de
	ld	c, (hl)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	jr	NZ, 00118$
;bank17.c:235: actor->skills[1 + u_y] = u_x;
	ld	hl, #_u_y
	ld	e, (hl)
	inc	e
;c
	ld	d, #0x00
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_u_x)
	ld	(bc), a
;bank17.c:236: u_y += 1;
	ld	hl, #_u_y
	inc	(hl)
;bank17.c:238: if(u_y > 9)
	ld	a, #0x09
	sub	a, (hl)
	jr	C, 00110$
;bank17.c:240: break;
00118$:
;bank17.c:231: for(u_x = 0; u_x < 119; u_x++)
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x77
	jr	C, 00117$
00110$:
;bank17.c:245: for(u_y = 0; u_y < 10; u_y++)
	ld	hl, #_u_y
	ld	(hl), #0x00
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), e
00121$:
;bank17.c:247: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	ld	(hl), #0x00
00119$:
;bank17.c:223: actor->skills[u_x] = 0;
	ld	a, (#_u_x)
	ldhl	sp,	#6
	ld	(hl), a
;bank17.c:249: if(actor->skills[u_x] < actor->skills[u_y])
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_u_y)
	ldhl	sp,	#7
;c
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	jr	NC, 00120$
;bank17.c:251: u_i = actor->skills[u_y];
;c
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_u_i),a
;bank17.c:252: actor->skills[u_y] = actor->skills[u_x];
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;bank17.c:253: actor->skills[u_x] = u_i;
	ld	hl, #_u_x
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_u_i)
	ld	(bc), a
00120$:
;bank17.c:247: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00119$
;bank17.c:245: for(u_y = 0; u_y < 10; u_y++)
	ld	hl, #_u_y
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00121$
;bank17.c:257: }
	add	sp, #10
	ret
;bank17.c:259: void Add_Ability_Points(GameActor* actor, UBYTE points)
;	---------------------------------
; Function Add_Ability_Points
; ---------------------------------
_Add_Ability_Points::
	add	sp, #-10
;bank17.c:261: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0024
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
00108$:
;bank17.c:263: u_y = actor->skills[u_x];
	ld	hl, #_u_x
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
;bank17.c:265: if(u_y > 0 && actor->skill_ap[u_y] < Get_Skill(u_y)->required_ap)
	ld	(#_u_y),a
	or	a, a
	jp	Z, 00109$
;c
	pop	de
	push	de
	ld	hl, #0x002e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #_u_y
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, (#_u_y)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	e, (hl)
	ld	a, (bc)
	sub	a, e
	jr	NC, 00109$
;bank17.c:267: if((actor->skill_ap[u_y] + points) < Get_Skill(u_y)->required_ap)
	ld	hl, #_u_y
	ld	e, (hl)
;c
	ld	d, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#14
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (#_u_y)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;bank17.c:265: if(u_y > 0 && actor->skill_ap[u_y] < Get_Skill(u_y)->required_ap)
	ld	hl, #_u_y
	ld	e, (hl)
;bank17.c:269: actor->skill_ap[u_y] += points;   
;c
	ld	d, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
;bank17.c:267: if((actor->skill_ap[u_y] + points) < Get_Skill(u_y)->required_ap)
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00132$
	bit	7, d
	jr	NZ, 00133$
	cp	a, a
	jr	00133$
00132$:
	bit	7, d
	jr	Z, 00133$
	scf
00133$:
	jr	NC, 00102$
;bank17.c:269: actor->skill_ap[u_y] += points;   
	ld	a, (bc)
	ldhl	sp,	#14
	add	a, (hl)
	ld	(bc), a
	jr	00109$
00102$:
;bank17.c:273: actor->skill_ap[u_y] = Get_Skill(u_y)->required_ap;
	push	bc
	ld	a, (#_u_y)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	pop	bc
	ld	hl, #0x000b
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
00109$:
;bank17.c:261: for(u_x = 0; u_x < 10; u_x++)
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jp	C, 00108$
;bank17.c:277: }
	add	sp, #10
	ret
;bank17.c:279: void Draw_Skill_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skill_Number
; ---------------------------------
_Draw_Skill_Number::
;bank17.c:281: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank17.c:283: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:285: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:287: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank17.c:289: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank17.c:287: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank17.c:292: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank17.c:294: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank17.c:295: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank17.c:298: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:299: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:301: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank17.c:303: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:304: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank17.c:307: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:308: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:310: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank17.c:312: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:313: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank17.c:316: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank17.c:318: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank17.c:320: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank17.c:321: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank17.c:322: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank17.c:323: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank17.c:327: set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank17.c:325: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank17.c:327: set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
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
	call	_set_bkg_tiles
	add	sp, #6
	ret
00118$:
;bank17.c:329: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank17.c:331: set_bkg_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
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
	call	_set_bkg_tiles
	add	sp, #6
	ret
00115$:
;bank17.c:333: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank17.c:335: set_bkg_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
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
	call	_set_bkg_tiles
	add	sp, #6
	ret
00112$:
;bank17.c:339: set_bkg_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
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
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:342: }
	ret
;bank17.c:344: void Draw_Skill_Cost(GameSkill* skill)
;	---------------------------------
; Function Draw_Skill_Cost
; ---------------------------------
_Draw_Skill_Cost::
;bank17.c:346: Draw_Skill_Number(skill->mana_cost, 4, 14);
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0007
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0e04
	push	de
	push	bc
	call	_Draw_Skill_Number
	add	sp, #4
;bank17.c:347: }
	ret
;bank17.c:349: void Draw_Damage_Message(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Damage_Message
; ---------------------------------
_Draw_Damage_Message::
;bank17.c:351: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank17.c:353: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:355: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:357: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00123$:
;bank17.c:359: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank17.c:357: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00123$
;bank17.c:362: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank17.c:364: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank17.c:365: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank17.c:368: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:369: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:371: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank17.c:373: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:374: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank17.c:377: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:378: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:380: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank17.c:382: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:383: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank17.c:386: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank17.c:388: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank17.c:390: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank17.c:391: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank17.c:392: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank17.c:393: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank17.c:395: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00121$
;bank17.c:397: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:399: set_bkg_tiles(tile_x, tile_y, 1, 1, &parsed_decimal[3]);
	ld	hl, #(_parsed_decimal + 0x0003)
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	ret
00121$:
;bank17.c:407: set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x + 2]);
	ldhl	sp,	#4
	ld	c, (hl)
;bank17.c:401: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank17.c:403: for(x = 0; x < 2; x++)
	ld	hl, #_x
	ld	(hl), #0x00
00125$:
;bank17.c:405: performant_delay(2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank17.c:407: set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x + 2]);
	ld	a, (#_x)
	inc	a
	inc	a
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_parsed_decimal
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_x
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:403: for(x = 0; x < 2; x++)
	ld	hl, #_x
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00125$
	ret
00118$:
;bank17.c:410: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00115$
;bank17.c:412: for(x = 0; x < 3; x++)
	ld	hl, #_x
	ld	(hl), #0x00
00127$:
;bank17.c:414: performant_delay(2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank17.c:416: set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x + 1]);
	ld	a, (#_x)
	inc	a
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_parsed_decimal
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_x
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:412: for(x = 0; x < 3; x++)
	ld	hl, #_x
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00127$
	ret
00115$:
;bank17.c:421: for(x = 0; x < 4; x++)
	ld	hl, #_x
	ld	(hl), #0x00
00129$:
;bank17.c:423: performant_delay(2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank17.c:425: set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x]);
	ld	a, (#_x)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_parsed_decimal
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_x
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:421: for(x = 0; x < 4; x++)
	ld	hl, #_x
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00129$
;bank17.c:429: }
	ret
;bank17.c:431: void Move_Damage(UBYTE tile_x, UBYTE tile_y, UBYTE full_number)
;	---------------------------------
; Function Move_Damage
; ---------------------------------
_Move_Damage::
	add	sp, #-2
;bank17.c:433: tile_x = tile_x * 8;
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank17.c:434: tile_y = tile_y * 8;
	ld	(hl+), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
;bank17.c:433: tile_x = tile_x * 8;
	ld	(hl-), a
;bank17.c:434: tile_y = tile_y * 8;
	ld	a, (hl+)
	ld	c, a
;bank17.c:436: if(full_number == false)
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;bank17.c:438: set_sprite_data(104, 20, Tiles_Number);
	ld	hl, #_Tiles_Number
	push	hl
	ld	de, #0x1468
	push	de
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0090)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;bank17.c:441: move_sprite(37, tile_x, tile_y + 8);
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#1
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0094)
	ld	(hl+), a
	ld	(hl), c
;bank17.c:443: move_sprite(38, tile_x + 8, tile_y);
	ld	a, c
	add	a, #0x08
	ld	c, a
	ld	e, c
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0098)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+156
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;bank17.c:444: move_sprite(39, tile_x + 8, tile_y + 8);
	jr	00114$
00102$:
;bank17.c:448: set_sprite_data(104, 20, Tiles_Number);
	ld	hl, #_Tiles_Number
	push	hl
	ld	de, #0x1468
	push	de
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0088)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;bank17.c:451: move_sprite(35, tile_x, tile_y + 8);
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x008c)
	ld	(hl+), a
	ld	(hl), c
;bank17.c:453: move_sprite(36, tile_x + 8, tile_y);
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#1
	ld	(hl), a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0090)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 0x0094)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;bank17.c:456: move_sprite(38, tile_x + 16, tile_y);
	ld	a, c
	add	a, #0x10
	ld	c, a
	ld	e, c
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0098)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 0x009c)
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;bank17.c:457: move_sprite(39, tile_x + 16, tile_y + 8);
00114$:
;bank17.c:459: }
	add	sp, #2
	ret
;bank17.c:461: void Draw_Skill_Damage(UINT16 number)
;	---------------------------------
; Function Draw_Skill_Damage
; ---------------------------------
_Draw_Skill_Damage::
	add	sp, #-2
;bank17.c:463: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank17.c:465: saved_number = number;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:467: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank17.c:469: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00126$:
;bank17.c:471: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank17.c:469: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00126$
;bank17.c:474: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank17.c:476: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank17.c:477: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank17.c:480: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:481: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:483: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank17.c:485: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:486: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank17.c:489: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank17.c:490: parsed_number = 0;
	ld	(hl), #0x00
;bank17.c:492: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank17.c:494: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank17.c:495: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank17.c:498: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank17.c:500: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank17.c:502: parsed_decimal[0] += parsed_decimal[0];
	ld	a, (#_parsed_decimal + 0)
	add	a, a
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #_parsed_decimal
	ld	a, (hl)
	ld	(de), a
;bank17.c:503: parsed_decimal[1] += parsed_decimal[1];
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, a
	inc	hl
	ld	(hl), a
	ld	de, #(_parsed_decimal + 0x0001)
	ld	a, (hl)
	ld	(de), a
;bank17.c:504: parsed_decimal[2] += parsed_decimal[2];
	ld	a, (#_parsed_number)
	add	a, a
	ld	b, a
	ld	hl, #(_parsed_decimal + 0x0002)
	ld	(hl), b
;bank17.c:505: parsed_decimal[3] += parsed_decimal[3];
	sla	c
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank17.c:507: parsed_decimal[0] += 104;
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x68
	ld	(#_parsed_decimal),a
;bank17.c:508: parsed_decimal[1] += 104;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x68
	ld	(#(_parsed_decimal + 0x0001)),a
;bank17.c:509: parsed_decimal[2] += 104;
	ld	a, b
	add	a, #0x68
	ld	(#(_parsed_decimal + 0x0002)),a
;bank17.c:510: parsed_decimal[3] += 104;
	ld	a, c
	add	a, #0x68
	ld	(#(_parsed_decimal + 0x0003)),a
;bank17.c:512: if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00114$
;bank17.c:514: set_sprite_data(104, 20, Tiles_Number);
	ld	hl, #_Tiles_Number
	push	hl
	ld	de, #0x1468
	push	de
	call	_set_sprite_data
	add	sp, #4
;bank17.c:516: set_sprite_tile(36, parsed_decimal[2]);
	ld	hl, #(_parsed_decimal + 0x0002)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0092)
	ld	(hl), c
;bank17.c:517: set_sprite_tile(37, parsed_decimal[2] + 1);
	ld	a, (#(_parsed_decimal + 0x0002) + 0)
	ld	c, a
	inc	c
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0096)
	ld	(hl), c
;bank17.c:519: set_sprite_tile(38, parsed_decimal[3]);
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x009a)
	ld	(hl), c
;bank17.c:520: set_sprite_tile(39, parsed_decimal[3] + 1);
	ld	a, (#(_parsed_decimal + 0x0003) + 0)
	ld	c, a
	inc	c
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x009e)
	ld	(hl), c
;bank17.c:520: set_sprite_tile(39, parsed_decimal[3] + 1);
	jr	00128$
00114$:
;bank17.c:522: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00128$
;bank17.c:524: set_sprite_data(104, 20, Tiles_Number);
	ld	hl, #_Tiles_Number
	push	hl
	ld	de, #0x1468
	push	de
	call	_set_sprite_data
	add	sp, #4
;bank17.c:526: set_sprite_tile(34, parsed_decimal[1]);
	ld	hl, #(_parsed_decimal + 0x0001)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x008a)
	ld	(hl), c
;bank17.c:527: set_sprite_tile(35, parsed_decimal[1] + 1);
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	ld	c, a
	inc	c
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x008e)
	ld	(hl), c
;bank17.c:529: set_sprite_tile(36, parsed_decimal[2]);
	ld	hl, #(_parsed_decimal + 0x0002)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0092)
	ld	(hl), c
;bank17.c:530: set_sprite_tile(37, parsed_decimal[2] + 1);
	ld	a, (#(_parsed_decimal + 0x0002) + 0)
	ld	c, a
	inc	c
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0096)
	ld	(hl), c
;bank17.c:532: set_sprite_tile(38, parsed_decimal[3]);
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x009a)
	ld	(hl), c
;bank17.c:533: set_sprite_tile(39, parsed_decimal[3] + 1);
	ld	a, (#(_parsed_decimal + 0x0003) + 0)
	ld	c, a
	inc	c
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x009e)
	ld	(hl), c
;bank17.c:533: set_sprite_tile(39, parsed_decimal[3] + 1);
00128$:
;bank17.c:535: }
	add	sp, #2
	ret
;bank17.c:537: void Draw_Skill_Message(GameSkill* skill, UBYTE action_performer, UBYTE action_target)
;	---------------------------------
; Function Draw_Skill_Message
; ---------------------------------
_Draw_Skill_Message::
	add	sp, #-7
;bank17.c:539: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:540: message_y = 0;
	ld	hl, #_message_y
	ld	(hl), #0x00
;bank17.c:542: for(u_x = 0; u_x < 7; u_x++) //* Action performer's name.
	ld	hl, #_u_x
	ld	(hl), #0x00
00178$:
;bank17.c:544: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00102$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00103$
00102$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00103$:
;bank17.c:546: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_performer)[u_x]);
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	a, e
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	jr	NC, 00403$
	inc	d
00403$:
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:548: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:550: if(Get_Name(action_performer)[u_x + 1] == 0x01 && Get_Name(action_performer)[u_x + 2] == 0x01)
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	NZ, 00179$
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	Z, 00107$
;bank17.c:552: break;
00179$:
;bank17.c:542: for(u_x = 0; u_x < 7; u_x++) //* Action performer's name.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x07
	jp	C, 00178$
00107$:
;bank17.c:556: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:558: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00109$
;bank17.c:560: message_x = 0;
	ld	(hl), #0x00
;bank17.c:561: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00109$:
;bank17.c:564: for(u_x = 0; u_x < skill->length; u_x++) //* Skill message.
	ld	hl, #_u_x
	ld	(hl), #0x00
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00181$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, (#_u_x)
	sub	a, c
	jr	NC, 00115$
;bank17.c:566: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00111$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00112$
00111$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00112$:
;bank17.c:568: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &skill->description[u_x]);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
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
;c
	pop	de
	push	de
	ld	hl, #_u_x
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (#_message_y)
	add	a, #0x0d
	ldhl	sp,	#6
	ld	(hl), a
	ld	hl, #_message_x
	ld	a, (hl)
	inc	a
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#10
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:570: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:572: if(skill->description[u_x + 1] == 0x01)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_u_x
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	inc	hl
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	Z, 00115$
;bank17.c:564: for(u_x = 0; u_x < skill->length; u_x++) //* Skill message.
	ld	hl, #_u_x
	inc	(hl)
	jp	00181$
00115$:
;bank17.c:578: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:580: if(skill->is_ability == true) //* Skill name.
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	jp	NZ,00131$
;bank17.c:582: if(message_x + skill->name_length > 17)
	ld	hl, #_message_x
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00411$
	bit	7, d
	jr	NZ, 00412$
	cp	a, a
	jr	00412$
00411$:
	bit	7, d
	jr	Z, 00412$
	scf
00412$:
	jr	NC, 00117$
;bank17.c:584: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:585: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00117$:
;bank17.c:588: for(u_x = 0; u_x < 8; u_x++) //* Skill message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00183$:
;bank17.c:590: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00119$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00120$
00119$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00120$:
;bank17.c:592: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &skill->name[u_x]);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_u_x
	add	a, (hl)
	ld	c, a
	jr	NC, 00414$
	inc	b
00414$:
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:594: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:596: if(skill->name[u_x + 1] == 0x01)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #_u_x
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	inc	hl
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	Z, 00123$
;bank17.c:588: for(u_x = 0; u_x < 8; u_x++) //* Skill message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x08
	jr	C, 00183$
00123$:
;bank17.c:602: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:604: if(message_x + 2 > 17)
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	ld	e, b
	ld	d, #0x00
	ld	a, #0x11
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00416$
	bit	7, d
	jr	NZ, 00417$
	cp	a, a
	jr	00417$
00416$:
	bit	7, d
	jr	Z, 00417$
	scf
00417$:
	jr	NC, 00125$
;bank17.c:606: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:607: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00125$:
;bank17.c:610: for(u_x = 0; u_x < 2; u_x++)
	ld	hl, #_u_x
	ld	(hl), #0x00
00185$:
;bank17.c:612: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00127$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00128$
00127$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00128$:
;bank17.c:614: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_On[u_x]);
	ld	a, #<(_Skill_On)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_On)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:616: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:610: for(u_x = 0; u_x < 2; u_x++)
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x02
	jr	C, 00185$
;bank17.c:619: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
00131$:
;bank17.c:622: if(message_x + Get_Name_Length(action_target) > 17)
	ld	hl, #_message_x
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name_Length
	inc	sp
	pop	bc
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00419$
	bit	7, d
	jr	NZ, 00420$
	cp	a, a
	jr	00420$
00419$:
	bit	7, d
	jr	Z, 00420$
	scf
00420$:
	jr	NC, 00133$
;bank17.c:624: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:625: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00133$:
;bank17.c:628: for(u_x = 0; u_x < 7; u_x++) //* Action target's name.
	ld	hl, #_u_x
	ld	(hl), #0x00
00187$:
;bank17.c:630: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00135$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00136$
00135$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00136$:
;bank17.c:632: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_target)[u_x]);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	a, e
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	jr	NC, 00422$
	inc	d
00422$:
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:634: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:636: if(Get_Name(action_target)[u_x + 1] == 0x01)
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	l, c
	ld	h, b
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	Z, 00139$
;bank17.c:628: for(u_x = 0; u_x < 7; u_x++) //* Action target's name.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x07
	jr	C, 00187$
00139$:
;bank17.c:642: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);
	ld	de, #_Skill_Period
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:644: message_x += 1;
	ld	hl, #_message_x
	ld	a, (hl)
	inc	a
;bank17.c:646: message_x += 1;
	ld	(hl), a
	inc	a
	ld	(hl), a
;bank17.c:648: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00141$
;bank17.c:650: message_x = 0;
	ld	(hl), #0x00
;bank17.c:651: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00141$:
;bank17.c:654: if(message_x + Get_Name_Length(action_target) + 1 > 17)
	ld	hl, #_message_x
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name_Length
	inc	sp
	pop	bc
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	inc	hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00424$
	bit	7, d
	jr	NZ, 00425$
	cp	a, a
	jr	00425$
00424$:
	bit	7, d
	jr	Z, 00425$
	scf
00425$:
	jr	NC, 00143$
;bank17.c:656: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:657: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00143$:
;bank17.c:660: performant_delay(15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:662: for(u_x = 0; u_x < 7; u_x++) //* Action target's name.
	ld	hl, #_u_x
	ld	(hl), #0x00
00189$:
;bank17.c:664: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00145$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00146$
00145$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00146$:
;bank17.c:666: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_target)[u_x]);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	a, e
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	jr	NC, 00427$
	inc	d
00427$:
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:668: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:670: if(Get_Name(action_target)[u_x + 1] == 0x01)
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Name
	inc	sp
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	Z, 00149$
;bank17.c:662: for(u_x = 0; u_x < 7; u_x++) //* Action target's name.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x07
	jr	C, 00189$
00149$:
;bank17.c:676: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:678: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00151$
;bank17.c:680: message_x = 0;
	ld	(hl), #0x00
;bank17.c:681: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00151$:
;bank17.c:684: for(u_x = 0; u_x < 4; u_x++) //* Skill message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00191$:
;bank17.c:686: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00153$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00154$
00153$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00154$:
;bank17.c:688: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Took[u_x]);
	ld	a, #<(_Skill_Took)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_Took)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:690: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:684: for(u_x = 0; u_x < 4; u_x++) //* Skill message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00191$
;bank17.c:693: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:695: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00157$
;bank17.c:697: message_x = 0;
	ld	(hl), #0x00
;bank17.c:698: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00157$:
;bank17.c:546: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_performer)[u_x]);
	ld	a, (#_message_y)
	ldhl	sp,	#4
	ld	(hl), a
;bank17.c:701: if(skill_damage < 10) //* 'skill_damage' number.
	ld	hl, #_skill_damage
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00168$
;bank17.c:703: Draw_Damage_Message(skill_damage, message_x + 1, 13 + message_y);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_skill_damage
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:705: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
	jp	00169$
00168$:
;bank17.c:582: if(message_x + skill->name_length > 17)
	ld	a, (#_message_x)
	ldhl	sp,	#5
	ld	(hl), a
	xor	a, a
	inc	hl
;bank17.c:712: message_y += 1;
	ld	(hl-), a
	dec	hl
	ld	c, (hl)
	inc	c
;bank17.c:707: else if(skill_damage > 9)
	ld	hl, #_skill_damage
	ld	a, #0x09
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00165$
;bank17.c:709: if(message_x + 2 > 17)
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00430$
	bit	7, d
	jr	NZ, 00431$
	cp	a, a
	jr	00431$
00430$:
	bit	7, d
	jr	Z, 00431$
	scf
00431$:
	jr	NC, 00159$
;bank17.c:711: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:712: message_y += 1;
	ld	hl, #_message_y
	ld	(hl), c
00159$:
;bank17.c:715: Draw_Damage_Message(skill_damage, message_x, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	push	af
	inc	sp
	ld	a, (#_message_x)
	push	af
	inc	sp
	ld	hl, #_skill_damage
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:717: message_x += 2;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	jr	00169$
00165$:
;bank17.c:719: else if(skill_damage > 99)
	ld	hl, #_skill_damage
	ld	a, #0x63
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00169$
;bank17.c:721: if(message_x + 3 > 17)
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00432$
	bit	7, d
	jr	NZ, 00433$
	cp	a, a
	jr	00433$
00432$:
	bit	7, d
	jr	Z, 00433$
	scf
00433$:
	jr	NC, 00161$
;bank17.c:723: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:724: message_y += 1;
	ld	hl, #_message_y
	ld	(hl), c
00161$:
;bank17.c:727: Draw_Damage_Message(skill_damage, message_x, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	push	af
	inc	sp
	ld	a, (#_message_x)
	push	af
	inc	sp
	ld	hl, #_skill_damage
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:729: message_x += 3;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
00169$:
;bank17.c:732: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:734: if(message_x + 6 > 17)
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0006
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00434$
	bit	7, d
	jr	NZ, 00435$
	cp	a, a
	jr	00435$
00434$:
	bit	7, d
	jr	Z, 00435$
	scf
00435$:
	jr	NC, 00171$
;bank17.c:736: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:737: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00171$:
;bank17.c:740: for(u_x = 0; u_x < 6; u_x++) //* Damage message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00193$:
;bank17.c:742: if(joypad() & J_A){performant_delay(1);}else{performant_delay(2);}
	call	_joypad
	bit	4, e
	jr	Z, 00173$
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00174$
00173$:
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
00174$:
;bank17.c:744: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Damaged[u_x]);
	ld	a, #<(_Skill_Damaged)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_Damaged)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:746: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:748: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00194$
;bank17.c:750: message_x = 0;
	ld	(hl), #0x00
;bank17.c:751: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00194$:
;bank17.c:740: for(u_x = 0; u_x < 6; u_x++) //* Damage message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00193$
;bank17.c:755: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	ld	hl, #_Skill_Period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:757: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;bank17.c:758: }
	add	sp, #7
	ret
;bank17.c:760: void Draw_Experience_Message(GameActor* actor)
;	---------------------------------
; Function Draw_Experience_Message
; ---------------------------------
_Draw_Experience_Message::
	add	sp, #-2
;bank17.c:762: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:763: message_y = 0;
	ld	hl, #_message_y
	ld	(hl), #0x00
;bank17.c:765: for(u_x = 0; u_x < 7; u_x++) //* Party member name.
	ld	hl, #_u_x
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
00124$:
;bank17.c:767: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:769: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &actor->name[u_x]);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_u_x
	add	a, (hl)
	ld	c, a
	jr	NC, 00202$
	inc	b
00202$:
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:771: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:773: if(actor->name[u_x + 1] == 0x01)
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #_u_x
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	inc	hl
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	Z, 00103$
;bank17.c:765: for(u_x = 0; u_x < 7; u_x++) //* Party member name.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x07
	jr	C, 00124$
00103$:
;bank17.c:779: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:781: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00105$
;bank17.c:783: message_x = 0;
	ld	(hl), #0x00
;bank17.c:784: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00105$:
;bank17.c:787: for(u_x = 0; u_x < 6; u_x++) //* Gained message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00126$:
;bank17.c:789: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:791: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gained[u_x]);
	ld	a, #<(_Skill_Gained)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_Gained)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:793: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:787: for(u_x = 0; u_x < 6; u_x++) //* Gained message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00126$
;bank17.c:796: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:798: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00108$
;bank17.c:800: message_x = 0;
	ld	(hl), #0x00
;bank17.c:801: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00108$:
;bank17.c:804: u_x = enemy_dummy_1.experience + enemy_dummy_2.experience + enemy_dummy_3.experience;
	ld	hl, #(_enemy_dummy_1 + 0x0005)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0005) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0005) + 0)
	add	a, c
	ld	(#_u_x),a
;bank17.c:806: actor->experience += u_x;
;c
	pop	de
	push	de
	ld	hl, #0x001b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_u_x
	ld	e, (hl)
	ld	d, #0x00
;c
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;bank17.c:769: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &actor->name[u_x]);
	ld	a, (#_message_y)
	ldhl	sp,	#1
	ld	(hl), a
;bank17.c:810: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
;bank17.c:808: if(u_x < 10) //* 'experience' number.
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00119$
;bank17.c:810: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:812: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
	jp	00120$
00119$:
;bank17.c:816: if(message_x + 2 > 17)
	ld	hl, #_message_x
	ld	e, (hl)
	ld	d, #0x00
;bank17.c:819: message_y += 1;
	ldhl	sp,	#1
	inc	(hl)
;bank17.c:814: else if(u_x > 9)
	ld	a, #0x09
	ld	hl, #_u_x
	sub	a, (hl)
	jr	NC, 00116$
;bank17.c:816: if(message_x + 2 > 17)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00204$
	bit	7, d
	jr	NZ, 00205$
	cp	a, a
	jr	00205$
00204$:
	bit	7, d
	jr	Z, 00205$
	scf
00205$:
	jr	NC, 00110$
;bank17.c:818: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:819: message_y += 1;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_message_y),a
00110$:
;bank17.c:822: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:824: message_x += 2;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	jr	00120$
00116$:
;bank17.c:826: else if(u_x > 99)
	ld	a, #0x63
	ld	hl, #_u_x
	sub	a, (hl)
	jr	NC, 00120$
;bank17.c:828: if(message_x + 3 > 17)
	inc	de
	inc	de
	inc	de
	ld	h, e
	ld	l, d
	ld	e, l
	ld	d, #0x00
	ld	a, #0x11
	cp	a, h
	ld	a, #0x00
	sbc	a, l
	bit	7, e
	jr	Z, 00206$
	bit	7, d
	jr	NZ, 00207$
	cp	a, a
	jr	00207$
00206$:
	bit	7, d
	jr	Z, 00207$
	scf
00207$:
	jr	NC, 00112$
;bank17.c:830: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:831: message_y += 1;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_message_y),a
00112$:
;bank17.c:834: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:836: message_x += 3;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
00120$:
;bank17.c:839: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:841: if(message_x + 11 > 17)
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000b
	add	hl, bc
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00208$
	bit	7, d
	jr	NZ, 00209$
	cp	a, a
	jr	00209$
00208$:
	bit	7, d
	jr	Z, 00209$
	scf
00209$:
	jr	NC, 00122$
;bank17.c:843: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:844: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00122$:
;bank17.c:847: for(u_x = 0; u_x < 10; u_x++) //* Experience message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00128$:
;bank17.c:849: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:851: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Experience[u_x]);
	ld	a, #<(_Skill_Experience)
	ld	hl, #_u_x
	add	a, (hl)
	ld	c, a
	ld	a, #>(_Skill_Experience)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:853: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:847: for(u_x = 0; u_x < 10; u_x++) //* Experience message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00128$
;bank17.c:856: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	ld	hl, #_Skill_Period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:858: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;bank17.c:859: }
	add	sp, #2
	ret
;bank17.c:861: void Draw_Gold_Message()
;	---------------------------------
; Function Draw_Gold_Message
; ---------------------------------
_Draw_Gold_Message::
	dec	sp
;bank17.c:863: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:864: message_y = 0;
	ld	hl, #_message_y
	ld	(hl), #0x00
;bank17.c:866: for(u_x = 0; u_x < 3; u_x++) //* The message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00125$:
;bank17.c:868: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:870: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_The[u_x]);
	ld	a, #<(_Skill_The)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_The)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:872: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:866: for(u_x = 0; u_x < 3; u_x++) //* The message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00125$
;bank17.c:875: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:877: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00103$
;bank17.c:879: message_x = 0;
	ld	(hl), #0x00
;bank17.c:880: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00103$:
;bank17.c:883: for(u_x = 0; u_x < 5; u_x++) //* Party message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00127$:
;bank17.c:885: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:887: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Party[u_x]);
	ld	a, #<(_Skill_Party)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_Party)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:889: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:883: for(u_x = 0; u_x < 5; u_x++) //* Party message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00127$
;bank17.c:892: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:894: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00106$
;bank17.c:896: message_x = 0;
	ld	(hl), #0x00
;bank17.c:897: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00106$:
;bank17.c:900: for(u_x = 0; u_x < 6; u_x++) //* Gained message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00129$:
;bank17.c:902: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:904: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gained[u_x]);
	ld	a, #<(_Skill_Gained)
	ld	hl, #_u_x
	add	a, (hl)
	ld	e, a
	ld	a, #>(_Skill_Gained)
	adc	a, #0x00
	ld	d, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:906: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:900: for(u_x = 0; u_x < 6; u_x++) //* Gained message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x06
	jr	C, 00129$
;bank17.c:909: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:911: if(message_x > 17)
	ld	a, #0x11
	sub	a, (hl)
	jr	NC, 00109$
;bank17.c:913: message_x = 0;
	ld	(hl), #0x00
;bank17.c:914: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00109$:
;bank17.c:917: u_x = enemy_dummy_1.gold + enemy_dummy_2.gold + enemy_dummy_3.gold;
	ld	hl, #(_enemy_dummy_1 + 0x0004)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0004) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0004) + 0)
	add	a, c
	ld	hl, #_u_x
	ld	(hl), a
;bank17.c:919: party_gold += u_x;
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_party_gold
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;bank17.c:870: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_The[u_x]);
	ld	a, (#_message_y)
	ldhl	sp,	#0
	ld	(hl), a
;bank17.c:923: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	hl, #_u_x
	ld	c, (hl)
	ld	b, #0x00
;bank17.c:921: if(u_x < 10) //* 'gold' number.
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00120$
;bank17.c:923: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:925: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
	jp	00121$
00120$:
;bank17.c:929: if(message_x + 2 > 17)
	ld	hl, #_message_x
	ld	e, (hl)
	ld	d, #0x00
;bank17.c:932: message_y += 1;
	ldhl	sp,	#0
	inc	(hl)
;bank17.c:927: else if(u_x > 9)
	ld	a, #0x09
	ld	hl, #_u_x
	sub	a, (hl)
	jr	NC, 00117$
;bank17.c:929: if(message_x + 2 > 17)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x11
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00220$
	bit	7, d
	jr	NZ, 00221$
	cp	a, a
	jr	00221$
00220$:
	bit	7, d
	jr	Z, 00221$
	scf
00221$:
	jr	NC, 00111$
;bank17.c:931: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:932: message_y += 1;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_message_y),a
00111$:
;bank17.c:935: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:937: message_x += 2;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
	jr	00121$
00117$:
;bank17.c:939: else if(u_x > 99)
	ld	a, #0x63
	ld	hl, #_u_x
	sub	a, (hl)
	jr	NC, 00121$
;bank17.c:941: if(message_x + 3 > 17)
	inc	de
	inc	de
	inc	de
	ld	h, e
	ld	l, d
	ld	e, l
	ld	d, #0x00
	ld	a, #0x11
	cp	a, h
	ld	a, #0x00
	sbc	a, l
	bit	7, e
	jr	Z, 00222$
	bit	7, d
	jr	NZ, 00223$
	cp	a, a
	jr	00223$
00222$:
	bit	7, d
	jr	Z, 00223$
	scf
00223$:
	jr	NC, 00113$
;bank17.c:943: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:944: message_y += 1;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_message_y),a
00113$:
;bank17.c:947: Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_Draw_Damage_Message
	add	sp, #4
;bank17.c:949: message_x += 3;
	ld	hl, #_message_x
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
00121$:
;bank17.c:952: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:954: if(message_x + 4 > 17)
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e, b
	ld	d, #0x00
	ld	a, #0x11
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00224$
	bit	7, d
	jr	NZ, 00225$
	cp	a, a
	jr	00225$
00224$:
	bit	7, d
	jr	Z, 00225$
	scf
00225$:
	jr	NC, 00123$
;bank17.c:956: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank17.c:957: message_y += 1;
	ld	hl, #_message_y
	inc	(hl)
00123$:
;bank17.c:960: for(u_x = 0; u_x < 4; u_x++) //* Gold message.
	ld	hl, #_u_x
	ld	(hl), #0x00
00131$:
;bank17.c:962: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:964: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gold[u_x]);
	ld	a, #<(_Skill_Gold)
	ld	hl, #_u_x
	add	a, (hl)
	ld	c, a
	ld	a, #>(_Skill_Gold)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:966: message_x += 1;
	ld	hl, #_message_x
	inc	(hl)
;bank17.c:960: for(u_x = 0; u_x < 4; u_x++) //* Gold message.
	ld	hl, #_u_x
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00131$
;bank17.c:969: set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);
	ld	a, (#_message_y)
	add	a, #0x0d
	ld	hl, #_message_x
	ld	b, (hl)
	inc	b
	ld	hl, #_Skill_Period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:971: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;bank17.c:972: }
	inc	sp
	ret
;bank17.c:974: void Draw_End_Message()
;	---------------------------------
; Function Draw_End_Message
; ---------------------------------
_Draw_End_Message::
;bank17.c:976: if(party[0] > 0 && Get_Actor(party[0])->health > 0)
	ld	a, (#_party + 0)
	or	a, a
	jr	Z, 00102$
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00102$
;bank17.c:978: Draw_Experience_Message(Get_Actor(party[0]));
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Experience_Message
	add	sp, #2
;bank17.c:980: u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;
	ld	hl, #(_enemy_dummy_1 + 0x0006)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0006) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0006) + 0)
	add	a, c
	ld	(#_u_i),a
;bank17.c:982: Add_Ability_Points(Get_Actor(party[0]), u_i);
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, (#_u_i)
	push	af
	inc	sp
	push	de
	call	_Add_Ability_Points
	add	sp, #3
00102$:
;bank17.c:985: if(party[1] > 0 && Get_Actor(party[1])->health > 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	Z, 00105$
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00105$
;bank17.c:987: Call_Load_Battle_Message_Box(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_Call_Load_Battle_Message_Box
	inc	sp
;bank17.c:989: Draw_Experience_Message(Get_Actor(party[1]));
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Experience_Message
	add	sp, #2
;bank17.c:991: u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;
	ld	hl, #(_enemy_dummy_1 + 0x0006)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0006) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0006) + 0)
	add	a, c
	ld	(#_u_i),a
;bank17.c:993: Add_Ability_Points(Get_Actor(party[1]), u_i);
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, (#_u_i)
	push	af
	inc	sp
	push	de
	call	_Add_Ability_Points
	add	sp, #3
00105$:
;bank17.c:996: if(party[2] > 0 && Get_Actor(party[2])->health > 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	Z, 00108$
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00108$
;bank17.c:998: Call_Load_Battle_Message_Box(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_Call_Load_Battle_Message_Box
	inc	sp
;bank17.c:1000: Draw_Experience_Message(Get_Actor(party[2]));
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Experience_Message
	add	sp, #2
;bank17.c:1002: u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;
	ld	hl, #(_enemy_dummy_1 + 0x0006)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0006) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0006) + 0)
	add	a, c
	ld	(#_u_i),a
;bank17.c:1004: Add_Ability_Points(Get_Actor(party[2]), u_i);
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, (#_u_i)
	push	af
	inc	sp
	push	de
	call	_Add_Ability_Points
	add	sp, #3
00108$:
;bank17.c:1007: if(party[3] > 0 && Get_Actor(party[3])->health > 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	Z, 00111$
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00111$
;bank17.c:1009: Call_Load_Battle_Message_Box(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_Call_Load_Battle_Message_Box
	inc	sp
;bank17.c:1011: Draw_Experience_Message(Get_Actor(party[3]));
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	push	de
	call	_Draw_Experience_Message
	add	sp, #2
;bank17.c:1013: u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;
	ld	hl, #(_enemy_dummy_1 + 0x0006)
	ld	c, (hl)
	ld	a, (#(_enemy_dummy_2 + 0x0006) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_enemy_dummy_3 + 0x0006) + 0)
	add	a, c
	ld	(#_u_i),a
;bank17.c:1015: Add_Ability_Points(Get_Actor(party[3]), u_i);
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, (#_u_i)
	push	af
	inc	sp
	push	de
	call	_Add_Ability_Points
	add	sp, #3
00111$:
;bank17.c:1018: Call_Load_Battle_Message_Box(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_Call_Load_Battle_Message_Box
	inc	sp
;bank17.c:1020: Draw_Gold_Message();
;bank17.c:1021: }
	jp  _Draw_Gold_Message
;bank17.c:1023: void Bounce_Damage_Sprite()
;	---------------------------------
; Function Bounce_Damage_Sprite
; ---------------------------------
_Bounce_Damage_Sprite::
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+136
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+140
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+144
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+148
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+152
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+156
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;bank17.c:1032: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+136
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+140
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+144
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+148
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+152
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+156
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;bank17.c:1041: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:1042: }
	ret
;bank17.c:1044: void Clear_Damage()
;	---------------------------------
; Function Clear_Damage
; ---------------------------------
_Clear_Damage::
;bank17.c:1046: Move_Damage(25, 25, false);
	xor	a, a
	ld	d,a
	ld	e,#0x19
	push	de
	ld	a, #0x19
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
;bank17.c:1048: set_sprite_data(104, 8, Tiles_Skill_Clear);
	ld	bc, #_Tiles_Skill_Clear+0
	push	bc
	ld	de, #0x0868
	push	de
	call	_set_sprite_data
	add	sp, #4
;bank17.c:1049: set_sprite_data(112, 8, Tiles_Skill_Clear);
	push	bc
	ld	de, #0x0870
	push	de
	call	_set_sprite_data
	add	sp, #4
;bank17.c:1050: }
	ret
;bank17.c:1052: void Load_Damage_Sprite(UBYTE action_target)
;	---------------------------------
; Function Load_Damage_Sprite
; ---------------------------------
_Load_Damage_Sprite::
;bank17.c:1054: Draw_Skill_Damage(skill_damage);
	ld	hl, #_skill_damage
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Skill_Damage
	add	sp, #2
;bank17.c:1056: if(action_target > 3)
	ld	a, #0x03
	ldhl	sp,	#2
	sub	a, (hl)
	jp	NC, 00121$
;bank17.c:1060: if(action_target == 4)
	ld	a, (hl)
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00170$
	xor	a, a
00170$:
	ld	e, a
;bank17.c:1064: if(action_target == 5)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00172$
	xor	a, a
00172$:
	ld	c, a
;bank17.c:1068: else if(action_target == 6)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x06
	ld	a, #0x01
	jr	Z, 00174$
	xor	a, a
00174$:
	ld	b, a
;bank17.c:1058: if(skill_damage < 100)
	ld	hl, #_skill_damage
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank17.c:1060: if(action_target == 4)
	ld	a, e
	or	a, a
	jr	Z, 00102$
;bank17.c:1062: Move_Damage(10, 10, false);
	push	bc
	xor	a, a
	ld	d,a
	ld	e,#0x0a
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
	pop	bc
00102$:
;bank17.c:1064: if(action_target == 5)
	ld	a, c
	or	a, a
	jr	Z, 00106$
;bank17.c:1066: Move_Damage(4, 9, false);
	xor	a, a
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
	jr	00121$
00106$:
;bank17.c:1068: else if(action_target == 6)
	ld	a, b
	or	a, a
	jr	Z, 00121$
;bank17.c:1070: Move_Damage(16, 9, false);
	xor	a, a
	ld	d,a
	ld	e,#0x09
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
	jr	00121$
00118$:
;bank17.c:1073: else if(skill_damage < 1000)
	ld	hl, #_skill_damage
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00121$
;bank17.c:1075: if(action_target == 4)
	ld	a, e
	or	a, a
	jr	Z, 00109$
;bank17.c:1077: Move_Damage(10, 10, true);
	push	bc
	ld	de, #0x010a
	push	de
	ld	a, #0x0a
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
	pop	bc
00109$:
;bank17.c:1079: if(action_target == 5)
	ld	a, c
	or	a, a
	jr	Z, 00113$
;bank17.c:1081: Move_Damage(4, 9, true);
	ld	de, #0x0109
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
	jr	00121$
00113$:
;bank17.c:1083: else if(action_target == 6)
	ld	a, b
	or	a, a
	jr	Z, 00121$
;bank17.c:1085: Move_Damage(16, 9, true);
	ld	de, #0x0109
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	call	_Move_Damage
	add	sp, #3
00121$:
;bank17.c:1090: Bounce_Damage_Sprite();
	call	_Bounce_Damage_Sprite
;bank17.c:1092: performant_delay(30);
	ld	a, #0x1e
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank17.c:1094: Clear_Damage();
;bank17.c:1095: }
	jp  _Clear_Damage
;bank17.c:1097: void Draw_Skill_Name(GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skill_Name
; ---------------------------------
_Draw_Skill_Name::
;bank17.c:1099: set_bkg_tiles(tile_x, tile_y, 8, 1, skill->name);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0108
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:1100: }
	ret
;bank17.c:1102: void Draw_Skills_Name(GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Skills_Name
; ---------------------------------
_Draw_Skills_Name::
;bank17.c:1104: set_win_tiles(tile_x, tile_y, 8, 1, skill->name);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #0x0108
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
;bank17.c:1105: }
	ret
;bank17.c:1107: void Get_Next_Target()
;	---------------------------------
; Function Get_Next_Target
; ---------------------------------
_Get_Next_Target::
;bank17.c:1109: if(CurrentTarget > 3)
	ld	a, #0x03
	ld	hl, #_CurrentTarget
	sub	a, (hl)
	jp	NC, 00134$
;bank17.c:1111: if(Get_Enemy_Dummy(CurrentTarget - 4)->health == 0)
	ld	a, (hl)
	add	a, #0xfc
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	NZ
;bank17.c:1113: if(Get_Enemy_Dummy(0)->health != 0 && Get_Enemy(enemy[0]) != &enemy_null)
	xor	a, a
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00109$
	ld	a, (#_enemy + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00228$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00109$
00228$:
;bank17.c:1115: CurrentTarget = 4;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x04
	ret
00109$:
;bank17.c:1117: else if(Get_Enemy_Dummy(1)->health != 0 && Get_Enemy(enemy[1]) != &enemy_null)
	ld	a, #0x01
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00105$
	ld	a, (#(_enemy + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00229$
	ld	a, #>(_enemy_null)
	sub	a, d
	jr	Z, 00105$
00229$:
;bank17.c:1119: CurrentTarget = 5;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x05
	ret
00105$:
;bank17.c:1121: else if(Get_Enemy_Dummy(2)->health != 0 && Get_Enemy(enemy[2]) != &enemy_null)
	ld	a, #0x02
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	Z
	ld	a, (#(_enemy + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Enemy
	inc	sp
	ld	a, #<(_enemy_null)
	sub	a, e
	jr	NZ, 00230$
	ld	a, #>(_enemy_null)
	sub	a, d
	ret	Z
00230$:
;bank17.c:1123: CurrentTarget = 6;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x06
	ret
00134$:
;bank17.c:1127: else if(CurrentTarget < 4)
	ld	hl, #_CurrentTarget
	ld	a, (hl)
	sub	a, #0x04
	ret	NC
;bank17.c:1129: if(Get_Actor(party[CurrentTarget])->health == 0)
	ld	a, #<(_party)
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
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	NZ
;bank17.c:1131: if(Get_Actor(party[0])->health != 0 && Get_Actor(party[0]) != &actor_null)
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00126$
	ld	a, (#_party + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00231$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00126$
00231$:
;bank17.c:1133: CurrentTarget = 0;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x00
	ret
00126$:
;bank17.c:1135: else if(Get_Actor(party[1])->health != 0 && Get_Actor(party[1]) != &actor_null)
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00122$
	ld	a, (#(_party + 0x0001) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00232$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00122$
00232$:
;bank17.c:1137: CurrentTarget = 1;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x01
	ret
00122$:
;bank17.c:1139: else if(Get_Actor(party[2])->health != 0 && Get_Actor(party[2]) != &actor_null)
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	jr	Z, 00118$
	ld	a, (#(_party + 0x0002) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00233$
	ld	a, #>(_actor_null)
	sub	a, d
	jr	Z, 00118$
00233$:
;bank17.c:1141: CurrentTarget = 2;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x02
	ret
00118$:
;bank17.c:1143: else if(Get_Actor(party[3])->health != 0 && Get_Actor(party[3]) != &actor_null)
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	or	a, c
	ret	Z
	ld	a, (#(_party + 0x0003) + 0)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	a, #<(_actor_null)
	sub	a, e
	jr	NZ, 00234$
	ld	a, #>(_actor_null)
	sub	a, d
	ret	Z
00234$:
;bank17.c:1145: CurrentTarget = 3;
	ld	hl, #_CurrentTarget
	ld	(hl), #0x03
;bank17.c:1149: }
	ret
;bank17.c:1151: void Execute_Skill_Hit(UBYTE action_performer, UBYTE action_target)
;	---------------------------------
; Function Execute_Skill_Hit
; ---------------------------------
_Execute_Skill_Hit::
	add	sp, #-2
;bank17.c:1153: if(action_performer < 4)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00102$
;bank17.c:1155: damage_modifier = Get_Actor(party[action_performer])->strength + Get_Equip(Get_Actor(party[action_performer])->equipped[weapon_slot])->strength + Get_Equip(Get_Actor(party[action_performer])->equipped[secondary_slot])->strength + Get_Equip(Get_Actor(party[action_performer])->equipped[armor_slot])->strength + Get_Equip(Get_Actor(party[action_performer])->equipped[accessory_slot])->strength;
;c
	ld	de, #_party
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x000f
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1
	add	hl,de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1+1
	add	hl,de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1+1+1
	add	hl,de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x0009
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	hl, #_damage_modifier
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;bank17.c:1157: skill_damage = 4 + ((rand() % ((damage_modifier + 1) * 2)));
	call	_rand
	ld	hl, #_damage_modifier + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, hl
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x0004
	add	hl, de
	ld	a, l
	ld	d, h
	ld	hl, #_skill_damage
	ld	(hl+), a
	ld	(hl), d
	jr	00103$
00102$:
;bank17.c:1161: skill_damage = 2 + (rand() % ((Get_Enemy_Dummy(action_performer - 4)->strength + 1) * 2));
	call	_rand
	ld	c, e
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xfc
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	pop	bc
	ld	hl, #0x000f
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	add	hl, hl
	ld	a, c
	rla
	sbc	a, a
	ld	b, a
	push	hl
	push	bc
	call	__moduint
	add	sp, #4
	inc	de
	inc	de
	ld	hl, #_skill_damage
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00103$:
;bank17.c:1164: if(action_target > 3)
	ld	a, #0x03
	ldhl	sp,	#5
	sub	a, (hl)
	jr	NC, 00111$
;bank17.c:1166: if(Get_Enemy_Dummy(action_target - 4)->health <= skill_damage)
	ld	a, (hl)
	add	a, #0xfc
	ldhl	sp,	#1
	ld	(hl), a
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_skill_damage
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	C, 00105$
;bank17.c:1168: Get_Enemy_Dummy(action_target - 4)->health = 0;
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00106$
00105$:
;bank17.c:1172: Get_Enemy_Dummy(action_target - 4)->health -= skill_damage;
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
;c
	ld	hl, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_skill_damage
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00106$:
;bank17.c:1175: Load_Damage_Sprite(action_target);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Load_Damage_Sprite
	inc	sp
	jr	00113$
00111$:
;bank17.c:1179: if(Get_Actor(party[action_target])->health <= skill_damage)
	ld	bc, #_party+0
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	ld	b, a
	ld	de, #_skill_damage
	ldhl	sp,	#0
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00108$
;bank17.c:1181: Get_Actor(party[action_target])->health = 0;
	push	bc
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00109$
00108$:
;bank17.c:1185: Get_Actor(party[action_target])->health -= skill_damage;
	push	bc
	inc	sp
	call	_Get_Actor
	inc	sp
;c
	ld	hl, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_skill_damage
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00109$:
;bank17.c:1188: shake_screen();
	call	_shake_screen
00113$:
;bank17.c:1190: }
	add	sp, #2
	ret
;bank17.c:1192: void Execute_Skill_Fireball(UBYTE action_performer, UBYTE action_target)
;	---------------------------------
; Function Execute_Skill_Fireball
; ---------------------------------
_Execute_Skill_Fireball::
	add	sp, #-2
;bank17.c:1194: if(action_performer < 4)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00102$
;bank17.c:1196: damage_modifier = Get_Actor(party[action_performer])->wisdom + Get_Equip(Get_Actor(party[action_performer])->equipped[weapon_slot])->wisdom + Get_Equip(Get_Actor(party[action_performer])->equipped[secondary_slot])->wisdom + Get_Equip(Get_Actor(party[action_performer])->equipped[armor_slot])->wisdom + Get_Equip(Get_Actor(party[action_performer])->equipped[accessory_slot])->wisdom;
;c
	ld	de, #_party
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1
	add	hl,de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1+1
	add	hl,de
	ld	a, (hl)
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
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl,#0x001e+1+1+1
	add	hl,de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	pop	bc
	ld	hl, #0x000a
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	hl, #_damage_modifier
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;bank17.c:1197: skill_damage = 6 + ((rand() % ((damage_modifier + 1) * 2)));
	call	_rand
	ld	hl, #_damage_modifier + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, hl
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x0006
	add	hl, de
	ld	a, l
	ld	d, h
	ld	hl, #_skill_damage
	ld	(hl+), a
	ld	(hl), d
	jr	00103$
00102$:
;bank17.c:1201: skill_damage = 4 + (rand() % ((Get_Enemy_Dummy(action_performer - 4)->wisdom + 1) * 2));
	call	_rand
	ld	c, e
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xfc
	push	bc
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	pop	bc
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	add	hl, hl
	ld	a, c
	rla
	sbc	a, a
	ld	b, a
	push	hl
	push	bc
	call	__moduint
	add	sp, #4
	ld	hl, #0x0004
	add	hl, de
	ld	a, l
	ld	d, h
	ld	hl, #_skill_damage
	ld	(hl+), a
	ld	(hl), d
00103$:
;bank17.c:1204: if(action_target > 3)
	ld	a, #0x03
	ldhl	sp,	#5
	sub	a, (hl)
	jr	NC, 00111$
;bank17.c:1206: if(Get_Enemy_Dummy(action_target - 4)->health <= skill_damage)
	ld	a, (hl)
	add	a, #0xfc
	ldhl	sp,	#1
	ld	(hl), a
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_skill_damage
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	C, 00105$
;bank17.c:1208: Get_Enemy_Dummy(action_target - 4)->health = 0;
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00106$
00105$:
;bank17.c:1212: Get_Enemy_Dummy(action_target - 4)->health -= skill_damage;
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Enemy_Dummy
	inc	sp
;c
	ld	hl, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_skill_damage
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00106$:
;bank17.c:1215: Load_Damage_Sprite(action_target);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_Load_Damage_Sprite
	inc	sp
	jr	00113$
00111$:
;bank17.c:1219: if(Get_Actor(party[action_target])->health <= skill_damage)
	ld	bc, #_party+0
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_Get_Actor
	inc	sp
	pop	bc
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	ld	b, a
	ld	de, #_skill_damage
	ldhl	sp,	#0
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00108$
;bank17.c:1221: Get_Actor(party[action_target])->health = 0;
	push	bc
	inc	sp
	call	_Get_Actor
	inc	sp
	ld	hl, #0x0007
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00109$
00108$:
;bank17.c:1225: Get_Actor(party[action_target])->health -= skill_damage;
	push	bc
	inc	sp
	call	_Get_Actor
	inc	sp
;c
	ld	hl, #0x0007
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_skill_damage
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00109$:
;bank17.c:1228: shake_screen();
	call	_shake_screen
00113$:
;bank17.c:1230: }
	add	sp, #2
	ret
;bank17.c:1232: void Execute_Skill(UBYTE skill_id, UBYTE action_performer, UBYTE action_target)
;	---------------------------------
; Function Execute_Skill
; ---------------------------------
_Execute_Skill::
;bank17.c:1234: CurrentTarget = action_target;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_CurrentTarget),a
;bank17.c:1236: Get_Next_Target();
	call	_Get_Next_Target
;bank17.c:1238: switch(skill_id)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00103$
	jr	00104$
;bank17.c:1242: case 1:
00102$:
;bank17.c:1243: Execute_Skill_Hit(action_performer, CurrentTarget);
	ld	a, (#_CurrentTarget)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_Execute_Skill_Hit
	add	sp, #2
;bank17.c:1244: break;
	jr	00105$
;bank17.c:1245: case 3:
00103$:
;bank17.c:1246: Execute_Skill_Fireball(action_performer, CurrentTarget);
	ld	a, (#_CurrentTarget)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_Execute_Skill_Fireball
	add	sp, #2
;bank17.c:1247: break;
	jr	00105$
;bank17.c:1248: default:
00104$:
;bank17.c:1249: Execute_Skill_Hit(action_performer, CurrentTarget);
	ld	a, (#_CurrentTarget)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_Execute_Skill_Hit
	add	sp, #2
;bank17.c:1251: }
00105$:
;bank17.c:1253: Draw_Skill_Message(Get_Skill(skill_id), action_performer, CurrentTarget);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Skill
	inc	sp
	ld	a, (#_CurrentTarget)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Skill_Message
	add	sp, #4
;bank17.c:1254: }
	ret
;bank17.c:1256: void Draw_Troop(unsigned char* tiles, unsigned char* data) //* Draws troop tiles.
;	---------------------------------
; Function Draw_Troop
; ---------------------------------
_Draw_Troop::
;bank17.c:1258: set_bkg_tileset(128, 64, tiles);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	de, #0x4080
	push	de
	call	_set_bkg_tileset
	add	sp, #4
;bank17.c:1259: set_bkg_tiles(0, 0, 20, 12, data);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0c14
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank17.c:1260: }
	ret
	.area _CODE_17
	.area _CABS (ABS)
