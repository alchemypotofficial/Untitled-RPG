#include <gb/gb.h>
#include "Game_Sprite.h"

#ifndef GAME_CHARACTER
#define GAME_CHARACTER

typedef struct GameCharacter
{
    UBYTE active;
    UBYTE npc_type;
    UBYTE action_id;
    UBYTE sprite_index;
    UBYTE sprite_id[2];
    UBYTE pos_x;
    UBYTE pos_y;
    UBYTE walk_count[4];
    UBYTE facing;
    UBYTE visible;
    UBYTE anim_tick;
    GameSpritePackage* sprites_up;
    GameSpritePackage* sprites_down;
    GameSpritePackage* sprites_left;
    GameSpritePackage* sprites_right;

} GameCharacter;

extern GameCharacter char_cursor;

extern GameCharacter char_player;

extern GameCharacter char_npc_1;
extern GameCharacter char_npc_2;
extern GameCharacter char_npc_3;
extern GameCharacter char_npc_4;

#endif