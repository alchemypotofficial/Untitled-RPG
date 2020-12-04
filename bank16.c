#include <gb/gb.h>
#include <rand.h>
#include "Game_Definitions.h"
#include "Game_Map.h"
#include "Game_Character.h"
#include "Game_Actor.h"
#include "Game_Item.h"
#include "Game_Equip.h"
#include "Game_Class.h"
#include "Game_Enemy.h"
#include "Game_Troop.h"
#include "Object_Troops.c"
#include "Maps/Map_Combat_Main.c"
#include "Maps/Map_Combat_Actor_Box.c"
#include "Maps/Map_Combat_Selection_Fight.c"
#include "Maps/Map_Combat_Selection_Main.c"
#include "Maps/Map_Combat_Actor_Large.c"
#include "Maps/Map_Combat_Actor_Small.c"
#include "Maps/Map_Combat_Message_Box.c"
#include "Maps/Map_Combat_Skills.c"
#include "Tiles/Tiles_Pointer.c"
#include "Tiles/Tiles_Combat_Clear.c"

extern UBYTE Joy, Seed;

extern UBYTE CurrentMap;

extern UBYTE clock_tick;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentEquipSelection, CurrentSkillSelection[4], skill_y[4];

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2, equip_y, list_y, stat_change, held_equip, held_stat;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE CurrentCombat, CurrentTroop, combat_main_y, combat_selection_y, CurrentTurn, turn_number, total_actors, selected_enemy, enemy_selection[4], action_selection[4], target_selection[7], skill_selection[7], action_order[7], enemy_x, actor_action[4], enemy_action[3];

extern UBYTE agility[7], turn_order[7], agility_temp, turn_order_temp;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern UBYTE step_counter, encounter_rate, encounter_value;

extern INT8 i, j, k, l, m, n, x, y;

extern UBYTE u_x, u_y;

extern unsigned char party[4];

extern unsigned char enemy[3];

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern unsigned char equipment_weapon[30];

extern unsigned char equipment_secondary[30];

extern unsigned char equipment_armor[30];

extern unsigned char equipment_accessory[30];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern void performant_delay(UBYTE num_loops);
extern void toggle_control(UBYTE toggle);

extern void Count_Actors();

extern void fade_out();
extern void fade_in();
extern void flash_out();
extern void flash_in();
extern void flash_screen();
extern void shake_screen();

extern void Gameplay();
extern void Menu();

extern void clear_sprites();
extern void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

extern GameMap* Get_Map(UBYTE map_id);
extern GameActor* Get_Actor(UBYTE actor_id);
extern GameItem* Get_Item(UBYTE item_id);
extern GameEquip* Get_Equip(UBYTE equip_id);
extern GameClass* Get_Class(UBYTE class_id);
extern GameEnemy* Get_Enemy(UBYTE enemy_id);
extern GameTroop* Get_Troop(UBYTE troop_id);
extern GameSkill* Get_Skill(UBYTE skill_id);

extern void Call_Reload_Map(UBYTE bank);

extern void Call_Execute_Skill(UBYTE bank, UBYTE skill_id, UBYTE action_performer, UBYTE action_target);
extern void Call_Draw_Troop(UBYTE bank, unsigned char* tiles, unsigned char* data);
extern void Call_Clear_Map(UBYTE bank);
extern void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);
extern void Call_Load_Font_Menu(UBYTE bank);
extern void Call_Draw_Number(UBYTE bank, UINT16 number, UBYTE tile_x, UBYTE tile_y);
extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);
extern void Call_Draw_Skill_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y);
extern void Call_Load_Tileset(UBYTE bank, UBYTE tileset);
extern void Call_Draw_Skill_Cost(UBYTE bank, GameSkill* skill);
extern UBYTE Call_Get_Skill_Cost(UBYTE bank, GameSkill* skill);
extern void Call_Draw_End_Message(UBYTE bank);
extern void Call_Set_Actor_Skills(UBYTE bank, GameActor* actor);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const unsigned char Blank_Tile[1] = {0x00};

const unsigned char Combat_Health[1] = {0x42};
const unsigned char Combat_Mana[1] = {0x47};
const unsigned char Combat_Period[1] = {0x55};
const unsigned char Combat_Slash[1] = {0x0F};
const unsigned char Combat_Pointer[1] = {0x0A};
const unsigned char Combat_Background[1] = {0x01};
const unsigned char Combat_Zeros[4] = {0x31, 0x31, 0x31, 0x31};

void Close_Combat();

GameEnemyDummy* Get_Enemy_Dummy_Combat(UBYTE enemy_dummy_id)
{
    switch(enemy_dummy_id)
    {
        case 4:
            return &enemy_dummy_1;
            break;
        case 5:
            return &enemy_dummy_2;
            break;
        case 6:
            return &enemy_dummy_3;
            break;
        default:
            return &enemy_dummy_1;
            break;
    }
}

UBYTE Get_Party_Slot_Filled(UBYTE party_slot)
{
    if(Get_Actor(party[party_slot]) != &actor_null)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void Draw_Combat_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
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
        set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
    }
    else if(saved_number < 100)
    {
        set_bkg_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
    }
    else if(saved_number < 1000)
    {
        set_bkg_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
    }
    else
    {
        set_bkg_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
    }
    
}

void Draw_Number_Zeros(UBYTE tile_x, UBYTE tile_y, UINT16 number)
{
    if(number < 100)
    {
        set_bkg_tiles(tile_x + 3, tile_y, 2, 1, Combat_Zeros);
    }
    else if(number < 1000)
    {
        set_bkg_tiles(tile_x + 2, tile_y, 3, 1, Combat_Zeros);
    }
}

void Draw_Combat_Name(UBYTE tile_x, UBYTE tile_y, unsigned char* name, UBYTE full_name)
{
    if(name[4] != 0x01 && full_name == false)
    {
        set_bkg_tiles(tile_x, tile_y, 3, 1, name);
        set_bkg_tiles(tile_x + 3, tile_y, 1, 1, Combat_Period);
    }
    else if(name[4] == 0x01)
    {
        set_bkg_tiles(tile_x, tile_y, 4, 1, name);
    }
    else
    {
        set_bkg_tiles(tile_x, tile_y, 7, 1, name);
    }
}

void Draw_Combat_Actors()
{
    if(party[0] != 0)
    {
        Draw_Combat_Name(9, 13, Get_Actor(party[0])->name, false);

        if(Get_Actor(party[0])->max_health < 100)
        {
            set_bkg_tiles(15, 13, 1, 1, Combat_Health);
            set_bkg_tiles(16, 13, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 13, Get_Actor(party[0])->max_health);
            Draw_Combat_Number(Get_Actor(party[0])->health, 15, 13);
        }
        else
        {
            set_bkg_tiles(14, 13, 1, 1, Combat_Health);
            set_bkg_tiles(15, 13, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 13, Get_Actor(party[0])->max_health);
            Draw_Combat_Number(Get_Actor(party[0])->health, 15, 13);
        }
        
    }

    if(party[1] != 0)
    {
        Draw_Combat_Name(9, 14, Get_Actor(party[1])->name, false);

        if(Get_Actor(party[1])->max_health < 100)
        {
            set_bkg_tiles(15, 14, 1, 1, Combat_Health);
            set_bkg_tiles(16, 14, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 14, Get_Actor(party[1])->max_health);
            Draw_Combat_Number(Get_Actor(party[1])->health, 15, 14);
        }
        else
        {
            set_bkg_tiles(14, 14, 1, 1, Combat_Health);
            set_bkg_tiles(15, 14, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 14, Get_Actor(party[1])->max_health);
            Draw_Combat_Number(Get_Actor(party[1])->health, 15, 14);
        }
    }

    if(party[2] != 0)
    {
        Draw_Combat_Name(9, 15, Get_Actor(party[2])->name, false);

        if(Get_Actor(party[2])->max_health < 100)
        {
            set_bkg_tiles(15, 15, 1, 1, Combat_Health);
            set_bkg_tiles(16, 15, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 15, Get_Actor(party[2])->max_health);
            Draw_Combat_Number(Get_Actor(party[2])->health, 15, 15);
        }
        else
        {
            set_bkg_tiles(14, 15, 1, 1, Combat_Health);
            set_bkg_tiles(15, 15, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 15, Get_Actor(party[2])->max_health);
            Draw_Combat_Number(Get_Actor(party[2])->health, 15, 15);
        }
    }

    if(party[3] != 0)
    {
        Draw_Combat_Name(9, 16, Get_Actor(party[3])->name, false);

        if(Get_Actor(party[3])->max_health < 100)
        {
            set_bkg_tiles(15, 16, 1, 1, Combat_Health);
            set_bkg_tiles(16, 16, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 16, Get_Actor(party[3])->max_health);
            Draw_Combat_Number(Get_Actor(party[3])->health, 15, 16);
        }
        else
        {
            set_bkg_tiles(14, 16, 1, 1, Combat_Health);
            set_bkg_tiles(15, 16, 1, 1, Combat_Period);

            Draw_Number_Zeros(14, 16, Get_Actor(party[3])->max_health);
            Draw_Combat_Number(Get_Actor(party[3])->health, 15, 16);
        }
    }
}

void Copy_Dummy_Stats(GameEnemy* enemy, GameEnemyDummy* dummy) //* Copies specified enemy stats into specified dummy.
{
    dummy->health = enemy->max_health;
    dummy->max_health = enemy->max_health;
    dummy->mana = enemy->max_mana;
    dummy->max_mana = enemy->max_mana;
    dummy->strength = enemy->strength;
    dummy->agility = enemy->agility;
    dummy->gold = enemy->gold;
    dummy->experience = enemy->experience;
    dummy->ability_point = enemy->ability_point;
    dummy->skill[0] = enemy->skill[0];
    dummy->skill[1] = enemy->skill[1];
    dummy->skill[2] = enemy->skill[2];
}

void Load_Enemy_Dummy() //* Loads all three enemy dummies based "enemy[]".
{
    for(i = 0; i < 3; i++)
    {
        enemy[i] = Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->enemy_slot[i];
    }

    if(enemy[0] != 0)
    {
        Copy_Dummy_Stats(Get_Enemy(enemy[0]), &enemy_dummy_1);
        enemy_dummy_1.can_attack = true;
    }

    if(enemy[1] != 0)
    {
        Copy_Dummy_Stats(Get_Enemy(enemy[1]), &enemy_dummy_2);
        enemy_dummy_2.can_attack = true;
    }

    if(enemy[2] != 0)
    {
        Copy_Dummy_Stats(Get_Enemy(enemy[2]), &enemy_dummy_3);
        enemy_dummy_3.can_attack = true;
    }
}

void Load_Actor_Info()
{
    if(Get_Actor(party[CurrentTurn])->max_health < 100)
    {
        set_bkg_tiles(0, 0, 11, 4, Map_Combat_Actor_SmallPLN0);

        Draw_Combat_Name(1, 1, Get_Actor(party[CurrentTurn])->name, false);

        Draw_Number_Zeros(5, 1, Get_Actor(party[CurrentTurn])->max_health);

        set_bkg_tiles(7, 1, 1, 1, Combat_Period);
        set_bkg_tiles(6, 1, 1, 1, Combat_Health);

        Draw_Combat_Number(Get_Actor(party[CurrentTurn])->health, 6, 1);

        if(Get_Actor(party[CurrentTurn])->max_mana < 10)
        {
            set_bkg_tiles(8, 2, 1, 1, Combat_Period);
            set_bkg_tiles(7, 2, 1, 1, Combat_Mana);

            Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 6, 2);
        }
    }
    else
    {
        set_bkg_tiles(0, 0, 12, 4, Map_Combat_Actor_LargePLN0);
        
        Draw_Combat_Name(1, 1, Get_Actor(party[CurrentTurn])->name, false);

        Draw_Number_Zeros(6, 1, Get_Actor(party[CurrentTurn])->max_health);

        Draw_Combat_Number(Get_Actor(party[CurrentTurn])->health, 7, 1);

        set_bkg_tiles(7, 1, 1, 1, Combat_Period);
        set_bkg_tiles(6, 1, 1, 1, Combat_Health);

        if(Get_Actor(party[CurrentTurn])->max_mana < 10)
        {
            set_bkg_tiles(9, 2, 1, 1, Combat_Period);
            set_bkg_tiles(8, 2, 1, 1, Combat_Mana);

            Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 7, 2);
        }
    }
}

void Load_Random_Troop() //* Loads a random troop id, based on map troops, into "CurrentTroop".
{
    initrand(Seed);

    CurrentTroop = rand() % 5;
}

void Move_Pointer(UBYTE pos_x, UBYTE pos_y, UBYTE offset_x, UBYTE offset_y) //* Moves pointer and expands to fit offset.
{
    pos_x = pos_x * 8;
    pos_y = pos_y * 8;

    offset_x = offset_x * 8;
    offset_y = offset_y * 8;

    move_sprite(36, pos_x - (offset_x / 2) + 8, pos_y - (offset_y / 2) + 8);
    move_sprite(37, pos_x - (offset_x / 2) + 8, pos_y + 8 + (offset_y / 2) - 8);
    move_sprite(38, pos_x + 8 + (offset_x / 2) - 8, pos_y - (offset_y / 2) + 8);
    move_sprite(39, pos_x + 8 + (offset_x / 2) - 8, pos_y + 8 + (offset_y / 2) - 8);
}

void Move_Small_Pointer(UBYTE pos_x, UBYTE pos_y, UBYTE offset_x) //* Moves small pointer and expands to fit offset.
{
    pos_x = pos_x * 8;
    pos_y = pos_y * 8;

    offset_x = offset_x * 8;

    move_sprite(34, pos_x, pos_y);
    move_sprite(35, pos_x + offset_x + 8, pos_y);
}

void Clear_Pointer() //* Clears pointer's sprites and moves them offscreen.
{
    set_sprite_data(122, 6, Tiles_Combat_Clear);

    Move_Pointer(25, 25, 0, 0);
    Move_Small_Pointer(25, 25, 0);
}

void Order_Turns() //* Orders battle turns by agility from greatest to least.
{
    for(j = 0; j < 4; j++)
    {
        if(Get_Actor(party[j]) != &actor_null && Get_Actor(party[j])->health != 0 && Get_Actor(party[j])->can_attack == true)
        {
            turn_order[j] = j + 1;
            agility[j] = Get_Actor(party[j])->agility;
        }
        else
        {
            turn_order[j] = 0;
            target_selection[j] = 0;
            skill_selection[j] = 0;
            agility[j] = 0;
        }
    }

    if(Get_Enemy(enemy[0]) != &enemy_null && enemy_dummy_1.health != 0 && enemy_dummy_1.can_attack == true)
    {
        turn_order[4] = 5;
        agility[4] = enemy_dummy_1.agility;
    }
    else
    {
        turn_order[4] = 0;
        target_selection[4] = 0;
        skill_selection[4] = 0;
        agility[4] = 0;
    }
    
    if(Get_Enemy(enemy[1]) != &enemy_null && enemy_dummy_2.health != 0 && enemy_dummy_2.can_attack == true)
    {
        turn_order[5] = 6;
        agility[5] = enemy_dummy_2.agility;
    }
    else
    {
        turn_order[5] = 0;
        target_selection[5] = 0;
        skill_selection[5] = 0;
        agility[5] = 0;
    }

    if(Get_Enemy(enemy[2]) != &enemy_null && enemy_dummy_3.health != 0 && enemy_dummy_3.can_attack == true)
    {
        turn_order[6] = 7;
        agility[6] = enemy_dummy_3.agility;
    }
    else
    {
        turn_order[6] = 0;
        target_selection[6] = 0;
        skill_selection[6] = 0;
        agility[6] = 0;
    }

    for(k = 0; k < 7; k++)
    {
        for(j = 0; j < 7; j++)
        {
            if(agility[j] < agility[k])
            {
                agility_temp = agility[k];
                agility[k] = agility[j];
                agility[j] = agility_temp;

                turn_order_temp = turn_order[k];
                turn_order[k] = turn_order[j];
                turn_order[j] = turn_order_temp;
            }
        }
    }
}

void Clear_Enemy_Tiles(GameEnemy* enemy, UBYTE tile_x, UBYTE tile_y)
{
    x = enemy->size[0];
    y = enemy->size[1];

    for(m = 0; m < y; m++)
    {
        for(n = 0; n < x; n++)
        {
            performant_delay(1);

            set_bkg_tiles(tile_x - (enemy->size[0] / 2) + n, tile_y - (enemy->size[1] / 2) - 1 + m, 1, 1, Map_Combat_MainPLN0);
        }
    }
}

void Load_Enemy_Pointer()
{
    selected_enemy = enemy_selection[CurrentTurn] - 4;

    if(enemy_selection[CurrentTurn] == 4)
    {
        Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 5)
    {
        Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 6)
    {
        Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }

    set_sprite_data(122, 6, Tiles_Pointer);
    set_sprite_tile(34, 122);
    set_sprite_tile(35, 123);
    set_sprite_tile(36, 124);
    set_sprite_tile(37, 125);
    set_sprite_tile(38, 126);
    set_sprite_tile(39, 127);
}

void Load_Battle_Message_Box()
{
    wait_vbl_done();
    set_bkg_map(0, 12, 20, 6, Map_Combat_Message_BoxPLN1, Map_Combat_Message_BoxPLN0);
}

void Draw_Enemy_Names()
{
    if(Get_Enemy(enemy[0]) != &enemy_null)
    {
        set_bkg_tiles(10, 13, 7, 1, Get_Enemy(enemy[0])->name);
    }

    if(Get_Enemy(enemy[1]) != &enemy_null)
    {
        set_bkg_tiles(10, 14, 7, 1, Get_Enemy(enemy[1])->name);
    }

    if(Get_Enemy(enemy[2]) != &enemy_null)
    {
        set_bkg_tiles(10, 15, 7, 1, Get_Enemy(enemy[2])->name);
    }
}

void Draw_Selection_Main()
{
    wait_vbl_done();
    set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
    set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);
    
    Draw_Combat_Actors();
}

void Draw_Selection_Fight()
{
    wait_vbl_done();
    set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_FightPLN0);
    set_bkg_tiles(1, 13 + action_selection[CurrentTurn], 1, 1, Combat_Pointer);
}

void Clear_Screen()
{
    for(i = 0; i < 18; i++)
    {
        for(j = 0; j < 20; j++)
        {
            set_bkg_tiles(j, i, 1, 1, Blank_Tile);
        }
    }
}

void Draw_Combat_Main()
{
    flash_out();

    Call_Load_Font_Menu(bank16);

    Call_Clear_Map(bank16);

    Call_Move_Char(bank16, &char_player, 25, 0, 0);
    Call_Move_Char(bank16, &char_npc_1, 25, 0, 0);
    Call_Move_Char(bank16, &char_npc_2, 25, 0, 0);
    Call_Move_Char(bank16, &char_npc_3, 25, 0, 0);
    Call_Move_Char(bank16, &char_npc_4, 25, 0, 0);

    move_bkg(0, 0);

    set_bkg_tiles(0, 12, 20, 6, Map_Combat_Selection_MainPLN0);
    set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);

    Load_Random_Troop();

    Call_Draw_Troop(bank16, Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->tiles, Get_Troop(Get_Map(CurrentMap)->troops[CurrentTroop])->data);

    Load_Enemy_Dummy();

    Draw_Selection_Main();

    CurrentCombat = combat_main;
    CurrentTurn = 0;
    turn_number = 0;

    enemy_selection[0] = 4;
    enemy_selection[1] = 4;
    enemy_selection[2] = 4;
    enemy_selection[3] = 4;

    Call_Set_Actor_Skills(bank16, Get_Actor(party[0]));
    Call_Set_Actor_Skills(bank16, Get_Actor(party[1]));
    Call_Set_Actor_Skills(bank16, Get_Actor(party[2]));
    Call_Set_Actor_Skills(bank16, Get_Actor(party[3]));

    flash_in();
}

void Draw_Current_Skills(GameActor* actor)
{
    Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn]]), 11, 13);
    Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn] + 1]), 11, 14);
    Call_Draw_Skill_Name(bank16, Get_Skill(actor->skills[CurrentSkillSelection[CurrentTurn] + 2]), 11, 15);
}

void Draw_Selection_Skill()
{
    set_bkg_tiles(3, 12, 17, 5, Map_Combat_SkillsPLN0);

    Draw_Current_Skills(Get_Actor(party[CurrentTurn]));

    set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);

    Draw_Combat_Name(4, 13, Get_Actor(party[CurrentTurn])->name, false);

    Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));

    Draw_Combat_Number(Get_Actor(party[CurrentTurn])->mana, 5, 15);
}

void Load_Enemy_Skill()
{
    for(j = 0; j < 3; j++)
    {
        if(Get_Enemy_Dummy_Combat(j + 4)->health != 0 && Get_Enemy(enemy[j]) != &enemy_null)
        {
            while(1)
            {
                x = rand() % 3;
                if(Get_Enemy(enemy[j])->skill[x] > 0)
                {
                    break;
                }
            }

            skill_selection[j + 4] = Get_Enemy(enemy[j])->skill[x];
        }
    }
}

void Load_Enemy_Target()
{
    for(j = 0; j < 3; j++)
    {
        if(Get_Enemy_Dummy_Combat(j + 4)->health != 0 && Get_Enemy(enemy[j]) != &enemy_null)
        {
            while(1)
            {
                x = 1 + (rand() % 3);
                if(party[x] > 0)
                {
                    break;
                }
            }

            target_selection[j + 4] = x;
        }
    }
}

void Refresh_Order()
{
    for(j = 0; j < 7; j++)
    {
        if(turn_order[j] < 5)
        {
            x = turn_order[j] - 1;

            if(Get_Actor(party[x]) != &actor_null && Get_Actor(party[x])->health == 0)
            {
                turn_order[j] = 0;
                target_selection[x] = 0;
                skill_selection[x] = 0;
            }
        }
        else if(turn_order[j] > 4)
        {
            x = turn_order[j] - 1;

            if(Get_Enemy_Dummy_Combat(x)->health == 0)
            {
                turn_order[j] = 0;
                target_selection[x] = 0;
                skill_selection[x] = 0;
            }
        }
    }
}

void Execute_Combat()
{
    Load_Enemy_Skill();
    Load_Enemy_Target();

    Order_Turns();

    Load_Battle_Message_Box();

    for(i = 0; i < 7; i++)
    {
        Refresh_Order();

        if(turn_order[i] != 0)
        {
            Call_Execute_Skill(bank16, skill_selection[turn_order[i] - 1], turn_order[i] - 1, target_selection[turn_order[i] - 1]);
        }

        if(enemy_dummy_1.health == 0 && enemy[0] != 0)
        {
            Clear_Enemy_Tiles(Get_Enemy(enemy[0]), 10, 10);

            enemy[0] = 0;
        }
        if(enemy_dummy_2.health == 0 && enemy[1] != 0)
        {
            Clear_Enemy_Tiles(Get_Enemy(enemy[1]), 4, 9);

            enemy[1] = 0;
        }
        if(enemy_dummy_3.health == 0 && enemy[2] != 0)
        {
            Clear_Enemy_Tiles(Get_Enemy(enemy[2]), 16, 9);

            enemy[2] = 0;
        }

        turn_order[i] = 0;

        Load_Battle_Message_Box();

        if(Get_Actor(party[0])->health == 0 && Get_Actor(party[1])->health == 0 && Get_Actor(party[2])->health == 0 && Get_Actor(party[3])->health == 0)
        {
            Close_Combat();
        }
        if(enemy_dummy_1.health == 0 && enemy_dummy_2.health == 0 && enemy_dummy_3.health == 0)
        {
            Call_Draw_End_Message(bank16);

            Close_Combat();
        }
    }

    turn_number += 1;

    performant_delay(1);
    Draw_Combat_Actors();

}

void Close_Combat()
{
    fade_out();

    Call_Load_Tileset(bank16, Tileset);

    Call_Reload_Map(bank16);

    toggle_control(true);

    fade_in();

    combat_main_y = 0;

    Gameplay();
}

void Flee_Battle()
{
    initrand(clock_tick);

    if(Get_Troop(CurrentTroop)->escapable == true)
    {
        x = rand() % 3;

        if(x < 1)
        {
            Close_Combat();
        }
        else
        {
            
        }
        
    }
}

void Select_Target()
{
    if(enemy_selection[CurrentTurn] > 3)
    {
        if(Get_Enemy_Dummy_Combat(enemy_selection[CurrentTurn])->health == 0)
        {
            if(Get_Enemy_Dummy_Combat(4)->health != 0 && Get_Enemy(enemy[0]) != &enemy_null)
            {
                enemy_selection[CurrentTurn] = 4;
            }
            else if(Get_Enemy_Dummy_Combat(5)->health != 0 && Get_Enemy(enemy[1]) != &enemy_null)
            {
                enemy_selection[CurrentTurn] = 5;
            }
            else if(Get_Enemy_Dummy_Combat(6)->health != 0 && Get_Enemy(enemy[2]) != &enemy_null)
            {
                enemy_selection[CurrentTurn] = 6;
            }
        }
    }
    else if(enemy_selection[CurrentTurn] < 4)
    {
        if(Get_Actor(party[enemy_selection[CurrentTurn]])->health == 0 || Get_Actor(party[enemy_selection[CurrentTurn]]) == &actor_null)
        {
            if(Get_Actor(party[1])->health != 0 && Get_Actor(party[1]) != &actor_null)
            {
                enemy_selection[CurrentTurn] = 1;
            }
            else if(Get_Actor(party[2])->health != 0 && Get_Actor(party[2]) != &actor_null)
            {
                enemy_selection[CurrentTurn] = 2;
            }
            else if(Get_Actor(party[3])->health != 0 && Get_Actor(party[3]) != &actor_null)
            {
                enemy_selection[CurrentTurn] = 3;
            }
        }
    }

}

void Confirm_Target_Selection()
{
    if(Get_Actor(party[CurrentTurn + 1]) != &actor_null && Get_Actor(party[CurrentTurn + 1])->health == 0 && CurrentTurn + 1 <= total_actors)
    {
        if(Get_Actor(party[CurrentTurn + 2]) != &actor_null && Get_Actor(party[CurrentTurn + 2])->health != 0 && CurrentTurn + 2 <= total_actors)
        {
            Call_Play_Confirm(bank16);
            Clear_Pointer();

            target_selection[CurrentTurn] = enemy_selection[CurrentTurn];

            CurrentTurn += 2;

            Load_Actor_Info();

            Draw_Selection_Fight();

            combat_main_y = action_selection[CurrentTurn];

            CurrentCombat = combat_fight;
        }
        else if(Get_Actor(party[CurrentTurn + 3]) != &actor_null && Get_Actor(party[CurrentTurn + 3])->health != 0 && CurrentTurn + 3 <= total_actors)
        {
            Call_Play_Confirm(bank16);
            Clear_Pointer();

            target_selection[CurrentTurn] = enemy_selection[CurrentTurn];

            CurrentTurn += 3;

            Load_Actor_Info();

            Draw_Selection_Fight();

            combat_main_y = action_selection[CurrentTurn];

            CurrentCombat = combat_fight;
        }
        else
        {
            Call_Play_Confirm(bank16);
            Clear_Pointer();

            set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);

            Execute_Combat();

            set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
            set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);

            combat_main_y = 0;

            CurrentTurn = 0;

            CurrentCombat = combat_main;
        }
        
    }
    else if(CurrentTurn < total_actors - 1)
    {
        Call_Play_Confirm(bank16);
        Clear_Pointer();

        target_selection[CurrentTurn] = enemy_selection[CurrentTurn];

        CurrentTurn += 1;

        Load_Actor_Info();

        Draw_Selection_Fight();

        combat_main_y = action_selection[CurrentTurn];

        CurrentCombat = combat_fight;
    }
    else
    {
        Call_Play_Confirm(bank16);
        Clear_Pointer();

        target_selection[CurrentTurn] = enemy_selection[CurrentTurn];

        set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);

        Execute_Combat();

        set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
        set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);

        combat_main_y = 0;

        CurrentTurn = 0;

        CurrentCombat = combat_main;
    }
}

void Move_Pointer_Left()
{
    selected_enemy = enemy_selection[CurrentTurn] - 4;

    if(enemy_selection[CurrentTurn] == 4 && Get_Enemy(enemy[1]) != &enemy_null && Get_Enemy_Dummy_Combat(5)->health != 0)
    {
        enemy_selection[CurrentTurn] = 5;
        Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health != 0)
    {
        enemy_selection[CurrentTurn] = 4;
        Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health == 0 && Get_Enemy_Dummy_Combat(5)->health != 0)
    {
        enemy_selection[CurrentTurn] = 6;
        Move_Pointer(4, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
}

void Move_Pointer_Right()
{
    selected_enemy = enemy_selection[CurrentTurn] - 4;

    if(enemy_selection[CurrentTurn] == 4 && Get_Enemy(enemy[2]) != &enemy_null && Get_Enemy_Dummy_Combat(6)->health != 0)
    {
        enemy_selection[CurrentTurn] = 6;
        Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 5 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health != 0)
    {
        enemy_selection[CurrentTurn] = 4;
        Move_Pointer(10, 10, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
    else if(enemy_selection[CurrentTurn] == 6 && Get_Enemy(enemy[0]) != &enemy_null && Get_Enemy_Dummy_Combat(4)->health == 0 && Get_Enemy_Dummy_Combat(6)->health != 0)
    {
        enemy_selection[CurrentTurn] = 6;
        Move_Pointer(16, 9, Get_Enemy(enemy[selected_enemy])->size[0], Get_Enemy(enemy[selected_enemy])->size[1]);
    }
}

void Update_Combat_Joypad()
{
    Joy = joypad();

    if(Joy & J_A)
    {
        if(CurrentCombat == combat_main)
        {
            if(combat_main_y == 0)
            {
                if(Get_Actor(party[CurrentTurn]) != &actor_null && Get_Actor(party[CurrentTurn])->health == 0)
                {
                    if(Get_Actor(party[CurrentTurn + 1]) != &actor_null && Get_Actor(party[CurrentTurn + 1])->health != 0)
                    {
                        Call_Play_Confirm(bank16);

                        CurrentTurn = 1;

                        Load_Actor_Info();

                        Draw_Selection_Fight();

                        combat_main_y = action_selection[CurrentTurn];

                        CurrentCombat = combat_fight;
                    }
                    else if(Get_Actor(party[CurrentTurn + 2]) != &actor_null && Get_Actor(party[CurrentTurn + 2])->health != 0)
                    {
                        Call_Play_Confirm(bank16);

                        CurrentTurn = 2;

                        Load_Actor_Info();

                        Draw_Selection_Fight();

                        combat_main_y = action_selection[CurrentTurn];

                        CurrentCombat = combat_fight;
                    }
                    else if(Get_Actor(party[CurrentTurn + 3]) != &actor_null && Get_Actor(party[CurrentTurn + 3])->health != 0)
                    {
                        Call_Play_Confirm(bank16);

                        CurrentTurn = 3;

                        Load_Actor_Info();

                        Draw_Selection_Fight();

                        combat_main_y = action_selection[CurrentTurn];

                        CurrentCombat = combat_fight;
                    }
                }
                else
                {
                    Call_Play_Confirm(bank16);
                    Load_Actor_Info();

                    Draw_Selection_Fight();

                    combat_main_y = action_selection[CurrentTurn];

                    CurrentCombat = combat_fight;
                }

                while(joypad() & J_A)
                {
                    performant_delay(1);
                }
            }
            else if(combat_main_y == 1)
            {
                Call_Play_Confirm(bank16);
                Close_Combat();
            }
        }
        else if(CurrentCombat == combat_fight)
        {
            if(combat_main_y == 0)
            {
                Call_Play_Confirm(bank16);

                skill_selection[CurrentTurn] = 1;

                Select_Target();
                
                Load_Enemy_Pointer();

                CurrentCombat = combat_select;
            }
            if(combat_main_y == 1)
            {
                Call_Play_Confirm(bank16);

                Draw_Selection_Skill();

                CurrentCombat = combat_skill;
            }

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_select)
        {
            Confirm_Target_Selection();

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill)
        {
            u_x = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];

            if(Get_Actor(party[CurrentTurn])->mana >= Call_Get_Skill_Cost(bank16, Get_Skill(u_x)) && Call_Get_Skill_Cost(bank16, Get_Skill(u_x)) > 0)
            {
                Call_Play_Confirm(bank16);

                skill_selection[CurrentTurn] = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];

                Draw_Selection_Fight();
                set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);
                Draw_Combat_Actors();

                Select_Target();
                    
                Load_Enemy_Pointer();

                CurrentCombat = combat_skill_select;
            }
            else
            {
                Call_Play_Buzz(bank16);
            }

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill_select)
        {
            u_x = Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]];

            Get_Actor(party[CurrentTurn])->mana -= Call_Get_Skill_Cost(bank16, Get_Skill(u_x));

            Confirm_Target_Selection();

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
    }

    if(Joy & J_B)
    {
        if(CurrentCombat == combat_fight)
        {
            if(CurrentTurn == 0)
            {
                Call_Play_Confirm(bank16);

                set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);

                set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
                set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);

                combat_main_y = 0;

                CurrentCombat = combat_main;
            }
            else
            {
                if(Get_Actor(party[CurrentTurn - 1]) != &actor_null && Get_Actor(party[CurrentTurn - 1])->health == 0 && CurrentTurn - 1 >= 0)
                {
                    if(Get_Actor(party[CurrentTurn - 2]) != &actor_null && Get_Actor(party[CurrentTurn - 2])->health != 0 && CurrentTurn - 2 >= 0)
                    {
                        Call_Play_Confirm(bank16);
                        Clear_Pointer();

                        CurrentTurn -= 2;

                        Load_Actor_Info();

                        Draw_Selection_Fight();

                        combat_main_y = action_selection[CurrentTurn];

                        CurrentCombat = combat_fight;
                    }
                    else if(Get_Actor(party[CurrentTurn - 3]) != &actor_null && Get_Actor(party[CurrentTurn - 3])->health != 0 && CurrentTurn - 3 >= 0)
                    {
                        Call_Play_Confirm(bank16);
                        Clear_Pointer();

                        CurrentTurn -= 3;

                        Load_Actor_Info();

                        Draw_Selection_Fight();

                        combat_main_y = action_selection[CurrentTurn];

                        CurrentCombat = combat_fight;
                    }
                    else
                    {
                        Call_Play_Confirm(bank16);

                        set_bkg_tiles(0, 0, 20, 6, Map_Combat_MainPLN0);

                        set_bkg_tiles(0, 12, 8, 6, Map_Combat_Selection_MainPLN0);
                        set_bkg_tiles(1, 13, 1, 1, Combat_Pointer);

                        combat_main_y = 0;

                        CurrentCombat = combat_main;
                    }
                    
                }
                else if(CurrentTurn > 0)
                {
                    Call_Play_Confirm(bank16);
                    Clear_Pointer();

                    CurrentTurn -= 1;

                    Load_Actor_Info();

                    Draw_Selection_Fight();

                    combat_main_y = action_selection[CurrentTurn];

                    CurrentCombat = combat_fight;
                }
                else
                {
                    Call_Play_Confirm(bank16);

                    CurrentTurn -= 1;

                    Load_Actor_Info();

                    Draw_Selection_Fight();

                    combat_main_y = action_selection[CurrentTurn];
                }
            }
            

            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_select)
        {
            Call_Play_Confirm(bank16);
            Clear_Pointer();

            CurrentCombat = combat_fight;

            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill)
        {
            Call_Play_Confirm(bank16);

            Draw_Selection_Fight();
            set_bkg_tiles(8, 12, 12, 6, Map_Combat_Actor_BoxPLN0);
            Draw_Combat_Actors();

            CurrentCombat = combat_fight;

            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill_select)
        {
            Call_Play_Confirm(bank16);

            Clear_Pointer();

            Draw_Selection_Skill();

            CurrentCombat = combat_skill;

            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
    }

    if(Joy & J_UP)
    {
        if(CurrentCombat == combat_main)
        {
            if(combat_main_y > 0)
            {
                set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Background);
                combat_main_y -= 1;
                set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Pointer);
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_fight)
        {
            if(combat_main_y > 0)
            {
                set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Background);
                combat_main_y -= 1;
                set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Pointer);

                action_selection[CurrentTurn] -= 1;
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_select)
        {
            if(enemy_selection[CurrentTurn] > 0)
            {
                set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Background);

                enemy_selection[CurrentTurn]--;

                set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Pointer);
            }
            else
            {
                enemy_selection[CurrentTurn] = 4;

                set_bkg_tiles(8, 13, 1, 1, Combat_Background);
                
                Select_Target();
                Load_Enemy_Pointer();
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_skill)
        {
            if(skill_y[CurrentTurn] > 0)
            {
                set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Background);

                skill_y[CurrentTurn] -= 1;

                set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);
            }
            else if(skill_y[CurrentTurn] == 0 && CurrentSkillSelection[CurrentTurn] > 0 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
            {
                CurrentSkillSelection[CurrentTurn] -= 1;

                Draw_Current_Skills(Get_Actor(party[CurrentTurn]));
            }

            Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
    }

    if(Joy & J_DOWN)
    {
        if(CurrentCombat == combat_main)
        {
            if(combat_main_y < 1)
            {
                set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Background);
                combat_main_y += 1;
                set_bkg_tiles(1, 13 + combat_main_y * 2, 1, 1, Combat_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_fight)
        {
            if(combat_main_y < 2)
            {
                set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Background);
                combat_main_y += 1;
                set_bkg_tiles(1, 13 + combat_main_y, 1, 1, Combat_Pointer);

                action_selection[CurrentTurn] += 1;
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_select)
        {
            if(enemy_selection[CurrentTurn] > 3)
            {
                enemy_selection[CurrentTurn] = 0;
                Move_Pointer(25, 25, 0, 0);

                set_bkg_tiles(8, 13, 1, 1, Combat_Pointer);
            }
            else if(enemy_selection[CurrentTurn] < 4 && Get_Party_Slot_Filled(enemy_selection[CurrentTurn] + 1) == true)
            {
                set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Background);

                enemy_selection[CurrentTurn]++;

                set_bkg_tiles(8, 13 + enemy_selection[CurrentTurn], 1, 1, Combat_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
        else if(CurrentCombat == combat_skill)
        {
            if(skill_y[CurrentTurn] < 2 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
            {
                set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Background);

                skill_y[CurrentTurn] += 1;

                set_bkg_tiles(10, 13 + skill_y[CurrentTurn], 1, 1, Combat_Pointer);
            }
            else if(skill_y[CurrentTurn] == 2 && CurrentSkillSelection[CurrentTurn] < 7 && Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn] + 1] != 0)
            {
                CurrentSkillSelection[CurrentTurn] += 1;

                Draw_Current_Skills(Get_Actor(party[CurrentTurn]));
            }

            Call_Draw_Skill_Cost(bank16, Get_Skill(Get_Actor(party[CurrentTurn])->skills[CurrentSkillSelection[CurrentTurn] + skill_y[CurrentTurn]]));

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
    }

    if(Joy & J_LEFT)
    {
        if(CurrentCombat == combat_select)
        {
            Move_Pointer_Left();

            while(joypad() & J_LEFT)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill_select)
        {
            Move_Pointer_Left();

            while(joypad() & J_LEFT)
            {
                performant_delay(1);
            }
        }
    }

    if(Joy & J_RIGHT)
    {
        if(CurrentCombat == combat_select)
        {
            Move_Pointer_Right();

            while(joypad() & J_RIGHT)
            {
                performant_delay(1);
            }
        }
        else if(CurrentCombat == combat_skill_select)
        {
            Move_Pointer_Right();

            while(joypad() & J_RIGHT)
            {
                performant_delay(1);
            }
        }
    }
}

void Combat()
{
    while(1)
    {
        wait_vbl_done();
        initrand(clock_tick);

        Update_Combat_Joypad();
    }
}

void Load_Combat_Main()
{    
    Draw_Combat_Main();

    while(joypad() & J_B)
    {
        wait_vbl_done();
    }

    Combat();
}

void Load_Step_Counter()
{
    initrand(Seed);

    step_counter = rand() % 5 + 5;
}

void Check_Step_Counter()
{
    step_counter -= 1;

    if(step_counter == 0)
    {
        Load_Step_Counter();
        
        initrand(Seed);

        encounter_value = rand() % 100 + 1;

        if(encounter_value <= encounter_rate)
        {
            Load_Combat_Main();
        }
    }
}