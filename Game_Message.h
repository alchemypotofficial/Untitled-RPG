#include <gb/gb.h>
#ifndef GAME_MESSAGE
#define GAME_MESSAGE

typedef struct GameMessage
{
    UBYTE bank;
    unsigned char* message;
    UBYTE length;
    
} GameMessage;

extern const GameMessage message_test;
extern const GameMessage message_hiro_house_shelf;
extern const GameMessage message_plum_headstone;
extern const GameMessage message_plum_village_pot_1;
extern const GameMessage message_obtain_health_brew;

extern const GameMessage message_intro_1;
extern const GameMessage message_intro_2;
extern const GameMessage message_intro_3;
extern const GameMessage message_intro_4;
extern const GameMessage message_intro_5;
extern const GameMessage message_intro_6;
extern const GameMessage message_intro_7;

#endif