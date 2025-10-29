# This example requires the 'message_content' intent.

import discord

class MyClient(discord.Client):
    async def on_ready(self):
        print(f'Logged on as {self.user}!')

    async def on_message(self, message):
        print(f'Message from {message.author}: {message.content}')

intents = discord.Intents.default()
intents.message_content = True

client = MyClient(intents=intents)
client.run('MTM4NTA0ODA1MjEyNDg4MDkzNw.G36qQz.VrHljZc9Pm9xSiyjc-sTeUswn5MUz4pOoJWN8Y')

