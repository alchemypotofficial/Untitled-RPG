#include <gb/gb.h>
#include "Game_Character.h"
#include "Game_Definitions.h"

/*  Game Characters:  */
GameCharacter char_cursor;

GameCharacter char_player = {true, messenger, 0, 0, {0, 20}};

GameCharacter char_npc_1 = {false, messenger, 0, 6, {4, 22}};
GameCharacter char_npc_2 = {false, messenger, 0, 12, {8, 24}};
GameCharacter char_npc_3 = {false, messenger, 0, 18, {12, 26}};
GameCharacter char_npc_4;