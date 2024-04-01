extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"
var insideFolder1 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Lunch Menus Screen.tscn"
var insideFolder2 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employee Salaries Screen.tscn"
var insideFolder3 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"

func _on_employees_only_screen__line_edit_text_submitted(new_text):
	
	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "open lunch menus":
		SceneTransition.change_scene_to_file(insideFolder1) 
	elif new_text == "open employee salaries":
		SceneTransition.change_scene_to_file(insideFolder2)
	elif new_text == "open security":
		SceneTransition.change_scene_to_file(insideFolder3)
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
