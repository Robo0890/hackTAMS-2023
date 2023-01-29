extends Node
class_name BloomInterface
 #This is the class that will decode strings into a dictionary seperating the conversation into text bubbles

#constants. USE FOR DECODING
#sorry if you wanted these to be used I legit didn't know what they were and just left 
#them be - J
enum {
	OWNER_USER, #0
	OWNER_BOT #1
	}
	




#idk what this is for and idk if i was supposed to do anything with it -J
static func compile_prompt(conversation : String, bot_name : String) -> String:
	return conversation + "\n" + bot_name + ":"
	
static func decompile_prompt(pre_text : String, conversation : String) -> String:
	return conversation.substr(pre_text.length())

#Take the AI's returned text and remove usless text. (like the bot trying to continue the conversation without user input, or anything after "\nA:")


#So lets use something called an escape sequence.
static func clean_text(result : String, esc_seq : PoolStringArray) -> String:
	#this here may work for isolating just new text (fix if needed)
	var stopPositions = []
	for i in range(esc_seq.size()):
		stopPositions.append(result.find(esc_seq[i]))
	var end = result.length()
	for i in range(stopPositions.size()):
		if(stopPositions[i] < end and stopPositions[i]!=-1):
			end = stopPositions[i]
	result = result.substr(0,end)
	
	#if result[result.length() - 1] != "." or result[result.length() - 1] != "\n":
	#	result = result.substr(0, result.find_last(".") + 1)
	
	return result
	
