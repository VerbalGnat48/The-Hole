#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

unsigned numDigits(const unsigned n) {
	if (n < 10) return 1;
	return 1 + numDigits(n / 10);
}

/////////////////////////////////////////////////
//
// Main
//
/////////////////////////////////////////////////

int main() // int argc, char **argv )
{
//--Random Numbers for divisor and dividend
	int i = 0;
	srand(time(NULL));
	int dsor = rand() % 999999 + 1000; 			//Random number between those two numbers
	int ddend = rand() % 999999999 + 1000000;

//--Int-alizing input
	int quotient = ddend/dsor;				//The quotient of the problem
	int xqc = numDigits(quotient);			//How many digits are in the quotient
	int xqb = xqc - 1;						//One less of how many digits in the quotient
	int dsorln = numDigits(dsor);			//Length of divisor
	int ddendln = numDigits(ddend);			//Length of dividend

	int n = ddendln;						//Temporary shorter variable name for ddendln
	char OperaGX[n+1];
//--Putting OperaGX into an array( flips number order)
	int d = ddend;							//Temporary shorter variable name for ddend
	for( i = 0; i < ddendln; i++) {
		OperaGX[i] = d % 10;
		d = d / 10;
	}
	int temp;								//Temporary varaiable to put array values in
//--Restore OperaGX to original number order
	for( i = 0; i<n/2; i++ ) {
		temp = OperaGX[i];
		OperaGX[i] = OperaGX[n-i-1];
		OperaGX[n-i-1] = temp;
	}
	for(i = 0; i < ddendln; i++) {
		OperaGX[i] = OperaGX[i] + 48; 		// turn OperaGX contents into ASCII characters
	}

//--Making an array of the quotient (backwards output)
	int c = 0;
	int quo[16];
	int q = quotient;
	int count = 0;
	for( c = 0; c < xqc; c++) {
		quo[c] = q % 10;
		q = q / 10;
	}
	int temps;								//Temporary varaiable to put array values in
//--Restore quo to original number order
	int u = numDigits(quotient);			//Temporary shorter variable name for xqc
	for( i = 0; i<u/2; i++ ) {
		temps = quo[i];
		quo[i] = quo[u-i-1];
		quo[u-i-1] = temps;
	}

//--Making array of the first subtraction value
	char subtraction[16];
	int dividend = 0;
	char subplus[16];														//Next number in dividend, if subtraction is 7735 then subplus is 77352
	dividend  = atoi(OperaGX);
	memcpy(subtraction, OperaGX, dsorln);
	int nsp = atoi (subtraction);											//Number subplus
	xqc = dsorln;															//qxc now becomes what number position of the dividend we need to bring down for carry's
	if( nsp % dsor >= nsp) {												//If divisor > nsp then nsp+1
		memset(subplus, 0, sizeof subplus);
		xqc = dsorln+1;
		memcpy(subtraction, OperaGX, xqc);
		nsp = atoi (subtraction);
	}

	int sub = 0;															//Int of string substraction
	int subc = 0;															//Sub count
	int insc = xqb;															//Inverse of subc that is used to line up the result correctly
	int result = 0;															//Output of an equation
	int nspcount = 0;														//Number subplus count
	int subcount = ddendln - xqc;											//How many subtractions that happen in the problem
	

	printf( "%*d\n", 4 + ddendln + dsorln, quotient);						//Where to print the quotient
	printf( "%*s", 3 + dsorln, "+");										//Where to print the + in the equation syntax
	for( i = 0; i < ( ddendln + 1 ); i++) {									//How long to print the -'s in the equation syntax
		printf( "%s", "-");
	}
	printf( "\n" );
	printf( "%*d |", 1 + dsorln, dsor);										//Where to print the divisor
	printf( "%*d\n", 1 + ddendln, ddend);									//Where to print the dividend

//--Print/Do the math until the number of subtractions meet the number of numbers in the quoteint - 1 since we start at 0
	for( i = 0; i < numDigits(quotient); i++) {
		if( ddend % nsp < ddend) {
			memset(subplus, 0, sizeof subplus);
			xqc = xqc + 1;
			sub = dsor*quo[i];												//What number is being subtracted
			result = nsp-sub;												//Result of subtraction
			subc = subc + 1;
			insc = insc - 1;
			int peach = insc + 1;											//Peach is subc without the original addition on line 108
			if( insc < 0 ) {												//Can't line up a number past the end of the dividend
				insc = 0;
			}
			int subn = numDigits(sub);										//Current amount of numbers in the current sub value

			memcpy(subplus, OperaGX, xqc);
			nsp = atoi (subplus);
			nsp = nsp % 10;													//Next number in the divisor after the original nsp (if nsp = 7753 then now it is 77532)
			nspcount = nspcount + 1;
			if( nspcount <= subcount + 1) {
				if( nspcount <= subcount ) {								//If result needs a carry, * by 10 and add the nsp in the ones place
					result = result * 10;
					result = result + nsp;
				}
				nsp = result;
				if( sub != 0 ) {
					printf( "%*s", 4 + dsorln + ddendln - peach - subn, "-");	//Where to print the subtraction sign
					printf( "%d\n", sub);										//Prints the sub after the subtraction sign
					printf( "%*s", 4 + dsorln + ddendln - peach - subn, " ");	//Space between the begining and where to print the first "="
					for( int j = 0; j < numDigits(sub); j++) {					//Prints as many "=" as there are sub numbers
						printf( "%s", "=");
					}
					printf("\n");
				}
				if( nsp >= dsor ) {
				printf( "%*d\n", 4 + dsorln + ddendln - insc, nsp);
				}
				if( nspcount == numDigits(quotient) ) {
					printf( "%*d\n", 4 + dsorln + ddendln - insc, nsp);
				}
			}
		}
	}			

	printf("\n");

	return (0);
}
