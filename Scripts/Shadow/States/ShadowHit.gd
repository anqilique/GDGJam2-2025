extends State
class_name ShadowHit 

@export var shadow_state_machine : StateMachine

func enter():
	# play anim here
	await get_tree().create_timer(0.4).timeout

	# when anim finished go back to moving:
	shadow_state_machine.on_child_transition(shadow_state_machine.current_state, "ShadowMove")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass
