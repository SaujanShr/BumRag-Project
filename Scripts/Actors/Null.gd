extends "res://Scripts/Actors/GenericNPC.gd"

func _process(_delta):
	AnimationLoop()
	
func AnimationLoop():
	var anim_mode = "Idle"
	var animation
	#animation is just the animation mode
	animation = anim_mode
	get_node("AnimationPlayer").play(animation)

