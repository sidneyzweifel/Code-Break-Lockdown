class_name Item_Num extends Node

#want to generate a item number for each NPC that will remain the same 
#throughout the puzzle 

var item_num:int

# Called when the node enters the scene tree for the first time.
func _init():
	var rng = RandomNumberGenerator.new()
	item_num = rng.randi_range(0, 998) #not sure why I did this range yet

func get_item_num():
	return item_num
