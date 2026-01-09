#include "video.h"
#include "input.h"
#include "time.h"
#include "string.h"
#include "audio.h"
#include "math.h"

//---------------------------------------------
// Definitions
//---------------------------------------------

#define TextureBClock		0
#define RegionBClock		0

#define TextureBSecHand		1
#define RegionBSecHand		1

#define TextureBMinHand		2
#define RegionBMinHand		2

#define TextureBHourHand	3
#define RegionBHourHand		3

#define MusicTurncoat		0
#define MusicUACT			1
#define MusicTBBell			2
#define MusicMudkipCry		3

//---------------------------------------------
// Main
//---------------------------------------------

void main( void )
{
	int time = 0;
	int hour = 0;
	int min = 0;
	int sin = 0;
	int sec = 0;
	int prevs = 0;
	int prevm = 0;
	int prevh = 0;

	//-----------------------------------------------------------
	// Textures
	//-----------------------------------------------------------

	select_texture( TextureBClock );
	select_region( RegionBClock );
	define_region( 6,6, 353,353, 180,180 );

	select_texture( TextureBSecHand );
	select_region( RegionBSecHand );
	define_region( 176,38, 183,199, 180,180 );

	select_texture( TextureBMinHand );
	select_region( RegionBMinHand );
	define_region( 176,38, 183,199, 180,180 );

	select_texture( TextureBHourHand );
	select_region( RegionBHourHand );
	define_region( 165,93, 194,199, 180,180 );

	//-----------------------------------------------------------
	// Loop
	//-----------------------------------------------------------

    while( true )
    {
		time = get_time();			// Totoal seconds passed this day								8274 is total seconds so far in the day
		clear_screen( color_black );

		prevs = sec;
		prevm = min;
		prevh = hour;

		//-----------------------------------------------------------
		// Time Time
		//-----------------------------------------------------------

		hour = time/3600;			// Gives you current hour as a whole number						8274/3600 = 2 hours as a whole number
		min = hour*3600;			// Total seconds passed until current hour						2*3600 = 7200sec
		sin = time-min;				// Seconds difference between total seconds and current hour	8274-7200 = 1074sec
		min = sin/60;				// How to get the current minuete as a whole number				1074/60 = 17 mins as a whole number
		sec = min*60;				// Total seconds passed in this hour until this min				17*60 = 1020sec
		sec = sin-sec;				// Seconds differnece between sin and minuete					1074-1020 = 54sec into current minuete
		if ( hour > 12 ) {
			hour = hour-12;
		}

		//---------------------------------------------
		// Drawing
		//---------------------------------------------

		select_texture( TextureBClock );
		select_region( RegionBClock );
		draw_region_at( 320, 180 );

		select_texture( TextureBSecHand );
		select_region( RegionBSecHand );
		set_drawing_angle( sec*(pi/30) );
		draw_region_rotated_at( 320, 180 );

		select_texture( TextureBMinHand );
		select_region( RegionBMinHand );
		set_drawing_angle( min*(pi/30) );
		draw_region_rotated_at( 320, 180 );

		select_texture( TextureBHourHand );
		select_region( RegionBHourHand );
		set_drawing_angle( hour*( pi/6 ) );
		draw_region_rotated_at( 320, 180 );

		//---------------------------------------------
		// Sounds
		//---------------------------------------------

		if( prevs != sec ) {
			play_sound( MusicUACT );
		}
		if( prevm != min ) {
			play_sound( MusicMudkipCry );
		}
		if( prevh != hour) {
			play_sound( MusicTBBell );
		}

		end_frame();
    }
}
