#include <gb/gb.h>

#ifndef GAME_ITEM
#define GAME_ITEM

typedef struct GameItem
{
    unsigned char* name;
    unsigned char* full_name;
    UBYTE item_id;
    UBYTE item_type;
    UINT16 price;
    unsigned char* description;

} GameItem;

extern const GameItem item_null;
extern const GameItem item_healing_brew;
extern const GameItem item_life_leaf;
extern const GameItem item_mana_brew;

#endif