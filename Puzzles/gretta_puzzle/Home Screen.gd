extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# have the line edit be focused so user can just type into it
	%"home terminal screen - LineEdit".grab_focus()
	Global.set_previous_terminal_window("res://Puzzles/gretta_puzzle/Terminal/Terminal Screen Scenes/Home Terminal Screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 
