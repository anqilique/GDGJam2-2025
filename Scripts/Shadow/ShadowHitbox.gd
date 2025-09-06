extends Area2D

@export var shadow_state_machine : StateMachine

func _on_area_entered(area : Area2D):
	# checks if the shadow is currently touching the yarn cat
	if area.get_parent().get_groups().has("YarnCat"):
		print("ycat entered shadow range")
		shadow_state_machine.on_child_transition(shadow_state_machine.current_state, "ShadowAttack")

	if area.get_parent().get_groups().has("FireCat"):
		# Damage shadow if touching firecat (not implemented!!!)
		shadow_state_machine.on_child_transition(shadow_state_machine.current_state, "ShadowHit")
