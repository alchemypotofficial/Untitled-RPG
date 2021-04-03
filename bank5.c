#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Functions.h"
#include "Game_Character.h"
#include "Game_NPC.h"
#include "Game_Sprite.h"

extern UBYTE PlayerCharacter;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_i, u_j;

extern UBYTE u16_i;

extern UINT16 party_gold;

extern GameNPC* npc_list[7];

extern GameCharacter* temp_char;

extern void performant_delay(UBYTE num_loops);

extern GameCharacter* Get_Char_NPC(const char* name);
extern GameCharacter* Find_Free_Character();

extern void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);
extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite);
extern void Call_Build_Char(UBYTE bank, GameCharacter* character);
extern void Call_Set_Sprites(UBYTE bank, GameCharacter* character, const GameCharSprite* sprites);
extern void Call_Orient_Char(UBYTE bank, GameCharacter* character);

const INT8 Jump_Parabola[] =
{
    -2, -2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 2, 1, -1
};

void Set_Name(GameCharacter* character, const char* name)
{
    strncpy(character->name, name, 14);
}

void Add_NPC(const char* name, GameNPC* npc, UBYTE pos_x, UBYTE pos_y, UBYTE facing)
{
    temp_char = Find_Free_Character();

    if(temp_char != NULL)
    {
        temp_char->pos_x = pos_x;
        temp_char->pos_y = pos_y;
        temp_char->npc_type = npc->npc_type;
        temp_char->action_id = npc->action_id;

        temp_char->active = true;
        temp_char->visible = true;

        temp_char->facing = facing;

        Set_Name(temp_char, name);

        Call_Set_Sprites(bank5, temp_char, npc->sprites);

        switch(facing)
        {
            case up: Call_Load_Char_Sprite(bank5, temp_char, npc->sprites->actor_up->sprites[0]); break;
            case down: Call_Load_Char_Sprite(bank5, temp_char, npc->sprites->actor_down->sprites[0]); break;
            case left: Call_Load_Char_Sprite(bank5, temp_char, npc->sprites->actor_left->sprites[0]); break;
            case right: Call_Load_Char_Sprite(bank5, temp_char, npc->sprites->actor_right->sprites[0]); break;
        }

        Call_Orient_Char(bank5, temp_char);
    }
    else
    {
        return;
    }
}

void Clear_Char(GameCharacter* character)
{
    if(character != NULL)
    {
        Set_Name(character, "");

        character->pos_x = 0;
        character->pos_x = 0;
        character->npc_type = nothing;
        character->action_id = 0;

        character->active = false;
        character->visible = false;

        Call_Set_Sprites(bank5, character, NULL);
        Call_Load_Char_Sprite(bank5, character, &sprite_clear);
    }
}

void Remove_NPC(const char* name)
{
    temp_char = Get_Char_NPC(name);
    Clear_Char(temp_char);
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

void Jump_Character(GameCharacter* character)
{
    if(character != NULL)
    {
        for(u_i = 0; u_i < 22; u_i++)
        {
            performant_delay(1);

            scroll_sprite(character->sprite_id[0], 0, Jump_Parabola[u_i]);
            scroll_sprite(character->sprite_id[0] + 1, 0, Jump_Parabola[u_i]);
            scroll_sprite(character->sprite_id[0] + 2, 0, Jump_Parabola[u_i]);
            scroll_sprite(character->sprite_id[0] + 3, 0, Jump_Parabola[u_i]);
        }
    }
}