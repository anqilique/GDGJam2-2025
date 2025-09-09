extends Node

@export var yarn_cat : Node2D
@export var fire_cat : Node2D

var camera_move_speed := 0.03 # don't set higher than 1 lmao

func _process(_delta):
	self.transform.origin = lerp(self.transform.origin, ((yarn_cat.transform.origin + fire_cat.transform.origin) / 2), camera_move_speed)
