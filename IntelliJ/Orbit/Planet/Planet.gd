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

	var point = Vector2(0, 0)

	return point


func _process(delta):
	modulate = primary_color
	scale = Vector2(radius, radius)
	
