#include <gb/gb.h>
#include "Game_Event.h"

#ifndef GAME_MAP
#define GAME_MAP

typedef struct GameMap
{
    UBYTE map_id;
    UBYTE map_bank;
    UBYTE size_x;
    UBYTE size_y;
    unsigned char* data;
    UBYTE combat;
    UBYTE troops[6];
    UBYTE event_tele[20];
    UBYTE event_sign[10];
    GameChest* event_chest[10];
    GameTrigger* event_trigger[10];
    GameShopkeeper* event_shopkeeper[5];
    
} GameMap;

extern const GameMap map_plum_village;
extern const GameMap map_hiro_house;
extern const GameMap map_plum_item_shop;
extern const GameMap map_bud_house;
extern const GameMap map_yggdrid;

#endif