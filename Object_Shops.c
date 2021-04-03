#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Shop.h"

extern unsigned char Message_Shop_PlumItemPLN0;

/*  Game Shops:  */
const GameShop shop_test = {0, equip_shop, {1, 21, 41, 43, 45, 61, 81, 101, 0, 0}, &Message_Shop_PlumItemPLN0};
const GameShop shop_plumvillage_item = {1, item_shop, {1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, &Message_Shop_PlumItemPLN0};