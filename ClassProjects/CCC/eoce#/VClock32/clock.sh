#!/bin/bash

# define an abort function to call on error
abort_build()
{
    echo
    echo BUILD FAILED
    exit 1
}

# create obj and bin folders if non exiting, since
# the development tools will not create them themselves
mkdir -p obj
mkdir -p bin

echo
echo Compile the C code
echo --------------------------
compile clock.c -o obj/clock.asm || abort_build

echo
echo Assemble the ASM code
echo --------------------------
assemble obj/clock.asm -o obj/clock.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/BClock.png -o obj/BClock.vtex || abort_build
png2vircon Images/BSecHand.png -o obj/BSecHand.vtex || abort_build
png2vircon Images/BMinHand.png -o obj/BMinHand.vtex || abort_build
png2vircon Images/BHourHand.png -o obj/BHourHand.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/Turncoat.wav -o obj/Turncoat.vtex || abort_build
wav2vircon Audio/UACT.wav -o obj/UACT.vtex || abort_build
wav2vircon Audio/TBBell.wav -o obj/TBBell.vtex || abort_build
wav2vircon Audio/Mudkipcry.wav -o obj/Mudkipcry.vtex || abort_build

echo
echo Pack the ROM
echo --------------------------
packrom clock.xml -o clock.v32 || abort_build

echo
echo BUILD SUCCESSFUL
echo --------------------------

if [ "$1" != "" ]; then
	echo
	echo GAME TIME
	echo --------------------------
	game=$(Vircon32 ${1})
	echo $game
fi
exit
