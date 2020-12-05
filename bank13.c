#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Item.h"
#include "Game_Equip.h"
#include "Maps/Map_Menu_Items.c"
#include "Maps/Map_Menu_Party.c"
#include "Maps/Map_Menu_Reset.c"
#include "Maps/Map_Item_Use_Replace.c"
#include "Maps/Map_Item_Description.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y;

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

extern void fade_out();
extern void fade_in();

extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);

extern GameItem* Get_Item(UBYTE item_id);
extern GameActor* Get_Actor(UBYTE actor_id);

extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);
extern void Call_Load_Menu_Main(UBYTE bank);
extern void Call_Menu_Item(UBYTE bank);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const unsigned char Item_Background[1] =
{
    0x01
};

const unsigned char Item_Pointer[1] =
{
    0x0A
};

const unsigned char Item_Border[1] =
{
    0x09
};

const unsigned char Item_Cursor_Up[1] =
{
    0x0B
};

const unsigned char Item_Cursor_Down[1] =
{
    0x0C
};

const unsigned char Item_Slash[1] =
{
    0x0F
};

const unsigned char Item_Number[1] =
{
    0x2E
};

const unsigned char Item_Zero[1] =
{
    0x31
};

const unsigned char Item_Clear[] =
{
    0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01
};

void Menu_Item_Sort_Joypad();
void Menu_Item_Use_Win_Joypad();
void Menu_Item_Use_Joypad();
void Menu_Item_Joypad();

UBYTE Use_Item(GameActor* actor, GameItem* item) //Use item on actor;
{
    switch(item->action_id)
    {
        case 0: //NULL
            return false;
            break;
        case 1: //Healing Brew
            if(actor->health != 0 && actor->health < actor->max_health)
            {
                actor->health += 15;

                if(actor->health > actor->max_health)
                {
                    actor->health = actor->max_health;
                }

                return true;
            }
            else
            {
                return false;
            }            
            break;
        default:
            return false;
            break;
    }
}

void Remove_Item(UBYTE slot, UBYTE amount)
{
    if(amount >= inv_amount[slot])
    {
        inventory[slot] = 0;
        inv_amount[slot] = 0;
    }
    else
    {
        inv_amount[slot] -= amount;
    }
}

void Restructure_Inventory()
{
    if(inventory[CurrentItemSlot + CurrentItemSelection] == 0)
    {
        for(i = CurrentItemSlot + CurrentItemSelection; i < 99; i++)
        {
            inventory[i] = inventory[i + 1];
            inv_amount[i] = inv_amount[i + 1];

            if(inventory[i] == 0)
            {
                return;
            }
        }
    }
}

void Draw_Item_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
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

void Draw_Item(GameItem* item, UBYTE inventory_slot, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 12, 1, item->full_name);

    if(inv_amount[inventory_slot] > 0)
    {
        set_win_tiles(tile_x + 13, tile_y, 1, 1, Item_Number);
        set_win_tiles(tile_x + 14, tile_y, 2, 1, Item_Zero);
        Draw_Item_Number(inv_amount[inventory_slot], tile_x + 12, tile_y);
    }
    else
    {
        set_win_tiles(tile_x + 13, tile_y, 3, 1, Item_Clear);
    }
}

void Draw_Actor_Window(GameActor* actor, UBYTE item_type)
{
    if(actor->party_slot == 0 && actor->active_member == true)
    {
        Call_Draw_Name(bank13, 7, 13, actor->name, false);

        switch(item_type)
        {
            case none:
                break;
            case health_recovery:
                Draw_Item_Number(actor->health, 11, 13);
                set_win_tiles(15, 13, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 13);
                break;
            case mana_recovery:
                Draw_Item_Number(actor->mana, 11, 13);
                set_win_tiles(15, 13, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_mana, 15, 13);
                break;
            case status_death:
                Draw_Item_Number(actor->health, 11, 13);
                set_win_tiles(15, 13, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 13);
                break;
            default:
                break;
        }
    }
    else if(actor->party_slot == 1 && actor->active_member == true)
    {
        Call_Draw_Name(bank13, 7, 14, actor->name, false);

        switch(item_type)
        {
            case none:
                break;
            case health_recovery:
                Draw_Item_Number(actor->health, 11, 14);
                set_win_tiles(15, 14, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 14);
                break;
            case mana_recovery:
                Draw_Item_Number(actor->mana, 11, 14);
                set_win_tiles(15, 14, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_mana, 15, 14);
                break;
            case status_death:
                Draw_Item_Number(actor->health, 11, 14);
                set_win_tiles(15, 14, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 14);
                break;
            default:
                break;
        }
    }
    else if(actor->party_slot == 2 && actor->active_member == true)
    {
        Call_Draw_Name(bank13, 7, 15, actor->name, false);

        switch(item_type)
        {
            case none:
                break;
            case health_recovery:
                Draw_Item_Number(actor->health, 11, 15);
                set_win_tiles(15, 15, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 15);
                break;
            case mana_recovery:
                Draw_Item_Number(actor->mana, 11, 15);
                set_win_tiles(15, 15, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_mana, 15, 15);
                break;
            case status_death:
                Draw_Item_Number(actor->health, 11, 15);
                set_win_tiles(15, 15, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 15);
                break;
            default:
                break;
        }
    }
    else if(actor->party_slot == 3 && actor->active_member == true)
    {
        Call_Draw_Name(bank13, 7, 16, actor->name, false);

        switch(item_type)
        {
            case none:
                break;
            case health_recovery:
                Draw_Item_Number(actor->health, 11, 16);
                set_win_tiles(15, 16, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 16);
                break;
            case mana_recovery:
                Draw_Item_Number(actor->mana, 11, 16);
                set_win_tiles(15, 16, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_mana, 15, 16);
                break;
            case status_death:
                Draw_Item_Number(actor->health, 11, 16);
                set_win_tiles(15, 16, 1, 1, Item_Slash);
                Draw_Item_Number(actor->max_health, 15, 16);
                break;
            default:
                break;
        }
    }
}

void Draw_Party_Window(GameItem* item)
{
    set_win_tiles(5, 12, 15, 6, Map_Menu_PartyPLN0);
    Draw_Actor_Window(Get_Actor(party[0]), item->item_type);
    Draw_Actor_Window(Get_Actor(party[1]), item->item_type);
    Draw_Actor_Window(Get_Actor(party[2]), item->item_type);
    Draw_Actor_Window(Get_Actor(party[3]), item->item_type);
}

void Draw_Item_Description(GameItem* item)
{
    set_win_tiles(1, 13, 18, 2, item->description);
}

void Reset_Pointer()
{
    switch(CurrentItemSlot)
    {
        case 0:
            set_win_tiles(1, 4, 1, 1, Item_Pointer);
            break;
        case 1:
            set_win_tiles(10, 4, 1, 1, Item_Pointer);
            break;
        case 2:
            set_win_tiles(1, 6, 1, 1, Item_Pointer);
            break;
        case 3:
            set_win_tiles(10, 6, 1, 1, Item_Pointer);
            break;
        case 4:
            set_win_tiles(1, 8, 1, 1, Item_Pointer);
            break;
        case 5:
            set_win_tiles(10, 8, 1, 1, Item_Pointer);
            break;
        case 6:
            set_win_tiles(1, 10, 1, 1, Item_Pointer);
            break;
        case 7:
            set_win_tiles(10, 10, 1, 1, Item_Pointer);
            break;
        case 8:
            set_win_tiles(1, 12, 1, 1, Item_Pointer);
            break;
        case 9:
            set_win_tiles(10, 12, 1, 1, Item_Pointer);
            break;
        default:
            set_win_tiles(1, 4, 1, 1, Item_Pointer);
            break;
    }
}

void Refresh_Cursors()
{
    if(CurrentItemSelection > 0)
    {
        set_win_tiles(19, 4, 1, 1, Item_Cursor_Up);
    }
    else
    {
        set_win_tiles(19, 4, 1, 1, Item_Border);
    }

    if(CurrentItemSelection < 40)
    {
        set_win_tiles(19, 10, 1, 1, Item_Cursor_Down);
    }
    else
    {
        set_win_tiles(19, 10, 1, 1, Item_Border);
    }
}

void Refresh_Item_Menu()
{
    Draw_Item(Get_Item(inventory[CurrentItemSelection]), CurrentItemSelection, 2, 4);
    Draw_Item(Get_Item(inventory[1 + CurrentItemSelection]), 1 + CurrentItemSelection, 2, 6);
    Draw_Item(Get_Item(inventory[2 + CurrentItemSelection]), 2 + CurrentItemSelection, 2, 8);
    Draw_Item(Get_Item(inventory[3 + CurrentItemSelection]), 3 + CurrentItemSelection, 2, 10);

    Refresh_Cursors();
}

void Hide_Item_Name()
{
    inventory[slot_1] = 0;
    inv_amount[slot_1] = 0;

    Refresh_Item_Menu();
}

void Use_Item_Win(GameActor* actor, GameItem* item)
{
    if(Use_Item(actor, item) == failed)
    {
        Call_Play_Use(bank13);

        set_win_map(5, 8, 15, 6, Map_Menu_ResetPLN1, Map_Menu_ResetPLN0);

        Restructure_Inventory();

        Refresh_Item_Menu();

        Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
    }
    else
    {
        Call_Play_Buzz(bank13);
    }
}

void Blink_Item_Name()
{
    if(slot_1_filled == true)
    {
        if(blink_tick == 25)
        {
            inventory[slot_1] = item_1;
            inv_amount[slot_1] = amount_1;

            Refresh_Item_Menu();
        }
        else if(blink_tick == 50)
        {
            Hide_Item_Name();

            blink_tick = 0;
        }

        if(slot_1 == CurrentItemSlot + CurrentItemSelection)
        {
            Draw_Item_Description(Get_Item(item_1));
        }

        blink_tick += 1;
    }
    else
    {
        blink_tick = 0;
    }
    
}

void Draw_Item_Menu()
{
    fade_out();

    CurrentMenu = menu_item;
    selection_x = 0;
    selection_y = 0;

    set_win_map(0, 0, 20, 18, Map_Menu_ItemsPLN1, Map_Menu_ItemsPLN0);

    CurrentItemSlot = 0;
    CurrentItemSelection = 0;

    Refresh_Item_Menu();
    Refresh_Cursors();

    set_win_tiles(2, 1, 1, 1, Item_Pointer);

    slot_1_filled = false;
    slot_2_filled = false;
    slot_1 = 0;
    amount_1 = 0;
    slot_2 = 0;
    amount_2 = 0;

    fade_in();
}

void Menu_Item_Sort_Joypad()
{
    while(1)
    {
        performant_delay(1);

        Blink_Item_Name();

        Joy = joypad();

        if(Joy & J_A)
        {
            if(slot_1_filled == false && inventory[CurrentItemSlot + CurrentItemSelection] != 0)
            {
                Call_Play_Confirm(bank13);

                slot_1 = CurrentItemSlot + CurrentItemSelection;
                item_1 = inventory[slot_1];
                amount_1 = inv_amount[slot_1];

                slot_1_filled = true;

                slot_selected = CurrentItemSlot;

                Hide_Item_Name();
            }
            else if(slot_2_filled == false && inventory[CurrentItemSlot + CurrentItemSelection] != 0 && CurrentItemSlot + CurrentItemSelection != slot_1)
            {
                Call_Play_Confirm(bank13);

                slot_2 = CurrentItemSlot + CurrentItemSelection;
                item_2 = inventory[slot_2];
                amount_2 = inv_amount[slot_2];

                slot_2_filled = true;
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            if(slot_1_filled == true && slot_2_filled == true)
            {
                inventory[slot_2] = item_1;
                inv_amount[slot_2] = amount_1;

                inventory[slot_1] = item_2;
                inv_amount[slot_1] = amount_2;

                Refresh_Item_Menu();

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));

                slot_1_filled = false;
                slot_2_filled = false;
            }

            while(joypad() & J_A || joypad() & J_START)
            {
                performant_delay(1);

                Blink_Item_Name();
            }
        }

        if(Joy & J_B)
        {
            Call_Play_Confirm(bank13);

            CurrentItemSlot = 0;

            set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);

            set_win_tiles(1, 15, 18, 2, Null_Item_Description);

            selection_x = 1;
            selection_y = 0;

            if(slot_1_filled == true)
            {
                inventory[slot_1] = item_1;
                inv_amount[slot_1] = amount_1;

                Refresh_Item_Menu();
            }

            slot_1 = 0;
            amount_1 = 0;
            slot_1_filled = false;

            slot_2 = 0;
            amount_2 = 0;
            slot_2_filled = false;

            Refresh_Item_Menu();

            while(joypad() & J_B)
            {
                performant_delay(1);
            }

            Menu_Item_Joypad();
        }

        if(Joy & J_UP)
        {
            if(selection_y > 0)
            {
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);

                selection_y -= 1;
                
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);

                CurrentItemSlot -= 1;

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else if(CurrentItemSelection > 0)
            {
                CurrentItemSelection -= 1;

                Refresh_Item_Menu();

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            Refresh_Cursors();

            while(joypad() & J_UP)
            {
                performant_delay(1);

                Blink_Item_Name();
            }
        }

        if(Joy & J_DOWN)
        {
            if(selection_y < 3)
            {
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);

                selection_y += 1;

                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);

                CurrentItemSlot += 1;

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else if (CurrentItemSelection < 40)
            {
                CurrentItemSelection += 1;

                Refresh_Item_Menu();

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            Refresh_Cursors();

            while(joypad() & J_DOWN)
            {
                performant_delay(1);

                Blink_Item_Name();
            }
        }
    }
}

void Menu_Item_Use_Win_Joypad()
{
    while(1)
    {
        performant_delay(1);

        Joy = joypad();

        if(Joy & J_A)
        {
            Use_Item_Win(Get_Actor(party[party_y]), Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));

            while(joypad() & J_A || joypad() & J_START)
            {
                performant_delay(1);
            }
        }

        if(Joy & J_B)
        {
            Call_Play_Confirm(bank13);

            set_win_map(5, 12, 15, 6, Map_Item_Use_ReplacePLN1, Map_Item_Use_ReplacePLN0);

            Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));

            Refresh_Item_Menu();

            Reset_Pointer();

            party_y = 0;

            while(joypad() & J_B)
            {
                performant_delay(1);
            }

            Menu_Item_Joypad();
        }

        if(Joy & J_UP)
        {
            if(party_y > 0)
            {
                set_win_tiles(6, 13 + party_y, 1, 1, Item_Background);
                party_y -= 1;
                set_win_tiles(6, 13 + party_y, 1, 1, Item_Pointer);
            }

            while(joypad() & J_UP)
            {
                performant_delay(1);
            }
        }

        if(Joy & J_DOWN)
        {
            if(party_y < party_max - 1)
            {
                set_win_tiles(6, 13 + party_y, 1, 1, Item_Background);
                party_y += 1;
                set_win_tiles(6, 13 + party_y, 1, 1, Item_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                performant_delay(1);
            }
        }
    }
}

void Menu_Item_Use_Joypad()
{
    while(1)
    {
        performant_delay(1);

        Joy = joypad();

        if(Joy & J_A)
        {
            slot_1 = CurrentItemSlot + CurrentItemSelection;

            if(inventory[slot_1] != 0)
            {
                Call_Play_Confirm(bank13);

                Draw_Party_Window(Get_Item(inventory[slot_1]));

                set_win_tiles(6, 13, 1, 1, Item_Pointer);

                party_y = 0;

                while(joypad() & J_A || joypad() & J_START)
                {
                    performant_delay(1);
                }

                Menu_Item_Use_Win_Joypad();
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            while(joypad() & J_A || joypad() & J_START)
            {
                performant_delay(1);
            }
        }

        if(Joy & J_B)
        {
            Call_Play_Confirm(bank13);

            CurrentItemSlot = 0;

            set_win_tiles(1 + 9 * selection_x, 4 + selection_y * 2, 1, 1, Item_Background);

            set_win_tiles(1, 15, 18, 2, Null_Item_Description);

            selection_x = 0;
            selection_y = 0;

            Refresh_Item_Menu();

            while(joypad() & J_B)
            {
                performant_delay(1);
            }

            Menu_Item_Joypad();
        }

        if(Joy & J_UP)
        {
            if(selection_y > 0)
            {
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);

                selection_y -= 1;
                
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);

                CurrentItemSlot -= 1;

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else if(CurrentItemSelection > 0)
            {
                CurrentItemSelection -= 1;

                Refresh_Item_Menu();

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            Refresh_Cursors();

            while(joypad() & J_UP)
            {
                performant_delay(1);
            }
        }

        if(Joy & J_DOWN)
        {
            if(selection_y < 3)
            {
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Background);

                selection_y += 1;
                
                set_win_tiles(9 * selection_x + 1, 4 + 2 * selection_y, 1, 1, Item_Pointer);

                CurrentItemSlot += 1;

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else if (CurrentItemSelection < 40)
            {
                CurrentItemSelection += 1;

                Refresh_Item_Menu();

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
            }
            else
            {
                Call_Play_Buzz(bank13);
            }

            Refresh_Cursors();
            
            while(joypad() & J_DOWN)
            {
                performant_delay(1);
            }
        }
    }
}

void Menu_Item_Joypad()
{
    while(1)
    {
        performant_delay(1);

        Joy = joypad();

        if(Joy & J_A)
        {
            if(selection_x == 0)
            {
                Call_Play_Confirm(bank13);

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));
                
                set_win_tiles(1, 4, 1, 1, Item_Pointer);

                selection_x = 0;
                selection_y = 0;

                while(joypad() & J_A || joypad() & J_START)
                {
                    performant_delay(1);
                }

                Menu_Item_Use_Joypad();
            }
            else if(selection_x == 1)
            {
                Call_Play_Confirm(bank13);

                Draw_Item_Description(Get_Item(inventory[CurrentItemSlot + CurrentItemSelection]));

                set_win_tiles(1, 4, 1, 1, Item_Pointer);

                selection_x = 0;
                selection_y = 0;

                while(joypad() & J_A || joypad() & J_START)
                {
                    performant_delay(1);
                }

                Menu_Item_Sort_Joypad();
            }
        }

        if(Joy & J_B)
        {
            Call_Play_Confirm(bank13);
            Call_Load_Menu_Main(bank13);
        }

        if(Joy & J_LEFT)
        {
            if(selection_x > 0)
            {
                selection_x -= 1;

                set_win_tiles(6, 1, 1, 1, Item_Background);
                set_win_tiles(2, 1, 1, 1, Item_Pointer);
            }
        }

        if(Joy & J_RIGHT)
        {
            if(selection_x < 1)
            {
                selection_x += 1;

                set_win_tiles(2, 1, 1, 1, Item_Background);
                set_win_tiles(6, 1, 1, 1, Item_Pointer);
            }
        }
    }
}

void Menu_Item()
{
    Draw_Item_Menu();

    while(joypad() & J_A || joypad() & J_START)
    {
        performant_delay(1);
    }

    Menu_Item_Joypad();
}

