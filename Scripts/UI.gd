extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func check_health_bars():
	var to_update = []
	var compare_global
	
	for bar in $HealthBars.get_children():
		match bar.name:
			"FCatHealth":
				compare_global = Globals.fire_cat_health
			"YCatHealth":
				compare_global = Globals.yarn_cat_health
		
		if bar.value != compare_global:
			to_update.append(bar.name)
	
	if to_update != []:
		update_bars(to_update)


func update_bars(bars_list):
	var bar_node
	
	for bar in bars_list:
		match bar:
			"FCatHealth":
				$HealthBars/FCatHealth.value = Globals.fire_cat_health
			"YCatHealth":
				$HealthBars/YCatHealth.value = Globals.yarn_cat_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_health_bars()
