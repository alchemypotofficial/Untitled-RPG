#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Equip.h"
#include "Game_Class.h"
#include "Game_Skill.h"
#include "Maps/Map_Menu_Skills.c"
#include "Maps/Map_Menu_Blank.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max, skills_y;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y;

extern GameActor* party[4];

extern const GameSkill* temp_skill;

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
extern GameSkill* Get_Skill(UBYTE skill_id);

extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);
extern void Call_Draw_Skills_Name(UBYTE bank, const GameSkill* skill, UBYTE tile_x, UBYTE tile_y);
extern void Call_Load_Menu_Main(UBYTE bank);
extern void Call_Menu_Main(UBYTE bank);
extern void Call_Menu_Item(UBYTE bank);
extern void Call_Set_Actor_Skills(UBYTE bank, GameActor* actor);

extern UINT16 Get_Required_AP(UBYTE bank, const GameSkill* skill);
extern UINT16 Get_Skill_AP(UBYTE bank, GameActor* actor, const GameSkill* skill);
extern UINT16 Get_Skill_Useable(UBYTE bank, const GameSkill* skill);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

const unsigned char Skills_Pointer[1] = {0x0A};

const unsigned char Skills_Background[1] = {0x01};

const unsigned char Skills_Slash[1] = {0x0F};

const unsigned char Skills_Border[1] = {0x09};

const unsigned char Skills_Learned[7] = {0x46, 0x1A, 0x16, 0x27, 0x23, 0x1A, 0x19};

void Draw_Skills_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
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

void Draw_Skills_Class(unsigned char* name, unsigned char* icon, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 1, 1, icon);
    set_win_tiles(tile_x + 1, tile_y, 3, 1, name);
}

void Draw_Skill(GameActor* actor, const GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
{
    Call_Draw_Skills_Name(bank15, skill, tile_x, tile_y);
    
    if(Get_Skill_AP(bank15, actor, skill) == Get_Required_AP(bank15, skill))
    {
        set_win_tiles(tile_x + 10, tile_y, 7, 1, Skills_Learned);
    }
    else
    {
        Draw_Skills_Number( Get_Skill_AP(bank15, actor, skill), 9 + tile_x, tile_y);

        set_win_tiles(tile_x + 13, tile_y, 1, 1, Skills_Slash);

        if(Get_Required_AP(bank15, skill) < 10)
        {
            Draw_Skills_Number(Get_Required_AP(bank15, skill), 11 + tile_x, tile_y);
        }
        else if(Get_Required_AP(bank15, skill) < 100)
        {
            Draw_Skills_Number(Get_Required_AP(bank15, skill), 12 + tile_x, tile_y);
        }
        else
        {
            Draw_Skills_Number(Get_Required_AP(bank15, skill), 13 + tile_x, tile_y);
        }
    }
}

void Draw_Actor_Skills(UBYTE skill_position)
{
    if(party[actor_y]->skills[skill_position] != &skill_null)
    {
        Draw_Skill(party[actor_y], party[actor_y]->skills[skill_position], 2, 4);
    }

    if(party[actor_y]->skills[skill_position + 1] != &skill_null)
    {
        Draw_Skill(party[actor_y], party[actor_y]->skills[skill_position + 1], 2, 6);
    }
    
    if(party[actor_y]->skills[skill_position + 2] != &skill_null)
    {
        Draw_Skill(party[actor_y], party[actor_y]->skills[skill_position + 2], 2, 8);
    }
    
    if(party[actor_y]->skills[skill_position + 3] != &skill_null)
    {
        Draw_Skill(party[actor_y], party[actor_y]->skills[skill_position + 3], 2, 10);
    }

    if(party[actor_y]->skills[skill_position + 4] != &skill_null)
    {
        Draw_Skill(party[actor_y], party[actor_y]->skills[skill_position + 4], 2, 12);
    }
}

void Draw_Menu_Skills()
{
    fade_out();

    CurrentMenu = menu_status;

    skills_y = 0;

    set_win_tiles(0, 0, 20, 18, Map_Menu_SkillsPLN0);

    set_win_tiles(1, 4, 1, 1, Skills_Pointer);

    Call_Set_Actor_Skills(bank15, party[0]);
    Call_Set_Actor_Skills(bank15, party[1]);
    Call_Set_Actor_Skills(bank15, party[2]);
    Call_Set_Actor_Skills(bank15, party[3]);

    Call_Draw_Name(bank15, 2, 1, party[actor_y]->name, true);
    Draw_Skills_Number(party[actor_y]->level, 9, 1);
    Draw_Skills_Class(Get_Class(party[actor_y]->class)->name, Get_Class(party[actor_y]->class)->icon, 14, 1);

    Draw_Actor_Skills(0);

    fade_in();
}

void Menu_Skills_Joypad()
{
    Joy = joypad();

    if(Joy & J_UP)
    {
        if(CurrentMenu == menu_skills)
        {
            if(skills_y > 0)
            {
                set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Background);

                skills_y -= 1;

                set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Pointer);
            }
        }
        else
        {
            if(actor_y > 0)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Background);

                actor_y -= 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Pointer);
            }

            while(joypad() & J_UP)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_DOWN)
    {
        if(CurrentMenu == menu_skills)
        {
            if(skills_y < 5 && party[actor_y]->skills[skills_y + 1] != &skill_null)
            {
                set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Background);

                skills_y += 1;

                set_win_tiles(1, 4 + skills_y * 2, 1, 1, Skills_Pointer);
            }
        }
        else
        {
            if(actor_y < actor_max - 1)
            {
                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Background);

                actor_y += 1;

                set_win_tiles(9, 2 + 3 * actor_y, 1, 1, Skills_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_A)
    {
        if(CurrentMenu == menu_skills)
        {
            temp_skill = party[actor_y]->skills[skills_y];

            if(Get_Skill_Useable(bank15, temp_skill) == true)
            {

            }
            else
            {
                Call_Play_Buzz(bank15);
            }
            
            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else
        {
            Call_Play_Confirm(bank15);

            Draw_Menu_Skills();

            CurrentMenu = menu_skills;

            while(joypad() & J_A)
            {
                wait_vbl_done();
            }
        }
    }

    else if(Joy & J_B)
    {
        if(CurrentMenu == menu_skills)
        {
            Call_Play_Confirm(bank15);
            Call_Load_Menu_Main(bank15);
        }
        else
        {
            Call_Play_Confirm(bank15);

            set_win_tiles(9, 2, 1, 1, Skills_Background);
            set_win_tiles(9, 5, 1, 1, Skills_Background);
            set_win_tiles(9, 8, 1, 1, Skills_Background);
            set_win_tiles(9, 10, 1, 1, Skills_Background);

            Call_Menu_Main(bank15);
        }
    }
}

void Menu_Skills()
{
    while(1)
    {
        performant_delay(1);

        Menu_Skills_Joypad();
    }
}

void Load_Menu_Skills()
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

    set_win_tiles(9, 2, 1, 1, Skills_Pointer);

    actor_y = 0;

    while(joypad() & J_A || joypad() & J_START)
    {
        performant_delay(1);
    }

    Menu_Skills();
}