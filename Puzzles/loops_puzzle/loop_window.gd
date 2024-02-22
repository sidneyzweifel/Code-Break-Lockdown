extends Window

@onready var window = $"."
@export var item_number:String
@onready var item_number_label = $ItemNumLabel

var start_index:String
var end_index:String
var cur_puzz:String


func _on_close_requested():
	window.hide()
	

func _ready():
	item_number_label.text = "ITEM #: " + item_number
	#cur_puzz = Global.get_current_puzzle()
	


	
	
	
func calculate_loop(start, end):
	print("Calculating....")




func _on_button_pressed():
	print("ENTERED")
	print(start_index)
	print(end_index)
	Global.handle_door(true)
	pass # Replace with function body.


func _on_inequality_item_selected(index):
	print(index)
	pass # Replace with function body.


func _on_increment_or_decrement_item_selected(index):
	print(index)


func _on_start_index_text_changed(new_text):
	print("START")
	print(new_text)
	start_index = new_text


func _on_end_index_text_changed(new_text):
	print("END")
	print(new_text)
	end_index = new_text
