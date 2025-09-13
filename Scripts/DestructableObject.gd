extends CharacterBody2D

var health := 4
var current_burn_time : int

var is_burning := false

func _process(delta):
	if not is_burning:
		return

	current_burn_time -= delta
	if current_burn_time <= 0:
		queue_free()
		is_burning = false


func start_burn(seconds: int):
	is_burning = true
	current_burn_time = seconds
