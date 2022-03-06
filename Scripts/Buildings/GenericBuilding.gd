extends Node

func _ready():
	pass

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("Player")):
		$AnimationPlayer.play("FadeOut")


func _on_Area2D_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("Player")):
		$AnimationPlayer.play("FadeIn")
