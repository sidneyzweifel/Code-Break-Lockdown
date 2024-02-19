extends Window

@onready var popup_window_ = $"."


func _on_pressed():
	popup_window_.show()
	

func _on_close_requested():
	popup_window_.hide()
