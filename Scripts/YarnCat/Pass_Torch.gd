extends Node

@export var pass_area : Area2D

var in_range : bool

func _process(_delta):
	if (Input.is_action_pressed("yarn_cat_pass_torch") and in_range):
		print("passed torch!!!!!!!!!!!!!!!!!!!!!!!!!1")
		pass


func _on_area_entered(area2d: Area2D):
	if area2d.get_parent().get_groups().has("FireCat"):
		print("In range")
		in_range = true


func _on_area_exited(area2d: Area2D):
	if area2d.get_parent().get_groups().has("FireCat"):
		in_range = false
