import glob
import os
import re

#----------------------------
# Removale
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
