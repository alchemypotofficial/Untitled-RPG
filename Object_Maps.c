#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Map.h"
#include "Game_Troop.h"

extern const unsigned char Map_PlumVillagePLN0;
extern const unsigned char Map_Hiro_HousePLN0;
extern const unsigned char Map_Plum_Item_ShopPLN0;
extern const unsigned char Map_Bud_HousePLN0;
extern const unsigned char Map_Yggdrid;

/*  Game Maps:  */
const GameMap map_plum_village = {0, bank8, 32, 32, &Map_PlumVillagePLN0, false, {{&troop_slime1, 50}, {&troop_bee1, 50}}, {1, 3, 5, 7}, {1, 2}, {&chest_plum_village}, {&trigger_null}, {&shopkeeper_null}};
const GameMap map_hiro_house = {1, bank9, 14, 14, &Map_Hiro_HousePLN0, false, {{&troop_bee1, 100}}, {2, 0}, {0, 0}, {&chest_hiro_house}, {&trigger_null}, {&shopkeeper_null}};
const GameMap map_plum_item_shop = {2, bank9, 14, 14, &Map_Plum_Item_ShopPLN0, false, {{&troop_bee1, 100}}, {8, 0}, {0, 0}, {&chest_null}, {&trigger_null}, {&shopkeeper_plum_item}};
const GameMap map_bud_house = {3, bank9, 14, 14, &Map_Bud_HousePLN0, false, {{&troop_bee1, 100}}, {4, 0}, {0, 0}, {&chest_null}, {&trigger_null}, {&shopkeeper_null}};
const GameMap map_yggdrid = {4, bank18, 255, 255, &Map_Yggdrid, false, {{&troop_bee1, 100}}, {6, 0}, {0, 0}, {&chest_null}, {&trigger_null}, {&shopkeeper_null}};
