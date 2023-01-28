extends Node2D
class_name Planet
tool


enum {
	TYPE_GRASS,
	TYPE_DESERT,
	TYPE_SNOW,
	TYPE_STONE
}

#Geometry
export(int) var type
export(int, 0, 100) var radius

#Appearence
export(String) var planet_name
export(Color) var primary_color


func getPositionOnSurface(x : float) -> Vector2:
	
	var node = Node2D.new()
	node.rotation = 180 * x
	
	node.translate(node.get_transform().basis_xform(Vector2(0, 50 * radius)))
	print(node.position)
	return node.position


func _process(delta):
	self_modulate = primary_color
	scale = Vector2(radius, radius)
	
	$Sprite.position = getPositionOnSurface(.5)
	
