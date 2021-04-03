#include <gb/gb.h>

#ifndef GAME_TROOP
#define GAME_TROOP

typedef struct GameTroop
{
    UBYTE troop_id;
    UBYTE enemy_slot[3];
    unsigned char* tiles;
    unsigned char* data;
    UBYTE escapable;
} GameTroop;

typedef struct GameBattle
{
    const GameTroop* troop;
    UBYTE percentage;

} GameBattle;

extern const GameTroop troop_bee1;
extern const GameTroop troop_wolf1;
extern const GameTroop troop_bee2;
extern const GameTroop troop_slime1;

#endif