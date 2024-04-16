extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Lunch Menus Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

var previousChild = 0

func _ready():
	%Window.hide()
	%menus.get_child(0).hide()
	%menus.get_child(1).hide()
	%menus.get_child(2).hide()
	%menus.get_child(3).hide()
	%menus.get_child(4).hide()
	%menus.get_child(5).hide()
	%menus.get_child(6).hide()
	
func _on_lunch_menus_screen__line_edit_text_submitted(new_text):

	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "print monday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(0).show()
		previousChild = 0
	elif new_text == "print tuesday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(1).show()
		previousChild = 1
	elif new_text == "print wednesday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(2).show()
		previousChild = 2
	elif new_text == "print thursday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(3).show()
		previousChild = 3
	elif new_text == "print friday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(4).show()
		previousChild = 4
	elif new_text == "print saturday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(5).show()
		previousChild = 5
	elif new_text == "print sunday lunch menu":
		%menus.get_child(previousChild).hide()
		%Window.show()
		%menus.get_child(6).show()
		previousChild = 6
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation


func _on_window_close_requested():
	%Window.hide()
