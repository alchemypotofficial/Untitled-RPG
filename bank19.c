#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Actor.h"
#include "Game_Equip.h"
#include "Game_Class.h"
#include "Game_Skill.h"
#include "Game_NPC.h"
#include "Game_Shop.h"
#include "Game_Item.h"
#include "Maps/Map_Shop_Main.c"
#include "Maps/Map_Shop_Count.c"
#include "Maps/Map_Shop_Count_Replace.c"
#include "Maps/Map_Shop_Confirm.c"
#include "Maps/Map_Shop_Confirm_Replace.c"
#include "Messages/Message_Shop_PlumItem.c"

extern UBYTE Joy;

extern UBYTE CurrentMenu, CurrentSelection, CurrentItemSlot, CurrentItemSelection, CurrentShop, CurrentShopSelection, shop_message_x, message_x, message_y, ware_count;

extern UBYTE confirm_x, confirm_y;

extern UBYTE slot_1, slot_2, item_1, item_2, slot_1_filled, slot_2_filled, amount_1, amount_2;

extern UBYTE slot_selected, blink_tick, CurrentItemType;

extern UBYTE selection_max, selection_x, selection_y, party_max, party_y, actor_y, actor_max, skills_y, shop_x, shop_y;

extern UBYTE Tileset;

extern UINT16 party_gold;

extern UBYTE parsed_number;

extern UINT16 saved_number, large_number;

extern INT8 i, j, k, l, m, n;

extern UBYTE u_x, u_y, u_i, u_j;

extern UINT16 u16_i, u16_j;

extern unsigned char party[4];

extern unsigned char inventory[99];

extern unsigned char inv_amount[99];

extern unsigned char equipment_weapon[30];

extern unsigned char equipment_secondary[30];

extern unsigned char equipment_armor[30];

extern unsigned char equipment_accessory[30];

extern unsigned char parsed_decimal[4];

extern unsigned char item_slots[12];

extern unsigned char held_decimal[3];

extern void performant_delay(UBYTE num_loops);
extern void toggle_control(UBYTE toggle);

extern void fade_out();
extern void fade_in();

extern GameActor* Get_Actor(UBYTE actor_id);
extern GameEquip* Get_Equip(UBYTE equip_id);
extern GameItem* Get_Item(UBYTE item_id);
extern GameClass* Get_Class(UBYTE class_id);
extern GameSkill* Get_Skill(UBYTE skill_id);
extern GameShop* Get_Shop(UBYTE shop_id);

extern void Gameplay();

extern void Call_Draw_Name(UBYTE bank, UBYTE tile_x, UBYTE tile_y, unsigned char* name, BOOLEAN full_name);
extern void Call_Draw_Skills_Name(UBYTE bank, GameSkill* skill, UBYTE tile_x, UBYTE tile_y);
extern void Call_Load_Menu_Main(UBYTE bank);
extern void Call_Menu_Main(UBYTE bank);
extern void Call_Menu_Item(UBYTE bank);
extern void Call_Set_Actor_Skills(UBYTE bank, GameActor* actor);
extern void Call_Load_Font_Menu(UBYTE bank);
extern void Call_Load_Tileset(UBYTE bank, UBYTE tileset);
extern void Call_Draw_Item_Description(UBYTE bank, GameItem* item);
extern void Call_Draw_Equip_Description_Large(UBYTE bank, GameEquip* equip);
extern void Call_Add_Item(UBYTE bank, GameItem* item, UBYTE amount);
extern void Call_Add_Equip(UBYTE bank, GameEquip* equip);

extern UINT16 Get_Required_AP(UBYTE bank, GameSkill* skill);
extern UINT16 Get_Skill_Useable(UBYTE bank, GameSkill* skill);

extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

extern const unsigned char Char_Gold[1];
extern const unsigned char Char_Period[1];

const unsigned char Shop_Pointer[1] = {0x0A};

const unsigned char Shop_Background[1] = {0x01};

const unsigned char Shop_Slash[1] = {0x0F};

const unsigned char Shop_Border[1] = {0x09};

const unsigned char Shop_Num[1] = {0x2E};

const unsigned char Shop_Zeros[3] = {0x31, 0x31, 0x31};

const unsigned char Shop_Learned[7] = {0x46, 0x1A, 0x16, 0x27, 0x23, 0x1A, 0x19};

const unsigned char Shop_Plural[3] = {0x11, 0x29, 0x12};

const unsigned char Shop_Will[4] = {0x2D, 0x1E, 0x21, 0x21};

const unsigned char Shop_Be[2] = {0x17, 0x1A};

const unsigned char Shop_Clear[] =
{
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
};

void Draw_Shop_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
{
    parsed_number = 0;

    saved_number = number;

    large_number = number;

    for(n = 0; n < 3; n++)
    {
        parsed_decimal[n] = 0;
    }

    while(large_number >= 1000)
    {
        large_number -= 1000;
        parsed_number += 1;
    }

    parsed_decimal[0] = parsed_number;
    parsed_number = 0;

    while(large_number >= 100)
    {
        large_number -= 100;
        parsed_number += 1;
    }

    parsed_decimal[1] = parsed_number;
    parsed_number = 0;

    while(large_number >= 10)
    {
        large_number -= 10;
        parsed_number += 1;
    }

    parsed_decimal[2] = parsed_number;

    parsed_decimal[3] = large_number;

    parsed_decimal[0] += 49;
    parsed_decimal[1] += 49;
    parsed_decimal[2] += 49;
    parsed_decimal[3] += 49;

    if(saved_number < 10)
    {
        set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
    }
    else if(saved_number < 100)
    {
        set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
    }
    else if(saved_number < 1000)
    {
        set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
    }
    else
    {
        set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
    }
    
}

void Draw_Shop_Number_Reveal(UINT16 number, UBYTE tile_x, UBYTE tile_y)
{
    parsed_number = 0;

    saved_number = number;

    large_number = number;

    for(n = 0; n < 3; n++)
    {
        parsed_decimal[n] = 0;
    }

    while(large_number >= 1000)
    {
        large_number -= 1000;
        parsed_number += 1;
    }

    parsed_decimal[0] = parsed_number;
    parsed_number = 0;

    while(large_number >= 100)
    {
        large_number -= 100;
        parsed_number += 1;
    }

    parsed_decimal[1] = parsed_number;
    parsed_number = 0;

    while(large_number >= 10)
    {
        large_number -= 10;
        parsed_number += 1;
    }

    parsed_decimal[2] = parsed_number;

    parsed_decimal[3] = large_number;

    parsed_decimal[0] += 49;
    parsed_decimal[1] += 49;
    parsed_decimal[2] += 49;
    parsed_decimal[3] += 49;

    if(saved_number < 10)
    {
        performant_delay(1);
        set_win_tiles(tile_x, tile_y, 1, 1, parsed_decimal + 3);
        u_x++;
    }
    else if(saved_number < 100)
    {
        for(i = 0; i < 2; i++)
        {
            performant_delay(1);
            set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + 2 + i);
            u_x++;
        }
    }
    else if(saved_number < 1000)
    {
        for(i = 0; i < 3; i++)
        {
            performant_delay(1);
            set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + 1 + i);
            u_x++;
        }
    }
    else
    {
        for(i = 0; i < 4; i++)
        {
            performant_delay(1);
            set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + i);
            u_x++;
        }
    }
    
}

UINT16 Count_Item(GameItem* item)
{
    u16_i = 0;

    for(i = 0; i < 99; i++)
    {
        if(inventory[i] == item->item_id)
        {
            u16_i += inv_amount[i];
            return u16_i;
        }
    }

    return u16_i;
}

UINT16 Count_Equip(GameEquip* equip)
{
    u16_i = 0;

    for(i = 0; i < 99; i++)
    {
        if(equip->equip_type == weapon)
        {
            if(equipment_weapon[i] == equip->equip_id)
            {
                u16_i++;
            }
        }
        else if(equip->equip_type == secondary)
        {
            if(equipment_secondary[i] == equip->equip_id)
            {
                u16_i++;
            }
        }
        else if(equip->equip_type == armor)
        {
            if(equipment_armor[i] == equip->equip_id)
            {
                u16_i++;
            }
        }
        else if(equip->equip_type == accessory)
        {
            if(equipment_accessory[i] == equip->equip_id)
            {
                u16_i++;
            }
        }
    }

    return u16_i;
}

void Draw_Shop_Item(GameItem* item, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 6, 1, item->name);

    set_win_tiles(tile_x + 6, tile_y, 2, 1, Shop_Clear);
    Draw_Shop_Number(item->price, tile_x + 6, tile_y);
    
    if(Count_Item(item) < 10)
    {
        set_win_tiles(tile_x + 14, tile_y, 1, 1, Shop_Zeros);
        set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
        Draw_Shop_Number(Count_Item(item), tile_x + 12, tile_y);
    }
    else if(Count_Item(item) < 100)
    {
        set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
        Draw_Shop_Number(Count_Item(item), tile_x + 12, tile_y);
    }
}

void Draw_Shop_Equip(GameEquip* equip, UBYTE tile_x, UBYTE tile_y)
{
    set_win_tiles(tile_x, tile_y, 7, 1, equip->name);

    set_win_tiles(tile_x + 7, tile_y, 2, 1, Shop_Clear);
    Draw_Shop_Number(equip->price, tile_x + 7, tile_y);

    if(Count_Equip(equip) < 10)
    {
        set_win_tiles(tile_x + 14, tile_y, 1, 1, Shop_Zeros);
        set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
        Draw_Shop_Number(Count_Equip(equip), tile_x + 12, tile_y);
    }
    else if(Count_Equip(equip) < 100)
    {
        set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
        Draw_Shop_Number(Count_Equip(equip), tile_x + 12, tile_y);
    }
}

void Draw_Shop_Message()
{
    if(shop_message_x != 36)
    {
        set_win_tiles(1 + message_x, 13 + (message_y * 2), 1, 1, &Get_Shop(CurrentShop)->message[shop_message_x]);
        shop_message_x++;
        message_x++;

        if(message_x == 18)
        {
            message_x = 0;
            message_y++;
        }
    }
}

void Draw_Confirm_Message()
{
    u_x = 0;

    Draw_Shop_Number_Reveal(ware_count, 1, 13);

    u_x++;

    if(Get_Shop(CurrentShop)->shop_type == item_shop)
    {
        for(i = 0; i < 6 ; i++)
        {
            performant_delay(1);
            set_win_tiles(1 + u_x, 13, 1, 1, Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name + i);
            
            if(i > 3 && Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name[i] == 0x01)
            {
                break;
            }
            
            u_x++;
        }
    }
    else
    {
        for(i = 0; i < 7 ; i++)
        {
            performant_delay(1);
            set_win_tiles(1 + u_x, 13, 1, 1, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name + i);
            u_x++;

            if(i > 3 && Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name[i] == 0x01)
            {
                break;
            }
        }
    }

    for(i = 0; i < 3; i++)
    {
        performant_delay(1);
        set_win_tiles(1 + u_x, 13, 1, 1, Shop_Plural + i);
        u_x++;
    }

    u_x = 0;

    for(i = 0; i < 4; i++)
    {
        performant_delay(1);
        set_win_tiles(1 + u_x, 15, 1, 1, Shop_Will + i);
        u_x++;
    }

    u_x++;

    for(i = 0; i < 2; i++)
    {
        performant_delay(1);
        set_win_tiles(1 + u_x, 15, 1, 1, Shop_Be + i);
        u_x++;
    }

    u_x++;

    if(Get_Shop(CurrentShop)->shop_type == item_shop)
    {
        u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
        Draw_Shop_Number_Reveal(u16_i, 1 + u_x, 15);
    }
    else
    {
        u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
        Draw_Shop_Number_Reveal(u16_i, 1 + u_x, 15);
    }

    performant_delay(1);
    set_win_tiles(1 + u_x, 15, 1, 1, Char_Gold);
    u_x++;

    performant_delay(1);
    set_win_tiles(1 + u_x, 15, 1, 1, Char_Period);
}

void Draw_Item_Wares()
{
    if(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection] != 0)
    {
        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection]), 2, 4);
    }
    if(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection] != 0)
    {
        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection]), 2, 6);
    }
    if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
    {
        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
    }
    if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
    {
        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
    }
}

void Draw_Equip_Wares()
{
    if(Get_Shop(CurrentShop)->wares[0] != 0)
    {
        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection]), 2, 4);
    }
    if(Get_Shop(CurrentShop)->wares[1] != 0)
    {
        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection]), 2, 6);
    }
    if(Get_Shop(CurrentShop)->wares[2] != 0)
    {
        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
    }
    if(Get_Shop(CurrentShop)->wares[3] != 0)
    {
        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
    }
}

void Draw_Wares()
{
    if(Get_Shop(CurrentShop)->shop_type == item_shop)
    {
        Draw_Item_Wares();
    }
    else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
    {
        Draw_Equip_Wares();
    }
}

void Draw_Ware_Count()
{
    set_win_tiles(10, 16, 1, 1, Shop_Zeros);
    Draw_Shop_Number(ware_count, 8, 16);
}

UBYTE Get_Max_Count(UINT16 base_cost)
{
    u16_j = party_gold;
    u_x = 0;

    while(1)
    {
        if(u16_j >= base_cost && u_x < 99)
        {
            u16_j -= base_cost;
            u_x++;
        }
        else
        {
            return u_x;
        }
    }
}

void Draw_Count()
{
    set_win_tiles(0, 12, 20, 6, Map_Shop_CountPLN0);
    Draw_Ware_Count();

    if(Get_Shop(CurrentShop)->shop_type == item_shop)
    {
        u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
        Draw_Shop_Number(u16_i, 14, 16);
    }
    else
    {
        u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
        Draw_Shop_Number(u16_i, 14, 16);
    }
}

void Draw_Confirm()
{
    set_win_tiles(0, 12, 20, 6, Map_Shop_Count_ReplacePLN0);

    Draw_Confirm_Message();

    performant_delay(1);

    set_win_tiles(14, 7, 6, 5, Map_Shop_ConfirmPLN0);
}

void Close_Count()
{
    set_win_tiles(0, 12, 20, 6, Map_Shop_Count_ReplacePLN0);
    
    if(Get_Shop(CurrentShop)->shop_type == item_shop)
    {
        Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
    }
    else
    {
        Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
    }
}

void Close_Shop()
{
    fade_out();

    Call_Load_Tileset(bank19, Tileset);

    HIDE_WIN;
    SHOW_SPRITES;

    move_win(255, 0);

    toggle_control(true);

    fade_in();

    Gameplay();
}

void Draw_Shop()
{
    fade_out();

    CurrentMenu = shop_main;
    shop_x = 0;
    shop_y = 0;
    shop_message_x = 0;
    message_x = 0;
    message_y = 0;
    CurrentShopSelection = 0;

    Call_Load_Font_Menu(bank19);

    HIDE_SPRITES;
    SHOW_WIN;

    move_win(7, 0);

    set_win_tiles(0, 0, 20, 18, Map_Shop_MainPLN0);

    Draw_Wares();

    set_win_tiles(2, 1 + shop_y * 2, 1, 1, Shop_Pointer);

    Draw_Shop_Number(party_gold, 14, 1);

    fade_in();
}

void Clear_Shop_Pointer()
{
    set_win_tiles(1, 4, 1, 1, Shop_Background);
    set_win_tiles(1, 6, 1, 1, Shop_Background);
    set_win_tiles(1, 8, 1, 1, Shop_Background);
    set_win_tiles(1, 10, 1, 1, Shop_Background);
}

void Shop_Joypad()
{
    Joy = joypad();

    if(Joy & J_A)
    {
        if(CurrentMenu == shop_main)
        {
            if(shop_x == 0)
            {
                Call_Play_Confirm(bank19);

                set_win_tiles(1, 13, 18, 4, Shop_Clear);
                
                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }
                else
                {
                    Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }

                CurrentMenu = shop_buy;

                set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);

                while(joypad() & J_A)
                {
                    performant_delay(1);
                }
            }
            else if(shop_x == 1)
            {
                Call_Play_Confirm(bank19);
                CurrentMenu = shop_sell;

                set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);

                while(joypad() & J_A)
                {
                    performant_delay(1);
                }
            }
        }
        else if(CurrentMenu == shop_buy)
        {
            if(Get_Shop(CurrentShop)->shop_type == item_shop)
            {
                if(Count_Item(Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])) < 99)
                {
                    if(party_gold >= Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price)
                    {
                        Call_Play_Confirm(bank19);

                        ware_count = 1;

                        Draw_Count();

                        CurrentMenu = shop_buy_amount;
                    }
                    else
                    {
                        Call_Play_Buzz(bank19);
                    }
                }
                else
                {
                    Call_Play_Buzz(bank19);
                }
            }
            else
            {
                if(party_gold >= Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price)
                {
                    Call_Play_Confirm(bank19);

                    ware_count = 1;

                    Draw_Confirm();

                    set_win_tiles(15, 8, 1, 1, Shop_Pointer);

                    confirm_y = 0;

                    CurrentMenu = shop_buy_confirm;
                }
                else
                {
                    Call_Play_Buzz(bank19);
                }
            }
            

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_amount)
        {
            Call_Play_Confirm(bank19);

            Draw_Confirm();

            set_win_tiles(15, 8, 1, 1, Shop_Pointer);

            confirm_y = 0;

            CurrentMenu = shop_buy_confirm;

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_confirm)
        {
            Call_Play_Confirm(bank19);

            if(confirm_y == 0)
            {
                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
                    party_gold = party_gold - u16_i;

                    Call_Add_Item(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection]), ware_count);
                }
                else
                {
                    u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
                    party_gold = party_gold - u16_i;

                    Call_Add_Equip(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection]));
                }

                set_win_tiles(14, 1, 3, 1, Shop_Clear);
                Draw_Shop_Number(party_gold, 14, 1);

                Close_Count();

                set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);

                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
                    {
                        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
                    }
                    if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
                    {
                        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
                    }
                }
                else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
                {
                    if(Get_Shop(CurrentShop)->wares[2] != 0)
                    {
                        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
                    }
                    if(Get_Shop(CurrentShop)->wares[3] != 0)
                    {
                        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
                    }
                }

                Draw_Wares();

                CurrentMenu = shop_buy;
            }
            else
            {
                set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);

                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
                    {
                        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
                    }
                    if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
                    {
                        Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
                    }

                    CurrentMenu = shop_buy_amount;
                }
                else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
                {
                    if(Get_Shop(CurrentShop)->wares[2] != 0)
                    {
                        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
                    }
                    if(Get_Shop(CurrentShop)->wares[3] != 0)
                    {
                        Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
                    }

                    CurrentMenu = shop_buy;
                }

                Close_Count();
            }

            while(joypad() & J_A)
            {
                performant_delay(1);
            }
        }
    }

    else if(Joy & J_B)
    {
        if(CurrentMenu == shop_main)
        {
            Call_Play_Confirm(bank19);
            Close_Shop();

            while(joypad() & J_B)
            {
                performant_delay(1);
                Draw_Shop_Message();
            }
        }
        else if(CurrentMenu == shop_buy || CurrentMenu == shop_sell)
        {
            Call_Play_Confirm(bank19);
            
            CurrentMenu = shop_main;

            Clear_Shop_Pointer();
            set_win_tiles(1, 13, 18, 4, Shop_Clear);

            shop_message_x = 0;
            message_x = 0;
            message_y = 0;

            while(joypad() & J_B)
            {
                performant_delay(1);
                Draw_Shop_Message();
            }
        }
        else if(CurrentMenu == shop_buy_amount)
        {
            Call_Play_Confirm(bank19);

            Close_Count();
            
            CurrentMenu = shop_buy;

            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_confirm)
        {
            Call_Play_Confirm(bank19);

            if(Get_Shop(CurrentShop)->shop_type == item_shop)
            {
                set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);

                if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
                {
                    Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
                }
                if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
                {
                    Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
                }

                Draw_Count();

                CurrentMenu = shop_buy_amount;
            }
            else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
            {
                set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);

                if(Get_Shop(CurrentShop)->wares[2] != 0)
                {
                    Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
                }
                if(Get_Shop(CurrentShop)->wares[3] != 0)
                {
                    Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
                }

                Close_Count();

                CurrentMenu = shop_buy;
            }
        
            while(joypad() & J_B)
            {
                performant_delay(1);
            }
        }
    }

    else if(Joy & J_UP)
    {
        if(CurrentMenu == shop_buy)
        {
            if(shop_y > 0)
            {
                set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Background);

                shop_y -= 1;

                set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);

                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }
                else
                {
                    Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }
            }
            else if(CurrentShopSelection > 0)
            {
                CurrentShopSelection--;
                Draw_Wares();
                
                if(Get_Shop(CurrentShop)->shop_type == item_shop)
                {
                    Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }
                else
                {
                    Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                }
            }

            while(joypad() & J_UP)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_amount)
        {
            u_i = Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection];

            u_y = Get_Max_Count(Get_Item(u_i)->price);
            u_j = 99 - Count_Item(Get_Item(u_i));

            if(ware_count < u_y && ware_count < u_j)
            {
                ware_count++;
                Draw_Count();
            }
            else
            {
                ware_count = 1;
                Draw_Count();
            }

            while(joypad() & J_UP)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_confirm)
        {
            if(confirm_y == 1)
            {
                set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Background);

                confirm_y = 0;

                set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Pointer);
            }

            while(joypad() & J_UP)
            {
                performant_delay(1);
            }
        }
    }

    else if(Joy & J_DOWN)
    {
        if(CurrentMenu == shop_buy)
        {
            if(shop_y < 3)
            {
                if(Get_Shop(CurrentShop)->wares[shop_y + 1] != 0)
                {
                    set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Background);

                    shop_y += 1;

                    set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);

                    if(Get_Shop(CurrentShop)->shop_type == item_shop)
                    {
                        Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                    }
                    else
                    {
                        Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                    }
                }
            }
            else if(CurrentShopSelection < 6)
            {
                if(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection + 1] != 0)
                {
                    CurrentShopSelection++;
                    Draw_Wares();
                    
                    if(Get_Shop(CurrentShop)->shop_type == item_shop)
                    {
                        Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                    }
                    else
                    {
                        Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
                    }
                }
            }

            while(joypad() & J_DOWN)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_amount)
        {
            if(ware_count > 1)
            {
                ware_count--;
                Draw_Count();
            }
            else
            {
                u_i = Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection];

                u_y = Get_Max_Count(Get_Item(u_i)->price);
                u_j = 99 - Count_Item(Get_Item(u_i));

                if(u_y > u_j)
                {
                    ware_count = u_j;
                }
                else
                {
                    ware_count = u_y;
                }

                Draw_Count();
            }

            while(joypad() & J_DOWN)
            {
                performant_delay(1);
            }
        }
        else if(CurrentMenu == shop_buy_confirm)
        {
            if(confirm_y == 0)
            {
                set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Background);

                confirm_y = 1;

                set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Pointer);
            }

            while(joypad() & J_DOWN)
            {
                performant_delay(1);
            }
        }
    }

    else if(Joy & J_LEFT)
    {
        if(CurrentMenu == shop_main)
        {
            if(shop_x == 1)
            {
                set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Background);

                shop_x -= 1;

                set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Pointer);

                Draw_Wares();
            }

            while(joypad() & J_LEFT)
            {
                performant_delay(1);
                Draw_Shop_Message();
            }
        }
    }

    else if(Joy & J_RIGHT)
    {
        if(CurrentMenu == shop_main)
        {
            if(shop_x == 0)
            {
                set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Background);

                shop_x += 1;

                set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Pointer);
            }

            while(joypad() & J_RIGHT)
            {
                performant_delay(1);
                Draw_Shop_Message();
            }
        }
    }
}

void Shop()
{
    while(1)
    {
        performant_delay(1);

        if(CurrentMenu == shop_main)
        {
            Draw_Shop_Message();
        }

        Shop_Joypad();
    }
}

void Load_Shop()
{
    Draw_Shop();

    while(joypad() & J_A)
    {
        performant_delay(1);
        Draw_Shop_Message();
    }

    Shop();
}