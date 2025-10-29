#!/bin/bash

#Abort function to call on an error
abort_build()
{
	echo
	echo BUILD FAILED
	echo
	exit
}

#Extra folders
mkdir -p obj
mkdir -p bin

#The main meat

echo
echo "It's C or Nothing"
echo ------------------------------------------------------
compile cgf0.c -o obj/cgf0.asm || abort_build

echo
echo ASS TIME
echo ------------------------------------------------------
assemble obj/cgf0.asm -o obj/cgf0.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/Table_SGB.png -o obj/Table_SGB.vtex || abort_build
png2vircon Images/Player_Suits_SGB.png -o obj/Player_Suits_SGB.vtex || abort_build
png2vircon Images/Enemy_Suits_SGB.png -o obj/Enemy_Suits_SGB.vtex || abort_build

#echo
#echo Convert the WAV sounds
#echo --------------------------
#wav2vircon Audio/DoomTheme.wav -o obj/DoomTheme.vsnd || abort_build

echo
echo ROM-FLcopter you are clear for Take Off
echo ------------------------------------------------------
packrom cgf0.xml -o cgf0.v32 || abort_build

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
