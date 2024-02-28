extends Window

@onready var window = $"."
@export var item_number:String
@onready var item_number_label = $ItemNumLabel
@onready var start_index_label = $StartIndex

var start_index:int
var end_index:String
var cur_puzz:String
var _increment_index:int = 0
var _inequality_index:int = 0


var rng = RandomNumberGenerator.new()
func _on_close_requested():
	window.hide()
	

func _ready():
	item_number_label.text = "ITEM #: " + item_number
	start_index = rng.randi_range(100, 999)
	start_index_label.text = str(start_index)
	


	
	
	
func calculate_loop(start, end_index, inequality_index, increment_index):
	print("Calculating....")
	
	


func index_to_symbol_ineqaulities(index:int):
	match index:
		0:
			return "increment"
		1:
			return "decrement"

func index_to_symbol_inequalities(index:int):
	match index:
		0: 
			return "less_than"
		1:
			return "greater_than"
		2:
			return "less_than_or_equal"
		3:
			return "greater_than_or_equal"


func _on_button_pressed():
	print("ENTERED")
	print(start_index)
	print(end_index)
	calculate_loop(start_index, end_index, _inequality_index, _increment_index)
	Global.handle_door(true)
	pass # Replace with function body.


func _on_inequality_item_selected(index):
	_inequality_index = index
	print(index)
	pass # Replace with function body.


func _on_increment_or_decrement_item_selected(index):
	_increment_index = index
	print(index)



func _on_end_index_text_changed(new_text):
	print("END")
	print(new_text)
	end_index = new_text
