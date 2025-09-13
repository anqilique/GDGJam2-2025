extends Node2D

@export var shadow_scene: PackedScene


func _process(delta: float) -> void:
	if $ShadowSpawnTimer.is_stopped():
		$ShadowSpawnTimer.start()


func _on_shadow_spawn_timer_timeout() -> void:
	print("SPAWN AAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHH")
	var shadow = shadow_scene.instantiate()
	
	var shadow_spawn_location = $Camera2D.global_position
	
	shadow_spawn_location.x += randf_range(-20, 20)
	shadow_spawn_location.y += randf_range(-20, 20)

	shadow.position = shadow_spawn_location

	add_child(shadow)
