extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Enrichment Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"

func _on_prisoner_enrichment_screen__line_edit_text_submitted(new_text):

	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "print enrichment image 1":
		#SceneTransition.change_scene_to_file(variable1) 
		pass
	elif new_text == "print enrichment image 2":
		#SceneTransition.change_scene_to_file(variable2)
		pass
	elif new_text == "print enrichment image 3":
		#SceneTransition.change_scene_to_file(variable3)
		pass
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
