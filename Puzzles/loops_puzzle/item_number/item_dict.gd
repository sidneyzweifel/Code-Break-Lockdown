class_name Item_Dict extends Node


static var item_dict = {}

func add_item(key:String, item_num:int):
	item_dict[key] = item_num

func get_item(key:String):
	return item_dict[key]
