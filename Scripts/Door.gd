extends Node2D

var win_range
var fire_cat
var yarn_cat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_cat = get_tree().get_first_node_in_group("FireCat")
	yarn_cat = get_tree().get_first_node_in_group("YarnCat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	win_range = $Area2D.get_overlapping_bodies()
	
	if (
		fire_cat in win_range
		and yarn_cat in win_range
		and Globals.key_found
	):
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
	
