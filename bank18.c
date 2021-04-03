#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Map.h"
#include "Game_Character.h"
#include "Game_Tilemap.h"
#include "Maps/Map_Yggdrid.c"

extern UBYTE Tileset;

extern UBYTE offset_pos_x, offset_pos_y;

extern UBYTE tile_offset_x, tile_offset_y;

extern UBYTE starting_x, starting_y;

extern UINT16 grid_x, grid_y, tile;

extern UBYTE camera_x, camera_y, base_byte, count_byte;

extern UINT8 map_size_x, map_size_y;

extern UINT16 map_x, map_y, load_pos_y_held, map_pos, map_y2, load_pos_x, load_pos_y;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y, u_i, u_j, u_l, u_k;

extern UINT16 f, g, h;

extern void performant_delay(UBYTE num_loops);

extern const unsigned char Tileset_1_Map[60][4];

extern const unsigned char Tileset_2_Map[60][4];

extern const unsigned char Tileset_3_Map[60][4];

void Draw_Tile_At18(UBYTE tile_x, UBYTE tile_y, UBYTE tile_num)
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

void Draw_Tile18(UINT16 tile_x, UINT16 tile_y, UBYTE tile_num)
{
    switch (Tileset)
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

void Draw_Map_Bank18(const GameMap *map) //* Draws map tiles.
{
    if (char_player.pos_x <= 5)
    {
        u_x = 0;
    }
    else if (char_player.pos_x >= map_size_x - 5)
    {
        u_x = map_size_x - 10;
    }
    else
    {
        u_x = char_player.pos_x - 5;
    }

    if (char_player.pos_y <= 5)
    {
        u_y = 0;
    }
    else if (char_player.pos_y > map_size_y - 5)
    {
        u_y = map_size_y - 9;
    }
    else
    {
        u_y = char_player.pos_y - 5;
    }

    u_j = u_x;

    u_i = 0;
    i = 0;
    j = 0;

    while(1)
    {
        f = Lookup_Map_Yggdrid[u_y + j];
        base_byte = map->data[f + u_i];
        count_byte = map->data[f + u_i + 1];

        if(count_byte > u_x)
        {
            count_byte -= u_x;
            u_x = 0;

            while(1)
            {
                Draw_Tile18(i * 2, j * 2, base_byte);

                i++;
                count_byte--;

                if(count_byte == 0)
                {
                    u_i += 2;
                    break;
                }
                else if(i == 10)
                {
                    break;
                }
            }
        }
        else if(count_byte <= u_x)
        {
            u_x -= count_byte;
            count_byte = 0;

            u_i += 2;
        }

        if(i == 10)
        {
            i = 0;
            j++;
            u_i = 0;
            u_x = u_j;
        }

        if(j == 9)
        {
            break;
        }
    }
}

void Draw_Line_Bank18(const GameMap *map, UBYTE direction) //* Draws verticle/horizontal line of map tiles.
{
    u_i = 0;
    i = 0;
    j = 0;
    u_k = 0;

    if(direction == right && char_player.pos_x <= map_size_x - 5)
    {
        load_pos_x = camera_x + 20;
        if (load_pos_x >= 32)
        {
            load_pos_x = load_pos_x - 32;
        }

        load_pos_y = camera_y;
        if (load_pos_y >= 32)
        {
            load_pos_y = load_pos_y - 32;
        }

        u_x = char_player.pos_x + 5;

        if (char_player.pos_y <= 5)
        {
            u_y = 0;
        }
        else if (char_player.pos_y >= map_size_y - 4)
        {
            u_y = map_size_y - 9;
        }
        else
        {
            u_y = char_player.pos_y - 5;
        }

        u_j = u_x;

        if (camera_y + 18 > 31)
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y + j];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    if (u_k == 0)
                    {
                        Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
                    }
                    else
                    {
                        Draw_Tile18(load_pos_x, i, base_byte);
                    }

                    j++;
                    i += 2;
                    u_x = u_j;
                    u_i = 0;

                    if (i == 32 - camera_y && u_k == 0)
                    {
                        i = 0;
                        u_k = 1;
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == camera_y - 14 && u_k == 1)
                {
                    break;
                }
            }
        }
        else
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y + j];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    Draw_Tile18(load_pos_x, load_pos_y + j * 2, base_byte);

                    j++;
                    u_x = u_j;
                    u_i = 0;
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (j == 9)
                {
                    break;
                }
            }
        }
    }

    else if(direction == left && char_player.pos_x >= 5)
    {
        if (camera_x == 0)
        {
            load_pos_x = 30;
        }
        else
        {
            load_pos_x = camera_x - 2;
        }

        load_pos_y = camera_y;
        if (load_pos_y >= 32)
        {
            load_pos_y = load_pos_y - 32;
        }

        u_x = char_player.pos_x - 6;

        if (char_player.pos_y <= 5)
        {
            u_y = 0;
        }
        else if (char_player.pos_y >= map_size_y - 4)
        {
            u_y = map_size_y - 9;
        }
        else
        {
            u_y = char_player.pos_y - 5;
        }

        u_j = u_x;

        if (camera_y + 18 > 31)
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y + j];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    if (u_k == 0)
                    {
                        Draw_Tile18(load_pos_x, load_pos_y + i, base_byte);
                    }
                    else
                    {
                        Draw_Tile18(load_pos_x, i, base_byte);
                    }

                    j++;
                    i += 2;
                    u_x = u_j;
                    u_i = 0;

                    if (i == 32 - camera_y && u_k == 0)
                    {
                        i = 0;
                        u_k = 1;
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == camera_y - 14 && u_k == 1)
                {
                    break;
                }
            }
        }
        else
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y + j];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    Draw_Tile18(load_pos_x, load_pos_y + j * 2, base_byte);

                    j++;
                    u_x = u_j;
                    u_i = 0;
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (j == 9)
                {
                    break;
                }
            }
        }
    }

    else if(direction == down && char_player.pos_y <= map_size_y - 4)
    {
        load_pos_x = camera_x;
        if (load_pos_x >= 32)
        {
            load_pos_x = load_pos_x - 32;
        }

        load_pos_y = camera_y + 18;
        if (load_pos_y >= 32)
        {
            load_pos_y = load_pos_y - 32;
        }

        if (char_player.pos_x <= 5)
        {
            u_x = 0;
        }
        else if (char_player.pos_x >= map_size_x - 5)
        {
            u_x = map_size_x - 10;
        }
        else
        {
            u_x = char_player.pos_x - 5;
        }

        u_y = char_player.pos_y + 4;

        if (camera_x + 20 > 32)
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    count_byte -= u_x;
                    u_x = 0;

                    if (u_k == 0)
                    {
                        while (1)
                        {
                            Draw_Tile18(load_pos_x + i, load_pos_y, base_byte);

                            i += 2;
                            count_byte--;

                            if (count_byte == 0)
                            {
                                u_i += 2;

                                if (i == 32 - camera_x)
                                {
                                    u_k = 1;

                                    f = Lookup_Map_Yggdrid[u_y];
                                    base_byte = map->data[f + u_i];
                                    count_byte = map->data[f + u_i + 1];

                                    i = 0;

                                    break;
                                }

                                break;
                            }
                            else if (i == 32 - camera_x)
                            {
                                u_k = 1;
                                i = 0;

                                break;
                            }
                        }
                    }

                    if (u_k == 1)
                    {
                        while (1)
                        {
                            Draw_Tile18(i, load_pos_y, base_byte);

                            i += 2;
                            count_byte--;

                            if (count_byte == 0)
                            {
                                u_i += 2;
                                break;
                            }
                            else if (i == camera_x - 12)
                            {
                                break;
                            }
                        }
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == camera_x - 12 && u_k == 1)
                {
                    break;
                }
            }
        }
        else
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    count_byte -= u_x;
                    u_x = 0;

                    while (1)
                    {
                        Draw_Tile18(load_pos_x + i * 2, load_pos_y, base_byte);

                        i++;
                        count_byte--;

                        if (count_byte == 0)
                        {
                            u_i += 2;
                            break;
                        }
                        else if (i == 10)
                        {
                            break;
                        }
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == 10)
                {
                    break;
                }
            }
        }
    }

    else if(direction == up && char_player.pos_y >= 5)
    {
        load_pos_x = camera_x;
        if(load_pos_x >= 32)
        {
            load_pos_x = load_pos_x - 32;
        }

        if(camera_y == 0)
        {
            load_pos_y = 30;
        }
        else
        {
            load_pos_y = camera_y - 2;
        }

        if(char_player.pos_x <= 5)
        {
            u_x = 0;
        }
        else if(char_player.pos_x >= map_size_x - 5)
        {
            u_x = map_size_x - 10;
        }
        else
        {
            u_x = char_player.pos_x - 5;
        }

        u_y = char_player.pos_y - 6;

        if(camera_x + 20 > 32)
        {
            while(1)
            {
                f = Lookup_Map_Yggdrid[u_y];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if(count_byte > u_x)
                {
                    count_byte -= u_x;
                    u_x = 0;

                    if(u_k == 0)
                    {
                        while(1)
                        {
                            Draw_Tile18(load_pos_x + i, load_pos_y, base_byte);

                            i += 2;
                            count_byte--;

                            if (count_byte == 0)
                            {
                                u_i += 2;

                                if (i == 32 - camera_x)
                                {
                                    u_k = 1;

                                    f = Lookup_Map_Yggdrid[u_y];
                                    base_byte = map->data[f + u_i];
                                    count_byte = map->data[f + u_i + 1];

                                    i = 0;

                                    break;
                                }

                                break;
                            }
                            else if (i == 32 - camera_x)
                            {
                                u_k = 1;
                                i = 0;

                                break;
                            }
                        }
                    }

                    if (u_k == 1)
                    {
                        while (1)
                        {
                            Draw_Tile18(i, load_pos_y, base_byte);

                            i += 2;
                            count_byte--;

                            if (count_byte == 0)
                            {
                                u_i += 2;
                                break;
                            }
                            else if (i == camera_x - 12)
                            {
                                break;
                            }
                        }
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == camera_x - 12 && u_k == 1)
                {
                    break;
                }
            }
        }
        else
        {
            while (1)
            {
                f = Lookup_Map_Yggdrid[u_y];
                base_byte = map->data[f + u_i];
                count_byte = map->data[f + u_i + 1];

                if (count_byte > u_x)
                {
                    count_byte -= u_x;
                    u_x = 0;

                    while (1)
                    {
                        Draw_Tile18(load_pos_x + i * 2, load_pos_y, base_byte);

                        i++;
                        count_byte--;

                        if (count_byte == 0)
                        {
                            u_i += 2;
                            break;
                        }
                        else if (i == 10)
                        {
                            break;
                        }
                    }
                }
                else if (count_byte <= u_x)
                {
                    u_x -= count_byte;
                    count_byte = 0;

                    u_i += 2;
                }

                if (i == 10)
                {
                    break;
                }
            }
        }
    }
}

UBYTE Check_Tile_Collision_Bank18(const GameMap *map, GameCharacter *character, INT8 move_x, INT8 move_y)
{
    u_i = 0;

    u_x = character->pos_x + move_x;
    u_y = character->pos_y + move_y;

    while(1)
    {
        f = Lookup_Map_Yggdrid[u_y];
        base_byte = map->data[f + u_i];
        count_byte = map->data[f + u_i + 1];

        if(count_byte > u_x)
        {
            return tilemap_3[base_byte];
        }
        else if(count_byte <= u_x)
        {
            u_x -= count_byte;
            count_byte = 0;

            u_i += 2;
        }
    }
}