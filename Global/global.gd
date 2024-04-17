extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String
var logic_question:String = ""
var logic_result = 0
var door_colors = ["blue", "red", "purple", "yellow", "green"]
var door_numbers = ["1", "2", "3", "4", "5"]
var current_door_color:String
var current_door_number:String
var pairDict
var previous_terminal_window = "none"
var textbox_shown = false

#determines if player can go to next puzzle
func handle_door(has_door_acess)-> void:
	var cur = get_tree().current_scene
	if cur is ColorRect: #type of the passcode_enter scene
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
func set_passcode():
	var random_code = RandomNumberGenerator.new()
	current_passcode = str(randi_range(11111, 99999))
	return current_passcode
	
func set_door_color():
	if door_colors.size() != 0:
		current_door_color = door_colors.pick_random()
	print("door color: " +current_door_color)
	return current_door_color
	
func get_door_color():
	return current_door_color
	
func set_door_number():
	if door_numbers.size() != 0:
		current_door_number = door_numbers.pick_random()
	print("door number: " +current_door_number)
	return current_door_number
	
func set_previous_terminal_window(path):
	previous_terminal_window = path
	return previous_terminal_window
	
func get_previous_terminal_window():
	return previous_terminal_window
	
func get_door_number():
	return current_door_number
	
func set_door_pairs():
		
	door_colors.erase(current_door_color)
	door_numbers.erase(current_door_number)
	
	# set the generated door number to the door color
	pairDict = {
		current_door_number: current_door_color
	}
	
	while door_colors.size():
		var rndNum = door_numbers.pick_random()
		var rndClr = door_colors.pick_random()
		pairDict[rndNum] = rndClr
		
		door_numbers.erase(rndNum)
		door_colors.erase(rndClr)
	
	print(pairDict)
	return pairDict
	
func get_door_pairs():
	return pairDict

func has_shown_textbox():
	if textbox_shown:
		return true
	else:
		textbox_shown = true
		return false
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
