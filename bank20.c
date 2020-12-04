#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_NPC.h"
#include "Game_Event.h"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentShop, CurrentShopSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max, skills_y, shop_x, shop_y;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y;

extern unsigned char party[4];

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern void performant_delay(UBYTE num_loops);
extern void toggle_control(UBYTE toggle);

extern void fade_out();
extern void fade_in();

extern void Gameplay();

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

void Scene_Handler(UBYTE scene_id)
{
}