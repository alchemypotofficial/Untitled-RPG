c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o bank0.o bank0.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo2 -c -o bank2.o bank2.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo3 -c -o bank3.o bank3.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo4 -c -o bank4.o bank4.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo5 -c -o bank5.o bank5.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo6 -c -o bank6.o bank6.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo7 -c -o bank7.o bank7.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo8 -c -o bank8.o bank8.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo9 -c -o bank9.o bank9.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo10 -c -o bank10.o bank10.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo11 -c -o bank11.o bank11.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo12 -c -o bank12.o bank12.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo13 -c -o bank13.o bank13.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo14 -c -o bank14.o bank14.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo15 -c -o bank15.o bank15.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo16 -c -o bank16.o bank16.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo17 -c -o bank17.o bank17.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo18 -c -o bank18.o bank18.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo19 -c -o bank19.o bank19.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo20 -c -o bank20.o bank20.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-ba0 -c -o banksave.o banksave.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o gbt_player.o Music/gbt_player.s
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o gbt_player_bank1.o Music/gbt_player_bank1.s
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wl-yt0x1B -Wl-yo32 -Wl-ya1 -Wl-yp0x143=0x80 -v -o bottledtime.gbc bank0.o bank2.o bank3.o bank4.o bank5.o bank6.o bank7.o bank8.o bank9.o bank10.o bank11.o bank12.o bank13.o bank14.o bank15.o bank16.o bank17.o bank18.o bank19.o bank20.o banksave.o gbt_player.o gbt_player_bank1.o
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wl-yt0x1B -Wl-yo32 -Wl-ya1 -Wl-yp0x143=0x00 -v -o bottledtime.gb bank0.o bank2.o bank3.o bank4.o bank5.o bank6.o bank7.o bank8.o bank9.o bank10.o bank11.o bank12.o bank13.o bank14.o bank15.o bank16.o bank17.o bank18.o bank19.o bank20.o banksave.o gbt_player.o gbt_player_bank1.o
del *.o *.lst *.sav *.sym *.map