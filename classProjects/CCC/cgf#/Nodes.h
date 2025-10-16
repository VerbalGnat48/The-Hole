
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
// Structs and Functions
//-----------------------------------------------------
struct GameObject
{
	bool Alive;
	int RID;			//Region Number
	int TID;			//Texture ID
	int X, Y;			//Objects Center
	int Width, Height;	//Hitbox
	int XScale;
	int YScale;
	int BC;
	int StackVal;
	GameObject *next;
	GameObject *prev;
	GameObject *ref;
	GameObject *ref2;
};

struct List
{
	GameObject *start;
	GameObject *end;
};

struct Stack
{
    GameObject *top;
    List *data;
    int	size;
};

//-----------------------------------------------------
// mknode
//-----------------------------------------------------
GameObject *mknode ( bool Alive, int X,int Y, int XScale,int YScale, int Width,int Height, int TID,int RID, int BC )
{
	GameObject *new_node = NULL;
	new_node = malloc(sizeof(GameObject));
	if( new_node == NULL ) {
		clear_screen( 0xFF4141BD );							//Excadrill Red
		set_drawing_point(25, 100);
		print( "ERROR! FAILED TO ALLOCATE MEMORY" );
		end_frame();
		return NULL;
	}
	new_node -> Alive	= Alive;
	new_node -> RID 	= RID;
	new_node -> TID 	= TID;
	new_node -> X		= X;
	new_node -> Y		= Y;
	new_node -> XScale	= XScale;
	new_node -> YScale	= YScale;
	new_node -> Width	= Width * XScale;
	new_node -> Height	= Height * YScale;
	new_node -> BC		= BC;
	new_node -> next = NULL;
	new_node -> prev = NULL;
	return new_node;
}

//-----------------------------------------------------
// mklist
//-----------------------------------------------------
List *mklist()
{
	List *mylist;
	mylist = malloc(sizeof(List));
	mylist -> start	= NULL;
	mylist -> end	= NULL;
	return mylist;
}

//-----------------------------------------------------
// append
//-----------------------------------------------------
//Object, Next -> Object, New_Node, Next
List *append( List* mylist, GameObject* object, GameObject* new_node )
{
	//Start
	if( mylist -> start == NULL ) {	
		mylist -> start = new_node;
		mylist -> end = new_node;
		new_node -> next = NULL;
		new_node -> prev = NULL;
	}
	//End
	else if( object == mylist -> end ) {
		//New_Node
		mylist -> end -> next = new_node;
		mylist -> end = new_node;
		new_node -> prev = object;
		new_node -> next = NULL;
		//Before New_Node
		object -> next = new_node;
	//Middle
	} else {
		//New_Node
		new_node -> prev = object;
		new_node -> next = object -> next;
		//After New_Node
		GameObject *tmp = NULL;
		tmp = object -> next;
		tmp -> prev = new_node;
		//Before New_Node
		object -> next = new_node;
	}
	return mylist;
}

//-----------------------------------------------------
// insert
//-----------------------------------------------------
//Prev, Object -> Prev, New_Node, Object
List *insert( List* mylist, GameObject* object, GameObject* new_node )
{
	//Start
	if( mylist -> start == NULL ) {
		mylist -> start = new_node;
		mylist -> end = new_node;
		new_node -> next = NULL;
		new_node -> prev = NULL;
	}
	//Start 2
	else if( object == mylist -> start ) {
		//New_Node
		mylist -> start = new_node;
		new_node -> next = object;
		new_node -> prev = NULL;
		//After New_Node
		object -> prev = new_node;
	//Middle
	} else {
		GameObject *tmp = NULL;
		//Before New_Node
		tmp = object -> prev;
		tmp -> next = new_node;
		new_node -> prev = tmp;
		//After New_Node
		new_node -> next = object;
		object -> prev = new_node;
	}
		
	return mylist;
}

//-----------------------------------------------------
// obtain
//-----------------------------------------------------
List *obtain( List *mylist, GameObject** Forsaken_Node )
{
	GameObject *tmp = NULL;
	if( mylist != NULL ) {
		//Last Case Node
		if( (*Forsaken_Node) == mylist -> end ) {
			mylist -> end = (*Forsaken_Node) -> prev;
			mylist -> end -> next = NULL;
			if ( (*Forsaken_Node) == mylist -> start ) {
				mylist -> start = (*Forsaken_Node) -> next;
				mylist -> start -> prev = NULL;
			}
		}
		//First Case Node
		else if( (*Forsaken_Node) == mylist -> start ) {
			mylist -> start = (*Forsaken_Node) -> next;
			mylist -> start -> prev = NULL;
		//Middle Case Node
		} else {
			tmp = NULL;
			//Remove Around Forsaken_Node
			tmp = (*Forsaken_Node) -> prev;
			tmp -> next = (*Forsaken_Node) -> next;
			tmp -> next -> prev = tmp;
		}
		//Set Forsaken_Node's directions to NULL
		(*Forsaken_Node) -> next = NULL;
		(*Forsaken_Node) -> prev = NULL;
	}
	return mylist;
}

//-----------------------------------------------------
// rmnode
//-----------------------------------------------------
GameObject *rmnode( GameObject* Forsaken_Node )
{
	if( Forsaken_Node != NULL ) {
		Forsaken_Node -> next = NULL;
		free(Forsaken_Node);
		Forsaken_Node = NULL;
	}
	return Forsaken_Node;
}

//-----------------------------------------------------
// clearlist
//-----------------------------------------------------
List *clearlist( List* mylist )
{
	GameObject *tmp = NULL;
	tmp = mylist -> start;
	while( tmp != NULL ) {
		mylist = obtain( mylist, &tmp );
		tmp = rmnode( tmp );
		tmp = mylist -> start;
	}
	return mylist;
}

//-----------------------------------------------------
// rmlist
//-----------------------------------------------------
List *rmlist( List* mylist )
{
	mylist = clearlist( mylist );
	free( mylist );
	mylist = NULL;
	return mylist;
}

//-----------------------------------------------------
// mkstack
//-----------------------------------------------------
Stack *mkstack( int number )
{
	Stack *mystack;
	mystack = malloc(sizeof(Stack));
	mystack -> size = number;
	mystack -> top = NULL;
	mystack -> data = mklist();
	return mystack;
}

//-----------------------------------------------------
// rmstack
//-----------------------------------------------------
Stack *rmstack( Stack *mystack )
{
	mystack -> data = clearlist( mystack -> data );
	mystack -> data = rmlist( mystack -> data );
	mystack = NULL;
	return mystack;
}

//-----------------------------------------------------
// pop
//-----------------------------------------------------
Stack *pop( Stack *mystack, GameObject** Forsaken_Node )
{
	mystack -> data = obtain( mystack -> data, Forsaken_Node );
	mystack -> top = mystack -> data -> end;
	return mystack;
}

//-----------------------------------------------------
// push
//-----------------------------------------------------
Stack *push( Stack *mystack, GameObject* Forsaken_Node )
{
	mystack -> data = append( mystack -> data, mystack -> top, Forsaken_Node );
	mystack -> top = mystack -> data -> end;
	return mystack;
}











