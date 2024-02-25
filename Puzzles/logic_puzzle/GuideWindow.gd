extends Window

@onready var guide_popup_window = $"."

func _ready():
	guide_popup_window.hide()


func _on_guide_popup_pressed():
	guide_popup_window.show()


func _on_close_requested():
	guide_popup_window.hide()
