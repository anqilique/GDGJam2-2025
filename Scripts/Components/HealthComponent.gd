extends Node
class_name HealthComponent

@export var current_health : int
@export var max_health : int

var state_machine

func _ready():
	state_machine = get_parent().get_node("StateMachine")
	current_health = max_health


func heal(amount: int):
	current_health += amount
	if current_health > max_health:
		current_health = max_health

	emit_signal("health_changed", current_health)


func die():
	var death_state = ""

	# Get the death state of the parent node.
	match get_parent().get_groups()[0]:
		"FireCat":
			death_state = "FCatDeath"
		"YarnCat":
			death_state = "YCatDeath"
		"Shadow":
			death_state = "ShadowDeath"

	# If parent node has a death state, switch to the state.
	if death_state != "" and state_machine.has_node(death_state):
		state_machine.on_child_transition(state_machine.current_state, death_state)


func take_damage(damage: int):
	if current_health <= 0:
		print("already dead")
		return

	current_health -= damage

	match get_parent().get_groups()[0]:
		"FireCat":
			Globals.fire_cat_health -= 1
		"YarnCat":
			Globals.yarn_cat_health -= 1
	
	if current_health <= 0:
		die()

	else:  # If not dead
		var hit_state = ""
		# Get the hit state of the parent node.
		match get_parent().get_groups()[0]:
			"FireCat":
				hit_state = "FCatHit"
			"YarnCat":
				hit_state = "YCatHit"
			"Shadow":
				hit_state = "ShadowHit"

		if hit_state != "" and state_machine.has_node(hit_state):
			state_machine.on_child_transition(state_machine.current_state, hit_state)
