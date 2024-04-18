extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Door Codes Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"

func _on_prisoner_door_codes_screen__line_edit_text_submitted(new_text):

	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "print door 1 code":
		#SceneTransition.change_scene_to_file(variable1) 
		pass
	elif new_text == "print door 2 code":
		#SceneTransition.change_scene_to_file(variable2)
		pass
	elif new_text == "print door 3 code":
		#SceneTransition.change_scene_to_file(variable3)
		pass
	elif new_text == "print door 4 code":
		#SceneTransition.change_scene_to_file(variable4)
		pass
	elif new_text == "print door 5 code":
		#SceneTransition.change_scene_to_file(variable5)
		pass
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
