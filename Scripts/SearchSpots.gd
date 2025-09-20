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



"""
Search Functions
"""


func _on_bed_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Bed"
		yarn_cat.show_searchable(can_search)
		
func _on_drawer_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Drawer"
		yarn_cat.show_searchable(can_search)

func _on_table1_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Table1"
		yarn_cat.show_searchable(can_search)

func _on_cabinets_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Cabinets"
		yarn_cat.show_searchable(can_search)

func _on_couch_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Couch"
		yarn_cat.show_searchable(can_search)

func _on_book_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Book"
		yarn_cat.show_searchable(can_search)

func _on_shelf_l_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "ShelfL"
		yarn_cat.show_searchable(can_search)

func _on_shelf_r_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "ShelfR"
		yarn_cat.show_searchable(can_search)

func _on_bag_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Bag"
		yarn_cat.show_searchable(can_search)

func _on_table_2_body_entered(body: Node2D) -> void:
	if body.name == "YarnCat" and Globals.torch_holder == "YarnCat":
		can_search = "Table2"
		yarn_cat.show_searchable(can_search)

func _on_search_body_exited(body: Node2D) -> void:
	if body.name == "YarnCat":
		can_search = ""
		yarn_cat.get_node("CanvasLayer/SearchLabel").hide()
