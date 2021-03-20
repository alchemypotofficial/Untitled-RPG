#include <gb/gb.h>
#include "Game_Definitions.h"

/*  Game NPCs:  */
const GameNPC npc_test_1 = {0, messenger, 0, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};
const GameNPC npc_test_2 = {1, messenger, 0, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};
const GameNPC npc_plum_shop = {2, shopkeeper, 1, &sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};

const GameNPC npc_sashi = {0, messenger, 0, &sprite_sashi_up, &sprite_sashi_down, &sprite_sashi_left, &sprite_sashi_right};
