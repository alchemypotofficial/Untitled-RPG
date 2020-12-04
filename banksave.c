#include <gb/gb.h>
#include "Game_Actor.h"

UBYTE saved_pos_x = 0, saved_pos_y = 0;
UBYTE saved_direction = 0;
UBYTE saved_map = 0;
UBYTE saved_game_start = 0;
UINT16 saved_clock_time_second = 0, saved_clock_time_minute = 0, saved_clock_time_hour = 0;

unsigned char saved_inventory[99];
unsigned char saved_inv_amount[99];

unsigned char saved_equipment_weapon[30];
unsigned char saved_equipment_secondary[30];
unsigned char saveed_equipment_armor[30];
unsigned char saved_equipment_accessory[30];

GameActor saved_actor_hiro;