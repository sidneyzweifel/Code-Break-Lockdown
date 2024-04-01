extends Node2D

func _on_area_2d_tree_entered():
	var color = Color(0, 255, 0)
	color.v = 1.1
	set_modulate(color)
	print("doorlight loaded")
