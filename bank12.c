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

extern const GameEquip* temp_equip;

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern const GameEquip* equipment_weapon[30];

extern const GameEquip* equipment_secondary[30];

extern const GameEquip* equipment_armor[30];

extern const GameEquip* equipment_accessory[30];

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

void Add_Equip(const GameEquip* equip) //* Adds equip into equipment inventory.
{
    if(equip != &equip_null)
    {
        if(equip->equip_type == weapon)
        {
            for(i = 0; i < 30; i++)
            {
                if(equipment_weapon[i] == &equip_null)
                {
                    equipment_weapon[i] = equip;
                    return;
                }
            }
        }
        else if(equip->equip_type == secondary)
        {
            for(i = 0; i < 30; i++)
            {
                if(equipment_secondary[i] == &equip_null)
                {
                    equipment_secondary[i] = equip;
                    return;
                }
            }
        }
        else if(equip->equip_type == armor)
        {
            for(i = 0; i < 30; i++)
            {
                if(equipment_armor[i] == &equip_null)
                {
                    equipment_armor[i] = equip;
                    return;
                }
            }
        }
        else if(equip->equip_type == accessory)
        {
            for(i = 0; i < 30; i++)
            {
                if(equipment_accessory[i] == &equip_null)
                {
                    equipment_accessory[i] = equip;
                    return;
                }
            }
        }
    }
}

void Unequip_Equipment(GameActor* actor, UBYTE equipment_slot)
{
    switch(equipment_slot)
    {
        case weapon_slot:
            Add_Equip(actor->equipment[weapon_slot]);

            actor->strength -= actor->equipment[weapon_slot]->strength;
            actor->wisdom -= actor->equipment[weapon_slot]->wisdom;
            actor->will -= actor->equipment[weapon_slot]->will;
            actor->agility -= actor->equipment[weapon_slot]->agility;
            actor->phys_def -= actor->equipment[weapon_slot]->phys_def;
            actor->magic_def -= actor->equipment[weapon_slot]->magic_def;

            actor->equipment[weapon_slot] = &equip_null;
            actor->class = traveler;
            break;
        case secondary_slot:
            Add_Equip(actor->equipment[secondary_slot]);

            actor->strength -= actor->equipment[secondary_slot]->strength;
            actor->wisdom -= actor->equipment[secondary_slot]->wisdom;
            actor->will -= actor->equipment[secondary_slot]->will;
            actor->agility -= actor->equipment[secondary_slot]->agility;
            actor->phys_def -= actor->equipment[secondary_slot]->phys_def;
            actor->magic_def -= actor->equipment[secondary_slot]->magic_def;

            actor->equipment[secondary_slot] = &equip_null;
            break;
        case armor_slot:
            Add_Equip(actor->equipment[armor_slot]);

            actor->strength -= actor->equipment[armor_slot]->strength;
            actor->wisdom -= actor->equipment[armor_slot]->wisdom;
            actor->will -= actor->equipment[armor_slot]->will;
            actor->agility -= actor->equipment[armor_slot]->agility;
            actor->phys_def -= actor->equipment[armor_slot]->phys_def;
            actor->magic_def -= actor->equipment[armor_slot]->magic_def;

            actor->equipment[armor_slot] = &equip_null;
            break;
        case accessory_slot:
            Add_Equip(actor->equipment[accessory_slot]);

            actor->strength -= actor->equipment[accessory_slot]->strength;
            actor->wisdom -= actor->equipment[accessory_slot]->wisdom;
            actor->will -= actor->equipment[accessory_slot]->will;
            actor->agility -= actor->equipment[accessory_slot]->agility;
            actor->phys_def -= actor->equipment[accessory_slot]->phys_def;
            actor->magic_def -= actor->equipment[accessory_slot]->magic_def;

            actor->equipment[accessory_slot] = &equip_null;
            break;
        default:
            break;
    }
}

void Equip_Equipment(GameActor* actor, const GameEquip* equip) //* Equips specified actor with specified equip
{
    switch(equip->equip_type)
    {
        case weapon:
            actor->strength -= actor->equipment[weapon_slot]->strength;
            actor->wisdom -= actor->equipment[weapon_slot]->wisdom;
            actor->will -= actor->equipment[weapon_slot]->will;
            actor->agility -= actor->equipment[weapon_slot]->agility;
            actor->phys_def -= actor->equipment[weapon_slot]->phys_def;
            actor->magic_def -= actor->equipment[weapon_slot]->magic_def;

            actor->equipment[weapon_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;

            actor->class = equip->class_type;
            break;
        case secondary:
            actor->strength -= actor->equipment[secondary_slot]->strength;
            actor->wisdom -= actor->equipment[secondary_slot]->wisdom;
            actor->will -= actor->equipment[secondary_slot]->will;
            actor->agility -= actor->equipment[secondary_slot]->agility;
            actor->phys_def -= actor->equipment[secondary_slot]->phys_def;
            actor->magic_def -= actor->equipment[secondary_slot]->magic_def;

            actor->equipment[secondary_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        case armor:
            actor->strength -= actor->equipment[armor_slot]->strength;
            actor->wisdom -= actor->equipment[armor_slot]->wisdom;
            actor->will -= actor->equipment[armor_slot]->will;
            actor->agility -= actor->equipment[armor_slot]->agility;
            actor->phys_def -= actor->equipment[armor_slot]->phys_def;
            actor->magic_def -= actor->equipment[armor_slot]->magic_def;

            actor->equipment[armor_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        case accessory:
            actor->strength -= actor->equipment[accessory_slot]->strength;
            actor->wisdom -= actor->equipment[accessory_slot]->wisdom;
            actor->will -= actor->equipment[accessory_slot]->will;
            actor->agility -= actor->equipment[accessory_slot]->agility;
            actor->phys_def -= actor->equipment[accessory_slot]->phys_def;
            actor->magic_def -= actor->equipment[accessory_slot]->magic_def;

            actor->equipment[accessory_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        default:
            break;
    }
}

void Equip_Equipment_To_Slot(GameActor* actor, const GameEquip* equip, UBYTE equipment_slot) //* Equips specified actor with specified equip to specified slot.
{
    switch(equipment_slot)
    {
        case weapon_slot:
            actor->strength -= actor->equipment[weapon_slot]->strength;
            actor->wisdom -= actor->equipment[weapon_slot]->wisdom;
            actor->will -= actor->equipment[weapon_slot]->will;
            actor->agility -= actor->equipment[weapon_slot]->agility;
            actor->phys_def -= actor->equipment[weapon_slot]->phys_def;
            actor->magic_def -= actor->equipment[weapon_slot]->magic_def;

            actor->equipment[weapon_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;

            actor->class = equip->class_type;
            break;
        case secondary_slot:
            actor->strength -= actor->equipment[secondary_slot]->strength;
            actor->wisdom -= actor->equipment[secondary_slot]->wisdom;
            actor->will -= actor->equipment[secondary_slot]->will;
            actor->agility -= actor->equipment[secondary_slot]->agility;
            actor->phys_def -= actor->equipment[secondary_slot]->phys_def;
            actor->magic_def -= actor->equipment[secondary_slot]->magic_def;

            actor->equipment[secondary_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        case armor_slot:
            actor->strength -= actor->equipment[armor_slot]->strength;
            actor->wisdom -= actor->equipment[armor_slot]->wisdom;
            actor->will -= actor->equipment[armor_slot]->will;
            actor->agility -= actor->equipment[armor_slot]->agility;
            actor->phys_def -= actor->equipment[armor_slot]->phys_def;
            actor->magic_def -= actor->equipment[armor_slot]->magic_def;

            actor->equipment[armor_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        case accessory_slot:
            actor->strength -= actor->equipment[accessory_slot]->strength;
            actor->wisdom -= actor->equipment[accessory_slot]->wisdom;
            actor->will -= actor->equipment[accessory_slot]->will;
            actor->agility -= actor->equipment[accessory_slot]->agility;
            actor->phys_def -= actor->equipment[accessory_slot]->phys_def;
            actor->magic_def -= actor->equipment[accessory_slot]->magic_def;

            actor->equipment[accessory_slot] = equip;

            actor->strength += equip->strength;
            actor->wisdom += equip->wisdom;
            actor->will += equip->will;
            actor->agility += equip->agility;
            actor->phys_def += equip->phys_def;
            actor->magic_def += equip->magic_def;
            break;
        default:
            break;
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
    Draw_Equip(equip_slot, equipment_weapon[equipment_slot]->name);
}

void Draw_Secondary_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_secondary" in specified equip slot.
{
    Draw_Equip(equip_slot, equipment_secondary[equipment_slot]->name);
}

void Draw_Armor_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_armor" in specified equip slot.
{
    Draw_Equip(equip_slot, equipment_armor[equipment_slot]->name);
}

void Draw_Accessory_Slot(UBYTE equipment_slot, UBYTE equip_slot) //* Draws equip of "equipment_accesory" in specified equip slot.
{
    Draw_Equip(equip_slot, equipment_accessory[equipment_slot]->name);
}

void Refresh_Actor_Stats(GameActor* actor) //* Draws actor's stats.
{
    if(actor->level > 9){Call_Draw_Number(bank12, actor->level, 10, 1);}
    else{Call_Draw_Number(bank12, actor->level, 9, 1);}

    Draw_Equip_Class(Get_Class(actor->class)->name, Get_Class(actor->class)->icon, 14, 1);

    Call_Draw_Number(bank12, actor->strength, 5, 4);
    Call_Draw_Number(bank12, actor->wisdom, 5, 6);
    Call_Draw_Number(bank12, actor->will, 5, 8);
    Call_Draw_Number(bank12, actor->phys_def, 5, 10);
    Call_Draw_Number(bank12, actor->magic_def, 5, 12);
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

void Draw_Equip_Description(const GameEquip* equip) //* Draws description of specified equip.
{
    set_win_tiles(1, 15, 18, 2, equip->description);
}

void Draw_Equip_Description_Large(const GameEquip* equip)
{
    set_win_tiles(1, 14, 18, 2, equip->description);
}

void Draw_Equipped(GameActor* actor) //* Draws actor's equipped equip.
{
    set_win_tiles(12, 4, 7, 1, actor->equipment[weapon_slot]->name);
    set_win_tiles(11, 4, 1, 1, actor->equipment[weapon_slot]->icon);
    if(actor->equipment[weapon_slot] == &equip_null){set_win_tiles(12, 4, 7, 1, none_name);}

    set_win_tiles(12, 6, 7, 1, actor->equipment[secondary_slot]->name);
    set_win_tiles(11, 6, 1, 1, actor->equipment[secondary_slot]->icon);
    if(actor->equipment[secondary_slot] == &equip_null){set_win_tiles(12, 6, 7, 1, none_name);}

    set_win_tiles(12, 8, 7, 1, actor->equipment[armor_slot]->name);
    set_win_tiles(11, 8, 1, 1, actor->equipment[armor_slot]->icon);
    if(actor->equipment[armor_slot] == &equip_null){set_win_tiles(12, 8, 7, 1, none_name);}
    
    set_win_tiles(12, 10, 7, 1, actor->equipment[accessory_slot]->name);
    set_win_tiles(11, 10, 1, 1, actor->equipment[accessory_slot]->icon);
    if(actor->equipment[accessory_slot] == &equip_null){set_win_tiles(12, 10, 7, 1, none_name);}
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

    Draw_Equip_Description(party[actor_y]->equipment[0]);

    fade_in();
}

void Draw_List_Slot(const GameEquip* equip, UBYTE slot) //* Draws slots of equipment list.
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

            Draw_List_Slot(equipment_weapon[0], 0);
            Draw_List_Slot(equipment_weapon[1], 1);
            Draw_List_Slot(equipment_weapon[2], 2);
            Draw_List_Slot(equipment_weapon[3], 3);
            break;
        case 1:
            set_win_tiles(11, 4, 8, 1, secondary_title);

            Draw_List_Slot(equipment_secondary[0], 0);
            Draw_List_Slot(equipment_secondary[1], 1);
            Draw_List_Slot(equipment_secondary[2], 2);
            Draw_List_Slot(equipment_secondary[3], 3);
            break;
        case 2:
            set_win_tiles(10, 4, 8, 1, armor_title);

            Draw_List_Slot(equipment_armor[0], 0);
            Draw_List_Slot(equipment_armor[1], 1);
            Draw_List_Slot(equipment_armor[2], 2);
            Draw_List_Slot(equipment_armor[3], 3);
            break;
        case 3:
            set_win_tiles(11, 4, 8, 1, accessory_title);

            Draw_List_Slot(equipment_accessory[0], 0);
            Draw_List_Slot(equipment_accessory[1], 1);
            Draw_List_Slot(equipment_accessory[2], 2);
            Draw_List_Slot(equipment_accessory[3], 3);
            break;
        default:
            break;
    }

    set_win_tiles(10, 6, 1, 1, Equip_Pointer);

    Refresh_Equip_Cursors();
}

void Draw_Equip_Pointer() //* Draws pointer for selected actor's equipped.
{
    set_win_tiles(10, 4 + equip_y * 2, 1, 1, Equip_Pointer);
}

void Refresh_Equip_List() //* Draws equipment list using "CurrentEquipSelection".
{
    switch(equip_y)
    {
        case 0:
            Draw_List_Slot(equipment_weapon[CurrentEquipSelection], 0);
            Draw_List_Slot(equipment_weapon[1 + CurrentEquipSelection], 1);
            Draw_List_Slot(equipment_weapon[2 + CurrentEquipSelection], 2);
            Draw_List_Slot(equipment_weapon[3 + CurrentEquipSelection], 3);
            break;
        case 1:
            Draw_List_Slot(equipment_secondary[CurrentEquipSelection], 0);
            Draw_List_Slot(equipment_secondary[1 + CurrentEquipSelection], 1);
            Draw_List_Slot(equipment_secondary[2 + CurrentEquipSelection], 2);
            Draw_List_Slot(equipment_secondary[3 + CurrentEquipSelection], 3);
            break;
        case 2:
            Draw_List_Slot(equipment_armor[CurrentEquipSelection], 0);
            Draw_List_Slot(equipment_armor[1 + CurrentEquipSelection], 1);
            Draw_List_Slot(equipment_armor[2 + CurrentEquipSelection], 2);
            Draw_List_Slot(equipment_armor[3 + CurrentEquipSelection], 3);
            break;
        case 3:
            Draw_List_Slot(equipment_accessory[CurrentEquipSelection], 0);
            Draw_List_Slot(equipment_accessory[1 + CurrentEquipSelection], 1);
            Draw_List_Slot(equipment_accessory[2 + CurrentEquipSelection], 2);
            Draw_List_Slot(equipment_accessory[3 + CurrentEquipSelection], 3);
            break;
        default:
            break;
    }
}

void Draw_Stat_Differences(GameActor* actor, const GameEquip* equip, UBYTE equipment_slot) //* Draws stat differences between currently equipped equip and selected equip.
{
    Call_Draw_Number(bank12, actor->strength - actor->equipment[equipment_slot]->strength + equip->strength, 5, 4);
    Call_Draw_Number(bank12, actor->wisdom - actor->equipment[equipment_slot]->wisdom + equip->wisdom, 5, 6);
    Call_Draw_Number(bank12, actor->will - actor->equipment[equipment_slot]->will + equip->will, 5, 8);
    Call_Draw_Number(bank12, actor->phys_def - actor->equipment[equipment_slot]->phys_def + equip->phys_def, 5, 10);
    Call_Draw_Number(bank12, actor->magic_def - actor->equipment[equipment_slot]->magic_def + equip->magic_def, 5, 12);
}

void Compare_Stats(const GameEquip* equip_1, const GameEquip* equip_2) //* Compares stat differences between currently equipped equip and selected equip.
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
            Draw_Stat_Differences(party[actor_y], equipment_weapon[list_y + CurrentEquipSelection], weapon_slot);

            Compare_Stats(equipment_weapon[list_y + CurrentEquipSelection], party[actor_y]->equipment[weapon_slot]);
            break;
        case secondary_slot:
            Draw_Stat_Differences(party[actor_y], equipment_secondary[list_y + CurrentEquipSelection], secondary_slot);

            Compare_Stats(equipment_secondary[list_y + CurrentEquipSelection], party[actor_y]->equipment[secondary_slot]);
            break;
        case armor_slot:
            Draw_Stat_Differences(party[actor_y], equipment_armor[list_y + CurrentEquipSelection], armor_slot);

            Compare_Stats(equipment_armor[list_y + CurrentEquipSelection], party[actor_y]->equipment[armor_slot]);
            break;
        case accessory_slot:
            Draw_Stat_Differences(party[actor_y], equipment_accessory[list_y + CurrentEquipSelection], accessory_slot);

            Compare_Stats(equipment_accessory[list_y + CurrentEquipSelection], party[actor_y]->equipment[accessory_slot]);
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

void Equip_Actor(GameActor* actor) //* Equips specified actor with equip selected with "list_y + CurrentEquipSelection".
{
    switch(equip_y)
    {
        case weapon_slot:
            temp_equip = equipment_weapon[list_y + CurrentEquipSelection];
            equipment_weapon[list_y + CurrentEquipSelection] = actor->equipment[weapon_slot];
            
            Equip_Equipment_To_Slot(actor, temp_equip, weapon_slot);
            break;
        case secondary_slot:
            temp_equip = equipment_secondary[list_y + CurrentEquipSelection];
            equipment_secondary[list_y + CurrentEquipSelection] = actor->equipment[secondary_slot];

            Equip_Equipment_To_Slot(actor, temp_equip, secondary_slot);
            break;
        case armor_slot:
            temp_equip = equipment_armor[list_y + CurrentEquipSelection];
            equipment_armor[list_y + CurrentEquipSelection] = actor->equipment[armor_slot];

            Equip_Equipment_To_Slot(actor, temp_equip, armor_slot);
            break;
        case accessory_slot:
            temp_equip = equipment_accessory[list_y + CurrentEquipSelection];
            equipment_accessory[list_y + CurrentEquipSelection] = actor->equipment[accessory_slot];

            Equip_Equipment_To_Slot(actor, temp_equip, accessory_slot);
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

            Draw_Equip_Description(party[actor_y]->equipment[equip_y]);

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
                    Draw_Equip_Description(equipment_weapon[list_y + CurrentEquipSelection]);
                    break;
                case secondary_slot:
                    Draw_Equip_Description(equipment_secondary[list_y + CurrentEquipSelection]);
                    break;
                case armor_slot:
                    Draw_Equip_Description(equipment_armor[list_y + CurrentEquipSelection]);
                    break;
                case accessory_slot:
                    Draw_Equip_Description(equipment_accessory[list_y + CurrentEquipSelection]);
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

            Draw_Equip_Description(party[actor_y]->equipment[equip_y]);

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
                    Draw_Equip_Description(equipment_weapon[list_y + CurrentEquipSelection]);
                    break;
                case secondary_slot:
                    Draw_Equip_Description(equipment_secondary[list_y + CurrentEquipSelection]);
                    break;
                case armor_slot:
                    Draw_Equip_Description(equipment_armor[list_y + CurrentEquipSelection]);
                    break;
                case accessory_slot:
                    Draw_Equip_Description(equipment_accessory[list_y + CurrentEquipSelection]);
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
                    Draw_Equip_Description(equipment_weapon[list_y + CurrentEquipSelection]);
                    break;
                case secondary_slot:
                    Draw_Equip_Description(equipment_secondary[list_y + CurrentEquipSelection]);
                    break;
                case armor_slot:
                    Draw_Equip_Description(equipment_armor[list_y + CurrentEquipSelection]);
                    break;
                case accessory_slot:
                    Draw_Equip_Description(equipment_accessory[list_y + CurrentEquipSelection]);
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
            Draw_Equip_Description(party[actor_y]->equipment[equip_y]);

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
            Draw_Equip_Description(party[actor_y]->equipment[equip_y]);

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