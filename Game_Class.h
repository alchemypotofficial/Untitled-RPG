#include <gb/gb.h>
#include "Game_Definitions.h"

#ifndef GAME_CLASS
#define GAME_CLASS

typedef struct GameClass
{
    unsigned char *name;
    unsigned char *icon;
    unsigned char *description;
    UBYTE class_id;

} GameClass;

extern const GameClass class_traveler;
extern const GameClass class_knight;
extern const GameClass class_white_mage;

#endif