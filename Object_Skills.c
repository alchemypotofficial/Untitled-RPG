#include <gb/gb.h>
#include "Game_Skill.h"
#include "Game_Definitions.h"

const unsigned char name_skill_null[8] = {0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
const unsigned char name_hit[8] = {0x42, 0x1E, 0x2A, 0x01, 0x01, 0x01, 0x01, 0x01};

const unsigned char name_reckless_charge[8] = {0x4C, 0x55, 0x3D, 0x1D, 0x16, 0x27, 0x1C, 0x1A};

const unsigned char name_cure[8] = {0x3D, 0x2B, 0x27, 0x1A, 0x01, 0x01, 0x01, 0x01};

const unsigned char name_fireball[8] = {0x40, 0x1E, 0x27, 0x1A, 0x17, 0x16, 0x21, 0x21};
const unsigned char name_thunder[8] = {0x4E, 0x1D, 0x2B, 0x23, 0x19, 0x1A, 0x27, 0x01};
const unsigned char name_blizzard[8] = {0x3C, 0x21, 0x1E, 0x30, 0x30, 0x16, 0x27, 0x19};

const unsigned char message_hit[14] = {0x16, 0x2A, 0x2A, 0x16, 0x18, 0x20, 0x1A, 0x19, 0x01};
const unsigned char message_magic[14] = {0x18, 0x16, 0x29, 0x2A, 0x29, 0x01};
const unsigned char message_ability[14] = {0x2B, 0x29, 0x1A, 0x29, 0x01};

/*  Game Skills:  */
const GameSkill skill_null = {name_skill_null, 0, message_hit, 0, 0, 0, damaging, physical, false, target_enemy, 0, false, traveler};

const GameSkill skill_hit = {name_hit, 3, message_hit, 9, 1, 0, damaging, physical, false, target_enemy, 0, false, traveler};
const GameSkill skill_use_item = {name_hit, 3, name_hit, 4, 2, 0, item_use, physical, false, target_enemy, 0, false, traveler};

/*--------------------------------------------*/ // 3-22

const GameSkill skill_reckless_charge = {name_reckless_charge, 8, message_ability, 4, 3, 3, damaging, physical, true, target_enemy, 10, false, knight};

/*--------------------------------------------*/ // 23-42

const GameSkill skill_cure = {name_cure, 4, message_magic, 5, 23, 3, damaging, light, true, target_actor, 10, true, white_mage};

/*--------------------------------------------*/ // 43-62

const GameSkill skill_fireball = {name_fireball, 8, message_magic, 5, 43, 3, damaging, fire, true, target_enemy, 10, false, black_mage};
const GameSkill skill_thunder = {name_thunder, 7, message_magic, 5, 44, 5, damaging, lightning, true, target_enemy, 10, false, black_mage};
const GameSkill skill_blizzard = {name_blizzard, 8, message_magic, 5, 45, 3, damaging, water, true, target_enemy, 10, false, black_mage};