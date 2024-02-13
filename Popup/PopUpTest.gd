extends Window


@onready var popup_test_ = $"."

#Popup closes when player clicks x
func _on_close_requested():
	popup_test_.hide()




