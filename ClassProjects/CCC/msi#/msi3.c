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

#define PLAYER					0
#define SHIELD					1
#define LASER					2
#define FIRE					3 
#define LIVES					4
#define DEMON					5
#define DEMON1					6
#define DEMON2					7
#define DEMON3					8
#define DEMON4					9

//-----------------------------------------------------
// Game Object Stuff
//-----------------------------------------------------

struct GameObject
{
	int RID;			//Region Number
	int X, Y;			//Objects Center
	int Width, Height;	//Hitbox
	int Scale;
	int Shots;			//Player Shots
	int Health;
	int Points;			//How many points each enemy gives
	int Speed;
	int YSpeed;
	int Count;
	int Type;
	int Subtype;
	int Step;
	int Rangle;			//RID Angle
	int Mangle;			//Movement Angle
	int LoopCount;
	int WallCount;
	int Timer;
	GameObject *next;
	GameObject *prev;
};

struct List
{
	GameObject *start;
	GameObject *end;
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

GameObject *mknode ( int object, int X, int Y )
{
	GameObject *Node = NULL;
	Node = malloc(sizeof(GameObject));
	if( Node != NULL ) {
		Node -> X	= X;
		Node -> Y	= Y;
		if( object == PLAYER ) {
			Node -> Width	= 32;
			Node -> Height	= 64;
			Node -> Health	= 4;
			Node -> RID		= 2;
			Node -> Scale	= 2;
			Node -> Type	= PLAYER;
		}
		else if( object == SHIELD ) {
			Node -> Width	= 80;
			Node -> Height	= 32;
			Node -> Health	= 24;
			Node -> RID		= 17;
			Node -> Scale	= 2;
			Node -> Type	= SHIELD;
		}
		else if( object == LASER ) {
			Node -> Width	= 10;
			Node -> Height	= 32;
			Node -> RID		= 7;
			Node -> Scale	= 2;
			Node -> Type	= LASER;
		}
		else if( object == FIRE ) {
			Node -> Width	= 14;
			Node -> Height	= 24;
			Node -> RID		= 16;
			Node -> Scale	= 2;
			Node -> Type	= FIRE;
		}
		else if( object == LIVES ) {
			Node -> RID		= 9;
			Node -> Scale	= 2;
			Node -> Type	= LIVES;
		}
		else
		{
			Node -> Width 	= 32;
			Node -> Height 	= 32;
			Node -> Health	= 4;
			Node -> Scale	= 2;
			Node -> Type	= DEMON;
			Node -> Step	= 0;
			if ( object == DEMON1 ) {
				Node -> RID	= 12;
				Node -> Speed	= 4;
				Node -> Points	= 100;
				Node -> Subtype	= 1;
			}
			else if( object == DEMON2 ) {
				Node -> RID	= 13;
				Node -> Speed	= 4;
				Node -> YSpeed	= 2;
				Node -> Points	= 150;
				Node -> Subtype	= 2;
			}
			else if( object == DEMON3 ) {
				Node -> RID	= 14;
				Node -> Speed	= 4;
				Node -> Points	= 200;
				Node -> Subtype	= 3;
			}
			else if( object == DEMON4 ) {
				Node -> RID	= 15;
				Node -> Speed	= 4;
				Node -> Points	= 250;
				Node -> Subtype	= 4;
			}

		}
		Node -> next = NULL;
	}
	return Node;
}

List *mklist()
{
	List *mylist;
	mylist = malloc(sizeof(List));
	mylist -> start	= NULL;
	mylist -> end	= NULL;
	return mylist;
}

List *append( List* mylist, GameObject* object, GameObject* new_node )
{
	if( mylist -> start == NULL ) {	
		mylist -> start = new_node;
		mylist -> end = new_node;
	}
	else if( object == mylist -> end ) {
		mylist -> end -> next = new_node;
		mylist -> end = new_node;
		new_node -> prev = object;
	} else {
		new_node -> next = object -> next;
		object -> next = new_node;
		new_node -> prev = object;
	}
	return mylist;
}

List *insert( List* mylist, GameObject* object, GameObject* new_node )
{
	if( mylist -> start == NULL ) {
		mylist -> start = new_node;
		mylist -> end = new_node;
	}
	else if( object == mylist -> start ) {
		mylist -> start -> next = object;
		mylist -> start = new_node;
	} else {
		GameObject *tmp = NULL;
		tmp = mylist -> start;
		while( tmp != object ) {
			if( tmp -> next == object ) {
				tmp -> next = new_node;
				new_node -> next = object;
				object -> prev = new_node;
			}
			tmp = tmp -> next;
		}
	}
	return mylist;
}

List *obtain( List *mylist, GameObject** Forsaken_Node )
{
	GameObject *tmp = NULL;
	if( mylist != NULL ) {
		//Last Case Node
		if( (*Forsaken_Node) == mylist -> end ) {
			tmp = NULL;
			tmp = mylist -> start;
			while( tmp != NULL ) {
				if( tmp -> next == (*Forsaken_Node) ) {
					tmp -> next = NULL;
					mylist -> end = tmp;
					break;
				}
				tmp = tmp -> next;
			}	
		}
		//First Case Node
		else if( (*Forsaken_Node) == mylist -> start ) {
			mylist -> start = (*Forsaken_Node) -> next;
		//Middle Case Node
		} else {
			tmp = NULL;
			tmp = mylist -> start;
			while( tmp != NULL ) {
				if( tmp -> next == (*Forsaken_Node) ) {
					tmp -> next = tmp -> next -> next;
					(*Forsaken_Node) -> next = NULL;
					break;
				}
				tmp = tmp -> next;
			}	
		}
	}
	return mylist;
}

GameObject *rmnode( GameObject* Forsaken_Node )
{
	if( Forsaken_Node != NULL ) {
		Forsaken_Node -> next = NULL;
		free(Forsaken_Node);
		Forsaken_Node = NULL;
	}
	return Forsaken_Node;
}

List *clearlist( List* mylist )
{
	GameObject *tmp = NULL;
	tmp = mylist -> start;
	while( tmp != NULL ) {
		mylist = obtain( mylist, &tmp );
		rmnode( tmp );
		GameObject *tmp = NULL;
		tmp = mylist -> start;
	}
	return mylist;
}

List *rmlist( List* mylist )
{
	mylist = clearlist( mylist );
	free( mylist );
	return mylist;
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

	int X;
	int Y;
	int Score		= 0;
	int Angle		= 0;
	int[30] Statement;
	int index		= 0;
	int StartFlag	= 0;
	int MoveFlag	= 0;
	int ButtonPress;
	int Blaster_Offset;
	float rads;

	int LaserCounter	= 0;
	int DemonCounter	= 40;
	int Sub1Counter		= 0;
	int Sub4Counter		= 0;
	int FireMod			= 200;

	int RIDTimer		= 0;
	int DoomTimer		= 0;
	int DamageTimer		= 0;

	int temp			= 0;

	List *mylist = NULL;
	mylist = mklist();

	//-----------------------------------------------------
	// Game Initializations
	//-----------------------------------------------------

	//Start Music
	select_sound( MusicACNH );
	set_sound_loop( true );
	play_sound_in_channel( MusicACNH, ChannelMusic );

	srand( get_time() );

	//Make the Shit
	GameObject *Player = NULL;
	GameObject *Laser = NULL;
	GameObject *Shield = NULL;
	GameObject *Demon = NULL;
	GameObject *Lives = NULL;
	GameObject *Fire = NULL;
	GameObject *tmp = NULL;
	GameObject *kmp = NULL;
	GameObject *lmp	= NULL;

	//Make the Player
	Player = mknode( PLAYER, 360, 320 );
	mylist = append( mylist, mylist -> end, Player );

	//Make the Shields
	X = 120;
	for( index = 0; index < 3; index++ ) {
		Shield = mknode( SHIELD, X, 260 );
		mylist = append( mylist, mylist -> end, Shield );
		X = X + 200;
	}

	//Make the Lives
	X = 120;
	for( index = 0; index < 4; index++ ) {
		Lives = mknode( LIVES, X, 340 );
		mylist = append( mylist, mylist -> end, Lives );
		X = X + 25;
	}

	//Make the Demons
	//Demon 4
	for( index = 0; index < 10; index++ ) {
		Demon -> Mangle = ( 180 / 10 ) * ( index + 16 );
		float rads = ( Demon -> Mangle ) * pi/180;
		X = ( 100 * (cos(rads)) ) + 320;
		Y = ( 100 * (sin(rads)) ) + 160;
		Demon = mknode( DEMON4, X, Y );
		mylist = append( mylist, mylist -> end, Demon );
	}

	//Demon 3
	X = 140;
	Y = 80;
	temp = 0;
	for( index = 0; index < 10; index++ ) {
		Demon = mknode( DEMON3, X, Y );
		mylist = append( mylist, mylist -> end, Demon );
		X += 40;
		//Make A v formation with a 2 emeny bottom
		if( temp == 4 ) {
			Y += 0;
			Demon -> Speed = Demon -> Speed * (-1);
		}
		else if( temp > 4 ) {
			Y -= 20;
		} else {
			Y += 20;
			Demon -> Speed = Demon -> Speed * (-1);
		}
		temp += 1;
	}

	//Demon 2
	for( index = 0; index < 10; index++ ) {
		Demon = mknode( DEMON2, ( (rand() % 604) + 16 ), ( (rand() % 200) + 16 ) );
		mylist = append( mylist, mylist -> end, Demon );
		if( (rand() % 2 ) == 0 ) {
			Demon -> Speed = Demon -> Speed * (-1);
		}
	}

	//Demon 1
	for( index = 0; index < 10; index++ ) {
		Demon -> Mangle = ( 180 / 10 ) * ( index + 5 );
		rads = ( Demon -> Mangle ) * pi/180;
		X = ( 100 * (cos(rads)) ) + -10;
		Y = ( 100 * (sin(rads)) ) + 160;
		Demon = mknode( DEMON1, X, Y );
		mylist = append( mylist, mylist -> end, Demon );
		Demon -> Timer = 0;
	}

	//-----------------------------------------------------
	// Game Loop
	//-----------------------------------------------------

	while( true )
	{
		clear_screen( color_black );

		//Inputs/Movement
		int WalkX, WalkY;
		gamepad_direction( &WalkX, &WalkY );

		//Player Confinements
		if( MoveFlag == 0 ) {
			Player -> X = Player -> X + (PlayerSpeed * WalkX);
			if( Player -> X + Player -> Width/2 > 640 ) {
				Player -> X = 640 - Player -> Width/2;
			}
			if( Player -> X - Player -> Width/2 < 0 ) {
				Player -> X = 0 + Player -> Width/2;
			}
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

				set_channel_volume( 0.5 );

			}
		}

		//-----------------------------------------------------
		// Main Game
		//-----------------------------------------------------
		else if( StartFlag == 1 ) {
			//Draw Doom Background
			set_drawing_scale( 1, 1 );
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
				Player -> Scale = 2;
				Blaster_Offset = 16;
			}
			//Left
			else if( WalkX < 0 ) {
				Player -> Scale = -2;
				Blaster_Offset = -16;
			}
			//-----------------------------------------------------
			// Player Running Animation
			//-----------------------------------------------------
			if( gamepad_right() > 0 || gamepad_left() > 0 ) {
				if( Player -> RID == 2 || Player -> RID == 3 || Player -> RID == 4 ) {
					Player -> Timer += 1;
				}
				if( Player -> RID == 4 && Player -> Timer == 40 ) {
					Player -> RID = 2;
				}
				if( Player -> RID == 3 && Player -> Timer == 20 ) {
					Player -> RID = 4;
				}
				if( Player -> RID == 2 && Player -> Timer == 60 ) {
					Player -> RID = 3;
					Player -> Timer = 0;
					Player -> Timer += 1;
				}
			}

			//-----------------------------------------------------
			// Player Shooting Animation
			//-----------------------------------------------------
			if( gamepad_button_a() > 0 && RIDTimer == 0 ) {
				//Change RID to Shoot Sprite 1
				Player -> RID	= 5;
				Y = Player -> Y - 28;									//Set Laser Y shot
				X = Player -> X + Blaster_Offset;
				Laser = mknode( LASER, X , Y );							//Making the Laser
				mylist = append(mylist, mylist -> end, Laser );			//Add to the list

				MoveFlag = 1;											//Stop Player from moving
				LaserCounter += 1;

				//Play Sound
				select_sound( SoundShotgun );
				play_sound( SoundShotgun );
				
			}
			if( Player -> RID == 5 || Player -> RID == 6 ) {
				RIDTimer = RIDTimer + 1;
			}
			if( Player -> RID == 6 && RIDTimer == 40 ) {
				Player -> RID	= 2;
				RIDTimer		= 0;
				MoveFlag		= 0;
			}
			if( Player -> RID == 5 && RIDTimer == 20 ) {
				Player -> RID	= 6;
			}

			//-----------------------------------------------------
			// Make Fireballs
			//-----------------------------------------------------
			tmp = NULL;
			tmp = mylist -> start;
			while( tmp != NULL ) {
				if( tmp -> Type == DEMON ) {
					//Make Enemies fire only around Player (makes other shields not be useless)
					if( tmp -> X > Player -> X - 150 && tmp -> X < Player -> X + 150 ) {
						if( rand() % FireMod == 5 ) {
							Fire = mknode( FIRE, tmp -> X , tmp -> Y );				//Making the Fire
							mylist = append(mylist, mylist -> end, Fire );			//Add to the list
						}
					}
				}
				tmp = tmp -> next;
			}

			//-----------------------------------------------------
			// Moving Non-Player Objects
			//-----------------------------------------------------
			tmp = NULL;
			tmp = mylist -> start;
			DemonCounter = 0;
			Sub1Counter = 0;
			while( tmp != NULL ) {
				//Moving Lasers
				if( tmp -> Type == LASER ) {
					if( tmp -> Y < 0 ) {
						mylist = obtain( mylist, &tmp ) ;			//Get the node and move its position in the loop
						rmnode( tmp );								//Remove the node
						LaserCounter -= 1;
					}
					tmp -> Y = tmp -> Y - 2;						//Move Laser up
				}
				//Moving Demons
				if( tmp -> Type == DEMON ) {

					//If Demon 1 then do
					if( tmp -> Subtype == 1 && get_frame_counter() % 3 == 0 ) {
						Sub1Counter += 1;
						if( tmp -> Step == 0) {
							tmp -> Mangle -= tmp -> Speed;
							rads = tmp -> Mangle * pi/180;
							tmp -> X = ( 100 * (cos(rads)) ) + -10;
							tmp -> Y = ( 100 * (sin(rads)) ) + 160;
							if( tmp -> Mangle >= 0 && tmp -> Mangle <= tmp -> Speed ) {
								tmp -> Step += 1;										//Move to the Next Movement Step
								tmp -> Mangle = 90;										//Set Angle to bottom of next loop
							}
						}					
						else if( tmp -> Step == 1) {
							tmp -> Mangle -= tmp -> Speed;
							rads = tmp -> Mangle * pi/180;
							tmp -> X = ( 60 * (cos(rads)) ) + 90;
							tmp -> Y = ( 60 * (sin(rads)) ) + 100;
							if( tmp -> Mangle >= 0 && tmp -> Mangle <= tmp -> Speed ) {
								tmp -> Mangle = 360;									//Set it to 360 as ememies move counter clockwise
								tmp -> LoopCount += 1;									//Add 1 to LoopCount
							}
							if( tmp -> LoopCount == 4 ) {								//Once x amount of loops then go to next step
								tmp -> Step += 1;										//Move to the Next Movement Step
							}
						}
						else if( tmp -> Step == 2 ) {
							if( tmp -> X + 16 > 640 ) {									//If Demons hit right wall
								tmp -> Speed = tmp -> Speed * (-1);						//Go backwards
								tmp -> Y += 10;											//Move down a level
							}
							if( tmp -> X - 16 < 0 ) {									//If Demons hit left wall
								tmp -> Speed = tmp -> Speed * (-1);						//Go forwards
								tmp -> Y += 10;											//Move down a level
							}
							tmp -> X = tmp -> X + tmp -> Speed;
						}
					}
					//If Demon 2 then do
					else if( tmp -> Subtype == 2 && get_frame_counter() % 3 == 0 ) {
						if( tmp -> Y + 16 >= 250 ) {
							tmp -> YSpeed = tmp -> YSpeed * (-1);
						}
						else if( tmp -> Y - 16 <= 0 ) {
							tmp -> YSpeed = tmp -> YSpeed * (-1);
						}
						else if( tmp -> X + 16 >= 640 ) {
							tmp -> Speed = tmp -> Speed * (-1);
						}
						else if( tmp -> X - 16 <= 0 ) {
							tmp -> Speed = tmp -> Speed * (-1);
						}
						tmp -> X += tmp -> Speed;
						tmp -> Y += tmp -> YSpeed;
					}
					//If Demon 3 then do
					else if( tmp -> Subtype == 3 && get_frame_counter() % 3 == 0 ) {
						if( tmp -> X + 16 >= 640 ) {
							tmp -> Speed = tmp -> Speed * (-1);
						}
						else if( tmp -> X - 16 <= 0 ) {
							tmp -> Speed = tmp -> Speed * (-1);
						}
						tmp -> X += tmp -> Speed;
						tmp -> Y += tmp -> YSpeed;
					}
					//If Demon 4 then do
					else if( tmp -> Subtype == 4 && get_frame_counter() % 3 == 0 ) {
						Sub4Counter += 1;
						if( tmp -> Step == 0 ) {
							tmp -> Mangle += tmp -> Speed;
							rads = tmp -> Mangle * pi/180;
							tmp -> X = ( 100 * (cos(rads)) ) + 650;
							tmp -> Y = ( 100 * (sin(rads)) ) + 160;
							if( tmp -> X == 550 ) {	
								tmp -> Step += 1;										//Move to the Next Movement Step<F7>
								tmp -> Mangle = 90;										//Set Angle to bottom of next loop
							}
						}					
						else if( tmp -> Step == 1 ) {
							tmp -> Mangle += tmp -> Speed;
							rads = tmp -> Mangle * pi/180;
							tmp -> X = ( 60 * (cos(rads)) ) + 550;
							tmp -> Y = ( 60 * (sin(rads)) ) + 100;
							if( ( tmp -> Mangle + 182 ) % 364 == 0 ) {					//Every time enemies loop througg 182 degrees loopcount +1
								tmp -> LoopCount += 1;
							}
							if( tmp -> LoopCount == 4 ) {
								tmp -> Step += 1;
							}
						}
						else if( tmp -> Step == 2 ) {
							if( tmp -> X + 16 > 640 ) {									//If Demons hit right wall
								tmp -> Speed = tmp -> Speed * (-1);						//Go backwards
								tmp -> Y += 10;											//Move down a level
							}
							if( tmp -> X - 16 < 0 ) {									//If Demons hit left wall
								tmp -> Speed = tmp -> Speed * (-1);						//Go forwards
								tmp -> Y += 10;											//Move down a level
							}
							tmp -> X -= tmp -> Speed;
						}
					}
					DemonCounter += 1;


				}
				//Moving Fire
				if( tmp -> Type == FIRE ) {
					if( tmp -> Y > 300 ) {
						mylist = obtain( mylist, &tmp ) ;			//Get the node and move its position in the loop
						rmnode( tmp );								//Remove the node
					}
					tmp -> Y += 1;
				}
				tmp = tmp -> next;
			}

			//-----------------------------------------------------
			// Collisions
			//-----------------------------------------------------
			tmp = NULL;
			tmp = mylist -> start;
			while( tmp != NULL ) {
				//Demons
				if( tmp -> Type == DEMON ) {
					kmp = NULL;
					kmp = mylist -> start;
					while( kmp != NULL ) {
						//Demon X Laser
						if( kmp -> Type == LASER ) {
							if( ObjectsOverlap( tmp, kmp ) ) {
								mylist = obtain( mylist, &tmp );	//Obtain and remove Demon
								rmnode( tmp );
								mylist = obtain( mylist, &kmp );	//Obtain and remove Laser
								rmnode( kmp );

								FireMod -= 3;						//As Demon's die make more fire spawn

								//Add Score
								Score += tmp -> Points;

								//Play Demon Death Sound
								select_sound( SoundDemonDeath );
								play_sound( SoundDemonDeath );
							}
						}
						//Demon X Player
						if( kmp -> Type == PLAYER ) {
							if( ObjectsOverlap( tmp, kmp ) ) {
								mylist = obtain( mylist, &tmp );	//Obtain and remove Demon
								rmnode( tmp );
								mylist = obtain( mylist, &kmp );	//Obtain and remove Player
								rmnode( kmp );

								Player -> Health = 0;
							}
						}
					kmp = kmp -> next;
					}
				}
				//Fire
				else if( tmp -> Type == FIRE ) {
					kmp = NULL;
					kmp = mylist -> start;
					while( kmp != NULL ) {
						//Fire X Player
						if( kmp -> Type == PLAYER && DamageTimer > 60 ) {
							if( ObjectsOverlap( tmp, kmp ) ) {
								mylist = obtain( mylist, &tmp );	//Obtain and remove Fire
								rmnode( tmp );
								lmp = NULL;
								lmp = mylist -> start;
								while( lmp != NULL ) {
									if( lmp -> Type == LIVES ) {
										mylist = obtain( mylist, &lmp );	//Obtain and remove Player Life
										rmnode( lmp );

										DamageTimer = 0;
										Player -> Health -= 1;

										//Play Hurt Sound
										select_sound( SoundHurt );
										play_sound( SoundHurt );
										break;
									}
								lmp = lmp -> next;
								}
							}
						}
					kmp = kmp -> next;
					}
				}
				//Shield
				else if( tmp -> Type == SHIELD ) {
					kmp = NULL;
					kmp = mylist -> start;
					while( kmp != NULL ) {
						//Shield X Fire
						if( kmp -> Type == FIRE ) {
							if( ObjectsOverlap( tmp, kmp ) ) {
								tmp -> Health -= 1;
								if( tmp -> Health == 18 || tmp -> Health == 12 || tmp -> Health == 6 ) {
									tmp -> RID += 1;				//Damage Shield
								}
								if( tmp -> Health == 0 ) {
									mylist = obtain( mylist, &tmp );	//Obtain and remove Shield
									rmnode( tmp );
								}
								mylist = obtain( mylist, &kmp );	//Obtain and remove Fire
								rmnode( kmp );
							}
						}
						//Shiled x Laser
						if( kmp -> Type == LASER ) {
							if( ObjectsOverlap( tmp, kmp ) ) {
								mylist = obtain( mylist, &kmp );	//Obtain and remove Laser
								rmnode( kmp );
							}
						}
					kmp = kmp -> next;
					}
				}
				tmp = tmp -> next;
			}
			DamageTimer += 1;

			//-----------------------------------------------------
			// To Win or To Lose, that is the Question
			//-----------------------------------------------------
			if( Player -> Health == 0 ) {
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

				itoa( Score, Statement, 10 );
				print_at( 300, 200, Statement);
				exit();
			}
			else if( DemonCounter == 0 ) {
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

				itoa( Score, Statement, 10 );
				print_at( 300, 200, Statement);
				exit();
			}

			//-----------------------------------------------------
			// Draw
			//-----------------------------------------------------
			
			//Draw Players, Enemies, Fire, and Lasers
			tmp = mylist -> start;
			while( tmp != NULL ) {
				select_texture( TextureGameObjects );
				select_region( tmp -> RID );
				set_drawing_scale( tmp -> Scale, 2 );
				draw_region_zoomed_at( tmp -> X, tmp -> Y );
				tmp = tmp -> next;
			}

			//Draw Lives
			select_region( RegionLives );
			set_drawing_scale( 2, 2 );
			draw_region_zoomed_at( 50, 340 );
			set_drawing_scale( 1, 1 );

			//Draw Score
			select_region( RegionScore );
			set_drawing_scale( 2, 2 );
			draw_region_zoomed_at( 60, 20 );
			set_drawing_scale( 1, 1 );

			itoa( Score, Statement, 10 );
			print_at( 130, 10, Statement);

//			itoa( temp, Statement, 10 );
//			print_at( 230, 10, Statement);
		}
		end_frame();
	}
}














