extends Node2D

func _on_button_pressed():
	# when the player is done with the title card, they click anywhere
	# on the screen and the ambient music starts playing as the scene
	# transitions to puzzle 1
	MusicPlayer.play_ambient_music()
	SceneTransition.change_scene_to_file("res://Puzzles/Puzzle1_TEST.tscn")
