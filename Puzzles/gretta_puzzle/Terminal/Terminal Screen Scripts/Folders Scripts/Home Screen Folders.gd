extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"
var insideFolder1 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Enrichment Screen.tscn"
var insideFolder2 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

func _on_line_edit_text_submitted(new_text):

	# go to the correct scene based on inputted text
	if new_text == "OPEN prisoner enrichment":
		SceneTransition.change_scene_to_file(insideFolder1) 
	elif new_text == "OPEN employees only":
		SceneTransition.change_scene_to_file(insideFolder2)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
