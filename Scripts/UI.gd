extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HealthBars/YCatHealth/Label2.text = "Find Key!"


func check_health_bars():
	var to_update = []
	var compare_global
	
	for bar in $HealthBars.get_children():
		match bar.name:
			"FCatHealth":
				compare_global = Globals.fire_cat_health
			"YCatHealth":
				compare_global = Globals.yarn_cat_health
			"TorchFlames":
				compare_global = Globals.torch_flames
		
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
			"TorchFlames":
				$HealthBars/TorchFlames.value = Globals.torch_flames


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_health_bars()
	
	if Globals.key_found and $HealthBars/YCatHealth/Label2.text != "Key Found!":
		$HealthBars/YCatHealth/Label2.text = "Key Found! Find Door!"
