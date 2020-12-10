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

typedef struct GameCharSprite
{
    GameSpritePackage* actor_up;
    GameSpritePackage* actor_down;
    GameSpritePackage* actor_left;
    GameSpritePackage* actor_right;

} GameCharSprite;

extern const GameSprite sprite_clear;

extern const GameSprite sprite_hiro_up_0;
extern const GameSprite sprite_hiro_down_0;
extern const GameSprite sprite_hiro_down_1;
extern const GameSprite sprite_hiro_down_2;
extern const GameSprite sprite_hiro_left_0;
extern const GameSprite sprite_hiro_right_0;

extern const GameSprite sprite_bud_up_0;
extern const GameSprite sprite_bud_down_0;
extern const GameSprite sprite_bud_down_1;
extern const GameSprite sprite_bud_down_2;
extern const GameSprite sprite_bud_left_0;
extern const GameSprite sprite_bud_right_0;

extern const GameSprite sprite_soran_up_0;
extern const GameSprite sprite_soran_down_0;
extern const GameSprite sprite_soran_down_1;
extern const GameSprite sprite_soran_down_2;
extern const GameSprite sprite_soran_left_0;
extern const GameSprite sprite_soran_right_0;

extern const GameSprite sprite_man_up_0;
extern const GameSprite sprite_man_down_0;
extern const GameSprite sprite_man_down_1;
extern const GameSprite sprite_man_down_2;
extern const GameSprite sprite_man_left_0;
extern const GameSprite sprite_man_right_0;

extern const GameSpritePackage sprite_hiro_up;
extern const GameSpritePackage sprite_hiro_down;
extern const GameSpritePackage sprite_hiro_left;
extern const GameSpritePackage sprite_hiro_right;

extern const GameSpritePackage sprite_bud_up;
extern const GameSpritePackage sprite_bud_down;
extern const GameSpritePackage sprite_bud_left;
extern const GameSpritePackage sprite_bud_right;

extern const GameSpritePackage sprite_soran_up;
extern const GameSpritePackage sprite_soran_down;
extern const GameSpritePackage sprite_soran_left;
extern const GameSpritePackage sprite_soran_right;

extern const GameCharSprite sprite_hiro;
extern const GameCharSprite sprite_bud;
extern const GameCharSprite sprite_soran;

#endif