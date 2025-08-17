extends State
class_name YCatMove

@export var movement_speed: float
@export var speed_multiplier: float

var cat

func enter():
	print("YarnCat ---> Entered YCatMove State")
	cat = get_tree().get_first_node_in_group("YarnCat")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	cat.velocity = Vector2.ZERO

	if (Input.is_action_pressed("yarn_cat_move_up")):
		cat.velocity.y -= 1
	if (Input.is_action_pressed("yarn_cat_move_down")):
		cat.velocity.y += 1
	if (Input.is_action_pressed("yarn_cat_move_left")):
		cat.velocity.x -= 1
	if (Input.is_action_pressed("yarn_cat_move_right")):
		cat.velocity.x += 1
	
	if cat.velocity.length() > 0:
		cat.velocity = cat.velocity.normalized() * speed_multiplier
	else:
		get_parent().on_child_transition(self, "YCatIdle")
	
	cat.move_and_slide()
