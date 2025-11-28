#!/bin/bash
#----------------------------
# To use the "Mode" function for do(example): ./startup Mode Music On/Off
# To use the "Img" function for do(example): ./startup Img On/Off Music Memes
# To use the "Quo" function for do(example): ./startup Quo On/Off Comp Book

#Plans:
	#Add Modes
		#Like Random where it picks any Quote, Image, or Sound
		#Like Music where it only does Music related stuff
		#Or Friends, or Memes, or etc...

#-----------------------
# Usefull Commands
#-----------------------
#	test=$(grep -i "Img_tag_*.*Yes" Startinfo.txt)				#Get text between two strings
#	ls -LR CompSci Memes										#List dir files
#	sed -e 's/^/*/'												#Add text before a line (works with grep)
#	sed -e 's/$/*/'												#Add text after a line (works with grep)

#-----------------------
# Basic Startup Image
#-----------------------
#	cd /mnt/c/Users/cmazz/OneDrive/Pictures > /dev/null
#	cd Memes/ > /dev/null
#	jp2a Ca-ouse.jpg --color-depth=24 --height=25
#	cd

if [[ -z "$1" ]]; then
		#----------------------------------------
		# Random Startup Iamge
		#----------------------------------------
			cd ~/The-Hole/PersonalProjects/Startup
			if [[ $(cat Startinfo.txt | grep Image | sed -n -e "s/^.*Image://p") == "On" ]]; then
					#-------------------------
					# Start
					#-------------------------
					directories=$(grep -i "Img_tag_*.*On" Startinfo.txt | sed -e 's/.*tag_\(.*\):.*/\1/')	#Get the desired names of the dirs that have a "Yes"
					cd /mnt/c/Users/cmazz/OneDrive/Pictures/Startup_Images/ > /dev/null		#Go to desired folder

					#-------------------------
					# Basic
					#-------------------------
#					picture=$(ls | shuf -n 1)												#Get a list of all images and select image
#					jp2a "$picture" --color-depth=24 --height=25							#Print image (works with vraiables)

					#-------------------------
					# Search Dir and SubDir for all
					#-------------------------
#					picture=$(ls -LR | grep -e ".png" -e ".jpg" | shuf -n 1)				#Get a list of all images from all subdir and select image
#					directory_name=$(find . -name "$picture" | sed 's![^/]*$!!')			#Find image directory and remove file name
#					cd "$directory_name"													#Go to chosen image directory
#					jp2a "$picture" --color-depth=24 --height=25							#Print image (works with vraiables)

					#-------------------------
					# Specific
					#-------------------------
					picture=$(ls -LR $directories | grep -e ".png" -e ".jpg" | shuf -n 1)	#Get a list of all images from allowed Dirs
					directory_name=$(find . -name "$picture" | sed 's![^/]*$!!')			#Find image directory and remove file name
					cd "$directory_name"													#Go to chosen image directory
					jp2a "$picture" --color-depth=24 --height=25							#Print image (works with vraiables)

					cd
			fi

		#----------------------------------------
		# Random Startup Quote
		#----------------------------------------
			cd ~/The-Hole/PersonalProjects/Startup
			if [[ $(cat Startinfo.txt | grep Quotes | sed -n -e "s/^.*Quotes://p") == "On" ]]; then
					#-------------------------
					# Start
					#-------------------------
#					directories=$(grep -i "Quo_tag_*.*Yes" Startinfo.txt | sed -e 's/.*tag_\(.*\):.*/\1/')	#Get the desired names of the dirs that have a "Yes"
					files=$(grep -i "Quo_tag_*.*On" Startinfo.txt | sed -e 's/.*tag_\(.*\):.*/\1/' | sed -e 's/^/*/' | sed -e 's/$/*/')
					cd ~/The-Hole/PersonalProjects/Startup/Quotes/ > /dev/null

					#Check if x file exists, if so then kill
					if [ -f "Quotes.txt" ]; then
						rm Quotes.txt
					fi

					#-------------------------
					# Basic
					#-------------------------
#					cat *Quote* > Quotes.txt						#Put all "Quote" files into one
#					quote=$(shuf -n 1 Quotes.txt)					#Shuffle the lines and pick the first quote
#					echo "$quote" | sed "s/^.*: //" | tr -d "<>"	#Remove who quoted it and "<>"

					#-------------------------
					# Specific
					#-------------------------
					cat $files > tempquotes.txt
					quote=$(shuf -n 1 tempquotes.txt)				#Shuffle the lines and pick the first quote
					echo "$quote" | sed "s/^.*: //" | tr -d "<>"	#Remove who quoted it and "<>"
					rm tempquotes.txt

					cd
			fi

		#----------------------------------------
		# Random Startup Noise
		#----------------------------------------
			cd ~/The-Hole/PersonalProjects/Startup
			if [[ $(cat Startinfo.txt | grep Music | head -1 | sed -n -e "s/^.*Music://p") == "On" ]]; then
				#-------------------------
				# Basic
				#-------------------------
				cd /mnt/c/Users/cmazz/Music/Sound_Effects > /dev/null ;
				sound=$(ls | shuf -n 1)
				play -q "$sound"
				cd
			fi

else

	#-----------------------
	# Fucntions
	#-----------------------

	# To use the "Mode" function for do(example): ./startup Mode Music On/Off
	Mode() {
		#-------------------------
		# Basic
		#-------------------------
#		if [[ -n "$1" ]] && [[ -n "$2" ]]; then
#			status=$(cat Startinfo.txt | grep "$1" | head -1 | sed -n -e "s/^.*$1://p" )		#Get the On/Off Status of the "Mode"
#			line_number=$(grep -n "$1" Startinfo.txt | head -1 | cut -d: -f1 )					#Get the line number that "Mode" is on
#			sed -i "$line_number s/$status/$2/" Startinfo.txt									#Change the "Mode" status
#		else
#			echo "Need Two Arguments: Name and On/Off!"	
#		fi

		#-------------------------
		# Change multiple at once
		#-------------------------
		if [[ "$1" == "On" ]] || [[ "$1" == "Off" ]]; then
			for (( i=2; i<=$#; i++ ))
			do
				status=$(cat Startinfo.txt | grep "${!i}" | head -1 | sed -n -e "s/^.*://p")	#Get the O/Off Status of the "Mode"
				line_number=$(grep -n "${!i}" Startinfo.txt | head -1 | cut -d: -f1 )			#Get the line number that "Img" is on
				sed -i "$line_number s/$status/$1/" Startinfo.txt								#Change the "Img" status
			done
		else
			echo "First Arg Needs to be On/Off!"
		fi
	}

	

	# To use the "Img" function for do(example): ./startup Img On/Off Music Memes
	Img() {
		#-------------------------
		# Basic
		#-------------------------
#		if [[ -n "$1" ]] && [[ -n "$2" ]]; then
#			status=$(cat Startinfo.txt | grep -i "Img*.*$1" | sed -n -e "s/^.*$1://p")			#Get the Yes/No Status of the "Img"
#			line_number=$(grep -n "$1" Startinfo.txt | tail -1 | cut -d: -f1 )					#Get the line number that "Img" is on
#			sed -i "$line_number s/$status/$2/" Startinfo.txt									#Change the "Img" status
#		else
#			echo "Need Two Arguments: Name and Yes/No!"	
#		fi

		#-------------------------
		# Change multiple at once
		#-------------------------
		if [[ "$1" == "On" ]] || [[ "$1" == "Off" ]]; then
			for (( i=2; i<=$#; i++ ))
			do
				status=$(cat Startinfo.txt | grep -i "Img_*.*${!i}" | sed -n -e "s/^.*://p")		#Get the On/Off Status of the "Img_"
				line_number=$(grep -n "Img_*.*${!i}" Startinfo.txt | tail -1 | cut -d: -f1 )		#Get the line number that "Img" is on
				sed -i "$line_number s/$status/$1/" Startinfo.txt									#Change the "Img" status
			done
		else
			echo "First Arg Needs to be On/Off!"
		fi
	}

	# To use the "Quo" function for do(example): ./startup Quo On/Off Comp Book
	Quo() {
		#-------------------------
		# Change multiple at once
		#-------------------------
		if [[ "$1" == "On" ]] || [[ "$1" == "Off" ]]; then
			for (( i=2; i<=$#; i++ ))
			do
				status=$(cat Startinfo.txt | grep -i "Quo_*.*${!i}" | sed -n -e "s/^.*://p")		#Get the On/Off Status of the "Quo_"
				line_number=$(grep -n "Quo_*.*${!i}" Startinfo.txt | tail -1 | cut -d: -f1 )		#Get the line number that "Img" is on
				sed -i "$line_number s/$status/$1/" Startinfo.txt									#Change the "Img" status
			done
		else
			echo "First Arg Needs to be On/Off!"
		fi
	}



	"$@"

fi

