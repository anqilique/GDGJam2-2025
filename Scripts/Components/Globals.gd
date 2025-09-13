# Contains all global variables. Handy to use across scenes.

extends Node

var torch_holder = "YarnCat"  # For determining who is holding the torch.

var is_yarn_cat_visible = true
var is_fire_cat_visible = true

var yarn_cat_health = 9
var fire_cat_health = 9

var torch_flames = 10

func reset_variables():
	Globals.torch_holder = "YarnCat"
	Globals.is_yarn_cat_visible = true
	Globals.is_fire_cat_visible = true

	Globals.yarn_cat_health = 9
	Globals.fire_cat_health = 9

	Globals.torch_flames = 10
