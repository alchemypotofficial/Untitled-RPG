#include <gb/gb.h>
#include <string.h>
#include <rand.h>
#include "Game_Definitions.h"
#include "Game_Character.h"
#include "Game_Sprite.h"
#include "Game_Event.h"
#include "Game_Map.h"
#include "Game_Message.h"
#include "Game_Tilemap.h"
#include "Game_Item.h"
#include "Game_Equip.h"
#include "Game_Shop.h"

extern UBYTE Playing, Joy;

extern UBYTE CurrentMap, CurrentShop;

extern UINT8 PlayerCharacter;

extern UBYTE Tileset;

extern UINT8 camera_x, camera_y;

extern UINT8 map_size_x, map_size_y;

extern UINT8 camera_focus;

extern UBYTE current_message, total_lines;

extern INT8 i, j, k, l, m, n, r, x, y;

extern UBYTE u_x, u_y;

extern UBYTE PlayerControlFlag;

extern UBYTE MessageBoxFlag;

extern UINT8 clock_tick;

extern UBYTE game_scene;

extern UBYTE event_x, event_y;

extern void Save_Variables();

extern void performant_delay(UBYTE num_loops);
extern void fade_out();
extern void fade_in();
extern void toggle_control(UBYTE toggle);

extern void Call_Reload_Map(UBYTE bank);
extern void Call_Load_Combat_Main(UBYTE bank);
extern void Call_Check_Step_Counter(UBYTE bank);
extern void Call_Orient_Char(UBYTE bank, GameCharacter *character);
extern void Call_Draw_Map(UBYTE bank, GameMap *map);
extern void Call_Draw_Map_Line(UBYTE bank, GameMap *map, UBYTE directiony);
extern void Call_Draw_Message(UBYTE bank, GameMessage *message, unsigned char *insert_1, UBYTE length_1);
extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter *character, GameSprite *sprite);
extern void Call_Add_Item(UBYTE bank, GameItem *item, UBYTE amount);
extern void Call_Add_Equip(UBYTE bank, GameEquip *equip);
extern void Call_Scene_Handler(UBYTE bank, UBYTE scene_id);

extern void Call_Shop(UBYTE bank);

extern UBYTE Call_Check_Tile_Collision(UBYTE bank, GameMap *map, GameCharacter *character, INT8 move_x, INT8 move_y);

extern void Menu();

extern GameMap *Get_Map(UBYTE map_id);
extern GameTele *Get_Tele(UBYTE tele_id);
extern GameSign *Get_Sign(UBYTE sign_id);
extern GameMessage *Get_Message(UBYTE message_id);
extern GameShop *Get_Shop(UBYTE shop_id);

const unsigned char chest_opened[] = {0xC4, 0xC5, 0xC7, 0xC9};

const unsigned char test_sign[10] = {1, 0, 0};

void hide_char(GameCharacter *character);

void move_screen(INT16 move_x, INT16 move_y);

void move_char(GameCharacter *character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);

UBYTE check_char_collision(GameCharacter *character, INT8 move_x, INT8 move_y)
{
    if (char_npc_1.active && char_npc_1.visible && character->pos_x + move_x == char_npc_1.pos_x && character->pos_y + move_y == char_npc_1.pos_y)
    {
        return true;
    }
    else if (char_npc_2.active && char_npc_2.visible && character->pos_x + move_x == char_npc_2.pos_x && character->pos_y + move_y == char_npc_2.pos_y)
    {
        return true;
    }
    else
    {
        return false;
    }
}

UBYTE check_walk_counter()
{
    if (char_player.walk_count[0] == 0 && char_player.walk_count[1] == 0 && char_player.walk_count[2] == 0 && char_player.walk_count[3] == 0)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

void build_char(GameCharacter *character)
{
    set_sprite_tile(character->sprite_id[0], character->sprite_index);
    set_sprite_tile(character->sprite_id[0] + 1, character->sprite_index + 2);
    set_sprite_tile(character->sprite_id[0] + 2, character->sprite_index + 1);
    set_sprite_tile(character->sprite_id[0] + 3, character->sprite_index + 3);
}

void move_screen(INT16 move_x, INT16 move_y)
{
    while (move_x != 0)
    {
        scroll_bkg(move_x < 0 ? -1 : 1, 0);
        move_x += move_x < 0 ? 1 : -1;
        performant_delay(1);
    }
    while (move_y != 0)
    {
        scroll_bkg(0, move_y < 0 ? 1 : -1);
        move_y += move_y < 0 ? 1 : -1;
        performant_delay(1);
    }
}

void move_char(GameCharacter *character, UBYTE tile_x, UBYTE tile_y, UBYTE pixel_offset)
{
    tile_x = tile_x * 8;
    tile_y = tile_y * 8;

    move_sprite(character->sprite_id[0], tile_x - pixel_offset, tile_y + 8);
    move_sprite(character->sprite_id[0] + 1, tile_x + 8 - pixel_offset, tile_y + 8);
    move_sprite(character->sprite_id[0] + 2, tile_x - pixel_offset, tile_y + 16);
    move_sprite(character->sprite_id[0] + 3, tile_x + 8 - pixel_offset, tile_y + 16);
}

void read_message(GameMessage *message, unsigned char *insert_1, UBYTE length_1) //* Displays specified message.
{
    Call_Draw_Message(bank2, message, insert_1, length_1);
}

void open_shop(GameShop *shop)
{
    CurrentShop = shop->shop_id;

    Call_Shop(bank2);
}

void teleport_player(GameTele *event_tele) //* Teleports player to specified teleport.
{
    if (event_tele != &tele_null)
    {
        fade_out();

        move_bkg(0, 0);

        camera_x = 0;
        camera_y = 0;
        char_player.walk_count[0] = 0;
        char_player.walk_count[1] = 0;
        char_player.walk_count[2] = 0;
        char_player.walk_count[3] = 0;

        char_player.pos_x = event_tele->pos_x;
        char_player.pos_y = event_tele->pos_y;

        Call_Draw_Map(bank2, Get_Map(event_tele->map_id));

        if (event_tele->direction == up)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
        }
        else if (event_tele->direction == down)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
        }

        fade_in();

        if (event_tele->direction == up)
        {
            if (char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 5)
            {
                camera_focus = 0;
                char_player.pos_y -= 1;
                char_player.walk_count[0] = 16;
            }
            else
            {
                camera_focus = 1;
                Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), up);
                char_player.pos_y -= 1;
                char_player.walk_count[0] = 16;
            }
        }
        else if (event_tele->direction == down)
        {
            if (char_player.pos_y < 5 || char_player.pos_y >= map_size_y - 5)
            {
                camera_focus = 0;
                char_player.pos_y += 1;
                char_player.walk_count[1] = 16;
            }
            else
            {
                camera_focus = 1;
                Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), down);
                char_player.pos_y += 1;
                char_player.walk_count[1] = 16;
            }
        }
    }
    else
    {
        return;
    }
}

void Teleport(GameMap *map, UBYTE tile_x, UBYTE tile_y)
{
    move_bkg(0, 0);

    camera_x = 0;
    camera_y = 0;
    char_player.walk_count[0] = 0;
    char_player.walk_count[1] = 0;
    char_player.walk_count[2] = 0;
    char_player.walk_count[3] = 0;

    char_player.pos_x = tile_x;
    char_player.pos_y = tile_y;

    Call_Draw_Map(bank2, map);
}

void open_chest(UBYTE chest_id)
{
    switch (chest_id)
    {
    case 0: //* Chest 0
        Call_Add_Item(bank2, &item_healing_brew, 2);
        Call_Add_Item(bank2, &item_mana_brew, 1);
        break;
    case 1: //* Chest 1
        Call_Add_Item(bank2, &item_life_leaf, 1);
        break;
    default: //* Chest 0 - Default
        Call_Add_Item(bank2, &item_healing_brew, 1);
        break;
    }
}

void Check_NPC_Messenger(void)
{
    if (char_player.facing == up)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 0, -1))
        {
            char_npc_1.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_down->sprites[0]);

            read_message(Get_Message(char_npc_1.action_id), NULL, 0);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 0, -1))
        {
            char_npc_2.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_down->sprites[0]);

            read_message(Get_Message(char_npc_2.action_id), NULL, 0);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 0, -1))
        {
            char_npc_3.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_down->sprites[0]);

            read_message(Get_Message(char_npc_3.action_id), NULL, 0);
            return;
        }
    }
    else if (char_player.facing == down)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 0, 1))
        {
            char_npc_1.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_up->sprites[0]);

            read_message(Get_Message(char_npc_1.action_id), NULL, 0);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 0, 1))
        {
            char_npc_2.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_up->sprites[0]);

            read_message(Get_Message(char_npc_2.action_id), NULL, 0);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 0, 1))
        {
            char_npc_3.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_up->sprites[0]);

            read_message(Get_Message(char_npc_3.action_id), NULL, 0);
            return;
        }
    }
    else if (char_player.facing == left)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == messenger && check_char_collision(&char_player, -1, 0))
        {
            char_npc_1.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_right->sprites[0]);

            read_message(Get_Message(char_npc_1.action_id), NULL, 0);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == messenger && check_char_collision(&char_player, -1, 0))
        {
            char_npc_2.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_right->sprites[0]);

            read_message(Get_Message(char_npc_2.action_id), NULL, 0);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == messenger && check_char_collision(&char_player, -1, 0))
        {
            char_npc_3.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_right->sprites[0]);

            read_message(Get_Message(char_npc_3.action_id), NULL, 0);
            return;
        }
    }
    else if (char_player.facing == right)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == messenger && check_char_collision(&char_player, 1, 0))
        {
            char_npc_1.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_left->sprites[0]);

            read_message(Get_Message(char_npc_1.action_id), NULL, 0);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == messenger && check_char_collision(&char_player, 1, 0))
        {
            char_npc_2.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_left->sprites[0]);

            read_message(Get_Message(char_npc_2.action_id), NULL, 0);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == messenger && check_char_collision(&char_player, 1, 0))
        {
            char_npc_1.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_left->sprites[0]);

            read_message(Get_Message(char_npc_3.action_id), NULL, 0);
            return;
        }
    }
}

void Check_NPC_Shopkeeper(void)
{
    if (char_player.facing == up)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1))
        {
            char_npc_1.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_down->sprites[0]);

            open_shop(Get_Shop(char_npc_1.action_id));
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1))
        {
            char_npc_2.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_down->sprites[0]);

            open_shop(Get_Shop(char_npc_2.action_id));
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 0, -1))
        {
            char_npc_3.facing = down;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_down->sprites[0]);

            open_shop(Get_Shop(char_npc_3.action_id));
            return;
        }
    }
    else if (char_player.facing == down)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1))
        {
            char_npc_1.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_up->sprites[0]);

            open_shop(Get_Shop(char_npc_1.action_id));
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1))
        {
            char_npc_2.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_up->sprites[0]);

            open_shop(Get_Shop(char_npc_2.action_id));
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 0, 1))
        {
            char_npc_3.facing = up;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_up->sprites[0]);

            open_shop(Get_Shop(char_npc_3.action_id));
            return;
        }
    }
    else if (char_player.facing == left)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0))
        {
            char_npc_1.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_right->sprites[0]);

            open_shop(Get_Shop(char_npc_1.action_id));
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0))
        {
            char_npc_2.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_right->sprites[0]);

            open_shop(Get_Shop(char_npc_2.action_id));
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, -1, 0))
        {
            char_npc_3.facing = right;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_right->sprites[0]);

            open_shop(Get_Shop(char_npc_3.action_id));
            return;
        }
    }
    else if (char_player.facing == right)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0))
        {
            char_npc_1.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_1, char_npc_1.sprites_left->sprites[0]);

            open_shop(Get_Shop(char_npc_1.action_id));
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0))
        {
            char_npc_2.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_2, char_npc_2.sprites_left->sprites[0]);

            open_shop(Get_Shop(char_npc_2.action_id));
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == shopkeeper && check_char_collision(&char_player, 1, 0))
        {
            char_npc_3.facing = left;
            Call_Load_Char_Sprite(bank2, &char_npc_3, char_npc_3.sprites_left->sprites[0]);

            open_shop(Get_Shop(char_npc_3.action_id));
            return;
        }
    }
}

void Check_NPC_Trigger(void)
{
    if (char_player.facing == up)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 0, -1))
        {
            Call_Scene_Handler(bank2, char_npc_1.action_id);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 0, -1))
        {
            Call_Scene_Handler(bank2, char_npc_2.action_id);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 0, -1))
        {
            Call_Scene_Handler(bank2, char_npc_3.action_id);
            return;
        }
    }
    else if (char_player.facing == down)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 0, 1))
        {
            Call_Scene_Handler(bank2, char_npc_1.action_id);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 0, 1))
        {
            Call_Scene_Handler(bank2, char_npc_2.action_id);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 0, 1))
        {
            Call_Scene_Handler(bank2, char_npc_3.action_id);
            return;
        }
    }
    else if (char_player.facing == left)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == trigger && check_char_collision(&char_player, -1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_1.action_id);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == trigger && check_char_collision(&char_player, -1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_2.action_id);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == trigger && check_char_collision(&char_player, -1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_3.action_id);
            return;
        }
    }
    else if (char_player.facing == right)
    {
        if (char_npc_1.active && char_npc_1.visible && char_npc_1.npc_type == trigger && check_char_collision(&char_player, 1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_1.action_id);
            return;
        }
        else if (char_npc_2.active && char_npc_2.visible && char_npc_2.npc_type == trigger && check_char_collision(&char_player, 1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_2.action_id);
            return;
        }
        else if (char_npc_3.active && char_npc_3.visible && char_npc_3.npc_type == trigger && check_char_collision(&char_player, 1, 0))
        {
            Call_Scene_Handler(bank2, char_npc_3.action_id);
            return;
        }
    }
}

void Check_Event_Shopkeeper(void)
{
    x = 0;
    y = 0;

    switch (char_player.facing)
    {
    case up:
        y = -1;
        break;
    case down:
        y = 1;
        break;
    case left:
        x = -1;
        break;
    case right:
        x = 1;
        break;
    default:
        y = -1;
        break;
    }

    for (i = 0; i < 5; i++)
    {
        if (char_player.pos_x + x == Get_Map(CurrentMap)->event_shopkeeper[i]->pos_x && char_player.pos_y + y == Get_Map(CurrentMap)->event_shopkeeper[i]->pos_y)
        {
            open_shop(Get_Map(CurrentMap)->event_shopkeeper[i]->shop);
        }
    }
}

void Check_Event_Chest(void)
{
    for (i = 0; i < 100; i++)
    {
        if (char_player.pos_x == event_chest.pos_x[i] && char_player.pos_y - 2 == event_chest.pos_y[i] && CurrentMap == event_chest.map_id[i])
        {
            if (!event_chest.used[i])
            {
                event_chest.used[i] = true;
                open_chest(event_chest.content_id[i]);
            }

            return;
        }
    }
}

void Check_Event_Sign(void)
{
    x = 0;
    y = 0;

    switch (char_player.facing)
    {
    case up:
        y = -1;
        break;
    case down:
        y = 1;
        break;
    case left:
        x = -1;
        break;
    case right:
        x = 1;
        break;
    default:
        y = -1;
        break;
    }

    for (i = 0; i < 10; i++)
    {
        if (char_player.pos_x + x == Get_Sign(Get_Map(CurrentMap)->event_sign[i])->pos_x && char_player.pos_y + y == Get_Sign(Get_Map(CurrentMap)->event_sign[i])->pos_y)
        {
            r = Get_Sign(Get_Map(CurrentMap)->event_sign[i])->message_id;
            read_message(Get_Message(r), NULL, 0);
            return;
        }
    }
}

void Check_Event_Tele(void)
{
    for (i = 0; i < 10; i++)
    {
        if (char_player.pos_x == Get_Tele(Get_Map(CurrentMap)->event_tele[i])->pos_x && char_player.pos_y == Get_Tele(Get_Map(CurrentMap)->event_tele[i])->pos_y)
        {
            r = Get_Tele(Get_Map(CurrentMap)->event_tele[i])->tele_id;
            teleport_player(Get_Tele(r));
            return;
        }
    }
}

void Check_Event_Trigger(void)
{
    for (i = 0; i < 10; i++)
    {
        if (char_player.pos_x >= Get_Map(CurrentMap)->event_trigger[i]->pos_1[0] && char_player.pos_y >= Get_Map(CurrentMap)->event_trigger[i]->pos_1[1] && char_player.pos_x <= Get_Map(CurrentMap)->event_trigger[i]->pos_2[0] && char_player.pos_y <= Get_Map(CurrentMap)->event_trigger[i]->pos_2[1])
        {
            Call_Scene_Handler(bank2, Get_Map(CurrentMap)->event_trigger[i]->scene_id);
        }
    }
}

void hide_char(GameCharacter *character)
{
    if (character->active)
    {
        if (character->pos_x < char_player.pos_x - 6 || character->pos_y < char_player.pos_y - 6 || character->pos_x > char_player.pos_x + 5 || character->pos_y > char_player.pos_y + 5)
        {
            if (character->visible)
            {
                Call_Load_Char_Sprite(bank2, character, &sprite_clear);
                character->visible = false;
            }
        }
        else if (!character->visible)
        {
            Call_Load_Char_Sprite(bank2, character, character->sprites_down->sprites[0]);
            character->visible = true;
        }
    }
}

void walk_counter(INT8 move_x, INT8 move_y)
{
    if (move_x > 0)
    {
        char_player.pos_x += 1;
        char_player.walk_count[3] += 16;

        Check_Event_Tele();
    }
    else if (move_x < 0)
    {
        char_player.pos_x -= 1;
        char_player.walk_count[2] += 16;

        Check_Event_Tele();
    }
    else if (move_y > 0)
    {
        char_player.pos_y += 1;
        char_player.walk_count[1] += 16;

        Check_Event_Tele();
    }
    else if (move_y < 0)
    {
        char_player.pos_y -= 1;
        char_player.walk_count[0] += 16;

        Check_Event_Tele();
    }
}

void walk_player()
{
    if (char_player.walk_count[0] > 0)
    {
        scroll_bkg(0, -1);

        if (char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, 1);
        }
        if (char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, 1);
        }

        char_player.walk_count[0] = char_player.walk_count[0] - 1;

        if (char_player.walk_count[0] == 0)
        {
            camera_y = camera_y - 2;
            if (camera_y == 254)
            {
                camera_y = 30;
            }

            Check_Event_Trigger();

            if (Get_Map(CurrentMap)->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
    else if (char_player.walk_count[1] > 0)
    {
        scroll_bkg(0, 1);

        if (char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, -1);
        }
        if (char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, -1);
        }

        char_player.walk_count[1] = char_player.walk_count[1] - 1;

        if (char_player.walk_count[1] == 0)
        {
            camera_y = camera_y + 2;
            if (camera_y == 32)
            {
                camera_y = 0;
            }

            Check_Event_Trigger();

            if (Get_Map(CurrentMap)->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
    else if (char_player.walk_count[2] > 0)
    {
        scroll_bkg(-1, 0);

        if (char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 1, 0);
        }
        if (char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 1, 0);
        }

        char_player.walk_count[2] = char_player.walk_count[2] - 1;

        Check_Event_Trigger();

        if (char_player.walk_count[2] == 0)
        {
            camera_x = camera_x - 2;
            if (camera_x == 254)
            {
                camera_x = 30;
            }

            if (Get_Map(CurrentMap)->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
    else if (char_player.walk_count[3] > 0)
    {
        scroll_bkg(1, 0);

        if (char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], -1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, -1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, -1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, -1, 0);
        }
        if (char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], -1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, -1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, -1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, -1, 0);
        }

        char_player.walk_count[3] = char_player.walk_count[3] - 1;

        Check_Event_Trigger();

        if (char_player.walk_count[3] == 0)
        {
            camera_x = camera_x + 2;
            if (camera_x == 32)
            {
                camera_x = 0;
            }

            if (Get_Map(CurrentMap)->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
}

void walk_char(GameCharacter *character)
{
    if (character->walk_count[0] > 0)
    {
        scroll_sprite(character->sprite_id[0], 0, -1);
        scroll_sprite(character->sprite_id[0] + 1, 0, -1);
        scroll_sprite(character->sprite_id[0] + 2, 0, -1);
        scroll_sprite(character->sprite_id[0] + 3, 0, -1);

        character->walk_count[0] -= 1;
    }
    else if (character->walk_count[1] > 0)
    {
        scroll_sprite(character->sprite_id[0], 0, 1);
        scroll_sprite(character->sprite_id[0] + 1, 0, 1);
        scroll_sprite(character->sprite_id[0] + 2, 0, 1);
        scroll_sprite(character->sprite_id[0] + 3, 0, 1);

        character->walk_count[1] -= 1;
    }
    else if (character->walk_count[2] > 0)
    {
        scroll_sprite(character->sprite_id[0], -1, 0);
        scroll_sprite(character->sprite_id[0] + 1, -1, 0);
        scroll_sprite(character->sprite_id[0] + 2, -1, 0);
        scroll_sprite(character->sprite_id[0] + 3, -1, 0);

        character->walk_count[2] -= 1;
    }
    else if (character->walk_count[3] > 0)
    {
        scroll_sprite(character->sprite_id[0], 1, 0);
        scroll_sprite(character->sprite_id[0] + 1, 1, 0);
        scroll_sprite(character->sprite_id[0] + 2, 1, 0);
        scroll_sprite(character->sprite_id[0] + 3, 1, 0);

        character->walk_count[3] -= 1;
    }
}

void Update_Joypad(void) //* Updates player action using button presses
{
    Joy = joypad();

    if (Joy & J_A && !check_walk_counter())
    {
        Check_Event_Sign();
        Check_NPC_Messenger();
        Check_NPC_Shopkeeper();
        Check_Event_Chest();
        Check_Event_Shopkeeper();
        Check_Event_Trigger();
    }

    if (Joy & J_B && !check_walk_counter())
    {
        Call_Load_Combat_Main(bank2);
    }

    if (Joy & J_SELECT)
    {
    }

    if (Joy & J_START && !check_walk_counter())
    {
        Menu();
    }

    if (Joy & J_UP && PlayerControlFlag && !check_walk_counter())
    {
        if (char_player.pos_y > 0)
        {
            if (char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 4)
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, -1) && !check_char_collision(&char_player, 0, -1))
                {
                    camera_focus = false;
                    char_player.facing = up;

                    walk_counter(0, -1);
                }
                else
                {
                    char_player.facing = up;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
                }
            }
            else
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, -1) && !check_char_collision(&char_player, 0, -1))
                {
                    camera_focus = true;

                    Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), up);

                    walk_counter(0, -1);

                    char_player.facing = up;
                }
                else
                {
                    char_player.facing = up;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
                }
            }
        }
    }

    else if (Joy & J_DOWN && PlayerControlFlag && !check_walk_counter())
    {
        if (char_player.pos_y < map_size_y - 1)
        {
            if (char_player.pos_y <= 4 || char_player.pos_y >= map_size_y - 4)
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, 1) && !check_char_collision(&char_player, 0, 1))
                {
                    camera_focus = false;

                    char_player.facing = down;
                    walk_counter(0, 1);
                }
                else
                {
                    char_player.facing = down;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
                }
            }
            else
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 0, 1) && !check_char_collision(&char_player, 0, 1))
                {
                    camera_focus = true;

                    Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), down);

                    walk_counter(0, 1);

                    char_player.facing = down;
                }
                else
                {
                    char_player.facing = down;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
                }
            }
        }
    }

    else if (Joy & J_LEFT && PlayerControlFlag && !check_walk_counter())
    {
        if (char_player.pos_x > 0)
        {
            if (char_player.pos_x <= 5 || char_player.pos_x > map_size_x - 5)
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, -1, 0) && !check_char_collision(&char_player, -1, 0))
                {
                    camera_focus = false;

                    char_player.facing = left;
                    walk_counter(-1, 0);
                }
                else
                {
                    char_player.facing = left;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
                }
            }
            else
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, -1, 0) && !check_char_collision(&char_player, -1, 0))
                {
                    camera_focus = true;

                    Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), left);

                    walk_counter(-1, 0);

                    char_player.facing = left;
                }
                else
                {
                    char_player.facing = left;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
                }
            }
        }
    }

    else if (Joy & J_RIGHT && PlayerControlFlag && !check_walk_counter())
    {
        if (char_player.pos_x < map_size_x - 1)
        {
            if (char_player.pos_x < 5 || char_player.pos_x >= map_size_x - 5)
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 1, 0) && !check_char_collision(&char_player, 1, 0))
                {
                    camera_focus = false;

                    char_player.facing = right;
                    walk_counter(1, 0);
                }
                else
                {
                    char_player.facing = right;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_right->sprites[0]);
                }
            }
            else
            {
                if (PlayerControlFlag && !Call_Check_Tile_Collision(bank2, Get_Map(CurrentMap), &char_player, 1, 0) && !check_char_collision(&char_player, 1, 0))
                {
                    camera_focus = true;

                    Call_Draw_Map_Line(bank2, Get_Map(CurrentMap), right);

                    walk_counter(1, 0);

                    char_player.facing = right;
                }
                else
                {
                    char_player.facing = right;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_right->sprites[0]);
                }
            }
        }
    }
}

void test_update_npc(void)
{
    j = rand();
    if (j >= 0 && j <= 20)
    {
        char_npc_1.walk_count[0] += 8;
        char_npc_1.pos_y -= 1;
    }
    else if (j >= 21 && j <= 40)
    {
        char_npc_1.walk_count[1] += 8;
        char_npc_1.pos_y += 1;
    }
    else if (j >= 41 && j <= 60)
    {
        char_npc_1.walk_count[2] += 8;
        char_npc_1.pos_x -= 1;
    }
    else if (j >= 61 && j <= 80)
    {
        char_npc_1.walk_count[3] += 8;
        char_npc_1.pos_x += 1;
    }
}

void Update_Anim_Walk()
{
    if (char_player.walk_count[0] > 0 || char_player.walk_count[1] > 0 || char_player.walk_count[2] > 0 || char_player.walk_count[3] > 0)
    {
        if (char_player.walk_count[up] == 16)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
        }
        else if (char_player.walk_count[up] == 8)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
        }

        if (char_player.walk_count[down] == 16)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
        }
        else if (char_player.walk_count[down] == 8)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
        }

        if (char_player.walk_count[left] == 16)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
        }
        else if (char_player.walk_count[left] == 8)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
        }

        if (char_player.walk_count[right] == 16)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_right->sprites[0]);
        }
        else if (char_player.walk_count[right] == 8)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_right->sprites[0]);
        }
    }
}

void Update_NPC(void)
{
}