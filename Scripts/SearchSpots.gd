extends Node2D

var yarn_cat
var can_search


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yarn_cat = get_tree().get_first_node_in_group("YarnCat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("yarn_cat_search"):
		if can_search != "" and Globals.torch_holder == "YarnCat":
			yarn_cat.search(can_search)
	
	if Globals.torch_holder == "YarnCat" and Globals.torch_flames > 0:
		for search_spot in get_tree().get_nodes_in_group("SearchSpots"):
			for body in search_spot.get_overlapping_bodies():
				if body.name == "YarnCat":
					can_search = search_spot.name
					yarn_cat.show_searchable(can_search)

func _on_search_body_exited(body: Node2D) -> void:
	if body.name == "YarnCat":
		can_search = ""
		yarn_cat.get_node("CanvasLayer/SearchLabel").hide()
		yarn_cat.get_node("CanvasLayer/SearchResultLabel").hide()
