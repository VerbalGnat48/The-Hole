#include "audio.h"
#include "video.h"
#include "input.h"
#include "time.h"
#include "math.h"
#include "misc.h"
#include "string.h"

//-----------------------------------------------
// Definitions
//-----------------------------------------------

#define TextureBackground	0
#define TextureGameObjects	1
#define TextureYOUDIED		2

#define RegionBackground	0

#define RegionYOUDIED		0

#define RegionFace			0
#define RegionSkull			1
#define RegionLeft			2
#define RegionRight			3
#define RegionEnemyWhisk	4

#define PlayerSpeed			4
#define EnemySpeed			3

#define MaxEnemies			14

#define MusicBezos			0
#define SoundYOUDIED		1
#define SoundCracking		2
#define SoundScore			3
#define SoundPCBootup		4

#define ChannelMusic		15

// How each object starts
struct GameObject
{
	bool Alive;			// Mortality
	int X, Y;			// Center of object
	int Width, Height;	// Hitbox
};

//-----------------------------------------------
// Objects over lapping
//-----------------------------------------------

bool ObjectsOverlap( GameObject* Object1, GameObject* Object2 )
{
	// Non-overlap on X
	if( (Object1->X - Object1->Width/2) >= (Object2->X + Object2->Width/2) )
		return false;

	if( (Object1->X + Object1->Width/2) <= (Object2->X - Object2->Width/2) )
		return false;

	// Non-overlap Y
	if( (Object1->Y - Object1->Height/2) >= (Object2->Y + Object2->Height/2) )
		return false;

	if( (Object1->Y + Object1->Height/2) <= (Object2->Y - Object2->Height/2) )
		return false;

	// Overlap on X and Y
	return true;
}

//-----------------------------------------------
// Main
//-----------------------------------------------

void main( void )
{	

	// Background Texture
	select_texture( TextureBackground );
	select_region( RegionBackground );
	define_region_topleft( 0,0, 639,359 );

	// YOUDIED Texture
	select_texture( TextureYOUDIED );
	select_region( RegionYOUDIED );
	define_region_topleft( 0,0,  639,359 );
	
	// GameObject Textures
	select_texture( TextureGameObjects );

	// Jegg
	define_region_matrix( RegionFace,  34,149,  95,210,  65,180,  4,1,  65 );

	// Whisk
	select_region( RegionEnemyWhisk );
	define_region(  568,156,  583,203,  575,180 );

	//-----------------------------------------------
	// Music Loop
	//-----------------------------------------------
	select_sound( MusicBezos );
	set_sound_loop( true );

	// lower sound if 2+ sounds
//	for( int i = 0; i < sound_channels; i++ )
//	{
//		select_channel( i );
//		set_channel_volume( 0.3 );
//	}

	//-----------------------------------------------
	// Initializations
	//-----------------------------------------------

	select_gamepad( 0 );

	// Random number graber/maker
	srand( get_time() );

	// Jegg start state
	GameObject Jegg;
	Jegg.Alive = true;
	Jegg.Width = 46;
	Jegg.Height = 60;
	Jegg.X = screen_width / 2;
	Jegg.Y = 320;

	int Jimage = RegionFace;	
	int index = 0;
	int Points = 0;
	int[30] Statement;

	// Max enemies is 14 as defined at the top
	GameObject[ MaxEnemies ] Enemies;
	
	for( int index = 0; index < MaxEnemies; index++ )
		{
			Enemies[ index ].Alive = true;
			Enemies[ index ].Width = 13;
			Enemies[ index ].Height = 45;

			// Setting random position for enemies off the screen above
			Enemies[ index ].X = 30 + rand() & (screen_width - 60);	
			Enemies[ index ].Y = 0 - rand() % screen_width;
		}

	// Startup
	//play_sound( SoundPCBootup );
	play_sound_in_channel( SoundPCBootup, ChannelMusic );
	sleep(180);
	stop_all_channels();//( SoundPCBootup );

	// Begin the Bezos
	play_sound_in_channel( MusicBezos, ChannelMusic );

	//-----------------------------------------------
	// Game Loop
	//-----------------------------------------------

	while( true )
	{
		// Inputs and whatnots
		int WalkX, WalkY;
		gamepad_direction( &WalkX, &WalkY );
		
		// If the Jegg has not been cracked into yolk
		if( Jegg.Alive == true )
		{
			// Jegg Direction
			Jegg.X += PlayerSpeed * WalkX;
		}
		
		// Confindments
		Jegg.X = max( Jegg.X, Jegg.Width/2 );
		Jegg.X = min( Jegg.X, screen_width - Jegg.Width/2 );

		if( Enemies[ index ].Alive == true )
		{
			for( int index = 0; index < MaxEnemies; index++ )
			{
				// Moving alive enemies down
				Enemies[ index ].Y += EnemySpeed;
	
				// Remove enemies that reach the pan
				if( Enemies[ index ].Y > 325 )
				{
					// re-spawn enemy on top at random X and keep score
					Enemies[ index ].X = 30 + rand() % (screen_width - 60);
					Enemies[ index ].Y = 0 - rand() % screen_width;
					Points = Points + 1;
					play_sound( SoundScore );
				}	

				//-----------------------------------------------
				// Collisions
				//-----------------------------------------------

				if( Jegg.Alive && ObjectsOverlap( &Jegg, &Enemies[ index ] ) )
				{
					// Kill
					stop_channel( ChannelMusic );
					clear_screen( color_black );
					sleep(30);
					play_sound( SoundCracking );
					sleep(60);
					Jegg.Alive = false;
				}	
			}
		}

		//-----------------------------------------------
		// How to make an omlette (end if Jegg died)
		//-----------------------------------------------

		if( Jegg.Alive == false )
		{
			select_texture( TextureYOUDIED );
			select_region( RegionYOUDIED );
			draw_region_at( 0, 0 );
			itoa( Points, Statement, 10);
			print_at( 320, 300, Statement);
			play_sound( SoundYOUDIED );
			return;
		}
		
		//-----------------------------------------------
		// Drawing the game!!!!!!
		//-----------------------------------------------
		
		// Draw Background
		select_texture( TextureBackground );
		select_region( RegionBackground );
		draw_region_at( 0, 0 );

		// Draw alive game objects
		select_texture( TextureGameObjects );
		
		if( Jegg.Alive == true )
		{		
			if( WalkX > 0 ) {
				Jimage = RegionRight;
			}
			else if( WalkX < 0 ) {
				Jimage = RegionLeft;
			}
			else if( WalkY > 0 ) {
				Jimage = RegionFace;
			}
			else if( WalkY < 0 ) {
				Jimage = RegionSkull;
			}

			// Check if Jegg.X active
			if( WalkX == 0 )
			{
				Jimage = RegionFace;
			}

			// Region Stuff
			select_region( Jimage );
            draw_region_at( Jegg.X, Jegg.Y );
		}

		if( Enemies[ index ].Alive == true )
		{ 	
			select_region( RegionEnemyWhisk );
			draw_region_at( Enemies[ index ].X, Enemies[ index ].Y );
		}

		for( int index = 0; index < MaxEnemies; index++ )
		{
			if( !Enemies[ index ].Alive == true )
				continue;

			select_region( RegionEnemyWhisk );
			draw_region_at( Enemies[ index ].X, Enemies[ index ].Y );
		}

		// Score Printer
		itoa( Points, Statement, 10);
		print_at( 320, 20, Statement);

		//-----------------------------------------------
		// End
		//-----------------------------------------------

		end_frame();
	}
}
