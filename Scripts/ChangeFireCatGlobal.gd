extends Node

func _on_screen_entered():
	Globals.is_fire_cat_visible = true


func _on_screen_exited():
	Globals.is_fire_cat_visible = false
