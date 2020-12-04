#include <gb/gb.h>
#include "Game_Actor.h"

UBYTE saved_pos_x, saved_pos_y;
UBYTE saved_direction;
UBYTE saved_map;
UBYTE saved_game_start;
UINT16 saved_clock_time_second, saved_clock_time_minute, saved_clock_time_hour;

unsigned char saved_inventory[99];
unsigned char saved_inv_amount[99];

unsigned char saved_equipment_weapon[30];
unsigned char saved_equipment_secondary[30];
unsigned char saveed_equipment_armor[30];
unsigned char saved_equipment_accessory[30];

GameActor saved_actor_hiro;