extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HotelAnimation.play("Normal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$HotelAnimation.play("Fadeout")


func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	$HotelAnimation.play("Fadein")
