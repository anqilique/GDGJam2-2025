extends State
class_name ShadowMove

@export var shadow: CharacterBody2D
@export var movement_speed: float

var players
var closest_player: Transform2D
var time_since_closest_player_check_seconds: float

func Enter():
	players = get_tree().get_nodes_in_group("Player")
	closest_player = find_closest_player()


func Physics_Update(delta):
	# Check for closest player every second, cuz this doesn't need to be every tick
	if time_since_closest_player_check_seconds > 1.0:
		closest_player = find_closest_player()
		time_since_closest_player_check_seconds = 0
	else:
		time_since_closest_player_check_seconds += delta

	var angle = shadow.get_angle_to(closest_player.origin)

	var direction: Vector2
	direction.x = cos(angle)
	direction.y = sin(angle)

	var target_velocity: Vector2
	target_velocity.x = direction.x * movement_speed
	target_velocity.y = direction.y * movement_speed

	shadow.velocity = target_velocity
	shadow.move_and_slide()


func find_closest_player():
	var new_closest_player = players[0]
	var closest_distance = shadow.transform.origin.distance_to(new_closest_player.transform.origin)

	for player in players:
		var distance = shadow.transform.origin.distance_to(player.transform.origin)
		if distance < closest_distance:
			new_closest_player = player
			closest_distance = distance

	return new_closest_player.transform
