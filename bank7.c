#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Item.h"
#include "Tiles/Font_Menu.c"
#include "Maps/Map_Menu_Main.c"
#include "Maps/Map_Menu_Actor.c"
#include "Maps/Map_Menu_MessageBox.c"
#include "Maps/Map_Menu_ConfirmBox.c"
#include "Messages/Message_Save.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection;

extern UBYTE total_actors;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2, menu_x, menu_y;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UINT16 clock_time_second, clock_time_minute, clock_time_hour;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern GameActor *party[4];

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern const unsigned char Char_Gold[1];

extern void performant_delay(UBYTE num_loops);
extern void toggle_control(UBYTE toggles);

extern void Save_Variables();

extern void fade_out();
extern void fade_in();

extern void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

extern GameItem *Get_Item(UBYTE item_id);
extern GameActor *Get_Actor(UBYTE actor_id);

extern void Gameplay();

extern void Call_Load_Tileset(UBYTE bank, UBYTE tileset);
extern void Call_Menu_Equip(UBYTE bank);
extern void Call_Menu_Item(UBYTE bank);
extern void Call_Menu_Status(UBYTE bank);
extern void Call_Menu_Skills(UBYTE bank);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const unsigned char name_period[1] =
    {
        0x55};

const unsigned char name_blank[8] =
    {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

const unsigned char Menu_Background[1] =
    {
        0x01};

const unsigned char Menu_Pointer[1] =
    {
        0x0A};

const unsigned char Menu_Slash[1] =
    {
        0x0F};

const unsigned char Menu_Empty[3] =
    {
        0x57, 0x57, 0x57};

const unsigned char Menu_Zero[2] =
    {
        0x31, 0x31};

const unsigned char Menu_Coin[1] =
    {
        0x75};

void Add_Item(GameItem *item, UBYTE amount)
{
    for (i = 0; i < 100; i++)
    {
        if (inventory[i] == 0 || inventory[i] == item->item_id)
        {
            inventory[i] = item->item_id;
            inv_amount[i] += amount;
            return;
        }
    }
}

void Add_Actor(GameActor *actor)
{
    if (party[0] == NULL)
    {
        party[0] = actor;
        actor->party_slot = 0;
    }
    else if (party[1] == NULL)
    {
        party[1] = actor;
        actor->party_slot = 1;
    }
    else if (party[2] == NULL)
    {
        party[2] = actor;
        actor->party_slot = 2;
    }
    else if (party[3] == NULL)
    {
        party[3] = actor;
        actor->party_slot = 3;
    }

    total_actors += 1;
}

void Draw_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
{
    parsed_number = 0;

    saved_number = number;

    large_number = number;

    for (n = 0; n < 3; n++)
    {
        parsed_decimal[n] = 0;
    }

    while (large_number >= 1000)
    {
        large_number -= 1000;
        parsed_number += 1;
    }

    parsed_decimal[0] = parsed_number;
    parsed_number = 0;

    while (large_number >= 100)
    {
        large_number -= 100;
        parsed_number += 1;
    }

    parsed_decimal[1] = parsed_number;
    parsed_number = 0;

    while (large_number >= 10)
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

    if (saved_number < 10)
    {
        set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
    }
    else if (saved_number < 100)
    {
        set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
    }
    else if (saved_number < 1000)
    {
        set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
    }
    else
    {
        set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
    }
}

void Draw_Name(UBYTE tile_x, UBYTE tile_y, unsigned char *name, UBYTE full_name)
{
    if (name[4] != 0x01 && !full_name)
    {
        set_win_tiles(tile_x, tile_y, 3, 1, name);
        set_win_tiles(tile_x + 3, tile_y, 1, 1, name_period);
    }
    else if (name[4] == 0x01)
    {
        set_win_tiles(tile_x, tile_y, 4, 1, name);
    }
    else
    {
        set_win_tiles(tile_x, tile_y, 7, 1, name);
    }
}

void Draw_Actor(GameActor *actor)
{
    if (actor != NULL)
    {
        if (actor->party_slot == 0 && actor->active_member)
        {
            set_win_tiles(10, 2, 9, 2, Map_Menu_ActorPLN0);

            Draw_Name(10, 2, actor->name, false);

            Draw_Number(actor->max_health, 15, 3);
            Draw_Number(actor->health, 14, 2);

            if (actor->level > 9)
            {
                Draw_Number(actor->level, 11, 3);
            }
            else
            {
                Draw_Number(actor->level, 10, 3);
            }
        }
        else if (actor->party_slot == 1 && actor->active_member)
        {
            set_win_tiles(10, 5, 9, 2, Map_Menu_ActorPLN0);

            Draw_Name(10, 5, actor->name, false);

            Draw_Number(actor->max_health, 15, 6);
            Draw_Number(actor->health, 14, 5);

            if (actor->level > 9)
            {
                Draw_Number(actor->level, 11, 6);
            }
            else
            {
                Draw_Number(actor->level, 10, 6);
            }
        }
        else if (actor->party_slot == 2 && actor->active_member)
        {
            set_win_tiles(10, 8, 9, 2, Map_Menu_ActorPLN0);

            Draw_Name(10, 8, actor->name, false);

            Draw_Number(actor->max_health, 15, 9);
            Draw_Number(actor->health, 14, 8);

            if (actor->level > 9)
            {
                Draw_Number(actor->level, 11, 9);
            }
            else
            {
                Draw_Number(actor->level, 10, 9);
            }
        }
        else if (actor->party_slot == 3 && actor->active_member)
        {
            set_win_tiles(10, 11, 9, 2, Map_Menu_ActorPLN0);

            Draw_Name(10, 11, actor->name, false);

            Draw_Number(actor->max_health, 15, 12);
            Draw_Number(actor->health, 14, 11);

            if (actor->level > 9)
            {
                Draw_Number(actor->level, 11, 12);
            }
            else
            {
                Draw_Number(actor->level, 10, 12);
            }
        }
    }
}

void Draw_Party()
{
    Draw_Actor(party[0]);
    Draw_Actor(party[1]);
    Draw_Actor(party[2]);
    Draw_Actor(party[3]);
}

void Draw_Time()
{
    if (CurrentMenu == menu_main)
    {
        set_win_tiles(17, 16, 2, 1, Menu_Zero);
        Draw_Number(clock_time_minute, 15, 16);
        set_win_tiles(15, 16, 1, 1, Menu_Zero);
        Draw_Number(clock_time_hour, 14, 16);
    }
}

void Draw_Gold(UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x + 4, tile_y, 1, 1, Char_Gold);
    Draw_Number(party_gold, tile_x, tile_y);
}

void Load_Font_Menu()
{
    set_bkg_tileset(0, 120, Font_Menu);
}

void Draw_Main_Menu()
{
    fade_out();

    CurrentMenu = menu_main;
    selection_max = 5;

    Load_Font_Menu();

    HIDE_SPRITES;
    SHOW_WIN;

    move_win(7, 0);

    set_win_tiles(0, 0, 20, 18, Map_Menu_MainPLN0);

    Draw_Gold(3, 16);

    Draw_Time();

    Draw_Party();

    if (CurrentSelection == selection_max)
    {
        set_win_tiles(1, 3 + CurrentSelection * 2, 1, 1, Menu_Pointer);
    }
    else
    {
        set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
    }

    fade_in();
}

void Refresh_Main_Menu()
{
    set_win_tiles(14, 8, 6, 5, Map_Menu_ConfirmBox_RefreshPLN0);

    Draw_Actor(party[2]);
    Draw_Actor(party[3]);

    set_win_tiles(0, 13, 20, 5, &Map_Menu_MainPLN0[260]);

    Draw_Number(party_gold, 4, 16);

    Draw_Time();

    performant_delay(1);
}

void Draw_Save_Message()
{
    for (i = 0; i < 18; i++)
    {
        if (joypad() & J_A || joypad() & J_START)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_win_tiles(1 + i, 14, 1, 1, &Message_SavePLN0[i]);
    }

    for (i = 0; i < 16; i++)
    {
        if (joypad() & J_A || joypad() & J_START)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_win_tiles(1 + i, 15, 1, 1, &Message_SavePLN0[i + 18]);
    }
}

void Draw_Menu_Save()
{
    CurrentMenu = menu_main_save;

    set_win_tiles(0, 13, 20, 5, Map_Menu_MessageBoxPLN0);

    performant_delay(2);

    Draw_Save_Message();

    set_win_tiles(14, 8, 6, 5, Map_Menu_ConfirmBoxPLN0);

    performant_delay(1);

    set_win_tiles(15, 9, 1, 1, Menu_Pointer);
}

void Close_Menu()
{
    fade_out();

    Call_Load_Tileset(bank7, Tileset);

    HIDE_WIN;
    SHOW_SPRITES;

    move_win(255, 0);

    toggle_control(true);

    fade_in();

    Gameplay();
}

void Update_Menu_Joypad()
{
    Joy = joypad();

    if (Joy & J_UP)
    {
        if (CurrentMenu == menu_main)
        {
            if (CurrentSelection == 0)
            {
                CurrentSelection = 5;
            }
            else
            {
                CurrentSelection -= 1;
            }

            if (CurrentSelection == 4)
            {
                set_win_tiles(1, 5 + CurrentSelection * 2, 1, 1, Menu_Background);

                set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
            }
            else if (CurrentSelection == 5)
            {
                set_win_tiles(1, 2, 1, 1, Menu_Background);

                set_win_tiles(1, 13, 1, 1, Menu_Pointer);
            }
            else
            {
                set_win_tiles(1, 4 + CurrentSelection * 2, 1, 1, Menu_Background);

                set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
            }

            while (joypad() & J_UP)
            {
                wait_vbl_done();

                if (joypad() & J_B)
                {
                    Close_Menu();
                }
            }
        }
        else if (CurrentMenu == menu_main_save)
        {
            if (menu_y > 0)
            {
                set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Background);

                menu_y -= 1;

                set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Pointer);
            }
        }
    }

    if (Joy & J_DOWN)
    {
        if (CurrentMenu == menu_main)
        {
            if (CurrentSelection == 5)
            {
                CurrentSelection = 0;
            }
            else
            {
                CurrentSelection += 1;
            }

            if (CurrentSelection == 5)
            {
                set_win_tiles(1, CurrentSelection * 2, 1, 1, Menu_Background);

                set_win_tiles(1, 3 + CurrentSelection * 2, 1, 1, Menu_Pointer);
            }
            else if (CurrentSelection == 0)
            {
                set_win_tiles(1, 13, 1, 1, Menu_Background);

                set_win_tiles(1, 2, 1, 1, Menu_Pointer);
            }
            else
            {
                set_win_tiles(1, CurrentSelection * 2, 1, 1, Menu_Background);

                set_win_tiles(1, 2 + CurrentSelection * 2, 1, 1, Menu_Pointer);
            }

            while (joypad() & J_DOWN)
            {
                wait_vbl_done();

                if (joypad() & J_B)
                {
                    Close_Menu();
                }
            }
        }
        else if (CurrentMenu == menu_main_save)
        {
            if (menu_y < 1)
            {
                set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Background);

                menu_y += 1;

                set_win_tiles(15, 9 + menu_y * 2, 1, 1, Menu_Pointer);
            }
        }
    }

    if (Joy & J_B)
    {
        if (CurrentMenu == menu_main)
        {
            Call_Play_Confirm(bank7);
            Close_Menu();
        }
        else if (CurrentMenu == menu_main_save)
        {
            Call_Play_Confirm(bank7);

            CurrentMenu = menu_main;

            Refresh_Main_Menu();

            set_win_tiles(1, 13, 1, 1, Menu_Pointer);

            while (joypad() & J_B)
            {
                wait_vbl_done();
            }
        }
    }

    if (Joy & J_A || Joy & J_START)
    {
        if (CurrentMenu == menu_main)
        {
            if (CurrentSelection == 0)
            {
                Call_Play_Confirm(bank7);
                Call_Menu_Item(bank7);
            }
            else if (CurrentSelection == 1)
            {
                Call_Play_Confirm(bank7);
                Call_Menu_Equip(bank7);
            }
            else if (CurrentSelection == 2)
            {
                Call_Play_Confirm(bank7);
                Call_Menu_Skills(bank7);
            }
            else if (CurrentSelection == 3)
            {
                Call_Play_Confirm(bank7);
                Call_Menu_Status(bank7);
            }
            else if (CurrentSelection == 5)
            {
                Call_Play_Confirm(bank7);

                menu_y = 0;
                Draw_Menu_Save();

                while (joypad() & J_A || joypad() & J_START || joypad() & J_B)
                {
                    wait_vbl_done();
                }
            }
        }
        else if (CurrentMenu == menu_main_save)
        {
            Call_Play_Confirm(bank7);

            CurrentMenu = menu_main;

            Save_Variables();

            Refresh_Main_Menu();

            set_win_tiles(1, 13, 1, 1, Menu_Pointer);

            while (joypad() & J_A || joypad() & J_START)
            {
                wait_vbl_done();
            }
        }
    }
}

void Menu_Main()
{
    while (joypad() & J_B)
    {
        wait_vbl_done();
    }

    while (true)
    {
        wait_vbl_done();

        Draw_Time();
        Update_Menu_Joypad();
    }
}

void Load_Menu_Main()
{
    Draw_Main_Menu();

    while (joypad() & J_A || joypad() & J_START || joypad() & J_B)
    {
        wait_vbl_done();
    }

    Menu_Main();
}