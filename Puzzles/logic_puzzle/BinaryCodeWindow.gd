extends Window

@onready var binary_popup_window = $"."

func _ready():
		binary_popup_window.hide()

func _on_binary_button_pressed():
	if Global.logic_puzzle_solved == true:
		binary_popup_window.show()
		AudioManager.screen_click.play()
	
func _on_close_requested():
	binary_popup_window.hide()
	AudioManager.screen_exit.play()
