#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Enemy.h"
#include "Game_Skill.h"

const unsigned char name_bee[] = {0x3C, 0x1A, 0x1A, 0x01, 0x01, 0x01, 0x01};
const unsigned char name_wolf[] = {0x51, 0x24, 0x21, 0x1B, 0x01, 0x01, 0x01};

/*  Game Enemies:  */
const GameEnemy enemy_null = {name_bee, 0, name_bee, 0, {0, 0}, {&skill_null, &skill_null, &skill_null}, {0, 0, 0, 0, 0}, 0, 0, 0, 0, 0, 0, 0, 0, 1, normal};

const GameEnemy enemy_bee = {name_bee, 3, name_bee, 1, {4, 4}, {&skill_hit, &skill_hit, &skill_hit}, {1, 0, 0, 0, 0}, 3, 5, 3, 9, 0, 0, 0, 0, 1, normal};
const GameEnemy enemy_wolf = {name_wolf, 4, name_bee, 2, {6, 4}, {&skill_hit, &skill_hit, &skill_hit}, {1, 0, 0, 0, 0}, 5, 8, 2, 15, 0, 0, 0, 0, 1, normal};
const GameEnemy enemy_slime = {name_bee, 3, name_bee, 3, {4, 4}, {&skill_hit, &skill_hit, &skill_hit}, {1, 0, 0, 0, 0}, 8, 12, 3, 20, 0, 0, 0, 0, 1, undead};