extends Control

@onready var reason_label = $CanvasLayer/ColorRect/LoseReason


func _ready() -> void:
	AudioHandler.play_sound("LoseSound")
	
	match Globals.loss_reason:
		"YCatBurned":
			reason_label.text = "Flame Cat burnt Yarn Cat alive!\nHow could you...?"
		"YCatDied":
			reason_label.text = "The Shadows got to Yarn Cat!\nKeep them away next time..."
		"FCatDied":
			reason_label.text = "Flame Cat's Fire was Extinguished!\nRemember to pass the torch..."


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
