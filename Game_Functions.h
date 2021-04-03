#include <gb/gb.h>
#include "Game_Actor.h"
#include "Game_Character.h"
#include "Game_Class.h"
#include "Game_Definitions.h"
#include "Game_Enemy.h"
#include "Game_Equip.h"
#include "Game_Event.h"
#include "Game_Item.h"
#include "Game_Map.h"
#include "Game_Message.h"
#include "Game_NPC.h"
#include "Game_Shop.h"
#include "Game_Skill.h"
#include "Game_Songs.h"
#include "Game_Sprite.h"
#include "Game_Tilemap.h"
#include "Game_Troop.h"

#ifndef FUNCTIONS
#define FUNCTIONS

/*  Engine Functions  */
extern void performant_delay(UBYTE num_loops);
extern void second_delay(UBYTE num_seconds);

extern void toggle_control(UBYTE toggle);

extern void Gameplay();

extern void Call_Walk_Chars(UBYTE bank);
extern UBYTE Check_Collision(UBYTE collision);

/*  Scene Functions  */
extern void set_faded();
extern void fade_out();
extern void fade_in();
extern void shake_screen();
extern void scroll_screen(INT8 move_x, INT8 move_y);

/*  General Functions  */
extern UBYTE Compare_String(unsigned char* string_1, unsigned char* string_2);

extern GameMap* Get_Map(UBYTE map_id);
extern GameActor* Get_Actor(UBYTE actor_id);
extern GameItem* Get_Item(UBYTE item_id);
extern GameEquip* Get_Equip(UBYTE equip_id);
extern GameClass* Get_Class(UBYTE class_id);
extern GameEnemy* Get_Enemy(UBYTE enemy_id);
extern GameTroop* Get_Troop(UBYTE troop_id);
extern GameSkill* Get_Skill(UBYTE skill_id);
extern GameShop* Get_Shop(UBYTE shop_id);
extern GameTele* Get_Tele(UBYTE tele_id);
extern GameSign* Get_Sign(UBYTE sign_id);
extern GameMessage* Get_Message(UBYTE message_id);

/*  Character Functions  */
extern UBYTE check_walk_counter(GameCharacter* character);

extern GameCharacter* Get_Char_NPC(char name[15]);

extern void Call_Build_Char(UBYTE bank, GameCharacter *character);
extern void Call_Add_NPC(UBYTE bank, const char* name, GameNPC* npc, UBYTE pos_x, UBYTE pos_y, UBYTE facing);
extern void Call_Clear_Char(UBYTE bank, GameCharacter* character);
extern void Call_Remove_NPC(UBYTE bank, const char* name);
extern void Call_Jump_Character(UBYTE bank, GameCharacter* character);
extern void Call_Walk_Distance(UBYTE bank, GameCharacter* character, INT8 move_x, INT8 move_y);
extern void Call_Set_Sprites(UBYTE bank, GameCharacter* character, const GameCharSprite* sprites);

extern void Call_Load_Char_Sprite(UBYTE bank, GameCharacter* character, const GameSprite* sprite); //* Sets character to sprite specified.

/*  Interaction Functions  */
extern void Call_Draw_Message(UBYTE bank, const GameMessage *message, unsigned char *insert_1, UBYTE length_1, UBYTE speedable); //* Loads message box and draws specified message.
extern void Call_Teleport(UBYTE bank, GameMap* map, UBYTE tile_x, UBYTE tile_y);

/*  Actor Functions  */
extern void Call_Add_Actor(UBYTE bank, GameActor *actor);
extern void Call_Load_Player_Actor(UBYTE bank);

/*  Sound Functions  */
extern void Call_Play_Buzz(UBYTE bank);
extern void Call_Play_Use(UBYTE bank);
extern void Call_Play_Confirm(UBYTE bank);

#endif