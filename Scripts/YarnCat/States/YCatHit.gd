extends State
class_name YCatHit

var cat

func enter():
	cat = get_tree().get_first_node_in_group("YarnCat")

	# play animation?

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
