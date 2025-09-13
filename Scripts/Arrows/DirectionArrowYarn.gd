extends Node

@export var arrow : Node2D
@export var yarn_cat : Node2D
@export var arrow_sprite : Sprite2D

func _process(_delta):
	if Globals.is_yarn_cat_visible:
		arrow_sprite.hide()
	else:
		arrow_sprite.show()

	arrow.look_at(yarn_cat.transform.origin)
