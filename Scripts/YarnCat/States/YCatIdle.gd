extends State
class_name YCatIdle

var cat

func enter():
	cat = get_tree().get_first_node_in_group("YarnCat")

func exit():
	pass

func update(_delta):
	if (  # If any of the Yarn Cat movement keys are pressed.
		Input.is_action_pressed("yarn_cat_move_up") or 
		Input.is_action_pressed("yarn_cat_move_down") or
		Input.is_action_pressed("yarn_cat_move_left") or
		Input.is_action_pressed("yarn_cat_move_right")
	):
		# Move if any of these are pressed.
		get_parent().on_child_transition(self, "YCatMove")

func physics_update(_delta):
	pass
