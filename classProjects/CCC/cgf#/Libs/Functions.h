//Alphabet Stuff
#define CharWidth			32
#define CharHeight			32
#define CharSepX			1
#define CharSepY			8

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

//Take cards off the first shuffled dec and onto the provided deck
void Give_Card( Stack* New_Stack, Stack* Old_Stack,  int X, int Y )
{
	if( Old_Stack != NULL ) {
		//Get Card and put onto the Stack
		GameObject* tmp = Old_Stack -> top;
		Old_Stack = pop( Old_Stack, &tmp );
		if( New_Stack -> top -> RID != 61 ) {
			New_Stack -> X += X;
			New_Stack -> Y += Y;
		}
		tmp -> X = New_Stack -> X;
		tmp -> Y = New_Stack -> Y;
		New_Stack = push( New_Stack, tmp );
		GrabTimer = 0;
	}
}

//Give_Card but in a for loop
void Give_Cards( Stack* New_Stack, Stack* Old_Stack, int X, int Y, int Max )
{
	if( Max <= Old_Stack -> data -> QTY && New_Stack -> data -> QTY + Max <= New_Stack -> size ) {
		for( int index = 0; index<Max; index++ ) {
			Give_Card( New_Stack, Old_Stack, X, Y );
		}
	}
}

//Print all of a stack
void Print_Stack( Stack* Stack )
{
	GameObject* Card = Stack -> data -> start;
	while( Card != NULL ) {
		select_texture( Card -> TID );
		select_region( Card -> RID );
		set_drawing_scale( Card -> XScale, Card -> YScale );
		draw_region_zoomed_at( Card -> X, Card -> Y );
		Card = Card -> next;
	}
}

//Print a singular card, with a flag toprint the back of it or not
void Print_Card( GameObject* Card, bool BackFlag )
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

//itoa, print_at but one line
void Print_Value( int Value, int X, int Y )
{
	itoa( Value, Statement, 10 );
	print_at( X, Y, Statement );
}

//How to Print custom font
void Print_Text( float LeftX, float BaselineY, int* Text, float Scale, int TexID )
{
	select_texture( TexID );
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
		++Text;
	}
}

//Play Sound
void Play_Sound( int ID )
{
	select_sound( ID );
	play_sound( ID );
}

//Where the stack sits
void Stack_Pos( Stack* Stack, int X, int Y )
{
	Stack -> X	= X;
	Stack -> Y	= Y;
}

void Empty_Stack( Stack* mystack )
{
	GameObject* tmp = mknode( true, mystack -> X, mystack -> Y, 1,1, 55,95, 1,61, 60 );
	mystack = push( mystack, tmp );
}

void Move_Stack( Stack *mystack, int X, int Y )
{
	GameObject* tmp = mystack -> data -> start -> next;
	while( tmp != NULL ) {
		tmp -> X = tmp -> prev -> X + X;
		tmp -> Y = tmp -> prev -> Y + Y;
		tmp = tmp -> next;
	}
}

//Place Cards that are in the Players Hand
void Place_Cards( Stack* mystack, GameObject* mynode )
{
	int Blank = 0;
	while( mystack -> data -> start -> next != NULL ) {
		GameObject* tmp = mystack -> data -> start -> next;
		int Value = mystack -> StackRef -> type;
		if( mystack -> StackRef -> top -> RID == 61 && Blank == 0 || Value == 1 || Value == 2 ) {
			tmp -> X = mynode -> ref -> X;
			tmp -> Y = mynode -> ref -> Y;
			Blank = 1;
		}
		else if( Blank == 1 ) {
			Move_Stack( mystack, 0, 17 );
		}
		mystack -> data = obtain( mystack -> data, &tmp );
		mystack -> StackRef = push( mystack -> StackRef, tmp );
		mystack -> data -> QTY -= 1;
	}
	mystack -> top = mynode;
	mynode -> ref = mystack -> StackRef -> top;
	GrabTimer = 0;
	GrabFlag = 0;
}

//Count the amoutn of Cards that the hand wants to grab
int Card_Count( GameObject* mynode, int CardCount )
{
	while( mynode != NULL ) {
		CardCount += 1;
		mynode = mynode -> next;
	}
	return CardCount;
}

//Get the amount of cards that the player can grab
int Grab_Amount( Stack* mystack, int Max )
{
	while( mystack -> type == 1 ) {
		if( mystack -> top -> RID != 61 ) {
			Max -= 1;
		}
		mystack = mystack -> next;
	}
	return Max;
}

//Check if cards you want to grab are in alternate suit, sequential order
int Grab_Check( GameObject* mynode )
{
	int Flag	= 0;
	while( mynode -> next != NULL ) {
		int Nrid13 = mynode -> next -> RID % 13;
		if( Nrid13 == 0 ) {
			Nrid13 = 13;
		}
		if( Nrid13 != mynode -> RID % 13 - 1 ) {
			Flag = 1;
		}
		mynode = mynode -> next;
	}
	return Flag;
}

int End_Check( Stack* mystack )
{
	int Count = 5;
	if( mystack -> data -> start -> next != NULL ) {
		if( mystack -> data -> start -> next -> next != NULL ) {
			GameObject* mynode = mystack -> data -> start -> next -> next;
			Count = 0;
			while( mynode != NULL ) {
				int Prid13 = mynode -> prev -> RID % 13;
				if( Prid13 == 0 ) {
					Prid13 = 13;
				}
				int Crid13 = mynode -> RID % 13;
				if( Crid13 == 0 ) {
					Crid13 = 13;
				}
				if( Crid13 + 1 != Prid13 ) {
					Count = 1;
				}
				mynode = mynode -> next;
			}
		}
	}
	else if( mystack -> top -> RID == 61 ) {
		Count = 0;
	}
	return Count;
}


//Grab Cards
void Grab_Cards( Stack* mystack, GameObject* mynode, int Count )
{
	while( Count != 0 ) {
		tmp = mynode -> ref -> next;
		while( tmp != NULL ) {
			tmp -> Y -= 17;
			tmp = tmp -> next;
		}
		if( mynode -> ref -> next != NULL ) {
			tmp = mynode -> ref -> next;
		}
		else if( mynode -> ref -> RID != 61 ) {
			tmp = mynode -> ref -> prev;
		}
		mystack -> StackRef = pop( mystack -> StackRef, &mynode -> ref );
		mystack = push( mystack, mynode -> ref );
		mynode -> ref = tmp;
		Count -= 1;
	} 
}

void Placement( Stack* mystack, GameObject* mynode )
{
	Total = 0;
	//Place Card on Home Cell
	if( mystack -> StackRef -> type == 2 && CardCount == 1 ) {
		if( mynode -> ref -> RID == 61 && SelectMod13 == 1 ) {
			Total = 1;
			Place_Cards( mystack, mynode );
		}
		else if( mynode -> ref -> RID + 1 == mystack -> data -> start -> next -> RID ) {
			Total = 1;
			Place_Cards( mystack, mynode );
		}
	}
	//Place on Game Satcks
	if( mystack -> StackRef -> type == 3 ) {
		if( temp % 13 != 0 ) {
			//Place Black on Blue
			if( RefMod13 - 1 == temp % 13 && mynode -> ref -> RID <= 26 && mystack -> data -> start -> next -> RID > 26 ) {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
			//Place Blue on Black
			else if( RefMod13 - 1 == temp % 13 && mynode -> ref -> RID > 26 && mystack -> data -> start -> next -> RID <= 26 )  {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
			else if( mynode -> ref -> RID == 61 ) {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
		}
		else if( temp % 13 == 0 ) {
			temp = 13;
			//Place Black on Blue
			if( RefMod13 - 1 == temp && mynode -> ref -> RID <= 26 && mystack -> data -> start -> next -> RID > 26 ) {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
			//Place Blue on Black
			else if( RefMod13 - 1 == temp && mynode -> ref -> RID > 26 && mystack -> data -> start -> next -> RID <= 26 )  {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
			else if( mynode -> ref -> RID == 61 ) {
				Total = 1;
				Place_Cards( mystack, mynode );
			}
		}
	}
	//Place Card on Blank Free Cell
	else if( mynode -> ref -> RID == 61 && CardCount == 1 && mystack -> StackRef -> type == 1 ) {
		Total = 1;
		Place_Cards( mystack, mynode );
	}
}

void Placement_Check( Stack* Point, Stack* mystack, GameObject* mynode )
{
	int Value;
	do {
		mystack -> StackRef = Point;
		mynode -> ref = Point -> top;

		//Move the Player Hand Stack as we go through the other Stacks
		mystack -> X = mystack -> StackRef -> top -> X;
		mystack -> Y = mystack -> StackRef -> top -> Y;
		mynode -> X = mystack -> StackRef -> top -> X;
		mynode -> Y = mystack -> StackRef -> top -> Y;
		Move_Stack( mystack, 0, 17 );

		RefMod13 = mynode -> ref -> RID % 13;
		if( RefMod13 == 0 ) {
			RefMod13 = 13;
		}
		CardCount = Card_Count( mystack -> data -> start -> next, 0 );
		SelectMod13 = mystack -> data -> start -> next -> RID % 13;
		type = mystack -> StackRef -> type;

		//Where to Place Cards in Player Hand
		if( mystack -> top -> RID != 61 ) {
			Placement( mystack, mynode );
		}

		Value = mystack -> StackRef -> type;
		Point = Point -> next;
	}
	while( Point != NULL && Total == 0 );

	//Move Selector to new top
	mynode -> ref = mystack -> StackRef -> top;
	mystack -> X = mystack -> StackRef -> top -> X;
	mystack -> Y = mystack -> StackRef -> top -> X;
	mynode -> X = mystack -> StackRef -> top -> X;
	mynode -> Y = mystack -> StackRef -> top -> Y;
	Move_Stack( mystack, 0, 17 );
}










