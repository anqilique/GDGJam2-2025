extends Node2D

var yarn_cat : Node2D
var fire_cat : Node2D

const CAMERA_MOVE_SPEED := 0.03 # don't set higher than 1 lmao

func _ready():
	fire_cat = get_tree().get_first_node_in_group("FireCat")
	yarn_cat = get_tree().get_first_node_in_group("YarnCat")

func _process(_delta):
	transform.origin = lerp(transform.origin, ((yarn_cat.transform.origin + fire_cat.transform.origin) / 2), CAMERA_MOVE_SPEED)
