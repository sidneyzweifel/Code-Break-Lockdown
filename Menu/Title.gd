extends Node2D

func _on_button_pressed():
	MusicPlayer.play_ambient_music()
	SceneTransition.change_scene_to_file("res://Puzzles/Puzzle1_TEST.tscn")
