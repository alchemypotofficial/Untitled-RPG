#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Map.h"
#include "Game_Character.h"
#include "Game_Tilemap.h"
#include "Maps/Map_Hiro_House.c"
#include "Maps/Map_Plum_Item_Shop.c"
#include "Maps/Map_Bud_House.c"

extern UBYTE Tileset;

extern UBYTE offset_pos_x, offset_pos_y;

extern UBYTE tile_offset_x, tile_offset_y;

extern UBYTE starting_x, starting_y;

extern UINT16 grid_x, grid_y, tile;

extern UINT8 camera_x, camera_y;

extern UINT8 map_size_x, map_size_y;

extern UINT16 map_x, map_y, load_pos_y_held, map_pos, map_y2, load_pos_x, load_pos_y;

extern INT8 i, j, k, l, m, n;

extern UINT16 f, g, h;

extern void performant_delay(UBYTE num_loops);

extern void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);

extern const unsigned char Tileset_1_Map[60][4];

extern const unsigned char Tileset_2_Map[60][4];

extern const unsigned char Tileset_3_Map[60][4];

void Draw_Tile_At9(UBYTE tile_x, UBYTE tile_y, UBYTE tile_num)
{
    if(starting_x <= 5)
    {
        offset_pos_x = 0;
    }
    else if(starting_x >= map_size_x - 5)
    {
        offset_pos_x = map_size_x - 10;
    }
    else
    {
        offset_pos_x = starting_x - 5;
    }

    if(starting_y <= 5)
    {
        offset_pos_y = 0;
    }
    else if(starting_y > map_size_y - 5)
    {
        offset_pos_y = map_size_y - 9;
    }
    else
    {
        offset_pos_y = starting_y - 5;
    }

    tile_x = tile_x * 2;
    tile_y = tile_y * 2;

    offset_pos_x = offset_pos_x * 2;
    offset_pos_y = offset_pos_y * 2;

    tile_offset_x = tile_x - offset_pos_x;
    if(tile_offset_x >= 32){tile_offset_x = tile_offset_x % 32;}

    tile_offset_y = tile_y - offset_pos_y;
    if(tile_offset_y >= 32){tile_offset_y = tile_offset_y % 32;}

    switch(Tileset)
    {
        case 1:
            set_bkg_tiles(tile_offset_x, tile_offset_y, 2, 2, Tileset_1_Map[tile_num]);
            break;
        case 2:
            set_bkg_tiles(tile_offset_x, tile_offset_y, 2, 2, Tileset_2_Map[tile_num]);
            break;
        case 3:
            set_bkg_tiles(tile_offset_x, tile_offset_y, 2, 2, Tileset_3_Map[tile_num]);
            break;
        default:
            set_bkg_tiles(tile_offset_x, tile_offset_y, 2, 2, Tileset_1_Map[tile_num]);
            break;
    }
}

void Draw_Tile9(UINT16 tile_x, UINT16 tile_y, UBYTE tile_num)
{
    switch(Tileset)
    {
        case 1:
            set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
            break;
        case 2:
            set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_2_Map[tile_num]);
            break;
        case 3:
            set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_3_Map[tile_num]);
            break;
        default:
            set_bkg_tiles(tile_x, tile_y, 2, 2, Tileset_1_Map[tile_num]);
            break;
    }
}

void Draw_Map_Bank9(const GameMap* map) //* Draws map tiles.
{
    if(char_player.pos_x <= 5)
    {
        map_x = 0;
    }
    else if(char_player.pos_x >= map_size_x - 5)
    {
        map_x = map_size_x - 10;
    }
    else
    {
        map_x = char_player.pos_x - 5;
    }

    if(char_player.pos_y <= 5)
    {
        map_y = 0;
    }
    else if(char_player.pos_y > map_size_y - 5)
    {
        for(i = 0; i != map_size_y - 9; i++)
        {
            map_y += map_size_x;
        }
    }
    else
    {
        for(i = 0; i < char_player.pos_y - 5; i++)
        {
            map_y += map_size_x;
        }
    }

    k = 0;

    for(i = 0; i < 18; i += 2)
    {
        performant_delay(1);

        for(j = 0; j < 20; j += 2)
        {
            Draw_Tile9(0 + j, 0 + i, map->data[map_x + map_y + k]);
            k += 1;
        }

        k = 0;

        map_y += map_size_x;
    }
}

void Draw_Line_Bank9(const GameMap* map, UBYTE direction) //* Draws verticle/horizontal line of map tiles.
{
    map_x = 0;
    map_y = 0;
    load_pos_x = 0;
    load_pos_y = 0;

    if(direction == right && char_player.pos_x <= map_size_x - 5)
    {
        load_pos_x = camera_x + 20;
        if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}

        load_pos_y = camera_y;
        if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}

        map_x = char_player.pos_x + 5;

        if(char_player.pos_y <= 5)
        {
            map_y = 0;
        }
        else if(char_player.pos_y >= map_size_y - 4)
        {
            g = map_size_y - 9;
            map_y = g * map_size_x;
        }
        else
        {
            g = char_player.pos_y - 5;
            map_y = g * map_size_x;
        }
        
        if(camera_y + 18 > 31)
        {
            map_pos = map_x + map_y;

            for(i = 0; i < 32 - camera_y; i += 2)
            {
                Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
                map_pos += map_size_x;
            }

            for(i = 0; i < camera_y - 14; i += 2)
            {
                Draw_Tile9(load_pos_x, i, map->data[map_pos]);
                map_pos += map_size_x;
            }
        }
        else
        {
            map_pos = map_x + map_y;

            for(i = 0; i < 18; i += 2)
            {
                Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
                map_pos += map_size_x;
            }
        }
    }

    else if(direction == left && char_player.pos_x >= 5)
    {
        if(camera_x == 0){load_pos_x = 30;}
        else{load_pos_x = camera_x - 2;}
        
        load_pos_y = camera_y;
        if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}

        map_x = char_player.pos_x - 6;

        if(char_player.pos_y <= 5)
        {
            map_y = 0;
        }
        else if(char_player.pos_y >= map_size_y - 4)
        {
            g = map_size_y - 9;
            map_y = g * map_size_x;
        }
        else
        {
            g = char_player.pos_y - 5;
            map_y = g * map_size_x;
        }

        if(camera_y + 18 > 31)
        {
            for(i = 0; i < 32 - camera_y; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
                map_y += map_size_x;
            }

            for(i = 0; i < camera_y - 14; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x, i, map->data[map_pos]);
                map_y += map_size_x;
            }
        }
        else
        {
            for(i = 0; i != 18; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x, load_pos_y + i, map->data[map_pos]);
                map_y += map_size_x;
            }
        }
    }

    else if(direction == down && char_player.pos_y <= map_size_y - 4)
    {
        load_pos_x = camera_x;
        if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}

        load_pos_y = camera_y + 18;
        if(load_pos_y >= 32){load_pos_y = load_pos_y - 32;}
        
        if(char_player.pos_x <= 5)
        {
            map_x = 0;
        }
        else if(char_player.pos_x >= map_size_x - 5)
        {
            map_x = map_size_x - 10;
        }
        else
        {
            map_x = char_player.pos_x - 5;
        }

        for(i = char_player.pos_y + 4; i != 0; i--)
        {
            map_y += map_size_x;
        }
        
        if(camera_x + 20 > 31)
        {
            for(i = 0; i != 32 - camera_x; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }

            for(i = 0; i != camera_x - 12; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }
        }
        else
        {
            for(i = 0; i < 20; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }
        }
    }

    else if(direction == up && char_player.pos_y >= 5)
    {
        load_pos_x = camera_x;
        if(load_pos_x >= 32){load_pos_x = load_pos_x - 32;}

        if(camera_y == 0){load_pos_y = 30;}
        else{load_pos_y = camera_y - 2;}

        if(char_player.pos_x <= 5)
        {
            map_x = 0;
        }
        else if(char_player.pos_x >= map_size_x - 5)
        {
            map_x = map_size_x - 10;
        }
        else
        {
            map_x = char_player.pos_x - 5;
        }

        for(i = char_player.pos_y - 6; i != 0; i--)
        {
            map_y = map_y + map_size_x;
        }

        if(camera_x + 20 > 31)
        {
            for(i = 0; i != 32 - camera_x; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }

            for(i = 0; i != camera_x - 12; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }
        }
        else
        {
            for(i = 0; i != 20; i += 2)
            {
                map_pos = map_x + map_y;
                Draw_Tile9(load_pos_x + i, load_pos_y, map->data[map_pos]);
                map_x += 1;
            }
        }
    }
}

UBYTE Check_Tile_Collision_Bank9(const GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y)
{
    grid_x = character->pos_x + move_x;
    grid_y = character->pos_y + move_y;
    tile = map->data[(grid_y * map_size_x) + grid_x];
    
    if(Tileset == 1)
    {
        return tilemap_1[tile];
    }
    if(Tileset == 2)
    {
        return tilemap_2[tile];
    }
    else
    {
        return 0x00;
    }
}
