extends Control


var conversation : Conversation

onready var message = preload("res://GUI/Message.tscn")

#Settings
export var temperature = 1.0
export var top_p = 1.0
export var top_k = 1.0
export(int, 1, 200) var max_new_tokens = 32
export var do_sample = true

export(String, MULTILINE) var pre_pompt

var settings = {}


func _ready():
	conversation = Conversation.new(pre_pompt, "Therapist")
	settings = {
		"top_p" : top_p,
		"max_new_tokens" : max_new_tokens,
		"do_sample" : do_sample
	}


func _on_TextureButton_pressed():
	conversation.compute([pre_pompt], settings)
	
	
func write_feed(string : String):
	
	var lines = string.split("\n")
	
	for l in lines:
		var m = message.instance()
		m.text = l
		$Panel/Chat/MarginContainer/MessageFeed.add_child(m)
		
