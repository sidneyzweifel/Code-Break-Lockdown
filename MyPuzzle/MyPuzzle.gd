extends Node2D

#allows us to access the grid as a variable
#@onready means that it will be called in the _ready() function
#we will get an error if we try to access the grid before the scene is intialized 
@onready var grid = $Button/Map/Grid

var col_num = 0
var row_num = 0

var correct_col_index:int
var correct_row_index:int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button/Map.hide()
	intialize_grid()
	$Player/CurrentIndex.set_text("col 0, row 0")


func _on_button_pressed():
	$Button/Map.show()


func _on_map_close_requested():
	$Button/Map.hide()


func intialize_grid():
	#generate a random col and row for the passcode to be
	var rand_col_index = randi_range(0,3)
	var rand_row_index = randi_range(0,3)
	
	#set the randomized row and col index to the correct indexes
	#for the room with the passcode
	correct_col_index = rand_col_index
	correct_row_index = rand_row_index
	
	#load the MapButton puzzle 
	var map_button = preload("res://MyPuzzle/MapButton.tscn")
	for n in range(4):
		for m in range(4):
			#instantiate an instance of the map_button 
			var btn = map_button.instantiate()
			
			#add a theme overide to the button who has the correct index
			if(m == rand_col_index and n == rand_row_index):
				btn.passcode_index_btn()
			
			#set the exported variables for each button
			btn.col_index = m
			btn.row_index = n
			
			#add the button to the scene
			grid.add_child(btn)
	
	


func _on_next_room_pressed():
	#increase the column index each time the button is pressed
	col_num += 1
	#increase the row index only when the col index is 4
	#this is to emulate the grid pattern
	if(col_num == 4):
		row_num += 1
		row_num = row_num % 4
	#since there are only 4 cols and rows and the index starts at 0
	#we can use the % function to get 0, 1, 2, 3 on each increment 
	col_num = col_num % 4
	#change the room if the row and col are correct 
	check_index_correct(col_num, row_num)
	
	#change the current index to the current col and row index of each room 
	$Player/CurrentIndex.set_text("col " + str(col_num) + ", row " + str(row_num))
	
	#cahnge the color of the tile map
	$Room2.set_layer_modulate(0, Color(randf(), randf(), randf()))
	

func check_index_correct(col, row):
	#if the current room indices are where the passcode is
	#change the player's to Room 1
	if(col == correct_col_index and row == correct_row_index):
		$Player/NextRoom.hide()
		$Player/CurrentIndex.set_text("You have found the correct room!")
		$Player.global_position = Vector2(0,0)
	
