extends Control


func _ready() -> void:
	AudioHandler.play_sound("ControlMenuTheme")


func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
