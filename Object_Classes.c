#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Class.h"

const unsigned char name_knight[3] = {0x45, 0x48, 0x4E};
const unsigned char name_traveler[3] = {0x4E, 0x50, 0x4C};
const unsigned char name_white_mage[3] = {0x51, 0x47, 0x41};
const unsigned char name_black_mage[3] = {0x3C, 0x47, 0x41};

/*  Game Classes:  */
const GameClass class_traveler = {name_traveler, icon_null, name_traveler, 0};
const GameClass class_knight = {name_knight, icon_sword, name_knight, 1};
const GameClass class_white_mage = {name_white_mage, icon_staff, name_white_mage, 2};
const GameClass class_black_mage = {name_black_mage, icon_rod, name_black_mage, 3};