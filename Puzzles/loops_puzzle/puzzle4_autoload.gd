extends Node

var inmate_dict:Dictionary
var key_list:Array
var data_set:bool = false
var inmate_temp

func inmate_clicked(door):
	add_child(door)
	
	
func set_inmate_dict(inmate_dic:Dictionary):
		inmate_dict = inmate_dic
		if(!data_set):
			set_key_list()
			data_set = true
		

	
func spawn_current_inmate():
		print("IN SPAWN CURRENT INMATE")
		if(key_list.size() == 0):
			return false
		else:
			var current_inmate_pos = randi() % key_list.size()
			var inmate = key_list[current_inmate_pos]
			inmate_temp = inmate
			key_list.remove_at(current_inmate_pos)
			return inmate
	
func set_key_list():
	var cnt:int = 0
	for keys in inmate_dict:
		key_list.insert(cnt, keys)
		cnt += 1
	
func loop_puzzle_solved():
	Global.handle_door(true)
		
func loop_puzzle_exit():
	key_list.append(inmate_temp)
	Global.handle_door(true)
