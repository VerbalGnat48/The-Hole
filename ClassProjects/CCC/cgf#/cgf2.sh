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

#The main meat

echo
echo "It's C or Nothing"
echo ------------------------------------------------------
compile cgf2.c -o obj/cgf2.asm || abort_build

echo
echo ASS TIME
echo ------------------------------------------------------
assemble obj/cgf2.asm -o obj/cgf2.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/Table_SGB.png -o obj/Table_SGB.vtex || abort_build
png2vircon Images/FC_Player_Suits_SGB.png -o obj/FC_Player_Suits_SGB.vtex || abort_build
png2vircon Images/FC_Enemy_Suits_SGB.png -o obj/FC_Enemy_Suits_SGB.vtex || abort_build
png2vircon Images/Alphabet_SGB.png -o obj/Alphabet_SGB.vtex || abort_build
png2vircon Images/Dark.png -o obj/Dark.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/Casino.wav -o obj/Casino.vsnd || abort_build
wav2vircon Audio/Flip.wav -o obj/Flip.vsnd || abort_build
wav2vircon Audio/Shuffle.wav -o obj/Shuffle.vsnd || abort_build
wav2vircon Audio/Start.wav -o obj/Start.vsnd || abort_build
wav2vircon Audio/Win.wav -o obj/Win.vsnd || abort_build

echo
echo ROM-FLcopter you are clear for Take Off
echo ------------------------------------------------------
packrom cgf2.xml -o cgf2.v32 || abort_build

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
