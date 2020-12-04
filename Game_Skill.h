#include <gb/gb.h>

#ifndef GAME_SKILL
#define GAME_SKILL

typedef struct GameSkill
{
    unsigned char* name;
    UBYTE name_length;
    unsigned char* description;
    UBYTE length;
    UBYTE skill_id;
    UBYTE mana_cost;
    UBYTE skill_type;
    UBYTE skill_element;
    UBYTE is_ability;
    UBYTE required_ap;
    UBYTE menu_use;
    UBYTE class;

} GameSkill;

extern const GameSkill skill_null;

extern const GameSkill skill_hit;
extern const GameSkill skill_use_item;

extern const GameSkill skill_reckless_charge;

extern const GameSkill skill_cure;

extern const GameSkill skill_fireball;
extern const GameSkill skill_thunder;
extern const GameSkill skill_blizzard;

#endif