extends Node2D

func _ready():
	# make the input line selected so player can just type
	%"lunch menus screen - LineEdit".grab_focus()

	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Lunch Menus Screen.tscn")
