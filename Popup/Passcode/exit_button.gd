extends Button

#Button to close passcode enter scene and reset puzzle
func _on_pressed():
	Global.return_to_puzzle()

