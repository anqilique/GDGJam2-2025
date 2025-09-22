extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("float")
	AudioHandler.play_sound("MainMenuTheme")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
