extends Node2D

@export var id_array:Array
@export var index_array:Array

@onready var board = $Board


# Called when the node enters the scene tree for the first time.
func _ready():
	board.hide()



func set_ids(id_array:Array):
	$"Board/HBoxContainer/VBoxContainer/ID 1".set_text(id_array[0])
	$"Board/HBoxContainer/VBoxContainer/ID 2".set_text(id_array[1])
	$"Board/HBoxContainer/VBoxContainer/ID 3".set_text(id_array[2])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_index_array(index_array:Array):
	$"Board/HBoxContainer/VBoxContainer2/Index 1".set_text(str(index_array[0]))
	$"Board/HBoxContainer/VBoxContainer2/Index 2".set_text(str(index_array[1]))
	$"Board/HBoxContainer/VBoxContainer2/Index 3".set_text(str(index_array[2]))

func _on_button_pressed():
	board.show()


func _on_board_close_requested():
	board.hide()
