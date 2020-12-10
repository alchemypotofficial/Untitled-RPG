#include <gb/gb.h>
#include "Game_Sprite.h"

#ifndef GAME_ACTOR
#define GAME_ACTOR

typedef struct GameActor
{
    unsigned char *name;
    UBYTE length;
    UBYTE actor_id;
    const GameCharSprite *sprites;
    UINT16 level;
    UBYTE class;
    UINT16 health;
    UINT16 max_health;
    UINT16 mana;
    UINT16 max_mana;
    UINT16 strength;
    UINT16 wisdom;
    UINT16 will;
    UINT16 agility;
    UINT16 phys_def;
    UINT16 magic_def;
    UINT16 experience;
    UBYTE party_slot;
    UBYTE equipped[4];
    UBYTE active_member;
    UBYTE can_attack;
    UBYTE skills[10];
    UBYTE skill_ap[120];

} GameActor;

extern GameActor actor_null;
extern GameActor actor_hiro;
extern GameActor actor_bud;
extern GameActor actor_soran;

#endif