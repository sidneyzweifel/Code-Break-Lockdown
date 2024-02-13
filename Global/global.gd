
extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String

func handle_door(has_door_acess)-> void:
	print("in handle door()")
	var cur = get_tree().current_scene
	if cur is ColorRect:
		cur.queue_free()
		if has_door_acess:
			get_tree().change_scene_to_file(next_puzz)
		else:
			get_tree().change_scene_to_file(current_puzz)
	else:
		get_tree().call_group("door", "handle_access", has_door_acess)


func next_puzzle(puzzle_path:String)-> void:
	print("in next puzzle")
	get_tree().change_scene_to_file(puzzle_path)


func go_to_passcode(passcode_path:String, current_puzzle:String, next_puzzle:String)->void:
	current_puzz = current_puzzle
	next_puzz = next_puzzle
	get_tree().change_scene_to_file(passcode_path)
	
	
func get_current_puzzle():
	return current_puzz
	
func return_to_puzzle():
	get_tree().current_scene.queue_free()
	get_tree().change_scene_to_file(current_puzz)
	

func set_passcode():
	var random_code = RandomNumberGenerator.new()
	current_passcode = str(randi_range(11111, 99999))
	return current_passcode
	
func get_passcode():
	return current_passcode

	

	
