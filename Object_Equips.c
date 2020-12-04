#include <gb/gb.h>
#include "Game_Definitions.h"

const unsigned char icon_null[1] = {0x01};
const unsigned char icon_sword[1] = {0x6E};
const unsigned char icon_staff[1] = {0x6F};
const unsigned char icon_rod[1] = {0x76};

const unsigned char icon_shield[1] = {0x70};
const unsigned char icon_armor[1] = {0x71};
const unsigned char icon_necklace[1] = {0x74};
const unsigned char icon_coin[1] = {0x75};

const unsigned char name_equip_null[7] = {0x01, 0x57, 0x57, 0x57, 0x57, 0x57, 0x01};

const unsigned char name_wooden_sword[7] = {0x51, 0x55, 0x4D, 0x2D, 0x24, 0x27, 0x19};
const unsigned char name_wooden_staff[7] = {0x51, 0x55, 0x4D, 0x2A, 0x16, 0x1B, 0x1B};

const unsigned char name_metal_rod[7] = {0x47, 0x55, 0x4C, 0x24, 0x19, 0x01, 0x01};
const unsigned char name_mythril_rod[7] = {0x47, 0x2F, 0x55, 0x4C, 0x24, 0x19, 0x01};
const unsigned char name_rod_of_spark[7] = {0x4D, 0x25, 0x55, 0x4C, 0x24, 0x19, 0x01};

const unsigned char name_hoplon[7] = {0x42, 0x24, 0x25, 0x21, 0x24, 0x23, 0x01};
const unsigned char name_cotton_garb[7] = {0x3D, 0x55, 0x41, 0x16, 0x27, 0x17, 0x01};
const unsigned char name_copper_bracelet[7] = {0x3D, 0x55, 0x3C, 0x27, 0x16, 0x18, 0x1A};

extern const unsigned char Null_Equip_Description;
extern const unsigned char Wooden_Sword_Description;

/*  Game Equips:  */
const GameEquip equip_null = {name_equip_null, icon_null, Null_Equip_Description, 0, none, traveler, 0, 0, 0, 0, 0, 0, 0, 0, 0};

/*--------------------------------------------*/ // 1-20

const GameEquip equip_wooden_sword = {name_wooden_sword, icon_sword, Wooden_Sword_Description, 1, weapon, knight, 1, 0, 0, 0, 0, 0, 0, 3, 75};

/*--------------------------------------------*/ // 21-40

const GameEquip equip_wooden_staff = {name_wooden_staff, icon_staff, Null_Equip_Description, 21, weapon, white_mage, 0, 0, 1, 0, 0, 0, 0, 0, 75};

/*--------------------------------------------*/ // 41-60

const GameEquip equip_metal_rod = {name_metal_rod, icon_rod, Null_Equip_Description, 41, weapon, black_mage, 0, 0, 1, 0, 0, 0, 0, 43, 75};

const GameEquip equip_mythril_rod = {name_mythril_rod, icon_rod, Null_Equip_Description, 43, weapon, black_mage, 0, 0, 1, 0, 0, 0, 0, 0, 75};

const GameEquip equip_rod_of_spark = {name_rod_of_spark, icon_rod, Null_Equip_Description, 45, weapon, black_mage, 0, 0, 1, 0, 0, 0, 0, 44, 75};

/*--------------------------------------------*/ // 61-80

const GameEquip equip_hoplon = {name_hoplon, icon_shield, Null_Equip_Description, 61, secondary, traveler, 0, 0, 0, 0, 0, 1, 0, 0, 75};

/*--------------------------------------------*/ // 81-100

const GameEquip equip_cotton_garb = {name_cotton_garb, icon_armor, Null_Equip_Description, 81, armor, traveler, 0, 0, 0, 0, 0, 1, 1, 0, 75};

/*--------------------------------------------*/ // 101-120

const GameEquip equip_copper_bracelet = {name_copper_bracelet, icon_necklace, Null_Equip_Description, 101, accessory, traveler, 0, 1, 0, 0, 0, 1, 0, 0, 75};