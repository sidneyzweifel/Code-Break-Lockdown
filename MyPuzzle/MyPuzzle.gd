extends Node2D


@onready var map = $Button/Map

@onready var grid = $Button/Map/GridContainter

var col_num = 0
var row_num = 0

var correct_col_index:int
var correct_row_index:int

func _ready():
	map.hide()
	intialize_grid()
	$Player/CurrentIndex.set_text("col 0, row 0")



func _on_button_pressed():
	map.show()


func _on_map_close_requested():
	map.hide()




func intialize_grid():
	var rand_col_index = randi_range(0,3)
	var rand_row_index = randi_range(0,3)
	correct_col_index = rand_col_index
	correct_row_index = rand_row_index
	var map_button = preload("res://MyPuzzle/MapButton.tscn")
	for n in range(4):
		for m in range(4):
			var btn = map_button.instantiate()
			if(m == rand_col_index and n == rand_row_index):
				btn.passcode_index_btn()
			btn.col_index = m
			btn.row_index = n
			grid.add_child(btn)
			
			

func _on_next_room_pressed():
	col_num += 1
	if(col_num == 4):
		row_num += 1
		row_num = row_num % 4
	col_num = col_num % 4
	check_index_correct(col_num, row_num)
	$Player/CurrentIndex.set_text("col " + str(col_num) + ", row " + str(row_num))
	$Room2.set_layer_modulate(0, Color(randf(), randf(), randf()))

func check_index_correct(col, row):
	if(col == correct_col_index and row == correct_row_index):
		$Player/NextRoom.hide()
		$Player/CurrentIndex.set_text("You have found the correct room!")
		$Player.global_position = Vector2(0,0)
	
