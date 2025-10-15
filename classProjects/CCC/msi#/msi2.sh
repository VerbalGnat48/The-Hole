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
compile msi2.c -o obj/msi2.asm || abort_build

echo
echo ASS TIME
echo ------------------------------------------------------
assemble obj/msi2.asm -o obj/msi2.vbin || abort_build

echo
echo Convert the PNG textures
echo --------------------------
png2vircon Images/GameObjects.png -o obj/GameObjects.vtex || abort_build
png2vircon Images/Start.png -o obj/Start.vtex || abort_build
png2vircon Images/DoomBG.png -o obj/DoomBG.vtex || abort_build
png2vircon Images/GameOver.png -o obj/GameOver.vtex || abort_build

echo
echo Convert the WAV sounds
echo --------------------------
wav2vircon Audio/DoomTheme.wav -o obj/DoomTheme.vsnd || abort_build
wav2vircon Audio/NewHorizonsTheme.wav -o obj/NewHorizonsTheme.vsnd || abort_build
wav2vircon Audio/Shotgun.wav -o obj/Shotgun.vsnd || abort_build
wav2vircon Audio/Hurt.wav -o obj/Hurt.vsnd || abort_build
wav2vircon Audio/Dead.wav -o obj/Dead.vsnd || abort_build
wav2vircon Audio/Fireball.wav -o obj/Fireball.vsnd || abort_build
wav2vircon Audio/DemonDeath.wav -o obj/DemonDeath.vsnd || abort_build
wav2vircon Audio/ShieldDamage.wav -o obj/ShieldDamage.vsnd || abort_build
wav2vircon Audio/ShieldDeath.wav -o obj/ShieldDeath.vsnd || abort_build

echo
echo ROM-FLcopter you are clear for Take Off
echo ------------------------------------------------------
packrom msi2.xml -o msi2.v32 || abort_build

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
