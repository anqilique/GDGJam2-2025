extends Area2D

@export var state_machine : StateMachine
@export var health_component : HealthComponent

var is_touching_yarn_cat : bool

# should probably have this variable on the firecat somewhere
var fire_cat_body_damage := 2

func _ready():
	is_touching_yarn_cat = false


func _on_area_entered(area : Area2D):
	# checks if the shadow is currently touching the yarn cat
	if area.get_parent().get_groups().has("YarnCat"):
		is_touching_yarn_cat = true

	if area.get_parent().get_groups().has("FireCat"):
		# Damage shadow if touching firecat (not implemented!!!)
		state_machine.on_child_transition(state_machine.current_state, "ShadowHit")
		health_component.take_damage(fire_cat_body_damage)


func _process(_delta):
	if state_machine.current_state.name == "ShadowAttack":
		return
	if is_touching_yarn_cat:
		state_machine.on_child_transition(state_machine.current_state, "ShadowAttack")


func _on_area_exited(_area : Area2D):
	is_touching_yarn_cat = false
