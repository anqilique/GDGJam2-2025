# Contains all global variables. Handy to use across scenes.

extends Node

var torch_holder = "YarnCat"  # For determining who is holding the torch.

var is_yarn_cat_visible = true
var is_fire_cat_visible = true

var yarn_cat_health = 9
var fire_cat_health = 9
var torch_flames = 10

var loss_reason = ""

var alight_time = 0.5  # Time taken for things to set on fire

var search_spots = [
	"Bed", "Drawer",
	"Table1", "Cabinets",
	"Couch", "Book",
	"ShelfL", "ShelfR",
	"Bag", "Table2"
]

var key_location
var key_found


func reset_variables():
	key_location = search_spots.pick_random()
	print(key_location)
	key_found = false
	
	torch_holder = "YarnCat"  # For determining who is holding the torch.

	is_yarn_cat_visible = true
	is_fire_cat_visible = true

	yarn_cat_health = 9
	fire_cat_health = 9
	torch_flames = 10
	
	loss_reason = ""
