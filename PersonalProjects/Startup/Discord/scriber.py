#This is a program to read certain messages containing a symbol or word in a discord channel in relation to a certain time to a text file
#To be in the right environment do: 	source bot-env/bin/activate
#To activate this file do:				python3 file.py
#To activate in a channel do(example):	!log @ before 6/20/25

#To make text in chronological order do:	tac filename.txt > reversed_filename.txt
#To add new quotes to the QuoteBook do:		cat source_file.txt >> destination_file.txt


#------------------------
# Imports
#------------------------
import discord
import os
import re
import pytz
from discord.ext import commands
from datetime import datetime, date, time, timezone
intents = discord.Intents.default()
intents.message_content = True

client = discord.Client(intents=intents)

#------------------------
# Main
#------------------------
@client.event
async def on_message(message):
	if message.content.startswith("!log"):		  					#Command Name
		symbol_to_filter = message.content.split(" ")[1]  			#Get the symbol from the command
		date_string = message.content.split(" ")[2]					#Loof before or after
		data_string = message.content.split(" ")[3]					#Get the day argument
		month, day, year = data_string.split("/")

		est = pytz.timezone("US/Eastern")							#Get the correct timezone
		target_date = datetime.strptime( data_string, "%m/%d/%y" )	#Get the day you want the messages around in m/d/y format

		channel = message.channel
		if date_string == "before":
			messages = [msg async for msg in channel.history(before=target_date, limit=1000)]
		elif date_string == "after":
			messages = [msg async for msg in channel.history(after=target_date, limit=1000)]

		dated_messages = []
		for msg in messages:
			if symbol_to_filter in msg.content:						#Filter for Symbol
				dated_messages.append(msg)							#Write if Symbol found		

		with open("found_messages.txt", "w") as f:
			for msg in dated_messages:
				sent_time = msg.created_at
				f.write(f"{msg.author.name}: {msg.content}\n")
		await channel.send("Done Logging")

dotenv_path="~/.env"
load_dotenv()
TOKEN = os.getenv("TOKEN")
client.run(TOKEN)

#----------------------------
# Remove any non "@" lines
#----------------------------

if os.path.exists("found_messages.txt"):
	with open(r'found_messages.txt' , 'r') as file:
#----------------------------------
# Replace UserID's with Usernames
#----------------------------------
		data = file.read()
		data = data.replace("657035572967374859", "verbalgnat48")
		data = data.replace("1037878928511078590", "zer0_rex")
		data = data.replace("421167746693333003", "chaos0086")
		data = data.replace("783165965948157992", "erikap213")
		data = data.replace("866457527084515388", "tovahmcgrath")
		data = data.replace("538548750667350016", "figgery")
		data = data.replace("903771351129686047", "permanentdynamic")
		data = data.replace("695788135782809731", "graykitty179")
		data = data.replace("1385048052124880937", "The Scribe#4877")

	if os.path.exists("history.txt"):
		os.remove("history.txt")
	
	with open(r'history.txt', 'w') as file:
		file.write(data)

	os.remove("found_messages.txt")

#--------------------------------------------
# Remove any text that summons this command
#--------------------------------------------
	file = open("history.txt", "r")
	lines = file.readlines()
	new_lines = []
	for line in lines:
	   if "!log" not in line.strip():
	      new_lines.append(line)
	file.close()
	file = open("history.txt", "w")
	file.writelines(new_lines)
	file.close()

#------------------------
# End
#------------------------
#	print("Get Corrected Ya Stupid Bot!")

else:
	print("No File")

