#include <gb/gb.h>
#include "Music/output.c"

void Play_Buzz()
{
    NR10_REG = 0x2A;
    NR11_REG = 0x82;
    NR12_REG = 0xF1;
    NR13_REG = 0x5E;
    NR14_REG = 0x86;
}

void Play_Use()
{
    NR10_REG = 0x27;
    NR11_REG = 0x41;
    NR12_REG = 0xF3;
    NR13_REG = 0x5E;
    NR14_REG = 0x86;
}

void Play_Confirm()
{
    NR10_REG = 0x34;
    NR11_REG = 0x81;
    NR12_REG = 0xF3;
    NR13_REG = 0x08;
    NR14_REG = 0x87;
}