class_name Item_Dict extends Node

#used in loop_window.gd to keep track of the item in relation 
#to the key of the inmate

static var item_dict = {}

func add_item(key:String, item_num:int):
	item_dict[key] = item_num

func get_item(key:String):
	if(key.is_empty()):
		return "ERROR!"
	else:
		return item_dict[key]
