#include <gb/gb.h>
#include "Game_NPC.h"

#ifndef GAME_SHOP
#define GAME_SHOP

typedef struct GameShop
{
    UBYTE shop_id;
    UBYTE shop_type;
    UBYTE wares[10];
    unsigned char* message;
    
} GameShop;

extern const GameShop shop_test;
extern const GameShop shop_plumvillage_item;

#endif