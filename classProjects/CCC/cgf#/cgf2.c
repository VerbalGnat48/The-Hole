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

#include "Libs/Initials.h"
#include "Libs/Nodes.h"
#include "Libs/Functions.h"

//-----------------------------------------------------
// Definitions
//-----------------------------------------------------
//Define Textures
#define TextureTable		0
#define TexturePlayer_Suits	1
#define TextureEnemy_Suits	2
#define TextureAlphabet		3
#define TextureDark			4

//Define Regions
#define RegionTable			0
#define RegionPlayer_Suits	0
#define RegionEnemy_Suits	0
#define FirstRegionTextFont	0
#define RegionDark			0

//Matt Card Regions
#define RegionM_Ace			1
#define RegionM_Two			2
#define RegionM_Three		3
#define RegionM_Four		4
#define RegionM_Five		5
#define RegionM_Six			6
#define RegionM_Seven		7
#define RegionM_Eight		8
#define RegionM_Nine		9
#define RegionM_Ten			10
#define RegionM_Jack		11
#define RegionM_Queen		12
#define RegionM_King		13

//Joe Card Regions
#define RegionJ_Ace			14
#define RegionJ_Two			15
#define RegionJ_Three		16
#define RegionJ_Four		17
#define RegionJ_Five		18
#define RegionJ_Six			19
#define RegionJ_Seven		20
#define RegionJ_Eight		21
#define RegionJ_Nine		22
#define RegionJ_Ten			23
#define RegionJ_Jack		24
#define RegionJ_Queen		25
#define RegionJ_King		26

//Goomba Card Region
#define RegionG_Ace			27
#define RegionG_Two			28
#define RegionG_Three		29
#define RegionG_Four		30
#define RegionG_Five		31
#define RegionG_Six			32
#define RegionG_Seven		33
#define RegionG_Eight		34
#define RegionG_Nine		35
#define RegionG_Ten			36
#define RegionG_Jack		37
#define RegionG_Queen		38
#define RegionG_King		39

//Koopa Card Region
#define RegionK_Ace			40
#define RegionK_Two			41
#define RegionK_Three		42
#define RegionK_Four		43
#define RegionK_Five		44
#define RegionK_Six			45
#define RegionK_Seven		46
#define RegionK_Eight		47
#define RegionK_Nine		48
#define RegionK_Ten			49
#define RegionK_Jack		50
#define RegionK_Queen		51
#define RegionK_King		52

//Other Card Stuff
#define RegionJoker			53
#define RegionM_Back		55
#define RegionJ_Back		56
#define RegionG_Back		57
#define RegionK_Back		58
#define RegionSelect		59
#define RegionBack			60
#define RegionBlank			61

//Sounds 
#define MusicCasino			0
#define SoundFlip			1
#define SoundShuffle		2
#define SoundStart			3
#define SoundWin			4

//-----------------------------------------------------
// Main
//-----------------------------------------------------

void main( void )
{
	//-----------------------------------------------------
	// Defining Textures
	//-----------------------------------------------------

	//Table Background
	select_texture( TextureTable );
	select_region( RegionTable );
	define_region_center( 0,0, 639,359 );

	//Player Suits
	select_texture( TexturePlayer_Suits );
	select_region( RegionPlayer_Suits );
	define_region_matrix( RegionM_Ace, 0,0, 55,95, 28,48, 10,3, 0 );

	//Enemy Suits
	select_texture( TextureEnemy_Suits );
	select_region( RegionEnemy_Suits );
	define_region_matrix( RegionG_Ace, 0,0, 55,95, 28,48, 10,3, 0 );

	//Player Back Cards
	select_texture( TexturePlayer_Suits );
	select_region( RegionPlayer_Suits );
	define_region_matrix( RegionM_Back, 560,0, 615,65, 588,48, 2,1, 0 );

	//Enemy Back Cards
	select_texture( TextureEnemy_Suits );
	select_region( RegionEnemy_Suits );
	define_region_matrix( RegionM_Back, 560,0, 615,65, 588,48, 2,1, 0 );

	//Select
	select_texture( TexturePlayer_Suits );
	select_region( RegionSelect );
	define_region_matrix( RegionSelect, 336,192, 391,287, 364,240, 1,1, 0 );

	//Blank
	select_texture( TexturePlayer_Suits );
	select_region( RegionBlank );
	define_region_matrix( RegionBlank, 504,192, 559,287, 532,240, 1,1, 0 );

	//Standard Back Card
	select_texture( TexturePlayer_Suits );
	select_region( RegionSelect );
	define_region_matrix( RegionBack, 560,192, 615,287, 588,240, 1,1, 0 );
	select_texture( TextureEnemy_Suits );
	select_region( RegionSelect );
	define_region_matrix( RegionBack, 560,192, 615,287, 588,240, 1,1, 0 );

	//Alphabet
	select_texture( TextureAlphabet );
	define_region_matrix( FirstRegionTextFont, 0,0, 31,31, 0,31, 16,8, 0 );

	//Dark Background
	select_texture( TextureDark );
	select_region( RegionDark );
	define_region_topleft( 0,0, 639,359 );

	//-----------------------------------------------------
	// Initializations Part 1
	//-----------------------------------------------------

	StackList *mySL	= NULL;
	mySL = mkstacklist();

	//-----------------------------------------------------
	// Game Initializations Part 1
	//-----------------------------------------------------

	//Gamepad
	select_gamepad( 0 );

	//Random Number Generator
	srand( get_time() );

	//Make the Shit
	GameObject *Select	= NULL;
	GameObject *Card	= NULL;
	GameObject *tmp		= NULL;
	GameObject *kmp		= NULL;
	GameObject *lmp		= NULL;

	//Stack Stuff
	Cardstack	= mkstack(52);
	Selector	= mkstack(5);
	//Start Stacks
	Stack1		= mkstack(14);
	Stack2		= mkstack(14);
	Stack3		= mkstack(14);
	Stack4		= mkstack(14);
	Stack5		= mkstack(14);
	Stack6		= mkstack(14);
	Stack7		= mkstack(14);
	Stack8		= mkstack(14);
	//Free/Home Stacks
	Free1		= mkstack(2);
	Free2		= mkstack(2);
	Free3		= mkstack(2);
	Free4		= mkstack(2);
	Home1		= mkstack(14);
	Home2		= mkstack(14);
	Home3		= mkstack(14);
	Home4		= mkstack(14);

	
	//-----------------------------------------------------
	// Sound
	//-----------------------------------------------------
	
	//Main Game Sound
	select_sound( MusicCasino );
	set_sound_loop( true );
	set_channel_volume( 0.25 );
	play_sound_in_channel( MusicCasino, 0 );

	//-----------------------------------------------------
	// Pre-Game Info
	//-----------------------------------------------------

	Print_Text( 160, 180, "eMOVE WITH ARROWSe", 0.5, 3 );
	Print_Text( 126, 200, "aX TO MANUALLY PICK UPa", 0.5, 3 );
	Print_Text( 92, 220, "qENTER TO AUTO PICK/PLACEq", 0.5, 3 );
	Print_Text( 150, 260, "sPRESS ENTER TO PLAYt", 0.5, 3 );
	while( gamepad_button_start() < 0 ) {
		//Sit in loop until start
	}
	Play_Sound( SoundStart );
	sleep( 60 );
	Play_Sound( SoundShuffle );
	sleep( 120 );

	//-----------------------------------------------------
	// Start of Game Loop
	//-----------------------------------------------------
	while( true )
	{
		if( StartFlag == 0 ) {
			//-----------------------------------------------------
			// Initializations Part 2
			//-----------------------------------------------------

			//Refresh the Normal Game Stacks
			Selector = Refresh_Stack( Selector, 6 );
			Stack1 = Refresh_Stack( Stack1, 14 );
			Stack2 = Refresh_Stack( Stack2, 14 );
			Stack3 = Refresh_Stack( Stack3, 14 );
			Stack4 = Refresh_Stack( Stack4, 14 );
			Stack5 = Refresh_Stack( Stack5, 14 );
			Stack6 = Refresh_Stack( Stack6, 14 );
			Stack7 = Refresh_Stack( Stack7, 14 );
			Stack8 = Refresh_Stack( Stack8, 14 );
			Free1 = Refresh_Stack( Free1, 2 );
			Free2 = Refresh_Stack( Free2, 2 );
			Free3 = Refresh_Stack( Free3, 2 );
			Free4 = Refresh_Stack( Free4, 2 );
			Home1 = Refresh_Stack( Home1, 14 );
			Home2 = Refresh_Stack( Home2, 14 );
			Home3 = Refresh_Stack( Home3, 14 );
			Home4 = Refresh_Stack( Home4, 14 );

			Count		= 0;
			Total		= 0;
			CardCount	= 0;
			MaxGrab		= 5;
			type		= 0;

			SelectMod13	= 0;
			SelectMod26	= 0;
			RefMod13	= 0;
			RefMod26	= 0;

			MaxCards	= 52;
			MaxStacks	= 16;
			GrabTimer	= 0;
			MoveTimer	= 0;

			GrabFlag	= 0;
			StopFlag	= 0;
			AutoFlag	= 0;

			index		= 0;

			//-----------------------------------------------------
			// Game Initializations Part 2
			//-----------------------------------------------------

			//Rand
			srand( get_time() );

			//Make the Nodes
			Select	= NULL;
			Card	= NULL;
			tmp		= NULL;
			kmp		= NULL;
			lmp		= NULL;

		//-----------------------------------------------------
		// Stack Web
		//-----------------------------------------------------
			//Where you Organize Cards
			mySL = SLadd( mySL, mySL -> end, Home1 );
			mySL = SLadd( mySL, mySL -> end, Home2 );
			mySL = SLadd( mySL, mySL -> end, Home3 );
			mySL = SLadd( mySL, mySL -> end, Home4 );

			//Main Stacks
			mySL = SLadd( mySL, mySL -> end, Stack1 );
			mySL = SLadd( mySL, mySL -> end, Stack2 );
			mySL = SLadd( mySL, mySL -> end, Stack3 );
			mySL = SLadd( mySL, mySL -> end, Stack4 );
			mySL = SLadd( mySL, mySL -> end, Stack5 );
			mySL = SLadd( mySL, mySL -> end, Stack6 );
			mySL = SLadd( mySL, mySL -> end, Stack7 );
			mySL = SLadd( mySL, mySL -> end, Stack8 );

			//Any Singular Card Stacks
			mySL = SLadd( mySL, mySL -> end, Free1 );
			mySL = SLadd( mySL, mySL -> end, Free2 );
			mySL = SLadd( mySL, mySL -> end, Free3 );
			mySL = SLadd( mySL, mySL -> end, Free4 );

			mySL = SLup( mySL, Stack1, Free1 );
			mySL = SLup( mySL, Stack2, Free2 );
			mySL = SLup( mySL, Stack3, Free3 );
			mySL = SLup( mySL, Stack4, Free4 );
			mySL = SLup( mySL, Stack5, Home1 );
			mySL = SLup( mySL, Stack6, Home2 );
			mySL = SLup( mySL, Stack7, Home3 );
			mySL = SLup( mySL, Stack8, Home4 );

			//Where the Stacks Sit
			Stack_Pos( Cardstack, 800, 56 );
			Stack_Pos( Stack1, 75, 156 );
			Stack_Pos( Stack2, 145, 156 );
			Stack_Pos( Stack3, 215, 156 );
			Stack_Pos( Stack4, 285, 156 );
			Stack_Pos( Stack5, 355, 156 );
			Stack_Pos( Stack6, 425, 156 );
			Stack_Pos( Stack7, 495, 156 );
			Stack_Pos( Stack8, 565, 156 );
			
			Stack_Pos( Free1, 75, 56 );
			Stack_Pos( Free2, 145, 56 );
			Stack_Pos( Free3, 215, 56 );
			Stack_Pos( Free4, 285, 56 );
			Stack_Pos( Home1, 355, 56 );
			Stack_Pos( Home2, 425, 56 );
			Stack_Pos( Home3, 495, 56 );
			Stack_Pos( Home4, 565, 56 );

		//-----------------------------------------------------
		// Shuffle
		//-----------------------------------------------------
			Count = 1;

			//Make an Array with values in sequential order
			for( index = 0; index < MaxCards; index++ ) {
				Shuffle[index].RID = index+1;
			}
			//Re-arrange values
			for( index = MaxCards-1; index >= 0; index-- ) {
				random = ( rand() % (index+1) ) + 1;
				temp = Shuffle[index].RID;
				Shuffle[index].RID = Shuffle[random].RID;
				Shuffle[random].RID = temp;
			}

			//No Shuffle
			for( index = MaxCards-1; index >= 0; index-- ) {
				Shuffle[index].RID = index+1;
			}

			//Make the Shuffle/Cards
			for( index = 0; index < MaxCards; index++ ) {
				if( Shuffle[index].RID <= 26 ) {
					Card = mknode( true, Cardstack -> X,Cardstack -> Y, 1,1, 55,95, 1,Shuffle[index].RID, 60 );
					Cardstack = push( Cardstack, Card );
				}
				else if( Shuffle[index].RID > 26 && Shuffle[index].RID <= 52 ) {
					Card = mknode( true, Cardstack -> X,Cardstack -> Y, 1,1, 55,95, 2,Shuffle[index].RID, 60 );
					Cardstack = push( Cardstack, Card );
				}
			}

		//-----------------------------------------------------
		// The Vengeance Shuffle
		//-----------------------------------------------------

			int CardsLeft	= 104;
			int ListPos		= 0;
			index			= 0;
			tmp				= NULL;
			for( CardsLeft = 104; CardsLeft >= 0; CardsLeft-- ) {
				ListPos = rand() % 52;
				tmp = Cardstack -> data -> start;
				while( index != ListPos ) {
					tmp = tmp -> next;
					index++;
				}
				Cardstack = pop( Cardstack, &tmp );
				Cardstack = push( Cardstack, tmp );
				index  = 0;
			}

			
		//-----------------------------------------------------
		// Stack Stuff
		//-----------------------------------------------------
			Empty_Stack( Stack1 );
			Empty_Stack( Stack2 );
			Empty_Stack( Stack3 );
			Empty_Stack( Stack4 );
			Empty_Stack( Stack5 );
			Empty_Stack( Stack6 );
			Empty_Stack( Stack7 );
			Empty_Stack( Stack8 );
			Empty_Stack( Free1 );
			Empty_Stack( Free2 );
			Empty_Stack( Free3 );
			Empty_Stack( Free4 );
			Empty_Stack( Home1 );
			Empty_Stack( Home2 );
			Empty_Stack( Home3 );
			Empty_Stack( Home4 );

			//Give the Start Stacks their cards
			Give_Cards( Stack1, Cardstack, 0, 17, 7 );
			Give_Cards( Stack2, Cardstack, 0, 17, 7 );
			Give_Cards( Stack3, Cardstack, 0, 17, 7 );
			Give_Cards( Stack4, Cardstack, 0, 17, 7 );
			Give_Cards( Stack5, Cardstack, 0, 17, 6 );
			Give_Cards( Stack6, Cardstack, 0, 17, 6 );
			Give_Cards( Stack7, Cardstack, 0, 17, 6 );
			Give_Cards( Stack8, Cardstack, 0, 17, 6 );

			//Make the Selector
			Select = mknode( true, 360,180, 1,1, 55,95, 1,59, 59 );
			Stack_Pos( Selector, Stack4 -> X, Stack4 -> Y );
			Selector = push( Selector, Select );
			Selector -> StackRef = Stack4;
			Select -> X = Selector -> StackRef -> top -> X;
			Select -> Y = Selector -> StackRef -> top -> Y;
			Select -> ref = Selector -> StackRef -> top;
			Select -> ref -> X = Selector -> StackRef -> top -> X;
			Select -> ref -> Y = Selector -> StackRef -> top -> Y;

			Cardstack -> type = 4;
			Stack1 -> type = 3;
			Stack2 -> type = 3;
			Stack3 -> type = 3;
			Stack4 -> type = 3;
			Stack5 -> type = 3;
			Stack6 -> type = 3;
			Stack7 -> type = 3;
			Stack8 -> type = 3;

			Free1 -> type = 1;
			Free2 -> type = 1;
			Free3 -> type = 1;
			Free4 -> type = 1;

			Home1 -> type = 2;
			Home2 -> type = 2;
			Home3 -> type = 2;
			Home4 -> type = 2;

			StartFlag = 1;

			Size1	= 1;
			Size2	= 1;
			Size3	= 1;
			Size4	= 1;
			Size5	= 1;
			Size6	= 1;
			Size7	= 1;
			Size8	= 1;

			EndFlag		= 1;
			EndCount = 0;
		}

		//-----------------------------------------------------
		// Drawing
		//-----------------------------------------------------

			clear_screen( color_black );

			//Draw Table
			set_drawing_scale( 1.105 , 1.18 );
			select_texture( TextureTable );
			select_region( RegionTable );
			draw_region_zoomed_at( 320, 180 );
			set_drawing_scale( 1, 1 );

			Print_Stack( Cardstack );

			//Print Stacks
			Print_Stack( Stack1 );
			Print_Stack( Stack2 );
			Print_Stack( Stack3 );
			Print_Stack( Stack4 );
			Print_Stack( Stack5 );
			Print_Stack( Stack6 );
			Print_Stack( Stack7 );
			Print_Stack( Stack8 );
			Print_Stack( Free1 );
			Print_Stack( Free2 );
			Print_Stack( Free3 );
			Print_Stack( Free4 );
			Print_Stack( Home1 );
			Print_Stack( Home2 );
			Print_Stack( Home3 );
			Print_Stack( Home4 );

			//Selector Card
			Print_Stack( Selector );

		//-----------------------------------------------------
		// Win
		//-----------------------------------------------------

			if( EndFlag == 0 ) {
				//Draw Dark Overlay so Win Text is more eligible
				select_texture( TextureDark );
				select_region( RegionDark );
				draw_region_at( 0, 0 );

				//Win Sound
				if( EndCount == 0 ) {
					Play_Sound( SoundWin );
				}

				//End Text
				Print_Text( 175, 180, "dYOU WINd", 1, 3 );
/*				Print_Text( 150, 200, "NEW GAME BEGINING", 0.5, 3 );
				sleep( 20 );
				Print_Text( 439, 200, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 456, 200, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 473, 200, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 490, 200, "f", 0.5, 3 );
				sleep( 20 );
*/

				Print_Text( 150, 200, "PRESS CNTRL+R TO NEW+", 0.5, 3 );\
				Print_Text( 286, 220, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 303, 220, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 321, 220, ".", 0.5, 3 );
				sleep( 20 );
				Print_Text( 338, 220, ".", 0.5, 3 );
				sleep( 20 );

				//Shifle Sound and Start New Game Flag
				if( EndCount == 1 ) {
					Play_Sound( SoundShuffle );
				}
				else if( EndCount == 3 ) {
					StartFlag = 0;
				}

				EndCount++;
			}

		//-----------------------------------------------------
		// Print Provided Values
		//-----------------------------------------------------

//			Print_Value( Stack5 -> up -> top -> RID, 10, 20 );
//			Print_Value( Home1 -> down -> top -> RID, 10, 40 );
//			Print_Value( Select -> ref -> RID, 10, 60 );
//			Print_Value( Selector -> StackRef -> top -> RID, 10, 80 );
//			if( Select -> ref -> next != NULL ) {
//				Print_Value( Select -> ref -> next -> RID, 10, 100 );
//			}

		//-----------------------------------------------------
		// Gameplay
		//-----------------------------------------------------

			//Left
			if( gamepad_left() > 0 && MoveTimer >= 15 ) {
				if( Selector -> StackRef -> prev != NULL ) {
					Selector -> StackRef = Selector -> StackRef -> prev;
				} else {
					Selector -> StackRef = mySL -> end;
				}
				Selector -> X = Selector -> StackRef -> top -> X;
				Selector -> Y = Selector -> StackRef -> top -> X;
				Select -> X = Selector -> StackRef -> top -> X;
				Select -> Y = Selector -> StackRef -> top -> Y;
				Select -> ref = Selector -> StackRef -> top;
				Select -> ref -> X = Selector -> StackRef -> top -> X;
				Select -> ref -> Y = Selector -> StackRef -> top -> Y;
				MoveTimer = 0;
				Play_Sound( SoundFlip );
			}

			//Right
			else if( gamepad_right() > 0 && MoveTimer >= 15 ) {
				if( Selector -> StackRef -> next != NULL ) {
					Selector -> StackRef = Selector -> StackRef -> next;
				} else {
					Selector -> StackRef = mySL -> start;
				}
				Selector -> X = Selector -> StackRef -> top -> X;
				Selector -> Y = Selector -> StackRef -> top -> X;
				Select -> X = Selector -> StackRef -> top -> X;
				Select -> Y = Selector -> StackRef -> top -> Y;
				Select -> ref = Selector -> StackRef -> top;
				Select -> ref -> X = Selector -> StackRef -> top -> X;
				Select -> ref -> Y = Selector -> StackRef -> top -> Y;
				MoveTimer = 0;
				Play_Sound( SoundFlip );
			}
	
			//Up
			else if( gamepad_up() > 0 && MoveTimer >= 15 && Select -> ref -> next -> RID != 61 && Selector -> StackRef -> up != NULL ) {
				if( Select -> ref -> RID != 61 ) {
					Selector -> X = Selector -> StackRef -> top -> X;
					Selector -> Y = Selector -> StackRef -> top -> X;
					Select -> ref = Select -> ref -> prev;
					Select -> X = Select -> ref -> X;
					Select -> Y = Select -> ref -> Y;
					Play_Sound( SoundFlip );
				}
				if( Select -> ref -> RID == 61 && Selector -> StackRef -> up != NULL ) {
					Selector -> StackRef = Selector -> StackRef -> up;
					Selector -> X = Selector -> StackRef -> top -> X;
					Selector -> Y = Selector -> StackRef -> top -> Y;
					Select -> X = Selector -> StackRef -> top -> X;
					Select -> Y = Selector -> StackRef -> top -> Y;
					Select -> ref = Selector -> StackRef -> top;
					Select -> ref -> X = Selector -> StackRef -> top -> X;
					Select -> ref -> Y = Selector -> StackRef -> top -> Y;
					Play_Sound( SoundFlip );
				}
				MoveTimer = 0;
			}

			//Down
			else if( gamepad_down() > 0 && MoveTimer >= 15 ) {
				if( Select -> ref != Selector -> StackRef -> data -> end ) {
					Selector -> X = Selector -> StackRef -> top -> X;
					Selector -> Y = Selector -> StackRef -> top -> X;
					Select -> ref = Select -> ref -> next;
					Select -> X = Select -> ref -> X;
					Select -> Y = Select -> ref -> Y;
					Play_Sound( SoundFlip );
				}
				else if( Select -> ref -> next == NULL && Selector -> StackRef -> down != NULL ) {
					Selector -> StackRef = Selector -> StackRef -> down;
					Selector -> X = Selector -> StackRef -> top -> X;
					Selector -> Y = Selector -> StackRef -> top -> X;
					Select -> X = Selector -> StackRef -> top -> X;
					Select -> Y = Selector -> StackRef -> top -> Y;
					Select -> ref = Selector -> StackRef -> top;
					Select -> ref -> X = Selector -> StackRef -> top -> X;
					Select -> ref -> Y = Selector -> StackRef -> top -> Y;
					Play_Sound( SoundFlip );
				}
				MoveTimer = 0;
			}

			//Jump to Free/Home Stacks
			else if( gamepad_button_l() > 0 || gamepad_button_r() > 0 && MoveTimer >= 15 ) {
				if( gamepad_button_l() > 0 ) {
					Selector -> StackRef = Free1;
				}
				else if( gamepad_button_r() > 0 ) {
					Selector -> StackRef = Home1;
				}
				Selector -> X = Selector -> StackRef -> top -> X;
				Selector -> Y = Selector -> StackRef -> top -> X;
				Select -> X = Selector -> StackRef -> top -> X;
				Select -> Y = Selector -> StackRef -> top -> Y;
				Select -> ref = Selector -> StackRef -> top;
				Select -> ref -> X = Selector -> StackRef -> top -> X;
				Select -> ref -> Y = Selector -> StackRef -> top -> Y;
				Play_Sound( SoundFlip );
			}

			//End Screen
//			else if( gamepad_button_x() > 0 && MoveTimer >= 15 ) {
//				EndFlag = 0;
//			}

			StopFlag = 0;
			//Grab and Place Cards Manually
			if( gamepad_button_a() > 0 && GrabTimer >= 15 ) {
				Play_Sound( SoundFlip );
				//If Grabbing
				if( Select -> ref -> RID != 61 && Selector -> data -> QTY < Selector -> size && GrabFlag == 0 ) {
					//Count how many cards are from the selected card -> end of the stack
					CardCount = Card_Count( Select -> ref, 0 );

					//Count how many Free Stacks are "empty"
					MaxGrab = Grab_Amount( Free1, 5 );

					//Check if cards you want to grab are in alternate suit, sequential order
					StopFlag = Grab_Check( Select -> ref );

					//If CardCount <= MaxGrab then grab that amount of cards
					if( CardCount <= MaxGrab && StopFlag == 0 ) {
						Grab_Cards( Selector, Select, CardCount );
						GrabTimer = 0;
						GrabFlag = 1;
					}
				}
				//If Placing
				else if( GrabFlag == 1 && GrabTimer >= 15 ) {
					temp = Selector -> data -> start -> next -> RID;
					RefMod13 = Select -> ref -> RID % 13;
					if( RefMod13 == 0 ) {
						RefMod13 = 13;
					}
					CardCount = Card_Count( Selector -> data -> start -> next, 0 );
					SelectMod13 = Selector -> data -> start -> next -> RID % 13;
					type = Selector -> StackRef -> type;

					//Where to Place Cards in Player Hand
					Placement( Selector, Select );
					Total = 0;
				}
			}
			//Grab and Place Cards in one go
			if( gamepad_button_start() > 0 && GrabTimer >= 15 && Select -> ref -> RID != 61 && Selector -> data -> QTY < Selector -> size && GrabFlag == 0 ) {
				Play_Sound( SoundFlip );

				//Grab
				CardCount = Card_Count( Select -> ref, 0 );			//Count how many cards are from the selected card -> end of the stack
				MaxGrab = Grab_Amount( Free1, 5 );					//Count how many Free Stacks are "empty"
				StopFlag = Grab_Check( Select -> ref );				//Check if cards you want to grab are in alternate suit, sequential order
				if( CardCount <= MaxGrab && StopFlag == 0 ) {		////If CardCount <= MaxGrab then grab that amount of cards
					Grab_Cards( Selector, Select, CardCount );
				}
				
				//Check the Home Stacks to see if a card can be placed there
				Total = 0;
				Stack* Point = Home1;
				temp = Selector -> data -> start -> next -> RID;
				Placement_Check( Point, Selector, Select );

				GrabTimer = 0;
				if( Selector -> data -> start -> next == NULL ) {
					GrabFlag = 0;
				} else {
					GrabFlag = 1;
				}
			}

			//See if any Cards in Free Stacks can go into Home Stacks
			Stack* Point = Free1;
			GameObject* RefNode = NULL;

			Stack* OgStack = Selector -> StackRef;
			GameObject* OgRef = Select -> ref;

			do {
				SelectMod13 = Point -> data -> start -> next -> RID % 13;
				if( Point -> top -> RID != 61 ) {
					Stack* HomePoint = Home1;
					do {
						if( HomePoint -> top -> RID == 61 && SelectMod13 == 1 ) {
							RefNode = Point -> top;
							RefNode -> X = HomePoint -> top -> X;
							RefNode -> Y = HomePoint -> top -> Y;
							Point = pop( Point, &RefNode );
							HomePoint = push( HomePoint, RefNode );
							break;
						}
						else if( HomePoint -> top -> RID + 1 == Point -> data -> start -> next -> RID ) {
							RefNode = Point -> top;
							RefNode -> X = HomePoint -> top -> X;
							RefNode -> Y = HomePoint -> top -> Y;
							Point = pop( Point, &RefNode );
							HomePoint = push( HomePoint, RefNode );
							break;
						}
						HomePoint = HomePoint -> next;
					}
					while( HomePoint != Stack1 );
				}
				Point = Point -> next;
			}
			while( Point != NULL );

			//Move the Cards in the Selector Stack
			Move_Stack( Selector, 0, 17 );

			//Win Condition
			Size1 = End_Check( Stack1 );
			Size2 = End_Check( Stack2 );
			Size3 = End_Check( Stack3 );
			Size4 = End_Check( Stack4 );
			Size5 = End_Check( Stack5 );
			Size6 = End_Check( Stack6 );
			Size7 = End_Check( Stack7 );
			Size8 = End_Check( Stack8 );
			if( Size1 == 0 && Size2 == 0 && Size3 == 0 && Size4 == 0 && Size5 == 0 && Size6 == 0 && Size7 == 0 && Size8 == 0 && EndFlag == 1 ) {
				EndFlag = 0;
			}

			MoveTimer++;
			GrabTimer++;
			//-----------------------------------------------------
			// End
			//-----------------------------------------------------

			end_frame();
		}
	}


