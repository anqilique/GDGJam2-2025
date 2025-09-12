extends State
class_name ShadowAttack

# TODO: probably have some sort of attack animation

@export var state_machine : StateMachine
@export var damage : int

func enter():
	var yarn_cat_health = get_tree().get_first_node_in_group("YarnCat").get_node("HealthComponent")
	print("ycat taking ", damage, " damage")
	yarn_cat_health.take_damage(damage)

	# play anim here
	await get_tree().create_timer(0.4).timeout

	# when anim finished go back to moving:
	state_machine.on_child_transition(state_machine.current_state, "ShadowMove")


func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	pass
