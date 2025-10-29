import discord
import datetime
import os
import re
import pytz
from discord.ext import commands
from datetime import datetime, date, time, timezone

intents = discord.Intents.default()
intents.message_content = True

client = discord.Client(intents=intents)

@client.event
async def on_message(message):
	if message.content.startswith("!date"):
		date_string = message.content.split(" ")[1]						#Look beofre or after
		data_string = message.content.split(" ")[2]						#Get the day argument
		month, day, year = data_string.split("/")

		est = pytz.timezone("US/Eastern")								#Get timezone info
		target_date = datetime.strptime( data_string, "%m/%d/%y" )		#Get the day you want the messages around in m/d/y format

		channel = message.channel
		if date_string == "before":
			messages = [msg async for msg in channel.history(before=target_date, limit=1000)]
		elif date_string == "after":
			messages = [msg async for msg in channel.history(after=target_date, limit=1000)]

		dated_messages = []
		for msg in messages:
#			if data_string in msg.content:
			dated_messages.append(msg)

		with open("dated_messages.txt", "w") as f:
			for msg in dated_messages:
				sent_time = msg.created_at
				f.write(f"{msg.author.name}: {msg.content} - {sent_time.astimezone(est).strftime('%m-%d-%y %H:%M:%S')}\n")

#		await channel.send("Messages Dated!")

client.run("MTM4NTA0ODA1MjEyNDg4MDkzNw.G36qQz.VrHljZc9Pm9xSiyjc-sTeUswn5MUz4pOoJWN8Y")
		







		
