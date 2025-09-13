extends Node

@export var arrow : Node2D
@export var arrow_sprite : Sprite2D

var yarn_cat : Node2D

func _ready():
	yarn_cat = get_tree().get_first_node_in_group("YarnCat")

func _process(_delta):
	if Globals.is_yarn_cat_visible:
		arrow_sprite.hide()
	else:
		arrow_sprite.show()

	arrow.look_at(yarn_cat.transform.origin)
