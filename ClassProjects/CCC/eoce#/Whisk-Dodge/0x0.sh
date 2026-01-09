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
compile 0x0.c -o obj/0x0.asm || abort_build

echo
echo Assemble the ASM code
echo --------------------------
assemble obj/0x0.asm -o obj/0x0.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/Texture-Background.png -o obj/Texture-Background.vtex || abort_build
png2vircon Images/Texture-GameObjects.png -o obj/Texture-GameObjects.vtex || abort_build
png2vircon Images/Texture-YOUDIED.png -o obj/Texture-YOUDIED.vtex || abort_build
png2vircon Images/smoltextbg.png -o obj/smoltextbg.vtex || abort_build
png2vircon Images/structbg.png -o obj/structbg.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/Sound-Bezos1.wav -o obj/Sound-Bezos1.vsnd || abort_build
wav2vircon Audio/Sound-YOUDIED.wav -o obj/Sound-YOUDIED.vsnd || abort_build
wav2vircon Audio/Sound-Cracking.wav -o obj/Sound-Cracking.vsnd || abort_build
wav2vircon Audio/Sound-Score.wav -o obj/Sound-Score.vsnd || abort_build
wav2vircon Audio/Sound-PCBootup.wav -o obj/Sound-PCBootup.vsnd || abort_build

echo
echo Pack the ROM
echo --------------------------
packrom 0x0.xml -o 0x0.v32 || abort_build

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
