extends Node2D

@export var shadow_scene: PackedScene


func _process(delta: float) -> void:
	if $ShadowSpawnTimer.is_stopped():
		$ShadowSpawnTimer.start()


func _on_shadow_spawn_timer_timeout() -> void:
	var shadow = shadow_scene.instantiate()
	
	var shadow_spawn_location = $Camera2D/ShadowPath2D/ShadowSpawn
	shadow_spawn_location.progress_ratio = randf()

	shadow.position = shadow_spawn_location.position

	add_child(shadow)
	print("SPAWN")
