extends Node

@export var pass_area : Area2D
@export var pass_area_sprite : Sprite2D

var in_range : bool

func _process(_delta):
	if (Input.is_action_just_released("yarn_cat_pass_torch") and in_range):
		print("passed torch!!!!!!!!!!!!!!!!!!!!!!!!!1")
		
		match Globals.torch_holder:
			"YarnCat":
				Globals.torch_holder = "FireCat"
			"FireCat":
				Globals.torch_holder = "YarnCat"
		
		var torch = get_tree().get_first_node_in_group("Torch")
		torch.change_target(Globals.torch_holder)


	if in_range:
		pass_area.show()
	else:
		pass_area.hide()


func _on_area_entered(area2d: Area2D):
	if area2d.get_parent().get_groups().has("FireCat"):
		print("In range")
		in_range = true


func _on_area_exited(area2d: Area2D):
	if area2d.get_parent().get_groups().has("FireCat"):
		in_range = false
