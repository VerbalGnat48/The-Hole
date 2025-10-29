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
#include "Nodes.h"

//-----------------------------------------------------
// Definitions
//-----------------------------------------------------
//Define Textures
#define TextureTable		0
#define TexturePlayer_Suits	1
#define TextureEnemy_Suits	2
#define TextureAlphabet		3

//Define Regions
#define RegionTable			0
#define RegionPlayer_Suits	0
#define RegionEnemy_Suits	0
#define FirstRegionTextFont	0

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
#define RegionBack			60
#define RegionM_Back		55
#define RegionJ_Back		56
#define RegionG_Back		57
#define RegionK_Back		58
#define RegionSelect		59

//Alphabet Stuff
#define CharWidth			32
#define CharHeight			32
#define CharSepX			1
#define CharSepY			8

//Sounds
#define SoundBlackJack		0
#define MusicCasino			1
#define SoundFlip			2
#define SoundLose			3
#define SoundShuffle		4
#define SoundStart			5
#define SoundWin			6

//-----------------------------------------------------
// Initializations Part 1
//-----------------------------------------------------

int GrabTimer	= 0;
int AceFlag		= 0;
int[30] Statement;

Stack *Cardstack = NULL;
Stack *PlayerS = NULL;
Stack *DealerS = NULL;

//-----------------------------------------------------
// Initializations Part 1 End
//-----------------------------------------------------

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

void Stack_Place( int Number, GameObject* Card )
{
	if( Number == 1 ) {
		Cardstack = push( Cardstack, Card );
	}
	else if( Number == 2 ) {
		PlayerS = push( PlayerS, Card );
	}
}

int Stack_Total( int Total, int Value )
{
	int tmp = 0;
	tmp = Value % 13;
	if( tmp == 0 || tmp > 10 ) {
		tmp = 10;
	}
	if( tmp == 1 ) {
		tmp = 11;
	}
	if( tmp + Total > 21 && tmp == 11 ) {
		tmp = 1;
	}
	Total += tmp;	
	return Total;
}

int Give_Card( Stack* Stack, int Total )
{
	//Get Card and put onto the Stack
	GameObject* tmp = NULL;
	tmp = Cardstack -> top;
	Cardstack = pop( Cardstack, &tmp );
	tmp -> X = Stack -> X;
	tmp -> Y = Stack -> Y;
	Stack = push( Stack, tmp );
	GrabTimer = 0;
	Stack -> X += 20;

	//Stack total value
	Total = Stack_Total( Total, Stack -> top -> RID );
	GameObject* Card = Stack -> data -> start;
	while( Card != NULL && AceFlag != 1 ) {
		if( Card -> RID % 13 == 1 && Total > 21 ) {
			Total -= 10;
			AceFlag = 1;
		}
		Card = Card -> next;
	}

	//Move the Cards Slightly
	tmp = Stack -> data -> start;
	while( tmp != NULL ) {
		tmp -> X -= 16;
		tmp = tmp -> next;
	}
	return Total;
}

void Print_Stack( GameObject* Card )
{
	while( Card != NULL ) {
		select_texture( Card -> TID );
		select_region( Card -> RID );
		set_drawing_scale( Card -> XScale, Card -> YScale );
		draw_region_zoomed_at( Card -> X, Card -> Y );
		Card = Card -> next;
	}
}

void Print_Card( GameObject* Card, int BackFlag )
{
	select_texture( Card -> TID );
	if( BackFlag == true ) {
		select_region( Card -> BC );
	} else {
		select_region( Card -> RID );
	}
	set_drawing_scale( Card -> XScale, Card -> YScale );
	draw_region_zoomed_at( Card -> X, Card -> Y );
}

void Print_Value( int Value, int X, int Y )
{
	itoa( Value, Statement, 10 );
	print_at( X, Y, Statement );
}

int BlackJack_Check( GameObject* Card, int BlackJackFlag )
{
	if( ( Card -> RID & 13 == 0 || Card -> RID % 13 >= 10 ) && Card -> next -> RID % 13 == 1 ) {
		BlackJackFlag = 0;
	}
	else if( Card -> RID % 13 == 1 && ( Card -> next -> RID % 13 == 0 || Card -> next -> RID % 13 >= 10 ) ) {
		BlackJackFlag = 0;
	}
	return BlackJackFlag;
}

void Print_Text( float LeftX, float BaselineY, int* Text, float Scale )
{
	select_texture( TextureAlphabet );
	float DrawingX = LeftX;

	while( *Text )
	{
		//Print the char
		select_region( *Text );
		set_drawing_scale( Scale, Scale );
		draw_region_zoomed_at( DrawingX, BaselineY );
		//Add to X
		DrawingX += ( CharWidth * Scale ) + CharSepX;
		//Check for line break
		if( *Text == '\n' )
		{
			//Add to Y, Reset X
			BaselineY += ( CharHeight * Scale ) + CharSepY;
		}
		//Next Char
		++Text;
	}
}

void Play_Sound( int ID )
{
	select_sound( ID );
	play_sound( ID );
}

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
	define_region_topleft( 0,0, 639,359 );

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


	//-----------------------------------------------------
	// Initializations Part 2
	//-----------------------------------------------------
	int index;
	int random;
	int count		= 0;
	int Total		= 0;
	int Ptotal		= 0;
	int Dtotal		= 0;
	int AceCount	= 0;

	int MaxCards	= 52;
	int MaxStacks	= 2;
	int GrabTimer	= 0;

	int temp;

	int StartFlag	= 0;
	int EndFlag	= 1;
	int DealerFlag	= 1;
	int PBJF		= 1;
	int DBJF		= 1;

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
	Cardstack = mkstack(0);
	PlayerS = mkstack(0);
	DealerS = mkstack(0);

	//Start Music
	select_sound( MusicCasino );
	set_sound_loop( true );
	set_channel_volume( 0.25 );
	play_sound_in_channel( MusicCasino, 0 );

	//-----------------------------------------------------
	// Pre-Game Info
	//-----------------------------------------------------

	Print_Text( 190, 120, "PRESS X TO HIT", 0.5 );
	Print_Text( 190, 160, "PRESS ENTER", 0.5 );
	Print_Text( 190, 180, "(WHEN IN GAME)", 0.5 );
	Print_Text( 190, 200, "FOR DEALER'S TURN", 0.5 );
	Print_Text( 190, 240, "PRESS ENTER TO GAMBLE", 0.5 );
	while( gamepad_button_start() < 0 ) {
		//Sit in loop until start
	}
	Play_Sound( SoundStart );
	sleep( 180 );

	while( true )
	{
		if( StartFlag == 0 ) {
			//-----------------------------------------------------
			// Initializations Part 3
			//-----------------------------------------------------
			PlayerS = rmstack( PlayerS );
			PlayerS = mkstack(0);
			DealerS = rmstack( DealerS );
			DealerS = mkstack(0);

			count		= 0;
			Total		= 0;
			Ptotal		= 0;
			Dtotal		= 0;
			AceCount	= 0;

			MaxCards	= 52;
			MaxStacks	= 2;
			GrabTimer	= 0;

			AceFlag		= 0;
			PBJF		= 1;
			PBJF		= 1;
			EndFlag		= 1;

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

			//Where the Stacks Sit
			Cardstack -> X = 60;
			Cardstack -> Y = 180;
			PlayerS -> X = 332;
			PlayerS -> Y = 280;
			DealerS -> X = 332;
			DealerS	-> Y = 80;

			//Shuffle!
			count = 1;
			GameObject[52] Shuffle;
			//Make an Array with values in sequential order
			for( index = 1; index <= MaxCards; index++ ) {
				Shuffle[index].RID = index;
			}
			//Re-arrange values
			for( index = MaxCards; index > 0; index-- ) {
				random = ( rand() % (index+1) ) + 1;
				temp = Shuffle[index].RID;
				Shuffle[index].RID = Shuffle[random].RID;
				Shuffle[random].RID = temp;
			}
			//Make the Shuffle
			for( index = 1; index <= MaxCards; index++ ) {
				if( Shuffle[index].RID <= 26 ) {
					Card = mknode( true, Cardstack -> X,Cardstack -> Y, 1,1, 55,95, 1,Shuffle[index].RID, 60 );
					Cardstack = push( Cardstack, Card );
				}
				else if( Shuffle[index].RID > 26 && Shuffle[index].RID <= 52 ) {
					Card = mknode( true, Cardstack -> X,Cardstack -> Y, 1,1, 55,95, 2,Shuffle[index].RID, 60 );
					Cardstack = push( Cardstack, Card );
				}
			}

			//Give the Player their first two cards
			Ptotal = Give_Card( PlayerS, Ptotal );
			Ptotal = Give_Card( PlayerS, Ptotal );

			//Give the Dealer their cards
			Dtotal = Give_Card( DealerS, Dtotal );
			Dtotal = Give_Card( DealerS, Dtotal );

			StartFlag = 1;
			set_channel_volume( 0.10 );
			Play_Sound( SoundShuffle );
			sleep( 240 );
			set_channel_volume( 0.25 );
		}

		//-----------------------------------------------------
		// "Game Loop"
		//-----------------------------------------------------
		//-----------------------------------------------------
		// Drawing
		//-----------------------------------------------------

		clear_screen( color_black );

		//Draw Table
		set_drawing_scale( 1,1 );
		select_texture( TextureTable );
		select_region( RegionTable );
		draw_region_at( 0,0 );

		//Cardstack with top face down
		Print_Card( Cardstack -> top, true );

		//Player Stack
		Print_Stack( PlayerS -> data -> start );

		//Dealer Stack and Make Top Card face down
		Print_Stack( DealerS -> data -> start );
		Print_Card( DealerS -> top, true );

//		Print_Value( Ptotal, 40, 280 );
//		Print_Value( Dtotal, 70, 280 );
//		Print_Value( DealerS -> top -> BC, 100, 280 );

		//-----------------------------------------------------
		// Gameplay
		//-----------------------------------------------------

		//Hit
		if( gamepad_button_a() > 0 && GrabTimer >= 15 ) {
			Ptotal = Give_Card( PlayerS, Ptotal );
			GrabTimer = 0;
			Play_Sound( SoundFlip );
		}
		GrabTimer += 1;

		//Player BlackJack Check
		PBJF = BlackJack_Check( PlayerS -> data -> start, PBJF );
//		Print_Value( PBJF, 40, 300 );

		//Dealer BlackJack Check
		DBJF = BlackJack_Check( DealerS -> data -> start, DBJF );
//		Print_Value( DBJF, 70, 300 );

		//Player over Hit Check
		if( Ptotal > 21 ) {
			EndFlag = 0;
			Print_Stack( PlayerS -> data -> start );
		}

		//Dealer Hit
		if( ( gamepad_button_start() == 1 || DealerFlag == 0 ) && GrabTimer >= 15 ) {
			Print_Stack( DealerS -> data -> start );
			sleep( 30 );
			while( Dtotal < 17 ) {
				Dtotal = Give_Card( DealerS, Dtotal );
				Print_Stack( DealerS -> data -> start );
				Play_Sound( SoundFlip );
				sleep( 30 );
			}
			EndFlag = 0;
//			Print_Value( Dtotal, 70, 260 );
		}

		//-----------------------------------------------------
		// Hand Total Checks
		//-----------------------------------------------------

		//Get Set for a new game
		if( EndFlag == 0 || PBJF == 0 || DBJF == 0 ) {
			//Get re-intialization ready
			StartFlag = 0;
			EndFlag = 1;
			set_channel_volume( 0.10 );

			//Check if Win or Lose
			//Tie 1
			if( Ptotal == Dtotal ) {
				Print_Text( 250, 30, "k TIE! k", 0.5 );
				Play_Sound( SoundLose );
				sleep( 120 );
			}
			//Dealer BlackJack
			if( Ptotal == 21 && DBJF == 0 ) {
				Print_Text( 100, 30, "d DEALER BLACKJACK d", 0.5 );
				Play_Sound( SoundLose );
				sleep( 120 );
			}
			//Player BlackJack
			else if( Ptotal == 21 && PBJF == 0 ) {
				Print_Text( 200, 30, "d BLACKJACK d", 0.5 );
				set_global_volume( 2 );
				Play_Sound( SoundBlackJack );
				set_global_volume( 1 );
				sleep( 120 );
			}
			//Dealer strikes out, Player doesn't
			else if( Ptotal <= 21 && Dtotal > 21 ) {
				Print_Text( 190, 30, "d PLAYER WINS! d", 0.5 );
				set_global_volume( 2 );
				Play_Sound( SoundWin );
				set_global_volume( 1 );
				sleep( 60 );
			}
			//Player strikes out, Dealer doesn't
			else if( Ptotal > 21 && Dtotal <= 21 ) {
				Print_Text( 190, 30, "d HOUSE WINS! d", 0.5 );
				Play_Sound( SoundLose );
				sleep( 120 );
			}
			//Player < Deaker
			else if( Ptotal < Dtotal ) {
				Print_Text( 190, 30, "d HOUSE WINS! d", 0.5 );
				Play_Sound( SoundLose );
				sleep( 120 );
			}
			//Player higher than Dealer <= 21
			else if( Ptotal > Dtotal && Ptotal <= 21 ) {
				Print_Text( 190, 30, "d PLAYER WINS! d", 0.5 );
				set_global_volume( 2 );
				Play_Sound( SoundWin );
				set_global_volume( 1 );
				sleep( 60 );
			}
			//Get re-intialization ready
			StartFlag = 0;
			EndFlag = 1;
		}

		//-----------------------------------------------------
		// End
		//-----------------------------------------------------

		end_frame();
	}
}


