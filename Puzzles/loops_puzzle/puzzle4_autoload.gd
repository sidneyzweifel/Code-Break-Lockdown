extends Node

var inmate_dict:Dictionary
var key_list:Array
var data_set:bool = false
var inmate_temp
var correct_user_entered_index:Array
var correct_order_inmate:Array
var loop_cnt:int = 0
var loop_door_solved:bool = false
var passcode:String
var loop_door_solve_cnt:int = 0

#group function to add a door when the player clicks on inmate
#this will set the door's parameter like distance from player and color
func inmate_clicked():
	get_tree().call_group("puzzle_4", "add_door")


func loop_counter():
	loop_cnt += 1
	return loop_cnt
	
func get_loop_count():
	return loop_cnt
	
#only need to set the inmate_dict once each run
#this info comes form puzzle4.gd	
func set_inmate_dict(inmate_dic:Dictionary):
		inmate_dict = inmate_dic
		if(!data_set):
			set_key_list()
			data_set = true
		

	
func spawn_current_inmate():
	#case where all inmate loop puzzle solved
		if(key_list.size() == 0 and loop_door_solve_cnt >= 3):
			loop_doors_solved()
			return false
	#case where all inmates have shown up, but the last inmate has not 
	#had their loop puzzle solved
		elif(key_list.size() == 0 and loop_door_solve_cnt < 3):
			return inmate_temp
	#case where a random inmate is chosen to spawn 
	#and then taken away from the inmate list
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

#if the loop puzzle is solved
#take the info from each inmate and save it for the second half of puzzle
func loop_puzzle_solved(array_element):
	correct_user_entered_index.append(array_element)
	correct_order_inmate.append(inmate_temp)
	loop_door_solve_cnt += 1
	Global.handle_door(true)

#if loop puzzle not solved
#add the used inmate back to the inmate spawn list
func loop_puzzle_exit():
	if(!loop_door_solved):
		key_list.append(inmate_temp)
	Global.handle_door(true)

#set when all inmate loop puzzles have been solved
func loop_doors_solved():
	loop_door_solved = true

#used to set overriden passcode in second half of puzzle	
func set_passcode(paswrd:String):
	passcode = paswrd

func get_puzz4_passcode():
	return passcode
	
	
func puz4_ready():
	get_tree().call_group("puzzle_4", "_ready")
