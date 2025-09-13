extends CharacterBody2D

@export var health_component : HealthComponent

var timer := 0.0
var tick_rate = 1.5

func _physics_process(delta):
	timer += delta
	if timer >= tick_rate:
		timer = 0
		if Globals.torch_holder == "FireCat":
			if Globals.torch_flames > 0:
				health_component.heal(1)
		else:
			health_component.take_damage(1)
