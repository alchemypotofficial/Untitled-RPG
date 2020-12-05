#include <gb/gb.h>
#include "Game_Definitions.h"

extern const unsigned char Clear_Tiles;
extern const unsigned char Tiles_HiroBLK0;
extern const unsigned char Tiles_HiroBLK1;
extern const unsigned char Tiles_HiroBLK2;
extern const unsigned char Tiles_HiroBLK3;
extern const unsigned char Tiles_HiroBLK4;
extern const unsigned char Tiles_HiroBLK5;
extern const unsigned char Tiles_HiroBLK6;
extern const unsigned char Tiles_HiroBLK7;
extern const unsigned char Tiles_HiroBLK8;
extern const unsigned char Hiro_TilesBLK0;
extern const unsigned char Tiles_Man_1BLK0;

/*  Game Sprites:  */
const GameSprite sprite_clear = {&Clear_Tiles};
const GameSprite sprite_hiro_up_0 = {&Hiro_TilesBLK0};
const GameSprite sprite_hiro_down_0 = {&Tiles_HiroBLK0};
const GameSprite sprite_hiro_down_1 = {&Tiles_HiroBLK1};
const GameSprite sprite_hiro_down_2 = {&Tiles_HiroBLK2};
const GameSprite sprite_hiro_left_0 = {&Tiles_HiroBLK3};
const GameSprite sprite_hiro_right_0 = {&Tiles_HiroBLK6};
const GameSprite sprite_man_1 = {&Tiles_Man_1BLK0};

/*  Game Sprite Packages:  */
const GameSpritePackage sprite_hiro_up = {{&sprite_hiro_up_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_hiro_down = {{&sprite_hiro_down_0, &sprite_hiro_down_1, &sprite_hiro_down_2, &sprite_clear}};
const GameSpritePackage sprite_hiro_left = {{&sprite_hiro_left_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_hiro_right = {{&sprite_hiro_right_0, &sprite_clear, &sprite_clear, &sprite_clear}};

const GameSpritePackage sprite_man_down = {{&sprite_man_1, &sprite_clear, &sprite_clear, &sprite_clear}};
