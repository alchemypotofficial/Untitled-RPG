#include <gb/gb.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Message.h"
#include "Messages/Message_Hiro_House_Shelf.c"
#include "Messages/Message_Plum_Headstone.c"
#include "Messages/Message_SampleText.c"
#include "Messages/Message_Health_Brew.c"
#include "Messages/Message_TestText.c"
#include "Messages/Message_Intro_1.c"

extern UBYTE Joy;

extern UBYTE current_message, current_line, total_lines, current_row, font_value, pointer_tick;

extern UBYTE CurrentMap;

extern UINT8 camera_x, camera_y;

extern UINT8 map_size_x, map_size_y;

extern UINT16 map_x, map_y;

extern UINT16 load_pos_x, load_pos_y;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y, u_c;

extern UINT16 e, f, g, h;

extern unsigned char message_base[16];

extern const unsigned char Message_Pointer[1];

extern const unsigned char Message_Background[1];

extern void performant_delay(UBYTE num_loops);

extern void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset);

extern void Call_Draw_Message_Box(UBYTE bank);
extern void Call_Close_Message_Box(UBYTE bank);
extern void Call_Scroll_Message(UBYTE bank);
extern void Call_Draw_Pointer(UBYTE bank);
extern void Call_Reset_Char_Sprites(UBYTE bank);

extern UBYTE Get_Font_Value(UBYTE bank);

void Load_Message_Bank10(GameMessage* message, unsigned char* insert_1, UBYTE length_1)
{
    Call_Draw_Message_Box(bank10);

    current_line = 0;

    while(current_line < message->length)
    {
        u_x = 220;

        for(current_row = 0; current_row < 2; current_row += 1)
        {
            for(h = 0; h < 18; h++)
            {
                e = 18 * current_line;
                e += h;

                if(message->message[e] == 180 && message->message[e + 1] == 214 && insert_1 != NULL)
                {
                    for(u_y = 0; u_y < length_1; u_y++)
                    {
                        if(joypad() & J_A)
                        {
                            performant_delay(1);
                        }
                        else
                        {
                            performant_delay(2);
                        }

                        g = insert_1[u_y] - 16;

                        g = g * 16;

                        for(i = 0; i < 16; i++)
                        {
                            message_base[i] = Get_Font_Value(bank10);
                        }

                        set_bkg_tileset(u_x, 1, message_base);

                        u_x += 1;
                    }

                    h += 1;
                }
                else
                {
                    if(joypad() & J_A)
                    {
                        performant_delay(1);
                    }
                    else
                    {
                        performant_delay(2);
                    }

                    g = message->message[e] - 180;

                    g = g * 16;

                    for(i = 0; i < 16; i++)
                    {
                        message_base[i] = Get_Font_Value(bank10);
                    }

                    set_bkg_tileset(u_x, 1, message_base);

                    u_x += 1;
                }
            }

            current_line += 1;
        }

        set_win_tiles(18, 3, 1, 1, Message_Pointer);

        while(joypad() & J_A)
        {
            performant_delay(1);

            Call_Draw_Pointer(bank10);
        }

        while(1)
        {
            performant_delay(1);

            Joy = joypad();

            Call_Draw_Pointer(bank10);

            if(Joy & J_A)
            {
                set_win_tiles(18, 3, 1, 1, Message_Background);

                pointer_tick = 0;

                Call_Scroll_Message(bank10);

                break;
            }
        }
    }

    performant_delay(10);

    Call_Reset_Char_Sprites(bank10);

    Call_Close_Message_Box(bank10);

    while(joypad() & J_A)
    {
        performant_delay(1);
    }
}
