extends Node2D


var planets = []

onready var player = $Player

onready var stars = $Stars

func _physics_process(delta):
	stars.position = player.position
	


func _process(delta):
	planets = get_tree().get_nodes_in_group("planet")
