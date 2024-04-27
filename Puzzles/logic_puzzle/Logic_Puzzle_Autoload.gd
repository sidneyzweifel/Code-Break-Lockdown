extends Node

var logic_question:String = ""
var logic_result = 0

# logic puzzle called in Puzzle3_TEST
# generates and sets a random logic question to de displayed (eg: (3 & 2) ^ (5 | 7))
func set_logic_question() -> String:
	var a = randi_range(0, 10)
	var b = randi_range(0, 10)
	var c = randi_range(0, 10)
	var operators = ["&", "|"] # Only bitwise AND and OR operators will be used

	# Choose the first operator randomly
	var first_operator = operators[randi() % operators.size()]

	# Choose the second operator randomly
	var second_operator = operators[randi() % operators.size()]

	# Construct the logic question string
	logic_question = "(" + str(a) + " " + first_operator + " " + str(b) + ") " + second_operator + " (" + str(c) + " " + operators[randi() % operators.size()] + " " + str(randi_range(0, 10)) + ")"
	print("Logic_Puzzle_Autoload LOGIC QUESTION SETTER: " + logic_question)
	return logic_question

# get last randomly generated logic question in Puzzle3_TEST
func get_logic_question() -> String:
	print("Logic_Puzzle_Autoload LOGIC QUESTION GETTER: " + logic_question)
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

		# add debug output to track intermediate results
		print("Intermediate result before applying operator:", logic_result)

		# apply the operator to the current result and operand
		if operator == "&":
			print("Applying bitwise AND with operand:", operand)
			logic_result &= operand
		elif operator == "|":
			print("Applying bitwise OR with operand:", operand)
			logic_result |= operand

		# add debug output to track the result after applying the operator
		print("Intermediate result after applying operator:", logic_result)

	var result_str = str(logic_result)
	print("Logic_Puzzle_Autoload LOGIC ANSWER: ", result_str) # print logic result

	return logic_result
