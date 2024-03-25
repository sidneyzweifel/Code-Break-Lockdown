extends Node2D

@onready var p = $Window
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	p.show()
	


func _on_window_close_requested():
	p.hide()
