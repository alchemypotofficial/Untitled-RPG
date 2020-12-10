#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_NPC.h"
#include "Game_Event.h"
#include "Game_Map.h"
#include "Game_Character.h"
#include "Game_Message.h"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentShop, CurrentShopSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max, skills_y, shop_x, shop_y;

extern UBYTE Tileset;

extern UBYTE PlayerControlFlag;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y;

extern GameActor* party[4];

extern unsigned char* name_hiro;
extern UBYTE name_hiro_length;

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern void performant_delay(UBYTE num_loops);
extern void second_delay(UBYTE num_seconds);
extern void toggle_control(UBYTE toggle);

extern void set_faded();
extern void fade_out();
extern void fade_in();

extern void scroll_screen(INT8 move_x, INT8 move_y);

extern void Gameplay();

extern void Call_Teleport(UBYTE bank, GameMap* map, UBYTE tile_x, UBYTE tile_y);
extern void Call_Add_Actor(UBYTE bank, GameActor* actor);
extern void Call_Build_Char(UBYTE bank, GameCharacter* character);
extern void Call_Load_Player_Actor(UBYTE bank);
extern void Call_Draw_Message(UBYTE bank, GameMessage* message, unsigned char* insert_1, UBYTE length_1);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

void Scene_Opening()
{
    fill_bkg_rect(0, 0, 32, 32, 0xD3);

    SHOW_BKG;
    HIDE_WIN;

    second_delay(1);

    Call_Draw_Message(bank20, &message_intro_1, name_hiro, name_hiro_length);

    set_faded();

    Call_Add_Actor(bank20, &actor_hiro);

    Call_Load_Player_Actor(bank20);

    Call_Build_Char(bank20, &char_player);

    Call_Teleport(bank20, &map_hiro_house, 10, 5);

    SHOW_SPRITES;

    fade_in();

    PlayerControlFlag = true;
}

void Scene_Handler(UBYTE scene_id)
{
    switch(scene_id)
    {
        case 0:
            Scene_Opening();
            break;
        default:
            break;
    }
}