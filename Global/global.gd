
extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String


#determines if player can go to next puzzle
func handle_door(has_door_acess)-> void:
	var cur = get_tree().current_scene
	if cur is ColorRect or cur is Window or cur is Sprite2D: #type of the passcode_enter scene
		cur.queue_free() #free scene from tree
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
signal override_passcode #signal to overide passcode in puzzle 4
func set_passcode():
	if(Puzzle4Autoload.key_list.size() == 0 and current_puzz ==  "res://Puzzles/Puzzle4_TEST.tscn"):
		print("In set_passcode")
		check_if_signal_connected()
		await override_passcode
		current_passcode = Puzzle4Autoload.get_puzz4_passcode()
		check_if_signal_disconnected()
		return current_passcode
	if(Puzzle4Autoload.loop_door_solved):
		return current_passcode
	else:
		current_passcode = str(randi_range(10000, 99999))
		return current_passcode

#called in LineEdit.gd in passcode_enter scene
#make sure what the user enters and the set passcode match
func get_passcode():
	return current_passcode

#emitted in puzzle 4 script in set_passcode
#this function does nothing, but I just needed a signal
#so I could wait until I set the new passcode before overidding it
func override_passcode_set():
	pass

#will get an error if don't check for connections 
#before trying to connect or discconnnect
func check_if_signal_connected():
	if(override_passcode.is_connected(override_passcode_set)):
		pass
	else:
		override_passcode.connect(override_passcode_set)	

func check_if_signal_disconnected():
	if(!override_passcode.is_connected(override_passcode_set)):
		pass
	else:
		override_passcode.disconnect(override_passcode_set)	
