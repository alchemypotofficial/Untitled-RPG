#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Character.h"
#include "Game_NPC.h"
#include "Game_Sprite.h"

extern UBYTE PlayerCharacter;
extern INT8 i, j, k, l, m, n;

extern void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);
extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite);
extern void Call_Build_Char(UBYTE bank, GameCharacter* character);
extern void Call_Set_Sprite_Packages(UBYTE bank, GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right);

void Add_NPC(GameCharacter* character, GameNPC* npc)
{
    character->pos_x = npc->pos_x;
    character->pos_y = npc->pos_y;
    character->npc_type = npc->npc_type;
    character->action_id = npc->action_id;

    character->active = true;
    character->visible = true;

    Call_Set_Sprite_Packages(bank5, character, npc->sprites_up, npc->sprites_down, npc->sprites_left, npc->sprites_right);
    Call_Load_Char_Sprite(bank5, character, npc->sprites_down->sprites[0]);
}

void Reset_NPC()
{
    Call_Load_Char_Sprite(bank5, &char_npc_1, &sprite_clear);
    Call_Build_Char(bank5, &char_npc_1);
    char_npc_1.active = false;

    Call_Load_Char_Sprite(bank5, &char_npc_2, &sprite_clear);
    Call_Build_Char(bank5, &char_npc_2);
    char_npc_2.active = false;

    Call_Load_Char_Sprite(bank5, &char_npc_3, &sprite_clear);
    Call_Build_Char(bank5, &char_npc_3);
    char_npc_3.active = false;
}

void NPC_Handler(UINT16 action_id)
{

}