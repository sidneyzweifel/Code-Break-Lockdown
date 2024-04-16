extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employee Salaries Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Employees Only Screen.tscn"

var previousChild = 0

func _ready():
	%Window.hide()
	%Salaries.get_child(0).hide()
	%Salaries.get_child(1).hide()
	%Salaries.get_child(2).hide()
	%Salaries.get_child(3).hide()
	%Salaries.get_child(4).hide()
	
func _on_employees_salaries_screen__line_edit_text_submitted(new_text):
	# put input to all lowercase to ensure no issues with case sensitivity
	new_text = new_text.to_lower()
	
	# go to the correct scene based on inputted text
	if new_text == "print employee 1 salary":
		%Salaries.get_child(previousChild).hide()
		%Window.show()
		%Salaries.get_child(0).show()
		previousChild = 0
	elif new_text == "print employee 2 salary":
		%Salaries.get_child(previousChild).hide()
		%Window.show()
		%Salaries.get_child(1).show()
		previousChild = 1
	elif new_text == "print employee 3 salary":
		%Salaries.get_child(previousChild).hide()
		%Window.show()
		%Salaries.get_child(2).show()
		previousChild = 2
	elif new_text == "print employee 4 salary":
		%Salaries.get_child(previousChild).hide()
		%Window.show()
		%Salaries.get_child(3).show()
		previousChild = 3
	elif new_text == "print manager norbit salary":
		%Salaries.get_child(previousChild).hide()
		%Window.show()
		%Salaries.get_child(4).show()
		previousChild = 4
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation


func _on_window_close_requested():
	%Window.hide()
