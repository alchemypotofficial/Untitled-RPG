#include <gb/gb.h>

extern const unsigned char* Message_Hiro_House_ShelfPLN0;
extern const unsigned char* Message_Plum_HeadstonePLN0;
extern const unsigned char* Message_Health_BrewPLN0;
extern const unsigned char* Message_TestTextPLN0;
extern const unsigned char* Message_Intro_1PLN0;

/*  Game Messages:  */
const GameMessage message_hiro_house_shelf = {bank10, Message_Hiro_House_ShelfPLN0, 8};
const GameMessage message_plum_headstone = {bank10, Message_Plum_HeadstonePLN0, 2};
const GameMessage message_plum_village_pot_1 = {bank10, Message_Hiro_House_ShelfPLN0, 8};
const GameMessage message_obtain_health_brew = {bank10, Message_Hiro_House_ShelfPLN0, 8};
const GameMessage message_test = {bank10, Message_TestTextPLN0, 2};
const GameMessage message_intro_1 = {bank10, Message_Intro_1PLN0, 2};
