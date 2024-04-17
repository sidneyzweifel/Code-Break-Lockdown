extends Node2D

func _ready():
	# make the input line selected so player can just type
	%"home terminal screen - LineEdit".grab_focus()
	# set the previous terminal window to the home screen
	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn")

