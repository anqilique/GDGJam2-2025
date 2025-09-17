extends Node2D

@export var shadow_scene: PackedScene
var fire_cat


func _ready() -> void:
	Globals.reset_variables()
	fire_cat = get_tree().get_first_node_in_group("FireCat")
	
	$UI.show()


func _process(delta: float) -> void:
	if $ShadowSpawnTimer.is_stopped():
		$ShadowSpawnTimer.start()


func _on_shadow_spawn_timer_timeout() -> void:
	var shadow = shadow_scene.instantiate()
	
	var shadow_spawn_location = $Camera2D.global_position
	
	while abs(shadow_spawn_location.x - $Camera2D.global_position.x) <= 40:
		shadow_spawn_location.x += randf_range(-100, 100)
	while abs(shadow_spawn_location.y - $Camera2D.global_position.y) <= 40:
		shadow_spawn_location.y += randf_range(-100, 100)

	shadow.position = shadow_spawn_location

	$ShadowsContainer.add_child(shadow)
