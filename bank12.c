#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Item.h"
#include "Game_Equip.h"
#include "Game_Class.h"
#include "Maps/Map_Menu_Equip.c"
#include "Maps/Map_Menu_List.c"
#include "Maps/Map_Equip_Description.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentEquipSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2, equip_y, list_y, stat_change, held_equip, held_stat;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern INT8 i, j, k, l, m, n;

extern GameActor* party[4];

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char equipment_weapon[30];

extern unsigned char equipment_secondary[30];

extern unsigned char equipment_armor[30];

extern unsigned char equipment_accessory[30];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern void performant_delay(UBYTE num_loops);

extern void fade_out();
extern void fade_in();

extern void Menu();

extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);

extern GameActor* Get_Actor(UBYTE actor_id);
extern GameItem* Get_Item(UBYTE item_id);
extern GameEquip* Get_Equip(UBYTE equip_id);
extern GameClass* Get_Class(UBYTE class_id);

extern void Call_Menu_Main(UBYTE bank);
extern void Call_Load_Menu_Main(UBYTE bank);

extern void Call_Draw_Number(UBYTE bank, UINT16 number, UBYTE tile_x, UBYTE tile_y);
extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const unsigned char Equip_Pointer[1] = {0x0A};

const unsigned char Equip_Background[1] = {0x01};

const unsigned char Equip_Border[1] = {0x09};

const unsigned char Equip_Cursor_Up[1] = {0x0B};

const unsigned char Equip_Cursor_Down[1] = {0x0C};

const unsigned char Equip_Plus[1] = {0x5C};

const unsigned char Equip_Minus[1] = {0x57};

const unsigned char none_name[7] = {0x48, 0x24, 0x23, 0x1A, 0x01, 0x01, 0x01};

const unsigned char weapon_name[7] = {0x01, 0x01, 0x51, 0x1A, 0x16, 0x25, 0x55};

const unsigned char armor_name[7] = {0x01, 0x01, 0x3B, 0x27, 0x22, 0x24, 0x27};

const unsigned char weapon_title[8] = {0x01, 0x51, 0x1A, 0x16, 0x25, 0x24, 0x23, 0x01};

const unsigned char secondary_title[8] = {0x4D, 0x1A, 0x18, 0x24, 0x23, 0x19, 0x16, 0x55};

const unsigned char armor_title[8] = {0x01, 0x3B, 0x27, 0x22, 0x24, 0x27, 0x01, 0x01};

const unsigned char accessory_title[8] = {0x3B, 0x18, 0x18, 0x1A, 0x29, 0x29, 0x24, 0x55};

void Add_Equip(GameEquip* equip) //* Adds equip into equipment inventory.
{
    if(equip->equip_type == weapon)
    {
        for(i = 0; i < 30; i++)
        {
            if(equipment_weapon[i] == 0)
            {
                equipment_weapon[i] = equip->equip_id;
                return;
            }
        }
    }
    else if(equip->equip_type == secondary)
    {
        for(i = 0; i < 30; i++)
        {
            if(equipment_secondary[i] == 0)
            {
                equipment_secondary[i] = equip->equip_id;
                return;
            }
        }
    }
    else if(equip->equip_type == armor)
    {
        for(i = 0; i < 30; i++)
        {
            if(equipment_armor[i] == 0)
            {
                equipment_armor[i] = equip->equip_id;
                return;
            }
        }
    }
    else if(equip->equip_type == accessory)
    {
        for(i = 0; i < 30; i++)
        {
            if(equipment_accessory[i] == 0)
            {
                equipment_accessory[i] = equip->equip_id;
                return;
            }
        }
    }
}

void Draw_Equip(UBYTE slot, unsigned char* name) //* Draws name of equip in specified slot.
{
    switch(slot)
    {
        case 0:
            set_win_tiles(2, 14, 7, 1, name);
            break;
        case 1:
            set_win_tiles(11, 14, 7, 1, name);
            break;
        case 2:
            set_win_tiles(2, 16, 7, 1, name);
            break;
        case 3:
            set_win_tiles(11, 16, 7, 1, name);
            break;
    }
}

void Draw_Equip_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y) //* Draws name of class.
{
    set_win_tiles(tile_x, tile_y, 3, 1, icon);
    set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
}

void Draw_Weapon_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_weapon" in specified equip slot.
{
    Draw_Equip(equip_slot, Get_Equip(equipment_weapon[equipment_slot])->name);
}

void Draw_Secondary_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_secondary" in specified equip slot.
{
    Draw_Equip(equip_slot, Get_Equip(equipment_secondary[equipment_slot])->name);
}

void Draw_Armor_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_armor" in specified equip slot.
{
    Draw_Equip(equip_slot, Get_Equip(equipment_armor[equipment_slot])->name);
}

void Draw_Accessory_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_accesory" in specified equip slot.
{
    Draw_Equip(equip_slot, Get_Equip(equipment_accessory[equipment_slot])->name);
}

void Refresh_Actor_Stats(GameActor* actor) //* Draws actor's stats.
{
    if(actor->level > 9){Call_Draw_Number(bank12, actor->level, 10, 1);}
    else{Call_Draw_Number(bank12, actor->level, 9, 1);}

    Draw_Equip_Class(Get_Class(actor->class)->name, Get_Class(actor->class)->icon, 14, 1);

    Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength, 5, 4);
    Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom, 5, 6);
    Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will, 5, 8);
    Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def, 5, 10);
    Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def, 5, 12);
}

void Draw_Actor_Equip(UBYTE party_slot) //* Draws actor's name and stats.
{
    set_win_map(0, 0, 20, 18, Map_Menu_EquipPLN1, Map_Menu_EquipPLN0);

    if(party_slot == 0)
    {
        Call_Draw_Name(bank12, 2, 1, party[0]->name, true);

        Refresh_Actor_Stats(party[0]);
    }
    else if(party_slot == 1)
    {
        Call_Draw_Name(bank12, 2, 1, party[1]->name, true);

        Refresh_Actor_Stats(party[1]);
    }
    else if(party_slot == 2)
    {
        Call_Draw_Name(bank12, 2, 1, party[2]->name, true);

        Refresh_Actor_Stats(party[2]);
    }
    else if(party_slot == 3)
    {
        Call_Draw_Name(bank12, 2, 1, party[3]->name, true);

        Refresh_Actor_Stats(party[3]);
    }
}

void Draw_Equip_Description(GameEquip* equip) //* Draws description of specified equip.
{
    set_win_tiles(1, 15, 18, 2, equip->description);
}

void Draw_Equip_Description_Large(GameEquip* equip)
{
    set_win_tiles(1, 14, 18, 2, equip->description);
}

void Draw_Equipped(GameActor* actor) //* Draws actor's equipped equip.
{
    set_win_tiles(12, 4, 7, 1, Get_Equip(actor->equipped[weapon_slot])->name);
    set_win_tiles(11, 4, 1, 1, Get_Equip(actor->equipped[weapon_slot])->icon);
    if(actor->equipped[weapon_slot] == 0){set_win_tiles(12, 4, 7, 1, none_name);}

    set_win_tiles(12, 6, 7, 1, Get_Equip(actor->equipped[secondary_slot])->name);
    set_win_tiles(11, 6, 1, 1, Get_Equip(actor->equipped[secondary_slot])->icon);
    if(actor->equipped[secondary_slot] == 0){set_win_tiles(12, 6, 7, 1, none_name);}

    set_win_tiles(12, 8, 7, 1, Get_Equip(actor->equipped[armor_slot])->name);
    set_win_tiles(11, 8, 1, 1, Get_Equip(actor->equipped[armor_slot])->icon);
    if(actor->equipped[armor_slot] == 0){set_win_tiles(12, 8, 7, 1, none_name);}
    
    set_win_tiles(12, 10, 7, 1, Get_Equip(actor->equipped[accessory_slot])->name);
    set_win_tiles(11, 10, 1, 1, Get_Equip(actor->equipped[accessory_slot])->icon);
    if(actor->equipped[accessory_slot] == 0){set_win_tiles(12, 10, 7, 1, none_name);}
}

void Draw_Equip_Slots() //* Draws slot for equipment list.
{
    switch(equip_y)
    {
        case weapon_slot:
            set_win_tiles(6, 13, 8, 1, weapon_title);
            Draw_Weapon_Slot(0, 0);
            Draw_Weapon_Slot(1, 1);
            Draw_Weapon_Slot(2, 2);
            Draw_Weapon_Slot(3, 3);
            break;
        case secondary_slot:
            set_win_tiles(6, 13, 8, 1, secondary_title);
            Draw_Secondary_Slot(0, 0);
            Draw_Secondary_Slot(1, 1);
            Draw_Secondary_Slot(2, 2);
            Draw_Secondary_Slot(3, 3);
            break;
        case armor_slot:
            set_win_tiles(6, 13, 8, 1, armor_title);
            Draw_Armor_Slot(0, 0);
            Draw_Armor_Slot(1, 1);
            Draw_Armor_Slot(2, 2);
            Draw_Armor_Slot(3, 3);
            break;
        case accessory_slot:
            set_win_tiles(6, 13, 8, 1, accessory_title);
            Draw_Accessory_Slot(0, 0);
            Draw_Accessory_Slot(1, 1);
            Draw_Accessory_Slot(2, 2);
            Draw_Accessory_Slot(3, 3);
            break;
        default:
            Draw_Weapon_Slot(0, 0);
            Draw_Weapon_Slot(1, 1);
            Draw_Weapon_Slot(2, 2);
            Draw_Weapon_Slot(3, 3);
            break;
    }
}

void Draw_Equip_Menu() //* Draws equip menu for "actor_y".
{
    fade_out();

    CurrentMenu = menu_equip;
    selection_max = 4;

    equip_y = 0;

    Draw_Actor_Equip(actor_y);

    Draw_Equipped(party[actor_y]);

    set_win_tiles(10, 4, 1, 1, Equip_Pointer);

    Draw_Equip_Description(Get_Equip(party[actor_y]->equipped[0]));

    fade_in();
}

void Draw_List_Slot(GameEquip* equip, UBYTE slot) //* Draws slots of equipment list.
{
    switch(slot)
    {
        case 0:
            set_win_tiles(12, 6, 7, 1, equip->name);
            set_win_tiles(11, 6, 1, 1, equip->icon);
            break;
        case 1:
            set_win_tiles(12, 8, 7, 1, equip->name);
            set_win_tiles(11, 8, 1, 1, equip->icon);
            break;
        case 2:
            set_win_tiles(12, 10, 7, 1, equip->name);
            set_win_tiles(11, 10, 1, 1, equip->icon);
            break;
        case 3:
            set_win_tiles(12, 12, 7, 1, equip->name);
            set_win_tiles(11, 12, 1, 1, equip->icon);
            break;
        default:
            break;
    }
}

void Refresh_Equip_Cursors() //* Draws list cursors. 
{
    if(CurrentEquipSelection > 0)
    {
        set_win_tiles(19, 4, 1, 1, Equip_Cursor_Up);
    }
    else
    {
        set_win_tiles(19, 4, 1, 1, Equip_Border);
    }

    if(CurrentEquipSelection < 26)
    {
        set_win_tiles(19, 12, 1, 1, Equip_Cursor_Down);
    }
    else
    {
        set_win_tiles(19, 12, 1, 1, Equip_Border);
    }
}

void Draw_Equip_List(UBYTE equip_type) //* Draws specified equipment list.
{
    set_win_tiles(10, 3, 10, 11, Map_Menu_ListPLN0);

    switch(equip_type)
    {
        case 0:
            set_win_tiles(10, 4, 8, 1, weapon_title);

            Draw_List_Slot(Get_Equip(equipment_weapon[0]), 0);
            Draw_List_Slot(Get_Equip(equipment_weapon[1]), 1);
            Draw_List_Slot(Get_Equip(equipment_weapon[2]), 2);
            Draw_List_Slot(Get_Equip(equipment_weapon[3]), 3);
            break;
        case 1:
            set_win_tiles(11, 4, 8, 1, secondary_title);

            Draw_List_Slot(Get_Equip(equipment_secondary[0]), 0);
            Draw_List_Slot(Get_Equip(equipment_secondary[1]), 1);
            Draw_List_Slot(Get_Equip(equipment_secondary[2]), 2);
            Draw_List_Slot(Get_Equip(equipment_secondary[3]), 3);
            break;
        case 2:
            set_win_tiles(10, 4, 8, 1, armor_title);

            Draw_List_Slot(Get_Equip(equipment_armor[0]), 0);
            Draw_List_Slot(Get_Equip(equipment_armor[1]), 1);
            Draw_List_Slot(Get_Equip(equipment_armor[2]), 2);
            Draw_List_Slot(Get_Equip(equipment_armor[3]), 3);
            break;
        case 3:
            set_win_tiles(11, 4, 8, 1, accessory_title);

            Draw_List_Slot(Get_Equip(equipment_accessory[0]), 0);
            Draw_List_Slot(Get_Equip(equipment_accessory[1]), 1);
            Draw_List_Slot(Get_Equip(equipment_accessory[2]), 2);
            Draw_List_Slot(Get_Equip(equipment_accessory[3]), 3);
            break;
        default:
            break;
    }

    set_win_tiles(10, 6, 1, 1, Equip_Pointer);

    Refresh_Equip_Cursors();
}

void Draw_Equip_Pointer() //* Draws pointer for selected actor's equipped.
{
    switch(equip_y)
    {
        case 0:
            set_win_tiles(10, 4, 1, 1, Equip_Pointer);
            break;
        case 1:
            set_win_tiles(10, 6, 1, 1, Equip_Pointer);
            break;
        case 2:
            set_win_tiles(10, 8, 1, 1, Equip_Pointer);
            break;
        case 3:
            set_win_tiles(10, 10, 1, 1, Equip_Pointer);
            break;
        default:
            break;
    }
}

void Refresh_Equip_List() //* Draws equipment list using "CurrentEquipSelection".
{
    switch(equip_y)
    {
        case 0:
            Draw_List_Slot(Get_Equip(equipment_weapon[0 + CurrentEquipSelection]), 0);
            Draw_List_Slot(Get_Equip(equipment_weapon[1 + CurrentEquipSelection]), 1);
            Draw_List_Slot(Get_Equip(equipment_weapon[2 + CurrentEquipSelection]), 2);
            Draw_List_Slot(Get_Equip(equipment_weapon[3 + CurrentEquipSelection]), 3);
            break;
        case 1:
            Draw_List_Slot(Get_Equip(equipment_secondary[0 + CurrentEquipSelection]), 0);
            Draw_List_Slot(Get_Equip(equipment_secondary[1 + CurrentEquipSelection]), 1);
            Draw_List_Slot(Get_Equip(equipment_secondary[2 + CurrentEquipSelection]), 2);
            Draw_List_Slot(Get_Equip(equipment_secondary[3 + CurrentEquipSelection]), 3);
            break;
        case 2:
            Draw_List_Slot(Get_Equip(equipment_armor[0 + CurrentEquipSelection]), 0);
            Draw_List_Slot(Get_Equip(equipment_armor[1 + CurrentEquipSelection]), 1);
            Draw_List_Slot(Get_Equip(equipment_armor[2 + CurrentEquipSelection]), 2);
            Draw_List_Slot(Get_Equip(equipment_armor[3 + CurrentEquipSelection]), 3);
            break;
        case 3:
            Draw_List_Slot(Get_Equip(equipment_accessory[0 + CurrentEquipSelection]), 0);
            Draw_List_Slot(Get_Equip(equipment_accessory[1 + CurrentEquipSelection]), 1);
            Draw_List_Slot(Get_Equip(equipment_accessory[2 + CurrentEquipSelection]), 2);
            Draw_List_Slot(Get_Equip(equipment_accessory[3 + CurrentEquipSelection]), 3);
            break;
        default:
            break;
    }
}

void Draw_Equip_Stats(GameActor* actor, GameEquip* equip, UBYTE equipment_slot) //* Draws stat differences between currently equipped equip and selected equip.
{
    switch(equipment_slot)
    {
        case weapon_slot:
            Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
            Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
            Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
            Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
            Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
            break;
        case secondary_slot:
            Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[2])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
            Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[2])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
            Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[2])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
            Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[2])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
            Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[2])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
            break;
        case armor_slot:
            Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[3])->strength + equip->strength, 5, 4);
            Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[3])->wisdom + equip->wisdom, 5, 6);
            Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[3])->will + equip->will, 5, 8);
            Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[3])->phys_def + equip->phys_def, 5, 10);
            Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[3])->magic_def + equip->magic_def, 5, 12);
            break;
        case accessory_slot:
            Call_Draw_Number(bank12, actor->strength + Get_Equip(actor->equipped[0])->strength + Get_Equip(actor->equipped[1])->strength + Get_Equip(actor->equipped[2])->strength + equip->strength, 5, 4);
            Call_Draw_Number(bank12, actor->wisdom + Get_Equip(actor->equipped[0])->wisdom + Get_Equip(actor->equipped[1])->wisdom + Get_Equip(actor->equipped[2])->wisdom + equip->wisdom, 5, 6);
            Call_Draw_Number(bank12, actor->will + Get_Equip(actor->equipped[0])->will + Get_Equip(actor->equipped[1])->will + Get_Equip(actor->equipped[2])->will + equip->will, 5, 8);
            Call_Draw_Number(bank12, actor->phys_def + Get_Equip(actor->equipped[0])->phys_def + Get_Equip(actor->equipped[1])->phys_def + Get_Equip(actor->equipped[2])->phys_def + equip->phys_def, 5, 10);
            Call_Draw_Number(bank12, actor->magic_def + Get_Equip(actor->equipped[0])->magic_def + Get_Equip(actor->equipped[1])->magic_def + Get_Equip(actor->equipped[2])->magic_def + equip->magic_def, 5, 12);
            break;
        default:
            break;
    }
}

void Compare_Stats(GameEquip* equip_1, GameEquip* equip_2) //* Compares stat differences between currently equipped equip and selected equip.
{
    if(equip_1->strength > equip_2->strength)
    {
        set_win_tiles(6, 4, 1, 1, Equip_Plus);
    }
    else if(equip_1->strength < equip_2->strength)
    {
        set_win_tiles(6, 4, 1, 1, Equip_Minus);
    }
    else
    {
        set_win_tiles(6, 4, 1, 1, Equip_Background);
    }

    if(equip_1->wisdom > equip_2->wisdom)
    {
        set_win_tiles(6, 6, 1, 1, Equip_Plus);
    }
    else if(equip_1->wisdom < equip_2->wisdom)
    {
        set_win_tiles(6, 6, 1, 1, Equip_Minus);
    }
    else
    {
        set_win_tiles(6, 6, 1, 1, Equip_Background);
    }

    if(equip_1->will > equip_2->will)
    {
        set_win_tiles(6, 8, 1, 1, Equip_Plus);
    }
    else if(equip_1->will < equip_2->will)
    {
        set_win_tiles(6, 8, 1, 1, Equip_Minus);
    }
    else
    {
        set_win_tiles(6, 8, 1, 1, Equip_Background);
    }

    if(equip_1->phys_def > equip_2->phys_def)
    {
        set_win_tiles(6, 10, 1, 1, Equip_Plus);
    }
    else if(equip_1->phys_def < equip_2->phys_def)
    {
        set_win_tiles(6, 10, 1, 1, Equip_Minus);
    }
    else
    {
        set_win_tiles(6, 10, 1, 1, Equip_Background);
    }

    if(equip_1->magic_def > equip_2->magic_def)
    {
        set_win_tiles(6, 12, 1, 1, Equip_Plus);
    }
    else if(equip_1->magic_def < equip_2->magic_def)
    {
        set_win_tiles(6, 12, 1, 1, Equip_Minus);
    }
    else
    {
        set_win_tiles(6, 12, 1, 1, Equip_Background);
    }
}

void Refresh_Stat_Changes() //* Refreshes actor stats to display stat changes and compares the change.
{
    switch(equip_y)
    {
        case weapon_slot:
            Draw_Equip_Stats(party[actor_y], Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]), weapon_slot);

            Compare_Stats(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]), Get_Equip(party[actor_y]->equipped[weapon_slot]));
            break;
        case secondary_slot:
            Draw_Equip_Stats(party[actor_y], Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]), secondary_slot);

            Compare_Stats(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]), Get_Equip(party[actor_y]->equipped[secondary_slot]));
            break;
        case armor_slot:
            Draw_Equip_Stats(party[actor_y], Get_Equip(equipment_armor[list_y + CurrentEquipSelection]), armor_slot);

            Compare_Stats(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]), Get_Equip(party[actor_y]->equipped[armor_slot]));
            break;
        case accessory_slot:
            Draw_Equip_Stats(party[actor_y], Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]), accessory_slot);

            Compare_Stats(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]), Get_Equip(party[actor_y]->equipped[accessory_slot]));
            break;
        default:
            break;
    }
}

void Refresh_Equip_Menu() //* Redraws actor's equipped equip and pointer.
{
    set_win_tiles(10, 3, 10, 11, Map_Menu_ListPLN0);

    Draw_Equipped(party[actor_y]);

    Draw_Equip_Pointer();
}

void Equip_Equipment(GameActor* actor, GameEquip* equip) //* Equips specified actor with specified equip.
{
    switch(equip->equip_type)
    {
        case weapon:
            Add_Equip(Get_Equip(actor->equipped[weapon_slot]));

            actor->equipped[weapon_slot] = equip->equip_id;
            actor->class = equip->class_type;
            break;
        case secondary:
            Add_Equip(Get_Equip(actor->equipped[secondary_slot]));

            actor->equipped[secondary_slot] = equip->equip_id;
            break;
        case armor:
            Add_Equip(Get_Equip(actor->equipped[armor_slot]));

            actor->equipped[armor_slot] = equip->equip_id;
            break;
        case accessory:
            Add_Equip(Get_Equip(actor->equipped[accessory_slot]));

            actor->equipped[accessory_slot] = equip->equip_id;
            break;
        default:
            break;
    }
}

void Equip_Actor(GameActor* actor) //* Equips specified actor with equip selected with "list_y + CurrentEquipSelection".
{
    switch(equip_y)
    {
        case weapon_slot:
            held_equip = actor->equipped[weapon_slot];

            actor->equipped[weapon_slot] = Get_Equip(equipment_weapon[list_y + CurrentEquipSelection])->equip_id;

            actor->class = Get_Equip(equipment_weapon[list_y + CurrentEquipSelection])->class_type;

            equipment_weapon[list_y + CurrentEquipSelection] = held_equip;
            break;
        case secondary_slot:
            held_equip = actor->equipped[secondary_slot];

            actor->equipped[secondary_slot] = Get_Equip(equipment_secondary[list_y + CurrentEquipSelection])->equip_id;

            equipment_secondary[list_y + CurrentEquipSelection] = held_equip;
            break;
        case armor_slot:
            held_equip = actor->equipped[armor_slot];

            actor->equipped[armor_slot] = Get_Equip(equipment_armor[list_y + CurrentEquipSelection])->equip_id;

            equipment_armor[list_y + CurrentEquipSelection] = held_equip;
            break;
        case accessory_slot:
            held_equip = actor->equipped[accessory_slot];

            actor->equipped[accessory_slot] = Get_Equip(equipment_accessory[list_y + CurrentEquipSelection])->equip_id;
            
            equipment_accessory[list_y + CurrentEquipSelection] = held_equip;
            break;
        default:
            break;
    }

    Refresh_Actor_Stats(actor);
}

void Menu_Equip_Joypad() //* Joypad handler for equip menu.
{
    Joy = joypad();

    if(Joy & J_UP)
    {
        if(CurrentMenu == menu_equip)
        {
            if(equip_y > 0)
            {
                set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Background);

                equip_y -= 1;

                set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Pointer);
            }

            Draw_Equip_Description(Get_Equip(party[actor_y]->equipped[equip_y]));

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentMenu == menu_equip_list)
        {
            if(list_y > 0)
            {
                set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Background);

                list_y -= 1;

                set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Pointer);
            }
            else if(CurrentEquipSelection > 0)
            {
                CurrentEquipSelection -= 1;

                Refresh_Equip_List();
            }
            else
            {
                Call_Play_Buzz(bank12);
            }

            switch(equip_y)
            {
                case weapon_slot:
                    Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
                    break;
                case secondary_slot:
                    Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
                    break;
                case armor_slot:
                    Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
                    break;
                case accessory_slot:
                    Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
                    break;
                default:
                    break;
            }

            Refresh_Stat_Changes();

            Refresh_Equip_Cursors();

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
        else
        {
            if(actor_y > 0)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Background);

                actor_y -= 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Pointer);
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
    }

    if(Joy & J_DOWN)
    {
        if(CurrentMenu == menu_equip)
        {
            if(equip_y < selection_max - 1)
            {
                set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Background);

                equip_y += 1;

                set_win_tiles(10, 4 + 2 * equip_y, 1, 1, Equip_Pointer);
            }

            Draw_Equip_Description(Get_Equip(party[actor_y]->equipped[equip_y]));

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentMenu == menu_equip_list)
        {
            if(list_y < 3)
            {
                set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Background);

                list_y += 1;

                set_win_tiles(10, 6 + 2 * list_y, 1, 1, Equip_Pointer);
            }
            else if(CurrentEquipSelection < 26)
            {
                CurrentEquipSelection += 1;

                Refresh_Equip_List();
            }
            else
            {
                Call_Play_Buzz(bank12);
            }

            switch(equip_y)
            {
                case weapon_slot:
                    Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
                    break;
                case secondary_slot:
                    Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
                    break;
                case armor_slot:
                    Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
                    break;
                case accessory_slot:
                    Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
                    break;
                default:
                    break;
            }

            Refresh_Stat_Changes();

            Refresh_Equip_Cursors();

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
        else
        {
            if(actor_y < actor_max - 1)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Background);

                actor_y += 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Equip_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
    }

    if(Joy & J_A)
    {
        if(CurrentMenu == menu_equip)
        {
            Call_Play_Confirm(bank12);
            Draw_Equip_List(equip_y);

            switch(equip_y)
            {
                case weapon_slot:
                    Draw_Equip_Description(Get_Equip(equipment_weapon[list_y + CurrentEquipSelection]));
                    break;
                case secondary_slot:
                    Draw_Equip_Description(Get_Equip(equipment_secondary[list_y + CurrentEquipSelection]));
                    break;
                case armor_slot:
                    Draw_Equip_Description(Get_Equip(equipment_armor[list_y + CurrentEquipSelection]));
                    break;
                case accessory_slot:
                    Draw_Equip_Description(Get_Equip(equipment_accessory[list_y + CurrentEquipSelection]));
                    break;
                default:
                    break;
            }

            list_y = 0;
            CurrentMenu = menu_equip_list;

            Refresh_Stat_Changes();
            
            while(joypad() & J_A || joypad() & J_START)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentMenu == menu_equip_list)
        {
            Call_Play_Confirm(bank12);
            Equip_Actor(party[actor_y]);

            CurrentEquipSelection = 0;
            list_y = 0;
            CurrentMenu = menu_equip;

            Refresh_Equip_Menu();
            Draw_Equip_Description(Get_Equip(party[actor_y]->equipped[equip_y]));

            Refresh_Actor_Stats(party[actor_y]);

            set_win_tiles(6, 4, 1, 1, Equip_Background);
            set_win_tiles(6, 6, 1, 1, Equip_Background);
            set_win_tiles(6, 8, 1, 1, Equip_Background);
            set_win_tiles(6, 10, 1, 1, Equip_Background);
            set_win_tiles(6, 12, 1, 1, Equip_Background);

            while(joypad() & J_A || joypad() & J_START)
            {
                wait_vbl_done();
            }
        }
        else
        {
            Call_Play_Confirm(bank12);

            Draw_Equip_Menu();

            CurrentMenu == menu_equip;

            while(joypad() & J_A)
            {
                wait_vbl_done();
            }
        }
    }

    if(Joy & J_B)
    {
        if(CurrentMenu == menu_equip)
        {
            Call_Play_Confirm(bank12);
            Call_Load_Menu_Main(bank12);
        }
        else if(CurrentMenu == menu_equip_list)
        {
            Call_Play_Confirm(bank12);

            Refresh_Equip_Menu();
            Draw_Equip_Description(Get_Equip(party[actor_y]->equipped[equip_y]));

            Refresh_Actor_Stats(party[actor_y]);

            set_win_tiles(6, 4, 1, 1, Equip_Background);
            set_win_tiles(6, 6, 1, 1, Equip_Background);
            set_win_tiles(6, 8, 1, 1, Equip_Background);
            set_win_tiles(6, 10, 1, 1, Equip_Background);
            set_win_tiles(6, 12, 1, 1, Equip_Background);

            CurrentEquipSelection = 0;
            list_y = 0;
            CurrentMenu = menu_equip;

            while(joypad() & J_B)
            {
                wait_vbl_done();
            }
        }
        else
        {
            Call_Play_Confirm(bank12);

            set_win_tiles(9, 2, 1, 1, Equip_Background);
            set_win_tiles(9, 5, 1, 1, Equip_Background);
            set_win_tiles(9, 8, 1, 1, Equip_Background);
            set_win_tiles(9, 10, 1, 1, Equip_Background);

            Call_Menu_Main(bank12);
        }
    }
}

void Menu_Equip() //* Equip menu.
{
    while(true)
    {
        wait_vbl_done();

        Menu_Equip_Joypad();
    }
}

void Load_Menu_Equip() //* Loads equip menu.
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

    set_win_tiles(9, 2, 1, 1, Equip_Pointer);

    actor_y = 0;

    while(joypad() & J_A || joypad() & J_START)
    {
        performant_delay(1);
    }

    Menu_Equip();
}