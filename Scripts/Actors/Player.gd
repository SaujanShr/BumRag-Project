extends "res://Scripts/Actors/Actor.gd"

export var MOVE_SPEED = 200
var direction = Vector2(0, 0)

#interaction stuff to do later
signal on_interactable_changed(newInteractable)
var interaction_target : Node

func _physics_process(_delta):
	MovementLoop()
func _process(_delta):
	AnimationLoop()

#controls player movement
func MovementLoop():
	direction.x = int(Input.is_action_pressed("move_e")) - int(Input.is_action_pressed("move_w"))
	direction.y = (int(Input.is_action_pressed("move_s")) - int(Input.is_action_pressed("move_n"))) / float(2)
	var motion = direction.normalized() * MOVE_SPEED
	move_and_slide(motion)

#controls movement animation
func AnimationLoop():
	var anim_direction = "S"
	var anim_mode = "Idle"
	var animation
	#depending on facing direction, the sprite changes to face that direction
	match direction:
		#note: left and right sprites can be replaced with sprite.flip
		Vector2(-1, 0):
			anim_direction = "W"
		Vector2(1, 0):
			anim_direction = "E"
		Vector2(0, -0.5):
			anim_direction = "N"
		Vector2(0, 0.5):
			anim_direction = "S"
		Vector2(-1, -0.5):
			anim_direction = "NW"
		Vector2(-1, 0.5):
			anim_direction = "SW"
		Vector2(1, -0.5):
			anim_direction = "NE"
		Vector2(1, 0.5):
			anim_direction = "SE"
			
	#need to add walking animation below
	if direction != Vector2(0, 0):
		anim_mode = "Idle"
	else:
		anim_mode = "Idle"
	animation = anim_mode + "_" + anim_direction
	get_node("AnimationPlayer").play(animation)
