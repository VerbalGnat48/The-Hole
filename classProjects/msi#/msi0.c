//-----------------------------------------------------
// Libraries
//-----------------------------------------------------
#include "video.h"
#include "audio.h"
#include "input.h"
#include "time.h"
#include "math.h"
#include "misc.h"
#include "string.h"

//-----------------------------------------------------
// Definitions
//-----------------------------------------------------
// Define Textures
#define TextureGameObjects		0
#define TextureStart			1
#define TextureDoomBG			2
#define TextureGameOver			3

// Define Regions
#define RegionGameObjects		0
#define RegionStart				0
#define RegionDoomBG			0
#define RegionGameOver			0

//GameObjects Define
#define RegionStand				1
#define RegionRun1				2	//Body1, Legs1
#define RegionRun2				3	//Body1, Legs2
#define RegionRun3				4	//Body2, Legs2
#define RegionShoot1			5
#define RegionShoot2			6
#define RegionLaser1			7
#define RegionLaser2			8
#define RegionLife1				9	//Green
#define RegionLife2				10	//Orange
#define RegionLife3				11	//Red
#define RegionEnemy1			12	//Skull
#define RegionEnemy2			13	//Meatball
#define RegionEnemy3			14	//Red
#define RegionEnemy4			15	//Goat
#define RegionFireball			16
#define Region3WB1				17	//Full
#define Region3WB2				18	//Slightly Damaged
#define Region3WB3				19	//Damaged
#define Region3WB4				20	//Very Damaged
#define Region4WB1				21	//Full
#define Region4WB2				22	//Slightly Damaged
#define Region4WB3				23	//Damaged
#define Region4WB4				24	//Very Damaged
#define RegionLives				25
#define RegionScore				26
#define RegionPressX			27
#define RegionWin				28
#define RegionLose				29


//Music
#define MusicDoom				0
#define MusicACNH				1

//Sound
#define SoundShotgun			2
#define SoundHurt				3
#define SoundDead				4
#define SoundFireball			5
#define SoundDemonDeath			6
#define SoundShieldDamage		7
#define SoundShieldDeath		8

#define ChannelMusic			0

#define PlayerSpeed				2
#define EnemySpeed				1

//-----------------------------------------------------
// Game Object Stuff
//-----------------------------------------------------

struct GameObject
{
	bool Alive;
	int RID;			//Region Number
	int X, Y;			//Objects Center
	int Width, Height;	//Hitbox
	int Scale;
	int Shots;			//Player Shots
	int Health;
	int Points;			//How many points each enemy gives
	int Speed;
};

bool ObjectsOverlap( GameObject* Object1, GameObject* Object2 )
{
	//Non-overlap on X
	if( (Object1->X - Object1->Width/2) >= (Object2->X + Object2->Width/2) )
		return false;

	if( (Object1->X + Object1->Width/2) <= (Object2->X - Object2->Width/2) )
		return false;

	//Non-overlap on Y
	if( (Object1->Y - Object1->Height/2) >= (Object2->Y + Object2->Height/2) )
		return false;

	if( (Object1->Y + Object1->Height/2) <= (Object2->Y - Object2->Height/2) )
		return false;

	//Overlap
	return true;
}

//-----------------------------------------------------
// Main
//-----------------------------------------------------

void main( void )
{
	//-----------------------------------------------------
	// Defining Textures
	//-----------------------------------------------------

	//Start
	select_texture( TextureStart );
	select_region( RegionStart );
	define_region_topleft( 0,0, 639,359 );

	//DoomBG
	select_texture( TextureDoomBG );
	select_region( RegionDoomBG );
	define_region_topleft( 0,0, 639,359 );

	//GameOver
	select_texture( TextureGameOver );
	select_region( RegionGameOver );
	define_region_topleft( 0,0, 639,359 );

	//Running Stances
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionRun1, 32,32, 47,63, 40,48, 3,1, 0 );

	//Shooting Stances
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionShoot1, 96,32, 111,63, 102,48, 2,1, 0 );

	//Laser Shots
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionLaser1, 144,48, 159,63, 152,56, 2,1, 0 );

	//Lives
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionLife1, 192,48, 207,63, 200,56, 3,1, 0 );

	//Demons
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionEnemy1, 0,80, 15,95, 8,88, 4,1, 0 );

	//Fireball
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionFireball, 80,80, 95,95, 88,88, 1,1, 0 );

	//3 Wide Barriers
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( Region3WB1, 0,112, 47,127, 24,122, 1,4, 0 );

	//4 Wide Barriers
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( Region4WB1, 64,112, 127,127, 96,122, 1,4, 0 );

	//Lives
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionLives, 0,190, 47,207, 24,200, 1,1, 0 );

	//Score
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionScore, 0,208, 63,223, 32,216, 1,1, 0 );

	//Press_X
	select_texture( TextureGameObjects );
	select_region( RegionGameObjects );
	define_region_matrix( RegionPressX, 0,224, 223,239, 112,232, 1,1, 0 );

	//Win
	select_texture( TextureGameObjects );
	select_region( RegionWin );
	define_region_matrix( RegionWin, 0,240, 95,255, 48,248, 1,1, 0 );

	//Lose
	select_texture( TextureGameObjects );
	select_region( RegionLose );
	define_region_matrix( RegionLose, 0,256, 111,271, 56,264, 1,1, 0 );

	//-----------------------------------------------------
	// Initializations
	//-----------------------------------------------------

	select_gamepad( 0 );

	//Random Number Generator
	srand( get_time() );

	int Score		= 0;
	int[30] Statement;
	int index		= 0;
	int jndex		= 0;
	int StartFlag	= 0;
	int MoveFlag	= 0;
	int Value		= 0;
	int Value2		= 0;
	int RanVal		= 0;
	int ButtonPress;
	int Blaster_Offset;

	int Counter			= 0;
	int DemonsAlive		= 40;
	int FireballMod		= 100;

	int RIDTimer		= 0;
	int RIDTimerPlayer	= 0;
	int DoomTimer		= 0;

	int MaxEnemy 		= 40;	//7 enemies for 4 rows
	int MaxFire			= 20;
	int MaxShield		= 3;
	int MaxLives		= 3;
	int MinLives		= 1;


	//-----------------------------------------------------
	// Player Intitializations
	//-----------------------------------------------------

	//Player
	GameObject Player;
	Player.Alive	= false;
	Player.Width	= 16 * 2;
	Player.Height	= 32 * 2;
	Player.Health	= 4;
	Player.X		= 320;
	Player.Y		= 320;
	Player.RID		= 2;		//Standing Sprite
	Player.Scale	= 2;
	Player.Shots	= 0;

	//Player Shots
	GameObject *Blaster = NULL;
	Blaster = ( GameObject * )malloc(sizeof(GameObject) * 20 );

	//Blaster Basics Attributes
	for( index = 0; index < 20; index++ ) {
		(Blaster+index) -> Alive	= false;
	}	

	//-----------------------------------------------------
	// Enemy Intitializations
	//-----------------------------------------------------

	//Enemies
	GameObject *Demon = NULL;
	Demon = ( GameObject * )malloc(sizeof(GameObject) * MaxEnemy );

	//Enemy Basics Attributes
	for( index = 0; index < MaxEnemy; index++ ) {
		(Demon+index) -> Alive	= false;
		(Demon+index) -> Width	= 16 * 2;
		(Demon+index) -> Height	= 16 * 2;
	}	

	//Specific Enemy Attributes
	//Enemy Line 1
	Value = 70;
	for( index = MaxEnemy/4 * 0; index < MaxEnemy/4; index++ ) {
		(Demon+index) -> Alive	= true;
		(Demon+index) -> Points	= 250;
		(Demon+index) -> RID	= 15;				//RegionEnemy4
		(Demon+index) -> X		= Value;
		(Demon+index) -> Y		= 40;
		(Demon+index) -> Speed	= 4;
		Value = Value + 40;
	}

	//Enemy Line 2
	Value = 140;
	for( index = MaxEnemy/4; index < MaxEnemy/4 * 2; index++ ) {
		(Demon+index) -> Alive	= true;
		(Demon+index) -> Points	= 200;
		(Demon+index) -> RID	= 14;				//RegionEnemy3
		(Demon+index) -> X		= Value;
		(Demon+index) -> Y		= 80;
		(Demon+index) -> Speed	= -4;
		Value = Value + 40;
	}

	//Enemy Line 3
	Value = 210;
	for( index = MaxEnemy/4 * 2; index < MaxEnemy/4 * 3; index++ ) {
		(Demon+index) -> Alive	= true;
		(Demon+index) -> Points	= 150;
		(Demon+index) -> RID	= 13;				//RegionEnemy2
		(Demon+index) -> X		= Value;
		(Demon+index) -> Y		= 120;
		(Demon+index) -> Speed	= 4;
		Value = Value + 40;
	}

	//Enemy Line 1
	Value = 260;
	for( index = MaxEnemy/4 * 3; index < MaxEnemy/4 * 4; index++ ) {
		(Demon+index) -> Alive	= true;
		(Demon+index) -> Points	= 100;
		(Demon+index) -> RID	= 12;				//RegionEnemy1
		(Demon+index) -> X		= Value;
		(Demon+index) -> Y		= 160;
		(Demon+index) -> Speed	= -4;
		Value = Value + 40;
	}

	//Fireball
	GameObject *Fireball = NULL;
	Fireball = ( GameObject * )malloc(sizeof(GameObject) * MaxFire );

	//Fireball Basics Attributes
	for( index = 0; index < MaxEnemy; index++ ) {
		(Fireball+index) -> Alive	= false;
	}	

	//-----------------------------------------------------
	// Shield Intitializations
	//-----------------------------------------------------

	//Shields
	GameObject *Shield = NULL;
	Shield = ( GameObject * )malloc(sizeof(GameObject) * MaxShield );

	//Shield Basics Attributes
	Value = 120;
	for( index = 0; index < MaxShield; index++ ) {
		(Shield+index) -> Alive		= true;
		(Shield+index) -> Width		= 48 * 2;
		(Shield+index) -> Height	= 16 * 2;
		(Shield+index) -> X			= Value;
		(Shield+index) -> Y			= 260;
		(Shield+index) -> RID		= 17;			//3WB1
		(Shield+index) -> Health	= 8;
		Value = Value + 200;
	}

	//-----------------------------------------------------
	// Lives Intitializations
	//-----------------------------------------------------

	//Lives
	GameObject *Lives = NULL;
	Lives = ( GameObject * )malloc(sizeof(GameObject) * 3 );

	//Shield Basics Attributes
	Value	= 120;
	Value2	= 11;
	for( index = MaxLives; index > 0; index-- ) {
		(Lives+index) -> Alive		= true;
		(Lives+index) -> X			= Value;
		(Lives+index) -> Y			= 340;
		(Lives+index) -> RID		= Value2;
		Value = Value + 25;
		Value2 = Value2 - 1;
	}


	//-----------------------------------------------------
	// Game Loop
	//-----------------------------------------------------

	//Start Music
	select_sound( MusicACNH );
	set_sound_loop( true );
	play_sound_in_channel( MusicACNH, ChannelMusic );


	while( true )
	{
		clear_screen( color_black );

		//Inputs
		int WalkX, WalkY;
		gamepad_direction( &WalkX, &WalkY );

		//Player Confinements
		if( MoveFlag == 0 ) {
			Player.X = max( Player.X, Player.Width/2 );
			Player.X = min( Player.X, screen_width - Player.Width/2 );
			Player.X += PlayerSpeed * WalkX;
		}

		//-----------------------------------------------------
		// Start Screen
		//-----------------------------------------------------
		if( StartFlag == 0 ) {
			//Get Button Press Value
			ButtonPress = gamepad_button_start();

			//Draw Start Background
			select_texture( TextureStart );
			select_region( RegionStart );
			draw_region_at( 0,0 );

			//If button has been pressed then start game
			if( ButtonPress > 0 ) {
				StartFlag = 1;

				//Play Button Press Sound
				select_sound( SoundShotgun );
				play_sound( SoundShotgun );

				//Cancel Start Music
				stop_channel( ChannelMusic );

				//Draw PressX
				clear_screen( color_black );
				select_texture( TextureGameObjects );
				select_region( RegionPressX );
				set_drawing_scale( 2, 2 );
				draw_region_zoomed_at( 320, 180 );
				set_drawing_scale( 1, 1 );

				sleep( 120 );

				Player.Alive = true;

				set_channel_volume( 0.5 );
			}
		}

		//-----------------------------------------------------
		// Main Game
		//-----------------------------------------------------
		else if( StartFlag == 1 ) {
			//Draw Doom Background
			select_texture( TextureDoomBG );
			select_region( RegionDoomBG );
			draw_region_at( 0,0 );

			//Start Music
			select_sound( MusicDoom );
			set_sound_loop( true );
			if( DoomTimer == 0 ) {
				play_sound_in_channel( MusicDoom, ChannelMusic );
				DoomTimer = 1;
			}

			//Player Direction/RID/Scale
			//Right
			if( WalkX > 0 ) {
				Player.Scale = 2;
				Blaster_Offset = 16;
			}
			//Left
			else if( WalkX < 0 ) {
				Player.Scale = -2;
				Blaster_Offset = -16;
			}

			//-----------------------------------------------------
			// Player Run Animation
			//-----------------------------------------------------
			if( gamepad_right() > 0 || gamepad_left() > 0 ) {
				if( Player.RID == 3 || Player.RID == 4 || Player.RID == 2 ) {
					RIDTimerPlayer = RIDTimerPlayer + 1;
				}
				if( Player.RID == 4 && RIDTimerPlayer == 40 ) {
					Player.RID = 2;
				}
				if( Player.RID == 3 && RIDTimerPlayer == 20 ) {
					Player.RID = 4;
				}
				if( Player.RID == 2 && RIDTimerPlayer == 60 ) {
					Player.RID = 3;
					RIDTimerPlayer = 0;
					RIDTimerPlayer = RIDTimerPlayer + 1;
				}
			}

			//-----------------------------------------------------
			// Player Shooting Animation
			//-----------------------------------------------------
			if( gamepad_button_a() > 0 && RIDTimer == 0 ) {
				//Change RID to Shoot Sprite 1
				Player.RID	= 5;												//PlayerShoot1
				(Blaster+Player.Shots) -> Alive   	= true;						//Make Shot active
				( Blaster+Player.Shots ) -> X 		= Player.X + Blaster_Offset;//Make Blaster Shot appear at where the players gun is
				( Blaster+Player.Shots ) -> Y 		= Player.Y - 28;			//Offset to appear at to of player
				( Blaster+Player.Shots ) -> Scale	= Player.Scale;				//Set scale for shot
				Player.Shots = Player.Shots + 1;								//Get next shot primed
				if( Player.Shots > 20 ) {										//If Player.Shot >20 then reset
					Player.Shots = 0;
				}
				MoveFlag = 1;

				//Play Shotgun
				select_sound( SoundShotgun );
				play_sound( SoundShotgun );
			}
			//Change RID to Run
			if( Player.RID == 5 || Player.RID == 6 ) {
				RIDTimer = RIDTimer + 1;
			}
			//Stop Shooting Animation
			if( Player.RID == 6 && RIDTimer == 40 ) {
				Player.RID	= 2;
				RIDTimer	= 0;
				MoveFlag	= 0;
			}
			//Change RID to Shoot Sprite 2
			if( Player.RID == 5 && RIDTimer == 20 ) {
				Player.RID	= 6;					//PlayerShoot2
			}

			//-----------------------------------------------------
			// Moving Player Shot
			//-----------------------------------------------------
			for( index = 0; index < 20; index++ ) {
				if( ( Blaster+index ) -> Alive	== true ) {
					if( get_frame_counter() % 3 == 0 ) {
						( Blaster+index ) -> Y	= ( Blaster+index ) -> Y - 5;
					}
					if( ( Blaster+index ) -> Y < 0 ) {
						( Blaster+index ) -> Alive  = false;
					}
				}
			}

			//-----------------------------------------------------
			// Moving Demons
			//-----------------------------------------------------
			for( index= 0; index < MaxEnemy; index++ ) {
				//If Demon hits right wall then go left
				if( ( Demon+index ) -> X + 16 > 640 ) {
					( Demon+index ) -> Speed = -4;
					//Go down a level
					( Demon+index ) -> Y = ( Demon+index ) -> Y + 5;
				}
				//If Demon hits left wall then go right
				if( ( Demon+index ) -> X - 16 < 0 ) {
					( Demon+index ) -> Speed = 4;
					//Go down a level
					( Demon+index ) -> Y = ( Demon+index ) -> Y + 5;
				}
				//If Demon alive then move it
				if( ( Demon+index ) -> Alive  == true && get_frame_counter() % 3 == 0 ) {
					( Demon+index ) -> X = ( Demon+index ) -> X + ( Demon+index ) -> Speed;

					//Keep Fireball spawning as a high value
					if( DemonsAlive < 30 ) {
						FireballMod == 75;
					}
					if( DemonsAlive < 20 ) {
						FireballMod == 50;
					}
					if( DemonsAlive < 10 ) {
						FireballMod == 25;
					}
					RanVal = rand() % FireballMod;
					if( RanVal == 5 ) {
						( Fireball+Counter ) -> Alive = true;
						( Fireball+Counter ) -> X = ( Demon+index ) -> X;
						( Fireball+Counter ) -> Y = ( Demon+index ) -> Y;
						Counter = Counter + 1;
						if( Counter == MaxFire ) {
							Counter = 0;
						}
					}
				}
			}

			//-----------------------------------------------------
			// Moving Fireballs
			//-----------------------------------------------------
			for( index= 0; index < MaxEnemy; index++ ) {
				if( ( Fireball+index ) -> Alive == true ) {
					if( get_frame_counter() % 3 == 0 ) {
						( Fireball+index ) -> Y	= ( Fireball+index ) -> Y + 3;
					}
					if( ( Fireball+index ) -> Y > 360 ) {
						( Fireball+index ) -> Alive  = false;
					}
				}
			}


			//-----------------------------------------------------
			// Collisions
			//-----------------------------------------------------
			//Blaster X Demon
			for( index = 0; index < MaxEnemy; index++ ) {
				for( jndex = 0; jndex < 20; jndex++ ) {
					//Check if Blaster and Demon are Alive and if they Overlap
					if( ( Blaster+jndex ) -> Alive  == true && ( Demon+index ) -> Alive  == true && ObjectsOverlap( ( Blaster+jndex ), ( Demon+index ) ) ) {
						//If so then death for both
						( Blaster+jndex ) -> Alive	= false;
						( Demon+index ) -> Alive	= false;
						DemonsAlive = DemonsAlive - 1;

						//Play Demon Death Sound
						select_sound( SoundDemonDeath );
						play_sound( SoundDemonDeath );

						//Add Score
						Score = Score + ( Demon+index ) -> Points;
					}
				}
			}

			//Fireball X Player
			for( index = 0; index < MaxFire; index++ ) {
				//Check if Fireball and Player are alive and if they Overlap
				if( Player.Alive && ( Fireball+index ) -> Alive == true && ObjectsOverlap( &Player, ( Fireball+index ) ) ) {
					//If so then death for fireball and damage for Player
					( Fireball+index ) -> Alive	= false;
					Player.Health = Player.Health - 1;
					MinLives = MinLives + 1;

					//Play Hurt Sound
					select_sound( SoundHurt );
					play_sound( SoundHurt );
				}
			}

			//Demon X Player
			for( index = 0; index < MaxEnemy; index++ ) {
				//Check if Demon and Player are alive and if they Overlap
				if( Player.Alive && ObjectsOverlap( &Player, ( Demon+index ) ) ) {
					//If so then death for fireball and damage for Player
					( Demon+index ) -> Alive	= false;
					Player.Alive				= false;
				}
			}

			//Fireball X Shield
			for( index = 0; index < MaxShield; index++ ) {
				for( jndex = 0; jndex < MaxFire; jndex++ ) {
					//Check if Sheild and Fireball are alive and if they overlap
					if( (Shield+index ) -> Alive && ( Fireball+jndex ) -> Alive && ObjectsOverlap( ( Shield+index ), ( Fireball+jndex ) ) ) {
						//If so then death for Fireball and damage for Shield
						( Fireball+jndex ) -> Alive	= false;
						( Shield+index ) -> Health	= ( Shield+index ) -> Health - 1;

						//Damage Shield Appearence very 2 Damage
						if( ( Shield+index ) -> Health % 2 == 0 ) {
							( Shield+index ) -> RID		= ( Shield+index ) -> RID + 1;
						}

						//Play Shield Damage
						select_sound( SoundShieldDamage );
						play_sound( SoundShieldDamage );

						//Check Shiled Health
						if( ( Shield+index ) -> Health == 0 ) {
							( Shield+index ) -> Alive = false;

							//Play Shield Death
							select_sound( SoundShieldDeath );
							play_sound( SoundShieldDeath );
						}
					}
				}
			}

			//Blaster X Shield
			for( index = 0; index < MaxShield; index++ ) {
				for( jndex = 0; jndex < 20; jndex++ ) {
					//Check if Sheild and Fireball are alive and if they overlap
					if( (Shield+index ) -> Alive && ( Blaster+jndex ) -> Alive && ObjectsOverlap( ( Shield+index ), ( Blaster+jndex ) ) ) {
						//If so then death for Blaster
						( Blaster+jndex ) -> Alive	= false;
					}
				}
			}

			//Player X Death
			//-----------------------------------------------------
			// Game Over
			//-----------------------------------------------------
			if( Player.Health == 0 || Player.Alive == false ) {
				//Play Death Sound
				stop_all_channels();
				select_sound( SoundDead );
				play_sound( SoundDead );

				clear_screen( color_black );

				select_texture( TextureGameObjects );
				set_drawing_scale( 2, 2 );

				//Draw Lose
				select_region( RegionLose );
				draw_region_zoomed_at( 320, 100 );

				//Draw Score
				select_region( RegionScore );
				draw_region_zoomed_at( 320, 175 );

				set_drawing_scale( 1, 1 );
				itoa( Score, Statement, 10 );
				print_at( 300, 200, Statement);
				
				exit();
			}

			//Player X Winning
			//-----------------------------------------------------
			// Winning
			//-----------------------------------------------------
			if( DemonsAlive == 0 ) {
				//Stop Music/Clear Screen
				stop_all_channels();
				clear_screen( color_black );

				//Start Music
				set_channel_volume( 1 );
				select_sound( MusicACNH );
				set_sound_loop( true );
				play_sound_in_channel( MusicACNH, ChannelMusic );

				select_texture( TextureGameObjects );
				set_drawing_scale( 2, 2 );

				//Draw Winning
				select_region( RegionWin );
				draw_region_zoomed_at( 320, 100 );

				//Draw Score
				select_region( RegionScore );
				draw_region_zoomed_at( 320, 175 );

				set_drawing_scale( 1, 1 );
				itoa( Score, Statement, 10 );
				print_at( 300, 200, Statement);
				
				exit();
			}



			//-----------------------------------------------------
			// Drawing Sprites
			//-----------------------------------------------------

			//Draw Player
			select_texture( TextureGameObjects );
			select_region( Player.RID );
			set_drawing_scale( Player.Scale, 2 );
			draw_region_zoomed_at( Player.X, Player.Y );
			set_drawing_scale( 1, 1 );

			//Draw Player Blaster Shots
			for( index = 0; index < 20; index++ ) {
				if( ( Blaster+index ) -> Alive == true ) {
					select_region( RegionLaser1 );
					set_drawing_scale( ( Blaster+index ) -> Scale, 2 );
					draw_region_zoomed_at( (Blaster+index) -> X, (Blaster+index) -> Y );
					set_drawing_scale( 1, 1 );
				}
			}

			//Draw Demons
			for( index = 0; index < MaxEnemy; index++ ) {
				if( ( Demon+index ) -> Alive == true ) {
					select_region( (Demon+index) -> RID );
					set_drawing_scale( 2, 2 );
					draw_region_zoomed_at( (Demon+index) -> X, (Demon+index) -> Y );
					set_drawing_scale( 1, 1 );
				}
			}

			//Draw Fireballs
			for( index = 0; index < MaxFire; index++ ) {
				if( ( Fireball+index ) -> Alive == true ) {
					select_region( RegionFireball );
					set_drawing_scale( 2, 2 );
					draw_region_zoomed_at( (Fireball+index) -> X, (Fireball+index) -> Y );
					set_drawing_scale( 1, 1 );
				}
			}

			//Draw Shields
			for( index = 0; index < MaxShield; index++ ) {
				if( ( Shield+index ) -> Alive == true ) {
					select_region( (Shield+index) -> RID );
					set_drawing_scale( 2, 2 );
					draw_region_zoomed_at( (Shield+index) -> X, (Shield+index) -> Y );
					set_drawing_scale( 1, 1 );
				}
			}

			//Draw Lives
			select_region( RegionLives );
			set_drawing_scale( 2, 2 );
			draw_region_zoomed_at( 50, 340 );
			set_drawing_scale( 1, 1 );

			for( index = MinLives; index <= MaxLives; index++ ) {
				if( (Lives+index) -> Alive == true ) {
					select_region( (Lives+index) -> RID );
					set_drawing_scale( 2, 2 );
					draw_region_zoomed_at( (Lives+index) -> X, (Lives+index) -> Y );
					set_drawing_scale( 1, 1 );
				}
			}

			//Draw Score
			select_region( RegionScore );
			set_drawing_scale( 2, 2 );
			draw_region_zoomed_at( 60, 20 );
			set_drawing_scale( 1, 1 );

			itoa( Score, Statement, 10 );
			print_at( 130, 10, Statement);
						
		}

		end_frame();
	}
}














