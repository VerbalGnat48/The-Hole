#!/bin/bash

#Abort function to call on an error
abort_build()
{
	echo
	echo BUILD FAILED
	echo
	exit
}

#The main meat
mkdir -p obj
mkdir -p bin

echo
echo Avengers Assemble!
echo --------------------------------------------
assemble fdf0.s -o fdf0.o || abort_build

echo
echo Convert the PNG textures
echo --------------------------------------------
png2vircon T-SS3Combined.png -o obj/T-SS3Combined.vtex || abort_build
png2vircon T-BG1.png -o obj/T-BG1.vtex || abort_build
png2vircon T-BG2.png -o obj/T-BG2.vtex || abort_build
png2vircon T-BG3.png -o obj/T-BG3.vtex || abort_build
png2vircon T-BG4.png -o obj/T-BG4.vtex || abort_build
png2vircon T-BG5.png -o obj/T-BG5.vtex || abort_build
png2vircon T-BG6.png -o obj/T-BG6.vtex || abort_build
png2vircon T-BG7.png -o obj/T-BG7.vtex || abort_build
png2vircon T-BGU.png -o obj/T-BGU.vtex || abort_build
png2vircon title.png -o obj/title.vtex || abort_build

echo
echo I AM LISTENING!
echo -------------------------------------------
wav2vircon Title_screen_theme.wav -o obj/Title_screen_theme.vsnd || abort_build
wav2vircon JoeSelect2.wav -o obj/JoeSelect2.vsnd || abort_build
wav2vircon MattioSelect2.wav -o obj/MattioSelect2.vsnd || abort_build

wav2vircon 1-1_theme.wav -o obj/1-1_theme.vsnd || abort_build
wav2vircon Jump_SoundV2.wav -o obj/Jump_SoundV2.vsnd || abort_build
wav2vircon Bowser_jump.wav -o obj/Bowser_jump.vsnd || abort_build
wav2vircon Fireball.wav -o obj/Fireball.vsnd || abort_build
wav2vircon Death_and_GO.wav -o obj/Death_and_GO.vsnd || abort_build

wav2vircon Coin_grab.wav -o obj/Coin_grab.vsnd || abort_build
wav2vircon Mushroom_get.wav -o obj/Mushroom_get.vsnd || abort_build
wav2vircon Jump_on_Enemy.wav -o obj/Jump_on_Enemy.vsnd || abort_build
wav2vircon Win.wav -o obj/Win.vsnd || abort_build

echo
echo Get Packed
echo --------------------------------------------
packrom fdf0.xml -o fdf0.v32 || abort_build

echo
echo I am a building
echo --------------------------------------------

if [ "$1" != "" ]; then
	echo
	echo Lost my Vircon Card Today!
	echo --------------------------------------------
	game=$(Vircon32 ${1})
	echo $game
fi
exit
