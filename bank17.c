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
#include "Game_Skill.h"
#include "Object_Skills.c"
#include "Tiles/Tiles_Troop.c"
#include "Tiles/Tiles_Number.c"
#include "Tiles/Tiles_Skill_Clear.c"
#include "Maps/Map_Troop.c"

extern UBYTE Joy;

extern UBYTE clock_tick;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentEquipSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2, equip_y, list_y, stat_change, held_equip, held_stat;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE CurrentCombat, CurrentTroop, combat_main_y, combat_selection_y, CurrentTurn, CurrentTarget, total_actors, enemy_selection[4], action_selection[4], action_order[7], actor_action[4], enemy_action[3], message_x, message_y;

extern UINT16 agility[7], turn_order[7], agility_temp, turn_order_temp, skill_damage, damage_modifier;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n, x, y;

extern UBYTE u_i, u_j, u_y, u_x;

extern GameActor *party[4];

extern const GameSkill* temp_skill;

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
extern void toggle_control();

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
extern void set_bkg_map();
extern void set_win_map();
extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

extern GameMap *Get_Map(UBYTE map_id);
extern GameActor *Get_Actor(UBYTE actor_id);
extern GameItem *Get_Item(UBYTE item_id);
extern GameEquip *Get_Equip(UBYTE equip_id);
extern GameClass *Get_Class(UBYTE class_id);
extern GameEnemy *Get_Enemy(UBYTE enemy_id);
extern GameTroop *Get_Troop(UBYTE troop_id);
extern GameSkill *Get_Skill(UBYTE skill_id);

extern void Call_Menu_Main();
extern void Call_Load_Menu_Main();
extern void Call_Reload_Map();

extern void Call_Clear_Map(UBYTE bank);
extern void Call_Move_Char(UBYTE bank, GameCharacter *character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);
extern void Call_Load_Font_Menu();
extern void Call_Draw_Number();
extern void Call_Draw_Name();
extern void Call_Load_Tileset(UBYTE bank, UBYTE tileset);
extern void Call_Play_Buzz();
extern void Call_Play_Use();
extern void Call_Play_Confirm();
extern void Call_Load_Battle_Message_Box(UBYTE bank);

const unsigned char Skill_Period[1] = {0x55};
const unsigned char Skill_Gained[6] = {0x1C, 0x16, 0x1E, 0x23, 0x1A, 0x19};
const unsigned char Skill_Experience[10] = {0x1A, 0x2E, 0x25, 0x1A, 0x27, 0x1E, 0x1A, 0x23, 0x18, 0x1A};
const unsigned char Skill_Damaged[7] = {0x19, 0x16, 0x22, 0x16, 0x1C, 0x1A};
const unsigned char Skill_On[2] = {0x24, 0x23};
const unsigned char Skill_Took[4] = {0x2A, 0x24, 0x24, 0x20};
const unsigned char Skill_The[3] = {0x4E, 0x1D, 0x1A};
const unsigned char Skill_Party[5] = {0x25, 0x16, 0x27, 0x2A, 0x2F};
const unsigned char Skill_Gold[4] = {0x1C, 0x24, 0x21, 0x19};

GameEnemyDummy *Get_Enemy_Dummy(UBYTE enemy_dummy_id)
{
    switch (enemy_dummy_id)
    {
    case 0:
        return &enemy_dummy_1;
        break;
    case 1:
        return &enemy_dummy_2;
        break;
    case 2:
        return &enemy_dummy_3;
        break;
    default:
        return &enemy_dummy_1;
        break;
    }
}

UBYTE Is_Actor(UBYTE target)
{
    if(target < 4)
    {
        return true;
    }
    else
    {
        return false;
    }
}

unsigned char *Get_Name(UBYTE target_id)
{
    switch (target_id)
    {
    case 0:
        return party[0]->name;
        break;
    case 1:
        return party[1]->name;
        break;
    case 2:
        return party[2]->name;
        break;
    case 3:
        return party[3]->name;
        break;
    case 4:
        return Get_Enemy(enemy[0])->name;
        break;
    case 5:
        return Get_Enemy(enemy[1])->name;
        break;
    case 6:
        return Get_Enemy(enemy[2])->name;
        break;
    default:
        return party[0]->name;
        break;
    }
}

UBYTE Get_Name_Length(UBYTE target_id)
{
    switch (target_id)
    {
    case 0:
        return party[0]->length;
        break;
    case 1:
        return party[1]->length;
        break;
    case 2:
        return party[2]->length;
        break;
    case 3:
        return party[3]->length;
        break;
    case 4:
        return Get_Enemy(enemy[0])->length;
        break;
    case 5:
        return Get_Enemy(enemy[1])->length;
        break;
    case 6:
        return Get_Enemy(enemy[2])->length;
        break;
    default:
        return party[0]->length;
        break;
    }
}

UBYTE Get_Skill_Cost(const GameSkill* skill)
{
    return skill->mana_cost;
}

void Set_Actor_Skills(GameActor* actor)
{
    u_y = 0;

    for (u_x = 0; u_x < 10; u_x++)
    {
        actor->skills[u_x] = &skill_null;
    }

    temp_skill = actor->equipment[weapon_slot]->skill;

    if (actor->skill_ap[temp_skill->skill_id] < temp_skill->required_ap)
    {
        actor->skills[0] = temp_skill;
    }

    for (u_x = 0; u_x < 119; u_x++)
    {
        if (actor->skill_ap[u_x] == Get_Skill(u_x)->required_ap && Get_Skill(u_x)->required_ap > 0 && Get_Skill(u_x)->class == actor->class)
        {
            actor->skills[1 + u_y] = Get_Skill(u_x);
            u_y += 1;

            if (u_y > 9)
            {
                break;
            }
        }
    }

    for (u_y = 0; u_y < 10; u_y++)
    {
        for (u_x = 0; u_x < 10; u_x++)
        {
            if (actor->skills[u_x]->skill_id < actor->skills[u_y]->skill_id)
            {
                temp_skill = actor->skills[u_y];
                actor->skills[u_y] = actor->skills[u_x];
                actor->skills[u_x] = temp_skill;
            }
        }
    }
}

void Add_Ability_Points(GameActor *actor, UBYTE points)
{
    for (u_x = 0; u_x < 10; u_x++)
    {
        temp_skill = actor->skills[u_x];

        if (temp_skill != &skill_null && actor->skill_ap[temp_skill->skill_id] < temp_skill->required_ap)
        {
            if ((actor->skill_ap[temp_skill->skill_id] + points) < temp_skill->required_ap)
            {
                actor->skill_ap[temp_skill->skill_id] += points;
            }
            else
            {
                actor->skill_ap[temp_skill->skill_id] = temp_skill->required_ap;
            }
        }
    }
}

void Draw_Skill_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
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
        set_bkg_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
    }
    else if (saved_number < 100)
    {
        set_bkg_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
    }
    else if (saved_number < 1000)
    {
        set_bkg_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
    }
    else
    {
        set_bkg_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
    }
}

void Draw_Skill_Cost(const GameSkill* skill)
{
    Draw_Skill_Number(skill->mana_cost, 4, 14);
}

void Draw_Damage_Message(UINT16 number, UBYTE tile_x, UBYTE tile_y)
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
        performant_delay(2);

        set_bkg_tiles(tile_x, tile_y, 1, 1, &parsed_decimal[3]);
    }
    else if (saved_number < 100)
    {
        for (x = 0; x < 2; x++)
        {
            performant_delay(2);

            set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x + 2]);
        }
    }
    else if (saved_number < 1000)
    {
        for (x = 0; x < 3; x++)
        {
            performant_delay(2);

            set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x + 1]);
        }
    }
    else
    {
        for (x = 0; x < 4; x++)
        {
            performant_delay(2);

            set_bkg_tiles(tile_x + x, tile_y, 1, 1, &parsed_decimal[x]);
        }
    }
}

void Move_Damage(UBYTE tile_x, UBYTE tile_y, UBYTE full_number)
{
    tile_x = tile_x * 8;
    tile_y = tile_y * 8;

    if (full_number == false)
    {
        set_sprite_data(104, 20, Tiles_Number);

        move_sprite(36, tile_x, tile_y);
        move_sprite(37, tile_x, tile_y + 8);

        move_sprite(38, tile_x + 8, tile_y);
        move_sprite(39, tile_x + 8, tile_y + 8);
    }
    else
    {
        set_sprite_data(104, 20, Tiles_Number);

        move_sprite(34, tile_x, tile_y);
        move_sprite(35, tile_x, tile_y + 8);

        move_sprite(36, tile_x + 8, tile_y);
        move_sprite(37, tile_x + 8, tile_y + 8);

        move_sprite(38, tile_x + 16, tile_y);
        move_sprite(39, tile_x + 16, tile_y + 8);
    }
}

void Draw_Skill_Damage(UINT16 number)
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

    parsed_decimal[0] += parsed_decimal[0];
    parsed_decimal[1] += parsed_decimal[1];
    parsed_decimal[2] += parsed_decimal[2];
    parsed_decimal[3] += parsed_decimal[3];

    parsed_decimal[0] += 104;
    parsed_decimal[1] += 104;
    parsed_decimal[2] += 104;
    parsed_decimal[3] += 104;

    if (saved_number < 100)
    {
        set_sprite_data(104, 20, Tiles_Number);

        set_sprite_tile(36, parsed_decimal[2]);
        set_sprite_tile(37, parsed_decimal[2] + 1);

        set_sprite_tile(38, parsed_decimal[3]);
        set_sprite_tile(39, parsed_decimal[3] + 1);
    }
    else if (saved_number < 1000)
    {
        set_sprite_data(104, 20, Tiles_Number);

        set_sprite_tile(34, parsed_decimal[1]);
        set_sprite_tile(35, parsed_decimal[1] + 1);

        set_sprite_tile(36, parsed_decimal[2]);
        set_sprite_tile(37, parsed_decimal[2] + 1);

        set_sprite_tile(38, parsed_decimal[3]);
        set_sprite_tile(39, parsed_decimal[3] + 1);
    }
}

void Draw_Skill_Message(const GameSkill *skill, UBYTE action_performer, UBYTE action_target)
{
    message_x = 0;
    message_y = 0;

    for (u_x = 0; u_x < 7; u_x++) //* Action performer's name.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_performer)[u_x]);

        message_x += 1;

        if (Get_Name(action_performer)[u_x + 1] == 0x01 && Get_Name(action_performer)[u_x + 2] == 0x01)
        {
            break;
        }
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < skill->length; u_x++) //* Skill message.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &skill->description[u_x]);

        message_x += 1;

        if (skill->description[u_x + 1] == 0x01)
        {
            break;
        }
    }

    message_x += 1;

    if (skill->is_ability) //* Skill name.
    {
        if (message_x + skill->name_length > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        for (u_x = 0; u_x < 8; u_x++) //* Skill message.
        {
            if (joypad() & J_A)
            {
                performant_delay(1);
            }
            else
            {
                performant_delay(2);
            }

            set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &skill->name[u_x]);

            message_x += 1;

            if (skill->name[u_x + 1] == 0x01)
            {
                break;
            }
        }

        message_x += 1;

        if (message_x + 2 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        for (u_x = 0; u_x < 2; u_x++)
        {
            if (joypad() & J_A)
            {
                performant_delay(1);
            }
            else
            {
                performant_delay(2);
            }

            set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_On[u_x]);

            message_x += 1;
        }

        message_x += 1;
    }

    if (message_x + Get_Name_Length(action_target) > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 7; u_x++) //* Action target's name.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_target)[u_x]);

        message_x += 1;

        if (Get_Name(action_target)[u_x + 1] == 0x01)
        {
            break;
        }
    }

    set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);

    message_x += 1;

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    if (message_x + Get_Name_Length(action_target) + 1 > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    performant_delay(15);

    for (u_x = 0; u_x < 7; u_x++) //* Action target's name.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Get_Name(action_target)[u_x]);

        message_x += 1;

        if (Get_Name(action_target)[u_x + 1] == 0x01)
        {
            break;
        }
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 4; u_x++) //* Skill message.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Took[u_x]);

        message_x += 1;
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    if (skill_damage < 10) //* 'skill_damage' number.
    {
        Draw_Damage_Message(skill_damage, message_x + 1, 13 + message_y);

        message_x += 1;
    }
    else if (skill_damage > 9)
    {
        if (message_x + 2 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(skill_damage, message_x, 13 + message_y);

        message_x += 2;
    }
    else if (skill_damage > 99)
    {
        if (message_x + 3 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(skill_damage, message_x, 13 + message_y);

        message_x += 3;
    }

    message_x += 1;

    if (message_x + 6 > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 6; u_x++) //* Damage message.
    {
        if (joypad() & J_A)
        {
            performant_delay(1);
        }
        else
        {
            performant_delay(2);
        }

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Damaged[u_x]);

        message_x += 1;

        if (message_x > 17)
        {
            message_x = 0;
            message_y += 1;
        }
    }

    set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);

    waitpad(J_A);
}

void Draw_Experience_Message(GameActor *actor)
{
    message_x = 0;
    message_y = 0;

    for (u_x = 0; u_x < 7; u_x++) //* Party member name.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &actor->name[u_x]);

        message_x += 1;

        if (actor->name[u_x + 1] == 0x01)
        {
            break;
        }
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 6; u_x++) //* Gained message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gained[u_x]);

        message_x += 1;
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    u_x = enemy_dummy_1.experience + enemy_dummy_2.experience + enemy_dummy_3.experience;

    actor->experience += u_x;

    if (u_x < 10) //* 'experience' number.
    {
        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 1;
    }
    else if (u_x > 9)
    {
        if (message_x + 2 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 2;
    }
    else if (u_x > 99)
    {
        if (message_x + 3 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 3;
    }

    message_x += 1;

    if (message_x + 11 > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 10; u_x++) //* Experience message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Experience[u_x]);

        message_x += 1;
    }

    set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);

    waitpad(J_A);
}

void Draw_Gold_Message()
{
    message_x = 0;
    message_y = 0;

    for (u_x = 0; u_x < 3; u_x++) //* The message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_The[u_x]);

        message_x += 1;
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 5; u_x++) //* Party message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Party[u_x]);

        message_x += 1;
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 6; u_x++) //* Gained message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gained[u_x]);

        message_x += 1;
    }

    message_x += 1;

    if (message_x > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    u_x = enemy_dummy_1.gold + enemy_dummy_2.gold + enemy_dummy_3.gold;

    party_gold += u_x;

    if (u_x < 10) //* 'gold' number.
    {
        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 1;
    }
    else if (u_x > 9)
    {
        if (message_x + 2 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 2;
    }
    else if (u_x > 99)
    {
        if (message_x + 3 > 17)
        {
            message_x = 0;
            message_y += 1;
        }

        Draw_Damage_Message(u_x, message_x + 1, 13 + message_y);

        message_x += 3;
    }

    message_x += 1;

    if (message_x + 4 > 17)
    {
        message_x = 0;
        message_y += 1;
    }

    for (u_x = 0; u_x < 4; u_x++) //* Gold message.
    {
        performant_delay(2);

        set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, &Skill_Gold[u_x]);

        message_x += 1;
    }

    set_bkg_tiles(1 + message_x, 13 + message_y, 1, 1, Skill_Period);

    waitpad(J_A);
}

void Draw_End_Message()
{
    if (party[0] > 0 && party[0]->health > 0)
    {
        Draw_Experience_Message(party[0]);

        u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;

        Add_Ability_Points(party[0], u_i);
    }

    if (party[1] > 0 && party[1]->health > 0)
    {
        Call_Load_Battle_Message_Box(bank17);

        Draw_Experience_Message(party[1]);

        u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;

        Add_Ability_Points(party[1], u_i);
    }

    if (party[2] > 0 && party[2]->health > 0)
    {
        Call_Load_Battle_Message_Box(bank17);

        Draw_Experience_Message(party[2]);

        u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;

        Add_Ability_Points(party[2], u_i);
    }

    if (party[3] > 0 && party[3]->health > 0)
    {
        Call_Load_Battle_Message_Box(bank17);

        Draw_Experience_Message(party[3]);

        u_i = enemy_dummy_1.ability_point + enemy_dummy_2.ability_point + enemy_dummy_3.ability_point;

        Add_Ability_Points(party[3], u_i);
    }

    Call_Load_Battle_Message_Box(bank17);

    Draw_Gold_Message();
}

void Bounce_Damage_Sprite()
{
    scroll_sprite(34, 0, 5);
    scroll_sprite(35, 0, 5);
    scroll_sprite(36, 0, 5);
    scroll_sprite(37, 0, 5);
    scroll_sprite(38, 0, 5);
    scroll_sprite(39, 0, 5);

    performant_delay(1);

    scroll_sprite(34, 0, -5);
    scroll_sprite(35, 0, -5);
    scroll_sprite(36, 0, -5);
    scroll_sprite(37, 0, -5);
    scroll_sprite(38, 0, -5);
    scroll_sprite(39, 0, -5);

    performant_delay(1);
}

void Clear_Damage()
{
    Move_Damage(25, 25, false);

    set_sprite_data(104, 8, Tiles_Skill_Clear);
    set_sprite_data(112, 8, Tiles_Skill_Clear);
}

void Load_Damage_Sprite(UBYTE action_target)
{
    Draw_Skill_Damage(skill_damage);

    if (action_target > 3)
    {
        if (skill_damage < 100)
        {
            if (action_target == 4)
            {
                Move_Damage(10, 10, false);
            }
            if (action_target == 5)
            {
                Move_Damage(4, 9, false);
            }
            else if (action_target == 6)
            {
                Move_Damage(16, 9, false);
            }
        }
        else if (skill_damage < 1000)
        {
            if (action_target == 4)
            {
                Move_Damage(10, 10, true);
            }
            if (action_target == 5)
            {
                Move_Damage(4, 9, true);
            }
            else if (action_target == 6)
            {
                Move_Damage(16, 9, true);
            }
        }
    }

    Bounce_Damage_Sprite();

    performant_delay(30);

    Clear_Damage();
}

void Draw_Skill_Name(const GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
{
    set_bkg_tiles(tile_x, tile_y, 8, 1, skill->name);
}

void Draw_Skills_Name(const GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 8, 1, skill->name);
}

void Get_Next_Target()
{
    if(CurrentTarget > 3)
    {
        if(Get_Enemy_Dummy(CurrentTarget - 4)->health == 0)
        {
            if(Get_Enemy_Dummy(0)->health != 0 && Get_Enemy(enemy[0]) != &enemy_null)
            {
                CurrentTarget = 4;
            }
            else if(Get_Enemy_Dummy(1)->health != 0 && Get_Enemy(enemy[1]) != &enemy_null)
            {
                CurrentTarget = 5;
            }
            else if(Get_Enemy_Dummy(2)->health != 0 && Get_Enemy(enemy[2]) != &enemy_null)
            {
                CurrentTarget = 6;
            }
        }
    }
    else if(CurrentTarget < 4)
    {
        if(party[CurrentTarget]->health == 0)
        {
            if (party[0]->health != 0 && party[0] != NULL)
            {
                CurrentTarget = 0;
            }
            else if (party[1]->health != 0 && party[1] != NULL)
            {
                CurrentTarget = 1;
            }
            else if (party[2]->health != 0 && party[2] != NULL)
            {
                CurrentTarget = 2;
            }
            else if (party[3]->health != 0 && party[3] != NULL)
            {
                CurrentTarget = 3;
            }
        }
    }
}

void Execute_Skill_Hit(UBYTE action_performer, UBYTE action_target)
{
    if(Is_Actor(action_performer) == true)
    {
        damage_modifier = party[action_performer]->strength;

        skill_damage = 4 + ((rand() % ((damage_modifier + 1) * 2)));
    }
    else
    {
        skill_damage = 2 + (rand() % ((Get_Enemy_Dummy(action_performer - 4)->strength + 1) * 2));
    }

    if(Is_Actor(action_target) == false)
    {
        if(Get_Enemy_Dummy(action_target - 4)->health <= skill_damage)
        {
            Get_Enemy_Dummy(action_target - 4)->health = 0;
        }
        else
        {
            Get_Enemy_Dummy(action_target - 4)->health -= skill_damage;
        }

        Load_Damage_Sprite(action_target);
    }
    else
    {
        if(party[action_target]->health <= skill_damage)
        {
            party[action_target]->health = 0;
        }
        else
        {
            party[action_target]->health -= skill_damage;
        }

        shake_screen();
    }
}

void Execute_Skill_Fireball(UBYTE action_performer, UBYTE action_target)
{
    if (action_performer < 4)
    {
        damage_modifier = party[action_performer]->wisdom + Get_Equip(party[action_performer]->equipped[weapon_slot])->wisdom + Get_Equip(party[action_performer]->equipped[secondary_slot])->wisdom + Get_Equip(party[action_performer]->equipped[armor_slot])->wisdom + Get_Equip(party[action_performer]->equipped[accessory_slot])->wisdom;
        skill_damage = 6 + ((rand() % ((damage_modifier + 1) * 2)));
    }
    else
    {
        skill_damage = 4 + (rand() % ((Get_Enemy_Dummy(action_performer - 4)->wisdom + 1) * 2));
    }

    if (action_target > 3)
    {
        if (Get_Enemy_Dummy(action_target - 4)->health <= skill_damage)
        {
            Get_Enemy_Dummy(action_target - 4)->health = 0;
        }
        else
        {
            Get_Enemy_Dummy(action_target - 4)->health -= skill_damage;
        }

        Load_Damage_Sprite(action_target);
    }
    else
    {
        if (party[action_target]->health <= skill_damage)
        {
            party[action_target]->health = 0;
        }
        else
        {
            party[action_target]->health -= skill_damage;
        }

        shake_screen();
    }
}

void Execute_Skill_Cure(UBYTE action_performer, UBYTE action_target)
{
    if(Is_Actor(action_performer) == true)
    {
        damage_modifier = party[action_performer]->wisdom;
        skill_damage = 3 + ((rand() % ((damage_modifier + 1) * 2)));
    }
    else
    {
        skill_damage = 4 + (rand() % ((Get_Enemy_Dummy(action_performer - 4)->wisdom + 1) * 2));
    }

    if(Is_Actor(action_target) == false)
    {
        if(Get_Enemy_Dummy(action_target - 4)->enemy_type == undead)
        {
            if(Get_Enemy_Dummy(action_target - 4)->health <= skill_damage)
            {
                Get_Enemy_Dummy(action_target - 4)->health = 0;
            }
            else
            {
                Get_Enemy_Dummy(action_target - 4)->health -= skill_damage;
            }
        }
        else
        {
            if(Get_Enemy_Dummy(action_target - 4)->max_health <= Get_Enemy_Dummy(action_target - 4)->health + skill_damage)
            {
                Get_Enemy_Dummy(action_target - 4)->health = Get_Enemy_Dummy(action_target - 4)->max_health;
            }
            else
            {
                Get_Enemy_Dummy(action_target - 4)->health += skill_damage;
            }
        }

        Load_Damage_Sprite(action_target);
    }
    else
    {
        if (party[action_target]->max_health <= party[action_target]->health + skill_damage)
        {
            party[action_target]->health = party[action_target]->max_health;
        }
        else
        {
            party[action_target]->health += skill_damage;
        }

        shake_screen();
    }
}

void Execute_Skill(const GameSkill* skill, UBYTE action_performer, UBYTE action_target)
{
    CurrentTarget = action_target;

    Get_Next_Target();

    switch (skill->skill_id)
    {
        case 0:
            break;
        case 1:
            Execute_Skill_Hit(action_performer, CurrentTarget);
            break;
        case 3:
            Execute_Skill_Fireball(action_performer, CurrentTarget);
            break;
        case 23:
            Execute_Skill_Cure(action_performer, CurrentTarget);
            break;
        default:
            Execute_Skill_Hit(action_performer, CurrentTarget);
            break;
    }

    Draw_Skill_Message(skill, action_performer, CurrentTarget);
}

void Draw_Troop(unsigned char *tiles, unsigned char *data) //* Draws troop tiles.
{
    set_bkg_tileset(128, 64, tiles);
    set_bkg_tiles(0, 0, 20, 12, data);
}