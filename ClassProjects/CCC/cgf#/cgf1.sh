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
compile cgf1.c -o obj/cgf1.asm || abort_build

echo
echo ASS TIME
echo ------------------------------------------------------
assemble obj/cgf1.asm -o obj/cgf1.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/Table_SGB.png -o obj/Table_SGB.vtex || abort_build
png2vircon Images/Player_Suits_SGB.png -o obj/Player_Suits_SGB.vtex || abort_build
png2vircon Images/Enemy_Suits_SGB.png -o obj/Enemy_Suits_SGB.vtex || abort_build
png2vircon Images/Alphabet_SGB.png -o obj/Alphabet_SGB.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/BlackJack.wav -o obj/BlackJack.vsnd || abort_build
wav2vircon Audio/Casino.wav -o obj/Casino.vsnd || abort_build
wav2vircon Audio/Flip.wav -o obj/Flip.vsnd || abort_build
wav2vircon Audio/Lose.wav -o obj/Lose.vsnd || abort_build
wav2vircon Audio/Shuffle.wav -o obj/Shuffle.vsnd || abort_build
wav2vircon Audio/Start.wav -o obj/Start.vsnd || abort_build
wav2vircon Audio/Win.wav -o obj/Win.vsnd || abort_build

echo
echo ROM-FLcopter you are clear for Take Off
echo ------------------------------------------------------
packrom cgf1.xml -o cgf1.v32 || abort_build

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
