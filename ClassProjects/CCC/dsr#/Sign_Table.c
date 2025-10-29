//How to use:
//./name "+" 1 5 6 7

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned numDigits(const unsigned n) {
	if (n < 10) return 1;
	return 1 + numDigits(n / 10);
}

int main(int argc, char **argv)
{
	char * sign = NULL;					//The operation sign (+,-,*,/,%)
	char * rowlower = NULL;				//Row lower bound
	char * rowupper = NULL;				//Row upper bound
	char * collower = NULL;				//Column lower bound
	char * colupper = NULL;				//Column upper bound

	if(argc == 1) {						//If no argument then set all values to default values
		argv[1] = "*";
		argv[2] = argv[4] = "1";
		argv[3] = argv[5] = "9";
	}
	if(argc == 2) {						//If no range argument then set all range values to default values
		argv[2] = argv[4] = "1";
		argv[3] = argv[5] = "9";
	}
	if(argc == 3) {						//If no row upper, column lower, and column upper bounds then set those values to default values
		argv[4] = "1";
		argv[3] = argv[5] = "9";
	}
	if(argc == 4) {						//If no column lower, and column upper bounds then set those values to default values
		argv[4] = "1";
		argv[5] = "9";
	}
	if(argc == 5) {						//If no column upper bound then set that value to default value
		argv[5] = "9";
	}

//--Setting variables equal to command line inputs
	sign = argv[1];
	rowlower = argv[2];
	rowupper = argv[3];
	collower = argv[4];
	colupper = argv[5];

//--Make number command line inputs into ints
	int rowlo = atoi (rowlower);
	int rowup = atoi (rowupper);
	int collo = atoi (collower);
	int colup = atoi (colupper);

//--Operation sign variables for strcmp use
	char* plus = "+";
	char* sub = "-";
	char* mult = "*";
	char* div = "/";
	char* rem = "%";

	///////////////////////////////////////////////////////
	//
	// Errors
	//
	///////////////////////////////////////////////////////

	if( argc > 6 ) {
		fprintf(stderr, "ERROR: Too many arguments\n" );
		exit(1);
	}
	if( strcmp(sign,plus) != 0 && strcmp(sign,sub) != 0 && strcmp(sign,mult) != 0 && strcmp(sign,div) != 0 && strcmp(sign,rem) != 0 ) {
		fprintf(stderr, "ERROR: invalid operartion\n" );
		exit(1);
	}
	if( rowlo < 0 || rowlo > 15 ) {
		fprintf(stderr, "ERROR: invalid row lower bound\n" );
		exit(1);
	}
	if( rowup < 0 || rowup > 15 ) {
		fprintf(stderr, "ERROR: invalid row upper bound\n" );
		exit(1);
	}
	if( collo < 0 || collo > 15 ) {
		fprintf(stderr, "ERROR: invalid column lower bound\n" );
		exit(1);
	}
	if( colup < 0 || colup > 15 ) {
		fprintf(stderr, "ERROR: invalid column upper bound\n" );
		exit(1);
	}
	if( rowlo > rowup ) {
		fprintf(stderr, "ERROR: invalid range in row\n" );
		exit(1);
	}
	if( collo > colup ) {
		fprintf(stderr, "ERROR: invalid range in column\n" );
		exit(1);
	}

	///////////////////////////////////////////////////////
	//
	// Print Math
	//
	///////////////////////////////////////////////////////

//--Getting the max num that wil be in the table (if + and 10 * 10 then maxnum == 100)
	int i = 0;
	int maxnum = 0;
	if( strcmp(sign,plus) == 0 ) {
		maxnum = colup + rowup;
	}
	if( strcmp(sign,sub) == 0 ) {
		maxnum = colup - rowup;
		maxnum = abs(maxnum);
	}
	if( strcmp(sign,mult) == 0 ) {
		maxnum = colup * rowup;
	}
	if( strcmp(sign,div) == 0 ) {
		maxnum = colup / rowup;
	}
	if( strcmp(sign,rem) == 0 ) {
		maxnum = colup % rowup;
	}
	
	int maxln = numDigits(maxnum);				//How many numbers are in the maxnum (if maxnum == 100 then maxln == 3)
	int rowupln = numDigits(rowup);				//How many numbers ar ein the row upper bound
	int rowrangenum = rowup - rowlo + 1;		//How many numbers are in the range (f range is 1 9 then there are 9 numbers)
	int rowrange[rowrangenum];
	int r = 0;
	for( i = rowlo; i <= rowup; i++ ) {			//Putting the range numbers into an array
		rowrange[r] = i;
		r++;
	}
	int colupln = numDigits(colup);				//How many numbers ar ein the column upper bound
	int colrangenum = colup - collo + 1;		//How many numbers are in the range (f range is 1 9 then there are 9 numbers)
	int colrange[colrangenum];
	int c = 0;
	for( i = collo; i<= colup; i++ ) {			//Putting the range numbers into an array
		colrange[c] = i;
		c++;
	}
	int g = 0;

	///////////////////////////////////////////////////////
	//
	// Print Time
	//
	///////////////////////////////////////////////////////

//--Printing the space before the sign, the sign, and equally spaced numbers in the column range
	printf("%*s", maxln + colupln, " ");
	printf("%s |", sign); 
	for( i = 0; i < colrangenum; i++ ) {
		printf("%*d", maxln + colupln + 1, colrange[i] );
	}
	printf("\n");

//--Printing -'s before the +, printing the +, printing the -'s after the + until the end of the spaced out column range
	for( i = 0; i <= maxln + colupln + 1; i++ ) {
		printf("%s", "-");
	}
	printf("%s", "+");
	for( i = 0; i <= ( (maxln + colupln + 1) * colrangenum) - 1; i++) {
		printf("%s", "-");
	}
	printf("\n");

//--Printing the table
	for( i = 0; i < rowrangenum; i++ ) {
		if( rowrange[i] > 9 ) {
			printf("%*s", maxln + colupln - 1, " ");
		} else {
			printf("%*s", maxln + colupln, " ");
		}
		printf("%d |", rowrange[i]);
		for( g = 0; g < colrangenum; g++ ) {
			if( strcmp(sign,plus) == 0 ) {
				printf("%*d", maxln + colupln + 1, colrange[g] + rowrange[i]);
			}
			if( strcmp(sign,sub) == 0 ) {
				printf("%*d", maxln + colupln + 1, colrange[g] - rowrange[i]);
			}
			if( strcmp(sign,mult) == 0 ) {
				printf("%*d", maxln + colupln + 1, colrange[g] * rowrange[i]);
			}
			if( strcmp(sign,div) == 0 ) {
				if( colrange[g] == 0 || rowrange[i] == 0 ) {
					printf("%*s", maxln + colupln + 1, "NA");
				}
				if( colrange[g] != 0 && rowrange[i] != 0 ) {
					printf("%*d", maxln + colupln + 1, colrange[g] / rowrange[i]);
				}
			}
			if( strcmp(sign,rem) == 0 ) {
				if( colrange[g] == 0 || rowrange[i] == 0 ) {
					printf("%*s", maxln + colupln + 1, "NA");
				}
				if( colrange[g] != 0 && rowrange[i] != 0 ) {
					printf("%*d", maxln + colupln + 1, colrange[g] / rowrange[i]);
				}
			}
		}
		printf("\n");
	}

	printf("\n");
}
