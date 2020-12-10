#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Character.h"
#include "Game_Sprite.h"
#include "Game_NPC.h"
#include "Tiles/Tiles_Clear.c"
#include "Tiles/Tiles_Hiro.c"
#include "Tiles/Hiro_Tiles.c"
#include "Tiles/Tiles_Bud.c"
#include "Tiles/Tiles_Soran.c"
#include "Tiles/Tiles_Man_1.c"

extern GameActor* party[4];

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

void Load_Player_Actor()
{
    char_player.sprites = party[0]->sprites;

    if(char_player.facing == up)
    {
        Load_Char_Sprite(&char_player, char_player.sprites->actor_up->sprites[0]);
    }
    else if(char_player.facing == down)
    {
        Load_Char_Sprite(&char_player, char_player.sprites->actor_down->sprites[0]);
    }
    else if(char_player.facing == left)
    {
        Load_Char_Sprite(&char_player, char_player.sprites->actor_left->sprites[0]);
    }
    else if(char_player.facing == right)
    {
        Load_Char_Sprite(&char_player, char_player.sprites->actor_right->sprites[0]);
    }
}