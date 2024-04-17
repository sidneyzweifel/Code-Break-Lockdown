extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"
var insideFolder1 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Door Codes Screen.tscn"
var insideFolder2 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Door Colors Screen.tscn"

func _on_security_screen__line_edit_text_submitted(new_text):

# go to the correct scene based on inputted text
	if new_text == "OPEN prisoner door colors":
		SceneTransition.change_scene_to_file(insideFolder2) 
	elif new_text == "OPEN prisoner door codes":
		SceneTransition.change_scene_to_file(insideFolder1)
	elif new_text == "BACK":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
