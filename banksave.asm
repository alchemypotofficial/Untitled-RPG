;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module banksave
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _saved_actor_hiro
	.globl _saved_equipment_accessory
	.globl _saveed_equipment_armor
	.globl _saved_equipment_secondary
	.globl _saved_equipment_weapon
	.globl _saved_inv_amount
	.globl _saved_inventory
	.globl _saved_clock_time_hour
	.globl _saved_clock_time_minute
	.globl _saved_clock_time_second
	.globl _saved_game_start
	.globl _saved_map
	.globl _saved_direction
	.globl _saved_pos_y
	.globl _saved_pos_x
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA_0
_saved_pos_x::
	.ds 1
_saved_pos_y::
	.ds 1
_saved_direction::
	.ds 1
_saved_map::
	.ds 1
_saved_game_start::
	.ds 1
_saved_clock_time_second::
	.ds 2
_saved_clock_time_minute::
	.ds 2
_saved_clock_time_hour::
	.ds 2
_saved_inventory::
	.ds 99
_saved_inv_amount::
	.ds 99
_saved_equipment_weapon::
	.ds 30
_saved_equipment_secondary::
	.ds 30
_saveed_equipment_armor::
	.ds 30
_saved_equipment_accessory::
	.ds 30
_saved_actor_hiro::
	.ds 166
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
	.area _CODE
	.area _CODE
	.area _CABS (ABS)
