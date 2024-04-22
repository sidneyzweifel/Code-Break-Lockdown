extends Node2D


#button to open popup hint for second half of puzzle 4


func _ready():
	$Window.hide()



func _on_button_pressed():
	$Window.show()


func _on_window_close_requested():
	$Window.hide()
