#include <gb/gb.h>
#include "Game_Skill.h"

#ifndef GAME_ENEMIES
#define GAME_ENEMIES

typedef struct GameDrop
{
    UBYTE drop;
    UBYTE percentage;
    
} GameDrop;

typedef struct GameEnemy
{
    unsigned char *name;
    UBYTE length;
    unsigned char *description;
    UBYTE enemy_id;
    UBYTE size[2];
    const GameSkill* skill[3];
    UBYTE drop[5];
    UBYTE gold;
    UBYTE experience;
    UBYTE ability_point;
    UINT16 max_health;
    UINT16 max_mana;
    UINT16 strength;
    UINT16 wisdom;
    UINT16 will;
    UINT16 agility;
    UBYTE luck;
    UBYTE phys_def;
    UBYTE magic_def;
    UBYTE enemy_type;

} GameEnemy;

typedef struct GameEnemyDummy
{
    UBYTE enemy_id;
    const GameSkill* skill[3];
    UBYTE gold;
    UBYTE experience;
    UBYTE ability_point;
    UINT16 health;
    UINT16 max_health;
    UINT16 mana;
    UINT16 max_mana;
    UINT16 strength;
    UINT16 wisdom;
    UINT16 will;
    UINT16 agility;
    UBYTE luck;
    UBYTE phys_def;
    UBYTE magic_def;
    UBYTE can_attack;
    UBYTE is_killed;
    UBYTE enemy_type;

} GameEnemyDummy;

extern GameEnemyDummy enemy_dummy_1;
extern GameEnemyDummy enemy_dummy_2;
extern GameEnemyDummy enemy_dummy_3;

extern const GameEnemy enemy_null;
extern const GameEnemy enemy_bee;
extern const GameEnemy enemy_wolf;
extern const GameEnemy enemy_slime;

#endif