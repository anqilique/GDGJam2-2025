extends State
class_name ShadowMove

@export var shadow_character_body: CharacterBody2D
@export var shadow_node: Node2D
@export var movement_speed: float

var players := []
var yarn_cat : Node2D

func enter():
	yarn_cat = get_tree().get_nodes_in_group("YarnCat")[0]


func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	var angle = shadow_character_body.get_angle_to(yarn_cat.transform.origin)

	var max_range := 0.0
	if Globals.torch_holder == "YarnCat" and Globals.torch_flames > 0:
		max_range = 40

	var direction: Vector2
	direction.x = cos(angle)
	direction.y = sin(angle)

	var target_velocity: Vector2
	target_velocity.x = direction.x * movement_speed
	target_velocity.y = direction.y * movement_speed

	if shadow_node.transform.origin.distance_to(yarn_cat.transform.origin) >= max_range:
		shadow_character_body.velocity = target_velocity
	else:
		shadow_character_body.velocity = -target_velocity

	shadow_character_body.move_and_slide()
