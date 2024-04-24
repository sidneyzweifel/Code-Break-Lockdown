extends Node2D

# return to main menu
func _on_button_pressed():
	AudioManager.return_main.play()
	SceneTransition.change_scene_to_file("res://Menu/Menu.tscn")
	
