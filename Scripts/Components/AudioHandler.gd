extends Node

func play_sound(node_name):
	if has_node(node_name):
		var repeatable = ["MainMenuTheme", "ControlMenuTheme", "GamePlayTheme"]
		
		for track in self.get_children():
			if track.name != node_name:
				track.stop()
		
		if node_name in repeatable:
			if not get_node(node_name).is_playing():
				get_node(node_name).play()
		else:
			get_node(node_name).play()


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_win_sound_finished() -> void:
	$ControlMenuTheme.play()


func _on_lose_sound_finished() -> void:
	$ControlMenuTheme.play()
