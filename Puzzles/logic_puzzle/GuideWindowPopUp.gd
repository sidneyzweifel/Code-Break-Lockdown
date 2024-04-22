extends Window

@onready var guide_window = $"."

func _ready():
	guide_window.hide()

func _on_button_pressed():
	guide_window.show()
	AudioManager.guide_click.play()
	
func _on_close_requested():
	guide_window.hide()
	AudioManager.guide_exit.play()
