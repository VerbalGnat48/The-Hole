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
	int CardStack;
	int MoveTimer	= 0;
	int GrabTimer	= 0;
	int GrabedFlag	= 0;

	int temp;

	List *mylist = NULL;
	mylist = mklist();

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

	//Shuffle 5
	count = 1;
	GameObject[30] bean;
	//Make an Array with values in sequential order
	for( index = 1; index <= 26; index++ ) {
		bean[index].RID = index;
	}
	//Re-arrange values
	for( index = 26; index > 0; index-- ) {
		random = ( rand() % (index+1) ) + 1;
		temp = bean[index].RID;
		bean[index].RID = bean[random].RID;
		bean[random].RID = temp;
	}
	//Make the Player Suits
	X = 28;
	Y = 48;
	for( index = 1; index <= 26; index++ ) {
		Card = mknode( true, X,Y, 1,1, 55,95, 1,bean[index].RID, 55 );
		mylist = append( mylist, mylist -> end, Card );
		X += 56;
		if( index % 10 == 0 ) {
			X = 28;
			Y += 96;
		}
	}

	//Make the Selector
//	( bool Alive, int X,int Y, int XScale,int YScale, int Width,int Height, int TID,int RID, int BC )
	Select = mknode( true, 360,180, 1,1, 55,95, 1,59, 59 );
	mylist = append( mylist, mylist -> end, Select );
	Select -> ref = mylist -> end -> prev;
	Select -> X = Select -> ref -> X;
	Select -> Y = Select -> ref -> Y;



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
			if( GrabedFlag == 0 && Select -> ref -> prev != NULL ) {
				Select -> X = Select -> ref -> prev -> X;
				Select -> Y = Select -> ref -> prev -> Y;
				Select -> ref = Select -> ref -> prev;
			}
			else if( GrabedFlag == 1 && Select -> ref2 != NULL ){
				//Get Backup refX/Y
				AltX = Select -> ref -> X;
				AltY = Select -> ref -> Y;

				//Set up refX to ref2X before ref2 becomes it's prev
				Select -> ref -> X = Select -> ref2 -> X;
				Select -> ref -> Y = Select -> ref2 -> Y;
				Select -> X = Select -> ref -> X;
				Select -> Y = Select -> ref -> Y;

				//Give ref2X/Y old refX/Y
				Select -> ref2 -> X = AltX;
				Select -> ref2 -> Y = AltY;

				//Update ref2
				Select -> ref2 = Select -> ref2 -> prev;
			}
			MoveTimer = 0;
		}
		//Move Right
		else if( gamepad_right() > 0 && MoveTimer >= 15 ) {
			if( GrabedFlag == 0 && Select -> ref -> next != mylist -> end ) {
				Select -> X = Select -> ref -> next -> X;
				Select -> Y = Select -> ref -> next -> Y;
				Select -> ref = Select -> ref -> next;
			}
			else if( GrabedFlag == 1 && Select -> ref2 != mylist -> end -> prev ) {
				//Get Backup refX/Y
				AltX = Select -> ref -> X;
				AltY = Select -> ref -> Y;

				//Set up refX to ref2X before ref2 becomes it's next
				Select -> ref -> X = Select -> ref2 -> next -> X;
				Select -> ref -> Y = Select -> ref2 -> next -> Y;
				Select -> X = Select -> ref -> X;
				Select -> Y = Select -> ref -> Y;

				//Update ref2
				Select -> ref2 = Select -> ref2 -> next;

				//Give ref2X/Y old refX/Y
				Select -> ref2 -> X = AltX;
				Select -> ref2 -> Y = AltY;
			}
			MoveTimer = 0;
		}
		else if( gamepad_button_start() > 0 && GrabTimer >= 15 ) {
			if( GrabedFlag == 1 ) {
				if( Select -> ref2 != NULL ) {
					mylist = append( mylist, Select -> ref2, Select -> ref );
				}
				else if( Select -> ref2 == NULL ) {
					mylist = insert( mylist, mylist -> start, Select -> ref );
				}
				GrabedFlag = 0;
				GrabTimer = 0;
			}
			else if( GrabedFlag == 0 ) {
				if( Select -> ref -> prev != NULL ) {
					Select -> ref2 = Select -> ref -> prev;
				}

				mylist = obtain( mylist, &Select -> ref );
				GrabedFlag = 1;
				GrabTimer = 0;
			}
		}
		MoveTimer += 1;
		GrabTimer += 1;

		//List
		Card = NULL;
		Card = mylist -> start;
		while( Card != mylist -> end ) {
			select_texture( Card -> TID );
			select_region( Card -> RID );
			set_drawing_scale( Card -> XScale, Card -> YScale );
			draw_region_zoomed_at( Card -> X, Card -> Y );
			Card = Card -> next;
		}

		//Grabed Card
		if( GrabedFlag == 1 ) {
			select_texture( Select -> ref -> TID );
			select_region( Select -> ref -> RID );
			set_drawing_scale( Select -> ref -> XScale, Select -> ref -> YScale );
			draw_region_zoomed_at( Select -> ref -> X, Select -> ref -> Y );
		}

		//Selector Card
		select_texture( Select -> TID );
		select_region( Select -> RID );
		set_drawing_scale( Select -> XScale, Select -> YScale );
		draw_region_zoomed_at( Select -> X, Select -> Y );



		itoa( Select -> ref2 -> RID, Statement, 10 );
		print_at( 40, 300, Statement );
		itoa( Select -> ref2 -> next -> RID, Statement, 10 );
		print_at( 160, 300, Statement );
		itoa( Select -> ref -> RID, Statement, 10 );
		print_at( 40, 320, Statement );
		itoa( mylist -> start -> RID, Statement, 10 );
		print_at( 160, 320, Statement );

		end_frame();
	}
}


