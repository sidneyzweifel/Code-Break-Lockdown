extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"
var insideFolder1 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Enrichment Screen.tscn"
var insideFolder2 = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

func _on_line_edit_text_submitted(new_text):
	
	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "open prisoner enrichment":
		SceneTransition.change_scene_to_file(insideFolder1) 
	elif new_text == "open employees only":
		SceneTransition.change_scene_to_file(insideFolder2)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
