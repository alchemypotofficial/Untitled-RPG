#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Event.h"
#include "Game_Message.h"

/*  Game Events:  */
const GameChest chest_null = {0, 0, 0, 0, &message_test, 0};
const GameChest chest_hiro_house = {1, 5, 5, 0, &message_obtain_health_brew, 1};
const GameChest chest_plum_village = {2, 26, 5, 1, &message_obtain_health_brew, 2};

const GameSign sign_null = {0, 0, 0, 0};
const GameSign sign_plum_gravestone = {1, 2, 3, 1};
const GameSign sign_test = {2, 9, 8, 1};

const GameTele tele_null = {0, 0, 0, 0, up, 0};
const GameTele tele_plum_hiro = {1, 0, 6, 4, down, 2};
const GameTele tele_hiro_plum = {2, 1, 6, 9, up, 1};
const GameTele tele_plum_bud = {3, 0, 16, 5, down, 4};
const GameTele tele_bud_plum = {4, 3, 6, 9, up, 3};
const GameTele tele_plum_yggdrid = {5, 0, 6, 31, up, 6};
const GameTele tele_yggdrid_plum = {6, 4, 113, 214, down, 5};
const GameTele tele_plum_item_shop = {7, 0, 9, 24, down, 8};
const GameTele tele_item_shop_plum = {8, 2, 6, 9, up, 7};

const GameTrigger trigger_null = {0, {0, 0}, {0, 0}, 0};
const GameTrigger trigger_test = {1, {16, 20}, {16, 20}, 0};

const GameShopkeeper shopkeeper_null = {0, 0, 0, 0};
const GameShopkeeper shopkeeper_plum_item = {1, 6, 6, &shop_test};