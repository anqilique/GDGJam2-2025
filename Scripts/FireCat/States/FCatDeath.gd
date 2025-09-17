extends State
class_name FCatDeath

var cat

func enter():
	cat = get_tree().get_first_node_in_group("FireCat")
	
	Globals.loss_reason = "FCatDied"
	get_tree().change_scene_to_file("res://Scenes/loss_screen.tscn")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
