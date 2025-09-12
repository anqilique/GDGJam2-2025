extends CharacterBody2D

@export var yarn_piece: PackedScene

var can_drop = true


func _ready() -> void:
	pass


func _physics_process(_delta):
	if get_node("StateMachine").current_state.name != "YCatDeath":
		if Input.is_action_just_pressed("yarn_cat_drop_yarn") and can_drop:
			var new_yarn = yarn_piece.instantiate()
			
			new_yarn.position.x = randf_range(global_position.x - 10, global_position.x + 10)
			new_yarn.position.y = randf_range(global_position.y - 10, global_position.y + 10)
			
			add_sibling(new_yarn)
			
			can_drop = false
			$CanDropTimer.start()


func _on_can_drop_timer_timeout() -> void:
	can_drop = true
