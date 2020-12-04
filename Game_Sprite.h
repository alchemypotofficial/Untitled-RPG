#include <gb/gb.h>

#ifndef GAME_SPRITE
#define GAME_SPRITE

typedef struct GameSprite
{
    unsigned char* tiles;

} GameSprite;

typedef struct GameSpritePackage
{
    GameSprite* sprites[20];

} GameSpritePackage;

extern const GameSprite sprite_clear;
extern const GameSprite sprite_hiro_up_0;
extern const GameSprite sprite_hiro_down_0;
extern const GameSprite sprite_hiro_down_1;
extern const GameSprite sprite_hiro_down_2;
extern const GameSprite sprite_hiro_left_0;
extern const GameSprite sprite_hiro_right_0;
extern const GameSprite sprite_man_1;

extern const GameSpritePackage sprite_hiro_up;
extern const GameSpritePackage sprite_hiro_down;
extern const GameSpritePackage sprite_hiro_left;
extern const GameSpritePackage sprite_hiro_right;

#endif