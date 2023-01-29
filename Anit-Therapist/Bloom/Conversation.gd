extends Node
class_name Conversation

onready var main = get_parent()
onready var http : HTTPRequest

var settings := {}

export var model = "bigscience/bloom"
export var api_token = "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"

var pre_prompt

#this is how the conversation will be stored
var conversation := ""
var bot_name
var user_name = "Client"

var bubbles := {}

signal new_message

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(bot_name : String, pre_prompt: String):
	self.bot_name = bot_name
	self.pre_prompt = pre_prompt.replace("-{bot_name}-", bot_name)
	
	http = HTTPRequest.new()
	add_child(http)
# warning-ignore:return_value_discarded
	http.connect("request_completed", self, "on_request_completed")

func retry_compute():
	pass

# warning-ignore:shadowed_variable
func compute(prompts : PoolStringArray, settings : Dictionary) -> void:
	
	for p in prompts:
		conversation += "\n" + user_name + ": " + p
	
	
	var prompt = BloomInterface.compile_prompt(pre_prompt + conversation, bot_name)
	
	var parameters = settings
	print(settings)
	
	var payload = {
		"inputs": prompt,
		"parameters": parameters,
		"options" : {"use_cache": false, "wait_for_model" : true} 
		}

# warning-ignore:return_value_discarded
	http.request(
		"https://api-inference.huggingface.co/models/" + model,
		["Authorization: Bearer " + api_token],
		true,
		HTTPClient.METHOD_POST,
		JSON.print(payload)
	)
	
	print("request sent")
	
	


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func on_request_completed(result, response_code, headers, body):
	
	
	print("request completed:")
	match response_code:
	
		400:
			print("bad request")
			
		404:
			print("error connecting to server")
			
		200:
			print("good")
			
			emit_signal("new_message")
			
			var text = JSON.parse(body.get_string_from_ascii()).result[0].generated_text
			
			text = text.substr(pre_prompt.length() + conversation.length())
			print(text)
			text = BloomInterface.clean_text(text, [user_name, "\n\n"])
			conversation += text
			
			
			
			get_parent().write_feed(conversation)
			
		500:
			retry_compute()
	
	print(response_code)
