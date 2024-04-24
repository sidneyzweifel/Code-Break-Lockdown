extends Node2D

@onready var wanted_item = $"Window/VBoxContainer/Want Item"
@onready var current_item = $"Window/VBoxContainer/Current Item"
# Called when the node enters the scene tree for the first time.

var current_item_int = 0
var wanted_item_int = 100
func _ready():
	wanted_item.set_text("Wanted Item: " + str(wanted_item_int))
	current_item.set_text("Current Item: "+ str(current_item_int))
	pass # Replace with function body.



func _on_increment_pressed():
	current_item_int += 1
	current_item.set_text("Current Item: " + str(current_item_int))



func _on_decrement_pressed():
	current_item_int -= 1
	current_item.set_text("Current Item: " + str(current_item_int))


func _on_exit_pressed():
	Puzzle4Autoload.loop_puzzle_exit()


func _on_enter_pressed():
	if(wanted_item_int == current_item_int):
		current_item.set_text("")
		wanted_item.set_text("Congrats. This is the incorrect door.")
		$Window/VBoxContainer/HBoxContainer.hide()
	else:
		current_item_int *= -10
		wanted_item_int *= 10
		wanted_item.set_text("Wanted Item: " + str(wanted_item_int))
		current_item.set_text("Current Item: "+ str(current_item_int))
