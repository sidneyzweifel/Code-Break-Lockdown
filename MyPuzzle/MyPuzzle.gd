extends Node2D

@onready var grid = $Button/Map/Grid

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button/Map.hide()
	intialize_grid()



func _on_button_pressed():
	$Button/Map.show()


func _on_map_close_requested():
	$Button/Map.hide()


func intialize_grid():
	var rand_col_index = randi_range(0,3)
	var rand_row_index = randi_range(0,3)
	var map_button = preload("res://MyPuzzle/MapButton.tscn")
	for n in range(4):
		for m in range(4):
			var btn = map_button.instantiate()
			if(m == rand_col_index and n == rand_row_index):
				btn.passcode_index_btn()
			btn.col_index = m
			btn.row_index = n
			grid.add_child(btn)
	
	
