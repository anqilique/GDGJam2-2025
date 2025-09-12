extends Node

@export var pass_area : Area2D

func _process(_delta):
	if (Input.is_action_pressed("yarn_cat_pass_torch")):
		print("workign")
		pass
