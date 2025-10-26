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
compile fwg3.c -o obj/fwg3.asm || abort_build

echo
echo Assemble the ASM code
echo --------------------------
assemble obj/fwg3.asm -o obj/fwg3.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/Background.png -o obj/Background.vtex || abort_build
png2vircon Images/GameObjects.png -o obj/GameObjects.vtex || abort_build
png2vircon Images/YOUDIED.png -o obj/YOUDIED.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/Bezos1.wav -o obj/Bezos1.vsnd || abort_build
wav2vircon Audio/YOUDIED.wav -o obj/YOUDIED.vsnd || abort_build
wav2vircon Audio/Cracking.wav -o obj/Cracking.vsnd || abort_build
wav2vircon Audio/Score.wav -o obj/Score.vsnd || abort_build
wav2vircon Audio/PCBootup.wav -o obj/PCBootup.vsnd || abort_build

echo
echo Pack the ROM
echo --------------------------
packrom fwg3.xml -o fwg3.v32 || abort_build

echo
echo BOB could Build it
echo ------------------------------------------------------

if [ "$1" != "" ]; then
    echo
    echo GAME TIME
    echo ------------------------------------------------------
    game=$(Vircon32 ${1})
    echo $game
fi
exit
