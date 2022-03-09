extends Node

func _ready():
	pass

func _on_Area2D_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if (body.is_in_group("Player")):
		$AnimationPlayer.play("FadeOut")


func _on_Area2D_body_shape_exited(_body_rid, body, _body_shape_index, _local_shape_index):
	if (body.is_in_group("Player")):
		$AnimationPlayer.play("FadeIn")
