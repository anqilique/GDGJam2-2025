extends CharacterBody2D

@export var yarn_piece: PackedScene

var can_drop = true
var burn_range
var fire_cat

@export var pass_area : Area2D
@export var pass_area_sprite : Sprite2D

var in_range : bool
var passing_range


func _ready() -> void:
	fire_cat = get_tree().get_first_node_in_group("FireCat")
	$BurnTimer.wait_time = Globals.alight_time
	$CanvasLayer/SearchLabel.hide()
	$CanvasLayer/SearchResultLabel.hide()


func search(location):
	if location == Globals.key_location:
		if not Globals.key_found:
			Globals.key_found = true
			$CanvasLayer/SearchResultLabel.text = "The Key has been found!"
	else:
		var find_kindling = randi_range(1, 4)
		
		if find_kindling <= 3:
			Globals.torch_flames += find_kindling
			
			if Globals.torch_flames > 10:
				Globals.torch_flames = 10
			
			$CanvasLayer/SearchResultLabel.text = "Found some kindling!"
		else:
			$CanvasLayer/SearchResultLabel.text = "Nothing here! Try again?"
	
	$CanvasLayer/SearchResultLabel.show()


func show_searchable(location):
	var txt_location
	
	match location:
		"Table1": txt_location = "Table"
		"Table2": txt_location = "Table"
		"ShelfL": txt_location = "Shelf"
		"ShelfR": txt_location = "Shelf"
		_: txt_location = location
	
	$CanvasLayer/SearchLabel.text = "Yarn Cat - Search " + txt_location + "? [SHIFT]"
	$CanvasLayer/SearchLabel.show()


func _physics_process(_delta):
	if Globals.torch_holder != "YarnCat":
		$AnimatedSprite2D.play("default")
		if $CanvasLayer/SearchLabel.is_visible():
			$CanvasLayer/SearchLabel.hide()
		if $CanvasLayer/SearchResultLabel.is_visible():
			$CanvasLayer/SearchResultLabel.hide()
		
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
	
	#if get_node("StateMachine").current_state.name != "YCatDeath":
		#if Input.is_action_just_pressed("yarn_cat_drop_yarn") and can_drop:
			#var new_yarn = yarn_piece.instantiate()
			#
			#new_yarn.position = self.position
			#
			#add_sibling(new_yarn)
			#
			#can_drop = false
			#$CanDropTimer.start()
	
	if (Input.is_action_just_released("yarn_cat_pass_torch") and in_range):		
		match Globals.torch_holder:
			"YarnCat":
				Globals.torch_holder = "FireCat"
			"FireCat":
				Globals.torch_holder = "YarnCat"
	
	var torch = get_tree().get_first_node_in_group("Torch")
	torch.change_target(Globals.torch_holder)

	passing_range = $PassArea2D.get_overlapping_bodies()
	if fire_cat in passing_range:
		$PassArea2D.show()
	else:
		$PassArea2D.hide()
	in_range = $PassArea2D.is_visible()  # true/false
	
	burn_range = $BurnArea2D.get_overlapping_bodies()
	if fire_cat in burn_range:
		if $BurnTimer.is_stopped():
			$BurnTimer.start()
	else:
		if not $BurnTimer.is_stopped():
			$BurnTimer.stop()
			$BurnTimer.wait_time = Globals.alight_time


func _on_can_drop_timer_timeout() -> void:
	can_drop = true


func _on_burn_timer_timeout() -> void:
	Globals.loss_reason = "YCatBurned"
	get_tree().change_scene_to_file("res://Scenes/loss_screen.tscn")
