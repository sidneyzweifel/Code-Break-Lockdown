extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String
var logic_question:String = ""
var logic_result = 0

# variables for puzzle 1 - gretta's puzzle
var door_colors = ["blue", "red", "purple", "yellow", "green"]
var door_numbers = ["1", "2", "3", "4", "5"]
var current_door_color:String
var current_door_number:String
var pairDict
var previous_terminal_window = "none"
var textbox_shown = false
var door_passcodes

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

# PUZZLE 1 -----------------------------------------------

# sets a random color to the door light color in PUZZLE 1
# can be 1 of 5 different colors
func set_door_color():
	if door_colors.size() != 0:
		current_door_color = door_colors.pick_random()
	print("door color: " +current_door_color)
	return current_door_color

# returns the door light color for PUZZLE 1
func get_door_color():
	return current_door_color

# sets a random number to the door in PUZZLE 1
# can be a number 1 through 5
func set_door_number():
	if door_numbers.size() != 0:
		current_door_number = door_numbers.pick_random()
	print("door number: " +current_door_number)
	return current_door_number

# returns the current door number variable in PUZZLE 1
func get_door_number():
	return current_door_number

# for PUZZLE 1
# sets the previous terminal window to inputed path so
# when the player leaves the terminal and comes back
# the screen they were on is saved
func set_previous_terminal_window(path):
	previous_terminal_window = path
	return previous_terminal_window
	
# return the previous terminal window variable
func get_previous_terminal_window():
	return previous_terminal_window

# set the door number:door light color pairs
func set_door_pairs():
	
	# remove the door number and color for the door that can be opened
	# in PUZZLE 1
	door_colors.erase(current_door_color)
	door_numbers.erase(current_door_number)
	
	# set the generated door number to the door color
	pairDict = {
		current_door_number: current_door_color
	}
	
	# set the other door numbers to the remaining door colors
	while door_colors.size():
		var rndNum = door_numbers.pick_random()
		var rndClr = door_colors.pick_random()
		pairDict[rndNum] = rndClr
		
		door_numbers.erase(rndNum)
		door_colors.erase(rndClr)
	
	print(pairDict)
	return pairDict

# returns the door pairs dictionary
func get_door_pairs():
	return pairDict

# checks if the text box in PUZZLE 1 has been show
func has_shown_textbox():
	if textbox_shown: # has been shown
		return true
	else: # hasn't been show
		textbox_shown = true # set it to true (because it will show it now)
		return false

# set passcodes for the doors in PUZZLE 1
func set_door_passcodes():
	door_passcodes = {
		"1":str(randi_range(11111, 99999)),
		"2":str(randi_range(11111, 99999)),
		"3":str(randi_range(11111, 99999)),
		"4":str(randi_range(11111, 99999)),
		"5":str(randi_range(11111, 99999))
	}
	return door_passcodes

# return the generated door passcodes (they don't do anything)
func get_door_passcodes():
	return door_passcodes

#--------------------------------------------------------------

#called in LineEdit.gd in passcode_enter scene
#make sure what the user enters and the set passcode match
func get_passcode():
	return current_passcode

# logic puzzle called in Puzzle3_TEST
# generates and sets a random logic question to de displayed (eg: (3 & 2) ^ (5 | 7))
func set_logic_question() -> String:
	var a = randi_range(0, 10)
	var b = randi_range(0, 10)
	var c = randi_range(0, 10)
	var operators = ["&", "|", "^"] #logic operators that will be used randomly
	logic_question = "(" + str(a) + " " + operators[randi() % operators.size()] + " " + str(b) + ") " + operators[randi() % operators.size()] + " (" + str(c) + " " + operators[randi() % operators.size()] + " " + str(randi_range(0, 10)) + ")"
	print("GLOBAL SCRIPT LOGIC QUESTION SETTER: " + logic_question)
	return logic_question

# get last randomly generated logic question in Puzzle3_TEST
func get_logic_question() -> String:
	print("GLOBAL SCRIPT LOGIC QUESTION GETTER: " + logic_question)
	return logic_question
	

# solves logic puzzle in Puzzle3_TEST
func solve_logic_question(question: String) -> int:
	var logic_result = 0

	# remove parentheses and split the logic question string into separate components
	var cleaned_question = question.replace("(", "").replace(")", "")
	var components = cleaned_question.split(" ")

	# ensure that components array has enough elements
	if components.size() % 2 != 1:
		print("Error: Invalid logic question format") # game crashes if array is too small
		return 0

	# initialize the result with the first operand
	logic_result = int(components[0])

	# iterate over the rest of the components and operators
	for i in range(1, components.size(), 2):
		var operator = components[i]
		var operand = int(components[i + 1])

		# apply the operator to the current result and operand
		if operator == "&":
			logic_result &= operand
		elif operator == "|":
			logic_result |= operand
		elif operator == "^":
			logic_result ^= operand

	var result_str = str(logic_result)
	print("GLOBAL SCRIPT LOGIC ANSWER: ", result_str) # print logic result

	return logic_result
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
