
extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String


#determines if player can go to next puzzle
func handle_door(has_door_acess)-> void:
	var cur = get_tree().current_scene
	print("in handle door")
	
	if cur is ColorRect or cur is Window: #type of the passcode_enter scene
		cur.queue_free() #free scene from tree
		print("IN if statment")
		if has_door_acess:
			get_tree().change_scene_to_file(next_puzz)
		else:
			get_tree().change_scene_to_file(current_puzz)
	else:
		#go to door script and call function handle_access with parmater has_door_access
		get_tree().call_group("door", "handle_access", has_door_acess) 


#sets the global paths for next puzzle and current puzzle
#and takes player to the passcode enter scene
func go_to_passcode(passcode_path:String, current_puzzle:String, next_puzzle:String)->void:
	current_puzz = current_puzzle
	next_puzz = next_puzzle
	get_tree().change_scene_to_file(passcode_path)
	
	

#called in LineEdit.gd passcode_enter scene
#Honestly, had trouble with this part
#Not a 100% why I need it,
#This is part of the trouble I had with playing the whole passcode_enter scene
func get_current_puzzle():
	return current_puzz

#Called in exit_button.gd
#closes passcode_enter scene
#Player postion is reset and so is the door passcode
func return_to_puzzle():
	get_tree().current_scene.queue_free()
	get_tree().change_scene_to_file(current_puzz)
	

#Called in popup_test scene
#passcode.gd
func set_passcode():
	var random_code = RandomNumberGenerator.new()
	current_passcode = str(randi_range(11111, 99999))
	return current_passcode

#called in LineEdit.gd in passcode_enter scene
#make sure what the user enters and the set passcode match
func get_passcode():
	return current_passcode

	
func handle_npc():
	print("I WANT ITEM# 100")
	get_tree().call_group("npc","open_popup")
	
