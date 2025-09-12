extends Area2D

@export var state_machine : StateMachine
@export var health_component : HealthComponent

var is_touching_yarn_cat : bool
var is_touching_fire_cat : bool

# should probably have this variable on the firecat somewhere
var fire_cat_body_damage := 2

func _ready():
	is_touching_yarn_cat = false
	is_touching_fire_cat = false


func _on_area_entered(area : Area2D):
	# checks if the shadow is currently touching the yarn cat
	if area.get_parent().get_groups().has("YarnCat"):
		is_touching_yarn_cat = true

	if area.get_parent().get_groups().has("FireCat"):
		is_touching_fire_cat = true


func _process(_delta):
	if state_machine.current_state.name != "ShadowMove":
		return

	if is_touching_yarn_cat:
		var yarn_cat = get_tree().get_first_node_in_group("YarnCat")
		
		if yarn_cat.get_node("StateMachine").current_state.name != "YCatDeath":
			state_machine.on_child_transition(state_machine.current_state, "ShadowAttack")
		else:
			print("Shadow detects Yarn Cat Dead")

	if is_touching_fire_cat:
		state_machine.on_child_transition(state_machine.current_state, "ShadowHit")
		health_component.take_damage(fire_cat_body_damage)


func _on_area_exited(area : Area2D):
	if area.get_parent().get_groups().has("YarnCat"):
		is_touching_yarn_cat = false

	if area.get_parent().get_groups().has("FireCat"):
		is_touching_fire_cat = false
