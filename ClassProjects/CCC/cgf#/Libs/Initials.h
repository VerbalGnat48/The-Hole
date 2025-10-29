//-----------------------------------------------------
// Structures
//-----------------------------------------------------
struct GameObject
{
	bool Alive;
	int RID;			//Region Number
	int TID;			//Texture ID
	int X, Y;			//Objects Center
	int Width, Height;	//Hitbox
	float XScale;
	float YScale;
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
	int QTY;
};

struct Stack
{
    GameObject *top;
    List *data;
    int	size;
	int X;
	int Y;
	Stack *next;
	Stack *prev;
	Stack *up;
	Stack *down;
	Stack *StackRef;
	int type;
};

struct StackList
{
	Stack *start;
	Stack *end;
};

//-----------------------------------------------------
// Intials
//-----------------------------------------------------
	int[30] Statement;
	GameObject[52] Shuffle;

	int index;
	int random;
	int Count		= 0;
	int Total		= 0;
	int CardCount	= 0;
	int type		= 0;

	int MaxCards	= 52;
	int MaxStacks	= 16;
	int GrabTimer	= 0;
	int MoveTimer	= 0;
	int MaxGrab		= 5;

	int temp;
	int SelectMod13	= 0;
	int SelectMod26	= 0;
	int RefMod13	= 0;
	int RefMod26	= 0;

	int GrabFlag	= 0;
	int StartFlag	= 0;
	int EndFlag		= 1;
	int StopFlag	= 0;
	int AutoFlag	= 0;

	int Size1		= 1;
	int Size2		= 1;
	int Size3		= 1;
	int Size4		= 1;
	int Size5		= 1;
	int Size6		= 1;
	int Size7		= 1;
	int Size8		= 1;

	int EndCount	= 0;

	GameObject* tmp;

	Stack *Cardstack = NULL;
	Stack *Selector	= NULL;

	Stack *Stack1	= NULL;
	Stack *Stack2	= NULL;
	Stack *Stack3	= NULL;
	Stack *Stack4	= NULL;
	Stack *Stack5	= NULL;
	Stack *Stack6	= NULL;
	Stack *Stack7	= NULL;
	Stack *Stack8	= NULL;

	Stack *Free1	= NULL;
	Stack *Free2	= NULL;
	Stack *Free3	= NULL;
	Stack *Free4	= NULL;
	Stack *Home1	= NULL;
	Stack *Home2	= NULL;
	Stack *Home3	= NULL;
	Stack *Home4	= NULL;
