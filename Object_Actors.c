#include <gb/gb.h>
#include "Game_Definitions.h"

/*  Game Actors:  */
GameActor actor_null;

GameActor actor_hiro = {name_hiro, 4, 1, 1, 0, 15, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, {0, 0, 0, 0}, true, true, {3, 0}};
GameActor actor_bud = {name_bud, 3, 2, 1, 0, 16, 16, 0, 0, 0, 0, 0, 5, 0, 0, 0, 1, {0, 0, 0, 0}, true, true, {3, 1}};
GameActor actor_soran = {name_soran, 5, 3, 1, 0, 14, 14, 5, 5, 0, 0, 0, 3, 0, 0, 0, 2, {0, 0, 0, 0}, true, true, {3, 1}};