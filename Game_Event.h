#include <gb/gb.h>
#include "Game_Shop.h"

#ifndef GAME_EVENT
#define GAME_EVENT

typedef struct GameEvent
{
    UINT8 event_id[100];
    UINT8 map_id[100];
    UINT8 pos_x[100];
    UINT8 pos_y[100];
    UINT8 direction[100];
    UINT8 used[100];
    UINT8 content_id[100];
    UINT8 message_id[100];
    
} GameEvent;

typedef struct GameTele
{
    UBYTE event_id;
    UBYTE map_id;
    UBYTE pos_x;
    UBYTE pos_y;
    UBYTE direction;
    UBYTE tele_id;

} GameTele;

typedef struct GameSign
{
    UBYTE event_id;
    UBYTE pos_x;
    UBYTE pos_y;
    UBYTE message_id;

} GameSign;

typedef struct GameShopkeeper
{
    UBYTE event_id;
    UBYTE pos_x;
    UBYTE pos_y;
    GameShop* shop;
} GameShopkeeper;

typedef struct GameTrigger
{
    UBYTE event_id;
    UBYTE pos_1[2];
    UBYTE pos_2[2];
    UBYTE scene_id;

} GameTrigger;

extern GameEvent event_chest;

extern const GameSign sign_null;
extern const GameSign sign_plum_gravestone;
extern const GameSign sign_test;

extern const GameTele tele_null;
extern const GameTele tele_plum_hiro;
extern const GameTele tele_hiro_plum;
extern const GameTele tele_plum_bud;
extern const GameTele tele_bud_plum;
extern const GameTele tele_plum_yggdrid;
extern const GameTele tele_yggdrid_plum;
extern const GameTele tele_plum_item_shop;
extern const GameTele tele_item_shop_plum;

extern const GameTrigger trigger_null;
extern const GameTrigger trigger_test;

extern const GameShopkeeper shopkeeper_null;
extern const GameShopkeeper shopkeeper_plum_item;

#endif