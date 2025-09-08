extends Node

@export var yarn_cat : Node2D
@export var fire_cat : Node2D

func _process(delta: float):
	self.transform.origin = (yarn_cat.transform.origin + fire_cat.transform.origin) / 2
