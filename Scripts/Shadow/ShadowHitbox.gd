extends Area2D

@export var state_machine : StateMachine
@export var health_component : HealthComponent

# should probably have this variable on the firecat somewhere
var fire_cat_body_damage := 2

func _on_area_entered(area : Area2D):
	# checks if the shadow is currently touching the yarn cat
	if area.get_parent().get_groups().has("YarnCat"):
		state_machine.on_child_transition(state_machine.current_state, "ShadowAttack")

	if area.get_parent().get_groups().has("FireCat"):
		# Damage shadow if touching firecat (not implemented!!!)
		state_machine.on_child_transition(state_machine.current_state, "ShadowHit")
		health_component.take_damage(fire_cat_body_damage)
