#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Equip.h"
#include "Game_Class.h" 
#include "Maps/Map_Menu_Status.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

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

extern GameActor* Get_Actor(UBYTE actor_id);
extern GameEquip* Get_Equip(UBYTE equip_id);
extern GameClass* Get_Class(UBYTE class_id);

extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);
extern void Call_Load_Menu_Main(UBYTE bank);
extern void Call_Menu_Main(UBYTE bank);
extern void Call_Menu_Item(UBYTE bank);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const UINT16 Experience_List[] =
{
    50, 112, 204, 329, 485, 672, 890, 1137, 1417, 1723,
    2061, 2425, 2817, 3237, 3681, 4151, 4645, 5162, 5701, 6262,
    6842, 7442, 8061, 8694, 9346, 10010, 10690, 11381, 12083, 12797,
    13619, 14250, 14987, 15731, 16480,
};

const unsigned char Status_Pointer[1] = {0x0A};

const unsigned char Status_Background[1] = {0x01};

const unsigned char Status_Slash[1] = {0x0F};

const unsigned char Status_Border[1] = {0x09};

void Draw_Status_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
{
    parsed_number = 0;

    saved_number = number;

    large_number = number;

    for(n = 0; n < 3; n++)
    {
        parsed_decimal[n] = 0;
    }

    while(large_number >= 1000)
    {
        large_number -= 1000;
        parsed_number += 1;
    }

    parsed_decimal[0] = parsed_number;
    parsed_number = 0;

    while(large_number >= 100)
    {
        large_number -= 100;
        parsed_number += 1;
    }

    parsed_decimal[1] = parsed_number;
    parsed_number = 0;

    while(large_number >= 10)
    {
        large_number -= 10;
        parsed_number += 1;
    }

    parsed_decimal[2] = parsed_number;

    parsed_decimal[3] = large_number;

    parsed_decimal[0] += 49;
    parsed_decimal[1] += 49;
    parsed_decimal[2] += 49;
    parsed_decimal[3] += 49;

    if(saved_number < 10)
    {
        set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
    }
    else if(saved_number < 100)
    {
        set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
    }
    else if(saved_number < 1000)
    {
        set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
    }
    else
    {
        set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
    }
    
}

void Draw_Status_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 1, 1, icon);
    set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
}

void Draw_Status_Stats(GameActor* actor)
{
    if(actor->max_health > 9)
    {
        set_win_tiles(8, 7, 1, 1, Status_Slash);
        Draw_Status_Number(actor->health, 4, 7);
        Draw_Status_Number(actor->max_health, 5, 8);
    }
    else
    {
        set_win_tiles(7, 7, 1, 1, Status_Slash);
        Draw_Status_Number(actor->health, 3, 7);
        Draw_Status_Number(actor->max_health, 4, 8);
    }

    if(actor->max_mana > 9)
    {
        set_win_tiles(8, 10, 1, 1, Status_Slash);
        Draw_Status_Number(actor->mana, 4, 10);
        Draw_Status_Number(actor->max_mana, 5, 11);
    }
    else
    {
        set_win_tiles(7, 10, 1, 1, Status_Slash);
        Draw_Status_Number(actor->mana, 3, 10);
        Draw_Status_Number(actor->max_mana, 4, 11);
    }
    
    Draw_Status_Number(actor->phys_def + Get_Equip(actor->equipped[weapon_slot])->phys_def + Get_Equip(actor->equipped[secondary_slot])->phys_def + Get_Equip(actor->equipped[armor_slot])->phys_def + Get_Equip(actor->equipped[accessory_slot])->phys_def, 5, 13);
    Draw_Status_Number(actor->magic_def + Get_Equip(actor->equipped[weapon_slot])->magic_def + Get_Equip(actor->equipped[secondary_slot])->magic_def + Get_Equip(actor->equipped[armor_slot])->magic_def + Get_Equip(actor->equipped[accessory_slot])->magic_def, 5, 15);

    Draw_Status_Number(actor->strength + Get_Equip(actor->equipped[weapon_slot])->strength + Get_Equip(actor->equipped[secondary_slot])->strength + Get_Equip(actor->equipped[armor_slot])->strength + Get_Equip(actor->equipped[accessory_slot])->strength, 15, 7);
    Draw_Status_Number(actor->wisdom + Get_Equip(actor->equipped[weapon_slot])->wisdom + Get_Equip(actor->equipped[secondary_slot])->wisdom + Get_Equip(actor->equipped[armor_slot])->wisdom + Get_Equip(actor->equipped[accessory_slot])->wisdom, 15, 9);
    Draw_Status_Number(actor->will + Get_Equip(actor->equipped[weapon_slot])->will + Get_Equip(actor->equipped[secondary_slot])->will + Get_Equip(actor->equipped[armor_slot])->will + Get_Equip(actor->equipped[accessory_slot])->will, 15, 11);
    Draw_Status_Number(actor->agility + Get_Equip(actor->equipped[weapon_slot])->agility + Get_Equip(actor->equipped[secondary_slot])->agility + Get_Equip(actor->equipped[armor_slot])->agility + Get_Equip(actor->equipped[accessory_slot])->agility, 15, 13);
    Draw_Status_Number(Get_Equip(actor->equipped[weapon_slot])->luck + Get_Equip(actor->equipped[secondary_slot])->luck + Get_Equip(actor->equipped[armor_slot])->luck + Get_Equip(actor->equipped[accessory_slot])->luck, 15, 15);
}

void Draw_Menu_Status()
{
    fade_out();

    CurrentMenu = menu_status;

    set_win_tiles(0, 0, 20, 18, Map_Menu_StatusPLN0);

    Call_Draw_Name(bank14, 2, 2, Get_Actor(party[actor_y])->name, true);
    Draw_Status_Stats(Get_Actor(party[actor_y]));
    Draw_Status_Number(Get_Actor(party[actor_y])->experience, 8, 4);
    Draw_Status_Number(Get_Actor(party[actor_y])->level, 9, 2);
    Draw_Status_Number(Experience_List[Get_Actor(party[actor_y])->level - 1], 12, 4);
    Draw_Status_Class(Get_Class(Get_Actor(party[actor_y])->class)->name, Get_Class(Get_Actor(party[actor_y])->class)->icon, 14, 2);

    fade_in();
}

void Menu_Status_Joypad()
{
    Joy = joypad();

    if(Joy & J_UP)
    {
        if(CurrentMenu == menu_status)
        {
            if(actor_y == 0)
            {
                actor_y = actor_max - 1;
            }
            else
            {
                actor_y -= 1;
            }
            
            Draw_Menu_Status();
        }
        else
        {
            if(actor_y > 0)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Background);

                actor_y -= 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Pointer);
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_DOWN)
    {
        if(CurrentMenu == menu_status)
        {
            if(actor_y == actor_max - 1)
            {
                actor_y = 0;
            }
            else
            {
                actor_y += 1;
            }

            Draw_Menu_Status();
        }
        else
        {
            if(actor_y < actor_max - 1)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Background);

                actor_y += 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Status_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_A)
    {
        if(CurrentMenu == menu_status)
        {

        }
        else
        {
            Call_Play_Confirm(bank14);

            Draw_Menu_Status();

            CurrentMenu = menu_status;

            while(joypad() & J_A)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_B)
    {
        if(CurrentMenu == menu_status)
        {
            Call_Play_Confirm(bank14);
            Call_Load_Menu_Main(bank14);
        }
        else
        {
            Call_Play_Confirm(bank14);

            set_win_tiles(9, 2, 1, 1, Status_Background);
            set_win_tiles(9, 5, 1, 1, Status_Background);
            set_win_tiles(9, 8, 1, 1, Status_Background);
            set_win_tiles(9, 10, 1, 1, Status_Background);

            Call_Menu_Main(bank14);
        }
    }
}

void Menu_Status()
{
    while(1)
    {
        performant_delay(1);

        Menu_Status_Joypad();
    }
}

void Load_Menu_Status()
{
    if(party[1] == 0)
    {
        actor_max = 1;
    }
    else if(party[2] == 0)
    {
        actor_max = 2;
    }
    else if(party[3] == 0)
    {
        actor_max = 3;
    }
    else
    {
        actor_max = 0;
    }

    set_win_tiles(9, 2, 1, 1, Status_Pointer);

    actor_y = 0;

    while(joypad() & J_A || joypad() & J_START)
    {
        performant_delay(1);
    }

    Menu_Status();
}