extends Node
class_name ShadowHealth

@export var max_health: int
#@export var state_machine : StateMachine

var current_health: int

func _ready():
	current_health = max_health


func take_damage(damage):
	current_health -= damage
	if current_health <= 0:
		#state_machine.on_child_transition(state_machine.current_state, "ShadowDie")
		pass
