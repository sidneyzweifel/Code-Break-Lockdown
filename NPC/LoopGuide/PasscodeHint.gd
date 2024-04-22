extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Window.hide()





func _on_button_pressed():
	$Window.show()


func _on_window_close_requested():
	$Window.hide()
