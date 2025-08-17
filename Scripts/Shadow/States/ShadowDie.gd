extends State
class_name ShadowDie

@export var shadow_parent_node: Node2D

func enter():
	# Play death anim and sfx or smth
	shadow_parent_node.queue_free()
