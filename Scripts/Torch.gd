extends Node2D

@export var movement_speed: float

# Maximum distance allowed from the holder. For visual purposes.
const MAX_DISTANCE := 10

const TORCH_MOVE_SPEED := 0.05
var target : Node2D

func _ready():
	target = get_tree().get_first_node_in_group(Globals.torch_holder)
	$CPUParticles2D.emitting = true


func change_target(new_target):
	target = get_tree().get_first_node_in_group(Globals.torch_holder)


func _process(delta: float) -> void:
	if target:
		var distance_to_target := transform.origin.distance_to(target.transform.origin)

		if distance_to_target > MAX_DISTANCE:
			transform.origin = lerp(transform.origin, target.transform.origin, TORCH_MOVE_SPEED)

		# if it gets too close the torch gets pushed away a little
		elif distance_to_target <= MAX_DISTANCE-2:
			transform.origin = lerp(transform.origin, (target.transform.origin + transform.origin), delta)
