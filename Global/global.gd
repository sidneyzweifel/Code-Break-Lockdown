extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String

# variables for puzzle 3:
var logic_question:String = ""
var a
var b
var c
var d
var first_operator
var second_operator
var third_operator
var logic_result = 0
var logic_puzzle_solved = false

# variables for puzzle 1 - gretta's puzzle
var door_colors = ["blue", "red", "purple", "yellow", "green"]
var door_numbers = ["1", "2", "3", "4", "5"]
var current_door_color:String
var current_door_number:String
var pairDict
var previous_terminal_window = "none"
var textbox_shown = false
var door_passcodes


#SARAH ADDDED
var passcode_set:bool = false

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
	passcode_set = true
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



# PUZZLE 3 -----------------------------------------------

# logic puzzle called in Puzzle3_TEST
# generates and sets a random logic question to de displayed (eg: (3 & 2) ^ (5 | 7))
func set_logic_question() -> String:
	# Check if logic_question is empty
	if logic_question == "":
		# Set global variables
		a = randi_range(0, 10)
		b = randi_range(0, 10)
		c = randi_range(0, 10)
		d = randi_range(0, 10)
		var operators = ["&", "|"] 

		# Choose the first operator randomly
		first_operator = operators[randi() % operators.size()]

		# Choose the second operator randomly
		second_operator = operators[randi() % operators.size()]

		# Choose the third operator randomly
		third_operator = operators[randi() % operators.size()]

		# Construct the logic question string
		logic_question = "(" + str(a) + " " + first_operator + " " + str(b) + ") " + second_operator + " (" + str(c) + " " + third_operator + " " + str(d) + ")"
		print("GLOBAL SCRIPT LOGIC QUESTION SETTER: " + logic_question)
		
		# Call solve_logic_question to get the result
		solve_logic_question()

	return logic_question


# get last randomly generated logic question in Puzzle3_TEST
func get_logic_question() -> String:
	print("GLOBAL SCRIPT LOGIC QUESTION GETTER: " + logic_question)
	return logic_question
	

# solves logic puzzle in Puzzle3_TEST
func solve_logic_question() -> int:
	# Evaluate group 1: (a operator1 b)
	var group_1_result = 0

	if first_operator == "&":
		group_1_result = a & b
	elif first_operator == "|":
		group_1_result = a | b

	# Evaluate group 2: (c operator3 d)
	var group_2_result = 0

	if third_operator == "&":
		group_2_result = c & d
	elif third_operator == "|":
		group_2_result = c | d

	# Combine the results of group 1 and group 2 using second_operator
	if second_operator == "&":
		logic_result = group_1_result & group_2_result
	elif second_operator == "|":
		logic_result = group_1_result | group_2_result

	print("Final logic result:", logic_result)

	return logic_result


func get_logic_result() -> int:
	print("GLOBAL SCRIPT LOGIC RESULT GETTER: " + str(logic_result))
	return logic_result


func logic_puzzle_flag_set_true():
	logic_puzzle_solved = true
	print(logic_puzzle_solved)

func logic_puzzle_flag_set_false():
	logic_puzzle_solved = false
	print(logic_puzzle_solved)
#--------------------------------------------------------------


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
