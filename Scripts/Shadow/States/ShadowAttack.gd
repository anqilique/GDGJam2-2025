extends State
class_name ShadowAttack

# TODO: probably have some sort of attack animation

@export var state_machine : StateMachine
@export var damage : int

var attack_timer


func enter():
	var yarn_cat_health = get_tree().get_first_node_in_group("YarnCat").get_node("HealthComponent")
	print("ycat taking ", damage, " damage")
	yarn_cat_health.take_damage(damage)

	# mock timer in placeholder of animations
	attack_timer = get_parent().get_parent().get_node("AttackTimer")
	if attack_timer.is_inside_tree():
		attack_timer.start()


func exit():
	pass


func update(_delta):
	pass

func physics_update(_delta):
	pass


func _on_attack_timer_timeout() -> void:
	state_machine.on_child_transition(state_machine.current_state, "ShadowMove")
