extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	if Input.is_action_pressed("fly"):
		apply_impulse(get_global_mouse_position(), get_global_mouse_position())
		print()

