class_name BinaryButton extends Button

@onready var binary_button = $"."

# called when the node enters the scene tree for the first time.
func _ready():
	if Global.logic_puzzle_solved == true:
		binary_button.show()
		
	else:
		binary_button.hide()
