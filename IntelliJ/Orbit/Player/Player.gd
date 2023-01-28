extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = Vector2.ZERO

const MAX_SPEED = 100
const speed = 1

onready var level = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	
	gravity = Vector2.ZERO
	
	
	for p in level.planets:
		gravity += 0
		
	
	
	if Input.is_action_pressed("fly"):
		velocity += ((get_global_mouse_position() - position) / (10)) * speed
		
	else:
		velocity = lerp(velocity, Vector2.ZERO, .01)

	
	move_and_slide(velocity, Vector2.UP)

