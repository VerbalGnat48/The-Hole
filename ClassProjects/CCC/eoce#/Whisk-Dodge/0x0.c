#include "video.h"
#include "input.h"
#include "time.h"
#include "math.h"
#include "misc.h"
#include "string.h"
#include "audio.h"

//-----------------------------------------------
// Definitions
//-----------------------------------------------

#define TextureBackground	0
#define TextureGameObjects	1
#define TextureYOUDIED		2
#define TextureSMTXTBG		3
#define TextureStructBG		4

#define RegionBackground	0

#define RegionYOUDIED		0

#define RegionSMTXTBG		0
#define RegionStructBG		1

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

	// SMTXTBG Texture
	select_texture( TextureSMTXTBG );
	select_region( RegionSMTXTBG );
	define_region_topleft( 0,0,  150,20 );

	// StructBG Texture
	select_texture( TextureStructBG );
	select_region( RegionStructBG );
	define_region_topleft( 0,0,  320,120 );
	
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
	int death = 0;
	int debug = 0;
	int sound = 0;
	int move = 0;
	int[30] Xatement;
	int[30] Yatement;

	int bean = 0;
	int[30] Beanment;

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
	// play_sound( SoundPCBootup );
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
		clear_screen( color_black );

		// Inputs and whatnots
		int WalkX, WalkY;
		gamepad_direction( &WalkX, &WalkY );
		
		// If the Jegg has not been cracked into yolk
		if( Jegg.Alive == true )
		{
			// Jegg Direction
			Jegg.X += PlayerSpeed * WalkX;
		}
		
		//-----------------------------------------------
		// Buttons
		//-----------------------------------------------

		//Death Toggle Button
		if( gamepad_button_a() == 1 ) { //If X button is pressed odd times then turn off collsions, if pressed even times turn back on
			death = death + 1;
			if( death > 1 ) {
				death = 0;
			}
		}

		//Debug Toggle Button
		if( gamepad_button_start() == 1 ) {
			debug = debug + 1;
			if( debug > 1 ) {
				debug = 0;
			}
			sound = 0;					//Turns off sound screen if debug is active
			move = 0;					//Tuurns off move screen if debug is active
		}

		//Sound info Toggle Button
		if( gamepad_button_x() == 1 ) {
			sound = sound + 1;
			if( sound > 1 ) {
				sound = 0;
			}
			debug = 0;					//Turns off debug screen if sound is active
			move = 0;                   //Tuurns off move screen if debug is active
		}

		//Movement info Toggle Button
		if( gamepad_button_r() == 1 ) {
			move = move + 1;
			if( move > 1 ) {
				move = 0;
			}
			debug = 0;                  //Turns off debug screen if sound is active
			sound = 0;                  //Turns off sound screen if debug is active
		}

		//-----------------------------------------------
		// Enemy Movement
		//-----------------------------------------------

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
					if( death != 1 ) {				//Points do not go up if no collision is on
						Points = Points + 1;
					}
					play_sound( SoundScore );
				}	

				//-----------------------------------------------
				// Collisions
				//-----------------------------------------------

				if ( death != 1 ) {
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

		//Score Printer
		if( death != 1 ) {
			itoa( Points, Statement, 10);
			print_at( 320, 20, Statement);
		}
	
		//Coliision Printer
		select_texture( TextureSMTXTBG );
		select_region( RegionSMTXTBG );
		draw_region_at( 490, 0 );
		if( death == 1 ) {
			print_at( 500, 0, "Collision Off");
		}
		if( death == 0 ) {
			print_at( 500, 0, "Collision On");
		}
		print_at( 25, 340, "Press X to toggle collsions and Enter to toggle info screen");

		//Debug Printer
		if( debug == 1 ) {
			select_texture( TextureStructBG );
			select_region( RegionStructBG );
			draw_region_at( 0, 0 );
            print_at( 0, 0, "Press S for sound info");
			print_at( 0, 20, "Press W for movment info");
		}

		//Sound info Printer
		if( sound == 1 ) {
			select_texture( TextureStructBG );
			select_region( RegionStructBG );
			draw_region_at( 0, 0 );
			draw_region_at( 0, 120 );
			draw_region_at( 0, 240 );
			print_at( 0, 0, "#define ""audio.h""" );
			print_at( 0, 20, "#define MusicBezos	0");
			print_at( 0, 40, "#define MusicScore	1");

			print_at( 0, 80, "//Below plays sound on repeat");
			print_at( 0, 100, "play_sound_in_channel\n( MusicBezos, ChannelMusic );");

			print_at( 0, 160, "//Below plays the score sound\nevery time an enemy ""dies""");
			print_at( 0, 200, "if( Enemy.Y > 325 ) {\n\t\tPoints = Point + 1;\n\t\tplay_sound( Score );\n}");
		}

		//Movement info Printer
		itoa( Jegg.X, Xatement, 10);
		itoa( Jegg.Y, Yatement, 10);
		if( move == 1 ) {
			select_texture( TextureStructBG );
			select_region( RegionStructBG );
			draw_region_at( 0, 0 );
			draw_region_at( 0, 120 );
			draw_region_at( 0, 240 );
			print_at( 0, 0, "//Below shows gamepad info");
			print_at( 0, 20, "select_gamepad( 0 );");
			print_at( 0, 40, "int WalkX;");
			print_at( 0, 60, "gamepad_direction( &WalkX );");

			print_at( 0, 100, "//Below shows how sprite moves");
			print_at( 0, 120, "if( WalkX > 0 ) {\n\tSptiteimage = Sprite Right Side\n}");
			print_at( 0, 180, "if( WalkX < 0 ) {\n\tSpriteimage = Sprite Left Side\n}");
			print_at( 0, 240, "if( WalkX == 0 ) {\n\tSpriteimage = Sprite Face\n}");
			print_at( 0, 300, "select_region( Sprite );\ndraw_region_at(");
			print_at( 160, 320, Xatement);
			print_at( 190, 320, ",");
			print_at( 210, 320, Yatement);
			print_at( 240, 320, ");");
		}

		//-----------------------------------------------
		// End
		//-----------------------------------------------

		end_frame();
	}
}
