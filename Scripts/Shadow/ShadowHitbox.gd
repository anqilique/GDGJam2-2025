extends Area2D

@export var state_machine : StateMachine
@export var health_component : HealthComponent

var is_touching_yarn_cat : bool

# should probably have this variable on the firecat somewhere
var fire_cat_body_damage := 1

func _ready():
	is_touching_yarn_cat = false


func _on_area_entered(area : Area2D):
	# checks if the shadow is currently touching the yarn cat
	if area.get_parent().get_groups().has("YarnCat"):
		is_touching_yarn_cat = true

	if area.get_parent().get_groups().has("FireCat"):
		
		if Globals.fire_cat_health > 0:
			state_machine.on_child_transition(state_machine.current_state, "ShadowHit")
			health_component.take_damage(fire_cat_body_damage)
			
			var fire_cat_health_component = area.get_parent().get_node("HealthComponent")
			fire_cat_health_component.take_damage(1)


func _process(_delta):
	if state_machine.current_state.name == "ShadowAttack":
		return
	if is_touching_yarn_cat:
		var yarn_cat = get_tree().get_first_node_in_group("YarnCat")
		
		if yarn_cat.get_node("StateMachine").current_state.name != "YCatDeath":
			state_machine.on_child_transition(state_machine.current_state, "ShadowAttack")
		else:
			print("Shadow detects Yarn Cat Dead")


func _on_area_exited(_area : Area2D):
	is_touching_yarn_cat = false
