extends Window

@onready var window = $"."
@export var item_number:String
@onready var item_number_label = $ItemNumLabel



func _on_close_requested():
	window.hide()
	

func _ready():
	item_number_label.text = "ITEM #: " + item_number
	


func _on_start_index_text_submitted(new_text):
	calculate_loop(new_text, new_text)
	

func _on_end_index_text_submitted(new_text):
	calculate_loop(new_text, new_text)
	
	
func calculate_loop(start, end):
	print("Calculating....")


