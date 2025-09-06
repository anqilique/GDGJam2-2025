extends State
class_name YCatHit

@export var yarn_cat_state_machine : StateMachine
var cat

func enter():
	cat = get_tree().get_first_node_in_group("YarnCat")

	await get_tree().create_timer(0.2).timeout
	# play animation?

	# when anim finished go back to idle:
	yarn_cat_state_machine.on_child_transition(yarn_cat_state_machine.current_state, "YcatIdle")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
