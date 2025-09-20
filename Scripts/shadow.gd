extends CharacterBody2D


func _ready() -> void:
	$CPUParticles2D.emitting = true

func _physics_process(delta: float) -> void:
	pass
