#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_NPC.h"
#include "Game_Sprite.h"

/*  Game NPCs:  */
const GameNPC npc_test_1 = {0, messenger, 0, &sprite_man_1};
const GameNPC npc_test_2 = {1, messenger, 0, &sprite_man_1};
const GameNPC npc_plum_shop = {2, shopkeeper, 1, &sprite_man_1};

const GameNPC npc_sashi = {3, messenger, 0, &sprite_sashi};

const GameNPC npc_ship = {4, trigger, 1, &sprite_ship};
