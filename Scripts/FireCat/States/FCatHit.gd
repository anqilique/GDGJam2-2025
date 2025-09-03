extends State
class_name FCatHit

var cat

func enter():
	print("FlameCat ---> Entered FCatHit State")
	cat = get_tree().get_first_node_in_group("FlameCat")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
