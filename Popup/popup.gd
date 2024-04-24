extends Window

@onready var popup_window_ = $"."

#used for debugging so player can get passcode in game without performing puzzle steps

func _on_pressed():
	popup_window_.show()
	

func _on_close_requested():
	popup_window_.hide()


func _on_button_pressed():
	pass # Replace with function body.
