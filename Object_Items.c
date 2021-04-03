#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Item.h"

const unsigned char name_item_null[6] = {0x01, 0x57, 0x57, 0x57, 0x57, 0x57};
const unsigned char full_name_item_null[12] = {0x01, 0x57, 0x57, 0x57, 0x57, 0x57, 0x57, 0x57, 0x57, 0x01, 0x01, 0x01};
const unsigned char name_healing_brew[6] = {0x42, 0x55, 0x3C, 0x27, 0x1A, 0x2D};
const unsigned char full_name_healing_brew[12] = {0x42, 0x1A, 0x16, 0x21, 0x2A, 0x1D, 0x01, 0x3C, 0x27, 0x1A, 0x2D, 0x01};
const unsigned char name_life_leaf[6] = {0x46, 0x55, 0x46, 0x1A, 0x16, 0x1B};
const unsigned char name_mana_brew[6] = {0x47, 0x55, 0x3C, 0x27, 0x1A, 0x2D};

extern const unsigned char Null_Item_Description;
extern const unsigned char Healing_Brew_Description;
extern const unsigned char Mana_Brew_Description;


/*  Game Items:  */
const GameItem item_null = {name_item_null, full_name_item_null, Null_Item_Description, 0, none, 0, 0, false};
const GameItem item_healing_brew = {name_healing_brew, full_name_healing_brew, Healing_Brew_Description, 1, health_recovery, 5, 1, true};
const GameItem item_life_leaf = {name_life_leaf, full_name_healing_brew, Healing_Brew_Description, 2, status_death, 300, true};
const GameItem item_mana_brew = {name_mana_brew, full_name_healing_brew, Mana_Brew_Description, 3, mana_recovery, 500, true};