extends Window

@onready var window = $"."

@onready var item_number_label = $ItemNumLabel
@onready var start_index_label = $StartIndex

@export var error_popup:PackedScene
@export var success_popup:PackedScene

var start_index:int
var end_index:String
var cur_puzz:String
var _increment_index:int = 0
var _inequality_index:int = 0



@onready var item_number = Item_Dict.new().get_item(Dialouge.get_current_inmate_key())


var rng = RandomNumberGenerator.new()


func _on_close_requested():
	window.hide()
	


	

func _ready():
	if(item_number is String):
		start_index_label.text = "Talk to Inmate"
	else:
		item_number_label.text = "ITEM #: " + str(item_number)
		start_index = rng.randi_range(0, 999)
		start_index_label.text = str(start_index)
	


	
	
	
func calculate_loop(start, end_index, inequality_index, increment_index):
	var item_selected:int = -1
	var inequality:String = index_to_symbol_inequalities(inequality_index)
	var incr:String = index_to_symbol_increment(increment_index)
	if start <= end_index:
		if inequality == "less_than" and incr == "increment":
			print("Calculating....WAY 1")
			for n in range(start, end_index): #for (int i = 0; i < 7; i++) 
				item_selected = n
		if inequality == "less_than_or_equal" and incr == "increment":
			print("Calcuting....... WAY 2")
			for n in range(start, end_index + 1):#for (int i = 0; i <= 7; i++) 
				item_selected = n
	if start >= end_index:
		if inequality ==  "greater_than" and incr == "decrement":
			print("Calculiting..... WAY 3")
			for n in range(start, end_index, -1):#for (int i = 10; i > 7; i--)
				item_selected = n
		if inequality == "greater_than_or_equal"  and incr == "decrement":
			print("Caclcuting....WAY 4")
			for n in range(start, end_index - 1, -1): #for (int i = 10; i >= 7; i--) 
				item_selected = n
	if item_selected == -1:
		print("ERROR")
		var p = error_popup.instantiate()
		add_child(p)
		p.show()
		#TODO: provide player with hints
	else:
		print(item_selected)
		if(item_selected == item_number):
			print("NICE!")
			var s = success_popup.instantiate()
			add_child(s)
			s.show()
			
		else:
			Global.handle_door(true)
		
func index_to_symbol_increment(index:int):
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
	calculate_loop(start_index, int(end_index), _inequality_index, _increment_index)
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


func _on_exit_button_pressed():
	Global.handle_door(true)
	#window.hide()
