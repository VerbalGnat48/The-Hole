import discord
import os
import re
from discord.ext import commands
intents = discord.Intents.default()
intents.message_content = True

client = discord.Client(intents=intents)

@client.event
async def on_message(message):
    if message.content.startswith("!old_log"):  # Example command
        symbol_to_filter = message.content.split(" ")[1]  # Get the symbol from the command

        channel = message.channel
        messages = [msg async for msg in channel.history(limit=1000)]  # Fetch history.

        filtered_messages = []
        for msg in messages:
            if symbol_to_filter in msg.content:
                filtered_messages.append(msg)

        with open("filtered_messages.txt", "w") as f:
            for msg in filtered_messages:
                f.write(f"{msg.author.name}: {msg.content}\n")

        await channel.send("Filtered messages saved to filtered_messages.txt")

client.run("MTM4NTA0ODA1MjEyNDg4MDkzNw.G36qQz.VrHljZc9Pm9xSiyjc-sTeUswn5MUz4pOoJWN8Y") # Replace with your bot's token

#----------------------------
# Remove any non "@" lines
#----------------------------

if os.path.exists("filtered_messages.txt"):
	with open(r'filtered_messages.txt' , 'r') as file:
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

	os.remove("filtered_messages.txt")

#------------------------
# Remove any "log"
#------------------------
	file = open("history.txt", "r")
	lines = file.readlines()
	new_lines = []
	for line in lines:
	   if "log" not in line.strip():
	      new_lines.append(line)
	file.close()
	file = open("history.txt", "w")
	file.writelines(new_lines)
	file.close()

#------------------------
# End
#------------------------
	print("Get Corrected Ya Stupid Bot!")

else:
	print("No File")
