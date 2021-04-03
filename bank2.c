#include <gb/gb.h>
#include <string.h>
#include <rand.h>
#include "Game_Definitions.h"
#include "Game_Functions.h"
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

extern UBYTE CurrentShop;

extern const GameMap* current_map;

extern UBYTE PlayerCharacter;

extern UBYTE Tileset;

extern UBYTE camera_x, camera_y;

extern UBYTE map_size_x, map_size_y;

extern UBYTE camera_focus;

extern UBYTE current_message, total_lines;

extern UBYTE tile_collision;

extern INT8 i, j, k, l, m, n, r, x, y;

extern UINT16 u16_move_x, u16_move_y;

extern UBYTE u_x, u_y;

extern UBYTE InShipFlag;

extern UBYTE PlayerControlFlag;

extern UBYTE MessageBoxFlag;

extern UBYTE clock_tick;

extern UBYTE game_scene;

extern UBYTE ADownFlag;

extern UBYTE event_x, event_y;

extern UBYTE temp_UBYTE;
extern const GameChest* tempChest;
extern GameCharacter* temp_char;

extern unsigned char flag_switch[255];

extern void Save_Variables();

extern UBYTE inputup(UBYTE input);
extern void performant_delay(UBYTE num_loops);
extern void fade_out();
extern void fade_in();
extern void toggle_control(UBYTE toggle);
extern UBYTE check_walk_counter(GameCharacter* character);

extern void Call_Draw_Tile_At(UBYTE bank, UBYTE pos_x, UBYTE pos_y, UBYTE tile_num);
extern void Call_Reload_Map(UBYTE bank);
extern void Call_Load_Random_Combat(UBYTE bank);
extern void Call_Load_Combat(UBYTE bank, const GameTroop* troop);
extern void Call_Check_Step_Counter(UBYTE bank);
extern void Call_Orient_Char(UBYTE bank, GameCharacter *character);
extern void Call_Draw_Map(UBYTE bank, const GameMap *map);
extern void Call_Draw_Map_Line(UBYTE bank, const GameMap *map, UBYTE directiony);
extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter *character, const GameSprite *sprite);
extern void Call_Add_Item(UBYTE bank, GameItem *item, UBYTE amount);
extern void Call_Add_Equip(UBYTE bank, GameEquip *equip);
extern void Call_Scene_Handler(UBYTE bank, UBYTE scene_id);

extern void Call_Shop(UBYTE bank);

extern UBYTE Call_Check_Tile_Collision(UBYTE bank, const GameMap *map, GameCharacter *character, INT8 move_x, INT8 move_y);

extern void Menu();

const unsigned char chest_opened[] = {0xC4, 0xC5, 0xC7, 0xC9};

const unsigned char test_sign[10] = {1, 0, 0};

void hide_char(GameCharacter *character);

void move_screen(INT16 move_x, INT16 move_y);

void move_char(GameCharacter *character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);

void walk_distance(GameCharacter* character, INT8 move_x, INT8 move_y);

GameCharacter* check_char_collision(GameCharacter *character, INT8 move_x, INT8 move_y)
{
    if(char_npc_1.active && char_npc_1.visible && character->pos_x + move_x == char_npc_1.pos_x && character->pos_y + move_y == char_npc_1.pos_y)
    {
        return &char_npc_1;
    }
    else if (char_npc_2.active && char_npc_2.visible && character->pos_x + move_x == char_npc_2.pos_x && character->pos_y + move_y == char_npc_2.pos_y)
    {
        return &char_npc_2;
    }
    else
    {
        return NULL;
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

void read_message(const GameMessage *message, unsigned char *insert_1, UBYTE length_1, UBYTE speedable) //* Displays specified message.
{
    Call_Draw_Message(bank2, message, insert_1, length_1, speedable);
}

void open_shop(GameShop *shop)
{
    CurrentShop = shop->shop_id;

    Call_Shop(bank2);
}

void teleport_player(GameTele *event_tele) //* Teleports player to specified teleport.
{
    if(event_tele != &tele_null)
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

        if(event_tele->direction == up)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
        }
        else if(event_tele->direction == down)
        {
            Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
        }

        fade_in();

        if(event_tele->direction == up)
        {
            if (char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 5)
            {
                camera_focus = 0;
                
                walk_distance(&char_player, 0, -1);
            }
            else
            {
                camera_focus = 1;
                Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), up);
                
                walk_distance(&char_player, 0, -1);
            }
        }
        else if(event_tele->direction == down)
        {
            if (char_player.pos_y < 5 || char_player.pos_y >= map_size_y - 5)
            {
                camera_focus = 0;
                
                walk_distance(&char_player, 0, 1);
            }
            else
            {
                camera_focus = 1;
                Call_Draw_Map_Line(bank2, Get_Map(event_tele->map_id), down);
                
                walk_distance(&char_player, 0, 1);
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
    switch(chest_id)
    {
        case 0: //* Chest 0
            Call_Add_Equip(bank2, &equip_wooden_sword);
            break;
        case 1: //* Chest 1
            Call_Add_Item(bank2, &item_healing_brew, 2);
            break;
        default: //* Chest Default
            Call_Add_Item(bank2, &item_healing_brew, 1);
            break;
    }
}

void Check_NPC_Messenger()
{
    if (char_player.facing == up)
    {
        temp_char = check_char_collision(&char_player, 0, -1);

        if(temp_char != NULL && temp_char->npc_type == messenger)
        {
            temp_char->facing = down;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_down->sprites[0]);

            read_message(Get_Message(temp_char->action_id), NULL, 0, Get_Message(temp_char->action_id)->speedable);
            return;
        }
    }
    else if (char_player.facing == down)
    {
        temp_char = check_char_collision(&char_player, 0, 1);

        if(temp_char != NULL && temp_char->npc_type == messenger)
        {
            temp_char->facing = up;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_up->sprites[0]);

            read_message(Get_Message(temp_char->action_id), NULL, 0, Get_Message(temp_char->action_id)->speedable);
            return;
        }
    }
    else if (char_player.facing == left)
    {
        temp_char = check_char_collision(&char_player, -1, 0);

        if(temp_char != NULL && temp_char->npc_type == messenger)
        {
            temp_char->facing = right;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_right->sprites[0]);

            read_message(Get_Message(temp_char->action_id), NULL, 0, Get_Message(temp_char->action_id)->speedable);
            return;
        }
    }
    else if(char_player.facing == right)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == messenger)
        {
            temp_char->facing = left;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_left->sprites[0]);

            read_message(Get_Message(temp_char->action_id), NULL, 0, Get_Message(temp_char->action_id)->speedable);
            return;
        }
    }
}

void Check_NPC_Shopkeeper()
{
    if(char_player.facing == up)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == shopkeeper)
        {
            temp_char->facing = down;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_down->sprites[0]);

            open_shop(Get_Shop(temp_char->action_id));
            return;
        }
    }
    else if(char_player.facing == down)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == shopkeeper)
        {
            temp_char->facing = up;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_up->sprites[0]);

            open_shop(Get_Shop(temp_char->action_id));
            return;
        }
    }
    else if(char_player.facing == left)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == shopkeeper)
        {
            temp_char->facing = right;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_right->sprites[0]);

            open_shop(Get_Shop(temp_char->action_id));
            return;
        }
    }
    else if(char_player.facing == right)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == shopkeeper)
        {
            temp_char->facing = left;
            Call_Load_Char_Sprite(bank2, temp_char, temp_char->sprites->actor_left->sprites[0]);

            open_shop(Get_Shop(temp_char->action_id));
            return;
        }
    }
}

void Check_NPC_Trigger()
{
    if(char_player.facing == up)
    {
        temp_char = check_char_collision(&char_player, 0, -1);

        if(temp_char != NULL && temp_char->npc_type == trigger)
        {
            Call_Scene_Handler(bank2, temp_char->action_id);
            return;
        }
    }
    else if(char_player.facing == down)
    {
        temp_char = check_char_collision(&char_player, 0, 1);

        if(temp_char != NULL && temp_char->npc_type == trigger)
        {
            Call_Scene_Handler(bank2, temp_char->action_id);
            return;
        }
    }
    else if(char_player.facing == left)
    {
        temp_char = check_char_collision(&char_player, -1, 0);

        if(temp_char != NULL && temp_char->npc_type == trigger)
        {
            Call_Scene_Handler(bank2, temp_char->action_id);
            return;
        }
    }
    else if(char_player.facing == right)
    {
        temp_char = check_char_collision(&char_player, 1, 0);

        if(temp_char != NULL && temp_char->npc_type == trigger)
        {
            Call_Scene_Handler(bank2, temp_char->action_id);
            return;
        }
    }
}

void Check_Event_Shopkeeper()
{
    x = 0;
    y = 0;

    switch(char_player.facing)
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
        if (char_player.pos_x + x == current_map->event_shopkeeper[i]->pos_x && char_player.pos_y + y == current_map->event_shopkeeper[i]->pos_y)
        {
            open_shop(current_map->event_shopkeeper[i]->shop);
        }
    }
}

void Check_Event_Chest()
{
    if(char_player.facing == up)
    {
        for(i = 0; i < 10; i++)
        {
            tempChest = current_map->event_chest[i];

            if(flag_switch[tempChest->flag_switch] == false && tempChest != NULL && char_player.pos_x == tempChest->pos_x && char_player.pos_y - 1 == tempChest->pos_y)
            {
                Call_Draw_Tile_At(bank2, tempChest->pos_x, tempChest->pos_y, 59);
                r = tempChest->chest_id;
                read_message(current_map->event_chest[i]->message, NULL, 0, current_map->event_chest[i]->message->speedable);
                open_chest(r);
                flag_switch[tempChest->flag_switch] = true;
                return;
            }
        }    
    }
}

void Check_Event_Sign()
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
        if (char_player.pos_x + x == Get_Sign(current_map->event_sign[i])->pos_x && char_player.pos_y + y == Get_Sign(current_map->event_sign[i])->pos_y)
        {
            r = Get_Sign(current_map->event_sign[i])->message_id;
            read_message(Get_Message(r), NULL, 0, Get_Message(r)->speedable);
            return;
        }
    }
}

void Check_Event_Tele()
{
    for (i = 0; i < 10; i++)
    {
        if (char_player.pos_x == Get_Tele(current_map->event_tele[i])->pos_x && char_player.pos_y == Get_Tele(current_map->event_tele[i])->pos_y)
        {
            r = Get_Tele(current_map->event_tele[i])->tele_id;
            teleport_player(Get_Tele(r));
            return;
        }
    }
}

void Check_Event_Trigger()
{
    for(i = 0; i < 10; i++)
    {
        if(current_map->event_trigger[i] != &trigger_null && char_player.pos_x >= current_map->event_trigger[i]->pos_1[0] && char_player.pos_y >= current_map->event_trigger[i]->pos_1[1] && char_player.pos_x <= current_map->event_trigger[i]->pos_2[0] && char_player.pos_y <= current_map->event_trigger[i]->pos_2[1])
        {
            Call_Scene_Handler(bank2, current_map->event_trigger[i]->scene_id);
        }
    }
}

void Check_Ship()
{
    switch(char_player.facing)
    {
        case up: tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 0, -1); break;
        case down: tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 0, 1); break;
        case left: tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, -1, 0); break;
        case right: tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 1, 0); break;
    }

    if(InShipFlag == true && tile_collision == 0)
    {
        Call_Scene_Handler(bank2, 2);
    }
}

void hide_char(GameCharacter *character)
{
    if(character->active)
    {
        if(character->pos_x < char_player.pos_x - 6 || character->pos_y < char_player.pos_y - 6 || character->pos_x > char_player.pos_x + 5 || character->pos_y > char_player.pos_y + 5)
        {
            if(character->visible)
            {
                Call_Load_Char_Sprite(bank2, character, &sprite_clear);
                character->visible = false;
            }
        }
        else if(!character->visible)
        {
            Call_Load_Char_Sprite(bank2, character, character->sprites->actor_down->sprites[0]);
            character->visible = true;
        }
    }
}

void walk_distance(GameCharacter* character, INT8 move_x, INT8 move_y)
{
    u16_move_x = 16 * move_x;
    u16_move_y = 16 * move_y;

    if(move_x < 0)
    {
        u16_move_x = u16_move_x * -1;
    }

    if(move_y < 0)
    {
        u16_move_y = u16_move_y * -1;
    }

    if(move_x > 0)
    {
        character->walk_count[3] += u16_move_x;
    }
    else if(move_x < 0)
    {
        character->walk_count[2] += u16_move_x;
    }
    else if(move_y > 0)
    {
        character->walk_count[1] += u16_move_y;
    }
    else if(move_y < 0)
    {
        character->walk_count[0] += u16_move_y;
    }
}

void walk_player()
{
    if(char_player.walk_count[0] > 0)
    {
        scroll_bkg(0, -1);

        if(char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, 1);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, 1);
        }
        if(char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, 1);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, 1);
        }

        if(char_player.walk_length[0] == 0)
        {
            Call_Draw_Map_Line(bank2, current_map, up);
        }

        char_player.walk_count[0]--;

        char_player.walk_length[0]++;

        if(char_player.walk_length[0] == 16)
        {
            char_player.walk_length[0] = 0;
        }

        if(char_player.walk_length[0] == 0)
        {
            char_player.pos_y--;

            camera_y = camera_y - 2;
            if (camera_y == 254)
            {
                camera_y = 30;
            }

            Check_Event_Trigger(); 
            Check_Event_Tele();

            if(current_map->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
    else if(char_player.walk_count[1] > 0)
    {
        scroll_bkg(0, 1);

        if(char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 0, -1);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 0, -1);
        }
        if(char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 0, -1);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 0, -1);
        }

        if(char_player.walk_length[1] == 0)
        {
            Call_Draw_Map_Line(bank2, current_map, down);
        }

        char_player.walk_count[1]--;

        char_player.walk_length[1]++;

        if(char_player.walk_length[1] == 16)
        {
            char_player.walk_length[1] = 0;
        }

        if(char_player.walk_length[1] == 0)
        {
            char_player.pos_y++;

            camera_y = camera_y + 2;
            if (camera_y == 32)
            {
                camera_y = 0;
            }

            Check_Event_Trigger();
            Check_Event_Tele();

            if(current_map->combat)
            {
                Call_Check_Step_Counter(bank2);
            }
        }
    }
    else if(char_player.walk_count[2] > 0)
    {
        scroll_bkg(-1, 0);

        if(char_npc_1.active)
        {
            scroll_sprite(char_npc_1.sprite_id[0], 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 1, 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 2, 1, 0);
            scroll_sprite(char_npc_1.sprite_id[0] + 3, 1, 0);
        }
        if(char_npc_2.active)
        {
            scroll_sprite(char_npc_2.sprite_id[0], 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 1, 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 2, 1, 0);
            scroll_sprite(char_npc_2.sprite_id[0] + 3, 1, 0);
        }

        if(char_player.walk_length[2] == 0)
        {
            Call_Draw_Map_Line(bank2, current_map, left);
        }

        char_player.walk_count[2]--;

        char_player.walk_length[2]++;

        if(char_player.walk_length[2] == 16)
        {
            char_player.walk_length[2] = 0;
        }

        if(char_player.walk_length[2] == 0)
        {
            char_player.pos_x--;

            camera_x = camera_x - 2;
            if(camera_x == 254)
            {
                camera_x = 30;
            }

            Check_Event_Trigger();
            Check_Event_Tele();

            if(current_map->combat)
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

        if(char_player.walk_length[3] == 0)
        {
            Call_Draw_Map_Line(bank2, current_map, right);
        }

        char_player.walk_count[3]--;

        char_player.walk_length[3]++;

        if(char_player.walk_length[3] == 16)
        {
            char_player.walk_length[3] = 0;
        }

        if(char_player.walk_length[3] == 0)
        {
            char_player.pos_x++;

            camera_x = camera_x + 2;
            if (camera_x == 32)
            {
                camera_x = 0;
            }

            Check_Event_Trigger();
            Check_Event_Tele();

            if(current_map->combat)
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

        character->walk_count[0]--;

        character->walk_length[0]++;

        if(character->walk_length[0] == 16)
        {
            character->walk_length[0] = 0;
        }

        if(character->walk_length[0] == 0)
        {
            character->pos_y--;

            if(character == &char_player)
            {
                Check_Event_Trigger(); 
                Check_Event_Tele();
            }
        }
    }
    else if (character->walk_count[1] > 0)
    {
        scroll_sprite(character->sprite_id[0], 0, 1);
        scroll_sprite(character->sprite_id[0] + 1, 0, 1);
        scroll_sprite(character->sprite_id[0] + 2, 0, 1);
        scroll_sprite(character->sprite_id[0] + 3, 0, 1);

        character->walk_count[1]--;

        character->walk_length[1]++;

        if(character->walk_length[1] == 16)
        {
            character->walk_length[1] = 0;
        }

        if(character->walk_length[1] == 0)
        {
            character->pos_y++;

            if(character == &char_player)
            {
                Check_Event_Trigger(); 
                Check_Event_Tele();
            }
        }
    }
    else if (character->walk_count[2] > 0)
    {
        scroll_sprite(character->sprite_id[0], -1, 0);
        scroll_sprite(character->sprite_id[0] + 1, -1, 0);
        scroll_sprite(character->sprite_id[0] + 2, -1, 0);
        scroll_sprite(character->sprite_id[0] + 3, -1, 0);

        character->walk_count[2]--;

        character->walk_length[2]++;

        if(character->walk_length[2] == 16)
        {
            character->walk_length[2] = 0;
        }

        if(character->walk_length[2] == 0)
        {
            character->pos_x--;
            
            if(character == &char_player)
            {
                Check_Event_Trigger(); 
                Check_Event_Tele();
            }
        }
    }
    else if (character->walk_count[3] > 0)
    {
        scroll_sprite(character->sprite_id[0], 1, 0);
        scroll_sprite(character->sprite_id[0] + 1, 1, 0);
        scroll_sprite(character->sprite_id[0] + 2, 1, 0);
        scroll_sprite(character->sprite_id[0] + 3, 1, 0);

        character->walk_count[3]--;

        character->walk_length[3]++;

        if(character->walk_length[3] == 16)
        {
            character->walk_length[3] = 0;
        }

        if(character->walk_length[3] == 0)
        {
            character->pos_x++;

            if(character == &char_player)
            {
                Check_Event_Trigger(); 
                Check_Event_Tele();
            }
        }
    }
}

void Walk_Chars()
{
    if(char_npc_1.active == true)
    {
        walk_char(&char_npc_1);
    }

    if(char_npc_2.active == true)
    {
        walk_char(&char_npc_2);
    }

    if(char_npc_3.active == true)
    {
        walk_char(&char_npc_3);
    }

    if(char_npc_4.active == true)
    {
        walk_char(&char_npc_4);
    }

    if(camera_focus == false)
    {
        walk_char(&char_player);
    }
    else
    {
        walk_player();
    }
}

void Update_Joypad() //* Updates player action using button presses
{
    Joy = joypad();

    if(Joy & J_A && !check_walk_counter(&char_player) && !ADownFlag)
    {
        Check_Event_Sign();
        Check_NPC_Messenger();
        Check_NPC_Shopkeeper();
        Check_NPC_Trigger();
        Check_Event_Chest();
        Check_Event_Shopkeeper();
        Check_Event_Trigger();

        ADownFlag = true;
    }

    if(inputup(J_A))
    {
        ADownFlag = false;
    }

    if(Joy & J_B && !check_walk_counter(&char_player))
    {
        Check_Ship();
    }

    if(Joy & J_SELECT)
    {
    }

    if(Joy & J_START && !check_walk_counter(&char_player))
    {
        Menu();
    }

    if(Joy & J_UP && PlayerControlFlag && !check_walk_counter(&char_player))
    {
        if(char_player.pos_y > 0)
        {
            tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 0, -1);

            if(char_player.pos_y <= 5 || char_player.pos_y > map_size_y - 4)
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 0, -1))
                {
                    char_player.facing = up;
                    camera_focus = false;

                    walk_distance(&char_player, 0, -1);
                }
                else
                {
                    char_player.facing = up;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
                }
            }
            else
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 0, -1))
                {
                    char_player.facing = up;
                    camera_focus = true;

                    walk_distance(&char_player, 0, -1);
                }
                else
                {
                    char_player.facing = up;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_up->sprites[0]);
                }
            }
        }
    }

    else if(Joy & J_DOWN && PlayerControlFlag && !check_walk_counter(&char_player))
    {
        if(char_player.pos_y < map_size_y - 1)
        {
            tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 0, 1);

            if(char_player.pos_y <= 4 || char_player.pos_y >= map_size_y - 4)
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 0, 1))
                {
                    char_player.facing = down;
                    camera_focus = false;

                    walk_distance(&char_player, 0, 1);
                }
                else
                {
                    char_player.facing = down;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
                }
            }
            else
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 0, 1))
                {
                    char_player.facing = down;
                    camera_focus = true;

                    walk_distance(&char_player, 0, 1);
                }
                else
                {
                    char_player.facing = down;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_down->sprites[0]);
                }
            }
        }
    }

    else if(Joy & J_LEFT && PlayerControlFlag && !check_walk_counter(&char_player))
    {
        if(char_player.pos_x > 0)
        {
            tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, -1, 0);

            if(char_player.pos_x <= 5 || char_player.pos_x > map_size_x - 5)
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, -1, 0))
                {
                    char_player.facing = left;
                    camera_focus = false;

                    walk_distance(&char_player, -1, 0);
                }
                else
                {
                    char_player.facing = left;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
                }
            }
            else
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, -1, 0))
                {
                    char_player.facing = left;
                    camera_focus = true;

                    walk_distance(&char_player, -1, 0);
                }
                else
                {
                    char_player.facing = left;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_left->sprites[0]);
                }
            }
        }
    }

    else if(Joy & J_RIGHT && PlayerControlFlag && !check_walk_counter(&char_player))
    {
        if(char_player.pos_x < map_size_x - 1)
        {
            tile_collision = Call_Check_Tile_Collision(bank2, current_map, &char_player, 1, 0);

            if(char_player.pos_x < 5 || char_player.pos_x >= map_size_x - 5)
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 1, 0))
                {
                    char_player.facing = right;
                    camera_focus = false;

                    walk_distance(&char_player, 1, 0);
                }
                else
                {
                    char_player.facing = right;
                    Call_Load_Char_Sprite(bank2, &char_player, char_player.sprites->actor_right->sprites[0]);
                }
            }
            else
            {
                if(PlayerControlFlag && Check_Collision(tile_collision) && !check_char_collision(&char_player, 1, 0))
                {
                    char_player.facing = right;
                    camera_focus = true;

                    walk_distance(&char_player, 1, 0);
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

void test_update_npc()
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

void Update_Chest()
{
    for(i = 0; i < 10; i++)
    {
        tempChest = current_map->event_chest[i];

        if(tempChest != NULL && flag_switch[tempChest->flag_switch] == true && ((char_player.pos_x <= tempChest->pos_x + 5 && char_player.pos_x + 5 >= tempChest->pos_x) && (char_player.pos_y <= tempChest->pos_y + 5 && char_player.pos_y + 5 >= tempChest->pos_y)))
        {
            Call_Draw_Tile_At(bank2, tempChest->pos_x, tempChest->pos_y, 59);
        }
    }
}

void Update_NPC()
{
}