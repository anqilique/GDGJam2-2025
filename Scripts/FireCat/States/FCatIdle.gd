extends State
class_name FCatIdle

var cat

func enter():
	print("FireCat ---> Entered FCatIdle State")
	cat = get_tree().get_first_node_in_group("FireCat")

func exit():
	pass

func update(_delta):
	if (  # If any of the Fire Cat movement keys are pressed.
		Input.is_action_pressed("fire_cat_move_up") or 
		Input.is_action_pressed("fire_cat_move_down") or
		Input.is_action_pressed("fire_cat_move_left") or
		Input.is_action_pressed("fire_cat_move_right")
	):
		# Move if any of these are pressed.
		get_parent().on_child_transition(self, "FCatMove")

func physics_update(_delta):
	pass
