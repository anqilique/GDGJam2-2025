extends State
class_name ShadowMove

@export var shadow_character_body: CharacterBody2D
@export var shadow_node: Node2D
@export var movement_speed: float

var players
var closest_player: Transform2D

func enter():
	players = (get_tree().get_nodes_in_group("YarnCat"))
	closest_player = find_closest_player()


func exit():
	pass


func update(_delta):
	pass


func physics_update(_delta):
	closest_player = find_closest_player()

	var angle = shadow_character_body.get_angle_to(closest_player.origin)

	var max_range := 0.0
	if Globals.torch_holder == "YarnCat":
		max_range = 40

	var direction: Vector2
	direction.x = cos(angle)
	direction.y = sin(angle)

	var target_velocity: Vector2
	target_velocity.x = direction.x * movement_speed
	target_velocity.y = direction.y * movement_speed

	if shadow_node.transform.origin.distance_to(closest_player.origin) >= max_range:
		shadow_character_body.velocity = target_velocity
	else:
		shadow_character_body.velocity = -target_velocity

	shadow_character_body.move_and_slide()

func find_closest_player():
	var new_closest_player = players[0]
	var closest_distance = shadow_character_body.transform.origin.distance_to(new_closest_player.transform.origin)

	for player in players:
		var distance = shadow_character_body.transform.origin.distance_to(player.transform.origin)
		if distance < closest_distance:
			new_closest_player = player
			closest_distance = distance

	return new_closest_player.transform
