#include <gb/gb.h>
#include "Game_Sprite.h"

#ifndef GAME_NPC
#define GAME_NPC

typedef struct GameNPC
{
    UBYTE npc_id;
    UBYTE npc_type;
    UBYTE action_id;
    GameSpritePackage* sprites_up;
    GameSpritePackage* sprites_down;
    GameSpritePackage* sprites_left;
    GameSpritePackage* sprites_right;
 
} GameNPC;

extern const GameNPC npc_test_1;
extern const GameNPC npc_test_2;
extern const GameNPC npc_plum_shop;

extern const GameNPC npc_sashi;

#endif