extends State
class_name ShadowAttack

# TODO: probably have some sort of attack animation

@export var shadow_state_machine : StateMachine
@export var damage : int

func enter():
	var yarn_cat_health = get_tree().get_nodes_in_group("YarnCat")[0].find_child("HealthComponent")
	print("ycat taking ", damage, " damage")
	yarn_cat_health.take_damage(damage)

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
