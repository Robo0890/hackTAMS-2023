extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = Vector2.ZERO

const MAX_SPEED = 100
const speed = 1

onready var level = get_parent().get_parent()




func _process(delta):
	look_at(get_global_mouse_position())
	
	
	
func _physics_process(delta):
	
	if Input.is_action_pressed("fly"):
		velocity += ((get_global_mouse_position() - position) / (10)) * speed
		
	else:
		velocity = lerp(velocity, Vector2.ZERO, .01)
	
	
	#apply_central_impulse(velocity * delta)
	move_and_slide(velocity, Vector2.UP)
