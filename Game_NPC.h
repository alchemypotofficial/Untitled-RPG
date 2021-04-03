#include <gb/gb.h>
#include "Game_Sprite.h"

#ifndef GAME_NPC
#define GAME_NPC

typedef struct GameNPC
{
    UBYTE npc_id;
    UBYTE npc_type;
    UBYTE action_id;
    const GameCharSprite* sprites;
 
} GameNPC;

extern const GameNPC npc_test_1;
extern const GameNPC npc_test_2;
extern const GameNPC npc_plum_shop;

extern const GameNPC npc_sashi;

extern const GameNPC npc_ship;

#endif