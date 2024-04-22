class_name Item_Num extends Node


var item_num:int

#called in NPC.gd to give each inmate a random item number to ask for
func _init():
	var rng = RandomNumberGenerator.new()
	item_num = rng.randi_range(0, 998) #range abritary, ensures at max 3 digit number 

func get_item_num():
	return item_num
