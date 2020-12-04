;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module bank19
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Load_Shop
	.globl _Shop
	.globl _Shop_Joypad
	.globl _Clear_Shop_Pointer
	.globl _Draw_Shop
	.globl _Close_Shop
	.globl _Close_Count
	.globl _Draw_Confirm
	.globl _Draw_Count
	.globl _Get_Max_Count
	.globl _Draw_Ware_Count
	.globl _Draw_Wares
	.globl _Draw_Equip_Wares
	.globl _Draw_Item_Wares
	.globl _Draw_Confirm_Message
	.globl _Draw_Shop_Message
	.globl _Draw_Shop_Equip
	.globl _Draw_Shop_Item
	.globl _Count_Equip
	.globl _Count_Item
	.globl _Draw_Shop_Number_Reveal
	.globl _Draw_Shop_Number
	.globl _Call_Play_Confirm
	.globl _Call_Play_Buzz
	.globl _Call_Add_Equip
	.globl _Call_Add_Item
	.globl _Call_Draw_Equip_Description_Large
	.globl _Call_Draw_Item_Description
	.globl _Call_Load_Tileset
	.globl _Call_Load_Font_Menu
	.globl _Gameplay
	.globl _Get_Shop
	.globl _Get_Item
	.globl _Get_Equip
	.globl _fade_in
	.globl _fade_out
	.globl _toggle_control
	.globl _performant_delay
	.globl _set_win_tiles
	.globl _joypad
	.globl _Map_Shop_MainPLN1
	.globl _Map_Shop_MainPLN0
	.globl _Shop_Clear
	.globl _Shop_Be
	.globl _Shop_Will
	.globl _Shop_Plural
	.globl _Shop_Learned
	.globl _Shop_Zeros
	.globl _Shop_Num
	.globl _Shop_Border
	.globl _Shop_Slash
	.globl _Shop_Background
	.globl _Shop_Pointer
	.globl _Message_Shop_PlumItemPLN1
	.globl _Message_Shop_PlumItemPLN0
	.globl _Map_Shop_Confirm_ReplacePLN1
	.globl _Map_Shop_Confirm_ReplacePLN0
	.globl _Map_Shop_ConfirmPLN1
	.globl _Map_Shop_ConfirmPLN0
	.globl _Map_Shop_Count_ReplacePLN1
	.globl _Map_Shop_Count_ReplacePLN0
	.globl _Map_Shop_CountPLN1
	.globl _Map_Shop_CountPLN0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Map_Shop_MainPLN0::
	.ds 360
_Map_Shop_MainPLN1::
	.ds 360
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;Maps/Map_Shop_Main.c:26: unsigned char Map_Shop_MainPLN0[] =
	ld	hl, #_Map_Shop_MainPLN0
	ld	(hl), #0x02
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0001)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0002)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0003)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0004)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0005)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0006)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0007)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0008)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0009)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000a)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000b)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000c)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000d)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000e)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x000f)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0010)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0011)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0012)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0013)
	ld	(hl), #0x03
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0014)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0015)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0016)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0017)
	ld	(hl), #0x3c
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0018)
	ld	(hl), #0x2b
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0019)
	ld	(hl), #0x2f
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001b)
	ld	(hl), #0x4d
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001c)
	ld	(hl), #0x1a
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001d)
	ld	(hl), #0x21
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001e)
	ld	(hl), #0x21
	ld	hl, #(_Map_Shop_MainPLN0 + 0x001f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0020)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0021)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0023)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0024)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0025)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0026)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0027)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0028)
	ld	(hl), #0x04
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0029)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002a)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002b)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002c)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002d)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002e)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x002f)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0030)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0031)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0032)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0033)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0034)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0035)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0036)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0037)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0038)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0039)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003a)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003b)
	ld	(hl), #0x05
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003c)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x003f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0040)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0041)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0042)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0043)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0044)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0045)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0046)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0047)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0048)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0049)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x004f)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0050)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0051)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0052)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0053)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0054)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0055)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0056)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0057)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0058)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0059)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x005f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0060)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0061)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0062)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0063)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0064)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0065)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0066)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0067)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0068)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0069)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x006f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0070)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0071)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0072)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0073)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0074)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0075)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0076)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0077)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0078)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0079)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x007f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0080)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0081)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0082)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0083)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0084)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0085)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0086)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0087)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0088)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0089)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008b)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008c)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x008f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0090)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0091)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0092)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0093)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0094)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0095)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0096)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0097)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0098)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0099)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x009f)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a0)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a1)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a2)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a3)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a4)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a5)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a6)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a7)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a8)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00a9)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00aa)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ab)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ac)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ad)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ae)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00af)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b0)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b1)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b2)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b3)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b4)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b5)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b6)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b7)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b8)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00b9)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ba)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00bb)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00bc)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00bd)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00be)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00bf)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c0)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c1)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c2)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c3)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c4)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c5)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c6)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c7)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c8)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00c9)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ca)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00cb)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00cc)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00cd)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ce)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00cf)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d0)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d1)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d2)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d3)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d4)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d5)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d6)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d7)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d8)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00d9)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00da)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00db)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00dc)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00dd)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00de)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00df)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e0)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e1)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e2)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e3)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e4)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e5)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e6)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e7)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e8)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00e9)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ea)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00eb)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ec)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ed)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ee)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ef)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f0)
	ld	(hl), #0x02
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f1)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f2)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f3)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f4)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f5)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f6)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f7)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f8)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00f9)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00fa)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00fb)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00fc)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00fd)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00fe)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x00ff)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0100)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0101)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0102)
	ld	(hl), #0x06
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0103)
	ld	(hl), #0x03
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0104)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0105)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0106)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0107)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0108)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0109)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x010f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0110)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0111)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0112)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0113)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0114)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0115)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0116)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0117)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0118)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0119)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x011f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0120)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0121)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0122)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0123)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0124)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0125)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0126)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0127)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0128)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0129)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012b)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012c)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x012f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0130)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0131)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0132)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0133)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0134)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0135)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0136)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0137)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0138)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0139)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x013f)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0140)
	ld	(hl), #0x07
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0141)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0142)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0143)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0144)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0145)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0146)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0147)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0148)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0149)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014a)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014b)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014c)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014d)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014e)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x014f)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0150)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0151)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0152)
	ld	(hl), #0x01
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0153)
	ld	(hl), #0x09
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0154)
	ld	(hl), #0x04
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0155)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0156)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0157)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0158)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0159)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015a)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015b)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015c)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015d)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015e)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x015f)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0160)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0161)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0162)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0163)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0164)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0165)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0166)
	ld	(hl), #0x08
	ld	hl, #(_Map_Shop_MainPLN0 + 0x0167)
	ld	(hl), #0x05
;Maps/Map_Shop_Main.c:66: unsigned char Map_Shop_MainPLN1[] =
	ld	hl, #_Map_Shop_MainPLN1
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_Map_Shop_MainPLN1 + 0x0167)
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_19
;bank19.c:133: void Draw_Shop_Number(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Shop_Number
; ---------------------------------
_Draw_Shop_Number::
;bank19.c:135: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank19.c:137: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:139: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:141: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00120$:
;bank19.c:143: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank19.c:141: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00120$
;bank19.c:146: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank19.c:148: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank19.c:149: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank19.c:152: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank19.c:153: parsed_number = 0;
	ld	(hl), #0x00
;bank19.c:155: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank19.c:157: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank19.c:158: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank19.c:161: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank19.c:162: parsed_number = 0;
	ld	(hl), #0x00
;bank19.c:164: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank19.c:166: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank19.c:167: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank19.c:170: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank19.c:172: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank19.c:174: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank19.c:175: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank19.c:176: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank19.c:177: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank19.c:181: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ldhl	sp,	#4
	ld	b, (hl)
;bank19.c:179: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank19.c:181: set_win_tiles(tile_x + 3, tile_y, 1, 1, parsed_decimal + 3);
	ld	de, #(_parsed_decimal + 0x0003)
	inc	b
	inc	b
	inc	b
	push	de
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00118$:
;bank19.c:183: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00115$
;bank19.c:185: set_win_tiles(tile_x + 2, tile_y, 2, 1, parsed_decimal + 2);
	ld	de, #(_parsed_decimal + 0x0002)
	inc	b
	inc	b
	push	de
	ld	de, #0x0102
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00115$:
;bank19.c:187: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00112$
;bank19.c:189: set_win_tiles(tile_x + 1, tile_y, 3, 1, parsed_decimal + 1);
	ld	de, #(_parsed_decimal + 0x0001)
	inc	b
	push	de
	ld	de, #0x0103
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00112$:
;bank19.c:193: set_win_tiles(tile_x, tile_y, 4, 1, parsed_decimal);
	ld	hl, #_parsed_decimal
	push	hl
	ld	de, #0x0104
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:196: }
	ret
_Map_Shop_CountPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x2d	; 45
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x16	; 22
	.db #0x23	; 35
	.db #0x2f	; 47
	.db #0x5b	; 91
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x2e	; 46
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Shop_CountPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Shop_Count_ReplacePLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Shop_Count_ReplacePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Shop_ConfirmPLN0:
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x53	; 83	'S'
	.db #0x1a	; 26
	.db #0x29	; 41
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x48	; 72	'H'
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
_Map_Shop_ConfirmPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Map_Shop_Confirm_ReplacePLN0:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
_Map_Shop_Confirm_ReplacePLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Message_Shop_PlumItemPLN0:
	.db #0x56	; 86	'V'
	.db #0x1a	; 26
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x24	; 36
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x2d	; 45
	.db #0x1d	; 29
	.db #0x16	; 22
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x23	; 35
	.db #0x01	; 1
	.db #0x43	; 67	'C'
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x1a	; 26
	.db #0x2a	; 42
	.db #0x18	; 24
	.db #0x1d	; 29
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x5b	; 91
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_Message_Shop_PlumItemPLN1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Shop_Pointer:
	.db #0x0a	; 10
_Shop_Background:
	.db #0x01	; 1
_Shop_Slash:
	.db #0x0f	; 15
_Shop_Border:
	.db #0x09	; 9
_Shop_Num:
	.db #0x2e	; 46
_Shop_Zeros:
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
_Shop_Learned:
	.db #0x46	; 70	'F'
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x27	; 39
	.db #0x23	; 35
	.db #0x1a	; 26
	.db #0x19	; 25
_Shop_Plural:
	.db #0x11	; 17
	.db #0x29	; 41
	.db #0x12	; 18
_Shop_Will:
	.db #0x2d	; 45
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x21	; 33
_Shop_Be:
	.db #0x17	; 23
	.db #0x1a	; 26
_Shop_Clear:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
;bank19.c:198: void Draw_Shop_Number_Reveal(UINT16 number, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Shop_Number_Reveal
; ---------------------------------
_Draw_Shop_Number_Reveal::
;bank19.c:200: parsed_number = 0;
	ld	hl, #_parsed_number
	ld	(hl), #0x00
;bank19.c:202: saved_number = number;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #_saved_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:204: large_number = number;
	ld	hl, #_large_number
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:206: for(n = 0; n < 3; n++)
	ld	hl, #_n
	ld	(hl), #0x00
00123$:
;bank19.c:208: parsed_decimal[n] = 0;
	ld	a, (#_n)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_parsed_decimal
	add	hl, bc
	ld	(hl), #0x00
;bank19.c:206: for(n = 0; n < 3; n++)
	ld	hl, #_n
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00123$
;bank19.c:211: while(large_number >= 1000)
00102$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	C, 00104$
;bank19.c:213: large_number -= 1000;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x18
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xfc
	ld	(hl), a
;bank19.c:214: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00102$
00104$:
;bank19.c:217: parsed_decimal[0] = parsed_number;
	ld	de, #_parsed_decimal
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank19.c:218: parsed_number = 0;
	ld	(hl), #0x00
;bank19.c:220: while(large_number >= 100)
00105$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;bank19.c:222: large_number -= 100;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank19.c:223: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00105$
00107$:
;bank19.c:226: parsed_decimal[1] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0001)
	ld	hl, #_parsed_number
	ld	a, (hl)
	ld	(de), a
;bank19.c:227: parsed_number = 0;
	ld	(hl), #0x00
;bank19.c:229: while(large_number >= 10)
00108$:
	ld	hl, #_large_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;bank19.c:231: large_number -= 10;
	ld	hl, #_large_number
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;bank19.c:232: parsed_number += 1;
	ld	hl, #_parsed_number
	inc	(hl)
	jr	00108$
00110$:
;bank19.c:235: parsed_decimal[2] = parsed_number;
	ld	de, #(_parsed_decimal + 0x0002)
	ld	a, (#_parsed_number)
	ld	(de), a
;bank19.c:237: parsed_decimal[3] = large_number;
	ld	hl, #_large_number
	ld	c, (hl)
	ld	hl, #(_parsed_decimal + 0x0003)
	ld	(hl), c
;bank19.c:239: parsed_decimal[0] += 49;
	ld	a, (#_parsed_decimal + 0)
	add	a, #0x31
	ld	(#_parsed_decimal),a
;bank19.c:240: parsed_decimal[1] += 49;
	ld	a, (#(_parsed_decimal + 0x0001) + 0)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0001)),a
;bank19.c:241: parsed_decimal[2] += 49;
	ld	a, (#_parsed_number)
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0002)),a
;bank19.c:242: parsed_decimal[3] += 49;
	ld	a, c
	add	a, #0x31
	ld	(#(_parsed_decimal + 0x0003)),a
;bank19.c:244: if(saved_number < 10)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00121$
;bank19.c:246: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:247: set_win_tiles(tile_x, tile_y, 1, 1, parsed_decimal + 3);
	ld	hl, #(_parsed_decimal + 0x0003)
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:248: u_x++;
	ld	hl, #_u_x
	inc	(hl)
	ret
00121$:
;bank19.c:255: set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + 2 + i);
	ldhl	sp,	#4
	ld	c, (hl)
;bank19.c:250: else if(saved_number < 100)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00118$
;bank19.c:252: for(i = 0; i < 2; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00125$:
;bank19.c:254: performant_delay(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank19.c:255: set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + 2 + i);
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #(_parsed_decimal + 0x0002)
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:256: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:252: for(i = 0; i < 2; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00125$
	ret
00118$:
;bank19.c:259: else if(saved_number < 1000)
	ld	hl, #_saved_number
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00115$
;bank19.c:261: for(i = 0; i < 3; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00127$:
;bank19.c:263: performant_delay(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank19.c:264: set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + 1 + i);
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #(_parsed_decimal + 0x0001)
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:265: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:261: for(i = 0; i < 3; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00127$
	ret
00115$:
;bank19.c:270: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00129$:
;bank19.c:272: performant_delay(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	pop	bc
;bank19.c:273: set_win_tiles(tile_x + i, tile_y, 1, 1, parsed_decimal + i);
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_parsed_decimal
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	hl, #_i
	add	a, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:274: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:270: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00129$
;bank19.c:278: }
	ret
;bank19.c:280: UINT16 Count_Item(GameItem* item)
;	---------------------------------
; Function Count_Item
; ---------------------------------
_Count_Item::
	add	sp, #-2
;bank19.c:282: u16_i = 0;
	ld	hl, #_u16_i
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank19.c:284: for(i = 0; i < 99; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;c
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
00104$:
;bank19.c:286: if(inventory[i] == item->item_id)
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_inventory
	add	hl, bc
	ld	a, (hl)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	sub	a, l
	jr	NZ, 00105$
;bank19.c:288: u16_i += inv_amount[i];
	ld	hl, #_inv_amount
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_u16_i
	ld	a, c
	ld	(hl+), a
;bank19.c:289: return u16_i;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	jr	00106$
00105$:
;bank19.c:284: for(i = 0; i < 99; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe3
	jr	C, 00104$
;bank19.c:293: return u16_i;
	ld	de, #0x0000
00106$:
;bank19.c:294: }
	add	sp, #2
	ret
;bank19.c:296: UINT16 Count_Equip(GameEquip* equip)
;	---------------------------------
; Function Count_Equip
; ---------------------------------
_Count_Equip::
	add	sp, #-7
;bank19.c:298: u16_i = 0;
	ld	hl, #_u16_i
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;bank19.c:300: for(i = 0; i < 99; i++)
	ld	hl, #_i
	ld	(hl), #0x00
	ldhl	sp,#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
00121$:
;bank19.c:302: if(equip->equip_type == weapon)
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
;bank19.c:304: if(equipment_weapon[i] == equip->equip_id)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;bank19.c:306: u16_i++;
	push	de
;c
	ld	hl, #_u16_i + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;bank19.c:302: if(equip->equip_type == weapon)
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00118$
;bank19.c:304: if(equipment_weapon[i] == equip->equip_id)
	ld	hl, #_equipment_weapon
	add	hl, de
	ld	a, (hl)
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	sub	a, l
	jr	NZ, 00122$
;bank19.c:306: u16_i++;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_u16_i
	ld	(hl+), a
	ld	(hl), e
	jr	00122$
00118$:
;bank19.c:309: else if(equip->equip_type == secondary)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00115$
;bank19.c:311: if(equipment_secondary[i] == equip->equip_id)
	ld	hl, #_equipment_secondary
	add	hl, de
	ld	a, (hl)
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	sub	a, l
	jr	NZ, 00122$
;bank19.c:313: u16_i++;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_u16_i
	ld	(hl+), a
	ld	(hl), e
	jr	00122$
00115$:
;bank19.c:316: else if(equip->equip_type == armor)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00112$
;bank19.c:318: if(equipment_armor[i] == equip->equip_id)
	ld	hl, #_equipment_armor
	add	hl, de
	ld	a, (hl)
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	sub	a, l
	jr	NZ, 00122$
;bank19.c:320: u16_i++;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_u16_i
	ld	(hl+), a
	ld	(hl), e
	jr	00122$
00112$:
;bank19.c:323: else if(equip->equip_type == accessory)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00122$
;bank19.c:325: if(equipment_accessory[i] == equip->equip_id)
	ld	hl, #_equipment_accessory
	add	hl, de
	ld	a, (hl)
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	sub	a, l
	jr	NZ, 00122$
;bank19.c:327: u16_i++;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_u16_i
	ld	(hl+), a
	ld	(hl), e
00122$:
;bank19.c:300: for(i = 0; i < 99; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0xe3
	jp	C, 00121$
;bank19.c:332: return u16_i;
	ld	hl, #_u16_i + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;bank19.c:333: }
	add	sp, #7
	ret
;bank19.c:335: void Draw_Shop_Item(GameItem* item, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Shop_Item
; ---------------------------------
_Draw_Shop_Item::
	add	sp, #-4
;bank19.c:337: set_win_tiles(tile_x, tile_y, 6, 1, item->name);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0106
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:339: set_win_tiles(tile_x + 6, tile_y, 2, 1, Shop_Clear);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	add	a, #0x06
	dec	hl
	ld	(hl), a
	ld	hl, #_Shop_Clear
	push	hl
	ld	de, #0x0102
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:340: Draw_Shop_Number(item->price, tile_x + 6, tile_y);
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
	call	_Count_Item
	add	sp, #2
;bank19.c:345: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0d
	inc	hl
;bank19.c:346: Draw_Shop_Number(Count_Item(item), tile_x + 12, tile_y);
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x0c
	inc	hl
	inc	hl
	ld	(hl), a
;bank19.c:342: if(Count_Item(item) < 10)
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00104$
;bank19.c:344: set_win_tiles(tile_x + 14, tile_y, 1, 1, Shop_Zeros);
	ld	bc, #_Shop_Zeros+0
	dec	hl
	dec	hl
	ld	a, (hl)
	add	a, #0x0e
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:345: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ld	hl, #_Shop_Num
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:346: Draw_Shop_Number(Count_Item(item), tile_x + 12, tile_y);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Item
	add	sp, #2
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Shop_Number
	add	sp, #4
	jr	00106$
00104$:
;bank19.c:348: else if(Count_Item(item) < 100)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Item
	add	sp, #2
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00106$
;bank19.c:350: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ld	hl, #_Shop_Num
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:351: Draw_Shop_Number(Count_Item(item), tile_x + 12, tile_y);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Item
	add	sp, #2
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Shop_Number
	add	sp, #4
00106$:
;bank19.c:353: }
	add	sp, #4
	ret
;bank19.c:355: void Draw_Shop_Equip(GameEquip* equip, UBYTE tile_x, UBYTE tile_y)
;	---------------------------------
; Function Draw_Shop_Equip
; ---------------------------------
_Draw_Shop_Equip::
	add	sp, #-4
;bank19.c:357: set_win_tiles(tile_x, tile_y, 7, 1, equip->name);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	de, #0x0107
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:359: set_win_tiles(tile_x + 7, tile_y, 2, 1, Shop_Clear);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	add	a, #0x07
	dec	hl
	ld	(hl), a
	ld	hl, #_Shop_Clear
	push	hl
	ld	de, #0x0102
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:360: Draw_Shop_Number(equip->price, tile_x + 7, tile_y);
	ld	hl, #0x0011
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
	call	_Count_Equip
	add	sp, #2
;bank19.c:365: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x0d
	inc	hl
;bank19.c:366: Draw_Shop_Number(Count_Equip(equip), tile_x + 12, tile_y);
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x0c
	inc	hl
	inc	hl
	ld	(hl), a
;bank19.c:362: if(Count_Equip(equip) < 10)
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00104$
;bank19.c:364: set_win_tiles(tile_x + 14, tile_y, 1, 1, Shop_Zeros);
	ld	bc, #_Shop_Zeros+0
	dec	hl
	dec	hl
	ld	a, (hl)
	add	a, #0x0e
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:365: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ld	hl, #_Shop_Num
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:366: Draw_Shop_Number(Count_Equip(equip), tile_x + 12, tile_y);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Equip
	add	sp, #2
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Shop_Number
	add	sp, #4
	jr	00106$
00104$:
;bank19.c:368: else if(Count_Equip(equip) < 100)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Equip
	add	sp, #2
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00106$
;bank19.c:370: set_win_tiles(tile_x + 13, tile_y, 1, 1, Shop_Num);
	ld	hl, #_Shop_Num
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:371: Draw_Shop_Number(Count_Equip(equip), tile_x + 12, tile_y);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Count_Equip
	add	sp, #2
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_Draw_Shop_Number
	add	sp, #4
00106$:
;bank19.c:373: }
	add	sp, #4
	ret
;bank19.c:375: void Draw_Shop_Message()
;	---------------------------------
; Function Draw_Shop_Message
; ---------------------------------
_Draw_Shop_Message::
;bank19.c:377: if(shop_message_x != 36)
	ld	a, (#_shop_message_x)
	sub	a, #0x24
	ret	Z
;bank19.c:379: set_win_tiles(1 + message_x, 13 + (message_y * 2), 1, 1, &Get_Shop(CurrentShop)->message[shop_message_x]);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	ld	hl, #0x000c
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_shop_message_x
	add	a, (hl)
	ld	c, a
	jr	NC, 00118$
	inc	b
00118$:
	ld	a, (#_message_y)
	add	a, a
	add	a, #0x0d
	ld	hl, #_message_x
	ld	d, (hl)
	inc	d
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:380: shop_message_x++;
	ld	hl, #_shop_message_x
	inc	(hl)
;bank19.c:381: message_x++;
	ld	hl, #_message_x
	inc	(hl)
;bank19.c:383: if(message_x == 18)
	ld	a, (hl)
	sub	a, #0x12
	ret	NZ
;bank19.c:385: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank19.c:386: message_y++;
	ld	hl, #_message_y
	inc	(hl)
;bank19.c:389: }
	ret
;bank19.c:391: void Draw_Confirm_Message()
;	---------------------------------
; Function Draw_Confirm_Message
; ---------------------------------
_Draw_Confirm_Message::
;bank19.c:393: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank19.c:395: Draw_Shop_Number_Reveal(ware_count, 1, 13);
	ld	hl, #_ware_count
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0d01
	push	de
	push	bc
	call	_Draw_Shop_Number_Reveal
	add	sp, #4
;bank19.c:397: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:399: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jp	NZ, 00110$
;bank19.c:401: for(i = 0; i < 6 ; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00118$:
;bank19.c:403: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:404: set_win_tiles(1 + u_x, 13, 1, 1, Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name + i);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0d
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:406: if(i > 3 && Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name[i] == 0x01)
	ld	hl, #_i
	ld	e, (hl)
	ld	a,#0x03
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00195$
	bit	7, d
	jr	NZ, 00196$
	cp	a, a
	jr	00196$
00195$:
	bit	7, d
	jr	Z, 00196$
	scf
00196$:
	jr	NC, 00102$
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	a, (hl)
	dec	a
	jp	Z,00111$
;bank19.c:408: break;
00102$:
;bank19.c:411: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:401: for(i = 0; i < 6 ; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x86
	jp	C, 00118$
	jp	00111$
00110$:
;bank19.c:416: for(i = 0; i < 7 ; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00120$:
;bank19.c:418: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:419: set_win_tiles(1 + u_x, 13, 1, 1, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name + i);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0d
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:420: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:422: if(i > 3 && Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->name[i] == 0x01)
	ld	hl, #_i
	ld	e, (hl)
	ld	a,#0x03
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00198$
	bit	7, d
	jr	NZ, 00199$
	cp	a, a
	jr	00199$
00198$:
	bit	7, d
	jr	Z, 00199$
	scf
00199$:
	jr	NC, 00121$
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	Z, 00111$
;bank19.c:424: break;
00121$:
;bank19.c:416: for(i = 0; i < 7 ; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	C, 00120$
00111$:
;bank19.c:429: for(i = 0; i < 3; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00122$:
;bank19.c:431: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:432: set_win_tiles(1 + u_x, 13, 1, 1, Shop_Plural + i);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_Shop_Plural
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0d
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:433: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:429: for(i = 0; i < 3; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jr	C, 00122$
;bank19.c:436: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank19.c:438: for(i = 0; i < 4; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00124$:
;bank19.c:440: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:441: set_win_tiles(1 + u_x, 15, 1, 1, Shop_Will + i);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_Shop_Will
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:442: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:438: for(i = 0; i < 4; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00124$
;bank19.c:445: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:447: for(i = 0; i < 2; i++)
	ld	hl, #_i
	ld	(hl), #0x00
00126$:
;bank19.c:449: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:450: set_win_tiles(1 + u_x, 15, 1, 1, Shop_Be + i);
	ld	a, (#_i)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_Shop_Be
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:451: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:447: for(i = 0; i < 2; i++)
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00126$
;bank19.c:454: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:456: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00116$
;bank19.c:458: u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:459: Draw_Shop_Number_Reveal(u16_i, 1 + u_x, 15);
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #_u16_i
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number_Reveal
	add	sp, #4
	jr	00117$
00116$:
;bank19.c:463: u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:464: Draw_Shop_Number_Reveal(u16_i, 1 + u_x, 15);
	ld	hl, #_u_x
	ld	a, (hl)
	inc	a
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #_u16_i
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number_Reveal
	add	sp, #4
00117$:
;bank19.c:467: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:468: set_win_tiles(1 + u_x, 15, 1, 1, Char_Gold);
	ld	a, (#_u_x)
	inc	a
	ld	hl, #_Char_Gold
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:469: u_x++;
	ld	hl, #_u_x
	inc	(hl)
;bank19.c:471: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:472: set_win_tiles(1 + u_x, 15, 1, 1, Char_Period);
	ld	a, (#_u_x)
	inc	a
	ld	hl, #_Char_Period
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x0f
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:473: }
	ret
;bank19.c:475: void Draw_Item_Wares()
;	---------------------------------
; Function Draw_Item_Wares
; ---------------------------------
_Draw_Item_Wares::
;bank19.c:477: if(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	hl, #_CurrentShopSelection
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;bank19.c:479: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection]), 2, 4);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	hl, #_CurrentShopSelection
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0402
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00102$:
;bank19.c:481: if(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;bank19.c:483: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection]), 2, 6);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0602
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00104$:
;bank19.c:485: if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;bank19.c:487: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00106$:
;bank19.c:489: if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	ret	Z
;bank19.c:491: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
;bank19.c:493: }
	ret
;bank19.c:495: void Draw_Equip_Wares()
;	---------------------------------
; Function Draw_Equip_Wares
; ---------------------------------
_Draw_Equip_Wares::
;bank19.c:497: if(Get_Shop(CurrentShop)->wares[0] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00102$
;bank19.c:499: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[0 + CurrentShopSelection]), 2, 4);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	hl, #_CurrentShopSelection
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0402
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00102$:
;bank19.c:501: if(Get_Shop(CurrentShop)->wares[1] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00104$
;bank19.c:503: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[1 + CurrentShopSelection]), 2, 6);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0602
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00104$:
;bank19.c:505: if(Get_Shop(CurrentShop)->wares[2] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00106$
;bank19.c:507: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00106$:
;bank19.c:509: if(Get_Shop(CurrentShop)->wares[3] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	ret	Z
;bank19.c:511: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
;bank19.c:513: }
	ret
;bank19.c:515: void Draw_Wares()
;	---------------------------------
; Function Draw_Wares
; ---------------------------------
_Draw_Wares::
;bank19.c:517: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
;bank19.c:519: Draw_Item_Wares();
	jp	Z,_Draw_Item_Wares
;bank19.c:521: else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	dec	a
	ret	NZ
;bank19.c:523: Draw_Equip_Wares();
;bank19.c:525: }
	jp  _Draw_Equip_Wares
;bank19.c:527: void Draw_Ware_Count()
;	---------------------------------
; Function Draw_Ware_Count
; ---------------------------------
_Draw_Ware_Count::
;bank19.c:529: set_win_tiles(10, 16, 1, 1, Shop_Zeros);
	ld	hl, #_Shop_Zeros
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x100a
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:530: Draw_Shop_Number(ware_count, 8, 16);
	ld	hl, #_ware_count
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x1008
	push	de
	push	bc
	call	_Draw_Shop_Number
	add	sp, #4
;bank19.c:531: }
	ret
;bank19.c:533: UBYTE Get_Max_Count(UINT16 base_cost)
;	---------------------------------
; Function Get_Max_Count
; ---------------------------------
_Get_Max_Count::
;bank19.c:535: u16_j = party_gold;
	ld	hl, #_party_gold
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_u16_j
	ld	(hl+), a
	ld	(hl), e
;bank19.c:536: u_x = 0;
	ld	hl, #_u_x
	ld	(hl), #0x00
;bank19.c:538: while(1)
00106$:
;bank19.c:540: if(u16_j >= base_cost && u_x < 99)
	ld	de, #_u16_j
	ldhl	sp,	#2
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00102$
	ld	a, (#_u_x)
	sub	a, #0x63
	jr	NC, 00102$
;bank19.c:542: u16_j -= base_cost;
	ld	hl, #_u16_j + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_u16_j + 1
	ld	(hl-), a
	ld	(hl), e
;bank19.c:543: u_x++;
	ld	hl, #_u_x
	inc	(hl)
	jr	00106$
00102$:
;bank19.c:547: return u_x;
	ld	hl, #_u_x
	ld	e, (hl)
;bank19.c:550: }
	ret
;bank19.c:552: void Draw_Count()
;	---------------------------------
; Function Draw_Count
; ---------------------------------
_Draw_Count::
;bank19.c:554: set_win_tiles(0, 12, 20, 6, Map_Shop_CountPLN0);
	ld	hl, #_Map_Shop_CountPLN0
	push	hl
	ld	de, #0x0614
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:555: Draw_Ware_Count();
	call	_Draw_Ware_Count
;bank19.c:557: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
;bank19.c:559: u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:560: Draw_Shop_Number(u16_i, 14, 16);
	ld	de, #0x100e
	push	de
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
	ret
00102$:
;bank19.c:564: u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:565: Draw_Shop_Number(u16_i, 14, 16);
	ld	de, #0x100e
	push	de
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
;bank19.c:567: }
	ret
;bank19.c:569: void Draw_Confirm()
;	---------------------------------
; Function Draw_Confirm
; ---------------------------------
_Draw_Confirm::
;bank19.c:571: set_win_tiles(0, 12, 20, 6, Map_Shop_Count_ReplacePLN0);
	ld	hl, #_Map_Shop_Count_ReplacePLN0
	push	hl
	ld	de, #0x0614
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:573: Draw_Confirm_Message();
	call	_Draw_Confirm_Message
;bank19.c:575: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:577: set_win_tiles(14, 7, 6, 5, Map_Shop_ConfirmPLN0);
	ld	hl, #_Map_Shop_ConfirmPLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x070e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:578: }
	ret
;bank19.c:580: void Close_Count()
;	---------------------------------
; Function Close_Count
; ---------------------------------
_Close_Count::
;bank19.c:582: set_win_tiles(0, 12, 20, 6, Map_Shop_Count_ReplacePLN0);
	ld	hl, #_Map_Shop_Count_ReplacePLN0
	push	hl
	ld	de, #0x0614
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:584: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
;bank19.c:586: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	ret
00102$:
;bank19.c:590: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
;bank19.c:592: }
	ret
;bank19.c:594: void Close_Shop()
;	---------------------------------
; Function Close_Shop
; ---------------------------------
_Close_Shop::
;bank19.c:596: fade_out();
	call	_fade_out
;bank19.c:598: Call_Load_Tileset(bank19, Tileset);
	ld	a, (#_Tileset)
	ld	d,a
	ld	e,#0x13
	push	de
	call	_Call_Load_Tileset
	add	sp, #2
;bank19.c:600: HIDE_WIN;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;bank19.c:601: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;c:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0xff
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;bank19.c:605: toggle_control(true);
	ld	a, #0x01
	push	af
	inc	sp
	call	_toggle_control
	inc	sp
;bank19.c:607: fade_in();
	call	_fade_in
;bank19.c:609: Gameplay();
;bank19.c:610: }
	jp  _Gameplay
;bank19.c:612: void Draw_Shop()
;	---------------------------------
; Function Draw_Shop
; ---------------------------------
_Draw_Shop::
;bank19.c:614: fade_out();
	call	_fade_out
;bank19.c:616: CurrentMenu = shop_main;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x00
;bank19.c:617: shop_x = 0;
	ld	hl, #_shop_x
	ld	(hl), #0x00
;bank19.c:618: shop_y = 0;
	ld	hl, #_shop_y
	ld	(hl), #0x00
;bank19.c:619: shop_message_x = 0;
	ld	hl, #_shop_message_x
	ld	(hl), #0x00
;bank19.c:620: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank19.c:621: message_y = 0;
	ld	hl, #_message_y
	ld	(hl), #0x00
;bank19.c:622: CurrentShopSelection = 0;
	ld	hl, #_CurrentShopSelection
	ld	(hl), #0x00
;bank19.c:624: Call_Load_Font_Menu(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Load_Font_Menu
	inc	sp
;bank19.c:626: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;bank19.c:627: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;c:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;bank19.c:631: set_win_tiles(0, 0, 20, 18, Map_Shop_MainPLN0);
	ld	hl, #_Map_Shop_MainPLN0
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:633: Draw_Wares();
	call	_Draw_Wares
;bank19.c:635: set_win_tiles(2, 1 + shop_y * 2, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	hl, #_shop_y
	ld	a, (hl)
	add	a, a
	inc	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x02
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:637: Draw_Shop_Number(party_gold, 14, 1);
	ld	de, #0x010e
	push	de
	ld	hl, #_party_gold
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
;bank19.c:639: fade_in();
;bank19.c:640: }
	jp  _fade_in
;bank19.c:642: void Clear_Shop_Pointer()
;	---------------------------------
; Function Clear_Shop_Pointer
; ---------------------------------
_Clear_Shop_Pointer::
;bank19.c:644: set_win_tiles(1, 4, 1, 1, Shop_Background);
	ld	bc, #_Shop_Background+0
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0401
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:645: set_win_tiles(1, 6, 1, 1, Shop_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0601
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:646: set_win_tiles(1, 8, 1, 1, Shop_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0801
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:647: set_win_tiles(1, 10, 1, 1, Shop_Background);
	push	bc
	ld	de, #0x0101
	push	de
	ld	de, #0x0a01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:648: }
	ret
;bank19.c:650: void Shop_Joypad()
;	---------------------------------
; Function Shop_Joypad
; ---------------------------------
_Shop_Joypad::
	add	sp, #-6
;bank19.c:652: Joy = joypad();
	call	_joypad
	ld	hl, #_Joy
	ld	(hl), e
;bank19.c:654: if(Joy & J_A)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;bank19.c:682: else if(shop_x == 1)
	ld	a, (#_shop_x)
	dec	a
	ld	a, #0x01
	jr	Z, 00829$
	xor	a, a
00829$:
	ldhl	sp,	#1
	ld	(hl), a
;bank19.c:695: else if(CurrentMenu == shop_buy)
	ld	a, (#_CurrentMenu)
	dec	a
	ld	a, #0x01
	jr	Z, 00831$
	xor	a, a
00831$:
	ldhl	sp,	#2
	ld	(hl), a
;bank19.c:749: else if(CurrentMenu == shop_buy_amount)
	ld	a, (#_CurrentMenu)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00833$
	xor	a, a
00833$:
	ldhl	sp,	#3
	ld	(hl), a
;bank19.c:766: else if(CurrentMenu == shop_buy_confirm)
	ld	a, (#_CurrentMenu)
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00835$
	xor	a, a
00835$:
	ldhl	sp,	#4
	ld	(hl), a
;bank19.c:654: if(Joy & J_A)
	ldhl	sp,	#0
	bit	4, (hl)
	jp	Z,00319$
;bank19.c:656: if(CurrentMenu == shop_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jp	NZ, 00177$
;bank19.c:658: if(shop_x == 0)
	ld	a, (#_shop_x)
	or	a, a
	jp	NZ, 00113$
;bank19.c:660: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:662: set_win_tiles(1, 13, 18, 4, Shop_Clear);
	ld	hl, #_Shop_Clear
	push	hl
	ld	de, #0x0412
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:664: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00102$
;bank19.c:666: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	jr	00103$
00102$:
;bank19.c:670: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
00103$:
;bank19.c:673: CurrentMenu = shop_buy;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank19.c:675: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	hl, #_shop_y
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:677: while(joypad() & J_A)
00104$:
	call	_joypad
	bit	4, e
	jp	Z,00321$
;bank19.c:679: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00104$
00113$:
;bank19.c:682: else if(shop_x == 1)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jp	Z, 00321$
;bank19.c:684: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:685: CurrentMenu = shop_sell;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x02
;bank19.c:687: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	hl, #_shop_y
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:689: while(joypad() & J_A)
00107$:
	call	_joypad
	bit	4, e
	jp	Z,00321$
;bank19.c:691: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00107$
00177$:
;bank19.c:695: else if(CurrentMenu == shop_buy)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jp	Z, 00174$
;bank19.c:697: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jp	NZ, 00125$
;bank19.c:699: if(Count_Item(Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])) < 99)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Count_Item
	add	sp, #2
	ld	a, e
	sub	a, #0x63
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00119$
;bank19.c:701: if(party_gold >= Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_party_gold
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	C, 00116$
;bank19.c:703: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:705: ware_count = 1;
	ld	hl, #_ware_count
	ld	(hl), #0x01
;bank19.c:707: Draw_Count();
	call	_Draw_Count
;bank19.c:709: CurrentMenu = shop_buy_amount;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x03
	jr	00127$
00116$:
;bank19.c:713: Call_Play_Buzz(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
	jr	00127$
00119$:
;bank19.c:718: Call_Play_Buzz(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
	jr	00127$
00125$:
;bank19.c:723: if(party_gold >= Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_party_gold
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	C, 00122$
;bank19.c:725: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:727: ware_count = 1;
	ld	hl, #_ware_count
	ld	(hl), #0x01
;bank19.c:729: Draw_Confirm();
	call	_Draw_Confirm
;bank19.c:731: set_win_tiles(15, 8, 1, 1, Shop_Pointer);
	ld	hl, #_Shop_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x080f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:733: confirm_y = 0;
	ld	hl, #_confirm_y
	ld	(hl), #0x00
;bank19.c:735: CurrentMenu = shop_buy_confirm;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x04
	jr	00127$
00122$:
;bank19.c:739: Call_Play_Buzz(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Buzz
	inc	sp
;bank19.c:744: while(joypad() & J_A)
00127$:
	call	_joypad
	bit	4, e
	jp	Z,00321$
;bank19.c:746: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00127$
00174$:
;bank19.c:749: else if(CurrentMenu == shop_buy_amount)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00171$
;bank19.c:751: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:753: Draw_Confirm();
	call	_Draw_Confirm
;bank19.c:755: set_win_tiles(15, 8, 1, 1, Shop_Pointer);
	ld	hl, #_Shop_Pointer
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x080f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:757: confirm_y = 0;
	ld	hl, #_confirm_y
	ld	(hl), #0x00
;bank19.c:759: CurrentMenu = shop_buy_confirm;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x04
;bank19.c:761: while(joypad() & J_A)
00130$:
	call	_joypad
	bit	4, e
	jp	Z,00321$
;bank19.c:763: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00130$
00171$:
;bank19.c:766: else if(CurrentMenu == shop_buy_confirm)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	Z, 00321$
;bank19.c:768: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:770: if(confirm_y == 0)
	ld	a, (#_confirm_y)
	or	a, a
	jp	NZ, 00163$
;bank19.c:772: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00134$
;bank19.c:774: u16_i = ware_count * Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:775: party_gold = party_gold - u16_i;
	ld	a, (#_party_gold)
	ld	hl, #_u16_i
	sub	a, (hl)
	ld	hl, #_party_gold
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_u16_i + 1
	sbc	a, (hl)
	ld	(#_party_gold + 1),a
;bank19.c:777: Call_Add_Item(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection]), ware_count);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	a, (#_ware_count)
	push	af
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Add_Item
	add	sp, #4
	jr	00135$
00134$:
;bank19.c:781: u16_i = ware_count * Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection])->price;
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0011
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_ware_count
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	hl, #_u16_i
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;bank19.c:782: party_gold = party_gold - u16_i;
	ld	a, (#_party_gold)
	ld	hl, #_u16_i
	sub	a, (hl)
	ld	hl, #_party_gold
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_u16_i + 1
	sbc	a, (hl)
	ld	(#_party_gold + 1),a
;bank19.c:784: Call_Add_Equip(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Add_Equip
	add	sp, #3
00135$:
;bank19.c:787: set_win_tiles(14, 1, 3, 1, Shop_Clear);
	ld	hl, #_Shop_Clear
	push	hl
	ld	de, #0x0103
	push	de
	ld	de, #0x010e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:788: Draw_Shop_Number(party_gold, 14, 1);
	ld	de, #0x010e
	push	de
	ld	hl, #_party_gold
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Draw_Shop_Number
	add	sp, #4
;bank19.c:790: Close_Count();
	call	_Close_Count
;bank19.c:792: set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);
	ld	hl, #_Map_Shop_Confirm_ReplacePLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x070e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:794: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jp	NZ, 00147$
;bank19.c:796: if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00137$
;bank19.c:798: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00137$:
;bank19.c:800: if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z, 00148$
;bank19.c:802: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
	jr	00148$
00147$:
;bank19.c:805: else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	dec	a
	jr	NZ, 00148$
;bank19.c:807: if(Get_Shop(CurrentShop)->wares[2] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00141$
;bank19.c:809: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00141$:
;bank19.c:811: if(Get_Shop(CurrentShop)->wares[3] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00148$
;bank19.c:813: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00148$:
;bank19.c:817: Draw_Wares();
	call	_Draw_Wares
;bank19.c:819: CurrentMenu = shop_buy;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
	jp	00165$
00163$:
;bank19.c:823: set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);
	ld	hl, #_Map_Shop_Confirm_ReplacePLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x070e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:825: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jp	NZ, 00160$
;bank19.c:827: if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00150$
;bank19.c:829: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00150$:
;bank19.c:831: if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00152$
;bank19.c:833: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00152$:
;bank19.c:836: CurrentMenu = shop_buy_amount;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x03
	jr	00161$
00160$:
;bank19.c:838: else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	dec	a
	jr	NZ, 00161$
;bank19.c:840: if(Get_Shop(CurrentShop)->wares[2] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00154$
;bank19.c:842: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00154$:
;bank19.c:844: if(Get_Shop(CurrentShop)->wares[3] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00156$
;bank19.c:846: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00156$:
;bank19.c:849: CurrentMenu = shop_buy;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
00161$:
;bank19.c:852: Close_Count();
	call	_Close_Count
;bank19.c:855: while(joypad() & J_A)
00165$:
	call	_joypad
	bit	4, e
	jp	Z,00321$
;bank19.c:857: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00165$
00319$:
;bank19.c:862: else if(Joy & J_B)
	ldhl	sp,	#0
	bit	5, (hl)
	jp	Z,00316$
;bank19.c:864: if(CurrentMenu == shop_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jr	NZ, 00214$
;bank19.c:866: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:867: Close_Shop();
	call	_Close_Shop
;bank19.c:869: while(joypad() & J_B)
00179$:
	call	_joypad
	bit	5, e
	jp	Z,00321$
;bank19.c:871: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:872: Draw_Shop_Message();
	call	_Draw_Shop_Message
	jr	00179$
00214$:
;bank19.c:875: else if(CurrentMenu == shop_buy || CurrentMenu == shop_sell)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00209$
	ld	a, (#_CurrentMenu)
	sub	a, #0x02
	jr	NZ, 00210$
00209$:
;bank19.c:877: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:879: CurrentMenu = shop_main;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x00
;bank19.c:881: Clear_Shop_Pointer();
	call	_Clear_Shop_Pointer
;bank19.c:882: set_win_tiles(1, 13, 18, 4, Shop_Clear);
	ld	hl, #_Shop_Clear
	push	hl
	ld	de, #0x0412
	push	de
	ld	de, #0x0d01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:884: shop_message_x = 0;
	ld	hl, #_shop_message_x
	ld	(hl), #0x00
;bank19.c:885: message_x = 0;
	ld	hl, #_message_x
	ld	(hl), #0x00
;bank19.c:886: message_y = 0;
	ld	hl, #_message_y
	ld	(hl), #0x00
;bank19.c:888: while(joypad() & J_B)
00182$:
	call	_joypad
	bit	5, e
	jp	Z,00321$
;bank19.c:890: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:891: Draw_Shop_Message();
	call	_Draw_Shop_Message
	jr	00182$
00210$:
;bank19.c:894: else if(CurrentMenu == shop_buy_amount)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00207$
;bank19.c:896: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:898: Close_Count();
	call	_Close_Count
;bank19.c:900: CurrentMenu = shop_buy;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank19.c:902: while(joypad() & J_B)
00185$:
	call	_joypad
	bit	5, e
	jp	Z,00321$
;bank19.c:904: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00185$
00207$:
;bank19.c:907: else if(CurrentMenu == shop_buy_confirm)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	Z, 00321$
;bank19.c:909: Call_Play_Confirm(bank19);
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Play_Confirm
	inc	sp
;bank19.c:911: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jp	NZ, 00199$
;bank19.c:913: set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);
	ld	hl, #_Map_Shop_Confirm_ReplacePLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x070e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:915: if(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00189$
;bank19.c:917: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[2 + CurrentShopSelection]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x02
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00189$:
;bank19.c:919: if(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00191$
;bank19.c:921: Draw_Shop_Item(Get_Item(Get_Shop(CurrentShop)->wares[3 + CurrentShopSelection]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_CurrentShopSelection)
	add	a, #0x03
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Item
	add	sp, #4
00191$:
;bank19.c:924: Draw_Count();
	call	_Draw_Count
;bank19.c:926: CurrentMenu = shop_buy_amount;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x03
	jp	00201$
00199$:
;bank19.c:928: else if(Get_Shop(CurrentShop)->shop_type == equip_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	dec	a
	jr	NZ, 00201$
;bank19.c:930: set_win_tiles(14, 7, 6, 5, Map_Shop_Confirm_ReplacePLN0);
	ld	hl, #_Map_Shop_Confirm_ReplacePLN0
	push	hl
	ld	de, #0x0506
	push	de
	ld	de, #0x070e
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:932: if(Get_Shop(CurrentShop)->wares[2] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00193$
;bank19.c:934: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[2]), 2, 8);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0802
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00193$:
;bank19.c:936: if(Get_Shop(CurrentShop)->wares[3] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00195$
;bank19.c:938: Draw_Shop_Equip(Get_Equip(Get_Shop(CurrentShop)->wares[3]), 2, 10);
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	ld	hl, #0x0a02
	push	hl
	push	de
	call	_Draw_Shop_Equip
	add	sp, #4
00195$:
;bank19.c:941: Close_Count();
	call	_Close_Count
;bank19.c:943: CurrentMenu = shop_buy;
	ld	hl, #_CurrentMenu
	ld	(hl), #0x01
;bank19.c:946: while(joypad() & J_B)
00201$:
	call	_joypad
	bit	5, e
	jp	Z,00321$
;bank19.c:948: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00201$
00316$:
;bank19.c:1021: set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Background);
	ld	a, (#_confirm_y)
	add	a, a
	add	a, #0x08
	ldhl	sp,	#5
	ld	(hl), a
;bank19.c:953: else if(Joy & J_UP)
	ldhl	sp,	#0
	bit	2, (hl)
	jp	Z,00313$
;bank19.c:955: if(CurrentMenu == shop_buy)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jp	Z, 00248$
;bank19.c:957: if(shop_y > 0)
	ld	hl, #_shop_y
	ld	a, (hl)
	or	a, a
	jp	Z, 00225$
;bank19.c:959: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Background);
	ld	bc, #_Shop_Background+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:961: shop_y -= 1;
	ld	hl, #_shop_y
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank19.c:963: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:965: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00217$
;bank19.c:967: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	jp	00227$
00217$:
;bank19.c:971: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
	jr	00227$
00225$:
;bank19.c:974: else if(CurrentShopSelection > 0)
	ld	hl, #_CurrentShopSelection
	ld	a, (hl)
	or	a, a
	jr	Z, 00227$
;bank19.c:976: CurrentShopSelection--;
	dec	(hl)
;bank19.c:977: Draw_Wares();
	call	_Draw_Wares
;bank19.c:979: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00220$
;bank19.c:981: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	jr	00227$
00220$:
;bank19.c:985: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
;bank19.c:989: while(joypad() & J_UP)
00227$:
	call	_joypad
	bit	2, e
	jp	Z,00321$
;bank19.c:991: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00227$
00248$:
;bank19.c:994: else if(CurrentMenu == shop_buy_amount)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00245$
;bank19.c:996: u_i = Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection];
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
;bank19.c:998: u_y = Get_Max_Count(Get_Item(u_i)->price);
	ld	(#_u_i), a
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	call	_Get_Max_Count
	add	sp, #2
	ld	hl, #_u_y
	ld	(hl), e
;bank19.c:999: u_j = 99 - Count_Item(Get_Item(u_i));
	ld	a, (#_u_i)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Count_Item
	add	sp, #2
	ld	a, #0x63
	sub	a, e
	ld	(#_u_j),a
;bank19.c:1001: if(ware_count < u_y && ware_count < u_j)
	ld	a, (#_ware_count)
	ld	hl, #_u_y
	sub	a, (hl)
	jr	NC, 00231$
	ld	a, (#_ware_count)
	ld	hl, #_u_j
	sub	a, (hl)
	jr	NC, 00231$
;bank19.c:1003: ware_count++;
	ld	hl, #_ware_count
	inc	(hl)
;bank19.c:1004: Draw_Count();
	call	_Draw_Count
	jr	00234$
00231$:
;bank19.c:1008: ware_count = 1;
	ld	hl, #_ware_count
	ld	(hl), #0x01
;bank19.c:1009: Draw_Count();
	call	_Draw_Count
;bank19.c:1012: while(joypad() & J_UP)
00234$:
	call	_joypad
	bit	2, e
	jp	Z,00321$
;bank19.c:1014: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00234$
00245$:
;bank19.c:1017: else if(CurrentMenu == shop_buy_confirm)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	Z, 00321$
;bank19.c:1019: if(confirm_y == 1)
	ld	a, (#_confirm_y)
	dec	a
	jr	NZ, 00239$
;bank19.c:1021: set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Background);
	ld	hl, #_Shop_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	d, (hl)
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1023: confirm_y = 0;
	ld	hl, #_confirm_y
	ld	(hl), #0x00
;bank19.c:1025: set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	xor	a, a
	add	a, a
	add	a, #0x08
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1028: while(joypad() & J_UP)
00239$:
	call	_joypad
	bit	2, e
	jp	Z,00321$
;bank19.c:1030: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00239$
00313$:
;bank19.c:1035: else if(Joy & J_DOWN)
	ldhl	sp,	#0
	bit	3, (hl)
	jp	Z,00310$
;bank19.c:1037: if(CurrentMenu == shop_buy)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jp	Z, 00288$
;bank19.c:1039: if(shop_y < 3)
	ld	a, (#_shop_y)
	sub	a, #0x03
	jp	NC, 00263$
;bank19.c:1041: if(Get_Shop(CurrentShop)->wares[shop_y + 1] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z, 00265$
;bank19.c:1043: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Background);
	ld	bc, #_Shop_Background+0
	ld	hl, #_shop_y
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1045: shop_y += 1;
	ld	hl, #_shop_y
	inc	(hl)
;bank19.c:1047: set_win_tiles(1, 4 + shop_y * 2, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x01
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1049: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00251$
;bank19.c:1051: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	jp	00265$
00251$:
;bank19.c:1055: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
	jp	00265$
00263$:
;bank19.c:1059: else if(CurrentShopSelection < 6)
	ld	a, (#_CurrentShopSelection)
	sub	a, #0x06
	jp	NC, 00265$
;bank19.c:1061: if(Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection + 1] != 0)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	inc	a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00265$
;bank19.c:1063: CurrentShopSelection++;
	ld	hl, #_CurrentShopSelection
	inc	(hl)
;bank19.c:1064: Draw_Wares();
	call	_Draw_Wares
;bank19.c:1066: if(Get_Shop(CurrentShop)->shop_type == item_shop)
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00256$
;bank19.c:1068: Call_Draw_Item_Description(bank19, Get_Item(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Item_Description
	add	sp, #3
	jr	00265$
00256$:
;bank19.c:1072: Call_Draw_Equip_Description_Large(bank19, Get_Equip(Get_Shop(CurrentShop)->wares[shop_y +  CurrentShopSelection]));
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	call	_Get_Equip
	inc	sp
	push	de
	ld	a, #0x13
	push	af
	inc	sp
	call	_Call_Draw_Equip_Description_Large
	add	sp, #3
;bank19.c:1077: while(joypad() & J_DOWN)
00265$:
	call	_joypad
	bit	3, e
	jp	Z,00321$
;bank19.c:1079: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00265$
00288$:
;bank19.c:1082: else if(CurrentMenu == shop_buy_amount)
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jp	Z, 00285$
;bank19.c:1084: if(ware_count > 1)
	ld	a, #0x01
	ld	hl, #_ware_count
	sub	a, (hl)
	jr	NC, 00272$
;bank19.c:1086: ware_count--;
	dec	(hl)
;bank19.c:1087: Draw_Count();
	call	_Draw_Count
	jr	00274$
00272$:
;bank19.c:1091: u_i = Get_Shop(CurrentShop)->wares[shop_y + CurrentShopSelection];
	ld	a, (#_CurrentShop)
	push	af
	inc	sp
	call	_Get_Shop
	inc	sp
	inc	de
	inc	de
	ld	a, (#_shop_y)
	ld	hl, #_CurrentShopSelection
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
;bank19.c:1093: u_y = Get_Max_Count(Get_Item(u_i)->price);
	ld	(#_u_i), a
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	call	_Get_Max_Count
	add	sp, #2
	ld	hl, #_u_y
	ld	(hl), e
;bank19.c:1094: u_j = 99 - Count_Item(Get_Item(u_i));
	ld	a, (#_u_i)
	push	af
	inc	sp
	call	_Get_Item
	inc	sp
	push	de
	call	_Count_Item
	add	sp, #2
	ld	a, #0x63
	sub	a, e
;bank19.c:1096: if(u_y > u_j)
	ld	(#_u_j),a
	ld	hl, #_u_y
	sub	a, (hl)
	jr	NC, 00269$
;bank19.c:1098: ware_count = u_j;
	ld	a, (#_u_j)
	ld	(#_ware_count),a
	jr	00270$
00269$:
;bank19.c:1102: ware_count = u_y;
	ld	a, (#_u_y)
	ld	(#_ware_count),a
00270$:
;bank19.c:1105: Draw_Count();
	call	_Draw_Count
;bank19.c:1108: while(joypad() & J_DOWN)
00274$:
	call	_joypad
	bit	3, e
	jp	Z,00321$
;bank19.c:1110: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00274$
00285$:
;bank19.c:1113: else if(CurrentMenu == shop_buy_confirm)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	Z, 00321$
;bank19.c:1115: if(confirm_y == 0)
	ld	a, (#_confirm_y)
	or	a, a
	jr	NZ, 00279$
;bank19.c:1117: set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Background);
	ld	hl, #_Shop_Background
	push	hl
	ld	de, #0x0101
	push	de
	ldhl	sp,	#9
	ld	d, (hl)
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1119: confirm_y = 1;
	ld	hl, #_confirm_y
	ld	(hl), #0x01
;bank19.c:1121: set_win_tiles(15, 8 + (confirm_y * 2), 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	a, #0x01
	add	a, a
	add	a, #0x08
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x0f
	push	de
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1124: while(joypad() & J_DOWN)
00279$:
	call	_joypad
	bit	3, e
	jp	Z,00321$
;bank19.c:1126: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
	jr	00279$
00310$:
;bank19.c:1137: set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Background);
	ld	a, (#_shop_x)
	add	a, a
	add	a, a
	add	a, #0x02
	ld	b, a
;bank19.c:1131: else if(Joy & J_LEFT)
	ldhl	sp,	#0
	bit	1, (hl)
	jr	Z, 00307$
;bank19.c:1133: if(CurrentMenu == shop_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jp	NZ, 00321$
;bank19.c:1135: if(shop_x == 1)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00292$
;bank19.c:1137: set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Background);
	ld	hl, #_Shop_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1139: shop_x -= 1;
	ld	hl, #_shop_x
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
;bank19.c:1141: set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x02
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1143: Draw_Wares();
	call	_Draw_Wares
;bank19.c:1146: while(joypad() & J_LEFT)
00292$:
	call	_joypad
	bit	1, e
	jr	Z, 00321$
;bank19.c:1148: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:1149: Draw_Shop_Message();
	call	_Draw_Shop_Message
	jr	00292$
00307$:
;bank19.c:1154: else if(Joy & J_RIGHT)
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00321$
;bank19.c:1156: if(CurrentMenu == shop_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jr	NZ, 00321$
;bank19.c:1158: if(shop_x == 0)
	ld	a, (#_shop_x)
	or	a, a
	jr	NZ, 00299$
;bank19.c:1160: set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Background);
	ld	hl, #_Shop_Background
	push	hl
	ld	de, #0x0101
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1162: shop_x += 1;
	ld	hl, #_shop_x
	inc	(hl)
;bank19.c:1164: set_win_tiles(2 + shop_x * 4, 1, 1, 1, Shop_Pointer);
	ld	bc, #_Shop_Pointer+0
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, #0x02
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;bank19.c:1167: while(joypad() & J_RIGHT)
00299$:
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00321$
;bank19.c:1169: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:1170: Draw_Shop_Message();
	call	_Draw_Shop_Message
	jr	00299$
00321$:
;bank19.c:1174: }
	add	sp, #6
	ret
;bank19.c:1176: void Shop()
;	---------------------------------
; Function Shop
; ---------------------------------
_Shop::
;bank19.c:1178: while(1)
00104$:
;bank19.c:1180: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:1182: if(CurrentMenu == shop_main)
	ld	a, (#_CurrentMenu)
	or	a, a
	jr	NZ, 00102$
;bank19.c:1184: Draw_Shop_Message();
	call	_Draw_Shop_Message
00102$:
;bank19.c:1187: Shop_Joypad();
	call	_Shop_Joypad
;bank19.c:1189: }
	jr	00104$
;bank19.c:1191: void Load_Shop()
;	---------------------------------
; Function Load_Shop
; ---------------------------------
_Load_Shop::
;bank19.c:1193: Draw_Shop();
	call	_Draw_Shop
;bank19.c:1195: while(joypad() & J_A)
00101$:
	call	_joypad
	bit	4, e
	jp	Z,_Shop
;bank19.c:1197: performant_delay(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;bank19.c:1198: Draw_Shop_Message();
	call	_Draw_Shop_Message
;bank19.c:1201: Shop();
;bank19.c:1202: }
	jr	00101$
	.area _CODE_19
	.area _CABS (ABS)
