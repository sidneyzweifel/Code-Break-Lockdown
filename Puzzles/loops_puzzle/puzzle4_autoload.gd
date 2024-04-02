extends Node

var inmate_dict:Dictionary
var key_list:Array
var data_set:bool = false
var inmate_temp
var correct_user_entered_index:Array
var correct_order_inmate:Array
var loop_cnt:int = 0
var loop_door_solved:bool = false

func inmate_clicked():
	get_tree().call_group("puzzle_4", "add_door")

func loop_counter():
	loop_cnt += 1
	return loop_cnt
	
	
func set_inmate_dict(inmate_dic:Dictionary):
		inmate_dict = inmate_dic
		if(!data_set):
			set_key_list()
			data_set = true
		

	
func spawn_current_inmate():
		if(key_list.size() == 0):
			##get_tree().call_group("puzzle_4", "passcode_puzzle", correct_user_entered_index, correct_order_inmate)
			loop_doors_solved()
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
	
func loop_puzzle_solved(array_element):
	correct_user_entered_index.append(array_element)
	correct_order_inmate.append(inmate_temp)
	Global.handle_door(true)
		
func loop_puzzle_exit():
	if(!loop_door_solved):
		key_list.append(inmate_temp)
	Global.handle_door(true)


func loop_doors_solved():
	loop_door_solved = true
