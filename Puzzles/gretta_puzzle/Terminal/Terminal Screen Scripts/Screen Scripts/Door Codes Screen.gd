extends Node2D

func _ready():
	# make the input line selected so player can just type
	%"prisoner door codes screen - LineEdit".grab_focus()
	# set the previous terminal window to the door codes screen
	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Prisoner Door Codes Screen.tscn")
