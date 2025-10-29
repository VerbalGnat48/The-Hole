////////// Discrete Skills Review! //////////

This shows the various iterations of my dsr journey.

These projects are time based projects. Here you do some activity like adding numbers together in different bases or using bitwise logic. You get 12 questions and then after you are done you have to wait X amount of time afterwards to continue. This is meant to teach time management skills.

Was made in the Fall, 2024 from 09/19 -> 10/09 with each version being a differnt week during that time.

Made in Bash.

////////// dsr objectives //////////

Sign_Table - A chart of any acceptable sign with a range of numbers.

Mult_Table - A multiplication chart of different bases up until a given number.

dsr0 - Influenced by the unix/usr0 'urev' skills review activity, create a program that does the same but for powers of 2 base math and conversions. This does not have to be written for Vircon32, nor does it specifically have to be in C.

dsr1 - Influenced by the unix/usr0 'urev' skills review activity, and discrete/dsr0, create a program that does the same but for bitwise logic on nibble-sized groups of binary values ranging from 4 to 16 bits. This does not have to be written for Vircon32, nor does it specifically have to be in C.

////////// How to use //////////

Sign Table for example: "./Sign_Table "+" 1 5 2 9"
	-Break Down: Program Name, Sign, Lower Row Range, Upper Row Range, Lower Column Range, Ipper Column Range.
 
	-Can work without any arguments or some.
		-Yes: "./Sign_Table" or "./Sign_Tabele "/" " or "./Sign_Table "+" 1 4"
		-No: "./Sign_Table "" 1 5" or "./Sign_Table "+" 5 1"

	-Acceptable signs: "+,-,*,/,%" or better known as add, subtract, multiply, divide, mod.
	-Row: "1 5" are the lower and upper bound for the rows/left side.
	-Column: "2 9" are the lower and upper bound for the columns/top row.

Mult Table for example: "./Mult_Table 10 5"
	-Break Down: Program Name, Base, ENd Value

	-Can work without any arguments or some.
		-Yes: "./Mult_Table 2 8" or "./Mult_Table 5" or "./Mult_Table"
		-No: "./Mult_Table 1"

dsr0: "./dsr0"

dsr1: "./dsr1"

Can be reset using ./dsr# clear
