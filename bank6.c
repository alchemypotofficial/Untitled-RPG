#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Character.h"
#include "Game_Sprite.h"
#include "Game_Message.h"
#include "Game_Map.h"
#include "Tiles/Font_1.c"
#include "Tiles/Font_Window.c"
#include "Maps/Map_MessageBox.c"
#include "Messages/Message_Format.c"

UBYTE pointer_tick = 0;

extern UBYTE Joy;

extern UBYTE current_message, current_line, total_lines, current_row;

extern UBYTE CurrentMap;

extern UINT8 camera_x, camera_y;

extern UINT8 map_size_x, map_size_y;

extern UINT16 map_x, map_y;

extern UINT16 load_pos_x, load_pos_y;

extern INT8 i, j, k, l, m, n;

extern UINT16 e, f, g, h;

extern UBYTE MessageBoxFlag;

extern void performant_delay(UBYTE num_loops);
extern void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

void Gameplay();

void scroll_message();
void clear_messagebox();
void Load_Window();
void Load_Message_Box();
void Load_Message(UBYTE line);
void Load_Next_Line();
void clear_message();
void Draw_Pointer();
void reset_char_sprites();

extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite);
extern void Call_Set_Char_Tile(UBYTE bank, GameCharacter* character, UBYTE tile, GameSprite* sprite);

extern GameMessage* Get_Message();

extern const unsigned char Message_Pointer[1];

extern const unsigned char Message_Background[1];

UBYTE Retrieve_Font_Value()
{
    return Font_1[g + i];
}

void Load_Window()
{
    set_bkg_tileset(210, 11, Font_Window);
}

void Load_Message_Box()
{
    move_win(7,160);

    set_bkg_tileset(220, 36, Message_Blank);

    set_win_map(0, 0, 20, 5, Map_MessageBoxPLN1, Map_MessageBoxPLN0);
    set_win_map(1, 1, 18, 1, Message_Format_1, Message_Format_1);
    set_win_map(1, 2, 18, 1, Message_Format_2, Message_Format_2);

    SHOW_WIN;
}

void parallax_char_sprites()
{
    if(char_npc_1.active)
    {
        if(char_npc_1.pos_y > char_player.pos_y + 2)
        {
            for(i = 0; i < 4; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_1, i, &sprite_clear);
            }
        }
        else if(char_npc_1.pos_y > char_player.pos_y + 1)
        {
            for(i = 0; i < 4; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_1, 2 + i, &sprite_clear);
            }
        }
        else if(char_npc_1.pos_y > char_player.pos_y)
        {
            for(i = 0; i < 2; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_1, 4 + i, &sprite_clear);
            }
        }
    }
    if(char_npc_2.active)
    {
        if(char_npc_2.pos_y > char_player.pos_y + 2)
        {
            for(i = 0; i < 6; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_2, i, &sprite_clear);
            }
        }
        else if(char_npc_2.pos_y > char_player.pos_y + 1)
        {
            for(i = 0; i < 4; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_2, 2 + i, &sprite_clear);
            }
        }
        else if(char_npc_2.pos_y > char_player.pos_y)
        {
            for(i = 0; i < 2; i++)
            {
                Call_Set_Char_Tile(bank6, &char_npc_2, 4 + i, &sprite_clear);
            }
        }
    }
}

void Draw_Pointer()
{
    if(pointer_tick == 25 && current_line < total_lines - 1)
    {
        set_win_tiles(18, 3, 1, 1, Message_Background);   
    }
    else if(pointer_tick == 50 && current_line < total_lines - 1)
    {
        set_win_tiles(18, 3, 1, 1, Message_Pointer);

        pointer_tick = 0;
    }

    pointer_tick += 1;
}

void Draw_Message_Box()
{
    Load_Message_Box();
 
    for(i = 0; i < 7; i++)
    {
        wait_vbl_done();
        scroll_win(0,-8);
    }

    parallax_char_sprites();
}

void Close_Message_Box()
{
    for(i = 0; i < 5; i++)
    {
        wait_vbl_done();

        scroll_win(0, 8);
    }
}

void scroll_message()
{
    set_win_map(1, 1, 18, 1, Message_Format_2, Message_Format_2);
    set_win_map(1, 2, 18, 1, Message_Format_3, Message_Format_3);

    performant_delay(4);

    set_bkg_tileset(220, 18, Message_Blank);

    set_win_map(1, 1, 18, 1, Message_Format_2, Message_Format_2);
    set_win_map(1, 2, 18, 1, Message_Format_1, Message_Format_1);

    performant_delay(4);

    set_bkg_tileset(238, 18, Message_Blank);

    set_win_map(1, 1, 18, 1, Message_Format_1, Message_Format_1);
    set_win_map(1, 2, 18, 1, Message_Format_2, Message_Format_2);
}

void clear_message()
{
    set_win_map(1, 1, 18, 1, Message_Format_3, Message_Format_3);
    set_win_map(1, 2, 18, 1, Message_Format_3, Message_Format_3);
}

void clear_messagebox()
{
    for(i = 0; i < 5; i++)
    {
        wait_vbl_done();

        scroll_win(0, 8);
    }

    MessageBoxFlag = false;
}

void reset_char_sprites()
{
    if(char_npc_1.active && char_npc_1.visible)
    {
        switch(char_npc_1.facing)
        {
            case up:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_up->sprites[0]);
                break;
            case down:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
                break;
            case left:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_left->sprites[0]);
                break;
            case right:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_right->sprites[0]);
                break;
            case idle:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
                break;
            default:
                Call_Load_Char_Sprite(bank6, &char_npc_1, char_npc_1.sprites_down->sprites[0]);
                break;
        }
    }
    if(char_npc_2.active && char_npc_2.visible)
    {
        switch(char_npc_2.facing)
        {
            case up:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_up->sprites[0]);
                break;
            case down:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
                break;
            case left:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_left->sprites[0]);
                break;
            case right:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_right->sprites[0]);
                break;
            case idle:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
                break;
            default:
                Call_Load_Char_Sprite(bank6, &char_npc_2, char_npc_2.sprites_down->sprites[0]);
                break;
        }
    }
}