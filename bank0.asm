;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank0
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Main
	.globl _interrupt_handler
	.globl _vbl_seed_isr
	.globl _vbl_clock_isr
	.globl _vbl_music_isr
	.globl _Overworld
	.globl _Call_Load_Menu_Main
	.globl _Call_Menu_Main
	.globl _Call_Menu_Skills
	.globl _Call_Shop
	.globl _Call_Menu_Status
	.globl _Call_Menu_Item
	.globl _Call_Menu_Equip
	.globl _Call_Check_Step_Counter
	.globl _Call_Load_Combat_Main
	.globl _Call_Play_Use
	.globl _Call_Play_Confirm
	.globl _Call_Play_Buzz
	.globl _Call_Draw_Number
	.globl _Call_Draw_Name
	.globl _Call_Load_Font_Menu
	.globl _Call_Equip_Equipment
	.globl _Call_Add_Equip
	.globl _Call_Add_Item
	.globl _Call_Hide_Char
	.globl _Call_Add_NPC
	.globl _Call_Set_Actor_Skills
	.globl _Call_Load_Battle_Message_Box
	.globl _Call_Draw_Equip_Description_Large
	.globl _Call_Draw_Item_Description
	.globl _Call_Draw_End_Message
	.globl _Call_Draw_Skill_Name
	.globl _Call_Draw_Skills_Name
	.globl _Call_Draw_Skill_Cost
	.globl _Call_Get_Skill_Cost
	.globl _Call_Execute_Skill
	.globl _Call_Draw_Troop
	.globl _Call_Scene_Handler
	.globl _Call_Scroll_Message
	.globl _Call_Close_Message_Box
	.globl _Call_Draw_Message_Box
	.globl _Call_Load_Message_Box
	.globl _Call_Load_Window
	.globl _Call_Reset_NPC
	.globl _Call_Reset_Char_Sprites
	.globl _Call_Reload_Map
	.globl _Call_Set_Char_Tile
	.globl _Call_Clear_Map
	.globl _Call_Load_Char_Sprite
	.globl _Call_Set_Sprite_Packages
	.globl _Call_Orient_Char
	.globl _Call_Build_Char
	.globl _Call_Draw_Pointer
	.globl _Call_Check_Tile_Collision
	.globl _Call_Draw_Map_Load
	.globl _Call_Load_Tileset
	.globl _Call_Draw_Message
	.globl _Get_Font_Value
	.globl _Get_Skill_Useable
	.globl _Get_Required_AP
	.globl _Get_Experience
	.globl _Get_Shop
	.globl _Get_Sign
	.globl _Get_Message
	.globl _Get_Tele
	.globl _Get_Skill
	.globl _Get_Troop
	.globl _Get_Enemy
	.globl _Get_Map
	.globl _Get_Equip
	.globl _Get_Item
	.globl _Get_Class
	.globl _Get_Actor
	.globl _Count_Actors
	.globl _Save_Variables
	.globl _Refresh_Inv_Amount
	.globl _Set_Start_Variables
	.globl _scroll_screen
	.globl _shake_screen
	.globl _flash_screen
	.globl _flash_in
	.globl _flash_out
	.globl _switch_bank
	.globl _Scene_Handler
	.globl _Load_Shop
	.globl _Check_Tile_Collision_Bank18
	.globl _Draw_Line_Bank18
	.globl _Draw_Map_Bank18
	.globl _Draw_Skill_Name
	.globl _Draw_Skills_Name
	.globl _Set_Actor_Skills
	.globl _Draw_End_Message
	.globl _Get_Skill_Cost
	.globl _Draw_Skill_Cost
	.globl _Execute_Skill
	.globl _Load_Battle_Message_Box
	.globl _Draw_Troop
	.globl _Check_Step_Counter
	.globl _Load_Combat_Main
	.globl _Load_Menu_Skills
	.globl _Load_Menu_Status
	.globl _Draw_Item_Description
	.globl _Menu_Item
	.globl _Load_Menu_Equip
	.globl _Draw_Equip_Description_Large
	.globl _Equip_Equipment
	.globl _Add_Equip
	.globl _Play_Confirm
	.globl _Play_Use
	.globl _Play_Buzz
	.globl _Load_Message_Bank10
	.globl _Check_Tile_Collision_Bank9
	.globl _Draw_Line_Bank9
	.globl _Draw_Map_Bank9
	.globl _Check_Tile_Collision_Bank8
	.globl _Draw_Line_Bank8
	.globl _Draw_Map_Bank8
	.globl _Load_Menu_Main
	.globl _Menu_Main
	.globl _Load_Font_Menu
	.globl _Draw_Name
	.globl _Draw_Number
	.globl _Add_Actor
	.globl _Add_Item
	.globl _reset_char_sprites
	.globl _Close_Message_Box
	.globl _Draw_Message_Box
	.globl _Draw_Pointer
	.globl _scroll_message
	.globl _Load_Message_Box
	.globl _Load_Window
	.globl _Retrieve_Font_Value
	.globl _Reset_NPC
	.globl _Add_NPC
	.globl _Set_Sprite_Packages
	.globl _Set_Char_Tile
	.globl _Load_Char_Sprite
	.globl _Load_Hiro_Tiles
	.globl _Draw_Titlescreen
	.globl _Draw_Map
	.globl _Orient_Char
	.globl _Load_Tileset
	.globl _Reload_Map
	.globl _Clear_Map
	.globl _Update_Anim_Walk
	.globl _Update_Joypad
	.globl _hide_char
	.globl _walk_char
	.globl _walk_player
	.globl _move_char
	.globl _build_char
	.globl _gbt_update
	.globl _memcpy
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _waitpad
	.globl _add_VBL
	.globl _TitleScreenEnabledFlag
	.globl _MessageBoxFlag
	.globl _PlayerControlFlag
	.globl _game_scene
	.globl _enemy_dummy_3
	.globl _enemy_dummy_2
	.globl _enemy_dummy_1
	.globl _name_soran
	.globl _name_bud
	.globl _name_hiro
	.globl _enemy
	.globl _party
	.globl _flag_switch
	.globl _equipment_accessory
	.globl _equipment_armor
	.globl _equipment_secondary
	.globl _equipment_weapon
	.globl _equipment
	.globl _inv_amount
	.globl _inventory
	.globl _held_decimal
	.globl _parsed_decimal
	.globl _message_base
	.globl _h
	.globl _g
	.globl _f
	.globl _e
	.globl _d
	.globl _u16_j
	.globl _u16_i
	.globl _s16_j
	.globl _s16_i
	.globl _u_k
	.globl _u_l
	.globl _u_y
	.globl _u_x
	.globl _u_j
	.globl _u_i
	.globl _y
	.globl _x
	.globl _r
	.globl _n
	.globl _m
	.globl _l
	.globl _k
	.globl _j
	.globl _i
	.globl _encounter_value
	.globl _encounter_rate
	.globl _step_counter
	.globl _clock_time_hour
	.globl _clock_time_minute
	.globl _clock_time_second
	.globl _party_gold
	.globl _large_number
	.globl _saved_number
	.globl _parsed_number
	.globl _event_y
	.globl _event_x
	.globl _char_pos_y
	.globl _char_pos_x
	.globl _load_pos_y
	.globl _load_pos_x
	.globl _load_pos_y_held
	.globl _map_y2
	.globl _map_pos
	.globl _map_y
	.globl _map_x
	.globl _font_value
	.globl _current_row
	.globl _total_lines
	.globl _current_line
	.globl _current_message
	.globl _camera_focus
	.globl _blink_tick
	.globl _walk_tick
	.globl _clock_tick
	.globl _map_size_y
	.globl _map_size_x
	.globl _count_byte
	.globl _base_byte
	.globl _camera_y
	.globl _camera_x
	.globl _tile
	.globl _grid_y
	.globl _grid_x
	.globl _PlayerCharacter
	.globl _ware_count
	.globl _shop_y
	.globl _shop_x
	.globl _skills_y
	.globl _held_stat
	.globl _held_equip
	.globl _stat_change
	.globl _list_y
	.globl _equip_y
	.globl _actor_max
	.globl _actor_y
	.globl _party_max
	.globl _party_y
	.globl _item_slots
	.globl _item_2
	.globl _item_1
	.globl _slot_2
	.globl _slot_1
	.globl _selection_y
	.globl _selection_x
	.globl _menu_y
	.globl _menu_x
	.globl _skill_y
	.globl _CurrentSkillSelection
	.globl _CurrentEquipSelection
	.globl _CurrentItemSelection
	.globl _CurrentItemSlot
	.globl _CurrentItemType
	.globl _slot_selected
	.globl _amount_2
	.globl _amount_1
	.globl _slot_2_filled
	.globl _slot_1_filled
	.globl _shop_message_x
	.globl _CurrentShopSelection
	.globl _CurrentShop
	.globl _selection_max
	.globl _CurrentSelection
	.globl _CurrentMenu
	.globl _damage_modifier
	.globl _skill_damage
	.globl _turn_order_temp
	.globl _agility_temp
	.globl _turn_order
	.globl _agility
	.globl _message_y
	.globl _message_x
	.globl _enemy_action
	.globl _actor_action
	.globl _enemy_x
	.globl _action_order
	.globl _skill_selection
	.globl _target_selection
	.globl _action_selection
	.globl _enemy_selection
	.globl _selected_enemy
	.globl _total_actors
	.globl _CurrentTarget
	.globl _turn_number
	.globl _CurrentTurn
	.globl _combat_selection_y
	.globl _combat_main_y
	.globl _CurrentTroop
	.globl _CurrentCombat
	.globl _confirm_y
	.globl _confirm_x
	.globl _Collision
	.globl _Tileset
	.globl _CurrentMapBank
	.globl _CurrentMap
	.globl _held_bank
	.globl _current_bank
	.globl _Seed
	.globl _Joy
	.globl _Playing
	.globl _event_chest
	.globl _char_npc_4
	.globl _char_npc_3
	.globl _char_npc_2
	.globl _char_npc_1
	.globl _char_player
	.globl _char_cursor
	.globl _actor_soran
	.globl _actor_bud
	.globl _actor_hiro
	.globl _actor_null
	.globl _Char_Period
	.globl _Char_Gold
	.globl _Message_Background
	.globl _Message_Pointer
	.globl _Tileset_3_Map
	.globl _Tileset_2_Map
	.globl _Tileset_1_Map
	.globl _tilemap_3
	.globl _tilemap_2
	.globl _tilemap_1
	.globl _shop_test
	.globl _npc_plum_shop
	.globl _npc_test_2
	.globl _npc_test_1
	.globl _message_test
	.globl _message_obtain_health_brew
	.globl _message_plum_village_pot_1
	.globl _message_plum_headstone
	.globl _message_hiro_house_shelf
	.globl _shopkeeper_plum_item
	.globl _shopkeeper_null
	.globl _trigger_test
	.globl _trigger_null
	.globl _tele_item_shop_plum
	.globl _tele_plum_item_shop
	.globl _tele_yggdrid_plum
	.globl _tele_plum_yggdrid
	.globl _tele_bud_plum
	.globl _tele_plum_bud
	.globl _tele_hiro_plum
	.globl _tele_plum_hiro
	.globl _tele_null
	.globl _sign_test
	.globl _sign_plum_gravestone
	.globl _sign_null
	.globl _map_yggdrid
	.globl _map_bud_house
	.globl _map_plum_item_shop
	.globl _map_hiro_house
	.globl _map_plum_village
	.globl _sprite_man_down
	.globl _sprite_hiro_right
	.globl _sprite_hiro_left
	.globl _sprite_hiro_down
	.globl _sprite_hiro_up
	.globl _sprite_man_1
	.globl _sprite_hiro_right_0
	.globl _sprite_hiro_left_0
	.globl _sprite_hiro_down_2
	.globl _sprite_hiro_down_1
	.globl _sprite_hiro_down_0
	.globl _sprite_hiro_up_0
	.globl _sprite_clear
	.globl _enemy_slime
	.globl _enemy_wolf
	.globl _enemy_bee
	.globl _enemy_null
	.globl _name_wolf
	.globl _name_bee
	.globl _class_black_mage
	.globl _class_white_mage
	.globl _class_knight
	.globl _class_traveler
	.globl _name_black_mage
	.globl _name_white_mage
	.globl _name_traveler
	.globl _name_knight
	.globl _equip_copper_bracelet
	.globl _equip_cotton_garb
	.globl _equip_hoplon
	.globl _equip_rod_of_spark
	.globl _equip_mythril_rod
	.globl _equip_metal_rod
	.globl _equip_wooden_staff
	.globl _equip_wooden_sword
	.globl _equip_null
	.globl _name_copper_bracelet
	.globl _name_cotton_garb
	.globl _name_hoplon
	.globl _name_rod_of_spark
	.globl _name_mythril_rod
	.globl _name_metal_rod
	.globl _name_wooden_staff
	.globl _name_wooden_sword
	.globl _name_equip_null
	.globl _icon_coin
	.globl _icon_necklace
	.globl _icon_armor
	.globl _icon_shield
	.globl _icon_rod
	.globl _icon_staff
	.globl _icon_sword
	.globl _icon_null
	.globl _item_mana_brew
	.globl _item_life_leaf
	.globl _item_healing_brew
	.globl _item_null
	.globl _name_mana_brew
	.globl _name_life_leaf
	.globl _full_name_healing_brew
	.globl _name_healing_brew
	.globl _full_name_item_null
	.globl _name_item_null
	.globl _performant_delay
	.globl _fade_out
	.globl _fade_in
	.globl _clear_sprites
	.globl _set_bkg_map
	.globl _set_win_map
	.globl _set_bkg_tileset
	.globl _toggle_control
	.globl _Call_Draw_Map
	.globl _Call_Draw_Map_Line
	.globl _Call_Move_Char
	.globl _Menu
	.globl _Gameplay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_actor_null::
	.ds 166
_actor_hiro::
	.ds 166
_actor_bud::
	.ds 166
_actor_soran::
	.ds 166
_char_cursor::
	.ds 23
_char_player::
	.ds 23
_char_npc_1::
	.ds 23
_char_npc_2::
	.ds 23
_char_npc_3::
	.ds 23
_char_npc_4::
	.ds 23
_event_chest::
	.ds 800
_Playing::
	.ds 1
_Joy::
	.ds 1
_Seed::
	.ds 1
_current_bank::
	.ds 1
_held_bank::
	.ds 1
_CurrentMap::
	.ds 1
_CurrentMapBank::
	.ds 1
_Tileset::
	.ds 1
_Collision::
	.ds 1
_confirm_x::
	.ds 1
_confirm_y::
	.ds 1
_CurrentCombat::
	.ds 1
_CurrentTroop::
	.ds 1
_combat_main_y::
	.ds 1
_combat_selection_y::
	.ds 1
_CurrentTurn::
	.ds 1
_turn_number::
	.ds 1
_CurrentTarget::
	.ds 1
_total_actors::
	.ds 1
_selected_enemy::
	.ds 1
_enemy_selection::
	.ds 4
_action_selection::
	.ds 4
_target_selection::
	.ds 7
_skill_selection::
	.ds 7
_action_order::
	.ds 7
_enemy_x::
	.ds 1
_actor_action::
	.ds 4
_enemy_action::
	.ds 3
_message_x::
	.ds 1
_message_y::
	.ds 1
_agility::
	.ds 14
_turn_order::
	.ds 14
_agility_temp::
	.ds 2
_turn_order_temp::
	.ds 2
_skill_damage::
	.ds 2
_damage_modifier::
	.ds 2
_CurrentMenu::
	.ds 1
_CurrentSelection::
	.ds 1
_selection_max::
	.ds 1
_CurrentShop::
	.ds 1
_CurrentShopSelection::
	.ds 1
_shop_message_x::
	.ds 1
_slot_1_filled::
	.ds 1
_slot_2_filled::
	.ds 1
_amount_1::
	.ds 1
_amount_2::
	.ds 1
_slot_selected::
	.ds 1
_CurrentItemType::
	.ds 1
_CurrentItemSlot::
	.ds 1
_CurrentItemSelection::
	.ds 1
_CurrentEquipSelection::
	.ds 1
_CurrentSkillSelection::
	.ds 4
_skill_y::
	.ds 4
_menu_x::
	.ds 1
_menu_y::
	.ds 1
_selection_x::
	.ds 1
_selection_y::
	.ds 1
_slot_1::
	.ds 1
_slot_2::
	.ds 1
_item_1::
	.ds 1
_item_2::
	.ds 1
_item_slots::
	.ds 1
_party_y::
	.ds 1
_party_max::
	.ds 1
_actor_y::
	.ds 1
_actor_max::
	.ds 1
_equip_y::
	.ds 1
_list_y::
	.ds 1
_stat_change::
	.ds 1
_held_equip::
	.ds 1
_held_stat::
	.ds 1
_skills_y::
	.ds 1
_shop_x::
	.ds 1
_shop_y::
	.ds 1
_ware_count::
	.ds 1
_PlayerCharacter::
	.ds 1
_grid_x::
	.ds 2
_grid_y::
	.ds 2
_tile::
	.ds 2
_camera_x::
	.ds 1
_camera_y::
	.ds 1
_base_byte::
	.ds 1
_count_byte::
	.ds 1
_map_size_x::
	.ds 1
_map_size_y::
	.ds 1
_clock_tick::
	.ds 1
_walk_tick::
	.ds 1
_blink_tick::
	.ds 1
_camera_focus::
	.ds 1
_current_message::
	.ds 1
_current_line::
	.ds 1
_total_lines::
	.ds 1
_current_row::
	.ds 1
_font_value::
	.ds 1
_map_x::
	.ds 2
_map_y::
	.ds 2
_map_pos::
	.ds 2
_map_y2::
	.ds 2
_load_pos_y_held::
	.ds 2
_load_pos_x::
	.ds 2
_load_pos_y::
	.ds 2
_char_pos_x::
	.ds 2
_char_pos_y::
	.ds 2
_event_x::
	.ds 1
_event_y::
	.ds 1
_parsed_number::
	.ds 1
_saved_number::
	.ds 2
_large_number::
	.ds 2
_party_gold::
	.ds 2
_clock_time_second::
	.ds 2
_clock_time_minute::
	.ds 2
_clock_time_hour::
	.ds 2
_step_counter::
	.ds 1
_encounter_rate::
	.ds 1
_encounter_value::
	.ds 1
_i::
	.ds 1
_j::
	.ds 1
_k::
	.ds 1
_l::
	.ds 1
_m::
	.ds 1
_n::
	.ds 1
_r::
	.ds 1
_x::
	.ds 1
_y::
	.ds 1
_u_i::
	.ds 1
_u_j::
	.ds 1
_u_x::
	.ds 1
_u_y::
	.ds 1
_u_l::
	.ds 1
_u_k::
	.ds 1
_s16_i::
	.ds 2
_s16_j::
	.ds 2
_u16_i::
	.ds 2
_u16_j::
	.ds 2
_d::
	.ds 2
_e::
	.ds 2
_f::
	.ds 2
_g::
	.ds 2
_h::
	.ds 2
_message_base::
	.ds 16
_parsed_decimal::
	.ds 4
_held_decimal::
	.ds 3
_inventory::
	.ds 99
_inv_amount::
	.ds 99
_equipment::
	.ds 99
_equipment_weapon::
	.ds 30
_equipment_secondary::
	.ds 30
_equipment_armor::
	.ds 30
_equipment_accessory::
	.ds 30
_flag_switch::
	.ds 255
_party::
	.ds 4
_enemy::
	.ds 3
_name_hiro::
	.ds 7
_name_bud::
	.ds 7
_name_soran::
	.ds 7
_enemy_dummy_1::
	.ds 27
_enemy_dummy_2::
	.ds 27
_enemy_dummy_3::
	.ds 27
_game_scene::
	.ds 1
_PlayerControlFlag::
	.ds 1
_MessageBoxFlag::
	.ds 1
_TitleScreenEnabledFlag::
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
;Object_Actors.c:7: GameActor actor_hiro = {name_hiro, 4, 1, 1, 0, 15, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, {0, 0, 0, 0}, true, true, {3, 0}};
	ld	hl, #_actor_hiro
	ld	(hl), #<(_name_hiro)
	inc	hl
	ld	(hl), #>(_name_hiro)
	ld	hl, #(_actor_hiro + 0x0002)
	ld	(hl), #0x04
	ld	hl, #(_actor_hiro + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_actor_hiro + 0x0004)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0007)
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0009)
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x000b)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x000d)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x000f)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x0011)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x0013)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x0015)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0017)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x0019)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x001b)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_hiro + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_actor_hiro + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_actor_hiro + 0x0023)
	ld	(hl), #0x01
	ld	hl, #(_actor_hiro + 0x0024)
	ld	(hl), #0x03
	ld	hl, #(_actor_hiro + 0x0025)
	ld	(hl), #0x00
;Object_Actors.c:8: GameActor actor_bud = {name_bud, 3, 2, 1, 0, 16, 16, 0, 0, 0, 0, 0, 5, 0, 0, 0, 1, {0, 0, 0, 0}, true, true, {3, 1}};
	ld	hl, #_actor_bud
	ld	(hl), #<(_name_bud)
	inc	hl
	ld	(hl), #>(_name_bud)
	ld	hl, #(_actor_bud + 0x0002)
	ld	(hl), #0x03
	ld	hl, #(_actor_bud + 0x0003)
	ld	(hl), #0x02
	ld	hl, #(_actor_bud + 0x0004)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0007)
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0009)
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x000b)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x000d)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x000f)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x0011)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x0013)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x0015)
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0017)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x0019)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x001b)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_bud + 0x001d)
	ld	(hl), #0x01
	ld	hl, #(_actor_bud + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_actor_bud + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_actor_bud + 0x0023)
	ld	(hl), #0x01
	ld	hl, #(_actor_bud + 0x0024)
	ld	(hl), #0x03
	ld	hl, #(_actor_bud + 0x0025)
	ld	(hl), #0x01
;Object_Actors.c:9: GameActor actor_soran = {name_soran, 5, 3, 1, 0, 14, 14, 5, 5, 0, 0, 0, 3, 0, 0, 0, 2, {0, 0, 0, 0}, true, true, {3, 1}};
	ld	hl, #_actor_soran
	ld	(hl), #<(_name_soran)
	inc	hl
	ld	(hl), #>(_name_soran)
	ld	hl, #(_actor_soran + 0x0002)
	ld	(hl), #0x05
	ld	hl, #(_actor_soran + 0x0003)
	ld	(hl), #0x03
	ld	hl, #(_actor_soran + 0x0004)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0007)
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0009)
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x000b)
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x000d)
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x000f)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x0011)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x0013)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x0015)
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0017)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x0019)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x001b)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_actor_soran + 0x001d)
	ld	(hl), #0x02
	ld	hl, #(_actor_soran + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_actor_soran + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_actor_soran + 0x0023)
	ld	(hl), #0x01
	ld	hl, #(_actor_soran + 0x0024)
	ld	(hl), #0x03
	ld	hl, #(_actor_soran + 0x0025)
	ld	(hl), #0x01
;Object_Characters.c:8: GameCharacter char_player = {true, messenger, 0, 0, {0, 20}};
	ld	hl, #_char_player
	ld	(hl), #0x01
	ld	hl, #(_char_player + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_char_player + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_char_player + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_char_player + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_char_player + 0x0005)
	ld	(hl), #0x14
;Object_Characters.c:10: GameCharacter char_npc_1 = {false, messenger, 0, 6, {4, 22}};
	ld	hl, #_char_npc_1
	ld	(hl), #0x00
	ld	hl, #(_char_npc_1 + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_1 + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_1 + 0x0003)
	ld	(hl), #0x06
	ld	hl, #(_char_npc_1 + 0x0004)
	ld	(hl), #0x04
	ld	hl, #(_char_npc_1 + 0x0005)
	ld	(hl), #0x16
;Object_Characters.c:11: GameCharacter char_npc_2 = {false, messenger, 0, 12, {8, 24}};
	ld	hl, #_char_npc_2
	ld	(hl), #0x00
	ld	hl, #(_char_npc_2 + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_2 + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_2 + 0x0003)
	ld	(hl), #0x0c
	ld	hl, #(_char_npc_2 + 0x0004)
	ld	(hl), #0x08
	ld	hl, #(_char_npc_2 + 0x0005)
	ld	(hl), #0x18
;Object_Characters.c:12: GameCharacter char_npc_3 = {false, messenger, 0, 18, {12, 26}};
	ld	hl, #_char_npc_3
	ld	(hl), #0x00
	ld	hl, #(_char_npc_3 + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_3 + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_char_npc_3 + 0x0003)
	ld	(hl), #0x12
	ld	hl, #(_char_npc_3 + 0x0004)
	ld	(hl), #0x0c
	ld	hl, #(_char_npc_3 + 0x0005)
	ld	(hl), #0x1a
;Object_Events.c:5: GameEvent event_chest = //* Chest events
	ld	hl, #_event_chest
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x0001)
	ld	(hl), #0x01
	ld	hl, #(_event_chest + 0x0064)
	ld	(hl), #0x01
	ld	hl, #(_event_chest + 0x0065)
	ld	(hl), #0x03
	ld	hl, #(_event_chest + 0x00c8)
	ld	(hl), #0x0b
	ld	hl, #(_event_chest + 0x00c9)
	ld	(hl), #0x0f
	ld	hl, #(_event_chest + 0x012c)
	ld	(hl), #0x0b
	ld	hl, #(_event_chest + 0x012d)
	ld	(hl), #0x0b
	ld	hl, #(_event_chest + 0x0190)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x0191)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x01f4)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x01f5)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x0258)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x0259)
	ld	(hl), #0x00
	ld	hl, #(_event_chest + 0x02bc)
	ld	(hl), #0x03
	ld	hl, #(_event_chest + 0x02bd)
	ld	(hl), #0x03
;bank0.c:49: UBYTE CurrentMenu, CurrentSelection, selection_max = 5, CurrentShop, CurrentShopSelection, shop_message_x;
	ld	hl, #_selection_max
	ld	(hl), #0x05
;bank0.c:55: UINT8 PlayerCharacter = 0;
	ld	hl, #_PlayerCharacter
	ld	(hl), #0x00
;bank0.c:77: UINT16 party_gold = 500;
	ld	hl, #_party_gold
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0x01
;bank0.c:81: UBYTE step_counter = 6, encounter_rate = 50, encounter_value;
	ld	hl, #_step_counter
	ld	(hl), #0x06
;bank0.c:81: 
	ld	hl, #_encounter_rate
	ld	(hl), #0x32
;bank0.c:115: unsigned char party[4] = {0, 0, 0, 0};
	ld	hl, #_party
	ld	(hl), #0x00
	ld	hl, #(_party + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_party + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_party + 0x0003)
	ld	(hl), #0x00
;bank0.c:117: unsigned char enemy[3] = {0, 0, 0};
	ld	bc, #_enemy+0
	xor	a, a
	ld	(bc), a
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0x00
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;bank0.c:119: unsigned char name_hiro[7] =
	ld	hl, #_name_hiro
	ld	(hl), #0x42
	ld	hl, #(_name_hiro + 0x0001)
	ld	(hl), #0x1e
	ld	hl, #(_name_hiro + 0x0002)
	ld	(hl), #0x27
	ld	hl, #(_name_hiro + 0x0003)
	ld	(hl), #0x24
	ld	hl, #(_name_hiro + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_name_hiro + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_name_hiro + 0x0006)
	ld	(hl), #0x01
;bank0.c:124: unsigned char name_bud[7] =
	ld	hl, #_name_bud
	ld	(hl), #0x3c
	ld	hl, #(_name_bud + 0x0001)
	ld	(hl), #0x2b
	ld	hl, #(_name_bud + 0x0002)
	ld	(hl), #0x19
	ld	hl, #(_name_bud + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_name_bud + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_name_bud + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_name_bud + 0x0006)
	ld	(hl), #0x01
;bank0.c:129: unsigned char name_soran[7] =
	ld	hl, #_name_soran
	ld	(hl), #0x4d
	ld	hl, #(_name_soran + 0x0001)
	ld	(hl), #0x24
	ld	hl, #(_name_soran + 0x0002)
	ld	(hl), #0x27
	ld	hl, #(_name_soran + 0x0003)
	ld	(hl), #0x16
	ld	hl, #(_name_soran + 0x0004)
	ld	(hl), #0x23
	ld	hl, #(_name_soran + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_name_soran + 0x0006)
	ld	(hl), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;bank0.c:323: void switch_bank(UBYTE bank)
;	---------------------------------
; Function switch_bank
; ---------------------------------
_switch_bank::
;bank0.c:325: current_bank = bank;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_current_bank),a
;bank0.c:326: SWITCH_ROM_MBC5(bank);
	ldh	(__current_bank+0),a
	ld	hl, #0x3000
	ld	(hl), #0x00
	ld	h, #0x20
	ld	(hl), a
;bank0.c:327: }
	ret
_name_item_null:
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
_full_name_item_null:
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_name_healing_brew:
	.db #0x42	; 66	'B'
	.db #0x55	; 85	'U'
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x2d	; 45
_full_name_healing_brew:
	.db #0x42	; 66	'B'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x21	; 33
	.db #0x2a	; 42
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x2d	; 45
	.db #0x01	; 1
_name_life_leaf:
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x46	; 70	'F'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x1b	; 27
_name_mana_brew:
	.db #0x47	; 71	'G'
	.db #0x55	; 85	'U'
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x2d	; 45
_item_null:
	.dw _name_item_null
	.dw _full_name_item_null
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw _Null_Item_Description
_item_healing_brew:
	.dw _name_healing_brew
	.dw _full_name_healing_brew
	.db #0x01	; 1
	.db #0x01	; 1
	.dw #0x0005
	.dw _Healing_Brew_Description
_item_life_leaf:
	.dw _name_life_leaf
	.dw _full_name_healing_brew
	.db #0x02	; 2
	.db #0x03	; 3
	.dw #0x012c
	.dw _Null_Item_Description
_item_mana_brew:
	.dw _name_mana_brew
	.dw _full_name_healing_brew
	.db #0x03	; 3
	.db #0x02	; 2
	.dw #0x01f4
	.dw _Mana_Brew_Description
_icon_null:
	.db #0x01	; 1
_icon_sword:
	.db #0x6e	; 110	'n'
_icon_staff:
	.db #0x6f	; 111	'o'
_icon_rod:
	.db #0x76	; 118	'v'
_icon_shield:
	.db #0x70	; 112	'p'
_icon_armor:
	.db #0x71	; 113	'q'
_icon_necklace:
	.db #0x74	; 116	't'
_icon_coin:
	.db #0x75	; 117	'u'
_name_equip_null:
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x01	; 1
_name_wooden_sword:
	.db #0x51	; 81	'Q'
	.db #0x55	; 85	'U'
	.db #0x4d	; 77	'M'
	.db #0x2d	; 45
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x19	; 25
_name_wooden_staff:
	.db #0x51	; 81	'Q'
	.db #0x55	; 85	'U'
	.db #0x4d	; 77	'M'
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0x1b	; 27
	.db #0x1b	; 27
_name_metal_rod:
	.db #0x47	; 71	'G'
	.db #0x55	; 85	'U'
	.db #0x4c	; 76	'L'
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x01	; 1
_name_mythril_rod:
	.db #0x47	; 71	'G'
	.db #0x2f	; 47
	.db #0x55	; 85	'U'
	.db #0x4c	; 76	'L'
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x01	; 1
_name_rod_of_spark:
	.db #0x4d	; 77	'M'
	.db #0x25	; 37
	.db #0x55	; 85	'U'
	.db #0x4c	; 76	'L'
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x01	; 1
_name_hoplon:
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x21	; 33
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x01	; 1
_name_cotton_garb:
	.db #0x3d	; 61
	.db #0x55	; 85	'U'
	.db #0x41	; 65	'A'
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x17	; 23
	.db #0x01	; 1
_name_copper_bracelet:
	.db #0x3d	; 61
	.db #0x55	; 85	'U'
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x1a	; 26
_equip_null:
	.dw _name_equip_null
	.dw _icon_null
	.dw _Null_Equip_Description
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
_equip_wooden_sword:
	.dw _name_wooden_sword
	.dw _icon_sword
	.dw _Wooden_Sword_Description
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
	.db #0x03	; 3
	.dw #0x004b
_equip_wooden_staff:
	.dw _name_wooden_staff
	.dw _icon_staff
	.dw _Null_Equip_Description
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x004b
_equip_metal_rod:
	.dw _name_metal_rod
	.dw _icon_rod
	.dw _Null_Equip_Description
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2b	; 43
	.dw #0x004b
_equip_mythril_rod:
	.dw _name_mythril_rod
	.dw _icon_rod
	.dw _Null_Equip_Description
	.db #0x2b	; 43
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x004b
_equip_rod_of_spark:
	.dw _name_rod_of_spark
	.dw _icon_rod
	.dw _Null_Equip_Description
	.db #0x2d	; 45
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.dw #0x004b
_equip_hoplon:
	.dw _name_hoplon
	.dw _icon_shield
	.dw _Null_Equip_Description
	.db #0x3d	; 61
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x004b
_equip_cotton_garb:
	.dw _name_cotton_garb
	.dw _icon_armor
	.dw _Null_Equip_Description
	.db #0x51	; 81	'Q'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.dw #0x004b
_equip_copper_bracelet:
	.dw _name_copper_bracelet
	.dw _icon_necklace
	.dw _Null_Equip_Description
	.db #0x65	; 101	'e'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x004b
_name_knight:
	.db #0x45	; 69	'E'
	.db #0x48	; 72	'H'
	.db #0x4e	; 78	'N'
_name_traveler:
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x4c	; 76	'L'
_name_white_mage:
	.db #0x51	; 81	'Q'
	.db #0x47	; 71	'G'
	.db #0x41	; 65	'A'
_name_black_mage:
	.db #0x3c	; 60
	.db #0x47	; 71	'G'
	.db #0x41	; 65	'A'
_class_traveler:
	.dw _name_traveler
	.dw _icon_null
	.dw _name_traveler
	.db #0x00	; 0
_class_knight:
	.dw _name_knight
	.dw _icon_sword
	.dw _name_knight
	.db #0x01	; 1
_class_white_mage:
	.dw _name_white_mage
	.dw _icon_staff
	.dw _name_white_mage
	.db #0x02	; 2
_class_black_mage:
	.dw _name_black_mage
	.dw _icon_rod
	.dw _name_black_mage
	.db #0x03	; 3
_name_bee:
	.db #0x3c	; 60
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_name_wolf:
	.db #0x51	; 81	'Q'
	.db #0x24	; 36
	.db #0x21	; 33
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_enemy_null:
	.dw _name_bee
	.db #0x00	; 0
	.dw _name_bee
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_enemy_bee:
	.dw _name_bee
	.db #0x03	; 3
	.dw _name_bee
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.dw #0x0009
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_enemy_wolf:
	.dw _name_wolf
	.db #0x04	; 4
	.dw _name_bee
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x02	; 2
	.dw #0x000f
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_enemy_slime:
	.dw _name_bee
	.db #0x03	; 3
	.dw _name_bee
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x03	; 3
	.dw #0x0014
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sprite_clear:
	.dw _Clear_Tiles
_sprite_hiro_up_0:
	.dw _Hiro_TilesBLK0
_sprite_hiro_down_0:
	.dw _Tiles_HiroBLK0
_sprite_hiro_down_1:
	.dw _Tiles_HiroBLK1
_sprite_hiro_down_2:
	.dw _Tiles_HiroBLK2
_sprite_hiro_left_0:
	.dw _Hiro_TilesBLK2
_sprite_hiro_right_0:
	.dw _Hiro_TilesBLK3
_sprite_man_1:
	.dw _Tiles_Man_1BLK0
_sprite_hiro_up:
	.dw _sprite_hiro_up_0
	.dw _sprite_clear
	.dw _sprite_clear
	.dw _sprite_clear
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_sprite_hiro_down:
	.dw _sprite_hiro_down_0
	.dw _sprite_hiro_down_1
	.dw _sprite_hiro_down_2
	.dw _sprite_clear
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_sprite_hiro_left:
	.dw _sprite_hiro_left_0
	.dw _sprite_clear
	.dw _sprite_clear
	.dw _sprite_clear
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_sprite_hiro_right:
	.dw _sprite_hiro_right_0
	.dw _sprite_clear
	.dw _sprite_clear
	.dw _sprite_clear
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_sprite_man_down:
	.dw _sprite_man_1
	.dw _sprite_clear
	.dw _sprite_clear
	.dw _sprite_clear
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_map_plum_village:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x20	; 32
	.dw _Map_PlumVillagePLN0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x07	; 7
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x01	; 1
	.db #0x02	; 2
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _trigger_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _shopkeeper_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_map_hiro_house:
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0e	; 14
	.dw _Map_Hiro_HousePLN0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _trigger_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _shopkeeper_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_map_plum_item_shop:
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0e	; 14
	.dw _Map_Plum_Item_ShopPLN0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _trigger_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _shopkeeper_plum_item
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_map_bud_house:
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0e	; 14
	.dw _Map_Bud_HousePLN0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _trigger_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _shopkeeper_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_map_yggdrid:
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0xff	; 255
	.dw _Map_YggdridPLN0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _trigger_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.dw _shopkeeper_null
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_sign_null:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sign_plum_gravestone:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
_sign_test:
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x01	; 1
_tele_null:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_tele_plum_hiro:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x02	; 2
_tele_hiro_plum:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x01	; 1
_tele_plum_bud:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x04	; 4
_tele_bud_plum:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x03	; 3
_tele_plum_yggdrid:
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x06	; 6
_tele_yggdrid_plum:
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x71	; 113	'q'
	.db #0xd6	; 214
	.db #0x01	; 1
	.db #0x05	; 5
_tele_plum_item_shop:
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x08	; 8
_tele_item_shop_plum:
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x07	; 7
_trigger_null:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_trigger_test:
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x00	; 0
_shopkeeper_null:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
_shopkeeper_plum_item:
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.dw _shop_test
_message_hiro_house_shelf:
	.db #0x0a	; 10
	.dw _Message_Hiro_House_ShelfPLN0
	.db #0x08	; 8
_message_plum_headstone:
	.db #0x0a	; 10
	.dw _Message_Plum_HeadstonePLN0
	.db #0x02	; 2
_message_plum_village_pot_1:
	.db #0x0a	; 10
	.dw _Message_Hiro_House_ShelfPLN0
	.db #0x08	; 8
_message_obtain_health_brew:
	.db #0x0a	; 10
	.dw _Message_Hiro_House_ShelfPLN0
	.db #0x08	; 8
_message_test:
	.db #0x0a	; 10
	.dw _Message_TestTextPLN0
	.db #0x02	; 2
_npc_test_1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x06	; 6
	.dw _sprite_hiro_up
	.dw _sprite_man_down
	.dw _sprite_hiro_left
	.dw _sprite_hiro_right
_npc_test_2:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x10	; 16
	.dw _sprite_hiro_up
	.dw _sprite_man_down
	.dw _sprite_hiro_left
	.dw _sprite_hiro_right
_npc_plum_shop:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x05	; 5
	.dw _sprite_hiro_up
	.dw _sprite_man_down
	.dw _sprite_hiro_left
	.dw _sprite_hiro_right
_shop_test:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x15	; 21
	.db #0x29	; 41
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x3d	; 61
	.db #0x51	; 81	'Q'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _Message_Shop_PlumItemPLN0
_tilemap_1:
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_tilemap_2:
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_tilemap_3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x01	; 1
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
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_Tileset_1_Map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x13	; 19
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x23	; 35
	.db #0x22	; 34
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x26	; 38
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2b	; 43
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2f	; 47
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x41	; 65	'A'
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x45	; 69	'E'
	.db #0x44	; 68	'D'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4d	; 77	'M'
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x54	; 84	'T'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x59	; 89	'Y'
	.db #0x58	; 88	'X'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5d	; 93
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x69	; 105	'i'
	.db #0x68	; 104	'h'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6d	; 109	'm'
	.db #0x6c	; 108	'l'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x75	; 117	'u'
	.db #0x74	; 116	't'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x79	; 121	'y'
	.db #0x78	; 120	'x'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0x86	; 134
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8b	; 139
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x93	; 147
	.db #0x92	; 146
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x96	; 150
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x9a	; 154
	.db #0x9c	; 156
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x9e	; 158
	.db #0xa8	; 168
	.db #0xb3	; 179
	.db #0xa7	; 167
	.db #0xb4	; 180
	.db #0xb6	; 182
	.db #0xaf	; 175
	.db #0xb1	; 177
	.db #0xa6	; 166
	.db #0xb2	; 178
	.db #0xa5	; 165
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xba	; 186
	.db #0xa9	; 169
	.db #0xaa	; 170
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xab	; 171
	.db #0xa6	; 166
	.db #0xac	; 172
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xbc	; 188
	.db #0xad	; 173
	.db #0xa7	; 167
	.db #0xae	; 174
	.db #0xa8	; 168
	.db #0xa1	; 161
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa3	; 163
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xa2	; 162
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa4	; 164
	.db #0xa5	; 165
	.db #0xa3	; 163
	.db #0xa2	; 162
	.db #0xa8	; 168
	.db #0xa1	; 161
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa4	; 164
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbe	; 190
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_Tileset_2_Map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x07	; 7
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x20	; 32
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x23	; 35
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x21	; 33
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x20	; 32
	.db #0x1d	; 29
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x1d	; 29
	.db #0x20	; 32
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x1d	; 29
	.db #0x20	; 32
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x33	; 51	'3'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x38	; 56	'8'
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x3b	; 59
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x41	; 65	'A'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x4f	; 79	'O'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x58	; 88	'X'
	.db #0x56	; 86	'V'
	.db #0x59	; 89	'Y'
	.db #0x57	; 87	'W'
	.db #0x4c	; 76	'L'
	.db #0x5a	; 90	'Z'
	.db #0x4d	; 77	'M'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x5d	; 93
	.db #0x51	; 81	'Q'
	.db #0x68	; 104	'h'
	.db #0x6a	; 106	'j'
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x65	; 101	'e'
	.db #0x67	; 103	'g'
	.db #0x6c	; 108	'l'
	.db #0x6e	; 110	'n'
	.db #0x6d	; 109	'm'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x71	; 113	'q'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x76	; 118	'v'
	.db #0x75	; 117	'u'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x7a	; 122	'z'
	.db #0x79	; 121	'y'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x4e	; 78	'N'
	.db #0x4e	; 78	'N'
	.db #0x54	; 84	'T'
	.db #0x58	; 88	'X'
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
	.db #0x58	; 88	'X'
	.db #0x56	; 86	'V'
	.db #0x88	; 136
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0x8e	; 142
	.db #0x8d	; 141
	.db #0x8f	; 143
	.db #0x88	; 136
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0x8b	; 139
_Tileset_3_Map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x07	; 7
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x20	; 32
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x23	; 35
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x21	; 33
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x23	; 35
	.db #0x21	; 33
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x36	; 54	'6'
	.db #0x38	; 56	'8'
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x2a	; 42
	.db #0x30	; 48	'0'
	.db #0x2b	; 43
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x2c	; 44
	.db #0x2f	; 47
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x3d	; 61
	.db #0x2a	; 42
	.db #0x3c	; 60
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x3b	; 59
	.db #0x2d	; 45
	.db #0x3a	; 58
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x3b	; 59
	.db #0x3d	; 61
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x32	; 50	'2'
	.db #0x38	; 56	'8'
	.db #0x2f	; 47
	.db #0x2d	; 45
	.db #0x36	; 54	'6'
	.db #0x34	; 52	'4'
	.db #0x2b	; 43
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x2c	; 44
	.db #0x33	; 51	'3'
	.db #0x39	; 57	'9'
	.db #0x2a	; 42
	.db #0x30	; 48	'0'
	.db #0x37	; 55	'7'
	.db #0x35	; 53	'5'
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0x35	; 53	'5'
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.db #0x36	; 54	'6'
	.db #0x34	; 52	'4'
	.db #0x37	; 55	'7'
	.db #0x35	; 53	'5'
	.db #0x32	; 50	'2'
	.db #0x38	; 56	'8'
	.db #0x33	; 51	'3'
	.db #0x39	; 57	'9'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x58	; 88	'X'
	.db #0x56	; 86	'V'
	.db #0x59	; 89	'Y'
	.db #0x57	; 87	'W'
	.db #0x4c	; 76	'L'
	.db #0x5a	; 90	'Z'
	.db #0x4d	; 77	'M'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x5d	; 93
	.db #0x51	; 81	'Q'
	.db #0x68	; 104	'h'
	.db #0x6a	; 106	'j'
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x65	; 101	'e'
	.db #0x67	; 103	'g'
	.db #0x6c	; 108	'l'
	.db #0x6e	; 110	'n'
	.db #0x6d	; 109	'm'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x71	; 113	'q'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x76	; 118	'v'
	.db #0x75	; 117	'u'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x7a	; 122	'z'
	.db #0x79	; 121	'y'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0xa1	; 161
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa3	; 163
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xa2	; 162
	.db #0xa8	; 168
	.db #0xa5	; 165
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa4	; 164
	.db #0xa5	; 165
	.db #0xa3	; 163
	.db #0xa2	; 162
	.db #0xa8	; 168
	.db #0xa1	; 161
	.db #0xa7	; 167
	.db #0xa6	; 166
	.db #0xa4	; 164
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xbe	; 190
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_Message_Pointer:
	.db #0xd2	; 210
_Message_Background:
	.db #0xd3	; 211
_Char_Gold:
	.db #0x1c	; 28
_Char_Period:
	.db #0x55	; 85	'U'
;bank0.c:329: void performant_delay(UBYTE num_loops)
;	---------------------------------
; Function performant_delay
; ---------------------------------
_performant_delay::
;bank0.c:331: for(g = 0; g < num_loops; g++)
	ld	hl, #_g
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_g
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ret	NC
;bank0.c:333: wait_vbl_done();
	call	_wait_vbl_done
;bank0.c:331: for(g = 0; g < num_loops; g++)
	ld	hl, #_g
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
;bank0.c:335: }
	jr	00103$
;bank0.c:337: void fade_out()
;	---------------------------------
; Function fade_out
; ---------------------------------
_fade_out::
;bank0.c:339: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;bank0.c:341: switch(i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:343: case 0:
00101$:
;bank0.c:344: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;bank0.c:345: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
;bank0.c:346: break;
	jr	00105$
;bank0.c:347: case 1:
00102$:
;bank0.c:348: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;bank0.c:349: OBP0_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_OBP0_REG+0),a
;bank0.c:350: break;
	jr	00105$
;bank0.c:351: case 2:
00103$:
;bank0.c:352: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;bank0.c:353: OBP0_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_OBP0_REG+0),a
;bank0.c:354: break;
	jr	00105$
;bank0.c:355: case 3:
00104$:
;bank0.c:356: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;bank0.c:357: OBP0_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP0_REG+0),a
;bank0.c:359: }
00105$:
;bank0.c:361: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:339: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00107$
;bank0.c:363: }
	ret
;bank0.c:365: void fade_in()
;	---------------------------------
; Function fade_in
; ---------------------------------
_fade_in::
;bank0.c:367: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;bank0.c:369: switch(i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:371: case 0:
00101$:
;bank0.c:372: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;bank0.c:373: OBP0_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP0_REG+0),a
;bank0.c:374: break;
	jr	00105$
;bank0.c:375: case 1:
00102$:
;bank0.c:376: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;bank0.c:377: OBP0_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_OBP0_REG+0),a
;bank0.c:378: break;
	jr	00105$
;bank0.c:379: case 2:
00103$:
;bank0.c:380: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;bank0.c:381: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
;bank0.c:382: break;
	jr	00105$
;bank0.c:383: case 3:
00104$:
;bank0.c:384: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;bank0.c:385: OBP0_REG = 0xD0;
	ld	a, #0xd0
	ldh	(_OBP0_REG+0),a
;bank0.c:387: }
00105$:
;bank0.c:389: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:367: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00107$
;bank0.c:391: }
	ret
;bank0.c:393: void flash_out()
;	---------------------------------
; Function flash_out
; ---------------------------------
_flash_out::
;bank0.c:395: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;bank0.c:397: switch(i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:399: case 0:
00101$:
;bank0.c:400: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;bank0.c:401: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
;bank0.c:402: break;
	jr	00105$
;bank0.c:403: case 1:
00102$:
;bank0.c:404: BGP_REG = 0x90;
	ld	a, #0x90
	ldh	(_BGP_REG+0),a
;bank0.c:405: OBP0_REG = 0x90;
	ld	a, #0x90
	ldh	(_OBP0_REG+0),a
;bank0.c:406: break;
	jr	00105$
;bank0.c:407: case 2:
00103$:
;bank0.c:408: BGP_REG = 0x40;
	ld	a, #0x40
	ldh	(_BGP_REG+0),a
;bank0.c:409: OBP0_REG = 0x40;
	ld	a, #0x40
	ldh	(_OBP0_REG+0),a
;bank0.c:410: break;
	jr	00105$
;bank0.c:411: case 3:
00104$:
;bank0.c:412: BGP_REG = 0x00;
	ld	a, #0x00
	ldh	(_BGP_REG+0),a
;bank0.c:413: OBP0_REG = 0x00;
	ld	a, #0x00
	ldh	(_OBP0_REG+0),a
;bank0.c:415: }
00105$:
;bank0.c:417: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:395: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00107$
;bank0.c:419: }
	ret
;bank0.c:421: void flash_in()
;	---------------------------------
; Function flash_in
; ---------------------------------
_flash_in::
;bank0.c:423: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;bank0.c:425: switch(i)
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:427: case 0:
00101$:
;bank0.c:428: BGP_REG = 0x00;
	ld	a, #0x00
	ldh	(_BGP_REG+0),a
;bank0.c:429: OBP0_REG = 0x00;
	ld	a, #0x00
	ldh	(_OBP0_REG+0),a
;bank0.c:430: break;
	jr	00105$
;bank0.c:431: case 1:
00102$:
;bank0.c:432: BGP_REG = 0x40;
	ld	a, #0x40
	ldh	(_BGP_REG+0),a
;bank0.c:433: OBP0_REG = 0x40;
	ld	a, #0x40
	ldh	(_OBP0_REG+0),a
;bank0.c:434: break;
	jr	00105$
;bank0.c:435: case 2:
00103$:
;bank0.c:436: BGP_REG = 0x90;
	ld	a, #0x90
	ldh	(_BGP_REG+0),a
;bank0.c:437: OBP0_REG = 0x90;
	ld	a, #0x90
	ldh	(_OBP0_REG+0),a
;bank0.c:438: break;
	jr	00105$
;bank0.c:439: case 3:
00104$:
;bank0.c:440: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;bank0.c:441: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
;bank0.c:443: }
00105$:
;bank0.c:445: performant_delay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:423: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00107$
;bank0.c:447: }
	ret
;bank0.c:449: void flash_screen()
;	---------------------------------
; Function flash_screen
; ---------------------------------
_flash_screen::
;bank0.c:451: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00102$:
;bank0.c:453: BGP_REG = 0x90;
	ld	a, #0x90
	ldh	(_BGP_REG+0),a
;bank0.c:454: OBP0_REG = 0x90;
	ld	a, #0x90
	ldh	(_OBP0_REG+0),a
;bank0.c:456: wait_vbl_done();
	call	_wait_vbl_done
;bank0.c:458: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;bank0.c:459: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
;bank0.c:451: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00102$
;bank0.c:461: }
	ret
;bank0.c:463: void shake_screen()
;	---------------------------------
; Function shake_screen
; ---------------------------------
_shake_screen::
;bank0.c:465: for(r = 0; r < 3; r++)
	ld	hl, #_r
	ld	(hl), #0x00
00106$:
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, #0xfe
	ldh	(_SCX_REG+0),a
;bank0.c:469: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, #0x02
	ldh	(_SCX_REG+0),a
;bank0.c:473: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, #0x02
	ldh	(_SCX_REG+0),a
;bank0.c:477: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, #0xfe
	ldh	(_SCX_REG+0),a
;bank0.c:481: performant_delay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:465: for(r = 0; r < 3; r++)
	ld	hl, #_r
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00106$
;bank0.c:484: performant_delay(20);
	ld	a, #0x14
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank0.c:485: }
	ret
;bank0.c:487: void scroll_screen(INT8 move_x, INT8 move_y)
;	---------------------------------
; Function scroll_screen
; ---------------------------------
_scroll_screen::
;bank0.c:489: s16_i = move_x * 16;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ld	hl, #_s16_i
	ld	(hl), c
	inc	hl
	ld	(hl), a
;bank0.c:490: s16_j = move_y * 16;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ld	hl, #_s16_j
	ld	(hl), c
	inc	hl
	ld	(hl), a
;bank0.c:491: scroll_bkg(move_x, move_y);
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	c, a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, b
	ldh	(_SCX_REG+0),a
	ldh	a, (_SCY_REG+0)
	add	a, c
	ldh	(_SCY_REG+0),a
;bank0.c:491: scroll_bkg(move_x, move_y);
;bank0.c:492: }
	ret
;bank0.c:494: void clear_sprites()
;	---------------------------------
; Function clear_sprites
; ---------------------------------
_clear_sprites::
;bank0.c:496: for(i = 0; i < 20; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00103$:
;bank0.c:498: set_sprite_tile(i, 70);
	ld	hl, #_i
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x46
;bank0.c:496: for(i = 0; i < 20; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x94
	jr	C, 00103$
;bank0.c:500: }
	ret
;bank0.c:502: void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0)
;	---------------------------------
; Function set_bkg_map
; ---------------------------------
_set_bkg_map::
;bank0.c:504: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;bank0.c:506: set_bkg_tiles(tile_x, tile_y, width, height, map_1);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank0.c:508: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;bank0.c:510: set_bkg_tiles(tile_x, tile_y, width, height, map_0);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;bank0.c:512: }
	ret
;bank0.c:514: void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0)
;	---------------------------------
; Function set_win_map
; ---------------------------------
_set_win_map::
;bank0.c:516: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;bank0.c:518: set_win_tiles(tile_x, tile_y, width, height, map_1);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank0.c:520: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;bank0.c:522: set_win_tiles(tile_x, tile_y, width, height, map_0);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank0.c:524: }
	ret
;bank0.c:526: void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset)
;	---------------------------------
; Function set_bkg_tileset
; ---------------------------------
_set_bkg_tileset::
;bank0.c:528: set_bkg_data(first_tile, num_tile, tileset);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;bank0.c:529: }
	ret
;bank0.c:531: void toggle_control(UBYTE toggle)
;	---------------------------------
; Function toggle_control
; ---------------------------------
_toggle_control::
;bank0.c:533: PlayerControlFlag = toggle;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_PlayerControlFlag),a
;bank0.c:534: }
	ret
;bank0.c:539: void Set_Start_Variables(void)
;	---------------------------------
; Function Set_Start_Variables
; ---------------------------------
_Set_Start_Variables::
;bank0.c:541: PlayerControlFlag = true;
	ld	hl, #_PlayerControlFlag
	ld	(hl), #0x01
;bank0.c:542: char_player.pos_x = 6;
	ld	hl, #(_char_player + 0x0006)
	ld	(hl), #0x06
;bank0.c:543: char_player.pos_y = 6;
	ld	hl, #(_char_player + 0x0007)
	ld	(hl), #0x06
;bank0.c:544: CurrentMap = 0;
	ld	hl, #_CurrentMap
	ld	(hl), #0x00
;bank0.c:548: inv_amount[0] = 1;
	ld	hl, #_inv_amount
	ld	(hl), #0x01
;bank0.c:550: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:552: Add_Actor(&actor_hiro);
	ld	hl, #_actor_hiro
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:553: Add_Actor(&actor_bud);
	ld	hl, #_actor_bud
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:554: Add_Actor(&actor_soran);
	ld	hl, #_actor_soran
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:556: switch_bank(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:558: Add_Equip(&equip_wooden_staff);
	ld	hl, #_equip_wooden_staff
	push	hl
	call	_Add_Equip
	add	sp, #2
;bank0.c:559: Add_Equip(&equip_metal_rod);
	ld	hl, #_equip_metal_rod
	push	hl
	call	_Add_Equip
	add	sp, #2
;bank0.c:560: Add_Equip(&equip_mythril_rod);
	ld	hl, #_equip_mythril_rod
	push	hl
	call	_Add_Equip
	add	sp, #2
;bank0.c:561: Add_Equip(&equip_rod_of_spark);
	ld	hl, #_equip_rod_of_spark
	push	hl
	call	_Add_Equip
	add	sp, #2
;bank0.c:563: Equip_Equipment(&actor_hiro, &equip_wooden_sword);
	ld	hl, #_equip_wooden_sword
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:564: Equip_Equipment(&actor_hiro, &equip_hoplon);
	ld	hl, #_equip_hoplon
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:565: Equip_Equipment(&actor_hiro, &equip_cotton_garb);
	ld	hl, #_equip_cotton_garb
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:566: Equip_Equipment(&actor_hiro, &equip_copper_bracelet);
	ld	hl, #_equip_copper_bracelet
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:567: }
	ret
;bank0.c:569: void Refresh_Inv_Amount(void)
;	---------------------------------
; Function Refresh_Inv_Amount
; ---------------------------------
_Refresh_Inv_Amount::
;bank0.c:571: for(i = 0; i < 99; i ++)
	ld	hl, #_i
	ld	(hl), #0x00
00104$:
;bank0.c:573: if(inventory[i] < 1)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_inventory
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00105$
;bank0.c:575: inv_amount[i] = 0;
	ld	hl, #_inv_amount
	add	hl, bc
	ld	(hl), #0x00
00105$:
;bank0.c:571: for(i = 0; i < 99; i ++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe3
	jr	C, 00104$
;bank0.c:578: }
	ret
;bank0.c:580: void Save_Variables(void) //* Saves all "save" variables.
;	---------------------------------
; Function Save_Variables
; ---------------------------------
_Save_Variables::
;bank0.c:582: saved_pos_x = char_player.pos_x;
	ld	a, (#(_char_player + 0x0006) + 0)
	ld	(#_saved_pos_x),a
;bank0.c:583: saved_pos_y = char_player.pos_y;
	ld	a, (#(_char_player + 0x0007) + 0)
	ld	(#_saved_pos_y),a
;bank0.c:585: saved_clock_time_second = clock_time_second;
	ld	hl, #_clock_time_second
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_saved_clock_time_second
	ld	(hl+), a
	ld	(hl), e
;bank0.c:586: saved_clock_time_minute = clock_time_minute;
	ld	hl, #_clock_time_minute
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_saved_clock_time_minute
	ld	(hl+), a
	ld	(hl), e
;bank0.c:587: saved_clock_time_hour = clock_time_hour;
	ld	hl, #_clock_time_hour
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_saved_clock_time_hour
	ld	(hl+), a
	ld	(hl), e
;bank0.c:589: saved_map = CurrentMap;
	ld	a, (#_CurrentMap)
	ld	(#_saved_map),a
;bank0.c:591: memcpy(saved_inventory, &inventory, sizeof(saved_inventory));
	ld	hl, #0x0063
	push	hl
	ld	hl, #_inventory
	push	hl
	ld	hl, #_saved_inventory
	push	hl
	call	_memcpy
	add	sp, #6
;bank0.c:592: memcpy(saved_inv_amount, &inv_amount, sizeof(saved_inv_amount));
	ld	hl, #0x0063
	push	hl
	ld	hl, #_inv_amount
	push	hl
	ld	hl, #_saved_inv_amount
	push	hl
	call	_memcpy
	add	sp, #6
;bank0.c:594: saved_game_start = true;
	ld	hl, #_saved_game_start
	ld	(hl), #0x01
;bank0.c:595: }
	ret
;bank0.c:597: void Count_Actors(void) //* Counts current actors and stores result in "total_actors".
;	---------------------------------
; Function Count_Actors
; ---------------------------------
_Count_Actors::
;bank0.c:599: if(party[3] > 0)
	ld	a, (#(_party + 0x0003) + 0)
	or	a, a
	jr	Z, 00108$
;bank0.c:601: total_actors = 3;
	ld	hl, #_total_actors
	ld	(hl), #0x03
	ret
00108$:
;bank0.c:603: else if(party[2] > 0)
	ld	a, (#(_party + 0x0002) + 0)
	or	a, a
	jr	Z, 00105$
;bank0.c:605: total_actors = 2;
	ld	hl, #_total_actors
	ld	(hl), #0x02
	ret
00105$:
;bank0.c:607: else if(party[1] > 0)
	ld	a, (#(_party + 0x0001) + 0)
	or	a, a
	jr	Z, 00102$
;bank0.c:609: total_actors = 1;
	ld	hl, #_total_actors
	ld	(hl), #0x01
	ret
00102$:
;bank0.c:613: total_actors = 0;
	ld	hl, #_total_actors
	ld	(hl), #0x00
;bank0.c:615: }
	ret
;bank0.c:620: GameActor* Get_Actor(UBYTE actor_id)
;	---------------------------------
; Function Get_Actor
; ---------------------------------
_Get_Actor::
;bank0.c:622: switch(actor_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:624: case 0:
00101$:
;bank0.c:625: return &actor_null;
	ld	de, #_actor_null
	ret
;bank0.c:627: case 1:
00102$:
;bank0.c:628: return &actor_hiro;
	ld	de, #_actor_hiro
	ret
;bank0.c:630: case 2:
00103$:
;bank0.c:631: return &actor_bud;
	ld	de, #_actor_bud
	ret
;bank0.c:633: case 3:
00104$:
;bank0.c:634: return &actor_soran;
	ld	de, #_actor_soran
	ret
;bank0.c:636: default:
00105$:
;bank0.c:637: return &actor_null;
	ld	de, #_actor_null
;bank0.c:639: }
;bank0.c:640: }
	ret
;bank0.c:642: GameClass* Get_Class(UBYTE class_id)
;	---------------------------------
; Function Get_Class
; ---------------------------------
_Get_Class::
;bank0.c:644: switch(class_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:646: case 0:
00101$:
;bank0.c:647: return &class_traveler;
	ld	de, #_class_traveler
	ret
;bank0.c:649: case 1:
00102$:
;bank0.c:650: return &class_knight;
	ld	de, #_class_knight
	ret
;bank0.c:652: case 2:
00103$:
;bank0.c:653: return &class_white_mage;
	ld	de, #_class_white_mage
	ret
;bank0.c:655: case 3:
00104$:
;bank0.c:656: return &class_black_mage;
	ld	de, #_class_black_mage
	ret
;bank0.c:658: default:
00105$:
;bank0.c:659: return &class_traveler;
	ld	de, #_class_traveler
;bank0.c:661: }
;bank0.c:662: }
	ret
;bank0.c:664: GameItem* Get_Item(UBYTE item_id)
;	---------------------------------
; Function Get_Item
; ---------------------------------
_Get_Item::
;bank0.c:666: switch(item_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:668: case 0:
00101$:
;bank0.c:669: return &item_null;
	ld	de, #_item_null
	ret
;bank0.c:671: case 1:
00102$:
;bank0.c:672: return &item_healing_brew;
	ld	de, #_item_healing_brew
	ret
;bank0.c:674: case 2:
00103$:
;bank0.c:675: return &item_life_leaf;
	ld	de, #_item_life_leaf
	ret
;bank0.c:677: case 3:
00104$:
;bank0.c:678: return &item_mana_brew;
	ld	de, #_item_mana_brew
	ret
;bank0.c:680: default:
00105$:
;bank0.c:681: return &item_null;
	ld	de, #_item_null
;bank0.c:683: }
;bank0.c:684: }
	ret
;bank0.c:686: GameEquip* Get_Equip(UBYTE equip_id)
;	---------------------------------
; Function Get_Equip
; ---------------------------------
_Get_Equip::
;bank0.c:688: switch(equip_id)
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
	sub	a, #0x15
	jr	Z, 00103$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x29
	jr	Z, 00104$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x2b
	jr	Z, 00105$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x2d
	jr	Z, 00106$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x3d
	jr	Z, 00107$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x51
	jr	Z, 00108$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x65
	jr	Z, 00109$
	jr	00110$
;bank0.c:690: case 0:
00101$:
;bank0.c:691: return &equip_null;
	ld	de, #_equip_null
	ret
;bank0.c:693: case 1:
00102$:
;bank0.c:694: return &equip_wooden_sword;
	ld	de, #_equip_wooden_sword
	ret
;bank0.c:696: case 21:
00103$:
;bank0.c:697: return &equip_wooden_staff;
	ld	de, #_equip_wooden_staff
	ret
;bank0.c:699: case 41:
00104$:
;bank0.c:700: return &equip_metal_rod;
	ld	de, #_equip_metal_rod
	ret
;bank0.c:702: case 43:
00105$:
;bank0.c:703: return &equip_mythril_rod;
	ld	de, #_equip_mythril_rod
	ret
;bank0.c:705: case 45:
00106$:
;bank0.c:706: return &equip_rod_of_spark;
	ld	de, #_equip_rod_of_spark
	ret
;bank0.c:708: case 61:
00107$:
;bank0.c:709: return &equip_hoplon;
	ld	de, #_equip_hoplon
	ret
;bank0.c:711: case 81:
00108$:
;bank0.c:712: return &equip_cotton_garb;
	ld	de, #_equip_cotton_garb
	ret
;bank0.c:714: case 101:
00109$:
;bank0.c:715: return &equip_copper_bracelet;
	ld	de, #_equip_copper_bracelet
	ret
;bank0.c:717: default:
00110$:
;bank0.c:718: return &equip_null;
	ld	de, #_equip_null
;bank0.c:720: }
;bank0.c:721: }
	ret
;bank0.c:723: GameMap* Get_Map(UBYTE map_id)
;	---------------------------------
; Function Get_Map
; ---------------------------------
_Get_Map::
;bank0.c:725: switch(map_id)
	ld	a, #0x04
	ldhl	sp,	#2
	sub	a, (hl)
	jr	C, 00106$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00115$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00115$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
;bank0.c:727: case 0:
00101$:
;bank0.c:728: return &map_plum_village;
	ld	de, #_map_plum_village
	ret
;bank0.c:730: case 1:
00102$:
;bank0.c:731: return &map_hiro_house;
	ld	de, #_map_hiro_house
	ret
;bank0.c:733: case 2:
00103$:
;bank0.c:734: return &map_plum_item_shop;
	ld	de, #_map_plum_item_shop
	ret
;bank0.c:736: case 3:
00104$:
;bank0.c:737: return &map_bud_house;
	ld	de, #_map_bud_house
	ret
;bank0.c:739: case 4:
00105$:
;bank0.c:740: return &map_yggdrid;
	ld	de, #_map_yggdrid
	ret
;bank0.c:742: default:
00106$:
;bank0.c:743: return &map_plum_village;
	ld	de, #_map_plum_village
;bank0.c:745: }
;bank0.c:746: }
	ret
;bank0.c:748: GameEnemy* Get_Enemy(UBYTE enemy_id)
;	---------------------------------
; Function Get_Enemy
; ---------------------------------
_Get_Enemy::
;bank0.c:750: switch(enemy_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:752: case 0:
00101$:
;bank0.c:753: return &enemy_null;
	ld	de, #_enemy_null
	ret
;bank0.c:755: case 1:
00102$:
;bank0.c:756: return &enemy_bee;
	ld	de, #_enemy_bee
	ret
;bank0.c:758: case 2:
00103$:
;bank0.c:759: return &enemy_wolf;
	ld	de, #_enemy_wolf
	ret
;bank0.c:761: case 3:
00104$:
;bank0.c:762: return &enemy_slime;
	ld	de, #_enemy_slime
	ret
;bank0.c:764: default:
00105$:
;bank0.c:765: return &enemy_null;
	ld	de, #_enemy_null
;bank0.c:767: }
;bank0.c:768: }
	ret
;bank0.c:770: GameTroop* Get_Troop(UBYTE troop_id)
;	---------------------------------
; Function Get_Troop
; ---------------------------------
_Get_Troop::
;bank0.c:772: switch(troop_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;bank0.c:774: case 0:
00101$:
;bank0.c:775: return &troop_bee1;
	ld	de, #_troop_bee1
	ret
;bank0.c:777: case 1:
00102$:
;bank0.c:778: return &troop_wolf1;
	ld	de, #_troop_wolf1
	ret
;bank0.c:780: case 2:
00103$:
;bank0.c:781: return &troop_bee2;
	ld	de, #_troop_bee2
	ret
;bank0.c:783: case 3:
00104$:
;bank0.c:784: return &troop_slime1;
	ld	de, #_troop_slime1
	ret
;bank0.c:786: default:
00105$:
;bank0.c:787: return &troop_bee1;
	ld	de, #_troop_bee1
;bank0.c:789: }
;bank0.c:790: }
	ret
;bank0.c:792: GameSkill* Get_Skill(UBYTE skill_id)
;	---------------------------------
; Function Get_Skill
; ---------------------------------
_Get_Skill::
;bank0.c:794: switch(skill_id)
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
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00104$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x17
	jr	Z, 00105$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x2b
	jr	Z, 00106$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x2c
	jr	Z, 00107$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x2d
	jr	Z, 00108$
	jr	00109$
;bank0.c:796: case 0:
00101$:
;bank0.c:797: return &skill_null;
	ld	de, #_skill_null
	ret
;bank0.c:799: case 1:
00102$:
;bank0.c:800: return &skill_hit;
	ld	de, #_skill_hit
	ret
;bank0.c:802: case 2:
00103$:
;bank0.c:803: return &skill_use_item;
	ld	de, #_skill_use_item
	ret
;bank0.c:805: case 3:
00104$:
;bank0.c:806: return &skill_reckless_charge;
	ld	de, #_skill_reckless_charge
	ret
;bank0.c:808: case 23:
00105$:
;bank0.c:809: return &skill_cure;
	ld	de, #_skill_cure
	ret
;bank0.c:811: case 43:
00106$:
;bank0.c:812: return &skill_fireball;
	ld	de, #_skill_fireball
	ret
;bank0.c:814: case 44:
00107$:
;bank0.c:815: return &skill_thunder;
	ld	de, #_skill_thunder
	ret
;bank0.c:817: case 45:
00108$:
;bank0.c:818: return &skill_blizzard;
	ld	de, #_skill_blizzard
	ret
;bank0.c:820: default:
00109$:
;bank0.c:821: return &skill_null;
	ld	de, #_skill_null
;bank0.c:823: }
;bank0.c:824: }
	ret
;bank0.c:826: GameTele* Get_Tele(UBYTE tele_id)
;	---------------------------------
; Function Get_Tele
; ---------------------------------
_Get_Tele::
;bank0.c:828: switch(tele_id)
	ld	a, #0x08
	ldhl	sp,	#2
	sub	a, (hl)
	jr	C, 00110$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00119$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00119$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
;bank0.c:830: case 0:
00101$:
;bank0.c:831: return &tele_null;
	ld	de, #_tele_null
	ret
;bank0.c:833: case 1:
00102$:
;bank0.c:834: return &tele_plum_hiro;
	ld	de, #_tele_plum_hiro
	ret
;bank0.c:836: case 2:
00103$:
;bank0.c:837: return &tele_hiro_plum;
	ld	de, #_tele_hiro_plum
	ret
;bank0.c:839: case 3:
00104$:
;bank0.c:840: return &tele_plum_bud;
	ld	de, #_tele_plum_bud
	ret
;bank0.c:842: case 4:
00105$:
;bank0.c:843: return &tele_bud_plum;
	ld	de, #_tele_bud_plum
	ret
;bank0.c:845: case 5:
00106$:
;bank0.c:846: return &tele_plum_yggdrid;
	ld	de, #_tele_plum_yggdrid
	ret
;bank0.c:848: case 6:
00107$:
;bank0.c:849: return &tele_yggdrid_plum;
	ld	de, #_tele_yggdrid_plum
	ret
;bank0.c:851: case 7:
00108$:
;bank0.c:852: return &tele_plum_item_shop;
	ld	de, #_tele_plum_item_shop
	ret
;bank0.c:854: case 8:
00109$:
;bank0.c:855: return &tele_item_shop_plum;
	ld	de, #_tele_item_shop_plum
	ret
;bank0.c:857: default:
00110$:
;bank0.c:858: return &tele_null;
	ld	de, #_tele_null
;bank0.c:860: }
;bank0.c:861: }
	ret
;bank0.c:863: GameMessage* Get_Message(UBYTE message_id)
;	---------------------------------
; Function Get_Message
; ---------------------------------
_Get_Message::
;bank0.c:865: switch(message_id)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	jr	00103$
;bank0.c:867: case 0:
00101$:
;bank0.c:868: return &message_test;
	ld	de, #_message_test
	ret
;bank0.c:870: case 1:
00102$:
;bank0.c:871: return &message_plum_headstone;
	ld	de, #_message_plum_headstone
	ret
;bank0.c:873: default:
00103$:
;bank0.c:874: return &message_test;
	ld	de, #_message_test
;bank0.c:876: }
;bank0.c:877: }
	ret
;bank0.c:879: GameSign* Get_Sign(UBYTE sign_id)
;	---------------------------------
; Function Get_Sign
; ---------------------------------
_Get_Sign::
;bank0.c:881: switch(sign_id)
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
;bank0.c:883: case 0:
00101$:
;bank0.c:884: return &sign_null;
	ld	de, #_sign_null
	ret
;bank0.c:886: case 1:
00102$:
;bank0.c:887: return &sign_plum_gravestone;
	ld	de, #_sign_plum_gravestone
	ret
;bank0.c:889: case 2:
00103$:
;bank0.c:890: return &sign_test;
	ld	de, #_sign_test
	ret
;bank0.c:892: default:
00104$:
;bank0.c:893: return &sign_null;
	ld	de, #_sign_null
;bank0.c:895: }
;bank0.c:896: }
	ret
;bank0.c:898: GameShop* Get_Shop(UBYTE shop_id)
;	---------------------------------
; Function Get_Shop
; ---------------------------------
_Get_Shop::
;bank0.c:900: switch(shop_id)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;bank0.c:903: return &shop_test;
	ld	de, #_shop_test
	ret
;bank0.c:905: default:
00102$:
;bank0.c:906: return &shop_test;
	ld	de, #_shop_test
;bank0.c:908: }
;bank0.c:909: }
	ret
;bank0.c:911: UINT16 Get_Experience(UBYTE bank, UINT16 actor_level)
;	---------------------------------
; Function Get_Experience
; ---------------------------------
_Get_Experience::
;bank0.c:913: switch_bank(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:915: h = Experience_List[actor_level - 1];
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	hl, #_Experience_List
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	hl, #_h
	ld	(hl), a
	xor	a, a
	ld	(_h + 1), a
;bank0.c:917: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:919: return h;
	ld	hl, #_h + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;bank0.c:920: }
	ret
;bank0.c:922: UINT16 Get_Required_AP(UBYTE bank, GameSkill* skill)
;	---------------------------------
; Function Get_Required_AP
; ---------------------------------
_Get_Required_AP::
;bank0.c:924: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:926: h = skill->required_ap;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_h
	ld	(hl), a
	xor	a, a
	ld	(_h + 1), a
;bank0.c:928: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:930: return h;
	ld	hl, #_h + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;bank0.c:931: }
	ret
;bank0.c:933: UINT16 Get_Skill_Useable(UBYTE bank, GameSkill* skill)
;	---------------------------------
; Function Get_Skill_Useable
; ---------------------------------
_Get_Skill_Useable::
;bank0.c:935: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:937: h = skill->menu_use;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_h
	ld	(hl), a
	xor	a, a
	ld	(_h + 1), a
;bank0.c:939: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:941: return h;
	ld	hl, #_h + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;bank0.c:942: }
	ret
;bank0.c:944: UBYTE Get_Font_Value(UBYTE bank)
;	---------------------------------
; Function Get_Font_Value
; ---------------------------------
_Get_Font_Value::
;bank0.c:946: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:948: font_value = Retrieve_Font_Value();
	call	_Retrieve_Font_Value
	ld	hl, #_font_value
	ld	(hl), e
;bank0.c:950: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:952: return font_value;
	ld	hl, #_font_value
	ld	e, (hl)
;bank0.c:953: }
	ret
;bank0.c:955: void Call_Draw_Message(UBYTE bank, GameMessage* message) //* Loads message box and draws specified message.
;	---------------------------------
; Function Call_Draw_Message
; ---------------------------------
_Call_Draw_Message::
;bank0.c:957: switch_bank(message->bank);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	bc
;bank0.c:959: switch(message->bank)
	ld	a, (bc)
	sub	a, #0x0a
	jr	NZ, 00103$
;bank0.c:962: Load_Message_Bank10(message);
	push	bc
	call	_Load_Message_Bank10
	add	sp, #2
;bank0.c:966: }
00103$:
;bank0.c:968: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:969: }
	ret
;bank0.c:971: void Call_Load_Tileset(UBYTE bank, UBYTE tileset) //* Loads specified tileset.
;	---------------------------------
; Function Call_Load_Tileset
; ---------------------------------
_Call_Load_Tileset::
;bank0.c:973: switch_bank(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:975: Load_Tileset(tileset);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_Load_Tileset
	inc	sp
;bank0.c:977: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:978: }
	ret
;bank0.c:980: void Call_Draw_Map(UBYTE bank, GameMap* map)
;	---------------------------------
; Function Call_Draw_Map
; ---------------------------------
_Call_Draw_Map::
;bank0.c:982: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:984: Draw_Map(map);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Map
	add	sp, #2
;bank0.c:986: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:987: }
	ret
;bank0.c:989: void Call_Draw_Map_Load(UBYTE bank, GameMap* map) //* Draws specified map.
;	---------------------------------
; Function Call_Draw_Map_Load
; ---------------------------------
_Call_Draw_Map_Load::
;bank0.c:991: switch_bank(map->map_bank);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	push	bc
	push	de
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	de
	pop	bc
;bank0.c:993: switch(map->map_bank)
	ld	a, (de)
	cp	a, #0x08
	jr	Z, 00101$
	cp	a, #0x09
	jr	Z, 00102$
	sub	a, #0x12
	jr	Z, 00103$
	jr	00104$
;bank0.c:995: case 8:
00101$:
;bank0.c:996: Draw_Map_Bank8(map);
	push	bc
	call	_Draw_Map_Bank8
	add	sp, #2
;bank0.c:997: break;
	jr	00105$
;bank0.c:998: case 9:
00102$:
;bank0.c:999: Draw_Map_Bank9(map);
	push	bc
	call	_Draw_Map_Bank9
	add	sp, #2
;bank0.c:1000: break;
	jr	00105$
;bank0.c:1001: case 18:
00103$:
;bank0.c:1002: Draw_Map_Bank18(map);
	push	bc
	call	_Draw_Map_Bank18
	add	sp, #2
;bank0.c:1003: break;
	jr	00105$
;bank0.c:1004: default:
00104$:
;bank0.c:1005: Draw_Map_Bank8(map);
	push	bc
	call	_Draw_Map_Bank8
	add	sp, #2
;bank0.c:1007: }
00105$:
;bank0.c:1009: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1010: }
	ret
;bank0.c:1012: void Call_Draw_Map_Line(UBYTE bank, GameMap* map, UBYTE direction) //* Draws specified map's line.
;	---------------------------------
; Function Call_Draw_Map_Line
; ---------------------------------
_Call_Draw_Map_Line::
;bank0.c:1014: switch_bank(map->map_bank);
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	push	bc
	push	de
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	de
	pop	bc
;bank0.c:1016: switch(map->map_bank)
	ld	a, (de)
	cp	a, #0x08
	jr	Z, 00101$
	cp	a, #0x09
	jr	Z, 00102$
	sub	a, #0x12
	jr	Z, 00103$
	jr	00104$
;bank0.c:1018: case 8:
00101$:
;bank0.c:1019: Draw_Line_Bank8(map, direction);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_Draw_Line_Bank8
	add	sp, #3
;bank0.c:1020: break;
	jr	00105$
;bank0.c:1021: case 9:
00102$:
;bank0.c:1022: Draw_Line_Bank9(map, direction);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_Draw_Line_Bank9
	add	sp, #3
;bank0.c:1023: break;
	jr	00105$
;bank0.c:1024: case 18:
00103$:
;bank0.c:1025: Draw_Line_Bank18(map, direction);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_Draw_Line_Bank18
	add	sp, #3
;bank0.c:1026: break;
	jr	00105$
;bank0.c:1027: default:
00104$:
;bank0.c:1028: Draw_Line_Bank8(map, direction);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_Draw_Line_Bank8
	add	sp, #3
;bank0.c:1030: }
00105$:
;bank0.c:1032: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1033: }
	ret
;bank0.c:1035: UBYTE Call_Check_Tile_Collision(UBYTE bank, GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y)
;	---------------------------------
; Function Call_Check_Tile_Collision
; ---------------------------------
_Call_Check_Tile_Collision::
;bank0.c:1037: switch(map->map_bank)
	ldhl	sp,#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	cp	a, #0x08
	jr	Z, 00101$
	cp	a, #0x09
	jr	Z, 00102$
	sub	a, #0x12
	jr	Z, 00103$
	jr	00104$
;bank0.c:1039: case 8:
00101$:
;bank0.c:1040: switch_bank(bank8);
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	bc
;bank0.c:1041: Collision = Check_Tile_Collision_Bank8(map, character, move_x, move_y);
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Check_Tile_Collision_Bank8
	add	sp, #6
	ld	hl, #_Collision
	ld	(hl), e
;bank0.c:1042: break;
	jr	00105$
;bank0.c:1043: case 9:
00102$:
;bank0.c:1044: switch_bank(bank9);
	push	bc
	ld	a, #0x09
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	bc
;bank0.c:1045: Collision = Check_Tile_Collision_Bank9(map, character, move_x, move_y);
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Check_Tile_Collision_Bank9
	add	sp, #6
	ld	hl, #_Collision
	ld	(hl), e
;bank0.c:1046: break;
	jr	00105$
;bank0.c:1047: case 18:
00103$:
;bank0.c:1048: switch_bank(bank18);
	push	bc
	ld	a, #0x12
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	bc
;bank0.c:1049: Collision = Check_Tile_Collision_Bank18(map, character, move_x, move_y);
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Check_Tile_Collision_Bank18
	add	sp, #6
	ld	hl, #_Collision
	ld	(hl), e
;bank0.c:1050: break;
	jr	00105$
;bank0.c:1051: default:
00104$:
;bank0.c:1052: switch_bank(bank8);
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
	pop	bc
;bank0.c:1053: Collision = Check_Tile_Collision_Bank8(map, character, move_x, move_y);
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Check_Tile_Collision_Bank8
	add	sp, #6
	ld	hl, #_Collision
	ld	(hl), e
;bank0.c:1055: }
00105$:
;bank0.c:1057: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1059: return Collision;
	ld	hl, #_Collision
	ld	e, (hl)
;bank0.c:1060: }
	ret
;bank0.c:1062: void Call_Draw_Pointer(UBYTE bank)
;	---------------------------------
; Function Call_Draw_Pointer
; ---------------------------------
_Call_Draw_Pointer::
;bank0.c:1064: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1066: Draw_Pointer();
	call	_Draw_Pointer
;bank0.c:1068: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1069: }
	ret
;bank0.c:1071: void Call_Build_Char(UBYTE bank, GameCharacter* character) //* Assembles character's tiles.
;	---------------------------------
; Function Call_Build_Char
; ---------------------------------
_Call_Build_Char::
;bank0.c:1073: switch_bank(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1075: build_char(character);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1077: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1078: }
	ret
;bank0.c:1080: void Call_Orient_Char(UBYTE bank, GameCharacter* character) //* Orients character based on characters pos_x and pos_y.
;	---------------------------------
; Function Call_Orient_Char
; ---------------------------------
_Call_Orient_Char::
;bank0.c:1082: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1084: Orient_Char(character);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Orient_Char
	add	sp, #2
;bank0.c:1086: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1087: }
	ret
;bank0.c:1089: void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset)
;	---------------------------------
; Function Call_Move_Char
; ---------------------------------
_Call_Move_Char::
;bank0.c:1091: switch_bank(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1093: move_char(character, tile_x, tile_y, pixel_offset);
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_move_char
	add	sp, #5
;bank0.c:1095: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1096: }
	ret
;bank0.c:1098: void Call_Set_Sprite_Packages(UBYTE bank, GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right)
;	---------------------------------
; Function Call_Set_Sprite_Packages
; ---------------------------------
_Call_Set_Sprite_Packages::
;bank0.c:1100: switch_bank(bank4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1102: Set_Sprite_Packages(character, sprites_up, sprites_down, sprites_left, sprites_right);
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Set_Sprite_Packages
	add	sp, #10
;bank0.c:1104: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1105: }
	ret
;bank0.c:1107: void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite) //* Sets character to sprite specified.
;	---------------------------------
; Function Call_Load_Char_Sprite
; ---------------------------------
_Call_Load_Char_Sprite::
;bank0.c:1109: switch_bank(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1111: Load_Char_Sprite(character, sprite);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Load_Char_Sprite
	add	sp, #4
;bank0.c:1113: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1114: }
	ret
;bank0.c:1116: void Call_Clear_Map(UBYTE bank) //* Clears the map.
;	---------------------------------
; Function Call_Clear_Map
; ---------------------------------
_Call_Clear_Map::
;bank0.c:1118: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1120: Clear_Map();
	call	_Clear_Map
;bank0.c:1122: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1123: }
	ret
;bank0.c:1125: void Call_Set_Char_Tile(UBYTE bank, GameCharacter* character, UBYTE tile, GameSprite* sprite)
;	---------------------------------
; Function Call_Set_Char_Tile
; ---------------------------------
_Call_Set_Char_Tile::
;bank0.c:1127: switch_bank(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1129: Set_Char_Tile(character, tile, sprite);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Set_Char_Tile
	add	sp, #5
;bank0.c:1131: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1132: }
	ret
;bank0.c:1134: void Call_Reload_Map(UBYTE bank)
;	---------------------------------
; Function Call_Reload_Map
; ---------------------------------
_Call_Reload_Map::
;bank0.c:1136: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1138: Reload_Map();
	call	_Reload_Map
;bank0.c:1140: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1141: }
	ret
;bank0.c:1143: void Call_Reset_Char_Sprites(UBYTE bank)
;	---------------------------------
; Function Call_Reset_Char_Sprites
; ---------------------------------
_Call_Reset_Char_Sprites::
;bank0.c:1145: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1147: reset_char_sprites();
	call	_reset_char_sprites
;bank0.c:1149: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1150: }
	ret
;bank0.c:1152: void Call_Reset_NPC(UBYTE bank)
;	---------------------------------
; Function Call_Reset_NPC
; ---------------------------------
_Call_Reset_NPC::
;bank0.c:1154: switch_bank(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1156: Reset_NPC();
	call	_Reset_NPC
;bank0.c:1158: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1159: }
	ret
;bank0.c:1161: void Call_Load_Window(UBYTE bank)
;	---------------------------------
; Function Call_Load_Window
; ---------------------------------
_Call_Load_Window::
;bank0.c:1163: switch_bank(6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1165: Load_Window();
	call	_Load_Window
;bank0.c:1167: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1168: }
	ret
;bank0.c:1170: void Call_Load_Message_Box(UBYTE bank)
;	---------------------------------
; Function Call_Load_Message_Box
; ---------------------------------
_Call_Load_Message_Box::
;bank0.c:1172: switch_bank(6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1174: Load_Message_Box();
	call	_Load_Message_Box
;bank0.c:1176: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1177: }
	ret
;bank0.c:1179: void Call_Draw_Message_Box(UBYTE bank)
;	---------------------------------
; Function Call_Draw_Message_Box
; ---------------------------------
_Call_Draw_Message_Box::
;bank0.c:1181: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1183: Draw_Message_Box();
	call	_Draw_Message_Box
;bank0.c:1185: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1186: }
	ret
;bank0.c:1188: void Call_Close_Message_Box(UBYTE bank)
;	---------------------------------
; Function Call_Close_Message_Box
; ---------------------------------
_Call_Close_Message_Box::
;bank0.c:1190: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1192: Close_Message_Box();
	call	_Close_Message_Box
;bank0.c:1194: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1195: }
	ret
;bank0.c:1197: void Call_Scroll_Message(UBYTE bank)
;	---------------------------------
; Function Call_Scroll_Message
; ---------------------------------
_Call_Scroll_Message::
;bank0.c:1199: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1201: scroll_message();
	call	_scroll_message
;bank0.c:1203: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1204: }
	ret
;bank0.c:1206: void Call_Scene_Handler(UBYTE bank, UBYTE scene_id)
;	---------------------------------
; Function Call_Scene_Handler
; ---------------------------------
_Call_Scene_Handler::
;bank0.c:1208: switch_bank(bank20);
	ld	a, #0x14
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1210: Scene_Handler(scene_id);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_Scene_Handler
	inc	sp
;bank0.c:1212: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1213: }
	ret
;bank0.c:1215: void Call_Draw_Troop(UBYTE bank, unsigned char* tiles, unsigned char* data)
;	---------------------------------
; Function Call_Draw_Troop
; ---------------------------------
_Call_Draw_Troop::
;bank0.c:1217: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1219: Draw_Troop(tiles, data);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Troop
	add	sp, #4
;bank0.c:1221: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1222: }
	ret
;bank0.c:1224: void Call_Execute_Skill(UBYTE bank, UBYTE skill_id, UBYTE action_performer, UBYTE action_target)
;	---------------------------------
; Function Call_Execute_Skill
; ---------------------------------
_Call_Execute_Skill::
;bank0.c:1226: switch_bank(17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1228: Execute_Skill(skill_id, action_performer, action_target);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_Execute_Skill
	add	sp, #3
;bank0.c:1230: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1231: }
	ret
;bank0.c:1233: UBYTE Call_Get_Skill_Cost(UBYTE bank, GameSkill* skill)
;	---------------------------------
; Function Call_Get_Skill_Cost
; ---------------------------------
_Call_Get_Skill_Cost::
;bank0.c:1235: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1237: u_y = Get_Skill_Cost(skill);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Get_Skill_Cost
	add	sp, #2
	ld	hl, #_u_y
	ld	(hl), e
;bank0.c:1239: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1241: return u_y;
	ld	hl, #_u_y
	ld	e, (hl)
;bank0.c:1242: }
	ret
;bank0.c:1244: void Call_Draw_Skill_Cost(UBYTE bank, GameSkill* skill)
;	---------------------------------
; Function Call_Draw_Skill_Cost
; ---------------------------------
_Call_Draw_Skill_Cost::
;bank0.c:1246: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1248: Draw_Skill_Cost(skill);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Skill_Cost
	add	sp, #2
;bank0.c:1250: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1251: }
	ret
;bank0.c:1253: void Call_Draw_Skills_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Call_Draw_Skills_Name
; ---------------------------------
_Call_Draw_Skills_Name::
;bank0.c:1255: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1257: Draw_Skills_Name(skill, tile_x, tile_y);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Skills_Name
	add	sp, #4
;bank0.c:1259: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1260: }
	ret
;bank0.c:1262: void Call_Draw_Skill_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Call_Draw_Skill_Name
; ---------------------------------
_Call_Draw_Skill_Name::
;bank0.c:1264: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1266: Draw_Skill_Name(skill, tile_x, tile_y);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Skill_Name
	add	sp, #4
;bank0.c:1268: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1269: }
	ret
;bank0.c:1271: void Call_Draw_End_Message(UBYTE bank)
;	---------------------------------
; Function Call_Draw_End_Message
; ---------------------------------
_Call_Draw_End_Message::
;bank0.c:1273: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1275: Draw_End_Message();
	call	_Draw_End_Message
;bank0.c:1277: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1278: }
	ret
;bank0.c:1280: void Call_Draw_Item_Description(UBYTE bank, GameItem* item)
;	---------------------------------
; Function Call_Draw_Item_Description
; ---------------------------------
_Call_Draw_Item_Description::
;bank0.c:1282: switch_bank(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1284: Draw_Item_Description(item);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Item_Description
	add	sp, #2
;bank0.c:1286: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1287: }
	ret
;bank0.c:1289: void Call_Draw_Equip_Description_Large(UBYTE bank, GameEquip* equip)
;	---------------------------------
; Function Call_Draw_Equip_Description_Large
; ---------------------------------
_Call_Draw_Equip_Description_Large::
;bank0.c:1291: switch_bank(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1293: Draw_Equip_Description_Large(equip);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Equip_Description_Large
	add	sp, #2
;bank0.c:1295: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1296: }
	ret
;bank0.c:1298: void Call_Load_Battle_Message_Box(UBYTE bank)
;	---------------------------------
; Function Call_Load_Battle_Message_Box
; ---------------------------------
_Call_Load_Battle_Message_Box::
;bank0.c:1300: switch_bank(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1302: Load_Battle_Message_Box();
	call	_Load_Battle_Message_Box
;bank0.c:1304: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1305: }
	ret
;bank0.c:1307: void Call_Set_Actor_Skills(UBYTE bank, GameActor* actor)
;	---------------------------------
; Function Call_Set_Actor_Skills
; ---------------------------------
_Call_Set_Actor_Skills::
;bank0.c:1309: switch_bank(bank17);
	ld	a, #0x11
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1311: Set_Actor_Skills(actor);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Set_Actor_Skills
	add	sp, #2
;bank0.c:1313: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1314: }
	ret
;bank0.c:1316: void Call_Add_NPC(UBYTE bank, GameCharacter* character, GameNPC* npc)
;	---------------------------------
; Function Call_Add_NPC
; ---------------------------------
_Call_Add_NPC::
;bank0.c:1318: switch_bank(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1320: Add_NPC(character, npc);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Add_NPC
	add	sp, #4
;bank0.c:1322: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1323: }
	ret
;bank0.c:1325: void Call_Hide_Char(UBYTE bank, GameCharacter* character)
;	---------------------------------
; Function Call_Hide_Char
; ---------------------------------
_Call_Hide_Char::
;bank0.c:1327: switch_bank(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1329: hide_char(character);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_hide_char
	add	sp, #2
;bank0.c:1331: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1332: }
	ret
;bank0.c:1334: void Call_Add_Item(UBYTE bank, GameItem* item, UBYTE amount)
;	---------------------------------
; Function Call_Add_Item
; ---------------------------------
_Call_Add_Item::
;bank0.c:1336: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1338: Add_Item(item, amount);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Add_Item
	add	sp, #3
;bank0.c:1340: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1341: }
	ret
;bank0.c:1343: void Call_Add_Equip(UBYTE bank, GameEquip* equip)
;	---------------------------------
; Function Call_Add_Equip
; ---------------------------------
_Call_Add_Equip::
;bank0.c:1345: switch_bank(12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1347: Add_Equip(equip);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Add_Equip
	add	sp, #2
;bank0.c:1349: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1350: }
	ret
;bank0.c:1352: void Call_Equip_Equipment(UBYTE bank, GameActor* actor, GameEquip* equip)
;	---------------------------------
; Function Call_Equip_Equipment
; ---------------------------------
_Call_Equip_Equipment::
;bank0.c:1354: switch_bank(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1356: Equip_Equipment(actor, equip);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:1358: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1359: }
	ret
;bank0.c:1361: void Call_Load_Font_Menu(UBYTE bank)
;	---------------------------------
; Function Call_Load_Font_Menu
; ---------------------------------
_Call_Load_Font_Menu::
;bank0.c:1363: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1365: Load_Font_Menu();
	call	_Load_Font_Menu
;bank0.c:1367: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1368: }
	ret
;bank0.c:1370: void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name)
;	---------------------------------
; Function Call_Draw_Name
; ---------------------------------
_Call_Draw_Name::
;bank0.c:1372: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1374: Draw_Name(tile_x, tile_y, name, full_name);
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_Draw_Name
	add	sp, #5
;bank0.c:1376: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1377: }
	ret
;bank0.c:1379: void Call_Draw_Number(UBYTE bank, UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Call_Draw_Number
; ---------------------------------
_Call_Draw_Number::
;bank0.c:1381: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1383: Draw_Number(number, tile_x, tile_y);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Number
	add	sp, #4
;bank0.c:1385: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1386: }
	ret
;bank0.c:1388: void Call_Play_Buzz(UBYTE bank)
;	---------------------------------
; Function Call_Play_Buzz
; ---------------------------------
_Call_Play_Buzz::
;bank0.c:1390: switch_bank(11);
	ld	a, #0x0b
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1392: Play_Buzz();
	call	_Play_Buzz
;bank0.c:1394: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1395: }
	ret
;bank0.c:1397: void Call_Play_Confirm(UBYTE bank)
;	---------------------------------
; Function Call_Play_Confirm
; ---------------------------------
_Call_Play_Confirm::
;bank0.c:1399: switch_bank(11);
	ld	a, #0x0b
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1401: Play_Confirm();
	call	_Play_Confirm
;bank0.c:1403: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1404: }
	ret
;bank0.c:1406: void Call_Play_Use(UBYTE bank)
;	---------------------------------
; Function Call_Play_Use
; ---------------------------------
_Call_Play_Use::
;bank0.c:1408: switch_bank(11);
	ld	a, #0x0b
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1410: Play_Use();
	call	_Play_Use
;bank0.c:1412: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1413: }
	ret
;bank0.c:1415: void Call_Load_Combat_Main(UBYTE bank)
;	---------------------------------
; Function Call_Load_Combat_Main
; ---------------------------------
_Call_Load_Combat_Main::
;bank0.c:1417: switch_bank(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1419: Load_Combat_Main();
	call	_Load_Combat_Main
;bank0.c:1421: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1422: }
	ret
;bank0.c:1424: void Call_Check_Step_Counter(UBYTE bank)
;	---------------------------------
; Function Call_Check_Step_Counter
; ---------------------------------
_Call_Check_Step_Counter::
;bank0.c:1426: switch_bank(bank16);
	ld	a, #0x10
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1428: Check_Step_Counter();
	call	_Check_Step_Counter
;bank0.c:1430: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1431: }
	ret
;bank0.c:1433: void Call_Menu_Equip(UBYTE bank)
;	---------------------------------
; Function Call_Menu_Equip
; ---------------------------------
_Call_Menu_Equip::
;bank0.c:1435: switch_bank(12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1437: Load_Menu_Equip();
	call	_Load_Menu_Equip
;bank0.c:1439: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1440: }
	ret
;bank0.c:1442: void Call_Menu_Item(UBYTE bank)
;	---------------------------------
; Function Call_Menu_Item
; ---------------------------------
_Call_Menu_Item::
;bank0.c:1444: switch_bank(bank13);
	ld	a, #0x0d
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1446: Menu_Item();
	call	_Menu_Item
;bank0.c:1448: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1449: }
	ret
;bank0.c:1451: void Call_Menu_Status(UBYTE bank)
;	---------------------------------
; Function Call_Menu_Status
; ---------------------------------
_Call_Menu_Status::
;bank0.c:1453: switch_bank(bank14);
	ld	a, #0x0e
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1455: Load_Menu_Status();
	call	_Load_Menu_Status
;bank0.c:1457: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1458: }
	ret
;bank0.c:1460: void Call_Shop(UBYTE bank)
;	---------------------------------
; Function Call_Shop
; ---------------------------------
_Call_Shop::
;bank0.c:1462: switch_bank(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1464: Load_Shop();
	call	_Load_Shop
;bank0.c:1466: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1467: }
	ret
;bank0.c:1469: void Call_Menu_Skills(UBYTE bank)
;	---------------------------------
; Function Call_Menu_Skills
; ---------------------------------
_Call_Menu_Skills::
;bank0.c:1471: switch_bank(bank15);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1473: Load_Menu_Skills();
	call	_Load_Menu_Skills
;bank0.c:1475: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1476: }
	ret
;bank0.c:1478: void Call_Menu_Main(UBYTE bank)
;	---------------------------------
; Function Call_Menu_Main
; ---------------------------------
_Call_Menu_Main::
;bank0.c:1480: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1482: Menu_Main();
	call	_Menu_Main
;bank0.c:1484: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1485: }
	ret
;bank0.c:1487: void Call_Load_Menu_Main(UBYTE bank)
;	---------------------------------
; Function Call_Load_Menu_Main
; ---------------------------------
_Call_Load_Menu_Main::
;bank0.c:1489: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1491: Load_Menu_Main();
	call	_Load_Menu_Main
;bank0.c:1493: switch_bank(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1494: }
	ret
;bank0.c:1496: void Menu()
;	---------------------------------
; Function Menu
; ---------------------------------
_Menu::
;bank0.c:1498: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1500: toggle_control(false);
	xor	a, a
	push	af
	inc	sp
	call	_toggle_control
	inc	sp
;bank0.c:1502: Load_Menu_Main();
;bank0.c:1503: }
	jp  _Load_Menu_Main
;bank0.c:1505: void Overworld()
;	---------------------------------
; Function Overworld
; ---------------------------------
_Overworld::
;bank0.c:1507: Update_Joypad();
	call	_Update_Joypad
;bank0.c:1509: Update_Anim_Walk();
	call	_Update_Anim_Walk
;bank0.c:1511: if(camera_focus == false)
	ld	a, (#_camera_focus)
	or	a, a
	jr	NZ, 00102$
;bank0.c:1513: walk_char(&char_player);
	ld	hl, #_char_player
	push	hl
	call	_walk_char
	add	sp, #2
	jr	00103$
00102$:
;bank0.c:1517: walk_player();
	call	_walk_player
00103$:
;bank0.c:1520: hide_char(&char_npc_1);
	ld	hl, #_char_npc_1
	push	hl
	call	_hide_char
	add	sp, #2
;bank0.c:1521: hide_char(&char_npc_2);
	ld	hl, #_char_npc_2
	push	hl
	call	_hide_char
	add	sp, #2
;bank0.c:1523: walk_char(&char_npc_1);
	ld	hl, #_char_npc_1
	push	hl
	call	_walk_char
	add	sp, #2
;bank0.c:1524: }
	ret
;bank0.c:1526: void Gameplay()
;	---------------------------------
; Function Gameplay
; ---------------------------------
_Gameplay::
;bank0.c:1528: switch_bank(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1530: while(true)
00110$:
;bank0.c:1532: wait_vbl_done();
	call	_wait_vbl_done
;bank0.c:1534: if(game_scene == 0)
	ld	a, (#_game_scene)
	or	a, a
	jr	NZ, 00107$
;bank0.c:1536: Overworld();
	call	_Overworld
	jr	00110$
00107$:
;bank0.c:1538: else if(game_scene == 1)
	ld	a, (#_game_scene)
	dec	a
	jr	NZ, 00104$
;bank0.c:1540: Menu();
	call	_Menu
	jr	00110$
00104$:
;bank0.c:1542: else if(game_scene == 2)
	ld	a, (#_game_scene)
	sub	a, #0x02
	jr	NZ, 00110$
;bank0.c:1544: Menu();
	call	_Menu
;bank0.c:1547: }
	jr	00110$
;bank0.c:1549: void vbl_music_isr(void)
;	---------------------------------
; Function vbl_music_isr
; ---------------------------------
_vbl_music_isr::
;bank0.c:1551: gbt_update();
	call	_gbt_update
;bank0.c:1552: SWITCH_ROM_MBC5(current_bank);
	ld	a, (#_current_bank)
	ldh	(__current_bank+0),a
	ld	hl, #0x3000
	ld	(hl), #0x00
	ld	de, #0x2000
	ld	a, (#_current_bank)
	ld	(de), a
;bank0.c:1553: }
	ret
;bank0.c:1555: void vbl_clock_isr(void)
;	---------------------------------
; Function vbl_clock_isr
; ---------------------------------
_vbl_clock_isr::
;bank0.c:1557: clock_tick++;
	ld	hl, #_clock_tick
	inc	(hl)
;bank0.c:1559: if(clock_tick > 60)
	ld	a, #0x3c
	sub	a, (hl)
	ret	NC
;bank0.c:1561: clock_tick = 0;
	ld	(hl), #0x00
;bank0.c:1562: clock_time_second++;
	ld	hl, #_clock_time_second
	inc	(hl)
	jr	NZ, 00124$
	inc	hl
	inc	(hl)
00124$:
;bank0.c:1564: if(clock_time_second > 59)
	ld	hl, #_clock_time_second
	ld	a, #0x3b
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ret	NC
;bank0.c:1566: clock_time_second = 0;
	ld	hl, #_clock_time_second
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank0.c:1567: clock_time_minute++;
	ld	hl, #_clock_time_minute
	inc	(hl)
	jr	NZ, 00125$
	inc	hl
	inc	(hl)
00125$:
;bank0.c:1569: if(clock_time_minute > 59)
	ld	hl, #_clock_time_minute
	ld	a, #0x3b
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ret	NC
;bank0.c:1572: clock_time_minute++;
	ld	hl, #_clock_time_minute
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;bank0.c:1576: }
	ret
;bank0.c:1578: void vbl_seed_isr(void)
;	---------------------------------
; Function vbl_seed_isr
; ---------------------------------
_vbl_seed_isr::
;bank0.c:1580: Seed += 1;
	ld	hl, #_Seed
	ld	a, (hl)
	inc	a
;bank0.c:1581: if(Seed >= 255){Seed = 1;}
	ld	(hl), a
	sub	a, #0xff
	ret	C
	ld	(hl), #0x01
;bank0.c:1582: }
	ret
;bank0.c:1584: void interrupt_handler(void)
;	---------------------------------
; Function interrupt_handler
; ---------------------------------
_interrupt_handler::
;bank0.c:1586: disable_interrupts();
	call	_disable_interrupts
;bank0.c:1588: add_VBL(vbl_music_isr);
	ld	hl, #_vbl_music_isr
	push	hl
	call	_add_VBL
	add	sp, #2
;bank0.c:1589: add_VBL(vbl_clock_isr);
	ld	hl, #_vbl_clock_isr
	push	hl
	call	_add_VBL
	add	sp, #2
;bank0.c:1590: add_VBL(vbl_seed_isr);
	ld	hl, #_vbl_seed_isr
	push	hl
	call	_add_VBL
	add	sp, #2
;bank0.c:1592: enable_interrupts();
	call	_enable_interrupts
;bank0.c:1594: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;bank0.c:1595: }
	ret
;bank0.c:1597: void Main()
;	---------------------------------
; Function Main
; ---------------------------------
_Main::
;bank0.c:1599: ENABLE_RAM_MBC5;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;bank0.c:1601: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;bank0.c:1602: NR51_REG = 0x11;
	ld	a, #0x11
	ldh	(_NR51_REG+0),a
;bank0.c:1603: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;bank0.c:1605: interrupt_handler();
	call	_interrupt_handler
;bank0.c:1607: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;bank0.c:1608: OBP0_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP0_REG+0),a
;bank0.c:1610: if(saved_game_start == true)
	ld	a, (#_saved_game_start)
	dec	a
	jp	NZ,00102$
;bank0.c:1612: PlayerControlFlag = true;
	ld	hl, #_PlayerControlFlag
	ld	(hl), #0x01
;bank0.c:1613: char_player.pos_x = saved_pos_x;
	ld	de, #(_char_player + 0x0006)
	ld	a, (#_saved_pos_x)
	ld	(de), a
;bank0.c:1614: char_player.pos_y = saved_pos_y;
	ld	de, #(_char_player + 0x0007)
	ld	a, (#_saved_pos_y)
	ld	(de), a
;bank0.c:1616: clock_time_second = saved_clock_time_second;
	ld	hl, #_saved_clock_time_second
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_clock_time_second
	ld	(hl+), a
	ld	(hl), e
;bank0.c:1617: clock_time_minute = saved_clock_time_minute;
	ld	hl, #_saved_clock_time_minute
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_clock_time_minute
	ld	(hl+), a
	ld	(hl), e
;bank0.c:1618: clock_time_hour = saved_clock_time_hour;
	ld	hl, #_saved_clock_time_hour
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_clock_time_hour
	ld	(hl+), a
	ld	(hl), e
;bank0.c:1620: memcpy(inventory, &saved_inventory, sizeof(inventory));
	ld	hl, #0x0063
	push	hl
	ld	hl, #_saved_inventory
	push	hl
	ld	hl, #_inventory
	push	hl
	call	_memcpy
	add	sp, #6
;bank0.c:1621: memcpy(inv_amount, &saved_inv_amount, sizeof(inv_amount));
	ld	hl, #0x0063
	push	hl
	ld	hl, #_saved_inv_amount
	push	hl
	ld	hl, #_inv_amount
	push	hl
	call	_memcpy
	add	sp, #6
;bank0.c:1623: Refresh_Inv_Amount();
	call	_Refresh_Inv_Amount
;bank0.c:1625: switch_bank(bank7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1627: Add_Actor(&actor_hiro);
	ld	hl, #_actor_hiro
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:1628: Add_Actor(&actor_bud);
	ld	hl, #_actor_bud
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:1629: Add_Actor(&actor_soran);
	ld	hl, #_actor_soran
	push	hl
	call	_Add_Actor
	add	sp, #2
;bank0.c:1631: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1633: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;bank0.c:1635: Load_Hiro_Tiles();
	call	_Load_Hiro_Tiles
;bank0.c:1637: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;bank0.c:1638: HIDE_WIN;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;bank0.c:1640: Draw_Map(Get_Map(saved_map));
	ld	a, (#_saved_map)
	push	af
	inc	sp
	call	_Get_Map
	inc	sp
	push	de
	call	_Draw_Map
	add	sp, #2
;bank0.c:1642: switch_bank(bank12);
	ld	a, #0x0c
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1644: Equip_Equipment(&actor_hiro, &equip_wooden_sword);
	ld	hl, #_equip_wooden_sword
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:1645: Equip_Equipment(&actor_hiro, &equip_hoplon);
	ld	hl, #_equip_hoplon
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:1646: Equip_Equipment(&actor_hiro, &equip_cotton_garb);
	ld	hl, #_equip_cotton_garb
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:1647: Equip_Equipment(&actor_hiro, &equip_copper_bracelet);
	ld	hl, #_equip_copper_bracelet
	push	hl
	ld	hl, #_actor_hiro
	push	hl
	call	_Equip_Equipment
	add	sp, #4
;bank0.c:1649: switch_bank(bank2); 
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1651: build_char(&char_player);
	ld	hl, #_char_player
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1652: build_char(&char_npc_1);
	ld	hl, #_char_npc_1
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1653: build_char(&char_npc_2);
	ld	hl, #_char_npc_2
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1655: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1657: Load_Window();
	call	_Load_Window
;bank0.c:1659: switch_bank(bank4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1661: Set_Sprite_Packages(&char_player, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down);
	ld	bc, #_sprite_hiro_down+0
	ld	l, c
	ld	h, b
	ld	e, c
	ld	d, b
	push	hl
	ld	hl, #_sprite_hiro_down
	push	hl
	push	de
	push	bc
	ld	hl, #_char_player
	push	hl
	call	_Set_Sprite_Packages
	add	sp, #10
;bank0.c:1662: Load_Char_Sprite(&char_player, char_player.sprites_down->sprites[0]);
	ld	hl, #_char_player + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_player
	push	hl
	call	_Load_Char_Sprite
	add	sp, #4
;bank0.c:1664: switch_bank(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1666: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;bank0.c:1668: fade_in();
	call	_fade_in
;bank0.c:1670: Gameplay();
	call	_Gameplay
	jp	00103$
00102$:
;bank0.c:1674: Set_Start_Variables();
	call	_Set_Start_Variables
;bank0.c:1676: Refresh_Inv_Amount();
	call	_Refresh_Inv_Amount
;bank0.c:1678: switch_bank(bank3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1680: Load_Hiro_Tiles();
	call	_Load_Hiro_Tiles
;bank0.c:1681: Draw_Titlescreen();
	call	_Draw_Titlescreen
;bank0.c:1683: switch_bank(bank2); 
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1685: build_char(&char_player);
	ld	hl, #_char_player
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1686: build_char(&char_npc_1);
	ld	hl, #_char_npc_1
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1687: build_char(&char_npc_2);
	ld	hl, #_char_npc_2
	push	hl
	call	_build_char
	add	sp, #2
;bank0.c:1689: switch_bank(bank6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1691: Load_Window();
	call	_Load_Window
;bank0.c:1693: switch_bank(bank4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1695: Set_Sprite_Packages(&char_player, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down);
	ld	bc, #_sprite_hiro_down+0
	ld	l, c
	ld	h, b
	ld	e, c
	ld	d, b
	push	hl
	ld	hl, #_sprite_hiro_down
	push	hl
	push	de
	push	bc
	ld	hl, #_char_player
	push	hl
	call	_Set_Sprite_Packages
	add	sp, #10
;bank0.c:1696: Load_Char_Sprite(&char_player, char_player.sprites_down->sprites[0]);
	ld	hl, #_char_player + 17
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #_char_player
	push	hl
	call	_Load_Char_Sprite
	add	sp, #4
;bank0.c:1698: switch_bank(bank2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_switch_bank
	inc	sp
;bank0.c:1700: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;bank0.c:1702: fade_in();
	call	_fade_in
;bank0.c:1704: Gameplay();
	call	_Gameplay
00103$:
;bank0.c:1707: DISABLE_RAM_MBC5;
	ld	hl, #0x0000
	ld	(hl), #0x00
;bank0.c:1708: }
	ret
	.area _CODE
	.area _CABS (ABS)
