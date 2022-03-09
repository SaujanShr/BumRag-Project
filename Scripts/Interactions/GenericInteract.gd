extends Area2D

export var interact_distance = 75

func _ready():
	pass

#gets the position of the player
func get_player():
	var nodes = get_tree().get_nodes_in_group("Player")
	if len(nodes) > 0:
		return nodes[0]
	#if position not found, return an error
	push_error("The player is missing...")

#when the object is clicked on
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var distance_from_player = get_player().get_position().distance_to(get_parent().get_position())
			if distance_from_player < interact_distance:
				interact_method()

func interact_method():
	pass
