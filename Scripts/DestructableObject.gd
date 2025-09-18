extends CharacterBody2D

var current_burn_time : float

var is_burning := false

func _physics_process(delta):
	if not is_burning:
		return

	current_burn_time -= delta
	if current_burn_time <= 0:
		queue_free()
		is_burning = false


func start_burn(seconds: int):
	is_burning = true
	current_burn_time = seconds
