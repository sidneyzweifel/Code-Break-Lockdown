
extends Node

var next_puzz:String 
var current_puzz:String

func handle_door(has_door_acess):
	print("in handle door()")
	var cur = get_tree().current_scene
	#get_tree().call_group("door", "handle_access", has_door_acess)
	if cur is ColorRect:
		cur.queue_free()
		#cur.hide()
		#I need the path to either the current puzzle or the next here
		if has_door_acess:
			get_tree().change_scene_to_file(next_puzz)
			#get_tree().call_group("door", "go_to_next_puzzle")
		else:
			get_tree().change_scene_to_file(current_puzz)
#		get_tree().call_group("door", "go_to_next_puzzle")
	else:
		get_tree().call_group("door", "handle_access", has_door_acess)
	return


func next_puzzle(puzzle_path:String)-> void:
	print("in next puzzle")
	get_tree().change_scene_to_file(puzzle_path)


func go_to_passcode(passcode_path:String, current_puzzle:String, next_puzzle:String)->void:
	current_puzz = current_puzzle
	next_puzz = next_puzzle
	get_tree().change_scene_to_file(passcode_path)
	
	
func get_current_puzzle():
	return current_puzz
	


	

	
