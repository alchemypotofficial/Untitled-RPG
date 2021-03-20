#include <gb/gb.h>
#include "Game_Skill.h"

#ifndef GAME_EQUIP
#define GAME_EQUIP

typedef struct GameEquip
{
    unsigned char* name;
    unsigned char* icon;
    unsigned char* description;
    UBYTE equip_id;
    UBYTE equip_type;
    UBYTE class_type;
    UBYTE strength;
    UBYTE wisdom;
    UBYTE will;
    UBYTE agility;
    UBYTE luck;
    UBYTE phys_def;
    UBYTE magic_def;
    const GameSkill* skill;
    UBYTE skill_id;
    UINT16 price;

} GameEquip;

extern const GameEquip equip_null;

extern const GameEquip equip_wooden_sword;

extern const GameEquip equip_wooden_staff;

extern const GameEquip equip_metal_rod;
extern const GameEquip equip_mythril_rod;
extern const GameEquip equip_rod_of_spark;

extern const GameEquip equip_hoplon;
extern const GameEquip equip_cotton_garb;
extern const GameEquip equip_copper_bracelet;

#endif