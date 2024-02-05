
extends Node



func handle_door():
	print("door interaction")
	#get_tree().change_scene_to_file(puzzle_path)
	#var all_doors = get_tree().get_nodes_in_group("door")
	print("I am printing")
	get_tree().call_group("door", "get_next_puzzle")
	return


func next_door(puzzle_path:String)-> void:
	get_tree().change_scene_to_file(puzzle_path)
