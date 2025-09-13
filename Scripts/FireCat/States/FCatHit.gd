extends State
class_name FCatHit

@export var state_machine : StateMachine
var cat

func enter():
	cat = get_tree().get_first_node_in_group("FireCat")

	# play anim here
	await get_tree().create_timer(0.2).timeout

	# when anim finished go back to moving:
	state_machine.on_child_transition(state_machine.current_state, "FCatIdle")




func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
