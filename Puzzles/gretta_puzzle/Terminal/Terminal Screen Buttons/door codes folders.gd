extends Node2D

var backToScreen = "res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Door Codes Screen.tscn"
var previousScreen ="res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn"

var previousChild = 0

var door_number = Global.get_door_number()
var passcode = Global.get_passcode()

func _ready():
	%Window.hide()
	%codes.get_child(0).hide()
	%codes.get_child(1).hide()
	%codes.get_child(2).hide()
	%codes.get_child(3).hide()
	%codes.get_child(4).hide()
	
func _on_prisoner_door_codes_screen__line_edit_text_submitted(new_text):

	new_text = new_text.to_lower()
	
	if new_text == "print door 1 code":
		if door_number == "1":
			%"door 1 code".get_child(0).set_text(passcode)
		pass
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(0).show()
		previousChild = 0
	elif new_text == "print door 2 code":
		if door_number == "2":
			%"door 2 code".get_child(0).set_text(passcode)
		pass
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(1).show()
		previousChild = 1
	elif new_text == "print door 3 code":
		if door_number == "3":
			%"door 3 code".get_child(0).set_text(passcode)
		pass
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(2).show()
		previousChild = 2
	elif new_text == "print door 4 code":
		if door_number == "4":
			%"door 4 code".get_child(0).set_text(passcode)
		pass
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(3).show()
		previousChild = 3
	elif new_text == "print door 5 code":
		if door_number == "5":
			%"door 5 code".get_child(0).set_text(passcode)
		pass
		%codes.get_child(previousChild).hide()
		%Window.show()
		%codes.get_child(4).show()
		previousChild = 4
	elif new_text == "back":
		SceneTransition.change_scene_to_file(previousScreen)
	else:
		WrongInput.change_scene_to_file(backToScreen) # if input doesn't work, play the wrong input animation


func _on_window_close_requested():
	%Window.hide()