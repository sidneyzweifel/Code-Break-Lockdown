class_name NoAccessButton extends Button

@onready var no_access_button = $"."

# called when the node enters the scene tree for the first time.
func _ready():
	if Global.logic_puzzle_solved == false:
		no_access_button.show()
	else:
		no_access_button.hide()
