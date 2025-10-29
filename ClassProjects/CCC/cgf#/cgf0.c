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

//Define Regions
#define RegionTable			0
#define RegionPlayer_Suits	0
#define RegionEnemy_Suits	0

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
#define RegionBack			54
#define RegionM_Back		55
#define RegionJ_Back		56
#define RegionG_Back		57
#define RegionK_Back		58
#define RegionSelect		59

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

Stack *Lstack = NULL;
Stack *Rstack = NULL;

void Stack_Place( int Number, GameObject* Card )
{
	if( Number == 1 ) {
		Lstack = push( Lstack, Card );
	}
	else if( Number == 2 ) {
		Rstack = push( Rstack, Card );
	}
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

	//-----------------------------------------------------
	// Initializations
	//-----------------------------------------------------

	//Gamepad
	select_gamepad( 0 );

	//Random Number Generator
	srand( get_time() );

	int X;
	int Y;
	int AltX;
	int AltY;
	int[30] Statement;
	int ButtonPress;
	int index;
	int jndex;
	int random;
	int count		= 0;

	int MaxCards	= 52;
	int MaxStacks	= 2;
	int CardStack;
	int MoveTimer	= 0;
	int GrabTimer	= 0;
	int GrabedFlag	= 0;

	int temp;

	//-----------------------------------------------------
	// Game Initializations
	//-----------------------------------------------------

	//Rand
	srand( get_time() );

	//Make the Shit
	GameObject *Select	= NULL;
	GameObject *Card	= NULL;
	GameObject *tmp		= NULL;
	GameObject *kmp		= NULL;
	GameObject *lmp		= NULL;

	Lstack = mkstack(0);
	Rstack = mkstack(0);

	//Shuffle 5
	count = 1;
	GameObject[52] bean;
	//Make an Array with values in sequential order
	for( index = 1; index <= MaxCards; index++ ) {
		bean[index].RID = index;
	}
	//Re-arrange values
	for( index = MaxCards; index > 0; index-- ) {
		random = ( rand() % (index+1) ) + 1;
		temp = bean[index].RID;
		bean[index].RID = bean[random].RID;
		bean[random].RID = temp;
	}
	//Make the bean
	for( index = 1; index <= MaxCards; index++ ) {
		if( bean[index].RID <= 26 ) {
			Card = mknode( true, 260,180, 1,1, 55,95, 1,bean[index].RID, 55 );
			Lstack = push( Lstack, Card );
		}
		else if( bean[index].RID > 26 && bean[index].RID <= 52 ) {
			Card = mknode( true, 260,180, 1,1, 55,95, 2,bean[index].RID, 55 );
			Lstack = push( Lstack, Card );
		}
	}

	//Make the Selector
//	( bool Alive, int X,int Y, int XScale,int YScale, int Width,int Height, int TID,int RID, int BC )
	Select = mknode( true, 360,180, 1,1, 55,95, 1,59, 59 );
	Select -> X = Lstack -> top -> X;
	Select -> Y = Lstack -> top -> Y;
	Select -> StackVal = 1;
	Select -> ref = NULL;



	//-----------------------------------------------------
	// Game Loop
	//-----------------------------------------------------

	while( true )
	{
		clear_screen( color_black );

		//Draw Table
		set_drawing_scale( 1,1 );
		select_texture( TextureTable );
		select_region( RegionTable );
		draw_region_at( 0,0 );

		//Inputs/Movement
		int WalkX, WalkY;
		gamepad_direction( &WalkX, &WalkY );

		//Move Left
		if( gamepad_left() > 0 && MoveTimer >= 15 ) {
			Select -> X -= 120;								//Selector Card's X Value
			Select -> ref -> X -=120;						//Selected Card's X Value
			Select -> StackVal -= 1;						//Which Stack are we on
			//If StackVal is < Left most Stack then go to Right most Stack
			if( Select -> StackVal < 1 ) {
				Select -> StackVal = MaxStacks;
				Select -> X = Rstack -> top -> X;
				Select -> ref -> X= Rstack -> top -> X;
			}
			MoveTimer = 0;
		}
		//Move Right
		else if( gamepad_right() > 0 && MoveTimer >= 15 ) {
			Select -> X += 120;								//Selector Card's X Value
			Select -> ref -> X += 120;						//Selected Card's X Value
			Select -> StackVal += 1;						//Which Stack are we on
			//If StackVal is > Right most Stack then go to Left most Stack
			if( Select -> StackVal > MaxStacks ) {
				Select -> StackVal = 1;
				Select -> X = Lstack -> top -> X;
				Select -> ref -> X = Lstack -> top -> X;
			}
			MoveTimer = 0;
		}
		else if( gamepad_button_start() > 0 && GrabTimer >= 15 ) {
			if( GrabedFlag == 1 ) {
				Stack_Place( Select -> StackVal, Select -> ref );
				Select -> ref = NULL;
				GrabedFlag = 0;
				GrabTimer = 0;
			}
			else if( GrabedFlag == 0 ) {
				if( Select -> StackVal == 1 && Lstack -> top != NULL ) {
					Select -> ref = Lstack -> top;
					Lstack = pop( Lstack, &Select -> ref );
					GrabedFlag = 1;
					GrabTimer = 0;
				}
				else if( Select -> StackVal == 2 && Rstack -> top != NULL ) {
					Select -> ref = Rstack -> top;
					Rstack = pop( Rstack, &Select -> ref );
					GrabedFlag = 1;
					GrabTimer = 0;
				}
			}
		}
		MoveTimer += 1;
		GrabTimer += 1;

		//Lstack
		Card = Lstack -> top;
		select_texture( Card -> TID );
		select_region( Card -> RID );
		set_drawing_scale( Card -> XScale, Card -> YScale );
		draw_region_zoomed_at( Card -> X, Card -> Y );

		//Rstack
		Card = Rstack -> top;
		select_texture( Card -> TID );
		select_region( Card -> RID );
		set_drawing_scale( Card -> XScale, Card -> YScale );
		draw_region_zoomed_at( Card -> X, Card -> Y );


		//Selector -> ref Card
		tmp = Select -> ref;
		select_texture( tmp -> TID );
		select_region( tmp -> RID );
		set_drawing_scale( tmp -> XScale, tmp -> YScale );
		draw_region_zoomed_at( tmp -> X, tmp -> Y );

		//Selector Card
		select_texture( Select -> TID );
		select_region( Select -> RID );
		set_drawing_scale( Select -> XScale, Select -> YScale );
		draw_region_zoomed_at( Select -> X, Select -> Y );

//		itoa( Select -> StackVal, Statement, 10 );
//		print_at( 40, 280, Statement );

		end_frame();
	}
}


