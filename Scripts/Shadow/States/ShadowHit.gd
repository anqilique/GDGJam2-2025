extends State
class_name ShadowHit 

@export var state_machine : StateMachine

func enter():
	# play anim here
	await get_tree().create_timer(0.4).timeout
	print("Shadow took x damage")

	# when anim finished go back to moving:
	state_machine.on_child_transition(state_machine.current_state, "ShadowMove")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
