extends CharacterBody2D

@export var movement_speed: float

const MAX_DISTANCE = 10
# Maximum distance allowed from the holder. For visual purposes.

var target_location
var distance_to_target


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transform.origin = get_target_location()


func get_target_location():
	match Globals.torch_holder:
		"YarnCat": target_location = get_tree().get_first_node_in_group("YarnCat").transform.origin
	
	return target_location


func move_torch_to_target(target):
	var angle = get_angle_to(target)

	var direction: Vector2
	direction.x = cos(angle)
	direction.y = sin(angle)

	var target_velocity: Vector2
	target_velocity.x = direction.x * movement_speed
	target_velocity.y = direction.y * movement_speed

	velocity = target_velocity
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance_to_target = transform.origin.distance_to(get_target_location())
	
	if distance_to_target >= MAX_DISTANCE:
		move_torch_to_target(get_target_location())
