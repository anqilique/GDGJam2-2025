extends CharacterBody2D

@export var movement_speed: float
@export var shadow: ShadowHealth
var target_velocity := Vector2.ZERO

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if (Input.is_action_pressed("fire_cat_move_up")):
		direction.y += -1
	if (Input.is_action_pressed("fire_cat_move_down")):
		direction.y -= -1
	if (Input.is_action_pressed("fire_cat_move_left")):
		direction.x -= 1
	if (Input.is_action_pressed("fire_cat_move_right")):
		direction.x += 1

	target_velocity.x = direction.x * movement_speed
	target_velocity.y = direction.y * movement_speed

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
