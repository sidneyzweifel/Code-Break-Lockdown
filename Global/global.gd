extends Node

var next_puzz:String 
var current_puzz:String
var current_passcode:String
var logic_question:String = ""
var logic_result = 0

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

signal override_passcode
func set_passcode():
	if(Puzzle4Autoload.key_list.size() == 0 and current_puzz ==  "res://Puzzles/Puzzle4_TEST.tscn"):
		print("In set_passcode")
		#Puzzle4Autoload.puz4_ready()
		override_passcode.connect(override_passcode_set)
		await override_passcode
		current_passcode = Puzzle4Autoload.get_puzz4_passcode()
		override_passcode.disconnect(override_passcode_set)
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

func override_passcode_set():
	pass

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
