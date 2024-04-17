# shows the menu item for the day that is selected from the line input 
# on the the terminal screen
extends Node2D

# back to screen is used when the input is invalid
# previous screen is used when the player types the keyword BACK
var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Lunch Menus Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

# initially previous child is 0
var previousChild = 0

func _ready():
	# hide the window and all children (the menu images)
	%Window.hide()
	%menus.get_child(0).hide()
	%menus.get_child(1).hide()
	%menus.get_child(2).hide()
	%menus.get_child(3).hide()
	%menus.get_child(4).hide()
	%menus.get_child(5).hide()
	%menus.get_child(6).hide()
	
func _on_lunch_menus_screen__line_edit_text_submitted(new_text):

	# show correct image based on inputed text
	if new_text == "PRINT monday lunch menu":
		%menus.get_child(previousChild).hide() # hide the previous child/image
		%Window.show() # display the window
		%menus.get_child(0).show() # show the image that correlates to the line input
		previousChild = 0 # set previous child to the index of the child we just showed
	elif new_text == "PRINT tuesday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(1).show()
		previousChild = 1
	elif new_text == "PRINT wednesday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(2).show()
		previousChild = 2
	elif new_text == "PRINT thursday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(3).show()
		previousChild = 3
	elif new_text == "PRINT friday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(4).show()
		previousChild = 4
	elif new_text == "PRINT saturday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(5).show()
		previousChild = 5
	elif new_text == "PRINT sunday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(6).show()
		previousChild = 6
	elif new_text == "BACK": # go back to the previous screen 
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation

# close the window when the x is pressed
func _on_window_close_requested():
	%Window.hide()
