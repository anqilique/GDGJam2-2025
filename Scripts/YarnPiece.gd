extends Area2D

var on_fire : bool

func _on_area_entered(area : Area2D):
	if area.get_parent().get_groups().has("FireCat"):
		print("Yarn burning")
		on_fire = true
		# start yarn on fire animation or smth
		var areas = get_overlapping_areas()

		for touching_area in areas:
			if touching_area.get_parent().get_groups().has("Flammable"):
				touching_area.get_parent().start_burn(1)


func set_on_fire(seconds : float):
	await get_tree().create_timer(seconds).timeout
	queue_free()
