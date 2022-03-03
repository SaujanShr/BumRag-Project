extends KinematicBody2D

export var MOVE_SPEED = 10000
var motion = Vector2()

func cartesian_to_isometric(cartesian):
	#var screen_pos = Vector2()
	#screen_pos.x = cartesian.x - cartesian.y
	#screen_pos.y = (cartesian.x + cartesian.y) / 2
	#return screen_pos
	#above algorithm is needed if we want to railroad players into isometric movement,
	#but i don't think it's necessary since we're using 8 cardinal directions.
	return(Vector2(cartesian.x, cartesian.y / 2)) #dividing the y value by two makes the character run parallel to isometric lines
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	var direction = Vector2()

	if Input.is_action_pressed("move_n"):
		direction += Vector2(0, -1)
	elif Input.is_action_pressed("move_s"):
		direction += Vector2(0, 1)

	if Input.is_action_pressed("move_w"):
		direction += Vector2(-1, 0)
	elif Input.is_action_pressed("move_e"):
		direction += Vector2(1, 0)
	motion = direction.normalized() * MOVE_SPEED * delta
	motion = cartesian_to_isometric(motion)
	move_and_slide(motion)
	

