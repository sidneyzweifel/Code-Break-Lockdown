extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%"security screen - LineEdit".grab_focus()
	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Security Screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
