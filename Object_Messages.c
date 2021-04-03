#include <gb/gb.h>
#include "Game_Definitions.h"
#include "Game_Message.h"

extern const unsigned char Message_Hiro_House_ShelfPLN0;
extern const unsigned char Message_Plum_HeadstonePLN0;
extern const unsigned char Message_Health_BrewPLN0;
extern const unsigned char Message_TestTextPLN0;
extern const unsigned char Message_Test;

extern const unsigned char Message_Intro_1PLN0;
extern const unsigned char Message_Intro_2PLN0;
extern const unsigned char Message_Intro_3PLN0;
extern const unsigned char Message_Intro_4PLN0;
extern const unsigned char Message_Intro_5PLN0;
extern const unsigned char Message_Intro_6PLN0;
extern const unsigned char Message_Intro_7;

/*  Game Messages:  */
const GameMessage message_hiro_house_shelf = {bank10, Message_Hiro_House_ShelfPLN0, 8, true};
const GameMessage message_plum_headstone = {bank10, Message_Plum_HeadstonePLN0, 2, true};
const GameMessage message_plum_village_pot_1 = {bank10, Message_Hiro_House_ShelfPLN0, 8, true};
const GameMessage message_obtain_health_brew = {bank10, Message_Hiro_House_ShelfPLN0, 8, true};
const GameMessage message_test = {bank10, Message_Test, 6, true};

const GameMessage message_intro_1 = {bank10, Message_Intro_1PLN0, 2, true};
const GameMessage message_intro_2 = {bank10, Message_Intro_2PLN0, 4, true};
const GameMessage message_intro_3 = {bank10, Message_Intro_3PLN0, 6, true};
const GameMessage message_intro_4 = {bank10, Message_Intro_4PLN0, 2, true};
const GameMessage message_intro_5 = {bank10, Message_Intro_5PLN0, 8, true};
const GameMessage message_intro_6 = {bank10, Message_Intro_6PLN0, 6, true};
const GameMessage message_intro_7 = {bank10, Message_Intro_7, 4, true};
