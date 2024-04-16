extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Enrichment Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"

var previousChild = 0

func _ready():
	%Window.hide()
	%enrichment.get_child(0).hide()
	%enrichment.get_child(1).hide()
	%enrichment.get_child(2).hide()
	
func _on_prisoner_enrichment_screen__line_edit_text_submitted(new_text):

	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "print enrichment image 1":
		#SceneTransition.change_scene_to_file(variable1) 
		%enrichment.get_child(previousChild).hide()
		%Window.show()
		%enrichment.get_child(0).show()
		previousChild = 0
	elif new_text == "print enrichment image 2":
		%enrichment.get_child(previousChild).hide()
		%Window.show()
		%enrichment.get_child(1).show()
		previousChild = 1
	elif new_text == "print enrichment image 3":
		%enrichment.get_child(previousChild).hide()
		%Window.show()
		%enrichment.get_child(2).show()
		previousChild = 2
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation
