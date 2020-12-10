#include <gb/gb.h>
#include "Game_Definitions.h"

/*  Game NPCs:  */
const GameNPC npc_test_1 = {0, messenger, 0, 13, 6, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};
const GameNPC npc_test_2 = {1, messenger, 0, 12, 16, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};
const GameNPC npc_plum_shop = {2, shopkeeper, 1, 6, 5, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};
