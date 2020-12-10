#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Character.h"
#include "Game_Map.h"
#include "Game_Tilemap.h"
#include "Game_NPC.h"
#include "Tiles/Tileset_1.c"
#include "Tiles/Tileset_2.c"
#include "Tiles/Tileset_3.c"

UBYTE offset_pos_x = 0, offset_pos_y = 0;

extern UBYTE Tileset;

extern UBYTE CurrentMap, CurrentMapBank;

extern UINT8 camera_x, camera_y;

extern UINT8 map_size_x, map_size_y;

extern UINT16 map_x, map_y, map_y2, load_pos_x, load_pos_y, char_pos_x, char_pos_y;

extern INT8 i, j, k, l, m, n;

extern UINT16 f, g, h;

extern void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

extern void Call_Draw_Map_Load(UBYTE bank, GameMap* map);
extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite);
extern void Call_Draw_Map(UBYTE bank, GameMap* map);
extern void Call_Add_NPC(UBYTE bank, GameCharacter* character, GameNPC* npc);
extern void Call_Reset_NPC(UBYTE bank);
extern void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);
extern void Call_Hide_Char(UBYTE bank, GameCharacter* character);

extern GameMap* Get_Map(UBYTE map_id);

void Orient_Player();
void Orient_Char(GameCharacter* character);

unsigned char sprite_slot[6];

const UWORD Palette_BKG[] =
{
    RGB(13,23,8), RGB(18,26,8), RGB(4,14,6), RGB(0,7,5),
    RGB(13,23,8), RGB(23,23,23), RGB(18,18,18), RGB(9,9,12),
    RGB(13,23,8), RGB(25,20,12), RGB(20,13,6), RGB(12,7,0),
    RGB(30,30,30), RGB(27,27,31), RGB(18,18,18), RGB(2,2,10),
    RGB(10,29,18), RGB(9,20,16), RGB(6,10,12), RGB(2,2,10),
    RGB(30,30,30), RGB(25,20,12), RGB(20,13,6), RGB(12,7,0),
};

const UWORD Palette_Sprite_1[] =
{
    0, RGB(31,31,31), RGB(20,20,20), RGB(0,0,0),
    0, RGB(31,27,21), RGB(14,9,1), RGB(0,0,0),
    0, RGB(31,27,8), RGB(23,10,18), RGB(2,2,10),
    0, RGB(31,27,8), RGB(23,10,18), RGB(2,2,10),  
};

void Clear_Map()
{
    fill_bkg_rect(0, 0, 32, 32, 0);
}

void Load_Tileset(UBYTE tileset)
{
    Tileset = tileset;

    if(tileset == 1)
    {
        set_bkg_tileset(0, 196, Tileset_1);
    }
    else if(tileset == 2)
    {
        set_bkg_tileset(0, 144, Tileset_2);
    }
    else if(tileset == 3)
    {
        set_bkg_tileset(0, 78, Tileset_3);
    }
}

void Load_Map(UINT8 map_id) //* Loads map data into "map" based on the ID given.
{
    if(map_id == 0) //* Plum Village
    {
        map_size_x = map_plum_village.size_x;
        map_size_y = map_plum_village.size_y;

        Load_Tileset(1);
        set_bkg_palette(0, 4, Palette_BKG);

        Call_Add_NPC(bank3, &char_npc_1, &npc_test_1);
        Call_Add_NPC(bank3, &char_npc_2, &npc_test_2);
    }
    else if(map_id == 1) //* Hiro's House
    {
        map_size_x = map_hiro_house.size_x;
        map_size_y = map_hiro_house.size_y;

        Load_Tileset(2);
        set_bkg_palette(0, 4, Palette_BKG);
    }
    else if(map_id == 2) //* Plum Item Shop
    {
        map_size_x = map_plum_item_shop.size_x;
        map_size_y = map_plum_item_shop.size_y;

        Load_Tileset(2);
        set_bkg_palette(0, 4, Palette_BKG);

        Call_Add_NPC(bank3, &char_npc_1, &npc_plum_shop);
    }
    else if(map_id == 3) //* Bud's House
    {
        map_size_x = map_bud_house.size_x;
        map_size_y = map_bud_house.size_y;

        Load_Tileset(2);
        set_bkg_palette(0, 4, Palette_BKG);
    }
    else if(map_id == 4) //* Yggdrid
    {
        map_size_x = map_yggdrid.size_x;
        map_size_y = map_yggdrid.size_y;

        Load_Tileset(3);
        set_bkg_palette(0, 4, Palette_BKG);
    }
}

void Orient_Player() //* Orients player according to map position.
{
    i = 0;
    j = 0;

    if(char_player.pos_x <= 5 && char_player.pos_y <= 5) //* Top Left
    {
        Call_Move_Char(bank3, &char_player, char_player.pos_x * 2 + 1, char_player.pos_y * 2 + 1, 0);
    }
    else if(char_player.pos_x > map_size_x - 5 && char_player.pos_y > map_size_y - 5) //* Bottom Right
    {
        i = map_size_x - char_player.pos_x;
        i = i * 2;
        j = map_size_y - char_player.pos_y;
        j = j * 2;

        Call_Move_Char(bank3, &char_player, 20 - i, 19 - j, 0);
    }
    else if(char_player.pos_x >= map_size_x - 5 && char_player.pos_y <= 5)  //* Top Right
    {
        j = map_size_x - char_player.pos_x;
        j = j * 2;
        i = char_player.pos_y;
        i = i * 2;

        Call_Move_Char(bank3, &char_player, 21 - j, i + 1, 0);
    }
    else if(char_player.pos_x <= 5 && char_player.pos_y >= map_size_y - 5) //* Bottom Left
    {
        j = map_size_y - char_player.pos_y;
        j = j * 2;

        Call_Move_Char(bank3, &char_player, char_player.pos_x * 2 + 1, 19 - j, 0);
    }
    else if(char_player.pos_x < 5 && char_player.pos_y > 5 && char_player.pos_y < map_size_y - 5) //* Middle Left
    {
        Call_Move_Char(bank3, &char_player, char_player.pos_x * 2 + 1, 11, 0);
    }
    else if(char_player.pos_x > 5 && char_player.pos_x < map_size_x - 5 && char_player.pos_y <= 5) //* Middle Top
    {
        j = char_player.pos_y;
        j = j * 2;

        Call_Move_Char(bank3, &char_player, 11, j + 1, 0);
    }
    else if(char_player.pos_x > map_size_x - 5 && char_player.pos_y > 5 && char_player.pos_y < map_size_y - 5) //* Middle Right
    {
        j = map_size_x - char_player.pos_x;
        j = j * 2;

        Call_Move_Char(bank3, &char_player, 21 - j, 10 + 1, 0);
    }
    else if(char_player.pos_x > 5 && char_player.pos_x < map_size_x - 5 && char_player.pos_y > map_size_y - 5) //* Middle Bottom
    {
        j = map_size_y - char_player.pos_y;
        j = j * 2;

        Call_Move_Char(bank3, &char_player, 11, 19 - j, 0);
    }
    else
    {
        Call_Move_Char(bank3, &char_player, 11, 11, 0);
    }
}

void Orient_Char(GameCharacter* character)
{
    if(char_player.pos_x <= 5)
    {
        offset_pos_x = 0;
    }
    else if(char_player.pos_x >= map_size_x - 5)
    {
        offset_pos_x = map_size_x - 5;
    }
    else
    {
        offset_pos_x = char_player.pos_x - 5;
    }

    if(char_player.pos_y <= 5)
    {
        offset_pos_y = 0;
    }
    else if(char_player.pos_y > map_size_y - 5)
    {
        offset_pos_y = map_size_y - 5;
    }
    else
    {
        offset_pos_y = char_player.pos_y - 5;
    }

    j = character->pos_x * 2;
    k = character->pos_y * 2;

    j += 1;
    k += 1;

    offset_pos_x = offset_pos_x * 2;
    offset_pos_y = offset_pos_y * 2;

    Call_Move_Char(bank3, character, j - offset_pos_x, k - offset_pos_y, 0);
}

void Draw_Map(GameMap* map) //* Sets player position relative to the screen, draws first background map.
{
    Clear_Map();

    map_x = 0;
    map_y = 0;
    load_pos_x = 0;
    load_pos_y = 0;

    CurrentMap = map->map_id;
    CurrentMapBank = map->map_bank;

    Call_Reset_NPC(bank3);
    Load_Map(map->map_id);

    Call_Draw_Map_Load(bank3, map);

    Orient_Char(&char_npc_1);
    Orient_Char(&char_npc_2);

    Call_Hide_Char(bank3, &char_npc_1);
    Call_Hide_Char(bank3, &char_npc_2);
    
    Orient_Player();
}

void Reload_Map() //* Reloads map based on "CurrentMap".
{
    move_bkg(0, 0);

    camera_x = 0;
    camera_y = 0;

    map_x = 0;
    map_y = 0;
    load_pos_x = 0;
    load_pos_y = 0;

    Call_Draw_Map_Load(bank3, Get_Map(CurrentMap));

    Orient_Char(&char_npc_1);
    Orient_Char(&char_npc_2);

    Orient_Player();
}

void Draw_Titlescreen(void)
{
}

void Load_Hiro_Tiles(void)
{
    set_sprite_palette(0, 2, Palette_Sprite_1);
}