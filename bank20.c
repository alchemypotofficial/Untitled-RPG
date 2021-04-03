#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Functions.h"
#include "Game_Actor.h"
#include "Game_NPC.h"
#include "Game_Event.h"
#include "Game_Map.h"
#include "Game_Character.h"
#include "Game_Message.h"

extern UBYTE Joy;

extern const GameMap* current_map;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentShop, CurrentShopSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max, skills_y, shop_x, shop_y;

extern UBYTE Tileset;

extern UBYTE PlayerControlFlag;

extern UBYTE InShipFlag;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y;

extern GameActor *party[4];

extern GameCharacter* temp_char;

extern unsigned char name_hiro;
extern UBYTE name_hiro_length;

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

void Scene_Opening()
{
    second_delay(1);

    Call_Draw_Message(bank20, &message_intro_1, &name_hiro, 4, true);

    second_delay(2);

    Call_Draw_Message(bank20, &message_intro_2, &name_hiro, 4, true);

    second_delay(1);

    Call_Draw_Message(bank20, &message_intro_3, NULL, 0, true);

    performant_delay(15);

    Call_Draw_Message(bank20, &message_intro_4, NULL, 0, true);

    second_delay(1);

    Call_Draw_Message(bank20, &message_intro_5, &name_hiro, 4, true);

    set_faded();

    Call_Add_Actor(bank20, &actor_hiro);

    Call_Load_Player_Actor(bank20);

    Call_Build_Char(bank20, &char_player);

    Call_Teleport(bank20, &map_hiro_house, 10, 5);

    Call_Add_NPC(bank20, "npc_sashi", &npc_sashi, 9, 5, right);

    SHOW_SPRITES;

    fade_in();

    Call_Jump_Character(bank20, Get_Char_NPC("npc_sashi"));
    Call_Jump_Character(bank20, Get_Char_NPC("npc_sashi"));
    Call_Jump_Character(bank20, Get_Char_NPC("npc_sashi"));

    performant_delay(15);

    Call_Draw_Message(bank20, &message_intro_6, NULL, 0, true);

    performant_delay(15);

    Call_Draw_Message(bank20, &message_intro_7, &name_hiro, 4, true);

    Call_Walk_Distance(bank20, Get_Char_NPC("npc_sashi"), 0, 3);

    while(true)
    {
        performant_delay(1);
        
        Call_Walk_Chars(bank20);
        
        if(check_walk_counter(Get_Char_NPC("npc_sashi")) == false)
        {
            break;
        }
    }

    PlayerControlFlag = true;
}

void Scene_Ship()
{
    temp_char = Get_Char_NPC("npc_ship");

    switch(char_player.facing)
    {
        case up: Call_Walk_Distance(bank20, &char_player, 0, -1); break;
        case down: Call_Walk_Distance(bank20, &char_player, 0, 1); break;
        case left: Call_Walk_Distance(bank20, &char_player, -1, 0); break;
        case right: Call_Walk_Distance(bank20, &char_player, 1, 0); break;
    }

    while(true)
    {
        performant_delay(1);
        
        Call_Walk_Chars(bank20);
        
        if(check_walk_counter(&char_player) == false)
        {
            break;
        }
    }

    Call_Set_Sprites(bank20, &char_player, &sprite_ship);

    switch(temp_char->facing)
    {
        case up: Call_Load_Char_Sprite(bank20, &char_player, &sprite_ship_up_0); break;
        case down: Call_Load_Char_Sprite(bank20, &char_player, &sprite_ship_down_0); break;
        case left: Call_Load_Char_Sprite(bank20, &char_player, &sprite_ship_left_0); break;
        case right: Call_Load_Char_Sprite(bank20, &char_player, &sprite_ship_right_0); break;
    }

    char_player.facing = temp_char->facing;

    InShipFlag = true;

    Call_Remove_NPC(bank20, "npc_ship");
}

void Scene_Ship_Depart()
{
    Call_Add_NPC(bank20, "npc_ship", &npc_ship, char_player.pos_x, char_player.pos_y, char_player.facing);

    Call_Load_Player_Actor(bank20);
    
    switch(char_player.facing)
    {
        case up: Call_Load_Char_Sprite(bank20, &char_player, char_player.sprites->actor_up->sprites[0]); break;
        case down: Call_Load_Char_Sprite(bank20, &char_player, char_player.sprites->actor_down->sprites[0]); break;
        case left: Call_Load_Char_Sprite(bank20, &char_player, char_player.sprites->actor_left->sprites[0]); break;
        case right: Call_Load_Char_Sprite(bank20, &char_player, char_player.sprites->actor_right->sprites[0]); break;
    }

    switch(char_player.facing)
    {
        case up: Call_Walk_Distance(bank20, &char_player, 0, -1); break;
        case down: Call_Walk_Distance(bank20, &char_player, 0, 1); break;
        case left: Call_Walk_Distance(bank20, &char_player, -1, 0); break;
        case right: Call_Walk_Distance(bank20, &char_player, 1, 0); break;
    }

    InShipFlag = false;
}

void Scene_Handler(UBYTE scene_id)
{
    switch (scene_id)
    {
        case 0:
            Scene_Opening();
            break;
        case 1:
            Scene_Ship();
            break;
        case 2:
            Scene_Ship_Depart();
            break;
        default:
            break;
    }
}