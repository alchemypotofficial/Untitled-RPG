#include <gb/gb.h>
#include "Game_Definitions.h"

/*  Game NPCs:  */
const GameNPC npc_test_1 = {0, messenger, 0, 13, 6, &sprite_hiro_up, &sprite_man_down, &sprite_hiro_left, &sprite_hiro_right};
const GameNPC npc_test_2 = {1, messenger, 0, 12, 16, &sprite_hiro_up, &sprite_man_down, &sprite_hiro_left, &sprite_hiro_right};
const GameNPC npc_plum_shop = {2, shopkeeper, 1, 6, 5, &sprite_hiro_up, &sprite_man_down, &sprite_hiro_left, &sprite_hiro_right};
