
extends Node

var next_puzz:String = "res://Puzzle2_TEST.tscn"
var current_puzz:String = "res://WIP_Scences/Puzzle1_TEST.tscn"

func handle_door(has_door_acess):
	print("in handle door")
	var cur = get_tree().current_scene
	print(cur)
	get_tree().call_group("door", "handle_access", has_door_acess)
	if cur is ColorRect:
		cur.queue_free()
		#I need the path to either the current puzzle or the next here
		if has_door_acess:
			get_tree().change_scene_to_file(next_puzz)
		else:
			get_tree().change_scene_to_file(current_puzz)
#		get_tree().call_group("door", "go_to_next_puzzle")
	return


func next_door(puzzle_path:String)-> void:
	get_tree().change_scene_to_file(puzzle_path)


func go_to_passcode(passcode_path:String)->void:
	get_tree().change_scene_to_file(passcode_path)
	
	


	

	
