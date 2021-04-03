#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Troop.h"

extern const unsigned char Map_Troop_Bee1PLN0;
extern const unsigned char Map_Troop_Bee1PLN1;
extern const unsigned char Map_Troop_Wolf1PLN0;
extern const unsigned char Map_Troop_Wolf1PLN1;
extern const unsigned char Map_Troop_Bee2PLN0;
extern const unsigned char Map_Troop_Bee2PLN1;
extern const unsigned char Map_Troop_Slime1PLN0;
extern const unsigned char Map_Troop_Slime1PLN1;

extern const unsigned char Tiles_Troop_Bee1;
extern const unsigned char Tiles_Troop_Wolf1;
extern const unsigned char Tiles_Troop_Slime1;

/*  Game Troops:  */
const GameTroop troop_bee1 = {0, {1, 0, 0}, &Tiles_Troop_Bee1, &Map_Troop_Bee1PLN0, true};
const GameTroop troop_wolf1 = {1, {2, 0, 0}, &Tiles_Troop_Wolf1, &Map_Troop_Wolf1PLN0, true};
const GameTroop troop_bee2 = {2, {1, 1, 0}, &Tiles_Troop_Bee1, &Map_Troop_Bee2PLN0, true};
const GameTroop troop_slime1 = {3, {3, 0, 0}, &Tiles_Troop_Slime1, &Map_Troop_Slime1PLN0, true};