extends Window

@onready var binary_popup_window = $"."

func _ready():
	binary_popup_window.hide()


func _on_binary_button_pressed():
	binary_popup_window.show()
	
	
func _on_close_requested():
	binary_popup_window.hide()
