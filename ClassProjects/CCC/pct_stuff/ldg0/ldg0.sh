#!/usr/bin/env bash
if [[ ${@:1:10} == *"help"* ]]; then 
printf " 
 ldg0.sh - letter division generator script (wrapper around the long
   	       division generator provided with project resources). This
      	   script is to make letter division puzzles,  output in the
   	       class pctX format.

    usage: [VARIABLE...] ldg0.sh KEY DIVISOR DIVIDEND [OPTION...]

     KEY - will be the first argument (${1}), encoded in puzzle base
           and listed as a string, in ascending order from the  zero
           letter through the highest counting value letter.  If the
           string 'random' is present,  key will instead be randomly
           generated.'

 DIVISOR - will  be the  second  argument (${2}),  encoded in  puzzle
           base. If  instead 'random#' is  provided, where #  is some
           number  for  use as  the  length  of that  component,  the
           divisor  will end  up  being randomly  generated (to  that
           length).

DIVIDEND - will be the third argument (${3}),  encoded in the puzzle
           base. If instead 'random#' is provided,  where # is  some
           number for use as the length of that component, that will
           then indicate the dividend is to be randomly generated to
           the implied length.

  option - description (potential optional arguments beyond ${3})
========   =============================================================
    both   show both long division and letter division in script output
   nokey   do not include puzzle key in output. Store in 'puzzle.key'
  solve4   generate puzzle in solve4 format
    help   display this help and exit

variable - description                                 default
========   =========================================   =======
    BASE   set puzzle base (6-16)                      10
   TERMS   set number of puzzle terms                  null
\n"

else
	##############################################################################
	##
	## Declare variables
	##
	ARCH=$(uname -m)
	KEY="${1}"
	DSOR="${2}"
	DDEND="${3}"
	LONGDIVGEN="./ldg0.${ARCH}"
	klength=${#KEY}

	#If RDL or RDDL has a value of 0 or RDL/RDDL -1 then math = no
	if [[ "${DSOR}" == *"random"* ]] || [[ "${DDEND}" == *"random"* ]] ; then
		RDL=$(echo ${DSOR} | grep -Eo '[0-9]+$')
		RDDL=$(echo ${DDEND} | grep -Eo '[0-9]+$')
		if [[ "${RDL}" -eq 0 || "${RDDL}" -eq 0 ]]; then
			printf "ERROR: YOU HAVE A 0 VALUE IN YOUR DIVISOR and/or DIVIDEND\n"
			exit 1
		fi
	fi

	#Takes the KEY and sorts it alphabetically
	ksort=$(echo ${KEY} | grep -o . | sort | tr -d "\n")

	#Getting base for random
	bill=$(./ref_ldg0.x86_64)
	lngbill=$(echo "${bill}" | fold -w1 | sort | tr -d '\+\=\ \-\|\:\g-z' | paste -sd '')
	mixendbill=$(echo ${lngbill} | rev | cut -c 1)											#Gets the last number/value
	endbill=$(echo "obase=10; ibase=16; $mixendbill" | bc)									#Converts the last number to dec
	base=$((endbill+1))
	subbase=$((base- 1))																	#Issue with random DSOR and DDEND if not so subbase

	#--------------------------------------------------------------------
	# RANDOM
	#--------------------------------------------------------------------

	#Takes the Divisor and Dividend if they are random and extracts the number from them
	if [[ "${DSOR}" == *"random"* ]]; then
		RDL=$(echo ${DSOR} | grep -Eo '[0-9]+$')								#Random Divisor Length
		RDL=$((RDL- 1))															#RDL-1
		if [ "${base}" -le 10 ]; then										
			DSOR=$(tr -cd "0-${subbase}" < /dev/urandom | head -c ${RDL} )		#DSOR goes until base if <= 10
		else
			HRDL=$(echo "obase=16; ${subbase}" | bc )							#Hexes subbase
			DSOR=$(tr -cd "0-9A-${HRDL}" < /dev/urandom | head -c ${RDL} )		#DSOR goes until base if > 10
		fi
		#if first line =0 then delete it-------------
	fi
	if [[ "${DDEND}" == *"random"* ]]; then
		RDDL=$(echo ${DDEND} | grep -Eo '[0-9]+$')								#Random Dividend length
		RDDL=$((RDDL- 1))														#RDDL-1
		if [ "${base}" -le 10 ]; then
			DDEND=$(tr -cd "0-${subbase}" < /dev/urandom | head -c ${RDDL} )	#DDEND goes until base if <= 10
		else
			HRDDL=$(echo "obase=16; ${subbase}" | bc )							#Hexes subbase
			DDEND=$(tr -cd "0-9A-${HRDDL}" < /dev/urandom | head -c ${RDDL} )	#DDEND goes until base if > 10
		fi
		#if first line =0 then delete it------------
	fi

	if [[ "${KEY}" == "random" ]]; then
		if [[ ${RDL} -eq 0 || ${RDDL} -eq 0 ]]; then
			printf "ERROR: YOU HAVE A VALUE OF O\n"
			exit 1
		fi
	fi
	#--------------------------------------------------------------------
	# LONGDIVGEN
	#--------------------------------------------------------------------

	#Takes the DSOR and DDEND and if available will plug into the run for the LONGDIVGEN
	if [ -z "${DDEND}" ]; then
		if [ -z "${DSOR}" ]; then							#If both == NULL
			ted=$(./ref_ldg0.x86_64)
		else
			ted=$(./ref_ldg0.x86_64 -d ${DSOR} )			#If DDEND == NULL
		fi
	else
		ted=$(./ref_ldg0.x86_64 -d ${DSOR} -D ${DDEND} )	#If neither == NULL
	fi

	#--------------------------------------------------------------------
	# RANDOM PT2-KEY BOOGALOO
	#--------------------------------------------------------------------

	if [[ "${KEY}" == "random" ]]; then
		RKEYOG=$KEY
		RKEY=$(seq 0 ${subbase} | paste -sd ' ' )											#Random Key in 0-?
		SRKEY=$(seq 0 ${subbase} | shuf )													#Shuffles RKEY
		HSRKEY=$( echo "obase=16; ${SRKEY}" | bc | paste -sd '' )							#Hexes SRKEY
		klength=${#HSRKEY}																	#Length of HSRKEY
		ralph=$(echo "ACEFGHJKLMNPQRTUVWXY" | fold -w1 | shuf | paste -sd '')				#Shuffles allowable characters and prints them on one line
		if [ "${base}" -le 10 ]; then
			KEY=$(echo "${HSRKEY}" | tr 0-${subbase} "${ralph[@]}")							#If HSRKEY <= 10 then we have the KEY
		else
			hklength=$(echo "obase=16; ${subbase}" | bc )									#Hexes subbase
			KEY=$(echo "${HSRKEY}" | tr 0-9A-${hklength} "${ralph[@]}")						#If HSRKEY > 10 then we have the KEY
		fi
	fi

	ksort=$(echo ${KEY} | grep -o . | sort | tr -d "\n")

	#--------------------------------------------------------------------
	# No random anymore and this next bit might be redundent but idk

	#Gets the range of values of the puzzle( the base )
	lngbase=$(echo "${ted}" | fold -w1 | sort | tr -d '\+\=\ \-\|\:\g-z' | paste -sd '') 	#Gets all ted numbers and prints them on one line
	mixendbase=$(echo ${lngbase} | rev | cut -c 1)											#Gets the last number/value
	endbase=$(echo "obase=10; ibase=16; $mixendbase" | bc)									#Converts the last number to dec
	hendbase=$(echo "obase=16; $endbase" | bc)												#Hexes endbase (prob don't need but idk...)
	base=$((endbase+1))																		#Makes the base
	hbase=$(echo "obase=16; $base" | bc)													#Hexes base

	#--------------------------------------------------------------------
	# Errors
	#--------------------------------------------------------------------

	if echo "${KEY}" | grep -q '\(.\).*\1' ; then
		printf "ERROR: YOU HAVE A DUPLICATE LETTER\n"
		exit 1
	fi
	if [[ "${klength}" -lt 6 || "${klength}" -gt 16 ]]; then
		printf "ERROR: USE BASE INCLUDING AND BETWEEN 6-16\n"
		exit 1
	fi
	if [[ "${RDL}" -gt "${RDDL}" ]]; then
		printf "ERROR: DIVIDEND IS LARGER THAN DIVISOR\n"
		exit 1
	fi
	if [ "${base}" != "${klength}" ]; then
		printf "ERROR: INCORRECT KEY LENGTH\n"
		exit 1
	fi
	if [[ "${KEY}" == *B* || "${KEY}" == *D* || "${KEY}" == *I* || "${KEY}" == *O* || "${KEY}" == *S* || "${KEY}" == *Z* ]]; then
		printf "ERROR: YOU CANNOT USE B,D,I,O,S, or Z in KEY\n"
		exit 1
	fi
	if [[ "${KEY}" =~ [a-z] ]]; then
		printf "ERROR: PLEASE USE CAPITAL LETTERS\n"
		exit 1
	fi
	if [[ "${RDL}" -gt 15 || "${RDDL}" -gt 15 ]]; then
		printf "ERROR: PLEASE USE RANDOM LENGTH LESS THAN 16\n"
		exit 1
	fi

	#--------------------------------------------------------------------
	# Coded Puzzle Maker
	#--------------------------------------------------------------------

	#Turns the KEY into an array to translate the puzzle with the KEY until the base value if no random KEY input
	IFS='' rick=(${KEY})
	
	PZLMKR() {		
		if [ "${base}" -le 10 ]; then
			matt=$(echo "${ted}" | tr 0-${subbase} "${rick[@]}")				#Puzzle base6-10
			lastline=$(echo ${matt} | tail -n 1)								#Grabs the last line
			if [[ "${lastline}" == *"missing:"* ]]; then						#Checks to see if last line has "missing:"
				matt=$(echo ${matt} | sed '$ d')								#Removes "missing" and prints the puzzle
			fi
		else
			matt=$(echo "${ted}" | tr 0-9A-${hendbase} "${rick[@]}")			#Puzzle base11-16
			lastline=$(echo ${matt} | tail -n 1)								#Grabs the last line
			if [[ "${lastline}" == *"missing:"* ]]; then						#Checks to see if last line has "missing:"
				matt=$(echo ${matt} | sed '$ d')								#Removes "missing" and prints the puzzle
			fi
		fi
	}

	printf "\n"


	if [[ "${4}" == "solve4" ]] || [[ "${5}" == "solve4" ]] || [[ "${6}" == "solve4" ]] || [[ "${7}" == "solve4" ]]; then
		PZLMKR
		firsts4line=$(echo ${matt//[A-Z]/?} | head -n 1 )							#Grabs the first line and translates to ?
		echo $firsts4line
		solve=$(echo ${matt} | sed '$ d' | sed '1d' )								#Deletes the first and last lines
		echo $solve
		lasts4line=$(echo ${matt//[A-Z]/?} | tail -n 1 )							#Grabs the last line and translates to ?
		echo $lasts4line
		printf "\n"
	else
		PZLMKR
		echo $matt
		printf "\n"
	fi

	#--------------------------------------------------------------------
	# Print the information
	#--------------------------------------------------------------------

	#Prints the long division and letter division if "both" exists
	if [[ "${4}" == "both" ]] || [[ "${5}" == "both" ]] || [[ "${6}" == "both" ]] || [[ "${7}" == "both" ]]; then
		if [[ "$lastline" == *"missing:"* ]]; then									#If longdiv has a "missing" then remove it and print longdiv
			both=$(echo $ted | sed '$ d')
		else																		#If it does not have "missing" then print longdiv
			both=$ted
		fi
		printf "%s\n" $both
		printf "\n"
	fi

	printf "base: %d\n" "${base}"
	printf "letters: %s\n" ${ksort}

	#If "nokey" exists then put KEY into a file and do not print KEY
	if [[ "${4}" == "nokey" ]] || [[ "${5}" == "nokey" ]] || [[ "${6}" == "nokey" ]] || [[ "${7}" == "nokey" ]]; then
		cat ${KEY} > puzzle.key
	else
		printf "key: %s\n" ${KEY}
	fi

	if [[ "$lastline" == *"missing:"* ]]; then										#If the last line has missing then it prints that line here
		lastline=$(echo ${lastline} | tr -d '\ \g-z\:')								#Removes missing, :, and ' ' so I can then put a space between : and the lastline
		printf "missing: %s\n" "${lastline}"
	fi

	#If solve4 is present then print quotient and remainder
	if [[ "${4}" == "solve4" ]] || [[ "${5}" == "solve4" ]] || [[ "${6}" == "solve4" ]] || [[ "${7}" == "solve4" ]]; then
		quo=$(echo ${matt} | head -n 1 | tr -d ' ' )								#Grabs the quotient from the puzzle
		printf "quotient: %s\n" ${quo}
		rem=$(echo ${matt} | tail -n 1 | tr -d ' ' )								#Grabs the remainder from the puzzle
		printf "remainder: %s\n" ${rem}
	fi
	printf "difficulty: nonrated\n"
	printf "\n"
	
fi

exit 0
