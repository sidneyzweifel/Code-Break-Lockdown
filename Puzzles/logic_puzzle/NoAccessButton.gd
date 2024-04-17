class_name NoAccessButton extends Button

@onready var no_access_button = $"."

# called when the node enters the scene tree for the first time.
func _ready():
	no_access_button.show()
