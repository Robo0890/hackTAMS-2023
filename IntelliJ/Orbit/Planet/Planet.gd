extends Node2D
class_name Planet
tool


enum {
	TYPE_GRASS,
	TYPE_DESERT,
	TYPE_SNOW,
	TYPE_STONE
}

onready var tree = preload("res://Generation/Terrain/Tree.tscn")

var props = [
	tree
]

#Geometry
export(int) var type
export(int, 0, 100) var radius

#Terrain
export (int) var density = 0

#Appearence
export(String) var planet_name
export(Color) var primary_color

export var test = 0.0

func _ready():
	add_terrain()

func getPositionOnSurface(x : float) -> Vector2:
	
	var node = Node2D.new()
	node.rotation_degrees = 360 * x
	
	node.translate(node.get_transform().basis_xform(Vector2(0, -50 * radius)))
	return node.transform
	



func _process(delta):
	self_modulate = primary_color
	$Planet.scale = Vector2(radius, radius) * 50
	
	$Sprite.transform = getPositionOnSurface(test)
	

func add_terrain():
	
	for i in range(0, density):
		pass
	
