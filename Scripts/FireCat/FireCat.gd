extends CharacterBody2D

@export var health_component : HealthComponent

var timer := 0.0
var tick_rate = 1.5
var can_revive = true

func _physics_process(delta):
	if Globals.torch_holder != "FireCat":
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
	
	timer += delta
	if timer >= tick_rate:
		timer = 0
		if Globals.torch_holder == "FireCat" and can_revive:
			health_component.heal(1)
		else:
			health_component.take_damage(1)
	
	if Globals.fire_cat_health == 0:
		$ReviveTimer.start()


func _on_revive_timer_timeout() -> void:
	can_revive = false
