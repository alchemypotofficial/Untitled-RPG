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

extern const unsigned char Tiles_BudBLK0;
extern const unsigned char Tiles_BudBLK1;
extern const unsigned char Tiles_BudBLK2;
extern const unsigned char Tiles_BudBLK3;
extern const unsigned char Tiles_BudBLK4;
extern const unsigned char Tiles_BudBLK5;
extern const unsigned char Tiles_BudBLK6;
extern const unsigned char Tiles_BudBLK7;
extern const unsigned char Tiles_BudBLK8;
extern const unsigned char Tiles_BudBLK9;

extern const unsigned char Tiles_SoranBLK0;
extern const unsigned char Tiles_SoranBLK1;
extern const unsigned char Tiles_SoranBLK2;
extern const unsigned char Tiles_SoranBLK3;
extern const unsigned char Tiles_SoranBLK4;
extern const unsigned char Tiles_SoranBLK5;
extern const unsigned char Tiles_SoranBLK6;
extern const unsigned char Tiles_SoranBLK7;
extern const unsigned char Tiles_SoranBLK8;
extern const unsigned char Tiles_SoranBLK9;

extern const unsigned char Hiro_TilesBLK0;

extern const unsigned char Tiles_Man_1BLK0;
extern const unsigned char Tiles_Man_1BLK1;
extern const unsigned char Tiles_Man_1BLK2;
extern const unsigned char Tiles_Man_1BLK3;
extern const unsigned char Tiles_Man_1BLK4;
extern const unsigned char Tiles_Man_1BLK5;
extern const unsigned char Tiles_Man_1BLK6;
extern const unsigned char Tiles_Man_1BLK7;
extern const unsigned char Tiles_Man_1BLK8;
extern const unsigned char Tiles_Man_1BLK9;
extern const unsigned char Tiles_Man_1BLK10;

/*  Game Sprites:  */
const GameSprite sprite_clear = {&Clear_Tiles};

const GameSprite sprite_hiro_up_0 = {&Hiro_TilesBLK0};
const GameSprite sprite_hiro_down_0 = {&Tiles_HiroBLK0};
const GameSprite sprite_hiro_down_1 = {&Tiles_HiroBLK1};
const GameSprite sprite_hiro_down_2 = {&Tiles_HiroBLK2};
const GameSprite sprite_hiro_left_0 = {&Tiles_HiroBLK3};
const GameSprite sprite_hiro_right_0 = {&Tiles_HiroBLK6};

const GameSprite sprite_bud_up_0 = {&Tiles_BudBLK9};
const GameSprite sprite_bud_down_0 = {&Tiles_BudBLK0};
const GameSprite sprite_bud_down_1 = {&Tiles_BudBLK1};
const GameSprite sprite_bud_down_2 = {&Tiles_BudBLK2};
const GameSprite sprite_bud_left_0 = {&Tiles_BudBLK3};
const GameSprite sprite_bud_right_0 = {&Tiles_BudBLK6};

const GameSprite sprite_soran_up_0 = {&Tiles_SoranBLK9};
const GameSprite sprite_soran_down_0 = {&Tiles_SoranBLK0};
const GameSprite sprite_soran_down_1 = {&Tiles_SoranBLK1};
const GameSprite sprite_soran_down_2 = {&Tiles_SoranBLK2};
const GameSprite sprite_soran_left_0 = {&Tiles_SoranBLK3};
const GameSprite sprite_soran_right_0 = {&Tiles_SoranBLK6};

const GameSprite sprite_man_1_up_0 = {&Tiles_Man_1BLK9};
const GameSprite sprite_man_1_down_0 = {&Tiles_Man_1BLK0};
const GameSprite sprite_man_1_down_1 = {&Tiles_Man_1BLK1};
const GameSprite sprite_man_1_down_2 = {&Tiles_Man_1BLK2};
const GameSprite sprite_man_1_left_0 = {&Tiles_Man_1BLK3};
const GameSprite sprite_man_1_right_0 = {&Tiles_Man_1BLK6};

/*  Game Sprite Packages:  */
const GameSpritePackage sprite_hiro_up = {{&sprite_hiro_up_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_hiro_down = {{&sprite_hiro_down_0, &sprite_hiro_down_1, &sprite_hiro_down_2, &sprite_clear}};
const GameSpritePackage sprite_hiro_left = {{&sprite_hiro_left_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_hiro_right = {{&sprite_hiro_right_0, &sprite_clear, &sprite_clear, &sprite_clear}};

const GameSpritePackage sprite_bud_up = {{&sprite_bud_up_0, &sprite_clear}};
const GameSpritePackage sprite_bud_down = {{&sprite_bud_down_0, &sprite_clear}};
const GameSpritePackage sprite_bud_left = {{&sprite_bud_left_0, &sprite_clear}};
const GameSpritePackage sprite_bud_right = {{&sprite_bud_right_0, &sprite_clear}};

const GameSpritePackage sprite_soran_up = {{&sprite_soran_up_0, &sprite_clear}};
const GameSpritePackage sprite_soran_down = {{&sprite_soran_down_0, &sprite_clear}};
const GameSpritePackage sprite_soran_left = {{&sprite_soran_left_0, &sprite_clear}};
const GameSpritePackage sprite_soran_right = {{&sprite_soran_right_0, &sprite_clear}};

const GameSpritePackage sprite_man_1_up = {{&sprite_man_1_up_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_man_1_down = {{&sprite_man_1_down_0, &sprite_man_1_down_1, &sprite_man_1_down_2, &sprite_clear}};
const GameSpritePackage sprite_man_1_left = {{&sprite_man_1_left_0, &sprite_clear, &sprite_clear, &sprite_clear}};
const GameSpritePackage sprite_man_1_right = {{&sprite_man_1_right_0, &sprite_clear, &sprite_clear, &sprite_clear}};

/*  Game Actor Sprite Packages:  */
const GameCharSprite sprite_hiro = {&sprite_hiro_up, &sprite_hiro_down, &sprite_hiro_left, &sprite_hiro_right};
const GameCharSprite sprite_bud = {&sprite_bud_up, &sprite_bud_down, &sprite_bud_left, &sprite_bud_right};
const GameCharSprite sprite_soran = {&sprite_soran_up, &sprite_soran_down, &sprite_soran_left, &sprite_soran_right};

const GameCharSprite sprite_man_1 = {&sprite_man_1_up, &sprite_man_1_down, &sprite_man_1_left, &sprite_man_1_right};