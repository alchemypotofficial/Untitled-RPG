#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Character.h"
#include "Game_Sprite.h"
#include "Game_NPC.h"
#include "Tiles/Tiles_Clear.c"
#include "Tiles/Tiles_Hiro.c"
#include "Tiles/Hiro_Tiles.c"
#include "Tiles/Tiles_Man_1.c"

extern INT8 i, j, k, l, m, n;

void Load_Char_Sprite(GameCharacter* character, GameSprite* sprite)
{
    set_sprite_data(character->sprite_index, 4, sprite->tiles);
}

void Set_Char_Tile(GameCharacter* character, UBYTE tile, GameSprite* sprite)
{
    set_sprite_data(character->sprite_index + tile, 1, sprite->tiles);
}

void Set_Sprite_Packages(GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right)
{
    character->sprites_up = sprites_up;
    character->sprites_down = sprites_down;
    character->sprites_left = sprites_left;
    character->sprites_right = sprites_right;
}