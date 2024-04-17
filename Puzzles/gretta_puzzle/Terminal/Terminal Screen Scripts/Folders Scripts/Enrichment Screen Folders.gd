# shows the enrichment image that is selected from the line input on the 
# the terminal screen
extends Node2D

# back to screen is used when the input is invalid
# previous screen is used when the player types the keyword BACK
var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Enrichment Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn"

# initially previous child is 0
var previousChild = 0

func _ready():
	# hide the window and all children (the enrichment images)
	%Window.hide()
	%enrichment.get_child(0).hide()
	%enrichment.get_child(1).hide()
	%enrichment.get_child(2).hide()
	
func _on_prisoner_enrichment_screen__line_edit_text_submitted(new_text):

	# show the correct image based on inputed text
	if new_text == "PRINT enrichment image 1":
		%enrichment.get_child(previousChild).hide() # hide the previous child/image
		%Window.show() # display the window
		%enrichment.get_child(0).show() # show the image that correlates to the line input
		previousChild = 0 # set previous child to the index of the child we just showed
	elif new_text == "PRINT enrichment image 2":
		%enrichment.get_child(previousChild).hide()
		%Window.show()
		%enrichment.get_child(1).show()
		previousChild = 1
	elif new_text == "PRINT enrichment image 3":
		%enrichment.get_child(previousChild).hide()
		%Window.show()
		%enrichment.get_child(2).show()
		previousChild = 2
	elif new_text == "BACK": # go back to the previous screen 
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation

# close the window when the x is pressed
func _on_window_close_requested():
	%Window.hide()
