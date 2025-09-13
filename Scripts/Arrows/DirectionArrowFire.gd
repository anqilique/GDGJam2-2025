extends Node

@export var arrow : Node2D
@export var fire_cat : Node2D
@export var arrow_sprite : Sprite2D

func _process(_delta):
	if Globals.is_fire_cat_visible:
		arrow_sprite.hide()
	else:
		arrow_sprite.show()

	arrow.look_at(fire_cat.transform.origin)
