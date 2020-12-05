#include <gb/gb.h>
#include <rand.h>
#include <string.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Object_Actors.c"
#include "Game_Item.h"
#include "Object_Items.c"
#include "Game_Equip.h"
#include "Object_Equips.c"
#include "Game_Class.h"
#include "Object_Classes.c"
#include "Game_Enemy.h"
#include "Object_Enemies.c"
#include "Game_Troop.h"
#include "Game_Character.h"
#include "Object_Characters.c"
#include "Game_Sprite.h"
#include "Object_Sprites.c"
#include "Game_Map.h"
#include "Object_Maps.c"
#include "Game_Event.h"
#include "Object_Events.c"
#include "Game_Message.h"
#include "Object_Messages.c"
#include "Game_NPC.h"
#include "Object_NPCs.c"
#include "Game_Shop.h"
#include "Object_Shops.c"
#include "Game_Tilemap.h"
#include "Object_Tilemaps.c"
#include "Music/gbt_player.h"

/*--------------------------------------------*/

/*  Game Variables:  */
UBYTE Playing = 0, Joy = 0, Seed = 0;

UBYTE current_bank = 2, held_bank = 0;

UBYTE CurrentMap = 0, CurrentMapBank = 0, Tileset = 0, Collision = 0;

UBYTE confirm_x = 0, confirm_y = 0;

UBYTE CurrentCombat = 0, CurrentTroop = 0, combat_main_y = 0, combat_selection_y = 0, CurrentTurn = 0, turn_number = 0, CurrentTarget = 0, total_actors = 0, selected_enemy = 0, enemy_selection[4] = {0, 0, 0, 0}, action_selection[4] = {0, 0, 0, 0}, target_selection[7] = {0, 0, 0, 0, 0, 0, 0}, skill_selection[7] = {0, 0, 0, 0, 0, 0, 0}, action_order[7] = {0, 0, 0, 0, 0, 0, 0}, enemy_x, actor_action[4] = {0, 0, 0, 0}, enemy_action[3] = {0, 0, 0}, message_x = 0, message_y = 0;

UINT16 agility[7] = {0, 0, 0, 0, 0, 0, 0}, turn_order[7] = {0, 0, 0, 0, 0, 0, 0}, agility_temp = 0, turn_order_temp = 0, skill_damage = 0, damage_modifier = 0;

UBYTE CurrentMenu = 0, CurrentSelection = 0, selection_max = 5, CurrentShop = 0, CurrentShopSelection = 0, shop_message_x = 0;

UBYTE slot_1_filled = 0, slot_2_filled = 0, amount_1 = 0, amount_2 = 0, slot_selected = 0, CurrentItemType = 0, CurrentItemSlot = 0, CurrentItemSelection = 0, CurrentEquipSelection = 0, CurrentSkillSelection[4] = {0, 0, 0, 0}, skill_y[4] = {0, 0, 0, 0}, menu_x = 0, menu_y = 0;

UBYTE selection_x = 0, selection_y = 0, slot_1 = 0, slot_2 = 0, item_1 = 0, item_2 = 0, item_slots = 0, party_y = 0, party_max = 0, actor_y = 0, actor_max = 0, equip_y = 0, list_y = 0, stat_change = 0, held_equip = 0, held_stat = 0, skills_y = 0, shop_x = 0, shop_y = 0, ware_count = 0;

UINT8 PlayerCharacter = 0;

UINT16 grid_x = 0, grid_y = 0, tile = 0;

UBYTE camera_x = 0, camera_y = 0, base_byte = 0, count_byte = 0;

UINT8 map_size_x = 0, map_size_y = 0;

UINT8 clock_tick = 0, walk_tick = 0, blink_tick = 0;

UINT8 camera_focus = 0;

UBYTE current_message = 0, current_line = 0, total_lines = 0, current_row = 0, font_value = 0;

UINT16 map_x = 0, map_y = 0, map_pos = 0, map_y2 = 0, load_pos_y_held = 0, load_pos_x = 0, load_pos_y = 0, char_pos_x = 0, char_pos_y = 0;

UBYTE event_x = 0, event_y = 0;

UBYTE parsed_number = 0;

UINT16 saved_number = 0, large_number = 0;

UINT16 party_gold = 500;

UINT16 clock_time_second = 0, clock_time_minute = 0, clock_time_hour = 0;

UBYTE step_counter = 6, encounter_rate = 50, encounter_value = 0;

INT8 i = 0, j = 0, k = 0, l = 0, m = 0, n = 0, r = 0, x = 0, y = 0;

UBYTE u_i = 0, u_j = 0, u_x = 0, u_y = 0, u_l = 0, u_k = 0;

INT16 s16_i = 0, s16_j = 0;

UINT16 u16_i = 0, u16_j = 0;

UINT16 d = 0, e = 0, f = 0, g = 0, h = 0;

unsigned char message_base[16];

unsigned char parsed_decimal[4] = {0, 0, 0, 0};

unsigned char held_decimal[3] = {0, 0, 0};

unsigned char inventory[99];

unsigned char inv_amount[99];

unsigned char equipment[99];

unsigned char equipment_weapon[30];

unsigned char equipment_secondary[30];

unsigned char equipment_armor[30];

unsigned char equipment_accessory[30];

unsigned char flag_switch[255];

unsigned char party[4] = {0, 0, 0, 0};

unsigned char enemy[3] = {0, 0, 0};

unsigned char name_hiro[7] =
{
    0x42, 0x1E, 0x27, 0x24, 0x01, 0x01, 0x01
};

unsigned char name_bud[7] =
{
    0x3C, 0x2B, 0x19, 0x01, 0x01, 0x01, 0x01
};

unsigned char name_soran[7] =
{
    0x4D, 0x24, 0x27, 0x16, 0x23, 0x01, 0x01
};

const unsigned char Message_Pointer[1] =
{
    0xD2
};

const unsigned char Message_Background[1] =
{
    0xD3
};

const unsigned char Char_Gold[1] =
{
    0x1C
};

const unsigned char Char_Period[1] =
{
    0x55
};

extern const UINT16 Experience_List[];

extern const unsigned char song_Data[];

GameEnemyDummy enemy_dummy_1;
GameEnemyDummy enemy_dummy_2;
GameEnemyDummy enemy_dummy_3;

/*  Save Variables:  */
extern UBYTE saved_pos_x, saved_pos_y;
extern UBYTE saved_direction;
extern UBYTE saved_map;
extern UBYTE saved_game_start;
extern UINT16 saved_clock_time_second, saved_clock_time_minute, saved_clock_time_hour;
extern unsigned char saved_inventory[99];
extern unsigned char saved_inv_amount[99];
extern GameActor saved_actor_hiro;

/*  Game Flags:  */
UBYTE game_scene = 0;

UBYTE PlayerControlFlag = 0;

UBYTE MessageBoxFlag = 0;

UBYTE TitleScreenEnabledFlag = 0;

/*--------------------------------------------*/

/*  Bank 0  */
void performant_delay(UINT8 num_loops);
void fade_out();
void fade_in();
void clear_sprites();
void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0);
void set_bkg_tileset(UINT8 first_tile, UINT8 num_tile, unsigned char *tileset);
void toggle_control(UBYTE toggle);

void Call_Draw_Map(UBYTE bank, GameMap* map);
void Call_Draw_Map_Line(UBYTE bank, GameMap* map, UBYTE direction);
void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset);

void Menu();
void Gameplay();

void main();

/*  Bank 2  */
extern void build_char(GameCharacter* character);
extern void move_char(GameCharacter* character, UBYTE tile_x, UBYTE tile_y, UBYTE pixel_offset);
extern void walk_player();
extern void walk_char(GameCharacter* character);
extern void Check_Event_Tele();
extern void hide_char(GameCharacter* character);

extern void Update_Joypad();
extern void test_update_npc();
extern void Update_Anim_Walk();
extern void Update_NPC();

/*  Bank 3  */
extern void Clear_Map();
extern void Reload_Map();

extern void Load_Tileset(UBYTE tileset);
extern void Orient_Char(GameCharacter* character);
extern void Draw_Map(GameMap* map);
extern void Draw_Titlescreen();

extern void Load_Hiro_Tiles();

/*  Bank 4  */
extern void Load_Char_Sprite(GameCharacter* character, GameSprite* sprite);
extern void Set_Char_Tile(GameCharacter* character, UBYTE tile, GameSprite* sprite);
extern void Set_Sprite_Packages(GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right);

/*  Bank 5  */
extern void Add_NPC(GameCharacter* character, GameNPC* npc);
extern void Reset_NPC();

/*  Bank 6  */
extern UBYTE Retrieve_Font_Value();
extern void Load_Window();
extern void Load_Message_Box();
extern void scroll_message();
extern void clear_message();
extern void clear_messagebox();
extern void Draw_Pointer();
extern void Draw_Message_Box();
extern void Close_Message_Box();
extern void reset_char_sprites();

/*  Bank 7  */
extern void Add_Item(GameItem* item, UBYTE amount);
extern void Add_Actor(GameActor* actor);
extern void Draw_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y);
extern void Draw_Name(UBYTE tile_x, UBYTE tile_y, unsigned char* name, UBYTE full_name);
extern void Load_Font_Menu();
extern void Draw_Main_Menu();
extern void Update_Menu_Joypad();
extern void Menu_Main();
extern void Load_Menu_Main();

/*  Bank 8  */
extern void Draw_Map_Bank8(GameMap* map);
extern void Draw_Line_Bank8(GameMap* map, UBYTE direction);
extern UBYTE Check_Tile_Collision_Bank8(GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y);

/*  Bank 9  */
extern void Draw_Map_Bank9(GameMap* map);
extern void Draw_Line_Bank9(GameMap* map, UBYTE direction);
extern UBYTE Check_Tile_Collision_Bank9(GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y);

/*  Bank 10  */
extern void Load_Message_Bank10(GameMessage* message);

/*  Bank 11  */
extern void Play_Buzz();
extern void Play_Use();
extern void Play_Confirm();

/*  Bank 12  */
extern void Add_Equip(GameEquip* equip);
extern void Equip_Equipment(GameActor* actor, GameEquip* equip);
extern void Draw_Equip_Description_Large(GameEquip* equip);
extern void Menu_Equip();
extern void Load_Menu_Equip();

/*  Bank 13  */
extern void Menu_Item();
extern void Draw_Item_Description(GameItem* item);

/*  Bank 14  */
extern void Load_Menu_Status();

/*  Bank 15  */
extern void Load_Menu_Skills();

/*  Bank 16  */
extern void Load_Combat_Main();
extern void Check_Step_Counter();
extern void Draw_Troop(unsigned char* tiles, unsigned char* data);
extern void Draw_Skill_Name(GameSkill* skill, UBYTE tile_x, UBYTE tile_y);
extern void Load_Battle_Message_Box();

/*  Bank 17  */
extern void Execute_Skill(UBYTE skill_id, UBYTE action_performer, UBYTE action_target);
extern void Draw_Skill_Cost(GameSkill* skill);
extern UBYTE Get_Skill_Cost(GameSkill* skill);
extern void Draw_End_Message();
extern void Set_Actor_Skills(GameActor* actor);
extern void Draw_Skills_Name(GameSkill* skill, UBYTE tile_x, UBYTE tile_y);
extern void Draw_Skill_Name(GameSkill* skill, UBYTE tile_x, UBYTE tile_y);

/*  Bank 18  */
extern void Draw_Map_Bank18(GameMap* map);
extern void Draw_Line_Bank18(GameMap* map, UBYTE direction);
extern UBYTE Check_Tile_Collision_Bank18(GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y);

/*  Bank 19  */
extern void Load_Shop();

/*  Bank 20  */
extern void Scene_Handler(UBYTE scene_id);

/*--------------------------------------------*/

/*  Scene Functions  */
void switch_bank(UBYTE bank)
{
    SWITCH_ROM_MBC1(bank);
}

void performant_delay(UBYTE num_loops)
{
    for(g = 0; g < num_loops; g++)
    {
        wait_vbl_done();
    }
}

void fade_out()
{
    for(i = 0; i < 4; i++)
    {
        switch(i)
        {
            case 0:
                BGP_REG = 0xE4;
                OBP0_REG = 0xE4;
                break;
            case 1:
                BGP_REG = 0xF9;
                OBP0_REG = 0xF9;
                break;
            case 2:
                BGP_REG = 0xFE;
                OBP0_REG = 0xFE;
                break;
            case 3:
                BGP_REG = 0xFF;
                OBP0_REG = 0xFF;
                break;
        }

        performant_delay(4);
    }
}

void fade_in()
{
    for(i = 0; i < 4; i++)
    {
        switch(i)
        {
            case 0:
                BGP_REG = 0xFF;
                OBP0_REG = 0xFF;
                break;
            case 1:
                BGP_REG = 0xFE;
                OBP0_REG = 0xF9;
                break;
            case 2:
                BGP_REG = 0xF9;
                OBP0_REG = 0xE4;
                break;
            case 3:
                BGP_REG = 0xE4;
                OBP0_REG = 0xD0;
                break;
        }

        performant_delay(4);
    }
}

void flash_out()
{
    for(i = 0; i < 4; i++)
    {
        switch(i)
        {
            case 0:
                BGP_REG = 0xE4;
                OBP0_REG = 0xE4;
                break;
            case 1:
                BGP_REG = 0x90;
                OBP0_REG = 0x90;
                break;
            case 2:
                BGP_REG = 0x40;
                OBP0_REG = 0x40;
                break;
            case 3:
                BGP_REG = 0x00;
                OBP0_REG = 0x00;
                break;
        }

        performant_delay(4);
    }
}

void flash_in()
{
    for(i = 0; i < 4; i++)
    {
        switch(i)
        {
            case 0:
                BGP_REG = 0x00;
                OBP0_REG = 0x00;
                break;
            case 1:
                BGP_REG = 0x40;
                OBP0_REG = 0x40;
                break;
            case 2:
                BGP_REG = 0x90;
                OBP0_REG = 0x90;
                break;
            case 3:
                BGP_REG = 0xE4;
                OBP0_REG = 0xE4;
                break;
        }

        performant_delay(4);
    }
}

void flash_screen()
{
    for(i = 0; i < 4; i++)
    {
        BGP_REG = 0x90;
        OBP0_REG = 0x90;

        wait_vbl_done();

        BGP_REG = 0xE4;
        OBP0_REG = 0xE4;
    }
}

void shake_screen()
{
    for(r = 0; r < 3; r++)
    {
        scroll_bkg(-2, 0);

        performant_delay(2);

        scroll_bkg(2, 0);

        performant_delay(2);

        scroll_bkg(2, 0);

        performant_delay(2);

        scroll_bkg(-2, 0);

        performant_delay(2);
    }

    performant_delay(20);
}

void scroll_screen(INT8 move_x, INT8 move_y)
{
    s16_i = move_x * 16;
    s16_j = move_y * 16;
    scroll_bkg(move_x, move_y);
}

void clear_sprites()
{
    for(i = 0; i < 20; i++)
    {
        set_sprite_tile(i, 70);
    } 
}

void set_bkg_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0)
{
    VBK_REG = 1;
    
    set_bkg_tiles(tile_x, tile_y, width, height, map_1);

    VBK_REG = 0;

    set_bkg_tiles(tile_x, tile_y, width, height, map_0);

}

void set_win_map(UINT8 tile_x, UINT8 tile_y, UINT8 width, UINT8 height, unsigned char *map_1, unsigned char *map_0)
{
    VBK_REG = 1;

    set_win_tiles(tile_x, tile_y, width, height, map_1);

    VBK_REG = 0;

    set_win_tiles(tile_x, tile_y, width, height, map_0);

}

void set_bkg_tileset(UBYTE first_tile, UBYTE num_tile, unsigned char *tileset)
{
    set_bkg_data(first_tile, num_tile, tileset);
}

void toggle_control(UBYTE toggle)
{
    PlayerControlFlag = toggle;
}

/*--------------------------------------------*/

/*  General Functions  */

void Init_Variables()
{
    memset(inventory, 0, 99);
    memset(inv_amount, 0, 99);
    memset(equipment, 0, 99);
    memset(equipment_weapon, 0, 30);
    memset(equipment_secondary, 0, 30);
    memset(equipment_armor, 0, 30);
    memset(equipment_accessory, 0, 30);
    memset(flag_switch, 0, 255);
}

void Set_Start_Variables(void)
{
    PlayerControlFlag = true;
    char_player.pos_x = 6;
    char_player.pos_y = 6;
    CurrentMap = 0;
    
    char_npc_2.active == true;

    inv_amount[0] = 1;

    switch_bank(bank7);

    Add_Actor(&actor_hiro);
    Add_Actor(&actor_bud);
    Add_Actor(&actor_soran);

    switch_bank(bank12);

    Add_Equip(&equip_wooden_staff);
    Add_Equip(&equip_metal_rod);
    Add_Equip(&equip_mythril_rod);
    Add_Equip(&equip_rod_of_spark);

    Equip_Equipment(&actor_hiro, &equip_wooden_sword);
    Equip_Equipment(&actor_hiro, &equip_hoplon);
    Equip_Equipment(&actor_hiro, &equip_cotton_garb);
    Equip_Equipment(&actor_hiro, &equip_copper_bracelet);
}

void Refresh_Inv_Amount(void)
{
    for(i = 0; i < 99; i ++)
    {
        if(inventory[i] < 1)
        {
            inv_amount[i] = 0;
        }
    }
}

void Save_Variables(void) //* Saves all "save" variables.
{
    saved_pos_x = char_player.pos_x;
    saved_pos_y = char_player.pos_y;

    saved_clock_time_second = clock_time_second;
    saved_clock_time_minute = clock_time_minute;
    saved_clock_time_hour = clock_time_hour;

    saved_map = CurrentMap;

    memcpy(saved_inventory, &inventory, sizeof(saved_inventory));
    memcpy(saved_inv_amount, &inv_amount, sizeof(saved_inv_amount));

    saved_game_start = true;
}

void Count_Actors(void) //* Counts current actors and stores result in "total_actors".
{
    if(party[3] > 0)
    {
        total_actors = 3;
    }
    else if(party[2] > 0)
    {
        total_actors = 2;
    }
    else if(party[1] > 0)
    {
        total_actors = 1;
    }
    else
    {
        total_actors = 0;
    }
}

/*--------------------------------------------*/

/*  Game Functions  */
GameActor* Get_Actor(UBYTE actor_id)
{
    switch(actor_id)
    {
        case 0:
            return &actor_null;
            break;
        case 1:
            return &actor_hiro;
            break;
        case 2:
            return &actor_bud;
            break;
        case 3:
            return &actor_soran;
            break;
        default:
            return &actor_null;
            break;
    }
}

GameClass* Get_Class(UBYTE class_id)
{
    switch(class_id)
    {
        case 0:
            return &class_traveler;
            break;
        case 1:
            return &class_knight;
            break;
        case 2:
            return &class_white_mage;
            break;
        case 3:
            return &class_black_mage;
            break;
        default:
            return &class_traveler;
            break;
    }
}

GameItem* Get_Item(UBYTE item_id)
{
    switch(item_id)
    {
        case 0:
            return &item_null;
            break;
        case 1:
            return &item_healing_brew;
            break;
        case 2:
            return &item_life_leaf;
            break;
        case 3:
            return &item_mana_brew;
            break;
        default:
            return &item_null;
            break;
    }
}

GameEquip* Get_Equip(UBYTE equip_id)
{
    switch(equip_id)
    {
        case 0:
            return &equip_null;
            break;
        case 1:
            return &equip_wooden_sword;
            break;
        case 21:
            return &equip_wooden_staff;
            break;
        case 41:
            return &equip_metal_rod;
            break;
        case 43:
            return &equip_mythril_rod;
            break;
        case 45:
            return &equip_rod_of_spark;
            break;
        case 61:
            return &equip_hoplon;
            break;
        case 81:
            return &equip_cotton_garb;
            break;
        case 101:
            return &equip_copper_bracelet;
            break;
        default:
            return &equip_null;
            break;
    }
}

GameMap* Get_Map(UBYTE map_id)
{
    switch(map_id)
    {
        case 0:
            return &map_plum_village;
            break;
        case 1:
            return &map_hiro_house;
            break;
        case 2:
            return &map_plum_item_shop;
            break;
        case 3:
            return &map_bud_house;
            break;
        case 4:
            return &map_yggdrid;
            break;
        default:
            return &map_plum_village;
            break;
    }
}

GameEnemy* Get_Enemy(UBYTE enemy_id)
{
    switch(enemy_id)
    {
        case 0:
            return &enemy_null;
            break;
        case 1:
            return &enemy_bee;
            break;
        case 2:
            return &enemy_wolf;
            break;
        case 3:
            return &enemy_slime;
            break;
        default:
            return &enemy_null;
            break;
    }
}

GameTroop* Get_Troop(UBYTE troop_id)
{
    switch(troop_id)
    {
        case 0:
            return &troop_bee1;
            break;
        case 1:
            return &troop_wolf1;
            break;
        case 2:
            return &troop_bee2;
            break;
        case 3:
            return &troop_slime1;
            break;
        default:
            return &troop_bee1;
            break;
    }
}

GameSkill* Get_Skill(UBYTE skill_id)
{
    switch(skill_id)
    {
        case 0:
            return &skill_null;
            break;
        case 1:
            return &skill_hit;
            break;
        case 2:
            return &skill_use_item;
            break;
        case 3:
            return &skill_reckless_charge;
            break;
        case 23:
            return &skill_cure;
            break;
        case 43:
            return &skill_fireball;
            break;
        case 44:
            return &skill_thunder;
            break;
        case 45:
            return &skill_blizzard;
            break;
        default:
            return &skill_null;
            break;
    }
}

GameTele* Get_Tele(UBYTE tele_id)
{
    switch(tele_id)
    {
        case 0:
            return &tele_null;
            break;
        case 1:
            return &tele_plum_hiro;
            break;
        case 2:
            return &tele_hiro_plum;
            break;
        case 3:
            return &tele_plum_bud;
            break;
        case 4:
            return &tele_bud_plum;
            break;
        case 5:
            return &tele_plum_yggdrid;
            break;
        case 6:
            return &tele_yggdrid_plum;
            break;
        case 7:
            return &tele_plum_item_shop;
            break;
        case 8:
            return &tele_item_shop_plum;
            break;
        default:
            return &tele_null;
            break;
    }
}

GameMessage* Get_Message(UBYTE message_id)
{
    switch(message_id)
    {
        case 0:
            return &message_test;
            break;
        case 1:
            return &message_plum_headstone;
            break;
        default:
            return &message_test;
            break;
    }
}

GameSign* Get_Sign(UBYTE sign_id)
{
    switch(sign_id)
    {
        case 0:
            return &sign_null;
            break;
        case 1:
            return &sign_plum_gravestone;
            break;
        case 2:
            return &sign_test;
            break;
        default:
            return &sign_null;
            break;
    }
}

GameShop* Get_Shop(UBYTE shop_id)
{
    switch(shop_id)
    {
        case 0:
            return &shop_test;
            break;
        case 1:
            return &shop_plumvillage_item;
            break;
        default:
            return &shop_test;
            break;
    }
}

UINT16 Get_Experience(UBYTE bank, UINT16 actor_level)
{
    switch_bank(bank14);

    h = Experience_List[actor_level - 1];

    switch_bank(bank);

    return h;
}

UINT16 Get_Required_AP(UBYTE bank, GameSkill* skill)
{
    switch_bank(bank17);

    h = skill->required_ap;

    switch_bank(bank);

    return h;
}

UINT16 Get_Skill_Useable(UBYTE bank, GameSkill* skill)
{
    switch_bank(bank17);

    h = skill->menu_use;

    switch_bank(bank);

    return h;
}

UBYTE Get_Font_Value(UBYTE bank)
{
    switch_bank(bank6);

    font_value = Retrieve_Font_Value();

    switch_bank(bank);

    return font_value;
}

void Call_Draw_Message(UBYTE bank, GameMessage* message) //* Loads message box and draws specified message.
{
    switch_bank(message->bank);

    switch(message->bank)
    {
        case bank10:
            Load_Message_Bank10(message);
            break;
        default:
            break;
    }

    switch_bank(bank);
}

void Call_Load_Tileset(UBYTE bank, UBYTE tileset) //* Loads specified tileset.
{
    switch_bank(3);

    Load_Tileset(tileset);

    switch_bank(bank);
}

void Call_Draw_Map(UBYTE bank, GameMap* map)
{
    switch_bank(bank3);

    Draw_Map(map);

    switch_bank(bank);
}

void Call_Draw_Map_Load(UBYTE bank, GameMap* map) //* Draws specified map.
{
    switch_bank(map->map_bank);

    switch(map->map_bank)
    {
        case 8:
            Draw_Map_Bank8(map);
            break;
        case 9:
            Draw_Map_Bank9(map);
            break;
        case 18:
            Draw_Map_Bank18(map);
            break;
        default:
            Draw_Map_Bank8(map);
            break;
    }

    switch_bank(bank);
}

void Call_Draw_Map_Line(UBYTE bank, GameMap* map, UBYTE direction) //* Draws specified map's line.
{
    switch_bank(map->map_bank);

    switch(map->map_bank)
    {
        case 8:
            Draw_Line_Bank8(map, direction);
            break;
        case 9:
            Draw_Line_Bank9(map, direction);
            break;
        case 18:
            Draw_Line_Bank18(map, direction);
            break;
        default:
            Draw_Line_Bank8(map, direction);
            break;
    }

    switch_bank(bank);
}

UBYTE Call_Check_Tile_Collision(UBYTE bank, GameMap* map, GameCharacter* character, INT8 move_x, INT8 move_y)
{
    switch(map->map_bank)
    {
        case 8:
            switch_bank(bank8);
            Collision = Check_Tile_Collision_Bank8(map, character, move_x, move_y);
            break;
        case 9:
            switch_bank(bank9);
            Collision = Check_Tile_Collision_Bank9(map, character, move_x, move_y);
            break;
        case 18:
            switch_bank(bank18);
            Collision = Check_Tile_Collision_Bank18(map, character, move_x, move_y);
            break;
        default:
            switch_bank(bank8);
            Collision = Check_Tile_Collision_Bank8(map, character, move_x, move_y);
            break;
    }

    switch_bank(bank);

    return Collision;
}

void Call_Draw_Pointer(UBYTE bank)
{
    switch_bank(bank6);

    Draw_Pointer();

    switch_bank(bank);
}

void Call_Build_Char(UBYTE bank, GameCharacter* character) //* Assembles character's tiles.
{
    switch_bank(bank2);

    build_char(character);

    switch_bank(bank);
}

void Call_Orient_Char(UBYTE bank, GameCharacter* character) //* Orients character based on characters pos_x and pos_y.
{
    switch_bank(bank3);

    Orient_Char(character);

    switch_bank(bank);
}

void Call_Move_Char(UBYTE bank, GameCharacter* character, UINT8 tile_x, UINT8 tile_y, UINT8 pixel_offset)
{
    switch_bank(2);

    move_char(character, tile_x, tile_y, pixel_offset);

    switch_bank(bank);
}

void Call_Set_Sprite_Packages(UBYTE bank, GameCharacter* character, GameSpritePackage* sprites_up, GameSpritePackage* sprites_down, GameSpritePackage* sprites_left, GameSpritePackage* sprites_right)
{
    switch_bank(bank4);

    Set_Sprite_Packages(character, sprites_up, sprites_down, sprites_left, sprites_right);

    switch_bank(bank);
}

void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, GameSprite* sprite) //* Sets character to sprite specified.
{
    switch_bank(4);

    Load_Char_Sprite(character, sprite);

    switch_bank(bank);
}

void Call_Clear_Map(UBYTE bank) //* Clears the map.
{
    switch_bank(bank3);

    Clear_Map();

    switch_bank(bank);
}

void Call_Set_Char_Tile(UBYTE bank, GameCharacter* character, UBYTE tile, GameSprite* sprite)
{
    switch_bank(4);

    Set_Char_Tile(character, tile, sprite);

    switch_bank(bank);
}

void Call_Reload_Map(UBYTE bank)
{
    switch_bank(bank3);

    Reload_Map();

    switch_bank(bank);
}

void Call_Reset_Char_Sprites(UBYTE bank)
{
    switch_bank(bank6);

    reset_char_sprites();

    switch_bank(bank);
}

void Call_Reset_NPC(UBYTE bank)
{
    switch_bank(5);

    Reset_NPC();

    switch_bank(bank);
}

void Call_Load_Window(UBYTE bank)
{
    switch_bank(6);

    Load_Window();
    
    switch_bank(bank);
}

void Call_Load_Message_Box(UBYTE bank)
{
    switch_bank(6);

    Load_Message_Box();

    switch_bank(bank);
}

void Call_Draw_Message_Box(UBYTE bank)
{
    switch_bank(bank6);

    Draw_Message_Box();

    switch_bank(bank);
}

void Call_Close_Message_Box(UBYTE bank)
{
    switch_bank(bank6);

    Close_Message_Box();

    switch_bank(bank);
}

void Call_Scroll_Message(UBYTE bank)
{
    switch_bank(bank6);

    scroll_message();

    switch_bank(bank);
}

void Call_Scene_Handler(UBYTE bank, UBYTE scene_id)
{
    switch_bank(bank20);

    Scene_Handler(scene_id);

    switch_bank(bank);
}

void Call_Draw_Troop(UBYTE bank, unsigned char* tiles, unsigned char* data)
{
    switch_bank(bank17);

    Draw_Troop(tiles, data);

    switch_bank(bank);
}

void Call_Execute_Skill(UBYTE bank, UBYTE skill_id, UBYTE action_performer, UBYTE action_target)
{
    switch_bank(17);

    Execute_Skill(skill_id, action_performer, action_target);

    switch_bank(bank);
}

UBYTE Call_Get_Skill_Cost(UBYTE bank, GameSkill* skill)
{
    switch_bank(bank17);

    u_y = Get_Skill_Cost(skill);

    switch_bank(bank);

    return u_y;
}

void Call_Draw_Skill_Cost(UBYTE bank, GameSkill* skill)
{
    switch_bank(bank17);

    Draw_Skill_Cost(skill);

    switch_bank(bank);
}

void Call_Draw_Skills_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
{
    switch_bank(bank17);

    Draw_Skills_Name(skill, tile_x, tile_y);

    switch_bank(bank);
}

void Call_Draw_Skill_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y)
{
    switch_bank(bank17);

    Draw_Skill_Name(skill, tile_x, tile_y);

    switch_bank(bank);
}

void Call_Draw_End_Message(UBYTE bank)
{
    switch_bank(bank17);

    Draw_End_Message();

    switch_bank(bank);
}

void Call_Draw_Item_Description(UBYTE bank, GameItem* item)
{
    switch_bank(bank13);

    Draw_Item_Description(item);

    switch_bank(bank);
}

void Call_Draw_Equip_Description_Large(UBYTE bank, GameEquip* equip)
{
    switch_bank(bank12);

    Draw_Equip_Description_Large(equip);

    switch_bank(bank);
}

void Call_Load_Battle_Message_Box(UBYTE bank)
{
    switch_bank(bank16);

    Load_Battle_Message_Box();

    switch_bank(bank);
}

void Call_Set_Actor_Skills(UBYTE bank, GameActor* actor)
{
    switch_bank(bank17);

    Set_Actor_Skills(actor);

    switch_bank(bank);
}

void Call_Add_NPC(UBYTE bank, GameCharacter* character, GameNPC* npc)
{
    switch_bank(5);

    Add_NPC(character, npc);

    switch_bank(bank);
}

void Call_Hide_Char(UBYTE bank, GameCharacter* character)
{
    switch_bank(2);

    hide_char(character);

    switch_bank(bank);
}

void Call_Add_Item(UBYTE bank, GameItem* item, UBYTE amount)
{
    switch_bank(bank7);

    Add_Item(item, amount);

    switch_bank(bank);
}

void Call_Add_Equip(UBYTE bank, GameEquip* equip)
{
    switch_bank(12);

    Add_Equip(equip);

    switch_bank(bank);
}

void Call_Equip_Equipment(UBYTE bank, GameActor* actor, GameEquip* equip)
{
    switch_bank(bank12);

    Equip_Equipment(actor, equip);

    switch_bank(bank);
}

void Call_Load_Font_Menu(UBYTE bank)
{
    switch_bank(bank7);

    Load_Font_Menu();

    switch_bank(bank);
}

void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name)
{
    switch_bank(bank7);

    Draw_Name(tile_x, tile_y, name, full_name);

    switch_bank(bank);
}

void Call_Draw_Number(UBYTE bank, UINT16 number, UBYTE tile_x, UBYTE tile_y)
{
    switch_bank(bank7);

    Draw_Number(number, tile_x, tile_y);

    switch_bank(bank);
}

void Call_Play_Buzz(UBYTE bank)
{
    switch_bank(11);

    Play_Buzz();

    switch_bank(bank);
}

void Call_Play_Confirm(UBYTE bank)
{
    switch_bank(11);

    Play_Confirm();

    switch_bank(bank);
}

void Call_Play_Use(UBYTE bank)
{
    switch_bank(11);

    Play_Use();

    switch_bank(bank);
}

void Call_Load_Combat_Main(UBYTE bank)
{
    switch_bank(bank16);
    
    Load_Combat_Main();

    switch_bank(bank);
}

void Call_Check_Step_Counter(UBYTE bank)
{
    switch_bank(bank16);

    Check_Step_Counter();

    switch_bank(bank);
}

void Call_Menu_Equip(UBYTE bank)
{
    switch_bank(12);
    
    Load_Menu_Equip();

    switch_bank(bank);
}

void Call_Menu_Item(UBYTE bank)
{
    switch_bank(bank13);

    Menu_Item();

    switch_bank(bank);
}

void Call_Menu_Status(UBYTE bank)
{
    switch_bank(bank14);

    Load_Menu_Status();

    switch_bank(bank);
}

void Call_Shop(UBYTE bank)
{
    switch_bank(bank19);

    Load_Shop();

    switch_bank(bank);
}

void Call_Menu_Skills(UBYTE bank)
{
    switch_bank(bank15);

    Load_Menu_Skills();

    switch_bank(bank);
}

void Call_Menu_Main(UBYTE bank)
{
    switch_bank(bank7);

    Menu_Main();

    switch_bank(bank);
}

void Call_Load_Menu_Main(UBYTE bank)
{
    switch_bank(bank7);

    Load_Menu_Main();

    switch_bank(bank);
}

void Menu()
{
    switch_bank(bank7);

    toggle_control(false);

    Load_Menu_Main();
}

void Overworld()
{
    Update_Joypad();

    Update_Anim_Walk();

    if(camera_focus == false)
    {
        walk_char(&char_player);
    }
    else
    {
        walk_player();
    }

    hide_char(&char_npc_1);
    hide_char(&char_npc_2);
    
    walk_char(&char_npc_1);
}

void Gameplay()
{
    switch_bank(2);

    while(true)
    {
        wait_vbl_done();

        if(game_scene == 0)
        {
            Overworld();
        }
        else if(game_scene == 1)
        {
            Menu();
        }
        else if(game_scene == 2)
        {
            Menu();
        }
    }
}

void vbl_music_isr(void)
{
}

void vbl_clock_isr(void)
{
    clock_tick++;

    if(clock_tick > 60)
    {
        clock_tick = 0;
        clock_time_second++;

        if(clock_time_second > 59)
        {
            clock_time_second = 0;
            clock_time_minute++;

            if(clock_time_minute > 59)
            {
                clock_time_minute = 0;
                clock_time_minute++;
            }
        }
    }
}

void vbl_seed_isr(void)
{
    Seed += 1;
    if(Seed >= 255){Seed = 1;}
}

void interrupt_handler(void)
{
    disable_interrupts();

    add_VBL(vbl_music_isr);
    add_VBL(vbl_clock_isr);
    add_VBL(vbl_seed_isr);

    enable_interrupts();

    set_interrupts(VBL_IFLAG);
}

void main()
{
    ENABLE_RAM_MBC5;

    NR52_REG = 0x80;
    NR51_REG = 0x11;
    NR50_REG = 0x77;

    interrupt_handler();

    BGP_REG = 0xFF;
    OBP0_REG = 0xFF;

    Init_Variables();

    cpu_fast();

    if(saved_game_start == true)
    {
        PlayerControlFlag = true;
        char_player.pos_x = saved_pos_x;
        char_player.pos_y = saved_pos_y;

        clock_time_second = saved_clock_time_second;
        clock_time_minute = saved_clock_time_minute;
        clock_time_hour = saved_clock_time_hour;

        memcpy(inventory, &saved_inventory, sizeof(inventory));
        memcpy(inv_amount, &saved_inv_amount, sizeof(inv_amount));

        Refresh_Inv_Amount();

        switch_bank(bank7);

        Add_Actor(&actor_hiro);
        Add_Actor(&actor_bud);
        Add_Actor(&actor_soran);

        switch_bank(bank3);

        SHOW_SPRITES;

        Load_Hiro_Tiles();
        
        SHOW_BKG;
        HIDE_WIN;

        Draw_Map(Get_Map(saved_map));

        switch_bank(bank12);

        Equip_Equipment(&actor_hiro, &equip_wooden_sword);
        Equip_Equipment(&actor_hiro, &equip_hoplon);
        Equip_Equipment(&actor_hiro, &equip_cotton_garb);
        Equip_Equipment(&actor_hiro, &equip_copper_bracelet);

        switch_bank(bank2); 

        build_char(&char_player);
        build_char(&char_npc_1);
        build_char(&char_npc_2);
        
        switch_bank(bank6);

        Load_Window();

        switch_bank(bank4);

        Set_Sprite_Packages(&char_player, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down);
        Load_Char_Sprite(&char_player, char_player.sprites_down->sprites[0]);

        switch_bank(bank2);

        waitpad(J_START);

        fade_in();

        Gameplay();
    }
    else
    {
        Set_Start_Variables();

        Refresh_Inv_Amount();

        switch_bank(bank3);

        Load_Hiro_Tiles();
        Draw_Titlescreen();

        switch_bank(bank2); 

        build_char(&char_player);
        build_char(&char_npc_1);
        build_char(&char_npc_2);

        switch_bank(bank6);

        Load_Window();

        switch_bank(bank4);

        Set_Sprite_Packages(&char_player, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down, &sprite_hiro_down);
        Load_Char_Sprite(&char_player, char_player.sprites_down->sprites[0]);

        switch_bank(bank2);

        waitpad(J_START);

        fade_in();

        Gameplay();
    }

    DISABLE_RAM_MBC5;
}